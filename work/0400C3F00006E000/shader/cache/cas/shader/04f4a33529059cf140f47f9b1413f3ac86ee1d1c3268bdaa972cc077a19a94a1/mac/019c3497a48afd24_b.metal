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
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
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
    bool _369 = false;
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
        float _1315 = as_type<float>(_105);
        out.gl_Position.z = _1315;
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
        float _1384 = as_type<float>(_141);
        out.gl_Position.z = _1384;
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
    int _197 = abs(_191);
    float _199 = -_165;
    float _201 = _153 + _199;
    int _203 = abs(_195);
    float _205 = -_201;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = float(_197);
    float _213 = fma(_183, 0.5, 0.5);
    bool _215 = !_179;
    int _217 = _215 ? 0 : 1;
    bool _219 = _201 < 0.5;
    float _221 = float(_219);
    float _223 = abs(_207);
    float _225 = _211 * _223;
    int _227 = abs(_217);
    float _229 = -_213;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_203);
    float _235 = -_221;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_227);
    float _241 = fma(_233, _231, _225);
    bool _243 = !_157;
    float _245 = _243 ? (-0.5) : 0.5;
    float _247 = abs(_237);
    float _249 = fma(_239, _247, _241);
    bool _251 = !_209;
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
    bool _283 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_277);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -_293;
    float _301 = _299 + 1.0;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _297;
    float _323 = _313 * _301;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _281 * _321;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    bool _351 = !_319;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _355 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_89);
        float _373 = 1.0 / _371;
        float _375 = _123 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = in.m_54.x;
    float _381 = in.m_54.y;
    float _383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _385 = in.m_42.x;
    float _387 = in.m_42.y;
    float _389 = in.m_42.z;
    float _391 = in.m_56.x;
    float _393 = in.m_56.y;
    float _395 = in.m_56.z;
    float _397 = in.m_56.w;
    float _399 = in.m_58.x;
    float _401 = in.m_58.y;
    float _403 = in.m_58.z;
    float _405 = in.m_58.w;
    float _407 = _349 * _381;
    float _409 = _347 * _379;
    float _411 = _249 * _407;
    float _413 = _249 * _409;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _417 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = _387 * _393;
    float _423 = _417 * _383;
    float _425 = _419 * _415;
    float _427 = fma(_385, _391, _421);
    float _429 = _387 * _401;
    float _431 = _423 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _433 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _435 = _423 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _437 = fma(_385, _399, _429);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _431);
    float _441 = fma(_389, _395, _427);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _435);
    float _445 = fma(_389, _403, _437);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].z, _439);
    float _449 = _441 + _397;
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].z, _443);
    float _453 = _445 + _405;
    float _455 = _447 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _457 = in.m_60.x;
    float _459 = in.m_60.y;
    float _461 = in.m_60.z;
    float _463 = in.m_60.w;
    float _465 = _451 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _423 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _469 = _449 + _455;
    float _471 = _453 + _465;
    float _473 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _467);
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _477 = _469 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].z, _473);
    float _485 = _477 * _477;
    float _487 = _483 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _489 = fma(_481, _481, _485);
    float _491 = sqrt(_489);
    float _493 = _387 * _459;
    float _495 = fma(_385, _457, _493);
    float _497 = fma(_389, _461, _495);
    bool _499 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _501 = _497 + _463;
    float _503 = _501 + _487;
    float _505 = _467;
    float _507 = _433;
    float _509 = _487;
    float _511 = _389;
    if (!_499)
    {
        _505 = _471;
    }
    float _513 = _505;
    float _515 = _513;
    if (!_499)
    {
        _507 = _469;
    }
    float _517 = _507;
    float _519 = _517;
    if (!_499)
    {
        _509 = _503;
    }
    float _521 = _509;
    bool _523 = !_499;
    float _525 = _521;
    if (!_523)
    {
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _531 = _491 + _529;
        float _533 = rsqrt(_489);
        float _535 = _531 * _527;
        float _537 = _503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _539 = _535 * 0.15915493667125701904296875;
        float _541 = _539 * 6.283185482025146484375;
        float _543 = cos(_541);
        float _545 = _539 * 6.283185482025146484375;
        float _547 = sin(_545);
        float _549 = _543 + (-1.0);
        float _551 = _549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = fma(_547, _537, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = fma(_503, _543, _551);
        float _557 = _533 * _553;
        float _559 = fma(_481, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _561 = fma(_477, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _525 = _555;
        _515 = _559;
        _519 = _561;
    }
    float _563 = _525;
    float _565 = _515;
    float _567 = _519;
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _571 = _563 + _569;
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _575 = _565 + _573;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _579 = _567 + _577;
    float _581 = _571 * _571;
    float _583 = fma(_575, _575, _581);
    float _585 = fma(_579, _579, _583);
    float _587 = rsqrt(_585);
    float _589 = _587 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _591 = _575 * _589;
    float _593 = _579 * _589;
    float _595 = _591 * _591;
    float _597 = _593 * _593;
    float _599 = _595 + _597;
    float _601 = sqrt(_599);
    bool _603 = _601 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _607 = _601 + _605;
    float _609 = _387;
    float _611 = _607;
    float _613 = _571;
    float _615 = _589;
    float _617 = _591;
    if (_603)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _609 = _619;
    }
    float _621 = _609;
    float _623 = _621;
    if (_603)
    {
        float _625 = _607 * _621;
        _611 = _625;
    }
    float _627 = _611;
    if (_603)
    {
        float _629 = rsqrt(_599);
        _623 = _629;
    }
    float _631 = _623;
    float _633 = _631;
    if (_603)
    {
        float _635 = _627 * 0.15915493667125701904296875;
        _511 = _635;
    }
    float _637 = _511;
    float _639 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _641 = _579;
    if (_603)
    {
        float _643 = _637 * 6.283185482025146484375;
        float _645 = sin(_643);
        _641 = _645;
    }
    float _647 = _641;
    float _649 = precise::max(0.0, _639);
    float _651 = _503;
    float _653 = _649;
    if (_603)
    {
        float _655 = _637 * 6.283185482025146484375;
        float _657 = cos(_655);
        _651 = _657;
    }
    float _659 = _651;
    float _661 = -_589;
    float _663 = -_649;
    float _665 = fma(_571, _661, _663);
    if (_603)
    {
        float _667 = _665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _613 = _667;
    }
    float _669 = _613;
    float _671 = sqrt(_585);
    float _673 = _647;
    float _675 = _669;
    if (_603)
    {
        float _677 = fma(_647, _669, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _673 = _677;
    }
    float _679 = _673;
    float _681 = _679;
    if (!_603)
    {
        _675 = _595;
    }
    float _683 = _675;
    float _685 = _683;
    if (_603)
    {
        float _687 = _631 * _679;
        _615 = _687;
    }
    float _689 = _615;
    if (!_603)
    {
        _681 = _665;
    }
    float _691 = _681;
    float _693 = _691;
    float _695 = _659;
    if (_603)
    {
        float _697 = _659 + (-1.0);
        _653 = _697;
    }
    float _699 = _653;
    float _701 = _699;
    if (_603)
    {
        float _703 = _591 * _689;
        _617 = _703;
    }
    float _705 = _617;
    if (_603)
    {
        float _707 = _699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _633 = _707;
    }
    float _709 = _633;
    if (!_603)
    {
        _701 = _593;
    }
    float _711 = _701;
    float _713 = _711;
    if (_603)
    {
        float _715 = _593 * _689;
        _713 = _715;
    }
    float _717 = _713;
    if (_603)
    {
        float _719 = _705 * _705;
        _685 = _719;
    }
    float _721 = _685;
    if (_603)
    {
        float _723 = fma(_665, _659, _709);
        _693 = _723;
    }
    float _725 = _693;
    if (!_603)
    {
        _695 = _597;
    }
    float _727 = _695;
    float _729 = _727;
    if (_603)
    {
        float _731 = _717 * _717;
        _729 = _731;
    }
    float _733 = _729;
    float _735 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _737 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[23].w, _735);
    float _739 = precise::clamp(_737, 0.0, 1.0);
    float _741 = fma(_725, _725, _721);
    float _743 = _563 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _745 = -_739;
    float _747 = _745 + 1.0;
    float _749 = _741 + _733;
    float _751 = _563 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _753 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[1].x, _743);
    float _755 = abs(_747);
    float _757 = log2(_755);
    float _759 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _761 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[2].x, _751);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[1].z, _753);
    float _765 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[2].z, _761);
    float _767 = _563 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _769 = rsqrt(_749);
    float _771 = _563 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _773 = _763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _775 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[0].x, _767);
    float _777 = _765 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _779 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[3].x, _771);
    float _781 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[0].z, _775);
    float _783 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[3].z, _779);
    float _785 = _773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _787 = _781 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _789 = _777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _791 = _783 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _793 = _757 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _785);
    float _797 = _769 * _705;
    float _799 = _769 * _725;
    float _801 = _769 * _717;
    float _803 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _795);
    float _805 = _797 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _807 = -_789;
    float _809 = fma(_807, _759, 1.0);
    float _811 = exp2(_793);
    float _813 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _803);
    float _815 = -_805;
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c15)._m0[21].y, _815);
    float _819 = _773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _821 = -_801;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c15)._m0[21].z, _817);
    float _825 = _773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _827 = log2(_809);
    float _829 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _819);
    float _831 = fma(_823, -0.5, 0.5);
    float _833 = fma(_823, 0.5, 0.5);
    float _835 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _825);
    float _837 = _799 + 1.0;
    float _839 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _829);
    float _841 = fma(_833, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _843 = 1.0 / _813;
    float _845 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _835);
    float _847 = -_799;
    float _849 = fma(_811, _837, _847);
    float _851 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _839);
    float _853 = fma(_833, _841, -0.212114393711090087890625);
    float _855 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _845);
    float _857 = sqrt(_831);
    float _859 = _827 * 0.693147182464599609375;
    float _861 = fma(_833, _853, 1.570728778839111328125);
    float _863 = _859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _865 = _851 * _843;
    float _867 = _855 * _843;
    float _869 = fma(_865, 0.5, 0.5);
    float _871 = fma(_867, -0.5, 0.5);
    float _873 = _857 * 0.636619746685028076171875;
    float3 _2544 = float3(_869, _871, _863);
    float _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2544, float3(0.0), isnan(_2544)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2544, float3(0.0), isnan(_2544)), level(0.0)).x;
    float _877 = -_861;
    float _879 = fma(_873, _877, 1.0);
    float _881 = fma(_849, 0.5, 0.5);
    float3 _2562 = float3(_869, _871, _863);
    float4 _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2562, float3(0.0), isnan(_2562)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2562, float3(0.0), isnan(_2562)), level(0.0)).xyzw;
    float _886 = _884.x;
    float _888 = _884.y;
    float _890 = _884.z;
    float _892 = _884.w;
    float2 _2579 = float2(_879, _881);
    float3 _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2579, float2(0.0), isnan(_2579)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2579, float2(0.0), isnan(_2579)), level(0.0)).xyz;
    float _898 = _896.x;
    float _900 = _896.y;
    float _902 = _896.z;
    float _904 = in.m_49.y;
    float _906 = _757 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _908 = _143 > 0.5;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _918 = exp2(_906);
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _922 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _924 = isnan(0.5);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _930 = _926 || _928;
    float _932 = 1.0 / _912;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _936 = _934 != 0;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _940 = -_245;
    int _942 = _908 ? as_type<int>(_940) : as_type<int>(_245);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _948 = _946 != 0;
    float _950 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _952 = _904 > 0.5;
    float _954 = 1.0 / _916;
    float _956 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _960 = _377 + _958;
    bool _962 = !_936;
    float _964 = _962 ? _245 : as_type<float>(_942);
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = -_169;
    int _970 = _952 ? as_type<int>(_968) : as_type<int>(_169);
    float _972 = -_918;
    float _974 = _972 + 1.0;
    float _976 = _960 * _932;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _980 = _377 + _978;
    float _982 = _501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _984 = _501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_62.x = _956;
    out.m_62.y = _950;
    out.m_62.z = _966;
    float _986 = _964 + 0.5;
    bool _988 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _990 = isnan(_377);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = _980 * _954;
    bool _1002 = !_948;
    float _1004 = _1002 ? _169 : as_type<float>(_970);
    float _1006 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _982);
    float _1008 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _984);
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1012 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1014 = isnan(_377);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1008);
    float _1026 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1006);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1032;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1038 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1040 = fma(_1030, _976, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1042 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1044 = isnan(_377);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1054;
    float _1058 = 1.0 / _1038;
    float _1060 = _1036 + _1038;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1066 = -_1052;
    float _1068 = _1066 + 1.0;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1074 = fma(_1056, _976, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1076 = fma(_1034, _976, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1078 = _998 * _1068;
    float _1080 = -_998;
    float _1082 = _1080 + 1.0;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1090 = _976;
    if (!_930)
    {
        _1088 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1092 = _1088;
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = _1022 * _1082;
    float _1098 = -_1022;
    float _1100 = _1098 + 1.0;
    float _1102 = -_1004;
    float _1104 = _1102 + 0.5;
    float _1106 = fma(_1064, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1108 = _1060 * _1058;
    float _1110 = _1108 * 0.5;
    float _1112 = _1058;
    float _1114 = _1110;
    if (!_930)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1116 = _1112;
    float _1118 = _1040 * _1096;
    float _1120 = _1074 * _1096;
    float _1122 = _1076 * _1096;
    float _1124 = fma(_1086, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1126 = _1116;
    if (!_930)
    {
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1130 = fma(_1110, _1116, _1128);
        _1114 = _1130;
    }
    float _1132 = _1114;
    if (!_930)
    {
        float _1134 = -_1092;
        float _1136 = _1134 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1126 = _1136;
    }
    float _1138 = _1126;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1118);
    float _1142 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1120);
    float _1144 = fma(_1072, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    if (!_930)
    {
        float _1146 = 1.0 / _1138;
        _1090 = _1146;
    }
    float _1148 = _1090;
    float _1150 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1152 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1122);
    float _1154 = fma(_1106, _1078, _1140);
    float _1156 = _773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1158 = _1150 * _1094;
    float _1160 = fma(_1124, _1078, _1142);
    float _1162 = fma(_1144, _1078, _1152);
    float _1164 = _1132;
    float _1166 = _1156;
    float _1168 = _1150;
    if (!_930)
    {
        float _1170 = 1.0 / _1132;
        _1164 = _1170;
    }
    float _1172 = _1164;
    float _1174 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1156);
    float _1176 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1154);
    if (_930)
    {
        _1166 = 1.0;
    }
    float _1178 = _1166;
    float _1180 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1160);
    float _1182 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1162);
    float _1184 = _974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1192 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1196 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1192 * _1010;
    float _1202 = _1178;
    if (!_930)
    {
        float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1206 = -_1092;
        float _1208 = fma(_1172, _1204, _1206);
        _1168 = _1208;
    }
    float _1210 = _1168;
    out.m_64.x = _1194;
    out.m_64.y = _1196;
    out.m_64.z = _1198;
    if (!_930)
    {
        float _1212 = _1210 * _1148;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        _1202 = _1214;
    }
    float _1216 = _1202;
    float _1218 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1174);
    out.m_66.x = _1200;
    out.m_66.y = _1158;
    float _1220 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1222 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1218);
    bool _1224 = _1216 > 0.0;
    bool _1226 = isnan(_1216);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.0);
    bool _1232 = _1228 || _1230;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = _1222 + _813;
    out.gl_Position.x = _851;
    out.gl_Position.y = _855;
    out.gl_Position.z = _1222;
    out.gl_Position.w = _813;
    float _1238 = _1236 * 0.5;
    out.m_45.x = _1234;
    out.m_68.z = _1238;
    out.m_68.w = _813;
    float _1240 = _1184 * _875;
    float _1242 = -_1184;
    float _1244 = _1242 + 1.0;
    float _1246 = _892 * _1240;
    float _1248 = _892 * _1244;
    float _1250 = _902 * _1240;
    float _1252 = fma(_898, _1246, _886);
    float _1254 = fma(_900, _1246, _888);
    float _1256 = fma(_892, _1250, _890);
    out.m_70.x = _1252;
    out.m_70.y = _1254;
    out.m_70.z = _1256;
    out.m_70.w = _1248;
    if (_1232)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1258;
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
    bool _369 = false;
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
        float _1315 = as_type<float>(_105);
        out.gl_Position.z = _1315;
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
        float _1384 = as_type<float>(_141);
        out.gl_Position.z = _1384;
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
    int _197 = abs(_191);
    float _199 = -_165;
    float _201 = _153 + _199;
    int _203 = abs(_195);
    float _205 = -_201;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = float(_197);
    float _213 = fma(_183, 0.5, 0.5);
    bool _215 = !_179;
    int _217 = _215 ? 0 : 1;
    bool _219 = _201 < 0.5;
    float _221 = float(_219);
    float _223 = abs(_207);
    float _225 = _211 * _223;
    int _227 = abs(_217);
    float _229 = -_213;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_203);
    float _235 = -_221;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_227);
    float _241 = fma(_233, _231, _225);
    bool _243 = !_157;
    float _245 = _243 ? (-0.5) : 0.5;
    float _247 = abs(_237);
    float _249 = fma(_239, _247, _241);
    bool _251 = !_209;
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
    bool _283 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_277);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -_293;
    float _301 = _299 + 1.0;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _297;
    float _323 = _313 * _301;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _281 * _321;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    bool _351 = !_319;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _355 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_89);
        float _373 = 1.0 / _371;
        float _375 = _123 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = in.m_54.x;
    float _381 = in.m_54.y;
    float _383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _385 = in.m_42.x;
    float _387 = in.m_42.y;
    float _389 = in.m_42.z;
    float _391 = in.m_56.x;
    float _393 = in.m_56.y;
    float _395 = in.m_56.z;
    float _397 = in.m_56.w;
    float _399 = in.m_58.x;
    float _401 = in.m_58.y;
    float _403 = in.m_58.z;
    float _405 = in.m_58.w;
    float _407 = _349 * _381;
    float _409 = _347 * _379;
    float _411 = _249 * _407;
    float _413 = _249 * _409;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _417 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = _387 * _393;
    float _423 = _417 * _383;
    float _425 = _419 * _415;
    float _427 = fma(_385, _391, _421);
    float _429 = _387 * _401;
    float _431 = _423 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _433 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _435 = _423 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _437 = fma(_385, _399, _429);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _431);
    float _441 = fma(_389, _395, _427);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _435);
    float _445 = fma(_389, _403, _437);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].z, _439);
    float _449 = _441 + _397;
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].z, _443);
    float _453 = _445 + _405;
    float _455 = _447 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _457 = in.m_60.x;
    float _459 = in.m_60.y;
    float _461 = in.m_60.z;
    float _463 = in.m_60.w;
    float _465 = _451 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _423 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _469 = _449 + _455;
    float _471 = _453 + _465;
    float _473 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _467);
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _477 = _469 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].z, _473);
    float _485 = _477 * _477;
    float _487 = _483 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _489 = fma(_481, _481, _485);
    float _491 = sqrt(_489);
    float _493 = _387 * _459;
    float _495 = fma(_385, _457, _493);
    float _497 = fma(_389, _461, _495);
    bool _499 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _501 = _497 + _463;
    float _503 = _501 + _487;
    float _505 = _467;
    float _507 = _433;
    float _509 = _487;
    float _511 = _389;
    if (!_499)
    {
        _505 = _471;
    }
    float _513 = _505;
    float _515 = _513;
    if (!_499)
    {
        _507 = _469;
    }
    float _517 = _507;
    float _519 = _517;
    if (!_499)
    {
        _509 = _503;
    }
    float _521 = _509;
    bool _523 = !_499;
    float _525 = _521;
    if (!_523)
    {
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _531 = _491 + _529;
        float _533 = rsqrt(_489);
        float _535 = _531 * _527;
        float _537 = _503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _539 = _535 * 0.15915493667125701904296875;
        float _541 = _539 * 6.283185482025146484375;
        float _543 = cos(_541);
        float _545 = _539 * 6.283185482025146484375;
        float _547 = sin(_545);
        float _549 = _543 + (-1.0);
        float _551 = _549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = fma(_547, _537, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = fma(_503, _543, _551);
        float _557 = _533 * _553;
        float _559 = fma(_481, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _561 = fma(_477, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _525 = _555;
        _515 = _559;
        _519 = _561;
    }
    float _563 = _525;
    float _565 = _515;
    float _567 = _519;
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _571 = _563 + _569;
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _575 = _565 + _573;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _579 = _567 + _577;
    float _581 = _571 * _571;
    float _583 = fma(_575, _575, _581);
    float _585 = fma(_579, _579, _583);
    float _587 = rsqrt(_585);
    float _589 = _587 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _591 = _575 * _589;
    float _593 = _579 * _589;
    float _595 = _591 * _591;
    float _597 = _593 * _593;
    float _599 = _595 + _597;
    float _601 = sqrt(_599);
    bool _603 = _601 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _607 = _601 + _605;
    float _609 = _387;
    float _611 = _607;
    float _613 = _571;
    float _615 = _589;
    float _617 = _591;
    if (_603)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _609 = _619;
    }
    float _621 = _609;
    float _623 = _621;
    if (_603)
    {
        float _625 = _607 * _621;
        _611 = _625;
    }
    float _627 = _611;
    if (_603)
    {
        float _629 = rsqrt(_599);
        _623 = _629;
    }
    float _631 = _623;
    float _633 = _631;
    if (_603)
    {
        float _635 = _627 * 0.15915493667125701904296875;
        _511 = _635;
    }
    float _637 = _511;
    float _639 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _641 = _579;
    if (_603)
    {
        float _643 = _637 * 6.283185482025146484375;
        float _645 = sin(_643);
        _641 = _645;
    }
    float _647 = _641;
    float _649 = precise::max(0.0, _639);
    float _651 = _503;
    float _653 = _649;
    if (_603)
    {
        float _655 = _637 * 6.283185482025146484375;
        float _657 = cos(_655);
        _651 = _657;
    }
    float _659 = _651;
    float _661 = -_589;
    float _663 = -_649;
    float _665 = fma(_571, _661, _663);
    if (_603)
    {
        float _667 = _665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _613 = _667;
    }
    float _669 = _613;
    float _671 = sqrt(_585);
    float _673 = _647;
    float _675 = _669;
    if (_603)
    {
        float _677 = fma(_647, _669, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _673 = _677;
    }
    float _679 = _673;
    float _681 = _679;
    if (!_603)
    {
        _675 = _595;
    }
    float _683 = _675;
    float _685 = _683;
    if (_603)
    {
        float _687 = _631 * _679;
        _615 = _687;
    }
    float _689 = _615;
    if (!_603)
    {
        _681 = _665;
    }
    float _691 = _681;
    float _693 = _691;
    float _695 = _659;
    if (_603)
    {
        float _697 = _659 + (-1.0);
        _653 = _697;
    }
    float _699 = _653;
    float _701 = _699;
    if (_603)
    {
        float _703 = _591 * _689;
        _617 = _703;
    }
    float _705 = _617;
    if (_603)
    {
        float _707 = _699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _633 = _707;
    }
    float _709 = _633;
    if (!_603)
    {
        _701 = _593;
    }
    float _711 = _701;
    float _713 = _711;
    if (_603)
    {
        float _715 = _593 * _689;
        _713 = _715;
    }
    float _717 = _713;
    if (_603)
    {
        float _719 = _705 * _705;
        _685 = _719;
    }
    float _721 = _685;
    if (_603)
    {
        float _723 = fma(_665, _659, _709);
        _693 = _723;
    }
    float _725 = _693;
    if (!_603)
    {
        _695 = _597;
    }
    float _727 = _695;
    float _729 = _727;
    if (_603)
    {
        float _731 = _717 * _717;
        _729 = _731;
    }
    float _733 = _729;
    float _735 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _737 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[23].w, _735);
    float _739 = precise::clamp(_737, 0.0, 1.0);
    float _741 = fma(_725, _725, _721);
    float _743 = _563 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _745 = -_739;
    float _747 = _745 + 1.0;
    float _749 = _741 + _733;
    float _751 = _563 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _753 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[1].x, _743);
    float _755 = abs(_747);
    float _757 = log2(_755);
    float _759 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _761 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[2].x, _751);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[1].z, _753);
    float _765 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[2].z, _761);
    float _767 = _563 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _769 = rsqrt(_749);
    float _771 = _563 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _773 = _763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _775 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[0].x, _767);
    float _777 = _765 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _779 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[3].x, _771);
    float _781 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[0].z, _775);
    float _783 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[3].z, _779);
    float _785 = _773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _787 = _781 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _789 = _777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _791 = _783 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _793 = _757 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _785);
    float _797 = _769 * _705;
    float _799 = _769 * _725;
    float _801 = _769 * _717;
    float _803 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _795);
    float _805 = _797 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _807 = -_789;
    float _809 = fma(_807, _759, 1.0);
    float _811 = exp2(_793);
    float _813 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _803);
    float _815 = -_805;
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c15)._m0[21].y, _815);
    float _819 = _773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _821 = -_801;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c15)._m0[21].z, _817);
    float _825 = _773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _827 = log2(_809);
    float _829 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _819);
    float _831 = fma(_823, -0.5, 0.5);
    float _833 = fma(_823, 0.5, 0.5);
    float _835 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _825);
    float _837 = _799 + 1.0;
    float _839 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _829);
    float _841 = fma(_833, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _843 = 1.0 / _813;
    float _845 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _835);
    float _847 = -_799;
    float _849 = fma(_811, _837, _847);
    float _851 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _839);
    float _853 = fma(_833, _841, -0.212114393711090087890625);
    float _855 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _845);
    float _857 = sqrt(_831);
    float _859 = _827 * 0.693147182464599609375;
    float _861 = fma(_833, _853, 1.570728778839111328125);
    float _863 = _859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _865 = _851 * _843;
    float _867 = _855 * _843;
    float _869 = fma(_865, 0.5, 0.5);
    float _871 = fma(_867, -0.5, 0.5);
    float _873 = _857 * 0.636619746685028076171875;
    float3 _2544 = float3(_869, _871, _863);
    float _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2544, float3(0.0), isnan(_2544)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2544, float3(0.0), isnan(_2544)), level(0.0)).x;
    float _877 = -_861;
    float _879 = fma(_873, _877, 1.0);
    float _881 = fma(_849, 0.5, 0.5);
    float3 _2562 = float3(_869, _871, _863);
    float4 _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2562, float3(0.0), isnan(_2562)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2562, float3(0.0), isnan(_2562)), level(0.0)).xyzw;
    float _886 = _884.x;
    float _888 = _884.y;
    float _890 = _884.z;
    float _892 = _884.w;
    float2 _2579 = float2(_879, _881);
    float3 _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2579, float2(0.0), isnan(_2579)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2579, float2(0.0), isnan(_2579)), level(0.0)).xyz;
    float _898 = _896.x;
    float _900 = _896.y;
    float _902 = _896.z;
    float _904 = in.m_49.y;
    float _906 = _757 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _908 = _143 > 0.5;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _918 = exp2(_906);
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _922 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _924 = isnan(0.5);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _930 = _926 || _928;
    float _932 = 1.0 / _912;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _936 = _934 != 0;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _940 = -_245;
    int _942 = _908 ? as_type<int>(_940) : as_type<int>(_245);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _948 = _946 != 0;
    float _950 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _952 = _904 > 0.5;
    float _954 = 1.0 / _916;
    float _956 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _960 = _377 + _958;
    bool _962 = !_936;
    float _964 = _962 ? _245 : as_type<float>(_942);
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = -_169;
    int _970 = _952 ? as_type<int>(_968) : as_type<int>(_169);
    float _972 = -_918;
    float _974 = _972 + 1.0;
    float _976 = _960 * _932;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _980 = _377 + _978;
    float _982 = _501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _984 = _501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_62.x = _956;
    out.m_62.y = _950;
    out.m_62.z = _966;
    float _986 = _964 + 0.5;
    bool _988 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _990 = isnan(_377);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = _980 * _954;
    bool _1002 = !_948;
    float _1004 = _1002 ? _169 : as_type<float>(_970);
    float _1006 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _982);
    float _1008 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _984);
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1012 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1014 = isnan(_377);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1008);
    float _1026 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1006);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1032;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1038 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1040 = fma(_1030, _976, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1042 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1044 = isnan(_377);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1054;
    float _1058 = 1.0 / _1038;
    float _1060 = _1036 + _1038;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1066 = -_1052;
    float _1068 = _1066 + 1.0;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1074 = fma(_1056, _976, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1076 = fma(_1034, _976, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1078 = _998 * _1068;
    float _1080 = -_998;
    float _1082 = _1080 + 1.0;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1090 = _976;
    if (!_930)
    {
        _1088 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1092 = _1088;
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = _1022 * _1082;
    float _1098 = -_1022;
    float _1100 = _1098 + 1.0;
    float _1102 = -_1004;
    float _1104 = _1102 + 0.5;
    float _1106 = fma(_1064, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1108 = _1060 * _1058;
    float _1110 = _1108 * 0.5;
    float _1112 = _1058;
    float _1114 = _1110;
    if (!_930)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1116 = _1112;
    float _1118 = _1040 * _1096;
    float _1120 = _1074 * _1096;
    float _1122 = _1076 * _1096;
    float _1124 = fma(_1086, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1126 = _1116;
    if (!_930)
    {
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1130 = fma(_1110, _1116, _1128);
        _1114 = _1130;
    }
    float _1132 = _1114;
    if (!_930)
    {
        float _1134 = -_1092;
        float _1136 = _1134 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1126 = _1136;
    }
    float _1138 = _1126;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1118);
    float _1142 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1120);
    float _1144 = fma(_1072, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    if (!_930)
    {
        float _1146 = 1.0 / _1138;
        _1090 = _1146;
    }
    float _1148 = _1090;
    float _1150 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1152 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1122);
    float _1154 = fma(_1106, _1078, _1140);
    float _1156 = _773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1158 = _1150 * _1094;
    float _1160 = fma(_1124, _1078, _1142);
    float _1162 = fma(_1144, _1078, _1152);
    float _1164 = _1132;
    float _1166 = _1156;
    float _1168 = _1150;
    if (!_930)
    {
        float _1170 = 1.0 / _1132;
        _1164 = _1170;
    }
    float _1172 = _1164;
    float _1174 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1156);
    float _1176 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1154);
    if (_930)
    {
        _1166 = 1.0;
    }
    float _1178 = _1166;
    float _1180 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1160);
    float _1182 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1162);
    float _1184 = _974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1192 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1196 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1192 * _1010;
    float _1202 = _1178;
    if (!_930)
    {
        float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1206 = -_1092;
        float _1208 = fma(_1172, _1204, _1206);
        _1168 = _1208;
    }
    float _1210 = _1168;
    out.m_64.x = _1194;
    out.m_64.y = _1196;
    out.m_64.z = _1198;
    if (!_930)
    {
        float _1212 = _1210 * _1148;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        _1202 = _1214;
    }
    float _1216 = _1202;
    float _1218 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1174);
    out.m_66.x = _1200;
    out.m_66.y = _1158;
    float _1220 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1222 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1218);
    bool _1224 = _1216 > 0.0;
    bool _1226 = isnan(_1216);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.0);
    bool _1232 = _1228 || _1230;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = _1222 + _813;
    out.gl_Position.x = _851;
    out.gl_Position.y = _855;
    out.gl_Position.z = _1222;
    out.gl_Position.w = _813;
    float _1238 = _1236 * 0.5;
    out.m_45.x = _1234;
    out.m_68.z = _1238;
    out.m_68.w = _813;
    float _1240 = _1184 * _875;
    float _1242 = -_1184;
    float _1244 = _1242 + 1.0;
    float _1246 = _892 * _1240;
    float _1248 = _892 * _1244;
    float _1250 = _902 * _1240;
    float _1252 = fma(_898, _1246, _886);
    float _1254 = fma(_900, _1246, _888);
    float _1256 = fma(_892, _1250, _890);
    out.m_70.x = _1252;
    out.m_70.y = _1254;
    out.m_70.z = _1256;
    out.m_70.w = _1248;
    if (_1232)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1258;
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
    bool _369 = false;
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
        float _1315 = as_type<float>(_105);
        out.gl_Position.z = _1315;
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
        float _1384 = as_type<float>(_141);
        out.gl_Position.z = _1384;
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
    int _197 = abs(_191);
    float _199 = -_165;
    float _201 = _153 + _199;
    int _203 = abs(_195);
    float _205 = -_201;
    float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = float(_197);
    float _213 = fma(_183, 0.5, 0.5);
    bool _215 = !_179;
    int _217 = _215 ? 0 : 1;
    bool _219 = _201 < 0.5;
    float _221 = float(_219);
    float _223 = abs(_207);
    float _225 = _211 * _223;
    int _227 = abs(_217);
    float _229 = -_213;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_203);
    float _235 = -_221;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_227);
    float _241 = fma(_233, _231, _225);
    bool _243 = !_157;
    float _245 = _243 ? (-0.5) : 0.5;
    float _247 = abs(_237);
    float _249 = fma(_239, _247, _241);
    bool _251 = !_209;
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
    bool _283 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_277);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -_293;
    float _301 = _299 + 1.0;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _297;
    float _323 = _313 * _301;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _281 * _321;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    bool _351 = !_319;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _355 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_89);
        float _373 = 1.0 / _371;
        float _375 = _123 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = in.m_54.x;
    float _381 = in.m_54.y;
    float _383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _385 = in.m_42.x;
    float _387 = in.m_42.y;
    float _389 = in.m_42.z;
    float _391 = in.m_56.x;
    float _393 = in.m_56.y;
    float _395 = in.m_56.z;
    float _397 = in.m_56.w;
    float _399 = in.m_58.x;
    float _401 = in.m_58.y;
    float _403 = in.m_58.z;
    float _405 = in.m_58.w;
    float _407 = _349 * _381;
    float _409 = _347 * _379;
    float _411 = _249 * _407;
    float _413 = _249 * _409;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _417 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = _387 * _393;
    float _423 = _417 * _383;
    float _425 = _419 * _415;
    float _427 = fma(_385, _391, _421);
    float _429 = _387 * _401;
    float _431 = _423 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _433 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _435 = _423 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _437 = fma(_385, _399, _429);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _431);
    float _441 = fma(_389, _395, _427);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _435);
    float _445 = fma(_389, _403, _437);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].z, _439);
    float _449 = _441 + _397;
    float _451 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].z, _443);
    float _453 = _445 + _405;
    float _455 = _447 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _457 = in.m_60.x;
    float _459 = in.m_60.y;
    float _461 = in.m_60.z;
    float _463 = in.m_60.w;
    float _465 = _451 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _423 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _469 = _449 + _455;
    float _471 = _453 + _465;
    float _473 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _467);
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _477 = _469 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].z, _473);
    float _485 = _477 * _477;
    float _487 = _483 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _489 = fma(_481, _481, _485);
    float _491 = sqrt(_489);
    float _493 = _387 * _459;
    float _495 = fma(_385, _457, _493);
    float _497 = fma(_389, _461, _495);
    bool _499 = _491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _501 = _497 + _463;
    float _503 = _501 + _487;
    float _505 = _467;
    float _507 = _433;
    float _509 = _487;
    float _511 = _389;
    if (!_499)
    {
        _505 = _471;
    }
    float _513 = _505;
    float _515 = _513;
    if (!_499)
    {
        _507 = _469;
    }
    float _517 = _507;
    float _519 = _517;
    if (!_499)
    {
        _509 = _503;
    }
    float _521 = _509;
    bool _523 = !_499;
    float _525 = _521;
    if (!_523)
    {
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _531 = _491 + _529;
        float _533 = rsqrt(_489);
        float _535 = _531 * _527;
        float _537 = _503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _539 = _535 * 0.15915493667125701904296875;
        float _541 = _539 * 6.283185482025146484375;
        float _543 = cos(_541);
        float _545 = _539 * 6.283185482025146484375;
        float _547 = sin(_545);
        float _549 = _543 + (-1.0);
        float _551 = _549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = fma(_547, _537, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _555 = fma(_503, _543, _551);
        float _557 = _533 * _553;
        float _559 = fma(_481, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _561 = fma(_477, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _525 = _555;
        _515 = _559;
        _519 = _561;
    }
    float _563 = _525;
    float _565 = _515;
    float _567 = _519;
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _571 = _563 + _569;
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _575 = _565 + _573;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _579 = _567 + _577;
    float _581 = _571 * _571;
    float _583 = fma(_575, _575, _581);
    float _585 = fma(_579, _579, _583);
    float _587 = rsqrt(_585);
    float _589 = _587 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _591 = _575 * _589;
    float _593 = _579 * _589;
    float _595 = _591 * _591;
    float _597 = _593 * _593;
    float _599 = _595 + _597;
    float _601 = sqrt(_599);
    bool _603 = _601 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _607 = _601 + _605;
    float _609 = _387;
    float _611 = _607;
    float _613 = _571;
    float _615 = _589;
    float _617 = _591;
    if (_603)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _609 = _619;
    }
    float _621 = _609;
    float _623 = _621;
    if (_603)
    {
        float _625 = _607 * _621;
        _611 = _625;
    }
    float _627 = _611;
    if (_603)
    {
        float _629 = rsqrt(_599);
        _623 = _629;
    }
    float _631 = _623;
    float _633 = _631;
    if (_603)
    {
        float _635 = _627 * 0.15915493667125701904296875;
        _511 = _635;
    }
    float _637 = _511;
    float _639 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _641 = _579;
    if (_603)
    {
        float _643 = _637 * 6.283185482025146484375;
        float _645 = sin(_643);
        _641 = _645;
    }
    float _647 = _641;
    float _649 = precise::max(0.0, _639);
    float _651 = _503;
    float _653 = _649;
    if (_603)
    {
        float _655 = _637 * 6.283185482025146484375;
        float _657 = cos(_655);
        _651 = _657;
    }
    float _659 = _651;
    float _661 = -_589;
    float _663 = -_649;
    float _665 = fma(_571, _661, _663);
    if (_603)
    {
        float _667 = _665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _613 = _667;
    }
    float _669 = _613;
    float _671 = sqrt(_585);
    float _673 = _647;
    float _675 = _669;
    if (_603)
    {
        float _677 = fma(_647, _669, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _673 = _677;
    }
    float _679 = _673;
    float _681 = _679;
    if (!_603)
    {
        _675 = _595;
    }
    float _683 = _675;
    float _685 = _683;
    if (_603)
    {
        float _687 = _631 * _679;
        _615 = _687;
    }
    float _689 = _615;
    if (!_603)
    {
        _681 = _665;
    }
    float _691 = _681;
    float _693 = _691;
    float _695 = _659;
    if (_603)
    {
        float _697 = _659 + (-1.0);
        _653 = _697;
    }
    float _699 = _653;
    float _701 = _699;
    if (_603)
    {
        float _703 = _591 * _689;
        _617 = _703;
    }
    float _705 = _617;
    if (_603)
    {
        float _707 = _699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _633 = _707;
    }
    float _709 = _633;
    if (!_603)
    {
        _701 = _593;
    }
    float _711 = _701;
    float _713 = _711;
    if (_603)
    {
        float _715 = _593 * _689;
        _713 = _715;
    }
    float _717 = _713;
    if (_603)
    {
        float _719 = _705 * _705;
        _685 = _719;
    }
    float _721 = _685;
    if (_603)
    {
        float _723 = fma(_665, _659, _709);
        _693 = _723;
    }
    float _725 = _693;
    if (!_603)
    {
        _695 = _597;
    }
    float _727 = _695;
    float _729 = _727;
    if (_603)
    {
        float _731 = _717 * _717;
        _729 = _731;
    }
    float _733 = _729;
    float _735 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _737 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[23].w, _735);
    float _739 = precise::clamp(_737, 0.0, 1.0);
    float _741 = fma(_725, _725, _721);
    float _743 = _563 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _745 = -_739;
    float _747 = _745 + 1.0;
    float _749 = _741 + _733;
    float _751 = _563 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _753 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[1].x, _743);
    float _755 = abs(_747);
    float _757 = log2(_755);
    float _759 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _761 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[2].x, _751);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[1].z, _753);
    float _765 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[2].z, _761);
    float _767 = _563 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _769 = rsqrt(_749);
    float _771 = _563 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _773 = _763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _775 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[0].x, _767);
    float _777 = _765 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _779 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[3].x, _771);
    float _781 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[0].z, _775);
    float _783 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[3].z, _779);
    float _785 = _773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _787 = _781 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _789 = _777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _791 = _783 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _793 = _757 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _785);
    float _797 = _769 * _705;
    float _799 = _769 * _725;
    float _801 = _769 * _717;
    float _803 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _795);
    float _805 = _797 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _807 = -_789;
    float _809 = fma(_807, _759, 1.0);
    float _811 = exp2(_793);
    float _813 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _803);
    float _815 = -_805;
    float _817 = fma(_799, (*spvDescriptorSet0.vp_c15)._m0[21].y, _815);
    float _819 = _773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _821 = -_801;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c15)._m0[21].z, _817);
    float _825 = _773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _827 = log2(_809);
    float _829 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _819);
    float _831 = fma(_823, -0.5, 0.5);
    float _833 = fma(_823, 0.5, 0.5);
    float _835 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _825);
    float _837 = _799 + 1.0;
    float _839 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _829);
    float _841 = fma(_833, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _843 = 1.0 / _813;
    float _845 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _835);
    float _847 = -_799;
    float _849 = fma(_811, _837, _847);
    float _851 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _839);
    float _853 = fma(_833, _841, -0.212114393711090087890625);
    float _855 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _845);
    float _857 = sqrt(_831);
    float _859 = _827 * 0.693147182464599609375;
    float _861 = fma(_833, _853, 1.570728778839111328125);
    float _863 = _859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _865 = _851 * _843;
    float _867 = _855 * _843;
    float _869 = fma(_865, 0.5, 0.5);
    float _871 = fma(_867, -0.5, 0.5);
    float _873 = _857 * 0.636619746685028076171875;
    float3 _2544 = float3(_869, _871, _863);
    float _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2544, float3(0.0), isnan(_2544)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2544, float3(0.0), isnan(_2544)), level(0.0)).x;
    float _877 = -_861;
    float _879 = fma(_873, _877, 1.0);
    float _881 = fma(_849, 0.5, 0.5);
    float3 _2562 = float3(_869, _871, _863);
    float4 _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2562, float3(0.0), isnan(_2562)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2562, float3(0.0), isnan(_2562)), level(0.0)).xyzw;
    float _886 = _884.x;
    float _888 = _884.y;
    float _890 = _884.z;
    float _892 = _884.w;
    float2 _2579 = float2(_879, _881);
    float3 _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2579, float2(0.0), isnan(_2579)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2579, float2(0.0), isnan(_2579)), level(0.0)).xyz;
    float _898 = _896.x;
    float _900 = _896.y;
    float _902 = _896.z;
    float _904 = in.m_49.y;
    float _906 = _757 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _908 = _143 > 0.5;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _918 = exp2(_906);
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _922 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _924 = isnan(0.5);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _930 = _926 || _928;
    float _932 = 1.0 / _912;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _936 = _934 != 0;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _940 = -_245;
    int _942 = _908 ? as_type<int>(_940) : as_type<int>(_245);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _948 = _946 != 0;
    float _950 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _952 = _904 > 0.5;
    float _954 = 1.0 / _916;
    float _956 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _960 = _377 + _958;
    bool _962 = !_936;
    float _964 = _962 ? _245 : as_type<float>(_942);
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = -_169;
    int _970 = _952 ? as_type<int>(_968) : as_type<int>(_169);
    float _972 = -_918;
    float _974 = _972 + 1.0;
    float _976 = _960 * _932;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _980 = _377 + _978;
    float _982 = _501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _984 = _501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_62.x = _956;
    out.m_62.y = _950;
    out.m_62.z = _966;
    float _986 = _964 + 0.5;
    bool _988 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _990 = isnan(_377);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = _980 * _954;
    bool _1002 = !_948;
    float _1004 = _1002 ? _169 : as_type<float>(_970);
    float _1006 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _982);
    float _1008 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _984);
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1012 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1014 = isnan(_377);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1008);
    float _1026 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1006);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1032;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1038 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1040 = fma(_1030, _976, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1042 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1044 = isnan(_377);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1054;
    float _1058 = 1.0 / _1038;
    float _1060 = _1036 + _1038;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1066 = -_1052;
    float _1068 = _1066 + 1.0;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1074 = fma(_1056, _976, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1076 = fma(_1034, _976, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1078 = _998 * _1068;
    float _1080 = -_998;
    float _1082 = _1080 + 1.0;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1090 = _976;
    if (!_930)
    {
        _1088 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1092 = _1088;
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = _1022 * _1082;
    float _1098 = -_1022;
    float _1100 = _1098 + 1.0;
    float _1102 = -_1004;
    float _1104 = _1102 + 0.5;
    float _1106 = fma(_1064, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1108 = _1060 * _1058;
    float _1110 = _1108 * 0.5;
    float _1112 = _1058;
    float _1114 = _1110;
    if (!_930)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1116 = _1112;
    float _1118 = _1040 * _1096;
    float _1120 = _1074 * _1096;
    float _1122 = _1076 * _1096;
    float _1124 = fma(_1086, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1126 = _1116;
    if (!_930)
    {
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1130 = fma(_1110, _1116, _1128);
        _1114 = _1130;
    }
    float _1132 = _1114;
    if (!_930)
    {
        float _1134 = -_1092;
        float _1136 = _1134 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1126 = _1136;
    }
    float _1138 = _1126;
    float _1140 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1118);
    float _1142 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1120);
    float _1144 = fma(_1072, _1000, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    if (!_930)
    {
        float _1146 = 1.0 / _1138;
        _1090 = _1146;
    }
    float _1148 = _1090;
    float _1150 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1152 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1122);
    float _1154 = fma(_1106, _1078, _1140);
    float _1156 = _773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1158 = _1150 * _1094;
    float _1160 = fma(_1124, _1078, _1142);
    float _1162 = fma(_1144, _1078, _1152);
    float _1164 = _1132;
    float _1166 = _1156;
    float _1168 = _1150;
    if (!_930)
    {
        float _1170 = 1.0 / _1132;
        _1164 = _1170;
    }
    float _1172 = _1164;
    float _1174 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1156);
    float _1176 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1154);
    if (_930)
    {
        _1166 = 1.0;
    }
    float _1178 = _1166;
    float _1180 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1160);
    float _1182 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1162);
    float _1184 = _974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1192 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1196 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1192 * _1010;
    float _1202 = _1178;
    if (!_930)
    {
        float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1206 = -_1092;
        float _1208 = fma(_1172, _1204, _1206);
        _1168 = _1208;
    }
    float _1210 = _1168;
    out.m_64.x = _1194;
    out.m_64.y = _1196;
    out.m_64.z = _1198;
    if (!_930)
    {
        float _1212 = _1210 * _1148;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        _1202 = _1214;
    }
    float _1216 = _1202;
    float _1218 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1174);
    out.m_66.x = _1200;
    out.m_66.y = _1158;
    float _1220 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1222 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1218);
    bool _1224 = _1216 > 0.0;
    bool _1226 = isnan(_1216);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.0);
    bool _1232 = _1228 || _1230;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = _1222 + _813;
    out.gl_Position.x = _851;
    out.gl_Position.y = _855;
    out.gl_Position.z = _1222;
    out.gl_Position.w = _813;
    float _1238 = _1236 * 0.5;
    out.m_45.x = _1234;
    out.m_68.z = _1238;
    out.m_68.w = _813;
    float _1240 = _1184 * _875;
    float _1242 = -_1184;
    float _1244 = _1242 + 1.0;
    float _1246 = _892 * _1240;
    float _1248 = _892 * _1244;
    float _1250 = _902 * _1240;
    float _1252 = fma(_898, _1246, _886);
    float _1254 = fma(_900, _1246, _888);
    float _1256 = fma(_892, _1250, _890);
    out.m_70.x = _1252;
    out.m_70.y = _1254;
    out.m_70.z = _1256;
    out.m_70.w = _1248;
    if (_1232)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1258;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

