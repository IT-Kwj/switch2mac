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
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_72 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _953 = false;
    bool _793 = false;
    bool _451 = false;
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
        float _3678 = as_type<float>(_107);
        out.gl_Position.z = _3678;
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
        out.m_45.x = 0.0;
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
        float _3747 = as_type<float>(_143);
        out.gl_Position.z = _3747;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _145;
    float _209 = _187;
    float _211 = 0.0;
    if (!_205)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _147 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _147);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _231;
        _209 = _241;
        _211 = _229;
    }
    float _243 = _207;
    float _245 = _209;
    float _247 = _211;
    bool _249 = !_159;
    float _251 = _243;
    float _253 = _247;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _147 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _251 = _267;
        _253 = _261;
        _175 = _273;
    }
    float _275 = _251;
    float _277 = _253;
    float _279 = _175;
    float _281 = _275;
    float _283 = _277;
    if (!_159)
    {
        float _285 = _125 * _125;
        float _287 = _285 * 0.5;
        _281 = _287;
    }
    float _289 = _281;
    float _291 = _289;
    if (!_159)
    {
        _283 = _125;
    }
    float _293 = _283;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _293;
    if (!_159)
    {
        float _301 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _301;
    }
    float _303 = _291;
    bool _305 = !_159;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _125 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _125);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_159;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _125 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = fma(_279, _163, _297);
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_279, _161, _295);
    float _373 = fma(_363, _163, _365);
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _377 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = fma(_367, _149, _169);
    float _383 = fma(_363, _161, _369);
    float _385 = -_373;
    float _387 = _367 + _385;
    float _389 = fma(_279, _165, _377);
    float _391 = fma(_363, _165, _379);
    float _393 = fma(_371, _149, _167);
    float _395 = -_383;
    float _397 = _371 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = -_391;
    float _407 = _389 + _405;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _411 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _415 = fma(_389, _149, _171);
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = !_375;
    float _425 = _419;
    float _427 = _417;
    float _429 = _421;
    float _431 = _417;
    float _449;
    if (!_423)
    {
        float _433 = in.m_54.x;
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _437 = _433 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_91);
        float _455 = 1.0 / _453;
        float _457 = _125 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _481 = 1.0 / _467;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _491 = 1.0 / _471;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _495 = _459 + _493;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _499 = 1.0 / _479;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _459 + _501;
    float _505 = _495 * _481;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _509 = _459 + _507;
    float _511 = 1.0 / _475;
    float _513 = _503 * _491;
    bool _515 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _517 = isnan(_459);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    bool _527 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _529 = isnan(_459);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    bool _539 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _541 = isnan(_459);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _489;
    float _553 = _509 * _499;
    bool _555 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _557 = isnan(_459);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_549;
    float _569 = _567 + 1.0;
    float _571 = -_565;
    float _573 = _571 + 1.0;
    float _575 = _463 * _511;
    float _577 = -_525;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _485;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _585 = _459 + _583;
    float _587 = _549 * _573;
    float _589 = _537 * _579;
    float _591 = -_537;
    float _593 = _591 + 1.0;
    bool _595 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _597 = isnan(_459);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _585 * _551;
    bool _609 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _611 = isnan(_459);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _565 * _593;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _627;
    bool _631 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _633 = isnan(_459);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = _619 * _569;
    float _645 = fma(_625, _505, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _647 = fma(_629, _505, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _649 = -_605;
    float _651 = _649 + 1.0;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _655 = _459 + _653;
    float _657 = -_619;
    float _659 = _657 + 1.0;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _665 = _641 * _651;
    float _667 = _655 * _581;
    float _669 = _605 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _675 = _645 * _665;
    float _677 = _647 * _665;
    float _679 = -_641;
    float _681 = _679 + 1.0;
    float _683 = fma(_663, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _689;
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[143].x, _675);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _695;
    float _699 = fma(_673, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _707 = fma(_687, _553, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _709 = fma(_683, _669, _693);
    float _711 = fma(_691, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _713 = in.m_52.x;
    float _715 = in.m_52.y;
    float _717 = fma(_697, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _719 = fma(_699, _669, _701);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _725;
    float _729 = fma(_711, _643, _709);
    float _731 = fma(_705, _553, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _733 = fma(_717, _643, _719);
    float _735 = fma(_723, _667, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _737 = fma(_727, _667, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _743 = fma(_707, _587, _729);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _749 = fma(_731, _587, _733);
    float _751 = fma(_741, _607, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _753 = fma(_735, _621, _743);
    float _755 = fma(_747, _607, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _757 = fma(_737, _621, _749);
    float _759 = fma(_751, _589, _753);
    float _761 = fma(_755, _589, _757);
    float _763 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[149].x, _759);
    float _765 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[149].y, _761);
    float _767 = _763 * _713;
    float _769 = _765 * _715;
    bool _771 = !_497;
    float _773 = _643;
    float _791;
    if (!_771)
    {
        float _775 = in.m_54.x;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _779 = _775 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _783 = _781 * _777;
        float _785 = floor(_783);
        float _787 = -_785;
        float _789 = _783 + _787;
        _791 = _789;
        _793 = true;
    }
    else
    {
        float _795 = float(_91);
        float _797 = 1.0 / _795;
        float _799 = _125 * _797;
        _791 = _799;
    }
    _793 = false;
    float _801 = _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _805 = _801 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _811 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = isnan(_801);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _827 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _829 = isnan(_801);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _839;
    bool _843 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _845 = isnan(_801);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = 1.0 / _809;
    float _857 = -_821;
    float _859 = _857 + 1.0;
    float _861 = _837 * _859;
    float _863 = -_837;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _825;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _877 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _841 * _855;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = fma(_881, _805, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _889 = -_853;
    float _891 = _889 + 1.0;
    float _893 = _887 * _861;
    float _895 = _885 * _867;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _899 = _801 + _897;
    float _901 = _821 * _891;
    float _903 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _905 = fma(_895, _899, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _907 = fma(_905, _901, _903);
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _911 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[117].x, _907);
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _917 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _921 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _917;
    out.m_56.y = _921;
    out.m_56.z = _923;
    out.m_56.w = _925;
    out.m_58.x = _927;
    out.m_58.y = _877;
    out.m_58.z = _879;
    out.m_58.w = _875;
    bool _929 = !_873;
    float _949;
    float _951;
    if (!_929)
    {
        float _931 = in.m_54.x;
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _935 = float(_91);
        float _937 = _931 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _941 = _939 * _933;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = _935;
        _953 = true;
    }
    else
    {
        float _955 = float(_91);
        float _957 = 1.0 / _955;
        float _959 = _125 * _957;
        _949 = _959;
        _951 = _955;
    }
    _953 = false;
    float _961 = _949;
    float _963 = _951;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _967 = int(_965);
    float _969 = in.m_54.x;
    float _971 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _979 = _961 + _977;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _983 = int(_981);
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _993 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _997 = _961 + _995;
    bool _999 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1001 = isnan(_961);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1013 = float(_967);
    float _1015 = 1.0 / _963;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1025 = float(uint(_983));
    float _1027 = 1.0 / _1013;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    int _1033 = ~_983;
    int _1035 = _1033 + 1;
    float _1037 = float(_983);
    int _1039 = _983 + (-1);
    float _1041 = 1.0 / _1025;
    if (_975)
    {
        _773 = _969;
    }
    float _1043 = _773;
    float _1045 = _125 * _1027;
    float _1047 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1049 = log2(_1047);
    int _1051 = as_type<int>(_1041) + (-2);
    float _1053 = trunc(_1045);
    int _1055 = int(_1053);
    float _1057 = 1.0 / _991;
    float _1059 = float(uint(_1055));
    float _1061 = _125 * _1049;
    float _1063 = 1.0 / _987;
    float _1065 = as_type<float>(_1051) * _1059;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1067;
    float _1071 = _997 * _1057;
    float _1073 = trunc(_1065);
    float _1075 = precise::max(_1073, 0.0);
    uint _1078 = uint(_1075);
    float _1080 = exp2(_1061);
    float _1082 = in.m_54.z;
    float _1084 = in.m_54.w;
    int _1086 = _1031 * int(_1078);
    int _1088 = _1086 + _1055;
    float _1090 = as_type<float>(_1031);
    float _1092 = _1043;
    if (!_975)
    {
        float _1094 = in.m_54.y;
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = float(uint(_1088));
    float _1100 = as_type<float>(_1051) * _1098;
    float _1102 = float(_1055);
    bool _1104 = _1102 >= _1037;
    bool _1106 = isnan(_1102);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(_1037);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = trunc(_1100);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    bool _1122 = _1082 > 0.5;
    float _1124 = _1102;
    if (!_975)
    {
        _1092 = _1082;
    }
    float _1126 = _1092;
    float _1128 = -_203;
    int _1130 = _1122 ? as_type<int>(_1128) : as_type<int>(_203);
    float _1132 = trunc(_1114);
    int _1134 = int(_1132);
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_975)
    {
        _1124 = _1096;
    }
    float _1138 = _1124;
    int _1140 = int(_1078) + int(_1120);
    int _1142 = _1035 * _1140;
    int _1144 = _1142 + _1055;
    bool _1146 = !_975;
    float _1148 = _1146 ? 5.839270114898681640625 : 1.0;
    bool _1150 = !_975;
    float _1152 = _1150 ? _1082 : _969;
    bool _1154 = uint(_1144) >= uint(_983);
    float _1156 = as_type<float>(_1144);
    float _1158 = _1138;
    if (!_975)
    {
        _1156 = _1138;
    }
    float _1160 = _1156;
    float _1162 = _1148 * _1152;
    bool _1164 = !_1154;
    int _1166 = _1164 ? 0 : (-1);
    bool _1168 = _983 == 0;
    float _1170 = floor(_1162);
    float _1172 = _1160;
    float _1174 = _1096;
    if (_975)
    {
        float _1176 = in.m_54.x;
        float _1178 = in.m_54.y;
        _1172 = _1176;
        _1174 = _1178;
    }
    float _1180 = _1172;
    float _1182 = _1174;
    int _1184 = ~_1140;
    int _1186 = _1184 + _1166;
    int _1188 = _1186 + 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1192 = _1190 != 0;
    int _1194 = ~_1134;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    int _1200 = _983 * _1188;
    int _1202 = _1200 + _1055;
    bool _1204 = !_1168;
    int _1206 = _1204 ? _1202 : (-1);
    float _1208 = -_1170;
    float _1210 = _1162 + _1208;
    bool _1212 = !_1192;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = _1206 * _1198;
    float _1218 = _1037 * _1210;
    float _1220 = _125 * _1037;
    int _1222 = _1134 * _1039;
    int _1224 = _1222 + _1216;
    int _1226 = abs(_1214);
    bool _1228 = _1182 > 0.5;
    float _1230 = _1220 * _1015;
    float _1232 = trunc(_1218);
    int _1234 = int(_1232);
    float _1236 = _1182 * 2.0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1244 = _1242 != 0;
    float _1246 = -_199;
    int _1248 = _1228 ? as_type<int>(_1246) : as_type<int>(_199);
    if (_975)
    {
        _1158 = _1182;
    }
    float _1250 = _1158;
    bool _1252 = !_1244;
    float _1254 = _1252 ? _203 : as_type<float>(_1130);
    float _1256 = trunc(_1230);
    int _1258 = int(_1256);
    bool _1260 = !_1240;
    float _1262 = _1260 ? _199 : as_type<float>(_1248);
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1266 = _1264 != 0;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1274 = _1272 != 0;
    int _1276 = _1234 * _1226;
    int _1278 = _1276 + _1055;
    bool _1280 = !_1270;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = floor(_1236);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1288 = _1286 != 0;
    bool _1290 = !_1266;
    int _1292 = _1290 ? 0 : 1;
    int _1294 = abs(_1282);
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1298 = _1296 != 0;
    bool _1300 = !_1288;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = abs(_1292);
    bool _1306 = !_1298;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = abs(_1302);
    int _1312 = _1224 * _1294;
    float _1314 = _969 * 2.0;
    int _1316 = abs(_1308);
    int _1318 = _1258 * _1304;
    int _1320 = _1318 + _1312;
    int _1322 = ~_983;
    int _1324 = _1322 + 1;
    float _1326 = floor(_1314);
    int _1328 = ~_983;
    int _1330 = _1328 + 1;
    int _1332 = _1278 * _1310;
    int _1334 = _1332 + _1320;
    bool _1336 = _1084 > 0.5;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1338;
    int _1342 = _1234 * _1316;
    int _1344 = _1342 + _1334;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1350 = 1.0 / _1340;
    float _1352 = float(uint(_1344));
    float _1354 = as_type<float>(_1051) * _1352;
    float _1356 = 1.0 / _1348;
    float _1358 = trunc(_1354);
    float _1360 = precise::max(_1358, 0.0);
    uint _1362 = uint(_1360);
    float _1364 = _979 * _1356;
    bool _1366 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1368 = isnan(_961);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    int _1378 = _1324 * int(_1362);
    int _1380 = _1378 + _1344;
    float _1382 = float(uint(_1380));
    float _1384 = as_type<float>(_1051) * _1382;
    float _1386 = trunc(_1384);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    int _1392 = int(_1362) + int(_1390);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1402 = _1330 * _1392;
    int _1404 = _1402 + _1344;
    float _1406 = 1.0 / _1396;
    bool _1408 = uint(_1404) >= uint(_983);
    bool _1410 = !_1408;
    int _1412 = _1410 ? 0 : (-1);
    float _1414 = 1.0 / _1400;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1418 = _1416 != 0;
    int _1420 = ~_1392;
    int _1422 = _1420 + _1412;
    int _1424 = _1422 + 1;
    int _1426 = _983 * _1424;
    int _1428 = _1426 + _1344;
    float _1430 = -_203;
    int _1432 = _1336 ? as_type<int>(_1430) : as_type<int>(_203);
    bool _1434 = _1082 > 0.5;
    bool _1436 = !_1168;
    int _1438 = _1436 ? _1428 : (-1);
    float _1440 = -_199;
    int _1442 = _1434 ? as_type<int>(_1440) : as_type<int>(_199);
    bool _1444 = !_1418;
    float _1446 = _1444 ? _203 : as_type<float>(_1432);
    int _1448 = _1438 & 3;
    bool _1450 = _1448 != 0;
    bool _1452 = !_1274;
    float _1454 = _1452 ? _199 : as_type<float>(_1442);
    bool _1456 = uint(_1448) >= 2u;
    int _1458 = _1438 & 3;
    bool _1460 = _1458 != 0;
    int _1462 = _1456 ? 0 : 1;
    bool _1464 = _1448 != 3;
    int _1466 = _1460 ? 0 : 1;
    bool _1468 = uint(_1448) > 1u;
    int _1470 = ~_1462;
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    int _1476 = ~_1466;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    int _1482 = _1474;
    int _1484 = _1480;
    if (_1464)
    {
        int _1486 = ~_1462;
        int _1488 = _1486 + 1;
        _1482 = _1488;
    }
    int _1490 = _1482;
    bool _1492 = _969 > 0.5;
    if (!_1468)
    {
        int _1494 = ~_1466;
        int _1496 = _1494 + 1;
        _1484 = _1496;
    }
    int _1498 = _1484;
    float _1500 = -_199;
    int _1502 = _1492 ? as_type<int>(_1500) : as_type<int>(_199);
    bool _1504 = _1326 >= 0.0;
    bool _1506 = isnan(_1326);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(0.0);
    bool _1512 = _1508 || _1510;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1516 = _1514 != 0;
    int _1518 = _1512 ? 0 : 1;
    bool _1520 = _1326 > 0.0;
    float _1522 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1524 = !_1516;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1530 = _1528 != 0;
    float _1532 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1522);
    int _1534 = abs(_1490);
    bool _1536 = !_1530;
    float _1538 = _1536 ? _199 : as_type<float>(_1502);
    int _1540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1542 = _1540 != 0;
    float _1544 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1546 = _1082 * 2.0;
    int _1548 = ~_1518;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = _1538 + 0.5;
    int _1556 = _1552;
    if (!_1520)
    {
        int _1558 = ~_1518;
        int _1560 = _1558 + 1;
        _1556 = _1560;
    }
    int _1562 = _1556;
    float _1564 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1544);
    bool _1566 = _1284 >= 0.0;
    bool _1568 = isnan(_1284);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    float _1576 = floor(_1546);
    float _1578 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1580 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1564);
    int _1582 = _1574 ? 0 : 1;
    float _1584 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1532);
    bool _1586 = _1284 > 0.0;
    float _1588 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _993);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1592 = _961 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1596 = _961 + _1594;
    float _1598 = _1584 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1600 = _1592 * _1406;
    float _1602 = _1596 * _1414;
    float _1604 = 1.0 / _1069;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1608 = _961 + _1606;
    int _1610 = ~_1582;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1618 = _961 + _1616;
    float _1620 = fma(_1019, _1600, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    int _1622 = _1614;
    if (!_1586)
    {
        int _1624 = ~_1582;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = _1608 * _1063;
    bool _1632 = _1576 >= 0.0;
    bool _1634 = isnan(_1576);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1618 * _1350;
    float _1644 = -_1080;
    float _1646 = _1644 + 1.0;
    int _1648 = _1640 ? 0 : 1;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1652 = _961 + _1650;
    bool _1654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1656 = isnan(0.0);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1662 = _1658 || _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1664;
    float _1668 = _1652 * _1604;
    float _1670 = _1662 ? _1646 : 0.0;
    float _1672 = fma(_1666, _1600, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1674 = _1576 > 0.0;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1684 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1686 = isnan(_961);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1376;
    float _1698 = _1696 + 1.0;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1704 = fma(_1682, _1364, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1706 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1708 = isnan(_961);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = _1694 * _1698;
    float _1720 = -_1694;
    float _1722 = _1720 + 1.0;
    bool _1724 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1726 = isnan(_961);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1736;
    float _1740 = fma(_1678, _1642, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1742 = _1716 * _1722;
    bool _1744 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1746 = isnan(_961);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = -_1734;
    float _1758 = _1756 + 1.0;
    float _1760 = fma(_1738, _1642, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1762 = fma(_1702, _1602, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1764 = fma(_1023, _1602, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1766 = _1754 * _1758;
    float _1768 = -_1754;
    float _1770 = _1768 + 1.0;
    float _1772 = -_1716;
    float _1774 = _1772 + 1.0;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1778 = _1776 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1780 = _1580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1782;
    float _1786 = _1734 * _1774;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1790 = 1.0 + _1788;
    float _1792 = fma(_1778, _1364, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1794 = fma(_1784, _1630, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1796 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1798 = isnan(_961);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    bool _1808 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1810 = isnan(_961);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = 1.0 / _1790;
    float _1822 = _1806 * _1770;
    float _1824 = -_1806;
    float _1826 = _1824 + 1.0;
    float _1828 = -_1818;
    float _1830 = _1828 + 1.0;
    int _1832 = abs(_1526);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1840 = _1838 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1842;
    float _1846 = _1009 * _1830;
    float _1848 = fma(_1836, _1630, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1854 = -_1009;
    float _1856 = _1854 + 1.0;
    float _1858 = _1672 * _1846;
    float _1860 = _1620 * _1846;
    float _1862 = _1818 * _1826;
    float _1864 = fma(_1852, _1071, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1866 = _1670 * _1820;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1868;
    float _1872 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1858);
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1860);
    float _1876 = fma(_1844, _1668, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1878 = float(uint(_1278));
    float _1880 = fma(_1870, _1668, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1884 = as_type<float>(_1051) * _1878;
    float _1886 = _1858;
    float _1888 = _1862;
    float _1890 = _1786;
    if (!_975)
    {
        float _1892 = in.m_54.z;
        _1886 = _1892;
    }
    float _1894 = _1886;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1898 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1882);
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1902 = trunc(_1884);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    float _1908 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1910 = fma(_1762, _1862, _1872);
    float _1912 = fma(_1764, _1862, _1874);
    float _1914 = fma(_1840, _1071, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1916 = -_1900;
    float _1918 = fma(_1908, 2.0, _1916);
    float _1920 = fma(_1740, _1822, _1910);
    int _1922 = ~_983;
    int _1924 = _1922 + 1;
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1928 = _1598 + _1926;
    float _1930 = -_1896;
    float _1932 = fma(_1136, 2.0, _1930);
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1936 = ~_1648;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1946 = _1780 + _1944;
    float _1948 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1950 = _1924 * int(_1906);
    int _1952 = _1950 + _1278;
    int _1954 = _1940;
    if (!_1674)
    {
        int _1956 = ~_1648;
        int _1958 = _1956 + 1;
        _1954 = _1958;
    }
    int _1960 = _1954;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1964 = _1942 + _1962;
    float _1966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1968 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1948);
    float _1970 = fma(_1760, _1822, _1912);
    float _1972 = float(uint(_1952));
    float _1974 = _1182 + _969;
    float _1976 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1968);
    float _1978 = _1974;
    float _1980 = _1894;
    if (!_975)
    {
        _1888 = _1894;
    }
    float _1982 = _1888;
    float _1984 = fma(_1792, _1766, _1970);
    float _1986 = _1974 + (-1.0);
    float _1988 = as_type<float>(_1051) * _1972;
    float _1990 = _1982;
    if (_975)
    {
        _1978 = _1250;
    }
    float _1992 = _1978;
    float _1994 = -_125;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1932);
    float _1998 = _1992;
    if (_975)
    {
        _1990 = _1250;
    }
    float _2000 = _1990;
    float _2002 = _1262 + 0.5;
    if (_975)
    {
        _1980 = _1250;
    }
    float _2004 = _1980;
    float _2006 = trunc(_1988);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    if (!_975)
    {
        _1998 = _969;
    }
    float _2012 = _1998;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2016 = _1976 >= 0.0;
    float _2018 = fma(_1704, _1766, _1920);
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1934);
    float _2022 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2024 = _1454 + 0.5;
    float _2026 = -_125;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1918);
    float _2030 = fma(_1794, _1786, _2018);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[90].x, _1996);
    int _2034 = _1438 >> 31;
    float _2036 = fma(_2022, _2024, _2028);
    float _2038 = fma(_1848, _1786, _1984);
    int _2040 = _2034 & 3;
    float _2042 = fma(_1864, _1742, _2030);
    if (_2016)
    {
        _1890 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2044 = _1890;
    float _2046 = fma(_1914, _1742, _2038);
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2050 = _1438 + _2040;
    float _2052 = _1928 * _1928;
    int _2054 = int(_1906) + int(_2010);
    float _2056 = fma(_2014, -2.0, _2048);
    int _2058 = _2050 >> 2;
    int _2060 = as_type<int>(_2044);
    if (_2016)
    {
        float _2062 = _2044 * 5.0;
        _2060 = as_type<int>(_2062);
    }
    int _2064 = _2060;
    int _2066 = ~_983;
    int _2068 = _2066 + 1;
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2072 = _2058 << 4;
    int _2074 = _2072 + 656;
    float _2076 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6699 = as_type<float>(_2064);
        out.gl_Position.z = _6699;
    }
    int _2078 = _2068 * _2054;
    int _2080 = _2078 + _1278;
    float _2082 = -_203;
    int _2084 = _1228 ? as_type<int>(_2082) : as_type<int>(_203);
    float _2086 = fma(_1876, _1718, _2042);
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2090 = _1448 != 3;
    float _2092 = fma(_1880, _1718, _2046);
    bool _2094 = uint(_2080) >= uint(_983);
    float _2096 = fma(_2076, -2.0, _2088);
    bool _2098 = !_1450;
    int _2100 = _2098 ? 0 : 1;
    float _2102 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1898);
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2106 = fma(_1946, _1946, _2052);
    float _2108 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2056);
    uint _2110 = uint(int(uint(_2074) >> uint(2)));
    uint _2112 = uint(int(uint(int(_2110)) >> uint(2)));
    int _2114 = int(_2110) & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    int _2118 = int(_2110) + 1;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    int _2122 = _2118 & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    bool _2126 = !_2094;
    int _2128 = _2126 ? 0 : (-1);
    float _2130 = fma(_1964, _1964, _2106);
    bool _2132 = !_1542;
    float _2134 = _2132 ? _203 : as_type<float>(_2084);
    float _2136 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2140 = _2138 != 0;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2144 = _2142 != 0;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2148 = _2146 != 0;
    float _2150 = rsqrt(_2130);
    float _2152 = _1446 + (-0.5);
    int _2154 = _2074 + 8;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    float _2172 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2096);
    float _2174 = -_2102;
    float _2176 = _2174 + 1.0;
    float _2178 = -_2136;
    float _2180 = -_2108;
    float _2182 = fma(_2178, _2152, _2180);
    float _2184 = _1254 + (-0.5);
    float _2186 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2020);
    float _2188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2190 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2192 = -_2184;
    float _2194 = -_2172;
    float _2196 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[90].y, _2194);
    float _2198 = -_2176;
    float _2200 = fma(_1454, _2198, _2036);
    float _2202 = -_2134;
    float _2204 = _2202 + 0.5;
    float _2206 = _1578 * _2104;
    float _2208 = -_2186;
    float _2210 = _2208 + 1.0;
    bool _2212 = !_2090;
    int _2214 = _2212 ? 0 : (-1);
    float _2216 = _2190 * _2150;
    float _2218 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2220 = fma(_1446, _2210, _2182);
    int _2222 = abs(_2214);
    float _2224 = _1928 * _2216;
    float _2226 = _1946 * _2216;
    int _2228 = ~_2054;
    int _2230 = _2228 + _2128;
    int _2232 = _2230 + 1;
    float _2234 = _1964 * _2216;
    float _2236 = _2218 * _2188;
    int _2238 = abs(_1498);
    float _2240 = -_2224;
    float _2242 = _1928 + _2240;
    float _2244 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2086);
    float _2246 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2092);
    float _2248 = -_2226;
    float _2250 = _1946 + _2248;
    float _2252 = _2242 * _2242;
    out.m_60.x = _2206;
    out.m_60.y = _2236;
    out.m_60.z = _2200;
    out.m_60.w = _2220;
    int _2254 = ~_2238;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _983 * _2232;
    int _2262 = _2260 + _1278;
    float _2264 = fma(_2250, _2250, _2252);
    int _2266 = abs(_2100);
    float _2268 = -_2234;
    float _2270 = _1964 + _2268;
    float _2272 = float(_1960);
    out.m_62.x = _2244;
    out.m_62.y = _2246;
    float _2274 = fma(_2270, _2270, _2264);
    int _2276 = _2258 * as_type<int>(_2124);
    int _2278 = ~_2266;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    if (_2016)
    {
        out.m_45.x = 0.0;
    }
    float _2284 = float(_1562);
    float _2286 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2288 = _2282 * as_type<int>(_2116);
    int _2290 = _2288 + _2276;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2294 = ~_1534;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2302 = ~_2222;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2292);
    int _2310 = _2298 * as_type<int>(_2162);
    int _2312 = _2310 + _2290;
    float _2314 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2300);
    float _2316 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2308);
    float _2318 = in.m_64.x;
    float _2320 = in.m_64.y;
    float _2322 = in.m_64.z;
    int _2324 = _2306 * as_type<int>(_2170);
    int _2326 = _2324 + _2312;
    bool _2328 = !_2140;
    int _2330 = _2328 ? 0 : 1;
    float _2332 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2314);
    float _2334 = -_2316;
    float _2336 = _2334 + 1.0;
    int _2338 = abs(_2330);
    float _2340 = -_2332;
    float _2342 = _2340 + 1.0;
    float _2344 = -_2336;
    float _2346 = fma(_1262, _2344, _2032);
    int _2348 = ~_1832;
    int _2350 = _2348 + 1;
    int _2352 = _2350 + 1;
    float _2354 = fma(_1254, _2342, _2196);
    bool _2356 = !_1168;
    int _2358 = _2356 ? _2262 : (-1);
    int _2360 = _2326 * _2352;
    float _2362 = float(_2338);
    bool _2364 = !_2144;
    int _2366 = _2364 ? 0 : 1;
    int _2368 = _2358 * _1832;
    int _2370 = _2368 + _2360;
    out.m_66.x = _2346;
    out.m_66.y = _2354;
    float _2372 = _2362 * _2272;
    int _2374 = abs(_2366);
    float _2376 = _969 + (-0.5);
    float _2378 = float(_2370);
    float _2380 = _2372 * (-2.0);
    float _2382 = float(_2374);
    bool _2384 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2386 = isnan(1.0);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2392 = _2388 || _2390;
    out.m_68.z = _2378;
    float _2394 = fma(_2380, _2318, _2318);
    float _2396 = _2382 * _2284;
    float _2398 = fma(_2286, _2380, _2286);
    float _2400 = _1082 + _1182;
    float _2402 = fma(_2376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2394);
    bool _2404 = !_2148;
    int _2406 = _2404 ? 0 : 1;
    float _2408 = _2322;
    if (_2016)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2410 = -_2224;
    float _2412 = _1598 + _2410;
    int _2414 = abs(_2406);
    float _2416 = -_2226;
    float _2418 = _1780 + _2416;
    bool _2420 = !_2392;
    float _2422 = _2420 ? _125 : _1866;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2426 = _2412 + _2424;
    float _2428 = float(_1628);
    float _2430 = -_2234;
    float _2432 = _1942 + _2430;
    float _2434 = float(_2414);
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2438 = _2418 + _2436;
    float _2440 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2442 = _2400 + (-1.0);
    float _2444 = fma(_2422, _2398, _2402);
    float _2446 = _2396 * (-2.0);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2450 = _2432 + _2448;
    float _2452 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2440);
    float _2454 = _2434 * _2428;
    float _2456 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2458 = _2444 * 0.15915493667125701904296875;
    float _2460 = _1182 + (-0.5);
    float _2462 = fma(_2446, _2320, _2320);
    float _2464 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2452);
    float _2466 = _1082 + _969;
    float _2468 = fma(_2456, _2446, _2456);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2462);
    float _2472 = _2466 + (-1.0);
    bool _2474 = _2464 >= 0.0;
    float _2476 = _2454 * (-2.0);
    float _2478 = fma(_2422, _2468, _2470);
    float _2480 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2482 = _1082 + (-0.5);
    float _2484 = fma(_2476, _2322, _2322);
    float _2486 = _2478 * 0.15915493667125701904296875;
    float _2488 = fma(_2480, _2476, _2480);
    float _2490 = sqrt(_2274);
    float _2492 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2484);
    float _2494 = _2418;
    if (_2474)
    {
        _2408 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2496 = _2408;
    float _2498 = fma(_2422, _2488, _2492);
    int _2500 = as_type<int>(_2496);
    if (_2474)
    {
        out.m_45.x = 0.0;
    }
    float _2502 = _2458 * 6.283185482025146484375;
    float _2504 = sin(_2502);
    if (_2474)
    {
        float _2506 = _2496 * 5.0;
        _2500 = as_type<int>(_2506);
    }
    int _2508 = _2500;
    float _2510 = _2498 * 0.15915493667125701904296875;
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7394 = as_type<float>(_2508);
        out.gl_Position.z = _7394;
    }
    float _2512 = _2458 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    float _2516 = _2486 * 6.283185482025146484375;
    float _2518 = sin(_2516);
    float _2520 = _2486 * 6.283185482025146484375;
    float _2522 = cos(_2520);
    if (_2474)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2524 = _2510 * 6.283185482025146484375;
    float _2526 = cos(_2524);
    float _2528 = _2150 * _2490;
    float _2530 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2536 = _1011 * _2528;
    float _2538 = _2528 * _2530;
    float _2540 = _2514 * _2522;
    float _2542 = _2510 * 6.283185482025146484375;
    float _2544 = sin(_2542);
    float _2546 = _2532 * _2538;
    float _2548 = _2504 * _2518;
    float _2550 = _2526 * _2546;
    float _2552 = _2534 * _2536;
    float _2554 = _2514 * _2518;
    float _2556 = _2504 * _2522;
    float _2558 = _2514 * _2550;
    float _2560 = _2518 * _2526;
    float _2562 = _2522 * _2526;
    float _2564 = _2504 * _2550;
    float _2566 = fma(_2544, _2540, _2548);
    float _2568 = -_2546;
    float _2570 = _2544 * _2568;
    float _2572 = -_2556;
    float _2574 = fma(_2544, _2554, _2572);
    float _2576 = -_2554;
    float _2578 = fma(_2544, _2556, _2576);
    float _2580 = fma(_2566, _2552, _2558);
    float _2582 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2584 = _2582 * 0.5;
    float _2586 = fma(_2562, _2552, _2570);
    float _2588 = fma(_2544, _2548, _2540);
    float _2590 = fma(_2578, _2552, _2564);
    float _2592 = fma(_2574, _2584, _2580);
    float _2594 = fma(_2560, _2584, _2586);
    float _2596 = fma(_2588, _2584, _2590);
    float _2598 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2602 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2604 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2606 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2600);
    float _2608 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2602);
    float _2610 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2604);
    float _2612 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    float _2614 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2608);
    float _2616 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2618 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2620 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2622 = _1942 + _2616;
    float _2624 = _1780 + _2618;
    float _2626 = _1598 + _2620;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2630 = _2622 + _2628;
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2634 = _2624 + _2632;
    float _2636 = _2630 * _2630;
    float _2638 = fma(_2634, _2634, _2636);
    float _2640 = sqrt(_2638);
    bool _2642 = _2640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2644 = _2596;
    float _2646 = _2636;
    float _2648 = _2624;
    float _2650 = _2630;
    float _2652 = _2580;
    float _2654 = _2638;
    float _2656 = _2626;
    if (!_2642)
    {
        _2644 = _2622;
    }
    float _2658 = _2644;
    float _2660 = _2658;
    if (!_2642)
    {
        _2646 = _2626;
    }
    float _2662 = _2646;
    bool _2664 = !_2642;
    float _2666 = _2662;
    if (!_2664)
    {
        float _2668 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2672 = _2640 + _2670;
        float _2674 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2676 = rsqrt(_2638);
        float _2678 = _2672 * _2668;
        float _2680 = _2678 * 0.15915493667125701904296875;
        float _2682 = _2680 * 6.283185482025146484375;
        float _2684 = cos(_2682);
        float _2686 = _2680 * 6.283185482025146484375;
        float _2688 = sin(_2686);
        float _2690 = _2684 + (-1.0);
        float _2692 = fma(_2688, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2694 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2696 = _2676 * _2692;
        float _2698 = fma(_2626, _2684, _2694);
        float _2700 = fma(_2634, _2696, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2702 = fma(_2630, _2696, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2666 = _2698;
        _2648 = _2700;
        _2660 = _2702;
    }
    float _2704 = _2666;
    float _2706 = _2648;
    float _2708 = _2660;
    float _2710 = -_1598;
    float _2712 = _2710 + _2704;
    float _2714 = -_1780;
    float _2716 = _2714 + _2706;
    float _2718 = -_1942;
    float _2720 = _2718 + _2708;
    float _2722 = _2712 * _2712;
    float _2724 = fma(_2716, _2716, _2722);
    float _2726 = fma(_2720, _2720, _2724);
    float _2728 = sqrt(_2726);
    bool _2730 = _2728 > 0.0;
    float _2732 = _2728;
    float _2734 = _2708;
    float _2736 = _2706;
    if (!_2730)
    {
        _2650 = _2706;
    }
    float _2738 = _2650;
    float _2740 = _2738;
    if (!_2730)
    {
        _2732 = _2704;
    }
    float _2742 = _2732;
    bool _2744 = !_2730;
    float _2746 = _2742;
    float _2748 = _2742;
    float _2750 = _2742;
    if (!_2744)
    {
        bool _2752 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2754 = _2738;
        if (_2752)
        {
            float _2756 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2754 = _2756;
        }
        float _2758 = _2754;
        float _2760 = _2758;
        if (_2752)
        {
            float _2762 = _417 * _2758;
            _2652 = _2762;
        }
        float _2764 = _2652;
        float _2766 = _2764;
        if (_2752)
        {
            float _2768 = _419 * _2758;
            _2654 = _2768;
        }
        float _2770 = _2654;
        float _2772 = _2770;
        if (_2752)
        {
            float _2774 = _421 * _2758;
            _2656 = _2774;
        }
        float _2776 = _2656;
        float _2778 = _2776;
        if (!_2752)
        {
            float _2780 = _125 + 1.0;
            float _2782 = _2780;
            if (!_159)
            {
                float _2784 = _2780 * _2780;
                float _2786 = _2784 * 0.5;
                _2746 = _2786;
            }
            float _2788 = _2746;
            float _2790 = _2788;
            if (!_159)
            {
                float _2792 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2790 = _2792;
            }
            float _2794 = _2790;
            bool _2796 = !_159;
            float _2798 = _2794;
            if (!_2796)
            {
                float _2800 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2802 = log2(_2800);
                float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2806 = 1.0 + _2804;
                float _2808 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2810 = _2802 * _2780;
                float _2812 = 1.0 / _2806;
                float _2814 = _2808 * 0.693147182464599609375;
                float _2816 = exp2(_2810);
                float _2818 = 1.0 / _2814;
                float _2820 = _2816 + (-1.0);
                float _2822 = -_2820;
                float _2824 = fma(_2822, _2818, _2780);
                float _2826 = _2824 * _2812;
                float _2828 = _2826 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2798 = _2828;
            }
            float _2830 = _2798;
            float _2832 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2834 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2836 = !_159;
            _2760 = _2832;
            if (!_2836)
            {
                float _2838 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2840 = log2(_2838);
                float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2844 = 1.0 + _2842;
                float _2846 = 1.0 / _2844;
                float _2848 = _2840 * _2780;
                float _2850 = exp2(_2848);
                float _2852 = -_2850;
                float _2854 = _2852 + 1.0;
                float _2856 = _2854 * _2846;
                _2782 = _2856;
            }
            float _2858 = _2782;
            float _2860 = fma(_2858, _163, _2834);
            float _2862 = fma(_2858, _161, _2832);
            float _2864 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2866 = -_373;
            float _2868 = _2866 + _2860;
            float _2870 = -_383;
            float _2872 = _2870 + _2862;
            float _2874 = fma(_2858, _165, _2864);
            float _2876 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2878 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2880 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2882 = -_391;
            float _2884 = _2882 + _2874;
            float _2886 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2876);
            float _2888 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2878);
            float _2890 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2880);
            float _2892 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2886);
            float _2894 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2888);
            float _2896 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2890);
            _425 = _2894;
            _427 = _2892;
            _429 = _2896;
            _2766 = _2892;
            _2772 = _2894;
            _2778 = _2896;
            _2748 = _2878;
        }
        float _2898 = _425;
        float _2900 = _427;
        float _2902 = _429;
        float _2904 = _2766;
        float _2906 = _2772;
        float _2908 = _2778;
        float _2910 = _2748;
        float _2912 = _2760;
        float _2914 = _2898 * _2898;
        float _2916 = rsqrt(_2726);
        float _2918 = fma(_2900, _2900, _2914);
        float _2920 = fma(_2902, _2902, _2918);
        float _2922 = sqrt(_2920);
        float _2924 = _2712 * _2916;
        float _2926 = _2716 * _2916;
        float _2928 = _2720 * _2916;
        bool _2930 = _2922 > 0.0;
        float _2932 = _2912;
        float _2934 = _2910;
        _431 = _2900;
        if (!_2930)
        {
            _2932 = _2706;
        }
        float _2936 = _2932;
        _2740 = _2936;
        if (!_2930)
        {
            _2934 = _2704;
        }
        float _2938 = _2934;
        bool _2940 = !_2930;
        _2750 = _2938;
        if (!_2940)
        {
            float _2942 = rsqrt(_2920);
            float _2944 = _2942 * _2898;
            float _2946 = _2942 * _2900;
            float _2948 = _2942 * _2902;
            float _2950 = _2924 * _2944;
            float _2952 = fma(_2926, _2946, _2950);
            float _2954 = fma(_2928, _2948, _2952);
            float _2956 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2958 = fma(_2904, _2956, _2706);
            float _2960 = fma(_2906, _2956, _2704);
            float _2962 = fma(_2908, _2956, _2708);
            _2734 = _2962;
            _2750 = _2960;
            _2740 = _2958;
        }
    }
    float _2964 = _2734;
    float _2966 = _2750;
    float _2968 = _2740;
    float _2970 = _431;
    float _2972 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2972);
    bool _2986 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2988 = isnan(0.5);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2994 = _2990 || _2992;
    float _2996 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2984);
    float _2998 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3000 = _2996 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3002 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2998);
    float _3004 = 1.0 / _3000;
    float _3006 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3002);
    float _3008 = _2966;
    float _3010 = _2970;
    if (_2994)
    {
        _2736 = 1.0;
    }
    float _3012 = _2736;
    float _3014 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3016 = _3014 + _3000;
    float _3018 = -_2234;
    float _3020 = _3018 + _2964;
    float _3022 = _3016 * _3004;
    float _3024 = _3022 * 0.5;
    float _3026 = -_2224;
    float _3028 = _3026 + _2966;
    float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3032 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3030);
    float _3034 = -_2226;
    float _3036 = _3034 + _2968;
    float _3038 = 1.0 / _3032;
    float _3040 = _3028;
    float _3042 = _3036;
    float _3044 = _3020;
    float _3046 = _3012;
    if (!_2982)
    {
        float _3048 = _2426 * _2426;
        float _3050 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3052 = -_1942;
        float _3054 = _3052 + _2964;
        float _3056 = -_1598;
        float _3058 = _3056 + _2966;
        float _3060 = fma(_2438, _2438, _3048);
        float _3062 = fma(_2450, _2450, _3060);
        float _3064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3066 = sqrt(_3062);
        float _3068 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3070 = 1.0 / _2528;
        float _3072 = precise::min(_3066, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3074 = _3072 * _3064;
        float _3076 = _3074 * _3070;
        float _3078 = -_1780;
        float _3080 = _3078 + _2968;
        float _3082 = _3068 * _3076;
        float _3084 = _3054 * _3076;
        float _3086 = fma(_3080, _3082, _2418);
        float _3088 = fma(_3058, _3082, _2412);
        float _3090 = fma(_3068, _3084, _2432);
        _3040 = _3088;
        _3042 = _3086;
        _3044 = _3090;
    }
    float _3092 = _3040;
    float _3094 = _3042;
    float _3096 = _3044;
    if (_2994)
    {
        _3008 = 1.0;
    }
    float _3098 = _3008;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3102 = _3038 * _3100;
    float _3104 = _3098;
    float _3106 = _3102;
    if (!_2994)
    {
        float _3108 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3110 = _3108 * 0.15915493667125701904296875;
        float _3112 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3114 = _3110 * 6.283185482025146484375;
        float _3116 = cos(_3114);
        float _3118 = _3112 * 0.15915493667125701904296875;
        float _3120 = _3110 * 6.283185482025146484375;
        float _3122 = sin(_3120);
        float _3124 = 1.0 / _3116;
        float _3126 = _3118 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        float _3130 = _3122 * _3124;
        float _3132 = _3118 * 6.283185482025146484375;
        float _3134 = sin(_3132);
        float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3138 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3136;
        float _3140 = _3128 * _3130;
        float _3142 = 1.0 / _3138;
        float _3144 = 1.0 / _3140;
        float _3146 = _3134 * _3144;
        float _3148 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3150 = fma(_3102, _3146, _3148);
        float _3152 = _3150 * _3142;
        float _3154 = precise::clamp(_3152, 0.0, 1.0);
        _2494 = _3142;
        _3046 = _3154;
    }
    float _3156 = _2494;
    float _3158 = _3046;
    float _3160 = _3156;
    if (!_2994)
    {
        float _3162 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3164 = _3162 * 0.15915493667125701904296875;
        float _3166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3168 = _3164 * 6.283185482025146484375;
        float _3170 = cos(_3168);
        float _3172 = _3166 * 0.15915493667125701904296875;
        float _3174 = _3164 * 6.283185482025146484375;
        float _3176 = sin(_3174);
        float _3178 = 1.0 / _3170;
        float _3180 = _3172 * 6.283185482025146484375;
        float _3182 = cos(_3180);
        float _3184 = _3176 * _3178;
        float _3186 = _3172 * 6.283185482025146484375;
        float _3188 = sin(_3186);
        float _3190 = _3182 * _3184;
        float _3192 = 1.0 / _3190;
        float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3196 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3194;
        float _3198 = 1.0 / _3196;
        float _3200 = _3188 * _3192;
        float _3202 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3204 = fma(_3102, _3200, _3202);
        float _3206 = _3204 * _3198;
        float _3208 = precise::clamp(_3206, 0.0, 1.0);
        float _3210 = -_3208;
        float _3212 = _3210 + 1.0;
        _3160 = _3192;
        _3104 = _3212;
    }
    float _3214 = _3160;
    float _3216 = _3104;
    float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3220 = _3092 + _3218;
    float _3222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3224 = _3094 + _3222;
    float _3226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3228 = _3096 + _3226;
    float _3230 = _3220 * _3220;
    float _3232 = fma(_3224, _3224, _3230);
    float _3234 = fma(_3228, _3228, _3232);
    float _3236 = rsqrt(_3234);
    float _3238 = sqrt(_3234);
    float _3240 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3242 = _3224 * _3240;
    float _3244 = _3228 * _3240;
    float _3246 = _3242 * _3242;
    float _3248 = _3244 * _3244;
    float _3250 = _3246 + _3248;
    float _3252 = sqrt(_3250);
    bool _3254 = _3252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3258 = _3252 + _3256;
    float _3260 = _3228;
    float _3262 = _3214;
    float _3264 = _3258;
    float _3266 = _3220;
    if (_3254)
    {
        float _3268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3260 = _3268;
    }
    float _3270 = _3260;
    if (_3254)
    {
        float _3272 = rsqrt(_3250);
        _3262 = _3272;
    }
    float _3274 = _3262;
    float _3276 = _3274;
    if (_3254)
    {
        float _3278 = _3258 * _3270;
        _3264 = _3278;
    }
    float _3280 = _3264;
    if (_3254)
    {
        float _3282 = _3280 * 0.15915493667125701904296875;
        _3106 = _3282;
    }
    float _3284 = _3106;
    float _3286 = _3236;
    if (_3254)
    {
        float _3288 = _3284 * 6.283185482025146484375;
        float _3290 = sin(_3288);
        _3286 = _3290;
    }
    float _3292 = _3286;
    float _3294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3296 = precise::max(0.0, _3294);
    float _3298 = _3232;
    float _3300 = _3294;
    if (_3254)
    {
        float _3302 = _3284 * 6.283185482025146484375;
        float _3304 = cos(_3302);
        _3298 = _3304;
    }
    float _3306 = _3298;
    float _3308 = -_3240;
    float _3310 = -_3296;
    float _3312 = fma(_3220, _3308, _3310);
    float _3314 = _3312;
    if (_3254)
    {
        float _3316 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3300 = _3316;
    }
    float _3318 = _3300;
    float _3320 = _3292;
    float _3322 = _3318;
    if (_3254)
    {
        float _3324 = fma(_3292, _3318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3266 = _3324;
    }
    float _3326 = _3266;
    float _3328 = _3326;
    if (!_3254)
    {
        _3320 = _3242;
    }
    float _3330 = _3320;
    float _3332 = _3330;
    float _3334 = _3306;
    if (_3254)
    {
        float _3336 = _3306 + (-1.0);
        _3322 = _3336;
    }
    float _3338 = _3322;
    float _3340 = _3338;
    if (_3254)
    {
        float _3342 = _3274 * _3326;
        _3010 = _3342;
    }
    float _3344 = _3010;
    if (!_3254)
    {
        _3328 = _3246;
    }
    float _3346 = _3328;
    float _3348 = _3346;
    if (_3254)
    {
        float _3350 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3276 = _3350;
    }
    float _3352 = _3276;
    if (_3254)
    {
        float _3354 = _3242 * _3344;
        _3332 = _3354;
    }
    float _3356 = _3332;
    if (!_3254)
    {
        _3340 = _3244;
    }
    float _3358 = _3340;
    float _3360 = _3358;
    if (_3254)
    {
        float _3362 = _3244 * _3344;
        _3360 = _3362;
    }
    float _3364 = _3360;
    if (_3254)
    {
        float _3366 = fma(_3312, _3306, _3352);
        _3314 = _3366;
    }
    float _3368 = _3314;
    if (_3254)
    {
        float _3370 = _3356 * _3356;
        _3348 = _3370;
    }
    float _3372 = _3348;
    if (!_3254)
    {
        _3334 = _3248;
    }
    float _3374 = _3334;
    float _3376 = _3374;
    if (_3254)
    {
        float _3378 = _3364 * _3364;
        _3376 = _3378;
    }
    float _3380 = _3376;
    float _3382 = fma(_3368, _3368, _3372);
    float _3384 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3386 = _3382 + _3380;
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3390 = fma(_3238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3388);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3396 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3384);
    float _3398 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3400 = -_3392;
    float _3402 = _3400 + 1.0;
    float _3404 = rsqrt(_3386);
    float _3406 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3394);
    float _3408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3410 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3412 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3396);
    float _3414 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3398);
    float _3416 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3406);
    float _3418 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3410);
    float _3420 = _3412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3422 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3414);
    float _3424 = _3416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3426 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3418);
    float _3428 = _3420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3430 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3432 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3434 = abs(_3402);
    float _3436 = log2(_3434);
    float _3438 = _3404 * _3356;
    float _3440 = -_3428;
    float _3442 = fma(_3440, _3408, 1.0);
    float _3444 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3432);
    float _3446 = _3404 * _3368;
    float _3448 = _3438 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3450 = _3426 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3452 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3454 = _3404 * _3364;
    float _3456 = -_3448;
    float _3458 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3456);
    float _3460 = log2(_3442);
    float _3462 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3452);
    float _3464 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3466 = -_3454;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3458);
    float _3470 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3472 = _3446 + 1.0;
    float _3474 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3476 = fma(_3468, -0.5, 0.5);
    float _3478 = 1.0 / _3462;
    float _3480 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3470);
    float _3482 = fma(_3468, 0.5, 0.5);
    float _3484 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3464);
    float _3486 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3480);
    float _3488 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3484);
    float _3490 = exp2(_3474);
    float _3492 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3486);
    float _3494 = _3460 * 0.693147182464599609375;
    float _3496 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3488);
    float _3498 = sqrt(_3476);
    float _3500 = fma(_3482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3502 = _3492 * _3478;
    float _3504 = fma(_3482, _3500, -0.212114393711090087890625);
    float _3506 = -_3446;
    float _3508 = fma(_3490, _3472, _3506);
    float _3510 = fma(_3482, _3504, 1.570728778839111328125);
    float _3512 = _3496 * _3478;
    float _3514 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3516 = fma(_3502, 0.5, 0.5);
    float _3518 = fma(_3508, 0.5, 0.5);
    float _3520 = fma(_3512, -0.5, 0.5);
    float _3522 = _3498 * 0.636619746685028076171875;
    float3 _8959 = float3(_3516, _3520, _3514);
    float _3524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8959, float3(0.0), isnan(_8959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8959, float3(0.0), isnan(_8959)), level(0.0)).x;
    float3 _8970 = float3(_3516, _3520, _3514);
    float4 _3527 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8970, float3(0.0), isnan(_8970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8970, float3(0.0), isnan(_8970)), level(0.0)).xyzw;
    float _3529 = _3527.x;
    float _3531 = _3527.y;
    float _3533 = _3527.z;
    float _3535 = _3527.w;
    float _3537 = -_3510;
    float _3539 = fma(_3522, _3537, 1.0);
    float2 _8992 = float2(_3539, _3518);
    float3 _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8992, float2(0.0), isnan(_8992)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8992, float2(0.0), isnan(_8992)), level(0.0)).xyz;
    float _3545 = _3543.x;
    float _3547 = _3543.y;
    float _3549 = _3543.z;
    float _3551 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3553 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3555 = _3158 > 0.0;
    bool _3557 = isnan(_3158);
    bool _3559 = _3555 || _3557;
    bool _3561 = isnan(0.0);
    bool _3563 = _3559 || _3561;
    float _3565 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3553);
    float _3567 = exp2(_3551);
    bool _3569 = _3216 <= 0.0;
    bool _3571 = !_3563;
    bool _3573 = _3569 || _3571;
    float _3575 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3565);
    float _3577 = _3158 * _3216;
    float _3579 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3575);
    float _3581 = _3492 + _3462;
    float _3583 = _3577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3585 = _3462 * 0.5;
    float _3587 = _3579 + _3462;
    float _3589 = _3581 * 0.5;
    out.gl_Position.x = _3492;
    out.gl_Position.y = _3496;
    out.gl_Position.z = _3579;
    out.gl_Position.w = _3462;
    float _3591 = fma(_3496, -0.5, _3585);
    float _3593 = _3587 * 0.5;
    float _3595 = -_3567;
    float _3597 = _3595 + 1.0;
    float _3599 = _3583 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3601 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3589;
    out.m_70.y = _3591;
    out.m_70.z = _3593;
    out.m_70.w = _3462;
    float _3603 = -_3601;
    float _3605 = _3603 + 1.0;
    out.m_45.x = _3599;
    float _3607 = _3601 * _3524;
    float _3609 = _3535 * _3605;
    float _3611 = _3535 * _3607;
    float _3613 = _3549 * _3607;
    float _3615 = fma(_3545, _3611, _3529);
    float _3617 = fma(_3547, _3611, _3531);
    float _3619 = fma(_3535, _3613, _3533);
    out.m_72.x = _3615;
    out.m_72.y = _3617;
    out.m_72.z = _3619;
    out.m_72.w = _3609;
    if (!_3573)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3621 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3621;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _953 = false;
    bool _793 = false;
    bool _451 = false;
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
        float _3678 = as_type<float>(_107);
        out.gl_Position.z = _3678;
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
        out.m_45.x = 0.0;
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
        float _3747 = as_type<float>(_143);
        out.gl_Position.z = _3747;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _145;
    float _209 = _187;
    float _211 = 0.0;
    if (!_205)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _147 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _147);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _231;
        _209 = _241;
        _211 = _229;
    }
    float _243 = _207;
    float _245 = _209;
    float _247 = _211;
    bool _249 = !_159;
    float _251 = _243;
    float _253 = _247;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _147 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _251 = _267;
        _253 = _261;
        _175 = _273;
    }
    float _275 = _251;
    float _277 = _253;
    float _279 = _175;
    float _281 = _275;
    float _283 = _277;
    if (!_159)
    {
        float _285 = _125 * _125;
        float _287 = _285 * 0.5;
        _281 = _287;
    }
    float _289 = _281;
    float _291 = _289;
    if (!_159)
    {
        _283 = _125;
    }
    float _293 = _283;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _293;
    if (!_159)
    {
        float _301 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _301;
    }
    float _303 = _291;
    bool _305 = !_159;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _125 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _125);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_159;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _125 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = fma(_279, _163, _297);
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_279, _161, _295);
    float _373 = fma(_363, _163, _365);
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _377 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = fma(_367, _149, _169);
    float _383 = fma(_363, _161, _369);
    float _385 = -_373;
    float _387 = _367 + _385;
    float _389 = fma(_279, _165, _377);
    float _391 = fma(_363, _165, _379);
    float _393 = fma(_371, _149, _167);
    float _395 = -_383;
    float _397 = _371 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = -_391;
    float _407 = _389 + _405;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _411 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _415 = fma(_389, _149, _171);
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = !_375;
    float _425 = _419;
    float _427 = _417;
    float _429 = _421;
    float _431 = _417;
    float _449;
    if (!_423)
    {
        float _433 = in.m_54.x;
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _437 = _433 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_91);
        float _455 = 1.0 / _453;
        float _457 = _125 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _481 = 1.0 / _467;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _491 = 1.0 / _471;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _495 = _459 + _493;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _499 = 1.0 / _479;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _459 + _501;
    float _505 = _495 * _481;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _509 = _459 + _507;
    float _511 = 1.0 / _475;
    float _513 = _503 * _491;
    bool _515 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _517 = isnan(_459);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    bool _527 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _529 = isnan(_459);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    bool _539 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _541 = isnan(_459);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _489;
    float _553 = _509 * _499;
    bool _555 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _557 = isnan(_459);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_549;
    float _569 = _567 + 1.0;
    float _571 = -_565;
    float _573 = _571 + 1.0;
    float _575 = _463 * _511;
    float _577 = -_525;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _485;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _585 = _459 + _583;
    float _587 = _549 * _573;
    float _589 = _537 * _579;
    float _591 = -_537;
    float _593 = _591 + 1.0;
    bool _595 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _597 = isnan(_459);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _585 * _551;
    bool _609 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _611 = isnan(_459);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _565 * _593;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _627;
    bool _631 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _633 = isnan(_459);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = _619 * _569;
    float _645 = fma(_625, _505, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _647 = fma(_629, _505, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _649 = -_605;
    float _651 = _649 + 1.0;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _655 = _459 + _653;
    float _657 = -_619;
    float _659 = _657 + 1.0;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _665 = _641 * _651;
    float _667 = _655 * _581;
    float _669 = _605 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _675 = _645 * _665;
    float _677 = _647 * _665;
    float _679 = -_641;
    float _681 = _679 + 1.0;
    float _683 = fma(_663, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _689;
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[143].x, _675);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _695;
    float _699 = fma(_673, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _707 = fma(_687, _553, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _709 = fma(_683, _669, _693);
    float _711 = fma(_691, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _713 = in.m_52.x;
    float _715 = in.m_52.y;
    float _717 = fma(_697, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _719 = fma(_699, _669, _701);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _725;
    float _729 = fma(_711, _643, _709);
    float _731 = fma(_705, _553, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _733 = fma(_717, _643, _719);
    float _735 = fma(_723, _667, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _737 = fma(_727, _667, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _743 = fma(_707, _587, _729);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _749 = fma(_731, _587, _733);
    float _751 = fma(_741, _607, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _753 = fma(_735, _621, _743);
    float _755 = fma(_747, _607, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _757 = fma(_737, _621, _749);
    float _759 = fma(_751, _589, _753);
    float _761 = fma(_755, _589, _757);
    float _763 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[149].x, _759);
    float _765 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[149].y, _761);
    float _767 = _763 * _713;
    float _769 = _765 * _715;
    bool _771 = !_497;
    float _773 = _643;
    float _791;
    if (!_771)
    {
        float _775 = in.m_54.x;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _779 = _775 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _783 = _781 * _777;
        float _785 = floor(_783);
        float _787 = -_785;
        float _789 = _783 + _787;
        _791 = _789;
        _793 = true;
    }
    else
    {
        float _795 = float(_91);
        float _797 = 1.0 / _795;
        float _799 = _125 * _797;
        _791 = _799;
    }
    _793 = false;
    float _801 = _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _805 = _801 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _811 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = isnan(_801);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _827 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _829 = isnan(_801);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _839;
    bool _843 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _845 = isnan(_801);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = 1.0 / _809;
    float _857 = -_821;
    float _859 = _857 + 1.0;
    float _861 = _837 * _859;
    float _863 = -_837;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _825;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _877 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _841 * _855;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = fma(_881, _805, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _889 = -_853;
    float _891 = _889 + 1.0;
    float _893 = _887 * _861;
    float _895 = _885 * _867;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _899 = _801 + _897;
    float _901 = _821 * _891;
    float _903 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _905 = fma(_895, _899, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _907 = fma(_905, _901, _903);
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _911 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[117].x, _907);
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _917 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _921 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _917;
    out.m_56.y = _921;
    out.m_56.z = _923;
    out.m_56.w = _925;
    out.m_58.x = _927;
    out.m_58.y = _877;
    out.m_58.z = _879;
    out.m_58.w = _875;
    bool _929 = !_873;
    float _949;
    float _951;
    if (!_929)
    {
        float _931 = in.m_54.x;
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _935 = float(_91);
        float _937 = _931 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _941 = _939 * _933;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = _935;
        _953 = true;
    }
    else
    {
        float _955 = float(_91);
        float _957 = 1.0 / _955;
        float _959 = _125 * _957;
        _949 = _959;
        _951 = _955;
    }
    _953 = false;
    float _961 = _949;
    float _963 = _951;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _967 = int(_965);
    float _969 = in.m_54.x;
    float _971 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _979 = _961 + _977;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _983 = int(_981);
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _993 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _997 = _961 + _995;
    bool _999 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1001 = isnan(_961);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1013 = float(_967);
    float _1015 = 1.0 / _963;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1025 = float(uint(_983));
    float _1027 = 1.0 / _1013;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    int _1033 = ~_983;
    int _1035 = _1033 + 1;
    float _1037 = float(_983);
    int _1039 = _983 + (-1);
    float _1041 = 1.0 / _1025;
    if (_975)
    {
        _773 = _969;
    }
    float _1043 = _773;
    float _1045 = _125 * _1027;
    float _1047 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1049 = log2(_1047);
    int _1051 = as_type<int>(_1041) + (-2);
    float _1053 = trunc(_1045);
    int _1055 = int(_1053);
    float _1057 = 1.0 / _991;
    float _1059 = float(uint(_1055));
    float _1061 = _125 * _1049;
    float _1063 = 1.0 / _987;
    float _1065 = as_type<float>(_1051) * _1059;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1067;
    float _1071 = _997 * _1057;
    float _1073 = trunc(_1065);
    float _1075 = precise::max(_1073, 0.0);
    uint _1078 = uint(_1075);
    float _1080 = exp2(_1061);
    float _1082 = in.m_54.z;
    float _1084 = in.m_54.w;
    int _1086 = _1031 * int(_1078);
    int _1088 = _1086 + _1055;
    float _1090 = as_type<float>(_1031);
    float _1092 = _1043;
    if (!_975)
    {
        float _1094 = in.m_54.y;
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = float(uint(_1088));
    float _1100 = as_type<float>(_1051) * _1098;
    float _1102 = float(_1055);
    bool _1104 = _1102 >= _1037;
    bool _1106 = isnan(_1102);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(_1037);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = trunc(_1100);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    bool _1122 = _1082 > 0.5;
    float _1124 = _1102;
    if (!_975)
    {
        _1092 = _1082;
    }
    float _1126 = _1092;
    float _1128 = -_203;
    int _1130 = _1122 ? as_type<int>(_1128) : as_type<int>(_203);
    float _1132 = trunc(_1114);
    int _1134 = int(_1132);
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_975)
    {
        _1124 = _1096;
    }
    float _1138 = _1124;
    int _1140 = int(_1078) + int(_1120);
    int _1142 = _1035 * _1140;
    int _1144 = _1142 + _1055;
    bool _1146 = !_975;
    float _1148 = _1146 ? 5.839270114898681640625 : 1.0;
    bool _1150 = !_975;
    float _1152 = _1150 ? _1082 : _969;
    bool _1154 = uint(_1144) >= uint(_983);
    float _1156 = as_type<float>(_1144);
    float _1158 = _1138;
    if (!_975)
    {
        _1156 = _1138;
    }
    float _1160 = _1156;
    float _1162 = _1148 * _1152;
    bool _1164 = !_1154;
    int _1166 = _1164 ? 0 : (-1);
    bool _1168 = _983 == 0;
    float _1170 = floor(_1162);
    float _1172 = _1160;
    float _1174 = _1096;
    if (_975)
    {
        float _1176 = in.m_54.x;
        float _1178 = in.m_54.y;
        _1172 = _1176;
        _1174 = _1178;
    }
    float _1180 = _1172;
    float _1182 = _1174;
    int _1184 = ~_1140;
    int _1186 = _1184 + _1166;
    int _1188 = _1186 + 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1192 = _1190 != 0;
    int _1194 = ~_1134;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    int _1200 = _983 * _1188;
    int _1202 = _1200 + _1055;
    bool _1204 = !_1168;
    int _1206 = _1204 ? _1202 : (-1);
    float _1208 = -_1170;
    float _1210 = _1162 + _1208;
    bool _1212 = !_1192;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = _1206 * _1198;
    float _1218 = _1037 * _1210;
    float _1220 = _125 * _1037;
    int _1222 = _1134 * _1039;
    int _1224 = _1222 + _1216;
    int _1226 = abs(_1214);
    bool _1228 = _1182 > 0.5;
    float _1230 = _1220 * _1015;
    float _1232 = trunc(_1218);
    int _1234 = int(_1232);
    float _1236 = _1182 * 2.0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1244 = _1242 != 0;
    float _1246 = -_199;
    int _1248 = _1228 ? as_type<int>(_1246) : as_type<int>(_199);
    if (_975)
    {
        _1158 = _1182;
    }
    float _1250 = _1158;
    bool _1252 = !_1244;
    float _1254 = _1252 ? _203 : as_type<float>(_1130);
    float _1256 = trunc(_1230);
    int _1258 = int(_1256);
    bool _1260 = !_1240;
    float _1262 = _1260 ? _199 : as_type<float>(_1248);
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1266 = _1264 != 0;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1274 = _1272 != 0;
    int _1276 = _1234 * _1226;
    int _1278 = _1276 + _1055;
    bool _1280 = !_1270;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = floor(_1236);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1288 = _1286 != 0;
    bool _1290 = !_1266;
    int _1292 = _1290 ? 0 : 1;
    int _1294 = abs(_1282);
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1298 = _1296 != 0;
    bool _1300 = !_1288;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = abs(_1292);
    bool _1306 = !_1298;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = abs(_1302);
    int _1312 = _1224 * _1294;
    float _1314 = _969 * 2.0;
    int _1316 = abs(_1308);
    int _1318 = _1258 * _1304;
    int _1320 = _1318 + _1312;
    int _1322 = ~_983;
    int _1324 = _1322 + 1;
    float _1326 = floor(_1314);
    int _1328 = ~_983;
    int _1330 = _1328 + 1;
    int _1332 = _1278 * _1310;
    int _1334 = _1332 + _1320;
    bool _1336 = _1084 > 0.5;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1338;
    int _1342 = _1234 * _1316;
    int _1344 = _1342 + _1334;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1350 = 1.0 / _1340;
    float _1352 = float(uint(_1344));
    float _1354 = as_type<float>(_1051) * _1352;
    float _1356 = 1.0 / _1348;
    float _1358 = trunc(_1354);
    float _1360 = precise::max(_1358, 0.0);
    uint _1362 = uint(_1360);
    float _1364 = _979 * _1356;
    bool _1366 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1368 = isnan(_961);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    int _1378 = _1324 * int(_1362);
    int _1380 = _1378 + _1344;
    float _1382 = float(uint(_1380));
    float _1384 = as_type<float>(_1051) * _1382;
    float _1386 = trunc(_1384);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    int _1392 = int(_1362) + int(_1390);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1402 = _1330 * _1392;
    int _1404 = _1402 + _1344;
    float _1406 = 1.0 / _1396;
    bool _1408 = uint(_1404) >= uint(_983);
    bool _1410 = !_1408;
    int _1412 = _1410 ? 0 : (-1);
    float _1414 = 1.0 / _1400;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1418 = _1416 != 0;
    int _1420 = ~_1392;
    int _1422 = _1420 + _1412;
    int _1424 = _1422 + 1;
    int _1426 = _983 * _1424;
    int _1428 = _1426 + _1344;
    float _1430 = -_203;
    int _1432 = _1336 ? as_type<int>(_1430) : as_type<int>(_203);
    bool _1434 = _1082 > 0.5;
    bool _1436 = !_1168;
    int _1438 = _1436 ? _1428 : (-1);
    float _1440 = -_199;
    int _1442 = _1434 ? as_type<int>(_1440) : as_type<int>(_199);
    bool _1444 = !_1418;
    float _1446 = _1444 ? _203 : as_type<float>(_1432);
    int _1448 = _1438 & 3;
    bool _1450 = _1448 != 0;
    bool _1452 = !_1274;
    float _1454 = _1452 ? _199 : as_type<float>(_1442);
    bool _1456 = uint(_1448) >= 2u;
    int _1458 = _1438 & 3;
    bool _1460 = _1458 != 0;
    int _1462 = _1456 ? 0 : 1;
    bool _1464 = _1448 != 3;
    int _1466 = _1460 ? 0 : 1;
    bool _1468 = uint(_1448) > 1u;
    int _1470 = ~_1462;
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    int _1476 = ~_1466;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    int _1482 = _1474;
    int _1484 = _1480;
    if (_1464)
    {
        int _1486 = ~_1462;
        int _1488 = _1486 + 1;
        _1482 = _1488;
    }
    int _1490 = _1482;
    bool _1492 = _969 > 0.5;
    if (!_1468)
    {
        int _1494 = ~_1466;
        int _1496 = _1494 + 1;
        _1484 = _1496;
    }
    int _1498 = _1484;
    float _1500 = -_199;
    int _1502 = _1492 ? as_type<int>(_1500) : as_type<int>(_199);
    bool _1504 = _1326 >= 0.0;
    bool _1506 = isnan(_1326);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(0.0);
    bool _1512 = _1508 || _1510;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1516 = _1514 != 0;
    int _1518 = _1512 ? 0 : 1;
    bool _1520 = _1326 > 0.0;
    float _1522 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1524 = !_1516;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1530 = _1528 != 0;
    float _1532 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1522);
    int _1534 = abs(_1490);
    bool _1536 = !_1530;
    float _1538 = _1536 ? _199 : as_type<float>(_1502);
    int _1540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1542 = _1540 != 0;
    float _1544 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1546 = _1082 * 2.0;
    int _1548 = ~_1518;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = _1538 + 0.5;
    int _1556 = _1552;
    if (!_1520)
    {
        int _1558 = ~_1518;
        int _1560 = _1558 + 1;
        _1556 = _1560;
    }
    int _1562 = _1556;
    float _1564 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1544);
    bool _1566 = _1284 >= 0.0;
    bool _1568 = isnan(_1284);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    float _1576 = floor(_1546);
    float _1578 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1580 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1564);
    int _1582 = _1574 ? 0 : 1;
    float _1584 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1532);
    bool _1586 = _1284 > 0.0;
    float _1588 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _993);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1592 = _961 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1596 = _961 + _1594;
    float _1598 = _1584 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1600 = _1592 * _1406;
    float _1602 = _1596 * _1414;
    float _1604 = 1.0 / _1069;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1608 = _961 + _1606;
    int _1610 = ~_1582;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1618 = _961 + _1616;
    float _1620 = fma(_1019, _1600, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    int _1622 = _1614;
    if (!_1586)
    {
        int _1624 = ~_1582;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = _1608 * _1063;
    bool _1632 = _1576 >= 0.0;
    bool _1634 = isnan(_1576);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1618 * _1350;
    float _1644 = -_1080;
    float _1646 = _1644 + 1.0;
    int _1648 = _1640 ? 0 : 1;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1652 = _961 + _1650;
    bool _1654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1656 = isnan(0.0);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1662 = _1658 || _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1664;
    float _1668 = _1652 * _1604;
    float _1670 = _1662 ? _1646 : 0.0;
    float _1672 = fma(_1666, _1600, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1674 = _1576 > 0.0;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1684 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1686 = isnan(_961);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1376;
    float _1698 = _1696 + 1.0;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1704 = fma(_1682, _1364, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1706 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1708 = isnan(_961);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = _1694 * _1698;
    float _1720 = -_1694;
    float _1722 = _1720 + 1.0;
    bool _1724 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1726 = isnan(_961);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1736;
    float _1740 = fma(_1678, _1642, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1742 = _1716 * _1722;
    bool _1744 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1746 = isnan(_961);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = -_1734;
    float _1758 = _1756 + 1.0;
    float _1760 = fma(_1738, _1642, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1762 = fma(_1702, _1602, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1764 = fma(_1023, _1602, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1766 = _1754 * _1758;
    float _1768 = -_1754;
    float _1770 = _1768 + 1.0;
    float _1772 = -_1716;
    float _1774 = _1772 + 1.0;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1778 = _1776 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1780 = _1580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1782;
    float _1786 = _1734 * _1774;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1790 = 1.0 + _1788;
    float _1792 = fma(_1778, _1364, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1794 = fma(_1784, _1630, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1796 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1798 = isnan(_961);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    bool _1808 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1810 = isnan(_961);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = 1.0 / _1790;
    float _1822 = _1806 * _1770;
    float _1824 = -_1806;
    float _1826 = _1824 + 1.0;
    float _1828 = -_1818;
    float _1830 = _1828 + 1.0;
    int _1832 = abs(_1526);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1840 = _1838 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1842;
    float _1846 = _1009 * _1830;
    float _1848 = fma(_1836, _1630, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1854 = -_1009;
    float _1856 = _1854 + 1.0;
    float _1858 = _1672 * _1846;
    float _1860 = _1620 * _1846;
    float _1862 = _1818 * _1826;
    float _1864 = fma(_1852, _1071, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1866 = _1670 * _1820;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1868;
    float _1872 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1858);
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1860);
    float _1876 = fma(_1844, _1668, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1878 = float(uint(_1278));
    float _1880 = fma(_1870, _1668, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1884 = as_type<float>(_1051) * _1878;
    float _1886 = _1858;
    float _1888 = _1862;
    float _1890 = _1786;
    if (!_975)
    {
        float _1892 = in.m_54.z;
        _1886 = _1892;
    }
    float _1894 = _1886;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1898 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1882);
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1902 = trunc(_1884);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    float _1908 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1910 = fma(_1762, _1862, _1872);
    float _1912 = fma(_1764, _1862, _1874);
    float _1914 = fma(_1840, _1071, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1916 = -_1900;
    float _1918 = fma(_1908, 2.0, _1916);
    float _1920 = fma(_1740, _1822, _1910);
    int _1922 = ~_983;
    int _1924 = _1922 + 1;
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1928 = _1598 + _1926;
    float _1930 = -_1896;
    float _1932 = fma(_1136, 2.0, _1930);
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1936 = ~_1648;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1946 = _1780 + _1944;
    float _1948 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1950 = _1924 * int(_1906);
    int _1952 = _1950 + _1278;
    int _1954 = _1940;
    if (!_1674)
    {
        int _1956 = ~_1648;
        int _1958 = _1956 + 1;
        _1954 = _1958;
    }
    int _1960 = _1954;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1964 = _1942 + _1962;
    float _1966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1968 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1948);
    float _1970 = fma(_1760, _1822, _1912);
    float _1972 = float(uint(_1952));
    float _1974 = _1182 + _969;
    float _1976 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1968);
    float _1978 = _1974;
    float _1980 = _1894;
    if (!_975)
    {
        _1888 = _1894;
    }
    float _1982 = _1888;
    float _1984 = fma(_1792, _1766, _1970);
    float _1986 = _1974 + (-1.0);
    float _1988 = as_type<float>(_1051) * _1972;
    float _1990 = _1982;
    if (_975)
    {
        _1978 = _1250;
    }
    float _1992 = _1978;
    float _1994 = -_125;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1932);
    float _1998 = _1992;
    if (_975)
    {
        _1990 = _1250;
    }
    float _2000 = _1990;
    float _2002 = _1262 + 0.5;
    if (_975)
    {
        _1980 = _1250;
    }
    float _2004 = _1980;
    float _2006 = trunc(_1988);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    if (!_975)
    {
        _1998 = _969;
    }
    float _2012 = _1998;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2016 = _1976 >= 0.0;
    float _2018 = fma(_1704, _1766, _1920);
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1934);
    float _2022 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2024 = _1454 + 0.5;
    float _2026 = -_125;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1918);
    float _2030 = fma(_1794, _1786, _2018);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[90].x, _1996);
    int _2034 = _1438 >> 31;
    float _2036 = fma(_2022, _2024, _2028);
    float _2038 = fma(_1848, _1786, _1984);
    int _2040 = _2034 & 3;
    float _2042 = fma(_1864, _1742, _2030);
    if (_2016)
    {
        _1890 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2044 = _1890;
    float _2046 = fma(_1914, _1742, _2038);
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2050 = _1438 + _2040;
    float _2052 = _1928 * _1928;
    int _2054 = int(_1906) + int(_2010);
    float _2056 = fma(_2014, -2.0, _2048);
    int _2058 = _2050 >> 2;
    int _2060 = as_type<int>(_2044);
    if (_2016)
    {
        float _2062 = _2044 * 5.0;
        _2060 = as_type<int>(_2062);
    }
    int _2064 = _2060;
    int _2066 = ~_983;
    int _2068 = _2066 + 1;
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2072 = _2058 << 4;
    int _2074 = _2072 + 656;
    float _2076 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6699 = as_type<float>(_2064);
        out.gl_Position.z = _6699;
    }
    int _2078 = _2068 * _2054;
    int _2080 = _2078 + _1278;
    float _2082 = -_203;
    int _2084 = _1228 ? as_type<int>(_2082) : as_type<int>(_203);
    float _2086 = fma(_1876, _1718, _2042);
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2090 = _1448 != 3;
    float _2092 = fma(_1880, _1718, _2046);
    bool _2094 = uint(_2080) >= uint(_983);
    float _2096 = fma(_2076, -2.0, _2088);
    bool _2098 = !_1450;
    int _2100 = _2098 ? 0 : 1;
    float _2102 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1898);
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2106 = fma(_1946, _1946, _2052);
    float _2108 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2056);
    uint _2110 = uint(int(uint(_2074) >> uint(2)));
    uint _2112 = uint(int(uint(int(_2110)) >> uint(2)));
    int _2114 = int(_2110) & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    int _2118 = int(_2110) + 1;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    int _2122 = _2118 & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    bool _2126 = !_2094;
    int _2128 = _2126 ? 0 : (-1);
    float _2130 = fma(_1964, _1964, _2106);
    bool _2132 = !_1542;
    float _2134 = _2132 ? _203 : as_type<float>(_2084);
    float _2136 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2140 = _2138 != 0;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2144 = _2142 != 0;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2148 = _2146 != 0;
    float _2150 = rsqrt(_2130);
    float _2152 = _1446 + (-0.5);
    int _2154 = _2074 + 8;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    float _2172 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2096);
    float _2174 = -_2102;
    float _2176 = _2174 + 1.0;
    float _2178 = -_2136;
    float _2180 = -_2108;
    float _2182 = fma(_2178, _2152, _2180);
    float _2184 = _1254 + (-0.5);
    float _2186 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2020);
    float _2188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2190 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2192 = -_2184;
    float _2194 = -_2172;
    float _2196 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[90].y, _2194);
    float _2198 = -_2176;
    float _2200 = fma(_1454, _2198, _2036);
    float _2202 = -_2134;
    float _2204 = _2202 + 0.5;
    float _2206 = _1578 * _2104;
    float _2208 = -_2186;
    float _2210 = _2208 + 1.0;
    bool _2212 = !_2090;
    int _2214 = _2212 ? 0 : (-1);
    float _2216 = _2190 * _2150;
    float _2218 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2220 = fma(_1446, _2210, _2182);
    int _2222 = abs(_2214);
    float _2224 = _1928 * _2216;
    float _2226 = _1946 * _2216;
    int _2228 = ~_2054;
    int _2230 = _2228 + _2128;
    int _2232 = _2230 + 1;
    float _2234 = _1964 * _2216;
    float _2236 = _2218 * _2188;
    int _2238 = abs(_1498);
    float _2240 = -_2224;
    float _2242 = _1928 + _2240;
    float _2244 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2086);
    float _2246 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2092);
    float _2248 = -_2226;
    float _2250 = _1946 + _2248;
    float _2252 = _2242 * _2242;
    out.m_60.x = _2206;
    out.m_60.y = _2236;
    out.m_60.z = _2200;
    out.m_60.w = _2220;
    int _2254 = ~_2238;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _983 * _2232;
    int _2262 = _2260 + _1278;
    float _2264 = fma(_2250, _2250, _2252);
    int _2266 = abs(_2100);
    float _2268 = -_2234;
    float _2270 = _1964 + _2268;
    float _2272 = float(_1960);
    out.m_62.x = _2244;
    out.m_62.y = _2246;
    float _2274 = fma(_2270, _2270, _2264);
    int _2276 = _2258 * as_type<int>(_2124);
    int _2278 = ~_2266;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    if (_2016)
    {
        out.m_45.x = 0.0;
    }
    float _2284 = float(_1562);
    float _2286 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2288 = _2282 * as_type<int>(_2116);
    int _2290 = _2288 + _2276;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2294 = ~_1534;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2302 = ~_2222;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2292);
    int _2310 = _2298 * as_type<int>(_2162);
    int _2312 = _2310 + _2290;
    float _2314 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2300);
    float _2316 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2308);
    float _2318 = in.m_64.x;
    float _2320 = in.m_64.y;
    float _2322 = in.m_64.z;
    int _2324 = _2306 * as_type<int>(_2170);
    int _2326 = _2324 + _2312;
    bool _2328 = !_2140;
    int _2330 = _2328 ? 0 : 1;
    float _2332 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2314);
    float _2334 = -_2316;
    float _2336 = _2334 + 1.0;
    int _2338 = abs(_2330);
    float _2340 = -_2332;
    float _2342 = _2340 + 1.0;
    float _2344 = -_2336;
    float _2346 = fma(_1262, _2344, _2032);
    int _2348 = ~_1832;
    int _2350 = _2348 + 1;
    int _2352 = _2350 + 1;
    float _2354 = fma(_1254, _2342, _2196);
    bool _2356 = !_1168;
    int _2358 = _2356 ? _2262 : (-1);
    int _2360 = _2326 * _2352;
    float _2362 = float(_2338);
    bool _2364 = !_2144;
    int _2366 = _2364 ? 0 : 1;
    int _2368 = _2358 * _1832;
    int _2370 = _2368 + _2360;
    out.m_66.x = _2346;
    out.m_66.y = _2354;
    float _2372 = _2362 * _2272;
    int _2374 = abs(_2366);
    float _2376 = _969 + (-0.5);
    float _2378 = float(_2370);
    float _2380 = _2372 * (-2.0);
    float _2382 = float(_2374);
    bool _2384 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2386 = isnan(1.0);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2392 = _2388 || _2390;
    out.m_68.z = _2378;
    float _2394 = fma(_2380, _2318, _2318);
    float _2396 = _2382 * _2284;
    float _2398 = fma(_2286, _2380, _2286);
    float _2400 = _1082 + _1182;
    float _2402 = fma(_2376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2394);
    bool _2404 = !_2148;
    int _2406 = _2404 ? 0 : 1;
    float _2408 = _2322;
    if (_2016)
    {
        return out;
    }
    float _2410 = -_2224;
    float _2412 = _1598 + _2410;
    int _2414 = abs(_2406);
    float _2416 = -_2226;
    float _2418 = _1780 + _2416;
    bool _2420 = !_2392;
    float _2422 = _2420 ? _125 : _1866;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2426 = _2412 + _2424;
    float _2428 = float(_1628);
    float _2430 = -_2234;
    float _2432 = _1942 + _2430;
    float _2434 = float(_2414);
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2438 = _2418 + _2436;
    float _2440 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2442 = _2400 + (-1.0);
    float _2444 = fma(_2422, _2398, _2402);
    float _2446 = _2396 * (-2.0);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2450 = _2432 + _2448;
    float _2452 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2440);
    float _2454 = _2434 * _2428;
    float _2456 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2458 = _2444 * 0.15915493667125701904296875;
    float _2460 = _1182 + (-0.5);
    float _2462 = fma(_2446, _2320, _2320);
    float _2464 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2452);
    float _2466 = _1082 + _969;
    float _2468 = fma(_2456, _2446, _2456);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2462);
    float _2472 = _2466 + (-1.0);
    bool _2474 = _2464 >= 0.0;
    float _2476 = _2454 * (-2.0);
    float _2478 = fma(_2422, _2468, _2470);
    float _2480 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2482 = _1082 + (-0.5);
    float _2484 = fma(_2476, _2322, _2322);
    float _2486 = _2478 * 0.15915493667125701904296875;
    float _2488 = fma(_2480, _2476, _2480);
    float _2490 = sqrt(_2274);
    float _2492 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2484);
    float _2494 = _2418;
    if (_2474)
    {
        _2408 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2496 = _2408;
    float _2498 = fma(_2422, _2488, _2492);
    int _2500 = as_type<int>(_2496);
    if (_2474)
    {
        out.m_45.x = 0.0;
    }
    float _2502 = _2458 * 6.283185482025146484375;
    float _2504 = sin(_2502);
    if (_2474)
    {
        float _2506 = _2496 * 5.0;
        _2500 = as_type<int>(_2506);
    }
    int _2508 = _2500;
    float _2510 = _2498 * 0.15915493667125701904296875;
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7394 = as_type<float>(_2508);
        out.gl_Position.z = _7394;
    }
    float _2512 = _2458 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    float _2516 = _2486 * 6.283185482025146484375;
    float _2518 = sin(_2516);
    float _2520 = _2486 * 6.283185482025146484375;
    float _2522 = cos(_2520);
    if (_2474)
    {
        return out;
    }
    float _2524 = _2510 * 6.283185482025146484375;
    float _2526 = cos(_2524);
    float _2528 = _2150 * _2490;
    float _2530 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2536 = _1011 * _2528;
    float _2538 = _2528 * _2530;
    float _2540 = _2514 * _2522;
    float _2542 = _2510 * 6.283185482025146484375;
    float _2544 = sin(_2542);
    float _2546 = _2532 * _2538;
    float _2548 = _2504 * _2518;
    float _2550 = _2526 * _2546;
    float _2552 = _2534 * _2536;
    float _2554 = _2514 * _2518;
    float _2556 = _2504 * _2522;
    float _2558 = _2514 * _2550;
    float _2560 = _2518 * _2526;
    float _2562 = _2522 * _2526;
    float _2564 = _2504 * _2550;
    float _2566 = fma(_2544, _2540, _2548);
    float _2568 = -_2546;
    float _2570 = _2544 * _2568;
    float _2572 = -_2556;
    float _2574 = fma(_2544, _2554, _2572);
    float _2576 = -_2554;
    float _2578 = fma(_2544, _2556, _2576);
    float _2580 = fma(_2566, _2552, _2558);
    float _2582 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2584 = _2582 * 0.5;
    float _2586 = fma(_2562, _2552, _2570);
    float _2588 = fma(_2544, _2548, _2540);
    float _2590 = fma(_2578, _2552, _2564);
    float _2592 = fma(_2574, _2584, _2580);
    float _2594 = fma(_2560, _2584, _2586);
    float _2596 = fma(_2588, _2584, _2590);
    float _2598 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2602 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2604 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2606 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2600);
    float _2608 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2602);
    float _2610 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2604);
    float _2612 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    float _2614 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2608);
    float _2616 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2618 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2620 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2622 = _1942 + _2616;
    float _2624 = _1780 + _2618;
    float _2626 = _1598 + _2620;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2630 = _2622 + _2628;
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2634 = _2624 + _2632;
    float _2636 = _2630 * _2630;
    float _2638 = fma(_2634, _2634, _2636);
    float _2640 = sqrt(_2638);
    bool _2642 = _2640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2644 = _2596;
    float _2646 = _2636;
    float _2648 = _2624;
    float _2650 = _2630;
    float _2652 = _2580;
    float _2654 = _2638;
    float _2656 = _2626;
    if (!_2642)
    {
        _2644 = _2622;
    }
    float _2658 = _2644;
    float _2660 = _2658;
    if (!_2642)
    {
        _2646 = _2626;
    }
    float _2662 = _2646;
    bool _2664 = !_2642;
    float _2666 = _2662;
    if (!_2664)
    {
        float _2668 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2672 = _2640 + _2670;
        float _2674 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2676 = rsqrt(_2638);
        float _2678 = _2672 * _2668;
        float _2680 = _2678 * 0.15915493667125701904296875;
        float _2682 = _2680 * 6.283185482025146484375;
        float _2684 = cos(_2682);
        float _2686 = _2680 * 6.283185482025146484375;
        float _2688 = sin(_2686);
        float _2690 = _2684 + (-1.0);
        float _2692 = fma(_2688, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2694 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2696 = _2676 * _2692;
        float _2698 = fma(_2626, _2684, _2694);
        float _2700 = fma(_2634, _2696, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2702 = fma(_2630, _2696, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2666 = _2698;
        _2648 = _2700;
        _2660 = _2702;
    }
    float _2704 = _2666;
    float _2706 = _2648;
    float _2708 = _2660;
    float _2710 = -_1598;
    float _2712 = _2710 + _2704;
    float _2714 = -_1780;
    float _2716 = _2714 + _2706;
    float _2718 = -_1942;
    float _2720 = _2718 + _2708;
    float _2722 = _2712 * _2712;
    float _2724 = fma(_2716, _2716, _2722);
    float _2726 = fma(_2720, _2720, _2724);
    float _2728 = sqrt(_2726);
    bool _2730 = _2728 > 0.0;
    float _2732 = _2728;
    float _2734 = _2708;
    float _2736 = _2706;
    if (!_2730)
    {
        _2650 = _2706;
    }
    float _2738 = _2650;
    float _2740 = _2738;
    if (!_2730)
    {
        _2732 = _2704;
    }
    float _2742 = _2732;
    bool _2744 = !_2730;
    float _2746 = _2742;
    float _2748 = _2742;
    float _2750 = _2742;
    if (!_2744)
    {
        bool _2752 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2754 = _2738;
        if (_2752)
        {
            float _2756 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2754 = _2756;
        }
        float _2758 = _2754;
        float _2760 = _2758;
        if (_2752)
        {
            float _2762 = _417 * _2758;
            _2652 = _2762;
        }
        float _2764 = _2652;
        float _2766 = _2764;
        if (_2752)
        {
            float _2768 = _419 * _2758;
            _2654 = _2768;
        }
        float _2770 = _2654;
        float _2772 = _2770;
        if (_2752)
        {
            float _2774 = _421 * _2758;
            _2656 = _2774;
        }
        float _2776 = _2656;
        float _2778 = _2776;
        if (!_2752)
        {
            float _2780 = _125 + 1.0;
            float _2782 = _2780;
            if (!_159)
            {
                float _2784 = _2780 * _2780;
                float _2786 = _2784 * 0.5;
                _2746 = _2786;
            }
            float _2788 = _2746;
            float _2790 = _2788;
            if (!_159)
            {
                float _2792 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2790 = _2792;
            }
            float _2794 = _2790;
            bool _2796 = !_159;
            float _2798 = _2794;
            if (!_2796)
            {
                float _2800 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2802 = log2(_2800);
                float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2806 = 1.0 + _2804;
                float _2808 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2810 = _2802 * _2780;
                float _2812 = 1.0 / _2806;
                float _2814 = _2808 * 0.693147182464599609375;
                float _2816 = exp2(_2810);
                float _2818 = 1.0 / _2814;
                float _2820 = _2816 + (-1.0);
                float _2822 = -_2820;
                float _2824 = fma(_2822, _2818, _2780);
                float _2826 = _2824 * _2812;
                float _2828 = _2826 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2798 = _2828;
            }
            float _2830 = _2798;
            float _2832 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2834 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2836 = !_159;
            _2760 = _2832;
            if (!_2836)
            {
                float _2838 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2840 = log2(_2838);
                float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2844 = 1.0 + _2842;
                float _2846 = 1.0 / _2844;
                float _2848 = _2840 * _2780;
                float _2850 = exp2(_2848);
                float _2852 = -_2850;
                float _2854 = _2852 + 1.0;
                float _2856 = _2854 * _2846;
                _2782 = _2856;
            }
            float _2858 = _2782;
            float _2860 = fma(_2858, _163, _2834);
            float _2862 = fma(_2858, _161, _2832);
            float _2864 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2866 = -_373;
            float _2868 = _2866 + _2860;
            float _2870 = -_383;
            float _2872 = _2870 + _2862;
            float _2874 = fma(_2858, _165, _2864);
            float _2876 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2878 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2880 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2882 = -_391;
            float _2884 = _2882 + _2874;
            float _2886 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2876);
            float _2888 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2878);
            float _2890 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2880);
            float _2892 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2886);
            float _2894 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2888);
            float _2896 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2890);
            _425 = _2894;
            _427 = _2892;
            _429 = _2896;
            _2766 = _2892;
            _2772 = _2894;
            _2778 = _2896;
            _2748 = _2878;
        }
        float _2898 = _425;
        float _2900 = _427;
        float _2902 = _429;
        float _2904 = _2766;
        float _2906 = _2772;
        float _2908 = _2778;
        float _2910 = _2748;
        float _2912 = _2760;
        float _2914 = _2898 * _2898;
        float _2916 = rsqrt(_2726);
        float _2918 = fma(_2900, _2900, _2914);
        float _2920 = fma(_2902, _2902, _2918);
        float _2922 = sqrt(_2920);
        float _2924 = _2712 * _2916;
        float _2926 = _2716 * _2916;
        float _2928 = _2720 * _2916;
        bool _2930 = _2922 > 0.0;
        float _2932 = _2912;
        float _2934 = _2910;
        _431 = _2900;
        if (!_2930)
        {
            _2932 = _2706;
        }
        float _2936 = _2932;
        _2740 = _2936;
        if (!_2930)
        {
            _2934 = _2704;
        }
        float _2938 = _2934;
        bool _2940 = !_2930;
        _2750 = _2938;
        if (!_2940)
        {
            float _2942 = rsqrt(_2920);
            float _2944 = _2942 * _2898;
            float _2946 = _2942 * _2900;
            float _2948 = _2942 * _2902;
            float _2950 = _2924 * _2944;
            float _2952 = fma(_2926, _2946, _2950);
            float _2954 = fma(_2928, _2948, _2952);
            float _2956 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2958 = fma(_2904, _2956, _2706);
            float _2960 = fma(_2906, _2956, _2704);
            float _2962 = fma(_2908, _2956, _2708);
            _2734 = _2962;
            _2750 = _2960;
            _2740 = _2958;
        }
    }
    float _2964 = _2734;
    float _2966 = _2750;
    float _2968 = _2740;
    float _2970 = _431;
    float _2972 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2972);
    bool _2986 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2988 = isnan(0.5);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2994 = _2990 || _2992;
    float _2996 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2984);
    float _2998 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3000 = _2996 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3002 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2998);
    float _3004 = 1.0 / _3000;
    float _3006 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3002);
    float _3008 = _2966;
    float _3010 = _2970;
    if (_2994)
    {
        _2736 = 1.0;
    }
    float _3012 = _2736;
    float _3014 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3016 = _3014 + _3000;
    float _3018 = -_2234;
    float _3020 = _3018 + _2964;
    float _3022 = _3016 * _3004;
    float _3024 = _3022 * 0.5;
    float _3026 = -_2224;
    float _3028 = _3026 + _2966;
    float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3032 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3030);
    float _3034 = -_2226;
    float _3036 = _3034 + _2968;
    float _3038 = 1.0 / _3032;
    float _3040 = _3028;
    float _3042 = _3036;
    float _3044 = _3020;
    float _3046 = _3012;
    if (!_2982)
    {
        float _3048 = _2426 * _2426;
        float _3050 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3052 = -_1942;
        float _3054 = _3052 + _2964;
        float _3056 = -_1598;
        float _3058 = _3056 + _2966;
        float _3060 = fma(_2438, _2438, _3048);
        float _3062 = fma(_2450, _2450, _3060);
        float _3064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3066 = sqrt(_3062);
        float _3068 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3070 = 1.0 / _2528;
        float _3072 = precise::min(_3066, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3074 = _3072 * _3064;
        float _3076 = _3074 * _3070;
        float _3078 = -_1780;
        float _3080 = _3078 + _2968;
        float _3082 = _3068 * _3076;
        float _3084 = _3054 * _3076;
        float _3086 = fma(_3080, _3082, _2418);
        float _3088 = fma(_3058, _3082, _2412);
        float _3090 = fma(_3068, _3084, _2432);
        _3040 = _3088;
        _3042 = _3086;
        _3044 = _3090;
    }
    float _3092 = _3040;
    float _3094 = _3042;
    float _3096 = _3044;
    if (_2994)
    {
        _3008 = 1.0;
    }
    float _3098 = _3008;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3102 = _3038 * _3100;
    float _3104 = _3098;
    float _3106 = _3102;
    if (!_2994)
    {
        float _3108 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3110 = _3108 * 0.15915493667125701904296875;
        float _3112 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3114 = _3110 * 6.283185482025146484375;
        float _3116 = cos(_3114);
        float _3118 = _3112 * 0.15915493667125701904296875;
        float _3120 = _3110 * 6.283185482025146484375;
        float _3122 = sin(_3120);
        float _3124 = 1.0 / _3116;
        float _3126 = _3118 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        float _3130 = _3122 * _3124;
        float _3132 = _3118 * 6.283185482025146484375;
        float _3134 = sin(_3132);
        float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3138 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3136;
        float _3140 = _3128 * _3130;
        float _3142 = 1.0 / _3138;
        float _3144 = 1.0 / _3140;
        float _3146 = _3134 * _3144;
        float _3148 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3150 = fma(_3102, _3146, _3148);
        float _3152 = _3150 * _3142;
        float _3154 = precise::clamp(_3152, 0.0, 1.0);
        _2494 = _3142;
        _3046 = _3154;
    }
    float _3156 = _2494;
    float _3158 = _3046;
    float _3160 = _3156;
    if (!_2994)
    {
        float _3162 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3164 = _3162 * 0.15915493667125701904296875;
        float _3166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3168 = _3164 * 6.283185482025146484375;
        float _3170 = cos(_3168);
        float _3172 = _3166 * 0.15915493667125701904296875;
        float _3174 = _3164 * 6.283185482025146484375;
        float _3176 = sin(_3174);
        float _3178 = 1.0 / _3170;
        float _3180 = _3172 * 6.283185482025146484375;
        float _3182 = cos(_3180);
        float _3184 = _3176 * _3178;
        float _3186 = _3172 * 6.283185482025146484375;
        float _3188 = sin(_3186);
        float _3190 = _3182 * _3184;
        float _3192 = 1.0 / _3190;
        float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3196 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3194;
        float _3198 = 1.0 / _3196;
        float _3200 = _3188 * _3192;
        float _3202 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3204 = fma(_3102, _3200, _3202);
        float _3206 = _3204 * _3198;
        float _3208 = precise::clamp(_3206, 0.0, 1.0);
        float _3210 = -_3208;
        float _3212 = _3210 + 1.0;
        _3160 = _3192;
        _3104 = _3212;
    }
    float _3214 = _3160;
    float _3216 = _3104;
    float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3220 = _3092 + _3218;
    float _3222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3224 = _3094 + _3222;
    float _3226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3228 = _3096 + _3226;
    float _3230 = _3220 * _3220;
    float _3232 = fma(_3224, _3224, _3230);
    float _3234 = fma(_3228, _3228, _3232);
    float _3236 = rsqrt(_3234);
    float _3238 = sqrt(_3234);
    float _3240 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3242 = _3224 * _3240;
    float _3244 = _3228 * _3240;
    float _3246 = _3242 * _3242;
    float _3248 = _3244 * _3244;
    float _3250 = _3246 + _3248;
    float _3252 = sqrt(_3250);
    bool _3254 = _3252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3258 = _3252 + _3256;
    float _3260 = _3228;
    float _3262 = _3214;
    float _3264 = _3258;
    float _3266 = _3220;
    if (_3254)
    {
        float _3268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3260 = _3268;
    }
    float _3270 = _3260;
    if (_3254)
    {
        float _3272 = rsqrt(_3250);
        _3262 = _3272;
    }
    float _3274 = _3262;
    float _3276 = _3274;
    if (_3254)
    {
        float _3278 = _3258 * _3270;
        _3264 = _3278;
    }
    float _3280 = _3264;
    if (_3254)
    {
        float _3282 = _3280 * 0.15915493667125701904296875;
        _3106 = _3282;
    }
    float _3284 = _3106;
    float _3286 = _3236;
    if (_3254)
    {
        float _3288 = _3284 * 6.283185482025146484375;
        float _3290 = sin(_3288);
        _3286 = _3290;
    }
    float _3292 = _3286;
    float _3294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3296 = precise::max(0.0, _3294);
    float _3298 = _3232;
    float _3300 = _3294;
    if (_3254)
    {
        float _3302 = _3284 * 6.283185482025146484375;
        float _3304 = cos(_3302);
        _3298 = _3304;
    }
    float _3306 = _3298;
    float _3308 = -_3240;
    float _3310 = -_3296;
    float _3312 = fma(_3220, _3308, _3310);
    float _3314 = _3312;
    if (_3254)
    {
        float _3316 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3300 = _3316;
    }
    float _3318 = _3300;
    float _3320 = _3292;
    float _3322 = _3318;
    if (_3254)
    {
        float _3324 = fma(_3292, _3318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3266 = _3324;
    }
    float _3326 = _3266;
    float _3328 = _3326;
    if (!_3254)
    {
        _3320 = _3242;
    }
    float _3330 = _3320;
    float _3332 = _3330;
    float _3334 = _3306;
    if (_3254)
    {
        float _3336 = _3306 + (-1.0);
        _3322 = _3336;
    }
    float _3338 = _3322;
    float _3340 = _3338;
    if (_3254)
    {
        float _3342 = _3274 * _3326;
        _3010 = _3342;
    }
    float _3344 = _3010;
    if (!_3254)
    {
        _3328 = _3246;
    }
    float _3346 = _3328;
    float _3348 = _3346;
    if (_3254)
    {
        float _3350 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3276 = _3350;
    }
    float _3352 = _3276;
    if (_3254)
    {
        float _3354 = _3242 * _3344;
        _3332 = _3354;
    }
    float _3356 = _3332;
    if (!_3254)
    {
        _3340 = _3244;
    }
    float _3358 = _3340;
    float _3360 = _3358;
    if (_3254)
    {
        float _3362 = _3244 * _3344;
        _3360 = _3362;
    }
    float _3364 = _3360;
    if (_3254)
    {
        float _3366 = fma(_3312, _3306, _3352);
        _3314 = _3366;
    }
    float _3368 = _3314;
    if (_3254)
    {
        float _3370 = _3356 * _3356;
        _3348 = _3370;
    }
    float _3372 = _3348;
    if (!_3254)
    {
        _3334 = _3248;
    }
    float _3374 = _3334;
    float _3376 = _3374;
    if (_3254)
    {
        float _3378 = _3364 * _3364;
        _3376 = _3378;
    }
    float _3380 = _3376;
    float _3382 = fma(_3368, _3368, _3372);
    float _3384 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3386 = _3382 + _3380;
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3390 = fma(_3238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3388);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3396 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3384);
    float _3398 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3400 = -_3392;
    float _3402 = _3400 + 1.0;
    float _3404 = rsqrt(_3386);
    float _3406 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3394);
    float _3408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3410 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3412 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3396);
    float _3414 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3398);
    float _3416 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3406);
    float _3418 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3410);
    float _3420 = _3412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3422 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3414);
    float _3424 = _3416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3426 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3418);
    float _3428 = _3420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3430 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3432 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3434 = abs(_3402);
    float _3436 = log2(_3434);
    float _3438 = _3404 * _3356;
    float _3440 = -_3428;
    float _3442 = fma(_3440, _3408, 1.0);
    float _3444 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3432);
    float _3446 = _3404 * _3368;
    float _3448 = _3438 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3450 = _3426 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3452 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3454 = _3404 * _3364;
    float _3456 = -_3448;
    float _3458 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3456);
    float _3460 = log2(_3442);
    float _3462 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3452);
    float _3464 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3466 = -_3454;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3458);
    float _3470 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3472 = _3446 + 1.0;
    float _3474 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3476 = fma(_3468, -0.5, 0.5);
    float _3478 = 1.0 / _3462;
    float _3480 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3470);
    float _3482 = fma(_3468, 0.5, 0.5);
    float _3484 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3464);
    float _3486 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3480);
    float _3488 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3484);
    float _3490 = exp2(_3474);
    float _3492 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3486);
    float _3494 = _3460 * 0.693147182464599609375;
    float _3496 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3488);
    float _3498 = sqrt(_3476);
    float _3500 = fma(_3482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3502 = _3492 * _3478;
    float _3504 = fma(_3482, _3500, -0.212114393711090087890625);
    float _3506 = -_3446;
    float _3508 = fma(_3490, _3472, _3506);
    float _3510 = fma(_3482, _3504, 1.570728778839111328125);
    float _3512 = _3496 * _3478;
    float _3514 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3516 = fma(_3502, 0.5, 0.5);
    float _3518 = fma(_3508, 0.5, 0.5);
    float _3520 = fma(_3512, -0.5, 0.5);
    float _3522 = _3498 * 0.636619746685028076171875;
    float3 _8959 = float3(_3516, _3520, _3514);
    float _3524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8959, float3(0.0), isnan(_8959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8959, float3(0.0), isnan(_8959)), level(0.0)).x;
    float3 _8970 = float3(_3516, _3520, _3514);
    float4 _3527 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8970, float3(0.0), isnan(_8970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8970, float3(0.0), isnan(_8970)), level(0.0)).xyzw;
    float _3529 = _3527.x;
    float _3531 = _3527.y;
    float _3533 = _3527.z;
    float _3535 = _3527.w;
    float _3537 = -_3510;
    float _3539 = fma(_3522, _3537, 1.0);
    float2 _8992 = float2(_3539, _3518);
    float3 _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8992, float2(0.0), isnan(_8992)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8992, float2(0.0), isnan(_8992)), level(0.0)).xyz;
    float _3545 = _3543.x;
    float _3547 = _3543.y;
    float _3549 = _3543.z;
    float _3551 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3553 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3555 = _3158 > 0.0;
    bool _3557 = isnan(_3158);
    bool _3559 = _3555 || _3557;
    bool _3561 = isnan(0.0);
    bool _3563 = _3559 || _3561;
    float _3565 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3553);
    float _3567 = exp2(_3551);
    bool _3569 = _3216 <= 0.0;
    bool _3571 = !_3563;
    bool _3573 = _3569 || _3571;
    float _3575 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3565);
    float _3577 = _3158 * _3216;
    float _3579 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3575);
    float _3581 = _3492 + _3462;
    float _3583 = _3577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3585 = _3462 * 0.5;
    float _3587 = _3579 + _3462;
    float _3589 = _3581 * 0.5;
    out.gl_Position.x = _3492;
    out.gl_Position.y = _3496;
    out.gl_Position.z = _3579;
    out.gl_Position.w = _3462;
    float _3591 = fma(_3496, -0.5, _3585);
    float _3593 = _3587 * 0.5;
    float _3595 = -_3567;
    float _3597 = _3595 + 1.0;
    float _3599 = _3583 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3601 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3589;
    out.m_70.y = _3591;
    out.m_70.z = _3593;
    out.m_70.w = _3462;
    float _3603 = -_3601;
    float _3605 = _3603 + 1.0;
    out.m_45.x = _3599;
    float _3607 = _3601 * _3524;
    float _3609 = _3535 * _3605;
    float _3611 = _3535 * _3607;
    float _3613 = _3549 * _3607;
    float _3615 = fma(_3545, _3611, _3529);
    float _3617 = fma(_3547, _3611, _3531);
    float _3619 = fma(_3535, _3613, _3533);
    out.m_72.x = _3615;
    out.m_72.y = _3617;
    out.m_72.z = _3619;
    out.m_72.w = _3609;
    if (!_3573)
    {
        return out;
    }
    float _3621 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3621;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _953 = false;
    bool _793 = false;
    bool _451 = false;
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
        float _3678 = as_type<float>(_107);
        out.gl_Position.z = _3678;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _3747 = as_type<float>(_143);
        out.gl_Position.z = _3747;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _145;
    float _209 = _187;
    float _211 = 0.0;
    if (!_205)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _147 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _147);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _231;
        _209 = _241;
        _211 = _229;
    }
    float _243 = _207;
    float _245 = _209;
    float _247 = _211;
    bool _249 = !_159;
    float _251 = _243;
    float _253 = _247;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _147 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _251 = _267;
        _253 = _261;
        _175 = _273;
    }
    float _275 = _251;
    float _277 = _253;
    float _279 = _175;
    float _281 = _275;
    float _283 = _277;
    if (!_159)
    {
        float _285 = _125 * _125;
        float _287 = _285 * 0.5;
        _281 = _287;
    }
    float _289 = _281;
    float _291 = _289;
    if (!_159)
    {
        _283 = _125;
    }
    float _293 = _283;
    float _295 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _293;
    if (!_159)
    {
        float _301 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _301;
    }
    float _303 = _291;
    bool _305 = !_159;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _125 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _125);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_159;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _125 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = fma(_279, _163, _297);
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_279, _161, _295);
    float _373 = fma(_363, _163, _365);
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _377 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _381 = fma(_367, _149, _169);
    float _383 = fma(_363, _161, _369);
    float _385 = -_373;
    float _387 = _367 + _385;
    float _389 = fma(_279, _165, _377);
    float _391 = fma(_363, _165, _379);
    float _393 = fma(_371, _149, _167);
    float _395 = -_383;
    float _397 = _371 + _395;
    float _399 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = -_391;
    float _407 = _389 + _405;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _411 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _415 = fma(_389, _149, _171);
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
    float _419 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = !_375;
    float _425 = _419;
    float _427 = _417;
    float _429 = _421;
    float _431 = _417;
    float _449;
    if (!_423)
    {
        float _433 = in.m_54.x;
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _437 = _433 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_91);
        float _455 = 1.0 / _453;
        float _457 = _125 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _481 = 1.0 / _467;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _491 = 1.0 / _471;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _495 = _459 + _493;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _499 = 1.0 / _479;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _459 + _501;
    float _505 = _495 * _481;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _509 = _459 + _507;
    float _511 = 1.0 / _475;
    float _513 = _503 * _491;
    bool _515 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _517 = isnan(_459);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    bool _527 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _529 = isnan(_459);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    bool _539 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _541 = isnan(_459);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _489;
    float _553 = _509 * _499;
    bool _555 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _557 = isnan(_459);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_549;
    float _569 = _567 + 1.0;
    float _571 = -_565;
    float _573 = _571 + 1.0;
    float _575 = _463 * _511;
    float _577 = -_525;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _485;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _585 = _459 + _583;
    float _587 = _549 * _573;
    float _589 = _537 * _579;
    float _591 = -_537;
    float _593 = _591 + 1.0;
    bool _595 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _597 = isnan(_459);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _585 * _551;
    bool _609 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _611 = isnan(_459);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _565 * _593;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _627;
    bool _631 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _633 = isnan(_459);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = _619 * _569;
    float _645 = fma(_625, _505, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _647 = fma(_629, _505, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _649 = -_605;
    float _651 = _649 + 1.0;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _655 = _459 + _653;
    float _657 = -_619;
    float _659 = _657 + 1.0;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _665 = _641 * _651;
    float _667 = _655 * _581;
    float _669 = _605 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _675 = _645 * _665;
    float _677 = _647 * _665;
    float _679 = -_641;
    float _681 = _679 + 1.0;
    float _683 = fma(_663, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _689;
    float _693 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[143].x, _675);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _695;
    float _699 = fma(_673, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _707 = fma(_687, _553, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _709 = fma(_683, _669, _693);
    float _711 = fma(_691, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _713 = in.m_52.x;
    float _715 = in.m_52.y;
    float _717 = fma(_697, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _719 = fma(_699, _669, _701);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _725;
    float _729 = fma(_711, _643, _709);
    float _731 = fma(_705, _553, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _733 = fma(_717, _643, _719);
    float _735 = fma(_723, _667, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _737 = fma(_727, _667, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _743 = fma(_707, _587, _729);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _749 = fma(_731, _587, _733);
    float _751 = fma(_741, _607, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _753 = fma(_735, _621, _743);
    float _755 = fma(_747, _607, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _757 = fma(_737, _621, _749);
    float _759 = fma(_751, _589, _753);
    float _761 = fma(_755, _589, _757);
    float _763 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[149].x, _759);
    float _765 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[149].y, _761);
    float _767 = _763 * _713;
    float _769 = _765 * _715;
    bool _771 = !_497;
    float _773 = _643;
    float _791;
    if (!_771)
    {
        float _775 = in.m_54.x;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _779 = _775 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _783 = _781 * _777;
        float _785 = floor(_783);
        float _787 = -_785;
        float _789 = _783 + _787;
        _791 = _789;
        _793 = true;
    }
    else
    {
        float _795 = float(_91);
        float _797 = 1.0 / _795;
        float _799 = _125 * _797;
        _791 = _799;
    }
    _793 = false;
    float _801 = _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _805 = _801 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _811 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = isnan(_801);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _827 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _829 = isnan(_801);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _839;
    bool _843 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _845 = isnan(_801);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = 1.0 / _809;
    float _857 = -_821;
    float _859 = _857 + 1.0;
    float _861 = _837 * _859;
    float _863 = -_837;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _825;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _877 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _841 * _855;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = fma(_881, _805, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _889 = -_853;
    float _891 = _889 + 1.0;
    float _893 = _887 * _861;
    float _895 = _885 * _867;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _899 = _801 + _897;
    float _901 = _821 * _891;
    float _903 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _905 = fma(_895, _899, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _907 = fma(_905, _901, _903);
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _911 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[117].x, _907);
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _917 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _921 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _917;
    out.m_56.y = _921;
    out.m_56.z = _923;
    out.m_56.w = _925;
    out.m_58.x = _927;
    out.m_58.y = _877;
    out.m_58.z = _879;
    out.m_58.w = _875;
    bool _929 = !_873;
    float _949;
    float _951;
    if (!_929)
    {
        float _931 = in.m_54.x;
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _935 = float(_91);
        float _937 = _931 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _941 = _939 * _933;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = _935;
        _953 = true;
    }
    else
    {
        float _955 = float(_91);
        float _957 = 1.0 / _955;
        float _959 = _125 * _957;
        _949 = _959;
        _951 = _955;
    }
    _953 = false;
    float _961 = _949;
    float _963 = _951;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _967 = int(_965);
    float _969 = in.m_54.x;
    float _971 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _979 = _961 + _977;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _983 = int(_981);
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _993 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _997 = _961 + _995;
    bool _999 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1001 = isnan(_961);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1013 = float(_967);
    float _1015 = 1.0 / _963;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1025 = float(uint(_983));
    float _1027 = 1.0 / _1013;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    int _1033 = ~_983;
    int _1035 = _1033 + 1;
    float _1037 = float(_983);
    int _1039 = _983 + (-1);
    float _1041 = 1.0 / _1025;
    if (_975)
    {
        _773 = _969;
    }
    float _1043 = _773;
    float _1045 = _125 * _1027;
    float _1047 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1049 = log2(_1047);
    int _1051 = as_type<int>(_1041) + (-2);
    float _1053 = trunc(_1045);
    int _1055 = int(_1053);
    float _1057 = 1.0 / _991;
    float _1059 = float(uint(_1055));
    float _1061 = _125 * _1049;
    float _1063 = 1.0 / _987;
    float _1065 = as_type<float>(_1051) * _1059;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1067;
    float _1071 = _997 * _1057;
    float _1073 = trunc(_1065);
    float _1075 = precise::max(_1073, 0.0);
    uint _1078 = uint(_1075);
    float _1080 = exp2(_1061);
    float _1082 = in.m_54.z;
    float _1084 = in.m_54.w;
    int _1086 = _1031 * int(_1078);
    int _1088 = _1086 + _1055;
    float _1090 = as_type<float>(_1031);
    float _1092 = _1043;
    if (!_975)
    {
        float _1094 = in.m_54.y;
        _1090 = _1094;
    }
    float _1096 = _1090;
    float _1098 = float(uint(_1088));
    float _1100 = as_type<float>(_1051) * _1098;
    float _1102 = float(_1055);
    bool _1104 = _1102 >= _1037;
    bool _1106 = isnan(_1102);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(_1037);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = trunc(_1100);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    bool _1122 = _1082 > 0.5;
    float _1124 = _1102;
    if (!_975)
    {
        _1092 = _1082;
    }
    float _1126 = _1092;
    float _1128 = -_203;
    int _1130 = _1122 ? as_type<int>(_1128) : as_type<int>(_203);
    float _1132 = trunc(_1114);
    int _1134 = int(_1132);
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_975)
    {
        _1124 = _1096;
    }
    float _1138 = _1124;
    int _1140 = int(_1078) + int(_1120);
    int _1142 = _1035 * _1140;
    int _1144 = _1142 + _1055;
    bool _1146 = !_975;
    float _1148 = _1146 ? 5.839270114898681640625 : 1.0;
    bool _1150 = !_975;
    float _1152 = _1150 ? _1082 : _969;
    bool _1154 = uint(_1144) >= uint(_983);
    float _1156 = as_type<float>(_1144);
    float _1158 = _1138;
    if (!_975)
    {
        _1156 = _1138;
    }
    float _1160 = _1156;
    float _1162 = _1148 * _1152;
    bool _1164 = !_1154;
    int _1166 = _1164 ? 0 : (-1);
    bool _1168 = _983 == 0;
    float _1170 = floor(_1162);
    float _1172 = _1160;
    float _1174 = _1096;
    if (_975)
    {
        float _1176 = in.m_54.x;
        float _1178 = in.m_54.y;
        _1172 = _1176;
        _1174 = _1178;
    }
    float _1180 = _1172;
    float _1182 = _1174;
    int _1184 = ~_1140;
    int _1186 = _1184 + _1166;
    int _1188 = _1186 + 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1192 = _1190 != 0;
    int _1194 = ~_1134;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    int _1200 = _983 * _1188;
    int _1202 = _1200 + _1055;
    bool _1204 = !_1168;
    int _1206 = _1204 ? _1202 : (-1);
    float _1208 = -_1170;
    float _1210 = _1162 + _1208;
    bool _1212 = !_1192;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = _1206 * _1198;
    float _1218 = _1037 * _1210;
    float _1220 = _125 * _1037;
    int _1222 = _1134 * _1039;
    int _1224 = _1222 + _1216;
    int _1226 = abs(_1214);
    bool _1228 = _1182 > 0.5;
    float _1230 = _1220 * _1015;
    float _1232 = trunc(_1218);
    int _1234 = int(_1232);
    float _1236 = _1182 * 2.0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1244 = _1242 != 0;
    float _1246 = -_199;
    int _1248 = _1228 ? as_type<int>(_1246) : as_type<int>(_199);
    if (_975)
    {
        _1158 = _1182;
    }
    float _1250 = _1158;
    bool _1252 = !_1244;
    float _1254 = _1252 ? _203 : as_type<float>(_1130);
    float _1256 = trunc(_1230);
    int _1258 = int(_1256);
    bool _1260 = !_1240;
    float _1262 = _1260 ? _199 : as_type<float>(_1248);
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1266 = _1264 != 0;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1274 = _1272 != 0;
    int _1276 = _1234 * _1226;
    int _1278 = _1276 + _1055;
    bool _1280 = !_1270;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = floor(_1236);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1288 = _1286 != 0;
    bool _1290 = !_1266;
    int _1292 = _1290 ? 0 : 1;
    int _1294 = abs(_1282);
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1298 = _1296 != 0;
    bool _1300 = !_1288;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = abs(_1292);
    bool _1306 = !_1298;
    int _1308 = _1306 ? 0 : 1;
    int _1310 = abs(_1302);
    int _1312 = _1224 * _1294;
    float _1314 = _969 * 2.0;
    int _1316 = abs(_1308);
    int _1318 = _1258 * _1304;
    int _1320 = _1318 + _1312;
    int _1322 = ~_983;
    int _1324 = _1322 + 1;
    float _1326 = floor(_1314);
    int _1328 = ~_983;
    int _1330 = _1328 + 1;
    int _1332 = _1278 * _1310;
    int _1334 = _1332 + _1320;
    bool _1336 = _1084 > 0.5;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1338;
    int _1342 = _1234 * _1316;
    int _1344 = _1342 + _1334;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1350 = 1.0 / _1340;
    float _1352 = float(uint(_1344));
    float _1354 = as_type<float>(_1051) * _1352;
    float _1356 = 1.0 / _1348;
    float _1358 = trunc(_1354);
    float _1360 = precise::max(_1358, 0.0);
    uint _1362 = uint(_1360);
    float _1364 = _979 * _1356;
    bool _1366 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1368 = isnan(_961);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    int _1378 = _1324 * int(_1362);
    int _1380 = _1378 + _1344;
    float _1382 = float(uint(_1380));
    float _1384 = as_type<float>(_1051) * _1382;
    float _1386 = trunc(_1384);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    int _1392 = int(_1362) + int(_1390);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1402 = _1330 * _1392;
    int _1404 = _1402 + _1344;
    float _1406 = 1.0 / _1396;
    bool _1408 = uint(_1404) >= uint(_983);
    bool _1410 = !_1408;
    int _1412 = _1410 ? 0 : (-1);
    float _1414 = 1.0 / _1400;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1418 = _1416 != 0;
    int _1420 = ~_1392;
    int _1422 = _1420 + _1412;
    int _1424 = _1422 + 1;
    int _1426 = _983 * _1424;
    int _1428 = _1426 + _1344;
    float _1430 = -_203;
    int _1432 = _1336 ? as_type<int>(_1430) : as_type<int>(_203);
    bool _1434 = _1082 > 0.5;
    bool _1436 = !_1168;
    int _1438 = _1436 ? _1428 : (-1);
    float _1440 = -_199;
    int _1442 = _1434 ? as_type<int>(_1440) : as_type<int>(_199);
    bool _1444 = !_1418;
    float _1446 = _1444 ? _203 : as_type<float>(_1432);
    int _1448 = _1438 & 3;
    bool _1450 = _1448 != 0;
    bool _1452 = !_1274;
    float _1454 = _1452 ? _199 : as_type<float>(_1442);
    bool _1456 = uint(_1448) >= 2u;
    int _1458 = _1438 & 3;
    bool _1460 = _1458 != 0;
    int _1462 = _1456 ? 0 : 1;
    bool _1464 = _1448 != 3;
    int _1466 = _1460 ? 0 : 1;
    bool _1468 = uint(_1448) > 1u;
    int _1470 = ~_1462;
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    int _1476 = ~_1466;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    int _1482 = _1474;
    int _1484 = _1480;
    if (_1464)
    {
        int _1486 = ~_1462;
        int _1488 = _1486 + 1;
        _1482 = _1488;
    }
    int _1490 = _1482;
    bool _1492 = _969 > 0.5;
    if (!_1468)
    {
        int _1494 = ~_1466;
        int _1496 = _1494 + 1;
        _1484 = _1496;
    }
    int _1498 = _1484;
    float _1500 = -_199;
    int _1502 = _1492 ? as_type<int>(_1500) : as_type<int>(_199);
    bool _1504 = _1326 >= 0.0;
    bool _1506 = isnan(_1326);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(0.0);
    bool _1512 = _1508 || _1510;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1516 = _1514 != 0;
    int _1518 = _1512 ? 0 : 1;
    bool _1520 = _1326 > 0.0;
    float _1522 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1524 = !_1516;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1530 = _1528 != 0;
    float _1532 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1522);
    int _1534 = abs(_1490);
    bool _1536 = !_1530;
    float _1538 = _1536 ? _199 : as_type<float>(_1502);
    int _1540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1542 = _1540 != 0;
    float _1544 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1546 = _1082 * 2.0;
    int _1548 = ~_1518;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = _1538 + 0.5;
    int _1556 = _1552;
    if (!_1520)
    {
        int _1558 = ~_1518;
        int _1560 = _1558 + 1;
        _1556 = _1560;
    }
    int _1562 = _1556;
    float _1564 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1544);
    bool _1566 = _1284 >= 0.0;
    bool _1568 = isnan(_1284);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    float _1576 = floor(_1546);
    float _1578 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1580 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1564);
    int _1582 = _1574 ? 0 : 1;
    float _1584 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1532);
    bool _1586 = _1284 > 0.0;
    float _1588 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _993);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1592 = _961 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1596 = _961 + _1594;
    float _1598 = _1584 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1600 = _1592 * _1406;
    float _1602 = _1596 * _1414;
    float _1604 = 1.0 / _1069;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1608 = _961 + _1606;
    int _1610 = ~_1582;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1618 = _961 + _1616;
    float _1620 = fma(_1019, _1600, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    int _1622 = _1614;
    if (!_1586)
    {
        int _1624 = ~_1582;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = _1608 * _1063;
    bool _1632 = _1576 >= 0.0;
    bool _1634 = isnan(_1576);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1618 * _1350;
    float _1644 = -_1080;
    float _1646 = _1644 + 1.0;
    int _1648 = _1640 ? 0 : 1;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1652 = _961 + _1650;
    bool _1654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1656 = isnan(0.0);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1662 = _1658 || _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1664;
    float _1668 = _1652 * _1604;
    float _1670 = _1662 ? _1646 : 0.0;
    float _1672 = fma(_1666, _1600, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1674 = _1576 > 0.0;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1684 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1686 = isnan(_961);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -_1376;
    float _1698 = _1696 + 1.0;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1704 = fma(_1682, _1364, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1706 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1708 = isnan(_961);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = _1694 * _1698;
    float _1720 = -_1694;
    float _1722 = _1720 + 1.0;
    bool _1724 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1726 = isnan(_961);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1736;
    float _1740 = fma(_1678, _1642, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1742 = _1716 * _1722;
    bool _1744 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1746 = isnan(_961);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = -_1734;
    float _1758 = _1756 + 1.0;
    float _1760 = fma(_1738, _1642, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1762 = fma(_1702, _1602, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1764 = fma(_1023, _1602, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1766 = _1754 * _1758;
    float _1768 = -_1754;
    float _1770 = _1768 + 1.0;
    float _1772 = -_1716;
    float _1774 = _1772 + 1.0;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1778 = _1776 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1780 = _1580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1782;
    float _1786 = _1734 * _1774;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1790 = 1.0 + _1788;
    float _1792 = fma(_1778, _1364, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1794 = fma(_1784, _1630, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1796 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1798 = isnan(_961);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    bool _1808 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1810 = isnan(_961);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = 1.0 / _1790;
    float _1822 = _1806 * _1770;
    float _1824 = -_1806;
    float _1826 = _1824 + 1.0;
    float _1828 = -_1818;
    float _1830 = _1828 + 1.0;
    int _1832 = abs(_1526);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1840 = _1838 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1842;
    float _1846 = _1009 * _1830;
    float _1848 = fma(_1836, _1630, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1854 = -_1009;
    float _1856 = _1854 + 1.0;
    float _1858 = _1672 * _1846;
    float _1860 = _1620 * _1846;
    float _1862 = _1818 * _1826;
    float _1864 = fma(_1852, _1071, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1866 = _1670 * _1820;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1868;
    float _1872 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1858);
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1860);
    float _1876 = fma(_1844, _1668, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1878 = float(uint(_1278));
    float _1880 = fma(_1870, _1668, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1884 = as_type<float>(_1051) * _1878;
    float _1886 = _1858;
    float _1888 = _1862;
    float _1890 = _1786;
    if (!_975)
    {
        float _1892 = in.m_54.z;
        _1886 = _1892;
    }
    float _1894 = _1886;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1898 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1882);
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1902 = trunc(_1884);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    float _1908 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1910 = fma(_1762, _1862, _1872);
    float _1912 = fma(_1764, _1862, _1874);
    float _1914 = fma(_1840, _1071, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1916 = -_1900;
    float _1918 = fma(_1908, 2.0, _1916);
    float _1920 = fma(_1740, _1822, _1910);
    int _1922 = ~_983;
    int _1924 = _1922 + 1;
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1928 = _1598 + _1926;
    float _1930 = -_1896;
    float _1932 = fma(_1136, 2.0, _1930);
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1936 = ~_1648;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1946 = _1780 + _1944;
    float _1948 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1950 = _1924 * int(_1906);
    int _1952 = _1950 + _1278;
    int _1954 = _1940;
    if (!_1674)
    {
        int _1956 = ~_1648;
        int _1958 = _1956 + 1;
        _1954 = _1958;
    }
    int _1960 = _1954;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1964 = _1942 + _1962;
    float _1966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1968 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1948);
    float _1970 = fma(_1760, _1822, _1912);
    float _1972 = float(uint(_1952));
    float _1974 = _1182 + _969;
    float _1976 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1968);
    float _1978 = _1974;
    float _1980 = _1894;
    if (!_975)
    {
        _1888 = _1894;
    }
    float _1982 = _1888;
    float _1984 = fma(_1792, _1766, _1970);
    float _1986 = _1974 + (-1.0);
    float _1988 = as_type<float>(_1051) * _1972;
    float _1990 = _1982;
    if (_975)
    {
        _1978 = _1250;
    }
    float _1992 = _1978;
    float _1994 = -_125;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1932);
    float _1998 = _1992;
    if (_975)
    {
        _1990 = _1250;
    }
    float _2000 = _1990;
    float _2002 = _1262 + 0.5;
    if (_975)
    {
        _1980 = _1250;
    }
    float _2004 = _1980;
    float _2006 = trunc(_1988);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    if (!_975)
    {
        _1998 = _969;
    }
    float _2012 = _1998;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2016 = _1976 >= 0.0;
    float _2018 = fma(_1704, _1766, _1920);
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1934);
    float _2022 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2024 = _1454 + 0.5;
    float _2026 = -_125;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1918);
    float _2030 = fma(_1794, _1786, _2018);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[90].x, _1996);
    int _2034 = _1438 >> 31;
    float _2036 = fma(_2022, _2024, _2028);
    float _2038 = fma(_1848, _1786, _1984);
    int _2040 = _2034 & 3;
    float _2042 = fma(_1864, _1742, _2030);
    if (_2016)
    {
        _1890 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2044 = _1890;
    float _2046 = fma(_1914, _1742, _2038);
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2050 = _1438 + _2040;
    float _2052 = _1928 * _1928;
    int _2054 = int(_1906) + int(_2010);
    float _2056 = fma(_2014, -2.0, _2048);
    int _2058 = _2050 >> 2;
    int _2060 = as_type<int>(_2044);
    if (_2016)
    {
        float _2062 = _2044 * 5.0;
        _2060 = as_type<int>(_2062);
    }
    int _2064 = _2060;
    int _2066 = ~_983;
    int _2068 = _2066 + 1;
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2072 = _2058 << 4;
    int _2074 = _2072 + 656;
    float _2076 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6699 = as_type<float>(_2064);
        out.gl_Position.z = _6699;
    }
    int _2078 = _2068 * _2054;
    int _2080 = _2078 + _1278;
    float _2082 = -_203;
    int _2084 = _1228 ? as_type<int>(_2082) : as_type<int>(_203);
    float _2086 = fma(_1876, _1718, _2042);
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2090 = _1448 != 3;
    float _2092 = fma(_1880, _1718, _2046);
    bool _2094 = uint(_2080) >= uint(_983);
    float _2096 = fma(_2076, -2.0, _2088);
    bool _2098 = !_1450;
    int _2100 = _2098 ? 0 : 1;
    float _2102 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1898);
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2106 = fma(_1946, _1946, _2052);
    float _2108 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2056);
    uint _2110 = uint(int(uint(_2074) >> uint(2)));
    uint _2112 = uint(int(uint(int(_2110)) >> uint(2)));
    int _2114 = int(_2110) & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    int _2118 = int(_2110) + 1;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    int _2122 = _2118 & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    bool _2126 = !_2094;
    int _2128 = _2126 ? 0 : (-1);
    float _2130 = fma(_1964, _1964, _2106);
    bool _2132 = !_1542;
    float _2134 = _2132 ? _203 : as_type<float>(_2084);
    float _2136 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2140 = _2138 != 0;
    int _2142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2144 = _2142 != 0;
    int _2146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2148 = _2146 != 0;
    float _2150 = rsqrt(_2130);
    float _2152 = _1446 + (-0.5);
    int _2154 = _2074 + 8;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    float _2172 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2096);
    float _2174 = -_2102;
    float _2176 = _2174 + 1.0;
    float _2178 = -_2136;
    float _2180 = -_2108;
    float _2182 = fma(_2178, _2152, _2180);
    float _2184 = _1254 + (-0.5);
    float _2186 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2020);
    float _2188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2190 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2192 = -_2184;
    float _2194 = -_2172;
    float _2196 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[90].y, _2194);
    float _2198 = -_2176;
    float _2200 = fma(_1454, _2198, _2036);
    float _2202 = -_2134;
    float _2204 = _2202 + 0.5;
    float _2206 = _1578 * _2104;
    float _2208 = -_2186;
    float _2210 = _2208 + 1.0;
    bool _2212 = !_2090;
    int _2214 = _2212 ? 0 : (-1);
    float _2216 = _2190 * _2150;
    float _2218 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2220 = fma(_1446, _2210, _2182);
    int _2222 = abs(_2214);
    float _2224 = _1928 * _2216;
    float _2226 = _1946 * _2216;
    int _2228 = ~_2054;
    int _2230 = _2228 + _2128;
    int _2232 = _2230 + 1;
    float _2234 = _1964 * _2216;
    float _2236 = _2218 * _2188;
    int _2238 = abs(_1498);
    float _2240 = -_2224;
    float _2242 = _1928 + _2240;
    float _2244 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2086);
    float _2246 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2092);
    float _2248 = -_2226;
    float _2250 = _1946 + _2248;
    float _2252 = _2242 * _2242;
    out.m_60.x = _2206;
    out.m_60.y = _2236;
    out.m_60.z = _2200;
    out.m_60.w = _2220;
    int _2254 = ~_2238;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _983 * _2232;
    int _2262 = _2260 + _1278;
    float _2264 = fma(_2250, _2250, _2252);
    int _2266 = abs(_2100);
    float _2268 = -_2234;
    float _2270 = _1964 + _2268;
    float _2272 = float(_1960);
    out.m_62.x = _2244;
    out.m_62.y = _2246;
    float _2274 = fma(_2270, _2270, _2264);
    int _2276 = _2258 * as_type<int>(_2124);
    int _2278 = ~_2266;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    if (_2016)
    {
        out.m_45.x = 0.0;
    }
    float _2284 = float(_1562);
    float _2286 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2288 = _2282 * as_type<int>(_2116);
    int _2290 = _2288 + _2276;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2294 = ~_1534;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2302 = ~_2222;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2292);
    int _2310 = _2298 * as_type<int>(_2162);
    int _2312 = _2310 + _2290;
    float _2314 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2300);
    float _2316 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2308);
    float _2318 = in.m_64.x;
    float _2320 = in.m_64.y;
    float _2322 = in.m_64.z;
    int _2324 = _2306 * as_type<int>(_2170);
    int _2326 = _2324 + _2312;
    bool _2328 = !_2140;
    int _2330 = _2328 ? 0 : 1;
    float _2332 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2314);
    float _2334 = -_2316;
    float _2336 = _2334 + 1.0;
    int _2338 = abs(_2330);
    float _2340 = -_2332;
    float _2342 = _2340 + 1.0;
    float _2344 = -_2336;
    float _2346 = fma(_1262, _2344, _2032);
    int _2348 = ~_1832;
    int _2350 = _2348 + 1;
    int _2352 = _2350 + 1;
    float _2354 = fma(_1254, _2342, _2196);
    bool _2356 = !_1168;
    int _2358 = _2356 ? _2262 : (-1);
    int _2360 = _2326 * _2352;
    float _2362 = float(_2338);
    bool _2364 = !_2144;
    int _2366 = _2364 ? 0 : 1;
    int _2368 = _2358 * _1832;
    int _2370 = _2368 + _2360;
    out.m_66.x = _2346;
    out.m_66.y = _2354;
    float _2372 = _2362 * _2272;
    int _2374 = abs(_2366);
    float _2376 = _969 + (-0.5);
    float _2378 = float(_2370);
    float _2380 = _2372 * (-2.0);
    float _2382 = float(_2374);
    bool _2384 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2386 = isnan(1.0);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2392 = _2388 || _2390;
    out.m_68.z = _2378;
    float _2394 = fma(_2380, _2318, _2318);
    float _2396 = _2382 * _2284;
    float _2398 = fma(_2286, _2380, _2286);
    float _2400 = _1082 + _1182;
    float _2402 = fma(_2376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2394);
    bool _2404 = !_2148;
    int _2406 = _2404 ? 0 : 1;
    float _2408 = _2322;
    if (_2016)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2410 = -_2224;
    float _2412 = _1598 + _2410;
    int _2414 = abs(_2406);
    float _2416 = -_2226;
    float _2418 = _1780 + _2416;
    bool _2420 = !_2392;
    float _2422 = _2420 ? _125 : _1866;
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2426 = _2412 + _2424;
    float _2428 = float(_1628);
    float _2430 = -_2234;
    float _2432 = _1942 + _2430;
    float _2434 = float(_2414);
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2438 = _2418 + _2436;
    float _2440 = _2426 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2442 = _2400 + (-1.0);
    float _2444 = fma(_2422, _2398, _2402);
    float _2446 = _2396 * (-2.0);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2450 = _2432 + _2448;
    float _2452 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2440);
    float _2454 = _2434 * _2428;
    float _2456 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2458 = _2444 * 0.15915493667125701904296875;
    float _2460 = _1182 + (-0.5);
    float _2462 = fma(_2446, _2320, _2320);
    float _2464 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2452);
    float _2466 = _1082 + _969;
    float _2468 = fma(_2456, _2446, _2456);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2462);
    float _2472 = _2466 + (-1.0);
    bool _2474 = _2464 >= 0.0;
    float _2476 = _2454 * (-2.0);
    float _2478 = fma(_2422, _2468, _2470);
    float _2480 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2482 = _1082 + (-0.5);
    float _2484 = fma(_2476, _2322, _2322);
    float _2486 = _2478 * 0.15915493667125701904296875;
    float _2488 = fma(_2480, _2476, _2480);
    float _2490 = sqrt(_2274);
    float _2492 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2484);
    float _2494 = _2418;
    if (_2474)
    {
        _2408 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2496 = _2408;
    float _2498 = fma(_2422, _2488, _2492);
    int _2500 = as_type<int>(_2496);
    if (_2474)
    {
        out.m_45.x = 0.0;
    }
    float _2502 = _2458 * 6.283185482025146484375;
    float _2504 = sin(_2502);
    if (_2474)
    {
        float _2506 = _2496 * 5.0;
        _2500 = as_type<int>(_2506);
    }
    int _2508 = _2500;
    float _2510 = _2498 * 0.15915493667125701904296875;
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7394 = as_type<float>(_2508);
        out.gl_Position.z = _7394;
    }
    float _2512 = _2458 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    float _2516 = _2486 * 6.283185482025146484375;
    float _2518 = sin(_2516);
    float _2520 = _2486 * 6.283185482025146484375;
    float _2522 = cos(_2520);
    if (_2474)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2524 = _2510 * 6.283185482025146484375;
    float _2526 = cos(_2524);
    float _2528 = _2150 * _2490;
    float _2530 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2536 = _1011 * _2528;
    float _2538 = _2528 * _2530;
    float _2540 = _2514 * _2522;
    float _2542 = _2510 * 6.283185482025146484375;
    float _2544 = sin(_2542);
    float _2546 = _2532 * _2538;
    float _2548 = _2504 * _2518;
    float _2550 = _2526 * _2546;
    float _2552 = _2534 * _2536;
    float _2554 = _2514 * _2518;
    float _2556 = _2504 * _2522;
    float _2558 = _2514 * _2550;
    float _2560 = _2518 * _2526;
    float _2562 = _2522 * _2526;
    float _2564 = _2504 * _2550;
    float _2566 = fma(_2544, _2540, _2548);
    float _2568 = -_2546;
    float _2570 = _2544 * _2568;
    float _2572 = -_2556;
    float _2574 = fma(_2544, _2554, _2572);
    float _2576 = -_2554;
    float _2578 = fma(_2544, _2556, _2576);
    float _2580 = fma(_2566, _2552, _2558);
    float _2582 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2584 = _2582 * 0.5;
    float _2586 = fma(_2562, _2552, _2570);
    float _2588 = fma(_2544, _2548, _2540);
    float _2590 = fma(_2578, _2552, _2564);
    float _2592 = fma(_2574, _2584, _2580);
    float _2594 = fma(_2560, _2584, _2586);
    float _2596 = fma(_2588, _2584, _2590);
    float _2598 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2602 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2604 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2606 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2600);
    float _2608 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2602);
    float _2610 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2604);
    float _2612 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2606);
    float _2614 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2608);
    float _2616 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2618 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2620 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2622 = _1942 + _2616;
    float _2624 = _1780 + _2618;
    float _2626 = _1598 + _2620;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2630 = _2622 + _2628;
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2634 = _2624 + _2632;
    float _2636 = _2630 * _2630;
    float _2638 = fma(_2634, _2634, _2636);
    float _2640 = sqrt(_2638);
    bool _2642 = _2640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2644 = _2596;
    float _2646 = _2636;
    float _2648 = _2624;
    float _2650 = _2630;
    float _2652 = _2580;
    float _2654 = _2638;
    float _2656 = _2626;
    if (!_2642)
    {
        _2644 = _2622;
    }
    float _2658 = _2644;
    float _2660 = _2658;
    if (!_2642)
    {
        _2646 = _2626;
    }
    float _2662 = _2646;
    bool _2664 = !_2642;
    float _2666 = _2662;
    if (!_2664)
    {
        float _2668 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2672 = _2640 + _2670;
        float _2674 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2676 = rsqrt(_2638);
        float _2678 = _2672 * _2668;
        float _2680 = _2678 * 0.15915493667125701904296875;
        float _2682 = _2680 * 6.283185482025146484375;
        float _2684 = cos(_2682);
        float _2686 = _2680 * 6.283185482025146484375;
        float _2688 = sin(_2686);
        float _2690 = _2684 + (-1.0);
        float _2692 = fma(_2688, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2694 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2696 = _2676 * _2692;
        float _2698 = fma(_2626, _2684, _2694);
        float _2700 = fma(_2634, _2696, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2702 = fma(_2630, _2696, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2666 = _2698;
        _2648 = _2700;
        _2660 = _2702;
    }
    float _2704 = _2666;
    float _2706 = _2648;
    float _2708 = _2660;
    float _2710 = -_1598;
    float _2712 = _2710 + _2704;
    float _2714 = -_1780;
    float _2716 = _2714 + _2706;
    float _2718 = -_1942;
    float _2720 = _2718 + _2708;
    float _2722 = _2712 * _2712;
    float _2724 = fma(_2716, _2716, _2722);
    float _2726 = fma(_2720, _2720, _2724);
    float _2728 = sqrt(_2726);
    bool _2730 = _2728 > 0.0;
    float _2732 = _2728;
    float _2734 = _2708;
    float _2736 = _2706;
    if (!_2730)
    {
        _2650 = _2706;
    }
    float _2738 = _2650;
    float _2740 = _2738;
    if (!_2730)
    {
        _2732 = _2704;
    }
    float _2742 = _2732;
    bool _2744 = !_2730;
    float _2746 = _2742;
    float _2748 = _2742;
    float _2750 = _2742;
    if (!_2744)
    {
        bool _2752 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2754 = _2738;
        if (_2752)
        {
            float _2756 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2754 = _2756;
        }
        float _2758 = _2754;
        float _2760 = _2758;
        if (_2752)
        {
            float _2762 = _417 * _2758;
            _2652 = _2762;
        }
        float _2764 = _2652;
        float _2766 = _2764;
        if (_2752)
        {
            float _2768 = _419 * _2758;
            _2654 = _2768;
        }
        float _2770 = _2654;
        float _2772 = _2770;
        if (_2752)
        {
            float _2774 = _421 * _2758;
            _2656 = _2774;
        }
        float _2776 = _2656;
        float _2778 = _2776;
        if (!_2752)
        {
            float _2780 = _125 + 1.0;
            float _2782 = _2780;
            if (!_159)
            {
                float _2784 = _2780 * _2780;
                float _2786 = _2784 * 0.5;
                _2746 = _2786;
            }
            float _2788 = _2746;
            float _2790 = _2788;
            if (!_159)
            {
                float _2792 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2790 = _2792;
            }
            float _2794 = _2790;
            bool _2796 = !_159;
            float _2798 = _2794;
            if (!_2796)
            {
                float _2800 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2802 = log2(_2800);
                float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2806 = 1.0 + _2804;
                float _2808 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2810 = _2802 * _2780;
                float _2812 = 1.0 / _2806;
                float _2814 = _2808 * 0.693147182464599609375;
                float _2816 = exp2(_2810);
                float _2818 = 1.0 / _2814;
                float _2820 = _2816 + (-1.0);
                float _2822 = -_2820;
                float _2824 = fma(_2822, _2818, _2780);
                float _2826 = _2824 * _2812;
                float _2828 = _2826 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2798 = _2828;
            }
            float _2830 = _2798;
            float _2832 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2834 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2836 = !_159;
            _2760 = _2832;
            if (!_2836)
            {
                float _2838 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2840 = log2(_2838);
                float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2844 = 1.0 + _2842;
                float _2846 = 1.0 / _2844;
                float _2848 = _2840 * _2780;
                float _2850 = exp2(_2848);
                float _2852 = -_2850;
                float _2854 = _2852 + 1.0;
                float _2856 = _2854 * _2846;
                _2782 = _2856;
            }
            float _2858 = _2782;
            float _2860 = fma(_2858, _163, _2834);
            float _2862 = fma(_2858, _161, _2832);
            float _2864 = _2830 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2866 = -_373;
            float _2868 = _2866 + _2860;
            float _2870 = -_383;
            float _2872 = _2870 + _2862;
            float _2874 = fma(_2858, _165, _2864);
            float _2876 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2878 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2880 = _2868 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2882 = -_391;
            float _2884 = _2882 + _2874;
            float _2886 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2876);
            float _2888 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2878);
            float _2890 = fma(_2872, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2880);
            float _2892 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2886);
            float _2894 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2888);
            float _2896 = fma(_2884, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2890);
            _425 = _2894;
            _427 = _2892;
            _429 = _2896;
            _2766 = _2892;
            _2772 = _2894;
            _2778 = _2896;
            _2748 = _2878;
        }
        float _2898 = _425;
        float _2900 = _427;
        float _2902 = _429;
        float _2904 = _2766;
        float _2906 = _2772;
        float _2908 = _2778;
        float _2910 = _2748;
        float _2912 = _2760;
        float _2914 = _2898 * _2898;
        float _2916 = rsqrt(_2726);
        float _2918 = fma(_2900, _2900, _2914);
        float _2920 = fma(_2902, _2902, _2918);
        float _2922 = sqrt(_2920);
        float _2924 = _2712 * _2916;
        float _2926 = _2716 * _2916;
        float _2928 = _2720 * _2916;
        bool _2930 = _2922 > 0.0;
        float _2932 = _2912;
        float _2934 = _2910;
        _431 = _2900;
        if (!_2930)
        {
            _2932 = _2706;
        }
        float _2936 = _2932;
        _2740 = _2936;
        if (!_2930)
        {
            _2934 = _2704;
        }
        float _2938 = _2934;
        bool _2940 = !_2930;
        _2750 = _2938;
        if (!_2940)
        {
            float _2942 = rsqrt(_2920);
            float _2944 = _2942 * _2898;
            float _2946 = _2942 * _2900;
            float _2948 = _2942 * _2902;
            float _2950 = _2924 * _2944;
            float _2952 = fma(_2926, _2946, _2950);
            float _2954 = fma(_2928, _2948, _2952);
            float _2956 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2958 = fma(_2904, _2956, _2706);
            float _2960 = fma(_2906, _2956, _2704);
            float _2962 = fma(_2908, _2956, _2708);
            _2734 = _2962;
            _2750 = _2960;
            _2740 = _2958;
        }
    }
    float _2964 = _2734;
    float _2966 = _2750;
    float _2968 = _2740;
    float _2970 = _431;
    float _2972 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2972);
    bool _2986 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2988 = isnan(0.5);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2994 = _2990 || _2992;
    float _2996 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2984);
    float _2998 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3000 = _2996 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3002 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2998);
    float _3004 = 1.0 / _3000;
    float _3006 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3002);
    float _3008 = _2966;
    float _3010 = _2970;
    if (_2994)
    {
        _2736 = 1.0;
    }
    float _3012 = _2736;
    float _3014 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3016 = _3014 + _3000;
    float _3018 = -_2234;
    float _3020 = _3018 + _2964;
    float _3022 = _3016 * _3004;
    float _3024 = _3022 * 0.5;
    float _3026 = -_2224;
    float _3028 = _3026 + _2966;
    float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3032 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3030);
    float _3034 = -_2226;
    float _3036 = _3034 + _2968;
    float _3038 = 1.0 / _3032;
    float _3040 = _3028;
    float _3042 = _3036;
    float _3044 = _3020;
    float _3046 = _3012;
    if (!_2982)
    {
        float _3048 = _2426 * _2426;
        float _3050 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3052 = -_1942;
        float _3054 = _3052 + _2964;
        float _3056 = -_1598;
        float _3058 = _3056 + _2966;
        float _3060 = fma(_2438, _2438, _3048);
        float _3062 = fma(_2450, _2450, _3060);
        float _3064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3066 = sqrt(_3062);
        float _3068 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3070 = 1.0 / _2528;
        float _3072 = precise::min(_3066, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3074 = _3072 * _3064;
        float _3076 = _3074 * _3070;
        float _3078 = -_1780;
        float _3080 = _3078 + _2968;
        float _3082 = _3068 * _3076;
        float _3084 = _3054 * _3076;
        float _3086 = fma(_3080, _3082, _2418);
        float _3088 = fma(_3058, _3082, _2412);
        float _3090 = fma(_3068, _3084, _2432);
        _3040 = _3088;
        _3042 = _3086;
        _3044 = _3090;
    }
    float _3092 = _3040;
    float _3094 = _3042;
    float _3096 = _3044;
    if (_2994)
    {
        _3008 = 1.0;
    }
    float _3098 = _3008;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3102 = _3038 * _3100;
    float _3104 = _3098;
    float _3106 = _3102;
    if (!_2994)
    {
        float _3108 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3110 = _3108 * 0.15915493667125701904296875;
        float _3112 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3114 = _3110 * 6.283185482025146484375;
        float _3116 = cos(_3114);
        float _3118 = _3112 * 0.15915493667125701904296875;
        float _3120 = _3110 * 6.283185482025146484375;
        float _3122 = sin(_3120);
        float _3124 = 1.0 / _3116;
        float _3126 = _3118 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        float _3130 = _3122 * _3124;
        float _3132 = _3118 * 6.283185482025146484375;
        float _3134 = sin(_3132);
        float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3138 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3136;
        float _3140 = _3128 * _3130;
        float _3142 = 1.0 / _3138;
        float _3144 = 1.0 / _3140;
        float _3146 = _3134 * _3144;
        float _3148 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3150 = fma(_3102, _3146, _3148);
        float _3152 = _3150 * _3142;
        float _3154 = precise::clamp(_3152, 0.0, 1.0);
        _2494 = _3142;
        _3046 = _3154;
    }
    float _3156 = _2494;
    float _3158 = _3046;
    float _3160 = _3156;
    if (!_2994)
    {
        float _3162 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3164 = _3162 * 0.15915493667125701904296875;
        float _3166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3168 = _3164 * 6.283185482025146484375;
        float _3170 = cos(_3168);
        float _3172 = _3166 * 0.15915493667125701904296875;
        float _3174 = _3164 * 6.283185482025146484375;
        float _3176 = sin(_3174);
        float _3178 = 1.0 / _3170;
        float _3180 = _3172 * 6.283185482025146484375;
        float _3182 = cos(_3180);
        float _3184 = _3176 * _3178;
        float _3186 = _3172 * 6.283185482025146484375;
        float _3188 = sin(_3186);
        float _3190 = _3182 * _3184;
        float _3192 = 1.0 / _3190;
        float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3196 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3194;
        float _3198 = 1.0 / _3196;
        float _3200 = _3188 * _3192;
        float _3202 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3204 = fma(_3102, _3200, _3202);
        float _3206 = _3204 * _3198;
        float _3208 = precise::clamp(_3206, 0.0, 1.0);
        float _3210 = -_3208;
        float _3212 = _3210 + 1.0;
        _3160 = _3192;
        _3104 = _3212;
    }
    float _3214 = _3160;
    float _3216 = _3104;
    float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3220 = _3092 + _3218;
    float _3222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3224 = _3094 + _3222;
    float _3226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3228 = _3096 + _3226;
    float _3230 = _3220 * _3220;
    float _3232 = fma(_3224, _3224, _3230);
    float _3234 = fma(_3228, _3228, _3232);
    float _3236 = rsqrt(_3234);
    float _3238 = sqrt(_3234);
    float _3240 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3242 = _3224 * _3240;
    float _3244 = _3228 * _3240;
    float _3246 = _3242 * _3242;
    float _3248 = _3244 * _3244;
    float _3250 = _3246 + _3248;
    float _3252 = sqrt(_3250);
    bool _3254 = _3252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3258 = _3252 + _3256;
    float _3260 = _3228;
    float _3262 = _3214;
    float _3264 = _3258;
    float _3266 = _3220;
    if (_3254)
    {
        float _3268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3260 = _3268;
    }
    float _3270 = _3260;
    if (_3254)
    {
        float _3272 = rsqrt(_3250);
        _3262 = _3272;
    }
    float _3274 = _3262;
    float _3276 = _3274;
    if (_3254)
    {
        float _3278 = _3258 * _3270;
        _3264 = _3278;
    }
    float _3280 = _3264;
    if (_3254)
    {
        float _3282 = _3280 * 0.15915493667125701904296875;
        _3106 = _3282;
    }
    float _3284 = _3106;
    float _3286 = _3236;
    if (_3254)
    {
        float _3288 = _3284 * 6.283185482025146484375;
        float _3290 = sin(_3288);
        _3286 = _3290;
    }
    float _3292 = _3286;
    float _3294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3296 = precise::max(0.0, _3294);
    float _3298 = _3232;
    float _3300 = _3294;
    if (_3254)
    {
        float _3302 = _3284 * 6.283185482025146484375;
        float _3304 = cos(_3302);
        _3298 = _3304;
    }
    float _3306 = _3298;
    float _3308 = -_3240;
    float _3310 = -_3296;
    float _3312 = fma(_3220, _3308, _3310);
    float _3314 = _3312;
    if (_3254)
    {
        float _3316 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3300 = _3316;
    }
    float _3318 = _3300;
    float _3320 = _3292;
    float _3322 = _3318;
    if (_3254)
    {
        float _3324 = fma(_3292, _3318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3266 = _3324;
    }
    float _3326 = _3266;
    float _3328 = _3326;
    if (!_3254)
    {
        _3320 = _3242;
    }
    float _3330 = _3320;
    float _3332 = _3330;
    float _3334 = _3306;
    if (_3254)
    {
        float _3336 = _3306 + (-1.0);
        _3322 = _3336;
    }
    float _3338 = _3322;
    float _3340 = _3338;
    if (_3254)
    {
        float _3342 = _3274 * _3326;
        _3010 = _3342;
    }
    float _3344 = _3010;
    if (!_3254)
    {
        _3328 = _3246;
    }
    float _3346 = _3328;
    float _3348 = _3346;
    if (_3254)
    {
        float _3350 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3276 = _3350;
    }
    float _3352 = _3276;
    if (_3254)
    {
        float _3354 = _3242 * _3344;
        _3332 = _3354;
    }
    float _3356 = _3332;
    if (!_3254)
    {
        _3340 = _3244;
    }
    float _3358 = _3340;
    float _3360 = _3358;
    if (_3254)
    {
        float _3362 = _3244 * _3344;
        _3360 = _3362;
    }
    float _3364 = _3360;
    if (_3254)
    {
        float _3366 = fma(_3312, _3306, _3352);
        _3314 = _3366;
    }
    float _3368 = _3314;
    if (_3254)
    {
        float _3370 = _3356 * _3356;
        _3348 = _3370;
    }
    float _3372 = _3348;
    if (!_3254)
    {
        _3334 = _3248;
    }
    float _3374 = _3334;
    float _3376 = _3374;
    if (_3254)
    {
        float _3378 = _3364 * _3364;
        _3376 = _3378;
    }
    float _3380 = _3376;
    float _3382 = fma(_3368, _3368, _3372);
    float _3384 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3386 = _3382 + _3380;
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3390 = fma(_3238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3388);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3396 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3384);
    float _3398 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3400 = -_3392;
    float _3402 = _3400 + 1.0;
    float _3404 = rsqrt(_3386);
    float _3406 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3394);
    float _3408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3410 = _3092 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3412 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3396);
    float _3414 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3398);
    float _3416 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3406);
    float _3418 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3410);
    float _3420 = _3412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3422 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3414);
    float _3424 = _3416 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3426 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3418);
    float _3428 = _3420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3430 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3432 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3434 = abs(_3402);
    float _3436 = log2(_3434);
    float _3438 = _3404 * _3356;
    float _3440 = -_3428;
    float _3442 = fma(_3440, _3408, 1.0);
    float _3444 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3432);
    float _3446 = _3404 * _3368;
    float _3448 = _3438 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3450 = _3426 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3452 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3454 = _3404 * _3364;
    float _3456 = -_3448;
    float _3458 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3456);
    float _3460 = log2(_3442);
    float _3462 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3452);
    float _3464 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3466 = -_3454;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3458);
    float _3470 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3472 = _3446 + 1.0;
    float _3474 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3476 = fma(_3468, -0.5, 0.5);
    float _3478 = 1.0 / _3462;
    float _3480 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3470);
    float _3482 = fma(_3468, 0.5, 0.5);
    float _3484 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3464);
    float _3486 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3480);
    float _3488 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3484);
    float _3490 = exp2(_3474);
    float _3492 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3486);
    float _3494 = _3460 * 0.693147182464599609375;
    float _3496 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3488);
    float _3498 = sqrt(_3476);
    float _3500 = fma(_3482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3502 = _3492 * _3478;
    float _3504 = fma(_3482, _3500, -0.212114393711090087890625);
    float _3506 = -_3446;
    float _3508 = fma(_3490, _3472, _3506);
    float _3510 = fma(_3482, _3504, 1.570728778839111328125);
    float _3512 = _3496 * _3478;
    float _3514 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3516 = fma(_3502, 0.5, 0.5);
    float _3518 = fma(_3508, 0.5, 0.5);
    float _3520 = fma(_3512, -0.5, 0.5);
    float _3522 = _3498 * 0.636619746685028076171875;
    float3 _8959 = float3(_3516, _3520, _3514);
    float _3524 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8959, float3(0.0), isnan(_8959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8959, float3(0.0), isnan(_8959)), level(0.0)).x;
    float3 _8970 = float3(_3516, _3520, _3514);
    float4 _3527 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8970, float3(0.0), isnan(_8970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8970, float3(0.0), isnan(_8970)), level(0.0)).xyzw;
    float _3529 = _3527.x;
    float _3531 = _3527.y;
    float _3533 = _3527.z;
    float _3535 = _3527.w;
    float _3537 = -_3510;
    float _3539 = fma(_3522, _3537, 1.0);
    float2 _8992 = float2(_3539, _3518);
    float3 _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8992, float2(0.0), isnan(_8992)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8992, float2(0.0), isnan(_8992)), level(0.0)).xyz;
    float _3545 = _3543.x;
    float _3547 = _3543.y;
    float _3549 = _3543.z;
    float _3551 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3553 = _3424 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3555 = _3158 > 0.0;
    bool _3557 = isnan(_3158);
    bool _3559 = _3555 || _3557;
    bool _3561 = isnan(0.0);
    bool _3563 = _3559 || _3561;
    float _3565 = fma(_3430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3553);
    float _3567 = exp2(_3551);
    bool _3569 = _3216 <= 0.0;
    bool _3571 = !_3563;
    bool _3573 = _3569 || _3571;
    float _3575 = fma(_3420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3565);
    float _3577 = _3158 * _3216;
    float _3579 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3575);
    float _3581 = _3492 + _3462;
    float _3583 = _3577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3585 = _3462 * 0.5;
    float _3587 = _3579 + _3462;
    float _3589 = _3581 * 0.5;
    out.gl_Position.x = _3492;
    out.gl_Position.y = _3496;
    out.gl_Position.z = _3579;
    out.gl_Position.w = _3462;
    float _3591 = fma(_3496, -0.5, _3585);
    float _3593 = _3587 * 0.5;
    float _3595 = -_3567;
    float _3597 = _3595 + 1.0;
    float _3599 = _3583 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3601 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3589;
    out.m_70.y = _3591;
    out.m_70.z = _3593;
    out.m_70.w = _3462;
    float _3603 = -_3601;
    float _3605 = _3603 + 1.0;
    out.m_45.x = _3599;
    float _3607 = _3601 * _3524;
    float _3609 = _3535 * _3605;
    float _3611 = _3535 * _3607;
    float _3613 = _3549 * _3607;
    float _3615 = fma(_3545, _3611, _3529);
    float _3617 = fma(_3547, _3611, _3531);
    float _3619 = fma(_3535, _3613, _3533);
    out.m_72.x = _3615;
    out.m_72.y = _3617;
    out.m_72.z = _3619;
    out.m_72.w = _3609;
    if (!_3573)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3621 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3621;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

