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
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_54 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
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
    bool _269 = false;
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
        float _1297 = as_type<float>(_105);
        out.gl_Position.z = _1297;
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
        float _1366 = as_type<float>(_141);
        out.gl_Position.z = _1366;
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
    float _151 = _147 * _145;
    float _153 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    int _155 = as_type<int>(_149) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_149) & 2;
    bool _161 = _159 != 0;
    float _163 = _153 * 6.283185482025146484375;
    float _165 = floor(_153);
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    float _171 = _163 * 0.15915493667125701904296875;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _175 = _173 != 0;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = cos(_181);
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    int _191 = _189 ? 0 : 1;
    bool _193 = !_187;
    int _195 = _193 ? 0 : 1;
    float _197 = -_165;
    float _199 = _153 + _197;
    int _201 = abs(_191);
    int _203 = abs(_195);
    float _205 = -_199;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = !_179;
    int _211 = _209 ? 0 : 1;
    float _213 = float(_201);
    float _215 = fma(_183, 0.5, 0.5);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_211);
    float _221 = abs(_207);
    float _223 = _213 * _221;
    bool _225 = _199 < 0.5;
    float _227 = float(_225);
    float _229 = float(_203);
    float _231 = -_215;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = -_227;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _239 = !_157;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_229, _233, _223);
    float _245 = float(_219);
    float _247 = abs(_237);
    float _249 = fma(_245, _247, _243);
    bool _251 = !_217;
    float _267;
    if (!_251)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_89);
        float _273 = 1.0 / _271;
        float _275 = _123 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _277 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = in.m_54.x;
    float _317 = in.m_54.y;
    float _319 = in.m_54.z;
    float _321 = in.m_54.w;
    float _323 = 1.0 / _293;
    bool _325 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _327 = isnan(0.5);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _333 = _329 || _331;
    bool _335 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _337 = isnan(0.5);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _343 = _339 || _341;
    float _345 = 1.0 / _297;
    float _347 = 1.0 / _301;
    float _349 = _281 * _323;
    bool _351 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_277);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    bool _363 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_277);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _285 * _345;
    float _377 = -_313;
    float _379 = _377 + 1.0;
    bool _381 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_277);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = _361 * _379;
    float _399 = fma(_395, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _289 * _347;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_391;
    float _413 = _411 + 1.0;
    float _415 = _373 * _405;
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = fma(_409, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _423 = in.m_56.x;
    float _425 = in.m_56.y;
    float _427 = _391 * _419;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = _421 * _427;
    float _439 = fma(_431, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = _399 * _427;
    float _443 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _437);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = fma(_435, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _451 = fma(_439, _415, _443);
    float _453 = fma(_447, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    float _459 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _441);
    float _461 = fma(_449, _397, _451);
    float _463 = in.m_58.x;
    float _465 = in.m_58.y;
    float _467 = in.m_58.z;
    float _469 = in.m_58.w;
    float _471 = fma(_457, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_453, _415, _459);
    float _475 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[146].y, _461);
    float _477 = in.m_42.x;
    float _479 = in.m_42.y;
    float _481 = in.m_42.z;
    float _483 = fma(_471, _397, _473);
    float _485 = _475 * _425;
    float _487 = in.m_60.x;
    float _489 = in.m_60.y;
    float _491 = in.m_60.z;
    float _493 = in.m_60.w;
    float _495 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _497 = _249 * _485;
    float _499 = _495 * _423;
    float _501 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _503 = _497 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _505 = _249 * _499;
    float _507 = _503 * _501;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _513 = _507 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _515 = _507 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _517 = _511 * _509;
    float _519 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _521 = _479 * _317;
    float _523 = _479 * _465;
    float _525 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _515);
    float _527 = _507 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _529 = fma(_477, _315, _521);
    float _531 = _479 * _489;
    float _533 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _513);
    float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _525);
    float _537 = fma(_481, _319, _529);
    float _539 = fma(_477, _487, _531);
    float _541 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _533);
    float _543 = fma(_477, _463, _523);
    float _545 = _537 + _321;
    float _547 = fma(_481, _491, _539);
    float _549 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _551 = _535 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _553 = fma(_481, _467, _543);
    float _555 = _547 + _493;
    float _557 = _545 + _549;
    float _559 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _527);
    float _561 = _553 + _469;
    float _563 = _555 + _551;
    float _565 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _567 = _557 + _565;
    float _569 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _559);
    float _571 = _561 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _573 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _575 = _563 + _573;
    float _577 = _567 * _567;
    float _579 = _569 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _581 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _571);
    float _583 = fma(_575, _575, _577);
    float _585 = _561 + _579;
    float _587 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _581);
    float _589 = _561 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = sqrt(_583);
    float _593 = _587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _595 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _597 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _595);
    float _599 = 1.0 / _593;
    float _601 = _597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _603 = _601 + _593;
    bool _605 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _607 = _603 * _599;
    float _609 = _607 * 0.5;
    float _611 = _593;
    float _613 = _519;
    float _615 = _513;
    float _617 = _563;
    float _619 = _553;
    float _621 = _575;
    float _623 = _609;
    float _625 = _557;
    if (!_605)
    {
        _611 = _563;
    }
    float _627 = _611;
    float _629 = _627;
    if (!_605)
    {
        _613 = _557;
    }
    float _631 = _613;
    float _633 = _631;
    if (!_605)
    {
        _615 = _585;
    }
    float _635 = _615;
    bool _637 = !_605;
    float _639 = _635;
    if (!_637)
    {
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _645 = _591 + _643;
        float _647 = rsqrt(_583);
        float _649 = _645 * _641;
        float _651 = _585 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _653 = _649 * 0.15915493667125701904296875;
        float _655 = _653 * 6.283185482025146484375;
        float _657 = cos(_655);
        float _659 = _653 * 6.283185482025146484375;
        float _661 = sin(_659);
        float _663 = _657 + (-1.0);
        float _665 = fma(_661, _651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _667 = _663 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = _647 * _665;
        float _671 = fma(_585, _657, _667);
        float _673 = fma(_575, _669, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _675 = fma(_567, _669, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _629 = _673;
        _633 = _675;
        _639 = _671;
    }
    float _677 = _629;
    float _679 = _633;
    float _681 = _639;
    float _683 = _681;
    float _685 = _677;
    float _687 = _679;
    if (_343)
    {
        _617 = 1.0;
    }
    float _689 = _617;
    float _691 = _689;
    if (!_333)
    {
        float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _695 = _561 + _693;
        float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _699 = _555 + _697;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _703 = -_555;
        float _705 = _703 + _677;
        float _707 = _695 * _695;
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _711 = _545 + _709;
        float _713 = -_545;
        float _715 = _713 + _679;
        float _717 = fma(_699, _699, _707);
        float _719 = fma(_711, _711, _717);
        float _721 = sqrt(_719);
        float _723 = precise::min(_721, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _725 = _723 * _701;
        float _727 = -_561;
        float _729 = _727 + _681;
        float _731 = fma(_705, _725, _555);
        float _733 = fma(_729, _725, _561);
        float _735 = fma(_715, _725, _545);
        _683 = _733;
        _685 = _731;
        _687 = _735;
        _619 = _715;
        _621 = _729;
    }
    float _737 = _683;
    float _739 = _685;
    float _741 = _687;
    float _743 = _619;
    float _745 = _621;
    float _747 = _743;
    if (!_343)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _751 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[30].w, _749);
        float _753 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _757 = 1.0 / _751;
        float _759 = 1.0 / _755;
        float _761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _763 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _765 = fma(_757, _761, _763);
        float _767 = _765 * _759;
        float _769 = precise::clamp(_767, 0.0, 1.0);
        _623 = _757;
        _691 = _769;
    }
    float _771 = _623;
    float _773 = _691;
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _777 = _737 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _781 = _739 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _785 = _741 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_781, _781, _787);
    float _791 = fma(_785, _785, _789);
    float _793 = rsqrt(_791);
    float _795 = _793 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _797 = _781 * _795;
    float _799 = _785 * _795;
    float _801 = _797 * _797;
    float _803 = _799 * _799;
    float _805 = _801 + _803;
    float _807 = sqrt(_805);
    bool _809 = _807 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = _807 + _811;
    float _815 = _771;
    float _817 = _813;
    float _819 = _777;
    float _821 = _797;
    if (_809)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _815 = _823;
    }
    float _825 = _815;
    float _827 = _825;
    if (_809)
    {
        float _829 = _813 * _825;
        _817 = _829;
    }
    float _831 = _817;
    if (_809)
    {
        float _833 = rsqrt(_805);
        _827 = _833;
    }
    float _835 = _827;
    float _837 = _835;
    if (_809)
    {
        float _839 = _831 * 0.15915493667125701904296875;
        _747 = _839;
    }
    float _841 = _747;
    float _843 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _845 = _785;
    if (_809)
    {
        float _847 = _841 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = precise::max(0.0, _843);
    float _855 = _745;
    float _857 = _853;
    if (_809)
    {
        float _859 = _841 * 6.283185482025146484375;
        float _861 = cos(_859);
        _855 = _861;
    }
    float _863 = _855;
    float _865 = -_795;
    float _867 = -_853;
    float _869 = fma(_777, _865, _867);
    if (_809)
    {
        float _871 = _869 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _819 = _871;
    }
    float _873 = _819;
    float _875 = sqrt(_791);
    float _877 = _851;
    float _879 = _873;
    if (_809)
    {
        float _881 = fma(_851, _873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _877 = _881;
    }
    float _883 = _877;
    float _885 = _883;
    if (!_809)
    {
        _879 = _869;
    }
    float _887 = _879;
    float _889 = _887;
    if (_809)
    {
        float _891 = _835 * _883;
        _625 = _891;
    }
    float _893 = _625;
    if (!_809)
    {
        _885 = _801;
    }
    float _895 = _885;
    float _897 = _895;
    float _899 = _863;
    if (_809)
    {
        float _901 = _863 + (-1.0);
        _857 = _901;
    }
    float _903 = _857;
    float _905 = _903;
    if (_809)
    {
        float _907 = _797 * _893;
        _821 = _907;
    }
    float _909 = _821;
    float _911 = _737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_809)
    {
        float _913 = _903 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _913;
    }
    float _915 = _837;
    if (!_809)
    {
        _905 = _799;
    }
    float _917 = _905;
    float _919 = _917;
    if (_809)
    {
        float _921 = _799 * _893;
        _919 = _921;
    }
    float _923 = _919;
    if (_809)
    {
        float _925 = _909 * _909;
        _897 = _925;
    }
    float _927 = _897;
    if (_809)
    {
        float _929 = fma(_869, _863, _915);
        _889 = _929;
    }
    float _931 = _889;
    if (!_809)
    {
        _899 = _803;
    }
    float _933 = _899;
    float _935 = _933;
    if (_809)
    {
        float _937 = _923 * _923;
        _935 = _937;
    }
    float _939 = _935;
    float _941 = fma(_931, _931, _927);
    float _943 = _737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _947 = _941 + _939;
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _951 = fma(_875, (*spvDescriptorSet0.vp_c15)._m0[23].w, _949);
    float _953 = precise::clamp(_951, 0.0, 1.0);
    float _955 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _957 = _737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _959 = rsqrt(_947);
    float _961 = -_953;
    float _963 = _961 + 1.0;
    float _965 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[2].z, _955);
    float _967 = _737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[1].x, _957);
    float _971 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[3].z, _945);
    float _973 = _965 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _975 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[0].x, _967);
    float _977 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[1].z, _969);
    float _979 = abs(_963);
    float _981 = log2(_979);
    float _983 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _985 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[0].z, _975);
    float _987 = _977 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _989 = _973 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _991 = _985 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _993 = _959 * _909;
    float _995 = _987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _997 = _959 * _931;
    float _999 = _959 * _923;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _995);
    float _1005 = -_989;
    float _1007 = fma(_1005, _983, 1.0);
    float _1009 = _971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1011 = -_1001;
    float _1013 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1011);
    float _1015 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1003);
    float _1017 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1019 = log2(_1007);
    float _1021 = -_999;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1013);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1015);
    float _1027 = _987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1029 = fma(_1023, -0.5, 0.5);
    float _1031 = fma(_1023, 0.5, 0.5);
    float _1033 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1027);
    float _1035 = 1.0 / _1025;
    float _1037 = _987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1039 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1033);
    float _1041 = fma(_1031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1043 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1037);
    float _1045 = _997 + 1.0;
    float _1047 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1039);
    float _1049 = exp2(_1017);
    float _1051 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1043);
    float _1053 = fma(_1031, _1041, -0.212114393711090087890625);
    float _1055 = _1019 * 0.693147182464599609375;
    float _1057 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1051);
    float _1059 = fma(_1031, _1053, 1.570728778839111328125);
    float _1061 = sqrt(_1029);
    float _1063 = _1047 * _1035;
    float _1065 = _1057 * _1035;
    float _1067 = fma(_1063, 0.5, 0.5);
    float _1069 = fma(_1065, -0.5, 0.5);
    float _1071 = -_997;
    float _1073 = fma(_1049, _1045, _1071);
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = _1061 * 0.636619746685028076171875;
    float3 _2849 = float3(_1067, _1069, _1075);
    float _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2849, float3(0.0), isnan(_2849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2849, float3(0.0), isnan(_2849)), level(0.0)).x;
    float _1083 = -_1059;
    float _1085 = fma(_1079, _1083, 1.0);
    float3 _2865 = float3(_1067, _1069, _1075);
    float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2865, float3(0.0), isnan(_2865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2865, float3(0.0), isnan(_2865)), level(0.0)).xyzw;
    float _1090 = _1088.x;
    float _1092 = _1088.y;
    float _1094 = _1088.z;
    float _1096 = _1088.w;
    float2 _2882 = float2(_1085, _1077);
    float3 _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2882, float2(0.0), isnan(_2882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2882, float2(0.0), isnan(_2882)), level(0.0)).xyz;
    float _1102 = _1100.x;
    float _1104 = _1100.y;
    float _1106 = _1100.z;
    float _1108 = in.m_49.y;
    float _1110 = _987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1112 = _143 > 0.5;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1110);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1124 = _1122 != 0;
    float _1126 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1128 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1134 = -_241;
    int _1136 = _1112 ? as_type<int>(_1134) : as_type<int>(_241);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1142 = !_1118;
    float _1144 = _1142 ? _241 : as_type<float>(_1136);
    float _1146 = exp2(_1128);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1150 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1152 = _1108 > 0.5;
    float _1154 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = -_169;
    int _1160 = _1152 ? as_type<int>(_1158) : as_type<int>(_169);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1168 = !_1124;
    float _1170 = _1168 ? _169 : as_type<float>(_1160);
    out.m_62.x = _1150;
    out.m_62.y = _1154;
    out.m_62.z = _1156;
    out.m_62.w = _1148;
    float _1172 = -_1146;
    float _1174 = _1172 + 1.0;
    float _1176 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1120);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1180 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1144 + 0.5;
    float _1188 = -_1170;
    float _1190 = _1188 + 0.5;
    float _1192 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1176);
    float _1194 = _249 * _1126;
    bool _1196 = _773 > 0.0;
    bool _1198 = isnan(_773);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    out.m_64.x = _1180;
    out.m_64.y = _1182;
    out.m_64.z = _1184;
    out.m_64.w = _1178;
    float _1206 = _1174 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1208 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1210 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1212 = _1194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1214 = -_1206;
    float _1216 = _1214 + 1.0;
    out.gl_Position.x = _1047;
    out.gl_Position.y = _1057;
    out.gl_Position.z = _1192;
    out.gl_Position.w = _1025;
    out.m_45.x = _1212;
    float _1218 = _1192 + _1025;
    float _1220 = _1208 * _1114;
    float _1222 = _1210 * _1130;
    float _1224 = _1218 * 0.5;
    out.m_66.x = _1220;
    out.m_66.y = _1222;
    out.m_68.z = _1224;
    out.m_68.w = _1025;
    float _1226 = _1206 * _1081;
    float _1228 = _1096 * _1226;
    float _1230 = _1096 * _1216;
    float _1232 = _1106 * _1226;
    float _1234 = fma(_1102, _1228, _1090);
    float _1236 = fma(_1104, _1228, _1092);
    float _1238 = fma(_1096, _1232, _1094);
    out.m_70.x = _1234;
    out.m_70.y = _1236;
    out.m_70.z = _1238;
    out.m_70.w = _1230;
    if (_1204)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1240;
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
    bool _269 = false;
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
        float _1297 = as_type<float>(_105);
        out.gl_Position.z = _1297;
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
        float _1366 = as_type<float>(_141);
        out.gl_Position.z = _1366;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = _147 * _145;
    float _153 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    int _155 = as_type<int>(_149) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_149) & 2;
    bool _161 = _159 != 0;
    float _163 = _153 * 6.283185482025146484375;
    float _165 = floor(_153);
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    float _171 = _163 * 0.15915493667125701904296875;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _175 = _173 != 0;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = cos(_181);
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    int _191 = _189 ? 0 : 1;
    bool _193 = !_187;
    int _195 = _193 ? 0 : 1;
    float _197 = -_165;
    float _199 = _153 + _197;
    int _201 = abs(_191);
    int _203 = abs(_195);
    float _205 = -_199;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = !_179;
    int _211 = _209 ? 0 : 1;
    float _213 = float(_201);
    float _215 = fma(_183, 0.5, 0.5);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_211);
    float _221 = abs(_207);
    float _223 = _213 * _221;
    bool _225 = _199 < 0.5;
    float _227 = float(_225);
    float _229 = float(_203);
    float _231 = -_215;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = -_227;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _239 = !_157;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_229, _233, _223);
    float _245 = float(_219);
    float _247 = abs(_237);
    float _249 = fma(_245, _247, _243);
    bool _251 = !_217;
    float _267;
    if (!_251)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_89);
        float _273 = 1.0 / _271;
        float _275 = _123 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _277 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = in.m_54.x;
    float _317 = in.m_54.y;
    float _319 = in.m_54.z;
    float _321 = in.m_54.w;
    float _323 = 1.0 / _293;
    bool _325 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _327 = isnan(0.5);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _333 = _329 || _331;
    bool _335 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _337 = isnan(0.5);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _343 = _339 || _341;
    float _345 = 1.0 / _297;
    float _347 = 1.0 / _301;
    float _349 = _281 * _323;
    bool _351 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_277);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    bool _363 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_277);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _285 * _345;
    float _377 = -_313;
    float _379 = _377 + 1.0;
    bool _381 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_277);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = _361 * _379;
    float _399 = fma(_395, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _289 * _347;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_391;
    float _413 = _411 + 1.0;
    float _415 = _373 * _405;
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = fma(_409, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _423 = in.m_56.x;
    float _425 = in.m_56.y;
    float _427 = _391 * _419;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = _421 * _427;
    float _439 = fma(_431, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = _399 * _427;
    float _443 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _437);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = fma(_435, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _451 = fma(_439, _415, _443);
    float _453 = fma(_447, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    float _459 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _441);
    float _461 = fma(_449, _397, _451);
    float _463 = in.m_58.x;
    float _465 = in.m_58.y;
    float _467 = in.m_58.z;
    float _469 = in.m_58.w;
    float _471 = fma(_457, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_453, _415, _459);
    float _475 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[146].y, _461);
    float _477 = in.m_42.x;
    float _479 = in.m_42.y;
    float _481 = in.m_42.z;
    float _483 = fma(_471, _397, _473);
    float _485 = _475 * _425;
    float _487 = in.m_60.x;
    float _489 = in.m_60.y;
    float _491 = in.m_60.z;
    float _493 = in.m_60.w;
    float _495 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _497 = _249 * _485;
    float _499 = _495 * _423;
    float _501 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _503 = _497 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _505 = _249 * _499;
    float _507 = _503 * _501;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _513 = _507 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _515 = _507 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _517 = _511 * _509;
    float _519 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _521 = _479 * _317;
    float _523 = _479 * _465;
    float _525 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _515);
    float _527 = _507 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _529 = fma(_477, _315, _521);
    float _531 = _479 * _489;
    float _533 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _513);
    float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _525);
    float _537 = fma(_481, _319, _529);
    float _539 = fma(_477, _487, _531);
    float _541 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _533);
    float _543 = fma(_477, _463, _523);
    float _545 = _537 + _321;
    float _547 = fma(_481, _491, _539);
    float _549 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _551 = _535 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _553 = fma(_481, _467, _543);
    float _555 = _547 + _493;
    float _557 = _545 + _549;
    float _559 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _527);
    float _561 = _553 + _469;
    float _563 = _555 + _551;
    float _565 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _567 = _557 + _565;
    float _569 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _559);
    float _571 = _561 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _573 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _575 = _563 + _573;
    float _577 = _567 * _567;
    float _579 = _569 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _581 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _571);
    float _583 = fma(_575, _575, _577);
    float _585 = _561 + _579;
    float _587 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _581);
    float _589 = _561 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = sqrt(_583);
    float _593 = _587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _595 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _597 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _595);
    float _599 = 1.0 / _593;
    float _601 = _597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _603 = _601 + _593;
    bool _605 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _607 = _603 * _599;
    float _609 = _607 * 0.5;
    float _611 = _593;
    float _613 = _519;
    float _615 = _513;
    float _617 = _563;
    float _619 = _553;
    float _621 = _575;
    float _623 = _609;
    float _625 = _557;
    if (!_605)
    {
        _611 = _563;
    }
    float _627 = _611;
    float _629 = _627;
    if (!_605)
    {
        _613 = _557;
    }
    float _631 = _613;
    float _633 = _631;
    if (!_605)
    {
        _615 = _585;
    }
    float _635 = _615;
    bool _637 = !_605;
    float _639 = _635;
    if (!_637)
    {
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _645 = _591 + _643;
        float _647 = rsqrt(_583);
        float _649 = _645 * _641;
        float _651 = _585 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _653 = _649 * 0.15915493667125701904296875;
        float _655 = _653 * 6.283185482025146484375;
        float _657 = cos(_655);
        float _659 = _653 * 6.283185482025146484375;
        float _661 = sin(_659);
        float _663 = _657 + (-1.0);
        float _665 = fma(_661, _651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _667 = _663 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = _647 * _665;
        float _671 = fma(_585, _657, _667);
        float _673 = fma(_575, _669, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _675 = fma(_567, _669, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _629 = _673;
        _633 = _675;
        _639 = _671;
    }
    float _677 = _629;
    float _679 = _633;
    float _681 = _639;
    float _683 = _681;
    float _685 = _677;
    float _687 = _679;
    if (_343)
    {
        _617 = 1.0;
    }
    float _689 = _617;
    float _691 = _689;
    if (!_333)
    {
        float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _695 = _561 + _693;
        float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _699 = _555 + _697;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _703 = -_555;
        float _705 = _703 + _677;
        float _707 = _695 * _695;
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _711 = _545 + _709;
        float _713 = -_545;
        float _715 = _713 + _679;
        float _717 = fma(_699, _699, _707);
        float _719 = fma(_711, _711, _717);
        float _721 = sqrt(_719);
        float _723 = precise::min(_721, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _725 = _723 * _701;
        float _727 = -_561;
        float _729 = _727 + _681;
        float _731 = fma(_705, _725, _555);
        float _733 = fma(_729, _725, _561);
        float _735 = fma(_715, _725, _545);
        _683 = _733;
        _685 = _731;
        _687 = _735;
        _619 = _715;
        _621 = _729;
    }
    float _737 = _683;
    float _739 = _685;
    float _741 = _687;
    float _743 = _619;
    float _745 = _621;
    float _747 = _743;
    if (!_343)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _751 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[30].w, _749);
        float _753 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _757 = 1.0 / _751;
        float _759 = 1.0 / _755;
        float _761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _763 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _765 = fma(_757, _761, _763);
        float _767 = _765 * _759;
        float _769 = precise::clamp(_767, 0.0, 1.0);
        _623 = _757;
        _691 = _769;
    }
    float _771 = _623;
    float _773 = _691;
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _777 = _737 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _781 = _739 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _785 = _741 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_781, _781, _787);
    float _791 = fma(_785, _785, _789);
    float _793 = rsqrt(_791);
    float _795 = _793 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _797 = _781 * _795;
    float _799 = _785 * _795;
    float _801 = _797 * _797;
    float _803 = _799 * _799;
    float _805 = _801 + _803;
    float _807 = sqrt(_805);
    bool _809 = _807 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = _807 + _811;
    float _815 = _771;
    float _817 = _813;
    float _819 = _777;
    float _821 = _797;
    if (_809)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _815 = _823;
    }
    float _825 = _815;
    float _827 = _825;
    if (_809)
    {
        float _829 = _813 * _825;
        _817 = _829;
    }
    float _831 = _817;
    if (_809)
    {
        float _833 = rsqrt(_805);
        _827 = _833;
    }
    float _835 = _827;
    float _837 = _835;
    if (_809)
    {
        float _839 = _831 * 0.15915493667125701904296875;
        _747 = _839;
    }
    float _841 = _747;
    float _843 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _845 = _785;
    if (_809)
    {
        float _847 = _841 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = precise::max(0.0, _843);
    float _855 = _745;
    float _857 = _853;
    if (_809)
    {
        float _859 = _841 * 6.283185482025146484375;
        float _861 = cos(_859);
        _855 = _861;
    }
    float _863 = _855;
    float _865 = -_795;
    float _867 = -_853;
    float _869 = fma(_777, _865, _867);
    if (_809)
    {
        float _871 = _869 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _819 = _871;
    }
    float _873 = _819;
    float _875 = sqrt(_791);
    float _877 = _851;
    float _879 = _873;
    if (_809)
    {
        float _881 = fma(_851, _873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _877 = _881;
    }
    float _883 = _877;
    float _885 = _883;
    if (!_809)
    {
        _879 = _869;
    }
    float _887 = _879;
    float _889 = _887;
    if (_809)
    {
        float _891 = _835 * _883;
        _625 = _891;
    }
    float _893 = _625;
    if (!_809)
    {
        _885 = _801;
    }
    float _895 = _885;
    float _897 = _895;
    float _899 = _863;
    if (_809)
    {
        float _901 = _863 + (-1.0);
        _857 = _901;
    }
    float _903 = _857;
    float _905 = _903;
    if (_809)
    {
        float _907 = _797 * _893;
        _821 = _907;
    }
    float _909 = _821;
    float _911 = _737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_809)
    {
        float _913 = _903 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _913;
    }
    float _915 = _837;
    if (!_809)
    {
        _905 = _799;
    }
    float _917 = _905;
    float _919 = _917;
    if (_809)
    {
        float _921 = _799 * _893;
        _919 = _921;
    }
    float _923 = _919;
    if (_809)
    {
        float _925 = _909 * _909;
        _897 = _925;
    }
    float _927 = _897;
    if (_809)
    {
        float _929 = fma(_869, _863, _915);
        _889 = _929;
    }
    float _931 = _889;
    if (!_809)
    {
        _899 = _803;
    }
    float _933 = _899;
    float _935 = _933;
    if (_809)
    {
        float _937 = _923 * _923;
        _935 = _937;
    }
    float _939 = _935;
    float _941 = fma(_931, _931, _927);
    float _943 = _737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _947 = _941 + _939;
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _951 = fma(_875, (*spvDescriptorSet0.vp_c15)._m0[23].w, _949);
    float _953 = precise::clamp(_951, 0.0, 1.0);
    float _955 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _957 = _737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _959 = rsqrt(_947);
    float _961 = -_953;
    float _963 = _961 + 1.0;
    float _965 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[2].z, _955);
    float _967 = _737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[1].x, _957);
    float _971 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[3].z, _945);
    float _973 = _965 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _975 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[0].x, _967);
    float _977 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[1].z, _969);
    float _979 = abs(_963);
    float _981 = log2(_979);
    float _983 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _985 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[0].z, _975);
    float _987 = _977 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _989 = _973 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _991 = _985 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _993 = _959 * _909;
    float _995 = _987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _997 = _959 * _931;
    float _999 = _959 * _923;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _995);
    float _1005 = -_989;
    float _1007 = fma(_1005, _983, 1.0);
    float _1009 = _971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1011 = -_1001;
    float _1013 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1011);
    float _1015 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1003);
    float _1017 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1019 = log2(_1007);
    float _1021 = -_999;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1013);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1015);
    float _1027 = _987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1029 = fma(_1023, -0.5, 0.5);
    float _1031 = fma(_1023, 0.5, 0.5);
    float _1033 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1027);
    float _1035 = 1.0 / _1025;
    float _1037 = _987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1039 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1033);
    float _1041 = fma(_1031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1043 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1037);
    float _1045 = _997 + 1.0;
    float _1047 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1039);
    float _1049 = exp2(_1017);
    float _1051 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1043);
    float _1053 = fma(_1031, _1041, -0.212114393711090087890625);
    float _1055 = _1019 * 0.693147182464599609375;
    float _1057 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1051);
    float _1059 = fma(_1031, _1053, 1.570728778839111328125);
    float _1061 = sqrt(_1029);
    float _1063 = _1047 * _1035;
    float _1065 = _1057 * _1035;
    float _1067 = fma(_1063, 0.5, 0.5);
    float _1069 = fma(_1065, -0.5, 0.5);
    float _1071 = -_997;
    float _1073 = fma(_1049, _1045, _1071);
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = _1061 * 0.636619746685028076171875;
    float3 _2849 = float3(_1067, _1069, _1075);
    float _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2849, float3(0.0), isnan(_2849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2849, float3(0.0), isnan(_2849)), level(0.0)).x;
    float _1083 = -_1059;
    float _1085 = fma(_1079, _1083, 1.0);
    float3 _2865 = float3(_1067, _1069, _1075);
    float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2865, float3(0.0), isnan(_2865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2865, float3(0.0), isnan(_2865)), level(0.0)).xyzw;
    float _1090 = _1088.x;
    float _1092 = _1088.y;
    float _1094 = _1088.z;
    float _1096 = _1088.w;
    float2 _2882 = float2(_1085, _1077);
    float3 _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2882, float2(0.0), isnan(_2882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2882, float2(0.0), isnan(_2882)), level(0.0)).xyz;
    float _1102 = _1100.x;
    float _1104 = _1100.y;
    float _1106 = _1100.z;
    float _1108 = in.m_49.y;
    float _1110 = _987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1112 = _143 > 0.5;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1110);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1124 = _1122 != 0;
    float _1126 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1128 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1134 = -_241;
    int _1136 = _1112 ? as_type<int>(_1134) : as_type<int>(_241);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1142 = !_1118;
    float _1144 = _1142 ? _241 : as_type<float>(_1136);
    float _1146 = exp2(_1128);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1150 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1152 = _1108 > 0.5;
    float _1154 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = -_169;
    int _1160 = _1152 ? as_type<int>(_1158) : as_type<int>(_169);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1168 = !_1124;
    float _1170 = _1168 ? _169 : as_type<float>(_1160);
    out.m_62.x = _1150;
    out.m_62.y = _1154;
    out.m_62.z = _1156;
    out.m_62.w = _1148;
    float _1172 = -_1146;
    float _1174 = _1172 + 1.0;
    float _1176 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1120);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1180 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1144 + 0.5;
    float _1188 = -_1170;
    float _1190 = _1188 + 0.5;
    float _1192 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1176);
    float _1194 = _249 * _1126;
    bool _1196 = _773 > 0.0;
    bool _1198 = isnan(_773);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    out.m_64.x = _1180;
    out.m_64.y = _1182;
    out.m_64.z = _1184;
    out.m_64.w = _1178;
    float _1206 = _1174 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1208 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1210 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1212 = _1194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1214 = -_1206;
    float _1216 = _1214 + 1.0;
    out.gl_Position.x = _1047;
    out.gl_Position.y = _1057;
    out.gl_Position.z = _1192;
    out.gl_Position.w = _1025;
    out.m_45.x = _1212;
    float _1218 = _1192 + _1025;
    float _1220 = _1208 * _1114;
    float _1222 = _1210 * _1130;
    float _1224 = _1218 * 0.5;
    out.m_66.x = _1220;
    out.m_66.y = _1222;
    out.m_68.z = _1224;
    out.m_68.w = _1025;
    float _1226 = _1206 * _1081;
    float _1228 = _1096 * _1226;
    float _1230 = _1096 * _1216;
    float _1232 = _1106 * _1226;
    float _1234 = fma(_1102, _1228, _1090);
    float _1236 = fma(_1104, _1228, _1092);
    float _1238 = fma(_1096, _1232, _1094);
    out.m_70.x = _1234;
    out.m_70.y = _1236;
    out.m_70.z = _1238;
    out.m_70.w = _1230;
    if (_1204)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1240;
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
    bool _269 = false;
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
        float _1297 = as_type<float>(_105);
        out.gl_Position.z = _1297;
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
        float _1366 = as_type<float>(_141);
        out.gl_Position.z = _1366;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = _147 * _145;
    float _153 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    int _155 = as_type<int>(_149) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_149) & 2;
    bool _161 = _159 != 0;
    float _163 = _153 * 6.283185482025146484375;
    float _165 = floor(_153);
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    float _171 = _163 * 0.15915493667125701904296875;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _175 = _173 != 0;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = cos(_181);
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    int _191 = _189 ? 0 : 1;
    bool _193 = !_187;
    int _195 = _193 ? 0 : 1;
    float _197 = -_165;
    float _199 = _153 + _197;
    int _201 = abs(_191);
    int _203 = abs(_195);
    float _205 = -_199;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = !_179;
    int _211 = _209 ? 0 : 1;
    float _213 = float(_201);
    float _215 = fma(_183, 0.5, 0.5);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_211);
    float _221 = abs(_207);
    float _223 = _213 * _221;
    bool _225 = _199 < 0.5;
    float _227 = float(_225);
    float _229 = float(_203);
    float _231 = -_215;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = -_227;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _239 = !_157;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_229, _233, _223);
    float _245 = float(_219);
    float _247 = abs(_237);
    float _249 = fma(_245, _247, _243);
    bool _251 = !_217;
    float _267;
    if (!_251)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_89);
        float _273 = 1.0 / _271;
        float _275 = _123 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _277 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = in.m_54.x;
    float _317 = in.m_54.y;
    float _319 = in.m_54.z;
    float _321 = in.m_54.w;
    float _323 = 1.0 / _293;
    bool _325 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _327 = isnan(0.5);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _333 = _329 || _331;
    bool _335 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _337 = isnan(0.5);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _343 = _339 || _341;
    float _345 = 1.0 / _297;
    float _347 = 1.0 / _301;
    float _349 = _281 * _323;
    bool _351 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_277);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    bool _363 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_277);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _285 * _345;
    float _377 = -_313;
    float _379 = _377 + 1.0;
    bool _381 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_277);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = _361 * _379;
    float _399 = fma(_395, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _289 * _347;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_391;
    float _413 = _411 + 1.0;
    float _415 = _373 * _405;
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = fma(_409, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _423 = in.m_56.x;
    float _425 = in.m_56.y;
    float _427 = _391 * _419;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = _421 * _427;
    float _439 = fma(_431, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = _399 * _427;
    float _443 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _437);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = fma(_435, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _451 = fma(_439, _415, _443);
    float _453 = fma(_447, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    float _459 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _441);
    float _461 = fma(_449, _397, _451);
    float _463 = in.m_58.x;
    float _465 = in.m_58.y;
    float _467 = in.m_58.z;
    float _469 = in.m_58.w;
    float _471 = fma(_457, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_453, _415, _459);
    float _475 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[146].y, _461);
    float _477 = in.m_42.x;
    float _479 = in.m_42.y;
    float _481 = in.m_42.z;
    float _483 = fma(_471, _397, _473);
    float _485 = _475 * _425;
    float _487 = in.m_60.x;
    float _489 = in.m_60.y;
    float _491 = in.m_60.z;
    float _493 = in.m_60.w;
    float _495 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _497 = _249 * _485;
    float _499 = _495 * _423;
    float _501 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _503 = _497 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _505 = _249 * _499;
    float _507 = _503 * _501;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _513 = _507 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _515 = _507 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _517 = _511 * _509;
    float _519 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _521 = _479 * _317;
    float _523 = _479 * _465;
    float _525 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _515);
    float _527 = _507 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _529 = fma(_477, _315, _521);
    float _531 = _479 * _489;
    float _533 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _513);
    float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _525);
    float _537 = fma(_481, _319, _529);
    float _539 = fma(_477, _487, _531);
    float _541 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _533);
    float _543 = fma(_477, _463, _523);
    float _545 = _537 + _321;
    float _547 = fma(_481, _491, _539);
    float _549 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _551 = _535 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _553 = fma(_481, _467, _543);
    float _555 = _547 + _493;
    float _557 = _545 + _549;
    float _559 = fma(_517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _527);
    float _561 = _553 + _469;
    float _563 = _555 + _551;
    float _565 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _567 = _557 + _565;
    float _569 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _559);
    float _571 = _561 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _573 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _575 = _563 + _573;
    float _577 = _567 * _567;
    float _579 = _569 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _581 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _571);
    float _583 = fma(_575, _575, _577);
    float _585 = _561 + _579;
    float _587 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _581);
    float _589 = _561 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = sqrt(_583);
    float _593 = _587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _595 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _597 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _595);
    float _599 = 1.0 / _593;
    float _601 = _597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _603 = _601 + _593;
    bool _605 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _607 = _603 * _599;
    float _609 = _607 * 0.5;
    float _611 = _593;
    float _613 = _519;
    float _615 = _513;
    float _617 = _563;
    float _619 = _553;
    float _621 = _575;
    float _623 = _609;
    float _625 = _557;
    if (!_605)
    {
        _611 = _563;
    }
    float _627 = _611;
    float _629 = _627;
    if (!_605)
    {
        _613 = _557;
    }
    float _631 = _613;
    float _633 = _631;
    if (!_605)
    {
        _615 = _585;
    }
    float _635 = _615;
    bool _637 = !_605;
    float _639 = _635;
    if (!_637)
    {
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _645 = _591 + _643;
        float _647 = rsqrt(_583);
        float _649 = _645 * _641;
        float _651 = _585 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _653 = _649 * 0.15915493667125701904296875;
        float _655 = _653 * 6.283185482025146484375;
        float _657 = cos(_655);
        float _659 = _653 * 6.283185482025146484375;
        float _661 = sin(_659);
        float _663 = _657 + (-1.0);
        float _665 = fma(_661, _651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _667 = _663 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = _647 * _665;
        float _671 = fma(_585, _657, _667);
        float _673 = fma(_575, _669, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _675 = fma(_567, _669, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _629 = _673;
        _633 = _675;
        _639 = _671;
    }
    float _677 = _629;
    float _679 = _633;
    float _681 = _639;
    float _683 = _681;
    float _685 = _677;
    float _687 = _679;
    if (_343)
    {
        _617 = 1.0;
    }
    float _689 = _617;
    float _691 = _689;
    if (!_333)
    {
        float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _695 = _561 + _693;
        float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _699 = _555 + _697;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _703 = -_555;
        float _705 = _703 + _677;
        float _707 = _695 * _695;
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _711 = _545 + _709;
        float _713 = -_545;
        float _715 = _713 + _679;
        float _717 = fma(_699, _699, _707);
        float _719 = fma(_711, _711, _717);
        float _721 = sqrt(_719);
        float _723 = precise::min(_721, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _725 = _723 * _701;
        float _727 = -_561;
        float _729 = _727 + _681;
        float _731 = fma(_705, _725, _555);
        float _733 = fma(_729, _725, _561);
        float _735 = fma(_715, _725, _545);
        _683 = _733;
        _685 = _731;
        _687 = _735;
        _619 = _715;
        _621 = _729;
    }
    float _737 = _683;
    float _739 = _685;
    float _741 = _687;
    float _743 = _619;
    float _745 = _621;
    float _747 = _743;
    if (!_343)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _751 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[30].w, _749);
        float _753 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _757 = 1.0 / _751;
        float _759 = 1.0 / _755;
        float _761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _763 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _765 = fma(_757, _761, _763);
        float _767 = _765 * _759;
        float _769 = precise::clamp(_767, 0.0, 1.0);
        _623 = _757;
        _691 = _769;
    }
    float _771 = _623;
    float _773 = _691;
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _777 = _737 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _781 = _739 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _785 = _741 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_781, _781, _787);
    float _791 = fma(_785, _785, _789);
    float _793 = rsqrt(_791);
    float _795 = _793 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _797 = _781 * _795;
    float _799 = _785 * _795;
    float _801 = _797 * _797;
    float _803 = _799 * _799;
    float _805 = _801 + _803;
    float _807 = sqrt(_805);
    bool _809 = _807 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = _807 + _811;
    float _815 = _771;
    float _817 = _813;
    float _819 = _777;
    float _821 = _797;
    if (_809)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _815 = _823;
    }
    float _825 = _815;
    float _827 = _825;
    if (_809)
    {
        float _829 = _813 * _825;
        _817 = _829;
    }
    float _831 = _817;
    if (_809)
    {
        float _833 = rsqrt(_805);
        _827 = _833;
    }
    float _835 = _827;
    float _837 = _835;
    if (_809)
    {
        float _839 = _831 * 0.15915493667125701904296875;
        _747 = _839;
    }
    float _841 = _747;
    float _843 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _845 = _785;
    if (_809)
    {
        float _847 = _841 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = precise::max(0.0, _843);
    float _855 = _745;
    float _857 = _853;
    if (_809)
    {
        float _859 = _841 * 6.283185482025146484375;
        float _861 = cos(_859);
        _855 = _861;
    }
    float _863 = _855;
    float _865 = -_795;
    float _867 = -_853;
    float _869 = fma(_777, _865, _867);
    if (_809)
    {
        float _871 = _869 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _819 = _871;
    }
    float _873 = _819;
    float _875 = sqrt(_791);
    float _877 = _851;
    float _879 = _873;
    if (_809)
    {
        float _881 = fma(_851, _873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _877 = _881;
    }
    float _883 = _877;
    float _885 = _883;
    if (!_809)
    {
        _879 = _869;
    }
    float _887 = _879;
    float _889 = _887;
    if (_809)
    {
        float _891 = _835 * _883;
        _625 = _891;
    }
    float _893 = _625;
    if (!_809)
    {
        _885 = _801;
    }
    float _895 = _885;
    float _897 = _895;
    float _899 = _863;
    if (_809)
    {
        float _901 = _863 + (-1.0);
        _857 = _901;
    }
    float _903 = _857;
    float _905 = _903;
    if (_809)
    {
        float _907 = _797 * _893;
        _821 = _907;
    }
    float _909 = _821;
    float _911 = _737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_809)
    {
        float _913 = _903 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _913;
    }
    float _915 = _837;
    if (!_809)
    {
        _905 = _799;
    }
    float _917 = _905;
    float _919 = _917;
    if (_809)
    {
        float _921 = _799 * _893;
        _919 = _921;
    }
    float _923 = _919;
    if (_809)
    {
        float _925 = _909 * _909;
        _897 = _925;
    }
    float _927 = _897;
    if (_809)
    {
        float _929 = fma(_869, _863, _915);
        _889 = _929;
    }
    float _931 = _889;
    if (!_809)
    {
        _899 = _803;
    }
    float _933 = _899;
    float _935 = _933;
    if (_809)
    {
        float _937 = _923 * _923;
        _935 = _937;
    }
    float _939 = _935;
    float _941 = fma(_931, _931, _927);
    float _943 = _737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _945 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _947 = _941 + _939;
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _951 = fma(_875, (*spvDescriptorSet0.vp_c15)._m0[23].w, _949);
    float _953 = precise::clamp(_951, 0.0, 1.0);
    float _955 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[2].x, _943);
    float _957 = _737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _959 = rsqrt(_947);
    float _961 = -_953;
    float _963 = _961 + 1.0;
    float _965 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[2].z, _955);
    float _967 = _737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[1].x, _957);
    float _971 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[3].z, _945);
    float _973 = _965 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _975 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[0].x, _967);
    float _977 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[1].z, _969);
    float _979 = abs(_963);
    float _981 = log2(_979);
    float _983 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _985 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[0].z, _975);
    float _987 = _977 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _989 = _973 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _991 = _985 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _993 = _959 * _909;
    float _995 = _987 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _997 = _959 * _931;
    float _999 = _959 * _923;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _995);
    float _1005 = -_989;
    float _1007 = fma(_1005, _983, 1.0);
    float _1009 = _971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1011 = -_1001;
    float _1013 = fma(_997, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1011);
    float _1015 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1003);
    float _1017 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1019 = log2(_1007);
    float _1021 = -_999;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1013);
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1015);
    float _1027 = _987 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1029 = fma(_1023, -0.5, 0.5);
    float _1031 = fma(_1023, 0.5, 0.5);
    float _1033 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1027);
    float _1035 = 1.0 / _1025;
    float _1037 = _987 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1039 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1033);
    float _1041 = fma(_1031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1043 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1037);
    float _1045 = _997 + 1.0;
    float _1047 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1039);
    float _1049 = exp2(_1017);
    float _1051 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1043);
    float _1053 = fma(_1031, _1041, -0.212114393711090087890625);
    float _1055 = _1019 * 0.693147182464599609375;
    float _1057 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1051);
    float _1059 = fma(_1031, _1053, 1.570728778839111328125);
    float _1061 = sqrt(_1029);
    float _1063 = _1047 * _1035;
    float _1065 = _1057 * _1035;
    float _1067 = fma(_1063, 0.5, 0.5);
    float _1069 = fma(_1065, -0.5, 0.5);
    float _1071 = -_997;
    float _1073 = fma(_1049, _1045, _1071);
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = _1061 * 0.636619746685028076171875;
    float3 _2849 = float3(_1067, _1069, _1075);
    float _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2849, float3(0.0), isnan(_2849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2849, float3(0.0), isnan(_2849)), level(0.0)).x;
    float _1083 = -_1059;
    float _1085 = fma(_1079, _1083, 1.0);
    float3 _2865 = float3(_1067, _1069, _1075);
    float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2865, float3(0.0), isnan(_2865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2865, float3(0.0), isnan(_2865)), level(0.0)).xyzw;
    float _1090 = _1088.x;
    float _1092 = _1088.y;
    float _1094 = _1088.z;
    float _1096 = _1088.w;
    float2 _2882 = float2(_1085, _1077);
    float3 _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2882, float2(0.0), isnan(_2882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2882, float2(0.0), isnan(_2882)), level(0.0)).xyz;
    float _1102 = _1100.x;
    float _1104 = _1100.y;
    float _1106 = _1100.z;
    float _1108 = in.m_49.y;
    float _1110 = _987 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1112 = _143 > 0.5;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1110);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1124 = _1122 != 0;
    float _1126 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1128 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1134 = -_241;
    int _1136 = _1112 ? as_type<int>(_1134) : as_type<int>(_241);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1142 = !_1118;
    float _1144 = _1142 ? _241 : as_type<float>(_1136);
    float _1146 = exp2(_1128);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1150 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1152 = _1108 > 0.5;
    float _1154 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = -_169;
    int _1160 = _1152 ? as_type<int>(_1158) : as_type<int>(_169);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1168 = !_1124;
    float _1170 = _1168 ? _169 : as_type<float>(_1160);
    out.m_62.x = _1150;
    out.m_62.y = _1154;
    out.m_62.z = _1156;
    out.m_62.w = _1148;
    float _1172 = -_1146;
    float _1174 = _1172 + 1.0;
    float _1176 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1120);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1180 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1144 + 0.5;
    float _1188 = -_1170;
    float _1190 = _1188 + 0.5;
    float _1192 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1176);
    float _1194 = _249 * _1126;
    bool _1196 = _773 > 0.0;
    bool _1198 = isnan(_773);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    out.m_64.x = _1180;
    out.m_64.y = _1182;
    out.m_64.z = _1184;
    out.m_64.w = _1178;
    float _1206 = _1174 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1208 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1210 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1212 = _1194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1214 = -_1206;
    float _1216 = _1214 + 1.0;
    out.gl_Position.x = _1047;
    out.gl_Position.y = _1057;
    out.gl_Position.z = _1192;
    out.gl_Position.w = _1025;
    out.m_45.x = _1212;
    float _1218 = _1192 + _1025;
    float _1220 = _1208 * _1114;
    float _1222 = _1210 * _1130;
    float _1224 = _1218 * 0.5;
    out.m_66.x = _1220;
    out.m_66.y = _1222;
    out.m_68.z = _1224;
    out.m_68.w = _1025;
    float _1226 = _1206 * _1081;
    float _1228 = _1096 * _1226;
    float _1230 = _1096 * _1216;
    float _1232 = _1106 * _1226;
    float _1234 = fma(_1102, _1228, _1090);
    float _1236 = fma(_1104, _1228, _1092);
    float _1238 = fma(_1096, _1232, _1094);
    out.m_70.x = _1234;
    out.m_70.y = _1236;
    out.m_70.z = _1238;
    out.m_70.w = _1230;
    if (_1204)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1240;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

