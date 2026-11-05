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
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1213 = false;
    bool _287 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_103);
        out.gl_Position.z = _1907;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1977 = as_type<float>(_141);
        out.gl_Position.z = _1977;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_51.w;
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = 0.0;
    float _171 = _145;
    if (!_155)
    {
        float _173 = _145 * _145;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_155)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_155;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _145 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _145);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_155;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _145 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _171 = _241;
    }
    float _243 = _171;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _157, _247);
    float _255 = fma(_243, _159, _249);
    float _257 = fma(_243, _161, _251);
    float _259 = fma(_253, _143, _163);
    float _261 = fma(_255, _143, _165);
    float _263 = fma(_257, _143, _167);
    bool _265 = !_245;
    float _267 = _259;
    float _285;
    if (!_265)
    {
        float _269 = in.m_53.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_87);
        float _291 = 1.0 / _289;
        float _293 = _121 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_53.z;
    float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _301 = log2(_299);
    float _303 = in.m_53.x;
    float _305 = in.m_53.y;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = 1.0 / _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _325;
    float _329 = _301 * _121;
    float _331 = 1.0 / _317;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _295 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = 1.0 / _323;
    float _347 = _335 * _319;
    float _349 = _303 * 2.0;
    bool _351 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(1.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _295 + _365;
    float _369 = 1.0 / _327;
    float _371 = _367 * _331;
    float _373 = _305 * 2.0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _381 = _379 != 0;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _385 = _383 != 0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _295 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _295 + _391;
    float _395 = exp2(_329);
    float _397 = _297 * 2.0;
    float _399 = _389 * _345;
    float _401 = _305 + _297;
    bool _403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _411 = _407 || _409;
    float _413 = fma(_339, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = _401 + (-1.0);
    float _417 = 1.0 / _313;
    bool _419 = !_377;
    int _421 = _419 ? 0 : 1;
    float _423 = fma(_343, _399, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _427 = _297 + _303;
    int _429 = abs(_421);
    float _431 = _297 + (-0.5);
    bool _433 = !_381;
    int _435 = _433 ? 0 : 1;
    float _437 = floor(_397);
    float _439 = -_395;
    float _441 = _439 + 1.0;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _445 = _295 + _443;
    float _447 = _427 + (-1.0);
    int _449 = abs(_435);
    float _451 = _445 * _369;
    float _453 = 1.0 / _363;
    float _455 = _393 * _417;
    float _457 = _305 + _303;
    float _459 = float(_429);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _457 + (-1.0);
    float _471 = floor(_349);
    bool _473 = _437 >= 0.0;
    bool _475 = isnan(_437);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _485 = fma(_463, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = fma(_467, _399, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _489 = _481 ? 0 : 1;
    bool _491 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _493 = isnan(_295);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = floor(_373);
    float _505 = _411 ? _441 : 0.0;
    float _507 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _509 = _437 > 0.0;
    float _511 = _305;
    if (_359)
    {
        float _513 = _505 * _453;
        _123 = _513;
    }
    float _515 = _123;
    bool _517 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _519 = isnan(_295);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    bool _529 = _471 >= 0.0;
    bool _531 = isnan(_471);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _539;
    bool _543 = _471 > 0.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _549 = _537 ? 0 : 1;
    float _551 = -_527;
    float _553 = _551 + 1.0;
    int _555 = ~_489;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_541, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _563 = _503 > 0.0;
    float _565 = fma(_547, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _567 = _503 >= 0.0;
    bool _569 = isnan(_503);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    int _577 = _559;
    if (!_509)
    {
        int _579 = ~_489;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    bool _585 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _587 = isnan(_295);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _605 = ~_549;
    int _607 = _605 + 1;
    int _609 = _607 + 1;
    float _611 = fma(_599, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _613 = fma(_603, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _615 = _609;
    if (!_543)
    {
        int _617 = ~_549;
        int _619 = _617 + 1;
        _615 = _619;
    }
    int _621 = _615;
    float _623 = _595 * _553;
    bool _625 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _627 = isnan(_295);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -_595;
    float _639 = _637 + 1.0;
    bool _641 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_295);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = in.m_55.x;
    float _655 = in.m_55.y;
    float _657 = in.m_55.z;
    float _659 = float(_583);
    float _661 = -_635;
    float _663 = _661 + 1.0;
    float _665 = _635 * _639;
    bool _667 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _669 = isnan(_295);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _501 * _663;
    float _681 = -_501;
    float _683 = _681 + 1.0;
    float _685 = _459 * _659;
    float _687 = float(_621);
    float _689 = _677 * _683;
    float _691 = -_677;
    float _693 = _691 + 1.0;
    float _695 = _685 * (-2.0);
    int _697 = _575 ? 0 : 1;
    float _699 = _651 * _693;
    float _701 = float(_449);
    float _703 = fma(_483, _695, _483);
    int _705 = ~_697;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = _413 * _699;
    float _713 = _485 * _699;
    float _715 = _701 * _687;
    float _717 = _303 + (-0.5);
    float _719 = fma(_695, _653, _653);
    bool _721 = !_385;
    int _723 = _721 ? 0 : 1;
    float _725 = -_651;
    float _727 = _725 + 1.0;
    int _729 = _709;
    if (!_563)
    {
        int _731 = ~_697;
        int _733 = _731 + 1;
        _729 = _733;
    }
    int _735 = _729;
    float _737 = _715 * (-2.0);
    float _739 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].x, _719);
    int _741 = abs(_723);
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].y, _713);
    float _745 = fma(_737, _655, _655);
    float _747 = fma(_703, _515, _739);
    float _749 = _305 + (-0.5);
    float _751 = float(_735);
    float _753 = _747 * 0.15915493667125701904296875;
    float _755 = float(_741);
    float _757 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _759 = fma(_487, _689, _743);
    float _761 = as_type<float>(int(gl_VertexIndex));
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _765 = _755 * _751;
    float _767 = fma(_423, _689, _757);
    float _769 = fma(_425, _737, _425);
    float _771 = _765 * (-2.0);
    float _773 = fma(_561, _679, _767);
    float _775 = in.m_51.x;
    float _777 = in.m_51.y;
    float _779 = fma(_771, _657, _657);
    float _781 = fma(_507, _771, _507);
    float _783 = fma(_611, _679, _759);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _785;
    float _789 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[196].z, _779);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _791;
    float _795 = fma(_769, _515, _763);
    float _797 = fma(_613, _665, _783);
    float _799 = fma(_781, _515, _789);
    float _801 = fma(_793, _451, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _803 = fma(_787, _451, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _805 = _795 * 0.15915493667125701904296875;
    float _807 = fma(_565, _665, _773);
    float _809 = _799 * 0.15915493667125701904296875;
    float _811 = fma(_803, _623, _797);
    float _813 = _753 * 6.283185482025146484375;
    float _815 = sin(_813);
    int _817 = as_type<int>(_761) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>(_761) & 2;
    bool _823 = _821 != 0;
    float _825 = fma(_801, _623, _807);
    float _827 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[148].y, _811);
    float _829 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[148].x, _825);
    bool _831 = !_823;
    float _833 = _831 ? (-0.5) : 0.5;
    float _835 = _753 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = _827 * _777;
    bool _841 = !_819;
    float _843 = _841 ? (-0.5) : 0.5;
    float _845 = _829 * _775;
    float _847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _833);
    float _849 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _851 = _303 > 0.5;
    float _853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _843);
    float _855 = _805 * 6.283185482025146484375;
    float _857 = sin(_855);
    float _859 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _849 * _847;
    float _863 = _859 * _853;
    float _865 = _805 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _809 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _837 * _857;
    float _875 = _815 * _857;
    float _877 = _809 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _815 * _867;
    float _883 = _837 * _867;
    float _885 = _871 * _861;
    float _887 = _857 * _871;
    float _889 = _867 * _871;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _893 = _837 * _885;
    float _895 = _815 * _885;
    float _897 = -_873;
    float _899 = fma(_879, _881, _897);
    float _901 = -_881;
    float _903 = fma(_879, _873, _901);
    float _905 = fma(_879, _883, _875);
    float _907 = -_861;
    float _909 = _879 * _907;
    float _911 = fma(_879, _875, _883);
    float _913 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _915 = fma(_905, _863, _893);
    float _917 = fma(_889, _863, _909);
    float _919 = fma(_899, _863, _895);
    float _921 = fma(_903, _913, _915);
    float _923 = fma(_887, _913, _917);
    float _925 = fma(_911, _913, _919);
    float _927 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _929 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _931 = _921 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _933 = _921 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _927);
    float _937 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _929);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _931);
    float _941 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _943 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _935);
    float _945 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _937);
    float _947 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].z, _939);
    float _949 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _951 = _943 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _953 = _945 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _955 = _947 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _959 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _921 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = _951 + _955;
    float _965 = _953 + _957;
    float _967 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _969 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _973 = _963 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _977 = _965 + _975;
    float _979 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _967);
    float _981 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].z, _969);
    float _983 = _973 * _973;
    float _985 = _977 * _977;
    float _987 = _979 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _989 = _981 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _991 = _983 + _985;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _995 = _993 != 0;
    float _997 = -_843;
    float _999 = _851 ? _997 : _843;
    float _1001 = sqrt(_991);
    float _1003 = _987 + _989;
    bool _1005 = _305 > 0.5;
    bool _1007 = !_995;
    float _1009 = _1007 ? _843 : _999;
    bool _1011 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1013 = _999;
    float _1015 = _925;
    float _1017 = _967;
    float _1019 = _987;
    if (!_1011)
    {
        _1013 = _985;
    }
    float _1021 = _1013;
    float _1023 = _1021;
    if (!_1011)
    {
        _1015 = _983;
    }
    float _1025 = _1015;
    float _1027 = _1025;
    if (!_1011)
    {
        _267 = _963;
    }
    float _1029 = _267;
    float _1031 = _1029;
    if (!_1011)
    {
        _511 = _965;
    }
    float _1033 = _511;
    float _1035 = _1033;
    if (!_1011)
    {
        _1017 = _1003;
    }
    float _1037 = _1017;
    bool _1039 = !_1011;
    float _1041 = _1037;
    if (!_1039)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1047 = _1001 + _1045;
        float _1049 = rsqrt(_991);
        float _1051 = _1047 * _1043;
        float _1053 = _1003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = _1051 * 0.15915493667125701904296875;
        float _1057 = _1055 * 6.283185482025146484375;
        float _1059 = sin(_1057);
        float _1061 = _1055 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = fma(_1059, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1067 = _1049 * _1065;
        float _1069 = _1063 + (-1.0);
        float _1071 = fma(_973, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1073 = fma(_977, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1075 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1079 = _1071 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1083 = _1073 + _1081;
        float _1085 = fma(_1003, _1063, _1075);
        float _1087 = _1079 * _1079;
        float _1089 = _1083 * _1083;
        _1041 = _1085;
        _1027 = _1087;
        _1023 = _1089;
        _1035 = _1073;
        _1031 = _1071;
    }
    float _1091 = _1041;
    float _1093 = _1027;
    float _1095 = _1023;
    float _1097 = _1035;
    float _1099 = _1031;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1103 = _1091 + _1101;
    float _1105 = _1009 + 0.5;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1113 = -_833;
    int _1115 = _1005 ? as_type<int>(_1113) : as_type<int>(_833);
    float _1117 = fma(_1103, _1103, _1093);
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1121 = !_1109;
    float _1123 = _1121 ? _833 : as_type<float>(_1115);
    float _1125 = _1117 + _1095;
    float _1127 = _1119 * _891;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1131 = -_1123;
    float _1133 = _1131 + 0.5;
    float _1135 = sqrt(_1125);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1147 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1147 * _1111;
    out.m_60.x = _1151;
    out.m_60.y = _1153;
    out.m_60.z = _1155;
    out.m_60.w = _1149;
    bool _1165 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1167 = isnan(_1135);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1173 = _1169 || _1171;
    out.m_62.x = _1157;
    out.m_62.y = _1159;
    out.m_62.z = _1161;
    out.m_64.x = _1127;
    out.m_64.y = _1163;
    float _1175 = _1129;
    float _1177 = _1161;
    if (!_1173)
    {
        _1175 = 1.0;
    }
    float _1179 = _1175;
    bool _1181 = !_1173;
    float _1183 = _1179;
    if (!_1181)
    {
        bool _1185 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1187 = isnan(_1135);
        bool _1189 = _1185 || _1187;
        bool _1191 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1193 = _1189 || _1191;
        if (!_1193)
        {
            float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1197 = _1135 + _1195;
            float _1199 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1201 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1199;
            float _1203 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1205 = _1203 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1207 = 1.0 / _1201;
            float _1209 = _1197 * _1207;
            float _1211 = fma(_1209, _1205, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1183 = _1211;
            _1213 = true;
        }
        else
        {
            bool _1215 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1217 = isnan(_1135);
            bool _1219 = _1215 || _1217;
            bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1223 = _1219 || _1221;
            if (!_1223)
            {
                float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1227 = _1135 + _1225;
                float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1235 = _1233 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1237 = 1.0 / _1231;
                float _1239 = _1227 * _1237;
                float _1241 = fma(_1239, _1235, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1183 = _1241;
                _1213 = true;
            }
            else
            {
                _1183 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1213 = false;
    float _1243 = _1183;
    float _1245 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1249 = _1091 + _1247;
    float _1251 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1245);
    float _1253 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1255 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _1097 + _1265;
    float _1269 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    bool _1271 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.5);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1253);
    float _1283 = fma(_1249, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1285 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1289 = _1099 + _1287;
    float _1291 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1281);
    float _1293 = fma(_1267, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1295 = 1.0 / _1285;
    float _1297 = fma(_1289, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1299 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1301 = _1253;
    float _1303 = _1289;
    float _1305 = _1299;
    float _1307 = _1243;
    if (_1263)
    {
        _1301 = _1293;
    }
    float _1309 = _1301;
    float _1311 = _1299 + _1285;
    float _1313 = _1309;
    if (_1263)
    {
        _1303 = _1297;
    }
    float _1315 = _1303;
    float _1317 = _1315;
    if (_1263)
    {
        _1305 = _1283;
    }
    float _1319 = _1305;
    float _1321 = _1319;
    float _1323 = _1295;
    if (!_1263)
    {
        float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1327 = _987 + _1325;
        float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1331 = _951 + _1329;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1335 = _1327 * _1327;
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1339 = _953 + _1337;
        float _1341 = fma(_1331, _1331, _1335);
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1345 = fma(_1339, _1339, _1341);
        float _1347 = sqrt(_1345);
        float _1349 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1351 = -_953;
        float _1353 = _1351 + _1293;
        float _1355 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1343;
        float _1359 = -_951;
        float _1361 = _1359 + _1297;
        float _1363 = -_987;
        float _1365 = _1363 + _1283;
        float _1367 = _1349 * _1357;
        float _1369 = fma(_1361, _1367, _951);
        float _1371 = fma(_1365, _1367, _987);
        float _1373 = fma(_1353, _1367, _953);
        _1321 = _1371;
        _1317 = _1369;
        _1313 = _1373;
    }
    float _1375 = _1321;
    float _1377 = _1317;
    float _1379 = _1313;
    if (_1279)
    {
        _1019 = 1.0;
    }
    float _1381 = _1019;
    float _1383 = _1311 * _1295;
    float _1385 = _1383 * 0.5;
    float _1387 = _1381;
    if (!_1279)
    {
        float _1389 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1393 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
        float _1395 = _1389 * 0.15915493667125701904296875;
        float _1397 = _1395 * 6.283185482025146484375;
        float _1399 = cos(_1397);
        float _1401 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1403 = _1401 * 0.15915493667125701904296875;
        float _1405 = _1395 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = 1.0 / _1399;
        float _1411 = _1403 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        float _1415 = _1407 * _1409;
        float _1417 = 1.0 / _1393;
        float _1419 = _1413 * _1415;
        float _1421 = _1403 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1427 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1425;
        float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1431 = _1417 * _1429;
        float _1433 = 1.0 / _1419;
        float _1435 = 1.0 / _1427;
        float _1437 = _1423 * _1433;
        float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1441 = fma(_1437, _1431, _1439);
        float _1443 = _1441 * _1435;
        float _1445 = precise::clamp(_1443, 0.0, 1.0);
        _1323 = _1395;
        _1307 = _1403;
        _1387 = _1445;
    }
    float _1447 = _1323;
    float _1449 = _1307;
    float _1451 = _1387;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1455 = _1375 + _1453;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1459 = _1377 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1463 = _1379 + _1461;
    float _1465 = _1455 * _1455;
    float _1467 = fma(_1459, _1459, _1465);
    float _1469 = fma(_1463, _1463, _1467);
    float _1471 = rsqrt(_1469);
    float _1473 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1475 = _1459 * _1473;
    float _1477 = _1463 * _1473;
    float _1479 = _1475 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 + _1481;
    float _1485 = sqrt(_1483);
    bool _1487 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = _1485 + _1489;
    float _1493 = _1471;
    float _1495 = _1491;
    float _1497 = _1447;
    float _1499 = _1455;
    float _1501 = _1475;
    if (_1487)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1503;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (_1487)
    {
        float _1509 = _1491 * _1505;
        _1495 = _1509;
    }
    float _1511 = _1495;
    if (_1487)
    {
        float _1513 = rsqrt(_1483);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (_1487)
    {
        float _1519 = _1511 * 0.15915493667125701904296875;
        _1497 = _1519;
    }
    float _1521 = _1497;
    float _1523 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1525 = _1463;
    if (_1487)
    {
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = precise::max(0.0, _1523);
    float _1535 = _1449;
    float _1537 = _1533;
    if (_1487)
    {
        float _1539 = _1521 * 6.283185482025146484375;
        float _1541 = cos(_1539);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = -_1473;
    float _1547 = -_1533;
    float _1549 = fma(_1455, _1545, _1547);
    if (_1487)
    {
        float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1551;
    }
    float _1553 = _1499;
    float _1555 = sqrt(_1469);
    float _1557 = _1531;
    float _1559 = _1553;
    if (_1487)
    {
        float _1561 = fma(_1531, _1553, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1563;
    if (_1487)
    {
        float _1567 = _1515 * _1563;
        _1177 = _1567;
    }
    float _1569 = _1177;
    if (!_1487)
    {
        _1517 = _1549;
    }
    float _1571 = _1517;
    float _1573 = _1571;
    if (_1487)
    {
        float _1575 = _1543 + (-1.0);
        _1537 = _1575;
    }
    float _1577 = _1537;
    float _1579 = _1577;
    if (_1487)
    {
        float _1581 = _1475 * _1569;
        _1501 = _1581;
    }
    float _1583 = _1501;
    if (!_1487)
    {
        _1565 = _1477;
    }
    float _1585 = _1565;
    float _1587 = _1585;
    if (_1487)
    {
        float _1589 = _1477 * _1569;
        _1587 = _1589;
    }
    float _1591 = _1587;
    if (_1487)
    {
        float _1593 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1559 = _1593;
    }
    float _1595 = _1559;
    float _1597 = _1595;
    if (!_1487)
    {
        _1579 = _1479;
    }
    float _1599 = _1579;
    float _1601 = _1599;
    if (_1487)
    {
        float _1603 = _1583 * _1583;
        _1601 = _1603;
    }
    float _1605 = _1601;
    if (_1487)
    {
        float _1607 = fma(_1549, _1543, _1595);
        _1573 = _1607;
    }
    float _1609 = _1573;
    if (!_1487)
    {
        _1597 = _1481;
    }
    float _1611 = _1597;
    float _1613 = _1611;
    if (_1487)
    {
        float _1615 = _1591 * _1591;
        _1613 = _1615;
    }
    float _1617 = _1613;
    float _1619 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1621 = fma(_1609, _1609, _1605);
    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1625 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1623);
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = _1621 + _1617;
    float _1631 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1633 = -_1627;
    float _1635 = _1633 + 1.0;
    float _1637 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1631);
    float _1643 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = rsqrt(_1629);
    float _1647 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1619);
    float _1649 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1651 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1653 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1637);
    float _1655 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1647);
    float _1657 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1659 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1651);
    float _1661 = abs(_1635);
    float _1663 = log2(_1661);
    float _1665 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1669 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1671 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = -_1667;
    float _1675 = fma(_1673, _1639, 1.0);
    float _1677 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1681 = _1645 * _1583;
    float _1683 = _1645 * _1609;
    float _1685 = _1645 * _1591;
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1679);
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1691 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1693 = log2(_1675);
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1697 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    float _1699 = -_1689;
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1699);
    float _1703 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1705 = -_1685;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1701);
    float _1709 = exp2(_1695);
    float _1711 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1713 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1691);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1711);
    float _1721 = _1683 + 1.0;
    float _1723 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1713);
    float _1725 = 1.0 / _1703;
    float _1727 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1729 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1719);
    float _1731 = _1693 * 0.693147182464599609375;
    float _1733 = fma(_1717, _1727, -0.212114393711090087890625);
    float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = sqrt(_1715);
    float _1739 = -_1683;
    float _1741 = fma(_1709, _1721, _1739);
    float _1743 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1723);
    float _1745 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1729);
    float _1747 = fma(_1717, _1733, 1.570728778839111328125);
    float _1749 = fma(_1741, 0.5, 0.5);
    float _1751 = _1743 * _1725;
    float _1753 = _1745 * _1725;
    float _1755 = fma(_1751, 0.5, 0.5);
    float _1757 = fma(_1753, -0.5, 0.5);
    float _1759 = _1737 * 0.636619746685028076171875;
    float3 _4533 = float3(_1755, _1757, _1735);
    float _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4533, float3(0.0), isnan(_4533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4533, float3(0.0), isnan(_4533)), level(0.0)).x;
    float _1763 = -_1747;
    float _1765 = fma(_1759, _1763, 1.0);
    float3 _4549 = float3(_1755, _1757, _1735);
    float4 _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4549, float3(0.0), isnan(_4549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4549, float3(0.0), isnan(_4549)), level(0.0)).xyzw;
    float _1770 = _1768.x;
    float _1772 = _1768.y;
    float _1774 = _1768.z;
    float _1776 = _1768.w;
    float2 _4566 = float2(_1765, _1749);
    float3 _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4566, float2(0.0), isnan(_4566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4566, float2(0.0), isnan(_4566)), level(0.0)).xyz;
    float _1782 = _1780.x;
    float _1784 = _1780.y;
    float _1786 = _1780.z;
    float _1788 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1790 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1792 = _1451 > 0.0;
    bool _1794 = isnan(_1451);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(0.0);
    bool _1800 = _1796 || _1798;
    float _1802 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1804 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1790);
    float _1806 = exp2(_1788);
    float _1808 = _1743 + _1703;
    float _1810 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1804);
    float _1812 = _1703 * 0.5;
    float _1814 = _1808 * 0.5;
    float _1816 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1810);
    float _1818 = fma(_1745, -0.5, _1812);
    float _1820 = _1816 + _1703;
    out.gl_Position.x = _1743;
    out.gl_Position.y = _1745;
    out.gl_Position.z = _1816;
    out.gl_Position.w = _1703;
    float _1822 = _1820 * 0.5;
    float _1824 = -_1806;
    float _1826 = _1824 + 1.0;
    float _1828 = _1802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1830 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _1814;
    out.m_66.y = _1818;
    out.m_66.z = _1822;
    out.m_66.w = _1703;
    out.m_47.x = _1828;
    float _1832 = _1830 * _1761;
    float _1834 = -_1830;
    float _1836 = _1834 + 1.0;
    float _1838 = _1776 * _1832;
    float _1840 = _1786 * _1832;
    float _1842 = fma(_1782, _1838, _1770);
    float _1844 = fma(_1784, _1838, _1772);
    float _1846 = _1776 * _1836;
    float _1848 = fma(_1776, _1840, _1774);
    out.m_68.x = _1842;
    out.m_68.y = _1844;
    out.m_68.z = _1848;
    out.m_68.w = _1846;
    if (_1800)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1850 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1850;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1213 = false;
    bool _287 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_103);
        out.gl_Position.z = _1907;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1977 = as_type<float>(_141);
        out.gl_Position.z = _1977;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_51.w;
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = 0.0;
    float _171 = _145;
    if (!_155)
    {
        float _173 = _145 * _145;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_155)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_155;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _145 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _145);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_155;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _145 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _171 = _241;
    }
    float _243 = _171;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _157, _247);
    float _255 = fma(_243, _159, _249);
    float _257 = fma(_243, _161, _251);
    float _259 = fma(_253, _143, _163);
    float _261 = fma(_255, _143, _165);
    float _263 = fma(_257, _143, _167);
    bool _265 = !_245;
    float _267 = _259;
    float _285;
    if (!_265)
    {
        float _269 = in.m_53.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_87);
        float _291 = 1.0 / _289;
        float _293 = _121 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_53.z;
    float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _301 = log2(_299);
    float _303 = in.m_53.x;
    float _305 = in.m_53.y;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = 1.0 / _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _325;
    float _329 = _301 * _121;
    float _331 = 1.0 / _317;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _295 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = 1.0 / _323;
    float _347 = _335 * _319;
    float _349 = _303 * 2.0;
    bool _351 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(1.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _295 + _365;
    float _369 = 1.0 / _327;
    float _371 = _367 * _331;
    float _373 = _305 * 2.0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _381 = _379 != 0;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _385 = _383 != 0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _295 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _295 + _391;
    float _395 = exp2(_329);
    float _397 = _297 * 2.0;
    float _399 = _389 * _345;
    float _401 = _305 + _297;
    bool _403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _411 = _407 || _409;
    float _413 = fma(_339, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = _401 + (-1.0);
    float _417 = 1.0 / _313;
    bool _419 = !_377;
    int _421 = _419 ? 0 : 1;
    float _423 = fma(_343, _399, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _427 = _297 + _303;
    int _429 = abs(_421);
    float _431 = _297 + (-0.5);
    bool _433 = !_381;
    int _435 = _433 ? 0 : 1;
    float _437 = floor(_397);
    float _439 = -_395;
    float _441 = _439 + 1.0;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _445 = _295 + _443;
    float _447 = _427 + (-1.0);
    int _449 = abs(_435);
    float _451 = _445 * _369;
    float _453 = 1.0 / _363;
    float _455 = _393 * _417;
    float _457 = _305 + _303;
    float _459 = float(_429);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _457 + (-1.0);
    float _471 = floor(_349);
    bool _473 = _437 >= 0.0;
    bool _475 = isnan(_437);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _485 = fma(_463, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = fma(_467, _399, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _489 = _481 ? 0 : 1;
    bool _491 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _493 = isnan(_295);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = floor(_373);
    float _505 = _411 ? _441 : 0.0;
    float _507 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _509 = _437 > 0.0;
    float _511 = _305;
    if (_359)
    {
        float _513 = _505 * _453;
        _123 = _513;
    }
    float _515 = _123;
    bool _517 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _519 = isnan(_295);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    bool _529 = _471 >= 0.0;
    bool _531 = isnan(_471);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _539;
    bool _543 = _471 > 0.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _549 = _537 ? 0 : 1;
    float _551 = -_527;
    float _553 = _551 + 1.0;
    int _555 = ~_489;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_541, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _563 = _503 > 0.0;
    float _565 = fma(_547, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _567 = _503 >= 0.0;
    bool _569 = isnan(_503);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    int _577 = _559;
    if (!_509)
    {
        int _579 = ~_489;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    bool _585 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _587 = isnan(_295);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _605 = ~_549;
    int _607 = _605 + 1;
    int _609 = _607 + 1;
    float _611 = fma(_599, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _613 = fma(_603, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _615 = _609;
    if (!_543)
    {
        int _617 = ~_549;
        int _619 = _617 + 1;
        _615 = _619;
    }
    int _621 = _615;
    float _623 = _595 * _553;
    bool _625 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _627 = isnan(_295);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -_595;
    float _639 = _637 + 1.0;
    bool _641 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_295);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = in.m_55.x;
    float _655 = in.m_55.y;
    float _657 = in.m_55.z;
    float _659 = float(_583);
    float _661 = -_635;
    float _663 = _661 + 1.0;
    float _665 = _635 * _639;
    bool _667 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _669 = isnan(_295);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _501 * _663;
    float _681 = -_501;
    float _683 = _681 + 1.0;
    float _685 = _459 * _659;
    float _687 = float(_621);
    float _689 = _677 * _683;
    float _691 = -_677;
    float _693 = _691 + 1.0;
    float _695 = _685 * (-2.0);
    int _697 = _575 ? 0 : 1;
    float _699 = _651 * _693;
    float _701 = float(_449);
    float _703 = fma(_483, _695, _483);
    int _705 = ~_697;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = _413 * _699;
    float _713 = _485 * _699;
    float _715 = _701 * _687;
    float _717 = _303 + (-0.5);
    float _719 = fma(_695, _653, _653);
    bool _721 = !_385;
    int _723 = _721 ? 0 : 1;
    float _725 = -_651;
    float _727 = _725 + 1.0;
    int _729 = _709;
    if (!_563)
    {
        int _731 = ~_697;
        int _733 = _731 + 1;
        _729 = _733;
    }
    int _735 = _729;
    float _737 = _715 * (-2.0);
    float _739 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].x, _719);
    int _741 = abs(_723);
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].y, _713);
    float _745 = fma(_737, _655, _655);
    float _747 = fma(_703, _515, _739);
    float _749 = _305 + (-0.5);
    float _751 = float(_735);
    float _753 = _747 * 0.15915493667125701904296875;
    float _755 = float(_741);
    float _757 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _759 = fma(_487, _689, _743);
    float _761 = as_type<float>(int(gl_VertexIndex));
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _765 = _755 * _751;
    float _767 = fma(_423, _689, _757);
    float _769 = fma(_425, _737, _425);
    float _771 = _765 * (-2.0);
    float _773 = fma(_561, _679, _767);
    float _775 = in.m_51.x;
    float _777 = in.m_51.y;
    float _779 = fma(_771, _657, _657);
    float _781 = fma(_507, _771, _507);
    float _783 = fma(_611, _679, _759);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _785;
    float _789 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[196].z, _779);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _791;
    float _795 = fma(_769, _515, _763);
    float _797 = fma(_613, _665, _783);
    float _799 = fma(_781, _515, _789);
    float _801 = fma(_793, _451, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _803 = fma(_787, _451, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _805 = _795 * 0.15915493667125701904296875;
    float _807 = fma(_565, _665, _773);
    float _809 = _799 * 0.15915493667125701904296875;
    float _811 = fma(_803, _623, _797);
    float _813 = _753 * 6.283185482025146484375;
    float _815 = sin(_813);
    int _817 = as_type<int>(_761) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>(_761) & 2;
    bool _823 = _821 != 0;
    float _825 = fma(_801, _623, _807);
    float _827 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[148].y, _811);
    float _829 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[148].x, _825);
    bool _831 = !_823;
    float _833 = _831 ? (-0.5) : 0.5;
    float _835 = _753 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = _827 * _777;
    bool _841 = !_819;
    float _843 = _841 ? (-0.5) : 0.5;
    float _845 = _829 * _775;
    float _847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _833);
    float _849 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _851 = _303 > 0.5;
    float _853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _843);
    float _855 = _805 * 6.283185482025146484375;
    float _857 = sin(_855);
    float _859 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _849 * _847;
    float _863 = _859 * _853;
    float _865 = _805 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _809 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _837 * _857;
    float _875 = _815 * _857;
    float _877 = _809 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _815 * _867;
    float _883 = _837 * _867;
    float _885 = _871 * _861;
    float _887 = _857 * _871;
    float _889 = _867 * _871;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _893 = _837 * _885;
    float _895 = _815 * _885;
    float _897 = -_873;
    float _899 = fma(_879, _881, _897);
    float _901 = -_881;
    float _903 = fma(_879, _873, _901);
    float _905 = fma(_879, _883, _875);
    float _907 = -_861;
    float _909 = _879 * _907;
    float _911 = fma(_879, _875, _883);
    float _913 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _915 = fma(_905, _863, _893);
    float _917 = fma(_889, _863, _909);
    float _919 = fma(_899, _863, _895);
    float _921 = fma(_903, _913, _915);
    float _923 = fma(_887, _913, _917);
    float _925 = fma(_911, _913, _919);
    float _927 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _929 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _931 = _921 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _933 = _921 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _927);
    float _937 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _929);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _931);
    float _941 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _943 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _935);
    float _945 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _937);
    float _947 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].z, _939);
    float _949 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _951 = _943 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _953 = _945 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _955 = _947 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _959 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _921 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = _951 + _955;
    float _965 = _953 + _957;
    float _967 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _969 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _973 = _963 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _977 = _965 + _975;
    float _979 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _967);
    float _981 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].z, _969);
    float _983 = _973 * _973;
    float _985 = _977 * _977;
    float _987 = _979 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _989 = _981 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _991 = _983 + _985;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _995 = _993 != 0;
    float _997 = -_843;
    float _999 = _851 ? _997 : _843;
    float _1001 = sqrt(_991);
    float _1003 = _987 + _989;
    bool _1005 = _305 > 0.5;
    bool _1007 = !_995;
    float _1009 = _1007 ? _843 : _999;
    bool _1011 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1013 = _999;
    float _1015 = _925;
    float _1017 = _967;
    float _1019 = _987;
    if (!_1011)
    {
        _1013 = _985;
    }
    float _1021 = _1013;
    float _1023 = _1021;
    if (!_1011)
    {
        _1015 = _983;
    }
    float _1025 = _1015;
    float _1027 = _1025;
    if (!_1011)
    {
        _267 = _963;
    }
    float _1029 = _267;
    float _1031 = _1029;
    if (!_1011)
    {
        _511 = _965;
    }
    float _1033 = _511;
    float _1035 = _1033;
    if (!_1011)
    {
        _1017 = _1003;
    }
    float _1037 = _1017;
    bool _1039 = !_1011;
    float _1041 = _1037;
    if (!_1039)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1047 = _1001 + _1045;
        float _1049 = rsqrt(_991);
        float _1051 = _1047 * _1043;
        float _1053 = _1003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = _1051 * 0.15915493667125701904296875;
        float _1057 = _1055 * 6.283185482025146484375;
        float _1059 = sin(_1057);
        float _1061 = _1055 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = fma(_1059, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1067 = _1049 * _1065;
        float _1069 = _1063 + (-1.0);
        float _1071 = fma(_973, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1073 = fma(_977, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1075 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1079 = _1071 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1083 = _1073 + _1081;
        float _1085 = fma(_1003, _1063, _1075);
        float _1087 = _1079 * _1079;
        float _1089 = _1083 * _1083;
        _1041 = _1085;
        _1027 = _1087;
        _1023 = _1089;
        _1035 = _1073;
        _1031 = _1071;
    }
    float _1091 = _1041;
    float _1093 = _1027;
    float _1095 = _1023;
    float _1097 = _1035;
    float _1099 = _1031;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1103 = _1091 + _1101;
    float _1105 = _1009 + 0.5;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1113 = -_833;
    int _1115 = _1005 ? as_type<int>(_1113) : as_type<int>(_833);
    float _1117 = fma(_1103, _1103, _1093);
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1121 = !_1109;
    float _1123 = _1121 ? _833 : as_type<float>(_1115);
    float _1125 = _1117 + _1095;
    float _1127 = _1119 * _891;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1131 = -_1123;
    float _1133 = _1131 + 0.5;
    float _1135 = sqrt(_1125);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1147 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1147 * _1111;
    out.m_60.x = _1151;
    out.m_60.y = _1153;
    out.m_60.z = _1155;
    out.m_60.w = _1149;
    bool _1165 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1167 = isnan(_1135);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1173 = _1169 || _1171;
    out.m_62.x = _1157;
    out.m_62.y = _1159;
    out.m_62.z = _1161;
    out.m_64.x = _1127;
    out.m_64.y = _1163;
    float _1175 = _1129;
    float _1177 = _1161;
    if (!_1173)
    {
        _1175 = 1.0;
    }
    float _1179 = _1175;
    bool _1181 = !_1173;
    float _1183 = _1179;
    if (!_1181)
    {
        bool _1185 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1187 = isnan(_1135);
        bool _1189 = _1185 || _1187;
        bool _1191 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1193 = _1189 || _1191;
        if (!_1193)
        {
            float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1197 = _1135 + _1195;
            float _1199 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1201 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1199;
            float _1203 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1205 = _1203 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1207 = 1.0 / _1201;
            float _1209 = _1197 * _1207;
            float _1211 = fma(_1209, _1205, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1183 = _1211;
            _1213 = true;
        }
        else
        {
            bool _1215 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1217 = isnan(_1135);
            bool _1219 = _1215 || _1217;
            bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1223 = _1219 || _1221;
            if (!_1223)
            {
                float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1227 = _1135 + _1225;
                float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1235 = _1233 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1237 = 1.0 / _1231;
                float _1239 = _1227 * _1237;
                float _1241 = fma(_1239, _1235, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1183 = _1241;
                _1213 = true;
            }
            else
            {
                _1183 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1213 = false;
    float _1243 = _1183;
    float _1245 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1249 = _1091 + _1247;
    float _1251 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1245);
    float _1253 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1255 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _1097 + _1265;
    float _1269 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    bool _1271 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.5);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1253);
    float _1283 = fma(_1249, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1285 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1289 = _1099 + _1287;
    float _1291 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1281);
    float _1293 = fma(_1267, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1295 = 1.0 / _1285;
    float _1297 = fma(_1289, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1299 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1301 = _1253;
    float _1303 = _1289;
    float _1305 = _1299;
    float _1307 = _1243;
    if (_1263)
    {
        _1301 = _1293;
    }
    float _1309 = _1301;
    float _1311 = _1299 + _1285;
    float _1313 = _1309;
    if (_1263)
    {
        _1303 = _1297;
    }
    float _1315 = _1303;
    float _1317 = _1315;
    if (_1263)
    {
        _1305 = _1283;
    }
    float _1319 = _1305;
    float _1321 = _1319;
    float _1323 = _1295;
    if (!_1263)
    {
        float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1327 = _987 + _1325;
        float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1331 = _951 + _1329;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1335 = _1327 * _1327;
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1339 = _953 + _1337;
        float _1341 = fma(_1331, _1331, _1335);
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1345 = fma(_1339, _1339, _1341);
        float _1347 = sqrt(_1345);
        float _1349 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1351 = -_953;
        float _1353 = _1351 + _1293;
        float _1355 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1343;
        float _1359 = -_951;
        float _1361 = _1359 + _1297;
        float _1363 = -_987;
        float _1365 = _1363 + _1283;
        float _1367 = _1349 * _1357;
        float _1369 = fma(_1361, _1367, _951);
        float _1371 = fma(_1365, _1367, _987);
        float _1373 = fma(_1353, _1367, _953);
        _1321 = _1371;
        _1317 = _1369;
        _1313 = _1373;
    }
    float _1375 = _1321;
    float _1377 = _1317;
    float _1379 = _1313;
    if (_1279)
    {
        _1019 = 1.0;
    }
    float _1381 = _1019;
    float _1383 = _1311 * _1295;
    float _1385 = _1383 * 0.5;
    float _1387 = _1381;
    if (!_1279)
    {
        float _1389 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1393 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
        float _1395 = _1389 * 0.15915493667125701904296875;
        float _1397 = _1395 * 6.283185482025146484375;
        float _1399 = cos(_1397);
        float _1401 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1403 = _1401 * 0.15915493667125701904296875;
        float _1405 = _1395 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = 1.0 / _1399;
        float _1411 = _1403 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        float _1415 = _1407 * _1409;
        float _1417 = 1.0 / _1393;
        float _1419 = _1413 * _1415;
        float _1421 = _1403 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1427 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1425;
        float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1431 = _1417 * _1429;
        float _1433 = 1.0 / _1419;
        float _1435 = 1.0 / _1427;
        float _1437 = _1423 * _1433;
        float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1441 = fma(_1437, _1431, _1439);
        float _1443 = _1441 * _1435;
        float _1445 = precise::clamp(_1443, 0.0, 1.0);
        _1323 = _1395;
        _1307 = _1403;
        _1387 = _1445;
    }
    float _1447 = _1323;
    float _1449 = _1307;
    float _1451 = _1387;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1455 = _1375 + _1453;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1459 = _1377 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1463 = _1379 + _1461;
    float _1465 = _1455 * _1455;
    float _1467 = fma(_1459, _1459, _1465);
    float _1469 = fma(_1463, _1463, _1467);
    float _1471 = rsqrt(_1469);
    float _1473 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1475 = _1459 * _1473;
    float _1477 = _1463 * _1473;
    float _1479 = _1475 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 + _1481;
    float _1485 = sqrt(_1483);
    bool _1487 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = _1485 + _1489;
    float _1493 = _1471;
    float _1495 = _1491;
    float _1497 = _1447;
    float _1499 = _1455;
    float _1501 = _1475;
    if (_1487)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1503;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (_1487)
    {
        float _1509 = _1491 * _1505;
        _1495 = _1509;
    }
    float _1511 = _1495;
    if (_1487)
    {
        float _1513 = rsqrt(_1483);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (_1487)
    {
        float _1519 = _1511 * 0.15915493667125701904296875;
        _1497 = _1519;
    }
    float _1521 = _1497;
    float _1523 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1525 = _1463;
    if (_1487)
    {
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = precise::max(0.0, _1523);
    float _1535 = _1449;
    float _1537 = _1533;
    if (_1487)
    {
        float _1539 = _1521 * 6.283185482025146484375;
        float _1541 = cos(_1539);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = -_1473;
    float _1547 = -_1533;
    float _1549 = fma(_1455, _1545, _1547);
    if (_1487)
    {
        float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1551;
    }
    float _1553 = _1499;
    float _1555 = sqrt(_1469);
    float _1557 = _1531;
    float _1559 = _1553;
    if (_1487)
    {
        float _1561 = fma(_1531, _1553, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1563;
    if (_1487)
    {
        float _1567 = _1515 * _1563;
        _1177 = _1567;
    }
    float _1569 = _1177;
    if (!_1487)
    {
        _1517 = _1549;
    }
    float _1571 = _1517;
    float _1573 = _1571;
    if (_1487)
    {
        float _1575 = _1543 + (-1.0);
        _1537 = _1575;
    }
    float _1577 = _1537;
    float _1579 = _1577;
    if (_1487)
    {
        float _1581 = _1475 * _1569;
        _1501 = _1581;
    }
    float _1583 = _1501;
    if (!_1487)
    {
        _1565 = _1477;
    }
    float _1585 = _1565;
    float _1587 = _1585;
    if (_1487)
    {
        float _1589 = _1477 * _1569;
        _1587 = _1589;
    }
    float _1591 = _1587;
    if (_1487)
    {
        float _1593 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1559 = _1593;
    }
    float _1595 = _1559;
    float _1597 = _1595;
    if (!_1487)
    {
        _1579 = _1479;
    }
    float _1599 = _1579;
    float _1601 = _1599;
    if (_1487)
    {
        float _1603 = _1583 * _1583;
        _1601 = _1603;
    }
    float _1605 = _1601;
    if (_1487)
    {
        float _1607 = fma(_1549, _1543, _1595);
        _1573 = _1607;
    }
    float _1609 = _1573;
    if (!_1487)
    {
        _1597 = _1481;
    }
    float _1611 = _1597;
    float _1613 = _1611;
    if (_1487)
    {
        float _1615 = _1591 * _1591;
        _1613 = _1615;
    }
    float _1617 = _1613;
    float _1619 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1621 = fma(_1609, _1609, _1605);
    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1625 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1623);
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = _1621 + _1617;
    float _1631 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1633 = -_1627;
    float _1635 = _1633 + 1.0;
    float _1637 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1631);
    float _1643 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = rsqrt(_1629);
    float _1647 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1619);
    float _1649 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1651 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1653 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1637);
    float _1655 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1647);
    float _1657 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1659 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1651);
    float _1661 = abs(_1635);
    float _1663 = log2(_1661);
    float _1665 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1669 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1671 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = -_1667;
    float _1675 = fma(_1673, _1639, 1.0);
    float _1677 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1681 = _1645 * _1583;
    float _1683 = _1645 * _1609;
    float _1685 = _1645 * _1591;
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1679);
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1691 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1693 = log2(_1675);
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1697 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    float _1699 = -_1689;
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1699);
    float _1703 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1705 = -_1685;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1701);
    float _1709 = exp2(_1695);
    float _1711 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1713 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1691);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1711);
    float _1721 = _1683 + 1.0;
    float _1723 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1713);
    float _1725 = 1.0 / _1703;
    float _1727 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1729 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1719);
    float _1731 = _1693 * 0.693147182464599609375;
    float _1733 = fma(_1717, _1727, -0.212114393711090087890625);
    float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = sqrt(_1715);
    float _1739 = -_1683;
    float _1741 = fma(_1709, _1721, _1739);
    float _1743 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1723);
    float _1745 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1729);
    float _1747 = fma(_1717, _1733, 1.570728778839111328125);
    float _1749 = fma(_1741, 0.5, 0.5);
    float _1751 = _1743 * _1725;
    float _1753 = _1745 * _1725;
    float _1755 = fma(_1751, 0.5, 0.5);
    float _1757 = fma(_1753, -0.5, 0.5);
    float _1759 = _1737 * 0.636619746685028076171875;
    float3 _4533 = float3(_1755, _1757, _1735);
    float _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4533, float3(0.0), isnan(_4533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4533, float3(0.0), isnan(_4533)), level(0.0)).x;
    float _1763 = -_1747;
    float _1765 = fma(_1759, _1763, 1.0);
    float3 _4549 = float3(_1755, _1757, _1735);
    float4 _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4549, float3(0.0), isnan(_4549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4549, float3(0.0), isnan(_4549)), level(0.0)).xyzw;
    float _1770 = _1768.x;
    float _1772 = _1768.y;
    float _1774 = _1768.z;
    float _1776 = _1768.w;
    float2 _4566 = float2(_1765, _1749);
    float3 _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4566, float2(0.0), isnan(_4566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4566, float2(0.0), isnan(_4566)), level(0.0)).xyz;
    float _1782 = _1780.x;
    float _1784 = _1780.y;
    float _1786 = _1780.z;
    float _1788 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1790 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1792 = _1451 > 0.0;
    bool _1794 = isnan(_1451);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(0.0);
    bool _1800 = _1796 || _1798;
    float _1802 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1804 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1790);
    float _1806 = exp2(_1788);
    float _1808 = _1743 + _1703;
    float _1810 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1804);
    float _1812 = _1703 * 0.5;
    float _1814 = _1808 * 0.5;
    float _1816 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1810);
    float _1818 = fma(_1745, -0.5, _1812);
    float _1820 = _1816 + _1703;
    out.gl_Position.x = _1743;
    out.gl_Position.y = _1745;
    out.gl_Position.z = _1816;
    out.gl_Position.w = _1703;
    float _1822 = _1820 * 0.5;
    float _1824 = -_1806;
    float _1826 = _1824 + 1.0;
    float _1828 = _1802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1830 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _1814;
    out.m_66.y = _1818;
    out.m_66.z = _1822;
    out.m_66.w = _1703;
    out.m_47.x = _1828;
    float _1832 = _1830 * _1761;
    float _1834 = -_1830;
    float _1836 = _1834 + 1.0;
    float _1838 = _1776 * _1832;
    float _1840 = _1786 * _1832;
    float _1842 = fma(_1782, _1838, _1770);
    float _1844 = fma(_1784, _1838, _1772);
    float _1846 = _1776 * _1836;
    float _1848 = fma(_1776, _1840, _1774);
    out.m_68.x = _1842;
    out.m_68.y = _1844;
    out.m_68.z = _1848;
    out.m_68.w = _1846;
    if (_1800)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1850 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1850;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1213 = false;
    bool _287 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_103);
        out.gl_Position.z = _1907;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1977 = as_type<float>(_141);
        out.gl_Position.z = _1977;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_51.w;
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = 0.0;
    float _171 = _145;
    if (!_155)
    {
        float _173 = _145 * _145;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_155)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_155;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _145 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _145);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_155;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _145 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _171 = _241;
    }
    float _243 = _171;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _157, _247);
    float _255 = fma(_243, _159, _249);
    float _257 = fma(_243, _161, _251);
    float _259 = fma(_253, _143, _163);
    float _261 = fma(_255, _143, _165);
    float _263 = fma(_257, _143, _167);
    bool _265 = !_245;
    float _267 = _259;
    float _285;
    if (!_265)
    {
        float _269 = in.m_53.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_87);
        float _291 = 1.0 / _289;
        float _293 = _121 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_53.z;
    float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _301 = log2(_299);
    float _303 = in.m_53.x;
    float _305 = in.m_53.y;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = 1.0 / _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _325;
    float _329 = _301 * _121;
    float _331 = 1.0 / _317;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _295 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = 1.0 / _323;
    float _347 = _335 * _319;
    float _349 = _303 * 2.0;
    bool _351 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(1.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _295 + _365;
    float _369 = 1.0 / _327;
    float _371 = _367 * _331;
    float _373 = _305 * 2.0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _381 = _379 != 0;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _385 = _383 != 0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _295 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _295 + _391;
    float _395 = exp2(_329);
    float _397 = _297 * 2.0;
    float _399 = _389 * _345;
    float _401 = _305 + _297;
    bool _403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _411 = _407 || _409;
    float _413 = fma(_339, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = _401 + (-1.0);
    float _417 = 1.0 / _313;
    bool _419 = !_377;
    int _421 = _419 ? 0 : 1;
    float _423 = fma(_343, _399, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _427 = _297 + _303;
    int _429 = abs(_421);
    float _431 = _297 + (-0.5);
    bool _433 = !_381;
    int _435 = _433 ? 0 : 1;
    float _437 = floor(_397);
    float _439 = -_395;
    float _441 = _439 + 1.0;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _445 = _295 + _443;
    float _447 = _427 + (-1.0);
    int _449 = abs(_435);
    float _451 = _445 * _369;
    float _453 = 1.0 / _363;
    float _455 = _393 * _417;
    float _457 = _305 + _303;
    float _459 = float(_429);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _457 + (-1.0);
    float _471 = floor(_349);
    bool _473 = _437 >= 0.0;
    bool _475 = isnan(_437);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _485 = fma(_463, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = fma(_467, _399, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _489 = _481 ? 0 : 1;
    bool _491 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _493 = isnan(_295);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = floor(_373);
    float _505 = _411 ? _441 : 0.0;
    float _507 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _509 = _437 > 0.0;
    float _511 = _305;
    if (_359)
    {
        float _513 = _505 * _453;
        _123 = _513;
    }
    float _515 = _123;
    bool _517 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _519 = isnan(_295);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    bool _529 = _471 >= 0.0;
    bool _531 = isnan(_471);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _539;
    bool _543 = _471 > 0.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _549 = _537 ? 0 : 1;
    float _551 = -_527;
    float _553 = _551 + 1.0;
    int _555 = ~_489;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_541, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _563 = _503 > 0.0;
    float _565 = fma(_547, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _567 = _503 >= 0.0;
    bool _569 = isnan(_503);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    int _577 = _559;
    if (!_509)
    {
        int _579 = ~_489;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    bool _585 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _587 = isnan(_295);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _605 = ~_549;
    int _607 = _605 + 1;
    int _609 = _607 + 1;
    float _611 = fma(_599, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _613 = fma(_603, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _615 = _609;
    if (!_543)
    {
        int _617 = ~_549;
        int _619 = _617 + 1;
        _615 = _619;
    }
    int _621 = _615;
    float _623 = _595 * _553;
    bool _625 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _627 = isnan(_295);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -_595;
    float _639 = _637 + 1.0;
    bool _641 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_295);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = in.m_55.x;
    float _655 = in.m_55.y;
    float _657 = in.m_55.z;
    float _659 = float(_583);
    float _661 = -_635;
    float _663 = _661 + 1.0;
    float _665 = _635 * _639;
    bool _667 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _669 = isnan(_295);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _501 * _663;
    float _681 = -_501;
    float _683 = _681 + 1.0;
    float _685 = _459 * _659;
    float _687 = float(_621);
    float _689 = _677 * _683;
    float _691 = -_677;
    float _693 = _691 + 1.0;
    float _695 = _685 * (-2.0);
    int _697 = _575 ? 0 : 1;
    float _699 = _651 * _693;
    float _701 = float(_449);
    float _703 = fma(_483, _695, _483);
    int _705 = ~_697;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = _413 * _699;
    float _713 = _485 * _699;
    float _715 = _701 * _687;
    float _717 = _303 + (-0.5);
    float _719 = fma(_695, _653, _653);
    bool _721 = !_385;
    int _723 = _721 ? 0 : 1;
    float _725 = -_651;
    float _727 = _725 + 1.0;
    int _729 = _709;
    if (!_563)
    {
        int _731 = ~_697;
        int _733 = _731 + 1;
        _729 = _733;
    }
    int _735 = _729;
    float _737 = _715 * (-2.0);
    float _739 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].x, _719);
    int _741 = abs(_723);
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].y, _713);
    float _745 = fma(_737, _655, _655);
    float _747 = fma(_703, _515, _739);
    float _749 = _305 + (-0.5);
    float _751 = float(_735);
    float _753 = _747 * 0.15915493667125701904296875;
    float _755 = float(_741);
    float _757 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _759 = fma(_487, _689, _743);
    float _761 = as_type<float>(int(gl_VertexIndex));
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _765 = _755 * _751;
    float _767 = fma(_423, _689, _757);
    float _769 = fma(_425, _737, _425);
    float _771 = _765 * (-2.0);
    float _773 = fma(_561, _679, _767);
    float _775 = in.m_51.x;
    float _777 = in.m_51.y;
    float _779 = fma(_771, _657, _657);
    float _781 = fma(_507, _771, _507);
    float _783 = fma(_611, _679, _759);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _785;
    float _789 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[196].z, _779);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _791;
    float _795 = fma(_769, _515, _763);
    float _797 = fma(_613, _665, _783);
    float _799 = fma(_781, _515, _789);
    float _801 = fma(_793, _451, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _803 = fma(_787, _451, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _805 = _795 * 0.15915493667125701904296875;
    float _807 = fma(_565, _665, _773);
    float _809 = _799 * 0.15915493667125701904296875;
    float _811 = fma(_803, _623, _797);
    float _813 = _753 * 6.283185482025146484375;
    float _815 = sin(_813);
    int _817 = as_type<int>(_761) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>(_761) & 2;
    bool _823 = _821 != 0;
    float _825 = fma(_801, _623, _807);
    float _827 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[148].y, _811);
    float _829 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[148].x, _825);
    bool _831 = !_823;
    float _833 = _831 ? (-0.5) : 0.5;
    float _835 = _753 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = _827 * _777;
    bool _841 = !_819;
    float _843 = _841 ? (-0.5) : 0.5;
    float _845 = _829 * _775;
    float _847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _833);
    float _849 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _851 = _303 > 0.5;
    float _853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _843);
    float _855 = _805 * 6.283185482025146484375;
    float _857 = sin(_855);
    float _859 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _849 * _847;
    float _863 = _859 * _853;
    float _865 = _805 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _809 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _837 * _857;
    float _875 = _815 * _857;
    float _877 = _809 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _815 * _867;
    float _883 = _837 * _867;
    float _885 = _871 * _861;
    float _887 = _857 * _871;
    float _889 = _867 * _871;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _893 = _837 * _885;
    float _895 = _815 * _885;
    float _897 = -_873;
    float _899 = fma(_879, _881, _897);
    float _901 = -_881;
    float _903 = fma(_879, _873, _901);
    float _905 = fma(_879, _883, _875);
    float _907 = -_861;
    float _909 = _879 * _907;
    float _911 = fma(_879, _875, _883);
    float _913 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _915 = fma(_905, _863, _893);
    float _917 = fma(_889, _863, _909);
    float _919 = fma(_899, _863, _895);
    float _921 = fma(_903, _913, _915);
    float _923 = fma(_887, _913, _917);
    float _925 = fma(_911, _913, _919);
    float _927 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _929 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _931 = _921 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _933 = _921 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _935 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _927);
    float _937 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _929);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _931);
    float _941 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _933);
    float _943 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _935);
    float _945 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _937);
    float _947 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].z, _939);
    float _949 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _951 = _943 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _953 = _945 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _955 = _947 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _957 = _949 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _959 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _921 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = _951 + _955;
    float _965 = _953 + _957;
    float _967 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _969 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _973 = _963 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _977 = _965 + _975;
    float _979 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _967);
    float _981 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].z, _969);
    float _983 = _973 * _973;
    float _985 = _977 * _977;
    float _987 = _979 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _989 = _981 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _991 = _983 + _985;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _995 = _993 != 0;
    float _997 = -_843;
    float _999 = _851 ? _997 : _843;
    float _1001 = sqrt(_991);
    float _1003 = _987 + _989;
    bool _1005 = _305 > 0.5;
    bool _1007 = !_995;
    float _1009 = _1007 ? _843 : _999;
    bool _1011 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1013 = _999;
    float _1015 = _925;
    float _1017 = _967;
    float _1019 = _987;
    if (!_1011)
    {
        _1013 = _985;
    }
    float _1021 = _1013;
    float _1023 = _1021;
    if (!_1011)
    {
        _1015 = _983;
    }
    float _1025 = _1015;
    float _1027 = _1025;
    if (!_1011)
    {
        _267 = _963;
    }
    float _1029 = _267;
    float _1031 = _1029;
    if (!_1011)
    {
        _511 = _965;
    }
    float _1033 = _511;
    float _1035 = _1033;
    if (!_1011)
    {
        _1017 = _1003;
    }
    float _1037 = _1017;
    bool _1039 = !_1011;
    float _1041 = _1037;
    if (!_1039)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1047 = _1001 + _1045;
        float _1049 = rsqrt(_991);
        float _1051 = _1047 * _1043;
        float _1053 = _1003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = _1051 * 0.15915493667125701904296875;
        float _1057 = _1055 * 6.283185482025146484375;
        float _1059 = sin(_1057);
        float _1061 = _1055 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = fma(_1059, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1067 = _1049 * _1065;
        float _1069 = _1063 + (-1.0);
        float _1071 = fma(_973, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1073 = fma(_977, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1075 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1079 = _1071 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1083 = _1073 + _1081;
        float _1085 = fma(_1003, _1063, _1075);
        float _1087 = _1079 * _1079;
        float _1089 = _1083 * _1083;
        _1041 = _1085;
        _1027 = _1087;
        _1023 = _1089;
        _1035 = _1073;
        _1031 = _1071;
    }
    float _1091 = _1041;
    float _1093 = _1027;
    float _1095 = _1023;
    float _1097 = _1035;
    float _1099 = _1031;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1103 = _1091 + _1101;
    float _1105 = _1009 + 0.5;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1113 = -_833;
    int _1115 = _1005 ? as_type<int>(_1113) : as_type<int>(_833);
    float _1117 = fma(_1103, _1103, _1093);
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1121 = !_1109;
    float _1123 = _1121 ? _833 : as_type<float>(_1115);
    float _1125 = _1117 + _1095;
    float _1127 = _1119 * _891;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1131 = -_1123;
    float _1133 = _1131 + 0.5;
    float _1135 = sqrt(_1125);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1147 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1147 * _1111;
    out.m_60.x = _1151;
    out.m_60.y = _1153;
    out.m_60.z = _1155;
    out.m_60.w = _1149;
    bool _1165 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1167 = isnan(_1135);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1173 = _1169 || _1171;
    out.m_62.x = _1157;
    out.m_62.y = _1159;
    out.m_62.z = _1161;
    out.m_64.x = _1127;
    out.m_64.y = _1163;
    float _1175 = _1129;
    float _1177 = _1161;
    if (!_1173)
    {
        _1175 = 1.0;
    }
    float _1179 = _1175;
    bool _1181 = !_1173;
    float _1183 = _1179;
    if (!_1181)
    {
        bool _1185 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1187 = isnan(_1135);
        bool _1189 = _1185 || _1187;
        bool _1191 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1193 = _1189 || _1191;
        if (!_1193)
        {
            float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1197 = _1135 + _1195;
            float _1199 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1201 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1199;
            float _1203 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1205 = _1203 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1207 = 1.0 / _1201;
            float _1209 = _1197 * _1207;
            float _1211 = fma(_1209, _1205, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1183 = _1211;
            _1213 = true;
        }
        else
        {
            bool _1215 = _1135 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1217 = isnan(_1135);
            bool _1219 = _1215 || _1217;
            bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1223 = _1219 || _1221;
            if (!_1223)
            {
                float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1227 = _1135 + _1225;
                float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1235 = _1233 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1237 = 1.0 / _1231;
                float _1239 = _1227 * _1237;
                float _1241 = fma(_1239, _1235, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1183 = _1241;
                _1213 = true;
            }
            else
            {
                _1183 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1213 = false;
    float _1243 = _1183;
    float _1245 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1249 = _1091 + _1247;
    float _1251 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1245);
    float _1253 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1255 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _1097 + _1265;
    float _1269 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1251);
    bool _1271 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.5);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1253);
    float _1283 = fma(_1249, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1285 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1289 = _1099 + _1287;
    float _1291 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1281);
    float _1293 = fma(_1267, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1295 = 1.0 / _1285;
    float _1297 = fma(_1289, _1243, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1299 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1301 = _1253;
    float _1303 = _1289;
    float _1305 = _1299;
    float _1307 = _1243;
    if (_1263)
    {
        _1301 = _1293;
    }
    float _1309 = _1301;
    float _1311 = _1299 + _1285;
    float _1313 = _1309;
    if (_1263)
    {
        _1303 = _1297;
    }
    float _1315 = _1303;
    float _1317 = _1315;
    if (_1263)
    {
        _1305 = _1283;
    }
    float _1319 = _1305;
    float _1321 = _1319;
    float _1323 = _1295;
    if (!_1263)
    {
        float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1327 = _987 + _1325;
        float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1331 = _951 + _1329;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1335 = _1327 * _1327;
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1339 = _953 + _1337;
        float _1341 = fma(_1331, _1331, _1335);
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1345 = fma(_1339, _1339, _1341);
        float _1347 = sqrt(_1345);
        float _1349 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1351 = -_953;
        float _1353 = _1351 + _1293;
        float _1355 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1343;
        float _1359 = -_951;
        float _1361 = _1359 + _1297;
        float _1363 = -_987;
        float _1365 = _1363 + _1283;
        float _1367 = _1349 * _1357;
        float _1369 = fma(_1361, _1367, _951);
        float _1371 = fma(_1365, _1367, _987);
        float _1373 = fma(_1353, _1367, _953);
        _1321 = _1371;
        _1317 = _1369;
        _1313 = _1373;
    }
    float _1375 = _1321;
    float _1377 = _1317;
    float _1379 = _1313;
    if (_1279)
    {
        _1019 = 1.0;
    }
    float _1381 = _1019;
    float _1383 = _1311 * _1295;
    float _1385 = _1383 * 0.5;
    float _1387 = _1381;
    if (!_1279)
    {
        float _1389 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1393 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1391);
        float _1395 = _1389 * 0.15915493667125701904296875;
        float _1397 = _1395 * 6.283185482025146484375;
        float _1399 = cos(_1397);
        float _1401 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1403 = _1401 * 0.15915493667125701904296875;
        float _1405 = _1395 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = 1.0 / _1399;
        float _1411 = _1403 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        float _1415 = _1407 * _1409;
        float _1417 = 1.0 / _1393;
        float _1419 = _1413 * _1415;
        float _1421 = _1403 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1427 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1425;
        float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1431 = _1417 * _1429;
        float _1433 = 1.0 / _1419;
        float _1435 = 1.0 / _1427;
        float _1437 = _1423 * _1433;
        float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1441 = fma(_1437, _1431, _1439);
        float _1443 = _1441 * _1435;
        float _1445 = precise::clamp(_1443, 0.0, 1.0);
        _1323 = _1395;
        _1307 = _1403;
        _1387 = _1445;
    }
    float _1447 = _1323;
    float _1449 = _1307;
    float _1451 = _1387;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1455 = _1375 + _1453;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1459 = _1377 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1463 = _1379 + _1461;
    float _1465 = _1455 * _1455;
    float _1467 = fma(_1459, _1459, _1465);
    float _1469 = fma(_1463, _1463, _1467);
    float _1471 = rsqrt(_1469);
    float _1473 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1475 = _1459 * _1473;
    float _1477 = _1463 * _1473;
    float _1479 = _1475 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 + _1481;
    float _1485 = sqrt(_1483);
    bool _1487 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = _1485 + _1489;
    float _1493 = _1471;
    float _1495 = _1491;
    float _1497 = _1447;
    float _1499 = _1455;
    float _1501 = _1475;
    if (_1487)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1503;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (_1487)
    {
        float _1509 = _1491 * _1505;
        _1495 = _1509;
    }
    float _1511 = _1495;
    if (_1487)
    {
        float _1513 = rsqrt(_1483);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (_1487)
    {
        float _1519 = _1511 * 0.15915493667125701904296875;
        _1497 = _1519;
    }
    float _1521 = _1497;
    float _1523 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1525 = _1463;
    if (_1487)
    {
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = precise::max(0.0, _1523);
    float _1535 = _1449;
    float _1537 = _1533;
    if (_1487)
    {
        float _1539 = _1521 * 6.283185482025146484375;
        float _1541 = cos(_1539);
        _1535 = _1541;
    }
    float _1543 = _1535;
    float _1545 = -_1473;
    float _1547 = -_1533;
    float _1549 = fma(_1455, _1545, _1547);
    if (_1487)
    {
        float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1551;
    }
    float _1553 = _1499;
    float _1555 = sqrt(_1469);
    float _1557 = _1531;
    float _1559 = _1553;
    if (_1487)
    {
        float _1561 = fma(_1531, _1553, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1563;
    if (_1487)
    {
        float _1567 = _1515 * _1563;
        _1177 = _1567;
    }
    float _1569 = _1177;
    if (!_1487)
    {
        _1517 = _1549;
    }
    float _1571 = _1517;
    float _1573 = _1571;
    if (_1487)
    {
        float _1575 = _1543 + (-1.0);
        _1537 = _1575;
    }
    float _1577 = _1537;
    float _1579 = _1577;
    if (_1487)
    {
        float _1581 = _1475 * _1569;
        _1501 = _1581;
    }
    float _1583 = _1501;
    if (!_1487)
    {
        _1565 = _1477;
    }
    float _1585 = _1565;
    float _1587 = _1585;
    if (_1487)
    {
        float _1589 = _1477 * _1569;
        _1587 = _1589;
    }
    float _1591 = _1587;
    if (_1487)
    {
        float _1593 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1559 = _1593;
    }
    float _1595 = _1559;
    float _1597 = _1595;
    if (!_1487)
    {
        _1579 = _1479;
    }
    float _1599 = _1579;
    float _1601 = _1599;
    if (_1487)
    {
        float _1603 = _1583 * _1583;
        _1601 = _1603;
    }
    float _1605 = _1601;
    if (_1487)
    {
        float _1607 = fma(_1549, _1543, _1595);
        _1573 = _1607;
    }
    float _1609 = _1573;
    if (!_1487)
    {
        _1597 = _1481;
    }
    float _1611 = _1597;
    float _1613 = _1611;
    if (_1487)
    {
        float _1615 = _1591 * _1591;
        _1613 = _1615;
    }
    float _1617 = _1613;
    float _1619 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1621 = fma(_1609, _1609, _1605);
    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1625 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1623);
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = _1621 + _1617;
    float _1631 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1633 = -_1627;
    float _1635 = _1633 + 1.0;
    float _1637 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1631);
    float _1643 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1645 = rsqrt(_1629);
    float _1647 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1619);
    float _1649 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1641);
    float _1651 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1643);
    float _1653 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1637);
    float _1655 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1647);
    float _1657 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1659 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1651);
    float _1661 = abs(_1635);
    float _1663 = log2(_1661);
    float _1665 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1669 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1671 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1673 = -_1667;
    float _1675 = fma(_1673, _1639, 1.0);
    float _1677 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1681 = _1645 * _1583;
    float _1683 = _1645 * _1609;
    float _1685 = _1645 * _1591;
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1679);
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1691 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1693 = log2(_1675);
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1697 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    float _1699 = -_1689;
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1699);
    float _1703 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1705 = -_1685;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1701);
    float _1709 = exp2(_1695);
    float _1711 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1713 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1691);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1711);
    float _1721 = _1683 + 1.0;
    float _1723 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1713);
    float _1725 = 1.0 / _1703;
    float _1727 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1729 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1719);
    float _1731 = _1693 * 0.693147182464599609375;
    float _1733 = fma(_1717, _1727, -0.212114393711090087890625);
    float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = sqrt(_1715);
    float _1739 = -_1683;
    float _1741 = fma(_1709, _1721, _1739);
    float _1743 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1723);
    float _1745 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1729);
    float _1747 = fma(_1717, _1733, 1.570728778839111328125);
    float _1749 = fma(_1741, 0.5, 0.5);
    float _1751 = _1743 * _1725;
    float _1753 = _1745 * _1725;
    float _1755 = fma(_1751, 0.5, 0.5);
    float _1757 = fma(_1753, -0.5, 0.5);
    float _1759 = _1737 * 0.636619746685028076171875;
    float3 _4533 = float3(_1755, _1757, _1735);
    float _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4533, float3(0.0), isnan(_4533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4533, float3(0.0), isnan(_4533)), level(0.0)).x;
    float _1763 = -_1747;
    float _1765 = fma(_1759, _1763, 1.0);
    float3 _4549 = float3(_1755, _1757, _1735);
    float4 _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4549, float3(0.0), isnan(_4549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4549, float3(0.0), isnan(_4549)), level(0.0)).xyzw;
    float _1770 = _1768.x;
    float _1772 = _1768.y;
    float _1774 = _1768.z;
    float _1776 = _1768.w;
    float2 _4566 = float2(_1765, _1749);
    float3 _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4566, float2(0.0), isnan(_4566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4566, float2(0.0), isnan(_4566)), level(0.0)).xyz;
    float _1782 = _1780.x;
    float _1784 = _1780.y;
    float _1786 = _1780.z;
    float _1788 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1790 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1792 = _1451 > 0.0;
    bool _1794 = isnan(_1451);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(0.0);
    bool _1800 = _1796 || _1798;
    float _1802 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1804 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1790);
    float _1806 = exp2(_1788);
    float _1808 = _1743 + _1703;
    float _1810 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1804);
    float _1812 = _1703 * 0.5;
    float _1814 = _1808 * 0.5;
    float _1816 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1810);
    float _1818 = fma(_1745, -0.5, _1812);
    float _1820 = _1816 + _1703;
    out.gl_Position.x = _1743;
    out.gl_Position.y = _1745;
    out.gl_Position.z = _1816;
    out.gl_Position.w = _1703;
    float _1822 = _1820 * 0.5;
    float _1824 = -_1806;
    float _1826 = _1824 + 1.0;
    float _1828 = _1802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1830 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _1814;
    out.m_66.y = _1818;
    out.m_66.z = _1822;
    out.m_66.w = _1703;
    out.m_47.x = _1828;
    float _1832 = _1830 * _1761;
    float _1834 = -_1830;
    float _1836 = _1834 + 1.0;
    float _1838 = _1776 * _1832;
    float _1840 = _1786 * _1832;
    float _1842 = fma(_1782, _1838, _1770);
    float _1844 = fma(_1784, _1838, _1772);
    float _1846 = _1776 * _1836;
    float _1848 = fma(_1776, _1840, _1774);
    out.m_68.x = _1842;
    out.m_68.y = _1844;
    out.m_68.z = _1848;
    out.m_68.w = _1846;
    if (_1800)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1850 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1850;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

