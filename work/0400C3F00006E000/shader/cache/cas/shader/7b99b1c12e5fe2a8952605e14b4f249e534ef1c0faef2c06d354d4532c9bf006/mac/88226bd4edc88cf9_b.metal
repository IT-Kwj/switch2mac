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
    float4 m_62 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_52 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1349 = false;
    bool _1019 = false;
    bool _839 = false;
    bool _671 = false;
    bool _469 = false;
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
        float _2901 = as_type<float>(_105);
        out.gl_Position.z = _2901;
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
        float _2970 = as_type<float>(_141);
        out.gl_Position.z = _2970;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    float _171 = in.m_54.x;
    float _173 = in.m_54.y;
    float _175 = in.m_54.z;
    float _177 = 0.0;
    float _179 = _145;
    if (!_157)
    {
        float _181 = _145 * _145;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = in.m_56.x;
    float _189 = in.m_56.y;
    float _191 = in.m_56.z;
    float _193 = _185;
    float _195 = _175;
    if (!_157)
    {
        float _197 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _197;
    }
    float _199 = _193;
    float _201 = in.m_58.x;
    float _203 = in.m_58.y;
    float _205 = in.m_58.z;
    int _207 = as_type<int>(_143) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_143) & 2;
    bool _213 = _211 != 0;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_213;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_157;
    float _225 = _199;
    float _227 = 0.0;
    float _229 = 0.0;
    float _231 = _161;
    float _233 = 0.5;
    if (!_223)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _145 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _145);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _263;
        _227 = _251;
        _229 = _253;
    }
    float _265 = _225;
    float _267 = _227;
    float _269 = _229;
    bool _271 = !_157;
    float _273 = _269;
    float _275 = _267;
    float _277 = _265;
    if (!_271)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = 1.0 / _285;
        float _289 = _145 * _281;
        float _291 = exp2(_289);
        float _293 = -_291;
        float _295 = _293 + 1.0;
        float _297 = _295 * _287;
        _179 = _297;
        _273 = _285;
    }
    float _299 = _179;
    float _301 = _273;
    float _303 = _301;
    if (!_157)
    {
        float _305 = _123 * _123;
        float _307 = _305 * 0.5;
        _275 = _307;
    }
    float _309 = _275;
    float _311 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _315 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _303 = _123;
    }
    float _317 = _303;
    float _319 = fma(_299, _159, _311);
    float _321 = fma(_299, _161, _313);
    float _323 = _317;
    if (!_157)
    {
        float _325 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _325;
    }
    float _327 = _277;
    bool _329 = !_157;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _123 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _123);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    bool _365 = !_157;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _123 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _323 = _385;
    }
    float _387 = _323;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _391 = fma(_299, _163, _315);
    float _393 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _397 = fma(_387, _161, _389);
    float _399 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _401 = fma(_387, _159, _393);
    float _403 = fma(_321, _147, _167);
    float _405 = -_397;
    float _407 = _321 + _405;
    float _409 = fma(_387, _163, _399);
    float _411 = fma(_319, _147, _165);
    float _413 = -_401;
    float _415 = _319 + _413;
    float _417 = _407 * _173;
    float _419 = _407 * _189;
    float _421 = _407 * _203;
    float _423 = -_409;
    float _425 = _391 + _423;
    float _427 = fma(_415, _171, _417);
    float _429 = fma(_415, _187, _419);
    float _431 = fma(_415, _201, _421);
    float _433 = fma(_391, _147, _169);
    float _435 = fma(_425, _175, _427);
    float _437 = fma(_425, _191, _429);
    float _439 = fma(_425, _205, _431);
    bool _441 = !_395;
    float _443 = _433;
    float _445 = _435;
    float _447 = _437;
    float _449 = _439;
    float _467;
    if (!_441)
    {
        float _451 = in.m_60.x;
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _455 = _451 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        float _471 = float(_89);
        float _473 = 1.0 / _471;
        float _475 = _123 * _473;
        _467 = _475;
    }
    _469 = false;
    float _477 = _467;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _481 = _477 + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = _477 + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _495;
    bool _499 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _501 = isnan(_477);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = 1.0 / _489;
    bool _513 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_477);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _527 = isnan(_477);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _493;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _541 = 1.0 / _497;
    float _543 = _481 * _511;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _547 = _477 + _545;
    bool _549 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_477);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _565 = _547 * _537;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _567;
    float _571 = -_559;
    float _573 = _571 + 1.0;
    float _575 = -_523;
    float _577 = _575 + 1.0;
    float _579 = fma(_563, _565, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _581 = _485 * _541;
    float _583 = fma(_569, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = _509 * _573;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    float _591 = -_509;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = _535 * _577;
    float _601 = fma(_589, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _603 = _523 * _593;
    float _605 = fma(_597, _565, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = in.m_52.x;
    float _609 = in.m_52.y;
    float _611 = -_535;
    float _613 = _611 + 1.0;
    float _615 = _583 * _599;
    float _617 = _601 * _599;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _623;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[143].x, _615);
    float _629 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[143].y, _617);
    float _631 = fma(_621, _581, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = fma(_625, _581, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _635 = fma(_579, _603, _627);
    float _637 = fma(_605, _603, _629);
    float _639 = fma(_631, _585, _635);
    float _641 = fma(_633, _585, _637);
    float _643 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _639);
    float _645 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _641);
    float _647 = _643 * _607;
    float _649 = _645 * _609;
    bool _651 = !_539;
    float _669;
    if (!_651)
    {
        float _653 = in.m_60.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_89);
        float _675 = 1.0 / _673;
        float _677 = _123 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _683 = _679 + _681;
    bool _685 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _687 = isnan(_679);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _699 = _679 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _707;
    bool _715 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _717 = isnan(_679);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _729 = 1.0 / _703;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _731;
    float _735 = _683 * _729;
    bool _737 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _739 = isnan(_679);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _749;
    float _753 = fma(_733, _735, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _755 = _747 * _711;
    float _757 = -_747;
    float _759 = _757 + 1.0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _761;
    float _765 = fma(_751, _735, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _767 = _725 * _759;
    float _769 = fma(_763, _735, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _771 = _699 * _713;
    float _773 = -_725;
    float _775 = _773 + 1.0;
    float _777 = _765 * _767;
    float _779 = _769 * _767;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _785 = _753 * _767;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _795 = fma(_783, _771, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _797 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].x, _777);
    float _799 = fma(_789, _771, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].y, _779);
    float _803 = fma(_793, _771, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _805 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].z, _785);
    float _807 = fma(_799, _755, _797);
    float _809 = fma(_795, _755, _801);
    float _811 = fma(_803, _755, _805);
    float _813 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].x, _807);
    float _815 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].y, _809);
    float _817 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].z, _811);
    bool _819 = !_727;
    float _837;
    if (!_819)
    {
        float _821 = in.m_60.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_89);
        float _843 = 1.0 / _841;
        float _845 = _123 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _851 = _847 + _849;
    float _853 = _813 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _859 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _861 = isnan(_847);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _879 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_847);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = 1.0 / _857;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _897;
    bool _901 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _903 = isnan(_847);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _915 = _889 * _895;
    float _917 = -_889;
    float _919 = _917 + 1.0;
    bool _921 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _923 = 1.0 / _873;
    float _925 = _911 * _919;
    float _927 = -_911;
    float _929 = _927 + 1.0;
    float _931 = 1.0 / _877;
    float _933 = _899 * _891;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = fma(_933, _851, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _941 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _943 = isnan(_847);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = _937 * _923;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _847 + _959;
    float _963 = _939 * _925;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _847 + _965;
    float _969 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _971 = fma(_953, _961, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _973 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[115].x, _963);
    float _975 = _957 * _931;
    float _977 = -_951;
    float _979 = _977 + 1.0;
    float _981 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = fma(_971, _915, _973);
    float _985 = fma(_975, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _987 = _869 * _979;
    float _989 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = fma(_985, _987, _983);
    float _995 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[118].x, _993);
    float _997 = _995 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _981;
    out.m_62.y = _989;
    out.m_62.z = _991;
    out.m_62.w = _997;
    bool _999 = !_921;
    float _1017;
    if (!_999)
    {
        float _1001 = in.m_60.x;
        float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1005 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _1009 = _1007 * _1003;
        float _1011 = floor(_1009);
        float _1013 = -_1011;
        float _1015 = _1009 + _1013;
        _1017 = _1015;
        _1019 = true;
    }
    else
    {
        float _1021 = float(_89);
        float _1023 = 1.0 / _1021;
        float _1025 = _123 * _1023;
        _1017 = _1025;
    }
    _1019 = false;
    float _1027 = _1017;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1031 = _1027 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1035 = _1027 + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1053 = 1.0 / _1039;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1059;
    float _1063 = 1.0 / _1043;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1067 = _1027 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1073;
    bool _1077 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1079 = isnan(_1027);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1085);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1097 = 1.0 / _1047;
    float _1099 = _1067 * _1053;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1103 = _1027 + _1101;
    bool _1105 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1107 = isnan(_1027);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1119 = _1027 + _1117;
    float _1121 = fma(_1061, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1123 = fma(_1071, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1125 = fma(_1075, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1127 = 1.0 / _1051;
    float _1129 = _1031 * _1063;
    bool _1131 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1133 = isnan(_1027);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1147 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1149 = isnan(_1027);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    bool _1159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1161 = 1.0 / _1057;
    float _1163 = _1035 * _1097;
    float _1165 = -_1141;
    float _1167 = _1165 + 1.0;
    float _1169 = _1103 * _1127;
    float _1171 = _1157 * _1167;
    float _1173 = -_1157;
    float _1175 = _1173 + 1.0;
    float _1177 = -_1115;
    float _1179 = _1177 + 1.0;
    float _1181 = _1115 * _1175;
    bool _1183 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1185 = isnan(_1027);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = _1119 * _1161;
    bool _1197 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1199 = isnan(_1027);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = -_1193;
    float _1211 = _1209 + 1.0;
    float _1213 = _1207 * _1179;
    float _1215 = -_1207;
    float _1217 = _1215 + 1.0;
    float _1219 = _1087 * _1211;
    float _1221 = fma(_1095, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1223 = _1193 * _1217;
    float _1225 = fma(_1091, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1227 = _1121 * _1219;
    float _1229 = -_1087;
    float _1231 = _1229 + 1.0;
    float _1233 = _1123 * _1219;
    float _1235 = _1125 * _1219;
    float _1237 = fma(_1145, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1243;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1227);
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1233);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1235);
    float _1253 = fma(_1241, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1259;
    float _1263 = fma(_1245, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1265 = fma(_1221, _1223, _1247);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1275 = fma(_1257, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1277 = fma(_1225, _1223, _1249);
    float _1279 = fma(_1237, _1223, _1251);
    float _1281 = fma(_1261, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1283 = fma(_1263, _1213, _1265);
    float _1285 = fma(_1269, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1287 = fma(_1273, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1289 = fma(_1281, _1213, _1279);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1291;
    float _1295 = fma(_1253, _1213, _1277);
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1301;
    float _1305 = fma(_1275, _1181, _1283);
    float _1307 = fma(_1293, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1309 = fma(_1299, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1311 = fma(_1285, _1181, _1295);
    float _1313 = fma(_1303, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1315 = fma(_1287, _1181, _1289);
    float _1317 = fma(_1307, _1171, _1305);
    float _1319 = fma(_1309, _1171, _1311);
    float _1321 = fma(_1313, _1171, _1315);
    float _1323 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1317);
    float _1325 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1319);
    float _1327 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1321);
    bool _1329 = !_1159;
    float _1347;
    if (!_1329)
    {
        float _1331 = in.m_60.x;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1335 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _1339 = _1337 * _1333;
        float _1341 = floor(_1339);
        float _1343 = -_1341;
        float _1345 = _1339 + _1343;
        _1347 = _1345;
        _1349 = true;
    }
    else
    {
        float _1351 = float(_89);
        float _1353 = 1.0 / _1351;
        float _1355 = _123 * _1353;
        _1347 = _1355;
    }
    _1349 = false;
    float _1357 = _1347;
    float _1359 = in.m_60.x;
    float _1361 = in.m_60.y;
    float _1363 = in.m_60.z;
    float _1365 = in.m_60.w;
    float _1367 = _403 * _203;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1373;
    float _1377 = fma(_411, _201, _1367);
    float _1379 = 1.0 / _1371;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1389 = _1387 != 0;
    float _1391 = _403 * _189;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1395 = _1393 != 0;
    float _1397 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    float _1403 = fma(_411, _187, _1391);
    float _1405 = fma(_433, _205, _1377);
    float _1407 = in.m_54.w;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1417 = _1375 * _1379;
    float _1419 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1421 = in.m_56.w;
    bool _1423 = _1359 > 0.5;
    float _1425 = fma(_1419, -2.0, _1385);
    bool _1427 = _1365 > 0.5;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1433 = -_217;
    int _1435 = _1423 ? as_type<int>(_1433) : as_type<int>(_217);
    float _1437 = in.m_58.w;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1441 = _1439 != 0;
    float _1443 = _403 * _173;
    float _1445 = 1.0 / _1431;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1449 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1451 = fma(_411, _171, _1443);
    float _1453 = _1325 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1455 = -_1447;
    float _1457 = fma(_1449, 2.0, _1455);
    float _1459 = 1.0 / _1411;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1463 = fma(_433, _175, _1451);
    bool _1465 = !_1383;
    float _1467 = _1465 ? _217 : as_type<float>(_1435);
    float _1469 = -_123;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1457);
    bool _1473 = _1361 > 0.5;
    float _1475 = _1463 + _1407;
    float _1477 = _1431;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1441)
    {
        _1477 = _1363;
    }
    float _1481 = _1477;
    float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1485 = fma(_433, _191, _1403);
    float _1487 = _1467 + 0.5;
    float _1489 = _1481;
    if (!_1441)
    {
        _443 = _1361;
    }
    float _1491 = _443;
    float _1493 = _1405 + _1437;
    float _1495 = _1491;
    if (_1441)
    {
        _1495 = _1359;
    }
    float _1497 = _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1499;
    float _1503 = _1415 * _1459;
    float _1505 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1509 = _1501 * _1445;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1513 = _1357 + _1511;
    float _1515 = -_221;
    int _1517 = _1473 ? as_type<int>(_1515) : as_type<int>(_221);
    float _1519 = _1485 + _1421;
    bool _1521 = _1363 > 0.5;
    float _1523 = fma(_1417, _1513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_1441)
    {
        _1479 = _1363;
    }
    float _1525 = _1479;
    float _1527 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1531 = _1357 + _1529;
    bool _1533 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1535 = isnan(_1357);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1547 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1549 = isnan(_1357);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = fma(_1503, _1531, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1561 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1563 = isnan(_1357);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = -_1543;
    float _1575 = _1573 + 1.0;
    float _1577 = _1525;
    if (_1441)
    {
        _1577 = _1361;
    }
    float _1579 = _1577;
    float _1581 = -_1557;
    float _1583 = _1581 + 1.0;
    if (_1441)
    {
        _1489 = _1361;
    }
    float _1585 = _1489;
    float _1587 = _1571 * _1575;
    bool _1589 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1591 = isnan(_1357);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = _1543 * _1583;
    float _1603 = -_1571;
    float _1605 = _1603 + 1.0;
    float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1609 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1611 = _1599 * _1605;
    float _1613 = -_1599;
    float _1615 = _1613 + 1.0;
    float _1617 = fma(_1609, _1487, _1471);
    float _1619 = _1523 * _1611;
    bool _1621 = !_1389;
    float _1623 = _1621 ? _221 : as_type<float>(_1517);
    float _1625 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1425);
    float _1627 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1619);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1633 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1637 = _1623 + (-0.5);
    float _1639 = fma(_1559, _1587, _1629);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1643 = _1357 + _1641;
    float _1645 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1649 = _1519 + _1647;
    float _1651 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1635);
    float _1653 = -_1627;
    float _1655 = -_1625;
    float _1657 = fma(_1653, _1637, _1655);
    float _1659 = fma(_1509, _1643, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1663 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1665 = -_217;
    int _1667 = _1521 ? as_type<int>(_1665) : as_type<int>(_217);
    float _1669 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1505);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1673 = _1475 + _1671;
    float _1675 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1677 = -_1661;
    float _1679 = fma(_1663, 2.0, _1677);
    bool _1681 = !_1395;
    float _1683 = _1681 ? _217 : as_type<float>(_1667);
    float _1685 = fma(_1659, _1601, _1639);
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1493 + _1687;
    float _1691 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1675);
    float _1693 = -_1669;
    float _1695 = _1693 + 1.0;
    float _1697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1699 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1631);
    float _1701 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1685);
    float _1703 = -_221;
    int _1705 = _1427 ? as_type<int>(_1703) : as_type<int>(_221);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1691);
    float _1709 = -_1695;
    float _1711 = fma(_1467, _1709, _1617);
    float _1713 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1651);
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1717 = _1649 * _1649;
    bool _1719 = !_1401;
    float _1721 = _1719 ? _221 : as_type<float>(_1705);
    float _1723 = -_1713;
    float _1725 = _1723 + 1.0;
    float _1727 = fma(_1633, -2.0, _1715);
    bool _1729 = _1707 >= 0.0;
    float _1731 = fma(_1673, _1673, _1717);
    float _1733 = _1721 + (-0.5);
    float _1735 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1727);
    float _1737 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1527);
    float _1739 = fma(_1689, _1689, _1731);
    float _1741 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1743 = -_1645;
    float _1745 = -_1735;
    float _1747 = fma(_1743, _1733, _1745);
    float _1749 = _1683 + 0.5;
    float _1751 = -_123;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1679);
    float _1755 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1699);
    float _1757 = rsqrt(_1739);
    float _1759 = -_1737;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1721, _1725, _1747);
    float _1765 = fma(_1741, _1749, _1753);
    float _1767 = -_1755;
    float _1769 = _1767 + 1.0;
    float _1771 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1773 = _1731;
    if (_1729)
    {
        _1773 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1775 = _1773;
    float _1777 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1779 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = fma(_1623, _1761, _1657);
    float _1783 = -_1769;
    float _1785 = fma(_1683, _1783, _1765);
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1791 = as_type<int>(_1775);
    float _1793 = _1785;
    if (_1729)
    {
        float _1795 = _1775 * 5.0;
        _1791 = as_type<int>(_1795);
    }
    int _1797 = _1791;
    out.m_64.x = _1711;
    out.m_64.y = _1781;
    out.m_64.z = _1785;
    out.m_64.w = _1763;
    float _1799 = _1649 * _1757;
    float _1801 = _1673 * _1757;
    out.m_66.x = _1777;
    out.m_66.y = _1779;
    out.m_66.z = _1787;
    out.m_66.w = _1789;
    if (_1729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5633 = as_type<float>(_1797);
        out.gl_Position.z = _5633;
    }
    if (_1729)
    {
        out.m_45.x = 0.0;
    }
    if (_1729)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1803 = -_1799;
    float _1805 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1519);
    float _1807 = _1689 * _1757;
    float _1809 = -_1801;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1475);
    float _1813 = -_1799;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1819 = _1805 + _1817;
    float _1821 = -_1807;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = _1811 + _1825;
    float _1829 = -_1801;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1673);
    float _1833 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1837 = _1823 + _1835;
    float _1839 = _1815 * _1815;
    float _1841 = -_1807;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1689);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1833);
    float _1847 = fma(_1831, _1831, _1839);
    float _1849 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1845);
    float _1851 = fma(_1843, _1843, _1847);
    bool _1853 = _1849 >= 0.0;
    float _1855 = sqrt(_1851);
    float _1857 = _1823;
    if (_1853)
    {
        _1793 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1859 = _1793;
    int _1861 = as_type<int>(_1859);
    if (_1853)
    {
        out.m_45.x = 0.0;
    }
    float _1863 = _1757 * _1855;
    if (_1853)
    {
        float _1865 = _1859 * 5.0;
        _1861 = as_type<int>(_1865);
    }
    int _1867 = _1861;
    if (_1853)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5765 = as_type<float>(_1867);
        out.gl_Position.z = _5765;
    }
    if (_1853)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1869 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1871 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1877 = _1863 * _1869;
    float _1879 = _1863 * _1871;
    float _1881 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1883 = _1881 * 0.5;
    float _1885 = _1873 * _1877;
    float _1887 = _1875 * _1879;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1891 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1889);
    float _1897 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1891);
    float _1899 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1893);
    float _1901 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1895);
    float _1903 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1897);
    float _1905 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1899);
    float _1907 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1909 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1911 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1913 = _1493 + _1907;
    float _1915 = _1475 + _1909;
    float _1917 = _1519 + _1911;
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1921 = _1913 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1925 = _1915 + _1923;
    float _1927 = _1921 * _1921;
    float _1929 = fma(_1925, _1925, _1927);
    float _1931 = sqrt(_1929);
    bool _1933 = _1931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1935 = _1905;
    float _1937 = _1927;
    float _1939 = _1911;
    float _1941 = _1913;
    float _1943 = _1917;
    if (!_1933)
    {
        _1935 = _1915;
    }
    float _1945 = _1935;
    float _1947 = _1945;
    if (!_1933)
    {
        _1937 = _1913;
    }
    float _1949 = _1937;
    float _1951 = _1949;
    if (!_1933)
    {
        _1939 = _1917;
    }
    float _1953 = _1939;
    bool _1955 = !_1933;
    float _1957 = _1953;
    if (!_1955)
    {
        float _1959 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1963 = _1931 + _1961;
        float _1965 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1967 = rsqrt(_1929);
        float _1969 = _1963 * _1959;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1971 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        float _1977 = _1971 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        float _1981 = _1975 + (-1.0);
        float _1983 = fma(_1979, _1965, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1985 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1987 = _1967 * _1983;
        float _1989 = fma(_1917, _1975, _1985);
        float _1991 = fma(_1925, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1993 = fma(_1921, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1957 = _1989;
        _1947 = _1991;
        _1951 = _1993;
    }
    float _1995 = _1957;
    float _1997 = _1947;
    float _1999 = _1951;
    float _2001 = -_1519;
    float _2003 = _2001 + _1995;
    float _2005 = -_1475;
    float _2007 = _2005 + _1997;
    float _2009 = -_1493;
    float _2011 = _2009 + _1999;
    float _2013 = _2003 * _2003;
    float _2015 = fma(_2007, _2007, _2013);
    float _2017 = fma(_2011, _2011, _2015);
    float _2019 = sqrt(_2017);
    bool _2021 = _2019 > 0.0;
    bool _2023 = !_2021;
    float _2025 = _2019;
    float _2027 = _1997;
    float _2029 = _1995;
    float _2031 = _1999;
    if (!_2023)
    {
        bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2035 = _1929;
        if (_2033)
        {
            float _2037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2035 = _2037;
        }
        float _2039 = _2035;
        if (_2033)
        {
            _1941 = _435;
        }
        float _2041 = _1941;
        float _2043 = _2041;
        if (_2033)
        {
            _2025 = _437;
        }
        float _2045 = _2025;
        float _2047 = _2045;
        if (_2033)
        {
            float _2049 = _435 * _2039;
            _1943 = _2049;
        }
        float _2051 = _1943;
        float _2053 = _2051;
        if (_2033)
        {
            float _2055 = _437 * _2039;
            _445 = _2055;
        }
        float _2057 = _445;
        float _2059 = _2057;
        float _2061 = _2057;
        if (_2033)
        {
            float _2063 = _439 * _2039;
            _447 = _2063;
        }
        float _2065 = _447;
        float _2067 = _2065;
        if (!_2033)
        {
            float _2069 = _123 + 1.0;
            float _2071 = _2069;
            if (!_157)
            {
                float _2073 = _2069 * _2069;
                float _2075 = _2073 * 0.5;
                _2059 = _2075;
            }
            float _2077 = _2059;
            float _2079 = _2077;
            if (!_157)
            {
                float _2081 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2079 = _2081;
            }
            float _2083 = _2079;
            bool _2085 = !_157;
            float _2087 = _2083;
            if (!_2085)
            {
                float _2089 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2091 = log2(_2089);
                float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2095 = _2093 + 1.0;
                float _2097 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2099 = _2091 * _2069;
                float _2101 = 1.0 / _2095;
                float _2103 = _2097 * 0.693147182464599609375;
                float _2105 = exp2(_2099);
                float _2107 = 1.0 / _2103;
                float _2109 = _2105 + (-1.0);
                float _2111 = -_2109;
                float _2113 = fma(_2111, _2107, _2069);
                float _2115 = _2113 * _2101;
                float _2117 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2087 = _2117;
            }
            float _2119 = _2087;
            float _2121 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2123 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2125 = !_157;
            if (!_2125)
            {
                float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2129 = log2(_2127);
                float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2133 = _2131 + 1.0;
                float _2135 = 1.0 / _2133;
                float _2137 = _2129 * _2069;
                float _2139 = exp2(_2137);
                float _2141 = -_2139;
                float _2143 = _2141 + 1.0;
                float _2145 = _2143 * _2135;
                _2071 = _2145;
            }
            float _2147 = _2071;
            float _2149 = fma(_2147, _161, _2123);
            float _2151 = fma(_2147, _159, _2121);
            float _2153 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2155 = -_397;
            float _2157 = _2155 + _2149;
            float _2159 = -_401;
            float _2161 = _2159 + _2151;
            float _2163 = fma(_2147, _163, _2153);
            float _2165 = _2157 * _173;
            float _2167 = _2157 * _189;
            float _2169 = _2157 * _203;
            float _2171 = -_409;
            float _2173 = _2171 + _2163;
            float _2175 = fma(_2161, _171, _2165);
            float _2177 = fma(_2161, _187, _2167);
            float _2179 = fma(_2161, _201, _2169);
            float _2181 = fma(_2173, _175, _2175);
            float _2183 = fma(_2173, _191, _2177);
            float _2185 = fma(_2173, _205, _2179);
            _2047 = _2183;
            _2043 = _2181;
            _449 = _2185;
            _2053 = _2181;
            _2061 = _2183;
            _2067 = _2185;
        }
        float _2187 = _2047;
        float _2189 = _2043;
        float _2191 = _449;
        float _2193 = _2053;
        float _2195 = _2061;
        float _2197 = _2067;
        float _2199 = _2187 * _2187;
        float _2201 = rsqrt(_2017);
        float _2203 = fma(_2189, _2189, _2199);
        float _2205 = fma(_2191, _2191, _2203);
        float _2207 = sqrt(_2205);
        float _2209 = _2007 * _2201;
        float _2211 = _2003 * _2201;
        float _2213 = _2011 * _2201;
        bool _2215 = _2207 > 0.0;
        bool _2217 = !_2215;
        if (!_2217)
        {
            float _2219 = rsqrt(_2205);
            float _2221 = _2219 * _2187;
            float _2223 = _2219 * _2189;
            float _2225 = _2219 * _2191;
            float _2227 = _2211 * _2221;
            float _2229 = fma(_2209, _2223, _2227);
            float _2231 = fma(_2213, _2225, _2229);
            float _2233 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2235 = fma(_2193, _2233, _1997);
            float _2237 = fma(_2195, _2233, _1995);
            float _2239 = fma(_2197, _2233, _1999);
            _2027 = _2235;
            _2029 = _2237;
            _2031 = _2239;
        }
    }
    float _2241 = _2027;
    float _2243 = _2029;
    float _2245 = _2031;
    bool _2247 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2255 = _2251 || _2253;
    float _2257 = -_1801;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2241);
    float _2261 = -_1799;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2243);
    float _2265 = -_1807;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2245);
    float _2269 = _2263;
    float _2271 = _2259;
    float _2273 = _2267;
    float _2275 = _2241;
    if (!_2255)
    {
        float _2277 = _1819 * _1819;
        float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2281 = -_1493;
        float _2283 = _2281 + _2245;
        float _2285 = -_1475;
        float _2287 = _2285 + _2241;
        float _2289 = fma(_1827, _1827, _2277);
        float _2291 = -_1519;
        float _2293 = _2291 + _2243;
        float _2295 = fma(_1837, _1837, _2289);
        float _2297 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2299 = sqrt(_2295);
        float _2301 = 1.0 / _1863;
        float _2303 = precise::min(_2299, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2305 = _2303 * _2279;
        float _2307 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2309 = _2305 * _2301;
        float _2311 = _2307 * _2309;
        float _2313 = _2283 * _2309;
        float _2315 = fma(_2287, _2311, _1811);
        float _2317 = fma(_2293, _2311, _1805);
        float _2319 = fma(_2307, _2313, _1823);
        _2269 = _2317;
        _2271 = _2315;
        _2273 = _2319;
    }
    float _2321 = _2269;
    float _2323 = _2271;
    float _2325 = _2273;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2329 = _2321 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2333 = _2323 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = fma(_2337, _2337, _2341);
    float _2345 = rsqrt(_2343);
    float _2347 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2349 = _2333 * _2347;
    float _2351 = _2337 * _2347;
    float _2353 = _2349 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 + _2355;
    float _2359 = sqrt(_2357);
    bool _2361 = _2359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = _2359 + _2363;
    float _2367 = _2337;
    float _2369 = _2357;
    float _2371 = _2365;
    float _2373 = _2349;
    if (_2361)
    {
        float _2375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2375;
    }
    float _2377 = _2367;
    if (_2361)
    {
        float _2379 = rsqrt(_2357);
        _2369 = _2379;
    }
    float _2381 = _2369;
    float _2383 = _2381;
    if (_2361)
    {
        float _2385 = _2365 * _2377;
        _2371 = _2385;
    }
    float _2387 = _2371;
    if (_2361)
    {
        float _2389 = _2387 * 0.15915493667125701904296875;
        _195 = _2389;
    }
    float _2391 = _195;
    float _2393 = _2345;
    if (_2361)
    {
        float _2395 = _2391 * 6.283185482025146484375;
        float _2397 = sin(_2395);
        _2393 = _2397;
    }
    float _2399 = _2393;
    float _2401 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2403 = precise::max(0.0, _2401);
    float _2405 = _171;
    float _2407 = _2403;
    float _2409 = _2401;
    if (_2361)
    {
        float _2411 = _2391 * 6.283185482025146484375;
        float _2413 = cos(_2411);
        _2405 = _2413;
    }
    float _2415 = _2405;
    float _2417 = -_2347;
    float _2419 = -_2403;
    float _2421 = fma(_2329, _2417, _2419);
    if (_2361)
    {
        float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2407 = _2423;
    }
    float _2425 = _2407;
    float _2427 = sqrt(_2343);
    float _2429 = _2399;
    float _2431 = _2425;
    if (_2361)
    {
        float _2433 = fma(_2399, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2429 = _2433;
    }
    float _2435 = _2429;
    float _2437 = _2435;
    if (!_2361)
    {
        _2431 = _2351;
    }
    float _2439 = _2431;
    float _2441 = _2439;
    if (_2361)
    {
        float _2443 = _2415 + (-1.0);
        _2409 = _2443;
    }
    float _2445 = _2409;
    float _2447 = _2445;
    if (_2361)
    {
        float _2449 = _2381 * _2435;
        _2275 = _2449;
    }
    float _2451 = _2275;
    if (!_2361)
    {
        _2437 = _2421;
    }
    float _2453 = _2437;
    float _2455 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2457 = _2453;
    if (_2361)
    {
        float _2459 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _231 = _2459;
    }
    float _2461 = _231;
    if (_2361)
    {
        float _2463 = _2349 * _2451;
        _2373 = _2463;
    }
    float _2465 = _2373;
    if (!_2361)
    {
        _2383 = _2353;
    }
    float _2467 = _2383;
    float _2469 = _2467;
    if (_2361)
    {
        float _2471 = _2351 * _2451;
        _2441 = _2471;
    }
    float _2473 = _2441;
    if (_2361)
    {
        float _2475 = fma(_2421, _2415, _2461);
        _2457 = _2475;
    }
    float _2477 = _2457;
    if (_2361)
    {
        float _2479 = _2465 * _2465;
        _2469 = _2479;
    }
    float _2481 = _2469;
    if (!_2361)
    {
        _2447 = _2355;
    }
    float _2483 = _2447;
    float _2485 = _2483;
    if (_2361)
    {
        float _2487 = _2473 * _2473;
        _2485 = _2487;
    }
    float _2489 = _2485;
    float _2491 = fma(_2477, _2477, _2481);
    float _2493 = _2491 + _2489;
    float _2495 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2499 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2497);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = rsqrt(_2493);
    float _2505 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2495);
    float _2507 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2509 = -_2501;
    float _2511 = _2509 + 1.0;
    float _2513 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2515 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2517 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2507);
    float _2519 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2525 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2517);
    float _2527 = abs(_2511);
    float _2529 = log2(_2527);
    float _2531 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2521);
    float _2533 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2535 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2537 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2539 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2541 = _2503 * _2465;
    float _2543 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2545 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2533);
    float _2547 = -_2537;
    float _2549 = fma(_2547, _2455, 1.0);
    float _2551 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2553 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2543);
    float _2555 = _2503 * _2477;
    float _2557 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2559 = _2503 * _2473;
    float _2561 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2553);
    float _2563 = -_2551;
    float _2565 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = log2(_2549);
    float _2571 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2561);
    float _2573 = -_2559;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2577 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2579 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2581 = fma(_2575, -0.5, 0.5);
    float _2583 = fma(_2575, 0.5, 0.5);
    float _2585 = exp2(_2567);
    float _2587 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2577);
    float _2589 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2579);
    float _2591 = fma(_2583, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2593 = _2555 + 1.0;
    float _2595 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2597 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2599 = fma(_2583, _2591, -0.212114393711090087890625);
    float _2601 = 1.0 / _2571;
    float _2603 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2595);
    float _2605 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2597);
    float _2607 = fma(_2583, _2599, 1.570728778839111328125);
    float _2609 = _2569 * 0.693147182464599609375;
    float _2611 = sqrt(_2581);
    float _2613 = -_2555;
    float _2615 = fma(_2585, _2593, _2613);
    float _2617 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2619 = fma(_2615, 0.5, 0.5);
    float _2621 = _2603 * _2601;
    float _2623 = _2605 * _2601;
    float _2625 = fma(_2621, 0.5, 0.5);
    float _2627 = fma(_2623, -0.5, 0.5);
    float _2629 = _2611 * 0.636619746685028076171875;
    float3 _6984 = float3(_2625, _2627, _2617);
    float _2631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6984, float3(0.0), isnan(_6984)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6984, float3(0.0), isnan(_6984)), level(0.0)).x;
    float _2633 = -_2607;
    float _2635 = fma(_2629, _2633, 1.0);
    float3 _7000 = float3(_2625, _2627, _2617);
    float4 _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7000, float3(0.0), isnan(_7000)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7000, float3(0.0), isnan(_7000)), level(0.0)).xyzw;
    float _2640 = _2638.x;
    float _2642 = _2638.y;
    float _2644 = _2638.z;
    float _2646 = _2638.w;
    float2 _7017 = float2(_2635, _2619);
    float3 _2650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7017, float2(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7017, float2(0.0), isnan(_7017)), level(0.0)).xyz;
    float _2652 = _2650.x;
    float _2654 = _2650.y;
    float _2656 = _2650.z;
    float _2658 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2660 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2664 = isnan(0.5);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2670 = _2666 || _2668;
    float _2672 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2658);
    float _2674 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2660);
    float _2676 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2672);
    float _2678 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2674);
    float _2680 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2682 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2684 = _2676;
    float _2686 = _2617;
    float _2688 = _2680;
    float _2690 = _2535;
    if (!_2670)
    {
        _233 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2692 = _233;
    float _2694 = 1.0 / _2680;
    float _2696 = _2682 + _2680;
    float _2698 = _2692;
    if (!_2670)
    {
        _2684 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2700 = _2684;
    float _2702 = _2700;
    if (!_2670)
    {
        float _2704 = -_2692;
        float _2706 = _2704 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2686 = _2706;
    }
    float _2708 = _2686;
    float _2710 = _2708;
    if (!_2670)
    {
        float _2712 = -_2700;
        float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2688 = _2714;
    }
    float _2716 = _2688;
    float _2718 = _2716;
    if (!_2670)
    {
        float _2720 = 1.0 / _2708;
        _2710 = _2720;
    }
    float _2722 = _2710;
    float _2724 = _2696 * _2694;
    float _2726 = _2724 * 0.5;
    float _2728 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2670)
    {
        float _2730 = 1.0 / _2716;
        _2718 = _2730;
    }
    float _2732 = _2718;
    float _2734 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2738 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2736);
    if (_2670)
    {
        _2690 = 1.0;
    }
    float _2740 = _2690;
    float _2742 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2734);
    float _2744 = 1.0 / _2738;
    float _2746 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2742);
    float _2748 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2746);
    float _2750 = exp2(_2728);
    float _2752 = _2748 + _2571;
    float _2754 = _2752 * 0.5;
    float _2756 = _2740;
    if (!_2670)
    {
        float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2760 = -_2692;
        float _2762 = fma(_2744, _2758, _2760);
        _2698 = _2762;
    }
    float _2764 = _2698;
    float _2766 = _2764;
    if (!_2670)
    {
        float _2768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2770 = -_2700;
        float _2772 = fma(_2744, _2768, _2770);
        _2702 = _2772;
    }
    float _2774 = _2702;
    out.m_68.z = _2754;
    out.m_68.w = _2571;
    if (!_2670)
    {
        float _2776 = _2764 * _2722;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        _1857 = _2778;
    }
    float _2780 = _1857;
    if (_2670)
    {
        _2766 = 1.0;
    }
    float _2782 = _2766;
    float _2784 = _2782;
    if (!_2670)
    {
        float _2786 = _2774 * _2732;
        float _2788 = precise::clamp(_2786, 0.0, 1.0);
        _2784 = _2788;
    }
    float _2790 = _2784;
    if (!_2670)
    {
        float _2792 = -_2780;
        float _2794 = _2792 + 1.0;
        _2756 = _2794;
    }
    float _2796 = _2756;
    float _2798 = -_2750;
    float _2800 = _2798 + 1.0;
    bool _2802 = _2790 > 0.0;
    bool _2804 = isnan(_2790);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan(0.0);
    bool _2810 = _2806 || _2808;
    float _2812 = _2790 * _2796;
    bool _2814 = _2796 <= 0.0;
    bool _2816 = !_2810;
    bool _2818 = _2814 || _2816;
    float _2820 = _2812 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2822 = _2800 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2824 = _2820 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2603;
    out.gl_Position.y = _2605;
    out.gl_Position.z = _2748;
    out.gl_Position.w = _2571;
    out.m_45.x = _2824;
    float _2826 = _2822 * _2631;
    float _2828 = -_2822;
    float _2830 = _2828 + 1.0;
    float _2832 = _2646 * _2826;
    float _2834 = _2656 * _2826;
    float _2836 = fma(_2652, _2832, _2640);
    float _2838 = fma(_2654, _2832, _2642);
    float _2840 = _2646 * _2830;
    float _2842 = fma(_2646, _2834, _2644);
    out.m_70.x = _2836;
    out.m_70.y = _2838;
    out.m_70.z = _2842;
    out.m_70.w = _2840;
    if (!_2818)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2844 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2844;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1349 = false;
    bool _1019 = false;
    bool _839 = false;
    bool _671 = false;
    bool _469 = false;
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
        float _2901 = as_type<float>(_105);
        out.gl_Position.z = _2901;
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
        float _2970 = as_type<float>(_141);
        out.gl_Position.z = _2970;
    }
    if (_133)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    float _171 = in.m_54.x;
    float _173 = in.m_54.y;
    float _175 = in.m_54.z;
    float _177 = 0.0;
    float _179 = _145;
    if (!_157)
    {
        float _181 = _145 * _145;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = in.m_56.x;
    float _189 = in.m_56.y;
    float _191 = in.m_56.z;
    float _193 = _185;
    float _195 = _175;
    if (!_157)
    {
        float _197 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _197;
    }
    float _199 = _193;
    float _201 = in.m_58.x;
    float _203 = in.m_58.y;
    float _205 = in.m_58.z;
    int _207 = as_type<int>(_143) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_143) & 2;
    bool _213 = _211 != 0;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_213;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_157;
    float _225 = _199;
    float _227 = 0.0;
    float _229 = 0.0;
    float _231 = _161;
    float _233 = 0.5;
    if (!_223)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _145 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _145);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _263;
        _227 = _251;
        _229 = _253;
    }
    float _265 = _225;
    float _267 = _227;
    float _269 = _229;
    bool _271 = !_157;
    float _273 = _269;
    float _275 = _267;
    float _277 = _265;
    if (!_271)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = 1.0 / _285;
        float _289 = _145 * _281;
        float _291 = exp2(_289);
        float _293 = -_291;
        float _295 = _293 + 1.0;
        float _297 = _295 * _287;
        _179 = _297;
        _273 = _285;
    }
    float _299 = _179;
    float _301 = _273;
    float _303 = _301;
    if (!_157)
    {
        float _305 = _123 * _123;
        float _307 = _305 * 0.5;
        _275 = _307;
    }
    float _309 = _275;
    float _311 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _315 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _303 = _123;
    }
    float _317 = _303;
    float _319 = fma(_299, _159, _311);
    float _321 = fma(_299, _161, _313);
    float _323 = _317;
    if (!_157)
    {
        float _325 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _325;
    }
    float _327 = _277;
    bool _329 = !_157;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _123 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _123);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    bool _365 = !_157;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _123 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _323 = _385;
    }
    float _387 = _323;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _391 = fma(_299, _163, _315);
    float _393 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _397 = fma(_387, _161, _389);
    float _399 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _401 = fma(_387, _159, _393);
    float _403 = fma(_321, _147, _167);
    float _405 = -_397;
    float _407 = _321 + _405;
    float _409 = fma(_387, _163, _399);
    float _411 = fma(_319, _147, _165);
    float _413 = -_401;
    float _415 = _319 + _413;
    float _417 = _407 * _173;
    float _419 = _407 * _189;
    float _421 = _407 * _203;
    float _423 = -_409;
    float _425 = _391 + _423;
    float _427 = fma(_415, _171, _417);
    float _429 = fma(_415, _187, _419);
    float _431 = fma(_415, _201, _421);
    float _433 = fma(_391, _147, _169);
    float _435 = fma(_425, _175, _427);
    float _437 = fma(_425, _191, _429);
    float _439 = fma(_425, _205, _431);
    bool _441 = !_395;
    float _443 = _433;
    float _445 = _435;
    float _447 = _437;
    float _449 = _439;
    float _467;
    if (!_441)
    {
        float _451 = in.m_60.x;
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _455 = _451 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        float _471 = float(_89);
        float _473 = 1.0 / _471;
        float _475 = _123 * _473;
        _467 = _475;
    }
    _469 = false;
    float _477 = _467;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _481 = _477 + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = _477 + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _495;
    bool _499 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _501 = isnan(_477);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = 1.0 / _489;
    bool _513 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_477);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _527 = isnan(_477);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _493;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _541 = 1.0 / _497;
    float _543 = _481 * _511;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _547 = _477 + _545;
    bool _549 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_477);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _565 = _547 * _537;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _567;
    float _571 = -_559;
    float _573 = _571 + 1.0;
    float _575 = -_523;
    float _577 = _575 + 1.0;
    float _579 = fma(_563, _565, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _581 = _485 * _541;
    float _583 = fma(_569, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = _509 * _573;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    float _591 = -_509;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = _535 * _577;
    float _601 = fma(_589, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _603 = _523 * _593;
    float _605 = fma(_597, _565, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = in.m_52.x;
    float _609 = in.m_52.y;
    float _611 = -_535;
    float _613 = _611 + 1.0;
    float _615 = _583 * _599;
    float _617 = _601 * _599;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _623;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[143].x, _615);
    float _629 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[143].y, _617);
    float _631 = fma(_621, _581, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = fma(_625, _581, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _635 = fma(_579, _603, _627);
    float _637 = fma(_605, _603, _629);
    float _639 = fma(_631, _585, _635);
    float _641 = fma(_633, _585, _637);
    float _643 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _639);
    float _645 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _641);
    float _647 = _643 * _607;
    float _649 = _645 * _609;
    bool _651 = !_539;
    float _669;
    if (!_651)
    {
        float _653 = in.m_60.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_89);
        float _675 = 1.0 / _673;
        float _677 = _123 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _683 = _679 + _681;
    bool _685 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _687 = isnan(_679);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _699 = _679 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _707;
    bool _715 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _717 = isnan(_679);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _729 = 1.0 / _703;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _731;
    float _735 = _683 * _729;
    bool _737 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _739 = isnan(_679);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _749;
    float _753 = fma(_733, _735, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _755 = _747 * _711;
    float _757 = -_747;
    float _759 = _757 + 1.0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _761;
    float _765 = fma(_751, _735, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _767 = _725 * _759;
    float _769 = fma(_763, _735, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _771 = _699 * _713;
    float _773 = -_725;
    float _775 = _773 + 1.0;
    float _777 = _765 * _767;
    float _779 = _769 * _767;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _785 = _753 * _767;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _795 = fma(_783, _771, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _797 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].x, _777);
    float _799 = fma(_789, _771, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].y, _779);
    float _803 = fma(_793, _771, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _805 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].z, _785);
    float _807 = fma(_799, _755, _797);
    float _809 = fma(_795, _755, _801);
    float _811 = fma(_803, _755, _805);
    float _813 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].x, _807);
    float _815 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].y, _809);
    float _817 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].z, _811);
    bool _819 = !_727;
    float _837;
    if (!_819)
    {
        float _821 = in.m_60.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_89);
        float _843 = 1.0 / _841;
        float _845 = _123 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _851 = _847 + _849;
    float _853 = _813 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _859 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _861 = isnan(_847);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _879 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_847);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = 1.0 / _857;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _897;
    bool _901 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _903 = isnan(_847);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _915 = _889 * _895;
    float _917 = -_889;
    float _919 = _917 + 1.0;
    bool _921 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _923 = 1.0 / _873;
    float _925 = _911 * _919;
    float _927 = -_911;
    float _929 = _927 + 1.0;
    float _931 = 1.0 / _877;
    float _933 = _899 * _891;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = fma(_933, _851, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _941 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _943 = isnan(_847);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = _937 * _923;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _847 + _959;
    float _963 = _939 * _925;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _847 + _965;
    float _969 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _971 = fma(_953, _961, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _973 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[115].x, _963);
    float _975 = _957 * _931;
    float _977 = -_951;
    float _979 = _977 + 1.0;
    float _981 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = fma(_971, _915, _973);
    float _985 = fma(_975, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _987 = _869 * _979;
    float _989 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = fma(_985, _987, _983);
    float _995 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[118].x, _993);
    float _997 = _995 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _981;
    out.m_62.y = _989;
    out.m_62.z = _991;
    out.m_62.w = _997;
    bool _999 = !_921;
    float _1017;
    if (!_999)
    {
        float _1001 = in.m_60.x;
        float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1005 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _1009 = _1007 * _1003;
        float _1011 = floor(_1009);
        float _1013 = -_1011;
        float _1015 = _1009 + _1013;
        _1017 = _1015;
        _1019 = true;
    }
    else
    {
        float _1021 = float(_89);
        float _1023 = 1.0 / _1021;
        float _1025 = _123 * _1023;
        _1017 = _1025;
    }
    _1019 = false;
    float _1027 = _1017;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1031 = _1027 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1035 = _1027 + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1053 = 1.0 / _1039;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1059;
    float _1063 = 1.0 / _1043;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1067 = _1027 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1073;
    bool _1077 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1079 = isnan(_1027);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1085);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1097 = 1.0 / _1047;
    float _1099 = _1067 * _1053;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1103 = _1027 + _1101;
    bool _1105 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1107 = isnan(_1027);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1119 = _1027 + _1117;
    float _1121 = fma(_1061, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1123 = fma(_1071, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1125 = fma(_1075, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1127 = 1.0 / _1051;
    float _1129 = _1031 * _1063;
    bool _1131 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1133 = isnan(_1027);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1147 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1149 = isnan(_1027);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    bool _1159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1161 = 1.0 / _1057;
    float _1163 = _1035 * _1097;
    float _1165 = -_1141;
    float _1167 = _1165 + 1.0;
    float _1169 = _1103 * _1127;
    float _1171 = _1157 * _1167;
    float _1173 = -_1157;
    float _1175 = _1173 + 1.0;
    float _1177 = -_1115;
    float _1179 = _1177 + 1.0;
    float _1181 = _1115 * _1175;
    bool _1183 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1185 = isnan(_1027);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = _1119 * _1161;
    bool _1197 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1199 = isnan(_1027);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = -_1193;
    float _1211 = _1209 + 1.0;
    float _1213 = _1207 * _1179;
    float _1215 = -_1207;
    float _1217 = _1215 + 1.0;
    float _1219 = _1087 * _1211;
    float _1221 = fma(_1095, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1223 = _1193 * _1217;
    float _1225 = fma(_1091, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1227 = _1121 * _1219;
    float _1229 = -_1087;
    float _1231 = _1229 + 1.0;
    float _1233 = _1123 * _1219;
    float _1235 = _1125 * _1219;
    float _1237 = fma(_1145, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1243;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1227);
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1233);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1235);
    float _1253 = fma(_1241, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1259;
    float _1263 = fma(_1245, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1265 = fma(_1221, _1223, _1247);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1275 = fma(_1257, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1277 = fma(_1225, _1223, _1249);
    float _1279 = fma(_1237, _1223, _1251);
    float _1281 = fma(_1261, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1283 = fma(_1263, _1213, _1265);
    float _1285 = fma(_1269, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1287 = fma(_1273, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1289 = fma(_1281, _1213, _1279);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1291;
    float _1295 = fma(_1253, _1213, _1277);
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1301;
    float _1305 = fma(_1275, _1181, _1283);
    float _1307 = fma(_1293, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1309 = fma(_1299, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1311 = fma(_1285, _1181, _1295);
    float _1313 = fma(_1303, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1315 = fma(_1287, _1181, _1289);
    float _1317 = fma(_1307, _1171, _1305);
    float _1319 = fma(_1309, _1171, _1311);
    float _1321 = fma(_1313, _1171, _1315);
    float _1323 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1317);
    float _1325 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1319);
    float _1327 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1321);
    bool _1329 = !_1159;
    float _1347;
    if (!_1329)
    {
        float _1331 = in.m_60.x;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1335 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _1339 = _1337 * _1333;
        float _1341 = floor(_1339);
        float _1343 = -_1341;
        float _1345 = _1339 + _1343;
        _1347 = _1345;
        _1349 = true;
    }
    else
    {
        float _1351 = float(_89);
        float _1353 = 1.0 / _1351;
        float _1355 = _123 * _1353;
        _1347 = _1355;
    }
    _1349 = false;
    float _1357 = _1347;
    float _1359 = in.m_60.x;
    float _1361 = in.m_60.y;
    float _1363 = in.m_60.z;
    float _1365 = in.m_60.w;
    float _1367 = _403 * _203;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1373;
    float _1377 = fma(_411, _201, _1367);
    float _1379 = 1.0 / _1371;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1389 = _1387 != 0;
    float _1391 = _403 * _189;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1395 = _1393 != 0;
    float _1397 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    float _1403 = fma(_411, _187, _1391);
    float _1405 = fma(_433, _205, _1377);
    float _1407 = in.m_54.w;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1417 = _1375 * _1379;
    float _1419 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1421 = in.m_56.w;
    bool _1423 = _1359 > 0.5;
    float _1425 = fma(_1419, -2.0, _1385);
    bool _1427 = _1365 > 0.5;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1433 = -_217;
    int _1435 = _1423 ? as_type<int>(_1433) : as_type<int>(_217);
    float _1437 = in.m_58.w;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1441 = _1439 != 0;
    float _1443 = _403 * _173;
    float _1445 = 1.0 / _1431;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1449 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1451 = fma(_411, _171, _1443);
    float _1453 = _1325 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1455 = -_1447;
    float _1457 = fma(_1449, 2.0, _1455);
    float _1459 = 1.0 / _1411;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1463 = fma(_433, _175, _1451);
    bool _1465 = !_1383;
    float _1467 = _1465 ? _217 : as_type<float>(_1435);
    float _1469 = -_123;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1457);
    bool _1473 = _1361 > 0.5;
    float _1475 = _1463 + _1407;
    float _1477 = _1431;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1441)
    {
        _1477 = _1363;
    }
    float _1481 = _1477;
    float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1485 = fma(_433, _191, _1403);
    float _1487 = _1467 + 0.5;
    float _1489 = _1481;
    if (!_1441)
    {
        _443 = _1361;
    }
    float _1491 = _443;
    float _1493 = _1405 + _1437;
    float _1495 = _1491;
    if (_1441)
    {
        _1495 = _1359;
    }
    float _1497 = _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1499;
    float _1503 = _1415 * _1459;
    float _1505 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1509 = _1501 * _1445;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1513 = _1357 + _1511;
    float _1515 = -_221;
    int _1517 = _1473 ? as_type<int>(_1515) : as_type<int>(_221);
    float _1519 = _1485 + _1421;
    bool _1521 = _1363 > 0.5;
    float _1523 = fma(_1417, _1513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_1441)
    {
        _1479 = _1363;
    }
    float _1525 = _1479;
    float _1527 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1531 = _1357 + _1529;
    bool _1533 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1535 = isnan(_1357);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1547 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1549 = isnan(_1357);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = fma(_1503, _1531, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1561 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1563 = isnan(_1357);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = -_1543;
    float _1575 = _1573 + 1.0;
    float _1577 = _1525;
    if (_1441)
    {
        _1577 = _1361;
    }
    float _1579 = _1577;
    float _1581 = -_1557;
    float _1583 = _1581 + 1.0;
    if (_1441)
    {
        _1489 = _1361;
    }
    float _1585 = _1489;
    float _1587 = _1571 * _1575;
    bool _1589 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1591 = isnan(_1357);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = _1543 * _1583;
    float _1603 = -_1571;
    float _1605 = _1603 + 1.0;
    float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1609 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1611 = _1599 * _1605;
    float _1613 = -_1599;
    float _1615 = _1613 + 1.0;
    float _1617 = fma(_1609, _1487, _1471);
    float _1619 = _1523 * _1611;
    bool _1621 = !_1389;
    float _1623 = _1621 ? _221 : as_type<float>(_1517);
    float _1625 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1425);
    float _1627 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1619);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1633 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1637 = _1623 + (-0.5);
    float _1639 = fma(_1559, _1587, _1629);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1643 = _1357 + _1641;
    float _1645 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1649 = _1519 + _1647;
    float _1651 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1635);
    float _1653 = -_1627;
    float _1655 = -_1625;
    float _1657 = fma(_1653, _1637, _1655);
    float _1659 = fma(_1509, _1643, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1663 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1665 = -_217;
    int _1667 = _1521 ? as_type<int>(_1665) : as_type<int>(_217);
    float _1669 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1505);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1673 = _1475 + _1671;
    float _1675 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1677 = -_1661;
    float _1679 = fma(_1663, 2.0, _1677);
    bool _1681 = !_1395;
    float _1683 = _1681 ? _217 : as_type<float>(_1667);
    float _1685 = fma(_1659, _1601, _1639);
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1493 + _1687;
    float _1691 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1675);
    float _1693 = -_1669;
    float _1695 = _1693 + 1.0;
    float _1697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1699 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1631);
    float _1701 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1685);
    float _1703 = -_221;
    int _1705 = _1427 ? as_type<int>(_1703) : as_type<int>(_221);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1691);
    float _1709 = -_1695;
    float _1711 = fma(_1467, _1709, _1617);
    float _1713 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1651);
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1717 = _1649 * _1649;
    bool _1719 = !_1401;
    float _1721 = _1719 ? _221 : as_type<float>(_1705);
    float _1723 = -_1713;
    float _1725 = _1723 + 1.0;
    float _1727 = fma(_1633, -2.0, _1715);
    bool _1729 = _1707 >= 0.0;
    float _1731 = fma(_1673, _1673, _1717);
    float _1733 = _1721 + (-0.5);
    float _1735 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1727);
    float _1737 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1527);
    float _1739 = fma(_1689, _1689, _1731);
    float _1741 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1743 = -_1645;
    float _1745 = -_1735;
    float _1747 = fma(_1743, _1733, _1745);
    float _1749 = _1683 + 0.5;
    float _1751 = -_123;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1679);
    float _1755 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1699);
    float _1757 = rsqrt(_1739);
    float _1759 = -_1737;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1721, _1725, _1747);
    float _1765 = fma(_1741, _1749, _1753);
    float _1767 = -_1755;
    float _1769 = _1767 + 1.0;
    float _1771 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1773 = _1731;
    if (_1729)
    {
        _1773 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1775 = _1773;
    float _1777 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1779 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = fma(_1623, _1761, _1657);
    float _1783 = -_1769;
    float _1785 = fma(_1683, _1783, _1765);
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1791 = as_type<int>(_1775);
    float _1793 = _1785;
    if (_1729)
    {
        float _1795 = _1775 * 5.0;
        _1791 = as_type<int>(_1795);
    }
    int _1797 = _1791;
    out.m_64.x = _1711;
    out.m_64.y = _1781;
    out.m_64.z = _1785;
    out.m_64.w = _1763;
    float _1799 = _1649 * _1757;
    float _1801 = _1673 * _1757;
    out.m_66.x = _1777;
    out.m_66.y = _1779;
    out.m_66.z = _1787;
    out.m_66.w = _1789;
    if (_1729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5633 = as_type<float>(_1797);
        out.gl_Position.z = _5633;
    }
    if (_1729)
    {
        out.m_45.x = 0.0;
    }
    if (_1729)
    {
        return out;
    }
    float _1803 = -_1799;
    float _1805 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1519);
    float _1807 = _1689 * _1757;
    float _1809 = -_1801;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1475);
    float _1813 = -_1799;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1819 = _1805 + _1817;
    float _1821 = -_1807;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = _1811 + _1825;
    float _1829 = -_1801;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1673);
    float _1833 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1837 = _1823 + _1835;
    float _1839 = _1815 * _1815;
    float _1841 = -_1807;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1689);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1833);
    float _1847 = fma(_1831, _1831, _1839);
    float _1849 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1845);
    float _1851 = fma(_1843, _1843, _1847);
    bool _1853 = _1849 >= 0.0;
    float _1855 = sqrt(_1851);
    float _1857 = _1823;
    if (_1853)
    {
        _1793 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1859 = _1793;
    int _1861 = as_type<int>(_1859);
    if (_1853)
    {
        out.m_45.x = 0.0;
    }
    float _1863 = _1757 * _1855;
    if (_1853)
    {
        float _1865 = _1859 * 5.0;
        _1861 = as_type<int>(_1865);
    }
    int _1867 = _1861;
    if (_1853)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5765 = as_type<float>(_1867);
        out.gl_Position.z = _5765;
    }
    if (_1853)
    {
        return out;
    }
    float _1869 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1871 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1877 = _1863 * _1869;
    float _1879 = _1863 * _1871;
    float _1881 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1883 = _1881 * 0.5;
    float _1885 = _1873 * _1877;
    float _1887 = _1875 * _1879;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1891 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1889);
    float _1897 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1891);
    float _1899 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1893);
    float _1901 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1895);
    float _1903 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1897);
    float _1905 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1899);
    float _1907 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1909 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1911 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1913 = _1493 + _1907;
    float _1915 = _1475 + _1909;
    float _1917 = _1519 + _1911;
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1921 = _1913 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1925 = _1915 + _1923;
    float _1927 = _1921 * _1921;
    float _1929 = fma(_1925, _1925, _1927);
    float _1931 = sqrt(_1929);
    bool _1933 = _1931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1935 = _1905;
    float _1937 = _1927;
    float _1939 = _1911;
    float _1941 = _1913;
    float _1943 = _1917;
    if (!_1933)
    {
        _1935 = _1915;
    }
    float _1945 = _1935;
    float _1947 = _1945;
    if (!_1933)
    {
        _1937 = _1913;
    }
    float _1949 = _1937;
    float _1951 = _1949;
    if (!_1933)
    {
        _1939 = _1917;
    }
    float _1953 = _1939;
    bool _1955 = !_1933;
    float _1957 = _1953;
    if (!_1955)
    {
        float _1959 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1963 = _1931 + _1961;
        float _1965 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1967 = rsqrt(_1929);
        float _1969 = _1963 * _1959;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1971 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        float _1977 = _1971 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        float _1981 = _1975 + (-1.0);
        float _1983 = fma(_1979, _1965, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1985 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1987 = _1967 * _1983;
        float _1989 = fma(_1917, _1975, _1985);
        float _1991 = fma(_1925, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1993 = fma(_1921, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1957 = _1989;
        _1947 = _1991;
        _1951 = _1993;
    }
    float _1995 = _1957;
    float _1997 = _1947;
    float _1999 = _1951;
    float _2001 = -_1519;
    float _2003 = _2001 + _1995;
    float _2005 = -_1475;
    float _2007 = _2005 + _1997;
    float _2009 = -_1493;
    float _2011 = _2009 + _1999;
    float _2013 = _2003 * _2003;
    float _2015 = fma(_2007, _2007, _2013);
    float _2017 = fma(_2011, _2011, _2015);
    float _2019 = sqrt(_2017);
    bool _2021 = _2019 > 0.0;
    bool _2023 = !_2021;
    float _2025 = _2019;
    float _2027 = _1997;
    float _2029 = _1995;
    float _2031 = _1999;
    if (!_2023)
    {
        bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2035 = _1929;
        if (_2033)
        {
            float _2037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2035 = _2037;
        }
        float _2039 = _2035;
        if (_2033)
        {
            _1941 = _435;
        }
        float _2041 = _1941;
        float _2043 = _2041;
        if (_2033)
        {
            _2025 = _437;
        }
        float _2045 = _2025;
        float _2047 = _2045;
        if (_2033)
        {
            float _2049 = _435 * _2039;
            _1943 = _2049;
        }
        float _2051 = _1943;
        float _2053 = _2051;
        if (_2033)
        {
            float _2055 = _437 * _2039;
            _445 = _2055;
        }
        float _2057 = _445;
        float _2059 = _2057;
        float _2061 = _2057;
        if (_2033)
        {
            float _2063 = _439 * _2039;
            _447 = _2063;
        }
        float _2065 = _447;
        float _2067 = _2065;
        if (!_2033)
        {
            float _2069 = _123 + 1.0;
            float _2071 = _2069;
            if (!_157)
            {
                float _2073 = _2069 * _2069;
                float _2075 = _2073 * 0.5;
                _2059 = _2075;
            }
            float _2077 = _2059;
            float _2079 = _2077;
            if (!_157)
            {
                float _2081 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2079 = _2081;
            }
            float _2083 = _2079;
            bool _2085 = !_157;
            float _2087 = _2083;
            if (!_2085)
            {
                float _2089 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2091 = log2(_2089);
                float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2095 = _2093 + 1.0;
                float _2097 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2099 = _2091 * _2069;
                float _2101 = 1.0 / _2095;
                float _2103 = _2097 * 0.693147182464599609375;
                float _2105 = exp2(_2099);
                float _2107 = 1.0 / _2103;
                float _2109 = _2105 + (-1.0);
                float _2111 = -_2109;
                float _2113 = fma(_2111, _2107, _2069);
                float _2115 = _2113 * _2101;
                float _2117 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2087 = _2117;
            }
            float _2119 = _2087;
            float _2121 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2123 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2125 = !_157;
            if (!_2125)
            {
                float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2129 = log2(_2127);
                float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2133 = _2131 + 1.0;
                float _2135 = 1.0 / _2133;
                float _2137 = _2129 * _2069;
                float _2139 = exp2(_2137);
                float _2141 = -_2139;
                float _2143 = _2141 + 1.0;
                float _2145 = _2143 * _2135;
                _2071 = _2145;
            }
            float _2147 = _2071;
            float _2149 = fma(_2147, _161, _2123);
            float _2151 = fma(_2147, _159, _2121);
            float _2153 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2155 = -_397;
            float _2157 = _2155 + _2149;
            float _2159 = -_401;
            float _2161 = _2159 + _2151;
            float _2163 = fma(_2147, _163, _2153);
            float _2165 = _2157 * _173;
            float _2167 = _2157 * _189;
            float _2169 = _2157 * _203;
            float _2171 = -_409;
            float _2173 = _2171 + _2163;
            float _2175 = fma(_2161, _171, _2165);
            float _2177 = fma(_2161, _187, _2167);
            float _2179 = fma(_2161, _201, _2169);
            float _2181 = fma(_2173, _175, _2175);
            float _2183 = fma(_2173, _191, _2177);
            float _2185 = fma(_2173, _205, _2179);
            _2047 = _2183;
            _2043 = _2181;
            _449 = _2185;
            _2053 = _2181;
            _2061 = _2183;
            _2067 = _2185;
        }
        float _2187 = _2047;
        float _2189 = _2043;
        float _2191 = _449;
        float _2193 = _2053;
        float _2195 = _2061;
        float _2197 = _2067;
        float _2199 = _2187 * _2187;
        float _2201 = rsqrt(_2017);
        float _2203 = fma(_2189, _2189, _2199);
        float _2205 = fma(_2191, _2191, _2203);
        float _2207 = sqrt(_2205);
        float _2209 = _2007 * _2201;
        float _2211 = _2003 * _2201;
        float _2213 = _2011 * _2201;
        bool _2215 = _2207 > 0.0;
        bool _2217 = !_2215;
        if (!_2217)
        {
            float _2219 = rsqrt(_2205);
            float _2221 = _2219 * _2187;
            float _2223 = _2219 * _2189;
            float _2225 = _2219 * _2191;
            float _2227 = _2211 * _2221;
            float _2229 = fma(_2209, _2223, _2227);
            float _2231 = fma(_2213, _2225, _2229);
            float _2233 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2235 = fma(_2193, _2233, _1997);
            float _2237 = fma(_2195, _2233, _1995);
            float _2239 = fma(_2197, _2233, _1999);
            _2027 = _2235;
            _2029 = _2237;
            _2031 = _2239;
        }
    }
    float _2241 = _2027;
    float _2243 = _2029;
    float _2245 = _2031;
    bool _2247 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2255 = _2251 || _2253;
    float _2257 = -_1801;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2241);
    float _2261 = -_1799;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2243);
    float _2265 = -_1807;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2245);
    float _2269 = _2263;
    float _2271 = _2259;
    float _2273 = _2267;
    float _2275 = _2241;
    if (!_2255)
    {
        float _2277 = _1819 * _1819;
        float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2281 = -_1493;
        float _2283 = _2281 + _2245;
        float _2285 = -_1475;
        float _2287 = _2285 + _2241;
        float _2289 = fma(_1827, _1827, _2277);
        float _2291 = -_1519;
        float _2293 = _2291 + _2243;
        float _2295 = fma(_1837, _1837, _2289);
        float _2297 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2299 = sqrt(_2295);
        float _2301 = 1.0 / _1863;
        float _2303 = precise::min(_2299, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2305 = _2303 * _2279;
        float _2307 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2309 = _2305 * _2301;
        float _2311 = _2307 * _2309;
        float _2313 = _2283 * _2309;
        float _2315 = fma(_2287, _2311, _1811);
        float _2317 = fma(_2293, _2311, _1805);
        float _2319 = fma(_2307, _2313, _1823);
        _2269 = _2317;
        _2271 = _2315;
        _2273 = _2319;
    }
    float _2321 = _2269;
    float _2323 = _2271;
    float _2325 = _2273;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2329 = _2321 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2333 = _2323 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = fma(_2337, _2337, _2341);
    float _2345 = rsqrt(_2343);
    float _2347 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2349 = _2333 * _2347;
    float _2351 = _2337 * _2347;
    float _2353 = _2349 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 + _2355;
    float _2359 = sqrt(_2357);
    bool _2361 = _2359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = _2359 + _2363;
    float _2367 = _2337;
    float _2369 = _2357;
    float _2371 = _2365;
    float _2373 = _2349;
    if (_2361)
    {
        float _2375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2375;
    }
    float _2377 = _2367;
    if (_2361)
    {
        float _2379 = rsqrt(_2357);
        _2369 = _2379;
    }
    float _2381 = _2369;
    float _2383 = _2381;
    if (_2361)
    {
        float _2385 = _2365 * _2377;
        _2371 = _2385;
    }
    float _2387 = _2371;
    if (_2361)
    {
        float _2389 = _2387 * 0.15915493667125701904296875;
        _195 = _2389;
    }
    float _2391 = _195;
    float _2393 = _2345;
    if (_2361)
    {
        float _2395 = _2391 * 6.283185482025146484375;
        float _2397 = sin(_2395);
        _2393 = _2397;
    }
    float _2399 = _2393;
    float _2401 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2403 = precise::max(0.0, _2401);
    float _2405 = _171;
    float _2407 = _2403;
    float _2409 = _2401;
    if (_2361)
    {
        float _2411 = _2391 * 6.283185482025146484375;
        float _2413 = cos(_2411);
        _2405 = _2413;
    }
    float _2415 = _2405;
    float _2417 = -_2347;
    float _2419 = -_2403;
    float _2421 = fma(_2329, _2417, _2419);
    if (_2361)
    {
        float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2407 = _2423;
    }
    float _2425 = _2407;
    float _2427 = sqrt(_2343);
    float _2429 = _2399;
    float _2431 = _2425;
    if (_2361)
    {
        float _2433 = fma(_2399, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2429 = _2433;
    }
    float _2435 = _2429;
    float _2437 = _2435;
    if (!_2361)
    {
        _2431 = _2351;
    }
    float _2439 = _2431;
    float _2441 = _2439;
    if (_2361)
    {
        float _2443 = _2415 + (-1.0);
        _2409 = _2443;
    }
    float _2445 = _2409;
    float _2447 = _2445;
    if (_2361)
    {
        float _2449 = _2381 * _2435;
        _2275 = _2449;
    }
    float _2451 = _2275;
    if (!_2361)
    {
        _2437 = _2421;
    }
    float _2453 = _2437;
    float _2455 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2457 = _2453;
    if (_2361)
    {
        float _2459 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _231 = _2459;
    }
    float _2461 = _231;
    if (_2361)
    {
        float _2463 = _2349 * _2451;
        _2373 = _2463;
    }
    float _2465 = _2373;
    if (!_2361)
    {
        _2383 = _2353;
    }
    float _2467 = _2383;
    float _2469 = _2467;
    if (_2361)
    {
        float _2471 = _2351 * _2451;
        _2441 = _2471;
    }
    float _2473 = _2441;
    if (_2361)
    {
        float _2475 = fma(_2421, _2415, _2461);
        _2457 = _2475;
    }
    float _2477 = _2457;
    if (_2361)
    {
        float _2479 = _2465 * _2465;
        _2469 = _2479;
    }
    float _2481 = _2469;
    if (!_2361)
    {
        _2447 = _2355;
    }
    float _2483 = _2447;
    float _2485 = _2483;
    if (_2361)
    {
        float _2487 = _2473 * _2473;
        _2485 = _2487;
    }
    float _2489 = _2485;
    float _2491 = fma(_2477, _2477, _2481);
    float _2493 = _2491 + _2489;
    float _2495 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2499 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2497);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = rsqrt(_2493);
    float _2505 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2495);
    float _2507 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2509 = -_2501;
    float _2511 = _2509 + 1.0;
    float _2513 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2515 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2517 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2507);
    float _2519 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2525 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2517);
    float _2527 = abs(_2511);
    float _2529 = log2(_2527);
    float _2531 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2521);
    float _2533 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2535 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2537 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2539 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2541 = _2503 * _2465;
    float _2543 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2545 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2533);
    float _2547 = -_2537;
    float _2549 = fma(_2547, _2455, 1.0);
    float _2551 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2553 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2543);
    float _2555 = _2503 * _2477;
    float _2557 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2559 = _2503 * _2473;
    float _2561 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2553);
    float _2563 = -_2551;
    float _2565 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = log2(_2549);
    float _2571 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2561);
    float _2573 = -_2559;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2577 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2579 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2581 = fma(_2575, -0.5, 0.5);
    float _2583 = fma(_2575, 0.5, 0.5);
    float _2585 = exp2(_2567);
    float _2587 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2577);
    float _2589 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2579);
    float _2591 = fma(_2583, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2593 = _2555 + 1.0;
    float _2595 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2597 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2599 = fma(_2583, _2591, -0.212114393711090087890625);
    float _2601 = 1.0 / _2571;
    float _2603 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2595);
    float _2605 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2597);
    float _2607 = fma(_2583, _2599, 1.570728778839111328125);
    float _2609 = _2569 * 0.693147182464599609375;
    float _2611 = sqrt(_2581);
    float _2613 = -_2555;
    float _2615 = fma(_2585, _2593, _2613);
    float _2617 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2619 = fma(_2615, 0.5, 0.5);
    float _2621 = _2603 * _2601;
    float _2623 = _2605 * _2601;
    float _2625 = fma(_2621, 0.5, 0.5);
    float _2627 = fma(_2623, -0.5, 0.5);
    float _2629 = _2611 * 0.636619746685028076171875;
    float3 _6984 = float3(_2625, _2627, _2617);
    float _2631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6984, float3(0.0), isnan(_6984)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6984, float3(0.0), isnan(_6984)), level(0.0)).x;
    float _2633 = -_2607;
    float _2635 = fma(_2629, _2633, 1.0);
    float3 _7000 = float3(_2625, _2627, _2617);
    float4 _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7000, float3(0.0), isnan(_7000)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7000, float3(0.0), isnan(_7000)), level(0.0)).xyzw;
    float _2640 = _2638.x;
    float _2642 = _2638.y;
    float _2644 = _2638.z;
    float _2646 = _2638.w;
    float2 _7017 = float2(_2635, _2619);
    float3 _2650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7017, float2(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7017, float2(0.0), isnan(_7017)), level(0.0)).xyz;
    float _2652 = _2650.x;
    float _2654 = _2650.y;
    float _2656 = _2650.z;
    float _2658 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2660 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2664 = isnan(0.5);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2670 = _2666 || _2668;
    float _2672 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2658);
    float _2674 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2660);
    float _2676 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2672);
    float _2678 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2674);
    float _2680 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2682 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2684 = _2676;
    float _2686 = _2617;
    float _2688 = _2680;
    float _2690 = _2535;
    if (!_2670)
    {
        _233 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2692 = _233;
    float _2694 = 1.0 / _2680;
    float _2696 = _2682 + _2680;
    float _2698 = _2692;
    if (!_2670)
    {
        _2684 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2700 = _2684;
    float _2702 = _2700;
    if (!_2670)
    {
        float _2704 = -_2692;
        float _2706 = _2704 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2686 = _2706;
    }
    float _2708 = _2686;
    float _2710 = _2708;
    if (!_2670)
    {
        float _2712 = -_2700;
        float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2688 = _2714;
    }
    float _2716 = _2688;
    float _2718 = _2716;
    if (!_2670)
    {
        float _2720 = 1.0 / _2708;
        _2710 = _2720;
    }
    float _2722 = _2710;
    float _2724 = _2696 * _2694;
    float _2726 = _2724 * 0.5;
    float _2728 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2670)
    {
        float _2730 = 1.0 / _2716;
        _2718 = _2730;
    }
    float _2732 = _2718;
    float _2734 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2738 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2736);
    if (_2670)
    {
        _2690 = 1.0;
    }
    float _2740 = _2690;
    float _2742 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2734);
    float _2744 = 1.0 / _2738;
    float _2746 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2742);
    float _2748 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2746);
    float _2750 = exp2(_2728);
    float _2752 = _2748 + _2571;
    float _2754 = _2752 * 0.5;
    float _2756 = _2740;
    if (!_2670)
    {
        float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2760 = -_2692;
        float _2762 = fma(_2744, _2758, _2760);
        _2698 = _2762;
    }
    float _2764 = _2698;
    float _2766 = _2764;
    if (!_2670)
    {
        float _2768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2770 = -_2700;
        float _2772 = fma(_2744, _2768, _2770);
        _2702 = _2772;
    }
    float _2774 = _2702;
    out.m_68.z = _2754;
    out.m_68.w = _2571;
    if (!_2670)
    {
        float _2776 = _2764 * _2722;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        _1857 = _2778;
    }
    float _2780 = _1857;
    if (_2670)
    {
        _2766 = 1.0;
    }
    float _2782 = _2766;
    float _2784 = _2782;
    if (!_2670)
    {
        float _2786 = _2774 * _2732;
        float _2788 = precise::clamp(_2786, 0.0, 1.0);
        _2784 = _2788;
    }
    float _2790 = _2784;
    if (!_2670)
    {
        float _2792 = -_2780;
        float _2794 = _2792 + 1.0;
        _2756 = _2794;
    }
    float _2796 = _2756;
    float _2798 = -_2750;
    float _2800 = _2798 + 1.0;
    bool _2802 = _2790 > 0.0;
    bool _2804 = isnan(_2790);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan(0.0);
    bool _2810 = _2806 || _2808;
    float _2812 = _2790 * _2796;
    bool _2814 = _2796 <= 0.0;
    bool _2816 = !_2810;
    bool _2818 = _2814 || _2816;
    float _2820 = _2812 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2822 = _2800 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2824 = _2820 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2603;
    out.gl_Position.y = _2605;
    out.gl_Position.z = _2748;
    out.gl_Position.w = _2571;
    out.m_45.x = _2824;
    float _2826 = _2822 * _2631;
    float _2828 = -_2822;
    float _2830 = _2828 + 1.0;
    float _2832 = _2646 * _2826;
    float _2834 = _2656 * _2826;
    float _2836 = fma(_2652, _2832, _2640);
    float _2838 = fma(_2654, _2832, _2642);
    float _2840 = _2646 * _2830;
    float _2842 = fma(_2646, _2834, _2644);
    out.m_70.x = _2836;
    out.m_70.y = _2838;
    out.m_70.z = _2842;
    out.m_70.w = _2840;
    if (!_2818)
    {
        return out;
    }
    float _2844 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2844;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1349 = false;
    bool _1019 = false;
    bool _839 = false;
    bool _671 = false;
    bool _469 = false;
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
        float _2901 = as_type<float>(_105);
        out.gl_Position.z = _2901;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2970 = as_type<float>(_141);
        out.gl_Position.z = _2970;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    float _171 = in.m_54.x;
    float _173 = in.m_54.y;
    float _175 = in.m_54.z;
    float _177 = 0.0;
    float _179 = _145;
    if (!_157)
    {
        float _181 = _145 * _145;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = in.m_56.x;
    float _189 = in.m_56.y;
    float _191 = in.m_56.z;
    float _193 = _185;
    float _195 = _175;
    if (!_157)
    {
        float _197 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _197;
    }
    float _199 = _193;
    float _201 = in.m_58.x;
    float _203 = in.m_58.y;
    float _205 = in.m_58.z;
    int _207 = as_type<int>(_143) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_143) & 2;
    bool _213 = _211 != 0;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_213;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_157;
    float _225 = _199;
    float _227 = 0.0;
    float _229 = 0.0;
    float _231 = _161;
    float _233 = 0.5;
    if (!_223)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _145 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _145);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _263;
        _227 = _251;
        _229 = _253;
    }
    float _265 = _225;
    float _267 = _227;
    float _269 = _229;
    bool _271 = !_157;
    float _273 = _269;
    float _275 = _267;
    float _277 = _265;
    if (!_271)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = 1.0 / _285;
        float _289 = _145 * _281;
        float _291 = exp2(_289);
        float _293 = -_291;
        float _295 = _293 + 1.0;
        float _297 = _295 * _287;
        _179 = _297;
        _273 = _285;
    }
    float _299 = _179;
    float _301 = _273;
    float _303 = _301;
    if (!_157)
    {
        float _305 = _123 * _123;
        float _307 = _305 * 0.5;
        _275 = _307;
    }
    float _309 = _275;
    float _311 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _315 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _303 = _123;
    }
    float _317 = _303;
    float _319 = fma(_299, _159, _311);
    float _321 = fma(_299, _161, _313);
    float _323 = _317;
    if (!_157)
    {
        float _325 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _325;
    }
    float _327 = _277;
    bool _329 = !_157;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _123 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _123);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    bool _365 = !_157;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _123 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _323 = _385;
    }
    float _387 = _323;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _391 = fma(_299, _163, _315);
    float _393 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _397 = fma(_387, _161, _389);
    float _399 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _401 = fma(_387, _159, _393);
    float _403 = fma(_321, _147, _167);
    float _405 = -_397;
    float _407 = _321 + _405;
    float _409 = fma(_387, _163, _399);
    float _411 = fma(_319, _147, _165);
    float _413 = -_401;
    float _415 = _319 + _413;
    float _417 = _407 * _173;
    float _419 = _407 * _189;
    float _421 = _407 * _203;
    float _423 = -_409;
    float _425 = _391 + _423;
    float _427 = fma(_415, _171, _417);
    float _429 = fma(_415, _187, _419);
    float _431 = fma(_415, _201, _421);
    float _433 = fma(_391, _147, _169);
    float _435 = fma(_425, _175, _427);
    float _437 = fma(_425, _191, _429);
    float _439 = fma(_425, _205, _431);
    bool _441 = !_395;
    float _443 = _433;
    float _445 = _435;
    float _447 = _437;
    float _449 = _439;
    float _467;
    if (!_441)
    {
        float _451 = in.m_60.x;
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _455 = _451 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        float _471 = float(_89);
        float _473 = 1.0 / _471;
        float _475 = _123 * _473;
        _467 = _475;
    }
    _469 = false;
    float _477 = _467;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _481 = _477 + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _485 = _477 + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _495;
    bool _499 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _501 = isnan(_477);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = 1.0 / _489;
    bool _513 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _515 = isnan(_477);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _527 = isnan(_477);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _493;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _541 = 1.0 / _497;
    float _543 = _481 * _511;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _547 = _477 + _545;
    bool _549 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_477);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _565 = _547 * _537;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _567;
    float _571 = -_559;
    float _573 = _571 + 1.0;
    float _575 = -_523;
    float _577 = _575 + 1.0;
    float _579 = fma(_563, _565, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _581 = _485 * _541;
    float _583 = fma(_569, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = _509 * _573;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    float _591 = -_509;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = _535 * _577;
    float _601 = fma(_589, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _603 = _523 * _593;
    float _605 = fma(_597, _565, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = in.m_52.x;
    float _609 = in.m_52.y;
    float _611 = -_535;
    float _613 = _611 + 1.0;
    float _615 = _583 * _599;
    float _617 = _601 * _599;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _623;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[143].x, _615);
    float _629 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[143].y, _617);
    float _631 = fma(_621, _581, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = fma(_625, _581, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _635 = fma(_579, _603, _627);
    float _637 = fma(_605, _603, _629);
    float _639 = fma(_631, _585, _635);
    float _641 = fma(_633, _585, _637);
    float _643 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _639);
    float _645 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _641);
    float _647 = _643 * _607;
    float _649 = _645 * _609;
    bool _651 = !_539;
    float _669;
    if (!_651)
    {
        float _653 = in.m_60.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_89);
        float _675 = 1.0 / _673;
        float _677 = _123 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _683 = _679 + _681;
    bool _685 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _687 = isnan(_679);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _699 = _679 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _707;
    bool _715 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _717 = isnan(_679);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _729 = 1.0 / _703;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _731;
    float _735 = _683 * _729;
    bool _737 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _739 = isnan(_679);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _749;
    float _753 = fma(_733, _735, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _755 = _747 * _711;
    float _757 = -_747;
    float _759 = _757 + 1.0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _761;
    float _765 = fma(_751, _735, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _767 = _725 * _759;
    float _769 = fma(_763, _735, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _771 = _699 * _713;
    float _773 = -_725;
    float _775 = _773 + 1.0;
    float _777 = _765 * _767;
    float _779 = _769 * _767;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _785 = _753 * _767;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _795 = fma(_783, _771, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _797 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].x, _777);
    float _799 = fma(_789, _771, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].y, _779);
    float _803 = fma(_793, _771, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _805 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].z, _785);
    float _807 = fma(_799, _755, _797);
    float _809 = fma(_795, _755, _801);
    float _811 = fma(_803, _755, _805);
    float _813 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].x, _807);
    float _815 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].y, _809);
    float _817 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[109].z, _811);
    bool _819 = !_727;
    float _837;
    if (!_819)
    {
        float _821 = in.m_60.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_89);
        float _843 = 1.0 / _841;
        float _845 = _123 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _851 = _847 + _849;
    float _853 = _813 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _859 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _861 = isnan(_847);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _879 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_847);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = 1.0 / _857;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _897;
    bool _901 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _903 = isnan(_847);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _915 = _889 * _895;
    float _917 = -_889;
    float _919 = _917 + 1.0;
    bool _921 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _923 = 1.0 / _873;
    float _925 = _911 * _919;
    float _927 = -_911;
    float _929 = _927 + 1.0;
    float _931 = 1.0 / _877;
    float _933 = _899 * _891;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = fma(_933, _851, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _941 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _943 = isnan(_847);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = _937 * _923;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _847 + _959;
    float _963 = _939 * _925;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _847 + _965;
    float _969 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _971 = fma(_953, _961, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _973 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[115].x, _963);
    float _975 = _957 * _931;
    float _977 = -_951;
    float _979 = _977 + 1.0;
    float _981 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = fma(_971, _915, _973);
    float _985 = fma(_975, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _987 = _869 * _979;
    float _989 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = fma(_985, _987, _983);
    float _995 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[118].x, _993);
    float _997 = _995 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _981;
    out.m_62.y = _989;
    out.m_62.z = _991;
    out.m_62.w = _997;
    bool _999 = !_921;
    float _1017;
    if (!_999)
    {
        float _1001 = in.m_60.x;
        float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1005 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _1009 = _1007 * _1003;
        float _1011 = floor(_1009);
        float _1013 = -_1011;
        float _1015 = _1009 + _1013;
        _1017 = _1015;
        _1019 = true;
    }
    else
    {
        float _1021 = float(_89);
        float _1023 = 1.0 / _1021;
        float _1025 = _123 * _1023;
        _1017 = _1025;
    }
    _1019 = false;
    float _1027 = _1017;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1031 = _1027 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1035 = _1027 + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1053 = 1.0 / _1039;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1059;
    float _1063 = 1.0 / _1043;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1067 = _1027 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1073;
    bool _1077 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1079 = isnan(_1027);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1085);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1097 = 1.0 / _1047;
    float _1099 = _1067 * _1053;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1103 = _1027 + _1101;
    bool _1105 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1107 = isnan(_1027);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1119 = _1027 + _1117;
    float _1121 = fma(_1061, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1123 = fma(_1071, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1125 = fma(_1075, _1099, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1127 = 1.0 / _1051;
    float _1129 = _1031 * _1063;
    bool _1131 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1133 = isnan(_1027);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1147 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1149 = isnan(_1027);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    bool _1159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1161 = 1.0 / _1057;
    float _1163 = _1035 * _1097;
    float _1165 = -_1141;
    float _1167 = _1165 + 1.0;
    float _1169 = _1103 * _1127;
    float _1171 = _1157 * _1167;
    float _1173 = -_1157;
    float _1175 = _1173 + 1.0;
    float _1177 = -_1115;
    float _1179 = _1177 + 1.0;
    float _1181 = _1115 * _1175;
    bool _1183 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1185 = isnan(_1027);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = _1119 * _1161;
    bool _1197 = _1027 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1199 = isnan(_1027);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = -_1193;
    float _1211 = _1209 + 1.0;
    float _1213 = _1207 * _1179;
    float _1215 = -_1207;
    float _1217 = _1215 + 1.0;
    float _1219 = _1087 * _1211;
    float _1221 = fma(_1095, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1223 = _1193 * _1217;
    float _1225 = fma(_1091, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1227 = _1121 * _1219;
    float _1229 = -_1087;
    float _1231 = _1229 + 1.0;
    float _1233 = _1123 * _1219;
    float _1235 = _1125 * _1219;
    float _1237 = fma(_1145, _1129, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1243;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1227);
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1233);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1235);
    float _1253 = fma(_1241, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1259;
    float _1263 = fma(_1245, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1265 = fma(_1221, _1223, _1247);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1275 = fma(_1257, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1277 = fma(_1225, _1223, _1249);
    float _1279 = fma(_1237, _1223, _1251);
    float _1281 = fma(_1261, _1163, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1283 = fma(_1263, _1213, _1265);
    float _1285 = fma(_1269, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1287 = fma(_1273, _1169, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1289 = fma(_1281, _1213, _1279);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1291;
    float _1295 = fma(_1253, _1213, _1277);
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1301;
    float _1305 = fma(_1275, _1181, _1283);
    float _1307 = fma(_1293, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1309 = fma(_1299, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1311 = fma(_1285, _1181, _1295);
    float _1313 = fma(_1303, _1195, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1315 = fma(_1287, _1181, _1289);
    float _1317 = fma(_1307, _1171, _1305);
    float _1319 = fma(_1309, _1171, _1311);
    float _1321 = fma(_1313, _1171, _1315);
    float _1323 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1317);
    float _1325 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1319);
    float _1327 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1321);
    bool _1329 = !_1159;
    float _1347;
    if (!_1329)
    {
        float _1331 = in.m_60.x;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1335 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _1339 = _1337 * _1333;
        float _1341 = floor(_1339);
        float _1343 = -_1341;
        float _1345 = _1339 + _1343;
        _1347 = _1345;
        _1349 = true;
    }
    else
    {
        float _1351 = float(_89);
        float _1353 = 1.0 / _1351;
        float _1355 = _123 * _1353;
        _1347 = _1355;
    }
    _1349 = false;
    float _1357 = _1347;
    float _1359 = in.m_60.x;
    float _1361 = in.m_60.y;
    float _1363 = in.m_60.z;
    float _1365 = in.m_60.w;
    float _1367 = _403 * _203;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1373;
    float _1377 = fma(_411, _201, _1367);
    float _1379 = 1.0 / _1371;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1389 = _1387 != 0;
    float _1391 = _403 * _189;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1395 = _1393 != 0;
    float _1397 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    float _1403 = fma(_411, _187, _1391);
    float _1405 = fma(_433, _205, _1377);
    float _1407 = in.m_54.w;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1417 = _1375 * _1379;
    float _1419 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1421 = in.m_56.w;
    bool _1423 = _1359 > 0.5;
    float _1425 = fma(_1419, -2.0, _1385);
    bool _1427 = _1365 > 0.5;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1433 = -_217;
    int _1435 = _1423 ? as_type<int>(_1433) : as_type<int>(_217);
    float _1437 = in.m_58.w;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1441 = _1439 != 0;
    float _1443 = _403 * _173;
    float _1445 = 1.0 / _1431;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1449 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1451 = fma(_411, _171, _1443);
    float _1453 = _1325 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1455 = -_1447;
    float _1457 = fma(_1449, 2.0, _1455);
    float _1459 = 1.0 / _1411;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1463 = fma(_433, _175, _1451);
    bool _1465 = !_1383;
    float _1467 = _1465 ? _217 : as_type<float>(_1435);
    float _1469 = -_123;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1457);
    bool _1473 = _1361 > 0.5;
    float _1475 = _1463 + _1407;
    float _1477 = _1431;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1441)
    {
        _1477 = _1363;
    }
    float _1481 = _1477;
    float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1485 = fma(_433, _191, _1403);
    float _1487 = _1467 + 0.5;
    float _1489 = _1481;
    if (!_1441)
    {
        _443 = _1361;
    }
    float _1491 = _443;
    float _1493 = _1405 + _1437;
    float _1495 = _1491;
    if (_1441)
    {
        _1495 = _1359;
    }
    float _1497 = _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1499;
    float _1503 = _1415 * _1459;
    float _1505 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1509 = _1501 * _1445;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1513 = _1357 + _1511;
    float _1515 = -_221;
    int _1517 = _1473 ? as_type<int>(_1515) : as_type<int>(_221);
    float _1519 = _1485 + _1421;
    bool _1521 = _1363 > 0.5;
    float _1523 = fma(_1417, _1513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_1441)
    {
        _1479 = _1363;
    }
    float _1525 = _1479;
    float _1527 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1531 = _1357 + _1529;
    bool _1533 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1535 = isnan(_1357);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1547 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1549 = isnan(_1357);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = fma(_1503, _1531, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1561 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1563 = isnan(_1357);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = -_1543;
    float _1575 = _1573 + 1.0;
    float _1577 = _1525;
    if (_1441)
    {
        _1577 = _1361;
    }
    float _1579 = _1577;
    float _1581 = -_1557;
    float _1583 = _1581 + 1.0;
    if (_1441)
    {
        _1489 = _1361;
    }
    float _1585 = _1489;
    float _1587 = _1571 * _1575;
    bool _1589 = _1357 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1591 = isnan(_1357);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = _1543 * _1583;
    float _1603 = -_1571;
    float _1605 = _1603 + 1.0;
    float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1609 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1611 = _1599 * _1605;
    float _1613 = -_1599;
    float _1615 = _1613 + 1.0;
    float _1617 = fma(_1609, _1487, _1471);
    float _1619 = _1523 * _1611;
    bool _1621 = !_1389;
    float _1623 = _1621 ? _221 : as_type<float>(_1517);
    float _1625 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1425);
    float _1627 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1619);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1633 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1637 = _1623 + (-0.5);
    float _1639 = fma(_1559, _1587, _1629);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1643 = _1357 + _1641;
    float _1645 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1649 = _1519 + _1647;
    float _1651 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1635);
    float _1653 = -_1627;
    float _1655 = -_1625;
    float _1657 = fma(_1653, _1637, _1655);
    float _1659 = fma(_1509, _1643, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1663 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1665 = -_217;
    int _1667 = _1521 ? as_type<int>(_1665) : as_type<int>(_217);
    float _1669 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1505);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1673 = _1475 + _1671;
    float _1675 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1677 = -_1661;
    float _1679 = fma(_1663, 2.0, _1677);
    bool _1681 = !_1395;
    float _1683 = _1681 ? _217 : as_type<float>(_1667);
    float _1685 = fma(_1659, _1601, _1639);
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1493 + _1687;
    float _1691 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1675);
    float _1693 = -_1669;
    float _1695 = _1693 + 1.0;
    float _1697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1699 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1631);
    float _1701 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1685);
    float _1703 = -_221;
    int _1705 = _1427 ? as_type<int>(_1703) : as_type<int>(_221);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1691);
    float _1709 = -_1695;
    float _1711 = fma(_1467, _1709, _1617);
    float _1713 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1651);
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1717 = _1649 * _1649;
    bool _1719 = !_1401;
    float _1721 = _1719 ? _221 : as_type<float>(_1705);
    float _1723 = -_1713;
    float _1725 = _1723 + 1.0;
    float _1727 = fma(_1633, -2.0, _1715);
    bool _1729 = _1707 >= 0.0;
    float _1731 = fma(_1673, _1673, _1717);
    float _1733 = _1721 + (-0.5);
    float _1735 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1727);
    float _1737 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1527);
    float _1739 = fma(_1689, _1689, _1731);
    float _1741 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1743 = -_1645;
    float _1745 = -_1735;
    float _1747 = fma(_1743, _1733, _1745);
    float _1749 = _1683 + 0.5;
    float _1751 = -_123;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1679);
    float _1755 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1699);
    float _1757 = rsqrt(_1739);
    float _1759 = -_1737;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1721, _1725, _1747);
    float _1765 = fma(_1741, _1749, _1753);
    float _1767 = -_1755;
    float _1769 = _1767 + 1.0;
    float _1771 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1773 = _1731;
    if (_1729)
    {
        _1773 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1775 = _1773;
    float _1777 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1779 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = fma(_1623, _1761, _1657);
    float _1783 = -_1769;
    float _1785 = fma(_1683, _1783, _1765);
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1791 = as_type<int>(_1775);
    float _1793 = _1785;
    if (_1729)
    {
        float _1795 = _1775 * 5.0;
        _1791 = as_type<int>(_1795);
    }
    int _1797 = _1791;
    out.m_64.x = _1711;
    out.m_64.y = _1781;
    out.m_64.z = _1785;
    out.m_64.w = _1763;
    float _1799 = _1649 * _1757;
    float _1801 = _1673 * _1757;
    out.m_66.x = _1777;
    out.m_66.y = _1779;
    out.m_66.z = _1787;
    out.m_66.w = _1789;
    if (_1729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5633 = as_type<float>(_1797);
        out.gl_Position.z = _5633;
    }
    if (_1729)
    {
        out.m_45.x = 0.0;
    }
    if (_1729)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1803 = -_1799;
    float _1805 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1519);
    float _1807 = _1689 * _1757;
    float _1809 = -_1801;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1475);
    float _1813 = -_1799;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1819 = _1805 + _1817;
    float _1821 = -_1807;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = _1811 + _1825;
    float _1829 = -_1801;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1673);
    float _1833 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1837 = _1823 + _1835;
    float _1839 = _1815 * _1815;
    float _1841 = -_1807;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1689);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1833);
    float _1847 = fma(_1831, _1831, _1839);
    float _1849 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1845);
    float _1851 = fma(_1843, _1843, _1847);
    bool _1853 = _1849 >= 0.0;
    float _1855 = sqrt(_1851);
    float _1857 = _1823;
    if (_1853)
    {
        _1793 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1859 = _1793;
    int _1861 = as_type<int>(_1859);
    if (_1853)
    {
        out.m_45.x = 0.0;
    }
    float _1863 = _1757 * _1855;
    if (_1853)
    {
        float _1865 = _1859 * 5.0;
        _1861 = as_type<int>(_1865);
    }
    int _1867 = _1861;
    if (_1853)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5765 = as_type<float>(_1867);
        out.gl_Position.z = _5765;
    }
    if (_1853)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1869 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1871 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _1877 = _1863 * _1869;
    float _1879 = _1863 * _1871;
    float _1881 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1883 = _1881 * 0.5;
    float _1885 = _1873 * _1877;
    float _1887 = _1875 * _1879;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1891 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1889);
    float _1897 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1891);
    float _1899 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1893);
    float _1901 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1895);
    float _1903 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1897);
    float _1905 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1899);
    float _1907 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1909 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1911 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1913 = _1493 + _1907;
    float _1915 = _1475 + _1909;
    float _1917 = _1519 + _1911;
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1921 = _1913 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1925 = _1915 + _1923;
    float _1927 = _1921 * _1921;
    float _1929 = fma(_1925, _1925, _1927);
    float _1931 = sqrt(_1929);
    bool _1933 = _1931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1935 = _1905;
    float _1937 = _1927;
    float _1939 = _1911;
    float _1941 = _1913;
    float _1943 = _1917;
    if (!_1933)
    {
        _1935 = _1915;
    }
    float _1945 = _1935;
    float _1947 = _1945;
    if (!_1933)
    {
        _1937 = _1913;
    }
    float _1949 = _1937;
    float _1951 = _1949;
    if (!_1933)
    {
        _1939 = _1917;
    }
    float _1953 = _1939;
    bool _1955 = !_1933;
    float _1957 = _1953;
    if (!_1955)
    {
        float _1959 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1963 = _1931 + _1961;
        float _1965 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1967 = rsqrt(_1929);
        float _1969 = _1963 * _1959;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1971 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        float _1977 = _1971 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        float _1981 = _1975 + (-1.0);
        float _1983 = fma(_1979, _1965, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1985 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1987 = _1967 * _1983;
        float _1989 = fma(_1917, _1975, _1985);
        float _1991 = fma(_1925, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1993 = fma(_1921, _1987, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1957 = _1989;
        _1947 = _1991;
        _1951 = _1993;
    }
    float _1995 = _1957;
    float _1997 = _1947;
    float _1999 = _1951;
    float _2001 = -_1519;
    float _2003 = _2001 + _1995;
    float _2005 = -_1475;
    float _2007 = _2005 + _1997;
    float _2009 = -_1493;
    float _2011 = _2009 + _1999;
    float _2013 = _2003 * _2003;
    float _2015 = fma(_2007, _2007, _2013);
    float _2017 = fma(_2011, _2011, _2015);
    float _2019 = sqrt(_2017);
    bool _2021 = _2019 > 0.0;
    bool _2023 = !_2021;
    float _2025 = _2019;
    float _2027 = _1997;
    float _2029 = _1995;
    float _2031 = _1999;
    if (!_2023)
    {
        bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2035 = _1929;
        if (_2033)
        {
            float _2037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2035 = _2037;
        }
        float _2039 = _2035;
        if (_2033)
        {
            _1941 = _435;
        }
        float _2041 = _1941;
        float _2043 = _2041;
        if (_2033)
        {
            _2025 = _437;
        }
        float _2045 = _2025;
        float _2047 = _2045;
        if (_2033)
        {
            float _2049 = _435 * _2039;
            _1943 = _2049;
        }
        float _2051 = _1943;
        float _2053 = _2051;
        if (_2033)
        {
            float _2055 = _437 * _2039;
            _445 = _2055;
        }
        float _2057 = _445;
        float _2059 = _2057;
        float _2061 = _2057;
        if (_2033)
        {
            float _2063 = _439 * _2039;
            _447 = _2063;
        }
        float _2065 = _447;
        float _2067 = _2065;
        if (!_2033)
        {
            float _2069 = _123 + 1.0;
            float _2071 = _2069;
            if (!_157)
            {
                float _2073 = _2069 * _2069;
                float _2075 = _2073 * 0.5;
                _2059 = _2075;
            }
            float _2077 = _2059;
            float _2079 = _2077;
            if (!_157)
            {
                float _2081 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2079 = _2081;
            }
            float _2083 = _2079;
            bool _2085 = !_157;
            float _2087 = _2083;
            if (!_2085)
            {
                float _2089 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2091 = log2(_2089);
                float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2095 = _2093 + 1.0;
                float _2097 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2099 = _2091 * _2069;
                float _2101 = 1.0 / _2095;
                float _2103 = _2097 * 0.693147182464599609375;
                float _2105 = exp2(_2099);
                float _2107 = 1.0 / _2103;
                float _2109 = _2105 + (-1.0);
                float _2111 = -_2109;
                float _2113 = fma(_2111, _2107, _2069);
                float _2115 = _2113 * _2101;
                float _2117 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2087 = _2117;
            }
            float _2119 = _2087;
            float _2121 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2123 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2125 = !_157;
            if (!_2125)
            {
                float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2129 = log2(_2127);
                float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2133 = _2131 + 1.0;
                float _2135 = 1.0 / _2133;
                float _2137 = _2129 * _2069;
                float _2139 = exp2(_2137);
                float _2141 = -_2139;
                float _2143 = _2141 + 1.0;
                float _2145 = _2143 * _2135;
                _2071 = _2145;
            }
            float _2147 = _2071;
            float _2149 = fma(_2147, _161, _2123);
            float _2151 = fma(_2147, _159, _2121);
            float _2153 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2155 = -_397;
            float _2157 = _2155 + _2149;
            float _2159 = -_401;
            float _2161 = _2159 + _2151;
            float _2163 = fma(_2147, _163, _2153);
            float _2165 = _2157 * _173;
            float _2167 = _2157 * _189;
            float _2169 = _2157 * _203;
            float _2171 = -_409;
            float _2173 = _2171 + _2163;
            float _2175 = fma(_2161, _171, _2165);
            float _2177 = fma(_2161, _187, _2167);
            float _2179 = fma(_2161, _201, _2169);
            float _2181 = fma(_2173, _175, _2175);
            float _2183 = fma(_2173, _191, _2177);
            float _2185 = fma(_2173, _205, _2179);
            _2047 = _2183;
            _2043 = _2181;
            _449 = _2185;
            _2053 = _2181;
            _2061 = _2183;
            _2067 = _2185;
        }
        float _2187 = _2047;
        float _2189 = _2043;
        float _2191 = _449;
        float _2193 = _2053;
        float _2195 = _2061;
        float _2197 = _2067;
        float _2199 = _2187 * _2187;
        float _2201 = rsqrt(_2017);
        float _2203 = fma(_2189, _2189, _2199);
        float _2205 = fma(_2191, _2191, _2203);
        float _2207 = sqrt(_2205);
        float _2209 = _2007 * _2201;
        float _2211 = _2003 * _2201;
        float _2213 = _2011 * _2201;
        bool _2215 = _2207 > 0.0;
        bool _2217 = !_2215;
        if (!_2217)
        {
            float _2219 = rsqrt(_2205);
            float _2221 = _2219 * _2187;
            float _2223 = _2219 * _2189;
            float _2225 = _2219 * _2191;
            float _2227 = _2211 * _2221;
            float _2229 = fma(_2209, _2223, _2227);
            float _2231 = fma(_2213, _2225, _2229);
            float _2233 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2235 = fma(_2193, _2233, _1997);
            float _2237 = fma(_2195, _2233, _1995);
            float _2239 = fma(_2197, _2233, _1999);
            _2027 = _2235;
            _2029 = _2237;
            _2031 = _2239;
        }
    }
    float _2241 = _2027;
    float _2243 = _2029;
    float _2245 = _2031;
    bool _2247 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2255 = _2251 || _2253;
    float _2257 = -_1801;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2241);
    float _2261 = -_1799;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2243);
    float _2265 = -_1807;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2245);
    float _2269 = _2263;
    float _2271 = _2259;
    float _2273 = _2267;
    float _2275 = _2241;
    if (!_2255)
    {
        float _2277 = _1819 * _1819;
        float _2279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2281 = -_1493;
        float _2283 = _2281 + _2245;
        float _2285 = -_1475;
        float _2287 = _2285 + _2241;
        float _2289 = fma(_1827, _1827, _2277);
        float _2291 = -_1519;
        float _2293 = _2291 + _2243;
        float _2295 = fma(_1837, _1837, _2289);
        float _2297 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2299 = sqrt(_2295);
        float _2301 = 1.0 / _1863;
        float _2303 = precise::min(_2299, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2305 = _2303 * _2279;
        float _2307 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2309 = _2305 * _2301;
        float _2311 = _2307 * _2309;
        float _2313 = _2283 * _2309;
        float _2315 = fma(_2287, _2311, _1811);
        float _2317 = fma(_2293, _2311, _1805);
        float _2319 = fma(_2307, _2313, _1823);
        _2269 = _2317;
        _2271 = _2315;
        _2273 = _2319;
    }
    float _2321 = _2269;
    float _2323 = _2271;
    float _2325 = _2273;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2329 = _2321 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2333 = _2323 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = fma(_2337, _2337, _2341);
    float _2345 = rsqrt(_2343);
    float _2347 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2349 = _2333 * _2347;
    float _2351 = _2337 * _2347;
    float _2353 = _2349 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 + _2355;
    float _2359 = sqrt(_2357);
    bool _2361 = _2359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = _2359 + _2363;
    float _2367 = _2337;
    float _2369 = _2357;
    float _2371 = _2365;
    float _2373 = _2349;
    if (_2361)
    {
        float _2375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2375;
    }
    float _2377 = _2367;
    if (_2361)
    {
        float _2379 = rsqrt(_2357);
        _2369 = _2379;
    }
    float _2381 = _2369;
    float _2383 = _2381;
    if (_2361)
    {
        float _2385 = _2365 * _2377;
        _2371 = _2385;
    }
    float _2387 = _2371;
    if (_2361)
    {
        float _2389 = _2387 * 0.15915493667125701904296875;
        _195 = _2389;
    }
    float _2391 = _195;
    float _2393 = _2345;
    if (_2361)
    {
        float _2395 = _2391 * 6.283185482025146484375;
        float _2397 = sin(_2395);
        _2393 = _2397;
    }
    float _2399 = _2393;
    float _2401 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2403 = precise::max(0.0, _2401);
    float _2405 = _171;
    float _2407 = _2403;
    float _2409 = _2401;
    if (_2361)
    {
        float _2411 = _2391 * 6.283185482025146484375;
        float _2413 = cos(_2411);
        _2405 = _2413;
    }
    float _2415 = _2405;
    float _2417 = -_2347;
    float _2419 = -_2403;
    float _2421 = fma(_2329, _2417, _2419);
    if (_2361)
    {
        float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2407 = _2423;
    }
    float _2425 = _2407;
    float _2427 = sqrt(_2343);
    float _2429 = _2399;
    float _2431 = _2425;
    if (_2361)
    {
        float _2433 = fma(_2399, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2429 = _2433;
    }
    float _2435 = _2429;
    float _2437 = _2435;
    if (!_2361)
    {
        _2431 = _2351;
    }
    float _2439 = _2431;
    float _2441 = _2439;
    if (_2361)
    {
        float _2443 = _2415 + (-1.0);
        _2409 = _2443;
    }
    float _2445 = _2409;
    float _2447 = _2445;
    if (_2361)
    {
        float _2449 = _2381 * _2435;
        _2275 = _2449;
    }
    float _2451 = _2275;
    if (!_2361)
    {
        _2437 = _2421;
    }
    float _2453 = _2437;
    float _2455 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2457 = _2453;
    if (_2361)
    {
        float _2459 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _231 = _2459;
    }
    float _2461 = _231;
    if (_2361)
    {
        float _2463 = _2349 * _2451;
        _2373 = _2463;
    }
    float _2465 = _2373;
    if (!_2361)
    {
        _2383 = _2353;
    }
    float _2467 = _2383;
    float _2469 = _2467;
    if (_2361)
    {
        float _2471 = _2351 * _2451;
        _2441 = _2471;
    }
    float _2473 = _2441;
    if (_2361)
    {
        float _2475 = fma(_2421, _2415, _2461);
        _2457 = _2475;
    }
    float _2477 = _2457;
    if (_2361)
    {
        float _2479 = _2465 * _2465;
        _2469 = _2479;
    }
    float _2481 = _2469;
    if (!_2361)
    {
        _2447 = _2355;
    }
    float _2483 = _2447;
    float _2485 = _2483;
    if (_2361)
    {
        float _2487 = _2473 * _2473;
        _2485 = _2487;
    }
    float _2489 = _2485;
    float _2491 = fma(_2477, _2477, _2481);
    float _2493 = _2491 + _2489;
    float _2495 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2499 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2497);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = rsqrt(_2493);
    float _2505 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2495);
    float _2507 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2509 = -_2501;
    float _2511 = _2509 + 1.0;
    float _2513 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2515 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2517 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2507);
    float _2519 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2525 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2517);
    float _2527 = abs(_2511);
    float _2529 = log2(_2527);
    float _2531 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2521);
    float _2533 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2535 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2537 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2539 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2541 = _2503 * _2465;
    float _2543 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2545 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2533);
    float _2547 = -_2537;
    float _2549 = fma(_2547, _2455, 1.0);
    float _2551 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2553 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2543);
    float _2555 = _2503 * _2477;
    float _2557 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2559 = _2503 * _2473;
    float _2561 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2553);
    float _2563 = -_2551;
    float _2565 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = log2(_2549);
    float _2571 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2561);
    float _2573 = -_2559;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2577 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2579 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2581 = fma(_2575, -0.5, 0.5);
    float _2583 = fma(_2575, 0.5, 0.5);
    float _2585 = exp2(_2567);
    float _2587 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2577);
    float _2589 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2579);
    float _2591 = fma(_2583, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2593 = _2555 + 1.0;
    float _2595 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2597 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2599 = fma(_2583, _2591, -0.212114393711090087890625);
    float _2601 = 1.0 / _2571;
    float _2603 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2595);
    float _2605 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2597);
    float _2607 = fma(_2583, _2599, 1.570728778839111328125);
    float _2609 = _2569 * 0.693147182464599609375;
    float _2611 = sqrt(_2581);
    float _2613 = -_2555;
    float _2615 = fma(_2585, _2593, _2613);
    float _2617 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2619 = fma(_2615, 0.5, 0.5);
    float _2621 = _2603 * _2601;
    float _2623 = _2605 * _2601;
    float _2625 = fma(_2621, 0.5, 0.5);
    float _2627 = fma(_2623, -0.5, 0.5);
    float _2629 = _2611 * 0.636619746685028076171875;
    float3 _6984 = float3(_2625, _2627, _2617);
    float _2631 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6984, float3(0.0), isnan(_6984)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6984, float3(0.0), isnan(_6984)), level(0.0)).x;
    float _2633 = -_2607;
    float _2635 = fma(_2629, _2633, 1.0);
    float3 _7000 = float3(_2625, _2627, _2617);
    float4 _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7000, float3(0.0), isnan(_7000)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7000, float3(0.0), isnan(_7000)), level(0.0)).xyzw;
    float _2640 = _2638.x;
    float _2642 = _2638.y;
    float _2644 = _2638.z;
    float _2646 = _2638.w;
    float2 _7017 = float2(_2635, _2619);
    float3 _2650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7017, float2(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7017, float2(0.0), isnan(_7017)), level(0.0)).xyz;
    float _2652 = _2650.x;
    float _2654 = _2650.y;
    float _2656 = _2650.z;
    float _2658 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2660 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2664 = isnan(0.5);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2670 = _2666 || _2668;
    float _2672 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2658);
    float _2674 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2660);
    float _2676 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2672);
    float _2678 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2674);
    float _2680 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2682 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2684 = _2676;
    float _2686 = _2617;
    float _2688 = _2680;
    float _2690 = _2535;
    if (!_2670)
    {
        _233 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2692 = _233;
    float _2694 = 1.0 / _2680;
    float _2696 = _2682 + _2680;
    float _2698 = _2692;
    if (!_2670)
    {
        _2684 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2700 = _2684;
    float _2702 = _2700;
    if (!_2670)
    {
        float _2704 = -_2692;
        float _2706 = _2704 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2686 = _2706;
    }
    float _2708 = _2686;
    float _2710 = _2708;
    if (!_2670)
    {
        float _2712 = -_2700;
        float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2688 = _2714;
    }
    float _2716 = _2688;
    float _2718 = _2716;
    if (!_2670)
    {
        float _2720 = 1.0 / _2708;
        _2710 = _2720;
    }
    float _2722 = _2710;
    float _2724 = _2696 * _2694;
    float _2726 = _2724 * 0.5;
    float _2728 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2670)
    {
        float _2730 = 1.0 / _2716;
        _2718 = _2730;
    }
    float _2732 = _2718;
    float _2734 = _2535 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2738 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2736);
    if (_2670)
    {
        _2690 = 1.0;
    }
    float _2740 = _2690;
    float _2742 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2734);
    float _2744 = 1.0 / _2738;
    float _2746 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2742);
    float _2748 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2746);
    float _2750 = exp2(_2728);
    float _2752 = _2748 + _2571;
    float _2754 = _2752 * 0.5;
    float _2756 = _2740;
    if (!_2670)
    {
        float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2760 = -_2692;
        float _2762 = fma(_2744, _2758, _2760);
        _2698 = _2762;
    }
    float _2764 = _2698;
    float _2766 = _2764;
    if (!_2670)
    {
        float _2768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2770 = -_2700;
        float _2772 = fma(_2744, _2768, _2770);
        _2702 = _2772;
    }
    float _2774 = _2702;
    out.m_68.z = _2754;
    out.m_68.w = _2571;
    if (!_2670)
    {
        float _2776 = _2764 * _2722;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        _1857 = _2778;
    }
    float _2780 = _1857;
    if (_2670)
    {
        _2766 = 1.0;
    }
    float _2782 = _2766;
    float _2784 = _2782;
    if (!_2670)
    {
        float _2786 = _2774 * _2732;
        float _2788 = precise::clamp(_2786, 0.0, 1.0);
        _2784 = _2788;
    }
    float _2790 = _2784;
    if (!_2670)
    {
        float _2792 = -_2780;
        float _2794 = _2792 + 1.0;
        _2756 = _2794;
    }
    float _2796 = _2756;
    float _2798 = -_2750;
    float _2800 = _2798 + 1.0;
    bool _2802 = _2790 > 0.0;
    bool _2804 = isnan(_2790);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan(0.0);
    bool _2810 = _2806 || _2808;
    float _2812 = _2790 * _2796;
    bool _2814 = _2796 <= 0.0;
    bool _2816 = !_2810;
    bool _2818 = _2814 || _2816;
    float _2820 = _2812 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2822 = _2800 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2824 = _2820 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2603;
    out.gl_Position.y = _2605;
    out.gl_Position.z = _2748;
    out.gl_Position.w = _2571;
    out.m_45.x = _2824;
    float _2826 = _2822 * _2631;
    float _2828 = -_2822;
    float _2830 = _2828 + 1.0;
    float _2832 = _2646 * _2826;
    float _2834 = _2656 * _2826;
    float _2836 = fma(_2652, _2832, _2640);
    float _2838 = fma(_2654, _2832, _2642);
    float _2840 = _2646 * _2830;
    float _2842 = fma(_2646, _2834, _2644);
    out.m_70.x = _2836;
    out.m_70.y = _2838;
    out.m_70.z = _2842;
    out.m_70.w = _2840;
    if (!_2818)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2844 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2844;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

