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
    float4 m_58 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _467 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1380 = as_type<float>(_101);
        out.gl_Position.z = _1380;
    }
    if (!_89)
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
        float _119 = float(_85);
        _95 = _119;
    }
    float _121 = _95;
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
    int _133 = 0;
    if (_127)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1449 = as_type<float>(_137);
        out.gl_Position.z = _1449;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = floor(_157);
    float _161 = _157 * 6.283185482025146484375;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    bool _185 = !_169;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _191 = _175 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_187);
    float _201 = -_159;
    float _203 = _157 + _201;
    int _205 = abs(_181);
    bool _207 = !_155;
    int _209 = _207 ? 0 : 1;
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _217 = abs(_209);
    float _219 = float(_205);
    float _221 = fma(_193, 0.5, 0.5);
    bool _223 = _203 < 0.5;
    float _225 = float(_223);
    float _227 = abs(_213);
    float _229 = _219 * _227;
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_217);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_199);
    float _243 = fma(_235, _233, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_215;
    float _255 = _245;
    float _257 = _197;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    bool _293 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_283);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _283 + _317;
    float _321 = 1.0 / _311;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _307;
    float _327 = 1.0 / _315;
    float _329 = _319 * _321;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _287 * _325;
    bool _345 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_283);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -_303;
    float _359 = _357 + 1.0;
    float _361 = _355 * _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _291 * _327;
    bool _369 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_283);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_355;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _379 * _383;
    float _399 = -_379;
    float _401 = _399 + 1.0;
    float _403 = fma(_387, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_391, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = _341 * _401;
    float _409 = fma(_365, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = fma(_395, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -_341;
    float _415 = _413 + 1.0;
    float _417 = _403 * _407;
    float _419 = _405 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _425;
    float _429 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _433 = fma(_423, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_427, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _437 = fma(_409, _397, _429);
    float _439 = fma(_411, _397, _431);
    float _441 = fma(_433, _361, _437);
    float _443 = fma(_435, _361, _439);
    float _445 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _441);
    float _447 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _443);
    bool _449 = !_323;
    float _465;
    if (!_449)
    {
        float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _453 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _455 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _457 = _455 * _451;
        float _459 = floor(_457);
        float _461 = -_459;
        float _463 = _457 + _461;
        _465 = _463;
        _467 = true;
    }
    else
    {
        float _469 = float(_85);
        float _471 = 1.0 / _469;
        float _473 = _117 * _471;
        _465 = _473;
    }
    _467 = false;
    float _475 = _465;
    float _477 = as_type<float>(int(gl_VertexIndex));
    float _479 = in.m_56.x;
    float _481 = in.m_56.y;
    float _483 = in.m_42.x;
    float _485 = in.m_42.y;
    float _487 = in.m_42.z;
    int _489 = as_type<int>(_477) & 1;
    bool _491 = _489 != 0;
    int _493 = as_type<int>(_477) & 2;
    bool _495 = _493 != 0;
    float _497 = _447 * _481;
    float _499 = _445 * _479;
    bool _501 = !_495;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _507 = _251 * _497;
    float _509 = _251 * _499;
    bool _511 = !_491;
    float _513 = _511 ? (-0.5) : 0.5;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _513);
    float _523 = _517 * _515;
    float _525 = _485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _519 * _521;
    float _529 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _531 = _485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _533 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _535 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
    float _541 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
    float _545 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
    float _547 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = _541 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _551 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
    float _553 = _545 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _555 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = _485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _559 = _551 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _561 = _549 + _553;
    float _563 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _565 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
    float _567 = _555 + _559;
    float _569 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _571 = _561 + _569;
    float _573 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _563);
    float _575 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
    float _577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _579 = _567 + _577;
    float _581 = _571 * _571;
    float _583 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].z, _573);
    float _585 = _575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = fma(_579, _579, _581);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_587);
    float _593 = _585 + _589;
    bool _595 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _597 = _581;
    float _599 = _487;
    float _601 = _589;
    if (!_595)
    {
        _597 = _567;
    }
    float _603 = _597;
    float _605 = _603;
    if (!_595)
    {
        _599 = _561;
    }
    float _607 = _599;
    float _609 = _607;
    if (!_595)
    {
        _601 = _593;
    }
    float _611 = _601;
    bool _613 = !_595;
    float _615 = _611;
    if (!_613)
    {
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _621 = _591 + _619;
        float _623 = _593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _625 = rsqrt(_587);
        float _627 = _621 * _617;
        float _629 = _627 * 0.15915493667125701904296875;
        float _631 = _629 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _629 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = _633 + (-1.0);
        float _641 = _639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = fma(_637, _623, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = fma(_593, _633, _641);
        float _647 = _625 * _643;
        float _649 = fma(_579, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _651 = fma(_571, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _615 = _645;
        _605 = _649;
        _609 = _651;
    }
    float _653 = _615;
    float _655 = _605;
    float _657 = _609;
    float _659 = -_585;
    float _661 = _659 + _653;
    float _663 = -_555;
    float _665 = _663 + _655;
    float _667 = -_549;
    float _669 = _667 + _657;
    float _671 = _661 * _661;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = fma(_665, _665, _671);
    float _685 = fma(_669, _669, _683);
    float _687 = sqrt(_685);
    bool _689 = _687 > 0.0;
    bool _691 = !_689;
    float _693 = _655;
    float _695 = _657;
    float _697 = _653;
    float _699 = _687;
    if (!_691)
    {
        float _701 = _245 * _245;
        float _703 = fma(_197, _197, _701);
        float _705 = fma(_247, _247, _703);
        float _707 = rsqrt(_685);
        float _709 = sqrt(_705);
        float _711 = _665 * _707;
        float _713 = _661 * _707;
        bool _715 = _709 > 0.0;
        float _717 = _669 * _707;
        bool _719 = !_715;
        _699 = _707;
        if (!_719)
        {
            float _721 = rsqrt(_705);
            float _723 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _725 = _245 * _721;
            float _727 = _197 * _721;
            float _729 = _247 * _721;
            float _731 = _713 * _725;
            float _733 = fma(_711, _727, _731);
            float _735 = _723 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _737 = fma(_717, _729, _733);
            float _739 = _737 * _735;
            float _741 = fma(_197, _739, _655);
            float _743 = fma(_245, _739, _653);
            float _745 = fma(_247, _739, _657);
            _693 = _741;
            _695 = _745;
            _697 = _743;
            _699 = _739;
        }
    }
    float _747 = _693;
    float _749 = _695;
    float _751 = _697;
    float _753 = _699;
    float _755 = _751;
    if (_681)
    {
        _255 = _747;
    }
    float _757 = _255;
    float _759 = _757;
    if (_681)
    {
        _257 = _749;
    }
    float _761 = _257;
    float _763 = _761;
    if (!_681)
    {
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _767 = _585 + _765;
        float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _771 = _555 + _769;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _775 = -_585;
        float _777 = _775 + _751;
        float _779 = _767 * _767;
        float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _783 = _549 + _781;
        float _785 = -_549;
        float _787 = _785 + _749;
        float _789 = fma(_771, _771, _779);
        float _791 = -_555;
        float _793 = _791 + _747;
        float _795 = fma(_783, _783, _789);
        float _797 = sqrt(_795);
        float _799 = precise::min(_797, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _801 = _799 * _773;
        float _803 = fma(_793, _801, _555);
        float _805 = fma(_777, _801, _585);
        float _807 = fma(_787, _801, _549);
        _755 = _805;
        _759 = _803;
        _763 = _807;
    }
    float _809 = _755;
    float _811 = _759;
    float _813 = _763;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = _809 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _821 = _811 + _819;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _813 + _823;
    float _827 = _817 * _817;
    float _829 = fma(_821, _821, _827);
    float _831 = fma(_825, _825, _829);
    float _833 = rsqrt(_831);
    float _835 = sqrt(_831);
    float _837 = _833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _839 = _821 * _837;
    float _841 = _825 * _837;
    float _843 = _839 * _839;
    float _845 = _841 * _841;
    float _847 = _843 + _845;
    float _849 = sqrt(_847);
    bool _851 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _849 + _853;
    float _857 = _753;
    float _859 = _847;
    float _861 = _855;
    float _863 = _817;
    float _865 = _837;
    float _867 = _839;
    if (_851)
    {
        float _869 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _857 = _869;
    }
    float _871 = _857;
    if (_851)
    {
        float _873 = rsqrt(_847);
        _859 = _873;
    }
    float _875 = _859;
    float _877 = _871;
    float _879 = _875;
    if (_851)
    {
        float _881 = _855 * _871;
        _861 = _881;
    }
    float _883 = _861;
    if (_851)
    {
        float _885 = _883 * 0.15915493667125701904296875;
        _877 = _885;
    }
    float _887 = _877;
    float _889 = _825;
    float _891 = _887;
    if (_851)
    {
        float _893 = _887 * 6.283185482025146484375;
        float _895 = sin(_893);
        _889 = _895;
    }
    float _897 = _889;
    float _899 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _901 = precise::max(0.0, _899);
    float _903 = _747;
    float _905 = _901;
    if (_851)
    {
        float _907 = _887 * 6.283185482025146484375;
        float _909 = cos(_907);
        _903 = _909;
    }
    float _911 = _903;
    float _913 = -_837;
    float _915 = -_901;
    float _917 = fma(_817, _913, _915);
    if (_851)
    {
        float _919 = _917 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _863 = _919;
    }
    float _921 = _863;
    float _923 = _897;
    float _925 = _921;
    if (_851)
    {
        float _927 = fma(_897, _921, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _923 = _927;
    }
    float _929 = _923;
    float _931 = _929;
    if (!_851)
    {
        _925 = _841;
    }
    float _933 = _925;
    float _935 = _933;
    if (_851)
    {
        float _937 = _911 + (-1.0);
        _905 = _937;
    }
    float _939 = _905;
    float _941 = _939;
    if (_851)
    {
        float _943 = _875 * _929;
        _865 = _943;
    }
    float _945 = _865;
    if (!_851)
    {
        _931 = _917;
    }
    float _947 = _931;
    float _949 = _947;
    if (_851)
    {
        float _951 = _939 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _891 = _951;
    }
    float _953 = _891;
    if (_851)
    {
        float _955 = _839 * _945;
        _867 = _955;
    }
    float _957 = _867;
    if (!_851)
    {
        _879 = _843;
    }
    float _959 = _879;
    float _961 = _959;
    if (_851)
    {
        float _963 = _841 * _945;
        _935 = _963;
    }
    float _965 = _935;
    if (_851)
    {
        float _967 = fma(_917, _911, _953);
        _949 = _967;
    }
    float _969 = _949;
    if (_851)
    {
        float _971 = _957 * _957;
        _961 = _971;
    }
    float _973 = _961;
    if (!_851)
    {
        _941 = _845;
    }
    float _975 = _941;
    float _977 = _975;
    if (_851)
    {
        float _979 = _965 * _965;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = fma(_969, _969, _973);
    float _985 = _983 + _981;
    float _987 = _809 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _991 = fma(_835, (*spvDescriptorSet0.vp_c15)._m0[23].w, _989);
    float _993 = precise::clamp(_991, 0.0, 1.0);
    float _995 = _809 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _999 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[2].x, _987);
    float _1001 = rsqrt(_985);
    float _1003 = -_993;
    float _1005 = _1003 + 1.0;
    float _1007 = _809 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1009 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[1].x, _995);
    float _1011 = _809 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1013 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1015 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1007);
    float _1017 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1009);
    float _1019 = abs(_1005);
    float _1021 = log2(_1019);
    float _1023 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1011);
    float _1025 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1015);
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1029 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1031 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1023);
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1037 = _1001 * _957;
    float _1039 = _1001 * _969;
    float _1041 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1035);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1047 = _1001 * _965;
    float _1049 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1043);
    float _1053 = -_1045;
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1053);
    float _1057 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1059 = -_1049;
    float _1061 = fma(_1059, _997, 1.0);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1051);
    float _1065 = -_1047;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1055);
    float _1069 = exp2(_1057);
    float _1071 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1073 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1075 = fma(_1067, -0.5, 0.5);
    float _1077 = fma(_1067, 0.5, 0.5);
    float _1079 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1071);
    float _1081 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1073);
    float _1083 = _1039 + 1.0;
    float _1085 = log2(_1061);
    float _1087 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1079);
    float _1089 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1081);
    float _1091 = fma(_1077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1093 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1087);
    float _1095 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1089);
    float _1097 = fma(_1077, _1091, -0.212114393711090087890625);
    float _1099 = 1.0 / _1063;
    float _1101 = -_1039;
    float _1103 = fma(_1069, _1083, _1101);
    float _1105 = fma(_1077, _1097, 1.570728778839111328125);
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = sqrt(_1075);
    float _1111 = _1085 * 0.693147182464599609375;
    float _1113 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1115 = _1093 * _1099;
    float _1117 = _1095 * _1099;
    float _1119 = fma(_1115, 0.5, 0.5);
    float _1121 = fma(_1117, -0.5, 0.5);
    float _1123 = _1109 * 0.636619746685028076171875;
    float _1125 = -_1105;
    float _1127 = fma(_1123, _1125, 1.0);
    float3 _3037 = float3(_1119, _1121, _1113);
    float _1129 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3037, float3(0.0), isnan(_3037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3037, float3(0.0), isnan(_3037)), level(0.0)).x;
    float3 _3048 = float3(_1119, _1121, _1113);
    float4 _1132 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3048, float3(0.0), isnan(_3048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3048, float3(0.0), isnan(_3048)), level(0.0)).xyzw;
    float _1134 = _1132.x;
    float _1136 = _1132.y;
    float _1138 = _1132.z;
    float _1140 = _1132.w;
    float2 _3065 = float2(_1127, _1107);
    float3 _1144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3065, float2(0.0), isnan(_3065)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3065, float2(0.0), isnan(_3065)), level(0.0)).xyz;
    float _1146 = _1144.x;
    float _1148 = _1144.y;
    float _1150 = _1144.z;
    float _1152 = in.m_49.y;
    float _1154 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1158 = _139 > 0.5;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1164;
    float _1168 = -_513;
    int _1170 = _1158 ? as_type<int>(_1168) : as_type<int>(_513);
    float _1172 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1154);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1176 = _1174 != 0;
    float _1178 = 1.0 / _1162;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1182 = _1180 != 0;
    float _1184 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1172);
    bool _1186 = !_1176;
    float _1188 = _1186 ? _513 : as_type<float>(_1170);
    bool _1190 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1192 = isnan(_475);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1184);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1206 = _1188 + 0.5;
    float _1208 = _1202 + _1063;
    bool _1210 = _1152 > 0.5;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1214 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1216 = isnan(_475);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1228 = _1166 * _1178;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1232 = _475 + _1230;
    float _1234 = -_1224;
    float _1236 = _1234 + 1.0;
    float _1238 = -_503;
    int _1240 = _1210 ? as_type<int>(_1238) : as_type<int>(_503);
    float _1242 = fma(_1228, _1232, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1244 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1246 = _1200 * _1236;
    float _1248 = -_1200;
    float _1250 = _1248 + 1.0;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1254 = !_1182;
    float _1256 = _1254 ? _503 : as_type<float>(_1240);
    float _1258 = _1242 * _1246;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1258);
    float _1266 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1268 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = -_1256;
    float _1272 = _1270 + 0.5;
    float _1274 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1264);
    float _1276 = exp2(_1266);
    float _1278 = _1244 * _1156;
    out.m_58.x = _1260;
    out.m_58.y = _1262;
    out.m_58.z = _1268;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1284 = _1280 * _1204;
    float _1286 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1278;
    out.m_60.y = _1284;
    float _1288 = -_1276;
    float _1290 = _1288 + 1.0;
    out.gl_Position.x = _1093;
    out.gl_Position.y = _1095;
    out.gl_Position.z = _1202;
    out.gl_Position.w = _1063;
    float _1292 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1298 = _1208 * 0.5;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = -_1292;
    float _1308 = _1306 + 1.0;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1286;
    out.m_62.x = _1302;
    out.m_62.y = _1304;
    out.m_62.z = _1310;
    out.m_62.w = _1282;
    out.m_64.z = _1298;
    out.m_64.w = _1063;
    float _1312 = _1292 * _1129;
    float _1314 = _1140 * _1308;
    float _1316 = _1140 * _1312;
    float _1318 = _1150 * _1312;
    float _1320 = fma(_1146, _1316, _1134);
    float _1322 = fma(_1148, _1316, _1136);
    float _1324 = fma(_1140, _1318, _1138);
    out.m_66.x = _1320;
    out.m_66.y = _1322;
    out.m_66.z = _1324;
    out.m_66.w = _1314;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _467 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1380 = as_type<float>(_101);
        out.gl_Position.z = _1380;
    }
    if (!_89)
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
        float _119 = float(_85);
        _95 = _119;
    }
    float _121 = _95;
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
    int _133 = 0;
    if (_127)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1449 = as_type<float>(_137);
        out.gl_Position.z = _1449;
    }
    if (_127)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = floor(_157);
    float _161 = _157 * 6.283185482025146484375;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    bool _185 = !_169;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _191 = _175 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_187);
    float _201 = -_159;
    float _203 = _157 + _201;
    int _205 = abs(_181);
    bool _207 = !_155;
    int _209 = _207 ? 0 : 1;
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _217 = abs(_209);
    float _219 = float(_205);
    float _221 = fma(_193, 0.5, 0.5);
    bool _223 = _203 < 0.5;
    float _225 = float(_223);
    float _227 = abs(_213);
    float _229 = _219 * _227;
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_217);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_199);
    float _243 = fma(_235, _233, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_215;
    float _255 = _245;
    float _257 = _197;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    bool _293 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_283);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _283 + _317;
    float _321 = 1.0 / _311;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _307;
    float _327 = 1.0 / _315;
    float _329 = _319 * _321;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _287 * _325;
    bool _345 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_283);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -_303;
    float _359 = _357 + 1.0;
    float _361 = _355 * _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _291 * _327;
    bool _369 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_283);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_355;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _379 * _383;
    float _399 = -_379;
    float _401 = _399 + 1.0;
    float _403 = fma(_387, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_391, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = _341 * _401;
    float _409 = fma(_365, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = fma(_395, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -_341;
    float _415 = _413 + 1.0;
    float _417 = _403 * _407;
    float _419 = _405 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _425;
    float _429 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _433 = fma(_423, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_427, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _437 = fma(_409, _397, _429);
    float _439 = fma(_411, _397, _431);
    float _441 = fma(_433, _361, _437);
    float _443 = fma(_435, _361, _439);
    float _445 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _441);
    float _447 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _443);
    bool _449 = !_323;
    float _465;
    if (!_449)
    {
        float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _453 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _455 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _457 = _455 * _451;
        float _459 = floor(_457);
        float _461 = -_459;
        float _463 = _457 + _461;
        _465 = _463;
        _467 = true;
    }
    else
    {
        float _469 = float(_85);
        float _471 = 1.0 / _469;
        float _473 = _117 * _471;
        _465 = _473;
    }
    _467 = false;
    float _475 = _465;
    float _477 = as_type<float>(int(gl_VertexIndex));
    float _479 = in.m_56.x;
    float _481 = in.m_56.y;
    float _483 = in.m_42.x;
    float _485 = in.m_42.y;
    float _487 = in.m_42.z;
    int _489 = as_type<int>(_477) & 1;
    bool _491 = _489 != 0;
    int _493 = as_type<int>(_477) & 2;
    bool _495 = _493 != 0;
    float _497 = _447 * _481;
    float _499 = _445 * _479;
    bool _501 = !_495;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _507 = _251 * _497;
    float _509 = _251 * _499;
    bool _511 = !_491;
    float _513 = _511 ? (-0.5) : 0.5;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _513);
    float _523 = _517 * _515;
    float _525 = _485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _519 * _521;
    float _529 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _531 = _485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _533 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _535 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
    float _541 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
    float _545 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
    float _547 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = _541 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _551 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
    float _553 = _545 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _555 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = _485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _559 = _551 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _561 = _549 + _553;
    float _563 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _565 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
    float _567 = _555 + _559;
    float _569 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _571 = _561 + _569;
    float _573 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _563);
    float _575 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
    float _577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _579 = _567 + _577;
    float _581 = _571 * _571;
    float _583 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].z, _573);
    float _585 = _575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = fma(_579, _579, _581);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_587);
    float _593 = _585 + _589;
    bool _595 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _597 = _581;
    float _599 = _487;
    float _601 = _589;
    if (!_595)
    {
        _597 = _567;
    }
    float _603 = _597;
    float _605 = _603;
    if (!_595)
    {
        _599 = _561;
    }
    float _607 = _599;
    float _609 = _607;
    if (!_595)
    {
        _601 = _593;
    }
    float _611 = _601;
    bool _613 = !_595;
    float _615 = _611;
    if (!_613)
    {
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _621 = _591 + _619;
        float _623 = _593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _625 = rsqrt(_587);
        float _627 = _621 * _617;
        float _629 = _627 * 0.15915493667125701904296875;
        float _631 = _629 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _629 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = _633 + (-1.0);
        float _641 = _639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = fma(_637, _623, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = fma(_593, _633, _641);
        float _647 = _625 * _643;
        float _649 = fma(_579, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _651 = fma(_571, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _615 = _645;
        _605 = _649;
        _609 = _651;
    }
    float _653 = _615;
    float _655 = _605;
    float _657 = _609;
    float _659 = -_585;
    float _661 = _659 + _653;
    float _663 = -_555;
    float _665 = _663 + _655;
    float _667 = -_549;
    float _669 = _667 + _657;
    float _671 = _661 * _661;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = fma(_665, _665, _671);
    float _685 = fma(_669, _669, _683);
    float _687 = sqrt(_685);
    bool _689 = _687 > 0.0;
    bool _691 = !_689;
    float _693 = _655;
    float _695 = _657;
    float _697 = _653;
    float _699 = _687;
    if (!_691)
    {
        float _701 = _245 * _245;
        float _703 = fma(_197, _197, _701);
        float _705 = fma(_247, _247, _703);
        float _707 = rsqrt(_685);
        float _709 = sqrt(_705);
        float _711 = _665 * _707;
        float _713 = _661 * _707;
        bool _715 = _709 > 0.0;
        float _717 = _669 * _707;
        bool _719 = !_715;
        _699 = _707;
        if (!_719)
        {
            float _721 = rsqrt(_705);
            float _723 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _725 = _245 * _721;
            float _727 = _197 * _721;
            float _729 = _247 * _721;
            float _731 = _713 * _725;
            float _733 = fma(_711, _727, _731);
            float _735 = _723 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _737 = fma(_717, _729, _733);
            float _739 = _737 * _735;
            float _741 = fma(_197, _739, _655);
            float _743 = fma(_245, _739, _653);
            float _745 = fma(_247, _739, _657);
            _693 = _741;
            _695 = _745;
            _697 = _743;
            _699 = _739;
        }
    }
    float _747 = _693;
    float _749 = _695;
    float _751 = _697;
    float _753 = _699;
    float _755 = _751;
    if (_681)
    {
        _255 = _747;
    }
    float _757 = _255;
    float _759 = _757;
    if (_681)
    {
        _257 = _749;
    }
    float _761 = _257;
    float _763 = _761;
    if (!_681)
    {
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _767 = _585 + _765;
        float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _771 = _555 + _769;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _775 = -_585;
        float _777 = _775 + _751;
        float _779 = _767 * _767;
        float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _783 = _549 + _781;
        float _785 = -_549;
        float _787 = _785 + _749;
        float _789 = fma(_771, _771, _779);
        float _791 = -_555;
        float _793 = _791 + _747;
        float _795 = fma(_783, _783, _789);
        float _797 = sqrt(_795);
        float _799 = precise::min(_797, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _801 = _799 * _773;
        float _803 = fma(_793, _801, _555);
        float _805 = fma(_777, _801, _585);
        float _807 = fma(_787, _801, _549);
        _755 = _805;
        _759 = _803;
        _763 = _807;
    }
    float _809 = _755;
    float _811 = _759;
    float _813 = _763;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = _809 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _821 = _811 + _819;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _813 + _823;
    float _827 = _817 * _817;
    float _829 = fma(_821, _821, _827);
    float _831 = fma(_825, _825, _829);
    float _833 = rsqrt(_831);
    float _835 = sqrt(_831);
    float _837 = _833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _839 = _821 * _837;
    float _841 = _825 * _837;
    float _843 = _839 * _839;
    float _845 = _841 * _841;
    float _847 = _843 + _845;
    float _849 = sqrt(_847);
    bool _851 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _849 + _853;
    float _857 = _753;
    float _859 = _847;
    float _861 = _855;
    float _863 = _817;
    float _865 = _837;
    float _867 = _839;
    if (_851)
    {
        float _869 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _857 = _869;
    }
    float _871 = _857;
    if (_851)
    {
        float _873 = rsqrt(_847);
        _859 = _873;
    }
    float _875 = _859;
    float _877 = _871;
    float _879 = _875;
    if (_851)
    {
        float _881 = _855 * _871;
        _861 = _881;
    }
    float _883 = _861;
    if (_851)
    {
        float _885 = _883 * 0.15915493667125701904296875;
        _877 = _885;
    }
    float _887 = _877;
    float _889 = _825;
    float _891 = _887;
    if (_851)
    {
        float _893 = _887 * 6.283185482025146484375;
        float _895 = sin(_893);
        _889 = _895;
    }
    float _897 = _889;
    float _899 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _901 = precise::max(0.0, _899);
    float _903 = _747;
    float _905 = _901;
    if (_851)
    {
        float _907 = _887 * 6.283185482025146484375;
        float _909 = cos(_907);
        _903 = _909;
    }
    float _911 = _903;
    float _913 = -_837;
    float _915 = -_901;
    float _917 = fma(_817, _913, _915);
    if (_851)
    {
        float _919 = _917 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _863 = _919;
    }
    float _921 = _863;
    float _923 = _897;
    float _925 = _921;
    if (_851)
    {
        float _927 = fma(_897, _921, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _923 = _927;
    }
    float _929 = _923;
    float _931 = _929;
    if (!_851)
    {
        _925 = _841;
    }
    float _933 = _925;
    float _935 = _933;
    if (_851)
    {
        float _937 = _911 + (-1.0);
        _905 = _937;
    }
    float _939 = _905;
    float _941 = _939;
    if (_851)
    {
        float _943 = _875 * _929;
        _865 = _943;
    }
    float _945 = _865;
    if (!_851)
    {
        _931 = _917;
    }
    float _947 = _931;
    float _949 = _947;
    if (_851)
    {
        float _951 = _939 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _891 = _951;
    }
    float _953 = _891;
    if (_851)
    {
        float _955 = _839 * _945;
        _867 = _955;
    }
    float _957 = _867;
    if (!_851)
    {
        _879 = _843;
    }
    float _959 = _879;
    float _961 = _959;
    if (_851)
    {
        float _963 = _841 * _945;
        _935 = _963;
    }
    float _965 = _935;
    if (_851)
    {
        float _967 = fma(_917, _911, _953);
        _949 = _967;
    }
    float _969 = _949;
    if (_851)
    {
        float _971 = _957 * _957;
        _961 = _971;
    }
    float _973 = _961;
    if (!_851)
    {
        _941 = _845;
    }
    float _975 = _941;
    float _977 = _975;
    if (_851)
    {
        float _979 = _965 * _965;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = fma(_969, _969, _973);
    float _985 = _983 + _981;
    float _987 = _809 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _991 = fma(_835, (*spvDescriptorSet0.vp_c15)._m0[23].w, _989);
    float _993 = precise::clamp(_991, 0.0, 1.0);
    float _995 = _809 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _999 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[2].x, _987);
    float _1001 = rsqrt(_985);
    float _1003 = -_993;
    float _1005 = _1003 + 1.0;
    float _1007 = _809 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1009 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[1].x, _995);
    float _1011 = _809 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1013 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1015 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1007);
    float _1017 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1009);
    float _1019 = abs(_1005);
    float _1021 = log2(_1019);
    float _1023 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1011);
    float _1025 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1015);
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1029 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1031 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1023);
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1037 = _1001 * _957;
    float _1039 = _1001 * _969;
    float _1041 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1035);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1047 = _1001 * _965;
    float _1049 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1043);
    float _1053 = -_1045;
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1053);
    float _1057 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1059 = -_1049;
    float _1061 = fma(_1059, _997, 1.0);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1051);
    float _1065 = -_1047;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1055);
    float _1069 = exp2(_1057);
    float _1071 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1073 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1075 = fma(_1067, -0.5, 0.5);
    float _1077 = fma(_1067, 0.5, 0.5);
    float _1079 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1071);
    float _1081 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1073);
    float _1083 = _1039 + 1.0;
    float _1085 = log2(_1061);
    float _1087 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1079);
    float _1089 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1081);
    float _1091 = fma(_1077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1093 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1087);
    float _1095 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1089);
    float _1097 = fma(_1077, _1091, -0.212114393711090087890625);
    float _1099 = 1.0 / _1063;
    float _1101 = -_1039;
    float _1103 = fma(_1069, _1083, _1101);
    float _1105 = fma(_1077, _1097, 1.570728778839111328125);
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = sqrt(_1075);
    float _1111 = _1085 * 0.693147182464599609375;
    float _1113 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1115 = _1093 * _1099;
    float _1117 = _1095 * _1099;
    float _1119 = fma(_1115, 0.5, 0.5);
    float _1121 = fma(_1117, -0.5, 0.5);
    float _1123 = _1109 * 0.636619746685028076171875;
    float _1125 = -_1105;
    float _1127 = fma(_1123, _1125, 1.0);
    float3 _3037 = float3(_1119, _1121, _1113);
    float _1129 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3037, float3(0.0), isnan(_3037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3037, float3(0.0), isnan(_3037)), level(0.0)).x;
    float3 _3048 = float3(_1119, _1121, _1113);
    float4 _1132 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3048, float3(0.0), isnan(_3048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3048, float3(0.0), isnan(_3048)), level(0.0)).xyzw;
    float _1134 = _1132.x;
    float _1136 = _1132.y;
    float _1138 = _1132.z;
    float _1140 = _1132.w;
    float2 _3065 = float2(_1127, _1107);
    float3 _1144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3065, float2(0.0), isnan(_3065)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3065, float2(0.0), isnan(_3065)), level(0.0)).xyz;
    float _1146 = _1144.x;
    float _1148 = _1144.y;
    float _1150 = _1144.z;
    float _1152 = in.m_49.y;
    float _1154 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1158 = _139 > 0.5;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1164;
    float _1168 = -_513;
    int _1170 = _1158 ? as_type<int>(_1168) : as_type<int>(_513);
    float _1172 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1154);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1176 = _1174 != 0;
    float _1178 = 1.0 / _1162;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1182 = _1180 != 0;
    float _1184 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1172);
    bool _1186 = !_1176;
    float _1188 = _1186 ? _513 : as_type<float>(_1170);
    bool _1190 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1192 = isnan(_475);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1184);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1206 = _1188 + 0.5;
    float _1208 = _1202 + _1063;
    bool _1210 = _1152 > 0.5;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1214 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1216 = isnan(_475);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1228 = _1166 * _1178;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1232 = _475 + _1230;
    float _1234 = -_1224;
    float _1236 = _1234 + 1.0;
    float _1238 = -_503;
    int _1240 = _1210 ? as_type<int>(_1238) : as_type<int>(_503);
    float _1242 = fma(_1228, _1232, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1244 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1246 = _1200 * _1236;
    float _1248 = -_1200;
    float _1250 = _1248 + 1.0;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1254 = !_1182;
    float _1256 = _1254 ? _503 : as_type<float>(_1240);
    float _1258 = _1242 * _1246;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1258);
    float _1266 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1268 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = -_1256;
    float _1272 = _1270 + 0.5;
    float _1274 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1264);
    float _1276 = exp2(_1266);
    float _1278 = _1244 * _1156;
    out.m_58.x = _1260;
    out.m_58.y = _1262;
    out.m_58.z = _1268;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1284 = _1280 * _1204;
    float _1286 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1278;
    out.m_60.y = _1284;
    float _1288 = -_1276;
    float _1290 = _1288 + 1.0;
    out.gl_Position.x = _1093;
    out.gl_Position.y = _1095;
    out.gl_Position.z = _1202;
    out.gl_Position.w = _1063;
    float _1292 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1298 = _1208 * 0.5;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = -_1292;
    float _1308 = _1306 + 1.0;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1286;
    out.m_62.x = _1302;
    out.m_62.y = _1304;
    out.m_62.z = _1310;
    out.m_62.w = _1282;
    out.m_64.z = _1298;
    out.m_64.w = _1063;
    float _1312 = _1292 * _1129;
    float _1314 = _1140 * _1308;
    float _1316 = _1140 * _1312;
    float _1318 = _1150 * _1312;
    float _1320 = fma(_1146, _1316, _1134);
    float _1322 = fma(_1148, _1316, _1136);
    float _1324 = fma(_1140, _1318, _1138);
    out.m_66.x = _1320;
    out.m_66.y = _1322;
    out.m_66.z = _1324;
    out.m_66.w = _1314;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _467 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1380 = as_type<float>(_101);
        out.gl_Position.z = _1380;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _119 = float(_85);
        _95 = _119;
    }
    float _121 = _95;
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
    int _133 = 0;
    if (_127)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1449 = as_type<float>(_137);
        out.gl_Position.z = _1449;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = floor(_157);
    float _161 = _157 * 6.283185482025146484375;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    bool _185 = !_169;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _191 = _175 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_187);
    float _201 = -_159;
    float _203 = _157 + _201;
    int _205 = abs(_181);
    bool _207 = !_155;
    int _209 = _207 ? 0 : 1;
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _217 = abs(_209);
    float _219 = float(_205);
    float _221 = fma(_193, 0.5, 0.5);
    bool _223 = _203 < 0.5;
    float _225 = float(_223);
    float _227 = abs(_213);
    float _229 = _219 * _227;
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_217);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_199);
    float _243 = fma(_235, _233, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_215;
    float _255 = _245;
    float _257 = _197;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    bool _293 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_283);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _283 + _317;
    float _321 = 1.0 / _311;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _307;
    float _327 = 1.0 / _315;
    float _329 = _319 * _321;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _287 * _325;
    bool _345 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_283);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -_303;
    float _359 = _357 + 1.0;
    float _361 = _355 * _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _291 * _327;
    bool _369 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_283);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_355;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _379 * _383;
    float _399 = -_379;
    float _401 = _399 + 1.0;
    float _403 = fma(_387, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_391, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = _341 * _401;
    float _409 = fma(_365, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = fma(_395, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -_341;
    float _415 = _413 + 1.0;
    float _417 = _403 * _407;
    float _419 = _405 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _425;
    float _429 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _433 = fma(_423, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_427, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _437 = fma(_409, _397, _429);
    float _439 = fma(_411, _397, _431);
    float _441 = fma(_433, _361, _437);
    float _443 = fma(_435, _361, _439);
    float _445 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _441);
    float _447 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _443);
    bool _449 = !_323;
    float _465;
    if (!_449)
    {
        float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _453 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _455 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _457 = _455 * _451;
        float _459 = floor(_457);
        float _461 = -_459;
        float _463 = _457 + _461;
        _465 = _463;
        _467 = true;
    }
    else
    {
        float _469 = float(_85);
        float _471 = 1.0 / _469;
        float _473 = _117 * _471;
        _465 = _473;
    }
    _467 = false;
    float _475 = _465;
    float _477 = as_type<float>(int(gl_VertexIndex));
    float _479 = in.m_56.x;
    float _481 = in.m_56.y;
    float _483 = in.m_42.x;
    float _485 = in.m_42.y;
    float _487 = in.m_42.z;
    int _489 = as_type<int>(_477) & 1;
    bool _491 = _489 != 0;
    int _493 = as_type<int>(_477) & 2;
    bool _495 = _493 != 0;
    float _497 = _447 * _481;
    float _499 = _445 * _479;
    bool _501 = !_495;
    float _503 = _501 ? (-0.5) : 0.5;
    float _505 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _507 = _251 * _497;
    float _509 = _251 * _499;
    bool _511 = !_491;
    float _513 = _511 ? (-0.5) : 0.5;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _513);
    float _523 = _517 * _515;
    float _525 = _485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _519 * _521;
    float _529 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _531 = _485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _533 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _535 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
    float _541 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
    float _545 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
    float _547 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = _541 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _551 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
    float _553 = _545 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _555 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = _485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _559 = _551 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _561 = _549 + _553;
    float _563 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _565 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
    float _567 = _555 + _559;
    float _569 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _571 = _561 + _569;
    float _573 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _563);
    float _575 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
    float _577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _579 = _567 + _577;
    float _581 = _571 * _571;
    float _583 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].z, _573);
    float _585 = _575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = fma(_579, _579, _581);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_587);
    float _593 = _585 + _589;
    bool _595 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _597 = _581;
    float _599 = _487;
    float _601 = _589;
    if (!_595)
    {
        _597 = _567;
    }
    float _603 = _597;
    float _605 = _603;
    if (!_595)
    {
        _599 = _561;
    }
    float _607 = _599;
    float _609 = _607;
    if (!_595)
    {
        _601 = _593;
    }
    float _611 = _601;
    bool _613 = !_595;
    float _615 = _611;
    if (!_613)
    {
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _621 = _591 + _619;
        float _623 = _593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _625 = rsqrt(_587);
        float _627 = _621 * _617;
        float _629 = _627 * 0.15915493667125701904296875;
        float _631 = _629 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _629 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = _633 + (-1.0);
        float _641 = _639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = fma(_637, _623, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = fma(_593, _633, _641);
        float _647 = _625 * _643;
        float _649 = fma(_579, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _651 = fma(_571, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _615 = _645;
        _605 = _649;
        _609 = _651;
    }
    float _653 = _615;
    float _655 = _605;
    float _657 = _609;
    float _659 = -_585;
    float _661 = _659 + _653;
    float _663 = -_555;
    float _665 = _663 + _655;
    float _667 = -_549;
    float _669 = _667 + _657;
    float _671 = _661 * _661;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = fma(_665, _665, _671);
    float _685 = fma(_669, _669, _683);
    float _687 = sqrt(_685);
    bool _689 = _687 > 0.0;
    bool _691 = !_689;
    float _693 = _655;
    float _695 = _657;
    float _697 = _653;
    float _699 = _687;
    if (!_691)
    {
        float _701 = _245 * _245;
        float _703 = fma(_197, _197, _701);
        float _705 = fma(_247, _247, _703);
        float _707 = rsqrt(_685);
        float _709 = sqrt(_705);
        float _711 = _665 * _707;
        float _713 = _661 * _707;
        bool _715 = _709 > 0.0;
        float _717 = _669 * _707;
        bool _719 = !_715;
        _699 = _707;
        if (!_719)
        {
            float _721 = rsqrt(_705);
            float _723 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _725 = _245 * _721;
            float _727 = _197 * _721;
            float _729 = _247 * _721;
            float _731 = _713 * _725;
            float _733 = fma(_711, _727, _731);
            float _735 = _723 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _737 = fma(_717, _729, _733);
            float _739 = _737 * _735;
            float _741 = fma(_197, _739, _655);
            float _743 = fma(_245, _739, _653);
            float _745 = fma(_247, _739, _657);
            _693 = _741;
            _695 = _745;
            _697 = _743;
            _699 = _739;
        }
    }
    float _747 = _693;
    float _749 = _695;
    float _751 = _697;
    float _753 = _699;
    float _755 = _751;
    if (_681)
    {
        _255 = _747;
    }
    float _757 = _255;
    float _759 = _757;
    if (_681)
    {
        _257 = _749;
    }
    float _761 = _257;
    float _763 = _761;
    if (!_681)
    {
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _767 = _585 + _765;
        float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _771 = _555 + _769;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _775 = -_585;
        float _777 = _775 + _751;
        float _779 = _767 * _767;
        float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _783 = _549 + _781;
        float _785 = -_549;
        float _787 = _785 + _749;
        float _789 = fma(_771, _771, _779);
        float _791 = -_555;
        float _793 = _791 + _747;
        float _795 = fma(_783, _783, _789);
        float _797 = sqrt(_795);
        float _799 = precise::min(_797, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _801 = _799 * _773;
        float _803 = fma(_793, _801, _555);
        float _805 = fma(_777, _801, _585);
        float _807 = fma(_787, _801, _549);
        _755 = _805;
        _759 = _803;
        _763 = _807;
    }
    float _809 = _755;
    float _811 = _759;
    float _813 = _763;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = _809 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _821 = _811 + _819;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _825 = _813 + _823;
    float _827 = _817 * _817;
    float _829 = fma(_821, _821, _827);
    float _831 = fma(_825, _825, _829);
    float _833 = rsqrt(_831);
    float _835 = sqrt(_831);
    float _837 = _833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _839 = _821 * _837;
    float _841 = _825 * _837;
    float _843 = _839 * _839;
    float _845 = _841 * _841;
    float _847 = _843 + _845;
    float _849 = sqrt(_847);
    bool _851 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _849 + _853;
    float _857 = _753;
    float _859 = _847;
    float _861 = _855;
    float _863 = _817;
    float _865 = _837;
    float _867 = _839;
    if (_851)
    {
        float _869 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _857 = _869;
    }
    float _871 = _857;
    if (_851)
    {
        float _873 = rsqrt(_847);
        _859 = _873;
    }
    float _875 = _859;
    float _877 = _871;
    float _879 = _875;
    if (_851)
    {
        float _881 = _855 * _871;
        _861 = _881;
    }
    float _883 = _861;
    if (_851)
    {
        float _885 = _883 * 0.15915493667125701904296875;
        _877 = _885;
    }
    float _887 = _877;
    float _889 = _825;
    float _891 = _887;
    if (_851)
    {
        float _893 = _887 * 6.283185482025146484375;
        float _895 = sin(_893);
        _889 = _895;
    }
    float _897 = _889;
    float _899 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _901 = precise::max(0.0, _899);
    float _903 = _747;
    float _905 = _901;
    if (_851)
    {
        float _907 = _887 * 6.283185482025146484375;
        float _909 = cos(_907);
        _903 = _909;
    }
    float _911 = _903;
    float _913 = -_837;
    float _915 = -_901;
    float _917 = fma(_817, _913, _915);
    if (_851)
    {
        float _919 = _917 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _863 = _919;
    }
    float _921 = _863;
    float _923 = _897;
    float _925 = _921;
    if (_851)
    {
        float _927 = fma(_897, _921, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _923 = _927;
    }
    float _929 = _923;
    float _931 = _929;
    if (!_851)
    {
        _925 = _841;
    }
    float _933 = _925;
    float _935 = _933;
    if (_851)
    {
        float _937 = _911 + (-1.0);
        _905 = _937;
    }
    float _939 = _905;
    float _941 = _939;
    if (_851)
    {
        float _943 = _875 * _929;
        _865 = _943;
    }
    float _945 = _865;
    if (!_851)
    {
        _931 = _917;
    }
    float _947 = _931;
    float _949 = _947;
    if (_851)
    {
        float _951 = _939 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _891 = _951;
    }
    float _953 = _891;
    if (_851)
    {
        float _955 = _839 * _945;
        _867 = _955;
    }
    float _957 = _867;
    if (!_851)
    {
        _879 = _843;
    }
    float _959 = _879;
    float _961 = _959;
    if (_851)
    {
        float _963 = _841 * _945;
        _935 = _963;
    }
    float _965 = _935;
    if (_851)
    {
        float _967 = fma(_917, _911, _953);
        _949 = _967;
    }
    float _969 = _949;
    if (_851)
    {
        float _971 = _957 * _957;
        _961 = _971;
    }
    float _973 = _961;
    if (!_851)
    {
        _941 = _845;
    }
    float _975 = _941;
    float _977 = _975;
    if (_851)
    {
        float _979 = _965 * _965;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = fma(_969, _969, _973);
    float _985 = _983 + _981;
    float _987 = _809 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _991 = fma(_835, (*spvDescriptorSet0.vp_c15)._m0[23].w, _989);
    float _993 = precise::clamp(_991, 0.0, 1.0);
    float _995 = _809 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _999 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[2].x, _987);
    float _1001 = rsqrt(_985);
    float _1003 = -_993;
    float _1005 = _1003 + 1.0;
    float _1007 = _809 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1009 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[1].x, _995);
    float _1011 = _809 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1013 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1015 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1007);
    float _1017 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1009);
    float _1019 = abs(_1005);
    float _1021 = log2(_1019);
    float _1023 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1011);
    float _1025 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1015);
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1029 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1031 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1023);
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1037 = _1001 * _957;
    float _1039 = _1001 * _969;
    float _1041 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1035);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1047 = _1001 * _965;
    float _1049 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1043);
    float _1053 = -_1045;
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1053);
    float _1057 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1059 = -_1049;
    float _1061 = fma(_1059, _997, 1.0);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1051);
    float _1065 = -_1047;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1055);
    float _1069 = exp2(_1057);
    float _1071 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1073 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1075 = fma(_1067, -0.5, 0.5);
    float _1077 = fma(_1067, 0.5, 0.5);
    float _1079 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1071);
    float _1081 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1073);
    float _1083 = _1039 + 1.0;
    float _1085 = log2(_1061);
    float _1087 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1079);
    float _1089 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1081);
    float _1091 = fma(_1077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1093 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1087);
    float _1095 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1089);
    float _1097 = fma(_1077, _1091, -0.212114393711090087890625);
    float _1099 = 1.0 / _1063;
    float _1101 = -_1039;
    float _1103 = fma(_1069, _1083, _1101);
    float _1105 = fma(_1077, _1097, 1.570728778839111328125);
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = sqrt(_1075);
    float _1111 = _1085 * 0.693147182464599609375;
    float _1113 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1115 = _1093 * _1099;
    float _1117 = _1095 * _1099;
    float _1119 = fma(_1115, 0.5, 0.5);
    float _1121 = fma(_1117, -0.5, 0.5);
    float _1123 = _1109 * 0.636619746685028076171875;
    float _1125 = -_1105;
    float _1127 = fma(_1123, _1125, 1.0);
    float3 _3037 = float3(_1119, _1121, _1113);
    float _1129 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3037, float3(0.0), isnan(_3037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3037, float3(0.0), isnan(_3037)), level(0.0)).x;
    float3 _3048 = float3(_1119, _1121, _1113);
    float4 _1132 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3048, float3(0.0), isnan(_3048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3048, float3(0.0), isnan(_3048)), level(0.0)).xyzw;
    float _1134 = _1132.x;
    float _1136 = _1132.y;
    float _1138 = _1132.z;
    float _1140 = _1132.w;
    float2 _3065 = float2(_1127, _1107);
    float3 _1144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3065, float2(0.0), isnan(_3065)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3065, float2(0.0), isnan(_3065)), level(0.0)).xyz;
    float _1146 = _1144.x;
    float _1148 = _1144.y;
    float _1150 = _1144.z;
    float _1152 = in.m_49.y;
    float _1154 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1158 = _139 > 0.5;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1164;
    float _1168 = -_513;
    int _1170 = _1158 ? as_type<int>(_1168) : as_type<int>(_513);
    float _1172 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1154);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1176 = _1174 != 0;
    float _1178 = 1.0 / _1162;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1182 = _1180 != 0;
    float _1184 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1172);
    bool _1186 = !_1176;
    float _1188 = _1186 ? _513 : as_type<float>(_1170);
    bool _1190 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1192 = isnan(_475);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1184);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1206 = _1188 + 0.5;
    float _1208 = _1202 + _1063;
    bool _1210 = _1152 > 0.5;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1214 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1216 = isnan(_475);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1228 = _1166 * _1178;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1232 = _475 + _1230;
    float _1234 = -_1224;
    float _1236 = _1234 + 1.0;
    float _1238 = -_503;
    int _1240 = _1210 ? as_type<int>(_1238) : as_type<int>(_503);
    float _1242 = fma(_1228, _1232, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1244 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1246 = _1200 * _1236;
    float _1248 = -_1200;
    float _1250 = _1248 + 1.0;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1254 = !_1182;
    float _1256 = _1254 ? _503 : as_type<float>(_1240);
    float _1258 = _1242 * _1246;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1258);
    float _1266 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1268 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = -_1256;
    float _1272 = _1270 + 0.5;
    float _1274 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1264);
    float _1276 = exp2(_1266);
    float _1278 = _1244 * _1156;
    out.m_58.x = _1260;
    out.m_58.y = _1262;
    out.m_58.z = _1268;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1284 = _1280 * _1204;
    float _1286 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1278;
    out.m_60.y = _1284;
    float _1288 = -_1276;
    float _1290 = _1288 + 1.0;
    out.gl_Position.x = _1093;
    out.gl_Position.y = _1095;
    out.gl_Position.z = _1202;
    out.gl_Position.w = _1063;
    float _1292 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1298 = _1208 * 0.5;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = -_1292;
    float _1308 = _1306 + 1.0;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1286;
    out.m_62.x = _1302;
    out.m_62.y = _1304;
    out.m_62.z = _1310;
    out.m_62.w = _1282;
    out.m_64.z = _1298;
    out.m_64.w = _1063;
    float _1312 = _1292 * _1129;
    float _1314 = _1140 * _1308;
    float _1316 = _1140 * _1312;
    float _1318 = _1150 * _1312;
    float _1320 = fma(_1146, _1316, _1134);
    float _1322 = fma(_1148, _1316, _1136);
    float _1324 = fma(_1140, _1318, _1138);
    out.m_66.x = _1320;
    out.m_66.y = _1322;
    out.m_66.z = _1324;
    out.m_66.w = _1314;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

