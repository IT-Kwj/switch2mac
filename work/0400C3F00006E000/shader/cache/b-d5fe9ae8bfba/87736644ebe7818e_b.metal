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
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _919 = false;
    bool _385 = false;
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
        float _1583 = as_type<float>(_103);
        out.gl_Position.z = _1583;
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
        float _1651 = as_type<float>(_139);
        out.gl_Position.z = _1651;
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
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _143);
        float _213 = _211 * _199;
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
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    bool _317 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_291);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _329;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = 1.0 / _311;
    float _337 = _327 * _315;
    float _339 = -_327;
    float _341 = _339 + 1.0;
    float _343 = _295 * _335;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_331, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _349 * _337;
    float _355 = _351 * _337;
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _353);
    float _359 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _361 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].x, _357);
    float _363 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].y, _359);
    bool _365 = !_333;
    float _383;
    if (!_365)
    {
        float _367 = in.m_53.x;
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _367 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_87);
        float _389 = 1.0 / _387;
        float _391 = _121 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = as_type<float>(int(gl_VertexIndex));
    float _397 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = in.m_51.x;
    float _401 = in.m_51.y;
    float _403 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _409 = in.m_53.x;
    float _411 = in.m_53.y;
    float _413 = in.m_53.z;
    float _415 = in.m_53.w;
    float _417 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _393 + _421;
    float _425 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    int _427 = as_type<int>(_395) & 1;
    bool _429 = _427 != 0;
    int _431 = as_type<int>(_395) & 2;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _441 = _439 != 0;
    float _443 = _363 * _401;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _447 = _445 != 0;
    float _449 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = !_433;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _469 = 1.0 / _457;
    bool _471 = !_429;
    float _473 = _471 ? (-0.5) : 0.5;
    float _475 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _465);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _393 + _479;
    bool _483 = _409 > 0.5;
    float _485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _473);
    float _487 = _475 * _477;
    float _489 = 1.0 / _461;
    float _491 = _361 * _399;
    float _493 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _495 = _425 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _497 = _411 > 0.5;
    float _499 = _491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _501 = _487 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _503 = _423 * _469;
    float _505 = _499 * _485;
    float _507 = _487 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _509 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _511 = _413 > 0.5;
    float _513 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].x, _507);
    float _515 = _467 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _517 = _481 * _489;
    float _519 = _487 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _521 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[24].z, _513);
    float _523 = -_473;
    int _525 = _483 ? as_type<int>(_523) : as_type<int>(_473);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].x, _519);
    float _533 = _521 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _535;
    bool _539 = _415 > 0.5;
    float _541 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[26].z, _531);
    float _543 = _495 + _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _545;
    float _549 = fma(_537, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _551 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = fma(_529, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_547, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _561 = _515 + _551;
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _543 + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _577 = _561 + _575;
    float _579 = _565 * _565;
    float _581 = -_473;
    int _583 = _511 ? as_type<int>(_581) : as_type<int>(_473);
    float _585 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].x, _501);
    float _587 = _577 * _577;
    bool _589 = !_437;
    float _591 = _589 ? _473 : as_type<float>(_525);
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _595 = !_447;
    float _597 = _595 ? _473 : as_type<float>(_583);
    float _599 = _579 + _587;
    bool _601 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _603 = isnan(_393);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[25].z, _585);
    bool _615 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _617 = isnan(_393);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_559, _517, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _629 = -_465;
    int _631 = _497 ? as_type<int>(_629) : as_type<int>(_465);
    float _633 = sqrt(_599);
    bool _635 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _637 = isnan(_393);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_611;
    float _649 = _647 + 1.0;
    float _651 = -_625;
    float _653 = _651 + 1.0;
    float _655 = -_465;
    int _657 = _539 ? as_type<int>(_655) : as_type<int>(_465);
    float _659 = fma(_569, _517, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = _645 * _649;
    float _663 = fma(_573, _517, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _667 = _613 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _669 = _611 * _653;
    bool _671 = !_441;
    float _673 = _671 ? _465 : as_type<float>(_631);
    float _675 = _553 * _661;
    bool _677 = !_453;
    float _679 = _677 ? _465 : as_type<float>(_657);
    float _681 = _549 * _661;
    float _683 = _555 * _661;
    bool _685 = _633 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _689 = -_645;
    float _691 = _689 + 1.0;
    float _693 = _509 + _667;
    float _695 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].x, _681);
    float _697 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].z, _683);
    float _701 = _549;
    float _703 = _681;
    float _705 = _691;
    float _707 = _613;
    float _709 = _579;
    float _711 = _509;
    if (!_685)
    {
        _701 = _587;
    }
    float _713 = _701;
    float _715 = _713;
    if (!_685)
    {
        _703 = _543;
    }
    float _717 = _703;
    float _719 = _717;
    if (!_685)
    {
        _705 = _561;
    }
    float _721 = _705;
    float _723 = _721;
    if (!_685)
    {
        _707 = _693;
    }
    float _725 = _707;
    bool _727 = !_685;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _633 + _733;
        float _737 = rsqrt(_599);
        float _739 = _735 * _731;
        float _741 = _693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _743 = _739 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = sin(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = fma(_747, _741, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _755 = _737 * _753;
        float _757 = fma(_565, _755, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _759 = _751 + (-1.0);
        float _761 = fma(_577, _755, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _765 = _757 + _763;
        float _767 = _759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _771 = _761 + _769;
        float _773 = _765 * _765;
        float _775 = fma(_693, _751, _767);
        float _777 = _771 * _771;
        _729 = _775;
        _709 = _773;
        _715 = _777;
        _719 = _757;
        _723 = _761;
    }
    float _779 = _729;
    float _781 = _709;
    float _783 = _715;
    float _785 = _719;
    float _787 = _723;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _791 = _779 + _789;
    float _793 = -_673;
    float _795 = _793 + 0.5;
    float _797 = fma(_627, _669, _695);
    float _799 = fma(_659, _669, _697);
    float _801 = fma(_791, _791, _781);
    float _803 = fma(_663, _669, _699);
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _807 = _597 + 0.5;
    float _809 = -_679;
    float _811 = _809 + 0.5;
    float _813 = _795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].x, _797);
    float _817 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].y, _799);
    float _819 = _801 + _783;
    float _821 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].z, _803);
    float _823 = _807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _825 = _811 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _827 = _813 * _593;
    float _829 = _591 + 0.5;
    float _831 = _823 * _687;
    float _833 = sqrt(_819);
    float _835 = _829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _843 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _847 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _849 = _835 * _665;
    float _851 = _825 * _805;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _849;
    out.m_58.y = _827;
    out.m_58.z = _831;
    out.m_58.w = _851;
    bool _869 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _871 = isnan(_833);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _877 = _873 || _875;
    out.m_60.x = _857;
    out.m_60.y = _859;
    out.m_60.z = _861;
    out.m_60.w = _855;
    out.m_62.x = _863;
    out.m_62.y = _865;
    out.m_62.z = _867;
    out.m_62.w = _853;
    float _879 = _805;
    float _881 = _827;
    float _883 = _863;
    if (!_877)
    {
        _879 = 1.0;
    }
    float _885 = _879;
    bool _887 = !_877;
    float _889 = _885;
    if (!_887)
    {
        bool _891 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _893 = isnan(_833);
        bool _895 = _891 || _893;
        bool _897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _899 = _895 || _897;
        if (!_899)
        {
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _903 = _833 + _901;
            float _905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _905;
            float _909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _911 = _909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _913 = 1.0 / _907;
            float _915 = _903 * _913;
            float _917 = fma(_915, _911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _889 = _917;
            _919 = true;
        }
        else
        {
            bool _921 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _923 = isnan(_833);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _929 = _925 || _927;
            if (!_929)
            {
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _933 = _833 + _931;
                float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _937 = _935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _941 = _939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _943 = 1.0 / _937;
                float _945 = _933 * _943;
                float _947 = fma(_945, _941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _889 = _947;
                _919 = true;
            }
            else
            {
                _889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _919 = false;
    float _949 = _889;
    float _951 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _953 = _779 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _957 = _785 + _955;
    float _959 = fma(_953, _949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _961 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _963 = _787 + _961;
    float _965 = fma(_957, _949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _959 + _967;
    float _971 = fma(_963, _949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _965 + _973;
    float _977 = _969 * _969;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _981 = _971 + _979;
    float _983 = fma(_975, _975, _977);
    float _985 = fma(_981, _981, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _981 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _987;
    float _1011 = _999;
    float _1013 = _1007;
    float _1015 = _989;
    if (_1003)
    {
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1017;
    }
    float _1019 = _1009;
    if (_1003)
    {
        float _1021 = rsqrt(_999);
        _1011 = _1021;
    }
    float _1023 = _1011;
    float _1025 = _1023;
    if (_1003)
    {
        float _1027 = _1007 * _1019;
        _1013 = _1027;
    }
    float _1029 = _1013;
    if (_1003)
    {
        float _1031 = _1029 * 0.15915493667125701904296875;
        _881 = _1031;
    }
    float _1033 = _881;
    float _1035 = _981;
    if (_1003)
    {
        float _1037 = _1033 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        _1035 = _1039;
    }
    float _1041 = _1035;
    float _1043 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1045 = precise::max(0.0, _1043);
    float _1047 = _843;
    float _1049 = _1045;
    float _1051 = _1043;
    if (_1003)
    {
        float _1053 = _1033 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        _1047 = _1055;
    }
    float _1057 = _1047;
    float _1059 = -_989;
    float _1061 = -_1045;
    float _1063 = fma(_969, _1059, _1061);
    float _1065 = _1063;
    if (_1003)
    {
        float _1067 = _1063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1067;
    }
    float _1069 = _1049;
    float _1071 = sqrt(_985);
    float _1073 = _1041;
    float _1075 = _1069;
    if (_1003)
    {
        float _1077 = fma(_1041, _1069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1073 = _1077;
    }
    float _1079 = _1073;
    float _1081 = _1079;
    if (!_1003)
    {
        _1075 = _991;
    }
    float _1083 = _1075;
    float _1085 = _1083;
    if (_1003)
    {
        float _1087 = _1057 + (-1.0);
        _1051 = _1087;
    }
    float _1089 = _1051;
    float _1091 = _1089;
    if (_1003)
    {
        float _1093 = _1023 * _1079;
        _883 = _1093;
    }
    float _1095 = _883;
    if (!_1003)
    {
        _1081 = _1063;
    }
    float _1097 = _1081;
    float _1099 = _959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1101 = _1097;
    if (_1003)
    {
        float _1103 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1103;
    }
    float _1105 = _1015;
    if (_1003)
    {
        float _1107 = _991 * _1095;
        _1085 = _1107;
    }
    float _1109 = _1085;
    if (!_1003)
    {
        _1091 = _993;
    }
    float _1111 = _1091;
    float _1113 = _1111;
    if (_1003)
    {
        float _1115 = _993 * _1095;
        _1113 = _1115;
    }
    float _1117 = _1113;
    if (!_1003)
    {
        _1025 = _995;
    }
    float _1119 = _1025;
    float _1121 = _1119;
    if (_1003)
    {
        float _1123 = fma(_1063, _1057, _1105);
        _1101 = _1123;
    }
    float _1125 = _1101;
    if (_1003)
    {
        float _1127 = _1109 * _1109;
        _1121 = _1127;
    }
    float _1129 = _1121;
    if (!_1003)
    {
        _1065 = _997;
    }
    float _1131 = _1065;
    float _1133 = _1131;
    if (_1003)
    {
        float _1135 = _1117 * _1117;
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_1125, _1125, _1129);
    float _1141 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1099);
    float _1143 = _1139 + _1137;
    float _1145 = _959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1149 = fma(_1071, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1147);
    float _1151 = precise::clamp(_1149, 0.0, 1.0);
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1155 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1157 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1145);
    float _1159 = rsqrt(_1143);
    float _1161 = _959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1163 = -_1151;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1157);
    float _1169 = _959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1171 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1161);
    float _1173 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1175 = abs(_1165);
    float _1177 = log2(_1175);
    float _1179 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1169);
    float _1181 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1171);
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1185 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1179);
    float _1187 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1189 = -_1183;
    float _1191 = fma(_1189, _1153, 1.0);
    float _1193 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1195 = _1159 * _1109;
    float _1197 = _1159 * _1125;
    float _1199 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1203 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1205 = _1159 * _1117;
    float _1207 = log2(_1191);
    float _1209 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1211 = -_1203;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1201);
    float _1217 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1219 = -_1205;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1223 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1215);
    float _1225 = exp2(_1209);
    float _1227 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1229 = fma(_1221, -0.5, 0.5);
    float _1231 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1223);
    float _1233 = fma(_1221, 0.5, 0.5);
    float _1235 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1227);
    float _1237 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1217);
    float _1239 = _1197 + 1.0;
    float _1241 = 1.0 / _1231;
    float _1243 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1235);
    float _1245 = fma(_1233, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1247 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1249 = fma(_1233, _1245, -0.212114393711090087890625);
    float _1251 = sqrt(_1229);
    float _1253 = -_1197;
    float _1255 = fma(_1225, _1239, _1253);
    float _1257 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1243);
    float _1259 = _1207 * 0.693147182464599609375;
    float _1261 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1247);
    float _1263 = fma(_1233, _1249, 1.570728778839111328125);
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1267 = _1257 * _1241;
    float _1269 = _1261 * _1241;
    float _1271 = fma(_1267, 0.5, 0.5);
    float _1273 = fma(_1269, -0.5, 0.5);
    float _1275 = _1251 * 0.636619746685028076171875;
    float _1277 = fma(_1255, 0.5, 0.5);
    float _1279 = -_1263;
    float _1281 = fma(_1275, _1279, 1.0);
    float3 _3555 = float3(_1271, _1273, _1265);
    float _1283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3555, float3(0.0), isnan(_3555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3555, float3(0.0), isnan(_3555)), level(0.0)).x;
    float3 _3566 = float3(_1271, _1273, _1265);
    float4 _1286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3566, float3(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3566, float3(0.0), isnan(_3566)), level(0.0)).xyzw;
    float _1288 = _1286.x;
    float _1290 = _1286.y;
    float _1292 = _1286.z;
    float _1294 = _1286.w;
    float2 _3583 = float2(_1281, _1277);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3583, float2(0.0), isnan(_3583)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3583, float2(0.0), isnan(_3583)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = _509 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1308 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1310 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1306);
    float _1312 = _509 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1314 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1310);
    float _1316 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1312);
    float _1318 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1320 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1316);
    float _1322 = 1.0 / _1318;
    float _1324 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1326 = _1324 + _1318;
    float _1328 = _1326 * _1322;
    float _1330 = _1328 * 0.5;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1334 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1332);
    bool _1336 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.5);
    bool _1344 = _1340 || _1342;
    float _1346 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1348 = 1.0 / _1334;
    float _1350 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1346);
    float _1352 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1350);
    float _1354 = exp2(_1308);
    float _1356 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1352);
    float _1358 = _1173;
    if (_1344)
    {
        _1358 = 1.0;
    }
    float _1360 = _1358;
    float _1362 = _1360;
    if (_1344)
    {
        _711 = 1.0;
    }
    float _1364 = _711;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1368 = _1348 * _1366;
    float _1370 = _1364;
    if (!_1344)
    {
        float _1372 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1374 = _1372 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1374 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = 1.0 / _1378;
        float _1390 = _1382 * 6.283185482025146484375;
        float _1392 = cos(_1390);
        float _1394 = _1386 * _1388;
        float _1396 = _1382 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1400;
        float _1404 = _1392 * _1394;
        float _1406 = 1.0 / _1404;
        float _1408 = 1.0 / _1402;
        float _1410 = _1398 * _1406;
        float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1414 = fma(_1368, _1410, _1412);
        float _1416 = _1414 * _1408;
        float _1418 = precise::clamp(_1416, 0.0, 1.0);
        _1362 = _1418;
    }
    float _1420 = _1362;
    if (!_1344)
    {
        float _1422 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1424 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1432 = _1430 * 0.15915493667125701904296875;
        float _1434 = _1424 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        float _1438 = 1.0 / _1428;
        float _1440 = _1432 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1436 * _1438;
        float _1446 = _1432 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        float _1450 = _1442 * _1444;
        float _1452 = 1.0 / _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1454;
        float _1458 = 1.0 / _1456;
        float _1460 = _1448 * _1452;
        float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1464 = fma(_1368, _1460, _1462);
        float _1466 = _1464 * _1458;
        float _1468 = precise::clamp(_1466, 0.0, 1.0);
        float _1470 = -_1468;
        float _1472 = _1470 + 1.0;
        _1370 = _1472;
    }
    float _1474 = _1370;
    float _1476 = _1420 * _1474;
    float _1478 = -_1354;
    float _1480 = _1478 + 1.0;
    bool _1482 = _1420 > 0.0;
    bool _1484 = isnan(_1420);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(0.0);
    bool _1490 = _1486 || _1488;
    float _1492 = _1356 + _1231;
    float _1494 = _1476 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1496 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1498 = _1474 <= 0.0;
    bool _1500 = !_1490;
    bool _1502 = _1498 || _1500;
    float _1504 = _1492 * 0.5;
    float _1506 = _1494 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1508 = _1496 * _1283;
    float _1510 = -_1496;
    float _1512 = _1510 + 1.0;
    out.m_64.x = _965;
    out.m_64.y = _959;
    out.m_64.z = _971;
    float _1514 = _1294 * _1508;
    float _1516 = _1304 * _1508;
    float _1518 = _1294 * _1512;
    out.gl_Position.x = _1257;
    out.gl_Position.y = _1261;
    out.gl_Position.z = _1356;
    out.gl_Position.w = _1231;
    float _1520 = fma(_1300, _1514, _1288);
    float _1522 = fma(_1302, _1514, _1290);
    float _1524 = fma(_1294, _1516, _1292);
    out.m_66.z = _1504;
    out.m_66.w = _1231;
    out.m_47.x = _1506;
    out.m_68.x = _1520;
    out.m_68.y = _1522;
    out.m_68.z = _1524;
    out.m_68.w = _1518;
    if (!_1502)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1526 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1526;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _919 = false;
    bool _385 = false;
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
        float _1583 = as_type<float>(_103);
        out.gl_Position.z = _1583;
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
        float _1651 = as_type<float>(_139);
        out.gl_Position.z = _1651;
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
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _143);
        float _213 = _211 * _199;
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
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    bool _317 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_291);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _329;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = 1.0 / _311;
    float _337 = _327 * _315;
    float _339 = -_327;
    float _341 = _339 + 1.0;
    float _343 = _295 * _335;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_331, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _349 * _337;
    float _355 = _351 * _337;
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _353);
    float _359 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _361 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].x, _357);
    float _363 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].y, _359);
    bool _365 = !_333;
    float _383;
    if (!_365)
    {
        float _367 = in.m_53.x;
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _367 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_87);
        float _389 = 1.0 / _387;
        float _391 = _121 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = as_type<float>(int(gl_VertexIndex));
    float _397 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = in.m_51.x;
    float _401 = in.m_51.y;
    float _403 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _409 = in.m_53.x;
    float _411 = in.m_53.y;
    float _413 = in.m_53.z;
    float _415 = in.m_53.w;
    float _417 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _393 + _421;
    float _425 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    int _427 = as_type<int>(_395) & 1;
    bool _429 = _427 != 0;
    int _431 = as_type<int>(_395) & 2;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _441 = _439 != 0;
    float _443 = _363 * _401;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _447 = _445 != 0;
    float _449 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = !_433;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _469 = 1.0 / _457;
    bool _471 = !_429;
    float _473 = _471 ? (-0.5) : 0.5;
    float _475 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _465);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _393 + _479;
    bool _483 = _409 > 0.5;
    float _485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _473);
    float _487 = _475 * _477;
    float _489 = 1.0 / _461;
    float _491 = _361 * _399;
    float _493 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _495 = _425 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _497 = _411 > 0.5;
    float _499 = _491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _501 = _487 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _503 = _423 * _469;
    float _505 = _499 * _485;
    float _507 = _487 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _509 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _511 = _413 > 0.5;
    float _513 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].x, _507);
    float _515 = _467 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _517 = _481 * _489;
    float _519 = _487 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _521 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[24].z, _513);
    float _523 = -_473;
    int _525 = _483 ? as_type<int>(_523) : as_type<int>(_473);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].x, _519);
    float _533 = _521 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _535;
    bool _539 = _415 > 0.5;
    float _541 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[26].z, _531);
    float _543 = _495 + _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _545;
    float _549 = fma(_537, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _551 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = fma(_529, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_547, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _561 = _515 + _551;
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _543 + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _577 = _561 + _575;
    float _579 = _565 * _565;
    float _581 = -_473;
    int _583 = _511 ? as_type<int>(_581) : as_type<int>(_473);
    float _585 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].x, _501);
    float _587 = _577 * _577;
    bool _589 = !_437;
    float _591 = _589 ? _473 : as_type<float>(_525);
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _595 = !_447;
    float _597 = _595 ? _473 : as_type<float>(_583);
    float _599 = _579 + _587;
    bool _601 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _603 = isnan(_393);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[25].z, _585);
    bool _615 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _617 = isnan(_393);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_559, _517, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _629 = -_465;
    int _631 = _497 ? as_type<int>(_629) : as_type<int>(_465);
    float _633 = sqrt(_599);
    bool _635 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _637 = isnan(_393);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_611;
    float _649 = _647 + 1.0;
    float _651 = -_625;
    float _653 = _651 + 1.0;
    float _655 = -_465;
    int _657 = _539 ? as_type<int>(_655) : as_type<int>(_465);
    float _659 = fma(_569, _517, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = _645 * _649;
    float _663 = fma(_573, _517, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _667 = _613 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _669 = _611 * _653;
    bool _671 = !_441;
    float _673 = _671 ? _465 : as_type<float>(_631);
    float _675 = _553 * _661;
    bool _677 = !_453;
    float _679 = _677 ? _465 : as_type<float>(_657);
    float _681 = _549 * _661;
    float _683 = _555 * _661;
    bool _685 = _633 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _689 = -_645;
    float _691 = _689 + 1.0;
    float _693 = _509 + _667;
    float _695 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].x, _681);
    float _697 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].z, _683);
    float _701 = _549;
    float _703 = _681;
    float _705 = _691;
    float _707 = _613;
    float _709 = _579;
    float _711 = _509;
    if (!_685)
    {
        _701 = _587;
    }
    float _713 = _701;
    float _715 = _713;
    if (!_685)
    {
        _703 = _543;
    }
    float _717 = _703;
    float _719 = _717;
    if (!_685)
    {
        _705 = _561;
    }
    float _721 = _705;
    float _723 = _721;
    if (!_685)
    {
        _707 = _693;
    }
    float _725 = _707;
    bool _727 = !_685;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _633 + _733;
        float _737 = rsqrt(_599);
        float _739 = _735 * _731;
        float _741 = _693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _743 = _739 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = sin(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = fma(_747, _741, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _755 = _737 * _753;
        float _757 = fma(_565, _755, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _759 = _751 + (-1.0);
        float _761 = fma(_577, _755, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _765 = _757 + _763;
        float _767 = _759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _771 = _761 + _769;
        float _773 = _765 * _765;
        float _775 = fma(_693, _751, _767);
        float _777 = _771 * _771;
        _729 = _775;
        _709 = _773;
        _715 = _777;
        _719 = _757;
        _723 = _761;
    }
    float _779 = _729;
    float _781 = _709;
    float _783 = _715;
    float _785 = _719;
    float _787 = _723;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _791 = _779 + _789;
    float _793 = -_673;
    float _795 = _793 + 0.5;
    float _797 = fma(_627, _669, _695);
    float _799 = fma(_659, _669, _697);
    float _801 = fma(_791, _791, _781);
    float _803 = fma(_663, _669, _699);
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _807 = _597 + 0.5;
    float _809 = -_679;
    float _811 = _809 + 0.5;
    float _813 = _795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].x, _797);
    float _817 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].y, _799);
    float _819 = _801 + _783;
    float _821 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].z, _803);
    float _823 = _807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _825 = _811 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _827 = _813 * _593;
    float _829 = _591 + 0.5;
    float _831 = _823 * _687;
    float _833 = sqrt(_819);
    float _835 = _829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _843 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _847 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _849 = _835 * _665;
    float _851 = _825 * _805;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _849;
    out.m_58.y = _827;
    out.m_58.z = _831;
    out.m_58.w = _851;
    bool _869 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _871 = isnan(_833);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _877 = _873 || _875;
    out.m_60.x = _857;
    out.m_60.y = _859;
    out.m_60.z = _861;
    out.m_60.w = _855;
    out.m_62.x = _863;
    out.m_62.y = _865;
    out.m_62.z = _867;
    out.m_62.w = _853;
    float _879 = _805;
    float _881 = _827;
    float _883 = _863;
    if (!_877)
    {
        _879 = 1.0;
    }
    float _885 = _879;
    bool _887 = !_877;
    float _889 = _885;
    if (!_887)
    {
        bool _891 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _893 = isnan(_833);
        bool _895 = _891 || _893;
        bool _897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _899 = _895 || _897;
        if (!_899)
        {
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _903 = _833 + _901;
            float _905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _905;
            float _909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _911 = _909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _913 = 1.0 / _907;
            float _915 = _903 * _913;
            float _917 = fma(_915, _911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _889 = _917;
            _919 = true;
        }
        else
        {
            bool _921 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _923 = isnan(_833);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _929 = _925 || _927;
            if (!_929)
            {
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _933 = _833 + _931;
                float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _937 = _935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _941 = _939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _943 = 1.0 / _937;
                float _945 = _933 * _943;
                float _947 = fma(_945, _941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _889 = _947;
                _919 = true;
            }
            else
            {
                _889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _919 = false;
    float _949 = _889;
    float _951 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _953 = _779 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _957 = _785 + _955;
    float _959 = fma(_953, _949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _961 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _963 = _787 + _961;
    float _965 = fma(_957, _949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _959 + _967;
    float _971 = fma(_963, _949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _965 + _973;
    float _977 = _969 * _969;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _981 = _971 + _979;
    float _983 = fma(_975, _975, _977);
    float _985 = fma(_981, _981, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _981 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _987;
    float _1011 = _999;
    float _1013 = _1007;
    float _1015 = _989;
    if (_1003)
    {
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1017;
    }
    float _1019 = _1009;
    if (_1003)
    {
        float _1021 = rsqrt(_999);
        _1011 = _1021;
    }
    float _1023 = _1011;
    float _1025 = _1023;
    if (_1003)
    {
        float _1027 = _1007 * _1019;
        _1013 = _1027;
    }
    float _1029 = _1013;
    if (_1003)
    {
        float _1031 = _1029 * 0.15915493667125701904296875;
        _881 = _1031;
    }
    float _1033 = _881;
    float _1035 = _981;
    if (_1003)
    {
        float _1037 = _1033 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        _1035 = _1039;
    }
    float _1041 = _1035;
    float _1043 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1045 = precise::max(0.0, _1043);
    float _1047 = _843;
    float _1049 = _1045;
    float _1051 = _1043;
    if (_1003)
    {
        float _1053 = _1033 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        _1047 = _1055;
    }
    float _1057 = _1047;
    float _1059 = -_989;
    float _1061 = -_1045;
    float _1063 = fma(_969, _1059, _1061);
    float _1065 = _1063;
    if (_1003)
    {
        float _1067 = _1063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1067;
    }
    float _1069 = _1049;
    float _1071 = sqrt(_985);
    float _1073 = _1041;
    float _1075 = _1069;
    if (_1003)
    {
        float _1077 = fma(_1041, _1069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1073 = _1077;
    }
    float _1079 = _1073;
    float _1081 = _1079;
    if (!_1003)
    {
        _1075 = _991;
    }
    float _1083 = _1075;
    float _1085 = _1083;
    if (_1003)
    {
        float _1087 = _1057 + (-1.0);
        _1051 = _1087;
    }
    float _1089 = _1051;
    float _1091 = _1089;
    if (_1003)
    {
        float _1093 = _1023 * _1079;
        _883 = _1093;
    }
    float _1095 = _883;
    if (!_1003)
    {
        _1081 = _1063;
    }
    float _1097 = _1081;
    float _1099 = _959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1101 = _1097;
    if (_1003)
    {
        float _1103 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1103;
    }
    float _1105 = _1015;
    if (_1003)
    {
        float _1107 = _991 * _1095;
        _1085 = _1107;
    }
    float _1109 = _1085;
    if (!_1003)
    {
        _1091 = _993;
    }
    float _1111 = _1091;
    float _1113 = _1111;
    if (_1003)
    {
        float _1115 = _993 * _1095;
        _1113 = _1115;
    }
    float _1117 = _1113;
    if (!_1003)
    {
        _1025 = _995;
    }
    float _1119 = _1025;
    float _1121 = _1119;
    if (_1003)
    {
        float _1123 = fma(_1063, _1057, _1105);
        _1101 = _1123;
    }
    float _1125 = _1101;
    if (_1003)
    {
        float _1127 = _1109 * _1109;
        _1121 = _1127;
    }
    float _1129 = _1121;
    if (!_1003)
    {
        _1065 = _997;
    }
    float _1131 = _1065;
    float _1133 = _1131;
    if (_1003)
    {
        float _1135 = _1117 * _1117;
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_1125, _1125, _1129);
    float _1141 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1099);
    float _1143 = _1139 + _1137;
    float _1145 = _959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1149 = fma(_1071, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1147);
    float _1151 = precise::clamp(_1149, 0.0, 1.0);
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1155 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1157 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1145);
    float _1159 = rsqrt(_1143);
    float _1161 = _959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1163 = -_1151;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1157);
    float _1169 = _959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1171 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1161);
    float _1173 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1175 = abs(_1165);
    float _1177 = log2(_1175);
    float _1179 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1169);
    float _1181 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1171);
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1185 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1179);
    float _1187 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1189 = -_1183;
    float _1191 = fma(_1189, _1153, 1.0);
    float _1193 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1195 = _1159 * _1109;
    float _1197 = _1159 * _1125;
    float _1199 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1203 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1205 = _1159 * _1117;
    float _1207 = log2(_1191);
    float _1209 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1211 = -_1203;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1201);
    float _1217 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1219 = -_1205;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1223 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1215);
    float _1225 = exp2(_1209);
    float _1227 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1229 = fma(_1221, -0.5, 0.5);
    float _1231 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1223);
    float _1233 = fma(_1221, 0.5, 0.5);
    float _1235 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1227);
    float _1237 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1217);
    float _1239 = _1197 + 1.0;
    float _1241 = 1.0 / _1231;
    float _1243 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1235);
    float _1245 = fma(_1233, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1247 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1249 = fma(_1233, _1245, -0.212114393711090087890625);
    float _1251 = sqrt(_1229);
    float _1253 = -_1197;
    float _1255 = fma(_1225, _1239, _1253);
    float _1257 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1243);
    float _1259 = _1207 * 0.693147182464599609375;
    float _1261 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1247);
    float _1263 = fma(_1233, _1249, 1.570728778839111328125);
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1267 = _1257 * _1241;
    float _1269 = _1261 * _1241;
    float _1271 = fma(_1267, 0.5, 0.5);
    float _1273 = fma(_1269, -0.5, 0.5);
    float _1275 = _1251 * 0.636619746685028076171875;
    float _1277 = fma(_1255, 0.5, 0.5);
    float _1279 = -_1263;
    float _1281 = fma(_1275, _1279, 1.0);
    float3 _3555 = float3(_1271, _1273, _1265);
    float _1283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3555, float3(0.0), isnan(_3555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3555, float3(0.0), isnan(_3555)), level(0.0)).x;
    float3 _3566 = float3(_1271, _1273, _1265);
    float4 _1286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3566, float3(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3566, float3(0.0), isnan(_3566)), level(0.0)).xyzw;
    float _1288 = _1286.x;
    float _1290 = _1286.y;
    float _1292 = _1286.z;
    float _1294 = _1286.w;
    float2 _3583 = float2(_1281, _1277);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3583, float2(0.0), isnan(_3583)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3583, float2(0.0), isnan(_3583)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = _509 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1308 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1310 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1306);
    float _1312 = _509 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1314 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1310);
    float _1316 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1312);
    float _1318 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1320 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1316);
    float _1322 = 1.0 / _1318;
    float _1324 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1326 = _1324 + _1318;
    float _1328 = _1326 * _1322;
    float _1330 = _1328 * 0.5;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1334 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1332);
    bool _1336 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.5);
    bool _1344 = _1340 || _1342;
    float _1346 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1348 = 1.0 / _1334;
    float _1350 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1346);
    float _1352 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1350);
    float _1354 = exp2(_1308);
    float _1356 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1352);
    float _1358 = _1173;
    if (_1344)
    {
        _1358 = 1.0;
    }
    float _1360 = _1358;
    float _1362 = _1360;
    if (_1344)
    {
        _711 = 1.0;
    }
    float _1364 = _711;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1368 = _1348 * _1366;
    float _1370 = _1364;
    if (!_1344)
    {
        float _1372 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1374 = _1372 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1374 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = 1.0 / _1378;
        float _1390 = _1382 * 6.283185482025146484375;
        float _1392 = cos(_1390);
        float _1394 = _1386 * _1388;
        float _1396 = _1382 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1400;
        float _1404 = _1392 * _1394;
        float _1406 = 1.0 / _1404;
        float _1408 = 1.0 / _1402;
        float _1410 = _1398 * _1406;
        float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1414 = fma(_1368, _1410, _1412);
        float _1416 = _1414 * _1408;
        float _1418 = precise::clamp(_1416, 0.0, 1.0);
        _1362 = _1418;
    }
    float _1420 = _1362;
    if (!_1344)
    {
        float _1422 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1424 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1432 = _1430 * 0.15915493667125701904296875;
        float _1434 = _1424 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        float _1438 = 1.0 / _1428;
        float _1440 = _1432 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1436 * _1438;
        float _1446 = _1432 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        float _1450 = _1442 * _1444;
        float _1452 = 1.0 / _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1454;
        float _1458 = 1.0 / _1456;
        float _1460 = _1448 * _1452;
        float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1464 = fma(_1368, _1460, _1462);
        float _1466 = _1464 * _1458;
        float _1468 = precise::clamp(_1466, 0.0, 1.0);
        float _1470 = -_1468;
        float _1472 = _1470 + 1.0;
        _1370 = _1472;
    }
    float _1474 = _1370;
    float _1476 = _1420 * _1474;
    float _1478 = -_1354;
    float _1480 = _1478 + 1.0;
    bool _1482 = _1420 > 0.0;
    bool _1484 = isnan(_1420);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(0.0);
    bool _1490 = _1486 || _1488;
    float _1492 = _1356 + _1231;
    float _1494 = _1476 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1496 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1498 = _1474 <= 0.0;
    bool _1500 = !_1490;
    bool _1502 = _1498 || _1500;
    float _1504 = _1492 * 0.5;
    float _1506 = _1494 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1508 = _1496 * _1283;
    float _1510 = -_1496;
    float _1512 = _1510 + 1.0;
    out.m_64.x = _965;
    out.m_64.y = _959;
    out.m_64.z = _971;
    float _1514 = _1294 * _1508;
    float _1516 = _1304 * _1508;
    float _1518 = _1294 * _1512;
    out.gl_Position.x = _1257;
    out.gl_Position.y = _1261;
    out.gl_Position.z = _1356;
    out.gl_Position.w = _1231;
    float _1520 = fma(_1300, _1514, _1288);
    float _1522 = fma(_1302, _1514, _1290);
    float _1524 = fma(_1294, _1516, _1292);
    out.m_66.z = _1504;
    out.m_66.w = _1231;
    out.m_47.x = _1506;
    out.m_68.x = _1520;
    out.m_68.y = _1522;
    out.m_68.z = _1524;
    out.m_68.w = _1518;
    if (!_1502)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1526 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1526;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _919 = false;
    bool _385 = false;
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
        float _1583 = as_type<float>(_103);
        out.gl_Position.z = _1583;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1651 = as_type<float>(_139);
        out.gl_Position.z = _1651;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _143);
        float _213 = _211 * _199;
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
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    bool _317 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_291);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _329;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = 1.0 / _311;
    float _337 = _327 * _315;
    float _339 = -_327;
    float _341 = _339 + 1.0;
    float _343 = _295 * _335;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_331, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _349 * _337;
    float _355 = _351 * _337;
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _353);
    float _359 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _361 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].x, _357);
    float _363 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].y, _359);
    bool _365 = !_333;
    float _383;
    if (!_365)
    {
        float _367 = in.m_53.x;
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _367 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_87);
        float _389 = 1.0 / _387;
        float _391 = _121 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = as_type<float>(int(gl_VertexIndex));
    float _397 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = in.m_51.x;
    float _401 = in.m_51.y;
    float _403 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _409 = in.m_53.x;
    float _411 = in.m_53.y;
    float _413 = in.m_53.z;
    float _415 = in.m_53.w;
    float _417 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _393 + _421;
    float _425 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    int _427 = as_type<int>(_395) & 1;
    bool _429 = _427 != 0;
    int _431 = as_type<int>(_395) & 2;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _441 = _439 != 0;
    float _443 = _363 * _401;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _447 = _445 != 0;
    float _449 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _463 = !_433;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _417);
    float _469 = 1.0 / _457;
    bool _471 = !_429;
    float _473 = _471 ? (-0.5) : 0.5;
    float _475 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _465);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _393 + _479;
    bool _483 = _409 > 0.5;
    float _485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _473);
    float _487 = _475 * _477;
    float _489 = 1.0 / _461;
    float _491 = _361 * _399;
    float _493 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _495 = _425 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _497 = _411 > 0.5;
    float _499 = _491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _501 = _487 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _503 = _423 * _469;
    float _505 = _499 * _485;
    float _507 = _487 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _509 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _511 = _413 > 0.5;
    float _513 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].x, _507);
    float _515 = _467 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _517 = _481 * _489;
    float _519 = _487 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _521 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[24].z, _513);
    float _523 = -_473;
    int _525 = _483 ? as_type<int>(_523) : as_type<int>(_473);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].x, _519);
    float _533 = _521 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _535;
    bool _539 = _415 > 0.5;
    float _541 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[26].z, _531);
    float _543 = _495 + _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _545;
    float _549 = fma(_537, _503, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _551 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = fma(_529, _503, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_547, _503, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _561 = _515 + _551;
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _543 + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _577 = _561 + _575;
    float _579 = _565 * _565;
    float _581 = -_473;
    int _583 = _511 ? as_type<int>(_581) : as_type<int>(_473);
    float _585 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].x, _501);
    float _587 = _577 * _577;
    bool _589 = !_437;
    float _591 = _589 ? _473 : as_type<float>(_525);
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _595 = !_447;
    float _597 = _595 ? _473 : as_type<float>(_583);
    float _599 = _579 + _587;
    bool _601 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _603 = isnan(_393);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[25].z, _585);
    bool _615 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _617 = isnan(_393);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = fma(_559, _517, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _629 = -_465;
    int _631 = _497 ? as_type<int>(_629) : as_type<int>(_465);
    float _633 = sqrt(_599);
    bool _635 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _637 = isnan(_393);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_611;
    float _649 = _647 + 1.0;
    float _651 = -_625;
    float _653 = _651 + 1.0;
    float _655 = -_465;
    int _657 = _539 ? as_type<int>(_655) : as_type<int>(_465);
    float _659 = fma(_569, _517, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = _645 * _649;
    float _663 = fma(_573, _517, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _667 = _613 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _669 = _611 * _653;
    bool _671 = !_441;
    float _673 = _671 ? _465 : as_type<float>(_631);
    float _675 = _553 * _661;
    bool _677 = !_453;
    float _679 = _677 ? _465 : as_type<float>(_657);
    float _681 = _549 * _661;
    float _683 = _555 * _661;
    bool _685 = _633 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _689 = -_645;
    float _691 = _689 + 1.0;
    float _693 = _509 + _667;
    float _695 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].x, _681);
    float _697 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[107].z, _683);
    float _701 = _549;
    float _703 = _681;
    float _705 = _691;
    float _707 = _613;
    float _709 = _579;
    float _711 = _509;
    if (!_685)
    {
        _701 = _587;
    }
    float _713 = _701;
    float _715 = _713;
    if (!_685)
    {
        _703 = _543;
    }
    float _717 = _703;
    float _719 = _717;
    if (!_685)
    {
        _705 = _561;
    }
    float _721 = _705;
    float _723 = _721;
    if (!_685)
    {
        _707 = _693;
    }
    float _725 = _707;
    bool _727 = !_685;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _633 + _733;
        float _737 = rsqrt(_599);
        float _739 = _735 * _731;
        float _741 = _693 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _743 = _739 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = sin(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = fma(_747, _741, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _755 = _737 * _753;
        float _757 = fma(_565, _755, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _759 = _751 + (-1.0);
        float _761 = fma(_577, _755, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _765 = _757 + _763;
        float _767 = _759 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _771 = _761 + _769;
        float _773 = _765 * _765;
        float _775 = fma(_693, _751, _767);
        float _777 = _771 * _771;
        _729 = _775;
        _709 = _773;
        _715 = _777;
        _719 = _757;
        _723 = _761;
    }
    float _779 = _729;
    float _781 = _709;
    float _783 = _715;
    float _785 = _719;
    float _787 = _723;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _791 = _779 + _789;
    float _793 = -_673;
    float _795 = _793 + 0.5;
    float _797 = fma(_627, _669, _695);
    float _799 = fma(_659, _669, _697);
    float _801 = fma(_791, _791, _781);
    float _803 = fma(_663, _669, _699);
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _807 = _597 + 0.5;
    float _809 = -_679;
    float _811 = _809 + 0.5;
    float _813 = _795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].x, _797);
    float _817 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].y, _799);
    float _819 = _801 + _783;
    float _821 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[109].z, _803);
    float _823 = _807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _825 = _811 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _827 = _813 * _593;
    float _829 = _591 + 0.5;
    float _831 = _823 * _687;
    float _833 = sqrt(_819);
    float _835 = _829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _843 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _845 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _847 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _849 = _835 * _665;
    float _851 = _825 * _805;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _857 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _849;
    out.m_58.y = _827;
    out.m_58.z = _831;
    out.m_58.w = _851;
    bool _869 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _871 = isnan(_833);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _877 = _873 || _875;
    out.m_60.x = _857;
    out.m_60.y = _859;
    out.m_60.z = _861;
    out.m_60.w = _855;
    out.m_62.x = _863;
    out.m_62.y = _865;
    out.m_62.z = _867;
    out.m_62.w = _853;
    float _879 = _805;
    float _881 = _827;
    float _883 = _863;
    if (!_877)
    {
        _879 = 1.0;
    }
    float _885 = _879;
    bool _887 = !_877;
    float _889 = _885;
    if (!_887)
    {
        bool _891 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _893 = isnan(_833);
        bool _895 = _891 || _893;
        bool _897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _899 = _895 || _897;
        if (!_899)
        {
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _903 = _833 + _901;
            float _905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _905;
            float _909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _911 = _909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _913 = 1.0 / _907;
            float _915 = _903 * _913;
            float _917 = fma(_915, _911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _889 = _917;
            _919 = true;
        }
        else
        {
            bool _921 = _833 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _923 = isnan(_833);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _929 = _925 || _927;
            if (!_929)
            {
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _933 = _833 + _931;
                float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _937 = _935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _941 = _939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _943 = 1.0 / _937;
                float _945 = _933 * _943;
                float _947 = fma(_945, _941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _889 = _947;
                _919 = true;
            }
            else
            {
                _889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _919 = false;
    float _949 = _889;
    float _951 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _953 = _779 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _957 = _785 + _955;
    float _959 = fma(_953, _949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _961 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _963 = _787 + _961;
    float _965 = fma(_957, _949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _959 + _967;
    float _971 = fma(_963, _949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _975 = _965 + _973;
    float _977 = _969 * _969;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _981 = _971 + _979;
    float _983 = fma(_975, _975, _977);
    float _985 = fma(_981, _981, _983);
    float _987 = rsqrt(_985);
    float _989 = _987 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _991 = _975 * _989;
    float _993 = _981 * _989;
    float _995 = _991 * _991;
    float _997 = _993 * _993;
    float _999 = _995 + _997;
    float _1001 = sqrt(_999);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _987;
    float _1011 = _999;
    float _1013 = _1007;
    float _1015 = _989;
    if (_1003)
    {
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1017;
    }
    float _1019 = _1009;
    if (_1003)
    {
        float _1021 = rsqrt(_999);
        _1011 = _1021;
    }
    float _1023 = _1011;
    float _1025 = _1023;
    if (_1003)
    {
        float _1027 = _1007 * _1019;
        _1013 = _1027;
    }
    float _1029 = _1013;
    if (_1003)
    {
        float _1031 = _1029 * 0.15915493667125701904296875;
        _881 = _1031;
    }
    float _1033 = _881;
    float _1035 = _981;
    if (_1003)
    {
        float _1037 = _1033 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        _1035 = _1039;
    }
    float _1041 = _1035;
    float _1043 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1045 = precise::max(0.0, _1043);
    float _1047 = _843;
    float _1049 = _1045;
    float _1051 = _1043;
    if (_1003)
    {
        float _1053 = _1033 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        _1047 = _1055;
    }
    float _1057 = _1047;
    float _1059 = -_989;
    float _1061 = -_1045;
    float _1063 = fma(_969, _1059, _1061);
    float _1065 = _1063;
    if (_1003)
    {
        float _1067 = _1063 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1067;
    }
    float _1069 = _1049;
    float _1071 = sqrt(_985);
    float _1073 = _1041;
    float _1075 = _1069;
    if (_1003)
    {
        float _1077 = fma(_1041, _1069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1073 = _1077;
    }
    float _1079 = _1073;
    float _1081 = _1079;
    if (!_1003)
    {
        _1075 = _991;
    }
    float _1083 = _1075;
    float _1085 = _1083;
    if (_1003)
    {
        float _1087 = _1057 + (-1.0);
        _1051 = _1087;
    }
    float _1089 = _1051;
    float _1091 = _1089;
    if (_1003)
    {
        float _1093 = _1023 * _1079;
        _883 = _1093;
    }
    float _1095 = _883;
    if (!_1003)
    {
        _1081 = _1063;
    }
    float _1097 = _1081;
    float _1099 = _959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1101 = _1097;
    if (_1003)
    {
        float _1103 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1103;
    }
    float _1105 = _1015;
    if (_1003)
    {
        float _1107 = _991 * _1095;
        _1085 = _1107;
    }
    float _1109 = _1085;
    if (!_1003)
    {
        _1091 = _993;
    }
    float _1111 = _1091;
    float _1113 = _1111;
    if (_1003)
    {
        float _1115 = _993 * _1095;
        _1113 = _1115;
    }
    float _1117 = _1113;
    if (!_1003)
    {
        _1025 = _995;
    }
    float _1119 = _1025;
    float _1121 = _1119;
    if (_1003)
    {
        float _1123 = fma(_1063, _1057, _1105);
        _1101 = _1123;
    }
    float _1125 = _1101;
    if (_1003)
    {
        float _1127 = _1109 * _1109;
        _1121 = _1127;
    }
    float _1129 = _1121;
    if (!_1003)
    {
        _1065 = _997;
    }
    float _1131 = _1065;
    float _1133 = _1131;
    if (_1003)
    {
        float _1135 = _1117 * _1117;
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_1125, _1125, _1129);
    float _1141 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1099);
    float _1143 = _1139 + _1137;
    float _1145 = _959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1149 = fma(_1071, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1147);
    float _1151 = precise::clamp(_1149, 0.0, 1.0);
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1155 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1157 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1145);
    float _1159 = rsqrt(_1143);
    float _1161 = _959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1163 = -_1151;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1157);
    float _1169 = _959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1171 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1161);
    float _1173 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1175 = abs(_1165);
    float _1177 = log2(_1175);
    float _1179 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1169);
    float _1181 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1171);
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1185 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1179);
    float _1187 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1189 = -_1183;
    float _1191 = fma(_1189, _1153, 1.0);
    float _1193 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1195 = _1159 * _1109;
    float _1197 = _1159 * _1125;
    float _1199 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1203 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1205 = _1159 * _1117;
    float _1207 = log2(_1191);
    float _1209 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1211 = -_1203;
    float _1213 = fma(_1197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1211);
    float _1215 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1201);
    float _1217 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1219 = -_1205;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1213);
    float _1223 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1215);
    float _1225 = exp2(_1209);
    float _1227 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1229 = fma(_1221, -0.5, 0.5);
    float _1231 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1223);
    float _1233 = fma(_1221, 0.5, 0.5);
    float _1235 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1227);
    float _1237 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1217);
    float _1239 = _1197 + 1.0;
    float _1241 = 1.0 / _1231;
    float _1243 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1235);
    float _1245 = fma(_1233, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1247 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1237);
    float _1249 = fma(_1233, _1245, -0.212114393711090087890625);
    float _1251 = sqrt(_1229);
    float _1253 = -_1197;
    float _1255 = fma(_1225, _1239, _1253);
    float _1257 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1243);
    float _1259 = _1207 * 0.693147182464599609375;
    float _1261 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1247);
    float _1263 = fma(_1233, _1249, 1.570728778839111328125);
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1267 = _1257 * _1241;
    float _1269 = _1261 * _1241;
    float _1271 = fma(_1267, 0.5, 0.5);
    float _1273 = fma(_1269, -0.5, 0.5);
    float _1275 = _1251 * 0.636619746685028076171875;
    float _1277 = fma(_1255, 0.5, 0.5);
    float _1279 = -_1263;
    float _1281 = fma(_1275, _1279, 1.0);
    float3 _3555 = float3(_1271, _1273, _1265);
    float _1283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3555, float3(0.0), isnan(_3555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3555, float3(0.0), isnan(_3555)), level(0.0)).x;
    float3 _3566 = float3(_1271, _1273, _1265);
    float4 _1286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3566, float3(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3566, float3(0.0), isnan(_3566)), level(0.0)).xyzw;
    float _1288 = _1286.x;
    float _1290 = _1286.y;
    float _1292 = _1286.z;
    float _1294 = _1286.w;
    float2 _3583 = float2(_1281, _1277);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3583, float2(0.0), isnan(_3583)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3583, float2(0.0), isnan(_3583)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = _509 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1308 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1310 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1306);
    float _1312 = _509 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1314 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1310);
    float _1316 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1312);
    float _1318 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1320 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1316);
    float _1322 = 1.0 / _1318;
    float _1324 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1326 = _1324 + _1318;
    float _1328 = _1326 * _1322;
    float _1330 = _1328 * 0.5;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1334 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1332);
    bool _1336 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(0.5);
    bool _1344 = _1340 || _1342;
    float _1346 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1348 = 1.0 / _1334;
    float _1350 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1346);
    float _1352 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1350);
    float _1354 = exp2(_1308);
    float _1356 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1352);
    float _1358 = _1173;
    if (_1344)
    {
        _1358 = 1.0;
    }
    float _1360 = _1358;
    float _1362 = _1360;
    if (_1344)
    {
        _711 = 1.0;
    }
    float _1364 = _711;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1368 = _1348 * _1366;
    float _1370 = _1364;
    if (!_1344)
    {
        float _1372 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1374 = _1372 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1374 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = 1.0 / _1378;
        float _1390 = _1382 * 6.283185482025146484375;
        float _1392 = cos(_1390);
        float _1394 = _1386 * _1388;
        float _1396 = _1382 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1402 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1400;
        float _1404 = _1392 * _1394;
        float _1406 = 1.0 / _1404;
        float _1408 = 1.0 / _1402;
        float _1410 = _1398 * _1406;
        float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1414 = fma(_1368, _1410, _1412);
        float _1416 = _1414 * _1408;
        float _1418 = precise::clamp(_1416, 0.0, 1.0);
        _1362 = _1418;
    }
    float _1420 = _1362;
    if (!_1344)
    {
        float _1422 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1424 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1432 = _1430 * 0.15915493667125701904296875;
        float _1434 = _1424 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        float _1438 = 1.0 / _1428;
        float _1440 = _1432 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1436 * _1438;
        float _1446 = _1432 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        float _1450 = _1442 * _1444;
        float _1452 = 1.0 / _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1454;
        float _1458 = 1.0 / _1456;
        float _1460 = _1448 * _1452;
        float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1464 = fma(_1368, _1460, _1462);
        float _1466 = _1464 * _1458;
        float _1468 = precise::clamp(_1466, 0.0, 1.0);
        float _1470 = -_1468;
        float _1472 = _1470 + 1.0;
        _1370 = _1472;
    }
    float _1474 = _1370;
    float _1476 = _1420 * _1474;
    float _1478 = -_1354;
    float _1480 = _1478 + 1.0;
    bool _1482 = _1420 > 0.0;
    bool _1484 = isnan(_1420);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(0.0);
    bool _1490 = _1486 || _1488;
    float _1492 = _1356 + _1231;
    float _1494 = _1476 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1496 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1498 = _1474 <= 0.0;
    bool _1500 = !_1490;
    bool _1502 = _1498 || _1500;
    float _1504 = _1492 * 0.5;
    float _1506 = _1494 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1508 = _1496 * _1283;
    float _1510 = -_1496;
    float _1512 = _1510 + 1.0;
    out.m_64.x = _965;
    out.m_64.y = _959;
    out.m_64.z = _971;
    float _1514 = _1294 * _1508;
    float _1516 = _1304 * _1508;
    float _1518 = _1294 * _1512;
    out.gl_Position.x = _1257;
    out.gl_Position.y = _1261;
    out.gl_Position.z = _1356;
    out.gl_Position.w = _1231;
    float _1520 = fma(_1300, _1514, _1288);
    float _1522 = fma(_1302, _1514, _1290);
    float _1524 = fma(_1294, _1516, _1292);
    out.m_66.z = _1504;
    out.m_66.w = _1231;
    out.m_47.x = _1506;
    out.m_68.x = _1520;
    out.m_68.y = _1522;
    out.m_68.z = _1524;
    out.m_68.w = _1518;
    if (!_1502)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1526 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1526;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

