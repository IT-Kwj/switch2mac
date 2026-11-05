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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _421 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_99);
        out.gl_Position.z = _1565;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1634 = as_type<float>(_135);
        out.gl_Position.z = _1634;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = _155 * 6.283185482025146484375;
    float _159 = floor(_155);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _157 * 0.15915493667125701904296875;
    float _173 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    bool _179 = !_163;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    bool _191 = !_153;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    int _197 = abs(_181);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _201 = -_159;
    float _203 = _155 + _201;
    bool _205 = !_167;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    int _211 = abs(_193);
    float _213 = float(_197);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_187, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_237, _235, _227);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_219;
    float _253 = _195;
    float _255 = _199;
    float _257 = _209;
    float _273;
    if (!_251)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_83);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    bool _301 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_283);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = 1.0 / _315;
    bool _327 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_283);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _311 * _323;
    float _341 = -_311;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = _337 * _343;
    float _349 = 1.0 / _319;
    float _351 = -_337;
    float _353 = _351 + 1.0;
    float _355 = _287 * _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _359 = _283 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_363, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _359 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _369 * _347;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _371 * _347;
    float _387 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _391 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _395 = fma(_387, _339, _389);
    float _397 = fma(_391, _339, _393);
    float _399 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    float _401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _403 = !_345;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_83);
        float _425 = 1.0 / _423;
        float _427 = _117 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = as_type<float>(int(gl_VertexIndex));
    float _439 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _441);
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _443);
    int _451 = as_type<int>(_437) & 1;
    bool _453 = _451 != 0;
    int _455 = as_type<int>(_437) & 2;
    bool _457 = _455 != 0;
    float _459 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
    float _461 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    float _463 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _465 = _459 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _467 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _469 = _463 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _471 = !_457;
    float _473 = _471 ? (-0.5) : 0.5;
    float _475 = -_465;
    float _477 = _475 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _479 = -_467;
    float _481 = _479 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _483 = -_469;
    float _485 = _483 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _487 = _477 * _477;
    float _489 = fma(_481, _481, _487);
    float _491 = fma(_485, _485, _489);
    float _493 = rsqrt(_491);
    float _495 = _481 * _493;
    float _497 = _485 * _493;
    float _499 = _477 * _493;
    float _501 = in.m_56.x;
    float _503 = in.m_56.y;
    float _505 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _507 = _495 * _505;
    float _509 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _511 = _497 * _509;
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _515 = -_507;
    float _517 = fma(_497, _513, _515);
    float _519 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _521 = -_511;
    float _523 = fma(_499, _519, _521);
    float _525 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _527 = _499 * _525;
    float _529 = _517 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _533 = -_527;
    float _535 = fma(_495, _531, _533);
    float _537 = fma(_523, _523, _529);
    float _539 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _473);
    float _541 = fma(_535, _535, _537);
    float _543 = rsqrt(_541);
    float _545 = _401 * _503;
    float _547 = _399 * _501;
    float _549 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _551 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = _549 * _539;
    float _555 = _523 * _543;
    bool _557 = !_453;
    float _559 = _557 ? (-0.5) : 0.5;
    float _561 = _517 * _543;
    float _563 = _535 * _543;
    float _565 = _499 * _555;
    float _567 = _497 * _561;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _559);
    float _571 = -_565;
    float _573 = fma(_495, _561, _571);
    float _575 = -_567;
    float _577 = fma(_499, _563, _575);
    float _579 = _551 * _569;
    float _581 = _553 * _573;
    float _583 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _585 = _553 * _577;
    float _587 = fma(_579, _563, _581);
    float _589 = _495 * _563;
    float _591 = fma(_579, _555, _585);
    float _593 = fma(_583, _497, _587);
    float _595 = -_589;
    float _597 = fma(_497, _555, _595);
    float _599 = fma(_583, _495, _591);
    float _601 = _469 + _593;
    float _603 = _553 * _597;
    float _605 = _467 + _599;
    float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _609 = _601 + _607;
    float _611 = fma(_579, _561, _603);
    float _613 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _615 = _605 + _613;
    float _617 = _609 * _609;
    float _619 = fma(_583, _499, _611);
    float _621 = fma(_615, _615, _617);
    float _623 = _465 + _619;
    float _625 = sqrt(_621);
    bool _627 = _625 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _629 = _603;
    float _631 = _611;
    float _633 = _499;
    float _635 = _615;
    if (!_627)
    {
        _629 = _605;
    }
    float _637 = _629;
    float _639 = _637;
    if (!_627)
    {
        _631 = _601;
    }
    float _641 = _631;
    float _643 = _641;
    if (!_627)
    {
        _633 = _623;
    }
    float _645 = _633;
    bool _647 = !_627;
    float _649 = _645;
    if (!_647)
    {
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _655 = _625 + _653;
        float _657 = _623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _659 = rsqrt(_621);
        float _661 = _655 * _651;
        float _663 = _661 * 0.15915493667125701904296875;
        float _665 = _663 * 6.283185482025146484375;
        float _667 = cos(_665);
        float _669 = _663 * 6.283185482025146484375;
        float _671 = sin(_669);
        float _673 = _667 + (-1.0);
        float _675 = _673 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _677 = fma(_671, _657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _679 = fma(_623, _667, _675);
        float _681 = _659 * _677;
        float _683 = fma(_615, _681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _685 = fma(_609, _681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _649 = _679;
        _639 = _683;
        _643 = _685;
    }
    float _687 = _649;
    float _689 = _639;
    float _691 = _643;
    float _693 = -_465;
    float _695 = _693 + _687;
    float _697 = -_467;
    float _699 = _697 + _689;
    float _701 = -_469;
    float _703 = _701 + _691;
    float _705 = _465 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _707 = _695 * _695;
    bool _709 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _711 = isnan(0.5);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _717 = _713 || _715;
    float _719 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[11].x, _705);
    float _721 = fma(_699, _699, _707);
    bool _723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    float _733 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _719);
    float _735 = fma(_703, _703, _721);
    float _737 = _465 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _739 = _733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _741 = sqrt(_735);
    float _743 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[10].x, _737);
    float _745 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _743);
    float _747 = 1.0 / _739;
    float _749 = _745 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _751 = _749 + _739;
    bool _753 = _741 > 0.0;
    float _755 = _751 * _747;
    float _757 = _755 * 0.5;
    bool _759 = !_753;
    float _761 = _689;
    float _763 = _691;
    float _765 = _687;
    float _767 = _749;
    if (!_759)
    {
        float _769 = _199 * _199;
        float _771 = fma(_195, _195, _769);
        float _773 = fma(_209, _209, _771);
        float _775 = rsqrt(_735);
        float _777 = sqrt(_773);
        float _779 = _699 * _775;
        float _781 = _695 * _775;
        float _783 = _703 * _775;
        bool _785 = _777 > 0.0;
        bool _787 = !_785;
        _767 = _775;
        if (!_787)
        {
            float _789 = rsqrt(_773);
            float _791 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _793 = _199 * _789;
            float _795 = _195 * _789;
            float _797 = _781 * _793;
            float _799 = _209 * _789;
            float _801 = fma(_779, _795, _797);
            float _803 = _791 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _805 = fma(_783, _799, _801);
            float _807 = _805 * _803;
            float _809 = fma(_195, _807, _689);
            float _811 = fma(_199, _807, _687);
            float _813 = fma(_209, _807, _691);
            _761 = _809;
            _763 = _813;
            _765 = _811;
            _767 = _805;
        }
    }
    float _815 = _761;
    float _817 = _763;
    float _819 = _765;
    float _821 = _767;
    float _823 = _819;
    float _825 = _821;
    float _827 = _815;
    if (_731)
    {
        _253 = 1.0;
    }
    float _829 = _253;
    float _831 = _829;
    if (_717)
    {
        _255 = _815;
    }
    float _833 = _255;
    float _835 = _833;
    if (_717)
    {
        _257 = _817;
    }
    float _837 = _257;
    float _839 = _837;
    if (!_717)
    {
        float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _843 = _465 + _841;
        float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _847 = _467 + _845;
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _851 = -_467;
        float _853 = _851 + _815;
        float _855 = _843 * _843;
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _859 = _469 + _857;
        float _861 = -_469;
        float _863 = _861 + _817;
        float _865 = fma(_847, _847, _855);
        float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _869 = fma(_859, _859, _865);
        float _871 = sqrt(_869);
        float _873 = _849 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _875 = precise::min(_871, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _877 = _875 * _867;
        float _879 = _873 * _877;
        float _881 = -_465;
        float _883 = _881 + _819;
        float _885 = fma(_853, _879, _467);
        float _887 = fma(_883, _879, _465);
        float _889 = fma(_863, _879, _469);
        _823 = _887;
        _835 = _885;
        _839 = _889;
        _825 = _879;
        _827 = _853;
    }
    float _891 = _823;
    float _893 = _835;
    float _895 = _839;
    float _897 = _825;
    float _899 = _827;
    float _901 = _897;
    float _903 = _899;
    if (!_731)
    {
        float _905 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _907 = _905 * 0.15915493667125701904296875;
        float _909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _913 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
        float _915 = _907 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _909 * 0.15915493667125701904296875;
        float _921 = _907 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = 1.0 / _917;
        float _927 = _919 * 6.283185482025146484375;
        float _929 = cos(_927);
        float _931 = _923 * _925;
        float _933 = _919 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _929 * _931;
        float _939 = 1.0 / _913;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _943 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _941;
        float _945 = 1.0 / _937;
        float _947 = 1.0 / _943;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _951 = _939 * _949;
        float _953 = _935 * _945;
        float _955 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _957 = fma(_953, _951, _955);
        float _959 = _957 * _947;
        float _961 = precise::clamp(_959, 0.0, 1.0);
        _901 = _919;
        _903 = _945;
        _831 = _961;
    }
    float _963 = _901;
    float _965 = _903;
    float _967 = _831;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _891 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _893 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _979 = _895 + _977;
    float _981 = _971 * _971;
    float _983 = fma(_975, _975, _981);
    float _985 = fma(_979, _979, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _979 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _979;
    float _1011 = _965;
    float _1013 = _1007;
    float _1015 = _963;
    float _1017 = _971;
    if (_1003)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1019;
    }
    float _1021 = _1009;
    if (_1003)
    {
        float _1023 = rsqrt(_999);
        _1011 = _1023;
    }
    float _1025 = _1011;
    float _1027 = _1025;
    if (_1003)
    {
        float _1029 = _1007 * _1021;
        _1013 = _1029;
    }
    float _1031 = _1013;
    if (_1003)
    {
        float _1033 = _1031 * 0.15915493667125701904296875;
        _1015 = _1033;
    }
    float _1035 = _1015;
    float _1037 = _987;
    if (_1003)
    {
        float _1039 = _1035 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1047 = precise::max(0.0, _1045);
    float _1049 = _983;
    float _1051 = _1047;
    float _1053 = _1045;
    if (_1003)
    {
        float _1055 = _1035 * 6.283185482025146484375;
        float _1057 = cos(_1055);
        _1049 = _1057;
    }
    float _1059 = _1049;
    float _1061 = -_989;
    float _1063 = -_1047;
    float _1065 = fma(_971, _1061, _1063);
    if (!_1003)
    {
        _1051 = _991;
    }
    float _1067 = _1051;
    float _1069 = _1067;
    if (_1003)
    {
        float _1071 = _1065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1053 = _1071;
    }
    float _1073 = _1053;
    float _1075 = sqrt(_985);
    float _1077 = _1043;
    float _1079 = _1073;
    if (_1003)
    {
        float _1081 = fma(_1043, _1073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1017 = _1081;
    }
    float _1083 = _1017;
    float _1085 = _1083;
    if (!_1003)
    {
        _1077 = _995;
    }
    float _1087 = _1077;
    float _1089 = _1087;
    float _1091 = _1059;
    if (_1003)
    {
        float _1093 = _1059 + (-1.0);
        _1079 = _1093;
    }
    float _1095 = _1079;
    float _1097 = _1095;
    if (_1003)
    {
        float _1099 = _1025 * _1083;
        _635 = _1099;
    }
    float _1101 = _635;
    if (!_1003)
    {
        _1085 = _1065;
    }
    float _1103 = _1085;
    float _1105 = _1103;
    if (_1003)
    {
        float _1107 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1027 = _1107;
    }
    float _1109 = _1027;
    if (_1003)
    {
        float _1111 = _991 * _1101;
        _1069 = _1111;
    }
    float _1113 = _1069;
    if (!_1003)
    {
        _1097 = _993;
    }
    float _1115 = _1097;
    float _1117 = _1115;
    if (_1003)
    {
        float _1119 = _993 * _1101;
        _1117 = _1119;
    }
    float _1121 = _1117;
    if (_1003)
    {
        float _1123 = fma(_1065, _1059, _1109);
        _1105 = _1123;
    }
    float _1125 = _1105;
    if (_1003)
    {
        float _1127 = _1113 * _1113;
        _1089 = _1127;
    }
    float _1129 = _1089;
    if (!_1003)
    {
        _1091 = _997;
    }
    float _1131 = _1091;
    float _1133 = _1131;
    if (_1003)
    {
        float _1135 = _1121 * _1121;
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_1125, _1125, _1129);
    float _1141 = _1139 + _1137;
    float _1143 = _891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1147 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1145);
    float _1149 = precise::clamp(_1147, 0.0, 1.0);
    float _1151 = _891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1153 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1155 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1157 = rsqrt(_1141);
    float _1159 = _891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = -_1149;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1155);
    float _1167 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1151);
    float _1169 = _891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1175 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1167);
    float _1177 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = abs(_1163);
    float _1181 = log2(_1179);
    float _1183 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1185 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1187 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1189 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1191 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1193 = _1157 * _1113;
    float _1195 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1197 = _1157 * _1125;
    float _1199 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1195);
    float _1205 = _1157 * _1121;
    float _1207 = -_1189;
    float _1209 = fma(_1207, _1153, 1.0);
    float _1211 = -_1201;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1203);
    float _1217 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1219 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1221 = -_1205;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1225 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1215);
    float _1227 = exp2(_1217);
    float _1229 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1231 = fma(_1223, -0.5, 0.5);
    float _1233 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1219);
    float _1235 = fma(_1223, 0.5, 0.5);
    float _1237 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1229);
    float _1239 = _1197 + 1.0;
    float _1241 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1233);
    float _1243 = log2(_1209);
    float _1245 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1247 = fma(_1235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1249 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1241);
    float _1251 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1245);
    float _1253 = fma(_1235, _1247, -0.212114393711090087890625);
    float _1255 = 1.0 / _1225;
    float _1257 = -_1197;
    float _1259 = fma(_1227, _1239, _1257);
    float _1261 = fma(_1235, _1253, 1.570728778839111328125);
    float _1263 = fma(_1259, 0.5, 0.5);
    float _1265 = sqrt(_1231);
    float _1267 = _1243 * 0.693147182464599609375;
    float _1269 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1271 = _1249 * _1255;
    float _1273 = _1251 * _1255;
    float _1275 = fma(_1271, 0.5, 0.5);
    float _1277 = fma(_1273, -0.5, 0.5);
    float _1279 = _1265 * 0.636619746685028076171875;
    float _1281 = -_1261;
    float _1283 = fma(_1279, _1281, 1.0);
    float3 _3432 = float3(_1275, _1277, _1269);
    float _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3432, float3(0.0), isnan(_3432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3432, float3(0.0), isnan(_3432)), level(0.0)).x;
    float3 _3443 = float3(_1275, _1277, _1269);
    float4 _1288 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3443, float3(0.0), isnan(_3443)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3443, float3(0.0), isnan(_3443)), level(0.0)).xyzw;
    float _1290 = _1288.x;
    float _1292 = _1288.y;
    float _1294 = _1288.z;
    float _1296 = _1288.w;
    float2 _3460 = float2(_1283, _1263);
    float3 _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3460, float2(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3460, float2(0.0), isnan(_3460)), level(0.0)).xyz;
    float _1302 = _1300.x;
    float _1304 = _1300.y;
    float _1306 = _1300.z;
    float _1308 = in.m_49.y;
    bool _1310 = _137 > 0.5;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1314 = _429 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1316;
    float _1320 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1324 = _1322 != 0;
    float _1326 = 1.0 / _1318;
    float _1328 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1320);
    float _1330 = -_559;
    int _1332 = _1310 ? as_type<int>(_1330) : as_type<int>(_559);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1328);
    bool _1340 = !_1324;
    float _1342 = _1340 ? _559 : as_type<float>(_1332);
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1346;
    float _1350 = _1342 + 0.5;
    bool _1352 = _967 > 0.0;
    bool _1354 = isnan(_967);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.0);
    bool _1360 = _1356 || _1358;
    bool _1362 = _1308 > 0.5;
    float _1364 = _1314 * _1326;
    float _1366 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1368 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1370 = isnan(_429);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = fma(_1348, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1382 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1384 = isnan(_429);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1394;
    float _1398 = -_473;
    int _1400 = _1362 ? as_type<int>(_1398) : as_type<int>(_473);
    float _1402 = -_1378;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1406;
    float _1410 = fma(_1396, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1412 = !_1336;
    float _1414 = _1412 ? _473 : as_type<float>(_1400);
    float _1416 = _1392 * _1404;
    float _1418 = -_1392;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1408, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1426 = _1410 * _1416;
    float _1428 = _1380 * _1416;
    float _1430 = _1422 * _1416;
    float _1432 = -_1414;
    float _1434 = _1432 + 0.5;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1426);
    float _1438 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1440 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1428);
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1430);
    float _1444 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1446 = exp2(_1438);
    float _1448 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1436);
    float _1450 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1440);
    float _1452 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1442);
    float _1454 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1338);
    float _1456 = _249 * _1444;
    float _1458 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1460 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1464 = _1454 + _1225;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = -_1446;
    float _1476 = _1474 + 1.0;
    float _1478 = _1464 * 0.5;
    float _1480 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _1249;
    out.gl_Position.y = _1251;
    out.gl_Position.z = _1454;
    out.gl_Position.w = _1225;
    float _1482 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1484 = _1366 * _1344;
    float _1486 = _1480 * _1424;
    out.m_58.x = _1468;
    out.m_58.y = _1470;
    out.m_58.z = _1472;
    out.m_58.w = _1466;
    float _1488 = -_1482;
    float _1490 = _1488 + 1.0;
    float _1492 = _1456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1484;
    out.m_60.y = _1486;
    out.m_62.z = _1478;
    out.m_62.w = _1225;
    out.m_45.x = _1492;
    float _1494 = _1482 * _1285;
    float _1496 = _1296 * _1490;
    float _1498 = _1296 * _1494;
    float _1500 = _1306 * _1494;
    float _1502 = fma(_1302, _1498, _1290);
    float _1504 = fma(_1304, _1498, _1292);
    float _1506 = fma(_1296, _1500, _1294);
    out.m_64.x = _1502;
    out.m_64.y = _1504;
    out.m_64.z = _1506;
    out.m_64.w = _1496;
    if (_1360)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1508 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1508;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _421 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_99);
        out.gl_Position.z = _1565;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1634 = as_type<float>(_135);
        out.gl_Position.z = _1634;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = _155 * 6.283185482025146484375;
    float _159 = floor(_155);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _157 * 0.15915493667125701904296875;
    float _173 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    bool _179 = !_163;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    bool _191 = !_153;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    int _197 = abs(_181);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _201 = -_159;
    float _203 = _155 + _201;
    bool _205 = !_167;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    int _211 = abs(_193);
    float _213 = float(_197);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_187, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_237, _235, _227);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_219;
    float _253 = _195;
    float _255 = _199;
    float _257 = _209;
    float _273;
    if (!_251)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_83);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    bool _301 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_283);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = 1.0 / _315;
    bool _327 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_283);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _311 * _323;
    float _341 = -_311;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = _337 * _343;
    float _349 = 1.0 / _319;
    float _351 = -_337;
    float _353 = _351 + 1.0;
    float _355 = _287 * _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _359 = _283 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_363, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _359 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _369 * _347;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _371 * _347;
    float _387 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _391 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _395 = fma(_387, _339, _389);
    float _397 = fma(_391, _339, _393);
    float _399 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    float _401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _403 = !_345;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_83);
        float _425 = 1.0 / _423;
        float _427 = _117 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = as_type<float>(int(gl_VertexIndex));
    float _439 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _441);
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _443);
    int _451 = as_type<int>(_437) & 1;
    bool _453 = _451 != 0;
    int _455 = as_type<int>(_437) & 2;
    bool _457 = _455 != 0;
    float _459 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
    float _461 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    float _463 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _465 = _459 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _467 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _469 = _463 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _471 = !_457;
    float _473 = _471 ? (-0.5) : 0.5;
    float _475 = -_465;
    float _477 = _475 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _479 = -_467;
    float _481 = _479 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _483 = -_469;
    float _485 = _483 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _487 = _477 * _477;
    float _489 = fma(_481, _481, _487);
    float _491 = fma(_485, _485, _489);
    float _493 = rsqrt(_491);
    float _495 = _481 * _493;
    float _497 = _485 * _493;
    float _499 = _477 * _493;
    float _501 = in.m_56.x;
    float _503 = in.m_56.y;
    float _505 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _507 = _495 * _505;
    float _509 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _511 = _497 * _509;
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _515 = -_507;
    float _517 = fma(_497, _513, _515);
    float _519 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _521 = -_511;
    float _523 = fma(_499, _519, _521);
    float _525 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _527 = _499 * _525;
    float _529 = _517 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _533 = -_527;
    float _535 = fma(_495, _531, _533);
    float _537 = fma(_523, _523, _529);
    float _539 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _473);
    float _541 = fma(_535, _535, _537);
    float _543 = rsqrt(_541);
    float _545 = _401 * _503;
    float _547 = _399 * _501;
    float _549 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _551 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = _549 * _539;
    float _555 = _523 * _543;
    bool _557 = !_453;
    float _559 = _557 ? (-0.5) : 0.5;
    float _561 = _517 * _543;
    float _563 = _535 * _543;
    float _565 = _499 * _555;
    float _567 = _497 * _561;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _559);
    float _571 = -_565;
    float _573 = fma(_495, _561, _571);
    float _575 = -_567;
    float _577 = fma(_499, _563, _575);
    float _579 = _551 * _569;
    float _581 = _553 * _573;
    float _583 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _585 = _553 * _577;
    float _587 = fma(_579, _563, _581);
    float _589 = _495 * _563;
    float _591 = fma(_579, _555, _585);
    float _593 = fma(_583, _497, _587);
    float _595 = -_589;
    float _597 = fma(_497, _555, _595);
    float _599 = fma(_583, _495, _591);
    float _601 = _469 + _593;
    float _603 = _553 * _597;
    float _605 = _467 + _599;
    float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _609 = _601 + _607;
    float _611 = fma(_579, _561, _603);
    float _613 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _615 = _605 + _613;
    float _617 = _609 * _609;
    float _619 = fma(_583, _499, _611);
    float _621 = fma(_615, _615, _617);
    float _623 = _465 + _619;
    float _625 = sqrt(_621);
    bool _627 = _625 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _629 = _603;
    float _631 = _611;
    float _633 = _499;
    float _635 = _615;
    if (!_627)
    {
        _629 = _605;
    }
    float _637 = _629;
    float _639 = _637;
    if (!_627)
    {
        _631 = _601;
    }
    float _641 = _631;
    float _643 = _641;
    if (!_627)
    {
        _633 = _623;
    }
    float _645 = _633;
    bool _647 = !_627;
    float _649 = _645;
    if (!_647)
    {
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _655 = _625 + _653;
        float _657 = _623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _659 = rsqrt(_621);
        float _661 = _655 * _651;
        float _663 = _661 * 0.15915493667125701904296875;
        float _665 = _663 * 6.283185482025146484375;
        float _667 = cos(_665);
        float _669 = _663 * 6.283185482025146484375;
        float _671 = sin(_669);
        float _673 = _667 + (-1.0);
        float _675 = _673 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _677 = fma(_671, _657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _679 = fma(_623, _667, _675);
        float _681 = _659 * _677;
        float _683 = fma(_615, _681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _685 = fma(_609, _681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _649 = _679;
        _639 = _683;
        _643 = _685;
    }
    float _687 = _649;
    float _689 = _639;
    float _691 = _643;
    float _693 = -_465;
    float _695 = _693 + _687;
    float _697 = -_467;
    float _699 = _697 + _689;
    float _701 = -_469;
    float _703 = _701 + _691;
    float _705 = _465 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _707 = _695 * _695;
    bool _709 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _711 = isnan(0.5);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _717 = _713 || _715;
    float _719 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[11].x, _705);
    float _721 = fma(_699, _699, _707);
    bool _723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    float _733 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _719);
    float _735 = fma(_703, _703, _721);
    float _737 = _465 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _739 = _733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _741 = sqrt(_735);
    float _743 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[10].x, _737);
    float _745 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _743);
    float _747 = 1.0 / _739;
    float _749 = _745 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _751 = _749 + _739;
    bool _753 = _741 > 0.0;
    float _755 = _751 * _747;
    float _757 = _755 * 0.5;
    bool _759 = !_753;
    float _761 = _689;
    float _763 = _691;
    float _765 = _687;
    float _767 = _749;
    if (!_759)
    {
        float _769 = _199 * _199;
        float _771 = fma(_195, _195, _769);
        float _773 = fma(_209, _209, _771);
        float _775 = rsqrt(_735);
        float _777 = sqrt(_773);
        float _779 = _699 * _775;
        float _781 = _695 * _775;
        float _783 = _703 * _775;
        bool _785 = _777 > 0.0;
        bool _787 = !_785;
        _767 = _775;
        if (!_787)
        {
            float _789 = rsqrt(_773);
            float _791 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _793 = _199 * _789;
            float _795 = _195 * _789;
            float _797 = _781 * _793;
            float _799 = _209 * _789;
            float _801 = fma(_779, _795, _797);
            float _803 = _791 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _805 = fma(_783, _799, _801);
            float _807 = _805 * _803;
            float _809 = fma(_195, _807, _689);
            float _811 = fma(_199, _807, _687);
            float _813 = fma(_209, _807, _691);
            _761 = _809;
            _763 = _813;
            _765 = _811;
            _767 = _805;
        }
    }
    float _815 = _761;
    float _817 = _763;
    float _819 = _765;
    float _821 = _767;
    float _823 = _819;
    float _825 = _821;
    float _827 = _815;
    if (_731)
    {
        _253 = 1.0;
    }
    float _829 = _253;
    float _831 = _829;
    if (_717)
    {
        _255 = _815;
    }
    float _833 = _255;
    float _835 = _833;
    if (_717)
    {
        _257 = _817;
    }
    float _837 = _257;
    float _839 = _837;
    if (!_717)
    {
        float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _843 = _465 + _841;
        float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _847 = _467 + _845;
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _851 = -_467;
        float _853 = _851 + _815;
        float _855 = _843 * _843;
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _859 = _469 + _857;
        float _861 = -_469;
        float _863 = _861 + _817;
        float _865 = fma(_847, _847, _855);
        float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _869 = fma(_859, _859, _865);
        float _871 = sqrt(_869);
        float _873 = _849 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _875 = precise::min(_871, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _877 = _875 * _867;
        float _879 = _873 * _877;
        float _881 = -_465;
        float _883 = _881 + _819;
        float _885 = fma(_853, _879, _467);
        float _887 = fma(_883, _879, _465);
        float _889 = fma(_863, _879, _469);
        _823 = _887;
        _835 = _885;
        _839 = _889;
        _825 = _879;
        _827 = _853;
    }
    float _891 = _823;
    float _893 = _835;
    float _895 = _839;
    float _897 = _825;
    float _899 = _827;
    float _901 = _897;
    float _903 = _899;
    if (!_731)
    {
        float _905 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _907 = _905 * 0.15915493667125701904296875;
        float _909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _913 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
        float _915 = _907 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _909 * 0.15915493667125701904296875;
        float _921 = _907 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = 1.0 / _917;
        float _927 = _919 * 6.283185482025146484375;
        float _929 = cos(_927);
        float _931 = _923 * _925;
        float _933 = _919 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _929 * _931;
        float _939 = 1.0 / _913;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _943 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _941;
        float _945 = 1.0 / _937;
        float _947 = 1.0 / _943;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _951 = _939 * _949;
        float _953 = _935 * _945;
        float _955 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _957 = fma(_953, _951, _955);
        float _959 = _957 * _947;
        float _961 = precise::clamp(_959, 0.0, 1.0);
        _901 = _919;
        _903 = _945;
        _831 = _961;
    }
    float _963 = _901;
    float _965 = _903;
    float _967 = _831;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _891 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _893 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _979 = _895 + _977;
    float _981 = _971 * _971;
    float _983 = fma(_975, _975, _981);
    float _985 = fma(_979, _979, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _979 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _979;
    float _1011 = _965;
    float _1013 = _1007;
    float _1015 = _963;
    float _1017 = _971;
    if (_1003)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1019;
    }
    float _1021 = _1009;
    if (_1003)
    {
        float _1023 = rsqrt(_999);
        _1011 = _1023;
    }
    float _1025 = _1011;
    float _1027 = _1025;
    if (_1003)
    {
        float _1029 = _1007 * _1021;
        _1013 = _1029;
    }
    float _1031 = _1013;
    if (_1003)
    {
        float _1033 = _1031 * 0.15915493667125701904296875;
        _1015 = _1033;
    }
    float _1035 = _1015;
    float _1037 = _987;
    if (_1003)
    {
        float _1039 = _1035 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1047 = precise::max(0.0, _1045);
    float _1049 = _983;
    float _1051 = _1047;
    float _1053 = _1045;
    if (_1003)
    {
        float _1055 = _1035 * 6.283185482025146484375;
        float _1057 = cos(_1055);
        _1049 = _1057;
    }
    float _1059 = _1049;
    float _1061 = -_989;
    float _1063 = -_1047;
    float _1065 = fma(_971, _1061, _1063);
    if (!_1003)
    {
        _1051 = _991;
    }
    float _1067 = _1051;
    float _1069 = _1067;
    if (_1003)
    {
        float _1071 = _1065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1053 = _1071;
    }
    float _1073 = _1053;
    float _1075 = sqrt(_985);
    float _1077 = _1043;
    float _1079 = _1073;
    if (_1003)
    {
        float _1081 = fma(_1043, _1073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1017 = _1081;
    }
    float _1083 = _1017;
    float _1085 = _1083;
    if (!_1003)
    {
        _1077 = _995;
    }
    float _1087 = _1077;
    float _1089 = _1087;
    float _1091 = _1059;
    if (_1003)
    {
        float _1093 = _1059 + (-1.0);
        _1079 = _1093;
    }
    float _1095 = _1079;
    float _1097 = _1095;
    if (_1003)
    {
        float _1099 = _1025 * _1083;
        _635 = _1099;
    }
    float _1101 = _635;
    if (!_1003)
    {
        _1085 = _1065;
    }
    float _1103 = _1085;
    float _1105 = _1103;
    if (_1003)
    {
        float _1107 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1027 = _1107;
    }
    float _1109 = _1027;
    if (_1003)
    {
        float _1111 = _991 * _1101;
        _1069 = _1111;
    }
    float _1113 = _1069;
    if (!_1003)
    {
        _1097 = _993;
    }
    float _1115 = _1097;
    float _1117 = _1115;
    if (_1003)
    {
        float _1119 = _993 * _1101;
        _1117 = _1119;
    }
    float _1121 = _1117;
    if (_1003)
    {
        float _1123 = fma(_1065, _1059, _1109);
        _1105 = _1123;
    }
    float _1125 = _1105;
    if (_1003)
    {
        float _1127 = _1113 * _1113;
        _1089 = _1127;
    }
    float _1129 = _1089;
    if (!_1003)
    {
        _1091 = _997;
    }
    float _1131 = _1091;
    float _1133 = _1131;
    if (_1003)
    {
        float _1135 = _1121 * _1121;
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_1125, _1125, _1129);
    float _1141 = _1139 + _1137;
    float _1143 = _891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1147 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1145);
    float _1149 = precise::clamp(_1147, 0.0, 1.0);
    float _1151 = _891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1153 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1155 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1157 = rsqrt(_1141);
    float _1159 = _891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = -_1149;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1155);
    float _1167 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1151);
    float _1169 = _891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1175 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1167);
    float _1177 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = abs(_1163);
    float _1181 = log2(_1179);
    float _1183 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1185 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1187 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1189 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1191 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1193 = _1157 * _1113;
    float _1195 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1197 = _1157 * _1125;
    float _1199 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1195);
    float _1205 = _1157 * _1121;
    float _1207 = -_1189;
    float _1209 = fma(_1207, _1153, 1.0);
    float _1211 = -_1201;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1203);
    float _1217 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1219 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1221 = -_1205;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1225 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1215);
    float _1227 = exp2(_1217);
    float _1229 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1231 = fma(_1223, -0.5, 0.5);
    float _1233 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1219);
    float _1235 = fma(_1223, 0.5, 0.5);
    float _1237 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1229);
    float _1239 = _1197 + 1.0;
    float _1241 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1233);
    float _1243 = log2(_1209);
    float _1245 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1247 = fma(_1235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1249 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1241);
    float _1251 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1245);
    float _1253 = fma(_1235, _1247, -0.212114393711090087890625);
    float _1255 = 1.0 / _1225;
    float _1257 = -_1197;
    float _1259 = fma(_1227, _1239, _1257);
    float _1261 = fma(_1235, _1253, 1.570728778839111328125);
    float _1263 = fma(_1259, 0.5, 0.5);
    float _1265 = sqrt(_1231);
    float _1267 = _1243 * 0.693147182464599609375;
    float _1269 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1271 = _1249 * _1255;
    float _1273 = _1251 * _1255;
    float _1275 = fma(_1271, 0.5, 0.5);
    float _1277 = fma(_1273, -0.5, 0.5);
    float _1279 = _1265 * 0.636619746685028076171875;
    float _1281 = -_1261;
    float _1283 = fma(_1279, _1281, 1.0);
    float3 _3432 = float3(_1275, _1277, _1269);
    float _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3432, float3(0.0), isnan(_3432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3432, float3(0.0), isnan(_3432)), level(0.0)).x;
    float3 _3443 = float3(_1275, _1277, _1269);
    float4 _1288 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3443, float3(0.0), isnan(_3443)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3443, float3(0.0), isnan(_3443)), level(0.0)).xyzw;
    float _1290 = _1288.x;
    float _1292 = _1288.y;
    float _1294 = _1288.z;
    float _1296 = _1288.w;
    float2 _3460 = float2(_1283, _1263);
    float3 _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3460, float2(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3460, float2(0.0), isnan(_3460)), level(0.0)).xyz;
    float _1302 = _1300.x;
    float _1304 = _1300.y;
    float _1306 = _1300.z;
    float _1308 = in.m_49.y;
    bool _1310 = _137 > 0.5;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1314 = _429 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1316;
    float _1320 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1324 = _1322 != 0;
    float _1326 = 1.0 / _1318;
    float _1328 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1320);
    float _1330 = -_559;
    int _1332 = _1310 ? as_type<int>(_1330) : as_type<int>(_559);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1328);
    bool _1340 = !_1324;
    float _1342 = _1340 ? _559 : as_type<float>(_1332);
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1346;
    float _1350 = _1342 + 0.5;
    bool _1352 = _967 > 0.0;
    bool _1354 = isnan(_967);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.0);
    bool _1360 = _1356 || _1358;
    bool _1362 = _1308 > 0.5;
    float _1364 = _1314 * _1326;
    float _1366 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1368 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1370 = isnan(_429);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = fma(_1348, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1382 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1384 = isnan(_429);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1394;
    float _1398 = -_473;
    int _1400 = _1362 ? as_type<int>(_1398) : as_type<int>(_473);
    float _1402 = -_1378;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1406;
    float _1410 = fma(_1396, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1412 = !_1336;
    float _1414 = _1412 ? _473 : as_type<float>(_1400);
    float _1416 = _1392 * _1404;
    float _1418 = -_1392;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1408, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1426 = _1410 * _1416;
    float _1428 = _1380 * _1416;
    float _1430 = _1422 * _1416;
    float _1432 = -_1414;
    float _1434 = _1432 + 0.5;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1426);
    float _1438 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1440 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1428);
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1430);
    float _1444 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1446 = exp2(_1438);
    float _1448 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1436);
    float _1450 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1440);
    float _1452 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1442);
    float _1454 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1338);
    float _1456 = _249 * _1444;
    float _1458 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1460 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1464 = _1454 + _1225;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = -_1446;
    float _1476 = _1474 + 1.0;
    float _1478 = _1464 * 0.5;
    float _1480 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _1249;
    out.gl_Position.y = _1251;
    out.gl_Position.z = _1454;
    out.gl_Position.w = _1225;
    float _1482 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1484 = _1366 * _1344;
    float _1486 = _1480 * _1424;
    out.m_58.x = _1468;
    out.m_58.y = _1470;
    out.m_58.z = _1472;
    out.m_58.w = _1466;
    float _1488 = -_1482;
    float _1490 = _1488 + 1.0;
    float _1492 = _1456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1484;
    out.m_60.y = _1486;
    out.m_62.z = _1478;
    out.m_62.w = _1225;
    out.m_45.x = _1492;
    float _1494 = _1482 * _1285;
    float _1496 = _1296 * _1490;
    float _1498 = _1296 * _1494;
    float _1500 = _1306 * _1494;
    float _1502 = fma(_1302, _1498, _1290);
    float _1504 = fma(_1304, _1498, _1292);
    float _1506 = fma(_1296, _1500, _1294);
    out.m_64.x = _1502;
    out.m_64.y = _1504;
    out.m_64.z = _1506;
    out.m_64.w = _1496;
    if (_1360)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1508 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1508;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _421 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_99);
        out.gl_Position.z = _1565;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1634 = as_type<float>(_135);
        out.gl_Position.z = _1634;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = _155 * 6.283185482025146484375;
    float _159 = floor(_155);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _157 * 0.15915493667125701904296875;
    float _173 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    bool _179 = !_163;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    bool _191 = !_153;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    int _197 = abs(_181);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _201 = -_159;
    float _203 = _155 + _201;
    bool _205 = !_167;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    int _211 = abs(_193);
    float _213 = float(_197);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_187, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_237, _235, _227);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_219;
    float _253 = _195;
    float _255 = _199;
    float _257 = _209;
    float _273;
    if (!_251)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_83);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    bool _301 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_283);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = 1.0 / _315;
    bool _327 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_283);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _311 * _323;
    float _341 = -_311;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = _337 * _343;
    float _349 = 1.0 / _319;
    float _351 = -_337;
    float _353 = _351 + 1.0;
    float _355 = _287 * _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _359 = _283 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_363, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _359 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _369 * _347;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _371 * _347;
    float _387 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _391 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _395 = fma(_387, _339, _389);
    float _397 = fma(_391, _339, _393);
    float _399 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    float _401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _403 = !_345;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_83);
        float _425 = 1.0 / _423;
        float _427 = _117 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = as_type<float>(int(gl_VertexIndex));
    float _439 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _441);
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _443);
    int _451 = as_type<int>(_437) & 1;
    bool _453 = _451 != 0;
    int _455 = as_type<int>(_437) & 2;
    bool _457 = _455 != 0;
    float _459 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
    float _461 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
    float _463 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _465 = _459 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _467 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _469 = _463 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _471 = !_457;
    float _473 = _471 ? (-0.5) : 0.5;
    float _475 = -_465;
    float _477 = _475 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _479 = -_467;
    float _481 = _479 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _483 = -_469;
    float _485 = _483 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _487 = _477 * _477;
    float _489 = fma(_481, _481, _487);
    float _491 = fma(_485, _485, _489);
    float _493 = rsqrt(_491);
    float _495 = _481 * _493;
    float _497 = _485 * _493;
    float _499 = _477 * _493;
    float _501 = in.m_56.x;
    float _503 = in.m_56.y;
    float _505 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _507 = _495 * _505;
    float _509 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _511 = _497 * _509;
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _515 = -_507;
    float _517 = fma(_497, _513, _515);
    float _519 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _521 = -_511;
    float _523 = fma(_499, _519, _521);
    float _525 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _527 = _499 * _525;
    float _529 = _517 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _533 = -_527;
    float _535 = fma(_495, _531, _533);
    float _537 = fma(_523, _523, _529);
    float _539 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _473);
    float _541 = fma(_535, _535, _537);
    float _543 = rsqrt(_541);
    float _545 = _401 * _503;
    float _547 = _399 * _501;
    float _549 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _551 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = _549 * _539;
    float _555 = _523 * _543;
    bool _557 = !_453;
    float _559 = _557 ? (-0.5) : 0.5;
    float _561 = _517 * _543;
    float _563 = _535 * _543;
    float _565 = _499 * _555;
    float _567 = _497 * _561;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _559);
    float _571 = -_565;
    float _573 = fma(_495, _561, _571);
    float _575 = -_567;
    float _577 = fma(_499, _563, _575);
    float _579 = _551 * _569;
    float _581 = _553 * _573;
    float _583 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _585 = _553 * _577;
    float _587 = fma(_579, _563, _581);
    float _589 = _495 * _563;
    float _591 = fma(_579, _555, _585);
    float _593 = fma(_583, _497, _587);
    float _595 = -_589;
    float _597 = fma(_497, _555, _595);
    float _599 = fma(_583, _495, _591);
    float _601 = _469 + _593;
    float _603 = _553 * _597;
    float _605 = _467 + _599;
    float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _609 = _601 + _607;
    float _611 = fma(_579, _561, _603);
    float _613 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _615 = _605 + _613;
    float _617 = _609 * _609;
    float _619 = fma(_583, _499, _611);
    float _621 = fma(_615, _615, _617);
    float _623 = _465 + _619;
    float _625 = sqrt(_621);
    bool _627 = _625 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _629 = _603;
    float _631 = _611;
    float _633 = _499;
    float _635 = _615;
    if (!_627)
    {
        _629 = _605;
    }
    float _637 = _629;
    float _639 = _637;
    if (!_627)
    {
        _631 = _601;
    }
    float _641 = _631;
    float _643 = _641;
    if (!_627)
    {
        _633 = _623;
    }
    float _645 = _633;
    bool _647 = !_627;
    float _649 = _645;
    if (!_647)
    {
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _655 = _625 + _653;
        float _657 = _623 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _659 = rsqrt(_621);
        float _661 = _655 * _651;
        float _663 = _661 * 0.15915493667125701904296875;
        float _665 = _663 * 6.283185482025146484375;
        float _667 = cos(_665);
        float _669 = _663 * 6.283185482025146484375;
        float _671 = sin(_669);
        float _673 = _667 + (-1.0);
        float _675 = _673 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _677 = fma(_671, _657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _679 = fma(_623, _667, _675);
        float _681 = _659 * _677;
        float _683 = fma(_615, _681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _685 = fma(_609, _681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _649 = _679;
        _639 = _683;
        _643 = _685;
    }
    float _687 = _649;
    float _689 = _639;
    float _691 = _643;
    float _693 = -_465;
    float _695 = _693 + _687;
    float _697 = -_467;
    float _699 = _697 + _689;
    float _701 = -_469;
    float _703 = _701 + _691;
    float _705 = _465 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _707 = _695 * _695;
    bool _709 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _711 = isnan(0.5);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _717 = _713 || _715;
    float _719 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[11].x, _705);
    float _721 = fma(_699, _699, _707);
    bool _723 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _731 = _727 || _729;
    float _733 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _719);
    float _735 = fma(_703, _703, _721);
    float _737 = _465 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _739 = _733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _741 = sqrt(_735);
    float _743 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[10].x, _737);
    float _745 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _743);
    float _747 = 1.0 / _739;
    float _749 = _745 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _751 = _749 + _739;
    bool _753 = _741 > 0.0;
    float _755 = _751 * _747;
    float _757 = _755 * 0.5;
    bool _759 = !_753;
    float _761 = _689;
    float _763 = _691;
    float _765 = _687;
    float _767 = _749;
    if (!_759)
    {
        float _769 = _199 * _199;
        float _771 = fma(_195, _195, _769);
        float _773 = fma(_209, _209, _771);
        float _775 = rsqrt(_735);
        float _777 = sqrt(_773);
        float _779 = _699 * _775;
        float _781 = _695 * _775;
        float _783 = _703 * _775;
        bool _785 = _777 > 0.0;
        bool _787 = !_785;
        _767 = _775;
        if (!_787)
        {
            float _789 = rsqrt(_773);
            float _791 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _793 = _199 * _789;
            float _795 = _195 * _789;
            float _797 = _781 * _793;
            float _799 = _209 * _789;
            float _801 = fma(_779, _795, _797);
            float _803 = _791 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _805 = fma(_783, _799, _801);
            float _807 = _805 * _803;
            float _809 = fma(_195, _807, _689);
            float _811 = fma(_199, _807, _687);
            float _813 = fma(_209, _807, _691);
            _761 = _809;
            _763 = _813;
            _765 = _811;
            _767 = _805;
        }
    }
    float _815 = _761;
    float _817 = _763;
    float _819 = _765;
    float _821 = _767;
    float _823 = _819;
    float _825 = _821;
    float _827 = _815;
    if (_731)
    {
        _253 = 1.0;
    }
    float _829 = _253;
    float _831 = _829;
    if (_717)
    {
        _255 = _815;
    }
    float _833 = _255;
    float _835 = _833;
    if (_717)
    {
        _257 = _817;
    }
    float _837 = _257;
    float _839 = _837;
    if (!_717)
    {
        float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _843 = _465 + _841;
        float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _847 = _467 + _845;
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _851 = -_467;
        float _853 = _851 + _815;
        float _855 = _843 * _843;
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _859 = _469 + _857;
        float _861 = -_469;
        float _863 = _861 + _817;
        float _865 = fma(_847, _847, _855);
        float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _869 = fma(_859, _859, _865);
        float _871 = sqrt(_869);
        float _873 = _849 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _875 = precise::min(_871, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _877 = _875 * _867;
        float _879 = _873 * _877;
        float _881 = -_465;
        float _883 = _881 + _819;
        float _885 = fma(_853, _879, _467);
        float _887 = fma(_883, _879, _465);
        float _889 = fma(_863, _879, _469);
        _823 = _887;
        _835 = _885;
        _839 = _889;
        _825 = _879;
        _827 = _853;
    }
    float _891 = _823;
    float _893 = _835;
    float _895 = _839;
    float _897 = _825;
    float _899 = _827;
    float _901 = _897;
    float _903 = _899;
    if (!_731)
    {
        float _905 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _907 = _905 * 0.15915493667125701904296875;
        float _909 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _913 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[30].w, _911);
        float _915 = _907 * 6.283185482025146484375;
        float _917 = cos(_915);
        float _919 = _909 * 0.15915493667125701904296875;
        float _921 = _907 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = 1.0 / _917;
        float _927 = _919 * 6.283185482025146484375;
        float _929 = cos(_927);
        float _931 = _923 * _925;
        float _933 = _919 * 6.283185482025146484375;
        float _935 = sin(_933);
        float _937 = _929 * _931;
        float _939 = 1.0 / _913;
        float _941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _943 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _941;
        float _945 = 1.0 / _937;
        float _947 = 1.0 / _943;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _951 = _939 * _949;
        float _953 = _935 * _945;
        float _955 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _957 = fma(_953, _951, _955);
        float _959 = _957 * _947;
        float _961 = precise::clamp(_959, 0.0, 1.0);
        _901 = _919;
        _903 = _945;
        _831 = _961;
    }
    float _963 = _901;
    float _965 = _903;
    float _967 = _831;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _891 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _893 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _979 = _895 + _977;
    float _981 = _971 * _971;
    float _983 = fma(_975, _975, _981);
    float _985 = fma(_979, _979, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _979 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _979;
    float _1011 = _965;
    float _1013 = _1007;
    float _1015 = _963;
    float _1017 = _971;
    if (_1003)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1019;
    }
    float _1021 = _1009;
    if (_1003)
    {
        float _1023 = rsqrt(_999);
        _1011 = _1023;
    }
    float _1025 = _1011;
    float _1027 = _1025;
    if (_1003)
    {
        float _1029 = _1007 * _1021;
        _1013 = _1029;
    }
    float _1031 = _1013;
    if (_1003)
    {
        float _1033 = _1031 * 0.15915493667125701904296875;
        _1015 = _1033;
    }
    float _1035 = _1015;
    float _1037 = _987;
    if (_1003)
    {
        float _1039 = _1035 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1047 = precise::max(0.0, _1045);
    float _1049 = _983;
    float _1051 = _1047;
    float _1053 = _1045;
    if (_1003)
    {
        float _1055 = _1035 * 6.283185482025146484375;
        float _1057 = cos(_1055);
        _1049 = _1057;
    }
    float _1059 = _1049;
    float _1061 = -_989;
    float _1063 = -_1047;
    float _1065 = fma(_971, _1061, _1063);
    if (!_1003)
    {
        _1051 = _991;
    }
    float _1067 = _1051;
    float _1069 = _1067;
    if (_1003)
    {
        float _1071 = _1065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1053 = _1071;
    }
    float _1073 = _1053;
    float _1075 = sqrt(_985);
    float _1077 = _1043;
    float _1079 = _1073;
    if (_1003)
    {
        float _1081 = fma(_1043, _1073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1017 = _1081;
    }
    float _1083 = _1017;
    float _1085 = _1083;
    if (!_1003)
    {
        _1077 = _995;
    }
    float _1087 = _1077;
    float _1089 = _1087;
    float _1091 = _1059;
    if (_1003)
    {
        float _1093 = _1059 + (-1.0);
        _1079 = _1093;
    }
    float _1095 = _1079;
    float _1097 = _1095;
    if (_1003)
    {
        float _1099 = _1025 * _1083;
        _635 = _1099;
    }
    float _1101 = _635;
    if (!_1003)
    {
        _1085 = _1065;
    }
    float _1103 = _1085;
    float _1105 = _1103;
    if (_1003)
    {
        float _1107 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1027 = _1107;
    }
    float _1109 = _1027;
    if (_1003)
    {
        float _1111 = _991 * _1101;
        _1069 = _1111;
    }
    float _1113 = _1069;
    if (!_1003)
    {
        _1097 = _993;
    }
    float _1115 = _1097;
    float _1117 = _1115;
    if (_1003)
    {
        float _1119 = _993 * _1101;
        _1117 = _1119;
    }
    float _1121 = _1117;
    if (_1003)
    {
        float _1123 = fma(_1065, _1059, _1109);
        _1105 = _1123;
    }
    float _1125 = _1105;
    if (_1003)
    {
        float _1127 = _1113 * _1113;
        _1089 = _1127;
    }
    float _1129 = _1089;
    if (!_1003)
    {
        _1091 = _997;
    }
    float _1131 = _1091;
    float _1133 = _1131;
    if (_1003)
    {
        float _1135 = _1121 * _1121;
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_1125, _1125, _1129);
    float _1141 = _1139 + _1137;
    float _1143 = _891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1147 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1145);
    float _1149 = precise::clamp(_1147, 0.0, 1.0);
    float _1151 = _891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1153 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1155 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1157 = rsqrt(_1141);
    float _1159 = _891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = -_1149;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1155);
    float _1167 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1151);
    float _1169 = _891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1175 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1167);
    float _1177 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = abs(_1163);
    float _1181 = log2(_1179);
    float _1183 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1185 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1187 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1189 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1191 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1193 = _1157 * _1113;
    float _1195 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1197 = _1157 * _1125;
    float _1199 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1195);
    float _1205 = _1157 * _1121;
    float _1207 = -_1189;
    float _1209 = fma(_1207, _1153, 1.0);
    float _1211 = -_1201;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1203);
    float _1217 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1219 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1221 = -_1205;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1225 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1215);
    float _1227 = exp2(_1217);
    float _1229 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1231 = fma(_1223, -0.5, 0.5);
    float _1233 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1219);
    float _1235 = fma(_1223, 0.5, 0.5);
    float _1237 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1229);
    float _1239 = _1197 + 1.0;
    float _1241 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1233);
    float _1243 = log2(_1209);
    float _1245 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1247 = fma(_1235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1249 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1241);
    float _1251 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1245);
    float _1253 = fma(_1235, _1247, -0.212114393711090087890625);
    float _1255 = 1.0 / _1225;
    float _1257 = -_1197;
    float _1259 = fma(_1227, _1239, _1257);
    float _1261 = fma(_1235, _1253, 1.570728778839111328125);
    float _1263 = fma(_1259, 0.5, 0.5);
    float _1265 = sqrt(_1231);
    float _1267 = _1243 * 0.693147182464599609375;
    float _1269 = _1267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1271 = _1249 * _1255;
    float _1273 = _1251 * _1255;
    float _1275 = fma(_1271, 0.5, 0.5);
    float _1277 = fma(_1273, -0.5, 0.5);
    float _1279 = _1265 * 0.636619746685028076171875;
    float _1281 = -_1261;
    float _1283 = fma(_1279, _1281, 1.0);
    float3 _3432 = float3(_1275, _1277, _1269);
    float _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3432, float3(0.0), isnan(_3432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3432, float3(0.0), isnan(_3432)), level(0.0)).x;
    float3 _3443 = float3(_1275, _1277, _1269);
    float4 _1288 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3443, float3(0.0), isnan(_3443)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3443, float3(0.0), isnan(_3443)), level(0.0)).xyzw;
    float _1290 = _1288.x;
    float _1292 = _1288.y;
    float _1294 = _1288.z;
    float _1296 = _1288.w;
    float2 _3460 = float2(_1283, _1263);
    float3 _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3460, float2(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3460, float2(0.0), isnan(_3460)), level(0.0)).xyz;
    float _1302 = _1300.x;
    float _1304 = _1300.y;
    float _1306 = _1300.z;
    float _1308 = in.m_49.y;
    bool _1310 = _137 > 0.5;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1314 = _429 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1316;
    float _1320 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1324 = _1322 != 0;
    float _1326 = 1.0 / _1318;
    float _1328 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1320);
    float _1330 = -_559;
    int _1332 = _1310 ? as_type<int>(_1330) : as_type<int>(_559);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1328);
    bool _1340 = !_1324;
    float _1342 = _1340 ? _559 : as_type<float>(_1332);
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1346;
    float _1350 = _1342 + 0.5;
    bool _1352 = _967 > 0.0;
    bool _1354 = isnan(_967);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.0);
    bool _1360 = _1356 || _1358;
    bool _1362 = _1308 > 0.5;
    float _1364 = _1314 * _1326;
    float _1366 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1368 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1370 = isnan(_429);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = fma(_1348, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1382 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1384 = isnan(_429);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1394;
    float _1398 = -_473;
    int _1400 = _1362 ? as_type<int>(_1398) : as_type<int>(_473);
    float _1402 = -_1378;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1406;
    float _1410 = fma(_1396, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1412 = !_1336;
    float _1414 = _1412 ? _473 : as_type<float>(_1400);
    float _1416 = _1392 * _1404;
    float _1418 = -_1392;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1408, _1364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1426 = _1410 * _1416;
    float _1428 = _1380 * _1416;
    float _1430 = _1422 * _1416;
    float _1432 = -_1414;
    float _1434 = _1432 + 0.5;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1426);
    float _1438 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1440 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1428);
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1430);
    float _1444 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1446 = exp2(_1438);
    float _1448 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1436);
    float _1450 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1440);
    float _1452 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1442);
    float _1454 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1338);
    float _1456 = _249 * _1444;
    float _1458 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1460 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1464 = _1454 + _1225;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = -_1446;
    float _1476 = _1474 + 1.0;
    float _1478 = _1464 * 0.5;
    float _1480 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _1249;
    out.gl_Position.y = _1251;
    out.gl_Position.z = _1454;
    out.gl_Position.w = _1225;
    float _1482 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1484 = _1366 * _1344;
    float _1486 = _1480 * _1424;
    out.m_58.x = _1468;
    out.m_58.y = _1470;
    out.m_58.z = _1472;
    out.m_58.w = _1466;
    float _1488 = -_1482;
    float _1490 = _1488 + 1.0;
    float _1492 = _1456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1484;
    out.m_60.y = _1486;
    out.m_62.z = _1478;
    out.m_62.w = _1225;
    out.m_45.x = _1492;
    float _1494 = _1482 * _1285;
    float _1496 = _1296 * _1490;
    float _1498 = _1296 * _1494;
    float _1500 = _1306 * _1494;
    float _1502 = fma(_1302, _1498, _1290);
    float _1504 = fma(_1304, _1498, _1292);
    float _1506 = fma(_1296, _1500, _1294);
    out.m_64.x = _1502;
    out.m_64.y = _1504;
    out.m_64.z = _1506;
    out.m_64.w = _1496;
    if (_1360)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1508 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1508;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

