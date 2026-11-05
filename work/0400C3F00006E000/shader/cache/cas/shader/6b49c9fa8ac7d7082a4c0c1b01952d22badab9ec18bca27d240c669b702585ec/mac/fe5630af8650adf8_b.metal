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
    float4 m_68 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_64 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2028 = false;
    bool _449 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2312 = as_type<float>(_121);
        out.gl_Position.z = _2312;
    }
    if (!_111)
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
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_161);
        out.gl_Position.z = _2381;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _207;
    if (!_189)
    {
        float _191 = in.m_55.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_107);
        float _213 = 1.0 / _211;
        float _215 = _139 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = 1.0 / _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _237;
    float _255 = _225 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _217 + _257;
    float _261 = 1.0 / _245;
    float _263 = _221 * _251;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_275;
    float _279 = _277 + 1.0;
    float _281 = _229 * _253;
    bool _283 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_217);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    bool _295 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_217);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = _293 * _279;
    bool _309 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_217);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _259 * _261;
    float _323 = -_293;
    float _325 = _323 + 1.0;
    bool _327 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_217);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _305 * _325;
    float _349 = -_305;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_341, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = _319 * _351;
    float _365 = -_319;
    float _367 = _365 + 1.0;
    float _369 = fma(_355, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -_337;
    float _373 = _371 + 1.0;
    float _375 = fma(_345, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = _337 * _367;
    float _379 = fma(_361, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = _357 * _377;
    float _391 = _369 * _377;
    float _393 = fma(_383, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _399 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _409 = fma(_375, _363, _397);
    float _411 = fma(_379, _363, _399);
    float _413 = fma(_403, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _415 = fma(_407, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _417 = fma(_393, _347, _409);
    float _419 = fma(_395, _347, _411);
    float _421 = fma(_413, _307, _417);
    float _423 = fma(_415, _307, _419);
    float _425 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[147].x, _421);
    float _427 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[147].y, _423);
    bool _429 = !_249;
    float _447;
    if (!_429)
    {
        float _431 = in.m_55.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        float _451 = float(_107);
        float _453 = 1.0 / _451;
        float _455 = _139 * _453;
        _447 = _455;
    }
    _449 = false;
    float _457 = _447;
    float _459 = in.m_55.x;
    float _461 = in.m_55.y;
    float _463 = in.m_55.z;
    float _465 = in.m_55.w;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _473 = _471 != 0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _481 = _479 != 0;
    bool _483 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _485 = isnan(1.0);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _491 = _487 || _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    bool _497 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = _469 * _139;
    float _509 = 1.0 / _495;
    float _511 = _463 * 2.0;
    float _513 = _459 * 2.0;
    float _515 = _461 * 2.0;
    float _517 = exp2(_507);
    float _519 = floor(_511);
    float _521 = _461 + _459;
    float _523 = _521 + (-1.0);
    float _525 = floor(_513);
    float _527 = -_517;
    float _529 = _527 + 1.0;
    float _531 = _505 ? _529 : 0.0;
    bool _533 = _519 > 0.0;
    float _535 = floor(_515);
    bool _537 = _519 >= 0.0;
    bool _539 = isnan(_519);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    float _547 = _461 + _463;
    if (_491)
    {
        float _549 = _531 * _509;
        _143 = _549;
    }
    float _551 = _143;
    bool _553 = !_481;
    int _555 = _553 ? 0 : 1;
    float _557 = _547 + (-1.0);
    int _559 = _545 ? 0 : 1;
    bool _561 = _525 > 0.0;
    float _563 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _565 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _567 = ~_559;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    bool _573 = !_473;
    int _575 = _573 ? 0 : 1;
    bool _577 = _525 >= 0.0;
    bool _579 = isnan(_525);
    bool _581 = _577 || _579;
    bool _583 = isnan(0.0);
    bool _585 = _581 || _583;
    int _587 = _571;
    if (!_533)
    {
        int _589 = ~_559;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = in.m_57.x;
    float _597 = in.m_57.y;
    float _599 = in.m_57.z;
    int _601 = abs(_575);
    int _603 = _585 ? 0 : 1;
    bool _605 = !_477;
    int _607 = _605 ? 0 : 1;
    float _609 = float(_601);
    float _611 = float(_593);
    bool _613 = _535 > 0.0;
    int _615 = ~_603;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = _609 * _611;
    int _623 = abs(_607);
    float _625 = _459 + (-0.5);
    int _627 = _619;
    if (!_561)
    {
        int _629 = ~_603;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = _621 * (-2.0);
    bool _637 = _535 >= 0.0;
    bool _639 = isnan(_535);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = float(_623);
    float _649 = float(_633);
    float _651 = fma(_635, _595, _595);
    int _653 = _645 ? 0 : 1;
    float _655 = fma(_565, _635, _565);
    int _657 = abs(_555);
    float _659 = _647 * _649;
    int _661 = ~_653;
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    float _667 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _651);
    int _669 = _665;
    if (!_613)
    {
        int _671 = ~_653;
        int _673 = _671 + 1;
        _669 = _673;
    }
    int _675 = _669;
    float _677 = _659 * (-2.0);
    float _679 = _461 + (-0.5);
    float _681 = float(_657);
    float _683 = fma(_655, _551, _667);
    float _685 = float(_675);
    float _687 = fma(_677, _597, _597);
    float _689 = fma(_563, _677, _563);
    float _691 = as_type<float>(int(gl_VertexIndex));
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].y, _687);
    float _695 = _463 + _459;
    float _697 = _681 * _685;
    float _699 = _683 * 0.15915493667125701904296875;
    float _701 = in.m_62.x;
    float _703 = in.m_62.y;
    float _705 = fma(_689, _551, _693);
    float _707 = _695 + (-1.0);
    float _709 = _697 * (-2.0);
    float _711 = _699 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _705 * 0.15915493667125701904296875;
    float _717 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _719 = fma(_709, _599, _599);
    float _721 = _463 + (-0.5);
    float _723 = fma(_717, _709, _717);
    float _725 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].z, _719);
    float _727 = _715 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = fma(_723, _551, _725);
    int _733 = as_type<int>(_691) & 1;
    bool _735 = _733 != 0;
    int _737 = as_type<int>(_691) & 2;
    bool _739 = _737 != 0;
    float _741 = _731 * 0.15915493667125701904296875;
    float _743 = _715 * 6.283185482025146484375;
    float _745 = cos(_743);
    bool _747 = !_735;
    float _749 = _747 ? (-0.5) : 0.5;
    float _751 = _427 * _703;
    float _753 = _425 * _701;
    bool _755 = !_739;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = _751 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _761 = _699 * 6.283185482025146484375;
    float _763 = sin(_761);
    float _765 = in.m_46.x;
    float _767 = in.m_46.y;
    float _769 = in.m_46.z;
    float _771 = _753 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _749);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _757);
    float _777 = _713 * _729;
    float _779 = _771 * _773;
    float _781 = _741 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _759 * _775;
    float _787 = _713 * _745;
    float _789 = _741 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _763 * _729;
    float _795 = _763 * _745;
    float _797 = _713 * _783;
    float _799 = _763 * _783;
    float _801 = _745 * _783;
    float _803 = _729 * _783;
    float _805 = _797 * _785;
    float _807 = _799 * _785;
    float _809 = fma(_791, _787, _793);
    float _811 = -_777;
    float _813 = fma(_791, _795, _811);
    float _815 = -_795;
    float _817 = fma(_791, _777, _815);
    float _819 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _821 = -_785;
    float _823 = _791 * _821;
    float _825 = fma(_809, _779, _805);
    float _827 = fma(_791, _793, _787);
    float _829 = fma(_813, _779, _807);
    float _831 = fma(_801, _779, _823);
    float _833 = fma(_817, _819, _825);
    float _835 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _837 = fma(_827, _819, _829);
    float _839 = fma(_803, _819, _831);
    float _841 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _843 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _845 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _835);
    float _847 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _849 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _841);
    float _851 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _843);
    float _853 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].z, _845);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _847);
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _849);
    float _859 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].z, _851);
    float _861 = _853 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _869 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _873 = _861 + _865;
    float _875 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _877 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _869);
    float _879 = _867 + _871;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _883 = _873 + _881;
    float _885 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _875);
    float _887 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _879 + _889;
    float _893 = _883 * _883;
    float _895 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _885);
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _899 = fma(_891, _891, _893);
    float _901 = _895 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _903 = sqrt(_899);
    float _905 = _897 + _901;
    bool _907 = _903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = _765;
    float _911 = _769;
    float _913 = _901;
    if (!_907)
    {
        _909 = _879;
    }
    float _915 = _909;
    float _917 = _915;
    if (!_907)
    {
        _911 = _873;
    }
    float _919 = _911;
    float _921 = _919;
    if (!_907)
    {
        _913 = _905;
    }
    float _923 = _913;
    bool _925 = !_907;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _903 + _931;
        float _935 = rsqrt(_899);
        float _937 = _933 * _929;
        float _939 = _905 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _941 = _937 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 + (-1.0);
        float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = fma(_949, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _957 = fma(_905, _945, _953);
        float _959 = _935 * _955;
        float _961 = fma(_891, _959, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_883, _959, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _927 = _957;
        _917 = _961;
        _921 = _963;
    }
    float _965 = _927;
    float _967 = _917;
    float _969 = _921;
    float _971 = -_897;
    float _973 = _971 + _965;
    float _975 = -_867;
    float _977 = _975 + _967;
    float _979 = -_861;
    float _981 = _979 + _969;
    float _983 = _973 * _973;
    bool _985 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _987 = isnan(0.5);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    float _995 = fma(_977, _977, _983);
    float _997 = fma(_981, _981, _995);
    float _999 = sqrt(_997);
    bool _1001 = _999 > 0.0;
    bool _1003 = !_1001;
    float _1005 = _967;
    float _1007 = _965;
    float _1009 = _969;
    float _1011 = _977;
    if (!_1003)
    {
        float _1013 = _183 * _183;
        float _1015 = rsqrt(_997);
        float _1017 = fma(_185, _185, _1013);
        float _1019 = fma(_187, _187, _1017);
        float _1021 = sqrt(_1019);
        float _1023 = _977 * _1015;
        float _1025 = _973 * _1015;
        float _1027 = _981 * _1015;
        bool _1029 = _1021 > 0.0;
        bool _1031 = !_1029;
        _1011 = _1025;
        if (!_1031)
        {
            float _1033 = rsqrt(_1019);
            float _1035 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1037 = _183 * _1033;
            float _1039 = _185 * _1033;
            float _1041 = _1025 * _1037;
            float _1043 = _187 * _1033;
            float _1045 = fma(_1023, _1039, _1041);
            float _1047 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1049 = fma(_1027, _1043, _1045);
            float _1051 = _1049 * _1047;
            float _1053 = fma(_185, _1051, _967);
            float _1055 = fma(_183, _1051, _965);
            float _1057 = fma(_187, _1051, _969);
            _1005 = _1053;
            _1007 = _1055;
            _1009 = _1057;
            _1011 = _1045;
        }
    }
    float _1059 = _1005;
    float _1061 = _1007;
    float _1063 = _1009;
    float _1065 = _1011;
    float _1067 = _1061;
    float _1069 = _1059;
    float _1071 = _1063;
    if (!_993)
    {
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1075 = _897 + _1073;
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1079 = _867 + _1077;
        float _1081 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1083 = -_867;
        float _1085 = _1083 + _1059;
        float _1087 = _1075 * _1075;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1091 = _861 + _1089;
        float _1093 = -_897;
        float _1095 = _1093 + _1061;
        float _1097 = -_861;
        float _1099 = _1097 + _1063;
        float _1101 = fma(_1079, _1079, _1087);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1091, _1091, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1113 = _1111 * _1103;
        float _1115 = _1109 * _1113;
        float _1117 = fma(_1085, _1115, _867);
        float _1119 = fma(_1095, _1115, _897);
        float _1121 = fma(_1099, _1115, _861);
        _1067 = _1119;
        _1069 = _1117;
        _1071 = _1121;
    }
    float _1123 = _1067;
    float _1125 = _1069;
    float _1127 = _1071;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1131 = _1123 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1125 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1139 = _1127 + _1137;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1143 = _1131 * _1131;
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1141);
    float _1147 = fma(_1135, _1135, _1143);
    float _1149 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1145);
    float _1151 = fma(_1139, _1139, _1147);
    float _1153 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = rsqrt(_1151);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1135 * _1157;
    float _1161 = _1139 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 * _1161;
    float _1167 = _1163 + _1165;
    float _1169 = sqrt(_1167);
    bool _1171 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1169 + _1173;
    float _1177 = _1065;
    float _1179 = _1167;
    float _1181 = _1175;
    float _1183 = _1131;
    float _1185 = _1157;
    float _1187 = _1159;
    if (_1171)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1189;
    }
    float _1191 = _1177;
    if (_1171)
    {
        float _1193 = rsqrt(_1167);
        _1179 = _1193;
    }
    float _1195 = _1179;
    float _1197 = _1191;
    float _1199 = _1195;
    if (_1171)
    {
        float _1201 = _1175 * _1191;
        _1181 = _1201;
    }
    float _1203 = _1181;
    if (_1171)
    {
        float _1205 = _1203 * 0.15915493667125701904296875;
        _1197 = _1205;
    }
    float _1207 = _1197;
    float _1209 = _1155;
    float _1211 = _1207;
    if (_1171)
    {
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        _1209 = _1215;
    }
    float _1217 = _1209;
    float _1219 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1221 = precise::max(0.0, _1219);
    float _1223 = _1139;
    float _1225 = _1221;
    if (_1171)
    {
        float _1227 = _1207 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        _1223 = _1229;
    }
    float _1231 = _1223;
    float _1233 = -_1157;
    float _1235 = -_1221;
    float _1237 = fma(_1131, _1233, _1235);
    float _1239 = _1237;
    if (_1171)
    {
        float _1241 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1183 = _1241;
    }
    float _1243 = _1183;
    float _1245 = _1243;
    if (!_1171)
    {
        _1211 = _1159;
    }
    float _1247 = _1211;
    float _1249 = _1217;
    float _1251 = _1247;
    if (_1171)
    {
        float _1253 = fma(_1217, _1243, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = _1255;
    if (_1171)
    {
        float _1259 = _1231 + (-1.0);
        _1225 = _1259;
    }
    float _1261 = _1225;
    if (_1171)
    {
        float _1263 = _1195 * _1255;
        _1185 = _1263;
    }
    float _1265 = _1185;
    if (!_1171)
    {
        _1257 = _1161;
    }
    float _1267 = _1257;
    float _1269 = _1267;
    if (_1171)
    {
        float _1271 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1271;
    }
    float _1273 = _1245;
    if (_1171)
    {
        float _1275 = _1159 * _1265;
        _1251 = _1275;
    }
    float _1277 = _1251;
    float _1279 = sqrt(_1151);
    if (!_1171)
    {
        _1199 = _1163;
    }
    float _1281 = _1199;
    float _1283 = _1281;
    if (_1171)
    {
        float _1285 = fma(_1237, _1231, _1273);
        _1239 = _1285;
    }
    float _1287 = _1239;
    if (_1171)
    {
        float _1289 = _1161 * _1265;
        _1269 = _1289;
    }
    float _1291 = _1269;
    if (_1171)
    {
        float _1293 = _1277 * _1277;
        _1283 = _1293;
    }
    float _1295 = _1283;
    if (!_1171)
    {
        _1187 = _1165;
    }
    float _1297 = _1187;
    float _1299 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1301 = _1297;
    if (_1171)
    {
        float _1303 = _1291 * _1291;
        _1301 = _1303;
    }
    float _1305 = _1301;
    float _1307 = fma(_1287, _1287, _1295);
    float _1309 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1299);
    float _1311 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1313 = _1307 + _1305;
    float _1315 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1309);
    float _1317 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1311);
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1321 = fma(_1279, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1319);
    float _1323 = precise::clamp(_1321, 0.0, 1.0);
    float _1325 = rsqrt(_1313);
    float _1327 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = -_1323;
    float _1331 = _1329 + 1.0;
    float _1333 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1335 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    float _1337 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1339 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1333);
    float _1341 = abs(_1331);
    float _1343 = log2(_1341);
    float _1345 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1347 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1349 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1353 = fma(_861, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1355 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1325 * _1277;
    float _1359 = _1325 * _1287;
    float _1361 = floor(_1337);
    float _1363 = _1325 * _1291;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1369 = -_1347;
    float _1371 = fma(_1369, _1351, 1.0);
    float _1373 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1375 = -_1365;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1375);
    float _1379 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1367);
    float _1381 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1383 = floor(_1353);
    float _1385 = -_1363;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1377);
    float _1389 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1379);
    float _1391 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1373);
    float _1393 = fma(_1387, -0.5, 0.5);
    float _1395 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1397 = -_1361;
    float _1399 = _1337 + _1397;
    float _1401 = exp2(_1381);
    float _1403 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1405 = _1359 + 1.0;
    float _1407 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1391);
    float _1409 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1403);
    float _1411 = 1.0 / _1395;
    float _1413 = -_1383;
    float _1415 = _1353 + _1413;
    float _1417 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1419 = log2(_1371);
    float _1421 = sqrt(_1393);
    float _1423 = fma(_1387, 0.5, 0.5);
    float _1425 = -_1359;
    float _1427 = fma(_1401, _1405, _1425);
    float _1429 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1417);
    float _1431 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1407);
    float _1433 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _4370 = float2(_1399, _1415);
    float _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4370, float2(0.0), isnan(_4370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4370, float2(0.0), isnan(_4370)), level(0.0)).x;
    float _1437 = _1429 * _1411;
    float _1439 = _1419 * 0.693147182464599609375;
    float _1441 = fma(_1423, _1433, -0.212114393711090087890625);
    float _1443 = fma(_1427, 0.5, 0.5);
    float _1445 = fma(_1437, 0.5, 0.5);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1449 = fma(_1423, _1441, 1.570728778839111328125);
    float _1451 = _1431 * _1411;
    float _1453 = _1421 * 0.636619746685028076171875;
    float _1455 = fma(_1451, -0.5, 0.5);
    float _1457 = -_1449;
    float _1459 = fma(_1453, _1457, 1.0);
    float3 _4416 = float3(_1445, _1455, _1447);
    float _1461 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4416, float3(0.0), isnan(_4416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4416, float3(0.0), isnan(_4416)), level(0.0)).x;
    float3 _4427 = float3(_1445, _1455, _1447);
    float4 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).xyzw;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = _1464.w;
    float2 _4443 = float2(_1459, _1443);
    float3 _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4443, float2(0.0), isnan(_4443)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4443, float2(0.0), isnan(_4443)), level(0.0)).xyz;
    float _1478 = _1476.x;
    float _1480 = _1476.y;
    float _1482 = _1476.z;
    float _1484 = _897 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1486 = _897 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1488 = _459 > 0.5;
    float _1490 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1484);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1494 = _457 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1500 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1486);
    float _1502 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1490);
    float _1504 = 1.0 / _1498;
    float _1506 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1500);
    float _1508 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1510 = _461 > 0.5;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1512;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1518 = _465 > 0.5;
    float _1520 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1522 = 1.0 / _1508;
    float _1524 = _1516 + _1508;
    float _1526 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1520);
    out.m_64.x = _1125;
    out.m_64.y = _1123;
    out.m_64.z = _1127;
    bool _1528 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1530 = isnan(_457);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1542 = _1514 * _1504;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1546 = _1544 != 0;
    float _1548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1552 = _1550 != 0;
    float _1554 = fma(_1542, _1494, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1556 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1558 = isnan(_457);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1570 = _1568 != 0;
    float _1572 = _1524 * _1522;
    float _1574 = _1572 * 0.5;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1578 = _1576 != 0;
    float _1580 = -_1566;
    float _1582 = _1580 + 1.0;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1584);
    float _1588 = _1538 * _1582;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = -_1538;
    float _1594 = _1592 + 1.0;
    float _1596 = 1.0 / _1586;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1602 = _1554 * _1588;
    float _1604 = -_749;
    int _1606 = _1488 ? as_type<int>(_1604) : as_type<int>(_749);
    float _1608 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1610 = _463 > 0.5;
    float _1612 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1614 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1616 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1602);
    float _1618 = -_757;
    int _1620 = _1510 ? as_type<int>(_1618) : as_type<int>(_757);
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1624 = -_749;
    int _1626 = _1610 ? as_type<int>(_1624) : as_type<int>(_749);
    bool _1628 = !_1552;
    float _1630 = _1628 ? _757 : as_type<float>(_1620);
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1634 = _1596 * _1632;
    bool _1636 = !_1570;
    float _1638 = _1636 ? _749 : as_type<float>(_1626);
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1644 = -_1630;
    float _1646 = _1644 + 0.5;
    float _1648 = -_757;
    int _1650 = _1518 ? as_type<int>(_1648) : as_type<int>(_757);
    float _1652 = _1638 + 0.5;
    out.m_66.x = _1608;
    out.m_66.y = _1612;
    out.m_66.z = _1614;
    out.m_66.w = _1640;
    float _1654 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1656 = !_1546;
    float _1658 = _1656 ? _749 : as_type<float>(_1606);
    float _1660 = abs(_1634);
    float _1662 = log2(_1660);
    float _1664 = _1654 * _1548;
    bool _1666 = !_1578;
    float _1668 = _1666 ? _757 : as_type<float>(_1650);
    float _1670 = _1658 + 0.5;
    bool _1672 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1674 = isnan(_1279);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1680 = _1676 || _1678;
    float _1682 = -_1668;
    float _1684 = _1682 + 0.5;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1688 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1690 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1692 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1616);
    float _1694 = _1690 * _1622;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1698 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = exp2(_1698);
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1716 = _1688 * _1642;
    float _1718 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1720 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_68.x = _1706;
    out.m_68.y = _1712;
    out.m_68.z = _1708;
    out.m_68.w = _1702;
    float _1722 = _1714 * _1686;
    float _1724 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1726 = -_791;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1718);
    float _1730 = -_791;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1720);
    out.m_70.x = _1716;
    out.m_70.y = _1664;
    out.m_70.z = _1694;
    out.m_70.w = _1722;
    float _1734 = -_791;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1738 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1740 = _1634 <= 8000.0;
    bool _1742 = isnan(_1634);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(8000.0);
    bool _1748 = _1744 || _1746;
    float _1750 = float(_1748);
    float _1752 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1754 = precise::clamp(_1752, 0.0, 1.0);
    float _1756 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1738);
    float _1758 = _757 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1760 = fma(_1758, _1758, 1.0);
    float _1762 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1764 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1766 = _817 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1768 = _817 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1770 = rsqrt(_1760);
    float _1772 = _817 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1774 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1728);
    float _1776 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1762);
    float _1778 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1732);
    float _1780 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1764);
    float _1782 = fma(_1754, -2.0, 3.0);
    float _1784 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1766);
    float _1786 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1768);
    float _1788 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1772);
    float _1790 = _1754 * _1754;
    float _1792 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1776);
    float _1794 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1756);
    float _1796 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1780);
    float _1798 = _749 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1800 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1784);
    float _1802 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1786);
    float _1804 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1788);
    float _1806 = _1790 * _1782;
    float _1808 = _1758 * _1778;
    float _1810 = _1758 * _1770;
    float _1812 = _1758 * _1774;
    float _1814 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1736);
    out.m_72.x = _1792;
    out.m_72.y = _1794;
    out.m_72.z = _1796;
    float _1816 = -_1806;
    float _1818 = _1816 + 1.0;
    float _1820 = fma(_1798, _1794, _1808);
    float _1822 = fma(_1798, _1792, _1812);
    float _1824 = -_1802;
    float _1826 = _1810 * _1824;
    float _1828 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1806);
    float _1830 = -_1800;
    float _1832 = _1810 * _1830;
    float _1834 = fma(_1770, _1778, _1826);
    float _1836 = _1750 * _1828;
    float _1838 = fma(_1770, _1774, _1832);
    float _1840 = _1429 + _1395;
    float _1842 = -_1804;
    float _1844 = _1810 * _1842;
    float _1846 = _1758 * _1814;
    float _1848 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1540);
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1852 = fma(_1770, _1814, _1844);
    float _1854 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1856 = in.m_74.x;
    float _1858 = _1395 * 0.5;
    float _1860 = _1848 + _1395;
    float _1862 = exp2(_1854);
    float _1864 = fma(_1431, -0.5, _1858);
    float _1866 = _1860 * 0.5;
    float _1868 = _1840 * 0.5;
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1431;
    out.gl_Position.z = _1848;
    out.gl_Position.w = _1395;
    float _1870 = fma(_1798, _1796, _1846);
    float _1872 = _1800 + _1822;
    float _1874 = _1802 + _1820;
    out.m_76.x = _1868;
    out.m_76.y = _1864;
    out.m_76.z = _1866;
    out.m_76.w = _1395;
    float _1876 = _1804 + _1870;
    out.m_78.x = _1838;
    out.m_78.y = _1834;
    out.m_78.z = _1852;
    float _1878 = -_1862;
    float _1880 = _1878 + 1.0;
    out.m_80.x = _1872;
    out.m_80.y = _1874;
    out.m_80.z = _1876;
    float _1882 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1884 = _1395;
    float _1886 = _1848;
    float _1888 = _1431;
    float _1890 = _1838;
    float _1892 = _1882;
    if (!_1680)
    {
        _1884 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1894 = _1884;
    float _1896 = _1894;
    float _1898 = _1894;
    if (!_1680)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1900 = _1886;
    float _1902 = -_1882;
    float _1904 = _1902 + 1.0;
    float _1906 = _1904;
    float _1908 = _1900;
    float _1910 = _1900;
    if (!_1680)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1912 = _1888;
    float _1914 = _1912;
    float _1916 = _1912;
    if (!_1680)
    {
        _1890 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1918 = _1890;
    float _1920 = -_1435;
    float _1922 = _1920 + 1.0;
    float _1924 = _1922 * _1850;
    float _1926 = precise::clamp(_1924, 0.0, 1.0);
    float _1928 = -_1926;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1932 = _1930 * _1856;
    float _1934 = _1882 * _1461;
    float _1936 = _1932 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1938 = _1472 * _1904;
    float _1940 = _1918;
    float _1942 = _1918;
    if (!_1680)
    {
        _1892 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1944 = _1892;
    float _1946 = _1472 * _1934;
    float _1948 = _1482 * _1934;
    out.m_82.x = _1936;
    float _1950 = _1944;
    float _1952 = _1944;
    if (!_1680)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1954 = _1906;
    float _1956 = fma(_1478, _1946, _1466);
    float _1958 = fma(_1480, _1946, _1468);
    float _1960 = fma(_1472, _1948, _1470);
    out.m_84.x = _1956;
    out.m_84.y = _1958;
    out.m_84.z = _1960;
    out.m_84.w = _1938;
    bool _1962 = !_1680;
    float _1964 = _1954;
    float _1966 = _1954;
    if (!_1962)
    {
        bool _1968 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1970 = isnan(_1279);
        bool _1972 = _1968 || _1970;
        bool _1974 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1976 = _1972 || _1974;
        if (!_1976)
        {
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1980 = _1279 + _1978;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1984 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1990 = 1.0 / _1984;
            float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2008 = _1980 * _1990;
            float _2010 = precise::clamp(_2008, 0.0, 1.0);
            float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2016 = fma(_2010, _1988, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2018 = fma(_2010, _2014, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2020 = fma(_2010, _1994, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2022 = fma(_2010, _1998, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2024 = fma(_2010, _2002, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2026 = fma(_2010, _2006, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1942 = _2020;
            _1916 = _2024;
            _1952 = _2016;
            _1910 = _2022;
            _1898 = _2018;
            _1966 = _2026;
            _2028 = true;
        }
        else
        {
            bool _2030 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2032 = isnan(_1279);
            bool _2034 = _2030 || _2032;
            bool _2036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2038 = _2034 || _2036;
            if (!_2038)
            {
                _1950 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2040 = _1950;
            _1952 = _2040;
            if (!_2038)
            {
                _1940 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2042 = _1940;
            _1942 = _2042;
            if (!_2038)
            {
                _1896 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2044 = _1896;
            _1898 = _2044;
            if (!_2038)
            {
                _1908 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2046 = _1908;
            _1910 = _2046;
            if (!_2038)
            {
                _1914 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2048 = _1914;
            _1916 = _2048;
            if (!_2038)
            {
                _1964 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2050 = _1964;
            bool _2052 = !_2038;
            _1966 = _2050;
            if (!_2052)
            {
                bool _2054 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2056 = isnan(_1279);
                bool _2058 = _2054 || _2056;
                bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2062 = _2058 || _2060;
                if (!_2062)
                {
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = _1279 + _2064;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2070 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2068;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2076 = 1.0 / _2070;
                    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2094 = _2066 * _2076;
                    float _2096 = precise::clamp(_2094, 0.0, 1.0);
                    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2102 = fma(_2096, _2074, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2104 = fma(_2096, _2100, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2106 = fma(_2096, _2080, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2108 = fma(_2096, _2084, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2110 = fma(_2096, _2088, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2112 = fma(_2096, _2092, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1942 = _2106;
                    _1916 = _2110;
                    _1952 = _2102;
                    _1910 = _2108;
                    _1898 = _2104;
                    _1966 = _2112;
                    _2028 = true;
                }
                else
                {
                    _1942 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1916 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1952 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1910 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1898 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1966 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2028 = false;
    float _2114 = _1942;
    float _2116 = _1916;
    float _2118 = _1952;
    float _2120 = _1910;
    float _2122 = _1898;
    float _2124 = _1966;
    float _2126 = fma(_1874, -0.5, 0.5);
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = -_2114;
    float _2132 = _2130 + _2116;
    float _2134 = -_2118;
    float _2136 = _2134 + _2120;
    float _2138 = -_2122;
    float _2140 = _2138 + _2124;
    bool _2142 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2144 = fma(_2128, _2132, _2114);
    float _2146 = fma(_2128, _2136, _2118);
    float _2148 = fma(_2128, _2140, _2122);
    float _2150 = _2144 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2152 = fma(_2146, 0.298911988735198974609375, _2150);
    float _2154 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2156 = fma(_2148, 0.114477999508380889892578125, _2152);
    out.m_49.x = _2154;
    float _2158 = -_2156;
    float _2160 = _2146 + _2158;
    float _2162 = -_2156;
    float _2164 = _2144 + _2162;
    float _2166 = -_2156;
    float _2168 = _2148 + _2166;
    float _2170 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2172 = fma(_2164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2174 = fma(_2168, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    out.m_88.x = _2170;
    out.m_88.y = _2172;
    out.m_88.z = _2174;
    if (!_2142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2176 = -_1123;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2180 = -_1125;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2184 = -_1127;
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2188 = _2178 * _2178;
    float _2190 = fma(_2182, _2182, _2188);
    float _2192 = fma(_2186, _2186, _2190);
    float _2194 = sqrt(_2192);
    float _2196 = rsqrt(_2192);
    float _2198 = -_2194;
    float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2202 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2204 = precise::clamp(_2202, 0.0, 1.0);
    float _2206 = _2182 * _2196;
    float _2208 = _2178 * _2196;
    float _2210 = abs(_2204);
    float _2212 = log2(_2210);
    float _2214 = _2186 * _2196;
    float _2216 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2218 = _1874 * _2208;
    float _2220 = -_2208;
    float _2222 = -_2216;
    float _2224 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2222);
    float _2226 = fma(_1872, _2206, _2218);
    float _2228 = -_2214;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2224);
    float _2232 = fma(_1876, _2214, _2226);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2238 = _2230 + _2236;
    float _2240 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2242 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = exp2(_2240);
    float _2248 = _2246 * _2244;
    float _2250 = _2234 * _2248;
    float _2252 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2254 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2256 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2252;
    out.m_86.y = _2254;
    out.m_86.z = _2256;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2028 = false;
    bool _449 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2312 = as_type<float>(_121);
        out.gl_Position.z = _2312;
    }
    if (!_111)
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
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_161);
        out.gl_Position.z = _2381;
    }
    if (_153)
    {
        return out;
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _207;
    if (!_189)
    {
        float _191 = in.m_55.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_107);
        float _213 = 1.0 / _211;
        float _215 = _139 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = 1.0 / _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _237;
    float _255 = _225 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _217 + _257;
    float _261 = 1.0 / _245;
    float _263 = _221 * _251;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_275;
    float _279 = _277 + 1.0;
    float _281 = _229 * _253;
    bool _283 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_217);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    bool _295 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_217);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = _293 * _279;
    bool _309 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_217);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _259 * _261;
    float _323 = -_293;
    float _325 = _323 + 1.0;
    bool _327 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_217);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _305 * _325;
    float _349 = -_305;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_341, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = _319 * _351;
    float _365 = -_319;
    float _367 = _365 + 1.0;
    float _369 = fma(_355, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -_337;
    float _373 = _371 + 1.0;
    float _375 = fma(_345, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = _337 * _367;
    float _379 = fma(_361, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = _357 * _377;
    float _391 = _369 * _377;
    float _393 = fma(_383, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _399 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _409 = fma(_375, _363, _397);
    float _411 = fma(_379, _363, _399);
    float _413 = fma(_403, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _415 = fma(_407, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _417 = fma(_393, _347, _409);
    float _419 = fma(_395, _347, _411);
    float _421 = fma(_413, _307, _417);
    float _423 = fma(_415, _307, _419);
    float _425 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[147].x, _421);
    float _427 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[147].y, _423);
    bool _429 = !_249;
    float _447;
    if (!_429)
    {
        float _431 = in.m_55.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        float _451 = float(_107);
        float _453 = 1.0 / _451;
        float _455 = _139 * _453;
        _447 = _455;
    }
    _449 = false;
    float _457 = _447;
    float _459 = in.m_55.x;
    float _461 = in.m_55.y;
    float _463 = in.m_55.z;
    float _465 = in.m_55.w;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _473 = _471 != 0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _481 = _479 != 0;
    bool _483 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _485 = isnan(1.0);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _491 = _487 || _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    bool _497 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = _469 * _139;
    float _509 = 1.0 / _495;
    float _511 = _463 * 2.0;
    float _513 = _459 * 2.0;
    float _515 = _461 * 2.0;
    float _517 = exp2(_507);
    float _519 = floor(_511);
    float _521 = _461 + _459;
    float _523 = _521 + (-1.0);
    float _525 = floor(_513);
    float _527 = -_517;
    float _529 = _527 + 1.0;
    float _531 = _505 ? _529 : 0.0;
    bool _533 = _519 > 0.0;
    float _535 = floor(_515);
    bool _537 = _519 >= 0.0;
    bool _539 = isnan(_519);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    float _547 = _461 + _463;
    if (_491)
    {
        float _549 = _531 * _509;
        _143 = _549;
    }
    float _551 = _143;
    bool _553 = !_481;
    int _555 = _553 ? 0 : 1;
    float _557 = _547 + (-1.0);
    int _559 = _545 ? 0 : 1;
    bool _561 = _525 > 0.0;
    float _563 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _565 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _567 = ~_559;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    bool _573 = !_473;
    int _575 = _573 ? 0 : 1;
    bool _577 = _525 >= 0.0;
    bool _579 = isnan(_525);
    bool _581 = _577 || _579;
    bool _583 = isnan(0.0);
    bool _585 = _581 || _583;
    int _587 = _571;
    if (!_533)
    {
        int _589 = ~_559;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = in.m_57.x;
    float _597 = in.m_57.y;
    float _599 = in.m_57.z;
    int _601 = abs(_575);
    int _603 = _585 ? 0 : 1;
    bool _605 = !_477;
    int _607 = _605 ? 0 : 1;
    float _609 = float(_601);
    float _611 = float(_593);
    bool _613 = _535 > 0.0;
    int _615 = ~_603;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = _609 * _611;
    int _623 = abs(_607);
    float _625 = _459 + (-0.5);
    int _627 = _619;
    if (!_561)
    {
        int _629 = ~_603;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = _621 * (-2.0);
    bool _637 = _535 >= 0.0;
    bool _639 = isnan(_535);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = float(_623);
    float _649 = float(_633);
    float _651 = fma(_635, _595, _595);
    int _653 = _645 ? 0 : 1;
    float _655 = fma(_565, _635, _565);
    int _657 = abs(_555);
    float _659 = _647 * _649;
    int _661 = ~_653;
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    float _667 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _651);
    int _669 = _665;
    if (!_613)
    {
        int _671 = ~_653;
        int _673 = _671 + 1;
        _669 = _673;
    }
    int _675 = _669;
    float _677 = _659 * (-2.0);
    float _679 = _461 + (-0.5);
    float _681 = float(_657);
    float _683 = fma(_655, _551, _667);
    float _685 = float(_675);
    float _687 = fma(_677, _597, _597);
    float _689 = fma(_563, _677, _563);
    float _691 = as_type<float>(int(gl_VertexIndex));
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].y, _687);
    float _695 = _463 + _459;
    float _697 = _681 * _685;
    float _699 = _683 * 0.15915493667125701904296875;
    float _701 = in.m_62.x;
    float _703 = in.m_62.y;
    float _705 = fma(_689, _551, _693);
    float _707 = _695 + (-1.0);
    float _709 = _697 * (-2.0);
    float _711 = _699 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _705 * 0.15915493667125701904296875;
    float _717 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _719 = fma(_709, _599, _599);
    float _721 = _463 + (-0.5);
    float _723 = fma(_717, _709, _717);
    float _725 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].z, _719);
    float _727 = _715 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = fma(_723, _551, _725);
    int _733 = as_type<int>(_691) & 1;
    bool _735 = _733 != 0;
    int _737 = as_type<int>(_691) & 2;
    bool _739 = _737 != 0;
    float _741 = _731 * 0.15915493667125701904296875;
    float _743 = _715 * 6.283185482025146484375;
    float _745 = cos(_743);
    bool _747 = !_735;
    float _749 = _747 ? (-0.5) : 0.5;
    float _751 = _427 * _703;
    float _753 = _425 * _701;
    bool _755 = !_739;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = _751 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _761 = _699 * 6.283185482025146484375;
    float _763 = sin(_761);
    float _765 = in.m_46.x;
    float _767 = in.m_46.y;
    float _769 = in.m_46.z;
    float _771 = _753 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _749);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _757);
    float _777 = _713 * _729;
    float _779 = _771 * _773;
    float _781 = _741 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _759 * _775;
    float _787 = _713 * _745;
    float _789 = _741 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _763 * _729;
    float _795 = _763 * _745;
    float _797 = _713 * _783;
    float _799 = _763 * _783;
    float _801 = _745 * _783;
    float _803 = _729 * _783;
    float _805 = _797 * _785;
    float _807 = _799 * _785;
    float _809 = fma(_791, _787, _793);
    float _811 = -_777;
    float _813 = fma(_791, _795, _811);
    float _815 = -_795;
    float _817 = fma(_791, _777, _815);
    float _819 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _821 = -_785;
    float _823 = _791 * _821;
    float _825 = fma(_809, _779, _805);
    float _827 = fma(_791, _793, _787);
    float _829 = fma(_813, _779, _807);
    float _831 = fma(_801, _779, _823);
    float _833 = fma(_817, _819, _825);
    float _835 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _837 = fma(_827, _819, _829);
    float _839 = fma(_803, _819, _831);
    float _841 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _843 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _845 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _835);
    float _847 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _849 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _841);
    float _851 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _843);
    float _853 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].z, _845);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _847);
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _849);
    float _859 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].z, _851);
    float _861 = _853 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _869 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _873 = _861 + _865;
    float _875 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _877 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _869);
    float _879 = _867 + _871;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _883 = _873 + _881;
    float _885 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _875);
    float _887 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _879 + _889;
    float _893 = _883 * _883;
    float _895 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _885);
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _899 = fma(_891, _891, _893);
    float _901 = _895 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _903 = sqrt(_899);
    float _905 = _897 + _901;
    bool _907 = _903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = _765;
    float _911 = _769;
    float _913 = _901;
    if (!_907)
    {
        _909 = _879;
    }
    float _915 = _909;
    float _917 = _915;
    if (!_907)
    {
        _911 = _873;
    }
    float _919 = _911;
    float _921 = _919;
    if (!_907)
    {
        _913 = _905;
    }
    float _923 = _913;
    bool _925 = !_907;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _903 + _931;
        float _935 = rsqrt(_899);
        float _937 = _933 * _929;
        float _939 = _905 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _941 = _937 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 + (-1.0);
        float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = fma(_949, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _957 = fma(_905, _945, _953);
        float _959 = _935 * _955;
        float _961 = fma(_891, _959, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_883, _959, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _927 = _957;
        _917 = _961;
        _921 = _963;
    }
    float _965 = _927;
    float _967 = _917;
    float _969 = _921;
    float _971 = -_897;
    float _973 = _971 + _965;
    float _975 = -_867;
    float _977 = _975 + _967;
    float _979 = -_861;
    float _981 = _979 + _969;
    float _983 = _973 * _973;
    bool _985 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _987 = isnan(0.5);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    float _995 = fma(_977, _977, _983);
    float _997 = fma(_981, _981, _995);
    float _999 = sqrt(_997);
    bool _1001 = _999 > 0.0;
    bool _1003 = !_1001;
    float _1005 = _967;
    float _1007 = _965;
    float _1009 = _969;
    float _1011 = _977;
    if (!_1003)
    {
        float _1013 = _183 * _183;
        float _1015 = rsqrt(_997);
        float _1017 = fma(_185, _185, _1013);
        float _1019 = fma(_187, _187, _1017);
        float _1021 = sqrt(_1019);
        float _1023 = _977 * _1015;
        float _1025 = _973 * _1015;
        float _1027 = _981 * _1015;
        bool _1029 = _1021 > 0.0;
        bool _1031 = !_1029;
        _1011 = _1025;
        if (!_1031)
        {
            float _1033 = rsqrt(_1019);
            float _1035 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1037 = _183 * _1033;
            float _1039 = _185 * _1033;
            float _1041 = _1025 * _1037;
            float _1043 = _187 * _1033;
            float _1045 = fma(_1023, _1039, _1041);
            float _1047 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1049 = fma(_1027, _1043, _1045);
            float _1051 = _1049 * _1047;
            float _1053 = fma(_185, _1051, _967);
            float _1055 = fma(_183, _1051, _965);
            float _1057 = fma(_187, _1051, _969);
            _1005 = _1053;
            _1007 = _1055;
            _1009 = _1057;
            _1011 = _1045;
        }
    }
    float _1059 = _1005;
    float _1061 = _1007;
    float _1063 = _1009;
    float _1065 = _1011;
    float _1067 = _1061;
    float _1069 = _1059;
    float _1071 = _1063;
    if (!_993)
    {
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1075 = _897 + _1073;
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1079 = _867 + _1077;
        float _1081 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1083 = -_867;
        float _1085 = _1083 + _1059;
        float _1087 = _1075 * _1075;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1091 = _861 + _1089;
        float _1093 = -_897;
        float _1095 = _1093 + _1061;
        float _1097 = -_861;
        float _1099 = _1097 + _1063;
        float _1101 = fma(_1079, _1079, _1087);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1091, _1091, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1113 = _1111 * _1103;
        float _1115 = _1109 * _1113;
        float _1117 = fma(_1085, _1115, _867);
        float _1119 = fma(_1095, _1115, _897);
        float _1121 = fma(_1099, _1115, _861);
        _1067 = _1119;
        _1069 = _1117;
        _1071 = _1121;
    }
    float _1123 = _1067;
    float _1125 = _1069;
    float _1127 = _1071;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1131 = _1123 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1125 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1139 = _1127 + _1137;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1143 = _1131 * _1131;
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1141);
    float _1147 = fma(_1135, _1135, _1143);
    float _1149 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1145);
    float _1151 = fma(_1139, _1139, _1147);
    float _1153 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = rsqrt(_1151);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1135 * _1157;
    float _1161 = _1139 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 * _1161;
    float _1167 = _1163 + _1165;
    float _1169 = sqrt(_1167);
    bool _1171 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1169 + _1173;
    float _1177 = _1065;
    float _1179 = _1167;
    float _1181 = _1175;
    float _1183 = _1131;
    float _1185 = _1157;
    float _1187 = _1159;
    if (_1171)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1189;
    }
    float _1191 = _1177;
    if (_1171)
    {
        float _1193 = rsqrt(_1167);
        _1179 = _1193;
    }
    float _1195 = _1179;
    float _1197 = _1191;
    float _1199 = _1195;
    if (_1171)
    {
        float _1201 = _1175 * _1191;
        _1181 = _1201;
    }
    float _1203 = _1181;
    if (_1171)
    {
        float _1205 = _1203 * 0.15915493667125701904296875;
        _1197 = _1205;
    }
    float _1207 = _1197;
    float _1209 = _1155;
    float _1211 = _1207;
    if (_1171)
    {
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        _1209 = _1215;
    }
    float _1217 = _1209;
    float _1219 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1221 = precise::max(0.0, _1219);
    float _1223 = _1139;
    float _1225 = _1221;
    if (_1171)
    {
        float _1227 = _1207 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        _1223 = _1229;
    }
    float _1231 = _1223;
    float _1233 = -_1157;
    float _1235 = -_1221;
    float _1237 = fma(_1131, _1233, _1235);
    float _1239 = _1237;
    if (_1171)
    {
        float _1241 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1183 = _1241;
    }
    float _1243 = _1183;
    float _1245 = _1243;
    if (!_1171)
    {
        _1211 = _1159;
    }
    float _1247 = _1211;
    float _1249 = _1217;
    float _1251 = _1247;
    if (_1171)
    {
        float _1253 = fma(_1217, _1243, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = _1255;
    if (_1171)
    {
        float _1259 = _1231 + (-1.0);
        _1225 = _1259;
    }
    float _1261 = _1225;
    if (_1171)
    {
        float _1263 = _1195 * _1255;
        _1185 = _1263;
    }
    float _1265 = _1185;
    if (!_1171)
    {
        _1257 = _1161;
    }
    float _1267 = _1257;
    float _1269 = _1267;
    if (_1171)
    {
        float _1271 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1271;
    }
    float _1273 = _1245;
    if (_1171)
    {
        float _1275 = _1159 * _1265;
        _1251 = _1275;
    }
    float _1277 = _1251;
    float _1279 = sqrt(_1151);
    if (!_1171)
    {
        _1199 = _1163;
    }
    float _1281 = _1199;
    float _1283 = _1281;
    if (_1171)
    {
        float _1285 = fma(_1237, _1231, _1273);
        _1239 = _1285;
    }
    float _1287 = _1239;
    if (_1171)
    {
        float _1289 = _1161 * _1265;
        _1269 = _1289;
    }
    float _1291 = _1269;
    if (_1171)
    {
        float _1293 = _1277 * _1277;
        _1283 = _1293;
    }
    float _1295 = _1283;
    if (!_1171)
    {
        _1187 = _1165;
    }
    float _1297 = _1187;
    float _1299 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1301 = _1297;
    if (_1171)
    {
        float _1303 = _1291 * _1291;
        _1301 = _1303;
    }
    float _1305 = _1301;
    float _1307 = fma(_1287, _1287, _1295);
    float _1309 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1299);
    float _1311 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1313 = _1307 + _1305;
    float _1315 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1309);
    float _1317 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1311);
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1321 = fma(_1279, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1319);
    float _1323 = precise::clamp(_1321, 0.0, 1.0);
    float _1325 = rsqrt(_1313);
    float _1327 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = -_1323;
    float _1331 = _1329 + 1.0;
    float _1333 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1335 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    float _1337 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1339 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1333);
    float _1341 = abs(_1331);
    float _1343 = log2(_1341);
    float _1345 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1347 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1349 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1353 = fma(_861, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1355 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1325 * _1277;
    float _1359 = _1325 * _1287;
    float _1361 = floor(_1337);
    float _1363 = _1325 * _1291;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1369 = -_1347;
    float _1371 = fma(_1369, _1351, 1.0);
    float _1373 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1375 = -_1365;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1375);
    float _1379 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1367);
    float _1381 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1383 = floor(_1353);
    float _1385 = -_1363;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1377);
    float _1389 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1379);
    float _1391 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1373);
    float _1393 = fma(_1387, -0.5, 0.5);
    float _1395 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1397 = -_1361;
    float _1399 = _1337 + _1397;
    float _1401 = exp2(_1381);
    float _1403 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1405 = _1359 + 1.0;
    float _1407 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1391);
    float _1409 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1403);
    float _1411 = 1.0 / _1395;
    float _1413 = -_1383;
    float _1415 = _1353 + _1413;
    float _1417 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1419 = log2(_1371);
    float _1421 = sqrt(_1393);
    float _1423 = fma(_1387, 0.5, 0.5);
    float _1425 = -_1359;
    float _1427 = fma(_1401, _1405, _1425);
    float _1429 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1417);
    float _1431 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1407);
    float _1433 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _4370 = float2(_1399, _1415);
    float _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4370, float2(0.0), isnan(_4370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4370, float2(0.0), isnan(_4370)), level(0.0)).x;
    float _1437 = _1429 * _1411;
    float _1439 = _1419 * 0.693147182464599609375;
    float _1441 = fma(_1423, _1433, -0.212114393711090087890625);
    float _1443 = fma(_1427, 0.5, 0.5);
    float _1445 = fma(_1437, 0.5, 0.5);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1449 = fma(_1423, _1441, 1.570728778839111328125);
    float _1451 = _1431 * _1411;
    float _1453 = _1421 * 0.636619746685028076171875;
    float _1455 = fma(_1451, -0.5, 0.5);
    float _1457 = -_1449;
    float _1459 = fma(_1453, _1457, 1.0);
    float3 _4416 = float3(_1445, _1455, _1447);
    float _1461 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4416, float3(0.0), isnan(_4416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4416, float3(0.0), isnan(_4416)), level(0.0)).x;
    float3 _4427 = float3(_1445, _1455, _1447);
    float4 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).xyzw;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = _1464.w;
    float2 _4443 = float2(_1459, _1443);
    float3 _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4443, float2(0.0), isnan(_4443)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4443, float2(0.0), isnan(_4443)), level(0.0)).xyz;
    float _1478 = _1476.x;
    float _1480 = _1476.y;
    float _1482 = _1476.z;
    float _1484 = _897 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1486 = _897 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1488 = _459 > 0.5;
    float _1490 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1484);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1494 = _457 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1500 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1486);
    float _1502 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1490);
    float _1504 = 1.0 / _1498;
    float _1506 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1500);
    float _1508 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1510 = _461 > 0.5;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1512;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1518 = _465 > 0.5;
    float _1520 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1522 = 1.0 / _1508;
    float _1524 = _1516 + _1508;
    float _1526 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1520);
    out.m_64.x = _1125;
    out.m_64.y = _1123;
    out.m_64.z = _1127;
    bool _1528 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1530 = isnan(_457);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1542 = _1514 * _1504;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1546 = _1544 != 0;
    float _1548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1552 = _1550 != 0;
    float _1554 = fma(_1542, _1494, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1556 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1558 = isnan(_457);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1570 = _1568 != 0;
    float _1572 = _1524 * _1522;
    float _1574 = _1572 * 0.5;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1578 = _1576 != 0;
    float _1580 = -_1566;
    float _1582 = _1580 + 1.0;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1584);
    float _1588 = _1538 * _1582;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = -_1538;
    float _1594 = _1592 + 1.0;
    float _1596 = 1.0 / _1586;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1602 = _1554 * _1588;
    float _1604 = -_749;
    int _1606 = _1488 ? as_type<int>(_1604) : as_type<int>(_749);
    float _1608 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1610 = _463 > 0.5;
    float _1612 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1614 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1616 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1602);
    float _1618 = -_757;
    int _1620 = _1510 ? as_type<int>(_1618) : as_type<int>(_757);
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1624 = -_749;
    int _1626 = _1610 ? as_type<int>(_1624) : as_type<int>(_749);
    bool _1628 = !_1552;
    float _1630 = _1628 ? _757 : as_type<float>(_1620);
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1634 = _1596 * _1632;
    bool _1636 = !_1570;
    float _1638 = _1636 ? _749 : as_type<float>(_1626);
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1644 = -_1630;
    float _1646 = _1644 + 0.5;
    float _1648 = -_757;
    int _1650 = _1518 ? as_type<int>(_1648) : as_type<int>(_757);
    float _1652 = _1638 + 0.5;
    out.m_66.x = _1608;
    out.m_66.y = _1612;
    out.m_66.z = _1614;
    out.m_66.w = _1640;
    float _1654 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1656 = !_1546;
    float _1658 = _1656 ? _749 : as_type<float>(_1606);
    float _1660 = abs(_1634);
    float _1662 = log2(_1660);
    float _1664 = _1654 * _1548;
    bool _1666 = !_1578;
    float _1668 = _1666 ? _757 : as_type<float>(_1650);
    float _1670 = _1658 + 0.5;
    bool _1672 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1674 = isnan(_1279);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1680 = _1676 || _1678;
    float _1682 = -_1668;
    float _1684 = _1682 + 0.5;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1688 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1690 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1692 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1616);
    float _1694 = _1690 * _1622;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1698 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = exp2(_1698);
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1716 = _1688 * _1642;
    float _1718 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1720 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_68.x = _1706;
    out.m_68.y = _1712;
    out.m_68.z = _1708;
    out.m_68.w = _1702;
    float _1722 = _1714 * _1686;
    float _1724 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1726 = -_791;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1718);
    float _1730 = -_791;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1720);
    out.m_70.x = _1716;
    out.m_70.y = _1664;
    out.m_70.z = _1694;
    out.m_70.w = _1722;
    float _1734 = -_791;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1738 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1740 = _1634 <= 8000.0;
    bool _1742 = isnan(_1634);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(8000.0);
    bool _1748 = _1744 || _1746;
    float _1750 = float(_1748);
    float _1752 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1754 = precise::clamp(_1752, 0.0, 1.0);
    float _1756 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1738);
    float _1758 = _757 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1760 = fma(_1758, _1758, 1.0);
    float _1762 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1764 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1766 = _817 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1768 = _817 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1770 = rsqrt(_1760);
    float _1772 = _817 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1774 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1728);
    float _1776 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1762);
    float _1778 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1732);
    float _1780 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1764);
    float _1782 = fma(_1754, -2.0, 3.0);
    float _1784 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1766);
    float _1786 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1768);
    float _1788 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1772);
    float _1790 = _1754 * _1754;
    float _1792 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1776);
    float _1794 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1756);
    float _1796 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1780);
    float _1798 = _749 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1800 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1784);
    float _1802 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1786);
    float _1804 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1788);
    float _1806 = _1790 * _1782;
    float _1808 = _1758 * _1778;
    float _1810 = _1758 * _1770;
    float _1812 = _1758 * _1774;
    float _1814 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1736);
    out.m_72.x = _1792;
    out.m_72.y = _1794;
    out.m_72.z = _1796;
    float _1816 = -_1806;
    float _1818 = _1816 + 1.0;
    float _1820 = fma(_1798, _1794, _1808);
    float _1822 = fma(_1798, _1792, _1812);
    float _1824 = -_1802;
    float _1826 = _1810 * _1824;
    float _1828 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1806);
    float _1830 = -_1800;
    float _1832 = _1810 * _1830;
    float _1834 = fma(_1770, _1778, _1826);
    float _1836 = _1750 * _1828;
    float _1838 = fma(_1770, _1774, _1832);
    float _1840 = _1429 + _1395;
    float _1842 = -_1804;
    float _1844 = _1810 * _1842;
    float _1846 = _1758 * _1814;
    float _1848 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1540);
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1852 = fma(_1770, _1814, _1844);
    float _1854 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1856 = in.m_74.x;
    float _1858 = _1395 * 0.5;
    float _1860 = _1848 + _1395;
    float _1862 = exp2(_1854);
    float _1864 = fma(_1431, -0.5, _1858);
    float _1866 = _1860 * 0.5;
    float _1868 = _1840 * 0.5;
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1431;
    out.gl_Position.z = _1848;
    out.gl_Position.w = _1395;
    float _1870 = fma(_1798, _1796, _1846);
    float _1872 = _1800 + _1822;
    float _1874 = _1802 + _1820;
    out.m_76.x = _1868;
    out.m_76.y = _1864;
    out.m_76.z = _1866;
    out.m_76.w = _1395;
    float _1876 = _1804 + _1870;
    out.m_78.x = _1838;
    out.m_78.y = _1834;
    out.m_78.z = _1852;
    float _1878 = -_1862;
    float _1880 = _1878 + 1.0;
    out.m_80.x = _1872;
    out.m_80.y = _1874;
    out.m_80.z = _1876;
    float _1882 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1884 = _1395;
    float _1886 = _1848;
    float _1888 = _1431;
    float _1890 = _1838;
    float _1892 = _1882;
    if (!_1680)
    {
        _1884 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1894 = _1884;
    float _1896 = _1894;
    float _1898 = _1894;
    if (!_1680)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1900 = _1886;
    float _1902 = -_1882;
    float _1904 = _1902 + 1.0;
    float _1906 = _1904;
    float _1908 = _1900;
    float _1910 = _1900;
    if (!_1680)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1912 = _1888;
    float _1914 = _1912;
    float _1916 = _1912;
    if (!_1680)
    {
        _1890 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1918 = _1890;
    float _1920 = -_1435;
    float _1922 = _1920 + 1.0;
    float _1924 = _1922 * _1850;
    float _1926 = precise::clamp(_1924, 0.0, 1.0);
    float _1928 = -_1926;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1932 = _1930 * _1856;
    float _1934 = _1882 * _1461;
    float _1936 = _1932 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1938 = _1472 * _1904;
    float _1940 = _1918;
    float _1942 = _1918;
    if (!_1680)
    {
        _1892 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1944 = _1892;
    float _1946 = _1472 * _1934;
    float _1948 = _1482 * _1934;
    out.m_82.x = _1936;
    float _1950 = _1944;
    float _1952 = _1944;
    if (!_1680)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1954 = _1906;
    float _1956 = fma(_1478, _1946, _1466);
    float _1958 = fma(_1480, _1946, _1468);
    float _1960 = fma(_1472, _1948, _1470);
    out.m_84.x = _1956;
    out.m_84.y = _1958;
    out.m_84.z = _1960;
    out.m_84.w = _1938;
    bool _1962 = !_1680;
    float _1964 = _1954;
    float _1966 = _1954;
    if (!_1962)
    {
        bool _1968 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1970 = isnan(_1279);
        bool _1972 = _1968 || _1970;
        bool _1974 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1976 = _1972 || _1974;
        if (!_1976)
        {
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1980 = _1279 + _1978;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1984 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1990 = 1.0 / _1984;
            float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2008 = _1980 * _1990;
            float _2010 = precise::clamp(_2008, 0.0, 1.0);
            float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2016 = fma(_2010, _1988, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2018 = fma(_2010, _2014, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2020 = fma(_2010, _1994, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2022 = fma(_2010, _1998, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2024 = fma(_2010, _2002, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2026 = fma(_2010, _2006, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1942 = _2020;
            _1916 = _2024;
            _1952 = _2016;
            _1910 = _2022;
            _1898 = _2018;
            _1966 = _2026;
            _2028 = true;
        }
        else
        {
            bool _2030 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2032 = isnan(_1279);
            bool _2034 = _2030 || _2032;
            bool _2036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2038 = _2034 || _2036;
            if (!_2038)
            {
                _1950 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2040 = _1950;
            _1952 = _2040;
            if (!_2038)
            {
                _1940 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2042 = _1940;
            _1942 = _2042;
            if (!_2038)
            {
                _1896 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2044 = _1896;
            _1898 = _2044;
            if (!_2038)
            {
                _1908 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2046 = _1908;
            _1910 = _2046;
            if (!_2038)
            {
                _1914 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2048 = _1914;
            _1916 = _2048;
            if (!_2038)
            {
                _1964 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2050 = _1964;
            bool _2052 = !_2038;
            _1966 = _2050;
            if (!_2052)
            {
                bool _2054 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2056 = isnan(_1279);
                bool _2058 = _2054 || _2056;
                bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2062 = _2058 || _2060;
                if (!_2062)
                {
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = _1279 + _2064;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2070 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2068;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2076 = 1.0 / _2070;
                    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2094 = _2066 * _2076;
                    float _2096 = precise::clamp(_2094, 0.0, 1.0);
                    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2102 = fma(_2096, _2074, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2104 = fma(_2096, _2100, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2106 = fma(_2096, _2080, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2108 = fma(_2096, _2084, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2110 = fma(_2096, _2088, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2112 = fma(_2096, _2092, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1942 = _2106;
                    _1916 = _2110;
                    _1952 = _2102;
                    _1910 = _2108;
                    _1898 = _2104;
                    _1966 = _2112;
                    _2028 = true;
                }
                else
                {
                    _1942 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1916 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1952 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1910 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1898 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1966 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2028 = false;
    float _2114 = _1942;
    float _2116 = _1916;
    float _2118 = _1952;
    float _2120 = _1910;
    float _2122 = _1898;
    float _2124 = _1966;
    float _2126 = fma(_1874, -0.5, 0.5);
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = -_2114;
    float _2132 = _2130 + _2116;
    float _2134 = -_2118;
    float _2136 = _2134 + _2120;
    float _2138 = -_2122;
    float _2140 = _2138 + _2124;
    bool _2142 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2144 = fma(_2128, _2132, _2114);
    float _2146 = fma(_2128, _2136, _2118);
    float _2148 = fma(_2128, _2140, _2122);
    float _2150 = _2144 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2152 = fma(_2146, 0.298911988735198974609375, _2150);
    float _2154 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2156 = fma(_2148, 0.114477999508380889892578125, _2152);
    out.m_49.x = _2154;
    float _2158 = -_2156;
    float _2160 = _2146 + _2158;
    float _2162 = -_2156;
    float _2164 = _2144 + _2162;
    float _2166 = -_2156;
    float _2168 = _2148 + _2166;
    float _2170 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2172 = fma(_2164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2174 = fma(_2168, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    out.m_88.x = _2170;
    out.m_88.y = _2172;
    out.m_88.z = _2174;
    if (!_2142)
    {
        return out;
    }
    float _2176 = -_1123;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2180 = -_1125;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2184 = -_1127;
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2188 = _2178 * _2178;
    float _2190 = fma(_2182, _2182, _2188);
    float _2192 = fma(_2186, _2186, _2190);
    float _2194 = sqrt(_2192);
    float _2196 = rsqrt(_2192);
    float _2198 = -_2194;
    float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2202 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2204 = precise::clamp(_2202, 0.0, 1.0);
    float _2206 = _2182 * _2196;
    float _2208 = _2178 * _2196;
    float _2210 = abs(_2204);
    float _2212 = log2(_2210);
    float _2214 = _2186 * _2196;
    float _2216 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2218 = _1874 * _2208;
    float _2220 = -_2208;
    float _2222 = -_2216;
    float _2224 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2222);
    float _2226 = fma(_1872, _2206, _2218);
    float _2228 = -_2214;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2224);
    float _2232 = fma(_1876, _2214, _2226);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2238 = _2230 + _2236;
    float _2240 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2242 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = exp2(_2240);
    float _2248 = _2246 * _2244;
    float _2250 = _2234 * _2248;
    float _2252 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2254 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2256 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2252;
    out.m_86.y = _2254;
    out.m_86.z = _2256;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2028 = false;
    bool _449 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2312 = as_type<float>(_121);
        out.gl_Position.z = _2312;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2381 = as_type<float>(_161);
        out.gl_Position.z = _2381;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _207;
    if (!_189)
    {
        float _191 = in.m_55.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_107);
        float _213 = 1.0 / _211;
        float _215 = _139 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = 1.0 / _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _237;
    float _255 = _225 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _259 = _217 + _257;
    float _261 = 1.0 / _245;
    float _263 = _221 * _251;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_275;
    float _279 = _277 + 1.0;
    float _281 = _229 * _253;
    bool _283 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_217);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    bool _295 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_217);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = _293 * _279;
    bool _309 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _311 = isnan(_217);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _259 * _261;
    float _323 = -_293;
    float _325 = _323 + 1.0;
    bool _327 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_217);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _305 * _325;
    float _349 = -_305;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_341, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = _319 * _351;
    float _365 = -_319;
    float _367 = _365 + 1.0;
    float _369 = fma(_355, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -_337;
    float _373 = _371 + 1.0;
    float _375 = fma(_345, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = _337 * _367;
    float _379 = fma(_361, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = _357 * _377;
    float _391 = _369 * _377;
    float _393 = fma(_383, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _389);
    float _399 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _409 = fma(_375, _363, _397);
    float _411 = fma(_379, _363, _399);
    float _413 = fma(_403, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _415 = fma(_407, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _417 = fma(_393, _347, _409);
    float _419 = fma(_395, _347, _411);
    float _421 = fma(_413, _307, _417);
    float _423 = fma(_415, _307, _419);
    float _425 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[147].x, _421);
    float _427 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[147].y, _423);
    bool _429 = !_249;
    float _447;
    if (!_429)
    {
        float _431 = in.m_55.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        float _451 = float(_107);
        float _453 = 1.0 / _451;
        float _455 = _139 * _453;
        _447 = _455;
    }
    _449 = false;
    float _457 = _447;
    float _459 = in.m_55.x;
    float _461 = in.m_55.y;
    float _463 = in.m_55.z;
    float _465 = in.m_55.w;
    float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _469 = log2(_467);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _473 = _471 != 0;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _481 = _479 != 0;
    bool _483 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _485 = isnan(1.0);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _491 = _487 || _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    bool _497 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = _469 * _139;
    float _509 = 1.0 / _495;
    float _511 = _463 * 2.0;
    float _513 = _459 * 2.0;
    float _515 = _461 * 2.0;
    float _517 = exp2(_507);
    float _519 = floor(_511);
    float _521 = _461 + _459;
    float _523 = _521 + (-1.0);
    float _525 = floor(_513);
    float _527 = -_517;
    float _529 = _527 + 1.0;
    float _531 = _505 ? _529 : 0.0;
    bool _533 = _519 > 0.0;
    float _535 = floor(_515);
    bool _537 = _519 >= 0.0;
    bool _539 = isnan(_519);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    float _547 = _461 + _463;
    if (_491)
    {
        float _549 = _531 * _509;
        _143 = _549;
    }
    float _551 = _143;
    bool _553 = !_481;
    int _555 = _553 ? 0 : 1;
    float _557 = _547 + (-1.0);
    int _559 = _545 ? 0 : 1;
    bool _561 = _525 > 0.0;
    float _563 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _565 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _567 = ~_559;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    bool _573 = !_473;
    int _575 = _573 ? 0 : 1;
    bool _577 = _525 >= 0.0;
    bool _579 = isnan(_525);
    bool _581 = _577 || _579;
    bool _583 = isnan(0.0);
    bool _585 = _581 || _583;
    int _587 = _571;
    if (!_533)
    {
        int _589 = ~_559;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = in.m_57.x;
    float _597 = in.m_57.y;
    float _599 = in.m_57.z;
    int _601 = abs(_575);
    int _603 = _585 ? 0 : 1;
    bool _605 = !_477;
    int _607 = _605 ? 0 : 1;
    float _609 = float(_601);
    float _611 = float(_593);
    bool _613 = _535 > 0.0;
    int _615 = ~_603;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = _609 * _611;
    int _623 = abs(_607);
    float _625 = _459 + (-0.5);
    int _627 = _619;
    if (!_561)
    {
        int _629 = ~_603;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = _621 * (-2.0);
    bool _637 = _535 >= 0.0;
    bool _639 = isnan(_535);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = float(_623);
    float _649 = float(_633);
    float _651 = fma(_635, _595, _595);
    int _653 = _645 ? 0 : 1;
    float _655 = fma(_565, _635, _565);
    int _657 = abs(_555);
    float _659 = _647 * _649;
    int _661 = ~_653;
    int _663 = _661 + 1;
    int _665 = _663 + 1;
    float _667 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _651);
    int _669 = _665;
    if (!_613)
    {
        int _671 = ~_653;
        int _673 = _671 + 1;
        _669 = _673;
    }
    int _675 = _669;
    float _677 = _659 * (-2.0);
    float _679 = _461 + (-0.5);
    float _681 = float(_657);
    float _683 = fma(_655, _551, _667);
    float _685 = float(_675);
    float _687 = fma(_677, _597, _597);
    float _689 = fma(_563, _677, _563);
    float _691 = as_type<float>(int(gl_VertexIndex));
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].y, _687);
    float _695 = _463 + _459;
    float _697 = _681 * _685;
    float _699 = _683 * 0.15915493667125701904296875;
    float _701 = in.m_62.x;
    float _703 = in.m_62.y;
    float _705 = fma(_689, _551, _693);
    float _707 = _695 + (-1.0);
    float _709 = _697 * (-2.0);
    float _711 = _699 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _705 * 0.15915493667125701904296875;
    float _717 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _719 = fma(_709, _599, _599);
    float _721 = _463 + (-0.5);
    float _723 = fma(_717, _709, _717);
    float _725 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].z, _719);
    float _727 = _715 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = fma(_723, _551, _725);
    int _733 = as_type<int>(_691) & 1;
    bool _735 = _733 != 0;
    int _737 = as_type<int>(_691) & 2;
    bool _739 = _737 != 0;
    float _741 = _731 * 0.15915493667125701904296875;
    float _743 = _715 * 6.283185482025146484375;
    float _745 = cos(_743);
    bool _747 = !_735;
    float _749 = _747 ? (-0.5) : 0.5;
    float _751 = _427 * _703;
    float _753 = _425 * _701;
    bool _755 = !_739;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = _751 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _761 = _699 * 6.283185482025146484375;
    float _763 = sin(_761);
    float _765 = in.m_46.x;
    float _767 = in.m_46.y;
    float _769 = in.m_46.z;
    float _771 = _753 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _749);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _757);
    float _777 = _713 * _729;
    float _779 = _771 * _773;
    float _781 = _741 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _759 * _775;
    float _787 = _713 * _745;
    float _789 = _741 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _763 * _729;
    float _795 = _763 * _745;
    float _797 = _713 * _783;
    float _799 = _763 * _783;
    float _801 = _745 * _783;
    float _803 = _729 * _783;
    float _805 = _797 * _785;
    float _807 = _799 * _785;
    float _809 = fma(_791, _787, _793);
    float _811 = -_777;
    float _813 = fma(_791, _795, _811);
    float _815 = -_795;
    float _817 = fma(_791, _777, _815);
    float _819 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _821 = -_785;
    float _823 = _791 * _821;
    float _825 = fma(_809, _779, _805);
    float _827 = fma(_791, _793, _787);
    float _829 = fma(_813, _779, _807);
    float _831 = fma(_801, _779, _823);
    float _833 = fma(_817, _819, _825);
    float _835 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _837 = fma(_827, _819, _829);
    float _839 = fma(_803, _819, _831);
    float _841 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _843 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _845 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _835);
    float _847 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _849 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _841);
    float _851 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _843);
    float _853 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].z, _845);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _847);
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _849);
    float _859 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].z, _851);
    float _861 = _853 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _869 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _873 = _861 + _865;
    float _875 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _877 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _869);
    float _879 = _867 + _871;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _883 = _873 + _881;
    float _885 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _875);
    float _887 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _879 + _889;
    float _893 = _883 * _883;
    float _895 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _885);
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _899 = fma(_891, _891, _893);
    float _901 = _895 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _903 = sqrt(_899);
    float _905 = _897 + _901;
    bool _907 = _903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = _765;
    float _911 = _769;
    float _913 = _901;
    if (!_907)
    {
        _909 = _879;
    }
    float _915 = _909;
    float _917 = _915;
    if (!_907)
    {
        _911 = _873;
    }
    float _919 = _911;
    float _921 = _919;
    if (!_907)
    {
        _913 = _905;
    }
    float _923 = _913;
    bool _925 = !_907;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _903 + _931;
        float _935 = rsqrt(_899);
        float _937 = _933 * _929;
        float _939 = _905 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _941 = _937 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 + (-1.0);
        float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = fma(_949, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _957 = fma(_905, _945, _953);
        float _959 = _935 * _955;
        float _961 = fma(_891, _959, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_883, _959, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _927 = _957;
        _917 = _961;
        _921 = _963;
    }
    float _965 = _927;
    float _967 = _917;
    float _969 = _921;
    float _971 = -_897;
    float _973 = _971 + _965;
    float _975 = -_867;
    float _977 = _975 + _967;
    float _979 = -_861;
    float _981 = _979 + _969;
    float _983 = _973 * _973;
    bool _985 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _987 = isnan(0.5);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    float _995 = fma(_977, _977, _983);
    float _997 = fma(_981, _981, _995);
    float _999 = sqrt(_997);
    bool _1001 = _999 > 0.0;
    bool _1003 = !_1001;
    float _1005 = _967;
    float _1007 = _965;
    float _1009 = _969;
    float _1011 = _977;
    if (!_1003)
    {
        float _1013 = _183 * _183;
        float _1015 = rsqrt(_997);
        float _1017 = fma(_185, _185, _1013);
        float _1019 = fma(_187, _187, _1017);
        float _1021 = sqrt(_1019);
        float _1023 = _977 * _1015;
        float _1025 = _973 * _1015;
        float _1027 = _981 * _1015;
        bool _1029 = _1021 > 0.0;
        bool _1031 = !_1029;
        _1011 = _1025;
        if (!_1031)
        {
            float _1033 = rsqrt(_1019);
            float _1035 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1037 = _183 * _1033;
            float _1039 = _185 * _1033;
            float _1041 = _1025 * _1037;
            float _1043 = _187 * _1033;
            float _1045 = fma(_1023, _1039, _1041);
            float _1047 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1049 = fma(_1027, _1043, _1045);
            float _1051 = _1049 * _1047;
            float _1053 = fma(_185, _1051, _967);
            float _1055 = fma(_183, _1051, _965);
            float _1057 = fma(_187, _1051, _969);
            _1005 = _1053;
            _1007 = _1055;
            _1009 = _1057;
            _1011 = _1045;
        }
    }
    float _1059 = _1005;
    float _1061 = _1007;
    float _1063 = _1009;
    float _1065 = _1011;
    float _1067 = _1061;
    float _1069 = _1059;
    float _1071 = _1063;
    if (!_993)
    {
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1075 = _897 + _1073;
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1079 = _867 + _1077;
        float _1081 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1083 = -_867;
        float _1085 = _1083 + _1059;
        float _1087 = _1075 * _1075;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1091 = _861 + _1089;
        float _1093 = -_897;
        float _1095 = _1093 + _1061;
        float _1097 = -_861;
        float _1099 = _1097 + _1063;
        float _1101 = fma(_1079, _1079, _1087);
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1105 = fma(_1091, _1091, _1101);
        float _1107 = sqrt(_1105);
        float _1109 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1111 = precise::min(_1107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1113 = _1111 * _1103;
        float _1115 = _1109 * _1113;
        float _1117 = fma(_1085, _1115, _867);
        float _1119 = fma(_1095, _1115, _897);
        float _1121 = fma(_1099, _1115, _861);
        _1067 = _1119;
        _1069 = _1117;
        _1071 = _1121;
    }
    float _1123 = _1067;
    float _1125 = _1069;
    float _1127 = _1071;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1131 = _1123 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1125 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1139 = _1127 + _1137;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1143 = _1131 * _1131;
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1141);
    float _1147 = fma(_1135, _1135, _1143);
    float _1149 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1145);
    float _1151 = fma(_1139, _1139, _1147);
    float _1153 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = rsqrt(_1151);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1135 * _1157;
    float _1161 = _1139 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 * _1161;
    float _1167 = _1163 + _1165;
    float _1169 = sqrt(_1167);
    bool _1171 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1169 + _1173;
    float _1177 = _1065;
    float _1179 = _1167;
    float _1181 = _1175;
    float _1183 = _1131;
    float _1185 = _1157;
    float _1187 = _1159;
    if (_1171)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1189;
    }
    float _1191 = _1177;
    if (_1171)
    {
        float _1193 = rsqrt(_1167);
        _1179 = _1193;
    }
    float _1195 = _1179;
    float _1197 = _1191;
    float _1199 = _1195;
    if (_1171)
    {
        float _1201 = _1175 * _1191;
        _1181 = _1201;
    }
    float _1203 = _1181;
    if (_1171)
    {
        float _1205 = _1203 * 0.15915493667125701904296875;
        _1197 = _1205;
    }
    float _1207 = _1197;
    float _1209 = _1155;
    float _1211 = _1207;
    if (_1171)
    {
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        _1209 = _1215;
    }
    float _1217 = _1209;
    float _1219 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1221 = precise::max(0.0, _1219);
    float _1223 = _1139;
    float _1225 = _1221;
    if (_1171)
    {
        float _1227 = _1207 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        _1223 = _1229;
    }
    float _1231 = _1223;
    float _1233 = -_1157;
    float _1235 = -_1221;
    float _1237 = fma(_1131, _1233, _1235);
    float _1239 = _1237;
    if (_1171)
    {
        float _1241 = _1237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1183 = _1241;
    }
    float _1243 = _1183;
    float _1245 = _1243;
    if (!_1171)
    {
        _1211 = _1159;
    }
    float _1247 = _1211;
    float _1249 = _1217;
    float _1251 = _1247;
    if (_1171)
    {
        float _1253 = fma(_1217, _1243, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = _1255;
    if (_1171)
    {
        float _1259 = _1231 + (-1.0);
        _1225 = _1259;
    }
    float _1261 = _1225;
    if (_1171)
    {
        float _1263 = _1195 * _1255;
        _1185 = _1263;
    }
    float _1265 = _1185;
    if (!_1171)
    {
        _1257 = _1161;
    }
    float _1267 = _1257;
    float _1269 = _1267;
    if (_1171)
    {
        float _1271 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1271;
    }
    float _1273 = _1245;
    if (_1171)
    {
        float _1275 = _1159 * _1265;
        _1251 = _1275;
    }
    float _1277 = _1251;
    float _1279 = sqrt(_1151);
    if (!_1171)
    {
        _1199 = _1163;
    }
    float _1281 = _1199;
    float _1283 = _1281;
    if (_1171)
    {
        float _1285 = fma(_1237, _1231, _1273);
        _1239 = _1285;
    }
    float _1287 = _1239;
    if (_1171)
    {
        float _1289 = _1161 * _1265;
        _1269 = _1289;
    }
    float _1291 = _1269;
    if (_1171)
    {
        float _1293 = _1277 * _1277;
        _1283 = _1293;
    }
    float _1295 = _1283;
    if (!_1171)
    {
        _1187 = _1165;
    }
    float _1297 = _1187;
    float _1299 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1301 = _1297;
    if (_1171)
    {
        float _1303 = _1291 * _1291;
        _1301 = _1303;
    }
    float _1305 = _1301;
    float _1307 = fma(_1287, _1287, _1295);
    float _1309 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1299);
    float _1311 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1313 = _1307 + _1305;
    float _1315 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1309);
    float _1317 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1311);
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1321 = fma(_1279, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1319);
    float _1323 = precise::clamp(_1321, 0.0, 1.0);
    float _1325 = rsqrt(_1313);
    float _1327 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1329 = -_1323;
    float _1331 = _1329 + 1.0;
    float _1333 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1335 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    float _1337 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1339 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1333);
    float _1341 = abs(_1331);
    float _1343 = log2(_1341);
    float _1345 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1347 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1349 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1353 = fma(_861, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1355 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1325 * _1277;
    float _1359 = _1325 * _1287;
    float _1361 = floor(_1337);
    float _1363 = _1325 * _1291;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1369 = -_1347;
    float _1371 = fma(_1369, _1351, 1.0);
    float _1373 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1375 = -_1365;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1375);
    float _1379 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1367);
    float _1381 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1383 = floor(_1353);
    float _1385 = -_1363;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1377);
    float _1389 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1379);
    float _1391 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1373);
    float _1393 = fma(_1387, -0.5, 0.5);
    float _1395 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1397 = -_1361;
    float _1399 = _1337 + _1397;
    float _1401 = exp2(_1381);
    float _1403 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1405 = _1359 + 1.0;
    float _1407 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1391);
    float _1409 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1403);
    float _1411 = 1.0 / _1395;
    float _1413 = -_1383;
    float _1415 = _1353 + _1413;
    float _1417 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1419 = log2(_1371);
    float _1421 = sqrt(_1393);
    float _1423 = fma(_1387, 0.5, 0.5);
    float _1425 = -_1359;
    float _1427 = fma(_1401, _1405, _1425);
    float _1429 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1417);
    float _1431 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1407);
    float _1433 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _4370 = float2(_1399, _1415);
    float _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4370, float2(0.0), isnan(_4370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4370, float2(0.0), isnan(_4370)), level(0.0)).x;
    float _1437 = _1429 * _1411;
    float _1439 = _1419 * 0.693147182464599609375;
    float _1441 = fma(_1423, _1433, -0.212114393711090087890625);
    float _1443 = fma(_1427, 0.5, 0.5);
    float _1445 = fma(_1437, 0.5, 0.5);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1449 = fma(_1423, _1441, 1.570728778839111328125);
    float _1451 = _1431 * _1411;
    float _1453 = _1421 * 0.636619746685028076171875;
    float _1455 = fma(_1451, -0.5, 0.5);
    float _1457 = -_1449;
    float _1459 = fma(_1453, _1457, 1.0);
    float3 _4416 = float3(_1445, _1455, _1447);
    float _1461 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4416, float3(0.0), isnan(_4416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4416, float3(0.0), isnan(_4416)), level(0.0)).x;
    float3 _4427 = float3(_1445, _1455, _1447);
    float4 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).xyzw;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = _1464.w;
    float2 _4443 = float2(_1459, _1443);
    float3 _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4443, float2(0.0), isnan(_4443)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4443, float2(0.0), isnan(_4443)), level(0.0)).xyz;
    float _1478 = _1476.x;
    float _1480 = _1476.y;
    float _1482 = _1476.z;
    float _1484 = _897 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1486 = _897 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1488 = _459 > 0.5;
    float _1490 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1484);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1494 = _457 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1500 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1486);
    float _1502 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1490);
    float _1504 = 1.0 / _1498;
    float _1506 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1500);
    float _1508 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1510 = _461 > 0.5;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1512;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1518 = _465 > 0.5;
    float _1520 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1522 = 1.0 / _1508;
    float _1524 = _1516 + _1508;
    float _1526 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1520);
    out.m_64.x = _1125;
    out.m_64.y = _1123;
    out.m_64.z = _1127;
    bool _1528 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1530 = isnan(_457);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1542 = _1514 * _1504;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1546 = _1544 != 0;
    float _1548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1552 = _1550 != 0;
    float _1554 = fma(_1542, _1494, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1556 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1558 = isnan(_457);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1570 = _1568 != 0;
    float _1572 = _1524 * _1522;
    float _1574 = _1572 * 0.5;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1578 = _1576 != 0;
    float _1580 = -_1566;
    float _1582 = _1580 + 1.0;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1584);
    float _1588 = _1538 * _1582;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = -_1538;
    float _1594 = _1592 + 1.0;
    float _1596 = 1.0 / _1586;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1602 = _1554 * _1588;
    float _1604 = -_749;
    int _1606 = _1488 ? as_type<int>(_1604) : as_type<int>(_749);
    float _1608 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1610 = _463 > 0.5;
    float _1612 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1614 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1616 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1602);
    float _1618 = -_757;
    int _1620 = _1510 ? as_type<int>(_1618) : as_type<int>(_757);
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1624 = -_749;
    int _1626 = _1610 ? as_type<int>(_1624) : as_type<int>(_749);
    bool _1628 = !_1552;
    float _1630 = _1628 ? _757 : as_type<float>(_1620);
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1634 = _1596 * _1632;
    bool _1636 = !_1570;
    float _1638 = _1636 ? _749 : as_type<float>(_1626);
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1644 = -_1630;
    float _1646 = _1644 + 0.5;
    float _1648 = -_757;
    int _1650 = _1518 ? as_type<int>(_1648) : as_type<int>(_757);
    float _1652 = _1638 + 0.5;
    out.m_66.x = _1608;
    out.m_66.y = _1612;
    out.m_66.z = _1614;
    out.m_66.w = _1640;
    float _1654 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1656 = !_1546;
    float _1658 = _1656 ? _749 : as_type<float>(_1606);
    float _1660 = abs(_1634);
    float _1662 = log2(_1660);
    float _1664 = _1654 * _1548;
    bool _1666 = !_1578;
    float _1668 = _1666 ? _757 : as_type<float>(_1650);
    float _1670 = _1658 + 0.5;
    bool _1672 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1674 = isnan(_1279);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1680 = _1676 || _1678;
    float _1682 = -_1668;
    float _1684 = _1682 + 0.5;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1688 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1690 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1692 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1616);
    float _1694 = _1690 * _1622;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1698 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = exp2(_1698);
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1716 = _1688 * _1642;
    float _1718 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1720 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_68.x = _1706;
    out.m_68.y = _1712;
    out.m_68.z = _1708;
    out.m_68.w = _1702;
    float _1722 = _1714 * _1686;
    float _1724 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1726 = -_791;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1718);
    float _1730 = -_791;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1720);
    out.m_70.x = _1716;
    out.m_70.y = _1664;
    out.m_70.z = _1694;
    out.m_70.w = _1722;
    float _1734 = -_791;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1738 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1740 = _1634 <= 8000.0;
    bool _1742 = isnan(_1634);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(8000.0);
    bool _1748 = _1744 || _1746;
    float _1750 = float(_1748);
    float _1752 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1754 = precise::clamp(_1752, 0.0, 1.0);
    float _1756 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1738);
    float _1758 = _757 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1760 = fma(_1758, _1758, 1.0);
    float _1762 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1764 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1766 = _817 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1768 = _817 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1770 = rsqrt(_1760);
    float _1772 = _817 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1774 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1728);
    float _1776 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1762);
    float _1778 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1732);
    float _1780 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1764);
    float _1782 = fma(_1754, -2.0, 3.0);
    float _1784 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1766);
    float _1786 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1768);
    float _1788 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1772);
    float _1790 = _1754 * _1754;
    float _1792 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1776);
    float _1794 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1756);
    float _1796 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1780);
    float _1798 = _749 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1800 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1784);
    float _1802 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1786);
    float _1804 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1788);
    float _1806 = _1790 * _1782;
    float _1808 = _1758 * _1778;
    float _1810 = _1758 * _1770;
    float _1812 = _1758 * _1774;
    float _1814 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1736);
    out.m_72.x = _1792;
    out.m_72.y = _1794;
    out.m_72.z = _1796;
    float _1816 = -_1806;
    float _1818 = _1816 + 1.0;
    float _1820 = fma(_1798, _1794, _1808);
    float _1822 = fma(_1798, _1792, _1812);
    float _1824 = -_1802;
    float _1826 = _1810 * _1824;
    float _1828 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1806);
    float _1830 = -_1800;
    float _1832 = _1810 * _1830;
    float _1834 = fma(_1770, _1778, _1826);
    float _1836 = _1750 * _1828;
    float _1838 = fma(_1770, _1774, _1832);
    float _1840 = _1429 + _1395;
    float _1842 = -_1804;
    float _1844 = _1810 * _1842;
    float _1846 = _1758 * _1814;
    float _1848 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1540);
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1852 = fma(_1770, _1814, _1844);
    float _1854 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1856 = in.m_74.x;
    float _1858 = _1395 * 0.5;
    float _1860 = _1848 + _1395;
    float _1862 = exp2(_1854);
    float _1864 = fma(_1431, -0.5, _1858);
    float _1866 = _1860 * 0.5;
    float _1868 = _1840 * 0.5;
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1431;
    out.gl_Position.z = _1848;
    out.gl_Position.w = _1395;
    float _1870 = fma(_1798, _1796, _1846);
    float _1872 = _1800 + _1822;
    float _1874 = _1802 + _1820;
    out.m_76.x = _1868;
    out.m_76.y = _1864;
    out.m_76.z = _1866;
    out.m_76.w = _1395;
    float _1876 = _1804 + _1870;
    out.m_78.x = _1838;
    out.m_78.y = _1834;
    out.m_78.z = _1852;
    float _1878 = -_1862;
    float _1880 = _1878 + 1.0;
    out.m_80.x = _1872;
    out.m_80.y = _1874;
    out.m_80.z = _1876;
    float _1882 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1884 = _1395;
    float _1886 = _1848;
    float _1888 = _1431;
    float _1890 = _1838;
    float _1892 = _1882;
    if (!_1680)
    {
        _1884 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1894 = _1884;
    float _1896 = _1894;
    float _1898 = _1894;
    if (!_1680)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1900 = _1886;
    float _1902 = -_1882;
    float _1904 = _1902 + 1.0;
    float _1906 = _1904;
    float _1908 = _1900;
    float _1910 = _1900;
    if (!_1680)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1912 = _1888;
    float _1914 = _1912;
    float _1916 = _1912;
    if (!_1680)
    {
        _1890 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1918 = _1890;
    float _1920 = -_1435;
    float _1922 = _1920 + 1.0;
    float _1924 = _1922 * _1850;
    float _1926 = precise::clamp(_1924, 0.0, 1.0);
    float _1928 = -_1926;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1932 = _1930 * _1856;
    float _1934 = _1882 * _1461;
    float _1936 = _1932 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1938 = _1472 * _1904;
    float _1940 = _1918;
    float _1942 = _1918;
    if (!_1680)
    {
        _1892 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1944 = _1892;
    float _1946 = _1472 * _1934;
    float _1948 = _1482 * _1934;
    out.m_82.x = _1936;
    float _1950 = _1944;
    float _1952 = _1944;
    if (!_1680)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1954 = _1906;
    float _1956 = fma(_1478, _1946, _1466);
    float _1958 = fma(_1480, _1946, _1468);
    float _1960 = fma(_1472, _1948, _1470);
    out.m_84.x = _1956;
    out.m_84.y = _1958;
    out.m_84.z = _1960;
    out.m_84.w = _1938;
    bool _1962 = !_1680;
    float _1964 = _1954;
    float _1966 = _1954;
    if (!_1962)
    {
        bool _1968 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1970 = isnan(_1279);
        bool _1972 = _1968 || _1970;
        bool _1974 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1976 = _1972 || _1974;
        if (!_1976)
        {
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1980 = _1279 + _1978;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1984 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1990 = 1.0 / _1984;
            float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2008 = _1980 * _1990;
            float _2010 = precise::clamp(_2008, 0.0, 1.0);
            float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2016 = fma(_2010, _1988, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2018 = fma(_2010, _2014, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2020 = fma(_2010, _1994, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2022 = fma(_2010, _1998, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2024 = fma(_2010, _2002, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2026 = fma(_2010, _2006, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1942 = _2020;
            _1916 = _2024;
            _1952 = _2016;
            _1910 = _2022;
            _1898 = _2018;
            _1966 = _2026;
            _2028 = true;
        }
        else
        {
            bool _2030 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2032 = isnan(_1279);
            bool _2034 = _2030 || _2032;
            bool _2036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2038 = _2034 || _2036;
            if (!_2038)
            {
                _1950 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2040 = _1950;
            _1952 = _2040;
            if (!_2038)
            {
                _1940 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2042 = _1940;
            _1942 = _2042;
            if (!_2038)
            {
                _1896 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2044 = _1896;
            _1898 = _2044;
            if (!_2038)
            {
                _1908 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2046 = _1908;
            _1910 = _2046;
            if (!_2038)
            {
                _1914 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2048 = _1914;
            _1916 = _2048;
            if (!_2038)
            {
                _1964 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2050 = _1964;
            bool _2052 = !_2038;
            _1966 = _2050;
            if (!_2052)
            {
                bool _2054 = _1279 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2056 = isnan(_1279);
                bool _2058 = _2054 || _2056;
                bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2062 = _2058 || _2060;
                if (!_2062)
                {
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = _1279 + _2064;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2070 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2068;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2076 = 1.0 / _2070;
                    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2094 = _2066 * _2076;
                    float _2096 = precise::clamp(_2094, 0.0, 1.0);
                    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2102 = fma(_2096, _2074, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2104 = fma(_2096, _2100, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2106 = fma(_2096, _2080, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2108 = fma(_2096, _2084, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2110 = fma(_2096, _2088, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2112 = fma(_2096, _2092, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1942 = _2106;
                    _1916 = _2110;
                    _1952 = _2102;
                    _1910 = _2108;
                    _1898 = _2104;
                    _1966 = _2112;
                    _2028 = true;
                }
                else
                {
                    _1942 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1916 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1952 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1910 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1898 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1966 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2028 = false;
    float _2114 = _1942;
    float _2116 = _1916;
    float _2118 = _1952;
    float _2120 = _1910;
    float _2122 = _1898;
    float _2124 = _1966;
    float _2126 = fma(_1874, -0.5, 0.5);
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = -_2114;
    float _2132 = _2130 + _2116;
    float _2134 = -_2118;
    float _2136 = _2134 + _2120;
    float _2138 = -_2122;
    float _2140 = _2138 + _2124;
    bool _2142 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2144 = fma(_2128, _2132, _2114);
    float _2146 = fma(_2128, _2136, _2118);
    float _2148 = fma(_2128, _2140, _2122);
    float _2150 = _2144 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2152 = fma(_2146, 0.298911988735198974609375, _2150);
    float _2154 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2156 = fma(_2148, 0.114477999508380889892578125, _2152);
    out.m_49.x = _2154;
    float _2158 = -_2156;
    float _2160 = _2146 + _2158;
    float _2162 = -_2156;
    float _2164 = _2144 + _2162;
    float _2166 = -_2156;
    float _2168 = _2148 + _2166;
    float _2170 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2172 = fma(_2164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2174 = fma(_2168, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    out.m_88.x = _2170;
    out.m_88.y = _2172;
    out.m_88.z = _2174;
    if (!_2142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2176 = -_1123;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2180 = -_1125;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2184 = -_1127;
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2188 = _2178 * _2178;
    float _2190 = fma(_2182, _2182, _2188);
    float _2192 = fma(_2186, _2186, _2190);
    float _2194 = sqrt(_2192);
    float _2196 = rsqrt(_2192);
    float _2198 = -_2194;
    float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2202 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2204 = precise::clamp(_2202, 0.0, 1.0);
    float _2206 = _2182 * _2196;
    float _2208 = _2178 * _2196;
    float _2210 = abs(_2204);
    float _2212 = log2(_2210);
    float _2214 = _2186 * _2196;
    float _2216 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2218 = _1874 * _2208;
    float _2220 = -_2208;
    float _2222 = -_2216;
    float _2224 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2222);
    float _2226 = fma(_1872, _2206, _2218);
    float _2228 = -_2214;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2224);
    float _2232 = fma(_1876, _2214, _2226);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2238 = _2230 + _2236;
    float _2240 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2242 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = exp2(_2240);
    float _2248 = _2246 * _2244;
    float _2250 = _2234 * _2248;
    float _2252 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2254 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2256 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2252;
    out.m_86.y = _2254;
    out.m_86.z = _2256;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

