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
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _827 = false;
    bool _647 = false;
    bool _401 = false;
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
        float _2111 = as_type<float>(_99);
        out.gl_Position.z = _2111;
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
        float _2180 = as_type<float>(_135);
        out.gl_Position.z = _2180;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    int _165 = as_type<int>(_143) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_143) & 2;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = 1.4012984643248170709237295832899e-45;
    float _181 = _145;
    if (!_155)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_167;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _187;
    if (!_155)
    {
        float _199 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_163;
    float _205 = _159 + _203;
    bool _207 = !_171;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = _205 < 0.5;
    float _213 = float(_211);
    bool _215 = !_155;
    float _217 = _201;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _145 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _145);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_155;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _145 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _181 = _271;
    }
    float _273 = _181;
    float _275 = fma(_191, 0.5, 0.5);
    float _277 = -_205;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = -_213;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = -_275;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = in.m_47.x;
    float _293 = in.m_47.y;
    float _295 = in.m_47.z;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _303 = _301 != 0;
    float _305 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _309 = in.m_54.w;
    float _311 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _315 = !_177;
    int _317 = _315 ? 0 : 1;
    float _319 = in.m_42.x;
    float _321 = in.m_42.y;
    float _323 = in.m_42.z;
    bool _325 = !_299;
    int _327 = _325 ? 0 : 1;
    float _329 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].x, _307);
    float _333 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _335 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    int _337 = abs(_317);
    bool _339 = !_303;
    int _341 = _339 ? 0 : 1;
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _333);
    int _345 = abs(_327);
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _331);
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _351 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _335);
    int _353 = abs(_341);
    float _355 = fma(_273, _291, _347);
    float _357 = float(_345);
    float _359 = fma(_273, _293, _343);
    float _361 = float(_337);
    float _363 = fma(_273, _295, _351);
    float _365 = abs(_279);
    float _367 = _357 * _365;
    float _369 = fma(_355, _309, _319);
    float _371 = fma(_359, _309, _321);
    float _373 = float(_353);
    float _375 = fma(_361, _287, _367);
    float _377 = fma(_363, _309, _323);
    float _379 = abs(_283);
    float _381 = fma(_373, _379, _375);
    bool _383 = !_349;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _387 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_83);
        float _405 = 1.0 / _403;
        float _407 = _117 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _413 = _409 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _409 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = 1.0 / _421;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _439 = 1.0 / _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _409 + _441;
    float _445 = 1.0 / _425;
    float _447 = _413 * _435;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _409 + _449;
    float _453 = 1.0 / _433;
    float _455 = _443 * _439;
    bool _457 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _459 = isnan(_409);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = -_467;
    float _475 = _473 + 1.0;
    float _477 = _417 * _445;
    bool _479 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _481 = isnan(_409);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = fma(_471, _447, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _493 = _489 * _475;
    float _495 = -_489;
    float _497 = _495 + 1.0;
    float _499 = _451 * _453;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _501;
    bool _505 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _507 = isnan(_409);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = fma(_503, _447, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _527 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_409);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_515;
    float _541 = _539 + 1.0;
    bool _543 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_409);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _515 * _497;
    float _557 = fma(_519, _477, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _559 = _537 * _541;
    float _561 = -_537;
    float _563 = _561 + 1.0;
    float _565 = fma(_523, _477, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = -_553;
    float _569 = _567 + 1.0;
    float _571 = in.m_54.x;
    float _573 = in.m_54.y;
    float _575 = _553 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _581;
    float _585 = _525 * _575;
    float _587 = _491 * _575;
    float _589 = fma(_579, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _597 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _587);
    float _599 = fma(_583, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_557, _559, _595);
    float _607 = fma(_565, _559, _597);
    float _609 = fma(_593, _499, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _611 = fma(_603, _499, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = fma(_589, _555, _605);
    float _615 = fma(_599, _555, _607);
    float _617 = fma(_609, _493, _613);
    float _619 = fma(_611, _493, _615);
    float _621 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[147].x, _617);
    float _623 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[147].y, _619);
    float _625 = _621 * _571;
    float _627 = _623 * _573;
    bool _629 = !_437;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_83);
        float _651 = 1.0 / _649;
        float _653 = _117 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _659 = _655 + _657;
    bool _661 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _663 = isnan(_655);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _675 = _655 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _685 = 1.0 / _679;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _689 = 1.0 / _683;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _691;
    float _695 = _659 * _685;
    bool _697 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _699 = isnan(_655);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_671;
    float _711 = _709 + 1.0;
    bool _713 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _715 = isnan(_655);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_693, _695, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _727 = _723 * _711;
    float _729 = -_723;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _737;
    float _741 = _675 * _689;
    float _743 = _707 * _731;
    float _745 = fma(_735, _695, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _747 = fma(_739, _695, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _749 = -_707;
    float _751 = _749 + 1.0;
    float _753 = _725 * _743;
    float _755 = _745 * _743;
    float _757 = _747 * _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _771 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _755);
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    float _775 = fma(_761, _741, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _777 = fma(_765, _741, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _779 = fma(_769, _741, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _757);
    float _783 = fma(_775, _727, _771);
    float _785 = fma(_777, _727, _773);
    float _787 = fma(_779, _727, _781);
    float _789 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].x, _783);
    float _791 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    float _795 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _803;
    out.m_56.y = _805;
    out.m_56.z = _807;
    out.m_56.w = _801;
    bool _809 = !_687;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _813 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_83);
        float _831 = 1.0 / _829;
        float _833 = _117 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = in.m_49.y;
    float _839 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _851 = _849 != 0;
    float _853 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _855 = 1.0 / _843;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _859 = _857 != 0;
    float _861 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _863;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _871 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _861);
    float _873 = 1.0 / _847;
    float _875 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _839);
    float _877 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _879;
    bool _883 = _137 > 0.5;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _889 = _835 + _887;
    float _891 = 1.0 / _865;
    float _893 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _895 = _837 > 0.5;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _899 = _835 + _897;
    float _901 = -_885;
    float _903 = fma(_893, 2.0, _901);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _911 = 1.0 / _869;
    float _913 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _905);
    float _915 = _837 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _917 = _889 * _891;
    float _919 = 1.0 / _909;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _925;
    float _929 = fma(_915, -2.0, _921);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _933 = _835 + _931;
    float _935 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[78].w, _923);
    float _937 = 1.0 / _881;
    float _939 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _871);
    float _941 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _875);
    float _943 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    float _945 = -_117;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[76].x, _903);
    float _949 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _929);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _953 = _835 + _951;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _959 = _835 + _957;
    float _961 = _953 * _919;
    float _963 = _899 * _911;
    float _965 = _959 * _855;
    float _967 = _933 * _873;
    float _969 = -_195;
    int _971 = _883 ? as_type<int>(_969) : as_type<int>(_195);
    float _973 = 1.0 / _927;
    float _975 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _913);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _979 = _835 + _977;
    bool _981 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _983 = isnan(_835);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _993;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _997;
    float _1001 = _979 * _937;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1009 = _835 + _1007;
    float _1011 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    bool _1013 = !_851;
    float _1015 = _1013 ? _195 : as_type<float>(_971);
    float _1017 = _955 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1031 = _1015 + 0.5;
    float _1033 = -_991;
    float _1035 = _1033 + 1.0;
    bool _1037 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1039 = isnan(_835);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_1017, _1031, _947);
    bool _1051 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1053 = isnan(_835);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1009 * _973;
    float _1065 = fma(_1021, _967, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1067 = fma(_1025, _967, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1069 = fma(_1029, _967, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1071 = -_1061;
    float _1073 = _1071 + 1.0;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1079;
    bool _1083 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1085 = isnan(_835);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = _991 * _1073;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1097;
    float _1101 = _1047 * _1035;
    float _1103 = -_1047;
    float _1105 = _1103 + 1.0;
    float _1107 = fma(_995, _965, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1109 = fma(_999, _965, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1111 = fma(_1005, _965, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1113 = fma(_1077, _917, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1115 = fma(_1081, _917, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1117 = fma(_1099, _917, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1119 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1121 = isnan(_835);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = _1093 * _1105;
    float _1133 = -_1093;
    float _1135 = _1133 + 1.0;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1149 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1151 = isnan(_835);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = _1129 * _1135;
    float _1163 = -_1129;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_1139, _963, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = fma(_1143, _963, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1171 = fma(_1147, _963, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1173 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1175 = isnan(_835);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = _1159 * _1165;
    bool _1187 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1189 = isnan(_835);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    float _1199 = -_1159;
    float _1201 = _1199 + 1.0;
    float _1203 = _943 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = -_1197;
    float _1207 = _1205 + 1.0;
    float _1209 = _1197 * _1201;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1215;
    float _1219 = _1183 * _1207;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1221;
    float _1225 = fma(_1213, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1227 = fma(_1217, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1229 = -_1183;
    float _1231 = _1229 + 1.0;
    float _1233 = fma(_1223, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1235 = _1107 * _1219;
    float _1237 = _1109 * _1219;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1235);
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1237);
    float _1251 = _1111 * _1219;
    float _1253 = fma(_1241, _961, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1255 = fma(_1065, _1209, _1247);
    float _1257 = fma(_1067, _1209, _1249);
    float _1259 = fma(_1245, _961, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1261 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1251);
    float _1263 = fma(_1113, _1185, _1255);
    float _1265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1267 = fma(_1115, _1185, _1257);
    float _1269 = fma(_1069, _1209, _1261);
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1275;
    float _1279 = fma(_1169, _1161, _1267);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1281;
    float _1285 = _941 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1203 + _1287;
    float _1291 = fma(_1273, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1293 = fma(_1277, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1295 = fma(_1283, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1297 = fma(_1117, _1185, _1269);
    float _1299 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1303 = _1285 + _1301;
    float _1305 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1311 = fma(_1167, _1161, _1263);
    float _1313 = fma(_1171, _1161, _1297);
    float _1315 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1319 = _1299 + _1317;
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1305);
    float _1323 = fma(_1309, _961, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1325 = fma(_1225, _1131, _1311);
    float _1327 = fma(_1227, _1131, _1279);
    float _1329 = fma(_1233, _1131, _1313);
    float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1321);
    float _1333 = fma(_1253, _1101, _1325);
    float _1335 = fma(_1259, _1101, _1327);
    float _1337 = fma(_1323, _1101, _1329);
    float _1339 = _1289 * _1289;
    float _1341 = -_209;
    int _1343 = _895 ? as_type<int>(_1341) : as_type<int>(_209);
    float _1345 = fma(_1291, _1095, _1333);
    bool _1347 = _1331 >= 0.0;
    float _1349 = fma(_1293, _1095, _1335);
    float _1351 = fma(_1295, _1095, _1337);
    float _1353 = fma(_1303, _1303, _1339);
    bool _1355 = !_859;
    float _1357 = _1355 ? _209 : as_type<float>(_1343);
    float _1359 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1345);
    float _1361 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1349);
    float _1363 = fma(_1319, _1319, _1353);
    float _1365 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1351);
    float _1367 = _1357 + (-0.5);
    float _1369 = -_975;
    float _1371 = _1369 + 1.0;
    float _1373 = rsqrt(_1363);
    float _1375 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1377 = -_1315;
    float _1379 = -_949;
    float _1381 = fma(_1377, _1367, _1379);
    float _1383 = -_1011;
    float _1385 = _1383 + 1.0;
    float _1387 = _1329;
    if (_1347)
    {
        _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1389 = _1387;
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1393 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1395 = -_1371;
    float _1397 = fma(_1015, _1395, _1049);
    float _1399 = fma(_1357, _1385, _1381);
    int _1401 = as_type<int>(_1389);
    float _1403 = _1397;
    if (_1347)
    {
        float _1405 = _1389 * 5.0;
        _1401 = as_type<int>(_1405);
    }
    int _1407 = _1401;
    float _1409 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1397;
    out.m_58.y = _1399;
    float _1415 = _1289 * _1373;
    float _1417 = _1303 * _1373;
    float _1419 = _1417;
    if (_1347)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_1407);
        out.gl_Position.z = _4316;
    }
    out.m_60.x = _1409;
    out.m_60.y = _1411;
    out.m_60.z = _1413;
    if (_1347)
    {
        out.m_45.x = 0.0;
    }
    if (_1347)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1421 = -_1415;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1425 = _1319 * _1373;
    float _1427 = -_1417;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1285);
    float _1431 = -_1415;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1289);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1437 = _1423 + _1435;
    float _1439 = -_1425;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1445 = _1429 + _1443;
    float _1447 = -_1417;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    float _1451 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1441 + _1453;
    float _1457 = -_1425;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1461 = _381 * _625;
    float _1463 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1451);
    float _1465 = _1433 * _1433;
    float _1467 = _381 * _627;
    float _1469 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1463);
    float _1471 = fma(_1449, _1449, _1465);
    bool _1473 = _1469 >= 0.0;
    float _1475 = fma(_1459, _1459, _1471);
    float _1477 = sqrt(_1475);
    if (_1473)
    {
        _1403 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1403;
    int _1481 = as_type<int>(_1479);
    if (_1473)
    {
        out.m_45.x = 0.0;
    }
    if (_1473)
    {
        float _1483 = _1479 * 5.0;
        _1481 = as_type<int>(_1483);
    }
    int _1485 = _1481;
    float _1487 = _1373 * _1477;
    if (_1473)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4459 = as_type<float>(_1485);
        out.gl_Position.z = _4459;
    }
    if (_1473)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1489 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1493 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1497 = _1487 * _1489;
    float _1499 = _1487 * _1493;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1503 = _1501 * 0.5;
    float _1505 = _1491 * _1497;
    bool _1507 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1509 = isnan(0.5);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1515 = _1511 || _1513;
    float _1517 = _1495 * _1499;
    float _1519 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1521 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1525 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1519);
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1521);
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1523);
    float _1531 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1525);
    float _1533 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1527);
    float _1535 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1529);
    float _1537 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1539 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1541 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1543 = _1299 + _1537;
    float _1545 = _1285 + _1539;
    float _1547 = _1203 + _1541;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1543 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1555 = _1545 + _1553;
    float _1557 = _1551 * _1551;
    float _1559 = fma(_1555, _1555, _1557);
    float _1561 = sqrt(_1559);
    bool _1563 = _1561 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1565 = _1541;
    float _1567 = _1517;
    float _1569 = _1545;
    if (!_1563)
    {
        _1565 = _1543;
    }
    float _1571 = _1565;
    float _1573 = _1571;
    if (!_1563)
    {
        _1567 = _1547;
    }
    float _1575 = _1567;
    bool _1577 = !_1563;
    float _1579 = _1575;
    if (!_1577)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1585 = _1561 + _1583;
        float _1587 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = rsqrt(_1559);
        float _1591 = _1585 * _1581;
        float _1593 = _1591 * 0.15915493667125701904296875;
        float _1595 = _1593 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1593 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1597 + (-1.0);
        float _1605 = fma(_1601, _1587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1607 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1609 = _1589 * _1605;
        float _1611 = fma(_1547, _1597, _1607);
        float _1613 = fma(_1555, _1609, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1615 = fma(_1551, _1609, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1569 = _1613;
        _1579 = _1611;
        _1573 = _1615;
    }
    float _1617 = _1569;
    float _1619 = _1579;
    float _1621 = _1573;
    float _1623 = -_1417;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1627 = -_1415;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1619);
    float _1631 = -_1425;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1621);
    float _1635 = _1629;
    float _1637 = _1625;
    float _1639 = _1633;
    if (!_1515)
    {
        float _1641 = _1437 * _1437;
        float _1643 = 1.0 / _1487;
        float _1645 = -_1285;
        float _1647 = _1645 + _1617;
        float _1649 = -_1203;
        float _1651 = _1649 + _1619;
        float _1653 = fma(_1445, _1445, _1641);
        float _1655 = fma(_1455, _1455, _1653);
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1659 = sqrt(_1655);
        float _1661 = precise::min(_1659, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1663 = _1661 * _1657;
        float _1665 = _1663 * _1643;
        float _1667 = -_1299;
        float _1669 = _1667 + _1621;
        float _1671 = fma(_1647, _1665, _1429);
        float _1673 = fma(_1651, _1665, _1423);
        float _1675 = fma(_1669, _1665, _1441);
        _1635 = _1673;
        _1637 = _1671;
        _1639 = _1675;
    }
    float _1677 = _1635;
    float _1679 = _1637;
    float _1681 = _1639;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1685 = _1677 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1689 = _1679 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1681 + _1691;
    float _1695 = _1685 * _1685;
    float _1697 = fma(_1689, _1689, _1695);
    float _1699 = fma(_1693, _1693, _1697);
    float _1701 = rsqrt(_1699);
    float _1703 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1705 = _1689 * _1703;
    float _1707 = _1693 * _1703;
    float _1709 = _1705 * _1705;
    float _1711 = _1707 * _1707;
    float _1713 = _1709 + _1711;
    float _1715 = sqrt(_1713);
    bool _1717 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1721 = _1715 + _1719;
    float _1723 = _1697;
    float _1725 = _1713;
    float _1727 = _1721;
    float _1729 = _1685;
    float _1731 = _1703;
    float _1733 = _1705;
    if (_1717)
    {
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1735;
    }
    float _1737 = _1723;
    if (_1717)
    {
        float _1739 = rsqrt(_1713);
        _1725 = _1739;
    }
    float _1741 = _1725;
    float _1743 = _1737;
    if (_1717)
    {
        float _1745 = _1721 * _1737;
        _1727 = _1745;
    }
    float _1747 = _1727;
    if (_1717)
    {
        float _1749 = _1747 * 0.15915493667125701904296875;
        _1743 = _1749;
    }
    float _1751 = _1743;
    float _1753 = _1701;
    float _1755 = _1751;
    if (_1717)
    {
        float _1757 = _1751 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        _1753 = _1759;
    }
    float _1761 = _1753;
    float _1763 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1765 = precise::max(0.0, _1763);
    float _1767 = _1693;
    float _1769 = _1765;
    if (_1717)
    {
        float _1771 = _1751 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = -_1703;
    float _1779 = -_1765;
    float _1781 = fma(_1685, _1777, _1779);
    float _1783 = _1781;
    if (_1717)
    {
        float _1785 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1785;
    }
    float _1787 = _1729;
    float _1789 = _1787;
    if (!_1717)
    {
        _1755 = _1707;
    }
    float _1791 = _1755;
    float _1793 = _1791;
    if (_1717)
    {
        float _1795 = fma(_1761, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1789 = _1795;
    }
    float _1797 = _1789;
    float _1799 = sqrt(_1699);
    float _1801 = _1797;
    if (_1717)
    {
        float _1803 = _1775 + (-1.0);
        _1769 = _1803;
    }
    float _1805 = _1769;
    float _1807 = _1805;
    if (_1717)
    {
        float _1809 = _1741 * _1797;
        _1419 = _1809;
    }
    float _1811 = _1419;
    if (!_1717)
    {
        _1801 = _1709;
    }
    float _1813 = _1801;
    float _1815 = _1813;
    if (_1717)
    {
        float _1817 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1731 = _1817;
    }
    float _1819 = _1731;
    if (_1717)
    {
        float _1821 = _1705 * _1811;
        _1733 = _1821;
    }
    float _1823 = _1733;
    if (_1717)
    {
        float _1825 = _1707 * _1811;
        _1793 = _1825;
    }
    float _1827 = _1793;
    if (!_1717)
    {
        _1807 = _1711;
    }
    float _1829 = _1807;
    float _1831 = _1829;
    if (_1717)
    {
        float _1833 = fma(_1781, _1775, _1819);
        _1783 = _1833;
    }
    float _1835 = _1783;
    if (_1717)
    {
        float _1837 = _1823 * _1823;
        _1815 = _1837;
    }
    float _1839 = _1815;
    if (_1717)
    {
        float _1841 = _1827 * _1827;
        _1831 = _1841;
    }
    float _1843 = _1831;
    float _1845 = fma(_1835, _1835, _1839);
    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1849 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1847);
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = _1845 + _1843;
    float _1855 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1859 = -_1851;
    float _1861 = _1859 + 1.0;
    float _1863 = rsqrt(_1853);
    float _1865 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1855);
    float _1867 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1869 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1865);
    float _1871 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1867);
    float _1873 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1875 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1877 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1879 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1871);
    float _1881 = abs(_1861);
    float _1883 = log2(_1881);
    float _1885 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1873);
    float _1887 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1875);
    float _1889 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1891 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1885);
    float _1893 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = _1863 * _1823;
    float _1897 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1887);
    float _1899 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1903 = _1863 * _1835;
    float _1905 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1907 = -_1889;
    float _1909 = fma(_1907, _1857, 1.0);
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1901);
    float _1913 = _1863 * _1827;
    float _1915 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1917 = -_1905;
    float _1919 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1917);
    float _1921 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1923 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1911);
    float _1925 = log2(_1909);
    float _1927 = -_1913;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1919);
    float _1931 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1933 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1923);
    float _1935 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1937 = fma(_1929, -0.5, 0.5);
    float _1939 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1931);
    float _1941 = fma(_1929, 0.5, 0.5);
    float _1943 = exp2(_1915);
    float _1945 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1935);
    float _1947 = _1903 + 1.0;
    float _1949 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1939);
    float _1951 = fma(_1941, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1953 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1945);
    float _1955 = 1.0 / _1933;
    float _1957 = fma(_1941, _1951, -0.212114393711090087890625);
    float _1959 = fma(_1941, _1957, 1.570728778839111328125);
    float _1961 = sqrt(_1937);
    float _1963 = -_1903;
    float _1965 = fma(_1943, _1947, _1963);
    float _1967 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1953);
    float _1969 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1971 = _1925 * 0.693147182464599609375;
    float _1973 = fma(_1965, 0.5, 0.5);
    float _1975 = _1967 * _1955;
    float _1977 = _1969 * _1955;
    float _1979 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1981 = fma(_1975, 0.5, 0.5);
    float _1983 = fma(_1977, -0.5, 0.5);
    float _1985 = _1961 * 0.636619746685028076171875;
    float3 _5282 = float3(_1981, _1983, _1979);
    float _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5282, float3(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5282, float3(0.0), isnan(_5282)), level(0.0)).x;
    float3 _5293 = float3(_1981, _1983, _1979);
    float4 _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5293, float3(0.0), isnan(_5293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5293, float3(0.0), isnan(_5293)), level(0.0)).xyzw;
    float _1992 = _1990.x;
    float _1994 = _1990.y;
    float _1996 = _1990.z;
    float _1998 = _1990.w;
    float _2000 = -_1959;
    float _2002 = fma(_1985, _2000, 1.0);
    float2 _5315 = float2(_2002, _1973);
    float3 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5315, float2(0.0), isnan(_5315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5315, float2(0.0), isnan(_5315)), level(0.0)).xyz;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2016 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2018 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2016);
    float _2020 = exp2(_2014);
    float _2022 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2018);
    float _2024 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2026 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2028 = _2024 + _1933;
    out.gl_Position.x = _1967;
    out.gl_Position.y = _1969;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _1933;
    float _2030 = _2028 * 0.5;
    float _2032 = -_2020;
    float _2034 = _2032 + 1.0;
    out.m_45.x = _2026;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2030;
    out.m_62.w = _1933;
    float _2038 = _2036 * _1987;
    float _2040 = -_2036;
    float _2042 = _2040 + 1.0;
    float _2044 = _1998 * _2038;
    float _2046 = _2012 * _2038;
    float _2048 = fma(_2008, _2044, _1992);
    float _2050 = fma(_2010, _2044, _1994);
    float _2052 = _1998 * _2042;
    float _2054 = fma(_1998, _2046, _1996);
    out.m_64.x = _2048;
    out.m_64.y = _2050;
    out.m_64.z = _2054;
    out.m_64.w = _2052;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _827 = false;
    bool _647 = false;
    bool _401 = false;
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
        float _2111 = as_type<float>(_99);
        out.gl_Position.z = _2111;
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
        float _2180 = as_type<float>(_135);
        out.gl_Position.z = _2180;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    int _165 = as_type<int>(_143) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_143) & 2;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = 1.4012984643248170709237295832899e-45;
    float _181 = _145;
    if (!_155)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_167;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _187;
    if (!_155)
    {
        float _199 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_163;
    float _205 = _159 + _203;
    bool _207 = !_171;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = _205 < 0.5;
    float _213 = float(_211);
    bool _215 = !_155;
    float _217 = _201;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _145 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _145);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_155;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _145 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _181 = _271;
    }
    float _273 = _181;
    float _275 = fma(_191, 0.5, 0.5);
    float _277 = -_205;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = -_213;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = -_275;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = in.m_47.x;
    float _293 = in.m_47.y;
    float _295 = in.m_47.z;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _303 = _301 != 0;
    float _305 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _309 = in.m_54.w;
    float _311 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _315 = !_177;
    int _317 = _315 ? 0 : 1;
    float _319 = in.m_42.x;
    float _321 = in.m_42.y;
    float _323 = in.m_42.z;
    bool _325 = !_299;
    int _327 = _325 ? 0 : 1;
    float _329 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].x, _307);
    float _333 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _335 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    int _337 = abs(_317);
    bool _339 = !_303;
    int _341 = _339 ? 0 : 1;
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _333);
    int _345 = abs(_327);
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _331);
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _351 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _335);
    int _353 = abs(_341);
    float _355 = fma(_273, _291, _347);
    float _357 = float(_345);
    float _359 = fma(_273, _293, _343);
    float _361 = float(_337);
    float _363 = fma(_273, _295, _351);
    float _365 = abs(_279);
    float _367 = _357 * _365;
    float _369 = fma(_355, _309, _319);
    float _371 = fma(_359, _309, _321);
    float _373 = float(_353);
    float _375 = fma(_361, _287, _367);
    float _377 = fma(_363, _309, _323);
    float _379 = abs(_283);
    float _381 = fma(_373, _379, _375);
    bool _383 = !_349;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _387 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_83);
        float _405 = 1.0 / _403;
        float _407 = _117 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _413 = _409 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _409 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = 1.0 / _421;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _439 = 1.0 / _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _409 + _441;
    float _445 = 1.0 / _425;
    float _447 = _413 * _435;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _409 + _449;
    float _453 = 1.0 / _433;
    float _455 = _443 * _439;
    bool _457 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _459 = isnan(_409);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = -_467;
    float _475 = _473 + 1.0;
    float _477 = _417 * _445;
    bool _479 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _481 = isnan(_409);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = fma(_471, _447, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _493 = _489 * _475;
    float _495 = -_489;
    float _497 = _495 + 1.0;
    float _499 = _451 * _453;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _501;
    bool _505 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _507 = isnan(_409);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = fma(_503, _447, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _527 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_409);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_515;
    float _541 = _539 + 1.0;
    bool _543 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_409);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _515 * _497;
    float _557 = fma(_519, _477, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _559 = _537 * _541;
    float _561 = -_537;
    float _563 = _561 + 1.0;
    float _565 = fma(_523, _477, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = -_553;
    float _569 = _567 + 1.0;
    float _571 = in.m_54.x;
    float _573 = in.m_54.y;
    float _575 = _553 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _581;
    float _585 = _525 * _575;
    float _587 = _491 * _575;
    float _589 = fma(_579, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _597 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _587);
    float _599 = fma(_583, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_557, _559, _595);
    float _607 = fma(_565, _559, _597);
    float _609 = fma(_593, _499, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _611 = fma(_603, _499, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = fma(_589, _555, _605);
    float _615 = fma(_599, _555, _607);
    float _617 = fma(_609, _493, _613);
    float _619 = fma(_611, _493, _615);
    float _621 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[147].x, _617);
    float _623 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[147].y, _619);
    float _625 = _621 * _571;
    float _627 = _623 * _573;
    bool _629 = !_437;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_83);
        float _651 = 1.0 / _649;
        float _653 = _117 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _659 = _655 + _657;
    bool _661 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _663 = isnan(_655);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _675 = _655 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _685 = 1.0 / _679;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _689 = 1.0 / _683;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _691;
    float _695 = _659 * _685;
    bool _697 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _699 = isnan(_655);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_671;
    float _711 = _709 + 1.0;
    bool _713 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _715 = isnan(_655);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_693, _695, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _727 = _723 * _711;
    float _729 = -_723;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _737;
    float _741 = _675 * _689;
    float _743 = _707 * _731;
    float _745 = fma(_735, _695, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _747 = fma(_739, _695, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _749 = -_707;
    float _751 = _749 + 1.0;
    float _753 = _725 * _743;
    float _755 = _745 * _743;
    float _757 = _747 * _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _771 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _755);
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    float _775 = fma(_761, _741, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _777 = fma(_765, _741, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _779 = fma(_769, _741, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _757);
    float _783 = fma(_775, _727, _771);
    float _785 = fma(_777, _727, _773);
    float _787 = fma(_779, _727, _781);
    float _789 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].x, _783);
    float _791 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    float _795 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _803;
    out.m_56.y = _805;
    out.m_56.z = _807;
    out.m_56.w = _801;
    bool _809 = !_687;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _813 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_83);
        float _831 = 1.0 / _829;
        float _833 = _117 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = in.m_49.y;
    float _839 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _851 = _849 != 0;
    float _853 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _855 = 1.0 / _843;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _859 = _857 != 0;
    float _861 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _863;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _871 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _861);
    float _873 = 1.0 / _847;
    float _875 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _839);
    float _877 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _879;
    bool _883 = _137 > 0.5;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _889 = _835 + _887;
    float _891 = 1.0 / _865;
    float _893 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _895 = _837 > 0.5;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _899 = _835 + _897;
    float _901 = -_885;
    float _903 = fma(_893, 2.0, _901);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _911 = 1.0 / _869;
    float _913 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _905);
    float _915 = _837 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _917 = _889 * _891;
    float _919 = 1.0 / _909;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _925;
    float _929 = fma(_915, -2.0, _921);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _933 = _835 + _931;
    float _935 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[78].w, _923);
    float _937 = 1.0 / _881;
    float _939 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _871);
    float _941 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _875);
    float _943 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    float _945 = -_117;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[76].x, _903);
    float _949 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _929);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _953 = _835 + _951;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _959 = _835 + _957;
    float _961 = _953 * _919;
    float _963 = _899 * _911;
    float _965 = _959 * _855;
    float _967 = _933 * _873;
    float _969 = -_195;
    int _971 = _883 ? as_type<int>(_969) : as_type<int>(_195);
    float _973 = 1.0 / _927;
    float _975 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _913);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _979 = _835 + _977;
    bool _981 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _983 = isnan(_835);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _993;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _997;
    float _1001 = _979 * _937;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1009 = _835 + _1007;
    float _1011 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    bool _1013 = !_851;
    float _1015 = _1013 ? _195 : as_type<float>(_971);
    float _1017 = _955 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1031 = _1015 + 0.5;
    float _1033 = -_991;
    float _1035 = _1033 + 1.0;
    bool _1037 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1039 = isnan(_835);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_1017, _1031, _947);
    bool _1051 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1053 = isnan(_835);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1009 * _973;
    float _1065 = fma(_1021, _967, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1067 = fma(_1025, _967, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1069 = fma(_1029, _967, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1071 = -_1061;
    float _1073 = _1071 + 1.0;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1079;
    bool _1083 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1085 = isnan(_835);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = _991 * _1073;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1097;
    float _1101 = _1047 * _1035;
    float _1103 = -_1047;
    float _1105 = _1103 + 1.0;
    float _1107 = fma(_995, _965, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1109 = fma(_999, _965, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1111 = fma(_1005, _965, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1113 = fma(_1077, _917, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1115 = fma(_1081, _917, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1117 = fma(_1099, _917, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1119 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1121 = isnan(_835);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = _1093 * _1105;
    float _1133 = -_1093;
    float _1135 = _1133 + 1.0;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1149 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1151 = isnan(_835);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = _1129 * _1135;
    float _1163 = -_1129;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_1139, _963, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = fma(_1143, _963, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1171 = fma(_1147, _963, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1173 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1175 = isnan(_835);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = _1159 * _1165;
    bool _1187 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1189 = isnan(_835);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    float _1199 = -_1159;
    float _1201 = _1199 + 1.0;
    float _1203 = _943 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = -_1197;
    float _1207 = _1205 + 1.0;
    float _1209 = _1197 * _1201;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1215;
    float _1219 = _1183 * _1207;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1221;
    float _1225 = fma(_1213, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1227 = fma(_1217, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1229 = -_1183;
    float _1231 = _1229 + 1.0;
    float _1233 = fma(_1223, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1235 = _1107 * _1219;
    float _1237 = _1109 * _1219;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1235);
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1237);
    float _1251 = _1111 * _1219;
    float _1253 = fma(_1241, _961, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1255 = fma(_1065, _1209, _1247);
    float _1257 = fma(_1067, _1209, _1249);
    float _1259 = fma(_1245, _961, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1261 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1251);
    float _1263 = fma(_1113, _1185, _1255);
    float _1265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1267 = fma(_1115, _1185, _1257);
    float _1269 = fma(_1069, _1209, _1261);
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1275;
    float _1279 = fma(_1169, _1161, _1267);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1281;
    float _1285 = _941 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1203 + _1287;
    float _1291 = fma(_1273, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1293 = fma(_1277, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1295 = fma(_1283, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1297 = fma(_1117, _1185, _1269);
    float _1299 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1303 = _1285 + _1301;
    float _1305 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1311 = fma(_1167, _1161, _1263);
    float _1313 = fma(_1171, _1161, _1297);
    float _1315 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1319 = _1299 + _1317;
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1305);
    float _1323 = fma(_1309, _961, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1325 = fma(_1225, _1131, _1311);
    float _1327 = fma(_1227, _1131, _1279);
    float _1329 = fma(_1233, _1131, _1313);
    float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1321);
    float _1333 = fma(_1253, _1101, _1325);
    float _1335 = fma(_1259, _1101, _1327);
    float _1337 = fma(_1323, _1101, _1329);
    float _1339 = _1289 * _1289;
    float _1341 = -_209;
    int _1343 = _895 ? as_type<int>(_1341) : as_type<int>(_209);
    float _1345 = fma(_1291, _1095, _1333);
    bool _1347 = _1331 >= 0.0;
    float _1349 = fma(_1293, _1095, _1335);
    float _1351 = fma(_1295, _1095, _1337);
    float _1353 = fma(_1303, _1303, _1339);
    bool _1355 = !_859;
    float _1357 = _1355 ? _209 : as_type<float>(_1343);
    float _1359 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1345);
    float _1361 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1349);
    float _1363 = fma(_1319, _1319, _1353);
    float _1365 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1351);
    float _1367 = _1357 + (-0.5);
    float _1369 = -_975;
    float _1371 = _1369 + 1.0;
    float _1373 = rsqrt(_1363);
    float _1375 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1377 = -_1315;
    float _1379 = -_949;
    float _1381 = fma(_1377, _1367, _1379);
    float _1383 = -_1011;
    float _1385 = _1383 + 1.0;
    float _1387 = _1329;
    if (_1347)
    {
        _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1389 = _1387;
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1393 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1395 = -_1371;
    float _1397 = fma(_1015, _1395, _1049);
    float _1399 = fma(_1357, _1385, _1381);
    int _1401 = as_type<int>(_1389);
    float _1403 = _1397;
    if (_1347)
    {
        float _1405 = _1389 * 5.0;
        _1401 = as_type<int>(_1405);
    }
    int _1407 = _1401;
    float _1409 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1397;
    out.m_58.y = _1399;
    float _1415 = _1289 * _1373;
    float _1417 = _1303 * _1373;
    float _1419 = _1417;
    if (_1347)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_1407);
        out.gl_Position.z = _4316;
    }
    out.m_60.x = _1409;
    out.m_60.y = _1411;
    out.m_60.z = _1413;
    if (_1347)
    {
        out.m_45.x = 0.0;
    }
    if (_1347)
    {
        return out;
    }
    float _1421 = -_1415;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1425 = _1319 * _1373;
    float _1427 = -_1417;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1285);
    float _1431 = -_1415;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1289);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1437 = _1423 + _1435;
    float _1439 = -_1425;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1445 = _1429 + _1443;
    float _1447 = -_1417;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    float _1451 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1441 + _1453;
    float _1457 = -_1425;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1461 = _381 * _625;
    float _1463 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1451);
    float _1465 = _1433 * _1433;
    float _1467 = _381 * _627;
    float _1469 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1463);
    float _1471 = fma(_1449, _1449, _1465);
    bool _1473 = _1469 >= 0.0;
    float _1475 = fma(_1459, _1459, _1471);
    float _1477 = sqrt(_1475);
    if (_1473)
    {
        _1403 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1403;
    int _1481 = as_type<int>(_1479);
    if (_1473)
    {
        out.m_45.x = 0.0;
    }
    if (_1473)
    {
        float _1483 = _1479 * 5.0;
        _1481 = as_type<int>(_1483);
    }
    int _1485 = _1481;
    float _1487 = _1373 * _1477;
    if (_1473)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4459 = as_type<float>(_1485);
        out.gl_Position.z = _4459;
    }
    if (_1473)
    {
        return out;
    }
    float _1489 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1493 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1497 = _1487 * _1489;
    float _1499 = _1487 * _1493;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1503 = _1501 * 0.5;
    float _1505 = _1491 * _1497;
    bool _1507 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1509 = isnan(0.5);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1515 = _1511 || _1513;
    float _1517 = _1495 * _1499;
    float _1519 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1521 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1525 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1519);
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1521);
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1523);
    float _1531 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1525);
    float _1533 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1527);
    float _1535 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1529);
    float _1537 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1539 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1541 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1543 = _1299 + _1537;
    float _1545 = _1285 + _1539;
    float _1547 = _1203 + _1541;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1543 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1555 = _1545 + _1553;
    float _1557 = _1551 * _1551;
    float _1559 = fma(_1555, _1555, _1557);
    float _1561 = sqrt(_1559);
    bool _1563 = _1561 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1565 = _1541;
    float _1567 = _1517;
    float _1569 = _1545;
    if (!_1563)
    {
        _1565 = _1543;
    }
    float _1571 = _1565;
    float _1573 = _1571;
    if (!_1563)
    {
        _1567 = _1547;
    }
    float _1575 = _1567;
    bool _1577 = !_1563;
    float _1579 = _1575;
    if (!_1577)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1585 = _1561 + _1583;
        float _1587 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = rsqrt(_1559);
        float _1591 = _1585 * _1581;
        float _1593 = _1591 * 0.15915493667125701904296875;
        float _1595 = _1593 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1593 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1597 + (-1.0);
        float _1605 = fma(_1601, _1587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1607 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1609 = _1589 * _1605;
        float _1611 = fma(_1547, _1597, _1607);
        float _1613 = fma(_1555, _1609, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1615 = fma(_1551, _1609, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1569 = _1613;
        _1579 = _1611;
        _1573 = _1615;
    }
    float _1617 = _1569;
    float _1619 = _1579;
    float _1621 = _1573;
    float _1623 = -_1417;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1627 = -_1415;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1619);
    float _1631 = -_1425;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1621);
    float _1635 = _1629;
    float _1637 = _1625;
    float _1639 = _1633;
    if (!_1515)
    {
        float _1641 = _1437 * _1437;
        float _1643 = 1.0 / _1487;
        float _1645 = -_1285;
        float _1647 = _1645 + _1617;
        float _1649 = -_1203;
        float _1651 = _1649 + _1619;
        float _1653 = fma(_1445, _1445, _1641);
        float _1655 = fma(_1455, _1455, _1653);
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1659 = sqrt(_1655);
        float _1661 = precise::min(_1659, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1663 = _1661 * _1657;
        float _1665 = _1663 * _1643;
        float _1667 = -_1299;
        float _1669 = _1667 + _1621;
        float _1671 = fma(_1647, _1665, _1429);
        float _1673 = fma(_1651, _1665, _1423);
        float _1675 = fma(_1669, _1665, _1441);
        _1635 = _1673;
        _1637 = _1671;
        _1639 = _1675;
    }
    float _1677 = _1635;
    float _1679 = _1637;
    float _1681 = _1639;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1685 = _1677 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1689 = _1679 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1681 + _1691;
    float _1695 = _1685 * _1685;
    float _1697 = fma(_1689, _1689, _1695);
    float _1699 = fma(_1693, _1693, _1697);
    float _1701 = rsqrt(_1699);
    float _1703 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1705 = _1689 * _1703;
    float _1707 = _1693 * _1703;
    float _1709 = _1705 * _1705;
    float _1711 = _1707 * _1707;
    float _1713 = _1709 + _1711;
    float _1715 = sqrt(_1713);
    bool _1717 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1721 = _1715 + _1719;
    float _1723 = _1697;
    float _1725 = _1713;
    float _1727 = _1721;
    float _1729 = _1685;
    float _1731 = _1703;
    float _1733 = _1705;
    if (_1717)
    {
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1735;
    }
    float _1737 = _1723;
    if (_1717)
    {
        float _1739 = rsqrt(_1713);
        _1725 = _1739;
    }
    float _1741 = _1725;
    float _1743 = _1737;
    if (_1717)
    {
        float _1745 = _1721 * _1737;
        _1727 = _1745;
    }
    float _1747 = _1727;
    if (_1717)
    {
        float _1749 = _1747 * 0.15915493667125701904296875;
        _1743 = _1749;
    }
    float _1751 = _1743;
    float _1753 = _1701;
    float _1755 = _1751;
    if (_1717)
    {
        float _1757 = _1751 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        _1753 = _1759;
    }
    float _1761 = _1753;
    float _1763 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1765 = precise::max(0.0, _1763);
    float _1767 = _1693;
    float _1769 = _1765;
    if (_1717)
    {
        float _1771 = _1751 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = -_1703;
    float _1779 = -_1765;
    float _1781 = fma(_1685, _1777, _1779);
    float _1783 = _1781;
    if (_1717)
    {
        float _1785 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1785;
    }
    float _1787 = _1729;
    float _1789 = _1787;
    if (!_1717)
    {
        _1755 = _1707;
    }
    float _1791 = _1755;
    float _1793 = _1791;
    if (_1717)
    {
        float _1795 = fma(_1761, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1789 = _1795;
    }
    float _1797 = _1789;
    float _1799 = sqrt(_1699);
    float _1801 = _1797;
    if (_1717)
    {
        float _1803 = _1775 + (-1.0);
        _1769 = _1803;
    }
    float _1805 = _1769;
    float _1807 = _1805;
    if (_1717)
    {
        float _1809 = _1741 * _1797;
        _1419 = _1809;
    }
    float _1811 = _1419;
    if (!_1717)
    {
        _1801 = _1709;
    }
    float _1813 = _1801;
    float _1815 = _1813;
    if (_1717)
    {
        float _1817 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1731 = _1817;
    }
    float _1819 = _1731;
    if (_1717)
    {
        float _1821 = _1705 * _1811;
        _1733 = _1821;
    }
    float _1823 = _1733;
    if (_1717)
    {
        float _1825 = _1707 * _1811;
        _1793 = _1825;
    }
    float _1827 = _1793;
    if (!_1717)
    {
        _1807 = _1711;
    }
    float _1829 = _1807;
    float _1831 = _1829;
    if (_1717)
    {
        float _1833 = fma(_1781, _1775, _1819);
        _1783 = _1833;
    }
    float _1835 = _1783;
    if (_1717)
    {
        float _1837 = _1823 * _1823;
        _1815 = _1837;
    }
    float _1839 = _1815;
    if (_1717)
    {
        float _1841 = _1827 * _1827;
        _1831 = _1841;
    }
    float _1843 = _1831;
    float _1845 = fma(_1835, _1835, _1839);
    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1849 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1847);
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = _1845 + _1843;
    float _1855 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1859 = -_1851;
    float _1861 = _1859 + 1.0;
    float _1863 = rsqrt(_1853);
    float _1865 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1855);
    float _1867 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1869 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1865);
    float _1871 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1867);
    float _1873 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1875 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1877 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1879 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1871);
    float _1881 = abs(_1861);
    float _1883 = log2(_1881);
    float _1885 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1873);
    float _1887 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1875);
    float _1889 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1891 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1885);
    float _1893 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = _1863 * _1823;
    float _1897 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1887);
    float _1899 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1903 = _1863 * _1835;
    float _1905 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1907 = -_1889;
    float _1909 = fma(_1907, _1857, 1.0);
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1901);
    float _1913 = _1863 * _1827;
    float _1915 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1917 = -_1905;
    float _1919 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1917);
    float _1921 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1923 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1911);
    float _1925 = log2(_1909);
    float _1927 = -_1913;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1919);
    float _1931 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1933 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1923);
    float _1935 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1937 = fma(_1929, -0.5, 0.5);
    float _1939 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1931);
    float _1941 = fma(_1929, 0.5, 0.5);
    float _1943 = exp2(_1915);
    float _1945 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1935);
    float _1947 = _1903 + 1.0;
    float _1949 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1939);
    float _1951 = fma(_1941, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1953 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1945);
    float _1955 = 1.0 / _1933;
    float _1957 = fma(_1941, _1951, -0.212114393711090087890625);
    float _1959 = fma(_1941, _1957, 1.570728778839111328125);
    float _1961 = sqrt(_1937);
    float _1963 = -_1903;
    float _1965 = fma(_1943, _1947, _1963);
    float _1967 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1953);
    float _1969 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1971 = _1925 * 0.693147182464599609375;
    float _1973 = fma(_1965, 0.5, 0.5);
    float _1975 = _1967 * _1955;
    float _1977 = _1969 * _1955;
    float _1979 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1981 = fma(_1975, 0.5, 0.5);
    float _1983 = fma(_1977, -0.5, 0.5);
    float _1985 = _1961 * 0.636619746685028076171875;
    float3 _5282 = float3(_1981, _1983, _1979);
    float _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5282, float3(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5282, float3(0.0), isnan(_5282)), level(0.0)).x;
    float3 _5293 = float3(_1981, _1983, _1979);
    float4 _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5293, float3(0.0), isnan(_5293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5293, float3(0.0), isnan(_5293)), level(0.0)).xyzw;
    float _1992 = _1990.x;
    float _1994 = _1990.y;
    float _1996 = _1990.z;
    float _1998 = _1990.w;
    float _2000 = -_1959;
    float _2002 = fma(_1985, _2000, 1.0);
    float2 _5315 = float2(_2002, _1973);
    float3 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5315, float2(0.0), isnan(_5315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5315, float2(0.0), isnan(_5315)), level(0.0)).xyz;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2016 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2018 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2016);
    float _2020 = exp2(_2014);
    float _2022 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2018);
    float _2024 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2026 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2028 = _2024 + _1933;
    out.gl_Position.x = _1967;
    out.gl_Position.y = _1969;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _1933;
    float _2030 = _2028 * 0.5;
    float _2032 = -_2020;
    float _2034 = _2032 + 1.0;
    out.m_45.x = _2026;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2030;
    out.m_62.w = _1933;
    float _2038 = _2036 * _1987;
    float _2040 = -_2036;
    float _2042 = _2040 + 1.0;
    float _2044 = _1998 * _2038;
    float _2046 = _2012 * _2038;
    float _2048 = fma(_2008, _2044, _1992);
    float _2050 = fma(_2010, _2044, _1994);
    float _2052 = _1998 * _2042;
    float _2054 = fma(_1998, _2046, _1996);
    out.m_64.x = _2048;
    out.m_64.y = _2050;
    out.m_64.z = _2054;
    out.m_64.w = _2052;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _827 = false;
    bool _647 = false;
    bool _401 = false;
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
        float _2111 = as_type<float>(_99);
        out.gl_Position.z = _2111;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2180 = as_type<float>(_135);
        out.gl_Position.z = _2180;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    int _165 = as_type<int>(_143) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_143) & 2;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    float _179 = 1.4012984643248170709237295832899e-45;
    float _181 = _145;
    if (!_155)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _173 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_167;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _187;
    if (!_155)
    {
        float _199 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_163;
    float _205 = _159 + _203;
    bool _207 = !_171;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = _205 < 0.5;
    float _213 = float(_211);
    bool _215 = !_155;
    float _217 = _201;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _145 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _145);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_155;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _145 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _181 = _271;
    }
    float _273 = _181;
    float _275 = fma(_191, 0.5, 0.5);
    float _277 = -_205;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = -_213;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = -_275;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = in.m_47.x;
    float _293 = in.m_47.y;
    float _295 = in.m_47.z;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _303 = _301 != 0;
    float _305 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _309 = in.m_54.w;
    float _311 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _289 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _315 = !_177;
    int _317 = _315 ? 0 : 1;
    float _319 = in.m_42.x;
    float _321 = in.m_42.y;
    float _323 = in.m_42.z;
    bool _325 = !_299;
    int _327 = _325 ? 0 : 1;
    float _329 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].x, _307);
    float _333 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _335 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    int _337 = abs(_317);
    bool _339 = !_303;
    int _341 = _339 ? 0 : 1;
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _333);
    int _345 = abs(_327);
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _331);
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _351 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _335);
    int _353 = abs(_341);
    float _355 = fma(_273, _291, _347);
    float _357 = float(_345);
    float _359 = fma(_273, _293, _343);
    float _361 = float(_337);
    float _363 = fma(_273, _295, _351);
    float _365 = abs(_279);
    float _367 = _357 * _365;
    float _369 = fma(_355, _309, _319);
    float _371 = fma(_359, _309, _321);
    float _373 = float(_353);
    float _375 = fma(_361, _287, _367);
    float _377 = fma(_363, _309, _323);
    float _379 = abs(_283);
    float _381 = fma(_373, _379, _375);
    bool _383 = !_349;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _387 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_83);
        float _405 = 1.0 / _403;
        float _407 = _117 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _413 = _409 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _409 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = 1.0 / _421;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _439 = 1.0 / _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _409 + _441;
    float _445 = 1.0 / _425;
    float _447 = _413 * _435;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _409 + _449;
    float _453 = 1.0 / _433;
    float _455 = _443 * _439;
    bool _457 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _459 = isnan(_409);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = -_467;
    float _475 = _473 + 1.0;
    float _477 = _417 * _445;
    bool _479 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _481 = isnan(_409);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = fma(_471, _447, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _493 = _489 * _475;
    float _495 = -_489;
    float _497 = _495 + 1.0;
    float _499 = _451 * _453;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _501;
    bool _505 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _507 = isnan(_409);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = fma(_503, _447, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _527 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_409);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_515;
    float _541 = _539 + 1.0;
    bool _543 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _545 = isnan(_409);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _515 * _497;
    float _557 = fma(_519, _477, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _559 = _537 * _541;
    float _561 = -_537;
    float _563 = _561 + 1.0;
    float _565 = fma(_523, _477, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = -_553;
    float _569 = _567 + 1.0;
    float _571 = in.m_54.x;
    float _573 = in.m_54.y;
    float _575 = _553 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _581;
    float _585 = _525 * _575;
    float _587 = _491 * _575;
    float _589 = fma(_579, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _597 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _587);
    float _599 = fma(_583, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_557, _559, _595);
    float _607 = fma(_565, _559, _597);
    float _609 = fma(_593, _499, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _611 = fma(_603, _499, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _613 = fma(_589, _555, _605);
    float _615 = fma(_599, _555, _607);
    float _617 = fma(_609, _493, _613);
    float _619 = fma(_611, _493, _615);
    float _621 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[147].x, _617);
    float _623 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[147].y, _619);
    float _625 = _621 * _571;
    float _627 = _623 * _573;
    bool _629 = !_437;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_83);
        float _651 = 1.0 / _649;
        float _653 = _117 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _659 = _655 + _657;
    bool _661 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _663 = isnan(_655);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _675 = _655 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _685 = 1.0 / _679;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _689 = 1.0 / _683;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _691;
    float _695 = _659 * _685;
    bool _697 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _699 = isnan(_655);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_671;
    float _711 = _709 + 1.0;
    bool _713 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _715 = isnan(_655);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_693, _695, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _727 = _723 * _711;
    float _729 = -_723;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _737;
    float _741 = _675 * _689;
    float _743 = _707 * _731;
    float _745 = fma(_735, _695, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _747 = fma(_739, _695, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _749 = -_707;
    float _751 = _749 + 1.0;
    float _753 = _725 * _743;
    float _755 = _745 * _743;
    float _757 = _747 * _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _771 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _755);
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    float _775 = fma(_761, _741, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _777 = fma(_765, _741, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _779 = fma(_769, _741, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _757);
    float _783 = fma(_775, _727, _771);
    float _785 = fma(_777, _727, _773);
    float _787 = fma(_779, _727, _781);
    float _789 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].x, _783);
    float _791 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    float _795 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _803;
    out.m_56.y = _805;
    out.m_56.z = _807;
    out.m_56.w = _801;
    bool _809 = !_687;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _813 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_83);
        float _831 = 1.0 / _829;
        float _833 = _117 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = in.m_49.y;
    float _839 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _851 = _849 != 0;
    float _853 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _855 = 1.0 / _843;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _859 = _857 != 0;
    float _861 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _863;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _871 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _861);
    float _873 = 1.0 / _847;
    float _875 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _839);
    float _877 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _879;
    bool _883 = _137 > 0.5;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _889 = _835 + _887;
    float _891 = 1.0 / _865;
    float _893 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _895 = _837 > 0.5;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _899 = _835 + _897;
    float _901 = -_885;
    float _903 = fma(_893, 2.0, _901);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _911 = 1.0 / _869;
    float _913 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _905);
    float _915 = _837 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _917 = _889 * _891;
    float _919 = 1.0 / _909;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _925;
    float _929 = fma(_915, -2.0, _921);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _933 = _835 + _931;
    float _935 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[78].w, _923);
    float _937 = 1.0 / _881;
    float _939 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _871);
    float _941 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _875);
    float _943 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    float _945 = -_117;
    float _947 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[76].x, _903);
    float _949 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _929);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _953 = _835 + _951;
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _959 = _835 + _957;
    float _961 = _953 * _919;
    float _963 = _899 * _911;
    float _965 = _959 * _855;
    float _967 = _933 * _873;
    float _969 = -_195;
    int _971 = _883 ? as_type<int>(_969) : as_type<int>(_195);
    float _973 = 1.0 / _927;
    float _975 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _913);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _979 = _835 + _977;
    bool _981 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _983 = isnan(_835);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _993;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _997;
    float _1001 = _979 * _937;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1009 = _835 + _1007;
    float _1011 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    bool _1013 = !_851;
    float _1015 = _1013 ? _195 : as_type<float>(_971);
    float _1017 = _955 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1031 = _1015 + 0.5;
    float _1033 = -_991;
    float _1035 = _1033 + 1.0;
    bool _1037 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1039 = isnan(_835);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_1017, _1031, _947);
    bool _1051 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1053 = isnan(_835);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1009 * _973;
    float _1065 = fma(_1021, _967, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1067 = fma(_1025, _967, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1069 = fma(_1029, _967, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1071 = -_1061;
    float _1073 = _1071 + 1.0;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1079;
    bool _1083 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1085 = isnan(_835);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = _991 * _1073;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1097;
    float _1101 = _1047 * _1035;
    float _1103 = -_1047;
    float _1105 = _1103 + 1.0;
    float _1107 = fma(_995, _965, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1109 = fma(_999, _965, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1111 = fma(_1005, _965, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1113 = fma(_1077, _917, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1115 = fma(_1081, _917, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1117 = fma(_1099, _917, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1119 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1121 = isnan(_835);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = _1093 * _1105;
    float _1133 = -_1093;
    float _1135 = _1133 + 1.0;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1149 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1151 = isnan(_835);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = _1129 * _1135;
    float _1163 = -_1129;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_1139, _963, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = fma(_1143, _963, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1171 = fma(_1147, _963, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1173 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1175 = isnan(_835);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = _1159 * _1165;
    bool _1187 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1189 = isnan(_835);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    float _1199 = -_1159;
    float _1201 = _1199 + 1.0;
    float _1203 = _943 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = -_1197;
    float _1207 = _1205 + 1.0;
    float _1209 = _1197 * _1201;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1215;
    float _1219 = _1183 * _1207;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1221;
    float _1225 = fma(_1213, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1227 = fma(_1217, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1229 = -_1183;
    float _1231 = _1229 + 1.0;
    float _1233 = fma(_1223, _1001, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1235 = _1107 * _1219;
    float _1237 = _1109 * _1219;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1235);
    float _1249 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1237);
    float _1251 = _1111 * _1219;
    float _1253 = fma(_1241, _961, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1255 = fma(_1065, _1209, _1247);
    float _1257 = fma(_1067, _1209, _1249);
    float _1259 = fma(_1245, _961, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1261 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1251);
    float _1263 = fma(_1113, _1185, _1255);
    float _1265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1267 = fma(_1115, _1185, _1257);
    float _1269 = fma(_1069, _1209, _1261);
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1275;
    float _1279 = fma(_1169, _1161, _1267);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1281;
    float _1285 = _941 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1203 + _1287;
    float _1291 = fma(_1273, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1293 = fma(_1277, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1295 = fma(_1283, _1063, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1297 = fma(_1117, _1185, _1269);
    float _1299 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1303 = _1285 + _1301;
    float _1305 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1311 = fma(_1167, _1161, _1263);
    float _1313 = fma(_1171, _1161, _1297);
    float _1315 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1319 = _1299 + _1317;
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1305);
    float _1323 = fma(_1309, _961, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1325 = fma(_1225, _1131, _1311);
    float _1327 = fma(_1227, _1131, _1279);
    float _1329 = fma(_1233, _1131, _1313);
    float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1321);
    float _1333 = fma(_1253, _1101, _1325);
    float _1335 = fma(_1259, _1101, _1327);
    float _1337 = fma(_1323, _1101, _1329);
    float _1339 = _1289 * _1289;
    float _1341 = -_209;
    int _1343 = _895 ? as_type<int>(_1341) : as_type<int>(_209);
    float _1345 = fma(_1291, _1095, _1333);
    bool _1347 = _1331 >= 0.0;
    float _1349 = fma(_1293, _1095, _1335);
    float _1351 = fma(_1295, _1095, _1337);
    float _1353 = fma(_1303, _1303, _1339);
    bool _1355 = !_859;
    float _1357 = _1355 ? _209 : as_type<float>(_1343);
    float _1359 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1345);
    float _1361 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1349);
    float _1363 = fma(_1319, _1319, _1353);
    float _1365 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1351);
    float _1367 = _1357 + (-0.5);
    float _1369 = -_975;
    float _1371 = _1369 + 1.0;
    float _1373 = rsqrt(_1363);
    float _1375 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1377 = -_1315;
    float _1379 = -_949;
    float _1381 = fma(_1377, _1367, _1379);
    float _1383 = -_1011;
    float _1385 = _1383 + 1.0;
    float _1387 = _1329;
    if (_1347)
    {
        _1387 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1389 = _1387;
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1393 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1395 = -_1371;
    float _1397 = fma(_1015, _1395, _1049);
    float _1399 = fma(_1357, _1385, _1381);
    int _1401 = as_type<int>(_1389);
    float _1403 = _1397;
    if (_1347)
    {
        float _1405 = _1389 * 5.0;
        _1401 = as_type<int>(_1405);
    }
    int _1407 = _1401;
    float _1409 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1413 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1397;
    out.m_58.y = _1399;
    float _1415 = _1289 * _1373;
    float _1417 = _1303 * _1373;
    float _1419 = _1417;
    if (_1347)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_1407);
        out.gl_Position.z = _4316;
    }
    out.m_60.x = _1409;
    out.m_60.y = _1411;
    out.m_60.z = _1413;
    if (_1347)
    {
        out.m_45.x = 0.0;
    }
    if (_1347)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1421 = -_1415;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1425 = _1319 * _1373;
    float _1427 = -_1417;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1285);
    float _1431 = -_1415;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1289);
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1437 = _1423 + _1435;
    float _1439 = -_1425;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1445 = _1429 + _1443;
    float _1447 = -_1417;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    float _1451 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1441 + _1453;
    float _1457 = -_1425;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1461 = _381 * _625;
    float _1463 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1451);
    float _1465 = _1433 * _1433;
    float _1467 = _381 * _627;
    float _1469 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1463);
    float _1471 = fma(_1449, _1449, _1465);
    bool _1473 = _1469 >= 0.0;
    float _1475 = fma(_1459, _1459, _1471);
    float _1477 = sqrt(_1475);
    if (_1473)
    {
        _1403 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1403;
    int _1481 = as_type<int>(_1479);
    if (_1473)
    {
        out.m_45.x = 0.0;
    }
    if (_1473)
    {
        float _1483 = _1479 * 5.0;
        _1481 = as_type<int>(_1483);
    }
    int _1485 = _1481;
    float _1487 = _1373 * _1477;
    if (_1473)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4459 = as_type<float>(_1485);
        out.gl_Position.z = _4459;
    }
    if (_1473)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1489 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1493 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1497 = _1487 * _1489;
    float _1499 = _1487 * _1493;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1503 = _1501 * 0.5;
    float _1505 = _1491 * _1497;
    bool _1507 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1509 = isnan(0.5);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1515 = _1511 || _1513;
    float _1517 = _1495 * _1499;
    float _1519 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1521 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1525 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1519);
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1521);
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1523);
    float _1531 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1525);
    float _1533 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1527);
    float _1535 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1529);
    float _1537 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1539 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1541 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1543 = _1299 + _1537;
    float _1545 = _1285 + _1539;
    float _1547 = _1203 + _1541;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1551 = _1543 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1555 = _1545 + _1553;
    float _1557 = _1551 * _1551;
    float _1559 = fma(_1555, _1555, _1557);
    float _1561 = sqrt(_1559);
    bool _1563 = _1561 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1565 = _1541;
    float _1567 = _1517;
    float _1569 = _1545;
    if (!_1563)
    {
        _1565 = _1543;
    }
    float _1571 = _1565;
    float _1573 = _1571;
    if (!_1563)
    {
        _1567 = _1547;
    }
    float _1575 = _1567;
    bool _1577 = !_1563;
    float _1579 = _1575;
    if (!_1577)
    {
        float _1581 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1585 = _1561 + _1583;
        float _1587 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = rsqrt(_1559);
        float _1591 = _1585 * _1581;
        float _1593 = _1591 * 0.15915493667125701904296875;
        float _1595 = _1593 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1593 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1597 + (-1.0);
        float _1605 = fma(_1601, _1587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1607 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1609 = _1589 * _1605;
        float _1611 = fma(_1547, _1597, _1607);
        float _1613 = fma(_1555, _1609, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1615 = fma(_1551, _1609, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1569 = _1613;
        _1579 = _1611;
        _1573 = _1615;
    }
    float _1617 = _1569;
    float _1619 = _1579;
    float _1621 = _1573;
    float _1623 = -_1417;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1627 = -_1415;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1619);
    float _1631 = -_1425;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1621);
    float _1635 = _1629;
    float _1637 = _1625;
    float _1639 = _1633;
    if (!_1515)
    {
        float _1641 = _1437 * _1437;
        float _1643 = 1.0 / _1487;
        float _1645 = -_1285;
        float _1647 = _1645 + _1617;
        float _1649 = -_1203;
        float _1651 = _1649 + _1619;
        float _1653 = fma(_1445, _1445, _1641);
        float _1655 = fma(_1455, _1455, _1653);
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1659 = sqrt(_1655);
        float _1661 = precise::min(_1659, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1663 = _1661 * _1657;
        float _1665 = _1663 * _1643;
        float _1667 = -_1299;
        float _1669 = _1667 + _1621;
        float _1671 = fma(_1647, _1665, _1429);
        float _1673 = fma(_1651, _1665, _1423);
        float _1675 = fma(_1669, _1665, _1441);
        _1635 = _1673;
        _1637 = _1671;
        _1639 = _1675;
    }
    float _1677 = _1635;
    float _1679 = _1637;
    float _1681 = _1639;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1685 = _1677 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1689 = _1679 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1681 + _1691;
    float _1695 = _1685 * _1685;
    float _1697 = fma(_1689, _1689, _1695);
    float _1699 = fma(_1693, _1693, _1697);
    float _1701 = rsqrt(_1699);
    float _1703 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1705 = _1689 * _1703;
    float _1707 = _1693 * _1703;
    float _1709 = _1705 * _1705;
    float _1711 = _1707 * _1707;
    float _1713 = _1709 + _1711;
    float _1715 = sqrt(_1713);
    bool _1717 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1721 = _1715 + _1719;
    float _1723 = _1697;
    float _1725 = _1713;
    float _1727 = _1721;
    float _1729 = _1685;
    float _1731 = _1703;
    float _1733 = _1705;
    if (_1717)
    {
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1735;
    }
    float _1737 = _1723;
    if (_1717)
    {
        float _1739 = rsqrt(_1713);
        _1725 = _1739;
    }
    float _1741 = _1725;
    float _1743 = _1737;
    if (_1717)
    {
        float _1745 = _1721 * _1737;
        _1727 = _1745;
    }
    float _1747 = _1727;
    if (_1717)
    {
        float _1749 = _1747 * 0.15915493667125701904296875;
        _1743 = _1749;
    }
    float _1751 = _1743;
    float _1753 = _1701;
    float _1755 = _1751;
    if (_1717)
    {
        float _1757 = _1751 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        _1753 = _1759;
    }
    float _1761 = _1753;
    float _1763 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1765 = precise::max(0.0, _1763);
    float _1767 = _1693;
    float _1769 = _1765;
    if (_1717)
    {
        float _1771 = _1751 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = -_1703;
    float _1779 = -_1765;
    float _1781 = fma(_1685, _1777, _1779);
    float _1783 = _1781;
    if (_1717)
    {
        float _1785 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1785;
    }
    float _1787 = _1729;
    float _1789 = _1787;
    if (!_1717)
    {
        _1755 = _1707;
    }
    float _1791 = _1755;
    float _1793 = _1791;
    if (_1717)
    {
        float _1795 = fma(_1761, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1789 = _1795;
    }
    float _1797 = _1789;
    float _1799 = sqrt(_1699);
    float _1801 = _1797;
    if (_1717)
    {
        float _1803 = _1775 + (-1.0);
        _1769 = _1803;
    }
    float _1805 = _1769;
    float _1807 = _1805;
    if (_1717)
    {
        float _1809 = _1741 * _1797;
        _1419 = _1809;
    }
    float _1811 = _1419;
    if (!_1717)
    {
        _1801 = _1709;
    }
    float _1813 = _1801;
    float _1815 = _1813;
    if (_1717)
    {
        float _1817 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1731 = _1817;
    }
    float _1819 = _1731;
    if (_1717)
    {
        float _1821 = _1705 * _1811;
        _1733 = _1821;
    }
    float _1823 = _1733;
    if (_1717)
    {
        float _1825 = _1707 * _1811;
        _1793 = _1825;
    }
    float _1827 = _1793;
    if (!_1717)
    {
        _1807 = _1711;
    }
    float _1829 = _1807;
    float _1831 = _1829;
    if (_1717)
    {
        float _1833 = fma(_1781, _1775, _1819);
        _1783 = _1833;
    }
    float _1835 = _1783;
    if (_1717)
    {
        float _1837 = _1823 * _1823;
        _1815 = _1837;
    }
    float _1839 = _1815;
    if (_1717)
    {
        float _1841 = _1827 * _1827;
        _1831 = _1841;
    }
    float _1843 = _1831;
    float _1845 = fma(_1835, _1835, _1839);
    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1849 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1847);
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = _1845 + _1843;
    float _1855 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1859 = -_1851;
    float _1861 = _1859 + 1.0;
    float _1863 = rsqrt(_1853);
    float _1865 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1855);
    float _1867 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1869 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1865);
    float _1871 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1867);
    float _1873 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1875 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1877 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1879 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1871);
    float _1881 = abs(_1861);
    float _1883 = log2(_1881);
    float _1885 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1873);
    float _1887 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1875);
    float _1889 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1891 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1885);
    float _1893 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = _1863 * _1823;
    float _1897 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1887);
    float _1899 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1903 = _1863 * _1835;
    float _1905 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1907 = -_1889;
    float _1909 = fma(_1907, _1857, 1.0);
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1901);
    float _1913 = _1863 * _1827;
    float _1915 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1917 = -_1905;
    float _1919 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1917);
    float _1921 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1923 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1911);
    float _1925 = log2(_1909);
    float _1927 = -_1913;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1919);
    float _1931 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1933 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1923);
    float _1935 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1937 = fma(_1929, -0.5, 0.5);
    float _1939 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1931);
    float _1941 = fma(_1929, 0.5, 0.5);
    float _1943 = exp2(_1915);
    float _1945 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1935);
    float _1947 = _1903 + 1.0;
    float _1949 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1939);
    float _1951 = fma(_1941, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1953 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1945);
    float _1955 = 1.0 / _1933;
    float _1957 = fma(_1941, _1951, -0.212114393711090087890625);
    float _1959 = fma(_1941, _1957, 1.570728778839111328125);
    float _1961 = sqrt(_1937);
    float _1963 = -_1903;
    float _1965 = fma(_1943, _1947, _1963);
    float _1967 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1953);
    float _1969 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1971 = _1925 * 0.693147182464599609375;
    float _1973 = fma(_1965, 0.5, 0.5);
    float _1975 = _1967 * _1955;
    float _1977 = _1969 * _1955;
    float _1979 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1981 = fma(_1975, 0.5, 0.5);
    float _1983 = fma(_1977, -0.5, 0.5);
    float _1985 = _1961 * 0.636619746685028076171875;
    float3 _5282 = float3(_1981, _1983, _1979);
    float _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5282, float3(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5282, float3(0.0), isnan(_5282)), level(0.0)).x;
    float3 _5293 = float3(_1981, _1983, _1979);
    float4 _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5293, float3(0.0), isnan(_5293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5293, float3(0.0), isnan(_5293)), level(0.0)).xyzw;
    float _1992 = _1990.x;
    float _1994 = _1990.y;
    float _1996 = _1990.z;
    float _1998 = _1990.w;
    float _2000 = -_1959;
    float _2002 = fma(_1985, _2000, 1.0);
    float2 _5315 = float2(_2002, _1973);
    float3 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5315, float2(0.0), isnan(_5315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5315, float2(0.0), isnan(_5315)), level(0.0)).xyz;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2016 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2018 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2016);
    float _2020 = exp2(_2014);
    float _2022 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2018);
    float _2024 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2026 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2028 = _2024 + _1933;
    out.gl_Position.x = _1967;
    out.gl_Position.y = _1969;
    out.gl_Position.z = _2024;
    out.gl_Position.w = _1933;
    float _2030 = _2028 * 0.5;
    float _2032 = -_2020;
    float _2034 = _2032 + 1.0;
    out.m_45.x = _2026;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2030;
    out.m_62.w = _1933;
    float _2038 = _2036 * _1987;
    float _2040 = -_2036;
    float _2042 = _2040 + 1.0;
    float _2044 = _1998 * _2038;
    float _2046 = _2012 * _2038;
    float _2048 = fma(_2008, _2044, _1992);
    float _2050 = fma(_2010, _2044, _1994);
    float _2052 = _1998 * _2042;
    float _2054 = fma(_1998, _2046, _1996);
    out.m_64.x = _2048;
    out.m_64.y = _2050;
    out.m_64.z = _2054;
    out.m_64.w = _2052;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

