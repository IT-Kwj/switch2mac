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
    float4 m_64 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
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
    bool _747 = false;
    bool _283 = false;
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
        float _1411 = as_type<float>(_103);
        out.gl_Position.z = _1411;
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
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1479 = as_type<float>(_139);
        out.gl_Position.z = _1479;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_51.w;
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
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
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _143 * _189;
        float _199 = exp2(_197);
        float _201 = _195 * 0.693147182464599609375;
        float _203 = 1.0 / _201;
        float _205 = 1.0 / _193;
        float _207 = _199 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _203, _143);
        float _213 = _211 * _205;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_153;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _143 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _169 = _239;
    }
    float _241 = _169;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _155, _245);
    float _253 = fma(_241, _157, _247);
    float _255 = fma(_241, _159, _249);
    float _257 = fma(_251, _141, _161);
    float _259 = fma(_253, _141, _163);
    float _261 = fma(_255, _141, _165);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_53.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_87);
        float _287 = 1.0 / _285;
        float _289 = _121 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = as_type<float>(int(gl_VertexIndex));
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _291 + _295;
    bool _299 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_291);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = in.m_51.x;
    float _317 = in.m_51.y;
    float _319 = -_309;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    int _325 = as_type<int>(_293) & 1;
    bool _327 = _325 != 0;
    int _329 = as_type<int>(_293) & 2;
    bool _331 = _329 != 0;
    float _333 = _297 * _323;
    bool _335 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_291);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _351;
    float _355 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _345 * _321;
    float _359 = fma(_349, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _361 = fma(_353, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _369 = _359 * _357;
    float _371 = _361 * _357;
    float _373 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _367);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _379 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[144].x, _375);
    float _381 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[144].y, _377);
    bool _383 = !_331;
    float _385 = _383 ? (-0.5) : 0.5;
    bool _387 = !_327;
    float _389 = _387 ? (-0.5) : 0.5;
    float _391 = _381 * _317;
    float _393 = _379 * _315;
    float _395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _385);
    float _397 = _373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _399 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _401 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _389);
    float _403 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _405 = _399 * _395;
    float _407 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _409 = _403 * _401;
    float _411 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = _405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _415 = _405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = _405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _413);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _417);
    float _427 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[24].z, _421);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _433 = _427 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _435 = _429 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _437 = _431 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _439 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _397 + _435;
    float _443 = _433 + _437;
    float _445 = in.m_53.x;
    float _447 = in.m_53.y;
    float _449 = in.m_53.z;
    float _451 = in.m_53.w;
    float _453 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _455 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _457 = _441 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _461 = _443 + _459;
    float _463 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
    float _465 = _457 * _457;
    float _467 = _461 * _461;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _471 = _469 != 0;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _477 = _475 != 0;
    float _479 = _465 + _467;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _487 = _485 != 0;
    float _489 = sqrt(_479);
    bool _491 = _447 > 0.5;
    float _493 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[25].z, _425);
    bool _495 = _445 > 0.5;
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _499 = _449 > 0.5;
    float _501 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _503 = -_385;
    float _505 = _491 ? _503 : _385;
    float _507 = -_389;
    int _509 = _495 ? as_type<int>(_507) : as_type<int>(_389);
    bool _511 = _489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _513 = _451 > 0.5;
    float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _517 = -_389;
    int _519 = _499 ? as_type<int>(_517) : as_type<int>(_389);
    float _521 = -_385;
    int _523 = _513 ? as_type<int>(_521) : as_type<int>(_385);
    bool _525 = !_471;
    float _527 = _525 ? _389 : as_type<float>(_509);
    float _529 = _493 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _531 = !_483;
    float _533 = _531 ? _389 : as_type<float>(_519);
    bool _535 = !_477;
    float _537 = _535 ? _385 : _505;
    bool _539 = !_487;
    float _541 = _539 ? _385 : as_type<float>(_523);
    float _543 = _501 + _529;
    float _545 = _417;
    float _547 = _505;
    float _549 = _529;
    float _551 = _443;
    float _553 = _441;
    if (!_511)
    {
        _545 = _443;
    }
    float _555 = _545;
    float _557 = _555;
    if (!_511)
    {
        _547 = _467;
    }
    float _559 = _547;
    float _561 = _559;
    if (!_511)
    {
        _549 = _465;
    }
    float _563 = _549;
    float _565 = _563;
    if (!_511)
    {
        _551 = _543;
    }
    float _567 = _551;
    bool _569 = !_511;
    float _571 = _567;
    if (!_569)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _577 = _489 + _575;
        float _579 = _543 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = rsqrt(_479);
        float _583 = _577 * _573;
        float _585 = _583 * 0.15915493667125701904296875;
        float _587 = _585 * 6.283185482025146484375;
        float _589 = sin(_587);
        float _591 = _585 * 6.283185482025146484375;
        float _593 = cos(_591);
        float _595 = fma(_589, _579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _597 = _581 * _595;
        float _599 = _593 + (-1.0);
        float _601 = fma(_457, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _603 = fma(_461, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _605 = _599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _609 = _601 + _607;
        float _611 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _613 = _603 + _611;
        float _615 = fma(_543, _593, _605);
        float _617 = _609 * _609;
        float _619 = _613 * _613;
        _571 = _615;
        _565 = _617;
        _561 = _619;
        _553 = _601;
        _557 = _603;
    }
    float _621 = _571;
    float _623 = _565;
    float _625 = _561;
    float _627 = _553;
    float _629 = _557;
    float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _633 = _621 + _631;
    float _635 = _527 + 0.5;
    float _637 = -_537;
    float _639 = _637 + 0.5;
    float _641 = _533 + 0.5;
    float _643 = fma(_633, _633, _623);
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _647 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _651 = _641 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _653 = _643 + _625;
    float _655 = _647 * _473;
    float _657 = _649 * _497;
    float _659 = _651 * _515;
    float _661 = -_541;
    float _663 = _661 + 0.5;
    float _665 = sqrt(_653);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _679 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _683 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _679 * _645;
    out.m_58.x = _683;
    out.m_58.y = _687;
    out.m_58.z = _689;
    out.m_58.w = _681;
    bool _699 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _701 = isnan(_665);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _707 = _703 || _705;
    out.m_60.x = _691;
    out.m_60.y = _693;
    out.m_60.z = _695;
    out.m_60.w = _685;
    out.m_62.x = _655;
    out.m_62.y = _657;
    out.m_62.z = _659;
    out.m_62.w = _697;
    float _709 = _653;
    float _711 = _693;
    if (!_707)
    {
        _709 = 1.0;
    }
    float _713 = _709;
    bool _715 = !_707;
    float _717 = _713;
    if (!_715)
    {
        bool _719 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _721 = isnan(_665);
        bool _723 = _719 || _721;
        bool _725 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _727 = _723 || _725;
        if (!_727)
        {
            float _729 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _731 = _665 + _729;
            float _733 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _735 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _733;
            float _737 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _739 = _737 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _741 = 1.0 / _735;
            float _743 = _731 * _741;
            float _745 = fma(_743, _739, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _717 = _745;
            _747 = true;
        }
        else
        {
            bool _749 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _751 = isnan(_665);
            bool _753 = _749 || _751;
            bool _755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _757 = _753 || _755;
            if (!_757)
            {
                float _759 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _761 = _665 + _759;
                float _763 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _765 = _763 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _767 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _769 = _767 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _771 = 1.0 / _765;
                float _773 = _761 * _771;
                float _775 = fma(_773, _769, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _717 = _775;
                _747 = true;
            }
            else
            {
                _717 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _747 = false;
    float _777 = _717;
    float _779 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _781 = _621 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _785 = _627 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _789 = _629 + _787;
    float _791 = fma(_781, _777, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _793 = fma(_785, _777, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _795 = fma(_789, _777, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _791 + _797;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = _793 + _801;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _807 = _795 + _805;
    float _809 = _799 * _799;
    float _811 = fma(_803, _803, _809);
    float _813 = fma(_807, _807, _811);
    float _815 = rsqrt(_813);
    float _817 = _815 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _819 = _803 * _817;
    float _821 = _807 * _817;
    float _823 = _819 * _819;
    float _825 = _821 * _821;
    float _827 = _823 + _825;
    float _829 = sqrt(_827);
    bool _831 = _829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _835 = _829 + _833;
    float _837 = _691;
    float _839 = _827;
    float _841 = _835;
    float _843 = _799;
    float _845 = _777;
    float _847 = _819;
    if (_831)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _849;
    }
    float _851 = _837;
    if (_831)
    {
        float _853 = rsqrt(_827);
        _839 = _853;
    }
    float _855 = _839;
    float _857 = _855;
    if (_831)
    {
        float _859 = _835 * _851;
        _841 = _859;
    }
    float _861 = _841;
    if (_831)
    {
        float _863 = _861 * 0.15915493667125701904296875;
        _711 = _863;
    }
    float _865 = _711;
    float _867 = _807;
    if (_831)
    {
        float _869 = _865 * 6.283185482025146484375;
        float _871 = sin(_869);
        _867 = _871;
    }
    float _873 = _867;
    float _875 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _877 = precise::max(0.0, _875);
    float _879 = _851;
    float _881 = _877;
    if (_831)
    {
        float _883 = _865 * 6.283185482025146484375;
        float _885 = cos(_883);
        _879 = _885;
    }
    float _887 = _879;
    float _889 = -_817;
    float _891 = -_877;
    float _893 = fma(_799, _889, _891);
    if (_831)
    {
        float _895 = _893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _843 = _895;
    }
    float _897 = _843;
    float _899 = sqrt(_813);
    float _901 = _873;
    float _903 = _897;
    if (_831)
    {
        float _905 = fma(_873, _897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _901 = _905;
    }
    float _907 = _901;
    float _909 = _907;
    if (!_831)
    {
        _903 = _821;
    }
    float _911 = _903;
    float _913 = _911;
    if (_831)
    {
        float _915 = _887 + (-1.0);
        _881 = _915;
    }
    float _917 = _881;
    float _919 = _917;
    if (_831)
    {
        float _921 = _855 * _907;
        _845 = _921;
    }
    float _923 = _845;
    if (!_831)
    {
        _909 = _893;
    }
    float _925 = _909;
    float _927 = _925;
    if (_831)
    {
        float _929 = _917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _919 = _929;
    }
    float _931 = _919;
    float _933 = _931;
    if (_831)
    {
        float _935 = _819 * _923;
        _847 = _935;
    }
    float _937 = _847;
    if (!_831)
    {
        _857 = _823;
    }
    float _939 = _857;
    float _941 = _939;
    if (_831)
    {
        float _943 = _821 * _923;
        _913 = _943;
    }
    float _945 = _913;
    if (_831)
    {
        float _947 = fma(_893, _887, _931);
        _927 = _947;
    }
    float _949 = _927;
    if (_831)
    {
        float _951 = _937 * _937;
        _941 = _951;
    }
    float _953 = _941;
    if (!_831)
    {
        _933 = _825;
    }
    float _955 = _933;
    float _957 = _955;
    if (_831)
    {
        float _959 = _945 * _945;
        _957 = _959;
    }
    float _961 = _957;
    float _963 = fma(_949, _949, _953);
    float _965 = _791 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _967 = _963 + _961;
    float _969 = _791 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _973 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _971);
    float _975 = precise::clamp(_973, 0.0, 1.0);
    float _977 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].x, _965);
    float _979 = rsqrt(_967);
    float _981 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].x, _969);
    float _983 = _791 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _985 = -_975;
    float _987 = _985 + 1.0;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _991 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _993 = _791 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _995 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].x, _983);
    float _997 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[3].z, _977);
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1001 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].x, _993);
    float _1003 = abs(_987);
    float _1005 = log2(_1003);
    float _1007 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[1].z, _995);
    float _1009 = _999 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1011 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1001);
    float _1013 = _979 * _937;
    float _1015 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1017 = _979 * _949;
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1021 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1023 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1025 = _979 * _945;
    float _1027 = -_1009;
    float _1029 = fma(_1027, _989, 1.0);
    float _1031 = -_1021;
    float _1033 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1031);
    float _1035 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1023);
    float _1037 = _997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1039 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1041 = -_1025;
    float _1043 = fma(_1041, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1033);
    float _1045 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1047 = log2(_1029);
    float _1049 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1051 = fma(_1043, -0.5, 0.5);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1045);
    float _1055 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1057 = fma(_1043, 0.5, 0.5);
    float _1059 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1049);
    float _1061 = _1017 + 1.0;
    float _1063 = exp2(_1039);
    float _1065 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1055);
    float _1067 = fma(_1057, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1069 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1059);
    float _1071 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1065);
    float _1073 = fma(_1057, _1067, -0.212114393711090087890625);
    float _1075 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1069);
    float _1077 = 1.0 / _1053;
    float _1079 = _1047 * 0.693147182464599609375;
    float _1081 = fma(_1057, _1073, 1.570728778839111328125);
    float _1083 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1085 = sqrt(_1051);
    float _1087 = -_1017;
    float _1089 = fma(_1063, _1061, _1087);
    float _1091 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1071);
    float _1093 = fma(_1089, 0.5, 0.5);
    float _1095 = _1075 * _1077;
    float _1097 = _1091 * _1077;
    float _1099 = fma(_1095, 0.5, 0.5);
    float _1101 = fma(_1097, -0.5, 0.5);
    float _1103 = _1085 * 0.636619746685028076171875;
    float _1105 = -_1081;
    float _1107 = fma(_1103, _1105, 1.0);
    float3 _3100 = float3(_1099, _1101, _1083);
    float _1109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3100, float3(0.0), isnan(_3100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3100, float3(0.0), isnan(_3100)), level(0.0)).x;
    float3 _3111 = float3(_1099, _1101, _1083);
    float4 _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3111, float3(0.0), isnan(_3111)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3111, float3(0.0), isnan(_3111)), level(0.0)).xyzw;
    float _1114 = _1112.x;
    float _1116 = _1112.y;
    float _1118 = _1112.z;
    float _1120 = _1112.w;
    float2 _3128 = float2(_1107, _1093);
    float3 _1124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3128, float2(0.0), isnan(_3128)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3128, float2(0.0), isnan(_3128)), level(0.0)).xyz;
    float _1126 = _1124.x;
    float _1128 = _1124.y;
    float _1130 = _1124.z;
    float _1132 = _501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = _501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1136 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1138 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1134);
    float _1140 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1136);
    float _1142 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1138);
    float _1144 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1146 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1148 = 1.0 / _1144;
    float _1150 = _1146 + _1144;
    float _1152 = _1150 * _1148;
    float _1154 = _1152 * 0.5;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1158 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1156);
    float _1160 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1162 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan(0.5);
    bool _1170 = _1166 || _1168;
    float _1172 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1174 = 1.0 / _1158;
    float _1176 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1160);
    float _1178 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1176);
    float _1180 = exp2(_1172);
    float _1182 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1178);
    float _1184 = _1015;
    float _1186 = _999;
    if (_1170)
    {
        _1184 = 1.0;
    }
    float _1188 = _1184;
    float _1190 = _1188;
    if (_1170)
    {
        _1186 = 1.0;
    }
    float _1192 = _1186;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1196 = _1174 * _1194;
    float _1198 = _1192;
    if (!_1170)
    {
        float _1200 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1204 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1202;
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1206 * 6.283185482025146484375;
        float _1218 = sin(_1216);
        float _1220 = 1.0 / _1210;
        float _1222 = _1214 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = _1218 * _1220;
        float _1228 = _1214 * 6.283185482025146484375;
        float _1230 = sin(_1228);
        float _1232 = _1224 * _1226;
        float _1234 = 1.0 / _1204;
        float _1236 = 1.0 / _1232;
        float _1238 = _1230 * _1236;
        float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1242 = fma(_1196, _1238, _1240);
        float _1244 = _1242 * _1234;
        float _1246 = precise::clamp(_1244, 0.0, 1.0);
        _1190 = _1246;
    }
    float _1248 = _1190;
    if (!_1170)
    {
        float _1250 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = _1252 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1260 = _1258 * 0.15915493667125701904296875;
        float _1262 = _1252 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = 1.0 / _1256;
        float _1268 = _1260 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = _1260 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1270 * _1272;
        float _1280 = 1.0 / _1278;
        float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1284 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1282;
        float _1286 = 1.0 / _1284;
        float _1288 = _1276 * _1280;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1292 = fma(_1196, _1288, _1290);
        float _1294 = _1292 * _1286;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        float _1298 = -_1296;
        float _1300 = _1298 + 1.0;
        _1198 = _1300;
    }
    float _1302 = _1198;
    float _1304 = _1182 + _1053;
    float _1306 = -_1180;
    float _1308 = _1306 + 1.0;
    bool _1310 = _1248 > 0.0;
    bool _1312 = isnan(_1248);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    float _1320 = _1248 * _1302;
    float _1322 = _1304 * 0.5;
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1326 = _1302 <= 0.0;
    bool _1328 = !_1318;
    bool _1330 = _1326 || _1328;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_64.x = _793;
    out.m_64.y = _791;
    out.m_64.z = _795;
    float _1334 = _1324 * _1109;
    float _1336 = -_1324;
    float _1338 = _1336 + 1.0;
    float _1340 = _1332 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1342 = _1120 * _1334;
    float _1344 = _1130 * _1334;
    float _1346 = _1120 * _1338;
    out.gl_Position.x = _1075;
    out.gl_Position.y = _1091;
    out.gl_Position.z = _1182;
    out.gl_Position.w = _1053;
    float _1348 = fma(_1126, _1342, _1114);
    float _1350 = fma(_1128, _1342, _1116);
    float _1352 = fma(_1120, _1344, _1118);
    out.m_66.z = _1322;
    out.m_66.w = _1053;
    out.m_47.x = _1340;
    out.m_68.x = _1348;
    out.m_68.y = _1350;
    out.m_68.z = _1352;
    out.m_68.w = _1346;
    if (!_1330)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1354;
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
    bool _747 = false;
    bool _283 = false;
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
        float _1411 = as_type<float>(_103);
        out.gl_Position.z = _1411;
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
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1479 = as_type<float>(_139);
        out.gl_Position.z = _1479;
    }
    if (_133)
    {
        return out;
    }
    float _141 = in.m_51.w;
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
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
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _143 * _189;
        float _199 = exp2(_197);
        float _201 = _195 * 0.693147182464599609375;
        float _203 = 1.0 / _201;
        float _205 = 1.0 / _193;
        float _207 = _199 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _203, _143);
        float _213 = _211 * _205;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_153;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _143 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _169 = _239;
    }
    float _241 = _169;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _155, _245);
    float _253 = fma(_241, _157, _247);
    float _255 = fma(_241, _159, _249);
    float _257 = fma(_251, _141, _161);
    float _259 = fma(_253, _141, _163);
    float _261 = fma(_255, _141, _165);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_53.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_87);
        float _287 = 1.0 / _285;
        float _289 = _121 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = as_type<float>(int(gl_VertexIndex));
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _291 + _295;
    bool _299 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_291);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = in.m_51.x;
    float _317 = in.m_51.y;
    float _319 = -_309;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    int _325 = as_type<int>(_293) & 1;
    bool _327 = _325 != 0;
    int _329 = as_type<int>(_293) & 2;
    bool _331 = _329 != 0;
    float _333 = _297 * _323;
    bool _335 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_291);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _351;
    float _355 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _345 * _321;
    float _359 = fma(_349, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _361 = fma(_353, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _369 = _359 * _357;
    float _371 = _361 * _357;
    float _373 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _367);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _379 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[144].x, _375);
    float _381 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[144].y, _377);
    bool _383 = !_331;
    float _385 = _383 ? (-0.5) : 0.5;
    bool _387 = !_327;
    float _389 = _387 ? (-0.5) : 0.5;
    float _391 = _381 * _317;
    float _393 = _379 * _315;
    float _395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _385);
    float _397 = _373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _399 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _401 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _389);
    float _403 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _405 = _399 * _395;
    float _407 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _409 = _403 * _401;
    float _411 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = _405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _415 = _405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = _405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _413);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _417);
    float _427 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[24].z, _421);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _433 = _427 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _435 = _429 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _437 = _431 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _439 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _397 + _435;
    float _443 = _433 + _437;
    float _445 = in.m_53.x;
    float _447 = in.m_53.y;
    float _449 = in.m_53.z;
    float _451 = in.m_53.w;
    float _453 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _455 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _457 = _441 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _461 = _443 + _459;
    float _463 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
    float _465 = _457 * _457;
    float _467 = _461 * _461;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _471 = _469 != 0;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _477 = _475 != 0;
    float _479 = _465 + _467;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _487 = _485 != 0;
    float _489 = sqrt(_479);
    bool _491 = _447 > 0.5;
    float _493 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[25].z, _425);
    bool _495 = _445 > 0.5;
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _499 = _449 > 0.5;
    float _501 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _503 = -_385;
    float _505 = _491 ? _503 : _385;
    float _507 = -_389;
    int _509 = _495 ? as_type<int>(_507) : as_type<int>(_389);
    bool _511 = _489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _513 = _451 > 0.5;
    float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _517 = -_389;
    int _519 = _499 ? as_type<int>(_517) : as_type<int>(_389);
    float _521 = -_385;
    int _523 = _513 ? as_type<int>(_521) : as_type<int>(_385);
    bool _525 = !_471;
    float _527 = _525 ? _389 : as_type<float>(_509);
    float _529 = _493 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _531 = !_483;
    float _533 = _531 ? _389 : as_type<float>(_519);
    bool _535 = !_477;
    float _537 = _535 ? _385 : _505;
    bool _539 = !_487;
    float _541 = _539 ? _385 : as_type<float>(_523);
    float _543 = _501 + _529;
    float _545 = _417;
    float _547 = _505;
    float _549 = _529;
    float _551 = _443;
    float _553 = _441;
    if (!_511)
    {
        _545 = _443;
    }
    float _555 = _545;
    float _557 = _555;
    if (!_511)
    {
        _547 = _467;
    }
    float _559 = _547;
    float _561 = _559;
    if (!_511)
    {
        _549 = _465;
    }
    float _563 = _549;
    float _565 = _563;
    if (!_511)
    {
        _551 = _543;
    }
    float _567 = _551;
    bool _569 = !_511;
    float _571 = _567;
    if (!_569)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _577 = _489 + _575;
        float _579 = _543 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = rsqrt(_479);
        float _583 = _577 * _573;
        float _585 = _583 * 0.15915493667125701904296875;
        float _587 = _585 * 6.283185482025146484375;
        float _589 = sin(_587);
        float _591 = _585 * 6.283185482025146484375;
        float _593 = cos(_591);
        float _595 = fma(_589, _579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _597 = _581 * _595;
        float _599 = _593 + (-1.0);
        float _601 = fma(_457, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _603 = fma(_461, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _605 = _599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _609 = _601 + _607;
        float _611 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _613 = _603 + _611;
        float _615 = fma(_543, _593, _605);
        float _617 = _609 * _609;
        float _619 = _613 * _613;
        _571 = _615;
        _565 = _617;
        _561 = _619;
        _553 = _601;
        _557 = _603;
    }
    float _621 = _571;
    float _623 = _565;
    float _625 = _561;
    float _627 = _553;
    float _629 = _557;
    float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _633 = _621 + _631;
    float _635 = _527 + 0.5;
    float _637 = -_537;
    float _639 = _637 + 0.5;
    float _641 = _533 + 0.5;
    float _643 = fma(_633, _633, _623);
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _647 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _651 = _641 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _653 = _643 + _625;
    float _655 = _647 * _473;
    float _657 = _649 * _497;
    float _659 = _651 * _515;
    float _661 = -_541;
    float _663 = _661 + 0.5;
    float _665 = sqrt(_653);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _679 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _683 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _679 * _645;
    out.m_58.x = _683;
    out.m_58.y = _687;
    out.m_58.z = _689;
    out.m_58.w = _681;
    bool _699 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _701 = isnan(_665);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _707 = _703 || _705;
    out.m_60.x = _691;
    out.m_60.y = _693;
    out.m_60.z = _695;
    out.m_60.w = _685;
    out.m_62.x = _655;
    out.m_62.y = _657;
    out.m_62.z = _659;
    out.m_62.w = _697;
    float _709 = _653;
    float _711 = _693;
    if (!_707)
    {
        _709 = 1.0;
    }
    float _713 = _709;
    bool _715 = !_707;
    float _717 = _713;
    if (!_715)
    {
        bool _719 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _721 = isnan(_665);
        bool _723 = _719 || _721;
        bool _725 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _727 = _723 || _725;
        if (!_727)
        {
            float _729 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _731 = _665 + _729;
            float _733 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _735 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _733;
            float _737 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _739 = _737 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _741 = 1.0 / _735;
            float _743 = _731 * _741;
            float _745 = fma(_743, _739, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _717 = _745;
            _747 = true;
        }
        else
        {
            bool _749 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _751 = isnan(_665);
            bool _753 = _749 || _751;
            bool _755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _757 = _753 || _755;
            if (!_757)
            {
                float _759 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _761 = _665 + _759;
                float _763 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _765 = _763 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _767 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _769 = _767 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _771 = 1.0 / _765;
                float _773 = _761 * _771;
                float _775 = fma(_773, _769, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _717 = _775;
                _747 = true;
            }
            else
            {
                _717 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _747 = false;
    float _777 = _717;
    float _779 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _781 = _621 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _785 = _627 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _789 = _629 + _787;
    float _791 = fma(_781, _777, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _793 = fma(_785, _777, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _795 = fma(_789, _777, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _791 + _797;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = _793 + _801;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _807 = _795 + _805;
    float _809 = _799 * _799;
    float _811 = fma(_803, _803, _809);
    float _813 = fma(_807, _807, _811);
    float _815 = rsqrt(_813);
    float _817 = _815 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _819 = _803 * _817;
    float _821 = _807 * _817;
    float _823 = _819 * _819;
    float _825 = _821 * _821;
    float _827 = _823 + _825;
    float _829 = sqrt(_827);
    bool _831 = _829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _835 = _829 + _833;
    float _837 = _691;
    float _839 = _827;
    float _841 = _835;
    float _843 = _799;
    float _845 = _777;
    float _847 = _819;
    if (_831)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _849;
    }
    float _851 = _837;
    if (_831)
    {
        float _853 = rsqrt(_827);
        _839 = _853;
    }
    float _855 = _839;
    float _857 = _855;
    if (_831)
    {
        float _859 = _835 * _851;
        _841 = _859;
    }
    float _861 = _841;
    if (_831)
    {
        float _863 = _861 * 0.15915493667125701904296875;
        _711 = _863;
    }
    float _865 = _711;
    float _867 = _807;
    if (_831)
    {
        float _869 = _865 * 6.283185482025146484375;
        float _871 = sin(_869);
        _867 = _871;
    }
    float _873 = _867;
    float _875 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _877 = precise::max(0.0, _875);
    float _879 = _851;
    float _881 = _877;
    if (_831)
    {
        float _883 = _865 * 6.283185482025146484375;
        float _885 = cos(_883);
        _879 = _885;
    }
    float _887 = _879;
    float _889 = -_817;
    float _891 = -_877;
    float _893 = fma(_799, _889, _891);
    if (_831)
    {
        float _895 = _893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _843 = _895;
    }
    float _897 = _843;
    float _899 = sqrt(_813);
    float _901 = _873;
    float _903 = _897;
    if (_831)
    {
        float _905 = fma(_873, _897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _901 = _905;
    }
    float _907 = _901;
    float _909 = _907;
    if (!_831)
    {
        _903 = _821;
    }
    float _911 = _903;
    float _913 = _911;
    if (_831)
    {
        float _915 = _887 + (-1.0);
        _881 = _915;
    }
    float _917 = _881;
    float _919 = _917;
    if (_831)
    {
        float _921 = _855 * _907;
        _845 = _921;
    }
    float _923 = _845;
    if (!_831)
    {
        _909 = _893;
    }
    float _925 = _909;
    float _927 = _925;
    if (_831)
    {
        float _929 = _917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _919 = _929;
    }
    float _931 = _919;
    float _933 = _931;
    if (_831)
    {
        float _935 = _819 * _923;
        _847 = _935;
    }
    float _937 = _847;
    if (!_831)
    {
        _857 = _823;
    }
    float _939 = _857;
    float _941 = _939;
    if (_831)
    {
        float _943 = _821 * _923;
        _913 = _943;
    }
    float _945 = _913;
    if (_831)
    {
        float _947 = fma(_893, _887, _931);
        _927 = _947;
    }
    float _949 = _927;
    if (_831)
    {
        float _951 = _937 * _937;
        _941 = _951;
    }
    float _953 = _941;
    if (!_831)
    {
        _933 = _825;
    }
    float _955 = _933;
    float _957 = _955;
    if (_831)
    {
        float _959 = _945 * _945;
        _957 = _959;
    }
    float _961 = _957;
    float _963 = fma(_949, _949, _953);
    float _965 = _791 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _967 = _963 + _961;
    float _969 = _791 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _973 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _971);
    float _975 = precise::clamp(_973, 0.0, 1.0);
    float _977 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].x, _965);
    float _979 = rsqrt(_967);
    float _981 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].x, _969);
    float _983 = _791 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _985 = -_975;
    float _987 = _985 + 1.0;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _991 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _993 = _791 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _995 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].x, _983);
    float _997 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[3].z, _977);
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1001 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].x, _993);
    float _1003 = abs(_987);
    float _1005 = log2(_1003);
    float _1007 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[1].z, _995);
    float _1009 = _999 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1011 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1001);
    float _1013 = _979 * _937;
    float _1015 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1017 = _979 * _949;
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1021 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1023 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1025 = _979 * _945;
    float _1027 = -_1009;
    float _1029 = fma(_1027, _989, 1.0);
    float _1031 = -_1021;
    float _1033 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1031);
    float _1035 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1023);
    float _1037 = _997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1039 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1041 = -_1025;
    float _1043 = fma(_1041, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1033);
    float _1045 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1047 = log2(_1029);
    float _1049 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1051 = fma(_1043, -0.5, 0.5);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1045);
    float _1055 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1057 = fma(_1043, 0.5, 0.5);
    float _1059 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1049);
    float _1061 = _1017 + 1.0;
    float _1063 = exp2(_1039);
    float _1065 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1055);
    float _1067 = fma(_1057, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1069 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1059);
    float _1071 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1065);
    float _1073 = fma(_1057, _1067, -0.212114393711090087890625);
    float _1075 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1069);
    float _1077 = 1.0 / _1053;
    float _1079 = _1047 * 0.693147182464599609375;
    float _1081 = fma(_1057, _1073, 1.570728778839111328125);
    float _1083 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1085 = sqrt(_1051);
    float _1087 = -_1017;
    float _1089 = fma(_1063, _1061, _1087);
    float _1091 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1071);
    float _1093 = fma(_1089, 0.5, 0.5);
    float _1095 = _1075 * _1077;
    float _1097 = _1091 * _1077;
    float _1099 = fma(_1095, 0.5, 0.5);
    float _1101 = fma(_1097, -0.5, 0.5);
    float _1103 = _1085 * 0.636619746685028076171875;
    float _1105 = -_1081;
    float _1107 = fma(_1103, _1105, 1.0);
    float3 _3100 = float3(_1099, _1101, _1083);
    float _1109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3100, float3(0.0), isnan(_3100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3100, float3(0.0), isnan(_3100)), level(0.0)).x;
    float3 _3111 = float3(_1099, _1101, _1083);
    float4 _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3111, float3(0.0), isnan(_3111)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3111, float3(0.0), isnan(_3111)), level(0.0)).xyzw;
    float _1114 = _1112.x;
    float _1116 = _1112.y;
    float _1118 = _1112.z;
    float _1120 = _1112.w;
    float2 _3128 = float2(_1107, _1093);
    float3 _1124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3128, float2(0.0), isnan(_3128)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3128, float2(0.0), isnan(_3128)), level(0.0)).xyz;
    float _1126 = _1124.x;
    float _1128 = _1124.y;
    float _1130 = _1124.z;
    float _1132 = _501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = _501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1136 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1138 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1134);
    float _1140 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1136);
    float _1142 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1138);
    float _1144 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1146 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1148 = 1.0 / _1144;
    float _1150 = _1146 + _1144;
    float _1152 = _1150 * _1148;
    float _1154 = _1152 * 0.5;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1158 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1156);
    float _1160 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1162 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan(0.5);
    bool _1170 = _1166 || _1168;
    float _1172 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1174 = 1.0 / _1158;
    float _1176 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1160);
    float _1178 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1176);
    float _1180 = exp2(_1172);
    float _1182 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1178);
    float _1184 = _1015;
    float _1186 = _999;
    if (_1170)
    {
        _1184 = 1.0;
    }
    float _1188 = _1184;
    float _1190 = _1188;
    if (_1170)
    {
        _1186 = 1.0;
    }
    float _1192 = _1186;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1196 = _1174 * _1194;
    float _1198 = _1192;
    if (!_1170)
    {
        float _1200 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1204 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1202;
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1206 * 6.283185482025146484375;
        float _1218 = sin(_1216);
        float _1220 = 1.0 / _1210;
        float _1222 = _1214 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = _1218 * _1220;
        float _1228 = _1214 * 6.283185482025146484375;
        float _1230 = sin(_1228);
        float _1232 = _1224 * _1226;
        float _1234 = 1.0 / _1204;
        float _1236 = 1.0 / _1232;
        float _1238 = _1230 * _1236;
        float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1242 = fma(_1196, _1238, _1240);
        float _1244 = _1242 * _1234;
        float _1246 = precise::clamp(_1244, 0.0, 1.0);
        _1190 = _1246;
    }
    float _1248 = _1190;
    if (!_1170)
    {
        float _1250 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = _1252 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1260 = _1258 * 0.15915493667125701904296875;
        float _1262 = _1252 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = 1.0 / _1256;
        float _1268 = _1260 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = _1260 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1270 * _1272;
        float _1280 = 1.0 / _1278;
        float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1284 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1282;
        float _1286 = 1.0 / _1284;
        float _1288 = _1276 * _1280;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1292 = fma(_1196, _1288, _1290);
        float _1294 = _1292 * _1286;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        float _1298 = -_1296;
        float _1300 = _1298 + 1.0;
        _1198 = _1300;
    }
    float _1302 = _1198;
    float _1304 = _1182 + _1053;
    float _1306 = -_1180;
    float _1308 = _1306 + 1.0;
    bool _1310 = _1248 > 0.0;
    bool _1312 = isnan(_1248);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    float _1320 = _1248 * _1302;
    float _1322 = _1304 * 0.5;
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1326 = _1302 <= 0.0;
    bool _1328 = !_1318;
    bool _1330 = _1326 || _1328;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_64.x = _793;
    out.m_64.y = _791;
    out.m_64.z = _795;
    float _1334 = _1324 * _1109;
    float _1336 = -_1324;
    float _1338 = _1336 + 1.0;
    float _1340 = _1332 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1342 = _1120 * _1334;
    float _1344 = _1130 * _1334;
    float _1346 = _1120 * _1338;
    out.gl_Position.x = _1075;
    out.gl_Position.y = _1091;
    out.gl_Position.z = _1182;
    out.gl_Position.w = _1053;
    float _1348 = fma(_1126, _1342, _1114);
    float _1350 = fma(_1128, _1342, _1116);
    float _1352 = fma(_1120, _1344, _1118);
    out.m_66.z = _1322;
    out.m_66.w = _1053;
    out.m_47.x = _1340;
    out.m_68.x = _1348;
    out.m_68.y = _1350;
    out.m_68.z = _1352;
    out.m_68.w = _1346;
    if (!_1330)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1354;
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
    bool _747 = false;
    bool _283 = false;
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
        float _1411 = as_type<float>(_103);
        out.gl_Position.z = _1411;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1479 = as_type<float>(_139);
        out.gl_Position.z = _1479;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_51.w;
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
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
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _143 * _189;
        float _199 = exp2(_197);
        float _201 = _195 * 0.693147182464599609375;
        float _203 = 1.0 / _201;
        float _205 = 1.0 / _193;
        float _207 = _199 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _203, _143);
        float _213 = _211 * _205;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_153;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _143 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _169 = _239;
    }
    float _241 = _169;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _155, _245);
    float _253 = fma(_241, _157, _247);
    float _255 = fma(_241, _159, _249);
    float _257 = fma(_251, _141, _161);
    float _259 = fma(_253, _141, _163);
    float _261 = fma(_255, _141, _165);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_53.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_87);
        float _287 = 1.0 / _285;
        float _289 = _121 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = as_type<float>(int(gl_VertexIndex));
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _291 + _295;
    bool _299 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_291);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = in.m_51.x;
    float _317 = in.m_51.y;
    float _319 = -_309;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    int _325 = as_type<int>(_293) & 1;
    bool _327 = _325 != 0;
    int _329 = as_type<int>(_293) & 2;
    bool _331 = _329 != 0;
    float _333 = _297 * _323;
    bool _335 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_291);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _351;
    float _355 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _345 * _321;
    float _359 = fma(_349, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _361 = fma(_353, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _369 = _359 * _357;
    float _371 = _361 * _357;
    float _373 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _367);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _379 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[144].x, _375);
    float _381 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[144].y, _377);
    bool _383 = !_331;
    float _385 = _383 ? (-0.5) : 0.5;
    bool _387 = !_327;
    float _389 = _387 ? (-0.5) : 0.5;
    float _391 = _381 * _317;
    float _393 = _379 * _315;
    float _395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _385);
    float _397 = _373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _399 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _401 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _389);
    float _403 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _405 = _399 * _395;
    float _407 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _409 = _403 * _401;
    float _411 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = _405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _415 = _405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = _405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _413);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _417);
    float _427 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[24].z, _421);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _433 = _427 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _435 = _429 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _437 = _431 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _439 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _397 + _435;
    float _443 = _433 + _437;
    float _445 = in.m_53.x;
    float _447 = in.m_53.y;
    float _449 = in.m_53.z;
    float _451 = in.m_53.w;
    float _453 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _455 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _457 = _441 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _461 = _443 + _459;
    float _463 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
    float _465 = _457 * _457;
    float _467 = _461 * _461;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _471 = _469 != 0;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _477 = _475 != 0;
    float _479 = _465 + _467;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _487 = _485 != 0;
    float _489 = sqrt(_479);
    bool _491 = _447 > 0.5;
    float _493 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[25].z, _425);
    bool _495 = _445 > 0.5;
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _499 = _449 > 0.5;
    float _501 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _503 = -_385;
    float _505 = _491 ? _503 : _385;
    float _507 = -_389;
    int _509 = _495 ? as_type<int>(_507) : as_type<int>(_389);
    bool _511 = _489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _513 = _451 > 0.5;
    float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _517 = -_389;
    int _519 = _499 ? as_type<int>(_517) : as_type<int>(_389);
    float _521 = -_385;
    int _523 = _513 ? as_type<int>(_521) : as_type<int>(_385);
    bool _525 = !_471;
    float _527 = _525 ? _389 : as_type<float>(_509);
    float _529 = _493 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _531 = !_483;
    float _533 = _531 ? _389 : as_type<float>(_519);
    bool _535 = !_477;
    float _537 = _535 ? _385 : _505;
    bool _539 = !_487;
    float _541 = _539 ? _385 : as_type<float>(_523);
    float _543 = _501 + _529;
    float _545 = _417;
    float _547 = _505;
    float _549 = _529;
    float _551 = _443;
    float _553 = _441;
    if (!_511)
    {
        _545 = _443;
    }
    float _555 = _545;
    float _557 = _555;
    if (!_511)
    {
        _547 = _467;
    }
    float _559 = _547;
    float _561 = _559;
    if (!_511)
    {
        _549 = _465;
    }
    float _563 = _549;
    float _565 = _563;
    if (!_511)
    {
        _551 = _543;
    }
    float _567 = _551;
    bool _569 = !_511;
    float _571 = _567;
    if (!_569)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _577 = _489 + _575;
        float _579 = _543 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = rsqrt(_479);
        float _583 = _577 * _573;
        float _585 = _583 * 0.15915493667125701904296875;
        float _587 = _585 * 6.283185482025146484375;
        float _589 = sin(_587);
        float _591 = _585 * 6.283185482025146484375;
        float _593 = cos(_591);
        float _595 = fma(_589, _579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _597 = _581 * _595;
        float _599 = _593 + (-1.0);
        float _601 = fma(_457, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _603 = fma(_461, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _605 = _599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _609 = _601 + _607;
        float _611 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _613 = _603 + _611;
        float _615 = fma(_543, _593, _605);
        float _617 = _609 * _609;
        float _619 = _613 * _613;
        _571 = _615;
        _565 = _617;
        _561 = _619;
        _553 = _601;
        _557 = _603;
    }
    float _621 = _571;
    float _623 = _565;
    float _625 = _561;
    float _627 = _553;
    float _629 = _557;
    float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _633 = _621 + _631;
    float _635 = _527 + 0.5;
    float _637 = -_537;
    float _639 = _637 + 0.5;
    float _641 = _533 + 0.5;
    float _643 = fma(_633, _633, _623);
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _647 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _651 = _641 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _653 = _643 + _625;
    float _655 = _647 * _473;
    float _657 = _649 * _497;
    float _659 = _651 * _515;
    float _661 = -_541;
    float _663 = _661 + 0.5;
    float _665 = sqrt(_653);
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _679 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _683 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _687 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _679 * _645;
    out.m_58.x = _683;
    out.m_58.y = _687;
    out.m_58.z = _689;
    out.m_58.w = _681;
    bool _699 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _701 = isnan(_665);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _707 = _703 || _705;
    out.m_60.x = _691;
    out.m_60.y = _693;
    out.m_60.z = _695;
    out.m_60.w = _685;
    out.m_62.x = _655;
    out.m_62.y = _657;
    out.m_62.z = _659;
    out.m_62.w = _697;
    float _709 = _653;
    float _711 = _693;
    if (!_707)
    {
        _709 = 1.0;
    }
    float _713 = _709;
    bool _715 = !_707;
    float _717 = _713;
    if (!_715)
    {
        bool _719 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _721 = isnan(_665);
        bool _723 = _719 || _721;
        bool _725 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _727 = _723 || _725;
        if (!_727)
        {
            float _729 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _731 = _665 + _729;
            float _733 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _735 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _733;
            float _737 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _739 = _737 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _741 = 1.0 / _735;
            float _743 = _731 * _741;
            float _745 = fma(_743, _739, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _717 = _745;
            _747 = true;
        }
        else
        {
            bool _749 = _665 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _751 = isnan(_665);
            bool _753 = _749 || _751;
            bool _755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _757 = _753 || _755;
            if (!_757)
            {
                float _759 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _761 = _665 + _759;
                float _763 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _765 = _763 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _767 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _769 = _767 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _771 = 1.0 / _765;
                float _773 = _761 * _771;
                float _775 = fma(_773, _769, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _717 = _775;
                _747 = true;
            }
            else
            {
                _717 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _747 = false;
    float _777 = _717;
    float _779 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _781 = _621 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _785 = _627 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _789 = _629 + _787;
    float _791 = fma(_781, _777, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _793 = fma(_785, _777, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _795 = fma(_789, _777, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _791 + _797;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = _793 + _801;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _807 = _795 + _805;
    float _809 = _799 * _799;
    float _811 = fma(_803, _803, _809);
    float _813 = fma(_807, _807, _811);
    float _815 = rsqrt(_813);
    float _817 = _815 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _819 = _803 * _817;
    float _821 = _807 * _817;
    float _823 = _819 * _819;
    float _825 = _821 * _821;
    float _827 = _823 + _825;
    float _829 = sqrt(_827);
    bool _831 = _829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _835 = _829 + _833;
    float _837 = _691;
    float _839 = _827;
    float _841 = _835;
    float _843 = _799;
    float _845 = _777;
    float _847 = _819;
    if (_831)
    {
        float _849 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _849;
    }
    float _851 = _837;
    if (_831)
    {
        float _853 = rsqrt(_827);
        _839 = _853;
    }
    float _855 = _839;
    float _857 = _855;
    if (_831)
    {
        float _859 = _835 * _851;
        _841 = _859;
    }
    float _861 = _841;
    if (_831)
    {
        float _863 = _861 * 0.15915493667125701904296875;
        _711 = _863;
    }
    float _865 = _711;
    float _867 = _807;
    if (_831)
    {
        float _869 = _865 * 6.283185482025146484375;
        float _871 = sin(_869);
        _867 = _871;
    }
    float _873 = _867;
    float _875 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _877 = precise::max(0.0, _875);
    float _879 = _851;
    float _881 = _877;
    if (_831)
    {
        float _883 = _865 * 6.283185482025146484375;
        float _885 = cos(_883);
        _879 = _885;
    }
    float _887 = _879;
    float _889 = -_817;
    float _891 = -_877;
    float _893 = fma(_799, _889, _891);
    if (_831)
    {
        float _895 = _893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _843 = _895;
    }
    float _897 = _843;
    float _899 = sqrt(_813);
    float _901 = _873;
    float _903 = _897;
    if (_831)
    {
        float _905 = fma(_873, _897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _901 = _905;
    }
    float _907 = _901;
    float _909 = _907;
    if (!_831)
    {
        _903 = _821;
    }
    float _911 = _903;
    float _913 = _911;
    if (_831)
    {
        float _915 = _887 + (-1.0);
        _881 = _915;
    }
    float _917 = _881;
    float _919 = _917;
    if (_831)
    {
        float _921 = _855 * _907;
        _845 = _921;
    }
    float _923 = _845;
    if (!_831)
    {
        _909 = _893;
    }
    float _925 = _909;
    float _927 = _925;
    if (_831)
    {
        float _929 = _917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _919 = _929;
    }
    float _931 = _919;
    float _933 = _931;
    if (_831)
    {
        float _935 = _819 * _923;
        _847 = _935;
    }
    float _937 = _847;
    if (!_831)
    {
        _857 = _823;
    }
    float _939 = _857;
    float _941 = _939;
    if (_831)
    {
        float _943 = _821 * _923;
        _913 = _943;
    }
    float _945 = _913;
    if (_831)
    {
        float _947 = fma(_893, _887, _931);
        _927 = _947;
    }
    float _949 = _927;
    if (_831)
    {
        float _951 = _937 * _937;
        _941 = _951;
    }
    float _953 = _941;
    if (!_831)
    {
        _933 = _825;
    }
    float _955 = _933;
    float _957 = _955;
    if (_831)
    {
        float _959 = _945 * _945;
        _957 = _959;
    }
    float _961 = _957;
    float _963 = fma(_949, _949, _953);
    float _965 = _791 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _967 = _963 + _961;
    float _969 = _791 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _973 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _971);
    float _975 = precise::clamp(_973, 0.0, 1.0);
    float _977 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].x, _965);
    float _979 = rsqrt(_967);
    float _981 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].x, _969);
    float _983 = _791 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _985 = -_975;
    float _987 = _985 + 1.0;
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _991 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _993 = _791 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _995 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].x, _983);
    float _997 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[3].z, _977);
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1001 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].x, _993);
    float _1003 = abs(_987);
    float _1005 = log2(_1003);
    float _1007 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[1].z, _995);
    float _1009 = _999 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1011 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1001);
    float _1013 = _979 * _937;
    float _1015 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1017 = _979 * _949;
    float _1019 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1021 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1023 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1025 = _979 * _945;
    float _1027 = -_1009;
    float _1029 = fma(_1027, _989, 1.0);
    float _1031 = -_1021;
    float _1033 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1031);
    float _1035 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1023);
    float _1037 = _997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1039 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1041 = -_1025;
    float _1043 = fma(_1041, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1033);
    float _1045 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1047 = log2(_1029);
    float _1049 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1051 = fma(_1043, -0.5, 0.5);
    float _1053 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1045);
    float _1055 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1057 = fma(_1043, 0.5, 0.5);
    float _1059 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1049);
    float _1061 = _1017 + 1.0;
    float _1063 = exp2(_1039);
    float _1065 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1055);
    float _1067 = fma(_1057, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1069 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1059);
    float _1071 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1065);
    float _1073 = fma(_1057, _1067, -0.212114393711090087890625);
    float _1075 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1069);
    float _1077 = 1.0 / _1053;
    float _1079 = _1047 * 0.693147182464599609375;
    float _1081 = fma(_1057, _1073, 1.570728778839111328125);
    float _1083 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1085 = sqrt(_1051);
    float _1087 = -_1017;
    float _1089 = fma(_1063, _1061, _1087);
    float _1091 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1071);
    float _1093 = fma(_1089, 0.5, 0.5);
    float _1095 = _1075 * _1077;
    float _1097 = _1091 * _1077;
    float _1099 = fma(_1095, 0.5, 0.5);
    float _1101 = fma(_1097, -0.5, 0.5);
    float _1103 = _1085 * 0.636619746685028076171875;
    float _1105 = -_1081;
    float _1107 = fma(_1103, _1105, 1.0);
    float3 _3100 = float3(_1099, _1101, _1083);
    float _1109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3100, float3(0.0), isnan(_3100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3100, float3(0.0), isnan(_3100)), level(0.0)).x;
    float3 _3111 = float3(_1099, _1101, _1083);
    float4 _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3111, float3(0.0), isnan(_3111)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3111, float3(0.0), isnan(_3111)), level(0.0)).xyzw;
    float _1114 = _1112.x;
    float _1116 = _1112.y;
    float _1118 = _1112.z;
    float _1120 = _1112.w;
    float2 _3128 = float2(_1107, _1093);
    float3 _1124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3128, float2(0.0), isnan(_3128)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3128, float2(0.0), isnan(_3128)), level(0.0)).xyz;
    float _1126 = _1124.x;
    float _1128 = _1124.y;
    float _1130 = _1124.z;
    float _1132 = _501 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = _501 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1136 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1138 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1134);
    float _1140 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1136);
    float _1142 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1138);
    float _1144 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1146 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1148 = 1.0 / _1144;
    float _1150 = _1146 + _1144;
    float _1152 = _1150 * _1148;
    float _1154 = _1152 * 0.5;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1158 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1156);
    float _1160 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1162 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan(0.5);
    bool _1170 = _1166 || _1168;
    float _1172 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1174 = 1.0 / _1158;
    float _1176 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1160);
    float _1178 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1176);
    float _1180 = exp2(_1172);
    float _1182 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1178);
    float _1184 = _1015;
    float _1186 = _999;
    if (_1170)
    {
        _1184 = 1.0;
    }
    float _1188 = _1184;
    float _1190 = _1188;
    if (_1170)
    {
        _1186 = 1.0;
    }
    float _1192 = _1186;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1196 = _1174 * _1194;
    float _1198 = _1192;
    if (!_1170)
    {
        float _1200 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1204 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1202;
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1206 * 6.283185482025146484375;
        float _1218 = sin(_1216);
        float _1220 = 1.0 / _1210;
        float _1222 = _1214 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = _1218 * _1220;
        float _1228 = _1214 * 6.283185482025146484375;
        float _1230 = sin(_1228);
        float _1232 = _1224 * _1226;
        float _1234 = 1.0 / _1204;
        float _1236 = 1.0 / _1232;
        float _1238 = _1230 * _1236;
        float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1242 = fma(_1196, _1238, _1240);
        float _1244 = _1242 * _1234;
        float _1246 = precise::clamp(_1244, 0.0, 1.0);
        _1190 = _1246;
    }
    float _1248 = _1190;
    if (!_1170)
    {
        float _1250 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = _1252 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1260 = _1258 * 0.15915493667125701904296875;
        float _1262 = _1252 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = 1.0 / _1256;
        float _1268 = _1260 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = _1260 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1270 * _1272;
        float _1280 = 1.0 / _1278;
        float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1284 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1282;
        float _1286 = 1.0 / _1284;
        float _1288 = _1276 * _1280;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1292 = fma(_1196, _1288, _1290);
        float _1294 = _1292 * _1286;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        float _1298 = -_1296;
        float _1300 = _1298 + 1.0;
        _1198 = _1300;
    }
    float _1302 = _1198;
    float _1304 = _1182 + _1053;
    float _1306 = -_1180;
    float _1308 = _1306 + 1.0;
    bool _1310 = _1248 > 0.0;
    bool _1312 = isnan(_1248);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    float _1320 = _1248 * _1302;
    float _1322 = _1304 * 0.5;
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1326 = _1302 <= 0.0;
    bool _1328 = !_1318;
    bool _1330 = _1326 || _1328;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_64.x = _793;
    out.m_64.y = _791;
    out.m_64.z = _795;
    float _1334 = _1324 * _1109;
    float _1336 = -_1324;
    float _1338 = _1336 + 1.0;
    float _1340 = _1332 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1342 = _1120 * _1334;
    float _1344 = _1130 * _1334;
    float _1346 = _1120 * _1338;
    out.gl_Position.x = _1075;
    out.gl_Position.y = _1091;
    out.gl_Position.z = _1182;
    out.gl_Position.w = _1053;
    float _1348 = fma(_1126, _1342, _1114);
    float _1350 = fma(_1128, _1342, _1116);
    float _1352 = fma(_1120, _1344, _1118);
    out.m_66.z = _1322;
    out.m_66.w = _1053;
    out.m_47.x = _1340;
    out.m_68.x = _1348;
    out.m_68.y = _1350;
    out.m_68.z = _1352;
    out.m_68.w = _1346;
    if (!_1330)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1354;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

