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
    float4 m_64 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1321 = false;
    bool _505 = false;
    bool _303 = false;
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
        float _1825 = as_type<float>(_103);
        out.gl_Position.z = _1825;
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
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1895 = as_type<float>(_141);
        out.gl_Position.z = _1895;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_157;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _145 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _173 = _259;
    }
    float _261 = _173;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _159, _265);
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_271, _147, _165);
    float _279 = fma(_273, _147, _167);
    float _281 = fma(_275, _147, _169);
    bool _283 = !_263;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_87);
        float _307 = 1.0 / _305;
        float _309 = _121 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = 1.0 / _327;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _337 = 1.0 / _323;
    float _339 = 1.0 / _331;
    float _341 = _315 * _337;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _311 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = _345 * _333;
    bool _353 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_311);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = _319 * _339;
    bool _371 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_311);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = fma(_349, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = -_363;
    float _387 = _385 + 1.0;
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = fma(_367, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _403 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_311);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _381 * _387;
    float _417 = -_381;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = -_399;
    float _431 = _429 + 1.0;
    float _433 = _399 * _419;
    float _435 = fma(_423, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _437 = fma(_427, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = _413 * _431;
    float _441 = in.m_54.x;
    float _443 = in.m_54.y;
    float _445 = -_413;
    float _447 = _445 + 1.0;
    float _449 = _383 * _439;
    float _451 = _401 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _465 = fma(_455, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_459, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_435, _433, _461);
    float _471 = fma(_437, _433, _463);
    float _473 = fma(_465, _415, _469);
    float _475 = fma(_467, _415, _471);
    float _477 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _473);
    float _479 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _475);
    float _481 = _477 * _441;
    float _483 = _479 * _443;
    bool _485 = !_335;
    float _503;
    if (!_485)
    {
        float _487 = in.m_56.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_87);
        float _509 = 1.0 / _507;
        float _511 = _121 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _517 = log2(_515);
    float _519 = in.m_56.z;
    float _521 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _523 = in.m_56.x;
    float _525 = in.m_56.y;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _529 = _527 != 0;
    float _531 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _535 = _533 != 0;
    float _537 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _545 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _557 = _555 != 0;
    float _559 = 1.0 / _541;
    float _561 = _517 * _121;
    float _563 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
    float _565 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
    float _567 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
    float _569 = exp2(_561);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _573 = 1.0 + _571;
    float _575 = _519 * 2.0;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _593 = 1.0 / _573;
    float _595 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].z, _563);
    bool _597 = _523 > 0.5;
    float _599 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _525 + _519;
    float _607 = floor(_575);
    float _609 = -_197;
    int _611 = _597 ? as_type<int>(_609) : as_type<int>(_197);
    float _613 = -_569;
    float _615 = _613 + 1.0;
    bool _617 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _625 = _621 || _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _627;
    float _631 = _605 + (-1.0);
    out.m_58.x = _599;
    out.m_58.y = _601;
    out.m_58.z = _603;
    float _633 = _625 ? _615 : 0.0;
    float _635 = _629 * _559;
    bool _637 = _525 > 0.5;
    float _639 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _513 + _641;
    if (_585)
    {
        float _645 = _633 * _593;
        _123 = _645;
    }
    float _647 = _123;
    float _649 = -_201;
    int _651 = _637 ? as_type<int>(_649) : as_type<int>(_201);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _607 > 0.0;
    float _657 = fma(_635, _643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _659 = _607 >= 0.0;
    bool _661 = isnan(_607);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = _525 + _523;
    bool _671 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _673 = isnan(_513);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _523 * 2.0;
    bool _685 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _687 = isnan(_513);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = _669 + (-1.0);
    float _699 = _525 * 2.0;
    float _701 = floor(_683);
    float _703 = -_681;
    float _705 = _703 + 1.0;
    float _707 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _709 = !_529;
    float _711 = _709 ? _197 : as_type<float>(_611);
    float _713 = _695 * _705;
    float _715 = -_695;
    float _717 = _715 + 1.0;
    bool _719 = !_535;
    float _721 = _719 ? _201 : as_type<float>(_651);
    float _723 = floor(_699);
    float _725 = _657 * _713;
    float _727 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _729 = _667 ? 0 : 1;
    float _731 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[115].x, _725);
    float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _737 = _707 + _735;
    float _739 = _711 + 0.5;
    float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _743 = _701 > 0.0;
    float _745 = -_721;
    float _747 = _745 + 0.5;
    bool _749 = _701 >= 0.0;
    bool _751 = isnan(_701);
    bool _753 = _749 || _751;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    float _759 = _595 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _731 + _761;
    float _765 = _737 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _767 = _757 ? 0 : 1;
    float _769 = _739 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _771 = _723 > 0.0;
    float _773 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _775 = ~_729;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = _737 * _737;
    int _783 = _779;
    if (!_655)
    {
        int _785 = ~_729;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _793 = _759 + _791;
    bool _795 = _723 >= 0.0;
    bool _797 = isnan(_723);
    bool _799 = _795 || _797;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[28].x, _765);
    int _807 = ~_767;
    int _809 = _807 + 1;
    int _811 = _809 + 1;
    float _813 = _769 * _653;
    int _815 = _811;
    if (!_743)
    {
        int _817 = ~_767;
        int _819 = _817 + 1;
        _815 = _819;
    }
    int _821 = _815;
    float _823 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[116].x, _733);
    float _825 = _773 * _741;
    float _827 = fma(_763, _763, _781);
    float _829 = in.m_60.x;
    float _831 = in.m_60.y;
    float _833 = in.m_60.z;
    int _835 = _803 ? 0 : 1;
    float _837 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[28].z, _805);
    bool _839 = !_549;
    int _841 = _839 ? 0 : 1;
    float _843 = fma(_793, _793, _827);
    int _845 = ~_835;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    out.m_62.x = _813;
    out.m_62.y = _825;
    int _851 = _849;
    if (!_771)
    {
        int _853 = ~_835;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _861 = !_553;
    int _863 = _861 ? 0 : 1;
    float _865 = rsqrt(_843);
    bool _867 = _837 >= 0.0;
    int _869 = abs(_841);
    int _871 = abs(_863);
    float _873 = float(_869);
    float _875 = float(_789);
    float _877 = float(_871);
    float _879 = float(_821);
    float _881 = _873 * _875;
    float _883 = _737 * _865;
    float _885 = _877 * _879;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = _877;
    if (_867)
    {
        _889 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _891 = _889;
    float _893 = _881 * (-2.0);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _523 + (-0.5);
    float _903 = fma(_893, _829, _829);
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _909 = as_type<int>(_891);
    if (_867)
    {
        float _911 = _891 * 5.0;
        _909 = as_type<int>(_911);
    }
    int _913 = _909;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    float _917 = _763 * _865;
    float _919 = -_883;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    out.m_64.x = _905;
    out.m_64.y = _907;
    out.m_64.z = _899;
    out.m_64.w = _859;
    float _923 = fma(_727, _893, _727);
    float _925 = -_917;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    if (_867)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3125 = as_type<float>(_913);
        out.gl_Position.z = _3125;
    }
    if (_867)
    {
        out.m_47.x = 0.0;
    }
    bool _929 = !_557;
    int _931 = _929 ? 0 : 1;
    float _933 = _921 * _921;
    if (_867)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _935 = -_883;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _707);
    float _939 = -_917;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    float _943 = fma(_927, _927, _933);
    float _945 = _793 * _865;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _953 = _941 + _951;
    int _955 = abs(_931);
    float _957 = -_945;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _961 = _949 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _963 = _519 + _523;
    float _965 = float(_955);
    float _967 = fma(_959, _959, _943);
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].x, _961);
    float _971 = -_945;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _975 = float(_857);
    float _977 = _963 + (-1.0);
    float _979 = _885 * (-2.0);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _973 + _981;
    float _985 = _525 + (-0.5);
    float _987 = _965 * _975;
    float _989 = fma(_979, _831, _831);
    float _991 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _969);
    float _993 = _519 + (-0.5);
    float _995 = _987 * (-2.0);
    float _997 = fma(_639, _979, _639);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[196].y, _989);
    bool _1001 = _991 >= 0.0;
    float _1003 = fma(_923, _647, _915);
    float _1005 = fma(_997, _647, _999);
    float _1007 = sqrt(_967);
    float _1009 = _1003 * 0.15915493667125701904296875;
    float _1011 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1013 = fma(_995, _833, _833);
    float _1015 = _1005 * 0.15915493667125701904296875;
    float _1017 = fma(_1011, _995, _1011);
    float _1019 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    float _1021 = _969;
    if (_1001)
    {
        _1021 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1023 = _1021;
    float _1025 = _1009 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    int _1029 = as_type<int>(_1023);
    if (_1001)
    {
        out.m_47.x = 0.0;
    }
    float _1031 = fma(_1017, _647, _1019);
    if (_1001)
    {
        float _1033 = _1023 * 5.0;
        _1029 = as_type<int>(_1033);
    }
    int _1035 = _1029;
    float _1037 = _1031 * 0.15915493667125701904296875;
    float _1039 = _865 * _1007;
    float _1041 = _1009 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    if (_1001)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3328 = as_type<float>(_1035);
        out.gl_Position.z = _3328;
    }
    float _1045 = _1015 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1015 * 6.283185482025146484375;
    float _1051 = cos(_1049);
    float _1053 = _1037 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    if (_1001)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1057 = _1037 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1065 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1067 = _1027 * _1047;
    float _1069 = _1039 * _1061;
    float _1071 = _1043 * _1051;
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1075 = _1039 * _1065;
    float _1077 = _1063 * _1069;
    float _1079 = fma(_1055, _1071, _1067);
    float _1081 = _1043 * _1047;
    float _1083 = _1073 * _1075;
    float _1085 = _1027 * _1051;
    float _1087 = _1059 * _1077;
    float _1089 = _1047 * _1059;
    float _1091 = _1051 * _1059;
    float _1093 = -_1077;
    float _1095 = _1055 * _1093;
    float _1097 = _1043 * _1087;
    float _1099 = _1027 * _1087;
    float _1101 = fma(_1091, _1083, _1095);
    float _1103 = fma(_1079, _1083, _1097);
    float _1105 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1107 = _1105 * 0.5;
    float _1109 = -_1085;
    float _1111 = fma(_1055, _1081, _1109);
    float _1113 = -_1081;
    float _1115 = fma(_1055, _1085, _1113);
    float _1117 = fma(_1055, _1067, _1071);
    float _1119 = fma(_1089, _1107, _1101);
    float _1121 = fma(_1111, _1107, _1103);
    float _1123 = fma(_1115, _1083, _1099);
    float _1125 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1129 = fma(_1117, _1107, _1123);
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1133 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1127);
    float _1135 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1137 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1139 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1143 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1145 = _731 + _1139;
    float _1147 = _759 + _1141;
    float _1149 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1143);
    float _1151 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1153 = _1145 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1157 = _1147 + _1155;
    float _1159 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1161 = _1153 * _1153;
    float _1163 = _1157 * _1157;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1167 = _1161 + _1163;
    float _1169 = _707 + _1165;
    float _1171 = sqrt(_1167);
    bool _1173 = _1171 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1165;
    float _1177 = _1129;
    float _1179 = _1145;
    float _1181 = _1161;
    float _1183 = _1163;
    float _1185 = _1087;
    if (!_1173)
    {
        _1175 = _1161;
    }
    float _1187 = _1175;
    float _1189 = _1187;
    if (!_1173)
    {
        _1177 = _1145;
    }
    float _1191 = _1177;
    float _1193 = _1191;
    if (!_1173)
    {
        _1179 = _1147;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (!_1173)
    {
        _1181 = _1169;
    }
    float _1199 = _1181;
    bool _1201 = !_1173;
    float _1203 = _1199;
    if (!_1201)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1171 + _1207;
        float _1211 = rsqrt(_1167);
        float _1213 = _1209 * _1205;
        float _1215 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1211 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1153, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1157, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1241 = _1233 + _1239;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1245 = _1235 + _1243;
        float _1247 = fma(_1169, _1225, _1237);
        float _1249 = _1241 * _1241;
        float _1251 = _1245 * _1245;
        _1203 = _1247;
        _1189 = _1249;
        _1183 = _1251;
        _1193 = _1233;
        _1197 = _1235;
    }
    float _1253 = _1203;
    float _1255 = _1189;
    float _1257 = _1183;
    float _1259 = _1193;
    float _1261 = _1197;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1265 = _1253 + _1263;
    float _1267 = fma(_1265, _1265, _1255);
    float _1269 = _1267 + _1257;
    float _1271 = sqrt(_1269);
    bool _1273 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1275 = isnan(_1271);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1281 = _1277 || _1279;
    float _1283 = _1255;
    float _1285 = _1267;
    if (!_1281)
    {
        _1283 = 1.0;
    }
    float _1287 = _1283;
    bool _1289 = !_1281;
    float _1291 = _1287;
    if (!_1289)
    {
        bool _1293 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1295 = isnan(_1271);
        bool _1297 = _1293 || _1295;
        bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1301 = _1297 || _1299;
        if (!_1301)
        {
            float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1305 = _1271 + _1303;
            float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1309 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1307;
            float _1311 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1313 = _1311 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1315 = 1.0 / _1309;
            float _1317 = _1305 * _1315;
            float _1319 = fma(_1317, _1313, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1291 = _1319;
            _1285 = _1313;
            _1321 = true;
        }
        else
        {
            bool _1323 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1325 = isnan(_1271);
            bool _1327 = _1323 || _1325;
            bool _1329 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1331 = _1327 || _1329;
            if (!_1331)
            {
                float _1333 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1335 = _1271 + _1333;
                float _1337 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1339 = _1337 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1341 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1343 = _1341 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1345 = 1.0 / _1339;
                float _1347 = _1335 * _1345;
                float _1349 = fma(_1347, _1343, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1291 = _1349;
                _1285 = _1343;
                _1321 = true;
            }
            else
            {
                _1291 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1321 = false;
    float _1351 = _1291;
    float _1353 = _1285;
    float _1355 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1357 = _1253 + _1355;
    float _1359 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1361 = _1259 + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1365 = _1261 + _1363;
    float _1367 = fma(_1357, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1369 = fma(_1361, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1373 = -_883;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1367);
    float _1377 = -_917;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1369);
    float _1381 = -_945;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1387 = _1375 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1391 = _1379 + _1389;
    float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1395 = _1383 + _1393;
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1391, _1391, _1397);
    float _1401 = fma(_1395, _1395, _1399);
    float _1403 = rsqrt(_1401);
    float _1405 = sqrt(_1401);
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1391 * _1407;
    float _1411 = _1395 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1271;
    float _1429 = _1403;
    float _1431 = _1425;
    float _1433 = _1387;
    float _1435 = _1409;
    if (_1421)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1421)
    {
        float _1441 = rsqrt(_1417);
        _1429 = _1441;
    }
    float _1443 = _1429;
    float _1445 = _1439;
    float _1447 = _1443;
    if (_1421)
    {
        float _1449 = _1425 * _1439;
        _1431 = _1449;
    }
    float _1451 = _1431;
    if (_1421)
    {
        float _1453 = _1451 * 0.15915493667125701904296875;
        _1445 = _1453;
    }
    float _1455 = _1445;
    float _1457 = _1395;
    float _1459 = _1455;
    if (_1421)
    {
        float _1461 = _1455 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1457 = _1463;
    }
    float _1465 = _1457;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1353;
    float _1473 = _1469;
    if (_1421)
    {
        float _1475 = _1455 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1407;
    float _1483 = -_1469;
    float _1485 = fma(_1387, _1481, _1483);
    if (_1421)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1487;
    }
    float _1489 = _1433;
    float _1491 = _1489;
    float _1493 = _1465;
    if (_1421)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    float _1499 = _1497;
    if (!_1421)
    {
        _1493 = _1411;
    }
    float _1501 = _1493;
    float _1503 = _1501;
    if (_1421)
    {
        float _1505 = _1479 + (-1.0);
        _1473 = _1505;
    }
    float _1507 = _1473;
    float _1509 = _1507;
    if (_1421)
    {
        float _1511 = _1443 * _1497;
        _1185 = _1511;
    }
    float _1513 = _1185;
    if (!_1421)
    {
        _1447 = _1485;
    }
    float _1515 = _1447;
    float _1517 = _1515;
    if (_1421)
    {
        float _1519 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1519;
    }
    float _1521 = _1459;
    if (_1421)
    {
        float _1523 = _1409 * _1513;
        _1435 = _1523;
    }
    float _1525 = _1435;
    if (!_1421)
    {
        _1499 = _1413;
    }
    float _1527 = _1499;
    float _1529 = _1527;
    if (_1421)
    {
        float _1531 = _1411 * _1513;
        _1503 = _1531;
    }
    float _1533 = _1503;
    if (_1421)
    {
        float _1535 = fma(_1485, _1479, _1521);
        _1517 = _1535;
    }
    float _1537 = _1517;
    if (_1421)
    {
        float _1539 = _1525 * _1525;
        _1529 = _1539;
    }
    float _1541 = _1529;
    if (!_1421)
    {
        _1509 = _1415;
    }
    float _1543 = _1509;
    float _1545 = _1543;
    if (_1421)
    {
        float _1547 = _1533 * _1533;
        _1545 = _1547;
    }
    float _1549 = _1545;
    float _1551 = fma(_1537, _1537, _1541);
    float _1553 = _1551 + _1549;
    float _1555 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1559 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1557);
    float _1561 = precise::clamp(_1559, 0.0, 1.0);
    float _1563 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1567 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1569 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1571 = rsqrt(_1553);
    float _1573 = -_1561;
    float _1575 = _1573 + 1.0;
    float _1577 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1567);
    float _1579 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1569);
    float _1581 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1563);
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1579);
    float _1589 = abs(_1575);
    float _1591 = log2(_1589);
    float _1593 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1581);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1597 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1583);
    float _1599 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1593);
    float _1603 = -_1595;
    float _1605 = fma(_1603, _1565, 1.0);
    float _1607 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1609 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1611 = _1571 * _1525;
    float _1613 = _1571 * _1533;
    float _1615 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1617 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1609);
    float _1619 = _1571 * _1537;
    float _1621 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1623 = log2(_1605);
    float _1625 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1627 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1629 = -_1621;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1635 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1637 = -_1613;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1641 = exp2(_1627);
    float _1643 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1645 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1633);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1639, 0.5, 0.5);
    float _1651 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1643);
    float _1653 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1645);
    float _1655 = _1619 + 1.0;
    float _1657 = 1.0 / _1635;
    float _1659 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1661 = fma(_1649, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1663 = _1623 * 0.693147182464599609375;
    float _1665 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1659);
    float _1667 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1653);
    float _1669 = fma(_1649, _1661, -0.212114393711090087890625);
    float _1671 = sqrt(_1647);
    float _1673 = -_1619;
    float _1675 = fma(_1641, _1655, _1673);
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1679 = fma(_1649, _1669, 1.570728778839111328125);
    float _1681 = fma(_1675, 0.5, 0.5);
    float _1683 = _1665 * _1657;
    float _1685 = _1667 * _1657;
    float _1687 = fma(_1683, 0.5, 0.5);
    float _1689 = fma(_1685, -0.5, 0.5);
    float _1691 = _1671 * 0.636619746685028076171875;
    float3 _4395 = float3(_1687, _1689, _1677);
    float _1693 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4395, float3(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4395, float3(0.0), isnan(_4395)), level(0.0)).x;
    float3 _4406 = float3(_1687, _1689, _1677);
    float4 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4406, float3(0.0), isnan(_4406)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4406, float3(0.0), isnan(_4406)), level(0.0)).xyzw;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = _1696.w;
    float _1706 = -_1679;
    float _1708 = fma(_1691, _1706, 1.0);
    float2 _4428 = float2(_1708, _1681);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4428, float2(0.0), isnan(_4428)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4428, float2(0.0), isnan(_4428)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1722 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1724 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    float _1726 = exp2(_1720);
    float _1728 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1724);
    float _1730 = _1665 + _1635;
    float _1732 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1728);
    float _1734 = _1730 * 0.5;
    float _1736 = _1635 * 0.5;
    float _1738 = _1732 + _1635;
    out.gl_Position.x = _1665;
    out.gl_Position.y = _1667;
    out.gl_Position.z = _1732;
    out.gl_Position.w = _1635;
    float _1740 = fma(_1667, -0.5, _1736);
    float _1742 = _1738 * 0.5;
    float _1744 = -_1726;
    float _1746 = _1744 + 1.0;
    float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _1734;
    out.m_66.y = _1740;
    out.m_66.z = _1742;
    out.m_66.w = _1635;
    float _1750 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1750;
    float _1752 = _1748 * _1693;
    float _1754 = -_1748;
    float _1756 = _1754 + 1.0;
    float _1758 = _1704 * _1752;
    float _1760 = _1718 * _1752;
    float _1762 = fma(_1714, _1758, _1698);
    float _1764 = fma(_1716, _1758, _1700);
    float _1766 = _1704 * _1756;
    float _1768 = fma(_1704, _1760, _1702);
    out.m_68.x = _1762;
    out.m_68.y = _1764;
    out.m_68.z = _1768;
    out.m_68.w = _1766;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1321 = false;
    bool _505 = false;
    bool _303 = false;
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
        float _1825 = as_type<float>(_103);
        out.gl_Position.z = _1825;
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
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1895 = as_type<float>(_141);
        out.gl_Position.z = _1895;
    }
    if (_133)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_157;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _145 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _173 = _259;
    }
    float _261 = _173;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _159, _265);
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_271, _147, _165);
    float _279 = fma(_273, _147, _167);
    float _281 = fma(_275, _147, _169);
    bool _283 = !_263;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_87);
        float _307 = 1.0 / _305;
        float _309 = _121 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = 1.0 / _327;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _337 = 1.0 / _323;
    float _339 = 1.0 / _331;
    float _341 = _315 * _337;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _311 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = _345 * _333;
    bool _353 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_311);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = _319 * _339;
    bool _371 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_311);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = fma(_349, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = -_363;
    float _387 = _385 + 1.0;
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = fma(_367, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _403 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_311);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _381 * _387;
    float _417 = -_381;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = -_399;
    float _431 = _429 + 1.0;
    float _433 = _399 * _419;
    float _435 = fma(_423, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _437 = fma(_427, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = _413 * _431;
    float _441 = in.m_54.x;
    float _443 = in.m_54.y;
    float _445 = -_413;
    float _447 = _445 + 1.0;
    float _449 = _383 * _439;
    float _451 = _401 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _465 = fma(_455, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_459, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_435, _433, _461);
    float _471 = fma(_437, _433, _463);
    float _473 = fma(_465, _415, _469);
    float _475 = fma(_467, _415, _471);
    float _477 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _473);
    float _479 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _475);
    float _481 = _477 * _441;
    float _483 = _479 * _443;
    bool _485 = !_335;
    float _503;
    if (!_485)
    {
        float _487 = in.m_56.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_87);
        float _509 = 1.0 / _507;
        float _511 = _121 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _517 = log2(_515);
    float _519 = in.m_56.z;
    float _521 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _523 = in.m_56.x;
    float _525 = in.m_56.y;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _529 = _527 != 0;
    float _531 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _535 = _533 != 0;
    float _537 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _545 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _557 = _555 != 0;
    float _559 = 1.0 / _541;
    float _561 = _517 * _121;
    float _563 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
    float _565 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
    float _567 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
    float _569 = exp2(_561);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _573 = 1.0 + _571;
    float _575 = _519 * 2.0;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _593 = 1.0 / _573;
    float _595 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].z, _563);
    bool _597 = _523 > 0.5;
    float _599 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _525 + _519;
    float _607 = floor(_575);
    float _609 = -_197;
    int _611 = _597 ? as_type<int>(_609) : as_type<int>(_197);
    float _613 = -_569;
    float _615 = _613 + 1.0;
    bool _617 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _625 = _621 || _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _627;
    float _631 = _605 + (-1.0);
    out.m_58.x = _599;
    out.m_58.y = _601;
    out.m_58.z = _603;
    float _633 = _625 ? _615 : 0.0;
    float _635 = _629 * _559;
    bool _637 = _525 > 0.5;
    float _639 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _513 + _641;
    if (_585)
    {
        float _645 = _633 * _593;
        _123 = _645;
    }
    float _647 = _123;
    float _649 = -_201;
    int _651 = _637 ? as_type<int>(_649) : as_type<int>(_201);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _607 > 0.0;
    float _657 = fma(_635, _643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _659 = _607 >= 0.0;
    bool _661 = isnan(_607);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = _525 + _523;
    bool _671 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _673 = isnan(_513);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _523 * 2.0;
    bool _685 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _687 = isnan(_513);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = _669 + (-1.0);
    float _699 = _525 * 2.0;
    float _701 = floor(_683);
    float _703 = -_681;
    float _705 = _703 + 1.0;
    float _707 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _709 = !_529;
    float _711 = _709 ? _197 : as_type<float>(_611);
    float _713 = _695 * _705;
    float _715 = -_695;
    float _717 = _715 + 1.0;
    bool _719 = !_535;
    float _721 = _719 ? _201 : as_type<float>(_651);
    float _723 = floor(_699);
    float _725 = _657 * _713;
    float _727 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _729 = _667 ? 0 : 1;
    float _731 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[115].x, _725);
    float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _737 = _707 + _735;
    float _739 = _711 + 0.5;
    float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _743 = _701 > 0.0;
    float _745 = -_721;
    float _747 = _745 + 0.5;
    bool _749 = _701 >= 0.0;
    bool _751 = isnan(_701);
    bool _753 = _749 || _751;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    float _759 = _595 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _731 + _761;
    float _765 = _737 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _767 = _757 ? 0 : 1;
    float _769 = _739 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _771 = _723 > 0.0;
    float _773 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _775 = ~_729;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = _737 * _737;
    int _783 = _779;
    if (!_655)
    {
        int _785 = ~_729;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _793 = _759 + _791;
    bool _795 = _723 >= 0.0;
    bool _797 = isnan(_723);
    bool _799 = _795 || _797;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[28].x, _765);
    int _807 = ~_767;
    int _809 = _807 + 1;
    int _811 = _809 + 1;
    float _813 = _769 * _653;
    int _815 = _811;
    if (!_743)
    {
        int _817 = ~_767;
        int _819 = _817 + 1;
        _815 = _819;
    }
    int _821 = _815;
    float _823 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[116].x, _733);
    float _825 = _773 * _741;
    float _827 = fma(_763, _763, _781);
    float _829 = in.m_60.x;
    float _831 = in.m_60.y;
    float _833 = in.m_60.z;
    int _835 = _803 ? 0 : 1;
    float _837 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[28].z, _805);
    bool _839 = !_549;
    int _841 = _839 ? 0 : 1;
    float _843 = fma(_793, _793, _827);
    int _845 = ~_835;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    out.m_62.x = _813;
    out.m_62.y = _825;
    int _851 = _849;
    if (!_771)
    {
        int _853 = ~_835;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _861 = !_553;
    int _863 = _861 ? 0 : 1;
    float _865 = rsqrt(_843);
    bool _867 = _837 >= 0.0;
    int _869 = abs(_841);
    int _871 = abs(_863);
    float _873 = float(_869);
    float _875 = float(_789);
    float _877 = float(_871);
    float _879 = float(_821);
    float _881 = _873 * _875;
    float _883 = _737 * _865;
    float _885 = _877 * _879;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = _877;
    if (_867)
    {
        _889 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _891 = _889;
    float _893 = _881 * (-2.0);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _523 + (-0.5);
    float _903 = fma(_893, _829, _829);
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _909 = as_type<int>(_891);
    if (_867)
    {
        float _911 = _891 * 5.0;
        _909 = as_type<int>(_911);
    }
    int _913 = _909;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    float _917 = _763 * _865;
    float _919 = -_883;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    out.m_64.x = _905;
    out.m_64.y = _907;
    out.m_64.z = _899;
    out.m_64.w = _859;
    float _923 = fma(_727, _893, _727);
    float _925 = -_917;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    if (_867)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3125 = as_type<float>(_913);
        out.gl_Position.z = _3125;
    }
    if (_867)
    {
        out.m_47.x = 0.0;
    }
    bool _929 = !_557;
    int _931 = _929 ? 0 : 1;
    float _933 = _921 * _921;
    if (_867)
    {
        return out;
    }
    float _935 = -_883;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _707);
    float _939 = -_917;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    float _943 = fma(_927, _927, _933);
    float _945 = _793 * _865;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _953 = _941 + _951;
    int _955 = abs(_931);
    float _957 = -_945;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _961 = _949 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _963 = _519 + _523;
    float _965 = float(_955);
    float _967 = fma(_959, _959, _943);
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].x, _961);
    float _971 = -_945;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _975 = float(_857);
    float _977 = _963 + (-1.0);
    float _979 = _885 * (-2.0);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _973 + _981;
    float _985 = _525 + (-0.5);
    float _987 = _965 * _975;
    float _989 = fma(_979, _831, _831);
    float _991 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _969);
    float _993 = _519 + (-0.5);
    float _995 = _987 * (-2.0);
    float _997 = fma(_639, _979, _639);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[196].y, _989);
    bool _1001 = _991 >= 0.0;
    float _1003 = fma(_923, _647, _915);
    float _1005 = fma(_997, _647, _999);
    float _1007 = sqrt(_967);
    float _1009 = _1003 * 0.15915493667125701904296875;
    float _1011 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1013 = fma(_995, _833, _833);
    float _1015 = _1005 * 0.15915493667125701904296875;
    float _1017 = fma(_1011, _995, _1011);
    float _1019 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    float _1021 = _969;
    if (_1001)
    {
        _1021 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1023 = _1021;
    float _1025 = _1009 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    int _1029 = as_type<int>(_1023);
    if (_1001)
    {
        out.m_47.x = 0.0;
    }
    float _1031 = fma(_1017, _647, _1019);
    if (_1001)
    {
        float _1033 = _1023 * 5.0;
        _1029 = as_type<int>(_1033);
    }
    int _1035 = _1029;
    float _1037 = _1031 * 0.15915493667125701904296875;
    float _1039 = _865 * _1007;
    float _1041 = _1009 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    if (_1001)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3328 = as_type<float>(_1035);
        out.gl_Position.z = _3328;
    }
    float _1045 = _1015 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1015 * 6.283185482025146484375;
    float _1051 = cos(_1049);
    float _1053 = _1037 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    if (_1001)
    {
        return out;
    }
    float _1057 = _1037 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1065 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1067 = _1027 * _1047;
    float _1069 = _1039 * _1061;
    float _1071 = _1043 * _1051;
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1075 = _1039 * _1065;
    float _1077 = _1063 * _1069;
    float _1079 = fma(_1055, _1071, _1067);
    float _1081 = _1043 * _1047;
    float _1083 = _1073 * _1075;
    float _1085 = _1027 * _1051;
    float _1087 = _1059 * _1077;
    float _1089 = _1047 * _1059;
    float _1091 = _1051 * _1059;
    float _1093 = -_1077;
    float _1095 = _1055 * _1093;
    float _1097 = _1043 * _1087;
    float _1099 = _1027 * _1087;
    float _1101 = fma(_1091, _1083, _1095);
    float _1103 = fma(_1079, _1083, _1097);
    float _1105 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1107 = _1105 * 0.5;
    float _1109 = -_1085;
    float _1111 = fma(_1055, _1081, _1109);
    float _1113 = -_1081;
    float _1115 = fma(_1055, _1085, _1113);
    float _1117 = fma(_1055, _1067, _1071);
    float _1119 = fma(_1089, _1107, _1101);
    float _1121 = fma(_1111, _1107, _1103);
    float _1123 = fma(_1115, _1083, _1099);
    float _1125 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1129 = fma(_1117, _1107, _1123);
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1133 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1127);
    float _1135 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1137 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1139 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1143 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1145 = _731 + _1139;
    float _1147 = _759 + _1141;
    float _1149 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1143);
    float _1151 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1153 = _1145 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1157 = _1147 + _1155;
    float _1159 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1161 = _1153 * _1153;
    float _1163 = _1157 * _1157;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1167 = _1161 + _1163;
    float _1169 = _707 + _1165;
    float _1171 = sqrt(_1167);
    bool _1173 = _1171 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1165;
    float _1177 = _1129;
    float _1179 = _1145;
    float _1181 = _1161;
    float _1183 = _1163;
    float _1185 = _1087;
    if (!_1173)
    {
        _1175 = _1161;
    }
    float _1187 = _1175;
    float _1189 = _1187;
    if (!_1173)
    {
        _1177 = _1145;
    }
    float _1191 = _1177;
    float _1193 = _1191;
    if (!_1173)
    {
        _1179 = _1147;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (!_1173)
    {
        _1181 = _1169;
    }
    float _1199 = _1181;
    bool _1201 = !_1173;
    float _1203 = _1199;
    if (!_1201)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1171 + _1207;
        float _1211 = rsqrt(_1167);
        float _1213 = _1209 * _1205;
        float _1215 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1211 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1153, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1157, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1241 = _1233 + _1239;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1245 = _1235 + _1243;
        float _1247 = fma(_1169, _1225, _1237);
        float _1249 = _1241 * _1241;
        float _1251 = _1245 * _1245;
        _1203 = _1247;
        _1189 = _1249;
        _1183 = _1251;
        _1193 = _1233;
        _1197 = _1235;
    }
    float _1253 = _1203;
    float _1255 = _1189;
    float _1257 = _1183;
    float _1259 = _1193;
    float _1261 = _1197;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1265 = _1253 + _1263;
    float _1267 = fma(_1265, _1265, _1255);
    float _1269 = _1267 + _1257;
    float _1271 = sqrt(_1269);
    bool _1273 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1275 = isnan(_1271);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1281 = _1277 || _1279;
    float _1283 = _1255;
    float _1285 = _1267;
    if (!_1281)
    {
        _1283 = 1.0;
    }
    float _1287 = _1283;
    bool _1289 = !_1281;
    float _1291 = _1287;
    if (!_1289)
    {
        bool _1293 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1295 = isnan(_1271);
        bool _1297 = _1293 || _1295;
        bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1301 = _1297 || _1299;
        if (!_1301)
        {
            float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1305 = _1271 + _1303;
            float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1309 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1307;
            float _1311 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1313 = _1311 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1315 = 1.0 / _1309;
            float _1317 = _1305 * _1315;
            float _1319 = fma(_1317, _1313, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1291 = _1319;
            _1285 = _1313;
            _1321 = true;
        }
        else
        {
            bool _1323 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1325 = isnan(_1271);
            bool _1327 = _1323 || _1325;
            bool _1329 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1331 = _1327 || _1329;
            if (!_1331)
            {
                float _1333 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1335 = _1271 + _1333;
                float _1337 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1339 = _1337 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1341 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1343 = _1341 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1345 = 1.0 / _1339;
                float _1347 = _1335 * _1345;
                float _1349 = fma(_1347, _1343, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1291 = _1349;
                _1285 = _1343;
                _1321 = true;
            }
            else
            {
                _1291 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1321 = false;
    float _1351 = _1291;
    float _1353 = _1285;
    float _1355 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1357 = _1253 + _1355;
    float _1359 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1361 = _1259 + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1365 = _1261 + _1363;
    float _1367 = fma(_1357, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1369 = fma(_1361, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1373 = -_883;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1367);
    float _1377 = -_917;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1369);
    float _1381 = -_945;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1387 = _1375 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1391 = _1379 + _1389;
    float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1395 = _1383 + _1393;
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1391, _1391, _1397);
    float _1401 = fma(_1395, _1395, _1399);
    float _1403 = rsqrt(_1401);
    float _1405 = sqrt(_1401);
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1391 * _1407;
    float _1411 = _1395 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1271;
    float _1429 = _1403;
    float _1431 = _1425;
    float _1433 = _1387;
    float _1435 = _1409;
    if (_1421)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1421)
    {
        float _1441 = rsqrt(_1417);
        _1429 = _1441;
    }
    float _1443 = _1429;
    float _1445 = _1439;
    float _1447 = _1443;
    if (_1421)
    {
        float _1449 = _1425 * _1439;
        _1431 = _1449;
    }
    float _1451 = _1431;
    if (_1421)
    {
        float _1453 = _1451 * 0.15915493667125701904296875;
        _1445 = _1453;
    }
    float _1455 = _1445;
    float _1457 = _1395;
    float _1459 = _1455;
    if (_1421)
    {
        float _1461 = _1455 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1457 = _1463;
    }
    float _1465 = _1457;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1353;
    float _1473 = _1469;
    if (_1421)
    {
        float _1475 = _1455 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1407;
    float _1483 = -_1469;
    float _1485 = fma(_1387, _1481, _1483);
    if (_1421)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1487;
    }
    float _1489 = _1433;
    float _1491 = _1489;
    float _1493 = _1465;
    if (_1421)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    float _1499 = _1497;
    if (!_1421)
    {
        _1493 = _1411;
    }
    float _1501 = _1493;
    float _1503 = _1501;
    if (_1421)
    {
        float _1505 = _1479 + (-1.0);
        _1473 = _1505;
    }
    float _1507 = _1473;
    float _1509 = _1507;
    if (_1421)
    {
        float _1511 = _1443 * _1497;
        _1185 = _1511;
    }
    float _1513 = _1185;
    if (!_1421)
    {
        _1447 = _1485;
    }
    float _1515 = _1447;
    float _1517 = _1515;
    if (_1421)
    {
        float _1519 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1519;
    }
    float _1521 = _1459;
    if (_1421)
    {
        float _1523 = _1409 * _1513;
        _1435 = _1523;
    }
    float _1525 = _1435;
    if (!_1421)
    {
        _1499 = _1413;
    }
    float _1527 = _1499;
    float _1529 = _1527;
    if (_1421)
    {
        float _1531 = _1411 * _1513;
        _1503 = _1531;
    }
    float _1533 = _1503;
    if (_1421)
    {
        float _1535 = fma(_1485, _1479, _1521);
        _1517 = _1535;
    }
    float _1537 = _1517;
    if (_1421)
    {
        float _1539 = _1525 * _1525;
        _1529 = _1539;
    }
    float _1541 = _1529;
    if (!_1421)
    {
        _1509 = _1415;
    }
    float _1543 = _1509;
    float _1545 = _1543;
    if (_1421)
    {
        float _1547 = _1533 * _1533;
        _1545 = _1547;
    }
    float _1549 = _1545;
    float _1551 = fma(_1537, _1537, _1541);
    float _1553 = _1551 + _1549;
    float _1555 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1559 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1557);
    float _1561 = precise::clamp(_1559, 0.0, 1.0);
    float _1563 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1567 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1569 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1571 = rsqrt(_1553);
    float _1573 = -_1561;
    float _1575 = _1573 + 1.0;
    float _1577 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1567);
    float _1579 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1569);
    float _1581 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1563);
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1579);
    float _1589 = abs(_1575);
    float _1591 = log2(_1589);
    float _1593 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1581);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1597 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1583);
    float _1599 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1593);
    float _1603 = -_1595;
    float _1605 = fma(_1603, _1565, 1.0);
    float _1607 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1609 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1611 = _1571 * _1525;
    float _1613 = _1571 * _1533;
    float _1615 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1617 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1609);
    float _1619 = _1571 * _1537;
    float _1621 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1623 = log2(_1605);
    float _1625 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1627 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1629 = -_1621;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1635 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1637 = -_1613;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1641 = exp2(_1627);
    float _1643 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1645 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1633);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1639, 0.5, 0.5);
    float _1651 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1643);
    float _1653 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1645);
    float _1655 = _1619 + 1.0;
    float _1657 = 1.0 / _1635;
    float _1659 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1661 = fma(_1649, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1663 = _1623 * 0.693147182464599609375;
    float _1665 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1659);
    float _1667 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1653);
    float _1669 = fma(_1649, _1661, -0.212114393711090087890625);
    float _1671 = sqrt(_1647);
    float _1673 = -_1619;
    float _1675 = fma(_1641, _1655, _1673);
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1679 = fma(_1649, _1669, 1.570728778839111328125);
    float _1681 = fma(_1675, 0.5, 0.5);
    float _1683 = _1665 * _1657;
    float _1685 = _1667 * _1657;
    float _1687 = fma(_1683, 0.5, 0.5);
    float _1689 = fma(_1685, -0.5, 0.5);
    float _1691 = _1671 * 0.636619746685028076171875;
    float3 _4395 = float3(_1687, _1689, _1677);
    float _1693 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4395, float3(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4395, float3(0.0), isnan(_4395)), level(0.0)).x;
    float3 _4406 = float3(_1687, _1689, _1677);
    float4 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4406, float3(0.0), isnan(_4406)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4406, float3(0.0), isnan(_4406)), level(0.0)).xyzw;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = _1696.w;
    float _1706 = -_1679;
    float _1708 = fma(_1691, _1706, 1.0);
    float2 _4428 = float2(_1708, _1681);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4428, float2(0.0), isnan(_4428)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4428, float2(0.0), isnan(_4428)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1722 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1724 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    float _1726 = exp2(_1720);
    float _1728 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1724);
    float _1730 = _1665 + _1635;
    float _1732 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1728);
    float _1734 = _1730 * 0.5;
    float _1736 = _1635 * 0.5;
    float _1738 = _1732 + _1635;
    out.gl_Position.x = _1665;
    out.gl_Position.y = _1667;
    out.gl_Position.z = _1732;
    out.gl_Position.w = _1635;
    float _1740 = fma(_1667, -0.5, _1736);
    float _1742 = _1738 * 0.5;
    float _1744 = -_1726;
    float _1746 = _1744 + 1.0;
    float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _1734;
    out.m_66.y = _1740;
    out.m_66.z = _1742;
    out.m_66.w = _1635;
    float _1750 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1750;
    float _1752 = _1748 * _1693;
    float _1754 = -_1748;
    float _1756 = _1754 + 1.0;
    float _1758 = _1704 * _1752;
    float _1760 = _1718 * _1752;
    float _1762 = fma(_1714, _1758, _1698);
    float _1764 = fma(_1716, _1758, _1700);
    float _1766 = _1704 * _1756;
    float _1768 = fma(_1704, _1760, _1702);
    out.m_68.x = _1762;
    out.m_68.y = _1764;
    out.m_68.z = _1768;
    out.m_68.w = _1766;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1321 = false;
    bool _505 = false;
    bool _303 = false;
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
        float _1825 = as_type<float>(_103);
        out.gl_Position.z = _1825;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1895 = as_type<float>(_141);
        out.gl_Position.z = _1895;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_157;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _145 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _173 = _259;
    }
    float _261 = _173;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _159, _265);
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_271, _147, _165);
    float _279 = fma(_273, _147, _167);
    float _281 = fma(_275, _147, _169);
    bool _283 = !_263;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_87);
        float _307 = 1.0 / _305;
        float _309 = _121 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = 1.0 / _327;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _337 = 1.0 / _323;
    float _339 = 1.0 / _331;
    float _341 = _315 * _337;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _311 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = _345 * _333;
    bool _353 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_311);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = _319 * _339;
    bool _371 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_311);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = fma(_349, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = -_363;
    float _387 = _385 + 1.0;
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = fma(_367, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _403 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_311);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _381 * _387;
    float _417 = -_381;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = -_399;
    float _431 = _429 + 1.0;
    float _433 = _399 * _419;
    float _435 = fma(_423, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _437 = fma(_427, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = _413 * _431;
    float _441 = in.m_54.x;
    float _443 = in.m_54.y;
    float _445 = -_413;
    float _447 = _445 + 1.0;
    float _449 = _383 * _439;
    float _451 = _401 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _465 = fma(_455, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_459, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_435, _433, _461);
    float _471 = fma(_437, _433, _463);
    float _473 = fma(_465, _415, _469);
    float _475 = fma(_467, _415, _471);
    float _477 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _473);
    float _479 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _475);
    float _481 = _477 * _441;
    float _483 = _479 * _443;
    bool _485 = !_335;
    float _503;
    if (!_485)
    {
        float _487 = in.m_56.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_87);
        float _509 = 1.0 / _507;
        float _511 = _121 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _517 = log2(_515);
    float _519 = in.m_56.z;
    float _521 = _279 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _523 = in.m_56.x;
    float _525 = in.m_56.y;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _529 = _527 != 0;
    float _531 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _535 = _533 != 0;
    float _537 = _279 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _279 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _545 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _557 = _555 != 0;
    float _559 = 1.0 / _541;
    float _561 = _517 * _121;
    float _563 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
    float _565 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
    float _567 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
    float _569 = exp2(_561);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _573 = 1.0 + _571;
    float _575 = _519 * 2.0;
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _593 = 1.0 / _573;
    float _595 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].z, _563);
    bool _597 = _523 > 0.5;
    float _599 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _525 + _519;
    float _607 = floor(_575);
    float _609 = -_197;
    int _611 = _597 ? as_type<int>(_609) : as_type<int>(_197);
    float _613 = -_569;
    float _615 = _613 + 1.0;
    bool _617 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _625 = _621 || _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _627;
    float _631 = _605 + (-1.0);
    out.m_58.x = _599;
    out.m_58.y = _601;
    out.m_58.z = _603;
    float _633 = _625 ? _615 : 0.0;
    float _635 = _629 * _559;
    bool _637 = _525 > 0.5;
    float _639 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _513 + _641;
    if (_585)
    {
        float _645 = _633 * _593;
        _123 = _645;
    }
    float _647 = _123;
    float _649 = -_201;
    int _651 = _637 ? as_type<int>(_649) : as_type<int>(_201);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _607 > 0.0;
    float _657 = fma(_635, _643, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _659 = _607 >= 0.0;
    bool _661 = isnan(_607);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = _525 + _523;
    bool _671 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _673 = isnan(_513);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _523 * 2.0;
    bool _685 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _687 = isnan(_513);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = _669 + (-1.0);
    float _699 = _525 * 2.0;
    float _701 = floor(_683);
    float _703 = -_681;
    float _705 = _703 + 1.0;
    float _707 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _709 = !_529;
    float _711 = _709 ? _197 : as_type<float>(_611);
    float _713 = _695 * _705;
    float _715 = -_695;
    float _717 = _715 + 1.0;
    bool _719 = !_535;
    float _721 = _719 ? _201 : as_type<float>(_651);
    float _723 = floor(_699);
    float _725 = _657 * _713;
    float _727 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _729 = _667 ? 0 : 1;
    float _731 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[115].x, _725);
    float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _737 = _707 + _735;
    float _739 = _711 + 0.5;
    float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _743 = _701 > 0.0;
    float _745 = -_721;
    float _747 = _745 + 0.5;
    bool _749 = _701 >= 0.0;
    bool _751 = isnan(_701);
    bool _753 = _749 || _751;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    float _759 = _595 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _731 + _761;
    float _765 = _737 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _767 = _757 ? 0 : 1;
    float _769 = _739 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _771 = _723 > 0.0;
    float _773 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _775 = ~_729;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = _737 * _737;
    int _783 = _779;
    if (!_655)
    {
        int _785 = ~_729;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _793 = _759 + _791;
    bool _795 = _723 >= 0.0;
    bool _797 = isnan(_723);
    bool _799 = _795 || _797;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    float _805 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[28].x, _765);
    int _807 = ~_767;
    int _809 = _807 + 1;
    int _811 = _809 + 1;
    float _813 = _769 * _653;
    int _815 = _811;
    if (!_743)
    {
        int _817 = ~_767;
        int _819 = _817 + 1;
        _815 = _819;
    }
    int _821 = _815;
    float _823 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[116].x, _733);
    float _825 = _773 * _741;
    float _827 = fma(_763, _763, _781);
    float _829 = in.m_60.x;
    float _831 = in.m_60.y;
    float _833 = in.m_60.z;
    int _835 = _803 ? 0 : 1;
    float _837 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[28].z, _805);
    bool _839 = !_549;
    int _841 = _839 ? 0 : 1;
    float _843 = fma(_793, _793, _827);
    int _845 = ~_835;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    out.m_62.x = _813;
    out.m_62.y = _825;
    int _851 = _849;
    if (!_771)
    {
        int _853 = ~_835;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _861 = !_553;
    int _863 = _861 ? 0 : 1;
    float _865 = rsqrt(_843);
    bool _867 = _837 >= 0.0;
    int _869 = abs(_841);
    int _871 = abs(_863);
    float _873 = float(_869);
    float _875 = float(_789);
    float _877 = float(_871);
    float _879 = float(_821);
    float _881 = _873 * _875;
    float _883 = _737 * _865;
    float _885 = _877 * _879;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = _877;
    if (_867)
    {
        _889 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _891 = _889;
    float _893 = _881 * (-2.0);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _523 + (-0.5);
    float _903 = fma(_893, _829, _829);
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _909 = as_type<int>(_891);
    if (_867)
    {
        float _911 = _891 * 5.0;
        _909 = as_type<int>(_911);
    }
    int _913 = _909;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    float _917 = _763 * _865;
    float _919 = -_883;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    out.m_64.x = _905;
    out.m_64.y = _907;
    out.m_64.z = _899;
    out.m_64.w = _859;
    float _923 = fma(_727, _893, _727);
    float _925 = -_917;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    if (_867)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3125 = as_type<float>(_913);
        out.gl_Position.z = _3125;
    }
    if (_867)
    {
        out.m_47.x = 0.0;
    }
    bool _929 = !_557;
    int _931 = _929 ? 0 : 1;
    float _933 = _921 * _921;
    if (_867)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _935 = -_883;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _707);
    float _939 = -_917;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    float _943 = fma(_927, _927, _933);
    float _945 = _793 * _865;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _953 = _941 + _951;
    int _955 = abs(_931);
    float _957 = -_945;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _961 = _949 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _963 = _519 + _523;
    float _965 = float(_955);
    float _967 = fma(_959, _959, _943);
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].x, _961);
    float _971 = -_945;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _975 = float(_857);
    float _977 = _963 + (-1.0);
    float _979 = _885 * (-2.0);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _973 + _981;
    float _985 = _525 + (-0.5);
    float _987 = _965 * _975;
    float _989 = fma(_979, _831, _831);
    float _991 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _969);
    float _993 = _519 + (-0.5);
    float _995 = _987 * (-2.0);
    float _997 = fma(_639, _979, _639);
    float _999 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[196].y, _989);
    bool _1001 = _991 >= 0.0;
    float _1003 = fma(_923, _647, _915);
    float _1005 = fma(_997, _647, _999);
    float _1007 = sqrt(_967);
    float _1009 = _1003 * 0.15915493667125701904296875;
    float _1011 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1013 = fma(_995, _833, _833);
    float _1015 = _1005 * 0.15915493667125701904296875;
    float _1017 = fma(_1011, _995, _1011);
    float _1019 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    float _1021 = _969;
    if (_1001)
    {
        _1021 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1023 = _1021;
    float _1025 = _1009 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    int _1029 = as_type<int>(_1023);
    if (_1001)
    {
        out.m_47.x = 0.0;
    }
    float _1031 = fma(_1017, _647, _1019);
    if (_1001)
    {
        float _1033 = _1023 * 5.0;
        _1029 = as_type<int>(_1033);
    }
    int _1035 = _1029;
    float _1037 = _1031 * 0.15915493667125701904296875;
    float _1039 = _865 * _1007;
    float _1041 = _1009 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    if (_1001)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3328 = as_type<float>(_1035);
        out.gl_Position.z = _3328;
    }
    float _1045 = _1015 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1015 * 6.283185482025146484375;
    float _1051 = cos(_1049);
    float _1053 = _1037 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    if (_1001)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1057 = _1037 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1065 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1067 = _1027 * _1047;
    float _1069 = _1039 * _1061;
    float _1071 = _1043 * _1051;
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1075 = _1039 * _1065;
    float _1077 = _1063 * _1069;
    float _1079 = fma(_1055, _1071, _1067);
    float _1081 = _1043 * _1047;
    float _1083 = _1073 * _1075;
    float _1085 = _1027 * _1051;
    float _1087 = _1059 * _1077;
    float _1089 = _1047 * _1059;
    float _1091 = _1051 * _1059;
    float _1093 = -_1077;
    float _1095 = _1055 * _1093;
    float _1097 = _1043 * _1087;
    float _1099 = _1027 * _1087;
    float _1101 = fma(_1091, _1083, _1095);
    float _1103 = fma(_1079, _1083, _1097);
    float _1105 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1107 = _1105 * 0.5;
    float _1109 = -_1085;
    float _1111 = fma(_1055, _1081, _1109);
    float _1113 = -_1081;
    float _1115 = fma(_1055, _1085, _1113);
    float _1117 = fma(_1055, _1067, _1071);
    float _1119 = fma(_1089, _1107, _1101);
    float _1121 = fma(_1111, _1107, _1103);
    float _1123 = fma(_1115, _1083, _1099);
    float _1125 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1129 = fma(_1117, _1107, _1123);
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1125);
    float _1133 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1127);
    float _1135 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1137 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1139 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1143 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1145 = _731 + _1139;
    float _1147 = _759 + _1141;
    float _1149 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1143);
    float _1151 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1153 = _1145 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1157 = _1147 + _1155;
    float _1159 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1161 = _1153 * _1153;
    float _1163 = _1157 * _1157;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1167 = _1161 + _1163;
    float _1169 = _707 + _1165;
    float _1171 = sqrt(_1167);
    bool _1173 = _1171 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1165;
    float _1177 = _1129;
    float _1179 = _1145;
    float _1181 = _1161;
    float _1183 = _1163;
    float _1185 = _1087;
    if (!_1173)
    {
        _1175 = _1161;
    }
    float _1187 = _1175;
    float _1189 = _1187;
    if (!_1173)
    {
        _1177 = _1145;
    }
    float _1191 = _1177;
    float _1193 = _1191;
    if (!_1173)
    {
        _1179 = _1147;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (!_1173)
    {
        _1181 = _1169;
    }
    float _1199 = _1181;
    bool _1201 = !_1173;
    float _1203 = _1199;
    if (!_1201)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1171 + _1207;
        float _1211 = rsqrt(_1167);
        float _1213 = _1209 * _1205;
        float _1215 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1211 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1153, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1157, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1241 = _1233 + _1239;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1245 = _1235 + _1243;
        float _1247 = fma(_1169, _1225, _1237);
        float _1249 = _1241 * _1241;
        float _1251 = _1245 * _1245;
        _1203 = _1247;
        _1189 = _1249;
        _1183 = _1251;
        _1193 = _1233;
        _1197 = _1235;
    }
    float _1253 = _1203;
    float _1255 = _1189;
    float _1257 = _1183;
    float _1259 = _1193;
    float _1261 = _1197;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1265 = _1253 + _1263;
    float _1267 = fma(_1265, _1265, _1255);
    float _1269 = _1267 + _1257;
    float _1271 = sqrt(_1269);
    bool _1273 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1275 = isnan(_1271);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1281 = _1277 || _1279;
    float _1283 = _1255;
    float _1285 = _1267;
    if (!_1281)
    {
        _1283 = 1.0;
    }
    float _1287 = _1283;
    bool _1289 = !_1281;
    float _1291 = _1287;
    if (!_1289)
    {
        bool _1293 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1295 = isnan(_1271);
        bool _1297 = _1293 || _1295;
        bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1301 = _1297 || _1299;
        if (!_1301)
        {
            float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1305 = _1271 + _1303;
            float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1309 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1307;
            float _1311 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1313 = _1311 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1315 = 1.0 / _1309;
            float _1317 = _1305 * _1315;
            float _1319 = fma(_1317, _1313, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1291 = _1319;
            _1285 = _1313;
            _1321 = true;
        }
        else
        {
            bool _1323 = _1271 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1325 = isnan(_1271);
            bool _1327 = _1323 || _1325;
            bool _1329 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1331 = _1327 || _1329;
            if (!_1331)
            {
                float _1333 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1335 = _1271 + _1333;
                float _1337 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1339 = _1337 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1341 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1343 = _1341 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1345 = 1.0 / _1339;
                float _1347 = _1335 * _1345;
                float _1349 = fma(_1347, _1343, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1291 = _1349;
                _1285 = _1343;
                _1321 = true;
            }
            else
            {
                _1291 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1321 = false;
    float _1351 = _1291;
    float _1353 = _1285;
    float _1355 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1357 = _1253 + _1355;
    float _1359 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1361 = _1259 + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1365 = _1261 + _1363;
    float _1367 = fma(_1357, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1369 = fma(_1361, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1373 = -_883;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1367);
    float _1377 = -_917;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1369);
    float _1381 = -_945;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1387 = _1375 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1391 = _1379 + _1389;
    float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1395 = _1383 + _1393;
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1391, _1391, _1397);
    float _1401 = fma(_1395, _1395, _1399);
    float _1403 = rsqrt(_1401);
    float _1405 = sqrt(_1401);
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1391 * _1407;
    float _1411 = _1395 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1271;
    float _1429 = _1403;
    float _1431 = _1425;
    float _1433 = _1387;
    float _1435 = _1409;
    if (_1421)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1421)
    {
        float _1441 = rsqrt(_1417);
        _1429 = _1441;
    }
    float _1443 = _1429;
    float _1445 = _1439;
    float _1447 = _1443;
    if (_1421)
    {
        float _1449 = _1425 * _1439;
        _1431 = _1449;
    }
    float _1451 = _1431;
    if (_1421)
    {
        float _1453 = _1451 * 0.15915493667125701904296875;
        _1445 = _1453;
    }
    float _1455 = _1445;
    float _1457 = _1395;
    float _1459 = _1455;
    if (_1421)
    {
        float _1461 = _1455 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1457 = _1463;
    }
    float _1465 = _1457;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1353;
    float _1473 = _1469;
    if (_1421)
    {
        float _1475 = _1455 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1407;
    float _1483 = -_1469;
    float _1485 = fma(_1387, _1481, _1483);
    if (_1421)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1487;
    }
    float _1489 = _1433;
    float _1491 = _1489;
    float _1493 = _1465;
    if (_1421)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    float _1499 = _1497;
    if (!_1421)
    {
        _1493 = _1411;
    }
    float _1501 = _1493;
    float _1503 = _1501;
    if (_1421)
    {
        float _1505 = _1479 + (-1.0);
        _1473 = _1505;
    }
    float _1507 = _1473;
    float _1509 = _1507;
    if (_1421)
    {
        float _1511 = _1443 * _1497;
        _1185 = _1511;
    }
    float _1513 = _1185;
    if (!_1421)
    {
        _1447 = _1485;
    }
    float _1515 = _1447;
    float _1517 = _1515;
    if (_1421)
    {
        float _1519 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1519;
    }
    float _1521 = _1459;
    if (_1421)
    {
        float _1523 = _1409 * _1513;
        _1435 = _1523;
    }
    float _1525 = _1435;
    if (!_1421)
    {
        _1499 = _1413;
    }
    float _1527 = _1499;
    float _1529 = _1527;
    if (_1421)
    {
        float _1531 = _1411 * _1513;
        _1503 = _1531;
    }
    float _1533 = _1503;
    if (_1421)
    {
        float _1535 = fma(_1485, _1479, _1521);
        _1517 = _1535;
    }
    float _1537 = _1517;
    if (_1421)
    {
        float _1539 = _1525 * _1525;
        _1529 = _1539;
    }
    float _1541 = _1529;
    if (!_1421)
    {
        _1509 = _1415;
    }
    float _1543 = _1509;
    float _1545 = _1543;
    if (_1421)
    {
        float _1547 = _1533 * _1533;
        _1545 = _1547;
    }
    float _1549 = _1545;
    float _1551 = fma(_1537, _1537, _1541);
    float _1553 = _1551 + _1549;
    float _1555 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1559 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1557);
    float _1561 = precise::clamp(_1559, 0.0, 1.0);
    float _1563 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1567 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1569 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1571 = rsqrt(_1553);
    float _1573 = -_1561;
    float _1575 = _1573 + 1.0;
    float _1577 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1567);
    float _1579 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1569);
    float _1581 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1563);
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1579);
    float _1589 = abs(_1575);
    float _1591 = log2(_1589);
    float _1593 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1581);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1597 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1583);
    float _1599 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1593);
    float _1603 = -_1595;
    float _1605 = fma(_1603, _1565, 1.0);
    float _1607 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1609 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1611 = _1571 * _1525;
    float _1613 = _1571 * _1533;
    float _1615 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1617 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1609);
    float _1619 = _1571 * _1537;
    float _1621 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1623 = log2(_1605);
    float _1625 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1627 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1629 = -_1621;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1635 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1637 = -_1613;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1641 = exp2(_1627);
    float _1643 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1645 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1633);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1639, 0.5, 0.5);
    float _1651 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1643);
    float _1653 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1645);
    float _1655 = _1619 + 1.0;
    float _1657 = 1.0 / _1635;
    float _1659 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1661 = fma(_1649, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1663 = _1623 * 0.693147182464599609375;
    float _1665 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1659);
    float _1667 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1653);
    float _1669 = fma(_1649, _1661, -0.212114393711090087890625);
    float _1671 = sqrt(_1647);
    float _1673 = -_1619;
    float _1675 = fma(_1641, _1655, _1673);
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1679 = fma(_1649, _1669, 1.570728778839111328125);
    float _1681 = fma(_1675, 0.5, 0.5);
    float _1683 = _1665 * _1657;
    float _1685 = _1667 * _1657;
    float _1687 = fma(_1683, 0.5, 0.5);
    float _1689 = fma(_1685, -0.5, 0.5);
    float _1691 = _1671 * 0.636619746685028076171875;
    float3 _4395 = float3(_1687, _1689, _1677);
    float _1693 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4395, float3(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4395, float3(0.0), isnan(_4395)), level(0.0)).x;
    float3 _4406 = float3(_1687, _1689, _1677);
    float4 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4406, float3(0.0), isnan(_4406)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4406, float3(0.0), isnan(_4406)), level(0.0)).xyzw;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = _1696.w;
    float _1706 = -_1679;
    float _1708 = fma(_1691, _1706, 1.0);
    float2 _4428 = float2(_1708, _1681);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4428, float2(0.0), isnan(_4428)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4428, float2(0.0), isnan(_4428)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1722 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1724 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    float _1726 = exp2(_1720);
    float _1728 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1724);
    float _1730 = _1665 + _1635;
    float _1732 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1728);
    float _1734 = _1730 * 0.5;
    float _1736 = _1635 * 0.5;
    float _1738 = _1732 + _1635;
    out.gl_Position.x = _1665;
    out.gl_Position.y = _1667;
    out.gl_Position.z = _1732;
    out.gl_Position.w = _1635;
    float _1740 = fma(_1667, -0.5, _1736);
    float _1742 = _1738 * 0.5;
    float _1744 = -_1726;
    float _1746 = _1744 + 1.0;
    float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _1734;
    out.m_66.y = _1740;
    out.m_66.z = _1742;
    out.m_66.w = _1635;
    float _1750 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1750;
    float _1752 = _1748 * _1693;
    float _1754 = -_1748;
    float _1756 = _1754 + 1.0;
    float _1758 = _1704 * _1752;
    float _1760 = _1718 * _1752;
    float _1762 = fma(_1714, _1758, _1698);
    float _1764 = fma(_1716, _1758, _1700);
    float _1766 = _1704 * _1756;
    float _1768 = fma(_1704, _1760, _1702);
    out.m_68.x = _1762;
    out.m_68.y = _1764;
    out.m_68.z = _1768;
    out.m_68.w = _1766;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

