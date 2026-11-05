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
        float _1510 = as_type<float>(_101);
        out.gl_Position.z = _1510;
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
        float _1579 = as_type<float>(_137);
        out.gl_Position.z = _1579;
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
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = 1.0 / _299;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _307;
    float _327 = 1.0 / _303;
    float _329 = _287 * _321;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = _291 * _325;
    bool _351 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_283);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_341;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = _361 * _365;
    float _373 = -_361;
    float _375 = _373 + 1.0;
    float _377 = _295 * _327;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = fma(_369, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = fma(_393, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _375;
    float _409 = fma(_399, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = fma(_403, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -_389;
    float _415 = _413 + 1.0;
    float _417 = _405 * _407;
    float _419 = _409 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _421;
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _427;
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _433 = fma(_423, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_395, _371, _425);
    float _437 = fma(_429, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_411, _371, _431);
    float _441 = fma(_433, _347, _435);
    float _443 = fma(_437, _347, _439);
    float _445 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[146].x, _441);
    float _447 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[146].y, _443);
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
    float _505 = _251 * _497;
    float _507 = _251 * _499;
    bool _509 = !_491;
    float _511 = _509 ? (-0.5) : 0.5;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _515 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _511);
    float _521 = _515 * _513;
    float _523 = _485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _525 = _517 * _519;
    float _527 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = _485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _533 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _535 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _523);
    float _537 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _529);
    float _541 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
    float _543 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
    float _547 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = _545 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _555 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _559 = _485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _551 + _553;
    float _563 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _565 = _555 + _557;
    float _567 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _571 = _561 + _569;
    float _573 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _563);
    float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _577 = _565 + _575;
    float _579 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _581 = _571 * _571;
    float _583 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _573);
    float _585 = _579 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = fma(_577, _577, _581);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_587);
    float _593 = _585 + _589;
    bool _595 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _597 = _563;
    float _599 = _533;
    float _601 = _567;
    if (!_595)
    {
        _597 = _565;
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
        float _623 = rsqrt(_587);
        float _625 = _621 * _617;
        float _627 = _593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _629 = _625 * 0.15915493667125701904296875;
        float _631 = _629 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _629 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = _633 + (-1.0);
        float _641 = _639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = fma(_637, _627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = fma(_593, _633, _641);
        float _647 = _623 * _643;
        float _649 = fma(_577, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
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
    float _667 = -_551;
    float _669 = _667 + _657;
    float _671 = _585 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _673 = _661 * _661;
    bool _675 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _677 = isnan(0.5);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _683 = _679 || _681;
    float _685 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _671);
    float _687 = fma(_665, _665, _673);
    bool _689 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _691 = isnan(0.5);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _697 = _693 || _695;
    float _699 = fma(_669, _669, _687);
    float _701 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _685);
    float _703 = _585 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = sqrt(_699);
    float _707 = _701 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _709 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _711 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _709);
    float _713 = 1.0 / _707;
    float _715 = _711 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _717 = _715 + _707;
    bool _719 = _705 > 0.0;
    float _721 = _717 * _713;
    float _723 = _721 * 0.5;
    bool _725 = !_719;
    float _727 = _655;
    float _729 = _657;
    float _731 = _653;
    float _733 = _713;
    float _735 = _707;
    if (!_725)
    {
        float _737 = _245 * _245;
        float _739 = fma(_197, _197, _737);
        float _741 = fma(_247, _247, _739);
        float _743 = rsqrt(_699);
        float _745 = sqrt(_741);
        float _747 = _665 * _743;
        float _749 = _661 * _743;
        float _751 = _669 * _743;
        bool _753 = _745 > 0.0;
        bool _755 = !_753;
        _733 = _741;
        _735 = _743;
        if (!_755)
        {
            float _757 = rsqrt(_741);
            float _759 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _761 = _245 * _757;
            float _763 = _197 * _757;
            float _765 = _749 * _761;
            float _767 = _247 * _757;
            float _769 = fma(_747, _763, _765);
            float _771 = _759 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _773 = fma(_751, _767, _769);
            float _775 = _773 * _771;
            float _777 = fma(_197, _775, _655);
            float _779 = fma(_245, _775, _653);
            float _781 = fma(_247, _775, _657);
            _727 = _777;
            _729 = _781;
            _731 = _779;
            _733 = _757;
            _735 = _775;
        }
    }
    float _783 = _727;
    float _785 = _729;
    float _787 = _731;
    float _789 = _733;
    float _791 = _735;
    float _793 = _791;
    float _795 = _787;
    float _797 = _785;
    float _799 = _789;
    if (_697)
    {
        _793 = 1.0;
    }
    float _801 = _793;
    float _803 = _801;
    if (_683)
    {
        _255 = _783;
    }
    float _805 = _255;
    float _807 = _805;
    if (_683)
    {
        _257 = _785;
    }
    float _809 = _257;
    float _811 = _809;
    if (!_683)
    {
        float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _815 = _585 + _813;
        float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _819 = _555 + _817;
        float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _823 = -_585;
        float _825 = _823 + _787;
        float _827 = _815 * _815;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _831 = _551 + _829;
        float _833 = -_551;
        float _835 = _833 + _785;
        float _837 = fma(_819, _819, _827);
        float _839 = -_555;
        float _841 = _839 + _783;
        float _843 = fma(_831, _831, _837);
        float _845 = sqrt(_843);
        float _847 = precise::min(_845, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _849 = _847 * _821;
        float _851 = fma(_841, _849, _555);
        float _853 = fma(_825, _849, _585);
        float _855 = fma(_835, _849, _551);
        _795 = _853;
        _807 = _851;
        _811 = _855;
        _797 = _835;
    }
    float _857 = _795;
    float _859 = _807;
    float _861 = _811;
    float _863 = _797;
    float _865 = _863;
    if (!_697)
    {
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _875 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[30].w, _873);
        float _877 = _869 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = _871 * 0.15915493667125701904296875;
        float _883 = _869 * 6.283185482025146484375;
        float _885 = sin(_883);
        float _887 = 1.0 / _879;
        float _889 = _881 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _885 * _887;
        float _895 = _881 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _891 * _893;
        float _901 = 1.0 / _875;
        float _903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _903;
        float _907 = 1.0 / _899;
        float _909 = 1.0 / _905;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _913 = _901 * _911;
        float _915 = _897 * _907;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = fma(_915, _913, _917);
        float _921 = _919 * _909;
        float _923 = precise::clamp(_921, 0.0, 1.0);
        _799 = _869;
        _865 = _881;
        _803 = _923;
    }
    float _925 = _799;
    float _927 = _865;
    float _929 = _803;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _933 = _857 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _937 = _859 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _941 = _861 + _939;
    float _943 = _933 * _933;
    float _945 = fma(_937, _937, _943);
    float _947 = fma(_941, _941, _945);
    float _949 = rsqrt(_947);
    float _951 = sqrt(_947);
    float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _937 * _953;
    float _957 = _941 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _925;
    float _975 = _963;
    float _977 = _971;
    float _979 = _933;
    float _981 = _953;
    float _983 = _955;
    if (_967)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _985;
    }
    float _987 = _973;
    if (_967)
    {
        float _989 = rsqrt(_963);
        _975 = _989;
    }
    float _991 = _975;
    float _993 = _987;
    float _995 = _991;
    if (_967)
    {
        float _997 = _971 * _987;
        _977 = _997;
    }
    float _999 = _977;
    if (_967)
    {
        float _1001 = _999 * 0.15915493667125701904296875;
        _993 = _1001;
    }
    float _1003 = _993;
    float _1005 = _941;
    float _1007 = _1003;
    if (_967)
    {
        float _1009 = _1003 * 6.283185482025146484375;
        float _1011 = sin(_1009);
        _1005 = _1011;
    }
    float _1013 = _1005;
    float _1015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1017 = precise::max(0.0, _1015);
    float _1019 = _927;
    float _1021 = _1017;
    if (_967)
    {
        float _1023 = _1003 * 6.283185482025146484375;
        float _1025 = cos(_1023);
        _1019 = _1025;
    }
    float _1027 = _1019;
    float _1029 = -_953;
    float _1031 = -_1017;
    float _1033 = fma(_933, _1029, _1031);
    if (_967)
    {
        float _1035 = _1033 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1035;
    }
    float _1037 = _979;
    float _1039 = _1013;
    float _1041 = _1037;
    if (_967)
    {
        float _1043 = fma(_1013, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1039 = _1043;
    }
    float _1045 = _1039;
    float _1047 = _1045;
    if (!_967)
    {
        _1041 = _957;
    }
    float _1049 = _1041;
    float _1051 = _1049;
    if (_967)
    {
        float _1053 = _1027 + (-1.0);
        _1021 = _1053;
    }
    float _1055 = _1021;
    float _1057 = _1055;
    if (_967)
    {
        float _1059 = _991 * _1045;
        _981 = _1059;
    }
    float _1061 = _981;
    if (!_967)
    {
        _1047 = _1033;
    }
    float _1063 = _1047;
    float _1065 = _1063;
    if (_967)
    {
        float _1067 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1067;
    }
    float _1069 = _1007;
    if (_967)
    {
        float _1071 = _955 * _1061;
        _983 = _1071;
    }
    float _1073 = _983;
    if (!_967)
    {
        _995 = _959;
    }
    float _1075 = _995;
    float _1077 = _1075;
    if (_967)
    {
        float _1079 = _957 * _1061;
        _1051 = _1079;
    }
    float _1081 = _1051;
    if (_967)
    {
        float _1083 = fma(_1033, _1027, _1069);
        _1065 = _1083;
    }
    float _1085 = _1065;
    if (_967)
    {
        float _1087 = _1073 * _1073;
        _1077 = _1087;
    }
    float _1089 = _1077;
    if (!_967)
    {
        _1057 = _961;
    }
    float _1091 = _1057;
    float _1093 = _1091;
    if (_967)
    {
        float _1095 = _1081 * _1081;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = fma(_1085, _1085, _1089);
    float _1101 = _1099 + _1097;
    float _1103 = _857 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1107 = fma(_951, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1105);
    float _1109 = precise::clamp(_1107, 0.0, 1.0);
    float _1111 = _857 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = rsqrt(_1101);
    float _1115 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1103);
    float _1117 = _857 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1111);
    float _1121 = -_1109;
    float _1123 = _1121 + 1.0;
    float _1125 = _857 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1127 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1129 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1119);
    float _1131 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1115);
    float _1133 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1125);
    float _1135 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1137 = abs(_1123);
    float _1139 = log2(_1137);
    float _1141 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1143 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1133);
    float _1145 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1151 = _1113 * _1073;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1157 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1149);
    float _1159 = _1113 * _1085;
    float _1161 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1163 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1165 = _1113 * _1081;
    float _1167 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1157);
    float _1169 = -_1161;
    float _1171 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1175 = -_1163;
    float _1177 = fma(_1175, _1155, 1.0);
    float _1179 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1181 = -_1165;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1187 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1189 = exp2(_1173);
    float _1191 = fma(_1183, -0.5, 0.5);
    float _1193 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1185);
    float _1195 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1187);
    float _1197 = fma(_1183, 0.5, 0.5);
    float _1199 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1201 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1195);
    float _1203 = log2(_1177);
    float _1205 = _1159 + 1.0;
    float _1207 = fma(_1197, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1209 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1199);
    float _1211 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1201);
    float _1213 = fma(_1197, _1207, -0.212114393711090087890625);
    float _1215 = 1.0 / _1179;
    float _1217 = -_1159;
    float _1219 = fma(_1189, _1205, _1217);
    float _1221 = fma(_1197, _1213, 1.570728778839111328125);
    float _1223 = fma(_1219, 0.5, 0.5);
    float _1225 = sqrt(_1191);
    float _1227 = _1203 * 0.693147182464599609375;
    float _1229 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1231 = _1209 * _1215;
    float _1233 = _1211 * _1215;
    float _1235 = fma(_1231, 0.5, 0.5);
    float _1237 = fma(_1233, -0.5, 0.5);
    float _1239 = _1225 * 0.636619746685028076171875;
    float _1241 = -_1221;
    float _1243 = fma(_1239, _1241, 1.0);
    float3 _3331 = float3(_1235, _1237, _1229);
    float _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3331, float3(0.0), isnan(_3331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3331, float3(0.0), isnan(_3331)), level(0.0)).x;
    float3 _3342 = float3(_1235, _1237, _1229);
    float4 _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3342, float3(0.0), isnan(_3342)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3342, float3(0.0), isnan(_3342)), level(0.0)).xyzw;
    float _1250 = _1248.x;
    float _1252 = _1248.y;
    float _1254 = _1248.z;
    float _1256 = _1248.w;
    float2 _3359 = float2(_1243, _1223);
    float3 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3359, float2(0.0), isnan(_3359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3359, float2(0.0), isnan(_3359)), level(0.0)).xyz;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = in.m_49.y;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1276 = _139 > 0.5;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1284 = _1282 != 0;
    float _1286 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1288 = -_511;
    int _1290 = _1276 ? as_type<int>(_1288) : as_type<int>(_511);
    float _1292 = 1.0 / _1274;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1286);
    bool _1300 = !_1284;
    float _1302 = _1300 ? _511 : as_type<float>(_1290);
    bool _1304 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1306 = isnan(_475);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    float _1316 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1298);
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1320 = _1302 + 0.5;
    float _1322 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1316);
    float _1324 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1326 = _1268 > 0.5;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1330 = _1280 * _1292;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1334 = _475 + _1332;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1338 = -_503;
    int _1340 = _1326 ? as_type<int>(_1338) : as_type<int>(_503);
    float _1342 = fma(_1330, _1334, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1344 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1346 = isnan(_475);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = _1324 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1360 = !_1296;
    float _1362 = _1360 ? _503 : as_type<float>(_1340);
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    bool _1368 = _929 > 0.0;
    bool _1370 = isnan(_929);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_45.x = _1358;
    float _1380 = _1314 * _1366;
    float _1382 = -_1314;
    float _1384 = _1382 + 1.0;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = _1342 * _1380;
    float _1392 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = -_1362;
    float _1396 = _1394 + 0.5;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1390);
    float _1400 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_58.x = _1386;
    out.m_58.y = _1388;
    out.m_58.z = _1392;
    float _1404 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1398);
    float _1406 = _1336 * _1318;
    float _1408 = _1402 * _1270;
    float _1410 = exp2(_1400);
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_60.x = _1406;
    out.m_60.y = _1408;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1420 = _1322 + _1179;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1211;
    out.gl_Position.z = _1322;
    out.gl_Position.w = _1179;
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1420 * 0.5;
    float _1430 = -_1410;
    float _1432 = _1430 + 1.0;
    out.m_62.x = _1422;
    out.m_62.y = _1424;
    out.m_62.z = _1426;
    out.m_62.w = _1412;
    float _1434 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1428;
    out.m_64.w = _1179;
    float _1436 = _1434 * _1245;
    float _1438 = -_1434;
    float _1440 = _1438 + 1.0;
    float _1442 = _1256 * _1436;
    float _1444 = _1266 * _1436;
    float _1446 = _1256 * _1440;
    float _1448 = fma(_1262, _1442, _1250);
    float _1450 = fma(_1264, _1442, _1252);
    float _1452 = fma(_1256, _1444, _1254);
    out.m_66.x = _1448;
    out.m_66.y = _1450;
    out.m_66.z = _1452;
    out.m_66.w = _1446;
    if (_1376)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1454;
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
        float _1510 = as_type<float>(_101);
        out.gl_Position.z = _1510;
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
        float _1579 = as_type<float>(_137);
        out.gl_Position.z = _1579;
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
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = 1.0 / _299;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _307;
    float _327 = 1.0 / _303;
    float _329 = _287 * _321;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = _291 * _325;
    bool _351 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_283);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_341;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = _361 * _365;
    float _373 = -_361;
    float _375 = _373 + 1.0;
    float _377 = _295 * _327;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = fma(_369, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = fma(_393, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _375;
    float _409 = fma(_399, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = fma(_403, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -_389;
    float _415 = _413 + 1.0;
    float _417 = _405 * _407;
    float _419 = _409 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _421;
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _427;
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _433 = fma(_423, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_395, _371, _425);
    float _437 = fma(_429, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_411, _371, _431);
    float _441 = fma(_433, _347, _435);
    float _443 = fma(_437, _347, _439);
    float _445 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[146].x, _441);
    float _447 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[146].y, _443);
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
    float _505 = _251 * _497;
    float _507 = _251 * _499;
    bool _509 = !_491;
    float _511 = _509 ? (-0.5) : 0.5;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _515 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _511);
    float _521 = _515 * _513;
    float _523 = _485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _525 = _517 * _519;
    float _527 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = _485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _533 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _535 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _523);
    float _537 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _529);
    float _541 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
    float _543 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
    float _547 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = _545 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _555 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _559 = _485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _551 + _553;
    float _563 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _565 = _555 + _557;
    float _567 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _571 = _561 + _569;
    float _573 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _563);
    float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _577 = _565 + _575;
    float _579 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _581 = _571 * _571;
    float _583 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _573);
    float _585 = _579 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = fma(_577, _577, _581);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_587);
    float _593 = _585 + _589;
    bool _595 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _597 = _563;
    float _599 = _533;
    float _601 = _567;
    if (!_595)
    {
        _597 = _565;
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
        float _623 = rsqrt(_587);
        float _625 = _621 * _617;
        float _627 = _593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _629 = _625 * 0.15915493667125701904296875;
        float _631 = _629 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _629 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = _633 + (-1.0);
        float _641 = _639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = fma(_637, _627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = fma(_593, _633, _641);
        float _647 = _623 * _643;
        float _649 = fma(_577, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
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
    float _667 = -_551;
    float _669 = _667 + _657;
    float _671 = _585 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _673 = _661 * _661;
    bool _675 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _677 = isnan(0.5);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _683 = _679 || _681;
    float _685 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _671);
    float _687 = fma(_665, _665, _673);
    bool _689 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _691 = isnan(0.5);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _697 = _693 || _695;
    float _699 = fma(_669, _669, _687);
    float _701 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _685);
    float _703 = _585 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = sqrt(_699);
    float _707 = _701 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _709 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _711 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _709);
    float _713 = 1.0 / _707;
    float _715 = _711 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _717 = _715 + _707;
    bool _719 = _705 > 0.0;
    float _721 = _717 * _713;
    float _723 = _721 * 0.5;
    bool _725 = !_719;
    float _727 = _655;
    float _729 = _657;
    float _731 = _653;
    float _733 = _713;
    float _735 = _707;
    if (!_725)
    {
        float _737 = _245 * _245;
        float _739 = fma(_197, _197, _737);
        float _741 = fma(_247, _247, _739);
        float _743 = rsqrt(_699);
        float _745 = sqrt(_741);
        float _747 = _665 * _743;
        float _749 = _661 * _743;
        float _751 = _669 * _743;
        bool _753 = _745 > 0.0;
        bool _755 = !_753;
        _733 = _741;
        _735 = _743;
        if (!_755)
        {
            float _757 = rsqrt(_741);
            float _759 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _761 = _245 * _757;
            float _763 = _197 * _757;
            float _765 = _749 * _761;
            float _767 = _247 * _757;
            float _769 = fma(_747, _763, _765);
            float _771 = _759 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _773 = fma(_751, _767, _769);
            float _775 = _773 * _771;
            float _777 = fma(_197, _775, _655);
            float _779 = fma(_245, _775, _653);
            float _781 = fma(_247, _775, _657);
            _727 = _777;
            _729 = _781;
            _731 = _779;
            _733 = _757;
            _735 = _775;
        }
    }
    float _783 = _727;
    float _785 = _729;
    float _787 = _731;
    float _789 = _733;
    float _791 = _735;
    float _793 = _791;
    float _795 = _787;
    float _797 = _785;
    float _799 = _789;
    if (_697)
    {
        _793 = 1.0;
    }
    float _801 = _793;
    float _803 = _801;
    if (_683)
    {
        _255 = _783;
    }
    float _805 = _255;
    float _807 = _805;
    if (_683)
    {
        _257 = _785;
    }
    float _809 = _257;
    float _811 = _809;
    if (!_683)
    {
        float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _815 = _585 + _813;
        float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _819 = _555 + _817;
        float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _823 = -_585;
        float _825 = _823 + _787;
        float _827 = _815 * _815;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _831 = _551 + _829;
        float _833 = -_551;
        float _835 = _833 + _785;
        float _837 = fma(_819, _819, _827);
        float _839 = -_555;
        float _841 = _839 + _783;
        float _843 = fma(_831, _831, _837);
        float _845 = sqrt(_843);
        float _847 = precise::min(_845, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _849 = _847 * _821;
        float _851 = fma(_841, _849, _555);
        float _853 = fma(_825, _849, _585);
        float _855 = fma(_835, _849, _551);
        _795 = _853;
        _807 = _851;
        _811 = _855;
        _797 = _835;
    }
    float _857 = _795;
    float _859 = _807;
    float _861 = _811;
    float _863 = _797;
    float _865 = _863;
    if (!_697)
    {
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _875 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[30].w, _873);
        float _877 = _869 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = _871 * 0.15915493667125701904296875;
        float _883 = _869 * 6.283185482025146484375;
        float _885 = sin(_883);
        float _887 = 1.0 / _879;
        float _889 = _881 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _885 * _887;
        float _895 = _881 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _891 * _893;
        float _901 = 1.0 / _875;
        float _903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _903;
        float _907 = 1.0 / _899;
        float _909 = 1.0 / _905;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _913 = _901 * _911;
        float _915 = _897 * _907;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = fma(_915, _913, _917);
        float _921 = _919 * _909;
        float _923 = precise::clamp(_921, 0.0, 1.0);
        _799 = _869;
        _865 = _881;
        _803 = _923;
    }
    float _925 = _799;
    float _927 = _865;
    float _929 = _803;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _933 = _857 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _937 = _859 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _941 = _861 + _939;
    float _943 = _933 * _933;
    float _945 = fma(_937, _937, _943);
    float _947 = fma(_941, _941, _945);
    float _949 = rsqrt(_947);
    float _951 = sqrt(_947);
    float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _937 * _953;
    float _957 = _941 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _925;
    float _975 = _963;
    float _977 = _971;
    float _979 = _933;
    float _981 = _953;
    float _983 = _955;
    if (_967)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _985;
    }
    float _987 = _973;
    if (_967)
    {
        float _989 = rsqrt(_963);
        _975 = _989;
    }
    float _991 = _975;
    float _993 = _987;
    float _995 = _991;
    if (_967)
    {
        float _997 = _971 * _987;
        _977 = _997;
    }
    float _999 = _977;
    if (_967)
    {
        float _1001 = _999 * 0.15915493667125701904296875;
        _993 = _1001;
    }
    float _1003 = _993;
    float _1005 = _941;
    float _1007 = _1003;
    if (_967)
    {
        float _1009 = _1003 * 6.283185482025146484375;
        float _1011 = sin(_1009);
        _1005 = _1011;
    }
    float _1013 = _1005;
    float _1015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1017 = precise::max(0.0, _1015);
    float _1019 = _927;
    float _1021 = _1017;
    if (_967)
    {
        float _1023 = _1003 * 6.283185482025146484375;
        float _1025 = cos(_1023);
        _1019 = _1025;
    }
    float _1027 = _1019;
    float _1029 = -_953;
    float _1031 = -_1017;
    float _1033 = fma(_933, _1029, _1031);
    if (_967)
    {
        float _1035 = _1033 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1035;
    }
    float _1037 = _979;
    float _1039 = _1013;
    float _1041 = _1037;
    if (_967)
    {
        float _1043 = fma(_1013, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1039 = _1043;
    }
    float _1045 = _1039;
    float _1047 = _1045;
    if (!_967)
    {
        _1041 = _957;
    }
    float _1049 = _1041;
    float _1051 = _1049;
    if (_967)
    {
        float _1053 = _1027 + (-1.0);
        _1021 = _1053;
    }
    float _1055 = _1021;
    float _1057 = _1055;
    if (_967)
    {
        float _1059 = _991 * _1045;
        _981 = _1059;
    }
    float _1061 = _981;
    if (!_967)
    {
        _1047 = _1033;
    }
    float _1063 = _1047;
    float _1065 = _1063;
    if (_967)
    {
        float _1067 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1067;
    }
    float _1069 = _1007;
    if (_967)
    {
        float _1071 = _955 * _1061;
        _983 = _1071;
    }
    float _1073 = _983;
    if (!_967)
    {
        _995 = _959;
    }
    float _1075 = _995;
    float _1077 = _1075;
    if (_967)
    {
        float _1079 = _957 * _1061;
        _1051 = _1079;
    }
    float _1081 = _1051;
    if (_967)
    {
        float _1083 = fma(_1033, _1027, _1069);
        _1065 = _1083;
    }
    float _1085 = _1065;
    if (_967)
    {
        float _1087 = _1073 * _1073;
        _1077 = _1087;
    }
    float _1089 = _1077;
    if (!_967)
    {
        _1057 = _961;
    }
    float _1091 = _1057;
    float _1093 = _1091;
    if (_967)
    {
        float _1095 = _1081 * _1081;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = fma(_1085, _1085, _1089);
    float _1101 = _1099 + _1097;
    float _1103 = _857 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1107 = fma(_951, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1105);
    float _1109 = precise::clamp(_1107, 0.0, 1.0);
    float _1111 = _857 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = rsqrt(_1101);
    float _1115 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1103);
    float _1117 = _857 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1111);
    float _1121 = -_1109;
    float _1123 = _1121 + 1.0;
    float _1125 = _857 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1127 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1129 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1119);
    float _1131 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1115);
    float _1133 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1125);
    float _1135 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1137 = abs(_1123);
    float _1139 = log2(_1137);
    float _1141 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1143 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1133);
    float _1145 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1151 = _1113 * _1073;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1157 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1149);
    float _1159 = _1113 * _1085;
    float _1161 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1163 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1165 = _1113 * _1081;
    float _1167 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1157);
    float _1169 = -_1161;
    float _1171 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1175 = -_1163;
    float _1177 = fma(_1175, _1155, 1.0);
    float _1179 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1181 = -_1165;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1187 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1189 = exp2(_1173);
    float _1191 = fma(_1183, -0.5, 0.5);
    float _1193 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1185);
    float _1195 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1187);
    float _1197 = fma(_1183, 0.5, 0.5);
    float _1199 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1201 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1195);
    float _1203 = log2(_1177);
    float _1205 = _1159 + 1.0;
    float _1207 = fma(_1197, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1209 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1199);
    float _1211 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1201);
    float _1213 = fma(_1197, _1207, -0.212114393711090087890625);
    float _1215 = 1.0 / _1179;
    float _1217 = -_1159;
    float _1219 = fma(_1189, _1205, _1217);
    float _1221 = fma(_1197, _1213, 1.570728778839111328125);
    float _1223 = fma(_1219, 0.5, 0.5);
    float _1225 = sqrt(_1191);
    float _1227 = _1203 * 0.693147182464599609375;
    float _1229 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1231 = _1209 * _1215;
    float _1233 = _1211 * _1215;
    float _1235 = fma(_1231, 0.5, 0.5);
    float _1237 = fma(_1233, -0.5, 0.5);
    float _1239 = _1225 * 0.636619746685028076171875;
    float _1241 = -_1221;
    float _1243 = fma(_1239, _1241, 1.0);
    float3 _3331 = float3(_1235, _1237, _1229);
    float _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3331, float3(0.0), isnan(_3331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3331, float3(0.0), isnan(_3331)), level(0.0)).x;
    float3 _3342 = float3(_1235, _1237, _1229);
    float4 _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3342, float3(0.0), isnan(_3342)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3342, float3(0.0), isnan(_3342)), level(0.0)).xyzw;
    float _1250 = _1248.x;
    float _1252 = _1248.y;
    float _1254 = _1248.z;
    float _1256 = _1248.w;
    float2 _3359 = float2(_1243, _1223);
    float3 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3359, float2(0.0), isnan(_3359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3359, float2(0.0), isnan(_3359)), level(0.0)).xyz;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = in.m_49.y;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1276 = _139 > 0.5;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1284 = _1282 != 0;
    float _1286 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1288 = -_511;
    int _1290 = _1276 ? as_type<int>(_1288) : as_type<int>(_511);
    float _1292 = 1.0 / _1274;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1286);
    bool _1300 = !_1284;
    float _1302 = _1300 ? _511 : as_type<float>(_1290);
    bool _1304 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1306 = isnan(_475);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    float _1316 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1298);
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1320 = _1302 + 0.5;
    float _1322 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1316);
    float _1324 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1326 = _1268 > 0.5;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1330 = _1280 * _1292;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1334 = _475 + _1332;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1338 = -_503;
    int _1340 = _1326 ? as_type<int>(_1338) : as_type<int>(_503);
    float _1342 = fma(_1330, _1334, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1344 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1346 = isnan(_475);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = _1324 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1360 = !_1296;
    float _1362 = _1360 ? _503 : as_type<float>(_1340);
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    bool _1368 = _929 > 0.0;
    bool _1370 = isnan(_929);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_45.x = _1358;
    float _1380 = _1314 * _1366;
    float _1382 = -_1314;
    float _1384 = _1382 + 1.0;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = _1342 * _1380;
    float _1392 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = -_1362;
    float _1396 = _1394 + 0.5;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1390);
    float _1400 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_58.x = _1386;
    out.m_58.y = _1388;
    out.m_58.z = _1392;
    float _1404 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1398);
    float _1406 = _1336 * _1318;
    float _1408 = _1402 * _1270;
    float _1410 = exp2(_1400);
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_60.x = _1406;
    out.m_60.y = _1408;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1420 = _1322 + _1179;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1211;
    out.gl_Position.z = _1322;
    out.gl_Position.w = _1179;
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1420 * 0.5;
    float _1430 = -_1410;
    float _1432 = _1430 + 1.0;
    out.m_62.x = _1422;
    out.m_62.y = _1424;
    out.m_62.z = _1426;
    out.m_62.w = _1412;
    float _1434 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1428;
    out.m_64.w = _1179;
    float _1436 = _1434 * _1245;
    float _1438 = -_1434;
    float _1440 = _1438 + 1.0;
    float _1442 = _1256 * _1436;
    float _1444 = _1266 * _1436;
    float _1446 = _1256 * _1440;
    float _1448 = fma(_1262, _1442, _1250);
    float _1450 = fma(_1264, _1442, _1252);
    float _1452 = fma(_1256, _1444, _1254);
    out.m_66.x = _1448;
    out.m_66.y = _1450;
    out.m_66.z = _1452;
    out.m_66.w = _1446;
    if (_1376)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1454;
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
        float _1510 = as_type<float>(_101);
        out.gl_Position.z = _1510;
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
        float _1579 = as_type<float>(_137);
        out.gl_Position.z = _1579;
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
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    bool _309 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = 1.0 / _299;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _307;
    float _327 = 1.0 / _303;
    float _329 = _287 * _321;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_319;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = _291 * _325;
    bool _351 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_283);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_341;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = _361 * _365;
    float _373 = -_361;
    float _375 = _373 + 1.0;
    float _377 = _295 * _327;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = fma(_369, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = fma(_393, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _375;
    float _409 = fma(_399, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = fma(_403, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = -_389;
    float _415 = _413 + 1.0;
    float _417 = _405 * _407;
    float _419 = _409 * _407;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _421;
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _427;
    float _431 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _433 = fma(_423, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _435 = fma(_395, _371, _425);
    float _437 = fma(_429, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_411, _371, _431);
    float _441 = fma(_433, _347, _435);
    float _443 = fma(_437, _347, _439);
    float _445 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[146].x, _441);
    float _447 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[146].y, _443);
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
    float _505 = _251 * _497;
    float _507 = _251 * _499;
    bool _509 = !_491;
    float _511 = _509 ? (-0.5) : 0.5;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _503);
    float _515 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _511);
    float _521 = _515 * _513;
    float _523 = _485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _525 = _517 * _519;
    float _527 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = _485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _533 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _535 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _523);
    float _537 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _529);
    float _541 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
    float _543 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
    float _547 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = _545 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _555 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _559 = _485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _551 + _553;
    float _563 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _565 = _555 + _557;
    float _567 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _571 = _561 + _569;
    float _573 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _563);
    float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _577 = _565 + _575;
    float _579 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _581 = _571 * _571;
    float _583 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _573);
    float _585 = _579 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = fma(_577, _577, _581);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_587);
    float _593 = _585 + _589;
    bool _595 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _597 = _563;
    float _599 = _533;
    float _601 = _567;
    if (!_595)
    {
        _597 = _565;
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
        float _623 = rsqrt(_587);
        float _625 = _621 * _617;
        float _627 = _593 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _629 = _625 * 0.15915493667125701904296875;
        float _631 = _629 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _629 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = _633 + (-1.0);
        float _641 = _639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = fma(_637, _627, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = fma(_593, _633, _641);
        float _647 = _623 * _643;
        float _649 = fma(_577, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
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
    float _667 = -_551;
    float _669 = _667 + _657;
    float _671 = _585 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _673 = _661 * _661;
    bool _675 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _677 = isnan(0.5);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _683 = _679 || _681;
    float _685 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _671);
    float _687 = fma(_665, _665, _673);
    bool _689 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _691 = isnan(0.5);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _697 = _693 || _695;
    float _699 = fma(_669, _669, _687);
    float _701 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _685);
    float _703 = _585 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = sqrt(_699);
    float _707 = _701 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _709 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _711 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _709);
    float _713 = 1.0 / _707;
    float _715 = _711 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _717 = _715 + _707;
    bool _719 = _705 > 0.0;
    float _721 = _717 * _713;
    float _723 = _721 * 0.5;
    bool _725 = !_719;
    float _727 = _655;
    float _729 = _657;
    float _731 = _653;
    float _733 = _713;
    float _735 = _707;
    if (!_725)
    {
        float _737 = _245 * _245;
        float _739 = fma(_197, _197, _737);
        float _741 = fma(_247, _247, _739);
        float _743 = rsqrt(_699);
        float _745 = sqrt(_741);
        float _747 = _665 * _743;
        float _749 = _661 * _743;
        float _751 = _669 * _743;
        bool _753 = _745 > 0.0;
        bool _755 = !_753;
        _733 = _741;
        _735 = _743;
        if (!_755)
        {
            float _757 = rsqrt(_741);
            float _759 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _761 = _245 * _757;
            float _763 = _197 * _757;
            float _765 = _749 * _761;
            float _767 = _247 * _757;
            float _769 = fma(_747, _763, _765);
            float _771 = _759 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _773 = fma(_751, _767, _769);
            float _775 = _773 * _771;
            float _777 = fma(_197, _775, _655);
            float _779 = fma(_245, _775, _653);
            float _781 = fma(_247, _775, _657);
            _727 = _777;
            _729 = _781;
            _731 = _779;
            _733 = _757;
            _735 = _775;
        }
    }
    float _783 = _727;
    float _785 = _729;
    float _787 = _731;
    float _789 = _733;
    float _791 = _735;
    float _793 = _791;
    float _795 = _787;
    float _797 = _785;
    float _799 = _789;
    if (_697)
    {
        _793 = 1.0;
    }
    float _801 = _793;
    float _803 = _801;
    if (_683)
    {
        _255 = _783;
    }
    float _805 = _255;
    float _807 = _805;
    if (_683)
    {
        _257 = _785;
    }
    float _809 = _257;
    float _811 = _809;
    if (!_683)
    {
        float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _815 = _585 + _813;
        float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _819 = _555 + _817;
        float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _823 = -_585;
        float _825 = _823 + _787;
        float _827 = _815 * _815;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _831 = _551 + _829;
        float _833 = -_551;
        float _835 = _833 + _785;
        float _837 = fma(_819, _819, _827);
        float _839 = -_555;
        float _841 = _839 + _783;
        float _843 = fma(_831, _831, _837);
        float _845 = sqrt(_843);
        float _847 = precise::min(_845, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _849 = _847 * _821;
        float _851 = fma(_841, _849, _555);
        float _853 = fma(_825, _849, _585);
        float _855 = fma(_835, _849, _551);
        _795 = _853;
        _807 = _851;
        _811 = _855;
        _797 = _835;
    }
    float _857 = _795;
    float _859 = _807;
    float _861 = _811;
    float _863 = _797;
    float _865 = _863;
    if (!_697)
    {
        float _867 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _875 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[30].w, _873);
        float _877 = _869 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = _871 * 0.15915493667125701904296875;
        float _883 = _869 * 6.283185482025146484375;
        float _885 = sin(_883);
        float _887 = 1.0 / _879;
        float _889 = _881 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _885 * _887;
        float _895 = _881 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _891 * _893;
        float _901 = 1.0 / _875;
        float _903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _903;
        float _907 = 1.0 / _899;
        float _909 = 1.0 / _905;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _913 = _901 * _911;
        float _915 = _897 * _907;
        float _917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _919 = fma(_915, _913, _917);
        float _921 = _919 * _909;
        float _923 = precise::clamp(_921, 0.0, 1.0);
        _799 = _869;
        _865 = _881;
        _803 = _923;
    }
    float _925 = _799;
    float _927 = _865;
    float _929 = _803;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _933 = _857 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _937 = _859 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _941 = _861 + _939;
    float _943 = _933 * _933;
    float _945 = fma(_937, _937, _943);
    float _947 = fma(_941, _941, _945);
    float _949 = rsqrt(_947);
    float _951 = sqrt(_947);
    float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _937 * _953;
    float _957 = _941 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _925;
    float _975 = _963;
    float _977 = _971;
    float _979 = _933;
    float _981 = _953;
    float _983 = _955;
    if (_967)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _985;
    }
    float _987 = _973;
    if (_967)
    {
        float _989 = rsqrt(_963);
        _975 = _989;
    }
    float _991 = _975;
    float _993 = _987;
    float _995 = _991;
    if (_967)
    {
        float _997 = _971 * _987;
        _977 = _997;
    }
    float _999 = _977;
    if (_967)
    {
        float _1001 = _999 * 0.15915493667125701904296875;
        _993 = _1001;
    }
    float _1003 = _993;
    float _1005 = _941;
    float _1007 = _1003;
    if (_967)
    {
        float _1009 = _1003 * 6.283185482025146484375;
        float _1011 = sin(_1009);
        _1005 = _1011;
    }
    float _1013 = _1005;
    float _1015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1017 = precise::max(0.0, _1015);
    float _1019 = _927;
    float _1021 = _1017;
    if (_967)
    {
        float _1023 = _1003 * 6.283185482025146484375;
        float _1025 = cos(_1023);
        _1019 = _1025;
    }
    float _1027 = _1019;
    float _1029 = -_953;
    float _1031 = -_1017;
    float _1033 = fma(_933, _1029, _1031);
    if (_967)
    {
        float _1035 = _1033 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1035;
    }
    float _1037 = _979;
    float _1039 = _1013;
    float _1041 = _1037;
    if (_967)
    {
        float _1043 = fma(_1013, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1039 = _1043;
    }
    float _1045 = _1039;
    float _1047 = _1045;
    if (!_967)
    {
        _1041 = _957;
    }
    float _1049 = _1041;
    float _1051 = _1049;
    if (_967)
    {
        float _1053 = _1027 + (-1.0);
        _1021 = _1053;
    }
    float _1055 = _1021;
    float _1057 = _1055;
    if (_967)
    {
        float _1059 = _991 * _1045;
        _981 = _1059;
    }
    float _1061 = _981;
    if (!_967)
    {
        _1047 = _1033;
    }
    float _1063 = _1047;
    float _1065 = _1063;
    if (_967)
    {
        float _1067 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1007 = _1067;
    }
    float _1069 = _1007;
    if (_967)
    {
        float _1071 = _955 * _1061;
        _983 = _1071;
    }
    float _1073 = _983;
    if (!_967)
    {
        _995 = _959;
    }
    float _1075 = _995;
    float _1077 = _1075;
    if (_967)
    {
        float _1079 = _957 * _1061;
        _1051 = _1079;
    }
    float _1081 = _1051;
    if (_967)
    {
        float _1083 = fma(_1033, _1027, _1069);
        _1065 = _1083;
    }
    float _1085 = _1065;
    if (_967)
    {
        float _1087 = _1073 * _1073;
        _1077 = _1087;
    }
    float _1089 = _1077;
    if (!_967)
    {
        _1057 = _961;
    }
    float _1091 = _1057;
    float _1093 = _1091;
    if (_967)
    {
        float _1095 = _1081 * _1081;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = fma(_1085, _1085, _1089);
    float _1101 = _1099 + _1097;
    float _1103 = _857 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1107 = fma(_951, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1105);
    float _1109 = precise::clamp(_1107, 0.0, 1.0);
    float _1111 = _857 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = rsqrt(_1101);
    float _1115 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1103);
    float _1117 = _857 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1111);
    float _1121 = -_1109;
    float _1123 = _1121 + 1.0;
    float _1125 = _857 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1127 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1129 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1119);
    float _1131 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1115);
    float _1133 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1125);
    float _1135 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1137 = abs(_1123);
    float _1139 = log2(_1137);
    float _1141 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1143 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1133);
    float _1145 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1151 = _1113 * _1073;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1157 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1149);
    float _1159 = _1113 * _1085;
    float _1161 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1163 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1165 = _1113 * _1081;
    float _1167 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1157);
    float _1169 = -_1161;
    float _1171 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1175 = -_1163;
    float _1177 = fma(_1175, _1155, 1.0);
    float _1179 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1181 = -_1165;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1187 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1189 = exp2(_1173);
    float _1191 = fma(_1183, -0.5, 0.5);
    float _1193 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1185);
    float _1195 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1187);
    float _1197 = fma(_1183, 0.5, 0.5);
    float _1199 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1201 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1195);
    float _1203 = log2(_1177);
    float _1205 = _1159 + 1.0;
    float _1207 = fma(_1197, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1209 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1199);
    float _1211 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1201);
    float _1213 = fma(_1197, _1207, -0.212114393711090087890625);
    float _1215 = 1.0 / _1179;
    float _1217 = -_1159;
    float _1219 = fma(_1189, _1205, _1217);
    float _1221 = fma(_1197, _1213, 1.570728778839111328125);
    float _1223 = fma(_1219, 0.5, 0.5);
    float _1225 = sqrt(_1191);
    float _1227 = _1203 * 0.693147182464599609375;
    float _1229 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1231 = _1209 * _1215;
    float _1233 = _1211 * _1215;
    float _1235 = fma(_1231, 0.5, 0.5);
    float _1237 = fma(_1233, -0.5, 0.5);
    float _1239 = _1225 * 0.636619746685028076171875;
    float _1241 = -_1221;
    float _1243 = fma(_1239, _1241, 1.0);
    float3 _3331 = float3(_1235, _1237, _1229);
    float _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3331, float3(0.0), isnan(_3331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3331, float3(0.0), isnan(_3331)), level(0.0)).x;
    float3 _3342 = float3(_1235, _1237, _1229);
    float4 _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3342, float3(0.0), isnan(_3342)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3342, float3(0.0), isnan(_3342)), level(0.0)).xyzw;
    float _1250 = _1248.x;
    float _1252 = _1248.y;
    float _1254 = _1248.z;
    float _1256 = _1248.w;
    float2 _3359 = float2(_1243, _1223);
    float3 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3359, float2(0.0), isnan(_3359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3359, float2(0.0), isnan(_3359)), level(0.0)).xyz;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = in.m_49.y;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1276 = _139 > 0.5;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1284 = _1282 != 0;
    float _1286 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1288 = -_511;
    int _1290 = _1276 ? as_type<int>(_1288) : as_type<int>(_511);
    float _1292 = 1.0 / _1274;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1286);
    bool _1300 = !_1284;
    float _1302 = _1300 ? _511 : as_type<float>(_1290);
    bool _1304 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1306 = isnan(_475);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    float _1316 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1298);
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1320 = _1302 + 0.5;
    float _1322 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1316);
    float _1324 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1326 = _1268 > 0.5;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1330 = _1280 * _1292;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1334 = _475 + _1332;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1338 = -_503;
    int _1340 = _1326 ? as_type<int>(_1338) : as_type<int>(_503);
    float _1342 = fma(_1330, _1334, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1344 = _475 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1346 = isnan(_475);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = _1324 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1360 = !_1296;
    float _1362 = _1360 ? _503 : as_type<float>(_1340);
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    bool _1368 = _929 > 0.0;
    bool _1370 = isnan(_929);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_45.x = _1358;
    float _1380 = _1314 * _1366;
    float _1382 = -_1314;
    float _1384 = _1382 + 1.0;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = _1342 * _1380;
    float _1392 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = -_1362;
    float _1396 = _1394 + 0.5;
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1390);
    float _1400 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_58.x = _1386;
    out.m_58.y = _1388;
    out.m_58.z = _1392;
    float _1404 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1398);
    float _1406 = _1336 * _1318;
    float _1408 = _1402 * _1270;
    float _1410 = exp2(_1400);
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_60.x = _1406;
    out.m_60.y = _1408;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1420 = _1322 + _1179;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1211;
    out.gl_Position.z = _1322;
    out.gl_Position.w = _1179;
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1420 * 0.5;
    float _1430 = -_1410;
    float _1432 = _1430 + 1.0;
    out.m_62.x = _1422;
    out.m_62.y = _1424;
    out.m_62.z = _1426;
    out.m_62.w = _1412;
    float _1434 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1428;
    out.m_64.w = _1179;
    float _1436 = _1434 * _1245;
    float _1438 = -_1434;
    float _1440 = _1438 + 1.0;
    float _1442 = _1256 * _1436;
    float _1444 = _1266 * _1436;
    float _1446 = _1256 * _1440;
    float _1448 = fma(_1262, _1442, _1250);
    float _1450 = fma(_1264, _1442, _1252);
    float _1452 = fma(_1256, _1444, _1254);
    out.m_66.x = _1448;
    out.m_66.y = _1450;
    out.m_66.z = _1452;
    out.m_66.w = _1446;
    if (_1376)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1454;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

