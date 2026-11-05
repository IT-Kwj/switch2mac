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
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_60 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1644 = false;
    bool _419 = false;
    bool _273 = false;
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
        float _1803 = as_type<float>(_103);
        out.gl_Position.z = _1803;
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
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1872 = as_type<float>(_139);
        out.gl_Position.z = _1872;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _181 = !_167;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _187 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    int _195 = abs(_183);
    bool _197 = !_157;
    int _199 = _197 ? 0 : 1;
    float _201 = -_163;
    float _203 = _159 + _201;
    int _205 = abs(_199);
    float _207 = float(_195);
    float _209 = -_203;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_171;
    int _217 = _215 ? 0 : 1;
    float _219 = abs(_211);
    float _221 = _207 * _219;
    float _223 = fma(_191, 0.5, 0.5);
    int _225 = abs(_217);
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_223;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_205);
    float _237 = float(_225);
    float _239 = -_229;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    float _245 = fma(_235, _233, _221);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _251 = abs(_241);
    float _253 = fma(_237, _251, _245);
    bool _255 = !_213;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_87);
        float _277 = 1.0 / _275;
        float _279 = _121 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    bool _299 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_281);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -_297;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    bool _325 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_281);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _309 * _321;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = _335 * _341;
    float _347 = 1.0 / _317;
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = _285 * _323;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _281 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_365, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = _357 * _347;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _367 * _345;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _369 * _345;
    float _385 = fma(_375, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _389 = fma(_381, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = fma(_385, _337, _387);
    float _395 = fma(_389, _337, _391);
    float _397 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].x, _393);
    float _399 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].y, _395);
    bool _401 = !_343;
    float _417;
    if (!_401)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_87);
        float _423 = 1.0 / _421;
        float _425 = _121 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = in.m_44.x;
    float _431 = in.m_44.y;
    float _433 = in.m_44.z;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _441 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    int _449 = as_type<int>(_435) & 1;
    bool _451 = _449 != 0;
    int _453 = as_type<int>(_435) & 2;
    bool _455 = _453 != 0;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _463 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _465 = _459 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _467 = _461 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _469 = !_455;
    float _471 = _469 ? (-0.5) : 0.5;
    float _473 = -_463;
    float _475 = _473 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _477 = -_465;
    float _479 = _477 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _481 = -_467;
    float _483 = _481 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _485 = !_451;
    float _487 = _485 ? (-0.5) : 0.5;
    float _489 = _475 * _475;
    float _491 = fma(_479, _479, _489);
    float _493 = fma(_483, _483, _491);
    float _495 = rsqrt(_493);
    float _497 = _479 * _495;
    float _499 = _483 * _495;
    float _501 = _475 * _495;
    float _503 = in.m_58.x;
    float _505 = in.m_58.y;
    float _507 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _509 = _497 * _507;
    float _511 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _513 = _499 * _511;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _471);
    float _517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _519 = -_509;
    float _521 = fma(_499, _517, _519);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _525 = _501 * _523;
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _529 = -_513;
    float _531 = fma(_501, _527, _529);
    float _533 = _521 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _537 = -_525;
    float _539 = fma(_497, _535, _537);
    float _541 = fma(_531, _531, _533);
    float _543 = fma(_539, _539, _541);
    float _545 = rsqrt(_543);
    float _547 = _399 * _505;
    float _549 = _397 * _503;
    float _551 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _553 = _551 * _515;
    float _555 = _531 * _545;
    float _557 = _521 * _545;
    float _559 = _539 * _545;
    float _561 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _563 = _501 * _555;
    float _565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _487);
    float _567 = _499 * _557;
    float _569 = -_563;
    float _571 = fma(_497, _557, _569);
    float _573 = _561 * _565;
    float _575 = -_567;
    float _577 = fma(_501, _559, _575);
    float _579 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _581 = _553 * _571;
    float _583 = _553 * _577;
    float _585 = fma(_573, _559, _581);
    float _587 = _497 * _559;
    float _589 = fma(_573, _555, _583);
    float _591 = fma(_579, _499, _585);
    float _593 = -_587;
    float _595 = fma(_499, _555, _593);
    float _597 = fma(_579, _497, _589);
    float _599 = _467 + _591;
    float _601 = _553 * _595;
    float _603 = _465 + _597;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _607 = _599 + _605;
    float _609 = fma(_573, _557, _601);
    float _611 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _613 = _603 + _611;
    float _615 = _607 * _607;
    float _617 = fma(_579, _501, _609);
    float _619 = fma(_613, _613, _615);
    float _621 = _463 + _617;
    float _623 = sqrt(_619);
    bool _625 = _623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _627 = _585;
    float _629 = _603;
    float _631 = _599;
    if (!_625)
    {
        _627 = _621;
    }
    float _633 = _627;
    bool _635 = !_625;
    float _637 = _633;
    if (!_635)
    {
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _641 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _643 = _623 + _641;
        float _645 = _621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _647 = rsqrt(_619);
        float _649 = _643 * _639;
        float _651 = _649 * 0.15915493667125701904296875;
        float _653 = _651 * 6.283185482025146484375;
        float _655 = cos(_653);
        float _657 = _651 * 6.283185482025146484375;
        float _659 = sin(_657);
        float _661 = _655 + (-1.0);
        float _663 = fma(_659, _645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _665 = _661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _667 = _647 * _663;
        float _669 = fma(_621, _655, _665);
        float _671 = fma(_613, _667, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _673 = fma(_607, _667, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _637 = _669;
        _629 = _671;
        _631 = _673;
    }
    float _675 = _637;
    float _677 = _629;
    float _679 = _631;
    float _681 = -_463;
    float _683 = _681 + _675;
    float _685 = -_465;
    float _687 = _685 + _677;
    float _689 = -_467;
    float _691 = _689 + _679;
    float _693 = _463 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _695 = _683 * _683;
    bool _697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _699 = isnan(0.5);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _705 = _701 || _703;
    float _707 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[11].x, _693);
    float _709 = fma(_687, _687, _695);
    bool _711 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _713 = isnan(0.5);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _719 = _715 || _717;
    float _721 = fma(_691, _691, _709);
    float _723 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[11].z, _707);
    float _725 = _463 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _727 = sqrt(_721);
    float _729 = _723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _731 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[10].x, _725);
    float _733 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[10].z, _731);
    float _735 = 1.0 / _729;
    float _737 = _733 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _739 = _737 + _729;
    bool _741 = _727 > 0.0;
    float _743 = _739 * _735;
    float _745 = _743 * 0.5;
    bool _747 = !_741;
    float _749 = _675;
    float _751 = _679;
    float _753 = _677;
    float _755 = _687;
    float _757 = _683;
    if (!_747)
    {
        float _759 = _247 * _247;
        float _761 = fma(_243, _243, _759);
        float _763 = rsqrt(_721);
        float _765 = fma(_249, _249, _761);
        float _767 = sqrt(_765);
        float _769 = _687 * _763;
        float _771 = _683 * _763;
        float _773 = _691 * _763;
        bool _775 = _767 > 0.0;
        bool _777 = !_775;
        if (!_777)
        {
            float _779 = rsqrt(_765);
            float _781 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _783 = _247 * _779;
            float _785 = _243 * _779;
            float _787 = _249 * _779;
            float _789 = _771 * _783;
            float _791 = fma(_769, _785, _789);
            float _793 = _781 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _795 = fma(_773, _787, _791);
            float _797 = _795 * _793;
            float _799 = fma(_243, _797, _677);
            float _801 = fma(_247, _797, _675);
            float _803 = fma(_249, _797, _679);
            _749 = _801;
            _751 = _803;
            _753 = _799;
            _755 = _793;
        }
    }
    float _805 = _749;
    float _807 = _751;
    float _809 = _753;
    float _811 = _755;
    float _813 = _805;
    float _815 = _809;
    float _817 = _807;
    float _819 = _811;
    if (_719)
    {
        _757 = 1.0;
    }
    float _821 = _757;
    float _823 = _821;
    if (!_705)
    {
        float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _827 = _463 + _825;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _831 = _465 + _829;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _835 = -_463;
        float _837 = _835 + _805;
        float _839 = _827 * _827;
        float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _843 = _467 + _841;
        float _845 = -_467;
        float _847 = _845 + _807;
        float _849 = fma(_831, _831, _839);
        float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _853 = fma(_843, _843, _849);
        float _855 = sqrt(_853);
        float _857 = _833 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _859 = precise::min(_855, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _861 = _859 * _851;
        float _863 = -_465;
        float _865 = _863 + _809;
        float _867 = _857 * _861;
        float _869 = fma(_865, _867, _465);
        float _871 = fma(_837, _867, _463);
        float _873 = fma(_847, _867, _467);
        _813 = _871;
        _815 = _869;
        _817 = _873;
    }
    float _875 = _813;
    float _877 = _815;
    float _879 = _817;
    if (!_719)
    {
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _883 = _881 * 0.15915493667125701904296875;
        float _885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _889 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _887);
        float _891 = _883 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _885 * 0.15915493667125701904296875;
        float _897 = _883 * 6.283185482025146484375;
        float _899 = sin(_897);
        float _901 = 1.0 / _893;
        float _903 = _895 * 6.283185482025146484375;
        float _905 = cos(_903);
        float _907 = _899 * _901;
        float _909 = _895 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _905 * _907;
        float _915 = 1.0 / _889;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _917;
        float _921 = 1.0 / _913;
        float _923 = 1.0 / _919;
        float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _927 = _915 * _925;
        float _929 = _911 * _921;
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = fma(_929, _927, _931);
        float _935 = _933 * _923;
        float _937 = precise::clamp(_935, 0.0, 1.0);
        _819 = _883;
        _823 = _937;
    }
    float _939 = _819;
    float _941 = _823;
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _875 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _877 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _879 + _951;
    float _955 = _945 * _945;
    float _957 = fma(_949, _949, _955);
    float _959 = fma(_953, _953, _957);
    float _961 = rsqrt(_959);
    float _963 = _961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _949 * _963;
    float _967 = _953 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _953;
    float _985 = _973;
    float _987 = _981;
    float _989 = _939;
    float _991 = _963;
    if (_977)
    {
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _993;
    }
    float _995 = _983;
    if (_977)
    {
        float _997 = rsqrt(_973);
        _985 = _997;
    }
    float _999 = _985;
    if (_977)
    {
        float _1001 = _981 * _995;
        _987 = _1001;
    }
    float _1003 = _987;
    if (_977)
    {
        float _1005 = _1003 * 0.15915493667125701904296875;
        _989 = _1005;
    }
    float _1007 = _989;
    float _1009 = _955;
    float _1011 = _1007;
    if (_977)
    {
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1009 = _1015;
    }
    float _1017 = _1009;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1021 = precise::max(0.0, _1019);
    float _1023 = _961;
    float _1025 = _1021;
    float _1027 = _1019;
    if (_977)
    {
        float _1029 = _1007 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        _1023 = _1031;
    }
    float _1033 = _1023;
    float _1035 = -_963;
    float _1037 = -_1021;
    float _1039 = fma(_945, _1035, _1037);
    float _1041 = _1039;
    if (!_977)
    {
        _1025 = _965;
    }
    float _1043 = _1025;
    float _1045 = _1043;
    if (_977)
    {
        float _1047 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1027 = _1047;
    }
    float _1049 = _1027;
    float _1051 = _1017;
    float _1053 = _1049;
    if (_977)
    {
        float _1055 = fma(_1017, _1049, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1051 = _1055;
    }
    float _1057 = _1051;
    float _1059 = _1057;
    float _1061 = _1033;
    if (_977)
    {
        float _1063 = _1033 + (-1.0);
        _1053 = _1063;
    }
    float _1065 = _1053;
    float _1067 = _1065;
    if (_977)
    {
        float _1069 = _999 * _1057;
        _991 = _1069;
    }
    float _1071 = _991;
    if (!_977)
    {
        _1059 = _969;
    }
    float _1073 = _1059;
    float _1075 = sqrt(_959);
    float _1077 = _1073;
    if (_977)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1011 = _1079;
    }
    float _1081 = _1011;
    if (_977)
    {
        float _1083 = _965 * _1071;
        _1045 = _1083;
    }
    float _1085 = _1045;
    if (!_977)
    {
        _1067 = _967;
    }
    float _1087 = _1067;
    float _1089 = _1087;
    if (_977)
    {
        float _1091 = _967 * _1071;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_977)
    {
        float _1095 = fma(_1039, _1033, _1081);
        _1041 = _1095;
    }
    float _1097 = _1041;
    if (_977)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (!_977)
    {
        _1061 = _971;
    }
    float _1103 = _1061;
    float _1105 = _1103;
    if (_977)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1115 = _1111 + _1109;
    float _1117 = _875 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1121 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1119);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = _875 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = rsqrt(_1115);
    float _1129 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1117);
    float _1131 = -_1123;
    float _1133 = _1131 + 1.0;
    float _1135 = _875 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1137 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1139 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1141 = _875 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1143 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1147 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1135);
    float _1149 = abs(_1133);
    float _1151 = log2(_1149);
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1155 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1157 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1147);
    float _1159 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1141);
    float _1161 = _1127 * _1085;
    float _1163 = -_1155;
    float _1165 = fma(_1163, _1113, 1.0);
    float _1167 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1171 = _1127 * _1097;
    float _1173 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1175 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1159);
    float _1177 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1169);
    float _1179 = _1127 * _1093;
    float _1181 = -_1173;
    float _1183 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1181);
    float _1185 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1187 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1177);
    float _1189 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1191 = -_1179;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1183);
    float _1195 = log2(_1165);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1187);
    float _1199 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1193, -0.5, 0.5);
    float _1203 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1205 = fma(_1193, 0.5, 0.5);
    float _1207 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = 1.0 / _1197;
    float _1211 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1203);
    float _1213 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1215 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1217 = _1171 + 1.0;
    float _1219 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1211);
    float _1221 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1223 = fma(_1205, _1215, -0.212114393711090087890625);
    float _1225 = sqrt(_1201);
    float _1227 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1229 = _1195 * 0.693147182464599609375;
    float _1231 = fma(_1205, _1223, 1.570728778839111328125);
    float _1233 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1235 = exp2(_1189);
    float _1237 = _1221 * _1209;
    float _1239 = _1227 * _1209;
    float _1241 = fma(_1237, 0.5, 0.5);
    float _1243 = fma(_1239, -0.5, 0.5);
    float _1245 = _1225 * 0.636619746685028076171875;
    float _1247 = -_1171;
    float _1249 = fma(_1235, _1217, _1247);
    float _1251 = -_1231;
    float _1253 = fma(_1245, _1251, 1.0);
    float3 _3625 = float3(_1241, _1243, _1233);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3625, float3(0.0), isnan(_3625)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3625, float3(0.0), isnan(_3625)), level(0.0)).x;
    float _1257 = fma(_1249, 0.5, 0.5);
    float3 _3638 = float3(_1241, _1243, _1233);
    float4 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3638, float3(0.0), isnan(_3638)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3638, float3(0.0), isnan(_3638)), level(0.0)).xyzw;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = _1260.w;
    float2 _3655 = float2(_1253, _1257);
    float3 _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3655, float2(0.0), isnan(_3655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3655, float2(0.0), isnan(_3655)), level(0.0)).xyz;
    float _1274 = _1272.x;
    float _1276 = _1272.y;
    float _1278 = _1272.z;
    float _1280 = in.m_51.y;
    bool _1282 = _141 > 0.5;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1286 = _427 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1288;
    out.m_60.y = 1.0;
    float _1292 = -_247;
    float _1294 = _1292 + _875;
    float _1296 = -_249;
    float _1298 = _1296 + _879;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1302 = _1300 != 0;
    float _1304 = 1.0 / _1290;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1308 = _1306 != 0;
    float _1310 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1312 = -_243;
    float _1314 = _1312 + _877;
    bool _1316 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1318 = isnan(_427);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[643].y;
    float _1330 = -_487;
    int _1332 = _1282 ? as_type<int>(_1330) : as_type<int>(_487);
    float _1334 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1336 = exp2(_1310);
    float _1338 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[643].x, _1328);
    bool _1340 = !_1302;
    float _1342 = _1340 ? _487 : as_type<float>(_1332);
    float _1344 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1334);
    bool _1346 = _1280 > 0.5;
    float _1348 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[643].z, _1338);
    float _1350 = _1286 * _1304;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1352;
    bool _1356 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1358 = isnan(_427);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1368;
    float _1372 = -_471;
    int _1374 = _1346 ? as_type<int>(_1372) : as_type<int>(_471);
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1376;
    float _1380 = fma(_1354, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1382 = -_1366;
    float _1384 = _1382 + 1.0;
    float _1386 = fma(_1370, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1388 = fma(_1378, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1392 = _1326 * _1384;
    float _1394 = -_1326;
    float _1396 = _1394 + 1.0;
    bool _1398 = !_1308;
    float _1400 = _1398 ? _471 : as_type<float>(_1374);
    float _1402 = _463 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = _1380 * _1392;
    float _1406 = _1388 * _1392;
    float _1408 = _1386 * _1392;
    float _1410 = _463 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1404);
    float _1414 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1406);
    float _1416 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1408);
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1420 = _463 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1422 = _463 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1426 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1428 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1420);
    float _1430 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1432 = _1342 + 0.5;
    float _1434 = -_1400;
    float _1436 = _1434 + 0.5;
    float _1438 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1416);
    float _1440 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1428);
    float _1442 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1444 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1426);
    float _1446 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1412);
    float _1448 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1450 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1452 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1414);
    float _1454 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1458 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = _1448 * _1390;
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1464 = _1454 * _1418;
    float _1466 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1468 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1470 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1472 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1474 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1476 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1472);
    out.m_62.x = _1460;
    out.m_62.y = _1464;
    float _1480 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1484 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1488 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1490 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1494 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    out.m_64.x = _1480;
    out.m_64.y = _1484;
    out.m_64.z = _1486;
    out.m_64.w = _1482;
    float _1496 = _1476 + _1478;
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1488);
    float _1500 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1502 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1492);
    float _1504 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1496);
    float _1506 = _1494 + _1498;
    float _1508 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[643].w;
    float _1510 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1502);
    float _1512 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1514 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1506);
    float _1516 = -_1336;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1510);
    float _1522 = 1.0 / _1504;
    float _1524 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[640].y;
    float _1526 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[641].y;
    float _1528 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[640].x, _1524);
    float _1530 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[641].x, _1526);
    float _1532 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1344);
    float _1534 = 1.0 / _1508;
    float _1536 = _1512 + _1500;
    float _1538 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[640].z, _1528);
    float _1540 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1532);
    float _1542 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[641].z, _1530);
    float _1544 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1536);
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[640].w;
    float _1548 = _1514 * _1522;
    float _1550 = _1544 * _1522;
    float _1552 = _1520 * _1522;
    float _1554 = _1540 + _1197;
    float _1556 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[641].w;
    out.gl_Position.x = _1221;
    out.gl_Position.y = _1227;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1197;
    float _1558 = _1554 * 0.5;
    float _1560 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1562 = _1552 > 0.0;
    float _1564 = _1546 * _1534;
    float _1566 = _1556 * _1534;
    float _1568 = -_1560;
    float _1570 = _1568 + 1.0;
    bool _1572 = _1552 < 1.0;
    bool _1574 = _1572 && _1562;
    out.m_66.z = _1558;
    out.m_66.w = _1197;
    bool _1576 = _1237 > (-1.0);
    bool _1578 = _1576 && _1574;
    bool _1580 = _1239 > (-1.0);
    bool _1582 = _1580 && _1578;
    bool _1584 = _1237 < 1.0;
    bool _1586 = _1584 && _1582;
    bool _1588 = _1239 < 1.0;
    bool _1590 = _1588 && _1586;
    float _1592 = _1560 * _1255;
    float _1594 = _1268 * _1570;
    float _1596 = _1268 * _1592;
    float _1598 = _1278 * _1592;
    float _1600 = fma(_1274, _1596, _1262);
    float _1602 = fma(_1276, _1596, _1264);
    float _1604 = fma(_1268, _1598, _1266);
    float _1606 = _941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_68.x = _1600;
    out.m_68.y = _1602;
    out.m_68.z = _1604;
    out.m_68.w = _1594;
    float _1608 = _253 * _1606;
    bool _1610 = !_1590;
    float _1642;
    if (!_1610)
    {
        float _1612 = -_1550;
        float _1614 = _1239 + _1612;
        float _1616 = -_1548;
        float _1618 = _1237 + _1616;
        float _1620 = -_1564;
        float _1622 = _1237 + _1620;
        float _1624 = -_1566;
        float _1626 = _1239 + _1624;
        float _1628 = _1614 * _1614;
        float _1630 = fma(_1618, _1618, _1628);
        float _1632 = sqrt(_1630);
        bool _1634 = _1632 > 0.0;
        float _1636 = _1632;
        if (!_1634)
        {
            _1636 = _1608;
        }
        float _1638 = _1636;
        bool _1640 = !_1634;
        _1642 = _1638;
        _1644 = _1640;
        if (!_1644)
        {
            float _1646 = _1626 * _1626;
            float _1648 = fma(_1622, _1622, _1646);
            float _1650 = rsqrt(_1630);
            float _1652 = sqrt(_1648);
            float _1654 = _1618 * _1650;
            float _1656 = _1614 * _1650;
            bool _1658 = _1652 > 0.0;
            float _1660 = _1650;
            if (!_1658)
            {
                _1660 = _1608;
            }
            float _1662 = _1660;
            bool _1664 = !_1658;
            _1642 = _1662;
            _1644 = _1664;
            if (!_1644)
            {
                float _1666 = _561 * _1474;
                float _1668 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1670 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1476);
                float _1672 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1512);
                float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1494);
                float _1676 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1670);
                float _1678 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1672);
                float _1680 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1674);
                float _1682 = rsqrt(_1648);
                float _1684 = _1668 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1686 = 1.0 / _1676;
                float _1688 = _1626 * _1684;
                float _1690 = _1622 * _1684;
                float _1692 = _1688 * _1688;
                float _1694 = fma(_1690, _1690, _1692);
                float _1696 = _1678 * _1686;
                float _1698 = _1680 * _1686;
                float _1700 = sqrt(_1694);
                float _1702 = _1696 * _1696;
                float _1704 = fma(_1698, _1698, _1702);
                float _1706 = _1626 * _1682;
                float _1708 = _1622 * _1682;
                float _1710 = _1656 * _1706;
                float _1712 = sqrt(_1704);
                float _1714 = fma(_1654, _1708, _1710);
                float _1716 = precise::min(0.0, _1714);
                float _1718 = _1197 * _1716;
                float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1712);
                float _1722 = fma(_1690, _1718, _1221);
                float _1724 = fma(_1688, _1718, _1227);
                float _1726 = 1.0 / _1720;
                out.gl_Position.x = _1722;
                out.gl_Position.y = _1724;
                float _1728 = _1712 * _1726;
                out.m_60.y = _1728;
                _1642 = _1608;
                _1644 = true;
            }
        }
    }
    else
    {
        float _1730 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1730;
        _1642 = 0.0;
    }
    _1644 = false;
    float _1732 = _1642;
    bool _1734 = _941 > 0.0;
    bool _1736 = isnan(_941);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1744;
    if (_1742)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1746 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1746;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1644 = false;
    bool _419 = false;
    bool _273 = false;
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
        float _1803 = as_type<float>(_103);
        out.gl_Position.z = _1803;
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
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1872 = as_type<float>(_139);
        out.gl_Position.z = _1872;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _181 = !_167;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _187 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    int _195 = abs(_183);
    bool _197 = !_157;
    int _199 = _197 ? 0 : 1;
    float _201 = -_163;
    float _203 = _159 + _201;
    int _205 = abs(_199);
    float _207 = float(_195);
    float _209 = -_203;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_171;
    int _217 = _215 ? 0 : 1;
    float _219 = abs(_211);
    float _221 = _207 * _219;
    float _223 = fma(_191, 0.5, 0.5);
    int _225 = abs(_217);
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_223;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_205);
    float _237 = float(_225);
    float _239 = -_229;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    float _245 = fma(_235, _233, _221);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _251 = abs(_241);
    float _253 = fma(_237, _251, _245);
    bool _255 = !_213;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_87);
        float _277 = 1.0 / _275;
        float _279 = _121 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    bool _299 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_281);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -_297;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    bool _325 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_281);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _309 * _321;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = _335 * _341;
    float _347 = 1.0 / _317;
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = _285 * _323;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _281 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_365, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = _357 * _347;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _367 * _345;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _369 * _345;
    float _385 = fma(_375, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _389 = fma(_381, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = fma(_385, _337, _387);
    float _395 = fma(_389, _337, _391);
    float _397 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].x, _393);
    float _399 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].y, _395);
    bool _401 = !_343;
    float _417;
    if (!_401)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_87);
        float _423 = 1.0 / _421;
        float _425 = _121 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = in.m_44.x;
    float _431 = in.m_44.y;
    float _433 = in.m_44.z;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _441 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    int _449 = as_type<int>(_435) & 1;
    bool _451 = _449 != 0;
    int _453 = as_type<int>(_435) & 2;
    bool _455 = _453 != 0;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _463 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _465 = _459 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _467 = _461 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _469 = !_455;
    float _471 = _469 ? (-0.5) : 0.5;
    float _473 = -_463;
    float _475 = _473 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _477 = -_465;
    float _479 = _477 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _481 = -_467;
    float _483 = _481 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _485 = !_451;
    float _487 = _485 ? (-0.5) : 0.5;
    float _489 = _475 * _475;
    float _491 = fma(_479, _479, _489);
    float _493 = fma(_483, _483, _491);
    float _495 = rsqrt(_493);
    float _497 = _479 * _495;
    float _499 = _483 * _495;
    float _501 = _475 * _495;
    float _503 = in.m_58.x;
    float _505 = in.m_58.y;
    float _507 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _509 = _497 * _507;
    float _511 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _513 = _499 * _511;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _471);
    float _517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _519 = -_509;
    float _521 = fma(_499, _517, _519);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _525 = _501 * _523;
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _529 = -_513;
    float _531 = fma(_501, _527, _529);
    float _533 = _521 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _537 = -_525;
    float _539 = fma(_497, _535, _537);
    float _541 = fma(_531, _531, _533);
    float _543 = fma(_539, _539, _541);
    float _545 = rsqrt(_543);
    float _547 = _399 * _505;
    float _549 = _397 * _503;
    float _551 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _553 = _551 * _515;
    float _555 = _531 * _545;
    float _557 = _521 * _545;
    float _559 = _539 * _545;
    float _561 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _563 = _501 * _555;
    float _565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _487);
    float _567 = _499 * _557;
    float _569 = -_563;
    float _571 = fma(_497, _557, _569);
    float _573 = _561 * _565;
    float _575 = -_567;
    float _577 = fma(_501, _559, _575);
    float _579 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _581 = _553 * _571;
    float _583 = _553 * _577;
    float _585 = fma(_573, _559, _581);
    float _587 = _497 * _559;
    float _589 = fma(_573, _555, _583);
    float _591 = fma(_579, _499, _585);
    float _593 = -_587;
    float _595 = fma(_499, _555, _593);
    float _597 = fma(_579, _497, _589);
    float _599 = _467 + _591;
    float _601 = _553 * _595;
    float _603 = _465 + _597;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _607 = _599 + _605;
    float _609 = fma(_573, _557, _601);
    float _611 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _613 = _603 + _611;
    float _615 = _607 * _607;
    float _617 = fma(_579, _501, _609);
    float _619 = fma(_613, _613, _615);
    float _621 = _463 + _617;
    float _623 = sqrt(_619);
    bool _625 = _623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _627 = _585;
    float _629 = _603;
    float _631 = _599;
    if (!_625)
    {
        _627 = _621;
    }
    float _633 = _627;
    bool _635 = !_625;
    float _637 = _633;
    if (!_635)
    {
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _641 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _643 = _623 + _641;
        float _645 = _621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _647 = rsqrt(_619);
        float _649 = _643 * _639;
        float _651 = _649 * 0.15915493667125701904296875;
        float _653 = _651 * 6.283185482025146484375;
        float _655 = cos(_653);
        float _657 = _651 * 6.283185482025146484375;
        float _659 = sin(_657);
        float _661 = _655 + (-1.0);
        float _663 = fma(_659, _645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _665 = _661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _667 = _647 * _663;
        float _669 = fma(_621, _655, _665);
        float _671 = fma(_613, _667, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _673 = fma(_607, _667, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _637 = _669;
        _629 = _671;
        _631 = _673;
    }
    float _675 = _637;
    float _677 = _629;
    float _679 = _631;
    float _681 = -_463;
    float _683 = _681 + _675;
    float _685 = -_465;
    float _687 = _685 + _677;
    float _689 = -_467;
    float _691 = _689 + _679;
    float _693 = _463 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _695 = _683 * _683;
    bool _697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _699 = isnan(0.5);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _705 = _701 || _703;
    float _707 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[11].x, _693);
    float _709 = fma(_687, _687, _695);
    bool _711 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _713 = isnan(0.5);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _719 = _715 || _717;
    float _721 = fma(_691, _691, _709);
    float _723 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[11].z, _707);
    float _725 = _463 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _727 = sqrt(_721);
    float _729 = _723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _731 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[10].x, _725);
    float _733 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[10].z, _731);
    float _735 = 1.0 / _729;
    float _737 = _733 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _739 = _737 + _729;
    bool _741 = _727 > 0.0;
    float _743 = _739 * _735;
    float _745 = _743 * 0.5;
    bool _747 = !_741;
    float _749 = _675;
    float _751 = _679;
    float _753 = _677;
    float _755 = _687;
    float _757 = _683;
    if (!_747)
    {
        float _759 = _247 * _247;
        float _761 = fma(_243, _243, _759);
        float _763 = rsqrt(_721);
        float _765 = fma(_249, _249, _761);
        float _767 = sqrt(_765);
        float _769 = _687 * _763;
        float _771 = _683 * _763;
        float _773 = _691 * _763;
        bool _775 = _767 > 0.0;
        bool _777 = !_775;
        if (!_777)
        {
            float _779 = rsqrt(_765);
            float _781 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _783 = _247 * _779;
            float _785 = _243 * _779;
            float _787 = _249 * _779;
            float _789 = _771 * _783;
            float _791 = fma(_769, _785, _789);
            float _793 = _781 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _795 = fma(_773, _787, _791);
            float _797 = _795 * _793;
            float _799 = fma(_243, _797, _677);
            float _801 = fma(_247, _797, _675);
            float _803 = fma(_249, _797, _679);
            _749 = _801;
            _751 = _803;
            _753 = _799;
            _755 = _793;
        }
    }
    float _805 = _749;
    float _807 = _751;
    float _809 = _753;
    float _811 = _755;
    float _813 = _805;
    float _815 = _809;
    float _817 = _807;
    float _819 = _811;
    if (_719)
    {
        _757 = 1.0;
    }
    float _821 = _757;
    float _823 = _821;
    if (!_705)
    {
        float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _827 = _463 + _825;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _831 = _465 + _829;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _835 = -_463;
        float _837 = _835 + _805;
        float _839 = _827 * _827;
        float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _843 = _467 + _841;
        float _845 = -_467;
        float _847 = _845 + _807;
        float _849 = fma(_831, _831, _839);
        float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _853 = fma(_843, _843, _849);
        float _855 = sqrt(_853);
        float _857 = _833 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _859 = precise::min(_855, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _861 = _859 * _851;
        float _863 = -_465;
        float _865 = _863 + _809;
        float _867 = _857 * _861;
        float _869 = fma(_865, _867, _465);
        float _871 = fma(_837, _867, _463);
        float _873 = fma(_847, _867, _467);
        _813 = _871;
        _815 = _869;
        _817 = _873;
    }
    float _875 = _813;
    float _877 = _815;
    float _879 = _817;
    if (!_719)
    {
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _883 = _881 * 0.15915493667125701904296875;
        float _885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _889 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _887);
        float _891 = _883 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _885 * 0.15915493667125701904296875;
        float _897 = _883 * 6.283185482025146484375;
        float _899 = sin(_897);
        float _901 = 1.0 / _893;
        float _903 = _895 * 6.283185482025146484375;
        float _905 = cos(_903);
        float _907 = _899 * _901;
        float _909 = _895 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _905 * _907;
        float _915 = 1.0 / _889;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _917;
        float _921 = 1.0 / _913;
        float _923 = 1.0 / _919;
        float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _927 = _915 * _925;
        float _929 = _911 * _921;
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = fma(_929, _927, _931);
        float _935 = _933 * _923;
        float _937 = precise::clamp(_935, 0.0, 1.0);
        _819 = _883;
        _823 = _937;
    }
    float _939 = _819;
    float _941 = _823;
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _875 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _877 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _879 + _951;
    float _955 = _945 * _945;
    float _957 = fma(_949, _949, _955);
    float _959 = fma(_953, _953, _957);
    float _961 = rsqrt(_959);
    float _963 = _961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _949 * _963;
    float _967 = _953 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _953;
    float _985 = _973;
    float _987 = _981;
    float _989 = _939;
    float _991 = _963;
    if (_977)
    {
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _993;
    }
    float _995 = _983;
    if (_977)
    {
        float _997 = rsqrt(_973);
        _985 = _997;
    }
    float _999 = _985;
    if (_977)
    {
        float _1001 = _981 * _995;
        _987 = _1001;
    }
    float _1003 = _987;
    if (_977)
    {
        float _1005 = _1003 * 0.15915493667125701904296875;
        _989 = _1005;
    }
    float _1007 = _989;
    float _1009 = _955;
    float _1011 = _1007;
    if (_977)
    {
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1009 = _1015;
    }
    float _1017 = _1009;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1021 = precise::max(0.0, _1019);
    float _1023 = _961;
    float _1025 = _1021;
    float _1027 = _1019;
    if (_977)
    {
        float _1029 = _1007 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        _1023 = _1031;
    }
    float _1033 = _1023;
    float _1035 = -_963;
    float _1037 = -_1021;
    float _1039 = fma(_945, _1035, _1037);
    float _1041 = _1039;
    if (!_977)
    {
        _1025 = _965;
    }
    float _1043 = _1025;
    float _1045 = _1043;
    if (_977)
    {
        float _1047 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1027 = _1047;
    }
    float _1049 = _1027;
    float _1051 = _1017;
    float _1053 = _1049;
    if (_977)
    {
        float _1055 = fma(_1017, _1049, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1051 = _1055;
    }
    float _1057 = _1051;
    float _1059 = _1057;
    float _1061 = _1033;
    if (_977)
    {
        float _1063 = _1033 + (-1.0);
        _1053 = _1063;
    }
    float _1065 = _1053;
    float _1067 = _1065;
    if (_977)
    {
        float _1069 = _999 * _1057;
        _991 = _1069;
    }
    float _1071 = _991;
    if (!_977)
    {
        _1059 = _969;
    }
    float _1073 = _1059;
    float _1075 = sqrt(_959);
    float _1077 = _1073;
    if (_977)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1011 = _1079;
    }
    float _1081 = _1011;
    if (_977)
    {
        float _1083 = _965 * _1071;
        _1045 = _1083;
    }
    float _1085 = _1045;
    if (!_977)
    {
        _1067 = _967;
    }
    float _1087 = _1067;
    float _1089 = _1087;
    if (_977)
    {
        float _1091 = _967 * _1071;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_977)
    {
        float _1095 = fma(_1039, _1033, _1081);
        _1041 = _1095;
    }
    float _1097 = _1041;
    if (_977)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (!_977)
    {
        _1061 = _971;
    }
    float _1103 = _1061;
    float _1105 = _1103;
    if (_977)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1115 = _1111 + _1109;
    float _1117 = _875 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1121 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1119);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = _875 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = rsqrt(_1115);
    float _1129 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1117);
    float _1131 = -_1123;
    float _1133 = _1131 + 1.0;
    float _1135 = _875 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1137 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1139 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1141 = _875 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1143 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1147 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1135);
    float _1149 = abs(_1133);
    float _1151 = log2(_1149);
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1155 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1157 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1147);
    float _1159 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1141);
    float _1161 = _1127 * _1085;
    float _1163 = -_1155;
    float _1165 = fma(_1163, _1113, 1.0);
    float _1167 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1171 = _1127 * _1097;
    float _1173 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1175 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1159);
    float _1177 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1169);
    float _1179 = _1127 * _1093;
    float _1181 = -_1173;
    float _1183 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1181);
    float _1185 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1187 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1177);
    float _1189 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1191 = -_1179;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1183);
    float _1195 = log2(_1165);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1187);
    float _1199 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1193, -0.5, 0.5);
    float _1203 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1205 = fma(_1193, 0.5, 0.5);
    float _1207 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = 1.0 / _1197;
    float _1211 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1203);
    float _1213 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1215 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1217 = _1171 + 1.0;
    float _1219 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1211);
    float _1221 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1223 = fma(_1205, _1215, -0.212114393711090087890625);
    float _1225 = sqrt(_1201);
    float _1227 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1229 = _1195 * 0.693147182464599609375;
    float _1231 = fma(_1205, _1223, 1.570728778839111328125);
    float _1233 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1235 = exp2(_1189);
    float _1237 = _1221 * _1209;
    float _1239 = _1227 * _1209;
    float _1241 = fma(_1237, 0.5, 0.5);
    float _1243 = fma(_1239, -0.5, 0.5);
    float _1245 = _1225 * 0.636619746685028076171875;
    float _1247 = -_1171;
    float _1249 = fma(_1235, _1217, _1247);
    float _1251 = -_1231;
    float _1253 = fma(_1245, _1251, 1.0);
    float3 _3625 = float3(_1241, _1243, _1233);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3625, float3(0.0), isnan(_3625)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3625, float3(0.0), isnan(_3625)), level(0.0)).x;
    float _1257 = fma(_1249, 0.5, 0.5);
    float3 _3638 = float3(_1241, _1243, _1233);
    float4 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3638, float3(0.0), isnan(_3638)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3638, float3(0.0), isnan(_3638)), level(0.0)).xyzw;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = _1260.w;
    float2 _3655 = float2(_1253, _1257);
    float3 _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3655, float2(0.0), isnan(_3655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3655, float2(0.0), isnan(_3655)), level(0.0)).xyz;
    float _1274 = _1272.x;
    float _1276 = _1272.y;
    float _1278 = _1272.z;
    float _1280 = in.m_51.y;
    bool _1282 = _141 > 0.5;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1286 = _427 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1288;
    out.m_60.y = 1.0;
    float _1292 = -_247;
    float _1294 = _1292 + _875;
    float _1296 = -_249;
    float _1298 = _1296 + _879;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1302 = _1300 != 0;
    float _1304 = 1.0 / _1290;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1308 = _1306 != 0;
    float _1310 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1312 = -_243;
    float _1314 = _1312 + _877;
    bool _1316 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1318 = isnan(_427);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[643].y;
    float _1330 = -_487;
    int _1332 = _1282 ? as_type<int>(_1330) : as_type<int>(_487);
    float _1334 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1336 = exp2(_1310);
    float _1338 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[643].x, _1328);
    bool _1340 = !_1302;
    float _1342 = _1340 ? _487 : as_type<float>(_1332);
    float _1344 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1334);
    bool _1346 = _1280 > 0.5;
    float _1348 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[643].z, _1338);
    float _1350 = _1286 * _1304;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1352;
    bool _1356 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1358 = isnan(_427);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1368;
    float _1372 = -_471;
    int _1374 = _1346 ? as_type<int>(_1372) : as_type<int>(_471);
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1376;
    float _1380 = fma(_1354, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1382 = -_1366;
    float _1384 = _1382 + 1.0;
    float _1386 = fma(_1370, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1388 = fma(_1378, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1392 = _1326 * _1384;
    float _1394 = -_1326;
    float _1396 = _1394 + 1.0;
    bool _1398 = !_1308;
    float _1400 = _1398 ? _471 : as_type<float>(_1374);
    float _1402 = _463 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = _1380 * _1392;
    float _1406 = _1388 * _1392;
    float _1408 = _1386 * _1392;
    float _1410 = _463 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1404);
    float _1414 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1406);
    float _1416 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1408);
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1420 = _463 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1422 = _463 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1426 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1428 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1420);
    float _1430 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1432 = _1342 + 0.5;
    float _1434 = -_1400;
    float _1436 = _1434 + 0.5;
    float _1438 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1416);
    float _1440 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1428);
    float _1442 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1444 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1426);
    float _1446 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1412);
    float _1448 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1450 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1452 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1414);
    float _1454 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1458 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = _1448 * _1390;
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1464 = _1454 * _1418;
    float _1466 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1468 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1470 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1472 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1474 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1476 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1472);
    out.m_62.x = _1460;
    out.m_62.y = _1464;
    float _1480 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1484 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1488 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1490 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1494 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    out.m_64.x = _1480;
    out.m_64.y = _1484;
    out.m_64.z = _1486;
    out.m_64.w = _1482;
    float _1496 = _1476 + _1478;
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1488);
    float _1500 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1502 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1492);
    float _1504 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1496);
    float _1506 = _1494 + _1498;
    float _1508 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[643].w;
    float _1510 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1502);
    float _1512 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1514 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1506);
    float _1516 = -_1336;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1510);
    float _1522 = 1.0 / _1504;
    float _1524 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[640].y;
    float _1526 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[641].y;
    float _1528 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[640].x, _1524);
    float _1530 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[641].x, _1526);
    float _1532 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1344);
    float _1534 = 1.0 / _1508;
    float _1536 = _1512 + _1500;
    float _1538 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[640].z, _1528);
    float _1540 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1532);
    float _1542 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[641].z, _1530);
    float _1544 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1536);
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[640].w;
    float _1548 = _1514 * _1522;
    float _1550 = _1544 * _1522;
    float _1552 = _1520 * _1522;
    float _1554 = _1540 + _1197;
    float _1556 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[641].w;
    out.gl_Position.x = _1221;
    out.gl_Position.y = _1227;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1197;
    float _1558 = _1554 * 0.5;
    float _1560 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1562 = _1552 > 0.0;
    float _1564 = _1546 * _1534;
    float _1566 = _1556 * _1534;
    float _1568 = -_1560;
    float _1570 = _1568 + 1.0;
    bool _1572 = _1552 < 1.0;
    bool _1574 = _1572 && _1562;
    out.m_66.z = _1558;
    out.m_66.w = _1197;
    bool _1576 = _1237 > (-1.0);
    bool _1578 = _1576 && _1574;
    bool _1580 = _1239 > (-1.0);
    bool _1582 = _1580 && _1578;
    bool _1584 = _1237 < 1.0;
    bool _1586 = _1584 && _1582;
    bool _1588 = _1239 < 1.0;
    bool _1590 = _1588 && _1586;
    float _1592 = _1560 * _1255;
    float _1594 = _1268 * _1570;
    float _1596 = _1268 * _1592;
    float _1598 = _1278 * _1592;
    float _1600 = fma(_1274, _1596, _1262);
    float _1602 = fma(_1276, _1596, _1264);
    float _1604 = fma(_1268, _1598, _1266);
    float _1606 = _941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_68.x = _1600;
    out.m_68.y = _1602;
    out.m_68.z = _1604;
    out.m_68.w = _1594;
    float _1608 = _253 * _1606;
    bool _1610 = !_1590;
    float _1642;
    if (!_1610)
    {
        float _1612 = -_1550;
        float _1614 = _1239 + _1612;
        float _1616 = -_1548;
        float _1618 = _1237 + _1616;
        float _1620 = -_1564;
        float _1622 = _1237 + _1620;
        float _1624 = -_1566;
        float _1626 = _1239 + _1624;
        float _1628 = _1614 * _1614;
        float _1630 = fma(_1618, _1618, _1628);
        float _1632 = sqrt(_1630);
        bool _1634 = _1632 > 0.0;
        float _1636 = _1632;
        if (!_1634)
        {
            _1636 = _1608;
        }
        float _1638 = _1636;
        bool _1640 = !_1634;
        _1642 = _1638;
        _1644 = _1640;
        if (!_1644)
        {
            float _1646 = _1626 * _1626;
            float _1648 = fma(_1622, _1622, _1646);
            float _1650 = rsqrt(_1630);
            float _1652 = sqrt(_1648);
            float _1654 = _1618 * _1650;
            float _1656 = _1614 * _1650;
            bool _1658 = _1652 > 0.0;
            float _1660 = _1650;
            if (!_1658)
            {
                _1660 = _1608;
            }
            float _1662 = _1660;
            bool _1664 = !_1658;
            _1642 = _1662;
            _1644 = _1664;
            if (!_1644)
            {
                float _1666 = _561 * _1474;
                float _1668 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1670 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1476);
                float _1672 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1512);
                float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1494);
                float _1676 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1670);
                float _1678 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1672);
                float _1680 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1674);
                float _1682 = rsqrt(_1648);
                float _1684 = _1668 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1686 = 1.0 / _1676;
                float _1688 = _1626 * _1684;
                float _1690 = _1622 * _1684;
                float _1692 = _1688 * _1688;
                float _1694 = fma(_1690, _1690, _1692);
                float _1696 = _1678 * _1686;
                float _1698 = _1680 * _1686;
                float _1700 = sqrt(_1694);
                float _1702 = _1696 * _1696;
                float _1704 = fma(_1698, _1698, _1702);
                float _1706 = _1626 * _1682;
                float _1708 = _1622 * _1682;
                float _1710 = _1656 * _1706;
                float _1712 = sqrt(_1704);
                float _1714 = fma(_1654, _1708, _1710);
                float _1716 = precise::min(0.0, _1714);
                float _1718 = _1197 * _1716;
                float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1712);
                float _1722 = fma(_1690, _1718, _1221);
                float _1724 = fma(_1688, _1718, _1227);
                float _1726 = 1.0 / _1720;
                out.gl_Position.x = _1722;
                out.gl_Position.y = _1724;
                float _1728 = _1712 * _1726;
                out.m_60.y = _1728;
                _1642 = _1608;
                _1644 = true;
            }
        }
    }
    else
    {
        float _1730 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1730;
        _1642 = 0.0;
    }
    _1644 = false;
    float _1732 = _1642;
    bool _1734 = _941 > 0.0;
    bool _1736 = isnan(_941);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1744;
    if (_1742)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1746 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1746;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1644 = false;
    bool _419 = false;
    bool _273 = false;
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
        float _1803 = as_type<float>(_103);
        out.gl_Position.z = _1803;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1872 = as_type<float>(_139);
        out.gl_Position.z = _1872;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_53.x;
    float _149 = in.m_53.y;
    float _151 = in.m_53.z;
    float _153 = _145 * _143;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _181 = !_167;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _187 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    int _195 = abs(_183);
    bool _197 = !_157;
    int _199 = _197 ? 0 : 1;
    float _201 = -_163;
    float _203 = _159 + _201;
    int _205 = abs(_199);
    float _207 = float(_195);
    float _209 = -_203;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_171;
    int _217 = _215 ? 0 : 1;
    float _219 = abs(_211);
    float _221 = _207 * _219;
    float _223 = fma(_191, 0.5, 0.5);
    int _225 = abs(_217);
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_223;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_205);
    float _237 = float(_225);
    float _239 = -_229;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _185);
    float _245 = fma(_235, _233, _221);
    float _247 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _187);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    float _251 = abs(_241);
    float _253 = fma(_237, _251, _245);
    bool _255 = !_213;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_87);
        float _277 = 1.0 / _275;
        float _279 = _121 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    bool _287 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    bool _299 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_281);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -_297;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    bool _325 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_281);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _309 * _321;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = _335 * _341;
    float _347 = 1.0 / _317;
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = _285 * _323;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _281 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_365, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = _357 * _347;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _367 * _345;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _369 * _345;
    float _385 = fma(_375, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _389 = fma(_381, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = fma(_385, _337, _387);
    float _395 = fma(_389, _337, _391);
    float _397 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].x, _393);
    float _399 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[145].y, _395);
    bool _401 = !_343;
    float _417;
    if (!_401)
    {
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _405 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_87);
        float _423 = 1.0 / _421;
        float _425 = _121 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = in.m_44.x;
    float _431 = in.m_44.y;
    float _433 = in.m_44.z;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _441 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
    float _447 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    int _449 = as_type<int>(_435) & 1;
    bool _451 = _449 != 0;
    int _453 = as_type<int>(_435) & 2;
    bool _455 = _453 != 0;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _463 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _465 = _459 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _467 = _461 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _469 = !_455;
    float _471 = _469 ? (-0.5) : 0.5;
    float _473 = -_463;
    float _475 = _473 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _477 = -_465;
    float _479 = _477 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _481 = -_467;
    float _483 = _481 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _485 = !_451;
    float _487 = _485 ? (-0.5) : 0.5;
    float _489 = _475 * _475;
    float _491 = fma(_479, _479, _489);
    float _493 = fma(_483, _483, _491);
    float _495 = rsqrt(_493);
    float _497 = _479 * _495;
    float _499 = _483 * _495;
    float _501 = _475 * _495;
    float _503 = in.m_58.x;
    float _505 = in.m_58.y;
    float _507 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _509 = _497 * _507;
    float _511 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _513 = _499 * _511;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _471);
    float _517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _519 = -_509;
    float _521 = fma(_499, _517, _519);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _525 = _501 * _523;
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _529 = -_513;
    float _531 = fma(_501, _527, _529);
    float _533 = _521 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _537 = -_525;
    float _539 = fma(_497, _535, _537);
    float _541 = fma(_531, _531, _533);
    float _543 = fma(_539, _539, _541);
    float _545 = rsqrt(_543);
    float _547 = _399 * _505;
    float _549 = _397 * _503;
    float _551 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _553 = _551 * _515;
    float _555 = _531 * _545;
    float _557 = _521 * _545;
    float _559 = _539 * _545;
    float _561 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _563 = _501 * _555;
    float _565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _487);
    float _567 = _499 * _557;
    float _569 = -_563;
    float _571 = fma(_497, _557, _569);
    float _573 = _561 * _565;
    float _575 = -_567;
    float _577 = fma(_501, _559, _575);
    float _579 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _581 = _553 * _571;
    float _583 = _553 * _577;
    float _585 = fma(_573, _559, _581);
    float _587 = _497 * _559;
    float _589 = fma(_573, _555, _583);
    float _591 = fma(_579, _499, _585);
    float _593 = -_587;
    float _595 = fma(_499, _555, _593);
    float _597 = fma(_579, _497, _589);
    float _599 = _467 + _591;
    float _601 = _553 * _595;
    float _603 = _465 + _597;
    float _605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _607 = _599 + _605;
    float _609 = fma(_573, _557, _601);
    float _611 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _613 = _603 + _611;
    float _615 = _607 * _607;
    float _617 = fma(_579, _501, _609);
    float _619 = fma(_613, _613, _615);
    float _621 = _463 + _617;
    float _623 = sqrt(_619);
    bool _625 = _623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _627 = _585;
    float _629 = _603;
    float _631 = _599;
    if (!_625)
    {
        _627 = _621;
    }
    float _633 = _627;
    bool _635 = !_625;
    float _637 = _633;
    if (!_635)
    {
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _641 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _643 = _623 + _641;
        float _645 = _621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _647 = rsqrt(_619);
        float _649 = _643 * _639;
        float _651 = _649 * 0.15915493667125701904296875;
        float _653 = _651 * 6.283185482025146484375;
        float _655 = cos(_653);
        float _657 = _651 * 6.283185482025146484375;
        float _659 = sin(_657);
        float _661 = _655 + (-1.0);
        float _663 = fma(_659, _645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _665 = _661 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _667 = _647 * _663;
        float _669 = fma(_621, _655, _665);
        float _671 = fma(_613, _667, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _673 = fma(_607, _667, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _637 = _669;
        _629 = _671;
        _631 = _673;
    }
    float _675 = _637;
    float _677 = _629;
    float _679 = _631;
    float _681 = -_463;
    float _683 = _681 + _675;
    float _685 = -_465;
    float _687 = _685 + _677;
    float _689 = -_467;
    float _691 = _689 + _679;
    float _693 = _463 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _695 = _683 * _683;
    bool _697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _699 = isnan(0.5);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _705 = _701 || _703;
    float _707 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[11].x, _693);
    float _709 = fma(_687, _687, _695);
    bool _711 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _713 = isnan(0.5);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _719 = _715 || _717;
    float _721 = fma(_691, _691, _709);
    float _723 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[11].z, _707);
    float _725 = _463 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _727 = sqrt(_721);
    float _729 = _723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _731 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[10].x, _725);
    float _733 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[10].z, _731);
    float _735 = 1.0 / _729;
    float _737 = _733 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _739 = _737 + _729;
    bool _741 = _727 > 0.0;
    float _743 = _739 * _735;
    float _745 = _743 * 0.5;
    bool _747 = !_741;
    float _749 = _675;
    float _751 = _679;
    float _753 = _677;
    float _755 = _687;
    float _757 = _683;
    if (!_747)
    {
        float _759 = _247 * _247;
        float _761 = fma(_243, _243, _759);
        float _763 = rsqrt(_721);
        float _765 = fma(_249, _249, _761);
        float _767 = sqrt(_765);
        float _769 = _687 * _763;
        float _771 = _683 * _763;
        float _773 = _691 * _763;
        bool _775 = _767 > 0.0;
        bool _777 = !_775;
        if (!_777)
        {
            float _779 = rsqrt(_765);
            float _781 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _783 = _247 * _779;
            float _785 = _243 * _779;
            float _787 = _249 * _779;
            float _789 = _771 * _783;
            float _791 = fma(_769, _785, _789);
            float _793 = _781 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _795 = fma(_773, _787, _791);
            float _797 = _795 * _793;
            float _799 = fma(_243, _797, _677);
            float _801 = fma(_247, _797, _675);
            float _803 = fma(_249, _797, _679);
            _749 = _801;
            _751 = _803;
            _753 = _799;
            _755 = _793;
        }
    }
    float _805 = _749;
    float _807 = _751;
    float _809 = _753;
    float _811 = _755;
    float _813 = _805;
    float _815 = _809;
    float _817 = _807;
    float _819 = _811;
    if (_719)
    {
        _757 = 1.0;
    }
    float _821 = _757;
    float _823 = _821;
    if (!_705)
    {
        float _825 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _827 = _463 + _825;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _831 = _465 + _829;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _835 = -_463;
        float _837 = _835 + _805;
        float _839 = _827 * _827;
        float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _843 = _467 + _841;
        float _845 = -_467;
        float _847 = _845 + _807;
        float _849 = fma(_831, _831, _839);
        float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _853 = fma(_843, _843, _849);
        float _855 = sqrt(_853);
        float _857 = _833 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _859 = precise::min(_855, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _861 = _859 * _851;
        float _863 = -_465;
        float _865 = _863 + _809;
        float _867 = _857 * _861;
        float _869 = fma(_865, _867, _465);
        float _871 = fma(_837, _867, _463);
        float _873 = fma(_847, _867, _467);
        _813 = _871;
        _815 = _869;
        _817 = _873;
    }
    float _875 = _813;
    float _877 = _815;
    float _879 = _817;
    if (!_719)
    {
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _883 = _881 * 0.15915493667125701904296875;
        float _885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _889 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _887);
        float _891 = _883 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _885 * 0.15915493667125701904296875;
        float _897 = _883 * 6.283185482025146484375;
        float _899 = sin(_897);
        float _901 = 1.0 / _893;
        float _903 = _895 * 6.283185482025146484375;
        float _905 = cos(_903);
        float _907 = _899 * _901;
        float _909 = _895 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _905 * _907;
        float _915 = 1.0 / _889;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _917;
        float _921 = 1.0 / _913;
        float _923 = 1.0 / _919;
        float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _927 = _915 * _925;
        float _929 = _911 * _921;
        float _931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _933 = fma(_929, _927, _931);
        float _935 = _933 * _923;
        float _937 = precise::clamp(_935, 0.0, 1.0);
        _819 = _883;
        _823 = _937;
    }
    float _939 = _819;
    float _941 = _823;
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _875 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _877 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _879 + _951;
    float _955 = _945 * _945;
    float _957 = fma(_949, _949, _955);
    float _959 = fma(_953, _953, _957);
    float _961 = rsqrt(_959);
    float _963 = _961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _949 * _963;
    float _967 = _953 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _953;
    float _985 = _973;
    float _987 = _981;
    float _989 = _939;
    float _991 = _963;
    if (_977)
    {
        float _993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _993;
    }
    float _995 = _983;
    if (_977)
    {
        float _997 = rsqrt(_973);
        _985 = _997;
    }
    float _999 = _985;
    if (_977)
    {
        float _1001 = _981 * _995;
        _987 = _1001;
    }
    float _1003 = _987;
    if (_977)
    {
        float _1005 = _1003 * 0.15915493667125701904296875;
        _989 = _1005;
    }
    float _1007 = _989;
    float _1009 = _955;
    float _1011 = _1007;
    if (_977)
    {
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1009 = _1015;
    }
    float _1017 = _1009;
    float _1019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1021 = precise::max(0.0, _1019);
    float _1023 = _961;
    float _1025 = _1021;
    float _1027 = _1019;
    if (_977)
    {
        float _1029 = _1007 * 6.283185482025146484375;
        float _1031 = cos(_1029);
        _1023 = _1031;
    }
    float _1033 = _1023;
    float _1035 = -_963;
    float _1037 = -_1021;
    float _1039 = fma(_945, _1035, _1037);
    float _1041 = _1039;
    if (!_977)
    {
        _1025 = _965;
    }
    float _1043 = _1025;
    float _1045 = _1043;
    if (_977)
    {
        float _1047 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1027 = _1047;
    }
    float _1049 = _1027;
    float _1051 = _1017;
    float _1053 = _1049;
    if (_977)
    {
        float _1055 = fma(_1017, _1049, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1051 = _1055;
    }
    float _1057 = _1051;
    float _1059 = _1057;
    float _1061 = _1033;
    if (_977)
    {
        float _1063 = _1033 + (-1.0);
        _1053 = _1063;
    }
    float _1065 = _1053;
    float _1067 = _1065;
    if (_977)
    {
        float _1069 = _999 * _1057;
        _991 = _1069;
    }
    float _1071 = _991;
    if (!_977)
    {
        _1059 = _969;
    }
    float _1073 = _1059;
    float _1075 = sqrt(_959);
    float _1077 = _1073;
    if (_977)
    {
        float _1079 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1011 = _1079;
    }
    float _1081 = _1011;
    if (_977)
    {
        float _1083 = _965 * _1071;
        _1045 = _1083;
    }
    float _1085 = _1045;
    if (!_977)
    {
        _1067 = _967;
    }
    float _1087 = _1067;
    float _1089 = _1087;
    if (_977)
    {
        float _1091 = _967 * _1071;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_977)
    {
        float _1095 = fma(_1039, _1033, _1081);
        _1041 = _1095;
    }
    float _1097 = _1041;
    if (_977)
    {
        float _1099 = _1085 * _1085;
        _1077 = _1099;
    }
    float _1101 = _1077;
    if (!_977)
    {
        _1061 = _971;
    }
    float _1103 = _1061;
    float _1105 = _1103;
    if (_977)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1097, _1097, _1101);
    float _1113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1115 = _1111 + _1109;
    float _1117 = _875 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1121 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1119);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = _875 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = rsqrt(_1115);
    float _1129 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1117);
    float _1131 = -_1123;
    float _1133 = _1131 + 1.0;
    float _1135 = _875 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1137 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1139 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1141 = _875 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1143 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1147 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1135);
    float _1149 = abs(_1133);
    float _1151 = log2(_1149);
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1155 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1157 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1147);
    float _1159 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1141);
    float _1161 = _1127 * _1085;
    float _1163 = -_1155;
    float _1165 = fma(_1163, _1113, 1.0);
    float _1167 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1171 = _1127 * _1097;
    float _1173 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1175 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1159);
    float _1177 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1169);
    float _1179 = _1127 * _1093;
    float _1181 = -_1173;
    float _1183 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1181);
    float _1185 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1187 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1177);
    float _1189 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1191 = -_1179;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1183);
    float _1195 = log2(_1165);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1187);
    float _1199 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1201 = fma(_1193, -0.5, 0.5);
    float _1203 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1205 = fma(_1193, 0.5, 0.5);
    float _1207 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1199);
    float _1209 = 1.0 / _1197;
    float _1211 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1203);
    float _1213 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1207);
    float _1215 = fma(_1205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1217 = _1171 + 1.0;
    float _1219 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1211);
    float _1221 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1223 = fma(_1205, _1215, -0.212114393711090087890625);
    float _1225 = sqrt(_1201);
    float _1227 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1229 = _1195 * 0.693147182464599609375;
    float _1231 = fma(_1205, _1223, 1.570728778839111328125);
    float _1233 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1235 = exp2(_1189);
    float _1237 = _1221 * _1209;
    float _1239 = _1227 * _1209;
    float _1241 = fma(_1237, 0.5, 0.5);
    float _1243 = fma(_1239, -0.5, 0.5);
    float _1245 = _1225 * 0.636619746685028076171875;
    float _1247 = -_1171;
    float _1249 = fma(_1235, _1217, _1247);
    float _1251 = -_1231;
    float _1253 = fma(_1245, _1251, 1.0);
    float3 _3625 = float3(_1241, _1243, _1233);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3625, float3(0.0), isnan(_3625)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3625, float3(0.0), isnan(_3625)), level(0.0)).x;
    float _1257 = fma(_1249, 0.5, 0.5);
    float3 _3638 = float3(_1241, _1243, _1233);
    float4 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3638, float3(0.0), isnan(_3638)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3638, float3(0.0), isnan(_3638)), level(0.0)).xyzw;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = _1260.w;
    float2 _3655 = float2(_1253, _1257);
    float3 _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3655, float2(0.0), isnan(_3655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3655, float2(0.0), isnan(_3655)), level(0.0)).xyz;
    float _1274 = _1272.x;
    float _1276 = _1272.y;
    float _1278 = _1272.z;
    float _1280 = in.m_51.y;
    bool _1282 = _141 > 0.5;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1286 = _427 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1288;
    out.m_60.y = 1.0;
    float _1292 = -_247;
    float _1294 = _1292 + _875;
    float _1296 = -_249;
    float _1298 = _1296 + _879;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1302 = _1300 != 0;
    float _1304 = 1.0 / _1290;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1308 = _1306 != 0;
    float _1310 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1312 = -_243;
    float _1314 = _1312 + _877;
    bool _1316 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1318 = isnan(_427);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[643].y;
    float _1330 = -_487;
    int _1332 = _1282 ? as_type<int>(_1330) : as_type<int>(_487);
    float _1334 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1336 = exp2(_1310);
    float _1338 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[643].x, _1328);
    bool _1340 = !_1302;
    float _1342 = _1340 ? _487 : as_type<float>(_1332);
    float _1344 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1334);
    bool _1346 = _1280 > 0.5;
    float _1348 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[643].z, _1338);
    float _1350 = _1286 * _1304;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1352;
    bool _1356 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1358 = isnan(_427);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1368;
    float _1372 = -_471;
    int _1374 = _1346 ? as_type<int>(_1372) : as_type<int>(_471);
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1376;
    float _1380 = fma(_1354, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1382 = -_1366;
    float _1384 = _1382 + 1.0;
    float _1386 = fma(_1370, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1388 = fma(_1378, _1350, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1392 = _1326 * _1384;
    float _1394 = -_1326;
    float _1396 = _1394 + 1.0;
    bool _1398 = !_1308;
    float _1400 = _1398 ? _471 : as_type<float>(_1374);
    float _1402 = _463 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = _1380 * _1392;
    float _1406 = _1388 * _1392;
    float _1408 = _1386 * _1392;
    float _1410 = _463 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1404);
    float _1414 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1406);
    float _1416 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1408);
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1420 = _463 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1422 = _463 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1424 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1426 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1428 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1420);
    float _1430 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1422);
    float _1432 = _1342 + 0.5;
    float _1434 = -_1400;
    float _1436 = _1434 + 0.5;
    float _1438 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1416);
    float _1440 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1428);
    float _1442 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1444 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1426);
    float _1446 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1412);
    float _1448 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1450 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1430);
    float _1452 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1414);
    float _1454 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1458 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = _1448 * _1390;
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1464 = _1454 * _1418;
    float _1466 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1468 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1470 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1472 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1474 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1476 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1472);
    out.m_62.x = _1460;
    out.m_62.y = _1464;
    float _1480 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1484 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1488 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1490 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1494 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    out.m_64.x = _1480;
    out.m_64.y = _1484;
    out.m_64.z = _1486;
    out.m_64.w = _1482;
    float _1496 = _1476 + _1478;
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1488);
    float _1500 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1502 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1492);
    float _1504 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1496);
    float _1506 = _1494 + _1498;
    float _1508 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[643].w;
    float _1510 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1502);
    float _1512 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1514 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1506);
    float _1516 = -_1336;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1510);
    float _1522 = 1.0 / _1504;
    float _1524 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[640].y;
    float _1526 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[641].y;
    float _1528 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[640].x, _1524);
    float _1530 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[641].x, _1526);
    float _1532 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1344);
    float _1534 = 1.0 / _1508;
    float _1536 = _1512 + _1500;
    float _1538 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[640].z, _1528);
    float _1540 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1532);
    float _1542 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[641].z, _1530);
    float _1544 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1536);
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[640].w;
    float _1548 = _1514 * _1522;
    float _1550 = _1544 * _1522;
    float _1552 = _1520 * _1522;
    float _1554 = _1540 + _1197;
    float _1556 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[641].w;
    out.gl_Position.x = _1221;
    out.gl_Position.y = _1227;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1197;
    float _1558 = _1554 * 0.5;
    float _1560 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1562 = _1552 > 0.0;
    float _1564 = _1546 * _1534;
    float _1566 = _1556 * _1534;
    float _1568 = -_1560;
    float _1570 = _1568 + 1.0;
    bool _1572 = _1552 < 1.0;
    bool _1574 = _1572 && _1562;
    out.m_66.z = _1558;
    out.m_66.w = _1197;
    bool _1576 = _1237 > (-1.0);
    bool _1578 = _1576 && _1574;
    bool _1580 = _1239 > (-1.0);
    bool _1582 = _1580 && _1578;
    bool _1584 = _1237 < 1.0;
    bool _1586 = _1584 && _1582;
    bool _1588 = _1239 < 1.0;
    bool _1590 = _1588 && _1586;
    float _1592 = _1560 * _1255;
    float _1594 = _1268 * _1570;
    float _1596 = _1268 * _1592;
    float _1598 = _1278 * _1592;
    float _1600 = fma(_1274, _1596, _1262);
    float _1602 = fma(_1276, _1596, _1264);
    float _1604 = fma(_1268, _1598, _1266);
    float _1606 = _941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_68.x = _1600;
    out.m_68.y = _1602;
    out.m_68.z = _1604;
    out.m_68.w = _1594;
    float _1608 = _253 * _1606;
    bool _1610 = !_1590;
    float _1642;
    if (!_1610)
    {
        float _1612 = -_1550;
        float _1614 = _1239 + _1612;
        float _1616 = -_1548;
        float _1618 = _1237 + _1616;
        float _1620 = -_1564;
        float _1622 = _1237 + _1620;
        float _1624 = -_1566;
        float _1626 = _1239 + _1624;
        float _1628 = _1614 * _1614;
        float _1630 = fma(_1618, _1618, _1628);
        float _1632 = sqrt(_1630);
        bool _1634 = _1632 > 0.0;
        float _1636 = _1632;
        if (!_1634)
        {
            _1636 = _1608;
        }
        float _1638 = _1636;
        bool _1640 = !_1634;
        _1642 = _1638;
        _1644 = _1640;
        if (!_1644)
        {
            float _1646 = _1626 * _1626;
            float _1648 = fma(_1622, _1622, _1646);
            float _1650 = rsqrt(_1630);
            float _1652 = sqrt(_1648);
            float _1654 = _1618 * _1650;
            float _1656 = _1614 * _1650;
            bool _1658 = _1652 > 0.0;
            float _1660 = _1650;
            if (!_1658)
            {
                _1660 = _1608;
            }
            float _1662 = _1660;
            bool _1664 = !_1658;
            _1642 = _1662;
            _1644 = _1664;
            if (!_1644)
            {
                float _1666 = _561 * _1474;
                float _1668 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1670 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1476);
                float _1672 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1512);
                float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1494);
                float _1676 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1670);
                float _1678 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1672);
                float _1680 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1674);
                float _1682 = rsqrt(_1648);
                float _1684 = _1668 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1686 = 1.0 / _1676;
                float _1688 = _1626 * _1684;
                float _1690 = _1622 * _1684;
                float _1692 = _1688 * _1688;
                float _1694 = fma(_1690, _1690, _1692);
                float _1696 = _1678 * _1686;
                float _1698 = _1680 * _1686;
                float _1700 = sqrt(_1694);
                float _1702 = _1696 * _1696;
                float _1704 = fma(_1698, _1698, _1702);
                float _1706 = _1626 * _1682;
                float _1708 = _1622 * _1682;
                float _1710 = _1656 * _1706;
                float _1712 = sqrt(_1704);
                float _1714 = fma(_1654, _1708, _1710);
                float _1716 = precise::min(0.0, _1714);
                float _1718 = _1197 * _1716;
                float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1712);
                float _1722 = fma(_1690, _1718, _1221);
                float _1724 = fma(_1688, _1718, _1227);
                float _1726 = 1.0 / _1720;
                out.gl_Position.x = _1722;
                out.gl_Position.y = _1724;
                float _1728 = _1712 * _1726;
                out.m_60.y = _1728;
                _1642 = _1608;
                _1644 = true;
            }
        }
    }
    else
    {
        float _1730 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1730;
        _1642 = 0.0;
    }
    _1644 = false;
    float _1732 = _1642;
    bool _1734 = _941 > 0.0;
    bool _1736 = isnan(_941);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1744;
    if (_1742)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1746 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1746;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

