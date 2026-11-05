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
    constant _16* vp_c16 [[id(4)]];
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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _507 = false;
    bool _301 = false;
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
        float _1817 = as_type<float>(_103);
        out.gl_Position.z = _1817;
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
        float _1886 = as_type<float>(_139);
        out.gl_Position.z = _1886;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_54.w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = _141;
    float _179 = _143;
    if (!_155)
    {
        float _181 = _143 * _143;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    bool _187 = !_171;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _185;
    if (!_155)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    bool _197 = !_175;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_155;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _143 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _143);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _143 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _157, _263);
    float _271 = fma(_259, _159, _265);
    float _273 = fma(_259, _161, _267);
    float _275 = fma(_269, _145, _163);
    float _277 = fma(_271, _145, _165);
    float _279 = fma(_273, _145, _167);
    bool _281 = !_261;
    float _299;
    if (!_281)
    {
        float _283 = in.m_56.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_87);
        float _305 = 1.0 / _303;
        float _307 = _121 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _309 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = _309 + _315;
    bool _319 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _321 = isnan(_309);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _339;
    float _343 = 1.0 / _337;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _333;
    float _349 = 1.0 / _341;
    float _351 = _313 * _347;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _309 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = _355 * _343;
    float _363 = -_329;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _317 * _349;
    bool _373 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_309);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _387 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_309);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = fma(_369, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = _383 * _365;
    bool _407 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_309);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = _397 * _421;
    float _433 = fma(_425, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _435 = fma(_401, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = _417 * _429;
    float _439 = in.m_54.x;
    float _441 = in.m_54.y;
    float _443 = -_417;
    float _445 = _443 + 1.0;
    float _447 = _385 * _437;
    float _449 = _403 * _437;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _371, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _371, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_433, _431, _459);
    float _469 = fma(_435, _431, _461);
    float _471 = fma(_463, _405, _467);
    float _473 = fma(_465, _405, _469);
    float _475 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[146].x, _471);
    float _477 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    float _479 = _475 * _439;
    float _481 = _477 * _441;
    bool _483 = !_345;
    float _485 = _441;
    float _487 = _479;
    float _505;
    if (!_483)
    {
        float _489 = in.m_56.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _485 = _499;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_87);
        float _511 = 1.0 / _509;
        float _513 = _121 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _485;
    float _517 = _505;
    float _519 = in.m_56.w;
    float _521 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _525 = _523 != 0;
    float _527 = in.m_56.z;
    float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _533 = _531 != 0;
    float _535 = in.m_56.x;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _541 = 1.0 / _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _547 = _515;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_525)
    {
        float _551 = in.m_56.y;
        _547 = _551;
    }
    float _553 = _547;
    float _555 = 1.0 / _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = _519 > 0.5;
    float _563 = _189 * _521;
    float _565 = _277 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _567 = _527 > 0.5;
    float _569 = _563;
    float _571 = _527;
    if (!_525)
    {
        _487 = _527;
    }
    float _573 = _487;
    float _575 = 1.0 / _559;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _587 = _585 != 0;
    float _589 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
    float _591 = _573;
    if (_533)
    {
        float _593 = -_563;
        float _595 = _567 ? _593 : _563;
        _569 = _595;
    }
    float _597 = _569;
    float _599 = -_199;
    int _601 = _567 ? as_type<int>(_599) : as_type<int>(_199);
    float _603 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
    float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_525)
    {
        _549 = _553;
    }
    float _607 = _549;
    float _609 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _611;
    float _615 = _607;
    float _617 = _553;
    if (_525)
    {
        float _619 = in.m_56.x;
        float _621 = in.m_56.y;
        _615 = _619;
        _617 = _621;
    }
    float _623 = _615;
    float _625 = _617;
    if (_525)
    {
        _591 = _625;
    }
    float _627 = _591;
    if (_525)
    {
        _571 = _625;
    }
    float _629 = _571;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _637 = _635 != 0;
    float _639 = _277 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _641 = _277 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _643 = _535 > 0.5;
    float _645 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].x, _639);
    float _647 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _649;
    bool _653 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = isnan(_517);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _667 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _669 = _651 * _541;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _675 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_517);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_663;
    float _689 = _687 + 1.0;
    bool _691 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_517);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _673 * _555;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _707 = _517 + _705;
    float _709 = _685 * _689;
    float _711 = -_685;
    float _713 = _711 + 1.0;
    bool _715 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _717 = isnan(_517);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _613 * _575;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _517 + _729;
    float _733 = _701 * _713;
    float _735 = -_701;
    float _737 = _735 + 1.0;
    float _739 = fma(_669, _707, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = fma(_703, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _743 = _725 * _737;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _747 = _517 + _745;
    float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _751 = -_725;
    float _753 = _751 + 1.0;
    float _755 = _739 * _743;
    bool _757 = !_587;
    float _759 = _757 ? _199 : as_type<float>(_601);
    float _761 = fma(_727, _747, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _763 = _625 > 0.5;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _767 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[115].x, _755);
    float _769 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _765);
    float _771 = _623 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _775 = fma(_741, _733, _767);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _779 = -_773;
    float _781 = fma(_771, 2.0, _779);
    float _783 = fma(_761, _709, _775);
    float _785 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _789 = _609 + _787;
    float _791 = _749 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _793 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _797 = -_121;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[81].x, _781);
    float _801 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[83].w, _777);
    float _803 = _667 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _807 = _785 + _805;
    float _809 = _789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _811 = _597 + 0.5;
    float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _815 = fma(_793, -2.0, _795);
    float _817 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _821 = _803 + _819;
    float _823 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[28].x, _809);
    float _825 = -_189;
    int _827 = _643 ? as_type<int>(_825) : as_type<int>(_189);
    float _829 = fma(_791, _811, _799);
    float _831 = -_199;
    int _833 = _763 ? as_type<int>(_831) : as_type<int>(_199);
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _837 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _815);
    float _839 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _769);
    float _841 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _801);
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[28].z, _823);
    float _845 = _199 * _817;
    bool _847 = !_633;
    float _849 = _847 ? _189 : as_type<float>(_827);
    float _851 = -_759;
    float _853 = _851 + 0.5;
    float _855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _857 = !_637;
    float _859 = _857 ? _199 : as_type<float>(_833);
    float _861 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[118].x, _783);
    float _863 = _845;
    float _865 = _785;
    if (_579)
    {
        float _867 = -_845;
        float _869 = _561 ? _867 : _845;
        _863 = _869;
    }
    float _871 = _863;
    float _873 = _849 + 0.5;
    float _875 = _853 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _877 = -_859;
    float _879 = _877 + 0.5;
    float _881 = _813 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _885 = _871 + (-0.5);
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _889 = _875 * _529;
    float _891 = _789 * _789;
    float _893 = _883 * _835;
    bool _895 = _843 >= 0.0;
    float _897 = -_881;
    float _899 = -_837;
    float _901 = fma(_897, _885, _899);
    float _903 = _887 * _855;
    float _905 = -_841;
    float _907 = _905 + 1.0;
    float _909 = -_189;
    int _911 = _763 ? as_type<int>(_909) : as_type<int>(_189);
    float _913 = fma(_807, _807, _891);
    float _915 = -_839;
    float _917 = _915 + 1.0;
    float _919 = fma(_907, _871, _901);
    bool _921 = !_583;
    float _923 = _921 ? _189 : as_type<float>(_911);
    float _925 = fma(_821, _821, _913);
    float _927 = -_917;
    float _929 = fma(_927, _597, _829);
    float _931 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _933 = rsqrt(_925);
    float _935 = _923 + 0.5;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _945 = _913;
    float _947 = _929;
    if (_895)
    {
        _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _949 = _945;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = _935 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _959 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _961 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _971 = as_type<int>(_949);
    if (_895)
    {
        float _973 = _949 * 5.0;
        _971 = as_type<int>(_973);
    }
    int _975 = _971;
    float _977 = _957 * _605;
    out.m_58.x = _959;
    out.m_58.y = _961;
    out.m_58.z = _963;
    out.m_58.w = _931;
    float _979 = _789 * _933;
    float _981 = _807 * _933;
    out.m_60.x = _965;
    out.m_60.y = _967;
    out.m_60.z = _969;
    out.m_60.w = _937;
    out.m_62.x = _893;
    out.m_62.y = _903;
    out.m_62.z = _929;
    out.m_62.w = _919;
    if (_895)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3276 = as_type<float>(_975);
        out.gl_Position.z = _3276;
    }
    out.m_64.x = _977;
    out.m_64.y = _889;
    if (_895)
    {
        out.m_47.x = 0.0;
    }
    if (_895)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _983 = -_979;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _987 = _821 * _933;
    float _989 = -_981;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _993 = -_979;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _985 + _997;
    float _1001 = -_987;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _803);
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1007 = _991 + _1005;
    float _1009 = -_981;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    float _1013 = _999 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _1003 + _1015;
    float _1019 = _995 * _995;
    float _1021 = -_987;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _821);
    float _1025 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    float _1027 = fma(_1011, _1011, _1019);
    float _1029 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    float _1031 = fma(_1023, _1023, _1027);
    bool _1033 = _1029 >= 0.0;
    float _1035 = sqrt(_1031);
    float _1037 = _987;
    float _1039 = _1003;
    float _1041 = _1017;
    if (_1033)
    {
        _947 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1043 = _947;
    int _1045 = as_type<int>(_1043);
    if (_1033)
    {
        out.m_47.x = 0.0;
    }
    float _1047 = _933 * _1035;
    if (_1033)
    {
        float _1049 = _1043 * 5.0;
        _1045 = as_type<int>(_1049);
    }
    int _1051 = _1045;
    if (_1033)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3414 = as_type<float>(_1051);
        out.gl_Position.z = _3414;
    }
    if (_1033)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1055 = _817 * _1047;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1059 = _521 * _1047;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = _1053 * _1055;
    float _1067 = _1057 * _1059;
    float _1069 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1075 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1069);
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1073);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1077);
    float _1085 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1079);
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1093 = _785 + _1087;
    float _1095 = _803 + _1089;
    float _1097 = _609 + _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1093 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = _1101 * _1101;
    float _1109 = _1105 * _1105;
    float _1111 = _1107 + _1109;
    float _1113 = sqrt(_1111);
    bool _1115 = _1113 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1117 = _1091;
    float _1119 = _1107;
    float _1121 = _1109;
    float _1123 = _1093;
    float _1125 = _1095;
    if (!_1115)
    {
        _1117 = _1107;
    }
    float _1127 = _1117;
    float _1129 = _1127;
    if (!_1115)
    {
        _1119 = _1097;
    }
    float _1131 = _1119;
    bool _1133 = !_1115;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1113 + _1139;
        float _1143 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = rsqrt(_1111);
        float _1147 = _1141 * _1137;
        float _1149 = _1147 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = fma(_1153, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = _1145 * _1159;
        float _1163 = _1157 + (-1.0);
        float _1165 = fma(_1101, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_1105, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1173 = _1165 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1177 = _1167 + _1175;
        float _1179 = fma(_1097, _1157, _1169);
        float _1181 = _1173 * _1173;
        float _1183 = _1177 * _1177;
        _1135 = _1179;
        _1129 = _1181;
        _1121 = _1183;
        _1123 = _1165;
        _1125 = _1167;
    }
    float _1185 = _1135;
    float _1187 = _1129;
    float _1189 = _1121;
    float _1191 = _1123;
    float _1193 = _1125;
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1197 = _1185 + _1195;
    float _1199 = fma(_1197, _1197, _1187);
    float _1201 = _1199 + _1189;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1207 = isnan(_1203);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1213 = _1209 || _1211;
    float _1215 = _1187;
    if (!_1213)
    {
        _1215 = 1.0;
    }
    float _1217 = _1215;
    bool _1219 = !_1213;
    float _1221 = _1217;
    if (!_1219)
    {
        bool _1223 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1225 = isnan(_1203);
        bool _1227 = _1223 || _1225;
        bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1231 = _1227 || _1229;
        if (!_1231)
        {
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = _1203 + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1245 = 1.0 / _1239;
            float _1247 = _1235 * _1245;
            float _1249 = fma(_1247, _1243, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1221 = _1249;
            _1251 = true;
        }
        else
        {
            bool _1253 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1255 = isnan(_1203);
            bool _1257 = _1253 || _1255;
            bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1261 = _1257 || _1259;
            if (!_1261)
            {
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1203 + _1263;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1275 = 1.0 / _1269;
                float _1277 = _1265 * _1275;
                float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1221 = _1279;
                _1251 = true;
            }
            else
            {
                _1221 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1251 = false;
    float _1281 = _1221;
    float _1283 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1285 = _1185 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1289 = _1191 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1293 = _1193 + _1291;
    bool _1295 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    float _1305 = fma(_1285, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1289, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1293, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_979;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_981;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_987;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = _1317;
    float _1325 = _1321;
    if (_1303)
    {
        _1037 = _1313;
    }
    float _1327 = _1037;
    float _1329 = _1327;
    if (!_1303)
    {
        float _1331 = _999 * _999;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1335 = -_803;
        float _1337 = _1335 + _1309;
        float _1339 = -_609;
        float _1341 = _1339 + _1305;
        float _1343 = fma(_1007, _1007, _1331);
        float _1345 = fma(_1017, _1017, _1343);
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = sqrt(_1345);
        float _1351 = 1.0 / _1047;
        float _1353 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1355 = precise::min(_1349, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1333;
        float _1359 = -_785;
        float _1361 = _1359 + _1307;
        float _1363 = _1357 * _1351;
        float _1365 = _1353 * _1363;
        float _1367 = _1337 * _1363;
        float _1369 = fma(_1361, _1365, _991);
        float _1371 = fma(_1341, _1365, _985);
        float _1373 = fma(_1353, _1367, _1003);
        _1329 = _1371;
        _1323 = _1369;
        _1325 = _1373;
    }
    float _1375 = _1329;
    float _1377 = _1323;
    float _1379 = _1325;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1383 = _1375 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1387 = _1377 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = _1379 + _1389;
    float _1393 = _1383 * _1383;
    float _1395 = fma(_1387, _1387, _1393);
    float _1397 = fma(_1391, _1391, _1395);
    float _1399 = rsqrt(_1397);
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1387 * _1401;
    float _1405 = _1391 * _1401;
    float _1407 = _1403 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 + _1409;
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1399;
    float _1423 = _1419;
    float _1425 = _1383;
    float _1427 = _1401;
    float _1429 = _1403;
    if (_1415)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1431;
    }
    float _1433 = _1421;
    if (_1415)
    {
        float _1435 = rsqrt(_1411);
        _1039 = _1435;
    }
    float _1437 = _1039;
    float _1439 = _1437;
    if (_1415)
    {
        float _1441 = _1419 * _1433;
        _1423 = _1441;
    }
    float _1443 = _1423;
    if (_1415)
    {
        float _1445 = _1443 * 0.15915493667125701904296875;
        _1041 = _1445;
    }
    float _1447 = _1041;
    float _1449 = _1433;
    if (_1415)
    {
        float _1451 = _1447 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1449 = _1453;
    }
    float _1455 = _1449;
    float _1457 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1459 = precise::max(0.0, _1457);
    float _1461 = _1391;
    float _1463 = _1459;
    if (_1415)
    {
        float _1465 = _1447 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        _1461 = _1467;
    }
    float _1469 = _1461;
    float _1471 = -_1401;
    float _1473 = -_1459;
    float _1475 = fma(_1383, _1471, _1473);
    if (!_1415)
    {
        _1425 = _1405;
    }
    float _1477 = _1425;
    float _1479 = _1477;
    if (_1415)
    {
        float _1481 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1463 = _1481;
    }
    float _1483 = _1463;
    float _1485 = sqrt(_1397);
    float _1487 = _1455;
    float _1489 = _1483;
    if (_1415)
    {
        float _1491 = fma(_1455, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1487 = _1491;
    }
    float _1493 = _1487;
    float _1495 = _1493;
    if (_1415)
    {
        float _1497 = _1469 + (-1.0);
        _1489 = _1497;
    }
    float _1499 = _1489;
    float _1501 = _1499;
    if (_1415)
    {
        float _1503 = _1437 * _1493;
        _865 = _1503;
    }
    float _1505 = _865;
    if (!_1415)
    {
        _1439 = _1475;
    }
    float _1507 = _1439;
    float _1509 = _1507;
    if (_1415)
    {
        float _1511 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1511;
    }
    float _1513 = _1427;
    if (_1415)
    {
        float _1515 = _1403 * _1505;
        _1429 = _1515;
    }
    float _1517 = _1429;
    if (!_1415)
    {
        _1495 = _1407;
    }
    float _1519 = _1495;
    float _1521 = _1519;
    if (_1415)
    {
        float _1523 = _1405 * _1505;
        _1479 = _1523;
    }
    float _1525 = _1479;
    if (_1415)
    {
        float _1527 = fma(_1475, _1469, _1513);
        _1509 = _1527;
    }
    float _1529 = _1509;
    if (_1415)
    {
        float _1531 = _1517 * _1517;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (!_1415)
    {
        _1501 = _1409;
    }
    float _1535 = _1501;
    float _1537 = _1535;
    if (_1415)
    {
        float _1539 = _1525 * _1525;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_1529, _1529, _1533);
    float _1545 = _1543 + _1541;
    float _1547 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1485, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1557 = rsqrt(_1545);
    float _1559 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1547);
    float _1561 = -_1553;
    float _1563 = _1561 + 1.0;
    float _1565 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1567 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1569 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1573 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1565);
    float _1575 = abs(_1563);
    float _1577 = log2(_1575);
    float _1579 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1581 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1567);
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1573);
    float _1585 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1571);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1589 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1591 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = _1557 * _1517;
    float _1595 = -_1587;
    float _1597 = fma(_1595, _1555, 1.0);
    float _1599 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1585);
    float _1601 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1605 = _1557 * _1529;
    float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1609 = _1557 * _1525;
    float _1611 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1603);
    float _1613 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1615 = -_1607;
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1615);
    float _1619 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1621 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1623 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1625 = -_1609;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1617);
    float _1629 = exp2(_1613);
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1621);
    float _1633 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1635 = fma(_1627, -0.5, 0.5);
    float _1637 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1623);
    float _1639 = fma(_1627, 0.5, 0.5);
    float _1641 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1633);
    float _1643 = _1605 + 1.0;
    float _1645 = log2(_1597);
    float _1647 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1637);
    float _1649 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1641);
    float _1651 = fma(_1639, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1653 = fma(_1639, _1651, -0.212114393711090087890625);
    float _1655 = 1.0 / _1631;
    float _1657 = -_1605;
    float _1659 = fma(_1629, _1643, _1657);
    float _1661 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1647);
    float _1663 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float _1665 = fma(_1639, _1653, 1.570728778839111328125);
    float _1667 = sqrt(_1635);
    float _1669 = _1645 * 0.693147182464599609375;
    float _1671 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1673 = _1661 * _1655;
    float _1675 = _1663 * _1655;
    float _1677 = fma(_1673, 0.5, 0.5);
    float _1679 = fma(_1675, -0.5, 0.5);
    float _1681 = fma(_1659, 0.5, 0.5);
    float _1683 = _1667 * 0.636619746685028076171875;
    float3 _4464 = float3(_1677, _1679, _1671);
    float _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).x;
    float3 _4475 = float3(_1677, _1679, _1671);
    float4 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4475, float3(0.0), isnan(_4475)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4475, float3(0.0), isnan(_4475)), level(0.0)).xyzw;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = _1688.w;
    float _1698 = -_1665;
    float _1700 = fma(_1683, _1698, 1.0);
    float2 _4497 = float2(_1700, _1681);
    float3 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4497, float2(0.0), isnan(_4497)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4497, float2(0.0), isnan(_4497)), level(0.0)).xyz;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1714 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1716 = _1661 + _1631;
    float _1718 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1712);
    float _1720 = _1716 * 0.5;
    float _1722 = exp2(_1714);
    float _1724 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1718);
    float _1726 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1728 = _1631 * 0.5;
    float _1730 = _1726 + _1631;
    float _1732 = -_1722;
    float _1734 = _1732 + 1.0;
    float _1736 = fma(_1663, -0.5, _1728);
    float _1738 = _1730 * 0.5;
    float _1740 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1661;
    out.gl_Position.y = _1663;
    out.gl_Position.z = _1726;
    out.gl_Position.w = _1631;
    float _1742 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1720;
    out.m_66.y = _1736;
    out.m_66.z = _1738;
    out.m_66.w = _1631;
    out.m_47.x = _1742;
    float _1744 = _1740 * _1685;
    float _1746 = -_1740;
    float _1748 = _1746 + 1.0;
    float _1750 = _1696 * _1744;
    float _1752 = _1710 * _1744;
    float _1754 = fma(_1706, _1750, _1690);
    float _1756 = fma(_1708, _1750, _1692);
    float _1758 = _1696 * _1748;
    float _1760 = fma(_1696, _1752, _1694);
    out.m_68.x = _1754;
    out.m_68.y = _1756;
    out.m_68.z = _1760;
    out.m_68.w = _1758;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _507 = false;
    bool _301 = false;
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
        float _1817 = as_type<float>(_103);
        out.gl_Position.z = _1817;
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
        float _1886 = as_type<float>(_139);
        out.gl_Position.z = _1886;
    }
    if (_131)
    {
        return out;
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_54.w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = _141;
    float _179 = _143;
    if (!_155)
    {
        float _181 = _143 * _143;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    bool _187 = !_171;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _185;
    if (!_155)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    bool _197 = !_175;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_155;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _143 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _143);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _143 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _157, _263);
    float _271 = fma(_259, _159, _265);
    float _273 = fma(_259, _161, _267);
    float _275 = fma(_269, _145, _163);
    float _277 = fma(_271, _145, _165);
    float _279 = fma(_273, _145, _167);
    bool _281 = !_261;
    float _299;
    if (!_281)
    {
        float _283 = in.m_56.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_87);
        float _305 = 1.0 / _303;
        float _307 = _121 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _309 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = _309 + _315;
    bool _319 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _321 = isnan(_309);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _339;
    float _343 = 1.0 / _337;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _333;
    float _349 = 1.0 / _341;
    float _351 = _313 * _347;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _309 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = _355 * _343;
    float _363 = -_329;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _317 * _349;
    bool _373 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_309);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _387 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_309);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = fma(_369, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = _383 * _365;
    bool _407 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_309);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = _397 * _421;
    float _433 = fma(_425, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _435 = fma(_401, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = _417 * _429;
    float _439 = in.m_54.x;
    float _441 = in.m_54.y;
    float _443 = -_417;
    float _445 = _443 + 1.0;
    float _447 = _385 * _437;
    float _449 = _403 * _437;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _371, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _371, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_433, _431, _459);
    float _469 = fma(_435, _431, _461);
    float _471 = fma(_463, _405, _467);
    float _473 = fma(_465, _405, _469);
    float _475 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[146].x, _471);
    float _477 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    float _479 = _475 * _439;
    float _481 = _477 * _441;
    bool _483 = !_345;
    float _485 = _441;
    float _487 = _479;
    float _505;
    if (!_483)
    {
        float _489 = in.m_56.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _485 = _499;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_87);
        float _511 = 1.0 / _509;
        float _513 = _121 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _485;
    float _517 = _505;
    float _519 = in.m_56.w;
    float _521 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _525 = _523 != 0;
    float _527 = in.m_56.z;
    float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _533 = _531 != 0;
    float _535 = in.m_56.x;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _541 = 1.0 / _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _547 = _515;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_525)
    {
        float _551 = in.m_56.y;
        _547 = _551;
    }
    float _553 = _547;
    float _555 = 1.0 / _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = _519 > 0.5;
    float _563 = _189 * _521;
    float _565 = _277 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _567 = _527 > 0.5;
    float _569 = _563;
    float _571 = _527;
    if (!_525)
    {
        _487 = _527;
    }
    float _573 = _487;
    float _575 = 1.0 / _559;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _587 = _585 != 0;
    float _589 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
    float _591 = _573;
    if (_533)
    {
        float _593 = -_563;
        float _595 = _567 ? _593 : _563;
        _569 = _595;
    }
    float _597 = _569;
    float _599 = -_199;
    int _601 = _567 ? as_type<int>(_599) : as_type<int>(_199);
    float _603 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
    float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_525)
    {
        _549 = _553;
    }
    float _607 = _549;
    float _609 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _611;
    float _615 = _607;
    float _617 = _553;
    if (_525)
    {
        float _619 = in.m_56.x;
        float _621 = in.m_56.y;
        _615 = _619;
        _617 = _621;
    }
    float _623 = _615;
    float _625 = _617;
    if (_525)
    {
        _591 = _625;
    }
    float _627 = _591;
    if (_525)
    {
        _571 = _625;
    }
    float _629 = _571;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _637 = _635 != 0;
    float _639 = _277 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _641 = _277 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _643 = _535 > 0.5;
    float _645 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].x, _639);
    float _647 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _649;
    bool _653 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = isnan(_517);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _667 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _669 = _651 * _541;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _675 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_517);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_663;
    float _689 = _687 + 1.0;
    bool _691 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_517);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _673 * _555;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _707 = _517 + _705;
    float _709 = _685 * _689;
    float _711 = -_685;
    float _713 = _711 + 1.0;
    bool _715 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _717 = isnan(_517);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _613 * _575;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _517 + _729;
    float _733 = _701 * _713;
    float _735 = -_701;
    float _737 = _735 + 1.0;
    float _739 = fma(_669, _707, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = fma(_703, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _743 = _725 * _737;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _747 = _517 + _745;
    float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _751 = -_725;
    float _753 = _751 + 1.0;
    float _755 = _739 * _743;
    bool _757 = !_587;
    float _759 = _757 ? _199 : as_type<float>(_601);
    float _761 = fma(_727, _747, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _763 = _625 > 0.5;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _767 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[115].x, _755);
    float _769 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _765);
    float _771 = _623 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _775 = fma(_741, _733, _767);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _779 = -_773;
    float _781 = fma(_771, 2.0, _779);
    float _783 = fma(_761, _709, _775);
    float _785 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _789 = _609 + _787;
    float _791 = _749 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _793 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _797 = -_121;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[81].x, _781);
    float _801 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[83].w, _777);
    float _803 = _667 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _807 = _785 + _805;
    float _809 = _789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _811 = _597 + 0.5;
    float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _815 = fma(_793, -2.0, _795);
    float _817 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _821 = _803 + _819;
    float _823 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[28].x, _809);
    float _825 = -_189;
    int _827 = _643 ? as_type<int>(_825) : as_type<int>(_189);
    float _829 = fma(_791, _811, _799);
    float _831 = -_199;
    int _833 = _763 ? as_type<int>(_831) : as_type<int>(_199);
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _837 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _815);
    float _839 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _769);
    float _841 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _801);
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[28].z, _823);
    float _845 = _199 * _817;
    bool _847 = !_633;
    float _849 = _847 ? _189 : as_type<float>(_827);
    float _851 = -_759;
    float _853 = _851 + 0.5;
    float _855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _857 = !_637;
    float _859 = _857 ? _199 : as_type<float>(_833);
    float _861 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[118].x, _783);
    float _863 = _845;
    float _865 = _785;
    if (_579)
    {
        float _867 = -_845;
        float _869 = _561 ? _867 : _845;
        _863 = _869;
    }
    float _871 = _863;
    float _873 = _849 + 0.5;
    float _875 = _853 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _877 = -_859;
    float _879 = _877 + 0.5;
    float _881 = _813 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _885 = _871 + (-0.5);
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _889 = _875 * _529;
    float _891 = _789 * _789;
    float _893 = _883 * _835;
    bool _895 = _843 >= 0.0;
    float _897 = -_881;
    float _899 = -_837;
    float _901 = fma(_897, _885, _899);
    float _903 = _887 * _855;
    float _905 = -_841;
    float _907 = _905 + 1.0;
    float _909 = -_189;
    int _911 = _763 ? as_type<int>(_909) : as_type<int>(_189);
    float _913 = fma(_807, _807, _891);
    float _915 = -_839;
    float _917 = _915 + 1.0;
    float _919 = fma(_907, _871, _901);
    bool _921 = !_583;
    float _923 = _921 ? _189 : as_type<float>(_911);
    float _925 = fma(_821, _821, _913);
    float _927 = -_917;
    float _929 = fma(_927, _597, _829);
    float _931 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _933 = rsqrt(_925);
    float _935 = _923 + 0.5;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _945 = _913;
    float _947 = _929;
    if (_895)
    {
        _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _949 = _945;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = _935 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _959 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _961 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _971 = as_type<int>(_949);
    if (_895)
    {
        float _973 = _949 * 5.0;
        _971 = as_type<int>(_973);
    }
    int _975 = _971;
    float _977 = _957 * _605;
    out.m_58.x = _959;
    out.m_58.y = _961;
    out.m_58.z = _963;
    out.m_58.w = _931;
    float _979 = _789 * _933;
    float _981 = _807 * _933;
    out.m_60.x = _965;
    out.m_60.y = _967;
    out.m_60.z = _969;
    out.m_60.w = _937;
    out.m_62.x = _893;
    out.m_62.y = _903;
    out.m_62.z = _929;
    out.m_62.w = _919;
    if (_895)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3276 = as_type<float>(_975);
        out.gl_Position.z = _3276;
    }
    out.m_64.x = _977;
    out.m_64.y = _889;
    if (_895)
    {
        out.m_47.x = 0.0;
    }
    if (_895)
    {
        return out;
    }
    float _983 = -_979;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _987 = _821 * _933;
    float _989 = -_981;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _993 = -_979;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _985 + _997;
    float _1001 = -_987;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _803);
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1007 = _991 + _1005;
    float _1009 = -_981;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    float _1013 = _999 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _1003 + _1015;
    float _1019 = _995 * _995;
    float _1021 = -_987;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _821);
    float _1025 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    float _1027 = fma(_1011, _1011, _1019);
    float _1029 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    float _1031 = fma(_1023, _1023, _1027);
    bool _1033 = _1029 >= 0.0;
    float _1035 = sqrt(_1031);
    float _1037 = _987;
    float _1039 = _1003;
    float _1041 = _1017;
    if (_1033)
    {
        _947 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1043 = _947;
    int _1045 = as_type<int>(_1043);
    if (_1033)
    {
        out.m_47.x = 0.0;
    }
    float _1047 = _933 * _1035;
    if (_1033)
    {
        float _1049 = _1043 * 5.0;
        _1045 = as_type<int>(_1049);
    }
    int _1051 = _1045;
    if (_1033)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3414 = as_type<float>(_1051);
        out.gl_Position.z = _3414;
    }
    if (_1033)
    {
        return out;
    }
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1055 = _817 * _1047;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1059 = _521 * _1047;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = _1053 * _1055;
    float _1067 = _1057 * _1059;
    float _1069 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1075 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1069);
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1073);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1077);
    float _1085 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1079);
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1093 = _785 + _1087;
    float _1095 = _803 + _1089;
    float _1097 = _609 + _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1093 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = _1101 * _1101;
    float _1109 = _1105 * _1105;
    float _1111 = _1107 + _1109;
    float _1113 = sqrt(_1111);
    bool _1115 = _1113 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1117 = _1091;
    float _1119 = _1107;
    float _1121 = _1109;
    float _1123 = _1093;
    float _1125 = _1095;
    if (!_1115)
    {
        _1117 = _1107;
    }
    float _1127 = _1117;
    float _1129 = _1127;
    if (!_1115)
    {
        _1119 = _1097;
    }
    float _1131 = _1119;
    bool _1133 = !_1115;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1113 + _1139;
        float _1143 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = rsqrt(_1111);
        float _1147 = _1141 * _1137;
        float _1149 = _1147 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = fma(_1153, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = _1145 * _1159;
        float _1163 = _1157 + (-1.0);
        float _1165 = fma(_1101, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_1105, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1173 = _1165 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1177 = _1167 + _1175;
        float _1179 = fma(_1097, _1157, _1169);
        float _1181 = _1173 * _1173;
        float _1183 = _1177 * _1177;
        _1135 = _1179;
        _1129 = _1181;
        _1121 = _1183;
        _1123 = _1165;
        _1125 = _1167;
    }
    float _1185 = _1135;
    float _1187 = _1129;
    float _1189 = _1121;
    float _1191 = _1123;
    float _1193 = _1125;
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1197 = _1185 + _1195;
    float _1199 = fma(_1197, _1197, _1187);
    float _1201 = _1199 + _1189;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1207 = isnan(_1203);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1213 = _1209 || _1211;
    float _1215 = _1187;
    if (!_1213)
    {
        _1215 = 1.0;
    }
    float _1217 = _1215;
    bool _1219 = !_1213;
    float _1221 = _1217;
    if (!_1219)
    {
        bool _1223 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1225 = isnan(_1203);
        bool _1227 = _1223 || _1225;
        bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1231 = _1227 || _1229;
        if (!_1231)
        {
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = _1203 + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1245 = 1.0 / _1239;
            float _1247 = _1235 * _1245;
            float _1249 = fma(_1247, _1243, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1221 = _1249;
            _1251 = true;
        }
        else
        {
            bool _1253 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1255 = isnan(_1203);
            bool _1257 = _1253 || _1255;
            bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1261 = _1257 || _1259;
            if (!_1261)
            {
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1203 + _1263;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1275 = 1.0 / _1269;
                float _1277 = _1265 * _1275;
                float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1221 = _1279;
                _1251 = true;
            }
            else
            {
                _1221 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1251 = false;
    float _1281 = _1221;
    float _1283 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1285 = _1185 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1289 = _1191 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1293 = _1193 + _1291;
    bool _1295 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    float _1305 = fma(_1285, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1289, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1293, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_979;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_981;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_987;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = _1317;
    float _1325 = _1321;
    if (_1303)
    {
        _1037 = _1313;
    }
    float _1327 = _1037;
    float _1329 = _1327;
    if (!_1303)
    {
        float _1331 = _999 * _999;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1335 = -_803;
        float _1337 = _1335 + _1309;
        float _1339 = -_609;
        float _1341 = _1339 + _1305;
        float _1343 = fma(_1007, _1007, _1331);
        float _1345 = fma(_1017, _1017, _1343);
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = sqrt(_1345);
        float _1351 = 1.0 / _1047;
        float _1353 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1355 = precise::min(_1349, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1333;
        float _1359 = -_785;
        float _1361 = _1359 + _1307;
        float _1363 = _1357 * _1351;
        float _1365 = _1353 * _1363;
        float _1367 = _1337 * _1363;
        float _1369 = fma(_1361, _1365, _991);
        float _1371 = fma(_1341, _1365, _985);
        float _1373 = fma(_1353, _1367, _1003);
        _1329 = _1371;
        _1323 = _1369;
        _1325 = _1373;
    }
    float _1375 = _1329;
    float _1377 = _1323;
    float _1379 = _1325;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1383 = _1375 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1387 = _1377 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = _1379 + _1389;
    float _1393 = _1383 * _1383;
    float _1395 = fma(_1387, _1387, _1393);
    float _1397 = fma(_1391, _1391, _1395);
    float _1399 = rsqrt(_1397);
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1387 * _1401;
    float _1405 = _1391 * _1401;
    float _1407 = _1403 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 + _1409;
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1399;
    float _1423 = _1419;
    float _1425 = _1383;
    float _1427 = _1401;
    float _1429 = _1403;
    if (_1415)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1431;
    }
    float _1433 = _1421;
    if (_1415)
    {
        float _1435 = rsqrt(_1411);
        _1039 = _1435;
    }
    float _1437 = _1039;
    float _1439 = _1437;
    if (_1415)
    {
        float _1441 = _1419 * _1433;
        _1423 = _1441;
    }
    float _1443 = _1423;
    if (_1415)
    {
        float _1445 = _1443 * 0.15915493667125701904296875;
        _1041 = _1445;
    }
    float _1447 = _1041;
    float _1449 = _1433;
    if (_1415)
    {
        float _1451 = _1447 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1449 = _1453;
    }
    float _1455 = _1449;
    float _1457 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1459 = precise::max(0.0, _1457);
    float _1461 = _1391;
    float _1463 = _1459;
    if (_1415)
    {
        float _1465 = _1447 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        _1461 = _1467;
    }
    float _1469 = _1461;
    float _1471 = -_1401;
    float _1473 = -_1459;
    float _1475 = fma(_1383, _1471, _1473);
    if (!_1415)
    {
        _1425 = _1405;
    }
    float _1477 = _1425;
    float _1479 = _1477;
    if (_1415)
    {
        float _1481 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1463 = _1481;
    }
    float _1483 = _1463;
    float _1485 = sqrt(_1397);
    float _1487 = _1455;
    float _1489 = _1483;
    if (_1415)
    {
        float _1491 = fma(_1455, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1487 = _1491;
    }
    float _1493 = _1487;
    float _1495 = _1493;
    if (_1415)
    {
        float _1497 = _1469 + (-1.0);
        _1489 = _1497;
    }
    float _1499 = _1489;
    float _1501 = _1499;
    if (_1415)
    {
        float _1503 = _1437 * _1493;
        _865 = _1503;
    }
    float _1505 = _865;
    if (!_1415)
    {
        _1439 = _1475;
    }
    float _1507 = _1439;
    float _1509 = _1507;
    if (_1415)
    {
        float _1511 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1511;
    }
    float _1513 = _1427;
    if (_1415)
    {
        float _1515 = _1403 * _1505;
        _1429 = _1515;
    }
    float _1517 = _1429;
    if (!_1415)
    {
        _1495 = _1407;
    }
    float _1519 = _1495;
    float _1521 = _1519;
    if (_1415)
    {
        float _1523 = _1405 * _1505;
        _1479 = _1523;
    }
    float _1525 = _1479;
    if (_1415)
    {
        float _1527 = fma(_1475, _1469, _1513);
        _1509 = _1527;
    }
    float _1529 = _1509;
    if (_1415)
    {
        float _1531 = _1517 * _1517;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (!_1415)
    {
        _1501 = _1409;
    }
    float _1535 = _1501;
    float _1537 = _1535;
    if (_1415)
    {
        float _1539 = _1525 * _1525;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_1529, _1529, _1533);
    float _1545 = _1543 + _1541;
    float _1547 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1485, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1557 = rsqrt(_1545);
    float _1559 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1547);
    float _1561 = -_1553;
    float _1563 = _1561 + 1.0;
    float _1565 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1567 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1569 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1573 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1565);
    float _1575 = abs(_1563);
    float _1577 = log2(_1575);
    float _1579 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1581 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1567);
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1573);
    float _1585 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1571);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1589 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1591 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = _1557 * _1517;
    float _1595 = -_1587;
    float _1597 = fma(_1595, _1555, 1.0);
    float _1599 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1585);
    float _1601 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1605 = _1557 * _1529;
    float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1609 = _1557 * _1525;
    float _1611 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1603);
    float _1613 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1615 = -_1607;
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1615);
    float _1619 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1621 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1623 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1625 = -_1609;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1617);
    float _1629 = exp2(_1613);
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1621);
    float _1633 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1635 = fma(_1627, -0.5, 0.5);
    float _1637 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1623);
    float _1639 = fma(_1627, 0.5, 0.5);
    float _1641 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1633);
    float _1643 = _1605 + 1.0;
    float _1645 = log2(_1597);
    float _1647 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1637);
    float _1649 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1641);
    float _1651 = fma(_1639, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1653 = fma(_1639, _1651, -0.212114393711090087890625);
    float _1655 = 1.0 / _1631;
    float _1657 = -_1605;
    float _1659 = fma(_1629, _1643, _1657);
    float _1661 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1647);
    float _1663 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float _1665 = fma(_1639, _1653, 1.570728778839111328125);
    float _1667 = sqrt(_1635);
    float _1669 = _1645 * 0.693147182464599609375;
    float _1671 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1673 = _1661 * _1655;
    float _1675 = _1663 * _1655;
    float _1677 = fma(_1673, 0.5, 0.5);
    float _1679 = fma(_1675, -0.5, 0.5);
    float _1681 = fma(_1659, 0.5, 0.5);
    float _1683 = _1667 * 0.636619746685028076171875;
    float3 _4464 = float3(_1677, _1679, _1671);
    float _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).x;
    float3 _4475 = float3(_1677, _1679, _1671);
    float4 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4475, float3(0.0), isnan(_4475)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4475, float3(0.0), isnan(_4475)), level(0.0)).xyzw;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = _1688.w;
    float _1698 = -_1665;
    float _1700 = fma(_1683, _1698, 1.0);
    float2 _4497 = float2(_1700, _1681);
    float3 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4497, float2(0.0), isnan(_4497)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4497, float2(0.0), isnan(_4497)), level(0.0)).xyz;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1714 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1716 = _1661 + _1631;
    float _1718 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1712);
    float _1720 = _1716 * 0.5;
    float _1722 = exp2(_1714);
    float _1724 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1718);
    float _1726 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1728 = _1631 * 0.5;
    float _1730 = _1726 + _1631;
    float _1732 = -_1722;
    float _1734 = _1732 + 1.0;
    float _1736 = fma(_1663, -0.5, _1728);
    float _1738 = _1730 * 0.5;
    float _1740 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1661;
    out.gl_Position.y = _1663;
    out.gl_Position.z = _1726;
    out.gl_Position.w = _1631;
    float _1742 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1720;
    out.m_66.y = _1736;
    out.m_66.z = _1738;
    out.m_66.w = _1631;
    out.m_47.x = _1742;
    float _1744 = _1740 * _1685;
    float _1746 = -_1740;
    float _1748 = _1746 + 1.0;
    float _1750 = _1696 * _1744;
    float _1752 = _1710 * _1744;
    float _1754 = fma(_1706, _1750, _1690);
    float _1756 = fma(_1708, _1750, _1692);
    float _1758 = _1696 * _1748;
    float _1760 = fma(_1696, _1752, _1694);
    out.m_68.x = _1754;
    out.m_68.y = _1756;
    out.m_68.z = _1760;
    out.m_68.w = _1758;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _507 = false;
    bool _301 = false;
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
        float _1817 = as_type<float>(_103);
        out.gl_Position.z = _1817;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1886 = as_type<float>(_139);
        out.gl_Position.z = _1886;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_54.w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = _141;
    float _179 = _143;
    if (!_155)
    {
        float _181 = _143 * _143;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    bool _187 = !_171;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _185;
    if (!_155)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    bool _197 = !_175;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_155;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _143 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _143);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _143 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _157, _263);
    float _271 = fma(_259, _159, _265);
    float _273 = fma(_259, _161, _267);
    float _275 = fma(_269, _145, _163);
    float _277 = fma(_271, _145, _165);
    float _279 = fma(_273, _145, _167);
    bool _281 = !_261;
    float _299;
    if (!_281)
    {
        float _283 = in.m_56.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_87);
        float _305 = 1.0 / _303;
        float _307 = _121 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _309 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = _309 + _315;
    bool _319 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _321 = isnan(_309);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _339;
    float _343 = 1.0 / _337;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _333;
    float _349 = 1.0 / _341;
    float _351 = _313 * _347;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _309 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = _355 * _343;
    float _363 = -_329;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _317 * _349;
    bool _373 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_309);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _387 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_309);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = fma(_369, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = _383 * _365;
    bool _407 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_309);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = _397 * _421;
    float _433 = fma(_425, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _435 = fma(_401, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = _417 * _429;
    float _439 = in.m_54.x;
    float _441 = in.m_54.y;
    float _443 = -_417;
    float _445 = _443 + 1.0;
    float _447 = _385 * _437;
    float _449 = _403 * _437;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _371, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _371, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_433, _431, _459);
    float _469 = fma(_435, _431, _461);
    float _471 = fma(_463, _405, _467);
    float _473 = fma(_465, _405, _469);
    float _475 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[146].x, _471);
    float _477 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    float _479 = _475 * _439;
    float _481 = _477 * _441;
    bool _483 = !_345;
    float _485 = _441;
    float _487 = _479;
    float _505;
    if (!_483)
    {
        float _489 = in.m_56.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _485 = _499;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_87);
        float _511 = 1.0 / _509;
        float _513 = _121 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _485;
    float _517 = _505;
    float _519 = in.m_56.w;
    float _521 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _525 = _523 != 0;
    float _527 = in.m_56.z;
    float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _533 = _531 != 0;
    float _535 = in.m_56.x;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _541 = 1.0 / _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _547 = _515;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_525)
    {
        float _551 = in.m_56.y;
        _547 = _551;
    }
    float _553 = _547;
    float _555 = 1.0 / _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = _519 > 0.5;
    float _563 = _189 * _521;
    float _565 = _277 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _567 = _527 > 0.5;
    float _569 = _563;
    float _571 = _527;
    if (!_525)
    {
        _487 = _527;
    }
    float _573 = _487;
    float _575 = 1.0 / _559;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _587 = _585 != 0;
    float _589 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
    float _591 = _573;
    if (_533)
    {
        float _593 = -_563;
        float _595 = _567 ? _593 : _563;
        _569 = _595;
    }
    float _597 = _569;
    float _599 = -_199;
    int _601 = _567 ? as_type<int>(_599) : as_type<int>(_199);
    float _603 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
    float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_525)
    {
        _549 = _553;
    }
    float _607 = _549;
    float _609 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _611;
    float _615 = _607;
    float _617 = _553;
    if (_525)
    {
        float _619 = in.m_56.x;
        float _621 = in.m_56.y;
        _615 = _619;
        _617 = _621;
    }
    float _623 = _615;
    float _625 = _617;
    if (_525)
    {
        _591 = _625;
    }
    float _627 = _591;
    if (_525)
    {
        _571 = _625;
    }
    float _629 = _571;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _637 = _635 != 0;
    float _639 = _277 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _641 = _277 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _643 = _535 > 0.5;
    float _645 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].x, _639);
    float _647 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _649;
    bool _653 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = isnan(_517);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].z, _645);
    float _667 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _669 = _651 * _541;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _675 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_517);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_663;
    float _689 = _687 + 1.0;
    bool _691 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_517);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _673 * _555;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _707 = _517 + _705;
    float _709 = _685 * _689;
    float _711 = -_685;
    float _713 = _711 + 1.0;
    bool _715 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _717 = isnan(_517);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = _613 * _575;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _517 + _729;
    float _733 = _701 * _713;
    float _735 = -_701;
    float _737 = _735 + 1.0;
    float _739 = fma(_669, _707, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = fma(_703, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _743 = _725 * _737;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _747 = _517 + _745;
    float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _751 = -_725;
    float _753 = _751 + 1.0;
    float _755 = _739 * _743;
    bool _757 = !_587;
    float _759 = _757 ? _199 : as_type<float>(_601);
    float _761 = fma(_727, _747, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _763 = _625 > 0.5;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _767 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[115].x, _755);
    float _769 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[83].z, _765);
    float _771 = _623 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _775 = fma(_741, _733, _767);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _779 = -_773;
    float _781 = fma(_771, 2.0, _779);
    float _783 = fma(_761, _709, _775);
    float _785 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _789 = _609 + _787;
    float _791 = _749 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _793 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _797 = -_121;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[81].x, _781);
    float _801 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[83].w, _777);
    float _803 = _667 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _807 = _785 + _805;
    float _809 = _789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _811 = _597 + 0.5;
    float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _815 = fma(_793, -2.0, _795);
    float _817 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _821 = _803 + _819;
    float _823 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[28].x, _809);
    float _825 = -_189;
    int _827 = _643 ? as_type<int>(_825) : as_type<int>(_189);
    float _829 = fma(_791, _811, _799);
    float _831 = -_199;
    int _833 = _763 ? as_type<int>(_831) : as_type<int>(_199);
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _837 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _815);
    float _839 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _769);
    float _841 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _801);
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[28].z, _823);
    float _845 = _199 * _817;
    bool _847 = !_633;
    float _849 = _847 ? _189 : as_type<float>(_827);
    float _851 = -_759;
    float _853 = _851 + 0.5;
    float _855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _857 = !_637;
    float _859 = _857 ? _199 : as_type<float>(_833);
    float _861 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[118].x, _783);
    float _863 = _845;
    float _865 = _785;
    if (_579)
    {
        float _867 = -_845;
        float _869 = _561 ? _867 : _845;
        _863 = _869;
    }
    float _871 = _863;
    float _873 = _849 + 0.5;
    float _875 = _853 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _877 = -_859;
    float _879 = _877 + 0.5;
    float _881 = _813 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _885 = _871 + (-0.5);
    float _887 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _889 = _875 * _529;
    float _891 = _789 * _789;
    float _893 = _883 * _835;
    bool _895 = _843 >= 0.0;
    float _897 = -_881;
    float _899 = -_837;
    float _901 = fma(_897, _885, _899);
    float _903 = _887 * _855;
    float _905 = -_841;
    float _907 = _905 + 1.0;
    float _909 = -_189;
    int _911 = _763 ? as_type<int>(_909) : as_type<int>(_189);
    float _913 = fma(_807, _807, _891);
    float _915 = -_839;
    float _917 = _915 + 1.0;
    float _919 = fma(_907, _871, _901);
    bool _921 = !_583;
    float _923 = _921 ? _189 : as_type<float>(_911);
    float _925 = fma(_821, _821, _913);
    float _927 = -_917;
    float _929 = fma(_927, _597, _829);
    float _931 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _933 = rsqrt(_925);
    float _935 = _923 + 0.5;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _945 = _913;
    float _947 = _929;
    if (_895)
    {
        _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _949 = _945;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = _935 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _959 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _961 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _971 = as_type<int>(_949);
    if (_895)
    {
        float _973 = _949 * 5.0;
        _971 = as_type<int>(_973);
    }
    int _975 = _971;
    float _977 = _957 * _605;
    out.m_58.x = _959;
    out.m_58.y = _961;
    out.m_58.z = _963;
    out.m_58.w = _931;
    float _979 = _789 * _933;
    float _981 = _807 * _933;
    out.m_60.x = _965;
    out.m_60.y = _967;
    out.m_60.z = _969;
    out.m_60.w = _937;
    out.m_62.x = _893;
    out.m_62.y = _903;
    out.m_62.z = _929;
    out.m_62.w = _919;
    if (_895)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3276 = as_type<float>(_975);
        out.gl_Position.z = _3276;
    }
    out.m_64.x = _977;
    out.m_64.y = _889;
    if (_895)
    {
        out.m_47.x = 0.0;
    }
    if (_895)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _983 = -_979;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _609);
    float _987 = _821 * _933;
    float _989 = -_981;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _993 = -_979;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _985 + _997;
    float _1001 = -_987;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _803);
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1007 = _991 + _1005;
    float _1009 = -_981;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    float _1013 = _999 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _1003 + _1015;
    float _1019 = _995 * _995;
    float _1021 = -_987;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _821);
    float _1025 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    float _1027 = fma(_1011, _1011, _1019);
    float _1029 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    float _1031 = fma(_1023, _1023, _1027);
    bool _1033 = _1029 >= 0.0;
    float _1035 = sqrt(_1031);
    float _1037 = _987;
    float _1039 = _1003;
    float _1041 = _1017;
    if (_1033)
    {
        _947 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1043 = _947;
    int _1045 = as_type<int>(_1043);
    if (_1033)
    {
        out.m_47.x = 0.0;
    }
    float _1047 = _933 * _1035;
    if (_1033)
    {
        float _1049 = _1043 * 5.0;
        _1045 = as_type<int>(_1049);
    }
    int _1051 = _1045;
    if (_1033)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3414 = as_type<float>(_1051);
        out.gl_Position.z = _3414;
    }
    if (_1033)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1055 = _817 * _1047;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1059 = _521 * _1047;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = _1053 * _1055;
    float _1067 = _1057 * _1059;
    float _1069 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1075 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1069);
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1073);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1077);
    float _1085 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1079);
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1093 = _785 + _1087;
    float _1095 = _803 + _1089;
    float _1097 = _609 + _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1093 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = _1101 * _1101;
    float _1109 = _1105 * _1105;
    float _1111 = _1107 + _1109;
    float _1113 = sqrt(_1111);
    bool _1115 = _1113 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1117 = _1091;
    float _1119 = _1107;
    float _1121 = _1109;
    float _1123 = _1093;
    float _1125 = _1095;
    if (!_1115)
    {
        _1117 = _1107;
    }
    float _1127 = _1117;
    float _1129 = _1127;
    if (!_1115)
    {
        _1119 = _1097;
    }
    float _1131 = _1119;
    bool _1133 = !_1115;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1113 + _1139;
        float _1143 = _1097 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = rsqrt(_1111);
        float _1147 = _1141 * _1137;
        float _1149 = _1147 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = fma(_1153, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = _1145 * _1159;
        float _1163 = _1157 + (-1.0);
        float _1165 = fma(_1101, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_1105, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1173 = _1165 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1177 = _1167 + _1175;
        float _1179 = fma(_1097, _1157, _1169);
        float _1181 = _1173 * _1173;
        float _1183 = _1177 * _1177;
        _1135 = _1179;
        _1129 = _1181;
        _1121 = _1183;
        _1123 = _1165;
        _1125 = _1167;
    }
    float _1185 = _1135;
    float _1187 = _1129;
    float _1189 = _1121;
    float _1191 = _1123;
    float _1193 = _1125;
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1197 = _1185 + _1195;
    float _1199 = fma(_1197, _1197, _1187);
    float _1201 = _1199 + _1189;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1207 = isnan(_1203);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1213 = _1209 || _1211;
    float _1215 = _1187;
    if (!_1213)
    {
        _1215 = 1.0;
    }
    float _1217 = _1215;
    bool _1219 = !_1213;
    float _1221 = _1217;
    if (!_1219)
    {
        bool _1223 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1225 = isnan(_1203);
        bool _1227 = _1223 || _1225;
        bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1231 = _1227 || _1229;
        if (!_1231)
        {
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = _1203 + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1245 = 1.0 / _1239;
            float _1247 = _1235 * _1245;
            float _1249 = fma(_1247, _1243, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1221 = _1249;
            _1251 = true;
        }
        else
        {
            bool _1253 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1255 = isnan(_1203);
            bool _1257 = _1253 || _1255;
            bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1261 = _1257 || _1259;
            if (!_1261)
            {
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1203 + _1263;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1275 = 1.0 / _1269;
                float _1277 = _1265 * _1275;
                float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1221 = _1279;
                _1251 = true;
            }
            else
            {
                _1221 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1251 = false;
    float _1281 = _1221;
    float _1283 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1285 = _1185 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1289 = _1191 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1293 = _1193 + _1291;
    bool _1295 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    float _1305 = fma(_1285, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1289, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1293, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_979;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_981;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_987;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = _1317;
    float _1325 = _1321;
    if (_1303)
    {
        _1037 = _1313;
    }
    float _1327 = _1037;
    float _1329 = _1327;
    if (!_1303)
    {
        float _1331 = _999 * _999;
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1335 = -_803;
        float _1337 = _1335 + _1309;
        float _1339 = -_609;
        float _1341 = _1339 + _1305;
        float _1343 = fma(_1007, _1007, _1331);
        float _1345 = fma(_1017, _1017, _1343);
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1349 = sqrt(_1345);
        float _1351 = 1.0 / _1047;
        float _1353 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1355 = precise::min(_1349, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1333;
        float _1359 = -_785;
        float _1361 = _1359 + _1307;
        float _1363 = _1357 * _1351;
        float _1365 = _1353 * _1363;
        float _1367 = _1337 * _1363;
        float _1369 = fma(_1361, _1365, _991);
        float _1371 = fma(_1341, _1365, _985);
        float _1373 = fma(_1353, _1367, _1003);
        _1329 = _1371;
        _1323 = _1369;
        _1325 = _1373;
    }
    float _1375 = _1329;
    float _1377 = _1323;
    float _1379 = _1325;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1383 = _1375 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1387 = _1377 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = _1379 + _1389;
    float _1393 = _1383 * _1383;
    float _1395 = fma(_1387, _1387, _1393);
    float _1397 = fma(_1391, _1391, _1395);
    float _1399 = rsqrt(_1397);
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1387 * _1401;
    float _1405 = _1391 * _1401;
    float _1407 = _1403 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 + _1409;
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1399;
    float _1423 = _1419;
    float _1425 = _1383;
    float _1427 = _1401;
    float _1429 = _1403;
    if (_1415)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1431;
    }
    float _1433 = _1421;
    if (_1415)
    {
        float _1435 = rsqrt(_1411);
        _1039 = _1435;
    }
    float _1437 = _1039;
    float _1439 = _1437;
    if (_1415)
    {
        float _1441 = _1419 * _1433;
        _1423 = _1441;
    }
    float _1443 = _1423;
    if (_1415)
    {
        float _1445 = _1443 * 0.15915493667125701904296875;
        _1041 = _1445;
    }
    float _1447 = _1041;
    float _1449 = _1433;
    if (_1415)
    {
        float _1451 = _1447 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1449 = _1453;
    }
    float _1455 = _1449;
    float _1457 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1459 = precise::max(0.0, _1457);
    float _1461 = _1391;
    float _1463 = _1459;
    if (_1415)
    {
        float _1465 = _1447 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        _1461 = _1467;
    }
    float _1469 = _1461;
    float _1471 = -_1401;
    float _1473 = -_1459;
    float _1475 = fma(_1383, _1471, _1473);
    if (!_1415)
    {
        _1425 = _1405;
    }
    float _1477 = _1425;
    float _1479 = _1477;
    if (_1415)
    {
        float _1481 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1463 = _1481;
    }
    float _1483 = _1463;
    float _1485 = sqrt(_1397);
    float _1487 = _1455;
    float _1489 = _1483;
    if (_1415)
    {
        float _1491 = fma(_1455, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1487 = _1491;
    }
    float _1493 = _1487;
    float _1495 = _1493;
    if (_1415)
    {
        float _1497 = _1469 + (-1.0);
        _1489 = _1497;
    }
    float _1499 = _1489;
    float _1501 = _1499;
    if (_1415)
    {
        float _1503 = _1437 * _1493;
        _865 = _1503;
    }
    float _1505 = _865;
    if (!_1415)
    {
        _1439 = _1475;
    }
    float _1507 = _1439;
    float _1509 = _1507;
    if (_1415)
    {
        float _1511 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1511;
    }
    float _1513 = _1427;
    if (_1415)
    {
        float _1515 = _1403 * _1505;
        _1429 = _1515;
    }
    float _1517 = _1429;
    if (!_1415)
    {
        _1495 = _1407;
    }
    float _1519 = _1495;
    float _1521 = _1519;
    if (_1415)
    {
        float _1523 = _1405 * _1505;
        _1479 = _1523;
    }
    float _1525 = _1479;
    if (_1415)
    {
        float _1527 = fma(_1475, _1469, _1513);
        _1509 = _1527;
    }
    float _1529 = _1509;
    if (_1415)
    {
        float _1531 = _1517 * _1517;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (!_1415)
    {
        _1501 = _1409;
    }
    float _1535 = _1501;
    float _1537 = _1535;
    if (_1415)
    {
        float _1539 = _1525 * _1525;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_1529, _1529, _1533);
    float _1545 = _1543 + _1541;
    float _1547 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1485, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1557 = rsqrt(_1545);
    float _1559 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1547);
    float _1561 = -_1553;
    float _1563 = _1561 + 1.0;
    float _1565 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1567 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1569 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1573 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1565);
    float _1575 = abs(_1563);
    float _1577 = log2(_1575);
    float _1579 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1581 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1567);
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1573);
    float _1585 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1571);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1589 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1591 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = _1557 * _1517;
    float _1595 = -_1587;
    float _1597 = fma(_1595, _1555, 1.0);
    float _1599 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1585);
    float _1601 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1605 = _1557 * _1529;
    float _1607 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1609 = _1557 * _1525;
    float _1611 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1603);
    float _1613 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1615 = -_1607;
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1615);
    float _1619 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1621 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1623 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1625 = -_1609;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1617);
    float _1629 = exp2(_1613);
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1621);
    float _1633 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1635 = fma(_1627, -0.5, 0.5);
    float _1637 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1623);
    float _1639 = fma(_1627, 0.5, 0.5);
    float _1641 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1633);
    float _1643 = _1605 + 1.0;
    float _1645 = log2(_1597);
    float _1647 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1637);
    float _1649 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1641);
    float _1651 = fma(_1639, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1653 = fma(_1639, _1651, -0.212114393711090087890625);
    float _1655 = 1.0 / _1631;
    float _1657 = -_1605;
    float _1659 = fma(_1629, _1643, _1657);
    float _1661 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1647);
    float _1663 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float _1665 = fma(_1639, _1653, 1.570728778839111328125);
    float _1667 = sqrt(_1635);
    float _1669 = _1645 * 0.693147182464599609375;
    float _1671 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1673 = _1661 * _1655;
    float _1675 = _1663 * _1655;
    float _1677 = fma(_1673, 0.5, 0.5);
    float _1679 = fma(_1675, -0.5, 0.5);
    float _1681 = fma(_1659, 0.5, 0.5);
    float _1683 = _1667 * 0.636619746685028076171875;
    float3 _4464 = float3(_1677, _1679, _1671);
    float _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).x;
    float3 _4475 = float3(_1677, _1679, _1671);
    float4 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4475, float3(0.0), isnan(_4475)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4475, float3(0.0), isnan(_4475)), level(0.0)).xyzw;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = _1688.w;
    float _1698 = -_1665;
    float _1700 = fma(_1683, _1698, 1.0);
    float2 _4497 = float2(_1700, _1681);
    float3 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4497, float2(0.0), isnan(_4497)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4497, float2(0.0), isnan(_4497)), level(0.0)).xyz;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1714 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1716 = _1661 + _1631;
    float _1718 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1712);
    float _1720 = _1716 * 0.5;
    float _1722 = exp2(_1714);
    float _1724 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1718);
    float _1726 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1728 = _1631 * 0.5;
    float _1730 = _1726 + _1631;
    float _1732 = -_1722;
    float _1734 = _1732 + 1.0;
    float _1736 = fma(_1663, -0.5, _1728);
    float _1738 = _1730 * 0.5;
    float _1740 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1661;
    out.gl_Position.y = _1663;
    out.gl_Position.z = _1726;
    out.gl_Position.w = _1631;
    float _1742 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_66.x = _1720;
    out.m_66.y = _1736;
    out.m_66.z = _1738;
    out.m_66.w = _1631;
    out.m_47.x = _1742;
    float _1744 = _1740 * _1685;
    float _1746 = -_1740;
    float _1748 = _1746 + 1.0;
    float _1750 = _1696 * _1744;
    float _1752 = _1710 * _1744;
    float _1754 = fma(_1706, _1750, _1690);
    float _1756 = fma(_1708, _1750, _1692);
    float _1758 = _1696 * _1748;
    float _1760 = fma(_1696, _1752, _1694);
    out.m_68.x = _1754;
    out.m_68.y = _1756;
    out.m_68.z = _1760;
    out.m_68.w = _1758;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

