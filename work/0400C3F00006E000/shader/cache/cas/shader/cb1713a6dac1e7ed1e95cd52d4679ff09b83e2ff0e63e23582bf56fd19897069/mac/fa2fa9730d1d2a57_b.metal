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
    float4 m_55 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
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
    float4 m_53 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _551 = false;
    bool _417 = false;
    bool _271 = false;
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
        float _1518 = as_type<float>(_101);
        out.gl_Position.z = _1518;
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
        float _1587 = as_type<float>(_137);
        out.gl_Position.z = _1587;
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
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _117 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    bool _297 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_279);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -_295;
    float _319 = _317 + 1.0;
    float _321 = 1.0 / _311;
    bool _323 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _325 = isnan(_279);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _307 * _319;
    float _337 = -_307;
    float _339 = _337 + 1.0;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _343 = _333 * _339;
    float _345 = 1.0 / _315;
    float _347 = -_333;
    float _349 = _347 + 1.0;
    float _351 = _283 * _321;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _279 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = _355 * _345;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = _365 * _343;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = _367 * _343;
    float _383 = fma(_373, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _387 = fma(_379, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _391 = fma(_383, _335, _385);
    float _393 = fma(_387, _335, _389);
    float _395 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[145].x, _391);
    float _397 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[145].y, _393);
    bool _399 = !_341;
    float _415;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _403 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_85);
        float _421 = 1.0 / _419;
        float _423 = _117 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = _425 + _427;
    bool _431 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _433 = isnan(_425);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _443;
    bool _447 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _449 = isnan(_425);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_441;
    float _461 = _459 + 1.0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _463;
    float _467 = 1.0 / _445;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _471 = _457 * _461;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = _429 * _467;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _479;
    float _483 = fma(_465, _477, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = fma(_481, _477, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _491 = _483 * _471;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _495 = fma(_487, _477, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = _489 * _471;
    float _499 = in.m_53.x;
    float _501 = in.m_53.y;
    float _503 = _495 * _471;
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _507 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].y, _503);
    float _509 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].z, _497);
    float _511 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].x, _505);
    float _513 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].y, _507);
    float _515 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].z, _509);
    float _517 = _511 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _521 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _523;
    out.m_55.y = _525;
    out.m_55.z = _527;
    out.m_55.w = _493;
    float _529 = _397 * _501;
    float _531 = _395 * _499;
    bool _533 = !_469;
    float _549;
    if (!_533)
    {
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _537 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        float _553 = float(_85);
        float _555 = 1.0 / _553;
        float _557 = _117 * _555;
        _549 = _557;
    }
    _551 = false;
    float _559 = _549;
    float _561 = as_type<float>(int(gl_VertexIndex));
    float _563 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    int _571 = as_type<int>(_561) & 1;
    bool _573 = _571 != 0;
    int _575 = as_type<int>(_561) & 2;
    bool _577 = _575 != 0;
    float _579 = _251 * _529;
    float _581 = _251 * _531;
    float _583 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _585 = !_577;
    float _587 = _585 ? (-0.5) : 0.5;
    float _589 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _591 = !_573;
    float _593 = _591 ? (-0.5) : 0.5;
    float _595 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
    float _599 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _587);
    float _601 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _593);
    float _603 = _589 * _599;
    float _605 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _607 = _595 * _601;
    float _609 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _611 = _603 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _613 = _603 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _615 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].x, _605);
    float _617 = _603 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _611);
    float _621 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _597);
    float _623 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
    float _625 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _615);
    float _627 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[26].z, _619);
    float _629 = _621 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _631 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
    float _633 = _625 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _635 = _627 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _637 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
    float _639 = _631 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _641 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
    float _643 = _629 + _635;
    float _645 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = _633 + _639;
    float _649 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _653 = _643 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _657 = _647 + _655;
    float _659 = _649 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _661 = _653 * _653;
    float _663 = fma(_657, _657, _661);
    float _665 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _667 = sqrt(_663);
    float _669 = _665 + _659;
    bool _671 = _667 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _673 = _645;
    float _675 = _565;
    float _677 = _647;
    float _679 = _629;
    if (!_671)
    {
        _673 = _643;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_671)
    {
        _675 = _669;
    }
    float _685 = _675;
    bool _687 = !_671;
    float _689 = _685;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _667 + _693;
        float _697 = _669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_663);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = fma(_669, _707, _715);
        float _721 = _699 * _717;
        float _723 = fma(_657, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_653, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _719;
        _677 = _723;
        _683 = _725;
    }
    float _727 = _689;
    float _729 = _677;
    float _731 = _683;
    float _733 = -_665;
    float _735 = _733 + _727;
    float _737 = -_633;
    float _739 = _737 + _729;
    float _741 = -_629;
    float _743 = _741 + _731;
    float _745 = _665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _747 = _735 * _735;
    float _749 = _665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _753 = isnan(0.5);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _759 = _755 || _757;
    float _761 = fma(_739, _739, _747);
    float _763 = fma(_743, _743, _761);
    float _765 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    float _767 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[10].x, _749);
    float _769 = sqrt(_763);
    float _771 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[11].z, _765);
    float _773 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[10].z, _767);
    float _775 = _749;
    float _777 = _727;
    float _779 = _729;
    float _781 = _743;
    if (_759)
    {
        _775 = 1.0;
    }
    float _783 = _775;
    float _785 = _771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _787 = _773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _789 = 1.0 / _785;
    float _791 = _787 + _785;
    bool _793 = _769 > 0.0;
    float _795 = _791 * _789;
    float _797 = _795 * 0.5;
    float _799 = _791;
    float _801 = _783;
    if (!_793)
    {
        _679 = _731;
    }
    float _803 = _679;
    bool _805 = !_793;
    float _807 = _803;
    if (!_805)
    {
        float _809 = _245 * _245;
        float _811 = fma(_197, _197, _809);
        float _813 = fma(_247, _247, _811);
        float _815 = rsqrt(_763);
        float _817 = sqrt(_813);
        float _819 = _739 * _815;
        float _821 = _735 * _815;
        float _823 = _743 * _815;
        bool _825 = _817 > 0.0;
        float _827 = _815;
        _781 = _823;
        if (!_825)
        {
            _827 = _731;
        }
        float _829 = _827;
        bool _831 = !_825;
        _807 = _829;
        if (!_831)
        {
            float _833 = rsqrt(_813);
            float _835 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _837 = _245 * _833;
            float _839 = _197 * _833;
            float _841 = _247 * _833;
            float _843 = _821 * _837;
            float _845 = fma(_819, _839, _843);
            float _847 = _835 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _849 = fma(_823, _841, _845);
            float _851 = _849 * _847;
            float _853 = fma(_197, _851, _729);
            float _855 = fma(_245, _851, _727);
            float _857 = fma(_247, _851, _731);
            _777 = _855;
            _779 = _853;
            _807 = _857;
            _799 = _845;
        }
    }
    float _859 = _777;
    float _861 = _779;
    float _863 = _807;
    float _865 = _799;
    float _867 = _781;
    float _869 = _865;
    float _871 = _867;
    if (!_759)
    {
        float _873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _875 = _873 * 0.15915493667125701904296875;
        float _877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _879 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _881 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _879);
        float _883 = _875 * 6.283185482025146484375;
        float _885 = cos(_883);
        float _887 = _877 * 0.15915493667125701904296875;
        float _889 = _875 * 6.283185482025146484375;
        float _891 = sin(_889);
        float _893 = 1.0 / _885;
        float _895 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _897 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _895;
        float _899 = _887 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = _891 * _893;
        float _905 = _887 * 6.283185482025146484375;
        float _907 = sin(_905);
        float _909 = _901 * _903;
        float _911 = 1.0 / _881;
        float _913 = 1.0 / _909;
        float _915 = 1.0 / _897;
        float _917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _919 = _911 * _917;
        float _921 = _907 * _913;
        float _923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _925 = fma(_921, _919, _923);
        float _927 = _925 * _915;
        float _929 = precise::clamp(_927, 0.0, 1.0);
        _801 = _929;
    }
    float _931 = _801;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _859 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _939 = _861 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _943 = _863 + _941;
    float _945 = _935 * _935;
    float _947 = fma(_939, _939, _945);
    float _949 = fma(_943, _943, _947);
    float _951 = rsqrt(_949);
    float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _939 * _953;
    float _957 = _943 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _943;
    float _975 = _963;
    float _977 = _971;
    float _979 = _953;
    float _981 = _955;
    if (_967)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _983;
    }
    float _985 = _973;
    if (_967)
    {
        float _987 = rsqrt(_963);
        _975 = _987;
    }
    float _989 = _975;
    float _991 = _989;
    if (_967)
    {
        float _993 = _971 * _985;
        _977 = _993;
    }
    float _995 = _977;
    if (_967)
    {
        float _997 = _995 * 0.15915493667125701904296875;
        _869 = _997;
    }
    float _999 = _869;
    float _1001 = _985;
    if (_967)
    {
        float _1003 = _999 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _1001 = _1005;
    }
    float _1007 = _1001;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _945;
    float _1015 = _1011;
    if (_967)
    {
        float _1017 = _999 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        _1013 = _1019;
    }
    float _1021 = _1013;
    float _1023 = -_953;
    float _1025 = -_1011;
    float _1027 = fma(_935, _1023, _1025);
    float _1029 = _1027;
    if (_967)
    {
        float _1031 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1031;
    }
    float _1033 = _1015;
    float _1035 = sqrt(_949);
    float _1037 = _1007;
    float _1039 = _1033;
    if (_967)
    {
        float _1041 = fma(_1007, _1033, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = _1043;
    if (_967)
    {
        float _1047 = _1021 + (-1.0);
        _1039 = _1047;
    }
    float _1049 = _1039;
    float _1051 = _1049;
    if (_967)
    {
        float _1053 = _989 * _1043;
        _871 = _1053;
    }
    float _1055 = _871;
    if (!_967)
    {
        _1045 = _1027;
    }
    float _1057 = _1045;
    float _1059 = _1057;
    if (_967)
    {
        float _1061 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1061;
    }
    float _1063 = _979;
    if (_967)
    {
        float _1065 = _955 * _1055;
        _981 = _1065;
    }
    float _1067 = _981;
    if (!_967)
    {
        _1051 = _957;
    }
    float _1069 = _1051;
    float _1071 = _1069;
    if (_967)
    {
        float _1073 = _957 * _1055;
        _1071 = _1073;
    }
    float _1075 = _1071;
    if (!_967)
    {
        _991 = _959;
    }
    float _1077 = _991;
    float _1079 = _1077;
    if (_967)
    {
        float _1081 = fma(_1027, _1021, _1063);
        _1059 = _1081;
    }
    float _1083 = _1059;
    if (_967)
    {
        float _1085 = _1067 * _1067;
        _1079 = _1085;
    }
    float _1087 = _1079;
    if (!_967)
    {
        _1029 = _961;
    }
    float _1089 = _1029;
    float _1091 = _1089;
    if (_967)
    {
        float _1093 = _1075 * _1075;
        _1091 = _1093;
    }
    float _1095 = _1091;
    float _1097 = fma(_1083, _1083, _1087);
    float _1099 = _1097 + _1095;
    float _1101 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1105 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1103);
    float _1107 = precise::clamp(_1105, 0.0, 1.0);
    float _1109 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1111 = rsqrt(_1099);
    float _1113 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1101);
    float _1115 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1117 = -_1107;
    float _1119 = _1117 + 1.0;
    float _1121 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1113);
    float _1123 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1125 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1115);
    float _1127 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = abs(_1119);
    float _1131 = log2(_1129);
    float _1133 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1123);
    float _1135 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1137 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1139 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1141 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1133);
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = _1111 * _1067;
    float _1147 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1137);
    float _1149 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1151 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1155 = _1111 * _1075;
    float _1157 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1151);
    float _1161 = _1111 * _1083;
    float _1163 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1165 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1159);
    float _1169 = -_1153;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = -_1157;
    float _1175 = fma(_1173, _1109, 1.0);
    float _1177 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1179 = exp2(_1163);
    float _1181 = -_1155;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1187 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1189 = fma(_1183, -0.5, 0.5);
    float _1191 = fma(_1183, 0.5, 0.5);
    float _1193 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1187);
    float _1195 = log2(_1175);
    float _1197 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1177);
    float _1199 = _1161 + 1.0;
    float _1201 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1203 = fma(_1191, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1205 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1197);
    float _1207 = 1.0 / _1185;
    float _1209 = -_1161;
    float _1211 = fma(_1179, _1199, _1209);
    float _1213 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1215 = fma(_1191, _1203, -0.212114393711090087890625);
    float _1217 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1205);
    float _1219 = fma(_1211, 0.5, 0.5);
    float _1221 = fma(_1191, _1215, 1.570728778839111328125);
    float _1223 = sqrt(_1189);
    float _1225 = _1195 * 0.693147182464599609375;
    float _1227 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1229 = _1213 * _1207;
    float _1231 = _1217 * _1207;
    float _1233 = fma(_1229, 0.5, 0.5);
    float _1235 = fma(_1231, -0.5, 0.5);
    float _1237 = _1223 * 0.636619746685028076171875;
    float3 _3369 = float3(_1233, _1235, _1227);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3369, float3(0.0), isnan(_3369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3369, float3(0.0), isnan(_3369)), level(0.0)).x;
    float3 _3380 = float3(_1233, _1235, _1227);
    float4 _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3380, float3(0.0), isnan(_3380)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3380, float3(0.0), isnan(_3380)), level(0.0)).xyzw;
    float _1244 = _1242.x;
    float _1246 = _1242.y;
    float _1248 = _1242.z;
    float _1250 = _1242.w;
    float _1252 = -_1221;
    float _1254 = fma(_1237, _1252, 1.0);
    float2 _3402 = float2(_1254, _1219);
    float3 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3402, float2(0.0), isnan(_3402)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3402, float2(0.0), isnan(_3402)), level(0.0)).xyz;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = in.m_49.y;
    bool _1268 = _139 > 0.5;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1272 = _559 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1274;
    float _1278 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1282 = _1280 != 0;
    float _1284 = 1.0 / _1276;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1278);
    float _1292 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1294 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1290);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1300 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1294);
    out.m_45.x = _1298;
    float _1302 = _1272 * _1284;
    float _1304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1306 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1308 = isnan(_559);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    bool _1318 = _1266 > 0.5;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1320;
    bool _1324 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1326 = isnan(_559);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1336;
    float _1340 = -_1316;
    float _1342 = _1340 + 1.0;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1344;
    float _1348 = -_587;
    int _1350 = _1318 ? as_type<int>(_1348) : as_type<int>(_587);
    float _1352 = fma(_1322, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1354 = _1334 * _1342;
    float _1356 = -_593;
    int _1358 = _1268 ? as_type<int>(_1356) : as_type<int>(_593);
    float _1360 = fma(_1346, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1362 = !_1288;
    float _1364 = _1362 ? _587 : as_type<float>(_1350);
    float _1366 = -_1334;
    float _1368 = _1366 + 1.0;
    float _1370 = _1352 * _1354;
    bool _1372 = !_1282;
    float _1374 = _1372 ? _593 : as_type<float>(_1358);
    float _1376 = _1360 * _1354;
    float _1378 = fma(_1338, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1370);
    float _1382 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1376);
    float _1386 = _1378 * _1354;
    float _1388 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1380);
    float _1390 = exp2(_1382);
    float _1392 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1384);
    float _1394 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1398 = _1374 + 0.5;
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1402 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1394);
    float _1404 = -_1364;
    float _1406 = _1404 + 0.5;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1300 + _1185;
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1416 = _931 > 0.0;
    bool _1418 = isnan(_931);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan(0.0);
    bool _1424 = _1420 || _1422;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1428 = _1412 * 0.5;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = -_1390;
    float _1434 = _1432 + 1.0;
    float _1436 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1438 = _1426 * _1296;
    float _1440 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.x = _1408;
    out.m_60.y = _1410;
    out.m_60.z = _1430;
    float _1442 = _1436 * _1304;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1217;
    out.gl_Position.z = _1300;
    out.gl_Position.w = _1185;
    out.m_62.x = _1438;
    out.m_62.y = _1442;
    out.m_64.z = _1428;
    out.m_64.w = _1185;
    float _1444 = _1440 * _1239;
    float _1446 = -_1440;
    float _1448 = _1446 + 1.0;
    float _1450 = _1250 * _1444;
    float _1452 = _1264 * _1444;
    float _1454 = fma(_1260, _1450, _1244);
    float _1456 = fma(_1262, _1450, _1246);
    float _1458 = _1250 * _1448;
    float _1460 = fma(_1250, _1452, _1248);
    out.m_66.x = _1454;
    out.m_66.y = _1456;
    out.m_66.z = _1460;
    out.m_66.w = _1458;
    if (_1424)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1462 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1462;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _551 = false;
    bool _417 = false;
    bool _271 = false;
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
        float _1518 = as_type<float>(_101);
        out.gl_Position.z = _1518;
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
        float _1587 = as_type<float>(_137);
        out.gl_Position.z = _1587;
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
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _117 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    bool _297 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_279);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -_295;
    float _319 = _317 + 1.0;
    float _321 = 1.0 / _311;
    bool _323 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _325 = isnan(_279);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _307 * _319;
    float _337 = -_307;
    float _339 = _337 + 1.0;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _343 = _333 * _339;
    float _345 = 1.0 / _315;
    float _347 = -_333;
    float _349 = _347 + 1.0;
    float _351 = _283 * _321;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _279 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = _355 * _345;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = _365 * _343;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = _367 * _343;
    float _383 = fma(_373, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _387 = fma(_379, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _391 = fma(_383, _335, _385);
    float _393 = fma(_387, _335, _389);
    float _395 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[145].x, _391);
    float _397 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[145].y, _393);
    bool _399 = !_341;
    float _415;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _403 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_85);
        float _421 = 1.0 / _419;
        float _423 = _117 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = _425 + _427;
    bool _431 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _433 = isnan(_425);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _443;
    bool _447 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _449 = isnan(_425);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_441;
    float _461 = _459 + 1.0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _463;
    float _467 = 1.0 / _445;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _471 = _457 * _461;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = _429 * _467;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _479;
    float _483 = fma(_465, _477, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = fma(_481, _477, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _491 = _483 * _471;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _495 = fma(_487, _477, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = _489 * _471;
    float _499 = in.m_53.x;
    float _501 = in.m_53.y;
    float _503 = _495 * _471;
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _507 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].y, _503);
    float _509 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].z, _497);
    float _511 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].x, _505);
    float _513 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].y, _507);
    float _515 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].z, _509);
    float _517 = _511 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _521 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _523;
    out.m_55.y = _525;
    out.m_55.z = _527;
    out.m_55.w = _493;
    float _529 = _397 * _501;
    float _531 = _395 * _499;
    bool _533 = !_469;
    float _549;
    if (!_533)
    {
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _537 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        float _553 = float(_85);
        float _555 = 1.0 / _553;
        float _557 = _117 * _555;
        _549 = _557;
    }
    _551 = false;
    float _559 = _549;
    float _561 = as_type<float>(int(gl_VertexIndex));
    float _563 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    int _571 = as_type<int>(_561) & 1;
    bool _573 = _571 != 0;
    int _575 = as_type<int>(_561) & 2;
    bool _577 = _575 != 0;
    float _579 = _251 * _529;
    float _581 = _251 * _531;
    float _583 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _585 = !_577;
    float _587 = _585 ? (-0.5) : 0.5;
    float _589 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _591 = !_573;
    float _593 = _591 ? (-0.5) : 0.5;
    float _595 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
    float _599 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _587);
    float _601 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _593);
    float _603 = _589 * _599;
    float _605 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _607 = _595 * _601;
    float _609 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _611 = _603 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _613 = _603 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _615 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].x, _605);
    float _617 = _603 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _611);
    float _621 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _597);
    float _623 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
    float _625 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _615);
    float _627 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[26].z, _619);
    float _629 = _621 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _631 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
    float _633 = _625 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _635 = _627 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _637 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
    float _639 = _631 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _641 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
    float _643 = _629 + _635;
    float _645 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = _633 + _639;
    float _649 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _653 = _643 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _657 = _647 + _655;
    float _659 = _649 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _661 = _653 * _653;
    float _663 = fma(_657, _657, _661);
    float _665 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _667 = sqrt(_663);
    float _669 = _665 + _659;
    bool _671 = _667 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _673 = _645;
    float _675 = _565;
    float _677 = _647;
    float _679 = _629;
    if (!_671)
    {
        _673 = _643;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_671)
    {
        _675 = _669;
    }
    float _685 = _675;
    bool _687 = !_671;
    float _689 = _685;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _667 + _693;
        float _697 = _669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_663);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = fma(_669, _707, _715);
        float _721 = _699 * _717;
        float _723 = fma(_657, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_653, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _719;
        _677 = _723;
        _683 = _725;
    }
    float _727 = _689;
    float _729 = _677;
    float _731 = _683;
    float _733 = -_665;
    float _735 = _733 + _727;
    float _737 = -_633;
    float _739 = _737 + _729;
    float _741 = -_629;
    float _743 = _741 + _731;
    float _745 = _665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _747 = _735 * _735;
    float _749 = _665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _753 = isnan(0.5);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _759 = _755 || _757;
    float _761 = fma(_739, _739, _747);
    float _763 = fma(_743, _743, _761);
    float _765 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    float _767 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[10].x, _749);
    float _769 = sqrt(_763);
    float _771 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[11].z, _765);
    float _773 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[10].z, _767);
    float _775 = _749;
    float _777 = _727;
    float _779 = _729;
    float _781 = _743;
    if (_759)
    {
        _775 = 1.0;
    }
    float _783 = _775;
    float _785 = _771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _787 = _773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _789 = 1.0 / _785;
    float _791 = _787 + _785;
    bool _793 = _769 > 0.0;
    float _795 = _791 * _789;
    float _797 = _795 * 0.5;
    float _799 = _791;
    float _801 = _783;
    if (!_793)
    {
        _679 = _731;
    }
    float _803 = _679;
    bool _805 = !_793;
    float _807 = _803;
    if (!_805)
    {
        float _809 = _245 * _245;
        float _811 = fma(_197, _197, _809);
        float _813 = fma(_247, _247, _811);
        float _815 = rsqrt(_763);
        float _817 = sqrt(_813);
        float _819 = _739 * _815;
        float _821 = _735 * _815;
        float _823 = _743 * _815;
        bool _825 = _817 > 0.0;
        float _827 = _815;
        _781 = _823;
        if (!_825)
        {
            _827 = _731;
        }
        float _829 = _827;
        bool _831 = !_825;
        _807 = _829;
        if (!_831)
        {
            float _833 = rsqrt(_813);
            float _835 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _837 = _245 * _833;
            float _839 = _197 * _833;
            float _841 = _247 * _833;
            float _843 = _821 * _837;
            float _845 = fma(_819, _839, _843);
            float _847 = _835 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _849 = fma(_823, _841, _845);
            float _851 = _849 * _847;
            float _853 = fma(_197, _851, _729);
            float _855 = fma(_245, _851, _727);
            float _857 = fma(_247, _851, _731);
            _777 = _855;
            _779 = _853;
            _807 = _857;
            _799 = _845;
        }
    }
    float _859 = _777;
    float _861 = _779;
    float _863 = _807;
    float _865 = _799;
    float _867 = _781;
    float _869 = _865;
    float _871 = _867;
    if (!_759)
    {
        float _873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _875 = _873 * 0.15915493667125701904296875;
        float _877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _879 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _881 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _879);
        float _883 = _875 * 6.283185482025146484375;
        float _885 = cos(_883);
        float _887 = _877 * 0.15915493667125701904296875;
        float _889 = _875 * 6.283185482025146484375;
        float _891 = sin(_889);
        float _893 = 1.0 / _885;
        float _895 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _897 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _895;
        float _899 = _887 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = _891 * _893;
        float _905 = _887 * 6.283185482025146484375;
        float _907 = sin(_905);
        float _909 = _901 * _903;
        float _911 = 1.0 / _881;
        float _913 = 1.0 / _909;
        float _915 = 1.0 / _897;
        float _917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _919 = _911 * _917;
        float _921 = _907 * _913;
        float _923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _925 = fma(_921, _919, _923);
        float _927 = _925 * _915;
        float _929 = precise::clamp(_927, 0.0, 1.0);
        _801 = _929;
    }
    float _931 = _801;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _859 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _939 = _861 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _943 = _863 + _941;
    float _945 = _935 * _935;
    float _947 = fma(_939, _939, _945);
    float _949 = fma(_943, _943, _947);
    float _951 = rsqrt(_949);
    float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _939 * _953;
    float _957 = _943 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _943;
    float _975 = _963;
    float _977 = _971;
    float _979 = _953;
    float _981 = _955;
    if (_967)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _983;
    }
    float _985 = _973;
    if (_967)
    {
        float _987 = rsqrt(_963);
        _975 = _987;
    }
    float _989 = _975;
    float _991 = _989;
    if (_967)
    {
        float _993 = _971 * _985;
        _977 = _993;
    }
    float _995 = _977;
    if (_967)
    {
        float _997 = _995 * 0.15915493667125701904296875;
        _869 = _997;
    }
    float _999 = _869;
    float _1001 = _985;
    if (_967)
    {
        float _1003 = _999 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _1001 = _1005;
    }
    float _1007 = _1001;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _945;
    float _1015 = _1011;
    if (_967)
    {
        float _1017 = _999 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        _1013 = _1019;
    }
    float _1021 = _1013;
    float _1023 = -_953;
    float _1025 = -_1011;
    float _1027 = fma(_935, _1023, _1025);
    float _1029 = _1027;
    if (_967)
    {
        float _1031 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1031;
    }
    float _1033 = _1015;
    float _1035 = sqrt(_949);
    float _1037 = _1007;
    float _1039 = _1033;
    if (_967)
    {
        float _1041 = fma(_1007, _1033, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = _1043;
    if (_967)
    {
        float _1047 = _1021 + (-1.0);
        _1039 = _1047;
    }
    float _1049 = _1039;
    float _1051 = _1049;
    if (_967)
    {
        float _1053 = _989 * _1043;
        _871 = _1053;
    }
    float _1055 = _871;
    if (!_967)
    {
        _1045 = _1027;
    }
    float _1057 = _1045;
    float _1059 = _1057;
    if (_967)
    {
        float _1061 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1061;
    }
    float _1063 = _979;
    if (_967)
    {
        float _1065 = _955 * _1055;
        _981 = _1065;
    }
    float _1067 = _981;
    if (!_967)
    {
        _1051 = _957;
    }
    float _1069 = _1051;
    float _1071 = _1069;
    if (_967)
    {
        float _1073 = _957 * _1055;
        _1071 = _1073;
    }
    float _1075 = _1071;
    if (!_967)
    {
        _991 = _959;
    }
    float _1077 = _991;
    float _1079 = _1077;
    if (_967)
    {
        float _1081 = fma(_1027, _1021, _1063);
        _1059 = _1081;
    }
    float _1083 = _1059;
    if (_967)
    {
        float _1085 = _1067 * _1067;
        _1079 = _1085;
    }
    float _1087 = _1079;
    if (!_967)
    {
        _1029 = _961;
    }
    float _1089 = _1029;
    float _1091 = _1089;
    if (_967)
    {
        float _1093 = _1075 * _1075;
        _1091 = _1093;
    }
    float _1095 = _1091;
    float _1097 = fma(_1083, _1083, _1087);
    float _1099 = _1097 + _1095;
    float _1101 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1105 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1103);
    float _1107 = precise::clamp(_1105, 0.0, 1.0);
    float _1109 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1111 = rsqrt(_1099);
    float _1113 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1101);
    float _1115 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1117 = -_1107;
    float _1119 = _1117 + 1.0;
    float _1121 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1113);
    float _1123 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1125 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1115);
    float _1127 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = abs(_1119);
    float _1131 = log2(_1129);
    float _1133 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1123);
    float _1135 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1137 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1139 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1141 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1133);
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = _1111 * _1067;
    float _1147 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1137);
    float _1149 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1151 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1155 = _1111 * _1075;
    float _1157 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1151);
    float _1161 = _1111 * _1083;
    float _1163 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1165 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1159);
    float _1169 = -_1153;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = -_1157;
    float _1175 = fma(_1173, _1109, 1.0);
    float _1177 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1179 = exp2(_1163);
    float _1181 = -_1155;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1187 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1189 = fma(_1183, -0.5, 0.5);
    float _1191 = fma(_1183, 0.5, 0.5);
    float _1193 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1187);
    float _1195 = log2(_1175);
    float _1197 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1177);
    float _1199 = _1161 + 1.0;
    float _1201 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1203 = fma(_1191, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1205 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1197);
    float _1207 = 1.0 / _1185;
    float _1209 = -_1161;
    float _1211 = fma(_1179, _1199, _1209);
    float _1213 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1215 = fma(_1191, _1203, -0.212114393711090087890625);
    float _1217 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1205);
    float _1219 = fma(_1211, 0.5, 0.5);
    float _1221 = fma(_1191, _1215, 1.570728778839111328125);
    float _1223 = sqrt(_1189);
    float _1225 = _1195 * 0.693147182464599609375;
    float _1227 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1229 = _1213 * _1207;
    float _1231 = _1217 * _1207;
    float _1233 = fma(_1229, 0.5, 0.5);
    float _1235 = fma(_1231, -0.5, 0.5);
    float _1237 = _1223 * 0.636619746685028076171875;
    float3 _3369 = float3(_1233, _1235, _1227);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3369, float3(0.0), isnan(_3369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3369, float3(0.0), isnan(_3369)), level(0.0)).x;
    float3 _3380 = float3(_1233, _1235, _1227);
    float4 _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3380, float3(0.0), isnan(_3380)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3380, float3(0.0), isnan(_3380)), level(0.0)).xyzw;
    float _1244 = _1242.x;
    float _1246 = _1242.y;
    float _1248 = _1242.z;
    float _1250 = _1242.w;
    float _1252 = -_1221;
    float _1254 = fma(_1237, _1252, 1.0);
    float2 _3402 = float2(_1254, _1219);
    float3 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3402, float2(0.0), isnan(_3402)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3402, float2(0.0), isnan(_3402)), level(0.0)).xyz;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = in.m_49.y;
    bool _1268 = _139 > 0.5;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1272 = _559 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1274;
    float _1278 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1282 = _1280 != 0;
    float _1284 = 1.0 / _1276;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1278);
    float _1292 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1294 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1290);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1300 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1294);
    out.m_45.x = _1298;
    float _1302 = _1272 * _1284;
    float _1304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1306 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1308 = isnan(_559);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    bool _1318 = _1266 > 0.5;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1320;
    bool _1324 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1326 = isnan(_559);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1336;
    float _1340 = -_1316;
    float _1342 = _1340 + 1.0;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1344;
    float _1348 = -_587;
    int _1350 = _1318 ? as_type<int>(_1348) : as_type<int>(_587);
    float _1352 = fma(_1322, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1354 = _1334 * _1342;
    float _1356 = -_593;
    int _1358 = _1268 ? as_type<int>(_1356) : as_type<int>(_593);
    float _1360 = fma(_1346, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1362 = !_1288;
    float _1364 = _1362 ? _587 : as_type<float>(_1350);
    float _1366 = -_1334;
    float _1368 = _1366 + 1.0;
    float _1370 = _1352 * _1354;
    bool _1372 = !_1282;
    float _1374 = _1372 ? _593 : as_type<float>(_1358);
    float _1376 = _1360 * _1354;
    float _1378 = fma(_1338, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1370);
    float _1382 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1376);
    float _1386 = _1378 * _1354;
    float _1388 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1380);
    float _1390 = exp2(_1382);
    float _1392 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1384);
    float _1394 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1398 = _1374 + 0.5;
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1402 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1394);
    float _1404 = -_1364;
    float _1406 = _1404 + 0.5;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1300 + _1185;
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1416 = _931 > 0.0;
    bool _1418 = isnan(_931);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan(0.0);
    bool _1424 = _1420 || _1422;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1428 = _1412 * 0.5;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = -_1390;
    float _1434 = _1432 + 1.0;
    float _1436 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1438 = _1426 * _1296;
    float _1440 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.x = _1408;
    out.m_60.y = _1410;
    out.m_60.z = _1430;
    float _1442 = _1436 * _1304;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1217;
    out.gl_Position.z = _1300;
    out.gl_Position.w = _1185;
    out.m_62.x = _1438;
    out.m_62.y = _1442;
    out.m_64.z = _1428;
    out.m_64.w = _1185;
    float _1444 = _1440 * _1239;
    float _1446 = -_1440;
    float _1448 = _1446 + 1.0;
    float _1450 = _1250 * _1444;
    float _1452 = _1264 * _1444;
    float _1454 = fma(_1260, _1450, _1244);
    float _1456 = fma(_1262, _1450, _1246);
    float _1458 = _1250 * _1448;
    float _1460 = fma(_1250, _1452, _1248);
    out.m_66.x = _1454;
    out.m_66.y = _1456;
    out.m_66.z = _1460;
    out.m_66.w = _1458;
    if (_1424)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1462 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1462;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _551 = false;
    bool _417 = false;
    bool _271 = false;
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
        float _1518 = as_type<float>(_101);
        out.gl_Position.z = _1518;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1587 = as_type<float>(_137);
        out.gl_Position.z = _1587;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _117 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    bool _297 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_279);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -_295;
    float _319 = _317 + 1.0;
    float _321 = 1.0 / _311;
    bool _323 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _325 = isnan(_279);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _307 * _319;
    float _337 = -_307;
    float _339 = _337 + 1.0;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _343 = _333 * _339;
    float _345 = 1.0 / _315;
    float _347 = -_333;
    float _349 = _347 + 1.0;
    float _351 = _283 * _321;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _279 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = _355 * _345;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = _365 * _343;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = _367 * _343;
    float _383 = fma(_373, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _387 = fma(_379, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _391 = fma(_383, _335, _385);
    float _393 = fma(_387, _335, _389);
    float _395 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[145].x, _391);
    float _397 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[145].y, _393);
    bool _399 = !_341;
    float _415;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _403 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_85);
        float _421 = 1.0 / _419;
        float _423 = _117 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = _425 + _427;
    bool _431 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _433 = isnan(_425);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _443;
    bool _447 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _449 = isnan(_425);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_441;
    float _461 = _459 + 1.0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _463;
    float _467 = 1.0 / _445;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _471 = _457 * _461;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = _429 * _467;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _479;
    float _483 = fma(_465, _477, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = fma(_481, _477, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _491 = _483 * _471;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _495 = fma(_487, _477, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = _489 * _471;
    float _499 = in.m_53.x;
    float _501 = in.m_53.y;
    float _503 = _495 * _471;
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _507 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].y, _503);
    float _509 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].z, _497);
    float _511 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].x, _505);
    float _513 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].y, _507);
    float _515 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[108].z, _509);
    float _517 = _511 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _521 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _523;
    out.m_55.y = _525;
    out.m_55.z = _527;
    out.m_55.w = _493;
    float _529 = _397 * _501;
    float _531 = _395 * _499;
    bool _533 = !_469;
    float _549;
    if (!_533)
    {
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _537 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        float _553 = float(_85);
        float _555 = 1.0 / _553;
        float _557 = _117 * _555;
        _549 = _557;
    }
    _551 = false;
    float _559 = _549;
    float _561 = as_type<float>(int(gl_VertexIndex));
    float _563 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    int _571 = as_type<int>(_561) & 1;
    bool _573 = _571 != 0;
    int _575 = as_type<int>(_561) & 2;
    bool _577 = _575 != 0;
    float _579 = _251 * _529;
    float _581 = _251 * _531;
    float _583 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _585 = !_577;
    float _587 = _585 ? (-0.5) : 0.5;
    float _589 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _591 = !_573;
    float _593 = _591 ? (-0.5) : 0.5;
    float _595 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
    float _599 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _587);
    float _601 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _593);
    float _603 = _589 * _599;
    float _605 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _607 = _595 * _601;
    float _609 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _611 = _603 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _613 = _603 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _615 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].x, _605);
    float _617 = _603 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _611);
    float _621 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _597);
    float _623 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
    float _625 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _615);
    float _627 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[26].z, _619);
    float _629 = _621 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _631 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
    float _633 = _625 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _635 = _627 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _637 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
    float _639 = _631 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _641 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
    float _643 = _629 + _635;
    float _645 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = _633 + _639;
    float _649 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _653 = _643 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _657 = _647 + _655;
    float _659 = _649 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _661 = _653 * _653;
    float _663 = fma(_657, _657, _661);
    float _665 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _667 = sqrt(_663);
    float _669 = _665 + _659;
    bool _671 = _667 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _673 = _645;
    float _675 = _565;
    float _677 = _647;
    float _679 = _629;
    if (!_671)
    {
        _673 = _643;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_671)
    {
        _675 = _669;
    }
    float _685 = _675;
    bool _687 = !_671;
    float _689 = _685;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _667 + _693;
        float _697 = _669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_663);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = fma(_669, _707, _715);
        float _721 = _699 * _717;
        float _723 = fma(_657, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_653, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _719;
        _677 = _723;
        _683 = _725;
    }
    float _727 = _689;
    float _729 = _677;
    float _731 = _683;
    float _733 = -_665;
    float _735 = _733 + _727;
    float _737 = -_633;
    float _739 = _737 + _729;
    float _741 = -_629;
    float _743 = _741 + _731;
    float _745 = _665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _747 = _735 * _735;
    float _749 = _665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _753 = isnan(0.5);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _759 = _755 || _757;
    float _761 = fma(_739, _739, _747);
    float _763 = fma(_743, _743, _761);
    float _765 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    float _767 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[10].x, _749);
    float _769 = sqrt(_763);
    float _771 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[11].z, _765);
    float _773 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[10].z, _767);
    float _775 = _749;
    float _777 = _727;
    float _779 = _729;
    float _781 = _743;
    if (_759)
    {
        _775 = 1.0;
    }
    float _783 = _775;
    float _785 = _771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _787 = _773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _789 = 1.0 / _785;
    float _791 = _787 + _785;
    bool _793 = _769 > 0.0;
    float _795 = _791 * _789;
    float _797 = _795 * 0.5;
    float _799 = _791;
    float _801 = _783;
    if (!_793)
    {
        _679 = _731;
    }
    float _803 = _679;
    bool _805 = !_793;
    float _807 = _803;
    if (!_805)
    {
        float _809 = _245 * _245;
        float _811 = fma(_197, _197, _809);
        float _813 = fma(_247, _247, _811);
        float _815 = rsqrt(_763);
        float _817 = sqrt(_813);
        float _819 = _739 * _815;
        float _821 = _735 * _815;
        float _823 = _743 * _815;
        bool _825 = _817 > 0.0;
        float _827 = _815;
        _781 = _823;
        if (!_825)
        {
            _827 = _731;
        }
        float _829 = _827;
        bool _831 = !_825;
        _807 = _829;
        if (!_831)
        {
            float _833 = rsqrt(_813);
            float _835 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _837 = _245 * _833;
            float _839 = _197 * _833;
            float _841 = _247 * _833;
            float _843 = _821 * _837;
            float _845 = fma(_819, _839, _843);
            float _847 = _835 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _849 = fma(_823, _841, _845);
            float _851 = _849 * _847;
            float _853 = fma(_197, _851, _729);
            float _855 = fma(_245, _851, _727);
            float _857 = fma(_247, _851, _731);
            _777 = _855;
            _779 = _853;
            _807 = _857;
            _799 = _845;
        }
    }
    float _859 = _777;
    float _861 = _779;
    float _863 = _807;
    float _865 = _799;
    float _867 = _781;
    float _869 = _865;
    float _871 = _867;
    if (!_759)
    {
        float _873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _875 = _873 * 0.15915493667125701904296875;
        float _877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _879 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _881 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _879);
        float _883 = _875 * 6.283185482025146484375;
        float _885 = cos(_883);
        float _887 = _877 * 0.15915493667125701904296875;
        float _889 = _875 * 6.283185482025146484375;
        float _891 = sin(_889);
        float _893 = 1.0 / _885;
        float _895 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _897 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _895;
        float _899 = _887 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = _891 * _893;
        float _905 = _887 * 6.283185482025146484375;
        float _907 = sin(_905);
        float _909 = _901 * _903;
        float _911 = 1.0 / _881;
        float _913 = 1.0 / _909;
        float _915 = 1.0 / _897;
        float _917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _919 = _911 * _917;
        float _921 = _907 * _913;
        float _923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _925 = fma(_921, _919, _923);
        float _927 = _925 * _915;
        float _929 = precise::clamp(_927, 0.0, 1.0);
        _801 = _929;
    }
    float _931 = _801;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _859 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _939 = _861 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _943 = _863 + _941;
    float _945 = _935 * _935;
    float _947 = fma(_939, _939, _945);
    float _949 = fma(_943, _943, _947);
    float _951 = rsqrt(_949);
    float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _939 * _953;
    float _957 = _943 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _943;
    float _975 = _963;
    float _977 = _971;
    float _979 = _953;
    float _981 = _955;
    if (_967)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _983;
    }
    float _985 = _973;
    if (_967)
    {
        float _987 = rsqrt(_963);
        _975 = _987;
    }
    float _989 = _975;
    float _991 = _989;
    if (_967)
    {
        float _993 = _971 * _985;
        _977 = _993;
    }
    float _995 = _977;
    if (_967)
    {
        float _997 = _995 * 0.15915493667125701904296875;
        _869 = _997;
    }
    float _999 = _869;
    float _1001 = _985;
    if (_967)
    {
        float _1003 = _999 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _1001 = _1005;
    }
    float _1007 = _1001;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _945;
    float _1015 = _1011;
    if (_967)
    {
        float _1017 = _999 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        _1013 = _1019;
    }
    float _1021 = _1013;
    float _1023 = -_953;
    float _1025 = -_1011;
    float _1027 = fma(_935, _1023, _1025);
    float _1029 = _1027;
    if (_967)
    {
        float _1031 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1031;
    }
    float _1033 = _1015;
    float _1035 = sqrt(_949);
    float _1037 = _1007;
    float _1039 = _1033;
    if (_967)
    {
        float _1041 = fma(_1007, _1033, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = _1043;
    if (_967)
    {
        float _1047 = _1021 + (-1.0);
        _1039 = _1047;
    }
    float _1049 = _1039;
    float _1051 = _1049;
    if (_967)
    {
        float _1053 = _989 * _1043;
        _871 = _1053;
    }
    float _1055 = _871;
    if (!_967)
    {
        _1045 = _1027;
    }
    float _1057 = _1045;
    float _1059 = _1057;
    if (_967)
    {
        float _1061 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1061;
    }
    float _1063 = _979;
    if (_967)
    {
        float _1065 = _955 * _1055;
        _981 = _1065;
    }
    float _1067 = _981;
    if (!_967)
    {
        _1051 = _957;
    }
    float _1069 = _1051;
    float _1071 = _1069;
    if (_967)
    {
        float _1073 = _957 * _1055;
        _1071 = _1073;
    }
    float _1075 = _1071;
    if (!_967)
    {
        _991 = _959;
    }
    float _1077 = _991;
    float _1079 = _1077;
    if (_967)
    {
        float _1081 = fma(_1027, _1021, _1063);
        _1059 = _1081;
    }
    float _1083 = _1059;
    if (_967)
    {
        float _1085 = _1067 * _1067;
        _1079 = _1085;
    }
    float _1087 = _1079;
    if (!_967)
    {
        _1029 = _961;
    }
    float _1089 = _1029;
    float _1091 = _1089;
    if (_967)
    {
        float _1093 = _1075 * _1075;
        _1091 = _1093;
    }
    float _1095 = _1091;
    float _1097 = fma(_1083, _1083, _1087);
    float _1099 = _1097 + _1095;
    float _1101 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1105 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1103);
    float _1107 = precise::clamp(_1105, 0.0, 1.0);
    float _1109 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1111 = rsqrt(_1099);
    float _1113 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1101);
    float _1115 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1117 = -_1107;
    float _1119 = _1117 + 1.0;
    float _1121 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1113);
    float _1123 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1125 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1115);
    float _1127 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = abs(_1119);
    float _1131 = log2(_1129);
    float _1133 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1123);
    float _1135 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1137 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1139 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1141 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1133);
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = _1111 * _1067;
    float _1147 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1137);
    float _1149 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1151 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1155 = _1111 * _1075;
    float _1157 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1151);
    float _1161 = _1111 * _1083;
    float _1163 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1165 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1159);
    float _1169 = -_1153;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = -_1157;
    float _1175 = fma(_1173, _1109, 1.0);
    float _1177 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1179 = exp2(_1163);
    float _1181 = -_1155;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1167);
    float _1187 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1189 = fma(_1183, -0.5, 0.5);
    float _1191 = fma(_1183, 0.5, 0.5);
    float _1193 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1187);
    float _1195 = log2(_1175);
    float _1197 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1177);
    float _1199 = _1161 + 1.0;
    float _1201 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1203 = fma(_1191, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1205 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1197);
    float _1207 = 1.0 / _1185;
    float _1209 = -_1161;
    float _1211 = fma(_1179, _1199, _1209);
    float _1213 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1215 = fma(_1191, _1203, -0.212114393711090087890625);
    float _1217 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1205);
    float _1219 = fma(_1211, 0.5, 0.5);
    float _1221 = fma(_1191, _1215, 1.570728778839111328125);
    float _1223 = sqrt(_1189);
    float _1225 = _1195 * 0.693147182464599609375;
    float _1227 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1229 = _1213 * _1207;
    float _1231 = _1217 * _1207;
    float _1233 = fma(_1229, 0.5, 0.5);
    float _1235 = fma(_1231, -0.5, 0.5);
    float _1237 = _1223 * 0.636619746685028076171875;
    float3 _3369 = float3(_1233, _1235, _1227);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3369, float3(0.0), isnan(_3369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3369, float3(0.0), isnan(_3369)), level(0.0)).x;
    float3 _3380 = float3(_1233, _1235, _1227);
    float4 _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3380, float3(0.0), isnan(_3380)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3380, float3(0.0), isnan(_3380)), level(0.0)).xyzw;
    float _1244 = _1242.x;
    float _1246 = _1242.y;
    float _1248 = _1242.z;
    float _1250 = _1242.w;
    float _1252 = -_1221;
    float _1254 = fma(_1237, _1252, 1.0);
    float2 _3402 = float2(_1254, _1219);
    float3 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3402, float2(0.0), isnan(_3402)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3402, float2(0.0), isnan(_3402)), level(0.0)).xyz;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = in.m_49.y;
    bool _1268 = _139 > 0.5;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1272 = _559 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1274;
    float _1278 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1282 = _1280 != 0;
    float _1284 = 1.0 / _1276;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1278);
    float _1292 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1294 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1290);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1300 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1294);
    out.m_45.x = _1298;
    float _1302 = _1272 * _1284;
    float _1304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1306 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1308 = isnan(_559);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    bool _1318 = _1266 > 0.5;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1320;
    bool _1324 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1326 = isnan(_559);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1336;
    float _1340 = -_1316;
    float _1342 = _1340 + 1.0;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1344;
    float _1348 = -_587;
    int _1350 = _1318 ? as_type<int>(_1348) : as_type<int>(_587);
    float _1352 = fma(_1322, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1354 = _1334 * _1342;
    float _1356 = -_593;
    int _1358 = _1268 ? as_type<int>(_1356) : as_type<int>(_593);
    float _1360 = fma(_1346, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1362 = !_1288;
    float _1364 = _1362 ? _587 : as_type<float>(_1350);
    float _1366 = -_1334;
    float _1368 = _1366 + 1.0;
    float _1370 = _1352 * _1354;
    bool _1372 = !_1282;
    float _1374 = _1372 ? _593 : as_type<float>(_1358);
    float _1376 = _1360 * _1354;
    float _1378 = fma(_1338, _1302, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1370);
    float _1382 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1376);
    float _1386 = _1378 * _1354;
    float _1388 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1380);
    float _1390 = exp2(_1382);
    float _1392 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1384);
    float _1394 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1398 = _1374 + 0.5;
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1402 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1394);
    float _1404 = -_1364;
    float _1406 = _1404 + 0.5;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1300 + _1185;
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1416 = _931 > 0.0;
    bool _1418 = isnan(_931);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan(0.0);
    bool _1424 = _1420 || _1422;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1428 = _1412 * 0.5;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = -_1390;
    float _1434 = _1432 + 1.0;
    float _1436 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1438 = _1426 * _1296;
    float _1440 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.x = _1408;
    out.m_60.y = _1410;
    out.m_60.z = _1430;
    float _1442 = _1436 * _1304;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1217;
    out.gl_Position.z = _1300;
    out.gl_Position.w = _1185;
    out.m_62.x = _1438;
    out.m_62.y = _1442;
    out.m_64.z = _1428;
    out.m_64.w = _1185;
    float _1444 = _1440 * _1239;
    float _1446 = -_1440;
    float _1448 = _1446 + 1.0;
    float _1450 = _1250 * _1444;
    float _1452 = _1264 * _1444;
    float _1454 = fma(_1260, _1450, _1244);
    float _1456 = fma(_1262, _1450, _1246);
    float _1458 = _1250 * _1448;
    float _1460 = fma(_1250, _1452, _1248);
    out.m_66.x = _1454;
    out.m_66.y = _1456;
    out.m_66.z = _1460;
    out.m_66.w = _1458;
    if (_1424)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1462 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1462;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

