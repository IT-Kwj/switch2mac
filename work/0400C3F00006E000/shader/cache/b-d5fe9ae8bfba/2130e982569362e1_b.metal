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
    float4 m_58 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1577 = false;
    bool _1107 = false;
    bool _833 = false;
    bool _731 = false;
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2253 = as_type<float>(_107);
        out.gl_Position.z = _2253;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2322 = as_type<float>(_143);
        out.gl_Position.z = _2322;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_49.x;
    float _171 = in.m_49.y;
    float _173 = in.m_49.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _151;
    float _189 = _153;
    if (!_163)
    {
        float _191 = _153 * _153;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _175 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _195;
    if (!_163)
    {
        float _209 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = _197 * 6.283185482025146484375;
    float _215 = cos(_213);
    bool _217 = !_185;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = -_177;
    float _223 = _167 + _221;
    bool _225 = !_163;
    float _227 = _211;
    float _229 = _219;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _153 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _153);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _259;
    }
    float _261 = _227;
    bool _263 = !_163;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _153 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _189 = _283;
    }
    float _285 = _189;
    float _287 = in.m_56.w;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    float _297 = fma(_215, 0.5, 0.5);
    bool _299 = _223 < 0.5;
    float _301 = float(_299);
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = -_223;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _315 = !_291;
    int _317 = _315 ? 0 : 1;
    float _319 = -_297;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_201;
    int _325 = _323 ? 0 : 1;
    float _327 = fma(_285, _169, _313);
    bool _329 = !_295;
    int _331 = _329 ? 0 : 1;
    float _333 = -_301;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _337 = abs(_317);
    float _339 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _345 = abs(_331);
    float _347 = fma(_285, _171, _339);
    int _349 = abs(_325);
    float _351 = float(_337);
    float _353 = float(_349);
    float _355 = float(_345);
    float _357 = abs(_311);
    float _359 = _351 * _357;
    float _361 = fma(_285, _173, _343);
    float _363 = fma(_327, _287, _303);
    float _365 = fma(_347, _287, _305);
    float _367 = fma(_353, _321, _359);
    float _369 = fma(_361, _287, _307);
    float _371 = abs(_335);
    float _373 = fma(_355, _371, _367);
    bool _375 = !_341;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_91);
        float _397 = 1.0 / _395;
        float _399 = _125 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = _401 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _423 = 1.0 / _409;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _433 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_401);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = 1.0 / _413;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _449 = _401 + _447;
    float _451 = -_443;
    float _453 = _451 + 1.0;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _417;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _401 + _459;
    float _463 = _449 * _423;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _467 = _401 + _465;
    float _469 = _461 * _445;
    bool _471 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _473 = isnan(_401);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _421;
    bool _485 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_401);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_481;
    float _499 = _497 + 1.0;
    float _501 = _405 * _457;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _505 = _401 + _503;
    float _507 = 1.0 / _427;
    bool _509 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _511 = isnan(_401);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _495 * _453;
    float _523 = -_495;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = _519 * _499;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _431;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _541 = _401 + _539;
    float _543 = _467 * _483;
    bool _545 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_401);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = fma(_529, _501, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _559 = _541 * _507;
    bool _561 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _563 = isnan(_401);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _571 * _535;
    float _575 = -_571;
    float _577 = _575 + 1.0;
    float _579 = _505 * _537;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _585;
    float _589 = _443 * _577;
    bool _591 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _593 = isnan(_401);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = fma(_583, _463, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _609 = fma(_587, _463, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _611 = -_601;
    float _613 = _611 + 1.0;
    float _615 = _601 * _525;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _621 = -_555;
    float _623 = _621 + 1.0;
    float _625 = _555 * _613;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _627;
    float _631 = fma(_605, _469, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _637 = _607 * _625;
    float _639 = _609 * _625;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _645 = fma(_619, _469, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _647 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _639);
    float _651 = fma(_629, _501, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _653 = fma(_643, _543, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _655 = fma(_635, _543, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _657 = fma(_631, _615, _647);
    float _659 = fma(_645, _615, _649);
    float _661 = in.m_56.x;
    float _663 = in.m_56.y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _669;
    float _673 = fma(_651, _521, _657);
    float _675 = fma(_557, _521, _659);
    float _677 = fma(_667, _559, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _679 = fma(_671, _559, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = fma(_653, _589, _673);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _691 = fma(_655, _589, _675);
    float _693 = fma(_683, _579, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _695 = fma(_677, _573, _685);
    float _697 = fma(_689, _579, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _699 = fma(_679, _573, _691);
    float _701 = fma(_693, _531, _695);
    float _703 = fma(_697, _531, _699);
    float _705 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[149].x, _701);
    float _707 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[149].y, _703);
    float _709 = _705 * _661;
    float _711 = _707 * _663;
    bool _713 = !_455;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _717 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_91);
        float _735 = 1.0 / _733;
        float _737 = _125 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    bool _741 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _743 = isnan(_739);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _757 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _759 = isnan(_739);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _775 = _739 + _773;
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / _755;
    float _783 = _767 * _779;
    float _785 = -_767;
    float _787 = _785 + 1.0;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _795 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _771 * _781;
    float _801 = fma(_799, _775, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _803 = _801 * _783;
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[115].x, _803);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _809 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[116].x, _805);
    float _811 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _809 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _795;
    out.m_58.y = _811;
    out.m_58.z = _797;
    out.m_58.w = _813;
    bool _815 = !_791;
    float _831;
    if (!_815)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _819 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_91);
        float _837 = 1.0 / _835;
        float _839 = _125 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _845 = _841 + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _849 = _841 + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = _841 + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _863;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _871 = 1.0 / _857;
    bool _873 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _875 = isnan(_841);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = 1.0 / _861;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _889 = _841 + _887;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _893 = 1.0 / _869;
    float _895 = _853 * _871;
    bool _897 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _899 = isnan(_841);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = 1.0 / _865;
    float _911 = _845 * _885;
    float _913 = _889 * _893;
    bool _915 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _917 = isnan(_841);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _927;
    bool _931 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _933 = isnan(_841);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -_925;
    float _945 = _943 + 1.0;
    float _947 = fma(_929, _895, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _949 = _849 * _909;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _951;
    float _955 = _907 * _945;
    float _957 = -_907;
    float _959 = _957 + 1.0;
    float _961 = -_941;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _965;
    float _969 = fma(_953, _895, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _971 = fma(_967, _895, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _973 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _975 = isnan(_841);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = _941 * _959;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _999 = _983 * _963;
    float _1001 = -_983;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_989, _911, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1007 = fma(_997, _911, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1009 = fma(_993, _911, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1011 = _883 * _1003;
    float _1013 = -_883;
    float _1015 = _1013 + 1.0;
    float _1017 = _971 * _1011;
    float _1019 = _947 * _1011;
    float _1021 = _969 * _1011;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1023;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1017);
    float _1029 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1019);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1021);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1037;
    float _1041 = fma(_1005, _999, _1027);
    float _1043 = fma(_1009, _999, _1031);
    float _1045 = fma(_1007, _999, _1029);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1055 = fma(_1025, _949, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1057 = fma(_1035, _949, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1059 = fma(_1039, _949, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1063 = _1061 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1065 = fma(_1049, _913, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1067 = fma(_1053, _913, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1069 = fma(_1055, _985, _1041);
    float _1071 = fma(_1063, _913, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1073 = fma(_1057, _985, _1045);
    float _1075 = fma(_1059, _985, _1043);
    float _1077 = fma(_1065, _955, _1069);
    float _1079 = fma(_1067, _955, _1073);
    float _1081 = fma(_1071, _955, _1075);
    float _1083 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1077);
    float _1085 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1079);
    float _1087 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1081);
    bool _1089 = !_891;
    float _1105;
    if (!_1089)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1093 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _1097 = _1095 * _1091;
        float _1099 = floor(_1097);
        float _1101 = -_1099;
        float _1103 = _1097 + _1101;
        _1105 = _1103;
        _1107 = true;
    }
    else
    {
        float _1109 = float(_91);
        float _1111 = 1.0 / _1109;
        float _1113 = _125 * _1111;
        _1105 = _1113;
    }
    _1107 = false;
    float _1115 = _1105;
    float _1117 = in.m_60.x;
    float _1119 = in.m_60.y;
    float _1121 = in.m_60.z;
    float _1123 = in.m_60.w;
    float _1125 = in.m_62.x;
    float _1127 = in.m_62.y;
    float _1129 = in.m_62.z;
    float _1131 = in.m_62.w;
    bool _1133 = _145 > 0.5;
    float _1135 = precise::max((*spvDescriptorSet0.vp_c10)._m0[2].x, 20.0);
    float _1137 = in.m_64.x;
    float _1139 = in.m_64.y;
    float _1141 = in.m_64.z;
    float _1143 = in.m_64.w;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1151 = _1149 != 0;
    float _1153 = in.m_51.y;
    float _1155 = precise::min(_1135, 30.0);
    float _1157 = _365 * _1119;
    float _1159 = _365 * _1127;
    float _1161 = fma(_1155, -0.100000001490116119384765625, 3.0);
    float _1163 = fma(_363, _1117, _1157);
    float _1165 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1167 = _365 * _1139;
    float _1169 = _373 * _1161;
    float _1171 = fma(_363, _1125, _1159);
    float _1173 = -_205;
    int _1175 = _1133 ? as_type<int>(_1173) : as_type<int>(_205);
    float _1177 = fma(_363, _1137, _1167);
    float _1179 = _711 * _1169;
    float _1181 = _709 * _1169;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    bool _1185 = _1153 > 0.5;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1189 = fma(_369, _1141, _1177);
    bool _1191 = !_1147;
    float _1193 = _1191 ? _205 : as_type<float>(_1175);
    float _1195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1197 = _1181 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = _1187 * _1183;
    float _1201 = _1189 + _1143;
    float _1203 = fma(_369, _1129, _1171);
    float _1205 = _1197 * _1195;
    float _1207 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = fma(_369, _1121, _1163);
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1209);
    float _1221 = 1.0 / _1213;
    float _1223 = _1215 + _1123;
    float _1225 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1217);
    float _1227 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1231 = _1115 + _1229;
    float _1233 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1237;
    float _1241 = _1223 + _1233;
    float _1243 = _1201 + _1235;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1251 = _1241 + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1255 = _1243 + _1253;
    float _1257 = _1239 * _1221;
    bool _1259 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1261 = isnan(_1115);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = _1251 * _1251;
    float _1273 = _1255 * _1255;
    float _1275 = 1.0 / _1247;
    bool _1277 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = isnan(_1115);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1293 = _1271 + _1273;
    bool _1295 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_1115);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = fma(_1257, _1231, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1309 = -_1287;
    float _1311 = _1309 + 1.0;
    bool _1313 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1315 = isnan(_1115);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / _1291;
    float _1327 = -_1269;
    float _1329 = _1327 + 1.0;
    float _1331 = _1305 * _1311;
    float _1333 = -_1305;
    float _1335 = _1333 + 1.0;
    float _1337 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1339 = _1287 * _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1341;
    float _1345 = _1203 + _1131;
    float _1347 = sqrt(_1293);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1353 = _1323 * _1335;
    float _1355 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1337);
    float _1357 = -_1323;
    float _1359 = _1357 + 1.0;
    float _1361 = _1351 * _1275;
    float _1363 = _1307 * _1353;
    float _1365 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1355);
    float _1367 = _1343 * _1325;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1371 = _1115 + _1369;
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1363);
    float _1375 = -_219;
    float _1377 = _1185 ? _1375 : _219;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1381 = fma(_1361, _1371, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1383 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1387 = _1115 + _1385;
    bool _1389 = _1347 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = fma(_1381, _1331, _1373);
    float _1393 = _1345 + _1383;
    bool _1395 = !_1151;
    float _1397 = _1395 ? _219 : _1377;
    float _1399 = fma(_1367, _1387, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1401 = _1377;
    float _1403 = _1387;
    float _1405 = _1241;
    float _1407 = _1243;
    float _1409 = _1201;
    if (!_1389)
    {
        _1401 = _1273;
    }
    float _1411 = _1401;
    float _1413 = _1411;
    if (!_1389)
    {
        _229 = _1271;
    }
    float _1415 = _229;
    float _1417 = _1415;
    if (!_1389)
    {
        _1403 = _1393;
    }
    float _1419 = _1403;
    bool _1421 = !_1389;
    float _1423 = _1419;
    if (!_1421)
    {
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1429 = _1347 + _1427;
        float _1431 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = rsqrt(_1293);
        float _1435 = _1429 * _1425;
        float _1437 = _1435 * 0.15915493667125701904296875;
        float _1439 = _1437 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = _1437 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        float _1447 = fma(_1441, _1431, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1449 = _1433 * _1447;
        float _1451 = _1445 + (-1.0);
        float _1453 = fma(_1251, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1455 = fma(_1255, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1457 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1461 = _1453 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1465 = _1455 + _1463;
        float _1467 = fma(_1393, _1445, _1457);
        float _1469 = _1461 * _1461;
        float _1471 = _1465 * _1465;
        _1423 = _1467;
        _1417 = _1469;
        _1413 = _1471;
        _1405 = _1453;
        _1407 = _1455;
    }
    float _1473 = _1423;
    float _1475 = _1417;
    float _1477 = _1413;
    float _1479 = _1405;
    float _1481 = _1407;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1485 = _1473 + _1483;
    float _1487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1489 = _1193 + 0.5;
    float _1491 = fma(_1399, _1339, _1391);
    float _1493 = fma(_1485, _1485, _1475);
    float _1495 = -_1397;
    float _1497 = _1495 + 0.5;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1501 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1491);
    float _1503 = _1493 + _1477;
    float _1505 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1507 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1509 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1511 = _1087 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1513 = _1499 * _1379;
    float _1515 = sqrt(_1503);
    float _1517 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1507 * _1487;
    float _1523 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = _1501 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _1513;
    out.m_66.y = _1521;
    out.m_68.x = _1517;
    out.m_68.y = _1519;
    out.m_68.z = _1523;
    out.m_68.w = _1525;
    bool _1527 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1529 = isnan(_1515);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1535 = _1531 || _1533;
    float _1537 = _1499;
    float _1539 = _1513;
    float _1541 = _1525;
    if (!_1535)
    {
        _1537 = 1.0;
    }
    float _1543 = _1537;
    bool _1545 = !_1535;
    float _1547 = _1543;
    if (!_1545)
    {
        bool _1549 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1551 = isnan(_1515);
        bool _1553 = _1549 || _1551;
        bool _1555 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1557 = _1553 || _1555;
        if (!_1557)
        {
            float _1559 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1561 = _1515 + _1559;
            float _1563 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1565 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1563;
            float _1567 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1569 = _1567 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1571 = 1.0 / _1565;
            float _1573 = _1561 * _1571;
            float _1575 = fma(_1573, _1569, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1547 = _1575;
            _1577 = true;
        }
        else
        {
            bool _1579 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1581 = isnan(_1515);
            bool _1583 = _1579 || _1581;
            bool _1585 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1587 = _1583 || _1585;
            if (!_1587)
            {
                float _1589 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1591 = _1515 + _1589;
                float _1593 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1595 = _1593 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1599 = _1597 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1601 = 1.0 / _1595;
                float _1603 = _1591 * _1601;
                float _1605 = fma(_1603, _1599, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1547 = _1605;
                _1577 = true;
            }
            else
            {
                _1547 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1577 = false;
    float _1607 = _1547;
    float _1609 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1611 = _1479 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1615 = _1481 + _1613;
    bool _1617 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1619 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan(0.5);
    bool _1625 = _1621 || _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1629 = _1473 + _1627;
    float _1631 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1633 = fma(_1615, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1635 = fma(_1629, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1637 = _1629;
    float _1639 = _1607;
    if (_1625)
    {
        _1637 = _1631;
    }
    float _1641 = _1637;
    float _1643 = _1641;
    if (_1625)
    {
        _1539 = _1635;
    }
    float _1645 = _1539;
    float _1647 = _1645;
    if (_1625)
    {
        _1639 = _1633;
    }
    float _1649 = _1639;
    float _1651 = _1649;
    if (!_1625)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _1345 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _1223 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1655 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1667 = _1201 + _1665;
        float _1669 = fma(_1659, _1659, _1663);
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1673 = fma(_1667, _1667, _1669);
        float _1675 = sqrt(_1673);
        float _1677 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1679 = precise::min(_1675, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1681 = _1679 * _1671;
        float _1683 = -_1223;
        float _1685 = _1683 + _1631;
        float _1687 = -_1201;
        float _1689 = _1687 + _1633;
        float _1691 = _1677 * _1681;
        float _1693 = -_1345;
        float _1695 = _1693 + _1635;
        float _1697 = fma(_1685, _1691, _1223);
        float _1699 = fma(_1695, _1691, _1345);
        float _1701 = fma(_1689, _1691, _1201);
        _1647 = _1699;
        _1643 = _1697;
        _1651 = _1701;
    }
    float _1703 = _1647;
    float _1705 = _1643;
    float _1707 = _1651;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1703 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1705 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1707 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = fma(_1719, _1719, _1723);
    float _1727 = rsqrt(_1725);
    float _1729 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1731 = _1715 * _1729;
    float _1733 = _1719 * _1729;
    float _1735 = _1731 * _1731;
    float _1737 = _1733 * _1733;
    float _1739 = _1735 + _1737;
    float _1741 = sqrt(_1739);
    bool _1743 = _1741 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1747 = _1741 + _1745;
    float _1749 = _1515;
    float _1751 = _1739;
    float _1753 = _1747;
    float _1755 = _1711;
    float _1757 = _1729;
    float _1759 = _1731;
    if (_1743)
    {
        float _1761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1749 = _1761;
    }
    float _1763 = _1749;
    if (_1743)
    {
        float _1765 = rsqrt(_1739);
        _1751 = _1765;
    }
    float _1767 = _1751;
    float _1769 = _1763;
    if (_1743)
    {
        float _1771 = _1747 * _1763;
        _1753 = _1771;
    }
    float _1773 = _1753;
    if (_1743)
    {
        float _1775 = _1773 * 0.15915493667125701904296875;
        _1769 = _1775;
    }
    float _1777 = _1769;
    float _1779 = _1727;
    float _1781 = _1777;
    if (_1743)
    {
        float _1783 = _1777 * 6.283185482025146484375;
        float _1785 = sin(_1783);
        _1779 = _1785;
    }
    float _1787 = _1779;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1791 = precise::max(0.0, _1789);
    float _1793 = _1719;
    float _1795 = _1791;
    if (_1743)
    {
        float _1797 = _1777 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        _1793 = _1799;
    }
    float _1801 = _1793;
    float _1803 = -_1729;
    float _1805 = -_1791;
    float _1807 = fma(_1711, _1803, _1805);
    if (_1743)
    {
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1755 = _1809;
    }
    float _1811 = _1755;
    float _1813 = _1811;
    if (!_1743)
    {
        _1781 = _1735;
    }
    float _1815 = _1781;
    float _1817 = _1787;
    float _1819 = _1815;
    if (_1743)
    {
        float _1821 = fma(_1787, _1811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1813 = _1821;
    }
    float _1823 = _1813;
    float _1825 = _1823;
    if (!_1743)
    {
        _1817 = _1807;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    if (_1743)
    {
        float _1831 = _1801 + (-1.0);
        _1795 = _1831;
    }
    float _1833 = _1795;
    float _1835 = _1833;
    if (_1743)
    {
        float _1837 = _1767 * _1823;
        _1541 = _1837;
    }
    float _1839 = _1541;
    if (!_1743)
    {
        _1825 = _1733;
    }
    float _1841 = _1825;
    float _1843 = sqrt(_1725);
    float _1845 = _1841;
    if (_1743)
    {
        float _1847 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1757 = _1847;
    }
    float _1849 = _1757;
    if (_1743)
    {
        float _1851 = _1731 * _1839;
        _1759 = _1851;
    }
    float _1853 = _1759;
    if (_1743)
    {
        float _1855 = _1733 * _1839;
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (!_1743)
    {
        _1835 = _1737;
    }
    float _1859 = _1835;
    float _1861 = _1859;
    if (_1743)
    {
        float _1863 = fma(_1807, _1801, _1849);
        _1829 = _1863;
    }
    float _1865 = _1829;
    if (_1743)
    {
        float _1867 = _1853 * _1853;
        _1819 = _1867;
    }
    float _1869 = _1819;
    if (_1743)
    {
        float _1871 = _1857 * _1857;
        _1861 = _1871;
    }
    float _1873 = _1861;
    float _1875 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1877 = fma(_1865, _1865, _1869);
    float _1879 = _1877 + _1873;
    float _1881 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1885 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1883);
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = rsqrt(_1879);
    float _1891 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1893 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1895 = -_1887;
    float _1897 = _1895 + 1.0;
    float _1899 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1901 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1891);
    float _1903 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1893);
    float _1905 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1909 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1899);
    float _1911 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1903);
    float _1913 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1915 = abs(_1897);
    float _1917 = log2(_1915);
    float _1919 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1909);
    float _1921 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1923 = _1889 * _1853;
    float _1925 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1913);
    float _1927 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1929 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1931 = _1889 * _1865;
    float _1933 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1935 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1937 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1929);
    float _1939 = _1889 * _1857;
    float _1941 = -_1933;
    float _1943 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1941);
    float _1945 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1947 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1937);
    float _1949 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = -_1939;
    float _1953 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1943);
    float _1955 = -_1945;
    float _1957 = fma(_1955, _1875, 1.0);
    float _1959 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1947);
    float _1961 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = fma(_1953, -0.5, 0.5);
    float _1965 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1967 = 1.0 / _1959;
    float _1969 = fma(_1953, 0.5, 0.5);
    float _1971 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1973 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1965);
    float _1975 = _1931 + 1.0;
    float _1977 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1971);
    float _1979 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1973);
    float _1981 = log2(_1957);
    float _1983 = fma(_1969, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1985 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1977);
    float _1987 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1979);
    float _1989 = fma(_1969, _1983, -0.212114393711090087890625);
    float _1991 = exp2(_1961);
    float _1993 = _1987 * _1967;
    float _1995 = _1985 * _1967;
    float _1997 = fma(_1969, _1989, 1.570728778839111328125);
    float _1999 = fma(_1993, 0.5, 0.5);
    float _2001 = fma(_1995, -0.5, 0.5);
    float _2003 = sqrt(_1963);
    float _2005 = _1981 * 0.693147182464599609375;
    float _2007 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2009 = -_1931;
    float _2011 = fma(_1991, _1975, _2009);
    float3 _5316 = float3(_1999, _2001, _2007);
    float _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5316, float3(0.0), isnan(_5316)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5316, float3(0.0), isnan(_5316)), level(0.0)).x;
    float3 _5327 = float3(_1999, _2001, _2007);
    float4 _2016 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5327, float3(0.0), isnan(_5327)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5327, float3(0.0), isnan(_5327)), level(0.0)).xyzw;
    float _2018 = _2016.x;
    float _2020 = _2016.y;
    float _2022 = _2016.z;
    float _2024 = _2016.w;
    float _2026 = fma(_2011, 0.5, 0.5);
    float _2028 = _2003 * 0.636619746685028076171875;
    float _2030 = -_1997;
    float _2032 = fma(_2028, _2030, 1.0);
    float2 _5354 = float2(_2032, _2026);
    float3 _2036 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5354, float2(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5354, float2(0.0), isnan(_5354)), level(0.0)).xyz;
    float _2038 = _2036.x;
    float _2040 = _2036.y;
    float _2042 = _2036.z;
    float _2044 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2046 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2048 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2050 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2044);
    float _2052 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2048);
    float _2054 = exp2(_2046);
    float _2056 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2050);
    float _2058 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2060 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2052);
    float _2062 = _1959 * 0.5;
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2066 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2058);
    float _2068 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    float _2070 = 1.0 / _2064;
    bool _2072 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.5);
    bool _2080 = _2076 || _2078;
    float _2082 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2066);
    float _2084 = fma(_1985, -0.5, _2062);
    float _2086 = _2068 + _1959;
    out.gl_Position.x = _1987;
    out.gl_Position.y = _1985;
    out.gl_Position.z = _2068;
    out.gl_Position.w = _1959;
    float _2088 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2090 = -_2054;
    float _2092 = _2090 + 1.0;
    float _2094 = _2086 * 0.5;
    float _2096 = _2088 + _2064;
    float _2098 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2100 = _2064;
    float _2102 = _1917;
    if (!_2080)
    {
        _1409 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2104 = _1409;
    float _2106 = -_2098;
    float _2108 = _2106 + 1.0;
    float _2110 = _2096 * _2070;
    float _2112 = _2110 * 0.5;
    float _2114 = _2104;
    float _2116 = _2112;
    float _2118 = _2070;
    if (_2080)
    {
        _2100 = 1.0;
    }
    float _2120 = _2100;
    float _2122 = _2120;
    if (!_2080)
    {
        float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2126 = fma(_2112, _2104, _2124);
        _2114 = _2126;
    }
    float _2128 = _2114;
    if (!_2080)
    {
        _2116 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2130 = _2116;
    if (!_2080)
    {
        float _2132 = -_2130;
        float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2118 = _2134;
    }
    float _2136 = _2118;
    float _2138 = _2128;
    if (!_2080)
    {
        float _2140 = 1.0 / _2128;
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = _2136;
    if (!_2080)
    {
        float _2146 = 1.0 / _2136;
        _2144 = _2146;
    }
    float _2148 = _2144;
    if (!_2080)
    {
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2152 = -_2130;
        float _2154 = fma(_2142, _2150, _2152);
        _2102 = _2154;
    }
    float _2156 = _2102;
    float _2158 = _1987 + _1959;
    float _2160 = _2158 * 0.5;
    if (!_2080)
    {
        float _2162 = _2156 * _2148;
        float _2164 = precise::clamp(_2162, 0.0, 1.0);
        _2122 = _2164;
    }
    float _2166 = _2122;
    out.m_70.x = _2160;
    out.m_70.y = _2084;
    out.m_70.z = _2094;
    out.m_70.w = _1959;
    float _2168 = _2166 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2170 = _2166 > 0.0;
    bool _2172 = isnan(_2166);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2168 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2180;
    float _2182 = _2098 * _2013;
    float _2184 = _2024 * _2108;
    float _2186 = _2024 * _2182;
    float _2188 = _2042 * _2182;
    float _2190 = fma(_2038, _2186, _2018);
    float _2192 = fma(_2040, _2186, _2020);
    float _2194 = fma(_2024, _2188, _2022);
    out.m_72.x = _2190;
    out.m_72.y = _2192;
    out.m_72.z = _2194;
    out.m_72.w = _2184;
    if (_2178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2196 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2196;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1577 = false;
    bool _1107 = false;
    bool _833 = false;
    bool _731 = false;
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2253 = as_type<float>(_107);
        out.gl_Position.z = _2253;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2322 = as_type<float>(_143);
        out.gl_Position.z = _2322;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_49.x;
    float _171 = in.m_49.y;
    float _173 = in.m_49.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _151;
    float _189 = _153;
    if (!_163)
    {
        float _191 = _153 * _153;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _175 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _195;
    if (!_163)
    {
        float _209 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = _197 * 6.283185482025146484375;
    float _215 = cos(_213);
    bool _217 = !_185;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = -_177;
    float _223 = _167 + _221;
    bool _225 = !_163;
    float _227 = _211;
    float _229 = _219;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _153 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _153);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _259;
    }
    float _261 = _227;
    bool _263 = !_163;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _153 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _189 = _283;
    }
    float _285 = _189;
    float _287 = in.m_56.w;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    float _297 = fma(_215, 0.5, 0.5);
    bool _299 = _223 < 0.5;
    float _301 = float(_299);
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = -_223;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _315 = !_291;
    int _317 = _315 ? 0 : 1;
    float _319 = -_297;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_201;
    int _325 = _323 ? 0 : 1;
    float _327 = fma(_285, _169, _313);
    bool _329 = !_295;
    int _331 = _329 ? 0 : 1;
    float _333 = -_301;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _337 = abs(_317);
    float _339 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _345 = abs(_331);
    float _347 = fma(_285, _171, _339);
    int _349 = abs(_325);
    float _351 = float(_337);
    float _353 = float(_349);
    float _355 = float(_345);
    float _357 = abs(_311);
    float _359 = _351 * _357;
    float _361 = fma(_285, _173, _343);
    float _363 = fma(_327, _287, _303);
    float _365 = fma(_347, _287, _305);
    float _367 = fma(_353, _321, _359);
    float _369 = fma(_361, _287, _307);
    float _371 = abs(_335);
    float _373 = fma(_355, _371, _367);
    bool _375 = !_341;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_91);
        float _397 = 1.0 / _395;
        float _399 = _125 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = _401 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _423 = 1.0 / _409;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _433 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_401);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = 1.0 / _413;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _449 = _401 + _447;
    float _451 = -_443;
    float _453 = _451 + 1.0;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _417;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _401 + _459;
    float _463 = _449 * _423;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _467 = _401 + _465;
    float _469 = _461 * _445;
    bool _471 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _473 = isnan(_401);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _421;
    bool _485 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_401);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_481;
    float _499 = _497 + 1.0;
    float _501 = _405 * _457;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _505 = _401 + _503;
    float _507 = 1.0 / _427;
    bool _509 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _511 = isnan(_401);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _495 * _453;
    float _523 = -_495;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = _519 * _499;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _431;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _541 = _401 + _539;
    float _543 = _467 * _483;
    bool _545 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_401);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = fma(_529, _501, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _559 = _541 * _507;
    bool _561 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _563 = isnan(_401);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _571 * _535;
    float _575 = -_571;
    float _577 = _575 + 1.0;
    float _579 = _505 * _537;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _585;
    float _589 = _443 * _577;
    bool _591 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _593 = isnan(_401);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = fma(_583, _463, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _609 = fma(_587, _463, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _611 = -_601;
    float _613 = _611 + 1.0;
    float _615 = _601 * _525;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _621 = -_555;
    float _623 = _621 + 1.0;
    float _625 = _555 * _613;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _627;
    float _631 = fma(_605, _469, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _637 = _607 * _625;
    float _639 = _609 * _625;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _645 = fma(_619, _469, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _647 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _639);
    float _651 = fma(_629, _501, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _653 = fma(_643, _543, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _655 = fma(_635, _543, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _657 = fma(_631, _615, _647);
    float _659 = fma(_645, _615, _649);
    float _661 = in.m_56.x;
    float _663 = in.m_56.y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _669;
    float _673 = fma(_651, _521, _657);
    float _675 = fma(_557, _521, _659);
    float _677 = fma(_667, _559, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _679 = fma(_671, _559, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = fma(_653, _589, _673);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _691 = fma(_655, _589, _675);
    float _693 = fma(_683, _579, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _695 = fma(_677, _573, _685);
    float _697 = fma(_689, _579, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _699 = fma(_679, _573, _691);
    float _701 = fma(_693, _531, _695);
    float _703 = fma(_697, _531, _699);
    float _705 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[149].x, _701);
    float _707 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[149].y, _703);
    float _709 = _705 * _661;
    float _711 = _707 * _663;
    bool _713 = !_455;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _717 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_91);
        float _735 = 1.0 / _733;
        float _737 = _125 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    bool _741 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _743 = isnan(_739);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _757 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _759 = isnan(_739);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _775 = _739 + _773;
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / _755;
    float _783 = _767 * _779;
    float _785 = -_767;
    float _787 = _785 + 1.0;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _795 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _771 * _781;
    float _801 = fma(_799, _775, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _803 = _801 * _783;
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[115].x, _803);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _809 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[116].x, _805);
    float _811 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _809 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _795;
    out.m_58.y = _811;
    out.m_58.z = _797;
    out.m_58.w = _813;
    bool _815 = !_791;
    float _831;
    if (!_815)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _819 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_91);
        float _837 = 1.0 / _835;
        float _839 = _125 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _845 = _841 + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _849 = _841 + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = _841 + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _863;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _871 = 1.0 / _857;
    bool _873 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _875 = isnan(_841);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = 1.0 / _861;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _889 = _841 + _887;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _893 = 1.0 / _869;
    float _895 = _853 * _871;
    bool _897 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _899 = isnan(_841);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = 1.0 / _865;
    float _911 = _845 * _885;
    float _913 = _889 * _893;
    bool _915 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _917 = isnan(_841);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _927;
    bool _931 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _933 = isnan(_841);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -_925;
    float _945 = _943 + 1.0;
    float _947 = fma(_929, _895, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _949 = _849 * _909;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _951;
    float _955 = _907 * _945;
    float _957 = -_907;
    float _959 = _957 + 1.0;
    float _961 = -_941;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _965;
    float _969 = fma(_953, _895, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _971 = fma(_967, _895, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _973 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _975 = isnan(_841);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = _941 * _959;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _999 = _983 * _963;
    float _1001 = -_983;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_989, _911, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1007 = fma(_997, _911, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1009 = fma(_993, _911, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1011 = _883 * _1003;
    float _1013 = -_883;
    float _1015 = _1013 + 1.0;
    float _1017 = _971 * _1011;
    float _1019 = _947 * _1011;
    float _1021 = _969 * _1011;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1023;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1017);
    float _1029 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1019);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1021);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1037;
    float _1041 = fma(_1005, _999, _1027);
    float _1043 = fma(_1009, _999, _1031);
    float _1045 = fma(_1007, _999, _1029);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1055 = fma(_1025, _949, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1057 = fma(_1035, _949, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1059 = fma(_1039, _949, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1063 = _1061 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1065 = fma(_1049, _913, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1067 = fma(_1053, _913, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1069 = fma(_1055, _985, _1041);
    float _1071 = fma(_1063, _913, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1073 = fma(_1057, _985, _1045);
    float _1075 = fma(_1059, _985, _1043);
    float _1077 = fma(_1065, _955, _1069);
    float _1079 = fma(_1067, _955, _1073);
    float _1081 = fma(_1071, _955, _1075);
    float _1083 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1077);
    float _1085 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1079);
    float _1087 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1081);
    bool _1089 = !_891;
    float _1105;
    if (!_1089)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1093 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _1097 = _1095 * _1091;
        float _1099 = floor(_1097);
        float _1101 = -_1099;
        float _1103 = _1097 + _1101;
        _1105 = _1103;
        _1107 = true;
    }
    else
    {
        float _1109 = float(_91);
        float _1111 = 1.0 / _1109;
        float _1113 = _125 * _1111;
        _1105 = _1113;
    }
    _1107 = false;
    float _1115 = _1105;
    float _1117 = in.m_60.x;
    float _1119 = in.m_60.y;
    float _1121 = in.m_60.z;
    float _1123 = in.m_60.w;
    float _1125 = in.m_62.x;
    float _1127 = in.m_62.y;
    float _1129 = in.m_62.z;
    float _1131 = in.m_62.w;
    bool _1133 = _145 > 0.5;
    float _1135 = precise::max((*spvDescriptorSet0.vp_c10)._m0[2].x, 20.0);
    float _1137 = in.m_64.x;
    float _1139 = in.m_64.y;
    float _1141 = in.m_64.z;
    float _1143 = in.m_64.w;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1151 = _1149 != 0;
    float _1153 = in.m_51.y;
    float _1155 = precise::min(_1135, 30.0);
    float _1157 = _365 * _1119;
    float _1159 = _365 * _1127;
    float _1161 = fma(_1155, -0.100000001490116119384765625, 3.0);
    float _1163 = fma(_363, _1117, _1157);
    float _1165 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1167 = _365 * _1139;
    float _1169 = _373 * _1161;
    float _1171 = fma(_363, _1125, _1159);
    float _1173 = -_205;
    int _1175 = _1133 ? as_type<int>(_1173) : as_type<int>(_205);
    float _1177 = fma(_363, _1137, _1167);
    float _1179 = _711 * _1169;
    float _1181 = _709 * _1169;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    bool _1185 = _1153 > 0.5;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1189 = fma(_369, _1141, _1177);
    bool _1191 = !_1147;
    float _1193 = _1191 ? _205 : as_type<float>(_1175);
    float _1195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1197 = _1181 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = _1187 * _1183;
    float _1201 = _1189 + _1143;
    float _1203 = fma(_369, _1129, _1171);
    float _1205 = _1197 * _1195;
    float _1207 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = fma(_369, _1121, _1163);
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1209);
    float _1221 = 1.0 / _1213;
    float _1223 = _1215 + _1123;
    float _1225 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1217);
    float _1227 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1231 = _1115 + _1229;
    float _1233 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1237;
    float _1241 = _1223 + _1233;
    float _1243 = _1201 + _1235;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1251 = _1241 + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1255 = _1243 + _1253;
    float _1257 = _1239 * _1221;
    bool _1259 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1261 = isnan(_1115);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = _1251 * _1251;
    float _1273 = _1255 * _1255;
    float _1275 = 1.0 / _1247;
    bool _1277 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = isnan(_1115);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1293 = _1271 + _1273;
    bool _1295 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_1115);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = fma(_1257, _1231, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1309 = -_1287;
    float _1311 = _1309 + 1.0;
    bool _1313 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1315 = isnan(_1115);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / _1291;
    float _1327 = -_1269;
    float _1329 = _1327 + 1.0;
    float _1331 = _1305 * _1311;
    float _1333 = -_1305;
    float _1335 = _1333 + 1.0;
    float _1337 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1339 = _1287 * _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1341;
    float _1345 = _1203 + _1131;
    float _1347 = sqrt(_1293);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1353 = _1323 * _1335;
    float _1355 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1337);
    float _1357 = -_1323;
    float _1359 = _1357 + 1.0;
    float _1361 = _1351 * _1275;
    float _1363 = _1307 * _1353;
    float _1365 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1355);
    float _1367 = _1343 * _1325;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1371 = _1115 + _1369;
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1363);
    float _1375 = -_219;
    float _1377 = _1185 ? _1375 : _219;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1381 = fma(_1361, _1371, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1383 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1387 = _1115 + _1385;
    bool _1389 = _1347 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = fma(_1381, _1331, _1373);
    float _1393 = _1345 + _1383;
    bool _1395 = !_1151;
    float _1397 = _1395 ? _219 : _1377;
    float _1399 = fma(_1367, _1387, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1401 = _1377;
    float _1403 = _1387;
    float _1405 = _1241;
    float _1407 = _1243;
    float _1409 = _1201;
    if (!_1389)
    {
        _1401 = _1273;
    }
    float _1411 = _1401;
    float _1413 = _1411;
    if (!_1389)
    {
        _229 = _1271;
    }
    float _1415 = _229;
    float _1417 = _1415;
    if (!_1389)
    {
        _1403 = _1393;
    }
    float _1419 = _1403;
    bool _1421 = !_1389;
    float _1423 = _1419;
    if (!_1421)
    {
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1429 = _1347 + _1427;
        float _1431 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = rsqrt(_1293);
        float _1435 = _1429 * _1425;
        float _1437 = _1435 * 0.15915493667125701904296875;
        float _1439 = _1437 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = _1437 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        float _1447 = fma(_1441, _1431, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1449 = _1433 * _1447;
        float _1451 = _1445 + (-1.0);
        float _1453 = fma(_1251, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1455 = fma(_1255, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1457 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1461 = _1453 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1465 = _1455 + _1463;
        float _1467 = fma(_1393, _1445, _1457);
        float _1469 = _1461 * _1461;
        float _1471 = _1465 * _1465;
        _1423 = _1467;
        _1417 = _1469;
        _1413 = _1471;
        _1405 = _1453;
        _1407 = _1455;
    }
    float _1473 = _1423;
    float _1475 = _1417;
    float _1477 = _1413;
    float _1479 = _1405;
    float _1481 = _1407;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1485 = _1473 + _1483;
    float _1487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1489 = _1193 + 0.5;
    float _1491 = fma(_1399, _1339, _1391);
    float _1493 = fma(_1485, _1485, _1475);
    float _1495 = -_1397;
    float _1497 = _1495 + 0.5;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1501 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1491);
    float _1503 = _1493 + _1477;
    float _1505 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1507 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1509 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1511 = _1087 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1513 = _1499 * _1379;
    float _1515 = sqrt(_1503);
    float _1517 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1507 * _1487;
    float _1523 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = _1501 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _1513;
    out.m_66.y = _1521;
    out.m_68.x = _1517;
    out.m_68.y = _1519;
    out.m_68.z = _1523;
    out.m_68.w = _1525;
    bool _1527 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1529 = isnan(_1515);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1535 = _1531 || _1533;
    float _1537 = _1499;
    float _1539 = _1513;
    float _1541 = _1525;
    if (!_1535)
    {
        _1537 = 1.0;
    }
    float _1543 = _1537;
    bool _1545 = !_1535;
    float _1547 = _1543;
    if (!_1545)
    {
        bool _1549 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1551 = isnan(_1515);
        bool _1553 = _1549 || _1551;
        bool _1555 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1557 = _1553 || _1555;
        if (!_1557)
        {
            float _1559 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1561 = _1515 + _1559;
            float _1563 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1565 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1563;
            float _1567 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1569 = _1567 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1571 = 1.0 / _1565;
            float _1573 = _1561 * _1571;
            float _1575 = fma(_1573, _1569, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1547 = _1575;
            _1577 = true;
        }
        else
        {
            bool _1579 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1581 = isnan(_1515);
            bool _1583 = _1579 || _1581;
            bool _1585 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1587 = _1583 || _1585;
            if (!_1587)
            {
                float _1589 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1591 = _1515 + _1589;
                float _1593 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1595 = _1593 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1599 = _1597 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1601 = 1.0 / _1595;
                float _1603 = _1591 * _1601;
                float _1605 = fma(_1603, _1599, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1547 = _1605;
                _1577 = true;
            }
            else
            {
                _1547 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1577 = false;
    float _1607 = _1547;
    float _1609 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1611 = _1479 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1615 = _1481 + _1613;
    bool _1617 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1619 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan(0.5);
    bool _1625 = _1621 || _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1629 = _1473 + _1627;
    float _1631 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1633 = fma(_1615, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1635 = fma(_1629, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1637 = _1629;
    float _1639 = _1607;
    if (_1625)
    {
        _1637 = _1631;
    }
    float _1641 = _1637;
    float _1643 = _1641;
    if (_1625)
    {
        _1539 = _1635;
    }
    float _1645 = _1539;
    float _1647 = _1645;
    if (_1625)
    {
        _1639 = _1633;
    }
    float _1649 = _1639;
    float _1651 = _1649;
    if (!_1625)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _1345 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _1223 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1655 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1667 = _1201 + _1665;
        float _1669 = fma(_1659, _1659, _1663);
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1673 = fma(_1667, _1667, _1669);
        float _1675 = sqrt(_1673);
        float _1677 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1679 = precise::min(_1675, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1681 = _1679 * _1671;
        float _1683 = -_1223;
        float _1685 = _1683 + _1631;
        float _1687 = -_1201;
        float _1689 = _1687 + _1633;
        float _1691 = _1677 * _1681;
        float _1693 = -_1345;
        float _1695 = _1693 + _1635;
        float _1697 = fma(_1685, _1691, _1223);
        float _1699 = fma(_1695, _1691, _1345);
        float _1701 = fma(_1689, _1691, _1201);
        _1647 = _1699;
        _1643 = _1697;
        _1651 = _1701;
    }
    float _1703 = _1647;
    float _1705 = _1643;
    float _1707 = _1651;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1703 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1705 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1707 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = fma(_1719, _1719, _1723);
    float _1727 = rsqrt(_1725);
    float _1729 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1731 = _1715 * _1729;
    float _1733 = _1719 * _1729;
    float _1735 = _1731 * _1731;
    float _1737 = _1733 * _1733;
    float _1739 = _1735 + _1737;
    float _1741 = sqrt(_1739);
    bool _1743 = _1741 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1747 = _1741 + _1745;
    float _1749 = _1515;
    float _1751 = _1739;
    float _1753 = _1747;
    float _1755 = _1711;
    float _1757 = _1729;
    float _1759 = _1731;
    if (_1743)
    {
        float _1761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1749 = _1761;
    }
    float _1763 = _1749;
    if (_1743)
    {
        float _1765 = rsqrt(_1739);
        _1751 = _1765;
    }
    float _1767 = _1751;
    float _1769 = _1763;
    if (_1743)
    {
        float _1771 = _1747 * _1763;
        _1753 = _1771;
    }
    float _1773 = _1753;
    if (_1743)
    {
        float _1775 = _1773 * 0.15915493667125701904296875;
        _1769 = _1775;
    }
    float _1777 = _1769;
    float _1779 = _1727;
    float _1781 = _1777;
    if (_1743)
    {
        float _1783 = _1777 * 6.283185482025146484375;
        float _1785 = sin(_1783);
        _1779 = _1785;
    }
    float _1787 = _1779;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1791 = precise::max(0.0, _1789);
    float _1793 = _1719;
    float _1795 = _1791;
    if (_1743)
    {
        float _1797 = _1777 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        _1793 = _1799;
    }
    float _1801 = _1793;
    float _1803 = -_1729;
    float _1805 = -_1791;
    float _1807 = fma(_1711, _1803, _1805);
    if (_1743)
    {
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1755 = _1809;
    }
    float _1811 = _1755;
    float _1813 = _1811;
    if (!_1743)
    {
        _1781 = _1735;
    }
    float _1815 = _1781;
    float _1817 = _1787;
    float _1819 = _1815;
    if (_1743)
    {
        float _1821 = fma(_1787, _1811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1813 = _1821;
    }
    float _1823 = _1813;
    float _1825 = _1823;
    if (!_1743)
    {
        _1817 = _1807;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    if (_1743)
    {
        float _1831 = _1801 + (-1.0);
        _1795 = _1831;
    }
    float _1833 = _1795;
    float _1835 = _1833;
    if (_1743)
    {
        float _1837 = _1767 * _1823;
        _1541 = _1837;
    }
    float _1839 = _1541;
    if (!_1743)
    {
        _1825 = _1733;
    }
    float _1841 = _1825;
    float _1843 = sqrt(_1725);
    float _1845 = _1841;
    if (_1743)
    {
        float _1847 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1757 = _1847;
    }
    float _1849 = _1757;
    if (_1743)
    {
        float _1851 = _1731 * _1839;
        _1759 = _1851;
    }
    float _1853 = _1759;
    if (_1743)
    {
        float _1855 = _1733 * _1839;
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (!_1743)
    {
        _1835 = _1737;
    }
    float _1859 = _1835;
    float _1861 = _1859;
    if (_1743)
    {
        float _1863 = fma(_1807, _1801, _1849);
        _1829 = _1863;
    }
    float _1865 = _1829;
    if (_1743)
    {
        float _1867 = _1853 * _1853;
        _1819 = _1867;
    }
    float _1869 = _1819;
    if (_1743)
    {
        float _1871 = _1857 * _1857;
        _1861 = _1871;
    }
    float _1873 = _1861;
    float _1875 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1877 = fma(_1865, _1865, _1869);
    float _1879 = _1877 + _1873;
    float _1881 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1885 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1883);
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = rsqrt(_1879);
    float _1891 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1893 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1895 = -_1887;
    float _1897 = _1895 + 1.0;
    float _1899 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1901 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1891);
    float _1903 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1893);
    float _1905 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1909 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1899);
    float _1911 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1903);
    float _1913 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1915 = abs(_1897);
    float _1917 = log2(_1915);
    float _1919 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1909);
    float _1921 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1923 = _1889 * _1853;
    float _1925 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1913);
    float _1927 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1929 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1931 = _1889 * _1865;
    float _1933 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1935 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1937 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1929);
    float _1939 = _1889 * _1857;
    float _1941 = -_1933;
    float _1943 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1941);
    float _1945 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1947 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1937);
    float _1949 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = -_1939;
    float _1953 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1943);
    float _1955 = -_1945;
    float _1957 = fma(_1955, _1875, 1.0);
    float _1959 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1947);
    float _1961 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = fma(_1953, -0.5, 0.5);
    float _1965 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1967 = 1.0 / _1959;
    float _1969 = fma(_1953, 0.5, 0.5);
    float _1971 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1973 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1965);
    float _1975 = _1931 + 1.0;
    float _1977 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1971);
    float _1979 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1973);
    float _1981 = log2(_1957);
    float _1983 = fma(_1969, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1985 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1977);
    float _1987 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1979);
    float _1989 = fma(_1969, _1983, -0.212114393711090087890625);
    float _1991 = exp2(_1961);
    float _1993 = _1987 * _1967;
    float _1995 = _1985 * _1967;
    float _1997 = fma(_1969, _1989, 1.570728778839111328125);
    float _1999 = fma(_1993, 0.5, 0.5);
    float _2001 = fma(_1995, -0.5, 0.5);
    float _2003 = sqrt(_1963);
    float _2005 = _1981 * 0.693147182464599609375;
    float _2007 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2009 = -_1931;
    float _2011 = fma(_1991, _1975, _2009);
    float3 _5316 = float3(_1999, _2001, _2007);
    float _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5316, float3(0.0), isnan(_5316)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5316, float3(0.0), isnan(_5316)), level(0.0)).x;
    float3 _5327 = float3(_1999, _2001, _2007);
    float4 _2016 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5327, float3(0.0), isnan(_5327)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5327, float3(0.0), isnan(_5327)), level(0.0)).xyzw;
    float _2018 = _2016.x;
    float _2020 = _2016.y;
    float _2022 = _2016.z;
    float _2024 = _2016.w;
    float _2026 = fma(_2011, 0.5, 0.5);
    float _2028 = _2003 * 0.636619746685028076171875;
    float _2030 = -_1997;
    float _2032 = fma(_2028, _2030, 1.0);
    float2 _5354 = float2(_2032, _2026);
    float3 _2036 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5354, float2(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5354, float2(0.0), isnan(_5354)), level(0.0)).xyz;
    float _2038 = _2036.x;
    float _2040 = _2036.y;
    float _2042 = _2036.z;
    float _2044 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2046 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2048 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2050 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2044);
    float _2052 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2048);
    float _2054 = exp2(_2046);
    float _2056 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2050);
    float _2058 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2060 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2052);
    float _2062 = _1959 * 0.5;
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2066 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2058);
    float _2068 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    float _2070 = 1.0 / _2064;
    bool _2072 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.5);
    bool _2080 = _2076 || _2078;
    float _2082 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2066);
    float _2084 = fma(_1985, -0.5, _2062);
    float _2086 = _2068 + _1959;
    out.gl_Position.x = _1987;
    out.gl_Position.y = _1985;
    out.gl_Position.z = _2068;
    out.gl_Position.w = _1959;
    float _2088 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2090 = -_2054;
    float _2092 = _2090 + 1.0;
    float _2094 = _2086 * 0.5;
    float _2096 = _2088 + _2064;
    float _2098 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2100 = _2064;
    float _2102 = _1917;
    if (!_2080)
    {
        _1409 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2104 = _1409;
    float _2106 = -_2098;
    float _2108 = _2106 + 1.0;
    float _2110 = _2096 * _2070;
    float _2112 = _2110 * 0.5;
    float _2114 = _2104;
    float _2116 = _2112;
    float _2118 = _2070;
    if (_2080)
    {
        _2100 = 1.0;
    }
    float _2120 = _2100;
    float _2122 = _2120;
    if (!_2080)
    {
        float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2126 = fma(_2112, _2104, _2124);
        _2114 = _2126;
    }
    float _2128 = _2114;
    if (!_2080)
    {
        _2116 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2130 = _2116;
    if (!_2080)
    {
        float _2132 = -_2130;
        float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2118 = _2134;
    }
    float _2136 = _2118;
    float _2138 = _2128;
    if (!_2080)
    {
        float _2140 = 1.0 / _2128;
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = _2136;
    if (!_2080)
    {
        float _2146 = 1.0 / _2136;
        _2144 = _2146;
    }
    float _2148 = _2144;
    if (!_2080)
    {
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2152 = -_2130;
        float _2154 = fma(_2142, _2150, _2152);
        _2102 = _2154;
    }
    float _2156 = _2102;
    float _2158 = _1987 + _1959;
    float _2160 = _2158 * 0.5;
    if (!_2080)
    {
        float _2162 = _2156 * _2148;
        float _2164 = precise::clamp(_2162, 0.0, 1.0);
        _2122 = _2164;
    }
    float _2166 = _2122;
    out.m_70.x = _2160;
    out.m_70.y = _2084;
    out.m_70.z = _2094;
    out.m_70.w = _1959;
    float _2168 = _2166 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2170 = _2166 > 0.0;
    bool _2172 = isnan(_2166);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2168 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2180;
    float _2182 = _2098 * _2013;
    float _2184 = _2024 * _2108;
    float _2186 = _2024 * _2182;
    float _2188 = _2042 * _2182;
    float _2190 = fma(_2038, _2186, _2018);
    float _2192 = fma(_2040, _2186, _2020);
    float _2194 = fma(_2024, _2188, _2022);
    out.m_72.x = _2190;
    out.m_72.y = _2192;
    out.m_72.z = _2194;
    out.m_72.w = _2184;
    if (_2178)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2196 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2196;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1577 = false;
    bool _1107 = false;
    bool _833 = false;
    bool _731 = false;
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2253 = as_type<float>(_107);
        out.gl_Position.z = _2253;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2322 = as_type<float>(_143);
        out.gl_Position.z = _2322;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_49.x;
    float _171 = in.m_49.y;
    float _173 = in.m_49.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _151;
    float _189 = _153;
    if (!_163)
    {
        float _191 = _153 * _153;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _175 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _195;
    if (!_163)
    {
        float _209 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = _197 * 6.283185482025146484375;
    float _215 = cos(_213);
    bool _217 = !_185;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = -_177;
    float _223 = _167 + _221;
    bool _225 = !_163;
    float _227 = _211;
    float _229 = _219;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _153 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _153);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _259;
    }
    float _261 = _227;
    bool _263 = !_163;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _153 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _189 = _283;
    }
    float _285 = _189;
    float _287 = in.m_56.w;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    float _297 = fma(_215, 0.5, 0.5);
    bool _299 = _223 < 0.5;
    float _301 = float(_299);
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = -_223;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _315 = !_291;
    int _317 = _315 ? 0 : 1;
    float _319 = -_297;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_201;
    int _325 = _323 ? 0 : 1;
    float _327 = fma(_285, _169, _313);
    bool _329 = !_295;
    int _331 = _329 ? 0 : 1;
    float _333 = -_301;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _337 = abs(_317);
    float _339 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _345 = abs(_331);
    float _347 = fma(_285, _171, _339);
    int _349 = abs(_325);
    float _351 = float(_337);
    float _353 = float(_349);
    float _355 = float(_345);
    float _357 = abs(_311);
    float _359 = _351 * _357;
    float _361 = fma(_285, _173, _343);
    float _363 = fma(_327, _287, _303);
    float _365 = fma(_347, _287, _305);
    float _367 = fma(_353, _321, _359);
    float _369 = fma(_361, _287, _307);
    float _371 = abs(_335);
    float _373 = fma(_355, _371, _367);
    bool _375 = !_341;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_91);
        float _397 = 1.0 / _395;
        float _399 = _125 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = _401 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _423 = 1.0 / _409;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _433 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_401);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = 1.0 / _413;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _449 = _401 + _447;
    float _451 = -_443;
    float _453 = _451 + 1.0;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _417;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _401 + _459;
    float _463 = _449 * _423;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _467 = _401 + _465;
    float _469 = _461 * _445;
    bool _471 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _473 = isnan(_401);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _421;
    bool _485 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_401);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_481;
    float _499 = _497 + 1.0;
    float _501 = _405 * _457;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _505 = _401 + _503;
    float _507 = 1.0 / _427;
    bool _509 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _511 = isnan(_401);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _495 * _453;
    float _523 = -_495;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = _519 * _499;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _431;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _541 = _401 + _539;
    float _543 = _467 * _483;
    bool _545 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_401);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = fma(_529, _501, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _559 = _541 * _507;
    bool _561 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _563 = isnan(_401);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _571 * _535;
    float _575 = -_571;
    float _577 = _575 + 1.0;
    float _579 = _505 * _537;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _585;
    float _589 = _443 * _577;
    bool _591 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _593 = isnan(_401);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = fma(_583, _463, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _609 = fma(_587, _463, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _611 = -_601;
    float _613 = _611 + 1.0;
    float _615 = _601 * _525;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _621 = -_555;
    float _623 = _621 + 1.0;
    float _625 = _555 * _613;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _627;
    float _631 = fma(_605, _469, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _637 = _607 * _625;
    float _639 = _609 * _625;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _645 = fma(_619, _469, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _647 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _639);
    float _651 = fma(_629, _501, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _653 = fma(_643, _543, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _655 = fma(_635, _543, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _657 = fma(_631, _615, _647);
    float _659 = fma(_645, _615, _649);
    float _661 = in.m_56.x;
    float _663 = in.m_56.y;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _669;
    float _673 = fma(_651, _521, _657);
    float _675 = fma(_557, _521, _659);
    float _677 = fma(_667, _559, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _679 = fma(_671, _559, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = fma(_653, _589, _673);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _691 = fma(_655, _589, _675);
    float _693 = fma(_683, _579, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _695 = fma(_677, _573, _685);
    float _697 = fma(_689, _579, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _699 = fma(_679, _573, _691);
    float _701 = fma(_693, _531, _695);
    float _703 = fma(_697, _531, _699);
    float _705 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[149].x, _701);
    float _707 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[149].y, _703);
    float _709 = _705 * _661;
    float _711 = _707 * _663;
    bool _713 = !_455;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _717 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_91);
        float _735 = 1.0 / _733;
        float _737 = _125 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    bool _741 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _743 = isnan(_739);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _757 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _759 = isnan(_739);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _775 = _739 + _773;
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = 1.0 / _755;
    float _783 = _767 * _779;
    float _785 = -_767;
    float _787 = _785 + 1.0;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _795 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _771 * _781;
    float _801 = fma(_799, _775, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _803 = _801 * _783;
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[115].x, _803);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _809 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[116].x, _805);
    float _811 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _809 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _795;
    out.m_58.y = _811;
    out.m_58.z = _797;
    out.m_58.w = _813;
    bool _815 = !_791;
    float _831;
    if (!_815)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _819 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_91);
        float _837 = 1.0 / _835;
        float _839 = _125 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _845 = _841 + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _849 = _841 + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = _841 + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _863;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _871 = 1.0 / _857;
    bool _873 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _875 = isnan(_841);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = 1.0 / _861;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _889 = _841 + _887;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _893 = 1.0 / _869;
    float _895 = _853 * _871;
    bool _897 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _899 = isnan(_841);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = 1.0 / _865;
    float _911 = _845 * _885;
    float _913 = _889 * _893;
    bool _915 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _917 = isnan(_841);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _927;
    bool _931 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _933 = isnan(_841);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -_925;
    float _945 = _943 + 1.0;
    float _947 = fma(_929, _895, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _949 = _849 * _909;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _951;
    float _955 = _907 * _945;
    float _957 = -_907;
    float _959 = _957 + 1.0;
    float _961 = -_941;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _965;
    float _969 = fma(_953, _895, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _971 = fma(_967, _895, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _973 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _975 = isnan(_841);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = _941 * _959;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _999 = _983 * _963;
    float _1001 = -_983;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_989, _911, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1007 = fma(_997, _911, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1009 = fma(_993, _911, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1011 = _883 * _1003;
    float _1013 = -_883;
    float _1015 = _1013 + 1.0;
    float _1017 = _971 * _1011;
    float _1019 = _947 * _1011;
    float _1021 = _969 * _1011;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1023;
    float _1027 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1017);
    float _1029 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1019);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1021);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1037;
    float _1041 = fma(_1005, _999, _1027);
    float _1043 = fma(_1009, _999, _1031);
    float _1045 = fma(_1007, _999, _1029);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1055 = fma(_1025, _949, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1057 = fma(_1035, _949, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1059 = fma(_1039, _949, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1063 = _1061 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1065 = fma(_1049, _913, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1067 = fma(_1053, _913, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1069 = fma(_1055, _985, _1041);
    float _1071 = fma(_1063, _913, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1073 = fma(_1057, _985, _1045);
    float _1075 = fma(_1059, _985, _1043);
    float _1077 = fma(_1065, _955, _1069);
    float _1079 = fma(_1067, _955, _1073);
    float _1081 = fma(_1071, _955, _1075);
    float _1083 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1077);
    float _1085 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1079);
    float _1087 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1081);
    bool _1089 = !_891;
    float _1105;
    if (!_1089)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1093 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _1097 = _1095 * _1091;
        float _1099 = floor(_1097);
        float _1101 = -_1099;
        float _1103 = _1097 + _1101;
        _1105 = _1103;
        _1107 = true;
    }
    else
    {
        float _1109 = float(_91);
        float _1111 = 1.0 / _1109;
        float _1113 = _125 * _1111;
        _1105 = _1113;
    }
    _1107 = false;
    float _1115 = _1105;
    float _1117 = in.m_60.x;
    float _1119 = in.m_60.y;
    float _1121 = in.m_60.z;
    float _1123 = in.m_60.w;
    float _1125 = in.m_62.x;
    float _1127 = in.m_62.y;
    float _1129 = in.m_62.z;
    float _1131 = in.m_62.w;
    bool _1133 = _145 > 0.5;
    float _1135 = precise::max((*spvDescriptorSet0.vp_c10)._m0[2].x, 20.0);
    float _1137 = in.m_64.x;
    float _1139 = in.m_64.y;
    float _1141 = in.m_64.z;
    float _1143 = in.m_64.w;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1151 = _1149 != 0;
    float _1153 = in.m_51.y;
    float _1155 = precise::min(_1135, 30.0);
    float _1157 = _365 * _1119;
    float _1159 = _365 * _1127;
    float _1161 = fma(_1155, -0.100000001490116119384765625, 3.0);
    float _1163 = fma(_363, _1117, _1157);
    float _1165 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1167 = _365 * _1139;
    float _1169 = _373 * _1161;
    float _1171 = fma(_363, _1125, _1159);
    float _1173 = -_205;
    int _1175 = _1133 ? as_type<int>(_1173) : as_type<int>(_205);
    float _1177 = fma(_363, _1137, _1167);
    float _1179 = _711 * _1169;
    float _1181 = _709 * _1169;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    bool _1185 = _1153 > 0.5;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1189 = fma(_369, _1141, _1177);
    bool _1191 = !_1147;
    float _1193 = _1191 ? _205 : as_type<float>(_1175);
    float _1195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1197 = _1181 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = _1187 * _1183;
    float _1201 = _1189 + _1143;
    float _1203 = fma(_369, _1129, _1171);
    float _1205 = _1197 * _1195;
    float _1207 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = fma(_369, _1121, _1163);
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1209);
    float _1221 = 1.0 / _1213;
    float _1223 = _1215 + _1123;
    float _1225 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1217);
    float _1227 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1231 = _1115 + _1229;
    float _1233 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1237;
    float _1241 = _1223 + _1233;
    float _1243 = _1201 + _1235;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1251 = _1241 + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1255 = _1243 + _1253;
    float _1257 = _1239 * _1221;
    bool _1259 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1261 = isnan(_1115);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = _1251 * _1251;
    float _1273 = _1255 * _1255;
    float _1275 = 1.0 / _1247;
    bool _1277 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = isnan(_1115);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1293 = _1271 + _1273;
    bool _1295 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_1115);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = fma(_1257, _1231, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1309 = -_1287;
    float _1311 = _1309 + 1.0;
    bool _1313 = _1115 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1315 = isnan(_1115);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / _1291;
    float _1327 = -_1269;
    float _1329 = _1327 + 1.0;
    float _1331 = _1305 * _1311;
    float _1333 = -_1305;
    float _1335 = _1333 + 1.0;
    float _1337 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1339 = _1287 * _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1341;
    float _1345 = _1203 + _1131;
    float _1347 = sqrt(_1293);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1353 = _1323 * _1335;
    float _1355 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1337);
    float _1357 = -_1323;
    float _1359 = _1357 + 1.0;
    float _1361 = _1351 * _1275;
    float _1363 = _1307 * _1353;
    float _1365 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1355);
    float _1367 = _1343 * _1325;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1371 = _1115 + _1369;
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1363);
    float _1375 = -_219;
    float _1377 = _1185 ? _1375 : _219;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1381 = fma(_1361, _1371, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1383 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1387 = _1115 + _1385;
    bool _1389 = _1347 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = fma(_1381, _1331, _1373);
    float _1393 = _1345 + _1383;
    bool _1395 = !_1151;
    float _1397 = _1395 ? _219 : _1377;
    float _1399 = fma(_1367, _1387, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1401 = _1377;
    float _1403 = _1387;
    float _1405 = _1241;
    float _1407 = _1243;
    float _1409 = _1201;
    if (!_1389)
    {
        _1401 = _1273;
    }
    float _1411 = _1401;
    float _1413 = _1411;
    if (!_1389)
    {
        _229 = _1271;
    }
    float _1415 = _229;
    float _1417 = _1415;
    if (!_1389)
    {
        _1403 = _1393;
    }
    float _1419 = _1403;
    bool _1421 = !_1389;
    float _1423 = _1419;
    if (!_1421)
    {
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1429 = _1347 + _1427;
        float _1431 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1433 = rsqrt(_1293);
        float _1435 = _1429 * _1425;
        float _1437 = _1435 * 0.15915493667125701904296875;
        float _1439 = _1437 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = _1437 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        float _1447 = fma(_1441, _1431, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1449 = _1433 * _1447;
        float _1451 = _1445 + (-1.0);
        float _1453 = fma(_1251, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1455 = fma(_1255, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1457 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1461 = _1453 + _1459;
        float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1465 = _1455 + _1463;
        float _1467 = fma(_1393, _1445, _1457);
        float _1469 = _1461 * _1461;
        float _1471 = _1465 * _1465;
        _1423 = _1467;
        _1417 = _1469;
        _1413 = _1471;
        _1405 = _1453;
        _1407 = _1455;
    }
    float _1473 = _1423;
    float _1475 = _1417;
    float _1477 = _1413;
    float _1479 = _1405;
    float _1481 = _1407;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1485 = _1473 + _1483;
    float _1487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1489 = _1193 + 0.5;
    float _1491 = fma(_1399, _1339, _1391);
    float _1493 = fma(_1485, _1485, _1475);
    float _1495 = -_1397;
    float _1497 = _1495 + 0.5;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1501 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1491);
    float _1503 = _1493 + _1477;
    float _1505 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1507 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1509 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1511 = _1087 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1513 = _1499 * _1379;
    float _1515 = sqrt(_1503);
    float _1517 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1507 * _1487;
    float _1523 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = _1501 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _1513;
    out.m_66.y = _1521;
    out.m_68.x = _1517;
    out.m_68.y = _1519;
    out.m_68.z = _1523;
    out.m_68.w = _1525;
    bool _1527 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1529 = isnan(_1515);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1535 = _1531 || _1533;
    float _1537 = _1499;
    float _1539 = _1513;
    float _1541 = _1525;
    if (!_1535)
    {
        _1537 = 1.0;
    }
    float _1543 = _1537;
    bool _1545 = !_1535;
    float _1547 = _1543;
    if (!_1545)
    {
        bool _1549 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1551 = isnan(_1515);
        bool _1553 = _1549 || _1551;
        bool _1555 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1557 = _1553 || _1555;
        if (!_1557)
        {
            float _1559 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1561 = _1515 + _1559;
            float _1563 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1565 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1563;
            float _1567 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1569 = _1567 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1571 = 1.0 / _1565;
            float _1573 = _1561 * _1571;
            float _1575 = fma(_1573, _1569, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1547 = _1575;
            _1577 = true;
        }
        else
        {
            bool _1579 = _1515 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1581 = isnan(_1515);
            bool _1583 = _1579 || _1581;
            bool _1585 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1587 = _1583 || _1585;
            if (!_1587)
            {
                float _1589 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1591 = _1515 + _1589;
                float _1593 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1595 = _1593 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1599 = _1597 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1601 = 1.0 / _1595;
                float _1603 = _1591 * _1601;
                float _1605 = fma(_1603, _1599, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1547 = _1605;
                _1577 = true;
            }
            else
            {
                _1547 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1577 = false;
    float _1607 = _1547;
    float _1609 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1611 = _1479 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1615 = _1481 + _1613;
    bool _1617 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1619 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan(0.5);
    bool _1625 = _1621 || _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1629 = _1473 + _1627;
    float _1631 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1633 = fma(_1615, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1635 = fma(_1629, _1607, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1637 = _1629;
    float _1639 = _1607;
    if (_1625)
    {
        _1637 = _1631;
    }
    float _1641 = _1637;
    float _1643 = _1641;
    if (_1625)
    {
        _1539 = _1635;
    }
    float _1645 = _1539;
    float _1647 = _1645;
    if (_1625)
    {
        _1639 = _1633;
    }
    float _1649 = _1639;
    float _1651 = _1649;
    if (!_1625)
    {
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1655 = _1345 + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1659 = _1223 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1655 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1667 = _1201 + _1665;
        float _1669 = fma(_1659, _1659, _1663);
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1673 = fma(_1667, _1667, _1669);
        float _1675 = sqrt(_1673);
        float _1677 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1679 = precise::min(_1675, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1681 = _1679 * _1671;
        float _1683 = -_1223;
        float _1685 = _1683 + _1631;
        float _1687 = -_1201;
        float _1689 = _1687 + _1633;
        float _1691 = _1677 * _1681;
        float _1693 = -_1345;
        float _1695 = _1693 + _1635;
        float _1697 = fma(_1685, _1691, _1223);
        float _1699 = fma(_1695, _1691, _1345);
        float _1701 = fma(_1689, _1691, _1201);
        _1647 = _1699;
        _1643 = _1697;
        _1651 = _1701;
    }
    float _1703 = _1647;
    float _1705 = _1643;
    float _1707 = _1651;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1703 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1705 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1707 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = fma(_1719, _1719, _1723);
    float _1727 = rsqrt(_1725);
    float _1729 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1731 = _1715 * _1729;
    float _1733 = _1719 * _1729;
    float _1735 = _1731 * _1731;
    float _1737 = _1733 * _1733;
    float _1739 = _1735 + _1737;
    float _1741 = sqrt(_1739);
    bool _1743 = _1741 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1747 = _1741 + _1745;
    float _1749 = _1515;
    float _1751 = _1739;
    float _1753 = _1747;
    float _1755 = _1711;
    float _1757 = _1729;
    float _1759 = _1731;
    if (_1743)
    {
        float _1761 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1749 = _1761;
    }
    float _1763 = _1749;
    if (_1743)
    {
        float _1765 = rsqrt(_1739);
        _1751 = _1765;
    }
    float _1767 = _1751;
    float _1769 = _1763;
    if (_1743)
    {
        float _1771 = _1747 * _1763;
        _1753 = _1771;
    }
    float _1773 = _1753;
    if (_1743)
    {
        float _1775 = _1773 * 0.15915493667125701904296875;
        _1769 = _1775;
    }
    float _1777 = _1769;
    float _1779 = _1727;
    float _1781 = _1777;
    if (_1743)
    {
        float _1783 = _1777 * 6.283185482025146484375;
        float _1785 = sin(_1783);
        _1779 = _1785;
    }
    float _1787 = _1779;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1791 = precise::max(0.0, _1789);
    float _1793 = _1719;
    float _1795 = _1791;
    if (_1743)
    {
        float _1797 = _1777 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        _1793 = _1799;
    }
    float _1801 = _1793;
    float _1803 = -_1729;
    float _1805 = -_1791;
    float _1807 = fma(_1711, _1803, _1805);
    if (_1743)
    {
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1755 = _1809;
    }
    float _1811 = _1755;
    float _1813 = _1811;
    if (!_1743)
    {
        _1781 = _1735;
    }
    float _1815 = _1781;
    float _1817 = _1787;
    float _1819 = _1815;
    if (_1743)
    {
        float _1821 = fma(_1787, _1811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1813 = _1821;
    }
    float _1823 = _1813;
    float _1825 = _1823;
    if (!_1743)
    {
        _1817 = _1807;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    if (_1743)
    {
        float _1831 = _1801 + (-1.0);
        _1795 = _1831;
    }
    float _1833 = _1795;
    float _1835 = _1833;
    if (_1743)
    {
        float _1837 = _1767 * _1823;
        _1541 = _1837;
    }
    float _1839 = _1541;
    if (!_1743)
    {
        _1825 = _1733;
    }
    float _1841 = _1825;
    float _1843 = sqrt(_1725);
    float _1845 = _1841;
    if (_1743)
    {
        float _1847 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1757 = _1847;
    }
    float _1849 = _1757;
    if (_1743)
    {
        float _1851 = _1731 * _1839;
        _1759 = _1851;
    }
    float _1853 = _1759;
    if (_1743)
    {
        float _1855 = _1733 * _1839;
        _1845 = _1855;
    }
    float _1857 = _1845;
    if (!_1743)
    {
        _1835 = _1737;
    }
    float _1859 = _1835;
    float _1861 = _1859;
    if (_1743)
    {
        float _1863 = fma(_1807, _1801, _1849);
        _1829 = _1863;
    }
    float _1865 = _1829;
    if (_1743)
    {
        float _1867 = _1853 * _1853;
        _1819 = _1867;
    }
    float _1869 = _1819;
    if (_1743)
    {
        float _1871 = _1857 * _1857;
        _1861 = _1871;
    }
    float _1873 = _1861;
    float _1875 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1877 = fma(_1865, _1865, _1869);
    float _1879 = _1877 + _1873;
    float _1881 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1885 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1883);
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = rsqrt(_1879);
    float _1891 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1893 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1895 = -_1887;
    float _1897 = _1895 + 1.0;
    float _1899 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1901 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1891);
    float _1903 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1893);
    float _1905 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1909 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1899);
    float _1911 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1903);
    float _1913 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1915 = abs(_1897);
    float _1917 = log2(_1915);
    float _1919 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1909);
    float _1921 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1923 = _1889 * _1853;
    float _1925 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1913);
    float _1927 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1929 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1931 = _1889 * _1865;
    float _1933 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1935 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1937 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1929);
    float _1939 = _1889 * _1857;
    float _1941 = -_1933;
    float _1943 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1941);
    float _1945 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1947 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1937);
    float _1949 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = -_1939;
    float _1953 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1943);
    float _1955 = -_1945;
    float _1957 = fma(_1955, _1875, 1.0);
    float _1959 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1947);
    float _1961 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = fma(_1953, -0.5, 0.5);
    float _1965 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1967 = 1.0 / _1959;
    float _1969 = fma(_1953, 0.5, 0.5);
    float _1971 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1973 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1965);
    float _1975 = _1931 + 1.0;
    float _1977 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1971);
    float _1979 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1973);
    float _1981 = log2(_1957);
    float _1983 = fma(_1969, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1985 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1977);
    float _1987 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1979);
    float _1989 = fma(_1969, _1983, -0.212114393711090087890625);
    float _1991 = exp2(_1961);
    float _1993 = _1987 * _1967;
    float _1995 = _1985 * _1967;
    float _1997 = fma(_1969, _1989, 1.570728778839111328125);
    float _1999 = fma(_1993, 0.5, 0.5);
    float _2001 = fma(_1995, -0.5, 0.5);
    float _2003 = sqrt(_1963);
    float _2005 = _1981 * 0.693147182464599609375;
    float _2007 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2009 = -_1931;
    float _2011 = fma(_1991, _1975, _2009);
    float3 _5316 = float3(_1999, _2001, _2007);
    float _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5316, float3(0.0), isnan(_5316)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5316, float3(0.0), isnan(_5316)), level(0.0)).x;
    float3 _5327 = float3(_1999, _2001, _2007);
    float4 _2016 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5327, float3(0.0), isnan(_5327)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5327, float3(0.0), isnan(_5327)), level(0.0)).xyzw;
    float _2018 = _2016.x;
    float _2020 = _2016.y;
    float _2022 = _2016.z;
    float _2024 = _2016.w;
    float _2026 = fma(_2011, 0.5, 0.5);
    float _2028 = _2003 * 0.636619746685028076171875;
    float _2030 = -_1997;
    float _2032 = fma(_2028, _2030, 1.0);
    float2 _5354 = float2(_2032, _2026);
    float3 _2036 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5354, float2(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5354, float2(0.0), isnan(_5354)), level(0.0)).xyz;
    float _2038 = _2036.x;
    float _2040 = _2036.y;
    float _2042 = _2036.z;
    float _2044 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2046 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2048 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2050 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2044);
    float _2052 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2048);
    float _2054 = exp2(_2046);
    float _2056 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2050);
    float _2058 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2060 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2052);
    float _2062 = _1959 * 0.5;
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2066 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2058);
    float _2068 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    float _2070 = 1.0 / _2064;
    bool _2072 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.5);
    bool _2080 = _2076 || _2078;
    float _2082 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2066);
    float _2084 = fma(_1985, -0.5, _2062);
    float _2086 = _2068 + _1959;
    out.gl_Position.x = _1987;
    out.gl_Position.y = _1985;
    out.gl_Position.z = _2068;
    out.gl_Position.w = _1959;
    float _2088 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2090 = -_2054;
    float _2092 = _2090 + 1.0;
    float _2094 = _2086 * 0.5;
    float _2096 = _2088 + _2064;
    float _2098 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2100 = _2064;
    float _2102 = _1917;
    if (!_2080)
    {
        _1409 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2104 = _1409;
    float _2106 = -_2098;
    float _2108 = _2106 + 1.0;
    float _2110 = _2096 * _2070;
    float _2112 = _2110 * 0.5;
    float _2114 = _2104;
    float _2116 = _2112;
    float _2118 = _2070;
    if (_2080)
    {
        _2100 = 1.0;
    }
    float _2120 = _2100;
    float _2122 = _2120;
    if (!_2080)
    {
        float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2126 = fma(_2112, _2104, _2124);
        _2114 = _2126;
    }
    float _2128 = _2114;
    if (!_2080)
    {
        _2116 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2130 = _2116;
    if (!_2080)
    {
        float _2132 = -_2130;
        float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2118 = _2134;
    }
    float _2136 = _2118;
    float _2138 = _2128;
    if (!_2080)
    {
        float _2140 = 1.0 / _2128;
        _2138 = _2140;
    }
    float _2142 = _2138;
    float _2144 = _2136;
    if (!_2080)
    {
        float _2146 = 1.0 / _2136;
        _2144 = _2146;
    }
    float _2148 = _2144;
    if (!_2080)
    {
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2152 = -_2130;
        float _2154 = fma(_2142, _2150, _2152);
        _2102 = _2154;
    }
    float _2156 = _2102;
    float _2158 = _1987 + _1959;
    float _2160 = _2158 * 0.5;
    if (!_2080)
    {
        float _2162 = _2156 * _2148;
        float _2164 = precise::clamp(_2162, 0.0, 1.0);
        _2122 = _2164;
    }
    float _2166 = _2122;
    out.m_70.x = _2160;
    out.m_70.y = _2084;
    out.m_70.z = _2094;
    out.m_70.w = _1959;
    float _2168 = _2166 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2170 = _2166 > 0.0;
    bool _2172 = isnan(_2166);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2168 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2180;
    float _2182 = _2098 * _2013;
    float _2184 = _2024 * _2108;
    float _2186 = _2024 * _2182;
    float _2188 = _2042 * _2182;
    float _2190 = fma(_2038, _2186, _2018);
    float _2192 = fma(_2040, _2186, _2020);
    float _2194 = fma(_2024, _2188, _2022);
    out.m_72.x = _2190;
    out.m_72.y = _2192;
    out.m_72.z = _2194;
    out.m_72.w = _2184;
    if (_2178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2196 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2196;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

