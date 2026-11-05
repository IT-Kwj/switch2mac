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
    texture2d<float> vp_t_tcb_10 [[id(5)]];
    sampler vp_t_tcb_10Smplr [[id(6)]];
    sampler vp_t_tcb_10Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_56 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(2)]];
    float4 m_40 [[attribute(3)]];
    float4 m_60 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_50 [[attribute(8)]];
    float4 m_52 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _765 = false;
    bool _657 = false;
    bool _419 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_35.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    if (!_87)
    {
        out.m_38.x = 0.0;
    }
    int _93 = 0;
    if (!_87)
    {
        float _95 = _91 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3083 = as_type<float>(_97);
        out.gl_Position.z = _3083;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_40.w;
    float _103 = float(_83);
    float _105 = in.m_42.z;
    float _107 = in.m_42.w;
    float _109 = -_101;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_101);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    out.m_44.z = _105;
    bool _123 = _111 >= _103;
    bool _125 = !_121;
    bool _127 = _123 || _125;
    float _129 = 1.0 / _103;
    out.m_44.w = _107;
    float _131 = _101;
    if (_127)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_127)
    {
        out.m_38.x = 0.0;
    }
    if (_127)
    {
        float _135 = _133 * 5.0;
        _99 = as_type<int>(_135);
    }
    int _137 = _99;
    float _139 = _111 * _129;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_137);
        out.gl_Position.z = _3160;
    }
    out.m_46.x = _139;
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_48.w;
    float _143 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_40.x;
    float _157 = in.m_40.y;
    float _159 = in.m_40.z;
    float _161 = in.m_35.x;
    float _163 = in.m_35.y;
    float _165 = in.m_35.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = 0.0;
    if (!_183)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _143 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _143);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _219;
        _187 = _207;
        _189 = _209;
    }
    float _221 = _185;
    float _223 = _187;
    float _225 = _189;
    bool _227 = !_153;
    float _229 = _225;
    float _231 = _223;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _143 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _239;
        _169 = _251;
    }
    float _253 = _229;
    float _255 = _169;
    float _257 = _253;
    if (!_153)
    {
        float _259 = _111 * _111;
        float _261 = _259 * 0.5;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263;
    if (!_153)
    {
        _257 = _111;
    }
    float _267 = _257;
    float _269 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _267;
    if (!_153)
    {
        float _275 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _275;
    }
    float _277 = _265;
    bool _279 = !_153;
    float _281 = _277;
    if (!_279)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = _111 * _285;
        float _295 = 1.0 / _289;
        float _297 = _291 * 0.693147182464599609375;
        float _299 = exp2(_293);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _111);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _311;
    }
    float _313 = _281;
    bool _315 = !_153;
    if (!_315)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = 1.0 / _323;
        float _327 = _111 * _319;
        float _329 = exp2(_327);
        float _331 = -_329;
        float _333 = _331 + 1.0;
        float _335 = _333 * _325;
        _273 = _335;
    }
    float _337 = _273;
    float _339 = fma(_255, _155, _269);
    float _341 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = fma(_255, _157, _271);
    float _345 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _349 = fma(_337, _157, _341);
    float _351 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _355 = fma(_337, _155, _345);
    float _357 = -_349;
    float _359 = _343 + _357;
    float _361 = fma(_255, _159, _351);
    float _363 = fma(_337, _159, _353);
    float _365 = fma(_339, _141, _161);
    float _367 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _371 = -_355;
    float _373 = _339 + _371;
    float _375 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _377 = -_363;
    float _379 = _361 + _377;
    float _381 = fma(_343, _141, _163);
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _385 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _369);
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _375);
    float _389 = fma(_361, _141, _165);
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _383);
    float _393 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _397 = !_347;
    float _399 = _395;
    float _417;
    if (!_397)
    {
        float _401 = in.m_42.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        _417 = _139;
    }
    _419 = false;
    float _421 = _417;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _421 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _421 + _427;
    bool _431 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _433 = isnan(_421);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _457 = _421 + _455;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _461 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _463 = isnan(_421);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _453;
    bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _477 = 1.0 / _449;
    float _479 = _391 * _459;
    float _481 = _393 * _459;
    float _483 = _395 * _459;
    float _485 = 1.0 / _445;
    float _487 = _425 * _473;
    bool _489 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_421);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_441;
    float _503 = _501 + 1.0;
    float _505 = _499 * _503;
    float _507 = _429 * _477;
    bool _509 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _511 = isnan(_421);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_499;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = _519 * _523;
    float _539 = _457 * _485;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = _471 * _535;
    float _551 = fma(_527, _539, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _553 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _555 = fma(_547, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _565 = fma(_531, _507, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _567 = _553 * _549;
    float _569 = _555 * _549;
    float _571 = fma(_559, _507, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _573 = in.m_48.x;
    float _575 = in.m_48.y;
    float _577 = in.m_48.z;
    float _579 = fma(_563, _507, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _581 = _551 * _549;
    float _583 = -_471;
    float _585 = _583 + 1.0;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _589 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _569);
    float _591 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].z, _581);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _601;
    float _605 = fma(_565, _537, _587);
    float _607 = fma(_595, _487, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _609 = fma(_599, _487, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _611 = fma(_603, _487, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _613 = fma(_571, _537, _589);
    float _615 = fma(_579, _537, _591);
    float _617 = fma(_607, _505, _605);
    float _619 = fma(_609, _505, _613);
    float _621 = fma(_611, _505, _615);
    float _623 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].x, _617);
    float _625 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].y, _619);
    float _627 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].z, _621);
    float _629 = _623 * _573;
    float _631 = _625 * _575;
    float _633 = _627 * _577;
    bool _635 = !_475;
    float _637 = _487;
    float _655;
    if (!_635)
    {
        float _639 = in.m_42.x;
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _643 = _639 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _647 = _645 * _641;
        float _649 = floor(_647);
        float _651 = -_649;
        float _653 = _647 + _651;
        _655 = _653;
        _657 = true;
    }
    else
    {
        _655 = _139;
    }
    _657 = false;
    float _659 = _655;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _663 = _659 + _661;
    bool _665 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _667 = isnan(_659);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    bool _681 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _683 = isnan(_659);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_675;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _697;
    float _701 = 1.0 / _679;
    bool _703 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _705 = _691 * _695;
    float _707 = -_691;
    float _709 = _707 + 1.0;
    float _711 = _663 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _713;
    float _717 = fma(_699, _711, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _719;
    float _723 = fma(_715, _711, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _725 = fma(_721, _711, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _727 = _717 * _705;
    float _729 = _725 * _705;
    float _731 = _723 * _705;
    float _733 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].x, _727);
    float _735 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].y, _729);
    float _737 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].z, _731);
    float _739 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].x, _733);
    float _741 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].y, _735);
    float _743 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].z, _737);
    bool _745 = !_703;
    float _763;
    if (!_745)
    {
        float _747 = in.m_42.x;
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _751 = _747 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _755 = _753 * _749;
        float _757 = floor(_755);
        float _759 = -_757;
        float _761 = _755 + _759;
        _763 = _761;
        _765 = true;
    }
    else
    {
        _763 = _139;
    }
    _765 = false;
    float _767 = _763;
    float _769 = in.m_50.y;
    float _771 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _775 = _773 != 0;
    float _777 = in.m_42.x;
    float _779 = in.m_42.y;
    float _781 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _771);
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _795 = _793 != 0;
    float _797 = 1.0 / _785;
    float _799 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _801 = in.m_50.x;
    float _803 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _805 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _791);
    float _807 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _799);
    float _809 = _537;
    float _811 = _801;
    if (_775)
    {
        float _813 = in.m_42.x;
        _809 = _813;
    }
    float _815 = _809;
    float _817 = _805 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _819 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _803);
    float _821 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _807);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _831 = _817 + _829;
    float _833 = -_769;
    float _835 = _833 + 1.0;
    float _837 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _839 = _827 * _797;
    float _841 = _831 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _843 = _779 > 0.5;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _847 = _837 + _845;
    bool _849 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _851 = isnan(_767);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_817;
    float _863 = _861 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _865 = _769;
    float _867 = _797;
    if (_789)
    {
        float _869 = _843 ? _835 : _769;
        _865 = _869;
    }
    float _871 = _865;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _875 = _767 + _873;
    float _877 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[28].x, _841);
    float _879 = -_859;
    float _881 = _879 + 1.0;
    float _883 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = fma(_839, _875, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _887 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _889 = isnan(_767);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _863 * _863;
    bool _901 = _815 > 0.5;
    bool _903 = _901 && _775;
    float _905 = -_837;
    float _907 = _905 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_775)
    {
        _867 = _801;
    }
    float _909 = _867;
    float _911 = _897 * _881;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _915 = _883 + _913;
    float _917 = -_883;
    float _919 = _917 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _921 = fma(_907, _907, _899);
    float _923 = in.m_52.z;
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[28].z, _877);
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _929 = fma(_919, _919, _921);
    float _931 = _921;
    float _933 = _909;
    float _935 = _925;
    if (!_775)
    {
        _931 = _801;
    }
    float _937 = _931;
    float _939 = in.m_52.x;
    float _941 = _937;
    if (_903)
    {
        float _943 = -_909;
        float _945 = _943 + 1.0;
        _933 = _945;
    }
    float _947 = _933;
    float _949 = _885 * _911;
    float _951 = -_897;
    float _953 = _951 + 1.0;
    float _955 = in.m_52.y;
    float _957 = _915;
    if (_795)
    {
        float _959 = rsqrt(_929);
        _957 = _959;
    }
    float _961 = _957;
    if (_775)
    {
        _941 = _947;
    }
    float _963 = _941;
    float _965 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[115].x, _949);
    bool _967 = _925 >= 0.0;
    float _969 = _871 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _971 = _741 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _975 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[116].x, _965);
    float _977 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _979 = _969 * _927;
    float _981 = _973 * _823;
    float _983 = _739 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _985 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _991 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_967)
    {
        _935 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _993 = _935;
    int _995 = as_type<int>(_993);
    if (_795)
    {
        float _997 = _961 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _811 = _997;
    }
    float _999 = _811;
    out.m_54.x = _981;
    out.m_54.y = _979;
    float _1001 = 0.0;
    float _1003 = _999;
    if (!_795)
    {
        _1001 = 0.0;
    }
    float _1005 = _1001;
    float _1007 = _1005;
    if (_967)
    {
        float _1009 = _993 * 5.0;
        _995 = as_type<int>(_1009);
    }
    int _1011 = _995;
    out.m_56.z = _923;
    if (!_795)
    {
        _637 = 0.0;
    }
    float _1013 = _637;
    float _1015 = _1013;
    if (_795)
    {
        float _1017 = _907 * _999;
        _1007 = _1017;
    }
    float _1019 = _1007;
    if (_795)
    {
        float _1021 = _863 * _999;
        _1015 = _1021;
    }
    float _1023 = _1015;
    if (_967)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4578 = as_type<float>(_1011);
        out.gl_Position.z = _4578;
    }
    if (!_795)
    {
        _399 = 0.0;
    }
    float _1025 = _399;
    out.m_56.x = _939;
    out.m_56.y = _955;
    out.m_58.x = _991;
    out.m_58.y = _985;
    out.m_58.z = _987;
    out.m_58.w = _989;
    float _1027 = _1025;
    if (_967)
    {
        out.m_38.x = 0.0;
    }
    if (_967)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1029 = _817 + _1023;
    if (_795)
    {
        float _1031 = _919 * _999;
        _1027 = _1031;
    }
    float _1033 = _1027;
    float _1035 = _837 + _1019;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1029 + _1037;
    float _1041 = _883 + _1033;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _1035 + _1043;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = _1041 + _1049;
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1047);
    float _1055 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1053);
    bool _1057 = _1055 >= 0.0;
    if (_1057)
    {
        _1003 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1059 = _1003;
    int _1061 = as_type<int>(_1059);
    if (_1057)
    {
        out.m_38.x = 0.0;
    }
    if (_1057)
    {
        float _1063 = _1059 * 5.0;
        _1061 = as_type<int>(_1063);
    }
    int _1065 = _1061;
    if (_1057)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4682 = as_type<float>(_1065);
        out.gl_Position.z = _4682;
    }
    if (_1057)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1067 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1069 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1071 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1067);
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1069);
    float _1075 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1071);
    float _1077 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1079 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1073);
    float _1081 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1083 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1077);
    float _1085 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1087 = 1.0 / _1081;
    float _1089 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1083);
    float _1091 = _1081 * 0.5;
    float _1093 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1095 = fma(_1085, -0.5, _1091);
    float _1097 = _1093 + _1081;
    float _1099 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1095);
    float _1101 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1095);
    float _1103 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1095);
    float _1105 = _1097 * 0.5;
    float _1107 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1095);
    float _1109 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1095);
    float _1111 = _1099 * _1087;
    float _1113 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1105);
    float _1115 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1105);
    float _1117 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1105);
    float _1119 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1105);
    float _1121 = _1113 * _1087;
    float _1123 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1095);
    float _1125 = _1101 * _1087;
    float _1127 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1105);
    float _1129 = _1115 * _1087;
    float _1131 = _1117 * _1087;
    float _1133 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1095);
    float _1135 = _1103 * _1087;
    float _1137 = _1119 * _1087;
    float _1139 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1095);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1143 = _1095 + _1141;
    float _1145 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1105);
    float _1147 = _1107 * _1087;
    float _1149 = _1109 * _1087;
    float _1151 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1153 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1105);
    float _1155 = _1123 * _1087;
    float2 _4872 = float2(_1121, _1125);
    float _1157 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4872, float2(0.0), isnan(_4872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4872, float2(0.0), isnan(_4872)), level(0.0)).x;
    float2 _4882 = float2(_1129, _1111);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4882, float2(0.0), isnan(_4882)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4882, float2(0.0), isnan(_4882)), level(0.0)).x;
    float2 _4890 = float2(_1129, _1135);
    float _1161 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4890, float2(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4890, float2(0.0), isnan(_4890)), level(0.0)).x;
    float2 _4898 = float2(_1131, _1147);
    float _1163 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4898, float2(0.0), isnan(_4898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4898, float2(0.0), isnan(_4898)), level(0.0)).x;
    float2 _4906 = float2(_1137, _1155);
    float _1165 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4906, float2(0.0), isnan(_4906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4906, float2(0.0), isnan(_4906)), level(0.0)).x;
    float _1167 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1105);
    float _1169 = _1127 * _1087;
    float _1171 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1105);
    float _1173 = _1133 * _1087;
    float _1175 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1095);
    float _1177 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1095);
    float _1179 = _1145 * _1087;
    float _1181 = _1139 * _1087;
    float _1183 = _1143 * _1087;
    float _1185 = _1095 * _1087;
    float _1187 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1095);
    float _1189 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1095);
    float _1191 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1095);
    float _1193 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1095);
    float _1195 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1095);
    float _1197 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1095);
    float _1199 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1095);
    float _1201 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1095);
    float _1203 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1095);
    float _1205 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1095);
    float _1207 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1095);
    float _1209 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1095);
    float _1211 = _1105 * _1087;
    float _1213 = _1153 * _1087;
    float _1215 = _1151 * _1087;
    float _1217 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1105);
    float _1219 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1105);
    float _1221 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1105);
    float _1223 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1105);
    float _1225 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1105);
    float _1227 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1105);
    float _1229 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1105);
    float _1231 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1105);
    float _1233 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1105);
    float _1235 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1105);
    float _1237 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1105);
    float _1239 = _1167 * _1087;
    float2 _5063 = float2(_1169, _1149);
    float _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).x;
    float2 _5071 = float2(_1169, _1173);
    float _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5071, float2(0.0), isnan(_5071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5071, float2(0.0), isnan(_5071)), level(0.0)).x;
    float2 _5079 = float2(_1179, _1181);
    float _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5079, float2(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5079, float2(0.0), isnan(_5079)), level(0.0)).x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1249 = _1105 + _1247;
    float _1251 = _1175 * _1087;
    float _1253 = _1177 * _1087;
    float _1255 = _1171 * _1087;
    float _1257 = _1191 * _1087;
    float2 _5105 = float2(_1211, _1181);
    float _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5105, float2(0.0), isnan(_5105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5105, float2(0.0), isnan(_5105)), level(0.0)).x;
    float2 _5113 = float2(_1211, _1183);
    float _1261 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5113, float2(0.0), isnan(_5113)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5113, float2(0.0), isnan(_5113)), level(0.0)).x;
    float2 _5121 = float2(_1211, _1215);
    float _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5121, float2(0.0), isnan(_5121)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5121, float2(0.0), isnan(_5121)), level(0.0)).x;
    float2 _5129 = float2(_1239, _1251);
    float _1265 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5129, float2(0.0), isnan(_5129)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5129, float2(0.0), isnan(_5129)), level(0.0)).x;
    float2 _5137 = float2(_1211, _1251);
    float _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5137, float2(0.0), isnan(_5137)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5137, float2(0.0), isnan(_5137)), level(0.0)).x;
    float2 _5145 = float2(_1211, _1253);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5145, float2(0.0), isnan(_5145)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5145, float2(0.0), isnan(_5145)), level(0.0)).x;
    float2 _5153 = float2(_1211, _1257);
    float _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5153, float2(0.0), isnan(_5153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5153, float2(0.0), isnan(_5153)), level(0.0)).x;
    float2 _5161 = float2(_1211, _1185);
    float _1273 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5161, float2(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5161, float2(0.0), isnan(_5161)), level(0.0)).x;
    float _1275 = _1105 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1277 = _1249 * _1087;
    float _1279 = _1187 * _1087;
    float _1281 = _1189 * _1087;
    float _1283 = _1275 * _1087;
    float _1285 = _1217 * _1087;
    float _1287 = _1221 * _1087;
    float2 _5191 = float2(_1277, _1185);
    float _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5191, float2(0.0), isnan(_5191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5191, float2(0.0), isnan(_5191)), level(0.0)).x;
    float2 _5199 = float2(_1213, _1279);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5199, float2(0.0), isnan(_5199)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5199, float2(0.0), isnan(_5199)), level(0.0)).x;
    float2 _5207 = float2(_1213, _1281);
    float _1293 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5207, float2(0.0), isnan(_5207)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5207, float2(0.0), isnan(_5207)), level(0.0)).x;
    float2 _5215 = float2(_1213, _1185);
    float _1295 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5215, float2(0.0), isnan(_5215)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5215, float2(0.0), isnan(_5215)), level(0.0)).x;
    float2 _5223 = float2(_1283, _1185);
    float _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5223, float2(0.0), isnan(_5223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5223, float2(0.0), isnan(_5223)), level(0.0)).x;
    float2 _5231 = float2(_1285, _1185);
    float _1299 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5231, float2(0.0), isnan(_5231)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5231, float2(0.0), isnan(_5231)), level(0.0)).x;
    float _1301 = _1219 * _1087;
    float _1303 = _1223 * _1087;
    float _1305 = _1225 * _1087;
    float _1307 = _1193 * _1087;
    float _1309 = _1227 * _1087;
    float _1311 = _1195 * _1087;
    float _1313 = _1229 * _1087;
    float _1315 = _1197 * _1087;
    float _1317 = _1231 * _1087;
    float2 _5266 = float2(_1301, _1185);
    float _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5266, float2(0.0), isnan(_5266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5266, float2(0.0), isnan(_5266)), level(0.0)).x;
    float2 _5274 = float2(_1287, _1185);
    float _1321 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5274, float2(0.0), isnan(_5274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5274, float2(0.0), isnan(_5274)), level(0.0)).x;
    float2 _5282 = float2(_1303, _1307);
    float _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5282, float2(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5282, float2(0.0), isnan(_5282)), level(0.0)).x;
    float2 _5290 = float2(_1305, _1311);
    float _1325 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5290, float2(0.0), isnan(_5290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5290, float2(0.0), isnan(_5290)), level(0.0)).x;
    float2 _5298 = float2(_1309, _1315);
    float _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5298, float2(0.0), isnan(_5298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5298, float2(0.0), isnan(_5298)), level(0.0)).x;
    float _1329 = _1199 * _1087;
    float _1331 = _1233 * _1087;
    float _1333 = _1201 * _1087;
    float _1335 = _1235 * _1087;
    float _1337 = _1203 * _1087;
    float _1339 = _1237 * _1087;
    float _1341 = _1205 * _1087;
    float _1343 = _1207 * _1087;
    float2 _5330 = float2(_1313, _1329);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).x;
    float2 _5338 = float2(_1317, _1333);
    float _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).x;
    float2 _5346 = float2(_1331, _1337);
    float _1349 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5346, float2(0.0), isnan(_5346)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5346, float2(0.0), isnan(_5346)), level(0.0)).x;
    float2 _5354 = float2(_1335, _1341);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5354, float2(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5354, float2(0.0), isnan(_5354)), level(0.0)).x;
    float2 _5362 = float2(_1339, _1343);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5362, float2(0.0), isnan(_5362)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5362, float2(0.0), isnan(_5362)), level(0.0)).x;
    float _1355 = _1209 * _1087;
    float2 _5373 = float2(_1255, _1355);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5373, float2(0.0), isnan(_5373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5373, float2(0.0), isnan(_5373)), level(0.0)).x;
    float _1359 = sqrt(_929);
    float _1361 = _777 * 0.550000011920928955078125;
    float _1363 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1365 = _107 * 78.233001708984375;
    float _1367 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1363);
    float _1369 = fma(_111, 0.300000011920928955078125, -1.0);
    float _1371 = rint(_1361);
    float _1373 = _1369 * 0.15915493667125701904296875;
    float _1375 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1377 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1367);
    float _1379 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1381 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1375);
    float _1383 = _1373 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1379);
    float _1389 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1381);
    float _1393 = in.m_60.x;
    float _1395 = in.m_60.y;
    float _1397 = in.m_60.z;
    float _1399 = fma(_1359, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1401 = precise::clamp(_1399, 0.0, 1.0);
    float _1403 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1387);
    float _1405 = rsqrt(_1391);
    float _1407 = fma(_1401, -2.0, 3.0);
    float _1409 = _1401 * _1401;
    float _1411 = _139 * _139;
    float _1413 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1415 = fma(_1385, -0.02999999932944774627685546875, 1.0);
    float _1417 = fma(_1385, -0.100000001490116119384765625, 0.5);
    float _1419 = _1407 * _1409;
    float _1421 = rsqrt(_1377);
    float _1423 = abs(_139);
    float _1425 = _1423 * _1411;
    float _1427 = -_1415;
    float _1429 = _1427 + _1417;
    float _1431 = -_923;
    float _1433 = _1431 + _939;
    float _1435 = -_1419;
    float _1437 = _1435 + 0.5;
    float _1439 = -_1419;
    float _1441 = _1439 + 1.0;
    float _1443 = fma(_1419, _1429, _1415);
    float _1445 = _1419 * _1433;
    float _1447 = rsqrt(_1403);
    float _1449 = fma(_1425, _1437, 1.0);
    float _1451 = fma(_1413, _1441, 1.0);
    float _1453 = _1443 * _1395;
    float _1455 = _1443 * _1393;
    float _1457 = _1445 * 0.0599999986588954925537109375;
    float _1459 = _1449 * _1451;
    float _1461 = _1453 * _1405;
    float _1463 = _1443 * _1397;
    float _1465 = _1455 * _1421;
    float _1467 = _1457 * _1421;
    float _1469 = _1461 * _1459;
    float _1471 = fma(_923, 12.98980045318603515625, _1365);
    float _1473 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1475 = fma(_1465, _1459, _1467);
    float _1477 = _1463 * _1447;
    float _1479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1469);
    float _1481 = _1471 * 0.15915493667125701904296875;
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1475);
    float _1485 = _1477 * _1459;
    float _1487 = _1479 * _1389;
    float _1489 = fma(_939, 12.98980045318603515625, _1365);
    float _1491 = abs(_139);
    float _1493 = log2(_1491);
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1485);
    float _1497 = _633 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1499 = _1483 * _1473;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1503 = _1489 * 0.15915493667125701904296875;
    float _1505 = _1495 * _1497;
    float _1507 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1501);
    float _1511 = _1481 * 6.283185482025146484375;
    float _1513 = sin(_1511);
    float _1515 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1517 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1507);
    float _1519 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1509);
    float _1521 = fma(_955, 12.98980045318603515625, _1365);
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1515);
    float _1525 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1517);
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1529 = _1503 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1493 * 0.800000011920928955078125;
    float _1535 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1537 = _817 + _1527;
    float _1539 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1523);
    float _1541 = _1521 * 0.15915493667125701904296875;
    float _1543 = _837 + _1535;
    float _1545 = -_1537;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1549 = exp2(_1533);
    float _1551 = _1513 * 43758.546875;
    float _1553 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1555 = -_1543;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1559 = _1547 * _1547;
    float _1561 = _883 + _1553;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1571 = _1567 || _1569;
    float _1573 = fma(_1557, _1557, _1559);
    float _1575 = _1531 * 43758.546875;
    float _1577 = -_1561;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1581 = floor(_1551);
    float _1583 = fma(_779, 6.0, 12.0);
    float _1585 = fma(12.0, _777, 24.0);
    float _1587 = fma(_1579, _1579, _1573);
    float _1589 = _1549 * _1583;
    float _1591 = _1549 * _1585;
    float _1593 = _1493 * 0.5;
    float _1595 = floor(_1575);
    float _1597 = _1589 * _955;
    float _1599 = _1591 * _939;
    float _1601 = _479 * _1597;
    float _1603 = -_1581;
    float _1605 = _1551 + _1603;
    float _1607 = sqrt(_1587);
    float _1609 = fma(_479, _1599, _1601);
    float _1611 = _483 * _1597;
    float _1613 = fma(_1605, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1615 = fma(_483, _1599, _1611);
    float _1617 = exp2(_1593);
    float _1619 = -_1595;
    float _1621 = _1575 + _1619;
    float _1623 = fma(_1621, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1625 = fma(_1607, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = 1.0 / _1403;
    float _1631 = fma(_1627, -2.0, 3.0);
    float _1633 = _1627 * _1627;
    float _1635 = fma(_1617, _1613, _1615);
    float _1637 = 1.0 / _1377;
    float _1639 = fma(_1617, _1623, _1609);
    float _1641 = -_1633;
    float _1643 = fma(_1631, _1641, 1.0);
    float _1645 = _1497 * _1635;
    float _1647 = _481 * _1597;
    float _1649 = _1473 * _1639;
    float _1651 = _1645 * _1643;
    float _1653 = _1541 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = _1649 * _1643;
    float _1659 = fma(_481, _1599, _1647);
    float _1661 = fma(_1651, _1629, _1561);
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1665 = _1661 + _1663;
    float _1667 = fma(_1657, _1637, _1543);
    float _1669 = 1.0 / _1391;
    float _1671 = _1665 * _1665;
    float _1673 = _1655 * 43758.546875;
    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1677 = _1667 + _1675;
    float _1679 = floor(_1673);
    float _1681 = fma(_1677, _1677, _1671);
    float _1683 = sqrt(_1681);
    float _1685 = -_1679;
    float _1687 = _1673 + _1685;
    float _1689 = fma(_1687, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1691 = fma(_1617, _1689, _1659);
    bool _1693 = _1683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = _1389 * _1691;
    float _1697 = _1695 * _1643;
    float _1699 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1701 = fma(_1697, _1669, _1537);
    float _1703 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1699);
    float _1705 = _1671;
    float _1707 = _1699;
    float _1709 = 0.60000002384185791015625;
    if (!_1693)
    {
        _1705 = _1667;
    }
    float _1711 = _1705;
    float _1713 = _1711;
    if (!_1693)
    {
        _1707 = _1661;
    }
    float _1715 = _1707;
    float _1717 = _1715;
    if (!_1693)
    {
        _1709 = _1701;
    }
    float _1719 = _1709;
    bool _1721 = !_1693;
    float _1723 = _1719;
    if (!_1721)
    {
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1729 = _1683 + _1727;
        float _1731 = rsqrt(_1681);
        float _1733 = _1729 * _1725;
        float _1735 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = _1733 * 0.15915493667125701904296875;
        float _1739 = _1737 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        float _1743 = _1737 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = _1741 + (-1.0);
        float _1749 = fma(_1745, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1751 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1753 = _1731 * _1749;
        float _1755 = fma(_1701, _1741, _1751);
        float _1757 = fma(_1677, _1753, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1759 = fma(_1665, _1753, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1713 = _1757;
        _1723 = _1755;
        _1717 = _1759;
    }
    float _1761 = _1713;
    float _1763 = _1723;
    float _1765 = _1717;
    float _1767 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1703);
    float _1769 = _1019 + _1761;
    float _1771 = _1023 + _1763;
    float _1773 = _1033 + _1765;
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1777 = _1769;
    float _1779 = _1771;
    float _1781 = _1769;
    float _1783 = _1773;
    if (!_1571)
    {
        float _1785 = _1039 * _1039;
        float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1789 = -_837;
        float _1791 = _1789 + _1761;
        float _1793 = -_817;
        float _1795 = _1793 + _1763;
        float _1797 = fma(_1045, _1045, _1785);
        float _1799 = -_883;
        float _1801 = _1799 + _1765;
        float _1803 = fma(_1051, _1051, _1797);
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1807 = sqrt(_1803);
        float _1809 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1811 = _1807 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1813 = isnan(_1807);
        bool _1815 = _1811 || _1813;
        bool _1817 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1819 = _1815 || _1817;
        float _1821 = precise::min(_1807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1823 = _1821 * _1787;
        float _1825 = _1809 * _1823;
        float _1827 = _1023;
        float _1829 = _1825;
        float _1831 = _1809;
        if (_1819)
        {
            float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1827 = _1833;
        }
        float _1835 = _1827;
        if (_1819)
        {
            float _1837 = precise::max(_1807, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1777 = _1837;
        }
        float _1839 = _1777;
        float _1841 = fma(_1791, _1825, _1035);
        float _1843 = fma(_1795, _1825, _1029);
        float _1845 = fma(_1801, _1825, _1041);
        float _1847 = _1839;
        float _1849 = _1841;
        if (_1819)
        {
            float _1851 = _1839 * _1835;
            _1847 = _1851;
        }
        float _1853 = _1847;
        float _1855 = _1853;
        if (_1819)
        {
            float _1857 = _1809 * _1853;
            _1829 = _1857;
        }
        float _1859 = _1829;
        if (!_1819)
        {
            _1855 = _1841;
        }
        float _1861 = _1855;
        float _1863 = _1861;
        if (!_1819)
        {
            _1849 = _1843;
        }
        float _1865 = _1849;
        float _1867 = _1865;
        if (_1819)
        {
            float _1869 = fma(_1791, _1859, _1035);
            _1863 = _1869;
        }
        float _1871 = _1863;
        _1781 = _1871;
        if (!_1819)
        {
            _1831 = _1845;
        }
        float _1873 = _1831;
        _1783 = _1873;
        if (_1819)
        {
            float _1875 = fma(_1795, _1859, _1029);
            _1867 = _1875;
        }
        float _1877 = _1867;
        _1779 = _1877;
        if (_1819)
        {
            float _1879 = fma(_1801, _1859, _1041);
            _1783 = _1879;
        }
    }
    float _1881 = _1779;
    float _1883 = _1781;
    float _1885 = _1783;
    float _1887 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1889 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1891 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = _1775 + _1081;
    float _1895 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1887);
    float _1897 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1899 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1901 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1895);
    float _1905 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1897);
    float _1907 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1899);
    float _1909 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1901);
    float _1911 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1913 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1905);
    float _1915 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1917 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1919 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1923 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1925 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1927 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1929 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1921);
    float _1931 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1923);
    float _1933 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1925);
    float _1935 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1937 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1927);
    float _1939 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1929);
    float _1941 = _1893 * _1087;
    float _1943 = _1941 * 0.5;
    float _1945 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1931);
    float _1947 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1933);
    float _1949 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1937);
    float _1951 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1939);
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1953);
    float _1957 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1945);
    float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1961 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
    float _1963 = _1949 + _1951;
    float _1965 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1947);
    out.m_58.x = _991;
    out.m_58.y = _985;
    out.m_58.z = _987;
    out.m_58.w = _989;
    float _1967 = 1.0 / _1955;
    float _1969 = _1963 * 0.5;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1973 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1971);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1977 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1975);
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1981 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1979);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1985 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1983);
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1989 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1987);
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1993 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1991);
    float _1995 = 1.0 / _1973;
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1999 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1997);
    float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2003 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2001);
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2007 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2005);
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2011 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2009);
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2015 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2013);
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2019 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2017);
    out.m_62.x = _1035;
    out.m_62.y = _1029;
    out.m_62.z = _1041;
    float _2021 = 1.0 / _1961;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2025 = _1967 * _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2029 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2027);
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2033 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2031);
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2037 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2035);
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2041 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2039);
    float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2045 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2043);
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    float _2051 = 1.0 / _1977;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2055 = -_2025;
    float _2057 = fma(_1995, _2053, _2055);
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2061 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2059);
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2065 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2063);
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2069 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2067);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2073 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2071);
    bool _2075 = _2057 >= 0.0;
    bool _2077 = isnan(_2057);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(0.0);
    bool _2083 = _2079 || _2081;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2087 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2085);
    float _2089 = 1.0 / _1981;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2093 = -_2025;
    float _2095 = fma(_2021, _2091, _2093);
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2099 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2097);
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2103 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2101);
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2107 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2105);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    bool _2113 = _2095 >= 0.0;
    bool _2115 = isnan(_2095);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(0.0);
    bool _2121 = _2117 || _2119;
    float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2125 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2123);
    float _2127 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2129 = -_2025;
    float _2131 = fma(_2051, _2127, _2129);
    float _2133 = 1.0 / _1999;
    bool _2135 = !_2121;
    float _2137 = _2135 ? 0.0 : 2.0;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2141 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2139);
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2145 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2143);
    bool _2147 = _2131 >= 0.0;
    bool _2149 = isnan(_2131);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2161 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2159);
    bool _2163 = !_2083;
    float _2165 = _2163 ? 0.0 : 2.0;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2169 = -_2025;
    float _2171 = fma(_2089, _2167, _2169);
    float _2173 = 1.0 / _2011;
    out.m_64.z = _1969;
    out.m_64.w = _1951;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2177 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2175);
    float _2179 = _2165 + _2157;
    bool _2181 = _2171 >= 0.0;
    bool _2183 = isnan(_2171);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.0);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    out.gl_Position.x = _1957;
    out.gl_Position.y = _1965;
    out.gl_Position.z = _1949;
    out.gl_Position.w = _1951;
    float _2193 = _2179 + _2137;
    float _2195 = 1.0 / _1985;
    float _2197 = _2193 + _2191;
    float _2199 = 1.0 / _2019;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2203 = -_2025;
    float _2205 = fma(_2195, _2201, _2203);
    float _2207 = 1.0 / _2037;
    bool _2209 = _2205 >= 0.0;
    bool _2211 = isnan(_2205);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan(0.0);
    bool _2217 = _2213 || _2215;
    float _2219 = float(_2217);
    float _2221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2223 = -_2025;
    float _2225 = fma(_2199, _2221, _2223);
    float _2227 = 1.0 / _1989;
    float _2229 = _2197 + _2219;
    float _2231 = 1.0 / _2061;
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2235 = -_2025;
    float _2237 = fma(_2227, _2233, _2235);
    float _2239 = 1.0 / _2141;
    bool _2241 = _2237 >= 0.0;
    bool _2243 = isnan(_2237);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = 1.0 / _1993;
    bool _2253 = !_2249;
    float _2255 = _2253 ? 0.0 : 2.0;
    float _2257 = _2229 + _2255;
    float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2261 = -_2025;
    float _2263 = fma(_2133, _2259, _2261);
    float _2265 = 1.0 / _2145;
    bool _2267 = _2263 >= 0.0;
    bool _2269 = isnan(_2263);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.0);
    bool _2275 = _2271 || _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2279 = -_2025;
    float _2281 = fma(_2251, _2277, _2279);
    float _2283 = 1.0 / _2177;
    bool _2285 = _2281 >= 0.0;
    bool _2287 = isnan(_2281);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan(0.0);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = 1.0 / _2003;
    float _2299 = _2257 + _2295;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2303 = -_2025;
    float _2305 = fma(_2297, _2301, _2303);
    float _2307 = 1.0 / _2007;
    bool _2309 = _2305 >= 0.0;
    bool _2311 = isnan(_2305);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    bool _2319 = !_2275;
    float _2321 = _2319 ? 0.0 : 2.0;
    bool _2323 = !_2317;
    float _2325 = _2323 ? 0.0 : 2.0;
    float _2327 = _2299 + _2321;
    float _2329 = _2327 + _2325;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2333 = -_2025;
    float _2335 = fma(_2307, _2331, _2333);
    bool _2337 = _2335 >= 0.0;
    bool _2339 = isnan(_2335);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = float(_2345);
    float _2349 = 1.0 / _2015;
    float _2351 = _2329 + _2347;
    float _2353 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2355 = -_2025;
    float _2357 = fma(_2173, _2353, _2355);
    bool _2359 = _2357 >= 0.0;
    bool _2361 = isnan(_2357);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.0);
    bool _2367 = _2363 || _2365;
    bool _2369 = !_2367;
    float _2371 = _2369 ? 0.0 : 2.0;
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2375 = -_2025;
    float _2377 = fma(_2349, _2373, _2375);
    float _2379 = _2351 + _2371;
    bool _2381 = _2225 >= 0.0;
    bool _2383 = isnan(_2225);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan(0.0);
    bool _2389 = _2385 || _2387;
    float _2391 = float(_2389);
    bool _2393 = _2377 >= 0.0;
    bool _2395 = isnan(_2377);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    float _2403 = float(_2401);
    float _2405 = 1.0 / _2033;
    float _2407 = _2379 + _2403;
    float _2409 = 1.0 / _2029;
    float _2411 = _2407 + _2391;
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2415 = -_2025;
    float _2417 = fma(_2409, _2413, _2415);
    float _2419 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2421 = -_2025;
    float _2423 = fma(_2405, _2419, _2421);
    float _2425 = 1.0 / _2125;
    bool _2427 = _2417 >= 0.0;
    bool _2429 = isnan(_2417);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(0.0);
    bool _2435 = _2431 || _2433;
    bool _2437 = _2423 >= 0.0;
    bool _2439 = isnan(_2423);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan(0.0);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    bool _2449 = !_2435;
    float _2451 = _2449 ? 0.0 : 2.0;
    float _2453 = 1.0 / _2041;
    float _2455 = _2411 + _2451;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2459 = -_2025;
    float _2461 = fma(_2207, _2457, _2459);
    float _2463 = _2455 + _2447;
    bool _2465 = _2461 >= 0.0;
    bool _2467 = isnan(_2461);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.0);
    bool _2473 = _2469 || _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2477 = -_2025;
    float _2479 = fma(_2453, _2475, _2477);
    float _2481 = 1.0 / _2045;
    bool _2483 = _2479 >= 0.0;
    bool _2485 = isnan(_2479);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(0.0);
    bool _2491 = _2487 || _2489;
    bool _2493 = !_2473;
    float _2495 = _2493 ? 0.0 : 2.0;
    bool _2497 = !_2491;
    float _2499 = _2497 ? 0.0 : 2.0;
    float _2501 = _2463 + _2495;
    float _2503 = _2501 + _2499;
    float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2507 = -_2025;
    float _2509 = fma(_2481, _2505, _2507);
    bool _2511 = _2509 >= 0.0;
    bool _2513 = isnan(_2509);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan(0.0);
    bool _2519 = _2515 || _2517;
    float _2521 = float(_2519);
    float _2523 = 1.0 / _2049;
    float _2525 = _2503 + _2521;
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2529 = -_2025;
    float _2531 = fma(_2231, _2527, _2529);
    float _2533 = 1.0 / _2161;
    bool _2535 = _2531 >= 0.0;
    bool _2537 = isnan(_2531);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(0.0);
    bool _2543 = _2539 || _2541;
    bool _2545 = !_2543;
    float _2547 = _2545 ? 0.0 : 2.0;
    float _2549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2551 = -_2025;
    float _2553 = fma(_2523, _2549, _2551);
    float _2555 = _2525 + _2547;
    bool _2557 = _2553 >= 0.0;
    bool _2559 = isnan(_2553);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan(0.0);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    float _2569 = 1.0 / _2065;
    float _2571 = _2555 + _2567;
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2575 = -_2025;
    float _2577 = fma(_2569, _2573, _2575);
    float _2579 = 1.0 / _2069;
    bool _2581 = _2577 >= 0.0;
    bool _2583 = isnan(_2577);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(0.0);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    float _2593 = _2571 + _2591;
    float _2595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2597 = -_2025;
    float _2599 = fma(_2579, _2595, _2597);
    float _2601 = 1.0 / _2073;
    bool _2603 = _2599 >= 0.0;
    bool _2605 = isnan(_2599);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan(0.0);
    bool _2611 = _2607 || _2609;
    bool _2613 = !_2611;
    float _2615 = _2613 ? 0.0 : 2.0;
    float _2617 = _2593 + _2615;
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2621 = -_2025;
    float _2623 = fma(_2601, _2619, _2621);
    bool _2625 = _2623 >= 0.0;
    bool _2627 = isnan(_2623);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan(0.0);
    bool _2633 = _2629 || _2631;
    float _2635 = float(_2633);
    float _2637 = 1.0 / _2087;
    float _2639 = _2617 + _2635;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = -_2025;
    float _2645 = fma(_2637, _2641, _2643);
    float _2647 = 1.0 / _2099;
    bool _2649 = _2645 >= 0.0;
    bool _2651 = isnan(_2645);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan(0.0);
    bool _2657 = _2653 || _2655;
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2661 = -_2025;
    float _2663 = fma(_2647, _2659, _2661);
    float _2665 = 1.0 / _2103;
    bool _2667 = _2663 >= 0.0;
    bool _2669 = isnan(_2663);
    bool _2671 = _2667 || _2669;
    bool _2673 = isnan(0.0);
    bool _2675 = _2671 || _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2679 = -_2025;
    float _2681 = fma(_2665, _2677, _2679);
    float _2683 = 1.0 / _2107;
    bool _2685 = _2681 >= 0.0;
    bool _2687 = isnan(_2681);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2697 = -_2025;
    float _2699 = fma(_2683, _2695, _2697);
    float _2701 = 1.0 / _2111;
    bool _2703 = _2699 >= 0.0;
    bool _2705 = isnan(_2699);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.0);
    bool _2711 = _2707 || _2709;
    bool _2713 = !_2675;
    float _2715 = _2713 ? 0.0 : 3.0;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2719 = -_2025;
    float _2721 = fma(_2701, _2717, _2719);
    bool _2723 = !_2693;
    float _2725 = _2723 ? 0.0 : 3.0;
    bool _2727 = _2721 >= 0.0;
    bool _2729 = isnan(_2721);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = _2715 + _2725;
    bool _2739 = !_2657;
    float _2741 = _2739 ? 0.0 : 2.0;
    bool _2743 = !_2711;
    float _2745 = _2743 ? 0.0 : 3.0;
    bool _2747 = !_2735;
    float _2749 = _2747 ? 0.0 : 3.0;
    float _2751 = _2639 + _2741;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2755 = -_2025;
    float _2757 = fma(_2425, _2753, _2755);
    float _2759 = _2737 + _2745;
    float _2761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2763 = -_2025;
    float _2765 = fma(_2239, _2761, _2763);
    float _2767 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2769 = -_2025;
    float _2771 = fma(_2533, _2767, _2769);
    float _2773 = _2751 * 0.02857142873108386993408203125;
    float _2775 = precise::clamp(_2773, 0.0, 1.0);
    bool _2777 = _2757 >= 0.0;
    bool _2779 = isnan(_2757);
    bool _2781 = _2777 || _2779;
    bool _2783 = isnan(0.0);
    bool _2785 = _2781 || _2783;
    float _2787 = _2759 + _2749;
    bool _2789 = _2771 >= 0.0;
    bool _2791 = isnan(_2771);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan(0.0);
    bool _2797 = _2793 || _2795;
    bool _2799 = !_2785;
    float _2801 = _2799 ? 0.0 : 3.0;
    bool _2803 = _2765 >= 0.0;
    bool _2805 = isnan(_2765);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan(0.0);
    bool _2811 = _2807 || _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2815 = -_2025;
    float _2817 = fma(_2265, _2813, _2815);
    bool _2819 = !_2797;
    float _2821 = _2819 ? 0.0 : 3.0;
    float _2823 = _2787 + _2801;
    bool _2825 = !_2811;
    float _2827 = _2825 ? 0.0 : 3.0;
    bool _2829 = _2817 >= 0.0;
    bool _2831 = isnan(_2817);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan(0.0);
    bool _2837 = _2833 || _2835;
    float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2841 = -_2025;
    float _2843 = fma(_2283, _2839, _2841);
    float _2845 = _2823 + _2827;
    bool _2847 = !_2837;
    float _2849 = _2847 ? 0.0 : 3.0;
    bool _2851 = _2843 >= 0.0;
    bool _2853 = isnan(_2843);
    bool _2855 = _2851 || _2853;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    float _2861 = _2845 + _2849;
    bool _2863 = !_2859;
    float _2865 = _2863 ? 0.0 : 5.0;
    bool _2867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2869 = isnan(0.5);
    bool _2871 = _2867 || _2869;
    bool _2873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2875 = _2871 || _2873;
    float _2877 = _2861 + _2821;
    float _2879 = _2877 + _2865;
    float _2881 = _2879 * 0.14285714924335479736328125;
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    float _2885 = _2775 * _2883;
    float _2887 = _2775;
    float _2889 = _2883;
    if (_2875)
    {
        _2887 = 1.0;
    }
    float _2891 = _2887;
    float _2893 = _2891;
    if (_2875)
    {
        _2889 = 1.0;
    }
    float _2895 = _2889;
    float _2897 = _2895;
    if (!_2875)
    {
        float _2899 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2901 = _2899 * 0.15915493667125701904296875;
        float _2903 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2905 = _2901 * 6.283185482025146484375;
        float _2907 = cos(_2905);
        float _2909 = _2903 * 0.15915493667125701904296875;
        float _2911 = _2901 * 6.283185482025146484375;
        float _2913 = sin(_2911);
        float _2915 = 1.0 / _2907;
        float _2917 = _2909 * 6.283185482025146484375;
        float _2919 = cos(_2917);
        float _2921 = _2913 * _2915;
        float _2923 = _2909 * 6.283185482025146484375;
        float _2925 = sin(_2923);
        float _2927 = _2919 * _2921;
        float _2929 = 1.0 / _2927;
        float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2933 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2931;
        float _2935 = 1.0 / _2933;
        float _2937 = _2925 * _2929;
        float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2941 = fma(_2025, _2937, _2939);
        float _2943 = _2941 * _2935;
        float _2945 = precise::clamp(_2943, 0.0, 1.0);
        _2897 = _2945;
    }
    float _2947 = _2897;
    if (!_2875)
    {
        float _2949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2951 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2953 = _2949 * 0.15915493667125701904296875;
        float _2955 = _2951 * 0.15915493667125701904296875;
        float _2957 = _2953 * 6.283185482025146484375;
        float _2959 = cos(_2957);
        float _2961 = _2953 * 6.283185482025146484375;
        float _2963 = sin(_2961);
        float _2965 = 1.0 / _2959;
        float _2967 = _2955 * 6.283185482025146484375;
        float _2969 = cos(_2967);
        float _2971 = _2963 * _2965;
        float _2973 = _2955 * 6.283185482025146484375;
        float _2975 = sin(_2973);
        float _2977 = _2969 * _2971;
        float _2979 = 1.0 / _2977;
        float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2983 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2981;
        float _2985 = 1.0 / _2983;
        float _2987 = _2975 * _2979;
        float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2991 = fma(_2025, _2987, _2989);
        float _2993 = _2991 * _2985;
        float _2995 = precise::clamp(_2993, 0.0, 1.0);
        float _2997 = -_2995;
        float _2999 = _2997 + 1.0;
        _2893 = _2999;
    }
    float _3001 = _2893;
    float _3003 = _2885 * _2947;
    bool _3005 = _2947 > 0.0;
    bool _3007 = isnan(_2947);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan(0.0);
    bool _3013 = _3009 || _3011;
    float _3015 = _3003 * _3001;
    bool _3017 = _3001 <= 0.0;
    bool _3019 = !_3013;
    bool _3021 = _3017 || _3019;
    float _3023 = _3015 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3025 = _3023 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _3025;
    if (!_3021)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_38.x = 0.0;
    float _3027 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3027;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _765 = false;
    bool _657 = false;
    bool _419 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_35.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    if (!_87)
    {
        out.m_38.x = 0.0;
    }
    int _93 = 0;
    if (!_87)
    {
        float _95 = _91 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3083 = as_type<float>(_97);
        out.gl_Position.z = _3083;
    }
    if (!_87)
    {
        return out;
    }
    float _101 = in.m_40.w;
    float _103 = float(_83);
    float _105 = in.m_42.z;
    float _107 = in.m_42.w;
    float _109 = -_101;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_101);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    out.m_44.z = _105;
    bool _123 = _111 >= _103;
    bool _125 = !_121;
    bool _127 = _123 || _125;
    float _129 = 1.0 / _103;
    out.m_44.w = _107;
    float _131 = _101;
    if (_127)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_127)
    {
        out.m_38.x = 0.0;
    }
    if (_127)
    {
        float _135 = _133 * 5.0;
        _99 = as_type<int>(_135);
    }
    int _137 = _99;
    float _139 = _111 * _129;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_137);
        out.gl_Position.z = _3160;
    }
    out.m_46.x = _139;
    if (_127)
    {
        return out;
    }
    float _141 = in.m_48.w;
    float _143 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_40.x;
    float _157 = in.m_40.y;
    float _159 = in.m_40.z;
    float _161 = in.m_35.x;
    float _163 = in.m_35.y;
    float _165 = in.m_35.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = 0.0;
    if (!_183)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _143 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _143);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _219;
        _187 = _207;
        _189 = _209;
    }
    float _221 = _185;
    float _223 = _187;
    float _225 = _189;
    bool _227 = !_153;
    float _229 = _225;
    float _231 = _223;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _143 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _239;
        _169 = _251;
    }
    float _253 = _229;
    float _255 = _169;
    float _257 = _253;
    if (!_153)
    {
        float _259 = _111 * _111;
        float _261 = _259 * 0.5;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263;
    if (!_153)
    {
        _257 = _111;
    }
    float _267 = _257;
    float _269 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _267;
    if (!_153)
    {
        float _275 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _275;
    }
    float _277 = _265;
    bool _279 = !_153;
    float _281 = _277;
    if (!_279)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = _111 * _285;
        float _295 = 1.0 / _289;
        float _297 = _291 * 0.693147182464599609375;
        float _299 = exp2(_293);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _111);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _311;
    }
    float _313 = _281;
    bool _315 = !_153;
    if (!_315)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = 1.0 / _323;
        float _327 = _111 * _319;
        float _329 = exp2(_327);
        float _331 = -_329;
        float _333 = _331 + 1.0;
        float _335 = _333 * _325;
        _273 = _335;
    }
    float _337 = _273;
    float _339 = fma(_255, _155, _269);
    float _341 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = fma(_255, _157, _271);
    float _345 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _349 = fma(_337, _157, _341);
    float _351 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _355 = fma(_337, _155, _345);
    float _357 = -_349;
    float _359 = _343 + _357;
    float _361 = fma(_255, _159, _351);
    float _363 = fma(_337, _159, _353);
    float _365 = fma(_339, _141, _161);
    float _367 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _371 = -_355;
    float _373 = _339 + _371;
    float _375 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _377 = -_363;
    float _379 = _361 + _377;
    float _381 = fma(_343, _141, _163);
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _385 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _369);
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _375);
    float _389 = fma(_361, _141, _165);
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _383);
    float _393 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _397 = !_347;
    float _399 = _395;
    float _417;
    if (!_397)
    {
        float _401 = in.m_42.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        _417 = _139;
    }
    _419 = false;
    float _421 = _417;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _421 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _421 + _427;
    bool _431 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _433 = isnan(_421);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _457 = _421 + _455;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _461 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _463 = isnan(_421);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _453;
    bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _477 = 1.0 / _449;
    float _479 = _391 * _459;
    float _481 = _393 * _459;
    float _483 = _395 * _459;
    float _485 = 1.0 / _445;
    float _487 = _425 * _473;
    bool _489 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_421);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_441;
    float _503 = _501 + 1.0;
    float _505 = _499 * _503;
    float _507 = _429 * _477;
    bool _509 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _511 = isnan(_421);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_499;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = _519 * _523;
    float _539 = _457 * _485;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = _471 * _535;
    float _551 = fma(_527, _539, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _553 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _555 = fma(_547, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _565 = fma(_531, _507, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _567 = _553 * _549;
    float _569 = _555 * _549;
    float _571 = fma(_559, _507, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _573 = in.m_48.x;
    float _575 = in.m_48.y;
    float _577 = in.m_48.z;
    float _579 = fma(_563, _507, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _581 = _551 * _549;
    float _583 = -_471;
    float _585 = _583 + 1.0;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _589 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _569);
    float _591 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].z, _581);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _601;
    float _605 = fma(_565, _537, _587);
    float _607 = fma(_595, _487, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _609 = fma(_599, _487, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _611 = fma(_603, _487, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _613 = fma(_571, _537, _589);
    float _615 = fma(_579, _537, _591);
    float _617 = fma(_607, _505, _605);
    float _619 = fma(_609, _505, _613);
    float _621 = fma(_611, _505, _615);
    float _623 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].x, _617);
    float _625 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].y, _619);
    float _627 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].z, _621);
    float _629 = _623 * _573;
    float _631 = _625 * _575;
    float _633 = _627 * _577;
    bool _635 = !_475;
    float _637 = _487;
    float _655;
    if (!_635)
    {
        float _639 = in.m_42.x;
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _643 = _639 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _647 = _645 * _641;
        float _649 = floor(_647);
        float _651 = -_649;
        float _653 = _647 + _651;
        _655 = _653;
        _657 = true;
    }
    else
    {
        _655 = _139;
    }
    _657 = false;
    float _659 = _655;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _663 = _659 + _661;
    bool _665 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _667 = isnan(_659);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    bool _681 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _683 = isnan(_659);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_675;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _697;
    float _701 = 1.0 / _679;
    bool _703 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _705 = _691 * _695;
    float _707 = -_691;
    float _709 = _707 + 1.0;
    float _711 = _663 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _713;
    float _717 = fma(_699, _711, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _719;
    float _723 = fma(_715, _711, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _725 = fma(_721, _711, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _727 = _717 * _705;
    float _729 = _725 * _705;
    float _731 = _723 * _705;
    float _733 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].x, _727);
    float _735 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].y, _729);
    float _737 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].z, _731);
    float _739 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].x, _733);
    float _741 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].y, _735);
    float _743 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].z, _737);
    bool _745 = !_703;
    float _763;
    if (!_745)
    {
        float _747 = in.m_42.x;
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _751 = _747 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _755 = _753 * _749;
        float _757 = floor(_755);
        float _759 = -_757;
        float _761 = _755 + _759;
        _763 = _761;
        _765 = true;
    }
    else
    {
        _763 = _139;
    }
    _765 = false;
    float _767 = _763;
    float _769 = in.m_50.y;
    float _771 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _775 = _773 != 0;
    float _777 = in.m_42.x;
    float _779 = in.m_42.y;
    float _781 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _771);
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _795 = _793 != 0;
    float _797 = 1.0 / _785;
    float _799 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _801 = in.m_50.x;
    float _803 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _805 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _791);
    float _807 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _799);
    float _809 = _537;
    float _811 = _801;
    if (_775)
    {
        float _813 = in.m_42.x;
        _809 = _813;
    }
    float _815 = _809;
    float _817 = _805 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _819 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _803);
    float _821 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _807);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _831 = _817 + _829;
    float _833 = -_769;
    float _835 = _833 + 1.0;
    float _837 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _839 = _827 * _797;
    float _841 = _831 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _843 = _779 > 0.5;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _847 = _837 + _845;
    bool _849 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _851 = isnan(_767);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_817;
    float _863 = _861 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _865 = _769;
    float _867 = _797;
    if (_789)
    {
        float _869 = _843 ? _835 : _769;
        _865 = _869;
    }
    float _871 = _865;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _875 = _767 + _873;
    float _877 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[28].x, _841);
    float _879 = -_859;
    float _881 = _879 + 1.0;
    float _883 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = fma(_839, _875, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _887 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _889 = isnan(_767);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _863 * _863;
    bool _901 = _815 > 0.5;
    bool _903 = _901 && _775;
    float _905 = -_837;
    float _907 = _905 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_775)
    {
        _867 = _801;
    }
    float _909 = _867;
    float _911 = _897 * _881;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _915 = _883 + _913;
    float _917 = -_883;
    float _919 = _917 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _921 = fma(_907, _907, _899);
    float _923 = in.m_52.z;
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[28].z, _877);
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _929 = fma(_919, _919, _921);
    float _931 = _921;
    float _933 = _909;
    float _935 = _925;
    if (!_775)
    {
        _931 = _801;
    }
    float _937 = _931;
    float _939 = in.m_52.x;
    float _941 = _937;
    if (_903)
    {
        float _943 = -_909;
        float _945 = _943 + 1.0;
        _933 = _945;
    }
    float _947 = _933;
    float _949 = _885 * _911;
    float _951 = -_897;
    float _953 = _951 + 1.0;
    float _955 = in.m_52.y;
    float _957 = _915;
    if (_795)
    {
        float _959 = rsqrt(_929);
        _957 = _959;
    }
    float _961 = _957;
    if (_775)
    {
        _941 = _947;
    }
    float _963 = _941;
    float _965 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[115].x, _949);
    bool _967 = _925 >= 0.0;
    float _969 = _871 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _971 = _741 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _975 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[116].x, _965);
    float _977 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _979 = _969 * _927;
    float _981 = _973 * _823;
    float _983 = _739 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _985 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _991 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_967)
    {
        _935 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _993 = _935;
    int _995 = as_type<int>(_993);
    if (_795)
    {
        float _997 = _961 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _811 = _997;
    }
    float _999 = _811;
    out.m_54.x = _981;
    out.m_54.y = _979;
    float _1001 = 0.0;
    float _1003 = _999;
    if (!_795)
    {
        _1001 = 0.0;
    }
    float _1005 = _1001;
    float _1007 = _1005;
    if (_967)
    {
        float _1009 = _993 * 5.0;
        _995 = as_type<int>(_1009);
    }
    int _1011 = _995;
    out.m_56.z = _923;
    if (!_795)
    {
        _637 = 0.0;
    }
    float _1013 = _637;
    float _1015 = _1013;
    if (_795)
    {
        float _1017 = _907 * _999;
        _1007 = _1017;
    }
    float _1019 = _1007;
    if (_795)
    {
        float _1021 = _863 * _999;
        _1015 = _1021;
    }
    float _1023 = _1015;
    if (_967)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4578 = as_type<float>(_1011);
        out.gl_Position.z = _4578;
    }
    if (!_795)
    {
        _399 = 0.0;
    }
    float _1025 = _399;
    out.m_56.x = _939;
    out.m_56.y = _955;
    out.m_58.x = _991;
    out.m_58.y = _985;
    out.m_58.z = _987;
    out.m_58.w = _989;
    float _1027 = _1025;
    if (_967)
    {
        out.m_38.x = 0.0;
    }
    if (_967)
    {
        return out;
    }
    float _1029 = _817 + _1023;
    if (_795)
    {
        float _1031 = _919 * _999;
        _1027 = _1031;
    }
    float _1033 = _1027;
    float _1035 = _837 + _1019;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1029 + _1037;
    float _1041 = _883 + _1033;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _1035 + _1043;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = _1041 + _1049;
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1047);
    float _1055 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1053);
    bool _1057 = _1055 >= 0.0;
    if (_1057)
    {
        _1003 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1059 = _1003;
    int _1061 = as_type<int>(_1059);
    if (_1057)
    {
        out.m_38.x = 0.0;
    }
    if (_1057)
    {
        float _1063 = _1059 * 5.0;
        _1061 = as_type<int>(_1063);
    }
    int _1065 = _1061;
    if (_1057)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4682 = as_type<float>(_1065);
        out.gl_Position.z = _4682;
    }
    if (_1057)
    {
        return out;
    }
    float _1067 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1069 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1071 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1067);
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1069);
    float _1075 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1071);
    float _1077 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1079 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1073);
    float _1081 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1083 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1077);
    float _1085 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1087 = 1.0 / _1081;
    float _1089 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1083);
    float _1091 = _1081 * 0.5;
    float _1093 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1095 = fma(_1085, -0.5, _1091);
    float _1097 = _1093 + _1081;
    float _1099 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1095);
    float _1101 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1095);
    float _1103 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1095);
    float _1105 = _1097 * 0.5;
    float _1107 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1095);
    float _1109 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1095);
    float _1111 = _1099 * _1087;
    float _1113 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1105);
    float _1115 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1105);
    float _1117 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1105);
    float _1119 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1105);
    float _1121 = _1113 * _1087;
    float _1123 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1095);
    float _1125 = _1101 * _1087;
    float _1127 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1105);
    float _1129 = _1115 * _1087;
    float _1131 = _1117 * _1087;
    float _1133 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1095);
    float _1135 = _1103 * _1087;
    float _1137 = _1119 * _1087;
    float _1139 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1095);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1143 = _1095 + _1141;
    float _1145 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1105);
    float _1147 = _1107 * _1087;
    float _1149 = _1109 * _1087;
    float _1151 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1153 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1105);
    float _1155 = _1123 * _1087;
    float2 _4872 = float2(_1121, _1125);
    float _1157 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4872, float2(0.0), isnan(_4872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4872, float2(0.0), isnan(_4872)), level(0.0)).x;
    float2 _4882 = float2(_1129, _1111);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4882, float2(0.0), isnan(_4882)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4882, float2(0.0), isnan(_4882)), level(0.0)).x;
    float2 _4890 = float2(_1129, _1135);
    float _1161 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4890, float2(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4890, float2(0.0), isnan(_4890)), level(0.0)).x;
    float2 _4898 = float2(_1131, _1147);
    float _1163 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4898, float2(0.0), isnan(_4898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4898, float2(0.0), isnan(_4898)), level(0.0)).x;
    float2 _4906 = float2(_1137, _1155);
    float _1165 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4906, float2(0.0), isnan(_4906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4906, float2(0.0), isnan(_4906)), level(0.0)).x;
    float _1167 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1105);
    float _1169 = _1127 * _1087;
    float _1171 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1105);
    float _1173 = _1133 * _1087;
    float _1175 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1095);
    float _1177 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1095);
    float _1179 = _1145 * _1087;
    float _1181 = _1139 * _1087;
    float _1183 = _1143 * _1087;
    float _1185 = _1095 * _1087;
    float _1187 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1095);
    float _1189 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1095);
    float _1191 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1095);
    float _1193 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1095);
    float _1195 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1095);
    float _1197 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1095);
    float _1199 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1095);
    float _1201 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1095);
    float _1203 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1095);
    float _1205 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1095);
    float _1207 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1095);
    float _1209 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1095);
    float _1211 = _1105 * _1087;
    float _1213 = _1153 * _1087;
    float _1215 = _1151 * _1087;
    float _1217 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1105);
    float _1219 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1105);
    float _1221 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1105);
    float _1223 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1105);
    float _1225 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1105);
    float _1227 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1105);
    float _1229 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1105);
    float _1231 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1105);
    float _1233 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1105);
    float _1235 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1105);
    float _1237 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1105);
    float _1239 = _1167 * _1087;
    float2 _5063 = float2(_1169, _1149);
    float _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).x;
    float2 _5071 = float2(_1169, _1173);
    float _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5071, float2(0.0), isnan(_5071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5071, float2(0.0), isnan(_5071)), level(0.0)).x;
    float2 _5079 = float2(_1179, _1181);
    float _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5079, float2(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5079, float2(0.0), isnan(_5079)), level(0.0)).x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1249 = _1105 + _1247;
    float _1251 = _1175 * _1087;
    float _1253 = _1177 * _1087;
    float _1255 = _1171 * _1087;
    float _1257 = _1191 * _1087;
    float2 _5105 = float2(_1211, _1181);
    float _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5105, float2(0.0), isnan(_5105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5105, float2(0.0), isnan(_5105)), level(0.0)).x;
    float2 _5113 = float2(_1211, _1183);
    float _1261 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5113, float2(0.0), isnan(_5113)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5113, float2(0.0), isnan(_5113)), level(0.0)).x;
    float2 _5121 = float2(_1211, _1215);
    float _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5121, float2(0.0), isnan(_5121)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5121, float2(0.0), isnan(_5121)), level(0.0)).x;
    float2 _5129 = float2(_1239, _1251);
    float _1265 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5129, float2(0.0), isnan(_5129)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5129, float2(0.0), isnan(_5129)), level(0.0)).x;
    float2 _5137 = float2(_1211, _1251);
    float _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5137, float2(0.0), isnan(_5137)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5137, float2(0.0), isnan(_5137)), level(0.0)).x;
    float2 _5145 = float2(_1211, _1253);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5145, float2(0.0), isnan(_5145)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5145, float2(0.0), isnan(_5145)), level(0.0)).x;
    float2 _5153 = float2(_1211, _1257);
    float _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5153, float2(0.0), isnan(_5153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5153, float2(0.0), isnan(_5153)), level(0.0)).x;
    float2 _5161 = float2(_1211, _1185);
    float _1273 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5161, float2(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5161, float2(0.0), isnan(_5161)), level(0.0)).x;
    float _1275 = _1105 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1277 = _1249 * _1087;
    float _1279 = _1187 * _1087;
    float _1281 = _1189 * _1087;
    float _1283 = _1275 * _1087;
    float _1285 = _1217 * _1087;
    float _1287 = _1221 * _1087;
    float2 _5191 = float2(_1277, _1185);
    float _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5191, float2(0.0), isnan(_5191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5191, float2(0.0), isnan(_5191)), level(0.0)).x;
    float2 _5199 = float2(_1213, _1279);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5199, float2(0.0), isnan(_5199)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5199, float2(0.0), isnan(_5199)), level(0.0)).x;
    float2 _5207 = float2(_1213, _1281);
    float _1293 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5207, float2(0.0), isnan(_5207)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5207, float2(0.0), isnan(_5207)), level(0.0)).x;
    float2 _5215 = float2(_1213, _1185);
    float _1295 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5215, float2(0.0), isnan(_5215)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5215, float2(0.0), isnan(_5215)), level(0.0)).x;
    float2 _5223 = float2(_1283, _1185);
    float _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5223, float2(0.0), isnan(_5223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5223, float2(0.0), isnan(_5223)), level(0.0)).x;
    float2 _5231 = float2(_1285, _1185);
    float _1299 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5231, float2(0.0), isnan(_5231)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5231, float2(0.0), isnan(_5231)), level(0.0)).x;
    float _1301 = _1219 * _1087;
    float _1303 = _1223 * _1087;
    float _1305 = _1225 * _1087;
    float _1307 = _1193 * _1087;
    float _1309 = _1227 * _1087;
    float _1311 = _1195 * _1087;
    float _1313 = _1229 * _1087;
    float _1315 = _1197 * _1087;
    float _1317 = _1231 * _1087;
    float2 _5266 = float2(_1301, _1185);
    float _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5266, float2(0.0), isnan(_5266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5266, float2(0.0), isnan(_5266)), level(0.0)).x;
    float2 _5274 = float2(_1287, _1185);
    float _1321 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5274, float2(0.0), isnan(_5274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5274, float2(0.0), isnan(_5274)), level(0.0)).x;
    float2 _5282 = float2(_1303, _1307);
    float _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5282, float2(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5282, float2(0.0), isnan(_5282)), level(0.0)).x;
    float2 _5290 = float2(_1305, _1311);
    float _1325 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5290, float2(0.0), isnan(_5290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5290, float2(0.0), isnan(_5290)), level(0.0)).x;
    float2 _5298 = float2(_1309, _1315);
    float _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5298, float2(0.0), isnan(_5298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5298, float2(0.0), isnan(_5298)), level(0.0)).x;
    float _1329 = _1199 * _1087;
    float _1331 = _1233 * _1087;
    float _1333 = _1201 * _1087;
    float _1335 = _1235 * _1087;
    float _1337 = _1203 * _1087;
    float _1339 = _1237 * _1087;
    float _1341 = _1205 * _1087;
    float _1343 = _1207 * _1087;
    float2 _5330 = float2(_1313, _1329);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).x;
    float2 _5338 = float2(_1317, _1333);
    float _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).x;
    float2 _5346 = float2(_1331, _1337);
    float _1349 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5346, float2(0.0), isnan(_5346)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5346, float2(0.0), isnan(_5346)), level(0.0)).x;
    float2 _5354 = float2(_1335, _1341);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5354, float2(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5354, float2(0.0), isnan(_5354)), level(0.0)).x;
    float2 _5362 = float2(_1339, _1343);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5362, float2(0.0), isnan(_5362)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5362, float2(0.0), isnan(_5362)), level(0.0)).x;
    float _1355 = _1209 * _1087;
    float2 _5373 = float2(_1255, _1355);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5373, float2(0.0), isnan(_5373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5373, float2(0.0), isnan(_5373)), level(0.0)).x;
    float _1359 = sqrt(_929);
    float _1361 = _777 * 0.550000011920928955078125;
    float _1363 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1365 = _107 * 78.233001708984375;
    float _1367 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1363);
    float _1369 = fma(_111, 0.300000011920928955078125, -1.0);
    float _1371 = rint(_1361);
    float _1373 = _1369 * 0.15915493667125701904296875;
    float _1375 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1377 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1367);
    float _1379 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1381 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1375);
    float _1383 = _1373 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1379);
    float _1389 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1381);
    float _1393 = in.m_60.x;
    float _1395 = in.m_60.y;
    float _1397 = in.m_60.z;
    float _1399 = fma(_1359, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1401 = precise::clamp(_1399, 0.0, 1.0);
    float _1403 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1387);
    float _1405 = rsqrt(_1391);
    float _1407 = fma(_1401, -2.0, 3.0);
    float _1409 = _1401 * _1401;
    float _1411 = _139 * _139;
    float _1413 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1415 = fma(_1385, -0.02999999932944774627685546875, 1.0);
    float _1417 = fma(_1385, -0.100000001490116119384765625, 0.5);
    float _1419 = _1407 * _1409;
    float _1421 = rsqrt(_1377);
    float _1423 = abs(_139);
    float _1425 = _1423 * _1411;
    float _1427 = -_1415;
    float _1429 = _1427 + _1417;
    float _1431 = -_923;
    float _1433 = _1431 + _939;
    float _1435 = -_1419;
    float _1437 = _1435 + 0.5;
    float _1439 = -_1419;
    float _1441 = _1439 + 1.0;
    float _1443 = fma(_1419, _1429, _1415);
    float _1445 = _1419 * _1433;
    float _1447 = rsqrt(_1403);
    float _1449 = fma(_1425, _1437, 1.0);
    float _1451 = fma(_1413, _1441, 1.0);
    float _1453 = _1443 * _1395;
    float _1455 = _1443 * _1393;
    float _1457 = _1445 * 0.0599999986588954925537109375;
    float _1459 = _1449 * _1451;
    float _1461 = _1453 * _1405;
    float _1463 = _1443 * _1397;
    float _1465 = _1455 * _1421;
    float _1467 = _1457 * _1421;
    float _1469 = _1461 * _1459;
    float _1471 = fma(_923, 12.98980045318603515625, _1365);
    float _1473 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1475 = fma(_1465, _1459, _1467);
    float _1477 = _1463 * _1447;
    float _1479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1469);
    float _1481 = _1471 * 0.15915493667125701904296875;
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1475);
    float _1485 = _1477 * _1459;
    float _1487 = _1479 * _1389;
    float _1489 = fma(_939, 12.98980045318603515625, _1365);
    float _1491 = abs(_139);
    float _1493 = log2(_1491);
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1485);
    float _1497 = _633 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1499 = _1483 * _1473;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1503 = _1489 * 0.15915493667125701904296875;
    float _1505 = _1495 * _1497;
    float _1507 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1501);
    float _1511 = _1481 * 6.283185482025146484375;
    float _1513 = sin(_1511);
    float _1515 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1517 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1507);
    float _1519 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1509);
    float _1521 = fma(_955, 12.98980045318603515625, _1365);
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1515);
    float _1525 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1517);
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1529 = _1503 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1493 * 0.800000011920928955078125;
    float _1535 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1537 = _817 + _1527;
    float _1539 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1523);
    float _1541 = _1521 * 0.15915493667125701904296875;
    float _1543 = _837 + _1535;
    float _1545 = -_1537;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1549 = exp2(_1533);
    float _1551 = _1513 * 43758.546875;
    float _1553 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1555 = -_1543;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1559 = _1547 * _1547;
    float _1561 = _883 + _1553;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1571 = _1567 || _1569;
    float _1573 = fma(_1557, _1557, _1559);
    float _1575 = _1531 * 43758.546875;
    float _1577 = -_1561;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1581 = floor(_1551);
    float _1583 = fma(_779, 6.0, 12.0);
    float _1585 = fma(12.0, _777, 24.0);
    float _1587 = fma(_1579, _1579, _1573);
    float _1589 = _1549 * _1583;
    float _1591 = _1549 * _1585;
    float _1593 = _1493 * 0.5;
    float _1595 = floor(_1575);
    float _1597 = _1589 * _955;
    float _1599 = _1591 * _939;
    float _1601 = _479 * _1597;
    float _1603 = -_1581;
    float _1605 = _1551 + _1603;
    float _1607 = sqrt(_1587);
    float _1609 = fma(_479, _1599, _1601);
    float _1611 = _483 * _1597;
    float _1613 = fma(_1605, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1615 = fma(_483, _1599, _1611);
    float _1617 = exp2(_1593);
    float _1619 = -_1595;
    float _1621 = _1575 + _1619;
    float _1623 = fma(_1621, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1625 = fma(_1607, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = 1.0 / _1403;
    float _1631 = fma(_1627, -2.0, 3.0);
    float _1633 = _1627 * _1627;
    float _1635 = fma(_1617, _1613, _1615);
    float _1637 = 1.0 / _1377;
    float _1639 = fma(_1617, _1623, _1609);
    float _1641 = -_1633;
    float _1643 = fma(_1631, _1641, 1.0);
    float _1645 = _1497 * _1635;
    float _1647 = _481 * _1597;
    float _1649 = _1473 * _1639;
    float _1651 = _1645 * _1643;
    float _1653 = _1541 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = _1649 * _1643;
    float _1659 = fma(_481, _1599, _1647);
    float _1661 = fma(_1651, _1629, _1561);
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1665 = _1661 + _1663;
    float _1667 = fma(_1657, _1637, _1543);
    float _1669 = 1.0 / _1391;
    float _1671 = _1665 * _1665;
    float _1673 = _1655 * 43758.546875;
    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1677 = _1667 + _1675;
    float _1679 = floor(_1673);
    float _1681 = fma(_1677, _1677, _1671);
    float _1683 = sqrt(_1681);
    float _1685 = -_1679;
    float _1687 = _1673 + _1685;
    float _1689 = fma(_1687, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1691 = fma(_1617, _1689, _1659);
    bool _1693 = _1683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = _1389 * _1691;
    float _1697 = _1695 * _1643;
    float _1699 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1701 = fma(_1697, _1669, _1537);
    float _1703 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1699);
    float _1705 = _1671;
    float _1707 = _1699;
    float _1709 = 0.60000002384185791015625;
    if (!_1693)
    {
        _1705 = _1667;
    }
    float _1711 = _1705;
    float _1713 = _1711;
    if (!_1693)
    {
        _1707 = _1661;
    }
    float _1715 = _1707;
    float _1717 = _1715;
    if (!_1693)
    {
        _1709 = _1701;
    }
    float _1719 = _1709;
    bool _1721 = !_1693;
    float _1723 = _1719;
    if (!_1721)
    {
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1729 = _1683 + _1727;
        float _1731 = rsqrt(_1681);
        float _1733 = _1729 * _1725;
        float _1735 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = _1733 * 0.15915493667125701904296875;
        float _1739 = _1737 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        float _1743 = _1737 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = _1741 + (-1.0);
        float _1749 = fma(_1745, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1751 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1753 = _1731 * _1749;
        float _1755 = fma(_1701, _1741, _1751);
        float _1757 = fma(_1677, _1753, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1759 = fma(_1665, _1753, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1713 = _1757;
        _1723 = _1755;
        _1717 = _1759;
    }
    float _1761 = _1713;
    float _1763 = _1723;
    float _1765 = _1717;
    float _1767 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1703);
    float _1769 = _1019 + _1761;
    float _1771 = _1023 + _1763;
    float _1773 = _1033 + _1765;
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1777 = _1769;
    float _1779 = _1771;
    float _1781 = _1769;
    float _1783 = _1773;
    if (!_1571)
    {
        float _1785 = _1039 * _1039;
        float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1789 = -_837;
        float _1791 = _1789 + _1761;
        float _1793 = -_817;
        float _1795 = _1793 + _1763;
        float _1797 = fma(_1045, _1045, _1785);
        float _1799 = -_883;
        float _1801 = _1799 + _1765;
        float _1803 = fma(_1051, _1051, _1797);
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1807 = sqrt(_1803);
        float _1809 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1811 = _1807 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1813 = isnan(_1807);
        bool _1815 = _1811 || _1813;
        bool _1817 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1819 = _1815 || _1817;
        float _1821 = precise::min(_1807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1823 = _1821 * _1787;
        float _1825 = _1809 * _1823;
        float _1827 = _1023;
        float _1829 = _1825;
        float _1831 = _1809;
        if (_1819)
        {
            float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1827 = _1833;
        }
        float _1835 = _1827;
        if (_1819)
        {
            float _1837 = precise::max(_1807, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1777 = _1837;
        }
        float _1839 = _1777;
        float _1841 = fma(_1791, _1825, _1035);
        float _1843 = fma(_1795, _1825, _1029);
        float _1845 = fma(_1801, _1825, _1041);
        float _1847 = _1839;
        float _1849 = _1841;
        if (_1819)
        {
            float _1851 = _1839 * _1835;
            _1847 = _1851;
        }
        float _1853 = _1847;
        float _1855 = _1853;
        if (_1819)
        {
            float _1857 = _1809 * _1853;
            _1829 = _1857;
        }
        float _1859 = _1829;
        if (!_1819)
        {
            _1855 = _1841;
        }
        float _1861 = _1855;
        float _1863 = _1861;
        if (!_1819)
        {
            _1849 = _1843;
        }
        float _1865 = _1849;
        float _1867 = _1865;
        if (_1819)
        {
            float _1869 = fma(_1791, _1859, _1035);
            _1863 = _1869;
        }
        float _1871 = _1863;
        _1781 = _1871;
        if (!_1819)
        {
            _1831 = _1845;
        }
        float _1873 = _1831;
        _1783 = _1873;
        if (_1819)
        {
            float _1875 = fma(_1795, _1859, _1029);
            _1867 = _1875;
        }
        float _1877 = _1867;
        _1779 = _1877;
        if (_1819)
        {
            float _1879 = fma(_1801, _1859, _1041);
            _1783 = _1879;
        }
    }
    float _1881 = _1779;
    float _1883 = _1781;
    float _1885 = _1783;
    float _1887 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1889 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1891 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = _1775 + _1081;
    float _1895 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1887);
    float _1897 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1899 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1901 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1895);
    float _1905 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1897);
    float _1907 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1899);
    float _1909 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1901);
    float _1911 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1913 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1905);
    float _1915 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1917 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1919 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1923 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1925 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1927 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1929 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1921);
    float _1931 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1923);
    float _1933 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1925);
    float _1935 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1937 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1927);
    float _1939 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1929);
    float _1941 = _1893 * _1087;
    float _1943 = _1941 * 0.5;
    float _1945 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1931);
    float _1947 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1933);
    float _1949 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1937);
    float _1951 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1939);
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1953);
    float _1957 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1945);
    float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1961 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
    float _1963 = _1949 + _1951;
    float _1965 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1947);
    out.m_58.x = _991;
    out.m_58.y = _985;
    out.m_58.z = _987;
    out.m_58.w = _989;
    float _1967 = 1.0 / _1955;
    float _1969 = _1963 * 0.5;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1973 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1971);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1977 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1975);
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1981 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1979);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1985 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1983);
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1989 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1987);
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1993 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1991);
    float _1995 = 1.0 / _1973;
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1999 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1997);
    float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2003 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2001);
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2007 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2005);
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2011 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2009);
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2015 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2013);
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2019 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2017);
    out.m_62.x = _1035;
    out.m_62.y = _1029;
    out.m_62.z = _1041;
    float _2021 = 1.0 / _1961;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2025 = _1967 * _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2029 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2027);
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2033 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2031);
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2037 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2035);
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2041 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2039);
    float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2045 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2043);
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    float _2051 = 1.0 / _1977;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2055 = -_2025;
    float _2057 = fma(_1995, _2053, _2055);
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2061 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2059);
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2065 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2063);
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2069 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2067);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2073 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2071);
    bool _2075 = _2057 >= 0.0;
    bool _2077 = isnan(_2057);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(0.0);
    bool _2083 = _2079 || _2081;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2087 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2085);
    float _2089 = 1.0 / _1981;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2093 = -_2025;
    float _2095 = fma(_2021, _2091, _2093);
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2099 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2097);
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2103 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2101);
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2107 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2105);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    bool _2113 = _2095 >= 0.0;
    bool _2115 = isnan(_2095);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(0.0);
    bool _2121 = _2117 || _2119;
    float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2125 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2123);
    float _2127 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2129 = -_2025;
    float _2131 = fma(_2051, _2127, _2129);
    float _2133 = 1.0 / _1999;
    bool _2135 = !_2121;
    float _2137 = _2135 ? 0.0 : 2.0;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2141 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2139);
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2145 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2143);
    bool _2147 = _2131 >= 0.0;
    bool _2149 = isnan(_2131);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2161 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2159);
    bool _2163 = !_2083;
    float _2165 = _2163 ? 0.0 : 2.0;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2169 = -_2025;
    float _2171 = fma(_2089, _2167, _2169);
    float _2173 = 1.0 / _2011;
    out.m_64.z = _1969;
    out.m_64.w = _1951;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2177 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2175);
    float _2179 = _2165 + _2157;
    bool _2181 = _2171 >= 0.0;
    bool _2183 = isnan(_2171);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.0);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    out.gl_Position.x = _1957;
    out.gl_Position.y = _1965;
    out.gl_Position.z = _1949;
    out.gl_Position.w = _1951;
    float _2193 = _2179 + _2137;
    float _2195 = 1.0 / _1985;
    float _2197 = _2193 + _2191;
    float _2199 = 1.0 / _2019;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2203 = -_2025;
    float _2205 = fma(_2195, _2201, _2203);
    float _2207 = 1.0 / _2037;
    bool _2209 = _2205 >= 0.0;
    bool _2211 = isnan(_2205);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan(0.0);
    bool _2217 = _2213 || _2215;
    float _2219 = float(_2217);
    float _2221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2223 = -_2025;
    float _2225 = fma(_2199, _2221, _2223);
    float _2227 = 1.0 / _1989;
    float _2229 = _2197 + _2219;
    float _2231 = 1.0 / _2061;
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2235 = -_2025;
    float _2237 = fma(_2227, _2233, _2235);
    float _2239 = 1.0 / _2141;
    bool _2241 = _2237 >= 0.0;
    bool _2243 = isnan(_2237);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = 1.0 / _1993;
    bool _2253 = !_2249;
    float _2255 = _2253 ? 0.0 : 2.0;
    float _2257 = _2229 + _2255;
    float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2261 = -_2025;
    float _2263 = fma(_2133, _2259, _2261);
    float _2265 = 1.0 / _2145;
    bool _2267 = _2263 >= 0.0;
    bool _2269 = isnan(_2263);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.0);
    bool _2275 = _2271 || _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2279 = -_2025;
    float _2281 = fma(_2251, _2277, _2279);
    float _2283 = 1.0 / _2177;
    bool _2285 = _2281 >= 0.0;
    bool _2287 = isnan(_2281);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan(0.0);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = 1.0 / _2003;
    float _2299 = _2257 + _2295;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2303 = -_2025;
    float _2305 = fma(_2297, _2301, _2303);
    float _2307 = 1.0 / _2007;
    bool _2309 = _2305 >= 0.0;
    bool _2311 = isnan(_2305);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    bool _2319 = !_2275;
    float _2321 = _2319 ? 0.0 : 2.0;
    bool _2323 = !_2317;
    float _2325 = _2323 ? 0.0 : 2.0;
    float _2327 = _2299 + _2321;
    float _2329 = _2327 + _2325;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2333 = -_2025;
    float _2335 = fma(_2307, _2331, _2333);
    bool _2337 = _2335 >= 0.0;
    bool _2339 = isnan(_2335);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = float(_2345);
    float _2349 = 1.0 / _2015;
    float _2351 = _2329 + _2347;
    float _2353 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2355 = -_2025;
    float _2357 = fma(_2173, _2353, _2355);
    bool _2359 = _2357 >= 0.0;
    bool _2361 = isnan(_2357);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.0);
    bool _2367 = _2363 || _2365;
    bool _2369 = !_2367;
    float _2371 = _2369 ? 0.0 : 2.0;
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2375 = -_2025;
    float _2377 = fma(_2349, _2373, _2375);
    float _2379 = _2351 + _2371;
    bool _2381 = _2225 >= 0.0;
    bool _2383 = isnan(_2225);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan(0.0);
    bool _2389 = _2385 || _2387;
    float _2391 = float(_2389);
    bool _2393 = _2377 >= 0.0;
    bool _2395 = isnan(_2377);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    float _2403 = float(_2401);
    float _2405 = 1.0 / _2033;
    float _2407 = _2379 + _2403;
    float _2409 = 1.0 / _2029;
    float _2411 = _2407 + _2391;
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2415 = -_2025;
    float _2417 = fma(_2409, _2413, _2415);
    float _2419 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2421 = -_2025;
    float _2423 = fma(_2405, _2419, _2421);
    float _2425 = 1.0 / _2125;
    bool _2427 = _2417 >= 0.0;
    bool _2429 = isnan(_2417);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(0.0);
    bool _2435 = _2431 || _2433;
    bool _2437 = _2423 >= 0.0;
    bool _2439 = isnan(_2423);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan(0.0);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    bool _2449 = !_2435;
    float _2451 = _2449 ? 0.0 : 2.0;
    float _2453 = 1.0 / _2041;
    float _2455 = _2411 + _2451;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2459 = -_2025;
    float _2461 = fma(_2207, _2457, _2459);
    float _2463 = _2455 + _2447;
    bool _2465 = _2461 >= 0.0;
    bool _2467 = isnan(_2461);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.0);
    bool _2473 = _2469 || _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2477 = -_2025;
    float _2479 = fma(_2453, _2475, _2477);
    float _2481 = 1.0 / _2045;
    bool _2483 = _2479 >= 0.0;
    bool _2485 = isnan(_2479);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(0.0);
    bool _2491 = _2487 || _2489;
    bool _2493 = !_2473;
    float _2495 = _2493 ? 0.0 : 2.0;
    bool _2497 = !_2491;
    float _2499 = _2497 ? 0.0 : 2.0;
    float _2501 = _2463 + _2495;
    float _2503 = _2501 + _2499;
    float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2507 = -_2025;
    float _2509 = fma(_2481, _2505, _2507);
    bool _2511 = _2509 >= 0.0;
    bool _2513 = isnan(_2509);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan(0.0);
    bool _2519 = _2515 || _2517;
    float _2521 = float(_2519);
    float _2523 = 1.0 / _2049;
    float _2525 = _2503 + _2521;
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2529 = -_2025;
    float _2531 = fma(_2231, _2527, _2529);
    float _2533 = 1.0 / _2161;
    bool _2535 = _2531 >= 0.0;
    bool _2537 = isnan(_2531);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(0.0);
    bool _2543 = _2539 || _2541;
    bool _2545 = !_2543;
    float _2547 = _2545 ? 0.0 : 2.0;
    float _2549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2551 = -_2025;
    float _2553 = fma(_2523, _2549, _2551);
    float _2555 = _2525 + _2547;
    bool _2557 = _2553 >= 0.0;
    bool _2559 = isnan(_2553);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan(0.0);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    float _2569 = 1.0 / _2065;
    float _2571 = _2555 + _2567;
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2575 = -_2025;
    float _2577 = fma(_2569, _2573, _2575);
    float _2579 = 1.0 / _2069;
    bool _2581 = _2577 >= 0.0;
    bool _2583 = isnan(_2577);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(0.0);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    float _2593 = _2571 + _2591;
    float _2595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2597 = -_2025;
    float _2599 = fma(_2579, _2595, _2597);
    float _2601 = 1.0 / _2073;
    bool _2603 = _2599 >= 0.0;
    bool _2605 = isnan(_2599);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan(0.0);
    bool _2611 = _2607 || _2609;
    bool _2613 = !_2611;
    float _2615 = _2613 ? 0.0 : 2.0;
    float _2617 = _2593 + _2615;
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2621 = -_2025;
    float _2623 = fma(_2601, _2619, _2621);
    bool _2625 = _2623 >= 0.0;
    bool _2627 = isnan(_2623);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan(0.0);
    bool _2633 = _2629 || _2631;
    float _2635 = float(_2633);
    float _2637 = 1.0 / _2087;
    float _2639 = _2617 + _2635;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = -_2025;
    float _2645 = fma(_2637, _2641, _2643);
    float _2647 = 1.0 / _2099;
    bool _2649 = _2645 >= 0.0;
    bool _2651 = isnan(_2645);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan(0.0);
    bool _2657 = _2653 || _2655;
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2661 = -_2025;
    float _2663 = fma(_2647, _2659, _2661);
    float _2665 = 1.0 / _2103;
    bool _2667 = _2663 >= 0.0;
    bool _2669 = isnan(_2663);
    bool _2671 = _2667 || _2669;
    bool _2673 = isnan(0.0);
    bool _2675 = _2671 || _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2679 = -_2025;
    float _2681 = fma(_2665, _2677, _2679);
    float _2683 = 1.0 / _2107;
    bool _2685 = _2681 >= 0.0;
    bool _2687 = isnan(_2681);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2697 = -_2025;
    float _2699 = fma(_2683, _2695, _2697);
    float _2701 = 1.0 / _2111;
    bool _2703 = _2699 >= 0.0;
    bool _2705 = isnan(_2699);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.0);
    bool _2711 = _2707 || _2709;
    bool _2713 = !_2675;
    float _2715 = _2713 ? 0.0 : 3.0;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2719 = -_2025;
    float _2721 = fma(_2701, _2717, _2719);
    bool _2723 = !_2693;
    float _2725 = _2723 ? 0.0 : 3.0;
    bool _2727 = _2721 >= 0.0;
    bool _2729 = isnan(_2721);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = _2715 + _2725;
    bool _2739 = !_2657;
    float _2741 = _2739 ? 0.0 : 2.0;
    bool _2743 = !_2711;
    float _2745 = _2743 ? 0.0 : 3.0;
    bool _2747 = !_2735;
    float _2749 = _2747 ? 0.0 : 3.0;
    float _2751 = _2639 + _2741;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2755 = -_2025;
    float _2757 = fma(_2425, _2753, _2755);
    float _2759 = _2737 + _2745;
    float _2761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2763 = -_2025;
    float _2765 = fma(_2239, _2761, _2763);
    float _2767 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2769 = -_2025;
    float _2771 = fma(_2533, _2767, _2769);
    float _2773 = _2751 * 0.02857142873108386993408203125;
    float _2775 = precise::clamp(_2773, 0.0, 1.0);
    bool _2777 = _2757 >= 0.0;
    bool _2779 = isnan(_2757);
    bool _2781 = _2777 || _2779;
    bool _2783 = isnan(0.0);
    bool _2785 = _2781 || _2783;
    float _2787 = _2759 + _2749;
    bool _2789 = _2771 >= 0.0;
    bool _2791 = isnan(_2771);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan(0.0);
    bool _2797 = _2793 || _2795;
    bool _2799 = !_2785;
    float _2801 = _2799 ? 0.0 : 3.0;
    bool _2803 = _2765 >= 0.0;
    bool _2805 = isnan(_2765);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan(0.0);
    bool _2811 = _2807 || _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2815 = -_2025;
    float _2817 = fma(_2265, _2813, _2815);
    bool _2819 = !_2797;
    float _2821 = _2819 ? 0.0 : 3.0;
    float _2823 = _2787 + _2801;
    bool _2825 = !_2811;
    float _2827 = _2825 ? 0.0 : 3.0;
    bool _2829 = _2817 >= 0.0;
    bool _2831 = isnan(_2817);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan(0.0);
    bool _2837 = _2833 || _2835;
    float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2841 = -_2025;
    float _2843 = fma(_2283, _2839, _2841);
    float _2845 = _2823 + _2827;
    bool _2847 = !_2837;
    float _2849 = _2847 ? 0.0 : 3.0;
    bool _2851 = _2843 >= 0.0;
    bool _2853 = isnan(_2843);
    bool _2855 = _2851 || _2853;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    float _2861 = _2845 + _2849;
    bool _2863 = !_2859;
    float _2865 = _2863 ? 0.0 : 5.0;
    bool _2867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2869 = isnan(0.5);
    bool _2871 = _2867 || _2869;
    bool _2873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2875 = _2871 || _2873;
    float _2877 = _2861 + _2821;
    float _2879 = _2877 + _2865;
    float _2881 = _2879 * 0.14285714924335479736328125;
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    float _2885 = _2775 * _2883;
    float _2887 = _2775;
    float _2889 = _2883;
    if (_2875)
    {
        _2887 = 1.0;
    }
    float _2891 = _2887;
    float _2893 = _2891;
    if (_2875)
    {
        _2889 = 1.0;
    }
    float _2895 = _2889;
    float _2897 = _2895;
    if (!_2875)
    {
        float _2899 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2901 = _2899 * 0.15915493667125701904296875;
        float _2903 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2905 = _2901 * 6.283185482025146484375;
        float _2907 = cos(_2905);
        float _2909 = _2903 * 0.15915493667125701904296875;
        float _2911 = _2901 * 6.283185482025146484375;
        float _2913 = sin(_2911);
        float _2915 = 1.0 / _2907;
        float _2917 = _2909 * 6.283185482025146484375;
        float _2919 = cos(_2917);
        float _2921 = _2913 * _2915;
        float _2923 = _2909 * 6.283185482025146484375;
        float _2925 = sin(_2923);
        float _2927 = _2919 * _2921;
        float _2929 = 1.0 / _2927;
        float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2933 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2931;
        float _2935 = 1.0 / _2933;
        float _2937 = _2925 * _2929;
        float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2941 = fma(_2025, _2937, _2939);
        float _2943 = _2941 * _2935;
        float _2945 = precise::clamp(_2943, 0.0, 1.0);
        _2897 = _2945;
    }
    float _2947 = _2897;
    if (!_2875)
    {
        float _2949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2951 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2953 = _2949 * 0.15915493667125701904296875;
        float _2955 = _2951 * 0.15915493667125701904296875;
        float _2957 = _2953 * 6.283185482025146484375;
        float _2959 = cos(_2957);
        float _2961 = _2953 * 6.283185482025146484375;
        float _2963 = sin(_2961);
        float _2965 = 1.0 / _2959;
        float _2967 = _2955 * 6.283185482025146484375;
        float _2969 = cos(_2967);
        float _2971 = _2963 * _2965;
        float _2973 = _2955 * 6.283185482025146484375;
        float _2975 = sin(_2973);
        float _2977 = _2969 * _2971;
        float _2979 = 1.0 / _2977;
        float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2983 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2981;
        float _2985 = 1.0 / _2983;
        float _2987 = _2975 * _2979;
        float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2991 = fma(_2025, _2987, _2989);
        float _2993 = _2991 * _2985;
        float _2995 = precise::clamp(_2993, 0.0, 1.0);
        float _2997 = -_2995;
        float _2999 = _2997 + 1.0;
        _2893 = _2999;
    }
    float _3001 = _2893;
    float _3003 = _2885 * _2947;
    bool _3005 = _2947 > 0.0;
    bool _3007 = isnan(_2947);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan(0.0);
    bool _3013 = _3009 || _3011;
    float _3015 = _3003 * _3001;
    bool _3017 = _3001 <= 0.0;
    bool _3019 = !_3013;
    bool _3021 = _3017 || _3019;
    float _3023 = _3015 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3025 = _3023 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _3025;
    if (!_3021)
    {
        return out;
    }
    out.m_38.x = 0.0;
    float _3027 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3027;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _765 = false;
    bool _657 = false;
    bool _419 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_35.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    if (!_87)
    {
        out.m_38.x = 0.0;
    }
    int _93 = 0;
    if (!_87)
    {
        float _95 = _91 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3083 = as_type<float>(_97);
        out.gl_Position.z = _3083;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_40.w;
    float _103 = float(_83);
    float _105 = in.m_42.z;
    float _107 = in.m_42.w;
    float _109 = -_101;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_101);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    out.m_44.z = _105;
    bool _123 = _111 >= _103;
    bool _125 = !_121;
    bool _127 = _123 || _125;
    float _129 = 1.0 / _103;
    out.m_44.w = _107;
    float _131 = _101;
    if (_127)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_127)
    {
        out.m_38.x = 0.0;
    }
    if (_127)
    {
        float _135 = _133 * 5.0;
        _99 = as_type<int>(_135);
    }
    int _137 = _99;
    float _139 = _111 * _129;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_137);
        out.gl_Position.z = _3160;
    }
    out.m_46.x = _139;
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_48.w;
    float _143 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_40.x;
    float _157 = in.m_40.y;
    float _159 = in.m_40.z;
    float _161 = in.m_35.x;
    float _163 = in.m_35.y;
    float _165 = in.m_35.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = 0.0;
    if (!_183)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _143 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _143);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _219;
        _187 = _207;
        _189 = _209;
    }
    float _221 = _185;
    float _223 = _187;
    float _225 = _189;
    bool _227 = !_153;
    float _229 = _225;
    float _231 = _223;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _143 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _239;
        _169 = _251;
    }
    float _253 = _229;
    float _255 = _169;
    float _257 = _253;
    if (!_153)
    {
        float _259 = _111 * _111;
        float _261 = _259 * 0.5;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263;
    if (!_153)
    {
        _257 = _111;
    }
    float _267 = _257;
    float _269 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _267;
    if (!_153)
    {
        float _275 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _275;
    }
    float _277 = _265;
    bool _279 = !_153;
    float _281 = _277;
    if (!_279)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = _111 * _285;
        float _295 = 1.0 / _289;
        float _297 = _291 * 0.693147182464599609375;
        float _299 = exp2(_293);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _111);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _311;
    }
    float _313 = _281;
    bool _315 = !_153;
    if (!_315)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = 1.0 / _323;
        float _327 = _111 * _319;
        float _329 = exp2(_327);
        float _331 = -_329;
        float _333 = _331 + 1.0;
        float _335 = _333 * _325;
        _273 = _335;
    }
    float _337 = _273;
    float _339 = fma(_255, _155, _269);
    float _341 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = fma(_255, _157, _271);
    float _345 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _349 = fma(_337, _157, _341);
    float _351 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _355 = fma(_337, _155, _345);
    float _357 = -_349;
    float _359 = _343 + _357;
    float _361 = fma(_255, _159, _351);
    float _363 = fma(_337, _159, _353);
    float _365 = fma(_339, _141, _161);
    float _367 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _371 = -_355;
    float _373 = _339 + _371;
    float _375 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _377 = -_363;
    float _379 = _361 + _377;
    float _381 = fma(_343, _141, _163);
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _385 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _369);
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _375);
    float _389 = fma(_361, _141, _165);
    float _391 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _383);
    float _393 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _397 = !_347;
    float _399 = _395;
    float _417;
    if (!_397)
    {
        float _401 = in.m_42.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        _417 = _139;
    }
    _419 = false;
    float _421 = _417;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _421 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _421 + _427;
    bool _431 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _433 = isnan(_421);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _457 = _421 + _455;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _461 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _463 = isnan(_421);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _453;
    bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _477 = 1.0 / _449;
    float _479 = _391 * _459;
    float _481 = _393 * _459;
    float _483 = _395 * _459;
    float _485 = 1.0 / _445;
    float _487 = _425 * _473;
    bool _489 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_421);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_441;
    float _503 = _501 + 1.0;
    float _505 = _499 * _503;
    float _507 = _429 * _477;
    bool _509 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _511 = isnan(_421);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_499;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = _519 * _523;
    float _539 = _457 * _485;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = _471 * _535;
    float _551 = fma(_527, _539, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _553 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _555 = fma(_547, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _565 = fma(_531, _507, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _567 = _553 * _549;
    float _569 = _555 * _549;
    float _571 = fma(_559, _507, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _573 = in.m_48.x;
    float _575 = in.m_48.y;
    float _577 = in.m_48.z;
    float _579 = fma(_563, _507, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _581 = _551 * _549;
    float _583 = -_471;
    float _585 = _583 + 1.0;
    float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _589 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _569);
    float _591 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].z, _581);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _601;
    float _605 = fma(_565, _537, _587);
    float _607 = fma(_595, _487, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _609 = fma(_599, _487, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _611 = fma(_603, _487, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _613 = fma(_571, _537, _589);
    float _615 = fma(_579, _537, _591);
    float _617 = fma(_607, _505, _605);
    float _619 = fma(_609, _505, _613);
    float _621 = fma(_611, _505, _615);
    float _623 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].x, _617);
    float _625 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].y, _619);
    float _627 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[146].z, _621);
    float _629 = _623 * _573;
    float _631 = _625 * _575;
    float _633 = _627 * _577;
    bool _635 = !_475;
    float _637 = _487;
    float _655;
    if (!_635)
    {
        float _639 = in.m_42.x;
        float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _643 = _639 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _647 = _645 * _641;
        float _649 = floor(_647);
        float _651 = -_649;
        float _653 = _647 + _651;
        _655 = _653;
        _657 = true;
    }
    else
    {
        _655 = _139;
    }
    _657 = false;
    float _659 = _655;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _663 = _659 + _661;
    bool _665 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _667 = isnan(_659);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    bool _681 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _683 = isnan(_659);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_675;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _697;
    float _701 = 1.0 / _679;
    bool _703 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _705 = _691 * _695;
    float _707 = -_691;
    float _709 = _707 + 1.0;
    float _711 = _663 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _713;
    float _717 = fma(_699, _711, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _719;
    float _723 = fma(_715, _711, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _725 = fma(_721, _711, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _727 = _717 * _705;
    float _729 = _725 * _705;
    float _731 = _723 * _705;
    float _733 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].x, _727);
    float _735 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].y, _729);
    float _737 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[107].z, _731);
    float _739 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].x, _733);
    float _741 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].y, _735);
    float _743 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].z, _737);
    bool _745 = !_703;
    float _763;
    if (!_745)
    {
        float _747 = in.m_42.x;
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _751 = _747 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _755 = _753 * _749;
        float _757 = floor(_755);
        float _759 = -_757;
        float _761 = _755 + _759;
        _763 = _761;
        _765 = true;
    }
    else
    {
        _763 = _139;
    }
    _765 = false;
    float _767 = _763;
    float _769 = in.m_50.y;
    float _771 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _775 = _773 != 0;
    float _777 = in.m_42.x;
    float _779 = in.m_42.y;
    float _781 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _771);
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _795 = _793 != 0;
    float _797 = 1.0 / _785;
    float _799 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _801 = in.m_50.x;
    float _803 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _805 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _791);
    float _807 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _799);
    float _809 = _537;
    float _811 = _801;
    if (_775)
    {
        float _813 = in.m_42.x;
        _809 = _813;
    }
    float _815 = _809;
    float _817 = _805 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _819 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _803);
    float _821 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _807);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _831 = _817 + _829;
    float _833 = -_769;
    float _835 = _833 + 1.0;
    float _837 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _839 = _827 * _797;
    float _841 = _831 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _843 = _779 > 0.5;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _847 = _837 + _845;
    bool _849 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _851 = isnan(_767);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_817;
    float _863 = _861 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _865 = _769;
    float _867 = _797;
    if (_789)
    {
        float _869 = _843 ? _835 : _769;
        _865 = _869;
    }
    float _871 = _865;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _875 = _767 + _873;
    float _877 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[28].x, _841);
    float _879 = -_859;
    float _881 = _879 + 1.0;
    float _883 = _821 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = fma(_839, _875, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _887 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _889 = isnan(_767);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _863 * _863;
    bool _901 = _815 > 0.5;
    bool _903 = _901 && _775;
    float _905 = -_837;
    float _907 = _905 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_775)
    {
        _867 = _801;
    }
    float _909 = _867;
    float _911 = _897 * _881;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _915 = _883 + _913;
    float _917 = -_883;
    float _919 = _917 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _921 = fma(_907, _907, _899);
    float _923 = in.m_52.z;
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[28].z, _877);
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _929 = fma(_919, _919, _921);
    float _931 = _921;
    float _933 = _909;
    float _935 = _925;
    if (!_775)
    {
        _931 = _801;
    }
    float _937 = _931;
    float _939 = in.m_52.x;
    float _941 = _937;
    if (_903)
    {
        float _943 = -_909;
        float _945 = _943 + 1.0;
        _933 = _945;
    }
    float _947 = _933;
    float _949 = _885 * _911;
    float _951 = -_897;
    float _953 = _951 + 1.0;
    float _955 = in.m_52.y;
    float _957 = _915;
    if (_795)
    {
        float _959 = rsqrt(_929);
        _957 = _959;
    }
    float _961 = _957;
    if (_775)
    {
        _941 = _947;
    }
    float _963 = _941;
    float _965 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[115].x, _949);
    bool _967 = _925 >= 0.0;
    float _969 = _871 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _971 = _741 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _975 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[116].x, _965);
    float _977 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _979 = _969 * _927;
    float _981 = _973 * _823;
    float _983 = _739 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _985 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _991 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_967)
    {
        _935 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _993 = _935;
    int _995 = as_type<int>(_993);
    if (_795)
    {
        float _997 = _961 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _811 = _997;
    }
    float _999 = _811;
    out.m_54.x = _981;
    out.m_54.y = _979;
    float _1001 = 0.0;
    float _1003 = _999;
    if (!_795)
    {
        _1001 = 0.0;
    }
    float _1005 = _1001;
    float _1007 = _1005;
    if (_967)
    {
        float _1009 = _993 * 5.0;
        _995 = as_type<int>(_1009);
    }
    int _1011 = _995;
    out.m_56.z = _923;
    if (!_795)
    {
        _637 = 0.0;
    }
    float _1013 = _637;
    float _1015 = _1013;
    if (_795)
    {
        float _1017 = _907 * _999;
        _1007 = _1017;
    }
    float _1019 = _1007;
    if (_795)
    {
        float _1021 = _863 * _999;
        _1015 = _1021;
    }
    float _1023 = _1015;
    if (_967)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4578 = as_type<float>(_1011);
        out.gl_Position.z = _4578;
    }
    if (!_795)
    {
        _399 = 0.0;
    }
    float _1025 = _399;
    out.m_56.x = _939;
    out.m_56.y = _955;
    out.m_58.x = _991;
    out.m_58.y = _985;
    out.m_58.z = _987;
    out.m_58.w = _989;
    float _1027 = _1025;
    if (_967)
    {
        out.m_38.x = 0.0;
    }
    if (_967)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1029 = _817 + _1023;
    if (_795)
    {
        float _1031 = _919 * _999;
        _1027 = _1031;
    }
    float _1033 = _1027;
    float _1035 = _837 + _1019;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1029 + _1037;
    float _1041 = _883 + _1033;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _1035 + _1043;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = _1041 + _1049;
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1047);
    float _1055 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1053);
    bool _1057 = _1055 >= 0.0;
    if (_1057)
    {
        _1003 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1059 = _1003;
    int _1061 = as_type<int>(_1059);
    if (_1057)
    {
        out.m_38.x = 0.0;
    }
    if (_1057)
    {
        float _1063 = _1059 * 5.0;
        _1061 = as_type<int>(_1063);
    }
    int _1065 = _1061;
    if (_1057)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4682 = as_type<float>(_1065);
        out.gl_Position.z = _4682;
    }
    if (_1057)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1067 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1069 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1071 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1067);
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1069);
    float _1075 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1071);
    float _1077 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1079 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1073);
    float _1081 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1083 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1077);
    float _1085 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1087 = 1.0 / _1081;
    float _1089 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1083);
    float _1091 = _1081 * 0.5;
    float _1093 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1095 = fma(_1085, -0.5, _1091);
    float _1097 = _1093 + _1081;
    float _1099 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1095);
    float _1101 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1095);
    float _1103 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1095);
    float _1105 = _1097 * 0.5;
    float _1107 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1095);
    float _1109 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1095);
    float _1111 = _1099 * _1087;
    float _1113 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1105);
    float _1115 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1105);
    float _1117 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1105);
    float _1119 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1105);
    float _1121 = _1113 * _1087;
    float _1123 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1095);
    float _1125 = _1101 * _1087;
    float _1127 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1105);
    float _1129 = _1115 * _1087;
    float _1131 = _1117 * _1087;
    float _1133 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1095);
    float _1135 = _1103 * _1087;
    float _1137 = _1119 * _1087;
    float _1139 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1095);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1143 = _1095 + _1141;
    float _1145 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1105);
    float _1147 = _1107 * _1087;
    float _1149 = _1109 * _1087;
    float _1151 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1153 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1105);
    float _1155 = _1123 * _1087;
    float2 _4872 = float2(_1121, _1125);
    float _1157 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4872, float2(0.0), isnan(_4872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4872, float2(0.0), isnan(_4872)), level(0.0)).x;
    float2 _4882 = float2(_1129, _1111);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4882, float2(0.0), isnan(_4882)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4882, float2(0.0), isnan(_4882)), level(0.0)).x;
    float2 _4890 = float2(_1129, _1135);
    float _1161 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4890, float2(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4890, float2(0.0), isnan(_4890)), level(0.0)).x;
    float2 _4898 = float2(_1131, _1147);
    float _1163 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4898, float2(0.0), isnan(_4898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4898, float2(0.0), isnan(_4898)), level(0.0)).x;
    float2 _4906 = float2(_1137, _1155);
    float _1165 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4906, float2(0.0), isnan(_4906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4906, float2(0.0), isnan(_4906)), level(0.0)).x;
    float _1167 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1105);
    float _1169 = _1127 * _1087;
    float _1171 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1105);
    float _1173 = _1133 * _1087;
    float _1175 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1095);
    float _1177 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1095);
    float _1179 = _1145 * _1087;
    float _1181 = _1139 * _1087;
    float _1183 = _1143 * _1087;
    float _1185 = _1095 * _1087;
    float _1187 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1095);
    float _1189 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1095);
    float _1191 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1095);
    float _1193 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1095);
    float _1195 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1095);
    float _1197 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1095);
    float _1199 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1095);
    float _1201 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1095);
    float _1203 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1095);
    float _1205 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1095);
    float _1207 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1095);
    float _1209 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1095);
    float _1211 = _1105 * _1087;
    float _1213 = _1153 * _1087;
    float _1215 = _1151 * _1087;
    float _1217 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1105);
    float _1219 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1105);
    float _1221 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1105);
    float _1223 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1105);
    float _1225 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1105);
    float _1227 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1105);
    float _1229 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1105);
    float _1231 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1105);
    float _1233 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1105);
    float _1235 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1105);
    float _1237 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1105);
    float _1239 = _1167 * _1087;
    float2 _5063 = float2(_1169, _1149);
    float _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).x;
    float2 _5071 = float2(_1169, _1173);
    float _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5071, float2(0.0), isnan(_5071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5071, float2(0.0), isnan(_5071)), level(0.0)).x;
    float2 _5079 = float2(_1179, _1181);
    float _1245 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5079, float2(0.0), isnan(_5079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5079, float2(0.0), isnan(_5079)), level(0.0)).x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1249 = _1105 + _1247;
    float _1251 = _1175 * _1087;
    float _1253 = _1177 * _1087;
    float _1255 = _1171 * _1087;
    float _1257 = _1191 * _1087;
    float2 _5105 = float2(_1211, _1181);
    float _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5105, float2(0.0), isnan(_5105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5105, float2(0.0), isnan(_5105)), level(0.0)).x;
    float2 _5113 = float2(_1211, _1183);
    float _1261 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5113, float2(0.0), isnan(_5113)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5113, float2(0.0), isnan(_5113)), level(0.0)).x;
    float2 _5121 = float2(_1211, _1215);
    float _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5121, float2(0.0), isnan(_5121)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5121, float2(0.0), isnan(_5121)), level(0.0)).x;
    float2 _5129 = float2(_1239, _1251);
    float _1265 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5129, float2(0.0), isnan(_5129)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5129, float2(0.0), isnan(_5129)), level(0.0)).x;
    float2 _5137 = float2(_1211, _1251);
    float _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5137, float2(0.0), isnan(_5137)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5137, float2(0.0), isnan(_5137)), level(0.0)).x;
    float2 _5145 = float2(_1211, _1253);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5145, float2(0.0), isnan(_5145)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5145, float2(0.0), isnan(_5145)), level(0.0)).x;
    float2 _5153 = float2(_1211, _1257);
    float _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5153, float2(0.0), isnan(_5153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5153, float2(0.0), isnan(_5153)), level(0.0)).x;
    float2 _5161 = float2(_1211, _1185);
    float _1273 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5161, float2(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5161, float2(0.0), isnan(_5161)), level(0.0)).x;
    float _1275 = _1105 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1277 = _1249 * _1087;
    float _1279 = _1187 * _1087;
    float _1281 = _1189 * _1087;
    float _1283 = _1275 * _1087;
    float _1285 = _1217 * _1087;
    float _1287 = _1221 * _1087;
    float2 _5191 = float2(_1277, _1185);
    float _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5191, float2(0.0), isnan(_5191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5191, float2(0.0), isnan(_5191)), level(0.0)).x;
    float2 _5199 = float2(_1213, _1279);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5199, float2(0.0), isnan(_5199)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5199, float2(0.0), isnan(_5199)), level(0.0)).x;
    float2 _5207 = float2(_1213, _1281);
    float _1293 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5207, float2(0.0), isnan(_5207)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5207, float2(0.0), isnan(_5207)), level(0.0)).x;
    float2 _5215 = float2(_1213, _1185);
    float _1295 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5215, float2(0.0), isnan(_5215)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5215, float2(0.0), isnan(_5215)), level(0.0)).x;
    float2 _5223 = float2(_1283, _1185);
    float _1297 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5223, float2(0.0), isnan(_5223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5223, float2(0.0), isnan(_5223)), level(0.0)).x;
    float2 _5231 = float2(_1285, _1185);
    float _1299 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5231, float2(0.0), isnan(_5231)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5231, float2(0.0), isnan(_5231)), level(0.0)).x;
    float _1301 = _1219 * _1087;
    float _1303 = _1223 * _1087;
    float _1305 = _1225 * _1087;
    float _1307 = _1193 * _1087;
    float _1309 = _1227 * _1087;
    float _1311 = _1195 * _1087;
    float _1313 = _1229 * _1087;
    float _1315 = _1197 * _1087;
    float _1317 = _1231 * _1087;
    float2 _5266 = float2(_1301, _1185);
    float _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5266, float2(0.0), isnan(_5266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5266, float2(0.0), isnan(_5266)), level(0.0)).x;
    float2 _5274 = float2(_1287, _1185);
    float _1321 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5274, float2(0.0), isnan(_5274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5274, float2(0.0), isnan(_5274)), level(0.0)).x;
    float2 _5282 = float2(_1303, _1307);
    float _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5282, float2(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5282, float2(0.0), isnan(_5282)), level(0.0)).x;
    float2 _5290 = float2(_1305, _1311);
    float _1325 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5290, float2(0.0), isnan(_5290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5290, float2(0.0), isnan(_5290)), level(0.0)).x;
    float2 _5298 = float2(_1309, _1315);
    float _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5298, float2(0.0), isnan(_5298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5298, float2(0.0), isnan(_5298)), level(0.0)).x;
    float _1329 = _1199 * _1087;
    float _1331 = _1233 * _1087;
    float _1333 = _1201 * _1087;
    float _1335 = _1235 * _1087;
    float _1337 = _1203 * _1087;
    float _1339 = _1237 * _1087;
    float _1341 = _1205 * _1087;
    float _1343 = _1207 * _1087;
    float2 _5330 = float2(_1313, _1329);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).x;
    float2 _5338 = float2(_1317, _1333);
    float _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).x;
    float2 _5346 = float2(_1331, _1337);
    float _1349 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5346, float2(0.0), isnan(_5346)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5346, float2(0.0), isnan(_5346)), level(0.0)).x;
    float2 _5354 = float2(_1335, _1341);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5354, float2(0.0), isnan(_5354)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5354, float2(0.0), isnan(_5354)), level(0.0)).x;
    float2 _5362 = float2(_1339, _1343);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5362, float2(0.0), isnan(_5362)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5362, float2(0.0), isnan(_5362)), level(0.0)).x;
    float _1355 = _1209 * _1087;
    float2 _5373 = float2(_1255, _1355);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5373, float2(0.0), isnan(_5373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5373, float2(0.0), isnan(_5373)), level(0.0)).x;
    float _1359 = sqrt(_929);
    float _1361 = _777 * 0.550000011920928955078125;
    float _1363 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1365 = _107 * 78.233001708984375;
    float _1367 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1363);
    float _1369 = fma(_111, 0.300000011920928955078125, -1.0);
    float _1371 = rint(_1361);
    float _1373 = _1369 * 0.15915493667125701904296875;
    float _1375 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1377 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1367);
    float _1379 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1381 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1375);
    float _1383 = _1373 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1379);
    float _1389 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1381);
    float _1393 = in.m_60.x;
    float _1395 = in.m_60.y;
    float _1397 = in.m_60.z;
    float _1399 = fma(_1359, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1401 = precise::clamp(_1399, 0.0, 1.0);
    float _1403 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1387);
    float _1405 = rsqrt(_1391);
    float _1407 = fma(_1401, -2.0, 3.0);
    float _1409 = _1401 * _1401;
    float _1411 = _139 * _139;
    float _1413 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1415 = fma(_1385, -0.02999999932944774627685546875, 1.0);
    float _1417 = fma(_1385, -0.100000001490116119384765625, 0.5);
    float _1419 = _1407 * _1409;
    float _1421 = rsqrt(_1377);
    float _1423 = abs(_139);
    float _1425 = _1423 * _1411;
    float _1427 = -_1415;
    float _1429 = _1427 + _1417;
    float _1431 = -_923;
    float _1433 = _1431 + _939;
    float _1435 = -_1419;
    float _1437 = _1435 + 0.5;
    float _1439 = -_1419;
    float _1441 = _1439 + 1.0;
    float _1443 = fma(_1419, _1429, _1415);
    float _1445 = _1419 * _1433;
    float _1447 = rsqrt(_1403);
    float _1449 = fma(_1425, _1437, 1.0);
    float _1451 = fma(_1413, _1441, 1.0);
    float _1453 = _1443 * _1395;
    float _1455 = _1443 * _1393;
    float _1457 = _1445 * 0.0599999986588954925537109375;
    float _1459 = _1449 * _1451;
    float _1461 = _1453 * _1405;
    float _1463 = _1443 * _1397;
    float _1465 = _1455 * _1421;
    float _1467 = _1457 * _1421;
    float _1469 = _1461 * _1459;
    float _1471 = fma(_923, 12.98980045318603515625, _1365);
    float _1473 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1475 = fma(_1465, _1459, _1467);
    float _1477 = _1463 * _1447;
    float _1479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1469);
    float _1481 = _1471 * 0.15915493667125701904296875;
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1475);
    float _1485 = _1477 * _1459;
    float _1487 = _1479 * _1389;
    float _1489 = fma(_939, 12.98980045318603515625, _1365);
    float _1491 = abs(_139);
    float _1493 = log2(_1491);
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1485);
    float _1497 = _633 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1499 = _1483 * _1473;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1503 = _1489 * 0.15915493667125701904296875;
    float _1505 = _1495 * _1497;
    float _1507 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1501);
    float _1511 = _1481 * 6.283185482025146484375;
    float _1513 = sin(_1511);
    float _1515 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1517 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1507);
    float _1519 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1509);
    float _1521 = fma(_955, 12.98980045318603515625, _1365);
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1515);
    float _1525 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1517);
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1529 = _1503 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1493 * 0.800000011920928955078125;
    float _1535 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1537 = _817 + _1527;
    float _1539 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1523);
    float _1541 = _1521 * 0.15915493667125701904296875;
    float _1543 = _837 + _1535;
    float _1545 = -_1537;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1549 = exp2(_1533);
    float _1551 = _1513 * 43758.546875;
    float _1553 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1555 = -_1543;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1559 = _1547 * _1547;
    float _1561 = _883 + _1553;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1571 = _1567 || _1569;
    float _1573 = fma(_1557, _1557, _1559);
    float _1575 = _1531 * 43758.546875;
    float _1577 = -_1561;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1581 = floor(_1551);
    float _1583 = fma(_779, 6.0, 12.0);
    float _1585 = fma(12.0, _777, 24.0);
    float _1587 = fma(_1579, _1579, _1573);
    float _1589 = _1549 * _1583;
    float _1591 = _1549 * _1585;
    float _1593 = _1493 * 0.5;
    float _1595 = floor(_1575);
    float _1597 = _1589 * _955;
    float _1599 = _1591 * _939;
    float _1601 = _479 * _1597;
    float _1603 = -_1581;
    float _1605 = _1551 + _1603;
    float _1607 = sqrt(_1587);
    float _1609 = fma(_479, _1599, _1601);
    float _1611 = _483 * _1597;
    float _1613 = fma(_1605, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1615 = fma(_483, _1599, _1611);
    float _1617 = exp2(_1593);
    float _1619 = -_1595;
    float _1621 = _1575 + _1619;
    float _1623 = fma(_1621, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1625 = fma(_1607, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1627 = precise::clamp(_1625, 0.0, 1.0);
    float _1629 = 1.0 / _1403;
    float _1631 = fma(_1627, -2.0, 3.0);
    float _1633 = _1627 * _1627;
    float _1635 = fma(_1617, _1613, _1615);
    float _1637 = 1.0 / _1377;
    float _1639 = fma(_1617, _1623, _1609);
    float _1641 = -_1633;
    float _1643 = fma(_1631, _1641, 1.0);
    float _1645 = _1497 * _1635;
    float _1647 = _481 * _1597;
    float _1649 = _1473 * _1639;
    float _1651 = _1645 * _1643;
    float _1653 = _1541 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = _1649 * _1643;
    float _1659 = fma(_481, _1599, _1647);
    float _1661 = fma(_1651, _1629, _1561);
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1665 = _1661 + _1663;
    float _1667 = fma(_1657, _1637, _1543);
    float _1669 = 1.0 / _1391;
    float _1671 = _1665 * _1665;
    float _1673 = _1655 * 43758.546875;
    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1677 = _1667 + _1675;
    float _1679 = floor(_1673);
    float _1681 = fma(_1677, _1677, _1671);
    float _1683 = sqrt(_1681);
    float _1685 = -_1679;
    float _1687 = _1673 + _1685;
    float _1689 = fma(_1687, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1691 = fma(_1617, _1689, _1659);
    bool _1693 = _1683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = _1389 * _1691;
    float _1697 = _1695 * _1643;
    float _1699 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1701 = fma(_1697, _1669, _1537);
    float _1703 = fma(_1035, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1699);
    float _1705 = _1671;
    float _1707 = _1699;
    float _1709 = 0.60000002384185791015625;
    if (!_1693)
    {
        _1705 = _1667;
    }
    float _1711 = _1705;
    float _1713 = _1711;
    if (!_1693)
    {
        _1707 = _1661;
    }
    float _1715 = _1707;
    float _1717 = _1715;
    if (!_1693)
    {
        _1709 = _1701;
    }
    float _1719 = _1709;
    bool _1721 = !_1693;
    float _1723 = _1719;
    if (!_1721)
    {
        float _1725 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1729 = _1683 + _1727;
        float _1731 = rsqrt(_1681);
        float _1733 = _1729 * _1725;
        float _1735 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = _1733 * 0.15915493667125701904296875;
        float _1739 = _1737 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        float _1743 = _1737 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = _1741 + (-1.0);
        float _1749 = fma(_1745, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1751 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1753 = _1731 * _1749;
        float _1755 = fma(_1701, _1741, _1751);
        float _1757 = fma(_1677, _1753, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1759 = fma(_1665, _1753, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1713 = _1757;
        _1723 = _1755;
        _1717 = _1759;
    }
    float _1761 = _1713;
    float _1763 = _1723;
    float _1765 = _1717;
    float _1767 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1703);
    float _1769 = _1019 + _1761;
    float _1771 = _1023 + _1763;
    float _1773 = _1033 + _1765;
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1777 = _1769;
    float _1779 = _1771;
    float _1781 = _1769;
    float _1783 = _1773;
    if (!_1571)
    {
        float _1785 = _1039 * _1039;
        float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1789 = -_837;
        float _1791 = _1789 + _1761;
        float _1793 = -_817;
        float _1795 = _1793 + _1763;
        float _1797 = fma(_1045, _1045, _1785);
        float _1799 = -_883;
        float _1801 = _1799 + _1765;
        float _1803 = fma(_1051, _1051, _1797);
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1807 = sqrt(_1803);
        float _1809 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1811 = _1807 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1813 = isnan(_1807);
        bool _1815 = _1811 || _1813;
        bool _1817 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1819 = _1815 || _1817;
        float _1821 = precise::min(_1807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1823 = _1821 * _1787;
        float _1825 = _1809 * _1823;
        float _1827 = _1023;
        float _1829 = _1825;
        float _1831 = _1809;
        if (_1819)
        {
            float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1827 = _1833;
        }
        float _1835 = _1827;
        if (_1819)
        {
            float _1837 = precise::max(_1807, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1777 = _1837;
        }
        float _1839 = _1777;
        float _1841 = fma(_1791, _1825, _1035);
        float _1843 = fma(_1795, _1825, _1029);
        float _1845 = fma(_1801, _1825, _1041);
        float _1847 = _1839;
        float _1849 = _1841;
        if (_1819)
        {
            float _1851 = _1839 * _1835;
            _1847 = _1851;
        }
        float _1853 = _1847;
        float _1855 = _1853;
        if (_1819)
        {
            float _1857 = _1809 * _1853;
            _1829 = _1857;
        }
        float _1859 = _1829;
        if (!_1819)
        {
            _1855 = _1841;
        }
        float _1861 = _1855;
        float _1863 = _1861;
        if (!_1819)
        {
            _1849 = _1843;
        }
        float _1865 = _1849;
        float _1867 = _1865;
        if (_1819)
        {
            float _1869 = fma(_1791, _1859, _1035);
            _1863 = _1869;
        }
        float _1871 = _1863;
        _1781 = _1871;
        if (!_1819)
        {
            _1831 = _1845;
        }
        float _1873 = _1831;
        _1783 = _1873;
        if (_1819)
        {
            float _1875 = fma(_1795, _1859, _1029);
            _1867 = _1875;
        }
        float _1877 = _1867;
        _1779 = _1877;
        if (_1819)
        {
            float _1879 = fma(_1801, _1859, _1041);
            _1783 = _1879;
        }
    }
    float _1881 = _1779;
    float _1883 = _1781;
    float _1885 = _1783;
    float _1887 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1889 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1891 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = _1775 + _1081;
    float _1895 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1887);
    float _1897 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1899 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1901 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1895);
    float _1905 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1897);
    float _1907 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1899);
    float _1909 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1901);
    float _1911 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1913 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1905);
    float _1915 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1917 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1919 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1923 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1925 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1927 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1929 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1921);
    float _1931 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1923);
    float _1933 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1925);
    float _1935 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1937 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1927);
    float _1939 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1929);
    float _1941 = _1893 * _1087;
    float _1943 = _1941 * 0.5;
    float _1945 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1931);
    float _1947 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1933);
    float _1949 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1937);
    float _1951 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1939);
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1953);
    float _1957 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1945);
    float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1961 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
    float _1963 = _1949 + _1951;
    float _1965 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1947);
    out.m_58.x = _991;
    out.m_58.y = _985;
    out.m_58.z = _987;
    out.m_58.w = _989;
    float _1967 = 1.0 / _1955;
    float _1969 = _1963 * 0.5;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1973 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1971);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1977 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1975);
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1981 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1979);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1985 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1983);
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1989 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1987);
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1993 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1991);
    float _1995 = 1.0 / _1973;
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1999 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1997);
    float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2003 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2001);
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2007 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2005);
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2011 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2009);
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2015 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2013);
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2019 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2017);
    out.m_62.x = _1035;
    out.m_62.y = _1029;
    out.m_62.z = _1041;
    float _2021 = 1.0 / _1961;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2025 = _1967 * _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2029 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2027);
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2033 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2031);
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2037 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2035);
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2041 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2039);
    float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2045 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2043);
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    float _2051 = 1.0 / _1977;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2055 = -_2025;
    float _2057 = fma(_1995, _2053, _2055);
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2061 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2059);
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2065 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2063);
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2069 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2067);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2073 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2071);
    bool _2075 = _2057 >= 0.0;
    bool _2077 = isnan(_2057);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(0.0);
    bool _2083 = _2079 || _2081;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2087 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2085);
    float _2089 = 1.0 / _1981;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2093 = -_2025;
    float _2095 = fma(_2021, _2091, _2093);
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2099 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2097);
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2103 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2101);
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2107 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2105);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    bool _2113 = _2095 >= 0.0;
    bool _2115 = isnan(_2095);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(0.0);
    bool _2121 = _2117 || _2119;
    float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2125 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2123);
    float _2127 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2129 = -_2025;
    float _2131 = fma(_2051, _2127, _2129);
    float _2133 = 1.0 / _1999;
    bool _2135 = !_2121;
    float _2137 = _2135 ? 0.0 : 2.0;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2141 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2139);
    float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2145 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2143);
    bool _2147 = _2131 >= 0.0;
    bool _2149 = isnan(_2131);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(0.0);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2161 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2159);
    bool _2163 = !_2083;
    float _2165 = _2163 ? 0.0 : 2.0;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2169 = -_2025;
    float _2171 = fma(_2089, _2167, _2169);
    float _2173 = 1.0 / _2011;
    out.m_64.z = _1969;
    out.m_64.w = _1951;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2177 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2175);
    float _2179 = _2165 + _2157;
    bool _2181 = _2171 >= 0.0;
    bool _2183 = isnan(_2171);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.0);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    out.gl_Position.x = _1957;
    out.gl_Position.y = _1965;
    out.gl_Position.z = _1949;
    out.gl_Position.w = _1951;
    float _2193 = _2179 + _2137;
    float _2195 = 1.0 / _1985;
    float _2197 = _2193 + _2191;
    float _2199 = 1.0 / _2019;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2203 = -_2025;
    float _2205 = fma(_2195, _2201, _2203);
    float _2207 = 1.0 / _2037;
    bool _2209 = _2205 >= 0.0;
    bool _2211 = isnan(_2205);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan(0.0);
    bool _2217 = _2213 || _2215;
    float _2219 = float(_2217);
    float _2221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2223 = -_2025;
    float _2225 = fma(_2199, _2221, _2223);
    float _2227 = 1.0 / _1989;
    float _2229 = _2197 + _2219;
    float _2231 = 1.0 / _2061;
    float _2233 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2235 = -_2025;
    float _2237 = fma(_2227, _2233, _2235);
    float _2239 = 1.0 / _2141;
    bool _2241 = _2237 >= 0.0;
    bool _2243 = isnan(_2237);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = 1.0 / _1993;
    bool _2253 = !_2249;
    float _2255 = _2253 ? 0.0 : 2.0;
    float _2257 = _2229 + _2255;
    float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2261 = -_2025;
    float _2263 = fma(_2133, _2259, _2261);
    float _2265 = 1.0 / _2145;
    bool _2267 = _2263 >= 0.0;
    bool _2269 = isnan(_2263);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.0);
    bool _2275 = _2271 || _2273;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2279 = -_2025;
    float _2281 = fma(_2251, _2277, _2279);
    float _2283 = 1.0 / _2177;
    bool _2285 = _2281 >= 0.0;
    bool _2287 = isnan(_2281);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan(0.0);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    float _2297 = 1.0 / _2003;
    float _2299 = _2257 + _2295;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2303 = -_2025;
    float _2305 = fma(_2297, _2301, _2303);
    float _2307 = 1.0 / _2007;
    bool _2309 = _2305 >= 0.0;
    bool _2311 = isnan(_2305);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    bool _2319 = !_2275;
    float _2321 = _2319 ? 0.0 : 2.0;
    bool _2323 = !_2317;
    float _2325 = _2323 ? 0.0 : 2.0;
    float _2327 = _2299 + _2321;
    float _2329 = _2327 + _2325;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2333 = -_2025;
    float _2335 = fma(_2307, _2331, _2333);
    bool _2337 = _2335 >= 0.0;
    bool _2339 = isnan(_2335);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = float(_2345);
    float _2349 = 1.0 / _2015;
    float _2351 = _2329 + _2347;
    float _2353 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2355 = -_2025;
    float _2357 = fma(_2173, _2353, _2355);
    bool _2359 = _2357 >= 0.0;
    bool _2361 = isnan(_2357);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.0);
    bool _2367 = _2363 || _2365;
    bool _2369 = !_2367;
    float _2371 = _2369 ? 0.0 : 2.0;
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2375 = -_2025;
    float _2377 = fma(_2349, _2373, _2375);
    float _2379 = _2351 + _2371;
    bool _2381 = _2225 >= 0.0;
    bool _2383 = isnan(_2225);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan(0.0);
    bool _2389 = _2385 || _2387;
    float _2391 = float(_2389);
    bool _2393 = _2377 >= 0.0;
    bool _2395 = isnan(_2377);
    bool _2397 = _2393 || _2395;
    bool _2399 = isnan(0.0);
    bool _2401 = _2397 || _2399;
    float _2403 = float(_2401);
    float _2405 = 1.0 / _2033;
    float _2407 = _2379 + _2403;
    float _2409 = 1.0 / _2029;
    float _2411 = _2407 + _2391;
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2415 = -_2025;
    float _2417 = fma(_2409, _2413, _2415);
    float _2419 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2421 = -_2025;
    float _2423 = fma(_2405, _2419, _2421);
    float _2425 = 1.0 / _2125;
    bool _2427 = _2417 >= 0.0;
    bool _2429 = isnan(_2417);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(0.0);
    bool _2435 = _2431 || _2433;
    bool _2437 = _2423 >= 0.0;
    bool _2439 = isnan(_2423);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan(0.0);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    bool _2449 = !_2435;
    float _2451 = _2449 ? 0.0 : 2.0;
    float _2453 = 1.0 / _2041;
    float _2455 = _2411 + _2451;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2459 = -_2025;
    float _2461 = fma(_2207, _2457, _2459);
    float _2463 = _2455 + _2447;
    bool _2465 = _2461 >= 0.0;
    bool _2467 = isnan(_2461);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.0);
    bool _2473 = _2469 || _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2477 = -_2025;
    float _2479 = fma(_2453, _2475, _2477);
    float _2481 = 1.0 / _2045;
    bool _2483 = _2479 >= 0.0;
    bool _2485 = isnan(_2479);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(0.0);
    bool _2491 = _2487 || _2489;
    bool _2493 = !_2473;
    float _2495 = _2493 ? 0.0 : 2.0;
    bool _2497 = !_2491;
    float _2499 = _2497 ? 0.0 : 2.0;
    float _2501 = _2463 + _2495;
    float _2503 = _2501 + _2499;
    float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2507 = -_2025;
    float _2509 = fma(_2481, _2505, _2507);
    bool _2511 = _2509 >= 0.0;
    bool _2513 = isnan(_2509);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan(0.0);
    bool _2519 = _2515 || _2517;
    float _2521 = float(_2519);
    float _2523 = 1.0 / _2049;
    float _2525 = _2503 + _2521;
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2529 = -_2025;
    float _2531 = fma(_2231, _2527, _2529);
    float _2533 = 1.0 / _2161;
    bool _2535 = _2531 >= 0.0;
    bool _2537 = isnan(_2531);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(0.0);
    bool _2543 = _2539 || _2541;
    bool _2545 = !_2543;
    float _2547 = _2545 ? 0.0 : 2.0;
    float _2549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2551 = -_2025;
    float _2553 = fma(_2523, _2549, _2551);
    float _2555 = _2525 + _2547;
    bool _2557 = _2553 >= 0.0;
    bool _2559 = isnan(_2553);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan(0.0);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    float _2569 = 1.0 / _2065;
    float _2571 = _2555 + _2567;
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2575 = -_2025;
    float _2577 = fma(_2569, _2573, _2575);
    float _2579 = 1.0 / _2069;
    bool _2581 = _2577 >= 0.0;
    bool _2583 = isnan(_2577);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(0.0);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    float _2593 = _2571 + _2591;
    float _2595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2597 = -_2025;
    float _2599 = fma(_2579, _2595, _2597);
    float _2601 = 1.0 / _2073;
    bool _2603 = _2599 >= 0.0;
    bool _2605 = isnan(_2599);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan(0.0);
    bool _2611 = _2607 || _2609;
    bool _2613 = !_2611;
    float _2615 = _2613 ? 0.0 : 2.0;
    float _2617 = _2593 + _2615;
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2621 = -_2025;
    float _2623 = fma(_2601, _2619, _2621);
    bool _2625 = _2623 >= 0.0;
    bool _2627 = isnan(_2623);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan(0.0);
    bool _2633 = _2629 || _2631;
    float _2635 = float(_2633);
    float _2637 = 1.0 / _2087;
    float _2639 = _2617 + _2635;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = -_2025;
    float _2645 = fma(_2637, _2641, _2643);
    float _2647 = 1.0 / _2099;
    bool _2649 = _2645 >= 0.0;
    bool _2651 = isnan(_2645);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan(0.0);
    bool _2657 = _2653 || _2655;
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2661 = -_2025;
    float _2663 = fma(_2647, _2659, _2661);
    float _2665 = 1.0 / _2103;
    bool _2667 = _2663 >= 0.0;
    bool _2669 = isnan(_2663);
    bool _2671 = _2667 || _2669;
    bool _2673 = isnan(0.0);
    bool _2675 = _2671 || _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2679 = -_2025;
    float _2681 = fma(_2665, _2677, _2679);
    float _2683 = 1.0 / _2107;
    bool _2685 = _2681 >= 0.0;
    bool _2687 = isnan(_2681);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2697 = -_2025;
    float _2699 = fma(_2683, _2695, _2697);
    float _2701 = 1.0 / _2111;
    bool _2703 = _2699 >= 0.0;
    bool _2705 = isnan(_2699);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.0);
    bool _2711 = _2707 || _2709;
    bool _2713 = !_2675;
    float _2715 = _2713 ? 0.0 : 3.0;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2719 = -_2025;
    float _2721 = fma(_2701, _2717, _2719);
    bool _2723 = !_2693;
    float _2725 = _2723 ? 0.0 : 3.0;
    bool _2727 = _2721 >= 0.0;
    bool _2729 = isnan(_2721);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = _2715 + _2725;
    bool _2739 = !_2657;
    float _2741 = _2739 ? 0.0 : 2.0;
    bool _2743 = !_2711;
    float _2745 = _2743 ? 0.0 : 3.0;
    bool _2747 = !_2735;
    float _2749 = _2747 ? 0.0 : 3.0;
    float _2751 = _2639 + _2741;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2755 = -_2025;
    float _2757 = fma(_2425, _2753, _2755);
    float _2759 = _2737 + _2745;
    float _2761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2763 = -_2025;
    float _2765 = fma(_2239, _2761, _2763);
    float _2767 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2769 = -_2025;
    float _2771 = fma(_2533, _2767, _2769);
    float _2773 = _2751 * 0.02857142873108386993408203125;
    float _2775 = precise::clamp(_2773, 0.0, 1.0);
    bool _2777 = _2757 >= 0.0;
    bool _2779 = isnan(_2757);
    bool _2781 = _2777 || _2779;
    bool _2783 = isnan(0.0);
    bool _2785 = _2781 || _2783;
    float _2787 = _2759 + _2749;
    bool _2789 = _2771 >= 0.0;
    bool _2791 = isnan(_2771);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan(0.0);
    bool _2797 = _2793 || _2795;
    bool _2799 = !_2785;
    float _2801 = _2799 ? 0.0 : 3.0;
    bool _2803 = _2765 >= 0.0;
    bool _2805 = isnan(_2765);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan(0.0);
    bool _2811 = _2807 || _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2815 = -_2025;
    float _2817 = fma(_2265, _2813, _2815);
    bool _2819 = !_2797;
    float _2821 = _2819 ? 0.0 : 3.0;
    float _2823 = _2787 + _2801;
    bool _2825 = !_2811;
    float _2827 = _2825 ? 0.0 : 3.0;
    bool _2829 = _2817 >= 0.0;
    bool _2831 = isnan(_2817);
    bool _2833 = _2829 || _2831;
    bool _2835 = isnan(0.0);
    bool _2837 = _2833 || _2835;
    float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2841 = -_2025;
    float _2843 = fma(_2283, _2839, _2841);
    float _2845 = _2823 + _2827;
    bool _2847 = !_2837;
    float _2849 = _2847 ? 0.0 : 3.0;
    bool _2851 = _2843 >= 0.0;
    bool _2853 = isnan(_2843);
    bool _2855 = _2851 || _2853;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    float _2861 = _2845 + _2849;
    bool _2863 = !_2859;
    float _2865 = _2863 ? 0.0 : 5.0;
    bool _2867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2869 = isnan(0.5);
    bool _2871 = _2867 || _2869;
    bool _2873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2875 = _2871 || _2873;
    float _2877 = _2861 + _2821;
    float _2879 = _2877 + _2865;
    float _2881 = _2879 * 0.14285714924335479736328125;
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    float _2885 = _2775 * _2883;
    float _2887 = _2775;
    float _2889 = _2883;
    if (_2875)
    {
        _2887 = 1.0;
    }
    float _2891 = _2887;
    float _2893 = _2891;
    if (_2875)
    {
        _2889 = 1.0;
    }
    float _2895 = _2889;
    float _2897 = _2895;
    if (!_2875)
    {
        float _2899 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2901 = _2899 * 0.15915493667125701904296875;
        float _2903 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2905 = _2901 * 6.283185482025146484375;
        float _2907 = cos(_2905);
        float _2909 = _2903 * 0.15915493667125701904296875;
        float _2911 = _2901 * 6.283185482025146484375;
        float _2913 = sin(_2911);
        float _2915 = 1.0 / _2907;
        float _2917 = _2909 * 6.283185482025146484375;
        float _2919 = cos(_2917);
        float _2921 = _2913 * _2915;
        float _2923 = _2909 * 6.283185482025146484375;
        float _2925 = sin(_2923);
        float _2927 = _2919 * _2921;
        float _2929 = 1.0 / _2927;
        float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2933 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2931;
        float _2935 = 1.0 / _2933;
        float _2937 = _2925 * _2929;
        float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2941 = fma(_2025, _2937, _2939);
        float _2943 = _2941 * _2935;
        float _2945 = precise::clamp(_2943, 0.0, 1.0);
        _2897 = _2945;
    }
    float _2947 = _2897;
    if (!_2875)
    {
        float _2949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2951 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2953 = _2949 * 0.15915493667125701904296875;
        float _2955 = _2951 * 0.15915493667125701904296875;
        float _2957 = _2953 * 6.283185482025146484375;
        float _2959 = cos(_2957);
        float _2961 = _2953 * 6.283185482025146484375;
        float _2963 = sin(_2961);
        float _2965 = 1.0 / _2959;
        float _2967 = _2955 * 6.283185482025146484375;
        float _2969 = cos(_2967);
        float _2971 = _2963 * _2965;
        float _2973 = _2955 * 6.283185482025146484375;
        float _2975 = sin(_2973);
        float _2977 = _2969 * _2971;
        float _2979 = 1.0 / _2977;
        float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2983 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2981;
        float _2985 = 1.0 / _2983;
        float _2987 = _2975 * _2979;
        float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2991 = fma(_2025, _2987, _2989);
        float _2993 = _2991 * _2985;
        float _2995 = precise::clamp(_2993, 0.0, 1.0);
        float _2997 = -_2995;
        float _2999 = _2997 + 1.0;
        _2893 = _2999;
    }
    float _3001 = _2893;
    float _3003 = _2885 * _2947;
    bool _3005 = _2947 > 0.0;
    bool _3007 = isnan(_2947);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan(0.0);
    bool _3013 = _3009 || _3011;
    float _3015 = _3003 * _3001;
    bool _3017 = _3001 <= 0.0;
    bool _3019 = !_3013;
    bool _3021 = _3017 || _3019;
    float _3023 = _3015 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3025 = _3023 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _3025;
    if (!_3021)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_38.x = 0.0;
    float _3027 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3027;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

