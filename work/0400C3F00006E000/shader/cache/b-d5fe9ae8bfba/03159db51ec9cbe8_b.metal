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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_78 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
    float4 m_64 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2357 = false;
    bool _905 = false;
    bool _559 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2997 = as_type<float>(_113);
        out.gl_Position.z = _2997;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_49.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3066 = as_type<float>(_151);
        out.gl_Position.z = _3066;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_51.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = _157 * _155;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _179);
    int _189 = as_type<int>(_159) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_159) & 2;
    bool _195 = _193 != 0;
    float _197 = _187 * 6.283185482025146484375;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = floor(_187);
    float _205 = _197 * 0.15915493667125701904296875;
    bool _207 = !_195;
    float _209 = _207 ? (-0.5) : 0.5;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _213 = _211 != 0;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _217 = _215 != 0;
    float _219 = _163 * _169;
    bool _221 = !_201;
    int _223 = _221 ? 0 : 1;
    float _225 = _205 * 6.283185482025146484375;
    float _227 = cos(_225);
    float _229 = _163 * _175;
    bool _231 = !_213;
    int _233 = _231 ? 0 : 1;
    float _235 = fma(_161, _167, _219);
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _163 * _183;
    int _241 = abs(_233);
    float _243 = fma(_161, _173, _229);
    float _245 = -_203;
    float _247 = _187 + _245;
    float _249 = fma(_161, _181, _239);
    int _251 = abs(_223);
    float _253 = -_247;
    float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _257 = float(_241);
    bool _259 = !_217;
    int _261 = _259 ? 0 : 1;
    float _263 = fma(_227, 0.5, 0.5);
    bool _265 = _247 < 0.5;
    float _267 = float(_265);
    float _269 = abs(_255);
    float _271 = _257 * _269;
    int _273 = abs(_261);
    float _275 = -_263;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_251);
    float _281 = -_267;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_273);
    float _287 = fma(_165, _185, _249);
    bool _289 = !_191;
    float _291 = _289 ? (-0.5) : 0.5;
    float _293 = fma(_279, _277, _271);
    float _295 = fma(_165, _171, _235);
    float _297 = fma(_165, _177, _243);
    float _299 = abs(_283);
    float _301 = fma(_285, _299, _293);
    bool _303 = !_237;
    float _319;
    if (!_303)
    {
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_97);
        float _325 = 1.0 / _323;
        float _327 = _131 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = _329 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _329 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _329 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = 1.0 / _345;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _363 = 1.0 / _353;
    float _365 = 1.0 / _357;
    float _367 = _333 * _359;
    bool _369 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _371 = isnan(_329);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_379;
    float _383 = _381 + 1.0;
    float _385 = 1.0 / _349;
    float _387 = _337 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _329 + _389;
    bool _393 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_329);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _405;
    float _409 = _341 * _365;
    bool _411 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _413 = isnan(_329);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -_403;
    float _425 = _423 + 1.0;
    float _427 = fma(_407, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = _421 * _383;
    float _431 = -_421;
    float _433 = _431 + 1.0;
    float _435 = _391 * _385;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _437;
    bool _441 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_329);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _455 = isnan(_329);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = fma(_439, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = _403 * _433;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = _451 * _425;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = -_463;
    float _485 = _483 + 1.0;
    float _487 = fma(_471, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _463 * _477;
    float _491 = fma(_481, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = _465 * _489;
    float _503 = _427 * _489;
    float _505 = fma(_495, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _513 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _515 = fma(_499, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _521 = fma(_491, _473, _511);
    float _523 = fma(_487, _473, _513);
    float _525 = fma(_509, _435, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _527 = fma(_519, _435, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _529 = fma(_505, _467, _521);
    float _531 = fma(_515, _467, _523);
    float _533 = fma(_525, _429, _529);
    float _535 = fma(_527, _429, _531);
    float _537 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[147].x, _533);
    float _539 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[147].y, _535);
    bool _541 = !_361;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _545 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_97);
        float _563 = 1.0 / _561;
        float _565 = _131 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_64.x;
    float _571 = in.m_64.y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _567 + _573;
    bool _577 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _579 = isnan(_567);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _593 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _595 = isnan(_567);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _605;
    bool _609 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _611 = isnan(_567);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = 1.0 / _591;
    float _623 = -_603;
    float _625 = _623 + 1.0;
    bool _627 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_567);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = 1.0 / _641;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _647 = _539 * _571;
    float _649 = -_587;
    float _651 = _649 + 1.0;
    float _653 = _607 * _621;
    bool _655 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _657 = isnan(_567);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _671 = fma(_653, _575, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _673 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _675 = isnan(_567);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _665 * _651;
    float _687 = -_665;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _669;
    float _693 = _603 * _689;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _619 * _625;
    float _701 = -_619;
    float _703 = _701 + 1.0;
    float _705 = -_637;
    float _707 = _705 + 1.0;
    float _709 = 1.0 / _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _711;
    float _715 = _637 * _703;
    bool _717 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _719 = isnan(_567);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_683;
    float _731 = _729 + 1.0;
    float _733 = _683 * _707;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _739 = _727 * _731;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _745 = -_727;
    float _747 = _745 + 1.0;
    float _749 = _737 * _643;
    float _751 = _671 * _739;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _757 = 1.0 / _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _761 = _567 + _759;
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _751);
    float _765 = _713 * _709;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _771 = fma(_749, _761, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _567 + _777;
    float _781 = 1.0 / _755;
    float _783 = fma(_771, _733, _763);
    float _785 = fma(_765, _779, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _787 = _775 * _691;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _791 = _567 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _797;
    float _801 = 1.0 / _769;
    float _803 = fma(_787, _791, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _805 = _799 * _757;
    float _807 = fma(_785, _715, _783);
    bool _809 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _811 = isnan(_567);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _821;
    float _825 = _537 * _569;
    float _827 = _795 * _781;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _831 = _567 + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _835 = _567 + _833;
    float _837 = fma(_803, _699, _807);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _841 = _567 + _839;
    float _843 = fma(_805, _831, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _845 = fma(_827, _835, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _847 = -_819;
    float _849 = _847 + 1.0;
    float _851 = _823 * _801;
    float _853 = fma(_843, _693, _837);
    float _855 = _587 * _849;
    float _857 = fma(_851, _841, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _859 = fma(_845, _685, _853);
    float _861 = fma(_857, _855, _859);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[122].x, _861);
    float _871 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _879 = !_645;
    float _901;
    float _903;
    if (!_879)
    {
        float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _883 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _885 = float(_97);
        float _887 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _889 = 1.0 / _885;
        float _891 = _887 * _881;
        float _893 = floor(_891);
        float _895 = _131 * _889;
        float _897 = -_893;
        float _899 = _891 + _897;
        _901 = _895;
        _903 = _899;
        _905 = true;
    }
    else
    {
        float _907 = float(_97);
        float _909 = 1.0 / _907;
        float _911 = _131 * _909;
        _901 = _911;
        _903 = _911;
    }
    _905 = false;
    float _913 = _901;
    float _915 = _903;
    float _917 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _919 = log2(_917);
    float _921 = in.m_51.y;
    float _923 = _153 * 2.0;
    float _925 = _301 * _825;
    float _927 = _301 * _647;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _941 = _939 != 0;
    float _943 = floor(_923);
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _947 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = in.m_51.z;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _961 = _913 + _959;
    float _963 = _919 * _131;
    float _965 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _967 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _969 = isnan(1.0);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _975 = _971 || _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _979 = 1.0 + _977;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _983 = -_929;
    float _985 = fma(_965, 2.0, _983);
    float _987 = exp2(_963);
    float _989 = in.m_51.w;
    float _991 = _921 * 2.0;
    float _993 = _921 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _995 = _943 >= 0.0;
    bool _997 = isnan(_943);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[78].w, _981);
    float _1007 = floor(_991);
    float _1009 = fma(_993, -2.0, _945);
    int _1011 = _1003 ? 0 : 1;
    float _1013 = _921 + (-0.5);
    float _1015 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    float _1017 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1005);
    bool _1019 = _943 > 0.0;
    float _1021 = -_987;
    float _1023 = _1021 + 1.0;
    float _1025 = 1.0 / _979;
    float _1027 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1029;
    float _1033 = _955 ? _1023 : 0.0;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1037 = _1007 > 0.0;
    float _1039 = in.m_44.x;
    float _1041 = in.m_44.y;
    float _1043 = in.m_44.z;
    bool _1045 = _1007 >= 0.0;
    bool _1047 = isnan(_1007);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1035);
    float _1057 = -_131;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[76].x, _985);
    float _1061 = 1.0 / _1031;
    float _1063 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1065 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1055);
    int _1067 = ~_1011;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    int _1073 = _1071;
    if (_975)
    {
        float _1075 = _1033 * _1025;
        _135 = _1075;
    }
    float _1077 = _135;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    if (!_1019)
    {
        int _1083 = ~_1011;
        int _1085 = _1083 + 1;
        _1073 = _1085;
    }
    int _1087 = _1073;
    float _1089 = 1.0 / _1081;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1099;
    int _1103 = _1053 ? 0 : 1;
    float _1105 = 1.0 / _1093;
    float _1107 = _175 * _1041;
    float _1109 = _169 * _1041;
    float _1111 = _183 * _1041;
    float _1113 = fma(_173, _1039, _1107);
    float _1115 = fma(_181, _1039, _1111);
    float _1117 = fma(_167, _1039, _1109);
    float _1119 = fma(_177, _1043, _1113);
    float _1121 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1027);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1127 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1063);
    float _1129 = 1.0 / _1097;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1137 = _915 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1143 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1145 = _1137 * _1089;
    float _1147 = 1.0 / _1125;
    float _1149 = fma(_171, _1043, _1117);
    float _1151 = fma(_185, _1043, _1115);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1161 = _153 > 0.5;
    float _1163 = 1.0 / _1141;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1167 = _915 + _1165;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    int _1171 = ~_1103;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    float _1177 = _1167 * _1105;
    int _1179 = _1175;
    if (!_1037)
    {
        int _1181 = ~_1103;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1189 = _915 + _1187;
    float _1191 = 1.0 / _1133;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1195 = _915 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1199 = _915 + _1197;
    float _1201 = -_291;
    int _1203 = _1161 ? as_type<int>(_1201) : as_type<int>(_291);
    float _1205 = _1195 * _1061;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1215 = 1.0 / _1101;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1219 = _1217 != 0;
    float _1221 = _1189 * _1129;
    float _1223 = _1213 * _1147;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1225;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1231 = _1229 != 0;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1239 = _1237 != 0;
    float _1241 = 1.0 / _1155;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1245 = _1243 != 0;
    float _1247 = _1227 * _1191;
    float _1249 = _957 * 2.0;
    float _1251 = _153 + _957;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1257 = 1.0 / _1159;
    float _1259 = _1199 * _1215;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1261;
    float _1265 = _1251 + (-1.0);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1271 = !_941;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1277 = 1.0 / _1235;
    float _1279 = _1263 * _1241;
    float _1281 = _921 + _957;
    float _1283 = _1209 * _1163;
    float _1285 = fma(_1223, _961, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1287 = _1281 + (-1.0);
    float _1289 = floor(_1249);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1293 = _1291 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1295 = _153 + _921;
    float _1297 = _1255 * _1257;
    float _1299 = _1295 + (-1.0);
    float _1301 = 1.0 / _1293;
    float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1305 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1307 = _1269 * _1277;
    bool _1309 = !_1219;
    float _1311 = _1309 ? _291 : as_type<float>(_1203);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1315 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1169);
    bool _1317 = _1289 > 0.0;
    bool _1319 = _1289 >= 0.0;
    bool _1321 = isnan(_1289);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan(0.0);
    bool _1327 = _1323 || _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1329;
    float _1333 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1335 = _1331 * _1301;
    bool _1337 = !_937;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = _1311 + 0.5;
    bool _1343 = _989 > 0.5;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1349;
    float _1353 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1355;
    float _1359 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1121);
    float _1361 = fma(_1353, _1341, _1059);
    float _1363 = fma(_1347, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1365 = fma(_1351, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1367 = fma(_1357, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1389;
    float _1393 = fma(_1371, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1395 = fma(_1375, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1397 = fma(_1379, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1399 = fma(_1383, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1401 = fma(_1387, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1407 = fma(_1391, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1417 = fma(_1405, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1419 = fma(_1411, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1421;
    float _1425 = fma(_1415, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1431;
    float _1435 = fma(_1423, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1439 = _913 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1443 = _913 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1447 = _913 + _1445;
    int _1449 = abs(_1339);
    float _1451 = fma(_1283, _1439, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1453 = fma(_1297, _1443, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1457 = _913 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1461 = _913 + _1459;
    float _1463 = fma(_1247, _1447, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    int _1465 = abs(_1273);
    float _1467 = fma(_1279, _1457, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1469 = fma(_1335, _1461, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1471 = in.m_66.x;
    float _1473 = in.m_66.y;
    float _1475 = in.m_66.z;
    int _1477 = _1327 ? 0 : 1;
    float _1479 = fma(_1429, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1481 = float(_1449);
    float _1483 = fma(_1433, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1485 = float(_1087);
    float _1487 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1489 = ~_1477;
    int _1491 = _1489 + 1;
    int _1493 = _1491 + 1;
    float _1495 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1497 = _1493;
    float _1499 = _1399;
    if (!_1317)
    {
        int _1501 = ~_1477;
        int _1503 = _1501 + 1;
        _1497 = _1503;
    }
    int _1505 = _1497;
    float _1507 = _1481 * _1485;
    bool _1509 = !_933;
    int _1511 = _1509 ? 0 : 1;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1515 = _913 + _1513;
    bool _1517 = _921 > 0.5;
    float _1519 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1521 = abs(_1511);
    float _1523 = _1507 * (-2.0);
    float _1525 = float(_1465);
    float _1527 = -_1519;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = float(_1185);
    float _1533 = sqrt(_1333);
    float _1535 = float(_1505);
    float _1537 = _1529 * _1529;
    float _1539 = fma(_1307, _1515, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1541 = fma(_1523, _1473, _1473);
    float _1543 = _1525 * _1531;
    float _1545 = -_1495;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1549 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1551 = isnan(_913);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1557 = _1553 || _1555;
    float _1559 = float(_1557);
    float _1561 = rsqrt(_1333);
    float _1563 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1565 = -_209;
    int _1567 = _1517 ? as_type<int>(_1565) : as_type<int>(_209);
    bool _1569 = !_1231;
    float _1571 = _1569 ? _209 : as_type<float>(_1567);
    float _1573 = rsqrt(_1359);
    float _1575 = float(_1521);
    float _1577 = -_1487;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1581 = _957 > 0.5;
    float _1583 = fma(_1579, _1579, _1537);
    float _1585 = _1575 * _1535;
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1589 = fma(_1303, _1523, _1303);
    float _1591 = fma(_1547, _1547, _1583);
    float _1593 = _1585 * (-2.0);
    float _1595 = fma(_1589, _1077, _1563);
    float _1597 = fma(_1305, _1593, _1305);
    float _1599 = rsqrt(_1315);
    float _1601 = _1595 * 0.15915493667125701904296875;
    float _1603 = fma(_1593, _1471, _1471);
    float _1605 = _1543 * (-2.0);
    float _1607 = _291 * _1561;
    float _1609 = fma(_1275, _1605, _1275);
    float _1611 = rsqrt(_1591);
    float _1613 = _153 + (-0.5);
    float _1615 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1617 = _1571 + (-0.5);
    float _1619 = _1533 * _1607;
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1603);
    float _1623 = fma(_1605, _1475, _1475);
    float _1625 = _957 + (-0.5);
    float _1627 = -_1615;
    float _1629 = -_1015;
    float _1631 = fma(_1627, _1617, _1629);
    float _1633 = -_291;
    int _1635 = _1581 ? as_type<int>(_1633) : as_type<int>(_291);
    float _1637 = fma(_1597, _1077, _1621);
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1623);
    float _1641 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1643 = !_1239;
    float _1645 = _1643 ? _291 : as_type<float>(_1635);
    float _1647 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1649 = _1487 + _1647;
    float _1651 = fma(_1609, _1077, _1639);
    float _1653 = -_209;
    int _1655 = _1343 ? as_type<int>(_1653) : as_type<int>(_209);
    float _1657 = _1579 * _1611;
    float _1659 = _1529 * _1611;
    float _1661 = _1547 * _1611;
    float _1663 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1665 = !_1245;
    float _1667 = _1665 ? _209 : as_type<float>(_1655);
    float _1669 = _209 * _1573;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1673 = _1657 * _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1677 = _1661 * _1675;
    float _1679 = _1651 * 0.15915493667125701904296875;
    float _1681 = _1533 * _1669;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1685 = -_1673;
    float _1687 = fma(_1661, _1683, _1685);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1691 = _1659 * _1689;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1695 = -_1677;
    float _1697 = fma(_1659, _1693, _1695);
    float _1699 = _1637 * 0.15915493667125701904296875;
    float _1701 = _1687 * _1687;
    float _1703 = _1679 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1681);
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1711 = -_1691;
    float _1713 = fma(_1657, _1709, _1711);
    float _1715 = fma(_1697, _1697, _1701);
    float _1717 = _1649 * _1561;
    float _1719 = _1641 * _1707;
    float _1721 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1723 = _1495 + _1721;
    float _1725 = fma(_1713, _1713, _1715);
    float _1727 = _1601 * 6.283185482025146484375;
    float _1729 = cos(_1727);
    float _1731 = fma(_1533, _1717, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1733 = _1723 * _1599;
    float _1735 = _1679 * 6.283185482025146484375;
    float _1737 = sin(_1735);
    float _1739 = _1699 * 6.283185482025146484375;
    float _1741 = sin(_1739);
    float _1743 = _1601 * 6.283185482025146484375;
    float _1745 = sin(_1743);
    float _1747 = _1699 * 6.283185482025146484375;
    float _1749 = cos(_1747);
    float _1751 = _1705 * _1719;
    float _1753 = -_1719;
    float _1755 = _1737 * _1753;
    float _1757 = _1741 * _1729;
    float _1759 = rsqrt(_1725);
    float _1761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1619);
    float _1763 = _1741 * _1745;
    float _1765 = _1663 * _1761;
    float _1767 = _1729 * _1705;
    float _1769 = _1749 * _1745;
    float _1771 = _1749 * _1729;
    float _1773 = fma(_1767, _1765, _1755);
    float _1775 = _1745 * _1705;
    float _1777 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1779 = -_1769;
    float _1781 = fma(_1737, _1757, _1779);
    float _1783 = fma(_1737, _1771, _1763);
    float _1785 = -_1757;
    float _1787 = fma(_1737, _1769, _1785);
    float _1789 = fma(_1737, _1763, _1771);
    float _1791 = fma(_1775, _1777, _1773);
    float _1793 = _1749 * _1751;
    float _1795 = _1687 * _1759;
    float _1797 = _1741 * _1751;
    bool _1799 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1801 = isnan(_913);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = fma(_1783, _1765, _1793);
    bool _1813 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1815 = isnan(_913);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = fma(_1781, _1765, _1797);
    float _1827 = _1697 * _1759;
    float _1829 = -_1809;
    float _1831 = _1829 + 1.0;
    float _1833 = _1713 * _1759;
    float _1835 = fma(_1787, _1777, _1811);
    float _1837 = fma(_1789, _1777, _1825);
    bool _1839 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1841 = isnan(_913);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    float _1851 = _1823 * _1831;
    bool _1853 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1855 = isnan(_915);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = -_1823;
    float _1867 = _1865 + 1.0;
    bool _1869 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1871 = isnan(_915);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1877 = _1873 || _1875;
    float _1879 = float(_1877);
    float _1881 = _1659 * _1827;
    bool _1883 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1885 = isnan(_915);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1891 = _1887 || _1889;
    float _1893 = float(_1891);
    float _1895 = _1849 * _1867;
    bool _1897 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1899 = isnan(_915);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = -_1849;
    float _1911 = _1909 + 1.0;
    bool _1913 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1915 = isnan(_915);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1881;
    float _1927 = fma(_1657, _1795, _1925);
    bool _1929 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1931 = isnan(_915);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1937 = _1933 || _1935;
    float _1939 = float(_1937);
    float _1941 = -_1893;
    float _1943 = _1941 + 1.0;
    bool _1945 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1947 = isnan(_913);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    bool _1957 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1959 = isnan(_913);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = -_1939;
    float _1971 = _1969 + 1.0;
    bool _1973 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1975 = isnan(_913);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = -_1955;
    float _1987 = _1985 + 1.0;
    float _1989 = _1955 * _1911;
    float _1991 = _1923 * _1971;
    float _1993 = -_1923;
    float _1995 = _1993 + 1.0;
    float _1997 = _1967 * _1987;
    float _1999 = -_1967;
    float _2001 = _1999 + 1.0;
    bool _2003 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2005 = isnan(_913);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2011 = _2007 || _2009;
    float _2013 = float(_2011);
    float _2015 = _1907 * _1995;
    float _2017 = -_1983;
    float _2019 = _2017 + 1.0;
    float _2021 = _1983 * _2001;
    float _2023 = _1661 * _1795;
    float _2025 = _1927 * _1835;
    float _2027 = -_1907;
    float _2029 = _2027 + 1.0;
    float _2031 = -_2023;
    float _2033 = fma(_1659, _1833, _2031);
    float _2035 = _1559 * _2019;
    float _2037 = -_1559;
    float _2039 = _2037 + 1.0;
    float _2041 = fma(_1833, _1791, _2025);
    float _2043 = _2033 * _1835;
    float _2045 = _1893 * _2029;
    float _2047 = _1879 * _1943;
    float _2049 = _2013 * _2039;
    float _2051 = fma(_1827, _1791, _2043);
    float _2053 = fma(_1533, _1733, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _2055 = fma(_1661, _1837, _2041);
    float _2057 = -_1879;
    float _2059 = _2057 + 1.0;
    float _2061 = fma(_1657, _1837, _2051);
    float _2063 = _1451 * _2049;
    float _2065 = _2055 + _2053;
    float _2067 = _1863 * _2059;
    float _2069 = _2061 + _1731;
    float _2071 = -_2013;
    float _2073 = _2071 + 1.0;
    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2077 = _2065 + _2075;
    float _2079 = _1365 * _2067;
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2083 = _2069 + _2081;
    float _2085 = _1363 * _2067;
    float _2087 = _2077 * _2077;
    float _2089 = _1367 * _2067;
    float _2091 = _2083 * _2083;
    float _2093 = _1657 * _1833;
    float _2095 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2063);
    float _2097 = -_1863;
    float _2099 = _2097 + 1.0;
    float _2101 = _2091 + _2087;
    float _2103 = -_2093;
    float _2105 = fma(_1661, _1827, _2103);
    float _2107 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2109 = _1519 + _2107;
    float _2111 = fma(_1285, _2035, _2095);
    float _2113 = sqrt(_2101);
    float _2115 = _2105 * _1835;
    float _2117 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2085);
    float _2119 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2079);
    float _2121 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2089);
    float _2123 = _2109 * _1573;
    float _2125 = fma(_1463, _2021, _2111);
    float _2127 = fma(_1795, _1791, _2115);
    float _2129 = fma(_1393, _2047, _2117);
    float _2131 = fma(_1395, _2047, _2119);
    float _2133 = fma(_1397, _2047, _2121);
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2137 = fma(_1533, _2123, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2139 = fma(_1659, _1837, _2127);
    float _2141 = fma(_1401, _2045, _2129);
    float _2143 = fma(_1399, _2045, _2131);
    bool _2145 = _2113 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2147 = fma(_1407, _2045, _2133);
    float _2149 = fma(_1453, _1997, _2125);
    float _2151 = _2139 + _2137;
    float _2153 = fma(_1419, _2015, _2141);
    float _2155 = fma(_1417, _2015, _2143);
    float _2157 = fma(_1425, _2015, _2147);
    float _2159 = fma(_1467, _1989, _2149);
    float _2161 = fma(_1435, _1991, _2153);
    float _2163 = fma(_1479, _1991, _2155);
    float _2165 = fma(_1483, _1991, _2157);
    float _2167 = fma(_1539, _1895, _2159);
    float _2169 = _2093;
    float _2171 = _2091;
    float _2173 = _2087;
    float _2175 = _2069;
    float _2177 = _2065;
    if (!_2145)
    {
        _2169 = _2151;
    }
    float _2179 = _2169;
    bool _2181 = !_2145;
    float _2183 = _2179;
    if (!_2181)
    {
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2189 = _2113 + _2187;
        float _2191 = rsqrt(_2101);
        float _2193 = _2189 * _2185;
        float _2195 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = _2193 * 0.15915493667125701904296875;
        float _2199 = _2197 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = _2197 * 6.283185482025146484375;
        float _2205 = cos(_2203);
        float _2207 = fma(_2201, _2195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2209 = _2191 * _2207;
        float _2211 = _2205 + (-1.0);
        float _2213 = fma(_2083, _2209, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2215 = fma(_2077, _2209, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2217 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2221 = _2213 + _2219;
        float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2225 = _2215 + _2223;
        float _2227 = fma(_2151, _2205, _2217);
        float _2229 = _2221 * _2221;
        float _2231 = _2225 * _2225;
        _2183 = _2227;
        _2171 = _2229;
        _2173 = _2231;
        _2175 = _2213;
        _2177 = _2215;
        _1499 = _2197;
    }
    float _2233 = _2183;
    float _2235 = _2171;
    float _2237 = _2173;
    float _2239 = _2175;
    float _2241 = _2177;
    float _2243 = _1499;
    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2247 = _2233 + _2245;
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2251 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2161);
    float _2253 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2163);
    float _2255 = fma(_2247, _2247, _2235);
    float _2257 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2165);
    float _2259 = _1645 + 0.5;
    float _2261 = -_1667;
    float _2263 = _2261 + 0.5;
    float _2265 = _2255 + _2237;
    float _2267 = -_1065;
    float _2269 = _2267 + 1.0;
    float _2271 = fma(_1469, _1851, _2167);
    float _2273 = -_1017;
    float _2275 = _2273 + 1.0;
    float _2277 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2281 = sqrt(_2265);
    float _2283 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2285 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2287 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2289 = -_2269;
    float _2291 = fma(_1311, _2289, _1361);
    float _2293 = fma(_1571, _2275, _1631);
    float _2295 = _2277 * _2135;
    float _2297 = _2279 * _2249;
    float _2299 = _2283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2301 = _2285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2303 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2305 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2271);
    out.m_68.x = _871;
    out.m_68.y = _873;
    out.m_68.z = _875;
    out.m_68.w = _877;
    out.m_70.x = _2291;
    out.m_70.y = _2293;
    out.m_70.z = _2295;
    out.m_70.w = _2297;
    bool _2307 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2309 = isnan(_2281);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2315 = _2311 || _2313;
    out.m_72.x = _2299;
    out.m_72.y = _2301;
    out.m_72.z = _2303;
    out.m_74.x = _2305;
    float _2317 = _2259;
    float _2319 = _2303;
    float _2321 = _2243;
    if (!_2315)
    {
        _2317 = 1.0;
    }
    float _2323 = _2317;
    bool _2325 = !_2315;
    float _2327 = _2323;
    if (!_2325)
    {
        bool _2329 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2331 = isnan(_2281);
        bool _2333 = _2329 || _2331;
        bool _2335 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2337 = _2333 || _2335;
        if (!_2337)
        {
            float _2339 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2341 = _2281 + _2339;
            float _2343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2345 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2343;
            float _2347 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2351 = 1.0 / _2345;
            float _2353 = _2341 * _2351;
            float _2355 = fma(_2353, _2349, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2327 = _2355;
            _2357 = true;
        }
        else
        {
            bool _2359 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2361 = isnan(_2281);
            bool _2363 = _2359 || _2361;
            bool _2365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2367 = _2363 || _2365;
            if (!_2367)
            {
                float _2369 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2371 = _2281 + _2369;
                float _2373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2375 = _2373 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2377 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2379 = _2377 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2381 = 1.0 / _2375;
                float _2383 = _2371 * _2381;
                float _2385 = fma(_2383, _2379, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2327 = _2385;
                _2357 = true;
            }
            else
            {
                _2327 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2357 = false;
    float _2387 = _2327;
    float _2389 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2391 = _2233 + _2389;
    float _2393 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2395 = _2239 + _2393;
    float _2397 = fma(_2391, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2399 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2401 = _2241 + _2399;
    float _2403 = fma(_2395, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2405 = -_1519;
    float _2407 = _2405 + _2397;
    float _2409 = fma(_2401, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2411 = -_1487;
    float _2413 = _2411 + _2403;
    float _2415 = _2407 * _2407;
    float _2417 = -_1495;
    float _2419 = _2417 + _2409;
    float _2421 = fma(_2413, _2413, _2415);
    float _2423 = fma(_2419, _2419, _2421);
    float _2425 = sqrt(_2423);
    bool _2427 = _2425 > 0.0;
    bool _2429 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(0.5);
    bool _2437 = _2433 || _2435;
    bool _2439 = !_2427;
    float _2441 = _2403;
    float _2443 = _2397;
    float _2445 = _2409;
    float _2447 = _2407;
    if (!_2439)
    {
        float _2449 = _297 * _297;
        float _2451 = fma(_295, _295, _2449);
        float _2453 = fma(_287, _287, _2451);
        float _2455 = rsqrt(_2423);
        float _2457 = sqrt(_2453);
        float _2459 = _2413 * _2455;
        float _2461 = _2407 * _2455;
        float _2463 = _2419 * _2455;
        bool _2465 = _2457 > 0.0;
        bool _2467 = !_2465;
        _2319 = _2459;
        if (!_2467)
        {
            float _2469 = rsqrt(_2453);
            float _2471 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2473 = _297 * _2469;
            float _2475 = _295 * _2469;
            float _2477 = _287 * _2469;
            float _2479 = _2461 * _2473;
            float _2481 = fma(_2459, _2475, _2479);
            float _2483 = _2471 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2485 = fma(_2463, _2477, _2481);
            float _2487 = _2485 * _2483;
            float _2489 = fma(_295, _2487, _2403);
            float _2491 = fma(_297, _2487, _2397);
            float _2493 = fma(_287, _2487, _2409);
            _2441 = _2489;
            _2443 = _2491;
            _2445 = _2493;
            _2447 = _2483;
        }
    }
    float _2495 = _2441;
    float _2497 = _2443;
    float _2499 = _2445;
    float _2501 = _2447;
    float _2503 = _2319;
    float _2505 = _2497;
    float _2507 = _2495;
    float _2509 = _2499;
    float _2511 = _2501;
    float _2513 = _2503;
    if (!_2437)
    {
        float _2515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2517 = _1519 + _2515;
        float _2519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2521 = _1487 + _2519;
        float _2523 = _2517 * _2517;
        float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2527 = _1495 + _2525;
        float _2529 = fma(_2521, _2521, _2523);
        float _2531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2533 = fma(_2527, _2527, _2529);
        float _2535 = -_1487;
        float _2537 = _2535 + _2495;
        float _2539 = sqrt(_2533);
        float _2541 = precise::min(_2539, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2543 = _2541 * _2531;
        float _2545 = -_1519;
        float _2547 = _2545 + _2497;
        float _2549 = -_1495;
        float _2551 = _2549 + _2499;
        float _2553 = fma(_2537, _2543, _1487);
        float _2555 = fma(_2547, _2543, _1519);
        float _2557 = fma(_2551, _2543, _1495);
        _2505 = _2555;
        _2507 = _2553;
        _2509 = _2557;
    }
    float _2559 = _2505;
    float _2561 = _2507;
    float _2563 = _2509;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2567 = _2559 + _2565;
    float _2569 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2571 = _2561 + _2569;
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2575 = _2563 + _2573;
    float _2577 = _2567 * _2567;
    float _2579 = fma(_2571, _2571, _2577);
    float _2581 = fma(_2575, _2575, _2579);
    float _2583 = rsqrt(_2581);
    float _2585 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2587 = _2571 * _2585;
    float _2589 = _2575 * _2585;
    float _2591 = _2587 * _2587;
    float _2593 = _2589 * _2589;
    float _2595 = _2591 + _2593;
    float _2597 = sqrt(_2595);
    bool _2599 = _2597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2603 = _2597 + _2601;
    float _2605 = _2583;
    float _2607 = _2595;
    float _2609 = _2603;
    float _2611 = _2567;
    if (_2599)
    {
        float _2613 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2605 = _2613;
    }
    float _2615 = _2605;
    if (_2599)
    {
        float _2617 = rsqrt(_2595);
        _2607 = _2617;
    }
    float _2619 = _2607;
    float _2621 = _2619;
    if (_2599)
    {
        float _2623 = _2603 * _2615;
        _2609 = _2623;
    }
    float _2625 = _2609;
    if (_2599)
    {
        float _2627 = _2625 * 0.15915493667125701904296875;
        _2511 = _2627;
    }
    float _2629 = _2511;
    float _2631 = _2575;
    if (_2599)
    {
        float _2633 = _2629 * 6.283185482025146484375;
        float _2635 = sin(_2633);
        _2631 = _2635;
    }
    float _2637 = _2631;
    float _2639 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2641 = precise::max(0.0, _2639);
    float _2643 = _2615;
    float _2645 = _2641;
    if (_2599)
    {
        float _2647 = _2629 * 6.283185482025146484375;
        float _2649 = cos(_2647);
        _2643 = _2649;
    }
    float _2651 = _2643;
    float _2653 = -_2585;
    float _2655 = -_2641;
    float _2657 = fma(_2567, _2653, _2655);
    if (_2599)
    {
        float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2611 = _2659;
    }
    float _2661 = _2611;
    float _2663 = sqrt(_2581);
    float _2665 = _2661;
    float _2667 = _2637;
    if (_2599)
    {
        float _2669 = fma(_2637, _2661, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2669;
    }
    float _2671 = _2665;
    float _2673 = _2671;
    if (!_2599)
    {
        _2667 = _2587;
    }
    float _2675 = _2667;
    float _2677 = _2675;
    float _2679 = _2651;
    if (_2599)
    {
        float _2681 = _2651 + (-1.0);
        _2645 = _2681;
    }
    float _2683 = _2645;
    float _2685 = _2683;
    if (_2599)
    {
        float _2687 = _2619 * _2671;
        _2321 = _2687;
    }
    float _2689 = _2321;
    if (!_2599)
    {
        _2673 = _2657;
    }
    float _2691 = _2673;
    float _2693 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2695 = _2691;
    if (_2599)
    {
        float _2697 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2697;
    }
    float _2699 = _2513;
    if (_2599)
    {
        float _2701 = _2587 * _2689;
        _2677 = _2701;
    }
    float _2703 = _2677;
    if (!_2599)
    {
        _2685 = _2589;
    }
    float _2705 = _2685;
    float _2707 = _2705;
    if (_2599)
    {
        float _2709 = _2589 * _2689;
        _2707 = _2709;
    }
    float _2711 = _2707;
    if (!_2599)
    {
        _2621 = _2591;
    }
    float _2713 = _2621;
    float _2715 = _2713;
    if (_2599)
    {
        float _2717 = fma(_2657, _2651, _2699);
        _2695 = _2717;
    }
    float _2719 = _2695;
    if (_2599)
    {
        float _2721 = _2703 * _2703;
        _2715 = _2721;
    }
    float _2723 = _2715;
    if (!_2599)
    {
        _2679 = _2593;
    }
    float _2725 = _2679;
    float _2727 = _2725;
    if (_2599)
    {
        float _2729 = _2711 * _2711;
        _2727 = _2729;
    }
    float _2731 = _2727;
    float _2733 = fma(_2719, _2719, _2723);
    float _2735 = _2733 + _2731;
    float _2737 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2741 = fma(_2663, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2739);
    float _2743 = precise::clamp(_2741, 0.0, 1.0);
    float _2745 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2749 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2737);
    float _2751 = rsqrt(_2735);
    float _2753 = -_2743;
    float _2755 = _2753 + 1.0;
    float _2757 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2759 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2749);
    float _2761 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2745);
    float _2763 = _2759 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2765 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2757);
    float _2767 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2761);
    float _2769 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2693);
    float _2771 = abs(_2755);
    float _2773 = log2(_2771);
    float _2775 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2777 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2765);
    float _2779 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2781 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2769);
    float _2783 = _2751 * _2703;
    float _2785 = -_2775;
    float _2787 = fma(_2785, _2747, 1.0);
    float _2789 = _2777 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2791 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2793 = _2751 * _2719;
    float _2795 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2797 = _2751 * _2711;
    float _2799 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2791);
    float _2801 = _2781 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2803 = -_2795;
    float _2805 = fma(_2793, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2803);
    float _2807 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2809 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2799);
    float _2811 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2813 = -_2797;
    float _2815 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2805);
    float _2817 = log2(_2787);
    float _2819 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2809);
    float _2821 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2823 = fma(_2815, -0.5, 0.5);
    float _2825 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2807);
    float _2827 = fma(_2815, 0.5, 0.5);
    float _2829 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2821);
    float _2831 = _2793 + 1.0;
    float _2833 = exp2(_2811);
    float _2835 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2825);
    float _2837 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2829);
    float _2839 = fma(_2827, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2841 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2835);
    float _2843 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2837);
    float _2845 = fma(_2827, _2839, -0.212114393711090087890625);
    float _2847 = 1.0 / _2819;
    float _2849 = _2817 * 0.693147182464599609375;
    float _2851 = fma(_2827, _2845, 1.570728778839111328125);
    float _2853 = sqrt(_2823);
    float _2855 = -_2793;
    float _2857 = fma(_2833, _2831, _2855);
    float _2859 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2861 = fma(_2857, 0.5, 0.5);
    float _2863 = _2841 * _2847;
    float _2865 = _2843 * _2847;
    float _2867 = fma(_2863, 0.5, 0.5);
    float _2869 = fma(_2865, -0.5, 0.5);
    float _2871 = _2853 * 0.636619746685028076171875;
    float3 _7353 = float3(_2867, _2869, _2859);
    float _2873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7353, float3(0.0), isnan(_7353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7353, float3(0.0), isnan(_7353)), level(0.0)).x;
    float _2875 = -_2851;
    float _2877 = fma(_2871, _2875, 1.0);
    float3 _7369 = float3(_2867, _2869, _2859);
    float4 _2880 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7369, float3(0.0), isnan(_7369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7369, float3(0.0), isnan(_7369)), level(0.0)).xyzw;
    float _2882 = _2880.x;
    float _2884 = _2880.y;
    float _2886 = _2880.z;
    float _2888 = _2880.w;
    float2 _7386 = float2(_2877, _2861);
    float3 _2892 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7386, float2(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7386, float2(0.0), isnan(_7386)), level(0.0)).xyz;
    float _2894 = _2892.x;
    float _2896 = _2892.y;
    float _2898 = _2892.z;
    float _2900 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2902 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2904 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2902);
    float _2906 = exp2(_2900);
    float _2908 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2904);
    float _2910 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2908);
    float _2912 = _2910 + _2819;
    out.gl_Position.x = _2841;
    out.gl_Position.y = _2843;
    out.gl_Position.z = _2910;
    out.gl_Position.w = _2819;
    float _2914 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2916 = _2912 * 0.5;
    float _2918 = -_2906;
    float _2920 = _2918 + 1.0;
    out.m_47.x = _2914;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.z = _2916;
    out.m_76.w = _2819;
    float _2924 = -_2922;
    float _2926 = _2924 + 1.0;
    float _2928 = _2922 * _2873;
    float _2930 = _2888 * _2928;
    float _2932 = _2898 * _2928;
    float _2934 = fma(_2894, _2930, _2882);
    float _2936 = fma(_2896, _2930, _2884);
    float _2938 = _2888 * _2926;
    float _2940 = fma(_2888, _2932, _2886);
    out.m_78.x = _2934;
    out.m_78.y = _2936;
    out.m_78.z = _2940;
    out.m_78.w = _2938;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2357 = false;
    bool _905 = false;
    bool _559 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2997 = as_type<float>(_113);
        out.gl_Position.z = _2997;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_49.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3066 = as_type<float>(_151);
        out.gl_Position.z = _3066;
    }
    if (_145)
    {
        return out;
    }
    float _153 = in.m_51.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = _157 * _155;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _179);
    int _189 = as_type<int>(_159) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_159) & 2;
    bool _195 = _193 != 0;
    float _197 = _187 * 6.283185482025146484375;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = floor(_187);
    float _205 = _197 * 0.15915493667125701904296875;
    bool _207 = !_195;
    float _209 = _207 ? (-0.5) : 0.5;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _213 = _211 != 0;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _217 = _215 != 0;
    float _219 = _163 * _169;
    bool _221 = !_201;
    int _223 = _221 ? 0 : 1;
    float _225 = _205 * 6.283185482025146484375;
    float _227 = cos(_225);
    float _229 = _163 * _175;
    bool _231 = !_213;
    int _233 = _231 ? 0 : 1;
    float _235 = fma(_161, _167, _219);
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _163 * _183;
    int _241 = abs(_233);
    float _243 = fma(_161, _173, _229);
    float _245 = -_203;
    float _247 = _187 + _245;
    float _249 = fma(_161, _181, _239);
    int _251 = abs(_223);
    float _253 = -_247;
    float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _257 = float(_241);
    bool _259 = !_217;
    int _261 = _259 ? 0 : 1;
    float _263 = fma(_227, 0.5, 0.5);
    bool _265 = _247 < 0.5;
    float _267 = float(_265);
    float _269 = abs(_255);
    float _271 = _257 * _269;
    int _273 = abs(_261);
    float _275 = -_263;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_251);
    float _281 = -_267;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_273);
    float _287 = fma(_165, _185, _249);
    bool _289 = !_191;
    float _291 = _289 ? (-0.5) : 0.5;
    float _293 = fma(_279, _277, _271);
    float _295 = fma(_165, _171, _235);
    float _297 = fma(_165, _177, _243);
    float _299 = abs(_283);
    float _301 = fma(_285, _299, _293);
    bool _303 = !_237;
    float _319;
    if (!_303)
    {
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_97);
        float _325 = 1.0 / _323;
        float _327 = _131 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = _329 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _329 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _329 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = 1.0 / _345;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _363 = 1.0 / _353;
    float _365 = 1.0 / _357;
    float _367 = _333 * _359;
    bool _369 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _371 = isnan(_329);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_379;
    float _383 = _381 + 1.0;
    float _385 = 1.0 / _349;
    float _387 = _337 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _329 + _389;
    bool _393 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_329);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _405;
    float _409 = _341 * _365;
    bool _411 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _413 = isnan(_329);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -_403;
    float _425 = _423 + 1.0;
    float _427 = fma(_407, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = _421 * _383;
    float _431 = -_421;
    float _433 = _431 + 1.0;
    float _435 = _391 * _385;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _437;
    bool _441 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_329);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _455 = isnan(_329);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = fma(_439, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = _403 * _433;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = _451 * _425;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = -_463;
    float _485 = _483 + 1.0;
    float _487 = fma(_471, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _463 * _477;
    float _491 = fma(_481, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = _465 * _489;
    float _503 = _427 * _489;
    float _505 = fma(_495, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _513 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _515 = fma(_499, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _521 = fma(_491, _473, _511);
    float _523 = fma(_487, _473, _513);
    float _525 = fma(_509, _435, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _527 = fma(_519, _435, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _529 = fma(_505, _467, _521);
    float _531 = fma(_515, _467, _523);
    float _533 = fma(_525, _429, _529);
    float _535 = fma(_527, _429, _531);
    float _537 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[147].x, _533);
    float _539 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[147].y, _535);
    bool _541 = !_361;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _545 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_97);
        float _563 = 1.0 / _561;
        float _565 = _131 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_64.x;
    float _571 = in.m_64.y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _567 + _573;
    bool _577 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _579 = isnan(_567);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _593 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _595 = isnan(_567);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _605;
    bool _609 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _611 = isnan(_567);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = 1.0 / _591;
    float _623 = -_603;
    float _625 = _623 + 1.0;
    bool _627 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_567);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = 1.0 / _641;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _647 = _539 * _571;
    float _649 = -_587;
    float _651 = _649 + 1.0;
    float _653 = _607 * _621;
    bool _655 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _657 = isnan(_567);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _671 = fma(_653, _575, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _673 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _675 = isnan(_567);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _665 * _651;
    float _687 = -_665;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _669;
    float _693 = _603 * _689;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _619 * _625;
    float _701 = -_619;
    float _703 = _701 + 1.0;
    float _705 = -_637;
    float _707 = _705 + 1.0;
    float _709 = 1.0 / _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _711;
    float _715 = _637 * _703;
    bool _717 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _719 = isnan(_567);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_683;
    float _731 = _729 + 1.0;
    float _733 = _683 * _707;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _739 = _727 * _731;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _745 = -_727;
    float _747 = _745 + 1.0;
    float _749 = _737 * _643;
    float _751 = _671 * _739;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _757 = 1.0 / _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _761 = _567 + _759;
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _751);
    float _765 = _713 * _709;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _771 = fma(_749, _761, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _567 + _777;
    float _781 = 1.0 / _755;
    float _783 = fma(_771, _733, _763);
    float _785 = fma(_765, _779, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _787 = _775 * _691;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _791 = _567 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _797;
    float _801 = 1.0 / _769;
    float _803 = fma(_787, _791, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _805 = _799 * _757;
    float _807 = fma(_785, _715, _783);
    bool _809 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _811 = isnan(_567);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _821;
    float _825 = _537 * _569;
    float _827 = _795 * _781;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _831 = _567 + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _835 = _567 + _833;
    float _837 = fma(_803, _699, _807);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _841 = _567 + _839;
    float _843 = fma(_805, _831, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _845 = fma(_827, _835, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _847 = -_819;
    float _849 = _847 + 1.0;
    float _851 = _823 * _801;
    float _853 = fma(_843, _693, _837);
    float _855 = _587 * _849;
    float _857 = fma(_851, _841, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _859 = fma(_845, _685, _853);
    float _861 = fma(_857, _855, _859);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[122].x, _861);
    float _871 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _879 = !_645;
    float _901;
    float _903;
    if (!_879)
    {
        float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _883 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _885 = float(_97);
        float _887 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _889 = 1.0 / _885;
        float _891 = _887 * _881;
        float _893 = floor(_891);
        float _895 = _131 * _889;
        float _897 = -_893;
        float _899 = _891 + _897;
        _901 = _895;
        _903 = _899;
        _905 = true;
    }
    else
    {
        float _907 = float(_97);
        float _909 = 1.0 / _907;
        float _911 = _131 * _909;
        _901 = _911;
        _903 = _911;
    }
    _905 = false;
    float _913 = _901;
    float _915 = _903;
    float _917 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _919 = log2(_917);
    float _921 = in.m_51.y;
    float _923 = _153 * 2.0;
    float _925 = _301 * _825;
    float _927 = _301 * _647;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _941 = _939 != 0;
    float _943 = floor(_923);
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _947 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = in.m_51.z;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _961 = _913 + _959;
    float _963 = _919 * _131;
    float _965 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _967 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _969 = isnan(1.0);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _975 = _971 || _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _979 = 1.0 + _977;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _983 = -_929;
    float _985 = fma(_965, 2.0, _983);
    float _987 = exp2(_963);
    float _989 = in.m_51.w;
    float _991 = _921 * 2.0;
    float _993 = _921 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _995 = _943 >= 0.0;
    bool _997 = isnan(_943);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[78].w, _981);
    float _1007 = floor(_991);
    float _1009 = fma(_993, -2.0, _945);
    int _1011 = _1003 ? 0 : 1;
    float _1013 = _921 + (-0.5);
    float _1015 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    float _1017 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1005);
    bool _1019 = _943 > 0.0;
    float _1021 = -_987;
    float _1023 = _1021 + 1.0;
    float _1025 = 1.0 / _979;
    float _1027 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1029;
    float _1033 = _955 ? _1023 : 0.0;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1037 = _1007 > 0.0;
    float _1039 = in.m_44.x;
    float _1041 = in.m_44.y;
    float _1043 = in.m_44.z;
    bool _1045 = _1007 >= 0.0;
    bool _1047 = isnan(_1007);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1035);
    float _1057 = -_131;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[76].x, _985);
    float _1061 = 1.0 / _1031;
    float _1063 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1065 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1055);
    int _1067 = ~_1011;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    int _1073 = _1071;
    if (_975)
    {
        float _1075 = _1033 * _1025;
        _135 = _1075;
    }
    float _1077 = _135;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    if (!_1019)
    {
        int _1083 = ~_1011;
        int _1085 = _1083 + 1;
        _1073 = _1085;
    }
    int _1087 = _1073;
    float _1089 = 1.0 / _1081;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1099;
    int _1103 = _1053 ? 0 : 1;
    float _1105 = 1.0 / _1093;
    float _1107 = _175 * _1041;
    float _1109 = _169 * _1041;
    float _1111 = _183 * _1041;
    float _1113 = fma(_173, _1039, _1107);
    float _1115 = fma(_181, _1039, _1111);
    float _1117 = fma(_167, _1039, _1109);
    float _1119 = fma(_177, _1043, _1113);
    float _1121 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1027);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1127 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1063);
    float _1129 = 1.0 / _1097;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1137 = _915 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1143 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1145 = _1137 * _1089;
    float _1147 = 1.0 / _1125;
    float _1149 = fma(_171, _1043, _1117);
    float _1151 = fma(_185, _1043, _1115);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1161 = _153 > 0.5;
    float _1163 = 1.0 / _1141;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1167 = _915 + _1165;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    int _1171 = ~_1103;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    float _1177 = _1167 * _1105;
    int _1179 = _1175;
    if (!_1037)
    {
        int _1181 = ~_1103;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1189 = _915 + _1187;
    float _1191 = 1.0 / _1133;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1195 = _915 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1199 = _915 + _1197;
    float _1201 = -_291;
    int _1203 = _1161 ? as_type<int>(_1201) : as_type<int>(_291);
    float _1205 = _1195 * _1061;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1215 = 1.0 / _1101;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1219 = _1217 != 0;
    float _1221 = _1189 * _1129;
    float _1223 = _1213 * _1147;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1225;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1231 = _1229 != 0;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1239 = _1237 != 0;
    float _1241 = 1.0 / _1155;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1245 = _1243 != 0;
    float _1247 = _1227 * _1191;
    float _1249 = _957 * 2.0;
    float _1251 = _153 + _957;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1257 = 1.0 / _1159;
    float _1259 = _1199 * _1215;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1261;
    float _1265 = _1251 + (-1.0);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1271 = !_941;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1277 = 1.0 / _1235;
    float _1279 = _1263 * _1241;
    float _1281 = _921 + _957;
    float _1283 = _1209 * _1163;
    float _1285 = fma(_1223, _961, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1287 = _1281 + (-1.0);
    float _1289 = floor(_1249);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1293 = _1291 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1295 = _153 + _921;
    float _1297 = _1255 * _1257;
    float _1299 = _1295 + (-1.0);
    float _1301 = 1.0 / _1293;
    float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1305 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1307 = _1269 * _1277;
    bool _1309 = !_1219;
    float _1311 = _1309 ? _291 : as_type<float>(_1203);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1315 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1169);
    bool _1317 = _1289 > 0.0;
    bool _1319 = _1289 >= 0.0;
    bool _1321 = isnan(_1289);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan(0.0);
    bool _1327 = _1323 || _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1329;
    float _1333 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1335 = _1331 * _1301;
    bool _1337 = !_937;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = _1311 + 0.5;
    bool _1343 = _989 > 0.5;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1349;
    float _1353 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1355;
    float _1359 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1121);
    float _1361 = fma(_1353, _1341, _1059);
    float _1363 = fma(_1347, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1365 = fma(_1351, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1367 = fma(_1357, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1389;
    float _1393 = fma(_1371, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1395 = fma(_1375, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1397 = fma(_1379, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1399 = fma(_1383, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1401 = fma(_1387, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1407 = fma(_1391, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1417 = fma(_1405, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1419 = fma(_1411, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1421;
    float _1425 = fma(_1415, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1431;
    float _1435 = fma(_1423, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1439 = _913 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1443 = _913 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1447 = _913 + _1445;
    int _1449 = abs(_1339);
    float _1451 = fma(_1283, _1439, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1453 = fma(_1297, _1443, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1457 = _913 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1461 = _913 + _1459;
    float _1463 = fma(_1247, _1447, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    int _1465 = abs(_1273);
    float _1467 = fma(_1279, _1457, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1469 = fma(_1335, _1461, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1471 = in.m_66.x;
    float _1473 = in.m_66.y;
    float _1475 = in.m_66.z;
    int _1477 = _1327 ? 0 : 1;
    float _1479 = fma(_1429, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1481 = float(_1449);
    float _1483 = fma(_1433, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1485 = float(_1087);
    float _1487 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1489 = ~_1477;
    int _1491 = _1489 + 1;
    int _1493 = _1491 + 1;
    float _1495 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1497 = _1493;
    float _1499 = _1399;
    if (!_1317)
    {
        int _1501 = ~_1477;
        int _1503 = _1501 + 1;
        _1497 = _1503;
    }
    int _1505 = _1497;
    float _1507 = _1481 * _1485;
    bool _1509 = !_933;
    int _1511 = _1509 ? 0 : 1;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1515 = _913 + _1513;
    bool _1517 = _921 > 0.5;
    float _1519 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1521 = abs(_1511);
    float _1523 = _1507 * (-2.0);
    float _1525 = float(_1465);
    float _1527 = -_1519;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = float(_1185);
    float _1533 = sqrt(_1333);
    float _1535 = float(_1505);
    float _1537 = _1529 * _1529;
    float _1539 = fma(_1307, _1515, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1541 = fma(_1523, _1473, _1473);
    float _1543 = _1525 * _1531;
    float _1545 = -_1495;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1549 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1551 = isnan(_913);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1557 = _1553 || _1555;
    float _1559 = float(_1557);
    float _1561 = rsqrt(_1333);
    float _1563 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1565 = -_209;
    int _1567 = _1517 ? as_type<int>(_1565) : as_type<int>(_209);
    bool _1569 = !_1231;
    float _1571 = _1569 ? _209 : as_type<float>(_1567);
    float _1573 = rsqrt(_1359);
    float _1575 = float(_1521);
    float _1577 = -_1487;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1581 = _957 > 0.5;
    float _1583 = fma(_1579, _1579, _1537);
    float _1585 = _1575 * _1535;
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1589 = fma(_1303, _1523, _1303);
    float _1591 = fma(_1547, _1547, _1583);
    float _1593 = _1585 * (-2.0);
    float _1595 = fma(_1589, _1077, _1563);
    float _1597 = fma(_1305, _1593, _1305);
    float _1599 = rsqrt(_1315);
    float _1601 = _1595 * 0.15915493667125701904296875;
    float _1603 = fma(_1593, _1471, _1471);
    float _1605 = _1543 * (-2.0);
    float _1607 = _291 * _1561;
    float _1609 = fma(_1275, _1605, _1275);
    float _1611 = rsqrt(_1591);
    float _1613 = _153 + (-0.5);
    float _1615 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1617 = _1571 + (-0.5);
    float _1619 = _1533 * _1607;
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1603);
    float _1623 = fma(_1605, _1475, _1475);
    float _1625 = _957 + (-0.5);
    float _1627 = -_1615;
    float _1629 = -_1015;
    float _1631 = fma(_1627, _1617, _1629);
    float _1633 = -_291;
    int _1635 = _1581 ? as_type<int>(_1633) : as_type<int>(_291);
    float _1637 = fma(_1597, _1077, _1621);
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1623);
    float _1641 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1643 = !_1239;
    float _1645 = _1643 ? _291 : as_type<float>(_1635);
    float _1647 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1649 = _1487 + _1647;
    float _1651 = fma(_1609, _1077, _1639);
    float _1653 = -_209;
    int _1655 = _1343 ? as_type<int>(_1653) : as_type<int>(_209);
    float _1657 = _1579 * _1611;
    float _1659 = _1529 * _1611;
    float _1661 = _1547 * _1611;
    float _1663 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1665 = !_1245;
    float _1667 = _1665 ? _209 : as_type<float>(_1655);
    float _1669 = _209 * _1573;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1673 = _1657 * _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1677 = _1661 * _1675;
    float _1679 = _1651 * 0.15915493667125701904296875;
    float _1681 = _1533 * _1669;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1685 = -_1673;
    float _1687 = fma(_1661, _1683, _1685);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1691 = _1659 * _1689;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1695 = -_1677;
    float _1697 = fma(_1659, _1693, _1695);
    float _1699 = _1637 * 0.15915493667125701904296875;
    float _1701 = _1687 * _1687;
    float _1703 = _1679 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1681);
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1711 = -_1691;
    float _1713 = fma(_1657, _1709, _1711);
    float _1715 = fma(_1697, _1697, _1701);
    float _1717 = _1649 * _1561;
    float _1719 = _1641 * _1707;
    float _1721 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1723 = _1495 + _1721;
    float _1725 = fma(_1713, _1713, _1715);
    float _1727 = _1601 * 6.283185482025146484375;
    float _1729 = cos(_1727);
    float _1731 = fma(_1533, _1717, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1733 = _1723 * _1599;
    float _1735 = _1679 * 6.283185482025146484375;
    float _1737 = sin(_1735);
    float _1739 = _1699 * 6.283185482025146484375;
    float _1741 = sin(_1739);
    float _1743 = _1601 * 6.283185482025146484375;
    float _1745 = sin(_1743);
    float _1747 = _1699 * 6.283185482025146484375;
    float _1749 = cos(_1747);
    float _1751 = _1705 * _1719;
    float _1753 = -_1719;
    float _1755 = _1737 * _1753;
    float _1757 = _1741 * _1729;
    float _1759 = rsqrt(_1725);
    float _1761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1619);
    float _1763 = _1741 * _1745;
    float _1765 = _1663 * _1761;
    float _1767 = _1729 * _1705;
    float _1769 = _1749 * _1745;
    float _1771 = _1749 * _1729;
    float _1773 = fma(_1767, _1765, _1755);
    float _1775 = _1745 * _1705;
    float _1777 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1779 = -_1769;
    float _1781 = fma(_1737, _1757, _1779);
    float _1783 = fma(_1737, _1771, _1763);
    float _1785 = -_1757;
    float _1787 = fma(_1737, _1769, _1785);
    float _1789 = fma(_1737, _1763, _1771);
    float _1791 = fma(_1775, _1777, _1773);
    float _1793 = _1749 * _1751;
    float _1795 = _1687 * _1759;
    float _1797 = _1741 * _1751;
    bool _1799 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1801 = isnan(_913);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = fma(_1783, _1765, _1793);
    bool _1813 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1815 = isnan(_913);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = fma(_1781, _1765, _1797);
    float _1827 = _1697 * _1759;
    float _1829 = -_1809;
    float _1831 = _1829 + 1.0;
    float _1833 = _1713 * _1759;
    float _1835 = fma(_1787, _1777, _1811);
    float _1837 = fma(_1789, _1777, _1825);
    bool _1839 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1841 = isnan(_913);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    float _1851 = _1823 * _1831;
    bool _1853 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1855 = isnan(_915);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = -_1823;
    float _1867 = _1865 + 1.0;
    bool _1869 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1871 = isnan(_915);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1877 = _1873 || _1875;
    float _1879 = float(_1877);
    float _1881 = _1659 * _1827;
    bool _1883 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1885 = isnan(_915);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1891 = _1887 || _1889;
    float _1893 = float(_1891);
    float _1895 = _1849 * _1867;
    bool _1897 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1899 = isnan(_915);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = -_1849;
    float _1911 = _1909 + 1.0;
    bool _1913 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1915 = isnan(_915);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1881;
    float _1927 = fma(_1657, _1795, _1925);
    bool _1929 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1931 = isnan(_915);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1937 = _1933 || _1935;
    float _1939 = float(_1937);
    float _1941 = -_1893;
    float _1943 = _1941 + 1.0;
    bool _1945 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1947 = isnan(_913);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    bool _1957 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1959 = isnan(_913);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = -_1939;
    float _1971 = _1969 + 1.0;
    bool _1973 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1975 = isnan(_913);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = -_1955;
    float _1987 = _1985 + 1.0;
    float _1989 = _1955 * _1911;
    float _1991 = _1923 * _1971;
    float _1993 = -_1923;
    float _1995 = _1993 + 1.0;
    float _1997 = _1967 * _1987;
    float _1999 = -_1967;
    float _2001 = _1999 + 1.0;
    bool _2003 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2005 = isnan(_913);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2011 = _2007 || _2009;
    float _2013 = float(_2011);
    float _2015 = _1907 * _1995;
    float _2017 = -_1983;
    float _2019 = _2017 + 1.0;
    float _2021 = _1983 * _2001;
    float _2023 = _1661 * _1795;
    float _2025 = _1927 * _1835;
    float _2027 = -_1907;
    float _2029 = _2027 + 1.0;
    float _2031 = -_2023;
    float _2033 = fma(_1659, _1833, _2031);
    float _2035 = _1559 * _2019;
    float _2037 = -_1559;
    float _2039 = _2037 + 1.0;
    float _2041 = fma(_1833, _1791, _2025);
    float _2043 = _2033 * _1835;
    float _2045 = _1893 * _2029;
    float _2047 = _1879 * _1943;
    float _2049 = _2013 * _2039;
    float _2051 = fma(_1827, _1791, _2043);
    float _2053 = fma(_1533, _1733, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _2055 = fma(_1661, _1837, _2041);
    float _2057 = -_1879;
    float _2059 = _2057 + 1.0;
    float _2061 = fma(_1657, _1837, _2051);
    float _2063 = _1451 * _2049;
    float _2065 = _2055 + _2053;
    float _2067 = _1863 * _2059;
    float _2069 = _2061 + _1731;
    float _2071 = -_2013;
    float _2073 = _2071 + 1.0;
    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2077 = _2065 + _2075;
    float _2079 = _1365 * _2067;
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2083 = _2069 + _2081;
    float _2085 = _1363 * _2067;
    float _2087 = _2077 * _2077;
    float _2089 = _1367 * _2067;
    float _2091 = _2083 * _2083;
    float _2093 = _1657 * _1833;
    float _2095 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2063);
    float _2097 = -_1863;
    float _2099 = _2097 + 1.0;
    float _2101 = _2091 + _2087;
    float _2103 = -_2093;
    float _2105 = fma(_1661, _1827, _2103);
    float _2107 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2109 = _1519 + _2107;
    float _2111 = fma(_1285, _2035, _2095);
    float _2113 = sqrt(_2101);
    float _2115 = _2105 * _1835;
    float _2117 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2085);
    float _2119 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2079);
    float _2121 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2089);
    float _2123 = _2109 * _1573;
    float _2125 = fma(_1463, _2021, _2111);
    float _2127 = fma(_1795, _1791, _2115);
    float _2129 = fma(_1393, _2047, _2117);
    float _2131 = fma(_1395, _2047, _2119);
    float _2133 = fma(_1397, _2047, _2121);
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2137 = fma(_1533, _2123, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2139 = fma(_1659, _1837, _2127);
    float _2141 = fma(_1401, _2045, _2129);
    float _2143 = fma(_1399, _2045, _2131);
    bool _2145 = _2113 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2147 = fma(_1407, _2045, _2133);
    float _2149 = fma(_1453, _1997, _2125);
    float _2151 = _2139 + _2137;
    float _2153 = fma(_1419, _2015, _2141);
    float _2155 = fma(_1417, _2015, _2143);
    float _2157 = fma(_1425, _2015, _2147);
    float _2159 = fma(_1467, _1989, _2149);
    float _2161 = fma(_1435, _1991, _2153);
    float _2163 = fma(_1479, _1991, _2155);
    float _2165 = fma(_1483, _1991, _2157);
    float _2167 = fma(_1539, _1895, _2159);
    float _2169 = _2093;
    float _2171 = _2091;
    float _2173 = _2087;
    float _2175 = _2069;
    float _2177 = _2065;
    if (!_2145)
    {
        _2169 = _2151;
    }
    float _2179 = _2169;
    bool _2181 = !_2145;
    float _2183 = _2179;
    if (!_2181)
    {
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2189 = _2113 + _2187;
        float _2191 = rsqrt(_2101);
        float _2193 = _2189 * _2185;
        float _2195 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = _2193 * 0.15915493667125701904296875;
        float _2199 = _2197 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = _2197 * 6.283185482025146484375;
        float _2205 = cos(_2203);
        float _2207 = fma(_2201, _2195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2209 = _2191 * _2207;
        float _2211 = _2205 + (-1.0);
        float _2213 = fma(_2083, _2209, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2215 = fma(_2077, _2209, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2217 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2221 = _2213 + _2219;
        float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2225 = _2215 + _2223;
        float _2227 = fma(_2151, _2205, _2217);
        float _2229 = _2221 * _2221;
        float _2231 = _2225 * _2225;
        _2183 = _2227;
        _2171 = _2229;
        _2173 = _2231;
        _2175 = _2213;
        _2177 = _2215;
        _1499 = _2197;
    }
    float _2233 = _2183;
    float _2235 = _2171;
    float _2237 = _2173;
    float _2239 = _2175;
    float _2241 = _2177;
    float _2243 = _1499;
    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2247 = _2233 + _2245;
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2251 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2161);
    float _2253 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2163);
    float _2255 = fma(_2247, _2247, _2235);
    float _2257 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2165);
    float _2259 = _1645 + 0.5;
    float _2261 = -_1667;
    float _2263 = _2261 + 0.5;
    float _2265 = _2255 + _2237;
    float _2267 = -_1065;
    float _2269 = _2267 + 1.0;
    float _2271 = fma(_1469, _1851, _2167);
    float _2273 = -_1017;
    float _2275 = _2273 + 1.0;
    float _2277 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2281 = sqrt(_2265);
    float _2283 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2285 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2287 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2289 = -_2269;
    float _2291 = fma(_1311, _2289, _1361);
    float _2293 = fma(_1571, _2275, _1631);
    float _2295 = _2277 * _2135;
    float _2297 = _2279 * _2249;
    float _2299 = _2283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2301 = _2285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2303 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2305 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2271);
    out.m_68.x = _871;
    out.m_68.y = _873;
    out.m_68.z = _875;
    out.m_68.w = _877;
    out.m_70.x = _2291;
    out.m_70.y = _2293;
    out.m_70.z = _2295;
    out.m_70.w = _2297;
    bool _2307 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2309 = isnan(_2281);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2315 = _2311 || _2313;
    out.m_72.x = _2299;
    out.m_72.y = _2301;
    out.m_72.z = _2303;
    out.m_74.x = _2305;
    float _2317 = _2259;
    float _2319 = _2303;
    float _2321 = _2243;
    if (!_2315)
    {
        _2317 = 1.0;
    }
    float _2323 = _2317;
    bool _2325 = !_2315;
    float _2327 = _2323;
    if (!_2325)
    {
        bool _2329 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2331 = isnan(_2281);
        bool _2333 = _2329 || _2331;
        bool _2335 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2337 = _2333 || _2335;
        if (!_2337)
        {
            float _2339 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2341 = _2281 + _2339;
            float _2343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2345 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2343;
            float _2347 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2351 = 1.0 / _2345;
            float _2353 = _2341 * _2351;
            float _2355 = fma(_2353, _2349, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2327 = _2355;
            _2357 = true;
        }
        else
        {
            bool _2359 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2361 = isnan(_2281);
            bool _2363 = _2359 || _2361;
            bool _2365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2367 = _2363 || _2365;
            if (!_2367)
            {
                float _2369 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2371 = _2281 + _2369;
                float _2373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2375 = _2373 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2377 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2379 = _2377 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2381 = 1.0 / _2375;
                float _2383 = _2371 * _2381;
                float _2385 = fma(_2383, _2379, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2327 = _2385;
                _2357 = true;
            }
            else
            {
                _2327 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2357 = false;
    float _2387 = _2327;
    float _2389 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2391 = _2233 + _2389;
    float _2393 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2395 = _2239 + _2393;
    float _2397 = fma(_2391, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2399 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2401 = _2241 + _2399;
    float _2403 = fma(_2395, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2405 = -_1519;
    float _2407 = _2405 + _2397;
    float _2409 = fma(_2401, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2411 = -_1487;
    float _2413 = _2411 + _2403;
    float _2415 = _2407 * _2407;
    float _2417 = -_1495;
    float _2419 = _2417 + _2409;
    float _2421 = fma(_2413, _2413, _2415);
    float _2423 = fma(_2419, _2419, _2421);
    float _2425 = sqrt(_2423);
    bool _2427 = _2425 > 0.0;
    bool _2429 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(0.5);
    bool _2437 = _2433 || _2435;
    bool _2439 = !_2427;
    float _2441 = _2403;
    float _2443 = _2397;
    float _2445 = _2409;
    float _2447 = _2407;
    if (!_2439)
    {
        float _2449 = _297 * _297;
        float _2451 = fma(_295, _295, _2449);
        float _2453 = fma(_287, _287, _2451);
        float _2455 = rsqrt(_2423);
        float _2457 = sqrt(_2453);
        float _2459 = _2413 * _2455;
        float _2461 = _2407 * _2455;
        float _2463 = _2419 * _2455;
        bool _2465 = _2457 > 0.0;
        bool _2467 = !_2465;
        _2319 = _2459;
        if (!_2467)
        {
            float _2469 = rsqrt(_2453);
            float _2471 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2473 = _297 * _2469;
            float _2475 = _295 * _2469;
            float _2477 = _287 * _2469;
            float _2479 = _2461 * _2473;
            float _2481 = fma(_2459, _2475, _2479);
            float _2483 = _2471 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2485 = fma(_2463, _2477, _2481);
            float _2487 = _2485 * _2483;
            float _2489 = fma(_295, _2487, _2403);
            float _2491 = fma(_297, _2487, _2397);
            float _2493 = fma(_287, _2487, _2409);
            _2441 = _2489;
            _2443 = _2491;
            _2445 = _2493;
            _2447 = _2483;
        }
    }
    float _2495 = _2441;
    float _2497 = _2443;
    float _2499 = _2445;
    float _2501 = _2447;
    float _2503 = _2319;
    float _2505 = _2497;
    float _2507 = _2495;
    float _2509 = _2499;
    float _2511 = _2501;
    float _2513 = _2503;
    if (!_2437)
    {
        float _2515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2517 = _1519 + _2515;
        float _2519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2521 = _1487 + _2519;
        float _2523 = _2517 * _2517;
        float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2527 = _1495 + _2525;
        float _2529 = fma(_2521, _2521, _2523);
        float _2531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2533 = fma(_2527, _2527, _2529);
        float _2535 = -_1487;
        float _2537 = _2535 + _2495;
        float _2539 = sqrt(_2533);
        float _2541 = precise::min(_2539, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2543 = _2541 * _2531;
        float _2545 = -_1519;
        float _2547 = _2545 + _2497;
        float _2549 = -_1495;
        float _2551 = _2549 + _2499;
        float _2553 = fma(_2537, _2543, _1487);
        float _2555 = fma(_2547, _2543, _1519);
        float _2557 = fma(_2551, _2543, _1495);
        _2505 = _2555;
        _2507 = _2553;
        _2509 = _2557;
    }
    float _2559 = _2505;
    float _2561 = _2507;
    float _2563 = _2509;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2567 = _2559 + _2565;
    float _2569 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2571 = _2561 + _2569;
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2575 = _2563 + _2573;
    float _2577 = _2567 * _2567;
    float _2579 = fma(_2571, _2571, _2577);
    float _2581 = fma(_2575, _2575, _2579);
    float _2583 = rsqrt(_2581);
    float _2585 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2587 = _2571 * _2585;
    float _2589 = _2575 * _2585;
    float _2591 = _2587 * _2587;
    float _2593 = _2589 * _2589;
    float _2595 = _2591 + _2593;
    float _2597 = sqrt(_2595);
    bool _2599 = _2597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2603 = _2597 + _2601;
    float _2605 = _2583;
    float _2607 = _2595;
    float _2609 = _2603;
    float _2611 = _2567;
    if (_2599)
    {
        float _2613 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2605 = _2613;
    }
    float _2615 = _2605;
    if (_2599)
    {
        float _2617 = rsqrt(_2595);
        _2607 = _2617;
    }
    float _2619 = _2607;
    float _2621 = _2619;
    if (_2599)
    {
        float _2623 = _2603 * _2615;
        _2609 = _2623;
    }
    float _2625 = _2609;
    if (_2599)
    {
        float _2627 = _2625 * 0.15915493667125701904296875;
        _2511 = _2627;
    }
    float _2629 = _2511;
    float _2631 = _2575;
    if (_2599)
    {
        float _2633 = _2629 * 6.283185482025146484375;
        float _2635 = sin(_2633);
        _2631 = _2635;
    }
    float _2637 = _2631;
    float _2639 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2641 = precise::max(0.0, _2639);
    float _2643 = _2615;
    float _2645 = _2641;
    if (_2599)
    {
        float _2647 = _2629 * 6.283185482025146484375;
        float _2649 = cos(_2647);
        _2643 = _2649;
    }
    float _2651 = _2643;
    float _2653 = -_2585;
    float _2655 = -_2641;
    float _2657 = fma(_2567, _2653, _2655);
    if (_2599)
    {
        float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2611 = _2659;
    }
    float _2661 = _2611;
    float _2663 = sqrt(_2581);
    float _2665 = _2661;
    float _2667 = _2637;
    if (_2599)
    {
        float _2669 = fma(_2637, _2661, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2669;
    }
    float _2671 = _2665;
    float _2673 = _2671;
    if (!_2599)
    {
        _2667 = _2587;
    }
    float _2675 = _2667;
    float _2677 = _2675;
    float _2679 = _2651;
    if (_2599)
    {
        float _2681 = _2651 + (-1.0);
        _2645 = _2681;
    }
    float _2683 = _2645;
    float _2685 = _2683;
    if (_2599)
    {
        float _2687 = _2619 * _2671;
        _2321 = _2687;
    }
    float _2689 = _2321;
    if (!_2599)
    {
        _2673 = _2657;
    }
    float _2691 = _2673;
    float _2693 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2695 = _2691;
    if (_2599)
    {
        float _2697 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2697;
    }
    float _2699 = _2513;
    if (_2599)
    {
        float _2701 = _2587 * _2689;
        _2677 = _2701;
    }
    float _2703 = _2677;
    if (!_2599)
    {
        _2685 = _2589;
    }
    float _2705 = _2685;
    float _2707 = _2705;
    if (_2599)
    {
        float _2709 = _2589 * _2689;
        _2707 = _2709;
    }
    float _2711 = _2707;
    if (!_2599)
    {
        _2621 = _2591;
    }
    float _2713 = _2621;
    float _2715 = _2713;
    if (_2599)
    {
        float _2717 = fma(_2657, _2651, _2699);
        _2695 = _2717;
    }
    float _2719 = _2695;
    if (_2599)
    {
        float _2721 = _2703 * _2703;
        _2715 = _2721;
    }
    float _2723 = _2715;
    if (!_2599)
    {
        _2679 = _2593;
    }
    float _2725 = _2679;
    float _2727 = _2725;
    if (_2599)
    {
        float _2729 = _2711 * _2711;
        _2727 = _2729;
    }
    float _2731 = _2727;
    float _2733 = fma(_2719, _2719, _2723);
    float _2735 = _2733 + _2731;
    float _2737 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2741 = fma(_2663, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2739);
    float _2743 = precise::clamp(_2741, 0.0, 1.0);
    float _2745 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2749 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2737);
    float _2751 = rsqrt(_2735);
    float _2753 = -_2743;
    float _2755 = _2753 + 1.0;
    float _2757 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2759 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2749);
    float _2761 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2745);
    float _2763 = _2759 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2765 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2757);
    float _2767 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2761);
    float _2769 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2693);
    float _2771 = abs(_2755);
    float _2773 = log2(_2771);
    float _2775 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2777 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2765);
    float _2779 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2781 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2769);
    float _2783 = _2751 * _2703;
    float _2785 = -_2775;
    float _2787 = fma(_2785, _2747, 1.0);
    float _2789 = _2777 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2791 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2793 = _2751 * _2719;
    float _2795 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2797 = _2751 * _2711;
    float _2799 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2791);
    float _2801 = _2781 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2803 = -_2795;
    float _2805 = fma(_2793, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2803);
    float _2807 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2809 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2799);
    float _2811 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2813 = -_2797;
    float _2815 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2805);
    float _2817 = log2(_2787);
    float _2819 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2809);
    float _2821 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2823 = fma(_2815, -0.5, 0.5);
    float _2825 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2807);
    float _2827 = fma(_2815, 0.5, 0.5);
    float _2829 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2821);
    float _2831 = _2793 + 1.0;
    float _2833 = exp2(_2811);
    float _2835 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2825);
    float _2837 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2829);
    float _2839 = fma(_2827, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2841 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2835);
    float _2843 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2837);
    float _2845 = fma(_2827, _2839, -0.212114393711090087890625);
    float _2847 = 1.0 / _2819;
    float _2849 = _2817 * 0.693147182464599609375;
    float _2851 = fma(_2827, _2845, 1.570728778839111328125);
    float _2853 = sqrt(_2823);
    float _2855 = -_2793;
    float _2857 = fma(_2833, _2831, _2855);
    float _2859 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2861 = fma(_2857, 0.5, 0.5);
    float _2863 = _2841 * _2847;
    float _2865 = _2843 * _2847;
    float _2867 = fma(_2863, 0.5, 0.5);
    float _2869 = fma(_2865, -0.5, 0.5);
    float _2871 = _2853 * 0.636619746685028076171875;
    float3 _7353 = float3(_2867, _2869, _2859);
    float _2873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7353, float3(0.0), isnan(_7353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7353, float3(0.0), isnan(_7353)), level(0.0)).x;
    float _2875 = -_2851;
    float _2877 = fma(_2871, _2875, 1.0);
    float3 _7369 = float3(_2867, _2869, _2859);
    float4 _2880 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7369, float3(0.0), isnan(_7369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7369, float3(0.0), isnan(_7369)), level(0.0)).xyzw;
    float _2882 = _2880.x;
    float _2884 = _2880.y;
    float _2886 = _2880.z;
    float _2888 = _2880.w;
    float2 _7386 = float2(_2877, _2861);
    float3 _2892 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7386, float2(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7386, float2(0.0), isnan(_7386)), level(0.0)).xyz;
    float _2894 = _2892.x;
    float _2896 = _2892.y;
    float _2898 = _2892.z;
    float _2900 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2902 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2904 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2902);
    float _2906 = exp2(_2900);
    float _2908 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2904);
    float _2910 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2908);
    float _2912 = _2910 + _2819;
    out.gl_Position.x = _2841;
    out.gl_Position.y = _2843;
    out.gl_Position.z = _2910;
    out.gl_Position.w = _2819;
    float _2914 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2916 = _2912 * 0.5;
    float _2918 = -_2906;
    float _2920 = _2918 + 1.0;
    out.m_47.x = _2914;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.z = _2916;
    out.m_76.w = _2819;
    float _2924 = -_2922;
    float _2926 = _2924 + 1.0;
    float _2928 = _2922 * _2873;
    float _2930 = _2888 * _2928;
    float _2932 = _2898 * _2928;
    float _2934 = fma(_2894, _2930, _2882);
    float _2936 = fma(_2896, _2930, _2884);
    float _2938 = _2888 * _2926;
    float _2940 = fma(_2888, _2932, _2886);
    out.m_78.x = _2934;
    out.m_78.y = _2936;
    out.m_78.z = _2940;
    out.m_78.w = _2938;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2357 = false;
    bool _905 = false;
    bool _559 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2997 = as_type<float>(_113);
        out.gl_Position.z = _2997;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_49.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3066 = as_type<float>(_151);
        out.gl_Position.z = _3066;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_51.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = _157 * _155;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _179);
    int _189 = as_type<int>(_159) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_159) & 2;
    bool _195 = _193 != 0;
    float _197 = _187 * 6.283185482025146484375;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = floor(_187);
    float _205 = _197 * 0.15915493667125701904296875;
    bool _207 = !_195;
    float _209 = _207 ? (-0.5) : 0.5;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _213 = _211 != 0;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _217 = _215 != 0;
    float _219 = _163 * _169;
    bool _221 = !_201;
    int _223 = _221 ? 0 : 1;
    float _225 = _205 * 6.283185482025146484375;
    float _227 = cos(_225);
    float _229 = _163 * _175;
    bool _231 = !_213;
    int _233 = _231 ? 0 : 1;
    float _235 = fma(_161, _167, _219);
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _163 * _183;
    int _241 = abs(_233);
    float _243 = fma(_161, _173, _229);
    float _245 = -_203;
    float _247 = _187 + _245;
    float _249 = fma(_161, _181, _239);
    int _251 = abs(_223);
    float _253 = -_247;
    float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _257 = float(_241);
    bool _259 = !_217;
    int _261 = _259 ? 0 : 1;
    float _263 = fma(_227, 0.5, 0.5);
    bool _265 = _247 < 0.5;
    float _267 = float(_265);
    float _269 = abs(_255);
    float _271 = _257 * _269;
    int _273 = abs(_261);
    float _275 = -_263;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_251);
    float _281 = -_267;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_273);
    float _287 = fma(_165, _185, _249);
    bool _289 = !_191;
    float _291 = _289 ? (-0.5) : 0.5;
    float _293 = fma(_279, _277, _271);
    float _295 = fma(_165, _171, _235);
    float _297 = fma(_165, _177, _243);
    float _299 = abs(_283);
    float _301 = fma(_285, _299, _293);
    bool _303 = !_237;
    float _319;
    if (!_303)
    {
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_97);
        float _325 = 1.0 / _323;
        float _327 = _131 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = _329 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _329 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _329 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = 1.0 / _345;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _363 = 1.0 / _353;
    float _365 = 1.0 / _357;
    float _367 = _333 * _359;
    bool _369 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _371 = isnan(_329);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_379;
    float _383 = _381 + 1.0;
    float _385 = 1.0 / _349;
    float _387 = _337 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _329 + _389;
    bool _393 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _395 = isnan(_329);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _405;
    float _409 = _341 * _365;
    bool _411 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _413 = isnan(_329);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -_403;
    float _425 = _423 + 1.0;
    float _427 = fma(_407, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = _421 * _383;
    float _431 = -_421;
    float _433 = _431 + 1.0;
    float _435 = _391 * _385;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _437;
    bool _441 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_329);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _455 = isnan(_329);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = fma(_439, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = _403 * _433;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = _451 * _425;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = -_463;
    float _485 = _483 + 1.0;
    float _487 = fma(_471, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _463 * _477;
    float _491 = fma(_481, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = _465 * _489;
    float _503 = _427 * _489;
    float _505 = fma(_495, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _513 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _515 = fma(_499, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _521 = fma(_491, _473, _511);
    float _523 = fma(_487, _473, _513);
    float _525 = fma(_509, _435, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _527 = fma(_519, _435, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _529 = fma(_505, _467, _521);
    float _531 = fma(_515, _467, _523);
    float _533 = fma(_525, _429, _529);
    float _535 = fma(_527, _429, _531);
    float _537 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[147].x, _533);
    float _539 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[147].y, _535);
    bool _541 = !_361;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _545 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_97);
        float _563 = 1.0 / _561;
        float _565 = _131 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_64.x;
    float _571 = in.m_64.y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _567 + _573;
    bool _577 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _579 = isnan(_567);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _593 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _595 = isnan(_567);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _605;
    bool _609 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _611 = isnan(_567);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = 1.0 / _591;
    float _623 = -_603;
    float _625 = _623 + 1.0;
    bool _627 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_567);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = 1.0 / _641;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _647 = _539 * _571;
    float _649 = -_587;
    float _651 = _649 + 1.0;
    float _653 = _607 * _621;
    bool _655 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _657 = isnan(_567);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _671 = fma(_653, _575, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _673 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _675 = isnan(_567);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _665 * _651;
    float _687 = -_665;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _669;
    float _693 = _603 * _689;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _619 * _625;
    float _701 = -_619;
    float _703 = _701 + 1.0;
    float _705 = -_637;
    float _707 = _705 + 1.0;
    float _709 = 1.0 / _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _711;
    float _715 = _637 * _703;
    bool _717 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _719 = isnan(_567);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_683;
    float _731 = _729 + 1.0;
    float _733 = _683 * _707;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _739 = _727 * _731;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _745 = -_727;
    float _747 = _745 + 1.0;
    float _749 = _737 * _643;
    float _751 = _671 * _739;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _757 = 1.0 / _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _761 = _567 + _759;
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _751);
    float _765 = _713 * _709;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _771 = fma(_749, _761, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _567 + _777;
    float _781 = 1.0 / _755;
    float _783 = fma(_771, _733, _763);
    float _785 = fma(_765, _779, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _787 = _775 * _691;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _791 = _567 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _797;
    float _801 = 1.0 / _769;
    float _803 = fma(_787, _791, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _805 = _799 * _757;
    float _807 = fma(_785, _715, _783);
    bool _809 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _811 = isnan(_567);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _821;
    float _825 = _537 * _569;
    float _827 = _795 * _781;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _831 = _567 + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _835 = _567 + _833;
    float _837 = fma(_803, _699, _807);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _841 = _567 + _839;
    float _843 = fma(_805, _831, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _845 = fma(_827, _835, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _847 = -_819;
    float _849 = _847 + 1.0;
    float _851 = _823 * _801;
    float _853 = fma(_843, _693, _837);
    float _855 = _587 * _849;
    float _857 = fma(_851, _841, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _859 = fma(_845, _685, _853);
    float _861 = fma(_857, _855, _859);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[122].x, _861);
    float _871 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _879 = !_645;
    float _901;
    float _903;
    if (!_879)
    {
        float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _883 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _885 = float(_97);
        float _887 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _889 = 1.0 / _885;
        float _891 = _887 * _881;
        float _893 = floor(_891);
        float _895 = _131 * _889;
        float _897 = -_893;
        float _899 = _891 + _897;
        _901 = _895;
        _903 = _899;
        _905 = true;
    }
    else
    {
        float _907 = float(_97);
        float _909 = 1.0 / _907;
        float _911 = _131 * _909;
        _901 = _911;
        _903 = _911;
    }
    _905 = false;
    float _913 = _901;
    float _915 = _903;
    float _917 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _919 = log2(_917);
    float _921 = in.m_51.y;
    float _923 = _153 * 2.0;
    float _925 = _301 * _825;
    float _927 = _301 * _647;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _941 = _939 != 0;
    float _943 = floor(_923);
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _947 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = in.m_51.z;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _961 = _913 + _959;
    float _963 = _919 * _131;
    float _965 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _967 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _969 = isnan(1.0);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _975 = _971 || _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _979 = 1.0 + _977;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _983 = -_929;
    float _985 = fma(_965, 2.0, _983);
    float _987 = exp2(_963);
    float _989 = in.m_51.w;
    float _991 = _921 * 2.0;
    float _993 = _921 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _995 = _943 >= 0.0;
    bool _997 = isnan(_943);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[78].w, _981);
    float _1007 = floor(_991);
    float _1009 = fma(_993, -2.0, _945);
    int _1011 = _1003 ? 0 : 1;
    float _1013 = _921 + (-0.5);
    float _1015 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    float _1017 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1005);
    bool _1019 = _943 > 0.0;
    float _1021 = -_987;
    float _1023 = _1021 + 1.0;
    float _1025 = 1.0 / _979;
    float _1027 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1029;
    float _1033 = _955 ? _1023 : 0.0;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1037 = _1007 > 0.0;
    float _1039 = in.m_44.x;
    float _1041 = in.m_44.y;
    float _1043 = in.m_44.z;
    bool _1045 = _1007 >= 0.0;
    bool _1047 = isnan(_1007);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1035);
    float _1057 = -_131;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[76].x, _985);
    float _1061 = 1.0 / _1031;
    float _1063 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1065 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1055);
    int _1067 = ~_1011;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    int _1073 = _1071;
    if (_975)
    {
        float _1075 = _1033 * _1025;
        _135 = _1075;
    }
    float _1077 = _135;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    if (!_1019)
    {
        int _1083 = ~_1011;
        int _1085 = _1083 + 1;
        _1073 = _1085;
    }
    int _1087 = _1073;
    float _1089 = 1.0 / _1081;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1099;
    int _1103 = _1053 ? 0 : 1;
    float _1105 = 1.0 / _1093;
    float _1107 = _175 * _1041;
    float _1109 = _169 * _1041;
    float _1111 = _183 * _1041;
    float _1113 = fma(_173, _1039, _1107);
    float _1115 = fma(_181, _1039, _1111);
    float _1117 = fma(_167, _1039, _1109);
    float _1119 = fma(_177, _1043, _1113);
    float _1121 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1027);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1127 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1063);
    float _1129 = 1.0 / _1097;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1137 = _915 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1143 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1145 = _1137 * _1089;
    float _1147 = 1.0 / _1125;
    float _1149 = fma(_171, _1043, _1117);
    float _1151 = fma(_185, _1043, _1115);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1161 = _153 > 0.5;
    float _1163 = 1.0 / _1141;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1167 = _915 + _1165;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    int _1171 = ~_1103;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    float _1177 = _1167 * _1105;
    int _1179 = _1175;
    if (!_1037)
    {
        int _1181 = ~_1103;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1189 = _915 + _1187;
    float _1191 = 1.0 / _1133;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1195 = _915 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1199 = _915 + _1197;
    float _1201 = -_291;
    int _1203 = _1161 ? as_type<int>(_1201) : as_type<int>(_291);
    float _1205 = _1195 * _1061;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1215 = 1.0 / _1101;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1219 = _1217 != 0;
    float _1221 = _1189 * _1129;
    float _1223 = _1213 * _1147;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1225;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1231 = _1229 != 0;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1239 = _1237 != 0;
    float _1241 = 1.0 / _1155;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1245 = _1243 != 0;
    float _1247 = _1227 * _1191;
    float _1249 = _957 * 2.0;
    float _1251 = _153 + _957;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1257 = 1.0 / _1159;
    float _1259 = _1199 * _1215;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1261;
    float _1265 = _1251 + (-1.0);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1271 = !_941;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1277 = 1.0 / _1235;
    float _1279 = _1263 * _1241;
    float _1281 = _921 + _957;
    float _1283 = _1209 * _1163;
    float _1285 = fma(_1223, _961, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1287 = _1281 + (-1.0);
    float _1289 = floor(_1249);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1293 = _1291 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1295 = _153 + _921;
    float _1297 = _1255 * _1257;
    float _1299 = _1295 + (-1.0);
    float _1301 = 1.0 / _1293;
    float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1305 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1307 = _1269 * _1277;
    bool _1309 = !_1219;
    float _1311 = _1309 ? _291 : as_type<float>(_1203);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1315 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1169);
    bool _1317 = _1289 > 0.0;
    bool _1319 = _1289 >= 0.0;
    bool _1321 = isnan(_1289);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan(0.0);
    bool _1327 = _1323 || _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1329;
    float _1333 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1335 = _1331 * _1301;
    bool _1337 = !_937;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = _1311 + 0.5;
    bool _1343 = _989 > 0.5;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1349;
    float _1353 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1355;
    float _1359 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1121);
    float _1361 = fma(_1353, _1341, _1059);
    float _1363 = fma(_1347, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1365 = fma(_1351, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1367 = fma(_1357, _1205, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1389;
    float _1393 = fma(_1371, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1395 = fma(_1375, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1397 = fma(_1379, _1145, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1399 = fma(_1383, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1401 = fma(_1387, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1407 = fma(_1391, _1177, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1417 = fma(_1405, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1419 = fma(_1411, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1421;
    float _1425 = fma(_1415, _1221, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1431;
    float _1435 = fma(_1423, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1439 = _913 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1443 = _913 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1447 = _913 + _1445;
    int _1449 = abs(_1339);
    float _1451 = fma(_1283, _1439, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1453 = fma(_1297, _1443, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1457 = _913 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1461 = _913 + _1459;
    float _1463 = fma(_1247, _1447, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    int _1465 = abs(_1273);
    float _1467 = fma(_1279, _1457, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1469 = fma(_1335, _1461, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1471 = in.m_66.x;
    float _1473 = in.m_66.y;
    float _1475 = in.m_66.z;
    int _1477 = _1327 ? 0 : 1;
    float _1479 = fma(_1429, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1481 = float(_1449);
    float _1483 = fma(_1433, _1259, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1485 = float(_1087);
    float _1487 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1489 = ~_1477;
    int _1491 = _1489 + 1;
    int _1493 = _1491 + 1;
    float _1495 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1497 = _1493;
    float _1499 = _1399;
    if (!_1317)
    {
        int _1501 = ~_1477;
        int _1503 = _1501 + 1;
        _1497 = _1503;
    }
    int _1505 = _1497;
    float _1507 = _1481 * _1485;
    bool _1509 = !_933;
    int _1511 = _1509 ? 0 : 1;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1515 = _913 + _1513;
    bool _1517 = _921 > 0.5;
    float _1519 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1521 = abs(_1511);
    float _1523 = _1507 * (-2.0);
    float _1525 = float(_1465);
    float _1527 = -_1519;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = float(_1185);
    float _1533 = sqrt(_1333);
    float _1535 = float(_1505);
    float _1537 = _1529 * _1529;
    float _1539 = fma(_1307, _1515, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1541 = fma(_1523, _1473, _1473);
    float _1543 = _1525 * _1531;
    float _1545 = -_1495;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1549 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1551 = isnan(_913);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1557 = _1553 || _1555;
    float _1559 = float(_1557);
    float _1561 = rsqrt(_1333);
    float _1563 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1565 = -_209;
    int _1567 = _1517 ? as_type<int>(_1565) : as_type<int>(_209);
    bool _1569 = !_1231;
    float _1571 = _1569 ? _209 : as_type<float>(_1567);
    float _1573 = rsqrt(_1359);
    float _1575 = float(_1521);
    float _1577 = -_1487;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1581 = _957 > 0.5;
    float _1583 = fma(_1579, _1579, _1537);
    float _1585 = _1575 * _1535;
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1589 = fma(_1303, _1523, _1303);
    float _1591 = fma(_1547, _1547, _1583);
    float _1593 = _1585 * (-2.0);
    float _1595 = fma(_1589, _1077, _1563);
    float _1597 = fma(_1305, _1593, _1305);
    float _1599 = rsqrt(_1315);
    float _1601 = _1595 * 0.15915493667125701904296875;
    float _1603 = fma(_1593, _1471, _1471);
    float _1605 = _1543 * (-2.0);
    float _1607 = _291 * _1561;
    float _1609 = fma(_1275, _1605, _1275);
    float _1611 = rsqrt(_1591);
    float _1613 = _153 + (-0.5);
    float _1615 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1617 = _1571 + (-0.5);
    float _1619 = _1533 * _1607;
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1603);
    float _1623 = fma(_1605, _1475, _1475);
    float _1625 = _957 + (-0.5);
    float _1627 = -_1615;
    float _1629 = -_1015;
    float _1631 = fma(_1627, _1617, _1629);
    float _1633 = -_291;
    int _1635 = _1581 ? as_type<int>(_1633) : as_type<int>(_291);
    float _1637 = fma(_1597, _1077, _1621);
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1623);
    float _1641 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1643 = !_1239;
    float _1645 = _1643 ? _291 : as_type<float>(_1635);
    float _1647 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1649 = _1487 + _1647;
    float _1651 = fma(_1609, _1077, _1639);
    float _1653 = -_209;
    int _1655 = _1343 ? as_type<int>(_1653) : as_type<int>(_209);
    float _1657 = _1579 * _1611;
    float _1659 = _1529 * _1611;
    float _1661 = _1547 * _1611;
    float _1663 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1665 = !_1245;
    float _1667 = _1665 ? _209 : as_type<float>(_1655);
    float _1669 = _209 * _1573;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1673 = _1657 * _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1677 = _1661 * _1675;
    float _1679 = _1651 * 0.15915493667125701904296875;
    float _1681 = _1533 * _1669;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1685 = -_1673;
    float _1687 = fma(_1661, _1683, _1685);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1691 = _1659 * _1689;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1695 = -_1677;
    float _1697 = fma(_1659, _1693, _1695);
    float _1699 = _1637 * 0.15915493667125701904296875;
    float _1701 = _1687 * _1687;
    float _1703 = _1679 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1681);
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1711 = -_1691;
    float _1713 = fma(_1657, _1709, _1711);
    float _1715 = fma(_1697, _1697, _1701);
    float _1717 = _1649 * _1561;
    float _1719 = _1641 * _1707;
    float _1721 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1723 = _1495 + _1721;
    float _1725 = fma(_1713, _1713, _1715);
    float _1727 = _1601 * 6.283185482025146484375;
    float _1729 = cos(_1727);
    float _1731 = fma(_1533, _1717, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1733 = _1723 * _1599;
    float _1735 = _1679 * 6.283185482025146484375;
    float _1737 = sin(_1735);
    float _1739 = _1699 * 6.283185482025146484375;
    float _1741 = sin(_1739);
    float _1743 = _1601 * 6.283185482025146484375;
    float _1745 = sin(_1743);
    float _1747 = _1699 * 6.283185482025146484375;
    float _1749 = cos(_1747);
    float _1751 = _1705 * _1719;
    float _1753 = -_1719;
    float _1755 = _1737 * _1753;
    float _1757 = _1741 * _1729;
    float _1759 = rsqrt(_1725);
    float _1761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1619);
    float _1763 = _1741 * _1745;
    float _1765 = _1663 * _1761;
    float _1767 = _1729 * _1705;
    float _1769 = _1749 * _1745;
    float _1771 = _1749 * _1729;
    float _1773 = fma(_1767, _1765, _1755);
    float _1775 = _1745 * _1705;
    float _1777 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1779 = -_1769;
    float _1781 = fma(_1737, _1757, _1779);
    float _1783 = fma(_1737, _1771, _1763);
    float _1785 = -_1757;
    float _1787 = fma(_1737, _1769, _1785);
    float _1789 = fma(_1737, _1763, _1771);
    float _1791 = fma(_1775, _1777, _1773);
    float _1793 = _1749 * _1751;
    float _1795 = _1687 * _1759;
    float _1797 = _1741 * _1751;
    bool _1799 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1801 = isnan(_913);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = fma(_1783, _1765, _1793);
    bool _1813 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1815 = isnan(_913);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = fma(_1781, _1765, _1797);
    float _1827 = _1697 * _1759;
    float _1829 = -_1809;
    float _1831 = _1829 + 1.0;
    float _1833 = _1713 * _1759;
    float _1835 = fma(_1787, _1777, _1811);
    float _1837 = fma(_1789, _1777, _1825);
    bool _1839 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1841 = isnan(_913);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    float _1851 = _1823 * _1831;
    bool _1853 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1855 = isnan(_915);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = -_1823;
    float _1867 = _1865 + 1.0;
    bool _1869 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1871 = isnan(_915);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1877 = _1873 || _1875;
    float _1879 = float(_1877);
    float _1881 = _1659 * _1827;
    bool _1883 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1885 = isnan(_915);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1891 = _1887 || _1889;
    float _1893 = float(_1891);
    float _1895 = _1849 * _1867;
    bool _1897 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1899 = isnan(_915);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = -_1849;
    float _1911 = _1909 + 1.0;
    bool _1913 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1915 = isnan(_915);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1881;
    float _1927 = fma(_1657, _1795, _1925);
    bool _1929 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1931 = isnan(_915);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1937 = _1933 || _1935;
    float _1939 = float(_1937);
    float _1941 = -_1893;
    float _1943 = _1941 + 1.0;
    bool _1945 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1947 = isnan(_913);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1953 = _1949 || _1951;
    float _1955 = float(_1953);
    bool _1957 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1959 = isnan(_913);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = -_1939;
    float _1971 = _1969 + 1.0;
    bool _1973 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1975 = isnan(_913);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1981 = _1977 || _1979;
    float _1983 = float(_1981);
    float _1985 = -_1955;
    float _1987 = _1985 + 1.0;
    float _1989 = _1955 * _1911;
    float _1991 = _1923 * _1971;
    float _1993 = -_1923;
    float _1995 = _1993 + 1.0;
    float _1997 = _1967 * _1987;
    float _1999 = -_1967;
    float _2001 = _1999 + 1.0;
    bool _2003 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2005 = isnan(_913);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2011 = _2007 || _2009;
    float _2013 = float(_2011);
    float _2015 = _1907 * _1995;
    float _2017 = -_1983;
    float _2019 = _2017 + 1.0;
    float _2021 = _1983 * _2001;
    float _2023 = _1661 * _1795;
    float _2025 = _1927 * _1835;
    float _2027 = -_1907;
    float _2029 = _2027 + 1.0;
    float _2031 = -_2023;
    float _2033 = fma(_1659, _1833, _2031);
    float _2035 = _1559 * _2019;
    float _2037 = -_1559;
    float _2039 = _2037 + 1.0;
    float _2041 = fma(_1833, _1791, _2025);
    float _2043 = _2033 * _1835;
    float _2045 = _1893 * _2029;
    float _2047 = _1879 * _1943;
    float _2049 = _2013 * _2039;
    float _2051 = fma(_1827, _1791, _2043);
    float _2053 = fma(_1533, _1733, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _2055 = fma(_1661, _1837, _2041);
    float _2057 = -_1879;
    float _2059 = _2057 + 1.0;
    float _2061 = fma(_1657, _1837, _2051);
    float _2063 = _1451 * _2049;
    float _2065 = _2055 + _2053;
    float _2067 = _1863 * _2059;
    float _2069 = _2061 + _1731;
    float _2071 = -_2013;
    float _2073 = _2071 + 1.0;
    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2077 = _2065 + _2075;
    float _2079 = _1365 * _2067;
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2083 = _2069 + _2081;
    float _2085 = _1363 * _2067;
    float _2087 = _2077 * _2077;
    float _2089 = _1367 * _2067;
    float _2091 = _2083 * _2083;
    float _2093 = _1657 * _1833;
    float _2095 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2063);
    float _2097 = -_1863;
    float _2099 = _2097 + 1.0;
    float _2101 = _2091 + _2087;
    float _2103 = -_2093;
    float _2105 = fma(_1661, _1827, _2103);
    float _2107 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2109 = _1519 + _2107;
    float _2111 = fma(_1285, _2035, _2095);
    float _2113 = sqrt(_2101);
    float _2115 = _2105 * _1835;
    float _2117 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2085);
    float _2119 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2079);
    float _2121 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2089);
    float _2123 = _2109 * _1573;
    float _2125 = fma(_1463, _2021, _2111);
    float _2127 = fma(_1795, _1791, _2115);
    float _2129 = fma(_1393, _2047, _2117);
    float _2131 = fma(_1395, _2047, _2119);
    float _2133 = fma(_1397, _2047, _2121);
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2137 = fma(_1533, _2123, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2139 = fma(_1659, _1837, _2127);
    float _2141 = fma(_1401, _2045, _2129);
    float _2143 = fma(_1399, _2045, _2131);
    bool _2145 = _2113 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2147 = fma(_1407, _2045, _2133);
    float _2149 = fma(_1453, _1997, _2125);
    float _2151 = _2139 + _2137;
    float _2153 = fma(_1419, _2015, _2141);
    float _2155 = fma(_1417, _2015, _2143);
    float _2157 = fma(_1425, _2015, _2147);
    float _2159 = fma(_1467, _1989, _2149);
    float _2161 = fma(_1435, _1991, _2153);
    float _2163 = fma(_1479, _1991, _2155);
    float _2165 = fma(_1483, _1991, _2157);
    float _2167 = fma(_1539, _1895, _2159);
    float _2169 = _2093;
    float _2171 = _2091;
    float _2173 = _2087;
    float _2175 = _2069;
    float _2177 = _2065;
    if (!_2145)
    {
        _2169 = _2151;
    }
    float _2179 = _2169;
    bool _2181 = !_2145;
    float _2183 = _2179;
    if (!_2181)
    {
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2189 = _2113 + _2187;
        float _2191 = rsqrt(_2101);
        float _2193 = _2189 * _2185;
        float _2195 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = _2193 * 0.15915493667125701904296875;
        float _2199 = _2197 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = _2197 * 6.283185482025146484375;
        float _2205 = cos(_2203);
        float _2207 = fma(_2201, _2195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2209 = _2191 * _2207;
        float _2211 = _2205 + (-1.0);
        float _2213 = fma(_2083, _2209, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2215 = fma(_2077, _2209, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2217 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2221 = _2213 + _2219;
        float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2225 = _2215 + _2223;
        float _2227 = fma(_2151, _2205, _2217);
        float _2229 = _2221 * _2221;
        float _2231 = _2225 * _2225;
        _2183 = _2227;
        _2171 = _2229;
        _2173 = _2231;
        _2175 = _2213;
        _2177 = _2215;
        _1499 = _2197;
    }
    float _2233 = _2183;
    float _2235 = _2171;
    float _2237 = _2173;
    float _2239 = _2175;
    float _2241 = _2177;
    float _2243 = _1499;
    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2247 = _2233 + _2245;
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2251 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2161);
    float _2253 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2163);
    float _2255 = fma(_2247, _2247, _2235);
    float _2257 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2165);
    float _2259 = _1645 + 0.5;
    float _2261 = -_1667;
    float _2263 = _2261 + 0.5;
    float _2265 = _2255 + _2237;
    float _2267 = -_1065;
    float _2269 = _2267 + 1.0;
    float _2271 = fma(_1469, _1851, _2167);
    float _2273 = -_1017;
    float _2275 = _2273 + 1.0;
    float _2277 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2281 = sqrt(_2265);
    float _2283 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2285 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2287 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2289 = -_2269;
    float _2291 = fma(_1311, _2289, _1361);
    float _2293 = fma(_1571, _2275, _1631);
    float _2295 = _2277 * _2135;
    float _2297 = _2279 * _2249;
    float _2299 = _2283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2301 = _2285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2303 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2305 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2271);
    out.m_68.x = _871;
    out.m_68.y = _873;
    out.m_68.z = _875;
    out.m_68.w = _877;
    out.m_70.x = _2291;
    out.m_70.y = _2293;
    out.m_70.z = _2295;
    out.m_70.w = _2297;
    bool _2307 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2309 = isnan(_2281);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2315 = _2311 || _2313;
    out.m_72.x = _2299;
    out.m_72.y = _2301;
    out.m_72.z = _2303;
    out.m_74.x = _2305;
    float _2317 = _2259;
    float _2319 = _2303;
    float _2321 = _2243;
    if (!_2315)
    {
        _2317 = 1.0;
    }
    float _2323 = _2317;
    bool _2325 = !_2315;
    float _2327 = _2323;
    if (!_2325)
    {
        bool _2329 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2331 = isnan(_2281);
        bool _2333 = _2329 || _2331;
        bool _2335 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2337 = _2333 || _2335;
        if (!_2337)
        {
            float _2339 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2341 = _2281 + _2339;
            float _2343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2345 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2343;
            float _2347 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2351 = 1.0 / _2345;
            float _2353 = _2341 * _2351;
            float _2355 = fma(_2353, _2349, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2327 = _2355;
            _2357 = true;
        }
        else
        {
            bool _2359 = _2281 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2361 = isnan(_2281);
            bool _2363 = _2359 || _2361;
            bool _2365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2367 = _2363 || _2365;
            if (!_2367)
            {
                float _2369 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2371 = _2281 + _2369;
                float _2373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2375 = _2373 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2377 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2379 = _2377 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2381 = 1.0 / _2375;
                float _2383 = _2371 * _2381;
                float _2385 = fma(_2383, _2379, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2327 = _2385;
                _2357 = true;
            }
            else
            {
                _2327 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2357 = false;
    float _2387 = _2327;
    float _2389 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2391 = _2233 + _2389;
    float _2393 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2395 = _2239 + _2393;
    float _2397 = fma(_2391, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2399 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2401 = _2241 + _2399;
    float _2403 = fma(_2395, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2405 = -_1519;
    float _2407 = _2405 + _2397;
    float _2409 = fma(_2401, _2387, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2411 = -_1487;
    float _2413 = _2411 + _2403;
    float _2415 = _2407 * _2407;
    float _2417 = -_1495;
    float _2419 = _2417 + _2409;
    float _2421 = fma(_2413, _2413, _2415);
    float _2423 = fma(_2419, _2419, _2421);
    float _2425 = sqrt(_2423);
    bool _2427 = _2425 > 0.0;
    bool _2429 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(0.5);
    bool _2437 = _2433 || _2435;
    bool _2439 = !_2427;
    float _2441 = _2403;
    float _2443 = _2397;
    float _2445 = _2409;
    float _2447 = _2407;
    if (!_2439)
    {
        float _2449 = _297 * _297;
        float _2451 = fma(_295, _295, _2449);
        float _2453 = fma(_287, _287, _2451);
        float _2455 = rsqrt(_2423);
        float _2457 = sqrt(_2453);
        float _2459 = _2413 * _2455;
        float _2461 = _2407 * _2455;
        float _2463 = _2419 * _2455;
        bool _2465 = _2457 > 0.0;
        bool _2467 = !_2465;
        _2319 = _2459;
        if (!_2467)
        {
            float _2469 = rsqrt(_2453);
            float _2471 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2473 = _297 * _2469;
            float _2475 = _295 * _2469;
            float _2477 = _287 * _2469;
            float _2479 = _2461 * _2473;
            float _2481 = fma(_2459, _2475, _2479);
            float _2483 = _2471 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2485 = fma(_2463, _2477, _2481);
            float _2487 = _2485 * _2483;
            float _2489 = fma(_295, _2487, _2403);
            float _2491 = fma(_297, _2487, _2397);
            float _2493 = fma(_287, _2487, _2409);
            _2441 = _2489;
            _2443 = _2491;
            _2445 = _2493;
            _2447 = _2483;
        }
    }
    float _2495 = _2441;
    float _2497 = _2443;
    float _2499 = _2445;
    float _2501 = _2447;
    float _2503 = _2319;
    float _2505 = _2497;
    float _2507 = _2495;
    float _2509 = _2499;
    float _2511 = _2501;
    float _2513 = _2503;
    if (!_2437)
    {
        float _2515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2517 = _1519 + _2515;
        float _2519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2521 = _1487 + _2519;
        float _2523 = _2517 * _2517;
        float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2527 = _1495 + _2525;
        float _2529 = fma(_2521, _2521, _2523);
        float _2531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2533 = fma(_2527, _2527, _2529);
        float _2535 = -_1487;
        float _2537 = _2535 + _2495;
        float _2539 = sqrt(_2533);
        float _2541 = precise::min(_2539, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2543 = _2541 * _2531;
        float _2545 = -_1519;
        float _2547 = _2545 + _2497;
        float _2549 = -_1495;
        float _2551 = _2549 + _2499;
        float _2553 = fma(_2537, _2543, _1487);
        float _2555 = fma(_2547, _2543, _1519);
        float _2557 = fma(_2551, _2543, _1495);
        _2505 = _2555;
        _2507 = _2553;
        _2509 = _2557;
    }
    float _2559 = _2505;
    float _2561 = _2507;
    float _2563 = _2509;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2567 = _2559 + _2565;
    float _2569 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2571 = _2561 + _2569;
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2575 = _2563 + _2573;
    float _2577 = _2567 * _2567;
    float _2579 = fma(_2571, _2571, _2577);
    float _2581 = fma(_2575, _2575, _2579);
    float _2583 = rsqrt(_2581);
    float _2585 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2587 = _2571 * _2585;
    float _2589 = _2575 * _2585;
    float _2591 = _2587 * _2587;
    float _2593 = _2589 * _2589;
    float _2595 = _2591 + _2593;
    float _2597 = sqrt(_2595);
    bool _2599 = _2597 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2603 = _2597 + _2601;
    float _2605 = _2583;
    float _2607 = _2595;
    float _2609 = _2603;
    float _2611 = _2567;
    if (_2599)
    {
        float _2613 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2605 = _2613;
    }
    float _2615 = _2605;
    if (_2599)
    {
        float _2617 = rsqrt(_2595);
        _2607 = _2617;
    }
    float _2619 = _2607;
    float _2621 = _2619;
    if (_2599)
    {
        float _2623 = _2603 * _2615;
        _2609 = _2623;
    }
    float _2625 = _2609;
    if (_2599)
    {
        float _2627 = _2625 * 0.15915493667125701904296875;
        _2511 = _2627;
    }
    float _2629 = _2511;
    float _2631 = _2575;
    if (_2599)
    {
        float _2633 = _2629 * 6.283185482025146484375;
        float _2635 = sin(_2633);
        _2631 = _2635;
    }
    float _2637 = _2631;
    float _2639 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2641 = precise::max(0.0, _2639);
    float _2643 = _2615;
    float _2645 = _2641;
    if (_2599)
    {
        float _2647 = _2629 * 6.283185482025146484375;
        float _2649 = cos(_2647);
        _2643 = _2649;
    }
    float _2651 = _2643;
    float _2653 = -_2585;
    float _2655 = -_2641;
    float _2657 = fma(_2567, _2653, _2655);
    if (_2599)
    {
        float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2611 = _2659;
    }
    float _2661 = _2611;
    float _2663 = sqrt(_2581);
    float _2665 = _2661;
    float _2667 = _2637;
    if (_2599)
    {
        float _2669 = fma(_2637, _2661, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2669;
    }
    float _2671 = _2665;
    float _2673 = _2671;
    if (!_2599)
    {
        _2667 = _2587;
    }
    float _2675 = _2667;
    float _2677 = _2675;
    float _2679 = _2651;
    if (_2599)
    {
        float _2681 = _2651 + (-1.0);
        _2645 = _2681;
    }
    float _2683 = _2645;
    float _2685 = _2683;
    if (_2599)
    {
        float _2687 = _2619 * _2671;
        _2321 = _2687;
    }
    float _2689 = _2321;
    if (!_2599)
    {
        _2673 = _2657;
    }
    float _2691 = _2673;
    float _2693 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2695 = _2691;
    if (_2599)
    {
        float _2697 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2697;
    }
    float _2699 = _2513;
    if (_2599)
    {
        float _2701 = _2587 * _2689;
        _2677 = _2701;
    }
    float _2703 = _2677;
    if (!_2599)
    {
        _2685 = _2589;
    }
    float _2705 = _2685;
    float _2707 = _2705;
    if (_2599)
    {
        float _2709 = _2589 * _2689;
        _2707 = _2709;
    }
    float _2711 = _2707;
    if (!_2599)
    {
        _2621 = _2591;
    }
    float _2713 = _2621;
    float _2715 = _2713;
    if (_2599)
    {
        float _2717 = fma(_2657, _2651, _2699);
        _2695 = _2717;
    }
    float _2719 = _2695;
    if (_2599)
    {
        float _2721 = _2703 * _2703;
        _2715 = _2721;
    }
    float _2723 = _2715;
    if (!_2599)
    {
        _2679 = _2593;
    }
    float _2725 = _2679;
    float _2727 = _2725;
    if (_2599)
    {
        float _2729 = _2711 * _2711;
        _2727 = _2729;
    }
    float _2731 = _2727;
    float _2733 = fma(_2719, _2719, _2723);
    float _2735 = _2733 + _2731;
    float _2737 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2741 = fma(_2663, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2739);
    float _2743 = precise::clamp(_2741, 0.0, 1.0);
    float _2745 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2749 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2737);
    float _2751 = rsqrt(_2735);
    float _2753 = -_2743;
    float _2755 = _2753 + 1.0;
    float _2757 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2759 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2749);
    float _2761 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2745);
    float _2763 = _2759 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2765 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2757);
    float _2767 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2761);
    float _2769 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2693);
    float _2771 = abs(_2755);
    float _2773 = log2(_2771);
    float _2775 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2777 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2765);
    float _2779 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2781 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2769);
    float _2783 = _2751 * _2703;
    float _2785 = -_2775;
    float _2787 = fma(_2785, _2747, 1.0);
    float _2789 = _2777 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2791 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2793 = _2751 * _2719;
    float _2795 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2797 = _2751 * _2711;
    float _2799 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2791);
    float _2801 = _2781 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2803 = -_2795;
    float _2805 = fma(_2793, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2803);
    float _2807 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2809 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2799);
    float _2811 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2813 = -_2797;
    float _2815 = fma(_2813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2805);
    float _2817 = log2(_2787);
    float _2819 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2809);
    float _2821 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2823 = fma(_2815, -0.5, 0.5);
    float _2825 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2807);
    float _2827 = fma(_2815, 0.5, 0.5);
    float _2829 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2821);
    float _2831 = _2793 + 1.0;
    float _2833 = exp2(_2811);
    float _2835 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2825);
    float _2837 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2829);
    float _2839 = fma(_2827, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2841 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2835);
    float _2843 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2837);
    float _2845 = fma(_2827, _2839, -0.212114393711090087890625);
    float _2847 = 1.0 / _2819;
    float _2849 = _2817 * 0.693147182464599609375;
    float _2851 = fma(_2827, _2845, 1.570728778839111328125);
    float _2853 = sqrt(_2823);
    float _2855 = -_2793;
    float _2857 = fma(_2833, _2831, _2855);
    float _2859 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2861 = fma(_2857, 0.5, 0.5);
    float _2863 = _2841 * _2847;
    float _2865 = _2843 * _2847;
    float _2867 = fma(_2863, 0.5, 0.5);
    float _2869 = fma(_2865, -0.5, 0.5);
    float _2871 = _2853 * 0.636619746685028076171875;
    float3 _7353 = float3(_2867, _2869, _2859);
    float _2873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7353, float3(0.0), isnan(_7353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7353, float3(0.0), isnan(_7353)), level(0.0)).x;
    float _2875 = -_2851;
    float _2877 = fma(_2871, _2875, 1.0);
    float3 _7369 = float3(_2867, _2869, _2859);
    float4 _2880 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7369, float3(0.0), isnan(_7369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7369, float3(0.0), isnan(_7369)), level(0.0)).xyzw;
    float _2882 = _2880.x;
    float _2884 = _2880.y;
    float _2886 = _2880.z;
    float _2888 = _2880.w;
    float2 _7386 = float2(_2877, _2861);
    float3 _2892 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7386, float2(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7386, float2(0.0), isnan(_7386)), level(0.0)).xyz;
    float _2894 = _2892.x;
    float _2896 = _2892.y;
    float _2898 = _2892.z;
    float _2900 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2902 = _2779 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2904 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2902);
    float _2906 = exp2(_2900);
    float _2908 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2904);
    float _2910 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2908);
    float _2912 = _2910 + _2819;
    out.gl_Position.x = _2841;
    out.gl_Position.y = _2843;
    out.gl_Position.z = _2910;
    out.gl_Position.w = _2819;
    float _2914 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2916 = _2912 * 0.5;
    float _2918 = -_2906;
    float _2920 = _2918 + 1.0;
    out.m_47.x = _2914;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.z = _2916;
    out.m_76.w = _2819;
    float _2924 = -_2922;
    float _2926 = _2924 + 1.0;
    float _2928 = _2922 * _2873;
    float _2930 = _2888 * _2928;
    float _2932 = _2898 * _2928;
    float _2934 = fma(_2894, _2930, _2882);
    float _2936 = fma(_2896, _2930, _2884);
    float _2938 = _2888 * _2926;
    float _2940 = fma(_2888, _2932, _2886);
    out.m_78.x = _2934;
    out.m_78.y = _2936;
    out.m_78.z = _2940;
    out.m_78.w = _2938;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

