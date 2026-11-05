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
    float4 m_66 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _647 = false;
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
        float _2047 = as_type<float>(_105);
        out.gl_Position.z = _2047;
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
        float _2116 = as_type<float>(_141);
        out.gl_Position.z = _2116;
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
    float _179 = in.m_56.x;
    float _181 = in.m_56.y;
    float _183 = in.m_56.z;
    float _185 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _187 = in.m_58.x;
    float _189 = in.m_58.y;
    float _191 = in.m_58.z;
    float _193 = floor(_185);
    float _195 = in.m_60.x;
    float _197 = in.m_60.y;
    float _199 = in.m_60.z;
    float _201 = _185 * 6.283185482025146484375;
    int _203 = as_type<int>(_149) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_149) & 2;
    bool _209 = _207 != 0;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = _201 * 0.15915493667125701904296875;
    bool _217 = !_205;
    int _219 = _217 ? (-1090519040) : 1056964608;
    float _221 = _215 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_209;
    int _227 = _225 ? (-1090519040) : 1056964608;
    float _229 = -_193;
    float _231 = _185 + _229;
    float _233 = _185;
    float _235 = _151;
    if (!_163)
    {
        float _237 = _151 * _151;
        float _239 = _237 * 0.5;
        _233 = _239;
    }
    float _241 = _233;
    bool _243 = _231 < 0.5;
    float _245 = float(_243);
    float _247 = _241;
    if (!_163)
    {
        float _249 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _249;
    }
    float _251 = _247;
    bool _253 = !_163;
    float _255 = _251;
    float _257 = _153;
    float _259 = _183;
    if (!_253)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _151 * _263;
        float _273 = 1.0 / _267;
        float _275 = _269 * 0.693147182464599609375;
        float _277 = exp2(_271);
        float _279 = 1.0 / _275;
        float _281 = _277 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _279, _151);
        float _287 = _285 * _273;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _289;
    }
    float _291 = _255;
    bool _293 = !_163;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _151 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _235 = _313;
    }
    float _315 = _235;
    float _317 = fma(_223, 0.5, 0.5);
    float _319 = -_231;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _327 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = -_245;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_317;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_315, _165, _323);
    float _339 = fma(_315, _167, _325);
    float _341 = fma(_315, _169, _327);
    float _343 = _327;
    if (!_163)
    {
        float _345 = _123 * _123;
        float _347 = _345 * 0.5;
        _343 = _347;
    }
    float _349 = _343;
    float _351 = fma(_337, _153, _171);
    float _353 = fma(_339, _153, _173);
    float _355 = fma(_341, _153, _175);
    float _357 = _349;
    if (!_163)
    {
        float _359 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _361;
    if (!_163)
    {
        _257 = _123;
    }
    float _365 = _257;
    bool _367 = !_163;
    float _369 = _365;
    if (!_367)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = _123 * _373;
        float _383 = exp2(_381);
        float _385 = _379 * 0.693147182464599609375;
        float _387 = 1.0 / _385;
        float _389 = 1.0 / _377;
        float _391 = _383 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _387, _123);
        float _397 = _395 * _389;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _399;
    }
    float _401 = _363;
    bool _403 = !_163;
    if (!_403)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _369 = _423;
    }
    float _425 = _369;
    float _427 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _435 = _433 != 0;
    float _437 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _441 = fma(_425, _167, _427);
    out.m_62.x = as_type<float>(_219);
    out.m_62.y = as_type<float>(_227);
    float _443 = fma(_425, _165, _437);
    bool _445 = !_431;
    int _447 = _445 ? 0 : 1;
    float _449 = -_441;
    float _451 = _339 + _449;
    bool _453 = !_213;
    int _455 = _453 ? 0 : 1;
    float _457 = fma(_425, _169, _439);
    bool _459 = !_435;
    int _461 = _459 ? 0 : 1;
    float _463 = -_443;
    float _465 = _337 + _463;
    int _467 = abs(_447);
    float _469 = _451 * _181;
    float _471 = _451 * _189;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _475 = _451 * _197;
    int _477 = abs(_455);
    float _479 = fma(_465, _179, _469);
    int _481 = abs(_461);
    float _483 = fma(_465, _187, _471);
    float _485 = float(_467);
    float _487 = fma(_465, _195, _475);
    float _489 = float(_477);
    float _491 = -_457;
    float _493 = _341 + _491;
    float _495 = abs(_321);
    float _497 = _485 * _495;
    float _499 = fma(_493, _183, _479);
    float _501 = float(_481);
    float _503 = fma(_489, _335, _497);
    float _505 = fma(_493, _191, _483);
    float _507 = fma(_493, _199, _487);
    float _509 = abs(_331);
    float _511 = fma(_501, _509, _503);
    bool _513 = !_473;
    float _515 = _499;
    float _517 = _505;
    float _519 = _507;
    float _521 = _507;
    float _537;
    if (!_513)
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
    float _553 = in.m_54.x;
    float _555 = in.m_54.y;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _569;
    bool _573 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _575 = isnan(_547);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_567;
    float _587 = _585 + 1.0;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _589;
    float _593 = 1.0 / _571;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _597 = _583 * _587;
    float _599 = -_583;
    float _601 = _599 + 1.0;
    float _603 = _551 * _593;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _605;
    float _609 = fma(_591, _603, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _611 = fma(_607, _603, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _613 = _609 * _597;
    float _615 = _611 * _597;
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _615);
    float _621 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].x, _617);
    float _623 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].y, _619);
    float _625 = _621 * _553;
    float _627 = _623 * _555;
    bool _629 = !_595;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_89);
        float _651 = 1.0 / _649;
        float _653 = _123 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_58.w;
    float _659 = _353 * _189;
    float _661 = _353 * _181;
    float _663 = _353 * _197;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _665;
    float _669 = in.m_56.w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _675 = fma(_351, _187, _659);
    float _677 = 1.0 / _667;
    float _679 = in.m_60.w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _683 = _655 + _681;
    float _685 = fma(_351, _179, _661);
    float _687 = fma(_351, _195, _663);
    float _689 = fma(_355, _191, _675);
    float _691 = fma(_355, _183, _685);
    float _693 = 1.0 / _673;
    bool _695 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _697 = isnan(_655);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _709 = _655 + _707;
    float _711 = fma(_355, _199, _687);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _713;
    float _717 = _683 * _677;
    bool _719 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _721 = isnan(_655);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _689 + _657;
    bool _733 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _735 = isnan(_655);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_705;
    float _747 = _745 + 1.0;
    float _749 = _691 + _669;
    float _751 = -_729;
    float _753 = _751 + 1.0;
    float _755 = _709 * _693;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _757;
    float _761 = fma(_715, _717, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _763 = _743 * _747;
    float _765 = _705 * _753;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _767;
    float _771 = fma(_759, _717, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _783 = _731 + _781;
    float _785 = -_743;
    float _787 = _785 + 1.0;
    float _789 = _761 * _763;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _795 = fma(_769, _717, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _797 = _771 * _763;
    float _799 = _711 + _679;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = _749 + _801;
    float _805 = _783 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _807 = fma(_779, _755, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _809 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].x, _789);
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _813 = _799 + _811;
    float _815 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[28].x, _805);
    float _817 = _795 * _763;
    float _819 = fma(_807, _765, _809);
    float _821 = fma(_793, _755, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _823 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[28].z, _815);
    float _825 = fma(_775, _755, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _827 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].x, _819);
    float _829 = _783 * _783;
    float _831 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].y, _797);
    bool _833 = _823 >= 0.0;
    float _835 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].z, _817);
    float _837 = fma(_803, _803, _829);
    float _839 = fma(_821, _765, _831);
    float _841 = fma(_825, _765, _835);
    float _843 = fma(_813, _813, _837);
    float _845 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].y, _839);
    float _847 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].z, _841);
    float _849 = _511 * _625;
    float _851 = rsqrt(_843);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _859 = _847 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _861 = 0.0;
    int _863 = as_type<int>(_859);
    if (_833)
    {
        _861 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _865 = _861;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _871 = _849 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _873 = _845 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _875 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _881 = _871 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _883 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _887;
    if (_833)
    {
        float _893 = _865 * 5.0;
        _863 = as_type<int>(_893);
    }
    int _895 = _863;
    float _897 = _881 * _851;
    if (_833)
    {
        out.m_45.x = 0.0;
    }
    float _899 = _803 * _897;
    out.m_64.x = _883;
    out.m_64.y = _885;
    out.m_64.z = _887;
    out.m_64.w = _855;
    float _901 = _783 * _897;
    out.m_66.x = _875;
    out.m_66.y = _889;
    out.m_66.z = _877;
    out.m_66.w = _879;
    if (_833)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3320 = as_type<float>(_895);
        out.gl_Position.z = _3320;
    }
    if (_833)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _903 = -_901;
    float _905 = _731 + _903;
    float _907 = _813 * _897;
    float _909 = -_899;
    float _911 = _749 + _909;
    float _913 = -_901;
    float _915 = _783 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _919 = _905 + _917;
    float _921 = -_907;
    float _923 = _799 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _911 + _925;
    float _929 = -_899;
    float _931 = _803 + _929;
    float _933 = _919 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _923 + _935;
    float _939 = _915 * _915;
    float _941 = -_907;
    float _943 = _813 + _941;
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[28].x, _933);
    float _947 = _511 * _627;
    float _949 = fma(_931, _931, _939);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[28].z, _945);
    float _953 = fma(_943, _943, _949);
    bool _955 = _951 >= 0.0;
    float _957 = sqrt(_953);
    float _959 = _923;
    if (_955)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _961 = _891;
    int _963 = as_type<int>(_961);
    if (_955)
    {
        out.m_45.x = 0.0;
    }
    float _965 = _851 * _957;
    if (_955)
    {
        float _967 = _961 * 5.0;
        _963 = as_type<int>(_967);
    }
    int _969 = _963;
    if (_955)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3438 = as_type<float>(_969);
        out.gl_Position.z = _3438;
    }
    if (_955)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _971 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_227));
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_219));
    float _977 = _871 * _965;
    float _979 = _965 * _971;
    float _981 = _965 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _983 = _981 * 0.5;
    float _985 = _975 * _977;
    float _987 = _973 * _979;
    float _989 = _987 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _991 = _987 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _993 = _987 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].x, _989);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _991);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _993);
    float _1001 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _995);
    float _1003 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1005 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1011 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1013 = _799 + _1007;
    float _1015 = _749 + _1009;
    float _1017 = _731 + _1011;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1013 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1015 + _1023;
    float _1027 = _1021 * _1021;
    float _1029 = fma(_1025, _1025, _1027);
    float _1031 = sqrt(_1029);
    bool _1033 = _1031 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = _983;
    float _1037 = _1027;
    float _1039 = _1011;
    float _1041 = _985;
    float _1043 = _1017;
    if (!_1033)
    {
        _1035 = _1015;
    }
    float _1045 = _1035;
    float _1047 = _1045;
    if (!_1033)
    {
        _1037 = _1013;
    }
    float _1049 = _1037;
    float _1051 = _1049;
    if (!_1033)
    {
        _1039 = _1017;
    }
    float _1053 = _1039;
    bool _1055 = !_1033;
    float _1057 = _1053;
    if (!_1055)
    {
        float _1059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1063 = _1031 + _1061;
        float _1065 = _1017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = rsqrt(_1029);
        float _1069 = _1063 * _1059;
        float _1071 = _1069 * 0.15915493667125701904296875;
        float _1073 = _1071 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        float _1077 = _1071 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        float _1081 = _1075 + (-1.0);
        float _1083 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = fma(_1079, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1087 = fma(_1017, _1075, _1083);
        float _1089 = _1067 * _1085;
        float _1091 = fma(_1025, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1093 = fma(_1021, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1057 = _1087;
        _1047 = _1091;
        _1051 = _1093;
    }
    float _1095 = _1057;
    float _1097 = _1047;
    float _1099 = _1051;
    float _1101 = -_731;
    float _1103 = _1101 + _1095;
    float _1105 = -_749;
    float _1107 = _1105 + _1097;
    float _1109 = -_799;
    float _1111 = _1109 + _1099;
    float _1113 = _1103 * _1103;
    float _1115 = fma(_1107, _1107, _1113);
    float _1117 = fma(_1111, _1111, _1115);
    float _1119 = sqrt(_1117);
    bool _1121 = _1119 > 0.0;
    bool _1123 = !_1121;
    float _1125 = _1119;
    float _1127 = _1095;
    float _1129 = _1099;
    float _1131 = _1097;
    if (!_1123)
    {
        bool _1133 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1135 = _1029;
        if (_1133)
        {
            float _1137 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1135 = _1137;
        }
        float _1139 = _1135;
        if (_1133)
        {
            _1041 = _499;
        }
        float _1141 = _1041;
        float _1143 = _1141;
        if (_1133)
        {
            _1125 = _505;
        }
        float _1145 = _1125;
        float _1147 = _1145;
        if (_1133)
        {
            float _1149 = _499 * _1139;
            _1043 = _1149;
        }
        float _1151 = _1043;
        float _1153 = _1151;
        if (_1133)
        {
            float _1155 = _505 * _1139;
            _515 = _1155;
        }
        float _1157 = _515;
        float _1159 = _1157;
        if (_1133)
        {
            float _1161 = _507 * _1139;
            _517 = _1161;
        }
        float _1163 = _517;
        float _1165 = _1163;
        if (!_1133)
        {
            float _1167 = _123 + 1.0;
            float _1169 = _1167;
            if (!_163)
            {
                float _1171 = _1167 * _1167;
                float _1173 = _1171 * 0.5;
                _519 = _1173;
            }
            float _1175 = _519;
            float _1177 = _1175;
            if (!_163)
            {
                float _1179 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1177 = _1179;
            }
            float _1181 = _1177;
            bool _1183 = !_163;
            float _1185 = _1181;
            if (!_1183)
            {
                float _1187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1189 = log2(_1187);
                float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1193 = _1191 + 1.0;
                float _1195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1197 = _1189 * _1167;
                float _1199 = 1.0 / _1193;
                float _1201 = _1195 * 0.693147182464599609375;
                float _1203 = exp2(_1197);
                float _1205 = 1.0 / _1201;
                float _1207 = _1203 + (-1.0);
                float _1209 = -_1207;
                float _1211 = fma(_1209, _1205, _1167);
                float _1213 = _1211 * _1199;
                float _1215 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1185 = _1215;
            }
            float _1217 = _1185;
            float _1219 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1221 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1223 = !_163;
            if (!_1223)
            {
                float _1225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1227 = log2(_1225);
                float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1231 = _1229 + 1.0;
                float _1233 = 1.0 / _1231;
                float _1235 = _1227 * _1167;
                float _1237 = exp2(_1235);
                float _1239 = -_1237;
                float _1241 = _1239 + 1.0;
                float _1243 = _1241 * _1233;
                _1169 = _1243;
            }
            float _1245 = _1169;
            float _1247 = fma(_1245, _167, _1221);
            float _1249 = fma(_1245, _165, _1219);
            float _1251 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1253 = -_441;
            float _1255 = _1253 + _1247;
            float _1257 = -_443;
            float _1259 = _1257 + _1249;
            float _1261 = fma(_1245, _169, _1251);
            float _1263 = _1255 * _181;
            float _1265 = _1255 * _189;
            float _1267 = _1255 * _197;
            float _1269 = -_457;
            float _1271 = _1269 + _1261;
            float _1273 = fma(_1259, _179, _1263);
            float _1275 = fma(_1259, _187, _1265);
            float _1277 = fma(_1259, _195, _1267);
            float _1279 = fma(_1271, _183, _1273);
            float _1281 = fma(_1271, _191, _1275);
            float _1283 = fma(_1271, _199, _1277);
            _1147 = _1281;
            _1143 = _1279;
            _521 = _1283;
            _1153 = _1279;
            _1159 = _1281;
            _1165 = _1283;
        }
        float _1285 = _1147;
        float _1287 = _1143;
        float _1289 = _521;
        float _1291 = _1153;
        float _1293 = _1159;
        float _1295 = _1165;
        float _1297 = _1285 * _1285;
        float _1299 = rsqrt(_1117);
        float _1301 = fma(_1287, _1287, _1297);
        float _1303 = fma(_1289, _1289, _1301);
        float _1305 = sqrt(_1303);
        float _1307 = _1107 * _1299;
        float _1309 = _1103 * _1299;
        float _1311 = _1111 * _1299;
        bool _1313 = _1305 > 0.0;
        bool _1315 = !_1313;
        if (!_1315)
        {
            float _1317 = rsqrt(_1303);
            float _1319 = _1317 * _1285;
            float _1321 = _1317 * _1287;
            float _1323 = _1317 * _1289;
            float _1325 = _1309 * _1319;
            float _1327 = fma(_1307, _1321, _1325);
            float _1329 = fma(_1311, _1323, _1327);
            float _1331 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1333 = fma(_1291, _1331, _1097);
            float _1335 = fma(_1293, _1331, _1095);
            float _1337 = fma(_1295, _1331, _1099);
            _1127 = _1335;
            _1129 = _1337;
            _1131 = _1333;
        }
    }
    float _1339 = _1127;
    float _1341 = _1129;
    float _1343 = _1131;
    float _1345 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = -_901;
    float _1359 = _1357 + _1339;
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1345);
    float _1373 = -_907;
    float _1375 = _1373 + _1341;
    float _1377 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1371);
    float _1379 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1381 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1383 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1379);
    float _1385 = 1.0 / _1381;
    float _1387 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1383);
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1391 = _1389 + _1381;
    float _1393 = _1391 * _1385;
    float _1395 = _1393 * 0.5;
    float _1397 = -_899;
    float _1399 = _1397 + _1343;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1403 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
    float _1405 = _1395;
    float _1407 = _1359;
    float _1409 = _1399;
    float _1411 = _1375;
    float _1413 = _1381;
    if (_1369)
    {
        _1405 = 1.0;
    }
    float _1415 = _1405;
    float _1417 = 1.0 / _1403;
    float _1419 = _1415;
    if (!_1355)
    {
        float _1421 = _919 * _919;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_799;
        float _1427 = _1425 + _1341;
        float _1429 = -_749;
        float _1431 = _1429 + _1343;
        float _1433 = fma(_927, _927, _1421);
        float _1435 = -_731;
        float _1437 = _1435 + _1339;
        float _1439 = fma(_937, _937, _1433);
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1443 = sqrt(_1439);
        float _1445 = 1.0 / _965;
        float _1447 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1449 = precise::min(_1443, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1451 = _1449 * _1423;
        float _1453 = _1451 * _1445;
        float _1455 = _1447 * _1453;
        float _1457 = _1427 * _1453;
        float _1459 = fma(_1431, _1455, _911);
        float _1461 = fma(_1437, _1455, _905);
        float _1463 = fma(_1447, _1457, _923);
        _1407 = _1461;
        _1409 = _1459;
        _1411 = _1463;
        _1413 = _1453;
    }
    float _1465 = _1407;
    float _1467 = _1409;
    float _1469 = _1411;
    float _1471 = _1413;
    float _1473 = _1471;
    if (_1369)
    {
        _1473 = 1.0;
    }
    float _1475 = _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1479 = _1417 * _1477;
    float _1481 = _1475;
    float _1483 = _1479;
    if (!_1369)
    {
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1487 = _1485 * 0.15915493667125701904296875;
        float _1489 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1491 = _1487 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1493;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = _1505 * _1507;
        float _1515 = 1.0 / _1513;
        float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1519 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1517;
        float _1521 = 1.0 / _1519;
        float _1523 = _1511 * _1515;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1527 = fma(_1479, _1523, _1525);
        float _1529 = _1527 * _1521;
        float _1531 = precise::clamp(_1529, 0.0, 1.0);
        _259 = _1521;
        _1419 = _1531;
    }
    float _1533 = _259;
    float _1535 = _1419;
    float _1537 = _1533;
    if (!_1369)
    {
        float _1539 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1545 = _1541 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        float _1549 = _1543 * 0.15915493667125701904296875;
        float _1551 = _1541 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = 1.0 / _1547;
        float _1557 = _1549 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = _1553 * _1555;
        float _1563 = _1549 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        float _1567 = _1559 * _1561;
        float _1569 = 1.0 / _1567;
        float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1573 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1571;
        float _1575 = 1.0 / _1573;
        float _1577 = _1565 * _1569;
        float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1581 = fma(_1479, _1577, _1579);
        float _1583 = _1581 * _1575;
        float _1585 = precise::clamp(_1583, 0.0, 1.0);
        float _1587 = -_1585;
        float _1589 = _1587 + 1.0;
        _1537 = _1555;
        _1481 = _1589;
    }
    float _1591 = _1537;
    float _1593 = _1481;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1597 = _1465 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1601 = _1467 + _1599;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1469 + _1603;
    float _1607 = _1597 * _1597;
    float _1609 = fma(_1601, _1601, _1607);
    float _1611 = fma(_1605, _1605, _1609);
    float _1613 = rsqrt(_1611);
    float _1615 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1617 = _1601 * _1615;
    float _1619 = _1605 * _1615;
    float _1621 = _1617 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 + _1623;
    float _1627 = sqrt(_1625);
    bool _1629 = _1627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = _1627 + _1631;
    float _1635 = _1613;
    float _1637 = _1591;
    float _1639 = _1633;
    float _1641 = _1597;
    float _1643 = _1615;
    float _1645 = _1617;
    if (_1629)
    {
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1635 = _1647;
    }
    float _1649 = _1635;
    if (_1629)
    {
        float _1651 = rsqrt(_1625);
        _1637 = _1651;
    }
    float _1653 = _1637;
    float _1655 = _1653;
    if (_1629)
    {
        float _1657 = _1633 * _1649;
        _1639 = _1657;
    }
    float _1659 = _1639;
    if (_1629)
    {
        float _1661 = _1659 * 0.15915493667125701904296875;
        _1483 = _1661;
    }
    float _1663 = _1483;
    float _1665 = _1649;
    if (_1629)
    {
        float _1667 = _1663 * 6.283185482025146484375;
        float _1669 = sin(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1675 = precise::max(0.0, _1673);
    float _1677 = _1605;
    float _1679 = _1675;
    if (_1629)
    {
        float _1681 = _1663 * 6.283185482025146484375;
        float _1683 = cos(_1681);
        _1677 = _1683;
    }
    float _1685 = _1677;
    float _1687 = -_1615;
    float _1689 = -_1675;
    float _1691 = fma(_1597, _1687, _1689);
    if (!_1629)
    {
        _1641 = _1619;
    }
    float _1693 = _1641;
    float _1695 = _1693;
    if (_1629)
    {
        float _1697 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1679 = _1697;
    }
    float _1699 = _1679;
    float _1701 = sqrt(_1611);
    float _1703 = _1671;
    float _1705 = _1699;
    if (_1629)
    {
        float _1707 = fma(_1671, _1699, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = _1709;
    if (_1629)
    {
        float _1713 = _1685 + (-1.0);
        _1705 = _1713;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    if (_1629)
    {
        float _1719 = _1653 * _1709;
        _959 = _1719;
    }
    float _1721 = _959;
    if (!_1629)
    {
        _1655 = _1691;
    }
    float _1723 = _1655;
    float _1725 = _1723;
    if (_1629)
    {
        float _1727 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1727;
    }
    float _1729 = _1643;
    if (_1629)
    {
        float _1731 = _1617 * _1721;
        _1645 = _1731;
    }
    float _1733 = _1645;
    if (!_1629)
    {
        _1711 = _1621;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    if (_1629)
    {
        float _1739 = _1619 * _1721;
        _1695 = _1739;
    }
    float _1741 = _1695;
    if (_1629)
    {
        float _1743 = fma(_1691, _1685, _1729);
        _1725 = _1743;
    }
    float _1745 = _1725;
    if (_1629)
    {
        float _1747 = _1733 * _1733;
        _1737 = _1747;
    }
    float _1749 = _1737;
    if (!_1629)
    {
        _1717 = _1623;
    }
    float _1751 = _1717;
    float _1753 = _1751;
    if (_1629)
    {
        float _1755 = _1741 * _1741;
        _1753 = _1755;
    }
    float _1757 = _1753;
    float _1759 = fma(_1745, _1745, _1749);
    float _1761 = _1759 + _1757;
    float _1763 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1767 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1765);
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1773 = rsqrt(_1761);
    float _1775 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1777 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1779 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1771);
    float _1781 = -_1769;
    float _1783 = _1781 + 1.0;
    float _1785 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1787 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1777);
    float _1789 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1779);
    float _1791 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1775);
    float _1793 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1785);
    float _1795 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1797 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1799 = abs(_1783);
    float _1801 = log2(_1799);
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1805 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1807 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1809 = _1773 * _1733;
    float _1811 = _1773 * _1745;
    float _1813 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1793);
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1807);
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1819 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1821 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1823 = _1773 * _1741;
    float _1825 = -_1817;
    float _1827 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1831 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1815);
    float _1833 = -_1821;
    float _1835 = fma(_1833, _1819, 1.0);
    float _1837 = -_1823;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1841 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1831);
    float _1845 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1847 = fma(_1839, -0.5, 0.5);
    float _1849 = log2(_1835);
    float _1851 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1853 = fma(_1839, 0.5, 0.5);
    float _1855 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1845);
    float _1857 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1851);
    float _1859 = _1811 + 1.0;
    float _1861 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1855);
    float _1863 = 1.0 / _1843;
    float _1865 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1857);
    float _1867 = fma(_1853, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1869 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1871 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1865);
    float _1873 = fma(_1853, _1867, -0.212114393711090087890625);
    float _1875 = exp2(_1841);
    float _1877 = _1849 * 0.693147182464599609375;
    float _1879 = fma(_1853, _1873, 1.570728778839111328125);
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1883 = sqrt(_1847);
    float _1885 = _1869 * _1863;
    float _1887 = _1871 * _1863;
    float _1889 = fma(_1885, 0.5, 0.5);
    float _1891 = fma(_1887, -0.5, 0.5);
    float _1893 = -_1811;
    float _1895 = fma(_1875, _1859, _1893);
    float3 _4875 = float3(_1889, _1891, _1881);
    float _1897 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).x;
    float3 _4886 = float3(_1889, _1891, _1881);
    float4 _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4886, float3(0.0), isnan(_4886)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4886, float3(0.0), isnan(_4886)), level(0.0)).xyzw;
    float _1902 = _1900.x;
    float _1904 = _1900.y;
    float _1906 = _1900.z;
    float _1908 = _1900.w;
    float _1910 = fma(_1895, 0.5, 0.5);
    float _1912 = _1883 * 0.636619746685028076171875;
    float _1914 = -_1879;
    float _1916 = fma(_1912, _1914, 1.0);
    float2 _4913 = float2(_1916, _1910);
    float3 _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).xyz;
    float _1922 = _1920.x;
    float _1924 = _1920.y;
    float _1926 = _1920.z;
    float _1928 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1930 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1932 = _1535 > 0.0;
    bool _1934 = isnan(_1535);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan(0.0);
    bool _1940 = _1936 || _1938;
    float _1942 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1930);
    float _1944 = exp2(_1928);
    float _1946 = _1535 * _1593;
    bool _1948 = _1593 <= 0.0;
    bool _1950 = !_1940;
    bool _1952 = _1948 || _1950;
    float _1954 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1942);
    float _1956 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1954);
    float _1958 = -_1944;
    float _1960 = _1958 + 1.0;
    float _1962 = _1956 + _1843;
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1966 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1968 = _1962 * 0.5;
    float _1970 = _1966 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _1968;
    out.m_68.w = _1843;
    out.gl_Position.x = _1869;
    out.gl_Position.y = _1871;
    out.gl_Position.z = _1956;
    out.gl_Position.w = _1843;
    out.m_45.x = _1970;
    float _1972 = _1964 * _1897;
    float _1974 = -_1964;
    float _1976 = _1974 + 1.0;
    float _1978 = _1908 * _1972;
    float _1980 = _1926 * _1972;
    float _1982 = fma(_1922, _1978, _1902);
    float _1984 = fma(_1924, _1978, _1904);
    float _1986 = _1908 * _1976;
    float _1988 = fma(_1908, _1980, _1906);
    out.m_70.x = _1982;
    out.m_70.y = _1984;
    out.m_70.z = _1988;
    out.m_70.w = _1986;
    if (!_1952)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1990;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _647 = false;
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
        float _2047 = as_type<float>(_105);
        out.gl_Position.z = _2047;
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
        float _2116 = as_type<float>(_141);
        out.gl_Position.z = _2116;
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
    float _179 = in.m_56.x;
    float _181 = in.m_56.y;
    float _183 = in.m_56.z;
    float _185 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _187 = in.m_58.x;
    float _189 = in.m_58.y;
    float _191 = in.m_58.z;
    float _193 = floor(_185);
    float _195 = in.m_60.x;
    float _197 = in.m_60.y;
    float _199 = in.m_60.z;
    float _201 = _185 * 6.283185482025146484375;
    int _203 = as_type<int>(_149) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_149) & 2;
    bool _209 = _207 != 0;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = _201 * 0.15915493667125701904296875;
    bool _217 = !_205;
    int _219 = _217 ? (-1090519040) : 1056964608;
    float _221 = _215 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_209;
    int _227 = _225 ? (-1090519040) : 1056964608;
    float _229 = -_193;
    float _231 = _185 + _229;
    float _233 = _185;
    float _235 = _151;
    if (!_163)
    {
        float _237 = _151 * _151;
        float _239 = _237 * 0.5;
        _233 = _239;
    }
    float _241 = _233;
    bool _243 = _231 < 0.5;
    float _245 = float(_243);
    float _247 = _241;
    if (!_163)
    {
        float _249 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _249;
    }
    float _251 = _247;
    bool _253 = !_163;
    float _255 = _251;
    float _257 = _153;
    float _259 = _183;
    if (!_253)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _151 * _263;
        float _273 = 1.0 / _267;
        float _275 = _269 * 0.693147182464599609375;
        float _277 = exp2(_271);
        float _279 = 1.0 / _275;
        float _281 = _277 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _279, _151);
        float _287 = _285 * _273;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _289;
    }
    float _291 = _255;
    bool _293 = !_163;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _151 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _235 = _313;
    }
    float _315 = _235;
    float _317 = fma(_223, 0.5, 0.5);
    float _319 = -_231;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _327 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = -_245;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_317;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_315, _165, _323);
    float _339 = fma(_315, _167, _325);
    float _341 = fma(_315, _169, _327);
    float _343 = _327;
    if (!_163)
    {
        float _345 = _123 * _123;
        float _347 = _345 * 0.5;
        _343 = _347;
    }
    float _349 = _343;
    float _351 = fma(_337, _153, _171);
    float _353 = fma(_339, _153, _173);
    float _355 = fma(_341, _153, _175);
    float _357 = _349;
    if (!_163)
    {
        float _359 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _361;
    if (!_163)
    {
        _257 = _123;
    }
    float _365 = _257;
    bool _367 = !_163;
    float _369 = _365;
    if (!_367)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = _123 * _373;
        float _383 = exp2(_381);
        float _385 = _379 * 0.693147182464599609375;
        float _387 = 1.0 / _385;
        float _389 = 1.0 / _377;
        float _391 = _383 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _387, _123);
        float _397 = _395 * _389;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _399;
    }
    float _401 = _363;
    bool _403 = !_163;
    if (!_403)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _369 = _423;
    }
    float _425 = _369;
    float _427 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _435 = _433 != 0;
    float _437 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _441 = fma(_425, _167, _427);
    out.m_62.x = as_type<float>(_219);
    out.m_62.y = as_type<float>(_227);
    float _443 = fma(_425, _165, _437);
    bool _445 = !_431;
    int _447 = _445 ? 0 : 1;
    float _449 = -_441;
    float _451 = _339 + _449;
    bool _453 = !_213;
    int _455 = _453 ? 0 : 1;
    float _457 = fma(_425, _169, _439);
    bool _459 = !_435;
    int _461 = _459 ? 0 : 1;
    float _463 = -_443;
    float _465 = _337 + _463;
    int _467 = abs(_447);
    float _469 = _451 * _181;
    float _471 = _451 * _189;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _475 = _451 * _197;
    int _477 = abs(_455);
    float _479 = fma(_465, _179, _469);
    int _481 = abs(_461);
    float _483 = fma(_465, _187, _471);
    float _485 = float(_467);
    float _487 = fma(_465, _195, _475);
    float _489 = float(_477);
    float _491 = -_457;
    float _493 = _341 + _491;
    float _495 = abs(_321);
    float _497 = _485 * _495;
    float _499 = fma(_493, _183, _479);
    float _501 = float(_481);
    float _503 = fma(_489, _335, _497);
    float _505 = fma(_493, _191, _483);
    float _507 = fma(_493, _199, _487);
    float _509 = abs(_331);
    float _511 = fma(_501, _509, _503);
    bool _513 = !_473;
    float _515 = _499;
    float _517 = _505;
    float _519 = _507;
    float _521 = _507;
    float _537;
    if (!_513)
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
    float _553 = in.m_54.x;
    float _555 = in.m_54.y;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _569;
    bool _573 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _575 = isnan(_547);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_567;
    float _587 = _585 + 1.0;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _589;
    float _593 = 1.0 / _571;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _597 = _583 * _587;
    float _599 = -_583;
    float _601 = _599 + 1.0;
    float _603 = _551 * _593;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _605;
    float _609 = fma(_591, _603, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _611 = fma(_607, _603, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _613 = _609 * _597;
    float _615 = _611 * _597;
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _615);
    float _621 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].x, _617);
    float _623 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].y, _619);
    float _625 = _621 * _553;
    float _627 = _623 * _555;
    bool _629 = !_595;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_89);
        float _651 = 1.0 / _649;
        float _653 = _123 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_58.w;
    float _659 = _353 * _189;
    float _661 = _353 * _181;
    float _663 = _353 * _197;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _665;
    float _669 = in.m_56.w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _675 = fma(_351, _187, _659);
    float _677 = 1.0 / _667;
    float _679 = in.m_60.w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _683 = _655 + _681;
    float _685 = fma(_351, _179, _661);
    float _687 = fma(_351, _195, _663);
    float _689 = fma(_355, _191, _675);
    float _691 = fma(_355, _183, _685);
    float _693 = 1.0 / _673;
    bool _695 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _697 = isnan(_655);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _709 = _655 + _707;
    float _711 = fma(_355, _199, _687);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _713;
    float _717 = _683 * _677;
    bool _719 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _721 = isnan(_655);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _689 + _657;
    bool _733 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _735 = isnan(_655);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_705;
    float _747 = _745 + 1.0;
    float _749 = _691 + _669;
    float _751 = -_729;
    float _753 = _751 + 1.0;
    float _755 = _709 * _693;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _757;
    float _761 = fma(_715, _717, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _763 = _743 * _747;
    float _765 = _705 * _753;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _767;
    float _771 = fma(_759, _717, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _783 = _731 + _781;
    float _785 = -_743;
    float _787 = _785 + 1.0;
    float _789 = _761 * _763;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _795 = fma(_769, _717, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _797 = _771 * _763;
    float _799 = _711 + _679;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = _749 + _801;
    float _805 = _783 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _807 = fma(_779, _755, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _809 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].x, _789);
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _813 = _799 + _811;
    float _815 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[28].x, _805);
    float _817 = _795 * _763;
    float _819 = fma(_807, _765, _809);
    float _821 = fma(_793, _755, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _823 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[28].z, _815);
    float _825 = fma(_775, _755, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _827 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].x, _819);
    float _829 = _783 * _783;
    float _831 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].y, _797);
    bool _833 = _823 >= 0.0;
    float _835 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].z, _817);
    float _837 = fma(_803, _803, _829);
    float _839 = fma(_821, _765, _831);
    float _841 = fma(_825, _765, _835);
    float _843 = fma(_813, _813, _837);
    float _845 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].y, _839);
    float _847 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].z, _841);
    float _849 = _511 * _625;
    float _851 = rsqrt(_843);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _859 = _847 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _861 = 0.0;
    int _863 = as_type<int>(_859);
    if (_833)
    {
        _861 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _865 = _861;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _871 = _849 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _873 = _845 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _875 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _881 = _871 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _883 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _887;
    if (_833)
    {
        float _893 = _865 * 5.0;
        _863 = as_type<int>(_893);
    }
    int _895 = _863;
    float _897 = _881 * _851;
    if (_833)
    {
        out.m_45.x = 0.0;
    }
    float _899 = _803 * _897;
    out.m_64.x = _883;
    out.m_64.y = _885;
    out.m_64.z = _887;
    out.m_64.w = _855;
    float _901 = _783 * _897;
    out.m_66.x = _875;
    out.m_66.y = _889;
    out.m_66.z = _877;
    out.m_66.w = _879;
    if (_833)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3320 = as_type<float>(_895);
        out.gl_Position.z = _3320;
    }
    if (_833)
    {
        return out;
    }
    float _903 = -_901;
    float _905 = _731 + _903;
    float _907 = _813 * _897;
    float _909 = -_899;
    float _911 = _749 + _909;
    float _913 = -_901;
    float _915 = _783 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _919 = _905 + _917;
    float _921 = -_907;
    float _923 = _799 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _911 + _925;
    float _929 = -_899;
    float _931 = _803 + _929;
    float _933 = _919 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _923 + _935;
    float _939 = _915 * _915;
    float _941 = -_907;
    float _943 = _813 + _941;
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[28].x, _933);
    float _947 = _511 * _627;
    float _949 = fma(_931, _931, _939);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[28].z, _945);
    float _953 = fma(_943, _943, _949);
    bool _955 = _951 >= 0.0;
    float _957 = sqrt(_953);
    float _959 = _923;
    if (_955)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _961 = _891;
    int _963 = as_type<int>(_961);
    if (_955)
    {
        out.m_45.x = 0.0;
    }
    float _965 = _851 * _957;
    if (_955)
    {
        float _967 = _961 * 5.0;
        _963 = as_type<int>(_967);
    }
    int _969 = _963;
    if (_955)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3438 = as_type<float>(_969);
        out.gl_Position.z = _3438;
    }
    if (_955)
    {
        return out;
    }
    float _971 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_227));
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_219));
    float _977 = _871 * _965;
    float _979 = _965 * _971;
    float _981 = _965 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _983 = _981 * 0.5;
    float _985 = _975 * _977;
    float _987 = _973 * _979;
    float _989 = _987 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _991 = _987 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _993 = _987 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].x, _989);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _991);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _993);
    float _1001 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _995);
    float _1003 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1005 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1011 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1013 = _799 + _1007;
    float _1015 = _749 + _1009;
    float _1017 = _731 + _1011;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1013 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1015 + _1023;
    float _1027 = _1021 * _1021;
    float _1029 = fma(_1025, _1025, _1027);
    float _1031 = sqrt(_1029);
    bool _1033 = _1031 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = _983;
    float _1037 = _1027;
    float _1039 = _1011;
    float _1041 = _985;
    float _1043 = _1017;
    if (!_1033)
    {
        _1035 = _1015;
    }
    float _1045 = _1035;
    float _1047 = _1045;
    if (!_1033)
    {
        _1037 = _1013;
    }
    float _1049 = _1037;
    float _1051 = _1049;
    if (!_1033)
    {
        _1039 = _1017;
    }
    float _1053 = _1039;
    bool _1055 = !_1033;
    float _1057 = _1053;
    if (!_1055)
    {
        float _1059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1063 = _1031 + _1061;
        float _1065 = _1017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = rsqrt(_1029);
        float _1069 = _1063 * _1059;
        float _1071 = _1069 * 0.15915493667125701904296875;
        float _1073 = _1071 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        float _1077 = _1071 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        float _1081 = _1075 + (-1.0);
        float _1083 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = fma(_1079, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1087 = fma(_1017, _1075, _1083);
        float _1089 = _1067 * _1085;
        float _1091 = fma(_1025, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1093 = fma(_1021, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1057 = _1087;
        _1047 = _1091;
        _1051 = _1093;
    }
    float _1095 = _1057;
    float _1097 = _1047;
    float _1099 = _1051;
    float _1101 = -_731;
    float _1103 = _1101 + _1095;
    float _1105 = -_749;
    float _1107 = _1105 + _1097;
    float _1109 = -_799;
    float _1111 = _1109 + _1099;
    float _1113 = _1103 * _1103;
    float _1115 = fma(_1107, _1107, _1113);
    float _1117 = fma(_1111, _1111, _1115);
    float _1119 = sqrt(_1117);
    bool _1121 = _1119 > 0.0;
    bool _1123 = !_1121;
    float _1125 = _1119;
    float _1127 = _1095;
    float _1129 = _1099;
    float _1131 = _1097;
    if (!_1123)
    {
        bool _1133 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1135 = _1029;
        if (_1133)
        {
            float _1137 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1135 = _1137;
        }
        float _1139 = _1135;
        if (_1133)
        {
            _1041 = _499;
        }
        float _1141 = _1041;
        float _1143 = _1141;
        if (_1133)
        {
            _1125 = _505;
        }
        float _1145 = _1125;
        float _1147 = _1145;
        if (_1133)
        {
            float _1149 = _499 * _1139;
            _1043 = _1149;
        }
        float _1151 = _1043;
        float _1153 = _1151;
        if (_1133)
        {
            float _1155 = _505 * _1139;
            _515 = _1155;
        }
        float _1157 = _515;
        float _1159 = _1157;
        if (_1133)
        {
            float _1161 = _507 * _1139;
            _517 = _1161;
        }
        float _1163 = _517;
        float _1165 = _1163;
        if (!_1133)
        {
            float _1167 = _123 + 1.0;
            float _1169 = _1167;
            if (!_163)
            {
                float _1171 = _1167 * _1167;
                float _1173 = _1171 * 0.5;
                _519 = _1173;
            }
            float _1175 = _519;
            float _1177 = _1175;
            if (!_163)
            {
                float _1179 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1177 = _1179;
            }
            float _1181 = _1177;
            bool _1183 = !_163;
            float _1185 = _1181;
            if (!_1183)
            {
                float _1187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1189 = log2(_1187);
                float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1193 = _1191 + 1.0;
                float _1195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1197 = _1189 * _1167;
                float _1199 = 1.0 / _1193;
                float _1201 = _1195 * 0.693147182464599609375;
                float _1203 = exp2(_1197);
                float _1205 = 1.0 / _1201;
                float _1207 = _1203 + (-1.0);
                float _1209 = -_1207;
                float _1211 = fma(_1209, _1205, _1167);
                float _1213 = _1211 * _1199;
                float _1215 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1185 = _1215;
            }
            float _1217 = _1185;
            float _1219 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1221 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1223 = !_163;
            if (!_1223)
            {
                float _1225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1227 = log2(_1225);
                float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1231 = _1229 + 1.0;
                float _1233 = 1.0 / _1231;
                float _1235 = _1227 * _1167;
                float _1237 = exp2(_1235);
                float _1239 = -_1237;
                float _1241 = _1239 + 1.0;
                float _1243 = _1241 * _1233;
                _1169 = _1243;
            }
            float _1245 = _1169;
            float _1247 = fma(_1245, _167, _1221);
            float _1249 = fma(_1245, _165, _1219);
            float _1251 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1253 = -_441;
            float _1255 = _1253 + _1247;
            float _1257 = -_443;
            float _1259 = _1257 + _1249;
            float _1261 = fma(_1245, _169, _1251);
            float _1263 = _1255 * _181;
            float _1265 = _1255 * _189;
            float _1267 = _1255 * _197;
            float _1269 = -_457;
            float _1271 = _1269 + _1261;
            float _1273 = fma(_1259, _179, _1263);
            float _1275 = fma(_1259, _187, _1265);
            float _1277 = fma(_1259, _195, _1267);
            float _1279 = fma(_1271, _183, _1273);
            float _1281 = fma(_1271, _191, _1275);
            float _1283 = fma(_1271, _199, _1277);
            _1147 = _1281;
            _1143 = _1279;
            _521 = _1283;
            _1153 = _1279;
            _1159 = _1281;
            _1165 = _1283;
        }
        float _1285 = _1147;
        float _1287 = _1143;
        float _1289 = _521;
        float _1291 = _1153;
        float _1293 = _1159;
        float _1295 = _1165;
        float _1297 = _1285 * _1285;
        float _1299 = rsqrt(_1117);
        float _1301 = fma(_1287, _1287, _1297);
        float _1303 = fma(_1289, _1289, _1301);
        float _1305 = sqrt(_1303);
        float _1307 = _1107 * _1299;
        float _1309 = _1103 * _1299;
        float _1311 = _1111 * _1299;
        bool _1313 = _1305 > 0.0;
        bool _1315 = !_1313;
        if (!_1315)
        {
            float _1317 = rsqrt(_1303);
            float _1319 = _1317 * _1285;
            float _1321 = _1317 * _1287;
            float _1323 = _1317 * _1289;
            float _1325 = _1309 * _1319;
            float _1327 = fma(_1307, _1321, _1325);
            float _1329 = fma(_1311, _1323, _1327);
            float _1331 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1333 = fma(_1291, _1331, _1097);
            float _1335 = fma(_1293, _1331, _1095);
            float _1337 = fma(_1295, _1331, _1099);
            _1127 = _1335;
            _1129 = _1337;
            _1131 = _1333;
        }
    }
    float _1339 = _1127;
    float _1341 = _1129;
    float _1343 = _1131;
    float _1345 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = -_901;
    float _1359 = _1357 + _1339;
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1345);
    float _1373 = -_907;
    float _1375 = _1373 + _1341;
    float _1377 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1371);
    float _1379 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1381 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1383 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1379);
    float _1385 = 1.0 / _1381;
    float _1387 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1383);
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1391 = _1389 + _1381;
    float _1393 = _1391 * _1385;
    float _1395 = _1393 * 0.5;
    float _1397 = -_899;
    float _1399 = _1397 + _1343;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1403 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
    float _1405 = _1395;
    float _1407 = _1359;
    float _1409 = _1399;
    float _1411 = _1375;
    float _1413 = _1381;
    if (_1369)
    {
        _1405 = 1.0;
    }
    float _1415 = _1405;
    float _1417 = 1.0 / _1403;
    float _1419 = _1415;
    if (!_1355)
    {
        float _1421 = _919 * _919;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_799;
        float _1427 = _1425 + _1341;
        float _1429 = -_749;
        float _1431 = _1429 + _1343;
        float _1433 = fma(_927, _927, _1421);
        float _1435 = -_731;
        float _1437 = _1435 + _1339;
        float _1439 = fma(_937, _937, _1433);
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1443 = sqrt(_1439);
        float _1445 = 1.0 / _965;
        float _1447 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1449 = precise::min(_1443, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1451 = _1449 * _1423;
        float _1453 = _1451 * _1445;
        float _1455 = _1447 * _1453;
        float _1457 = _1427 * _1453;
        float _1459 = fma(_1431, _1455, _911);
        float _1461 = fma(_1437, _1455, _905);
        float _1463 = fma(_1447, _1457, _923);
        _1407 = _1461;
        _1409 = _1459;
        _1411 = _1463;
        _1413 = _1453;
    }
    float _1465 = _1407;
    float _1467 = _1409;
    float _1469 = _1411;
    float _1471 = _1413;
    float _1473 = _1471;
    if (_1369)
    {
        _1473 = 1.0;
    }
    float _1475 = _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1479 = _1417 * _1477;
    float _1481 = _1475;
    float _1483 = _1479;
    if (!_1369)
    {
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1487 = _1485 * 0.15915493667125701904296875;
        float _1489 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1491 = _1487 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1493;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = _1505 * _1507;
        float _1515 = 1.0 / _1513;
        float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1519 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1517;
        float _1521 = 1.0 / _1519;
        float _1523 = _1511 * _1515;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1527 = fma(_1479, _1523, _1525);
        float _1529 = _1527 * _1521;
        float _1531 = precise::clamp(_1529, 0.0, 1.0);
        _259 = _1521;
        _1419 = _1531;
    }
    float _1533 = _259;
    float _1535 = _1419;
    float _1537 = _1533;
    if (!_1369)
    {
        float _1539 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1545 = _1541 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        float _1549 = _1543 * 0.15915493667125701904296875;
        float _1551 = _1541 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = 1.0 / _1547;
        float _1557 = _1549 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = _1553 * _1555;
        float _1563 = _1549 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        float _1567 = _1559 * _1561;
        float _1569 = 1.0 / _1567;
        float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1573 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1571;
        float _1575 = 1.0 / _1573;
        float _1577 = _1565 * _1569;
        float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1581 = fma(_1479, _1577, _1579);
        float _1583 = _1581 * _1575;
        float _1585 = precise::clamp(_1583, 0.0, 1.0);
        float _1587 = -_1585;
        float _1589 = _1587 + 1.0;
        _1537 = _1555;
        _1481 = _1589;
    }
    float _1591 = _1537;
    float _1593 = _1481;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1597 = _1465 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1601 = _1467 + _1599;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1469 + _1603;
    float _1607 = _1597 * _1597;
    float _1609 = fma(_1601, _1601, _1607);
    float _1611 = fma(_1605, _1605, _1609);
    float _1613 = rsqrt(_1611);
    float _1615 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1617 = _1601 * _1615;
    float _1619 = _1605 * _1615;
    float _1621 = _1617 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 + _1623;
    float _1627 = sqrt(_1625);
    bool _1629 = _1627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = _1627 + _1631;
    float _1635 = _1613;
    float _1637 = _1591;
    float _1639 = _1633;
    float _1641 = _1597;
    float _1643 = _1615;
    float _1645 = _1617;
    if (_1629)
    {
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1635 = _1647;
    }
    float _1649 = _1635;
    if (_1629)
    {
        float _1651 = rsqrt(_1625);
        _1637 = _1651;
    }
    float _1653 = _1637;
    float _1655 = _1653;
    if (_1629)
    {
        float _1657 = _1633 * _1649;
        _1639 = _1657;
    }
    float _1659 = _1639;
    if (_1629)
    {
        float _1661 = _1659 * 0.15915493667125701904296875;
        _1483 = _1661;
    }
    float _1663 = _1483;
    float _1665 = _1649;
    if (_1629)
    {
        float _1667 = _1663 * 6.283185482025146484375;
        float _1669 = sin(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1675 = precise::max(0.0, _1673);
    float _1677 = _1605;
    float _1679 = _1675;
    if (_1629)
    {
        float _1681 = _1663 * 6.283185482025146484375;
        float _1683 = cos(_1681);
        _1677 = _1683;
    }
    float _1685 = _1677;
    float _1687 = -_1615;
    float _1689 = -_1675;
    float _1691 = fma(_1597, _1687, _1689);
    if (!_1629)
    {
        _1641 = _1619;
    }
    float _1693 = _1641;
    float _1695 = _1693;
    if (_1629)
    {
        float _1697 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1679 = _1697;
    }
    float _1699 = _1679;
    float _1701 = sqrt(_1611);
    float _1703 = _1671;
    float _1705 = _1699;
    if (_1629)
    {
        float _1707 = fma(_1671, _1699, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = _1709;
    if (_1629)
    {
        float _1713 = _1685 + (-1.0);
        _1705 = _1713;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    if (_1629)
    {
        float _1719 = _1653 * _1709;
        _959 = _1719;
    }
    float _1721 = _959;
    if (!_1629)
    {
        _1655 = _1691;
    }
    float _1723 = _1655;
    float _1725 = _1723;
    if (_1629)
    {
        float _1727 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1727;
    }
    float _1729 = _1643;
    if (_1629)
    {
        float _1731 = _1617 * _1721;
        _1645 = _1731;
    }
    float _1733 = _1645;
    if (!_1629)
    {
        _1711 = _1621;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    if (_1629)
    {
        float _1739 = _1619 * _1721;
        _1695 = _1739;
    }
    float _1741 = _1695;
    if (_1629)
    {
        float _1743 = fma(_1691, _1685, _1729);
        _1725 = _1743;
    }
    float _1745 = _1725;
    if (_1629)
    {
        float _1747 = _1733 * _1733;
        _1737 = _1747;
    }
    float _1749 = _1737;
    if (!_1629)
    {
        _1717 = _1623;
    }
    float _1751 = _1717;
    float _1753 = _1751;
    if (_1629)
    {
        float _1755 = _1741 * _1741;
        _1753 = _1755;
    }
    float _1757 = _1753;
    float _1759 = fma(_1745, _1745, _1749);
    float _1761 = _1759 + _1757;
    float _1763 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1767 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1765);
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1773 = rsqrt(_1761);
    float _1775 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1777 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1779 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1771);
    float _1781 = -_1769;
    float _1783 = _1781 + 1.0;
    float _1785 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1787 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1777);
    float _1789 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1779);
    float _1791 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1775);
    float _1793 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1785);
    float _1795 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1797 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1799 = abs(_1783);
    float _1801 = log2(_1799);
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1805 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1807 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1809 = _1773 * _1733;
    float _1811 = _1773 * _1745;
    float _1813 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1793);
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1807);
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1819 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1821 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1823 = _1773 * _1741;
    float _1825 = -_1817;
    float _1827 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1831 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1815);
    float _1833 = -_1821;
    float _1835 = fma(_1833, _1819, 1.0);
    float _1837 = -_1823;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1841 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1831);
    float _1845 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1847 = fma(_1839, -0.5, 0.5);
    float _1849 = log2(_1835);
    float _1851 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1853 = fma(_1839, 0.5, 0.5);
    float _1855 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1845);
    float _1857 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1851);
    float _1859 = _1811 + 1.0;
    float _1861 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1855);
    float _1863 = 1.0 / _1843;
    float _1865 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1857);
    float _1867 = fma(_1853, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1869 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1871 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1865);
    float _1873 = fma(_1853, _1867, -0.212114393711090087890625);
    float _1875 = exp2(_1841);
    float _1877 = _1849 * 0.693147182464599609375;
    float _1879 = fma(_1853, _1873, 1.570728778839111328125);
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1883 = sqrt(_1847);
    float _1885 = _1869 * _1863;
    float _1887 = _1871 * _1863;
    float _1889 = fma(_1885, 0.5, 0.5);
    float _1891 = fma(_1887, -0.5, 0.5);
    float _1893 = -_1811;
    float _1895 = fma(_1875, _1859, _1893);
    float3 _4875 = float3(_1889, _1891, _1881);
    float _1897 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).x;
    float3 _4886 = float3(_1889, _1891, _1881);
    float4 _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4886, float3(0.0), isnan(_4886)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4886, float3(0.0), isnan(_4886)), level(0.0)).xyzw;
    float _1902 = _1900.x;
    float _1904 = _1900.y;
    float _1906 = _1900.z;
    float _1908 = _1900.w;
    float _1910 = fma(_1895, 0.5, 0.5);
    float _1912 = _1883 * 0.636619746685028076171875;
    float _1914 = -_1879;
    float _1916 = fma(_1912, _1914, 1.0);
    float2 _4913 = float2(_1916, _1910);
    float3 _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).xyz;
    float _1922 = _1920.x;
    float _1924 = _1920.y;
    float _1926 = _1920.z;
    float _1928 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1930 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1932 = _1535 > 0.0;
    bool _1934 = isnan(_1535);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan(0.0);
    bool _1940 = _1936 || _1938;
    float _1942 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1930);
    float _1944 = exp2(_1928);
    float _1946 = _1535 * _1593;
    bool _1948 = _1593 <= 0.0;
    bool _1950 = !_1940;
    bool _1952 = _1948 || _1950;
    float _1954 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1942);
    float _1956 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1954);
    float _1958 = -_1944;
    float _1960 = _1958 + 1.0;
    float _1962 = _1956 + _1843;
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1966 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1968 = _1962 * 0.5;
    float _1970 = _1966 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _1968;
    out.m_68.w = _1843;
    out.gl_Position.x = _1869;
    out.gl_Position.y = _1871;
    out.gl_Position.z = _1956;
    out.gl_Position.w = _1843;
    out.m_45.x = _1970;
    float _1972 = _1964 * _1897;
    float _1974 = -_1964;
    float _1976 = _1974 + 1.0;
    float _1978 = _1908 * _1972;
    float _1980 = _1926 * _1972;
    float _1982 = fma(_1922, _1978, _1902);
    float _1984 = fma(_1924, _1978, _1904);
    float _1986 = _1908 * _1976;
    float _1988 = fma(_1908, _1980, _1906);
    out.m_70.x = _1982;
    out.m_70.y = _1984;
    out.m_70.z = _1988;
    out.m_70.w = _1986;
    if (!_1952)
    {
        return out;
    }
    float _1990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1990;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _647 = false;
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
        float _2047 = as_type<float>(_105);
        out.gl_Position.z = _2047;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2116 = as_type<float>(_141);
        out.gl_Position.z = _2116;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _179 = in.m_56.x;
    float _181 = in.m_56.y;
    float _183 = in.m_56.z;
    float _185 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _187 = in.m_58.x;
    float _189 = in.m_58.y;
    float _191 = in.m_58.z;
    float _193 = floor(_185);
    float _195 = in.m_60.x;
    float _197 = in.m_60.y;
    float _199 = in.m_60.z;
    float _201 = _185 * 6.283185482025146484375;
    int _203 = as_type<int>(_149) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_149) & 2;
    bool _209 = _207 != 0;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = _201 * 0.15915493667125701904296875;
    bool _217 = !_205;
    int _219 = _217 ? (-1090519040) : 1056964608;
    float _221 = _215 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_209;
    int _227 = _225 ? (-1090519040) : 1056964608;
    float _229 = -_193;
    float _231 = _185 + _229;
    float _233 = _185;
    float _235 = _151;
    if (!_163)
    {
        float _237 = _151 * _151;
        float _239 = _237 * 0.5;
        _233 = _239;
    }
    float _241 = _233;
    bool _243 = _231 < 0.5;
    float _245 = float(_243);
    float _247 = _241;
    if (!_163)
    {
        float _249 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _249;
    }
    float _251 = _247;
    bool _253 = !_163;
    float _255 = _251;
    float _257 = _153;
    float _259 = _183;
    if (!_253)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _151 * _263;
        float _273 = 1.0 / _267;
        float _275 = _269 * 0.693147182464599609375;
        float _277 = exp2(_271);
        float _279 = 1.0 / _275;
        float _281 = _277 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _279, _151);
        float _287 = _285 * _273;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _289;
    }
    float _291 = _255;
    bool _293 = !_163;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _151 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _235 = _313;
    }
    float _315 = _235;
    float _317 = fma(_223, 0.5, 0.5);
    float _319 = -_231;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _327 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = -_245;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_317;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_315, _165, _323);
    float _339 = fma(_315, _167, _325);
    float _341 = fma(_315, _169, _327);
    float _343 = _327;
    if (!_163)
    {
        float _345 = _123 * _123;
        float _347 = _345 * 0.5;
        _343 = _347;
    }
    float _349 = _343;
    float _351 = fma(_337, _153, _171);
    float _353 = fma(_339, _153, _173);
    float _355 = fma(_341, _153, _175);
    float _357 = _349;
    if (!_163)
    {
        float _359 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _361;
    if (!_163)
    {
        _257 = _123;
    }
    float _365 = _257;
    bool _367 = !_163;
    float _369 = _365;
    if (!_367)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = _123 * _373;
        float _383 = exp2(_381);
        float _385 = _379 * 0.693147182464599609375;
        float _387 = 1.0 / _385;
        float _389 = 1.0 / _377;
        float _391 = _383 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _387, _123);
        float _397 = _395 * _389;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _399;
    }
    float _401 = _363;
    bool _403 = !_163;
    if (!_403)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _369 = _423;
    }
    float _425 = _369;
    float _427 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _435 = _433 != 0;
    float _437 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _441 = fma(_425, _167, _427);
    out.m_62.x = as_type<float>(_219);
    out.m_62.y = as_type<float>(_227);
    float _443 = fma(_425, _165, _437);
    bool _445 = !_431;
    int _447 = _445 ? 0 : 1;
    float _449 = -_441;
    float _451 = _339 + _449;
    bool _453 = !_213;
    int _455 = _453 ? 0 : 1;
    float _457 = fma(_425, _169, _439);
    bool _459 = !_435;
    int _461 = _459 ? 0 : 1;
    float _463 = -_443;
    float _465 = _337 + _463;
    int _467 = abs(_447);
    float _469 = _451 * _181;
    float _471 = _451 * _189;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _475 = _451 * _197;
    int _477 = abs(_455);
    float _479 = fma(_465, _179, _469);
    int _481 = abs(_461);
    float _483 = fma(_465, _187, _471);
    float _485 = float(_467);
    float _487 = fma(_465, _195, _475);
    float _489 = float(_477);
    float _491 = -_457;
    float _493 = _341 + _491;
    float _495 = abs(_321);
    float _497 = _485 * _495;
    float _499 = fma(_493, _183, _479);
    float _501 = float(_481);
    float _503 = fma(_489, _335, _497);
    float _505 = fma(_493, _191, _483);
    float _507 = fma(_493, _199, _487);
    float _509 = abs(_331);
    float _511 = fma(_501, _509, _503);
    bool _513 = !_473;
    float _515 = _499;
    float _517 = _505;
    float _519 = _507;
    float _521 = _507;
    float _537;
    if (!_513)
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
    float _553 = in.m_54.x;
    float _555 = in.m_54.y;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _569;
    bool _573 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _575 = isnan(_547);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_567;
    float _587 = _585 + 1.0;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _589;
    float _593 = 1.0 / _571;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _597 = _583 * _587;
    float _599 = -_583;
    float _601 = _599 + 1.0;
    float _603 = _551 * _593;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _605;
    float _609 = fma(_591, _603, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _611 = fma(_607, _603, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _613 = _609 * _597;
    float _615 = _611 * _597;
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _615);
    float _621 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].x, _617);
    float _623 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].y, _619);
    float _625 = _621 * _553;
    float _627 = _623 * _555;
    bool _629 = !_595;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_89);
        float _651 = 1.0 / _649;
        float _653 = _123 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_58.w;
    float _659 = _353 * _189;
    float _661 = _353 * _181;
    float _663 = _353 * _197;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _665;
    float _669 = in.m_56.w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _675 = fma(_351, _187, _659);
    float _677 = 1.0 / _667;
    float _679 = in.m_60.w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _683 = _655 + _681;
    float _685 = fma(_351, _179, _661);
    float _687 = fma(_351, _195, _663);
    float _689 = fma(_355, _191, _675);
    float _691 = fma(_355, _183, _685);
    float _693 = 1.0 / _673;
    bool _695 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _697 = isnan(_655);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _709 = _655 + _707;
    float _711 = fma(_355, _199, _687);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _713;
    float _717 = _683 * _677;
    bool _719 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _721 = isnan(_655);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _689 + _657;
    bool _733 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _735 = isnan(_655);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_705;
    float _747 = _745 + 1.0;
    float _749 = _691 + _669;
    float _751 = -_729;
    float _753 = _751 + 1.0;
    float _755 = _709 * _693;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _757;
    float _761 = fma(_715, _717, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _763 = _743 * _747;
    float _765 = _705 * _753;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _767;
    float _771 = fma(_759, _717, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _783 = _731 + _781;
    float _785 = -_743;
    float _787 = _785 + 1.0;
    float _789 = _761 * _763;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _795 = fma(_769, _717, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _797 = _771 * _763;
    float _799 = _711 + _679;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = _749 + _801;
    float _805 = _783 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _807 = fma(_779, _755, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _809 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].x, _789);
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _813 = _799 + _811;
    float _815 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[28].x, _805);
    float _817 = _795 * _763;
    float _819 = fma(_807, _765, _809);
    float _821 = fma(_793, _755, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _823 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[28].z, _815);
    float _825 = fma(_775, _755, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _827 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].x, _819);
    float _829 = _783 * _783;
    float _831 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].y, _797);
    bool _833 = _823 >= 0.0;
    float _835 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].z, _817);
    float _837 = fma(_803, _803, _829);
    float _839 = fma(_821, _765, _831);
    float _841 = fma(_825, _765, _835);
    float _843 = fma(_813, _813, _837);
    float _845 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].y, _839);
    float _847 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[109].z, _841);
    float _849 = _511 * _625;
    float _851 = rsqrt(_843);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _859 = _847 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _861 = 0.0;
    int _863 = as_type<int>(_859);
    if (_833)
    {
        _861 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _865 = _861;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _871 = _849 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _873 = _845 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _875 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _881 = _871 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _883 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _887;
    if (_833)
    {
        float _893 = _865 * 5.0;
        _863 = as_type<int>(_893);
    }
    int _895 = _863;
    float _897 = _881 * _851;
    if (_833)
    {
        out.m_45.x = 0.0;
    }
    float _899 = _803 * _897;
    out.m_64.x = _883;
    out.m_64.y = _885;
    out.m_64.z = _887;
    out.m_64.w = _855;
    float _901 = _783 * _897;
    out.m_66.x = _875;
    out.m_66.y = _889;
    out.m_66.z = _877;
    out.m_66.w = _879;
    if (_833)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3320 = as_type<float>(_895);
        out.gl_Position.z = _3320;
    }
    if (_833)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _903 = -_901;
    float _905 = _731 + _903;
    float _907 = _813 * _897;
    float _909 = -_899;
    float _911 = _749 + _909;
    float _913 = -_901;
    float _915 = _783 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _919 = _905 + _917;
    float _921 = -_907;
    float _923 = _799 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _911 + _925;
    float _929 = -_899;
    float _931 = _803 + _929;
    float _933 = _919 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _923 + _935;
    float _939 = _915 * _915;
    float _941 = -_907;
    float _943 = _813 + _941;
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[28].x, _933);
    float _947 = _511 * _627;
    float _949 = fma(_931, _931, _939);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[28].z, _945);
    float _953 = fma(_943, _943, _949);
    bool _955 = _951 >= 0.0;
    float _957 = sqrt(_953);
    float _959 = _923;
    if (_955)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _961 = _891;
    int _963 = as_type<int>(_961);
    if (_955)
    {
        out.m_45.x = 0.0;
    }
    float _965 = _851 * _957;
    if (_955)
    {
        float _967 = _961 * 5.0;
        _963 = as_type<int>(_967);
    }
    int _969 = _963;
    if (_955)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3438 = as_type<float>(_969);
        out.gl_Position.z = _3438;
    }
    if (_955)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _971 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_227));
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_219));
    float _977 = _871 * _965;
    float _979 = _965 * _971;
    float _981 = _965 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _983 = _981 * 0.5;
    float _985 = _975 * _977;
    float _987 = _973 * _979;
    float _989 = _987 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _991 = _987 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _993 = _987 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].x, _989);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _991);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _993);
    float _1001 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[26].z, _995);
    float _1003 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1005 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1007 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1011 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1013 = _799 + _1007;
    float _1015 = _749 + _1009;
    float _1017 = _731 + _1011;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1013 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1015 + _1023;
    float _1027 = _1021 * _1021;
    float _1029 = fma(_1025, _1025, _1027);
    float _1031 = sqrt(_1029);
    bool _1033 = _1031 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = _983;
    float _1037 = _1027;
    float _1039 = _1011;
    float _1041 = _985;
    float _1043 = _1017;
    if (!_1033)
    {
        _1035 = _1015;
    }
    float _1045 = _1035;
    float _1047 = _1045;
    if (!_1033)
    {
        _1037 = _1013;
    }
    float _1049 = _1037;
    float _1051 = _1049;
    if (!_1033)
    {
        _1039 = _1017;
    }
    float _1053 = _1039;
    bool _1055 = !_1033;
    float _1057 = _1053;
    if (!_1055)
    {
        float _1059 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1063 = _1031 + _1061;
        float _1065 = _1017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = rsqrt(_1029);
        float _1069 = _1063 * _1059;
        float _1071 = _1069 * 0.15915493667125701904296875;
        float _1073 = _1071 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        float _1077 = _1071 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        float _1081 = _1075 + (-1.0);
        float _1083 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = fma(_1079, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1087 = fma(_1017, _1075, _1083);
        float _1089 = _1067 * _1085;
        float _1091 = fma(_1025, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1093 = fma(_1021, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1057 = _1087;
        _1047 = _1091;
        _1051 = _1093;
    }
    float _1095 = _1057;
    float _1097 = _1047;
    float _1099 = _1051;
    float _1101 = -_731;
    float _1103 = _1101 + _1095;
    float _1105 = -_749;
    float _1107 = _1105 + _1097;
    float _1109 = -_799;
    float _1111 = _1109 + _1099;
    float _1113 = _1103 * _1103;
    float _1115 = fma(_1107, _1107, _1113);
    float _1117 = fma(_1111, _1111, _1115);
    float _1119 = sqrt(_1117);
    bool _1121 = _1119 > 0.0;
    bool _1123 = !_1121;
    float _1125 = _1119;
    float _1127 = _1095;
    float _1129 = _1099;
    float _1131 = _1097;
    if (!_1123)
    {
        bool _1133 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1135 = _1029;
        if (_1133)
        {
            float _1137 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1135 = _1137;
        }
        float _1139 = _1135;
        if (_1133)
        {
            _1041 = _499;
        }
        float _1141 = _1041;
        float _1143 = _1141;
        if (_1133)
        {
            _1125 = _505;
        }
        float _1145 = _1125;
        float _1147 = _1145;
        if (_1133)
        {
            float _1149 = _499 * _1139;
            _1043 = _1149;
        }
        float _1151 = _1043;
        float _1153 = _1151;
        if (_1133)
        {
            float _1155 = _505 * _1139;
            _515 = _1155;
        }
        float _1157 = _515;
        float _1159 = _1157;
        if (_1133)
        {
            float _1161 = _507 * _1139;
            _517 = _1161;
        }
        float _1163 = _517;
        float _1165 = _1163;
        if (!_1133)
        {
            float _1167 = _123 + 1.0;
            float _1169 = _1167;
            if (!_163)
            {
                float _1171 = _1167 * _1167;
                float _1173 = _1171 * 0.5;
                _519 = _1173;
            }
            float _1175 = _519;
            float _1177 = _1175;
            if (!_163)
            {
                float _1179 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1177 = _1179;
            }
            float _1181 = _1177;
            bool _1183 = !_163;
            float _1185 = _1181;
            if (!_1183)
            {
                float _1187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1189 = log2(_1187);
                float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1193 = _1191 + 1.0;
                float _1195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1197 = _1189 * _1167;
                float _1199 = 1.0 / _1193;
                float _1201 = _1195 * 0.693147182464599609375;
                float _1203 = exp2(_1197);
                float _1205 = 1.0 / _1201;
                float _1207 = _1203 + (-1.0);
                float _1209 = -_1207;
                float _1211 = fma(_1209, _1205, _1167);
                float _1213 = _1211 * _1199;
                float _1215 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1185 = _1215;
            }
            float _1217 = _1185;
            float _1219 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1221 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1223 = !_163;
            if (!_1223)
            {
                float _1225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1227 = log2(_1225);
                float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1231 = _1229 + 1.0;
                float _1233 = 1.0 / _1231;
                float _1235 = _1227 * _1167;
                float _1237 = exp2(_1235);
                float _1239 = -_1237;
                float _1241 = _1239 + 1.0;
                float _1243 = _1241 * _1233;
                _1169 = _1243;
            }
            float _1245 = _1169;
            float _1247 = fma(_1245, _167, _1221);
            float _1249 = fma(_1245, _165, _1219);
            float _1251 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1253 = -_441;
            float _1255 = _1253 + _1247;
            float _1257 = -_443;
            float _1259 = _1257 + _1249;
            float _1261 = fma(_1245, _169, _1251);
            float _1263 = _1255 * _181;
            float _1265 = _1255 * _189;
            float _1267 = _1255 * _197;
            float _1269 = -_457;
            float _1271 = _1269 + _1261;
            float _1273 = fma(_1259, _179, _1263);
            float _1275 = fma(_1259, _187, _1265);
            float _1277 = fma(_1259, _195, _1267);
            float _1279 = fma(_1271, _183, _1273);
            float _1281 = fma(_1271, _191, _1275);
            float _1283 = fma(_1271, _199, _1277);
            _1147 = _1281;
            _1143 = _1279;
            _521 = _1283;
            _1153 = _1279;
            _1159 = _1281;
            _1165 = _1283;
        }
        float _1285 = _1147;
        float _1287 = _1143;
        float _1289 = _521;
        float _1291 = _1153;
        float _1293 = _1159;
        float _1295 = _1165;
        float _1297 = _1285 * _1285;
        float _1299 = rsqrt(_1117);
        float _1301 = fma(_1287, _1287, _1297);
        float _1303 = fma(_1289, _1289, _1301);
        float _1305 = sqrt(_1303);
        float _1307 = _1107 * _1299;
        float _1309 = _1103 * _1299;
        float _1311 = _1111 * _1299;
        bool _1313 = _1305 > 0.0;
        bool _1315 = !_1313;
        if (!_1315)
        {
            float _1317 = rsqrt(_1303);
            float _1319 = _1317 * _1285;
            float _1321 = _1317 * _1287;
            float _1323 = _1317 * _1289;
            float _1325 = _1309 * _1319;
            float _1327 = fma(_1307, _1321, _1325);
            float _1329 = fma(_1311, _1323, _1327);
            float _1331 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1333 = fma(_1291, _1331, _1097);
            float _1335 = fma(_1293, _1331, _1095);
            float _1337 = fma(_1295, _1331, _1099);
            _1127 = _1335;
            _1129 = _1337;
            _1131 = _1333;
        }
    }
    float _1339 = _1127;
    float _1341 = _1129;
    float _1343 = _1131;
    float _1345 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = -_901;
    float _1359 = _1357 + _1339;
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1345);
    float _1373 = -_907;
    float _1375 = _1373 + _1341;
    float _1377 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1371);
    float _1379 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1381 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1383 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1379);
    float _1385 = 1.0 / _1381;
    float _1387 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1383);
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1391 = _1389 + _1381;
    float _1393 = _1391 * _1385;
    float _1395 = _1393 * 0.5;
    float _1397 = -_899;
    float _1399 = _1397 + _1343;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1403 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1401);
    float _1405 = _1395;
    float _1407 = _1359;
    float _1409 = _1399;
    float _1411 = _1375;
    float _1413 = _1381;
    if (_1369)
    {
        _1405 = 1.0;
    }
    float _1415 = _1405;
    float _1417 = 1.0 / _1403;
    float _1419 = _1415;
    if (!_1355)
    {
        float _1421 = _919 * _919;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_799;
        float _1427 = _1425 + _1341;
        float _1429 = -_749;
        float _1431 = _1429 + _1343;
        float _1433 = fma(_927, _927, _1421);
        float _1435 = -_731;
        float _1437 = _1435 + _1339;
        float _1439 = fma(_937, _937, _1433);
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1443 = sqrt(_1439);
        float _1445 = 1.0 / _965;
        float _1447 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1449 = precise::min(_1443, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1451 = _1449 * _1423;
        float _1453 = _1451 * _1445;
        float _1455 = _1447 * _1453;
        float _1457 = _1427 * _1453;
        float _1459 = fma(_1431, _1455, _911);
        float _1461 = fma(_1437, _1455, _905);
        float _1463 = fma(_1447, _1457, _923);
        _1407 = _1461;
        _1409 = _1459;
        _1411 = _1463;
        _1413 = _1453;
    }
    float _1465 = _1407;
    float _1467 = _1409;
    float _1469 = _1411;
    float _1471 = _1413;
    float _1473 = _1471;
    if (_1369)
    {
        _1473 = 1.0;
    }
    float _1475 = _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1479 = _1417 * _1477;
    float _1481 = _1475;
    float _1483 = _1479;
    if (!_1369)
    {
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1487 = _1485 * 0.15915493667125701904296875;
        float _1489 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1491 = _1487 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1493;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = _1505 * _1507;
        float _1515 = 1.0 / _1513;
        float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1519 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1517;
        float _1521 = 1.0 / _1519;
        float _1523 = _1511 * _1515;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1527 = fma(_1479, _1523, _1525);
        float _1529 = _1527 * _1521;
        float _1531 = precise::clamp(_1529, 0.0, 1.0);
        _259 = _1521;
        _1419 = _1531;
    }
    float _1533 = _259;
    float _1535 = _1419;
    float _1537 = _1533;
    if (!_1369)
    {
        float _1539 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1545 = _1541 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        float _1549 = _1543 * 0.15915493667125701904296875;
        float _1551 = _1541 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = 1.0 / _1547;
        float _1557 = _1549 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = _1553 * _1555;
        float _1563 = _1549 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        float _1567 = _1559 * _1561;
        float _1569 = 1.0 / _1567;
        float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1573 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1571;
        float _1575 = 1.0 / _1573;
        float _1577 = _1565 * _1569;
        float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1581 = fma(_1479, _1577, _1579);
        float _1583 = _1581 * _1575;
        float _1585 = precise::clamp(_1583, 0.0, 1.0);
        float _1587 = -_1585;
        float _1589 = _1587 + 1.0;
        _1537 = _1555;
        _1481 = _1589;
    }
    float _1591 = _1537;
    float _1593 = _1481;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1597 = _1465 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1601 = _1467 + _1599;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1469 + _1603;
    float _1607 = _1597 * _1597;
    float _1609 = fma(_1601, _1601, _1607);
    float _1611 = fma(_1605, _1605, _1609);
    float _1613 = rsqrt(_1611);
    float _1615 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1617 = _1601 * _1615;
    float _1619 = _1605 * _1615;
    float _1621 = _1617 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 + _1623;
    float _1627 = sqrt(_1625);
    bool _1629 = _1627 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = _1627 + _1631;
    float _1635 = _1613;
    float _1637 = _1591;
    float _1639 = _1633;
    float _1641 = _1597;
    float _1643 = _1615;
    float _1645 = _1617;
    if (_1629)
    {
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1635 = _1647;
    }
    float _1649 = _1635;
    if (_1629)
    {
        float _1651 = rsqrt(_1625);
        _1637 = _1651;
    }
    float _1653 = _1637;
    float _1655 = _1653;
    if (_1629)
    {
        float _1657 = _1633 * _1649;
        _1639 = _1657;
    }
    float _1659 = _1639;
    if (_1629)
    {
        float _1661 = _1659 * 0.15915493667125701904296875;
        _1483 = _1661;
    }
    float _1663 = _1483;
    float _1665 = _1649;
    if (_1629)
    {
        float _1667 = _1663 * 6.283185482025146484375;
        float _1669 = sin(_1667);
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1675 = precise::max(0.0, _1673);
    float _1677 = _1605;
    float _1679 = _1675;
    if (_1629)
    {
        float _1681 = _1663 * 6.283185482025146484375;
        float _1683 = cos(_1681);
        _1677 = _1683;
    }
    float _1685 = _1677;
    float _1687 = -_1615;
    float _1689 = -_1675;
    float _1691 = fma(_1597, _1687, _1689);
    if (!_1629)
    {
        _1641 = _1619;
    }
    float _1693 = _1641;
    float _1695 = _1693;
    if (_1629)
    {
        float _1697 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1679 = _1697;
    }
    float _1699 = _1679;
    float _1701 = sqrt(_1611);
    float _1703 = _1671;
    float _1705 = _1699;
    if (_1629)
    {
        float _1707 = fma(_1671, _1699, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = _1709;
    if (_1629)
    {
        float _1713 = _1685 + (-1.0);
        _1705 = _1713;
    }
    float _1715 = _1705;
    float _1717 = _1715;
    if (_1629)
    {
        float _1719 = _1653 * _1709;
        _959 = _1719;
    }
    float _1721 = _959;
    if (!_1629)
    {
        _1655 = _1691;
    }
    float _1723 = _1655;
    float _1725 = _1723;
    if (_1629)
    {
        float _1727 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1727;
    }
    float _1729 = _1643;
    if (_1629)
    {
        float _1731 = _1617 * _1721;
        _1645 = _1731;
    }
    float _1733 = _1645;
    if (!_1629)
    {
        _1711 = _1621;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    if (_1629)
    {
        float _1739 = _1619 * _1721;
        _1695 = _1739;
    }
    float _1741 = _1695;
    if (_1629)
    {
        float _1743 = fma(_1691, _1685, _1729);
        _1725 = _1743;
    }
    float _1745 = _1725;
    if (_1629)
    {
        float _1747 = _1733 * _1733;
        _1737 = _1747;
    }
    float _1749 = _1737;
    if (!_1629)
    {
        _1717 = _1623;
    }
    float _1751 = _1717;
    float _1753 = _1751;
    if (_1629)
    {
        float _1755 = _1741 * _1741;
        _1753 = _1755;
    }
    float _1757 = _1753;
    float _1759 = fma(_1745, _1745, _1749);
    float _1761 = _1759 + _1757;
    float _1763 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1767 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1765);
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1773 = rsqrt(_1761);
    float _1775 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1777 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1779 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1771);
    float _1781 = -_1769;
    float _1783 = _1781 + 1.0;
    float _1785 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1787 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1777);
    float _1789 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1779);
    float _1791 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1775);
    float _1793 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1785);
    float _1795 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1797 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1799 = abs(_1783);
    float _1801 = log2(_1799);
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1805 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1807 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1809 = _1773 * _1733;
    float _1811 = _1773 * _1745;
    float _1813 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1793);
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1807);
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1819 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1821 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1823 = _1773 * _1741;
    float _1825 = -_1817;
    float _1827 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1813 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1831 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1815);
    float _1833 = -_1821;
    float _1835 = fma(_1833, _1819, 1.0);
    float _1837 = -_1823;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1841 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1831);
    float _1845 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1847 = fma(_1839, -0.5, 0.5);
    float _1849 = log2(_1835);
    float _1851 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1853 = fma(_1839, 0.5, 0.5);
    float _1855 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1845);
    float _1857 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1851);
    float _1859 = _1811 + 1.0;
    float _1861 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1855);
    float _1863 = 1.0 / _1843;
    float _1865 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1857);
    float _1867 = fma(_1853, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1869 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1871 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1865);
    float _1873 = fma(_1853, _1867, -0.212114393711090087890625);
    float _1875 = exp2(_1841);
    float _1877 = _1849 * 0.693147182464599609375;
    float _1879 = fma(_1853, _1873, 1.570728778839111328125);
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1883 = sqrt(_1847);
    float _1885 = _1869 * _1863;
    float _1887 = _1871 * _1863;
    float _1889 = fma(_1885, 0.5, 0.5);
    float _1891 = fma(_1887, -0.5, 0.5);
    float _1893 = -_1811;
    float _1895 = fma(_1875, _1859, _1893);
    float3 _4875 = float3(_1889, _1891, _1881);
    float _1897 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).x;
    float3 _4886 = float3(_1889, _1891, _1881);
    float4 _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4886, float3(0.0), isnan(_4886)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4886, float3(0.0), isnan(_4886)), level(0.0)).xyzw;
    float _1902 = _1900.x;
    float _1904 = _1900.y;
    float _1906 = _1900.z;
    float _1908 = _1900.w;
    float _1910 = fma(_1895, 0.5, 0.5);
    float _1912 = _1883 * 0.636619746685028076171875;
    float _1914 = -_1879;
    float _1916 = fma(_1912, _1914, 1.0);
    float2 _4913 = float2(_1916, _1910);
    float3 _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).xyz;
    float _1922 = _1920.x;
    float _1924 = _1920.y;
    float _1926 = _1920.z;
    float _1928 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1930 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1932 = _1535 > 0.0;
    bool _1934 = isnan(_1535);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan(0.0);
    bool _1940 = _1936 || _1938;
    float _1942 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1930);
    float _1944 = exp2(_1928);
    float _1946 = _1535 * _1593;
    bool _1948 = _1593 <= 0.0;
    bool _1950 = !_1940;
    bool _1952 = _1948 || _1950;
    float _1954 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1942);
    float _1956 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1954);
    float _1958 = -_1944;
    float _1960 = _1958 + 1.0;
    float _1962 = _1956 + _1843;
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1966 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1968 = _1962 * 0.5;
    float _1970 = _1966 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _1968;
    out.m_68.w = _1843;
    out.gl_Position.x = _1869;
    out.gl_Position.y = _1871;
    out.gl_Position.z = _1956;
    out.gl_Position.w = _1843;
    out.m_45.x = _1970;
    float _1972 = _1964 * _1897;
    float _1974 = -_1964;
    float _1976 = _1974 + 1.0;
    float _1978 = _1908 * _1972;
    float _1980 = _1926 * _1972;
    float _1982 = fma(_1922, _1978, _1902);
    float _1984 = fma(_1924, _1978, _1904);
    float _1986 = _1908 * _1976;
    float _1988 = fma(_1908, _1980, _1906);
    out.m_70.x = _1982;
    out.m_70.y = _1984;
    out.m_70.z = _1988;
    out.m_70.w = _1986;
    if (!_1952)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1990;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

