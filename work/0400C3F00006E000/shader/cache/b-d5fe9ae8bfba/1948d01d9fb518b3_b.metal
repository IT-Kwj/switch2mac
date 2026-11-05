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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _409 = false;
    bool _263 = false;
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
        float _1391 = as_type<float>(_99);
        out.gl_Position.z = _1391;
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
        float _1460 = as_type<float>(_135);
        out.gl_Position.z = _1460;
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
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    int _163 = _161 ? (-1090519040) : 1056964608;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    bool _175 = !_151;
    int _177 = _175 ? (-1090519040) : 1056964608;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    bool _187 = !_169;
    int _189 = _187 ? 0 : 1;
    out.m_54.x = as_type<float>(_177);
    out.m_54.y = as_type<float>(_163);
    bool _191 = !_185;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_189);
    float _197 = -_159;
    float _199 = _147 + _197;
    int _201 = abs(_193);
    float _203 = -_199;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _209 = float(_195);
    float _211 = fma(_181, 0.5, 0.5);
    bool _213 = !_173;
    int _215 = _213 ? 0 : 1;
    bool _217 = _199 < 0.5;
    float _219 = float(_217);
    float _221 = abs(_205);
    float _223 = _209 * _221;
    int _225 = abs(_215);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_201);
    float _233 = -_219;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _223);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_207;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    bool _277 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_271);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    bool _289 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_271);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_287;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _303;
    bool _315 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_271);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -_299;
    float _331 = _329 + 1.0;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = _325 * _331;
    float _337 = 1.0 / _307;
    float _339 = -_325;
    float _341 = _339 + 1.0;
    float _343 = _275 * _313;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _271 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_351, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_355, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = _347 * _337;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _357 * _335;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = _359 * _335;
    float _375 = fma(_365, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _367);
    float _379 = fma(_371, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = fma(_375, _327, _377);
    float _385 = fma(_379, _327, _381);
    float _387 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    bool _391 = !_333;
    float _407;
    if (!_391)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_83);
        float _413 = 1.0 / _411;
        float _415 = _117 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = in.m_56.x;
    float _421 = in.m_56.y;
    float _423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_163));
    float _425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_177));
    float _427 = in.m_42.x;
    float _429 = in.m_42.y;
    float _431 = in.m_42.z;
    bool _433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _435 = isnan(0.5);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _441 = _437 || _439;
    bool _443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _445 = isnan(0.5);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _451 = _447 || _449;
    float _453 = _389 * _421;
    float _455 = _387 * _419;
    float _457 = _243 * _453;
    float _459 = _243 * _455;
    float _461 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _463 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _465 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _461);
    float _469 = _463 * _423;
    float _471 = _465 * _425;
    float _473 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _475 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _481 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
    float _483 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[26].x, _477);
    float _487 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _481);
    float _491 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[24].x, _479);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _485);
    float _495 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _497 = _489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _503 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _505 = _469 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _509 = _497 + _501;
    float _511 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
    float _513 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[25].x, _505);
    float _515 = _495 + _507;
    float _517 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _519 = _509 + _517;
    float _521 = _511 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _523 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _513);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _515 + _525;
    float _529 = _519 * _519;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _533 = _523 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _535 = fma(_527, _527, _529);
    float _537 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[11].x, _531);
    float _539 = _521 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _541 = _521 + _533;
    float _543 = sqrt(_535);
    float _545 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[11].z, _537);
    float _547 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[10].x, _539);
    float _549 = _545 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _551 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[10].z, _547);
    float _553 = 1.0 / _549;
    float _555 = _551 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _557 = _555 + _549;
    bool _559 = _543 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _561 = _557 * _553;
    float _563 = _561 * 0.5;
    float _565 = _557;
    float _567 = _475;
    float _569 = _545;
    float _571 = _505;
    float _573 = _509;
    float _575 = _549;
    if (!_559)
    {
        _565 = _515;
    }
    float _577 = _565;
    float _579 = _577;
    if (!_559)
    {
        _567 = _509;
    }
    float _581 = _567;
    float _583 = _581;
    if (!_559)
    {
        _569 = _541;
    }
    float _585 = _569;
    bool _587 = !_559;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _595 = _543 + _593;
        float _597 = _541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _599 = rsqrt(_535);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = fma(_611, _597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _617 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _619 = _599 * _615;
        float _621 = fma(_541, _607, _617);
        float _623 = fma(_527, _619, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _625 = fma(_519, _619, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _579 = _623;
        _589 = _621;
        _583 = _625;
        _571 = _619;
    }
    float _627 = _579;
    float _629 = _589;
    float _631 = _583;
    float _633 = _571;
    float _635 = _629;
    float _637 = _627;
    float _639 = _631;
    float _641 = _633;
    if (_451)
    {
        _573 = 1.0;
    }
    float _643 = _573;
    float _645 = _643;
    if (!_441)
    {
        float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _649 = _521 + _647;
        float _651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _653 = _495 + _651;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _657 = -_495;
        float _659 = _657 + _627;
        float _661 = _649 * _649;
        float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _665 = _497 + _663;
        float _667 = -_521;
        float _669 = _667 + _629;
        float _671 = fma(_653, _653, _661);
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _675 = fma(_665, _665, _671);
        float _677 = sqrt(_675);
        float _679 = _655 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _681 = precise::min(_677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _683 = _681 * _673;
        float _685 = _679 * _683;
        float _687 = -_497;
        float _689 = _687 + _631;
        float _691 = fma(_659, _685, _495);
        float _693 = fma(_669, _685, _521);
        float _695 = fma(_689, _685, _497);
        _635 = _693;
        _637 = _691;
        _639 = _695;
        _575 = _673;
        _641 = _685;
    }
    float _697 = _635;
    float _699 = _637;
    float _701 = _639;
    float _703 = _575;
    float _705 = _641;
    float _707 = _703;
    float _709 = _705;
    if (!_451)
    {
        float _711 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _713 = _711 * 0.15915493667125701904296875;
        float _715 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _719 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _717);
        float _721 = _713 * 6.283185482025146484375;
        float _723 = cos(_721);
        float _725 = _715 * 0.15915493667125701904296875;
        float _727 = _713 * 6.283185482025146484375;
        float _729 = sin(_727);
        float _731 = 1.0 / _723;
        float _733 = _725 * 6.283185482025146484375;
        float _735 = cos(_733);
        float _737 = _729 * _731;
        float _739 = _725 * 6.283185482025146484375;
        float _741 = sin(_739);
        float _743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _745 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _743;
        float _747 = _735 * _737;
        float _749 = 1.0 / _719;
        float _751 = 1.0 / _747;
        float _753 = 1.0 / _745;
        float _755 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _757 = _749 * _755;
        float _759 = _741 * _751;
        float _761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _763 = fma(_759, _757, _761);
        float _765 = _763 * _753;
        float _767 = precise::clamp(_765, 0.0, 1.0);
        _707 = _713;
        _709 = _725;
        _645 = _767;
    }
    float _769 = _707;
    float _771 = _709;
    float _773 = _645;
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _777 = _697 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _781 = _699 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _785 = _701 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_781, _781, _787);
    float _791 = fma(_785, _785, _789);
    float _793 = rsqrt(_791);
    float _795 = sqrt(_791);
    float _797 = _793 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _799 = _781 * _797;
    float _801 = _785 * _797;
    float _803 = _799 * _799;
    float _805 = _801 * _801;
    float _807 = _803 + _805;
    float _809 = sqrt(_807);
    bool _811 = _809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _815 = _809 + _813;
    float _817 = _793;
    float _819 = _807;
    float _821 = _815;
    float _823 = _769;
    float _825 = _777;
    float _827 = _797;
    if (_811)
    {
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _817 = _829;
    }
    float _831 = _817;
    if (_811)
    {
        float _833 = rsqrt(_807);
        _819 = _833;
    }
    float _835 = _819;
    float _837 = _835;
    if (_811)
    {
        float _839 = _815 * _831;
        _821 = _839;
    }
    float _841 = _821;
    if (_811)
    {
        float _843 = _841 * 0.15915493667125701904296875;
        _823 = _843;
    }
    float _845 = _823;
    float _847 = _785;
    if (_811)
    {
        float _849 = _845 * 6.283185482025146484375;
        float _851 = sin(_849);
        _847 = _851;
    }
    float _853 = _847;
    float _855 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _857 = precise::max(0.0, _855);
    float _859 = _771;
    float _861 = _857;
    float _863 = _855;
    if (_811)
    {
        float _865 = _845 * 6.283185482025146484375;
        float _867 = cos(_865);
        _859 = _867;
    }
    float _869 = _859;
    float _871 = -_797;
    float _873 = -_857;
    float _875 = fma(_777, _871, _873);
    if (!_811)
    {
        _825 = _801;
    }
    float _877 = _825;
    float _879 = _877;
    if (_811)
    {
        float _881 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _881;
    }
    float _883 = _861;
    float _885 = _853;
    float _887 = _883;
    if (_811)
    {
        float _889 = fma(_853, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _885 = _889;
    }
    float _891 = _885;
    float _893 = _891;
    if (!_811)
    {
        _887 = _799;
    }
    float _895 = _887;
    float _897 = _895;
    if (_811)
    {
        float _899 = _869 + (-1.0);
        _863 = _899;
    }
    float _901 = _863;
    float _903 = 0.0;
    float _905 = _901;
    if (_811)
    {
        float _907 = _835 * _891;
        _903 = _907;
    }
    float _909 = _903;
    if (!_811)
    {
        _893 = _875;
    }
    float _911 = _893;
    float _913 = _911;
    if (_811)
    {
        float _915 = _901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _827 = _915;
    }
    float _917 = _827;
    if (_811)
    {
        float _919 = _799 * _909;
        _897 = _919;
    }
    float _921 = _897;
    if (!_811)
    {
        _837 = _803;
    }
    float _923 = _837;
    float _925 = _923;
    if (_811)
    {
        float _927 = _801 * _909;
        _879 = _927;
    }
    float _929 = _879;
    if (_811)
    {
        float _931 = fma(_875, _869, _917);
        _913 = _931;
    }
    float _933 = _913;
    if (_811)
    {
        float _935 = _921 * _921;
        _925 = _935;
    }
    float _937 = _925;
    if (!_811)
    {
        _905 = _805;
    }
    float _939 = _905;
    float _941 = _939;
    if (_811)
    {
        float _943 = _929 * _929;
        _941 = _943;
    }
    float _945 = _941;
    float _947 = fma(_933, _933, _937);
    float _949 = _947 + _945;
    float _951 = _697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _955 = fma(_795, (*spvDescriptorSet0.vp_c15)._m0[23].w, _953);
    float _957 = precise::clamp(_955, 0.0, 1.0);
    float _959 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _961 = rsqrt(_949);
    float _963 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _951);
    float _965 = _697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _967 = _697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = -_957;
    float _971 = _969 + 1.0;
    float _973 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _975 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _965);
    float _977 = _697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _979 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _967);
    float _981 = abs(_971);
    float _983 = log2(_981);
    float _985 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _975);
    float _987 = _973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _989 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _991 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _977);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = _987 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _999 = _961 * _921;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1003 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _991);
    float _1005 = _961 * _933;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1001);
    float _1011 = -_995;
    float _1013 = fma(_1011, _959, 1.0);
    float _1015 = _961 * _929;
    float _1017 = -_1007;
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1017);
    float _1021 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1023 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1009);
    float _1025 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1027 = -_1015;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1019);
    float _1031 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1033 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1023);
    float _1035 = exp2(_1025);
    float _1037 = fma(_1029, -0.5, 0.5);
    float _1039 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1041 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1031);
    float _1043 = fma(_1029, 0.5, 0.5);
    float _1045 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1039);
    float _1047 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1041);
    float _1049 = 1.0 / _1033;
    float _1051 = _1005 + 1.0;
    float _1053 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1045);
    float _1055 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1047);
    float _1057 = fma(_1043, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1059 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1053);
    float _1061 = log2(_1013);
    float _1063 = fma(_1043, _1057, -0.212114393711090087890625);
    float _1065 = -_1005;
    float _1067 = fma(_1035, _1051, _1065);
    float _1069 = fma(_1043, _1063, 1.570728778839111328125);
    float _1071 = sqrt(_1037);
    float _1073 = _1055 * _1049;
    float _1075 = _1059 * _1049;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = fma(_1075, -0.5, 0.5);
    float _1081 = _1061 * 0.693147182464599609375;
    float _1083 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1085 = _1071 * 0.636619746685028076171875;
    float _1087 = fma(_1067, 0.5, 0.5);
    float3 _2974 = float3(_1077, _1079, _1083);
    float _1089 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2974, float3(0.0), isnan(_2974)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2974, float3(0.0), isnan(_2974)), level(0.0)).x;
    float3 _2985 = float3(_1077, _1079, _1083);
    float4 _1092 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2985, float3(0.0), isnan(_2985)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2985, float3(0.0), isnan(_2985)), level(0.0)).xyzw;
    float _1094 = _1092.x;
    float _1096 = _1092.y;
    float _1098 = _1092.z;
    float _1100 = _1092.w;
    float _1102 = -_1069;
    float _1104 = fma(_1085, _1102, 1.0);
    float2 _3007 = float2(_1104, _1087);
    float3 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3007, float2(0.0), isnan(_3007)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3007, float2(0.0), isnan(_3007)), level(0.0)).xyz;
    float _1110 = _1108.x;
    float _1112 = _1108.y;
    float _1114 = _1108.z;
    float _1116 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1118 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1130 = 1.0 / _1122;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1138 = _417 + _1136;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1142 = 1.0 / _1126;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1148 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1152 = _417 + _1150;
    float _1154 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1118);
    bool _1156 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1158 = isnan(_417);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1152 * _1130;
    bool _1170 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1172 = isnan(_417);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1182;
    bool _1186 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1188 = isnan(_417);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    out.m_58.x = _1144;
    out.m_58.y = _1146;
    out.m_58.z = _1148;
    out.m_58.w = _1140;
    float _1198 = exp2(_1116);
    float _1200 = -_1180;
    float _1202 = _1200 + 1.0;
    float _1204 = fma(_1184, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1206 = _1138 * _1142;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1212;
    float _1216 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1154);
    float _1218 = fma(_1210, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1220 = fma(_1214, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1222 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1224 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1226 = _773 > 0.0;
    bool _1228 = isnan(_773);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan(0.0);
    bool _1234 = _1230 || _1232;
    float _1236 = -_1166;
    float _1238 = _1236 + 1.0;
    float _1240 = _1196 * _1202;
    float _1242 = -_1196;
    float _1244 = _1242 + 1.0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1250 = _1180 * _1238;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1256 = _1204 * _1240;
    float _1258 = _1218 * _1240;
    float _1260 = _1220 * _1240;
    float _1262 = fma(_1254, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1256);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1270 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1258);
    float _1272 = fma(_1248, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1274 = fma(_1262, _1250, _1264);
    float _1276 = fma(_1268, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1278 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1260);
    float _1280 = fma(_1272, _1250, _1270);
    float _1282 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1274);
    float _1284 = _1222 + _1033;
    float _1286 = fma(_1276, _1250, _1278);
    float _1288 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1280);
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1294 = -_1198;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1286);
    float _1300 = _1284 * 0.5;
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1312 = _1224 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1314 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = -_1304;
    float _1318 = _1316 + 1.0;
    out.gl_Position.x = _1055;
    out.gl_Position.y = _1059;
    out.gl_Position.z = _1222;
    out.gl_Position.w = _1033;
    out.m_60.x = _1308;
    out.m_60.y = _1310;
    out.m_60.z = _1314;
    out.m_60.w = _1292;
    out.m_62.z = _1300;
    out.m_62.w = _1033;
    out.m_45.x = _1312;
    float _1320 = _1304 * _1089;
    float _1322 = _1100 * _1318;
    float _1324 = _1100 * _1320;
    float _1326 = _1114 * _1320;
    float _1328 = fma(_1110, _1324, _1094);
    float _1330 = fma(_1112, _1324, _1096);
    float _1332 = fma(_1100, _1326, _1098);
    out.m_64.x = _1328;
    out.m_64.y = _1330;
    out.m_64.z = _1332;
    out.m_64.w = _1322;
    if (_1234)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1334;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _409 = false;
    bool _263 = false;
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
        float _1391 = as_type<float>(_99);
        out.gl_Position.z = _1391;
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
        float _1460 = as_type<float>(_135);
        out.gl_Position.z = _1460;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    int _163 = _161 ? (-1090519040) : 1056964608;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    bool _175 = !_151;
    int _177 = _175 ? (-1090519040) : 1056964608;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    bool _187 = !_169;
    int _189 = _187 ? 0 : 1;
    out.m_54.x = as_type<float>(_177);
    out.m_54.y = as_type<float>(_163);
    bool _191 = !_185;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_189);
    float _197 = -_159;
    float _199 = _147 + _197;
    int _201 = abs(_193);
    float _203 = -_199;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _209 = float(_195);
    float _211 = fma(_181, 0.5, 0.5);
    bool _213 = !_173;
    int _215 = _213 ? 0 : 1;
    bool _217 = _199 < 0.5;
    float _219 = float(_217);
    float _221 = abs(_205);
    float _223 = _209 * _221;
    int _225 = abs(_215);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_201);
    float _233 = -_219;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _223);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_207;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    bool _277 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_271);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    bool _289 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_271);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_287;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _303;
    bool _315 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_271);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -_299;
    float _331 = _329 + 1.0;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = _325 * _331;
    float _337 = 1.0 / _307;
    float _339 = -_325;
    float _341 = _339 + 1.0;
    float _343 = _275 * _313;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _271 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_351, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_355, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = _347 * _337;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _357 * _335;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = _359 * _335;
    float _375 = fma(_365, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _367);
    float _379 = fma(_371, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = fma(_375, _327, _377);
    float _385 = fma(_379, _327, _381);
    float _387 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    bool _391 = !_333;
    float _407;
    if (!_391)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_83);
        float _413 = 1.0 / _411;
        float _415 = _117 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = in.m_56.x;
    float _421 = in.m_56.y;
    float _423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_163));
    float _425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_177));
    float _427 = in.m_42.x;
    float _429 = in.m_42.y;
    float _431 = in.m_42.z;
    bool _433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _435 = isnan(0.5);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _441 = _437 || _439;
    bool _443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _445 = isnan(0.5);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _451 = _447 || _449;
    float _453 = _389 * _421;
    float _455 = _387 * _419;
    float _457 = _243 * _453;
    float _459 = _243 * _455;
    float _461 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _463 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _465 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _461);
    float _469 = _463 * _423;
    float _471 = _465 * _425;
    float _473 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _475 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _481 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
    float _483 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[26].x, _477);
    float _487 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _481);
    float _491 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[24].x, _479);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _485);
    float _495 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _497 = _489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _503 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _505 = _469 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _509 = _497 + _501;
    float _511 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
    float _513 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[25].x, _505);
    float _515 = _495 + _507;
    float _517 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _519 = _509 + _517;
    float _521 = _511 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _523 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _513);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _515 + _525;
    float _529 = _519 * _519;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _533 = _523 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _535 = fma(_527, _527, _529);
    float _537 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[11].x, _531);
    float _539 = _521 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _541 = _521 + _533;
    float _543 = sqrt(_535);
    float _545 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[11].z, _537);
    float _547 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[10].x, _539);
    float _549 = _545 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _551 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[10].z, _547);
    float _553 = 1.0 / _549;
    float _555 = _551 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _557 = _555 + _549;
    bool _559 = _543 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _561 = _557 * _553;
    float _563 = _561 * 0.5;
    float _565 = _557;
    float _567 = _475;
    float _569 = _545;
    float _571 = _505;
    float _573 = _509;
    float _575 = _549;
    if (!_559)
    {
        _565 = _515;
    }
    float _577 = _565;
    float _579 = _577;
    if (!_559)
    {
        _567 = _509;
    }
    float _581 = _567;
    float _583 = _581;
    if (!_559)
    {
        _569 = _541;
    }
    float _585 = _569;
    bool _587 = !_559;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _595 = _543 + _593;
        float _597 = _541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _599 = rsqrt(_535);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = fma(_611, _597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _617 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _619 = _599 * _615;
        float _621 = fma(_541, _607, _617);
        float _623 = fma(_527, _619, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _625 = fma(_519, _619, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _579 = _623;
        _589 = _621;
        _583 = _625;
        _571 = _619;
    }
    float _627 = _579;
    float _629 = _589;
    float _631 = _583;
    float _633 = _571;
    float _635 = _629;
    float _637 = _627;
    float _639 = _631;
    float _641 = _633;
    if (_451)
    {
        _573 = 1.0;
    }
    float _643 = _573;
    float _645 = _643;
    if (!_441)
    {
        float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _649 = _521 + _647;
        float _651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _653 = _495 + _651;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _657 = -_495;
        float _659 = _657 + _627;
        float _661 = _649 * _649;
        float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _665 = _497 + _663;
        float _667 = -_521;
        float _669 = _667 + _629;
        float _671 = fma(_653, _653, _661);
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _675 = fma(_665, _665, _671);
        float _677 = sqrt(_675);
        float _679 = _655 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _681 = precise::min(_677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _683 = _681 * _673;
        float _685 = _679 * _683;
        float _687 = -_497;
        float _689 = _687 + _631;
        float _691 = fma(_659, _685, _495);
        float _693 = fma(_669, _685, _521);
        float _695 = fma(_689, _685, _497);
        _635 = _693;
        _637 = _691;
        _639 = _695;
        _575 = _673;
        _641 = _685;
    }
    float _697 = _635;
    float _699 = _637;
    float _701 = _639;
    float _703 = _575;
    float _705 = _641;
    float _707 = _703;
    float _709 = _705;
    if (!_451)
    {
        float _711 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _713 = _711 * 0.15915493667125701904296875;
        float _715 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _719 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _717);
        float _721 = _713 * 6.283185482025146484375;
        float _723 = cos(_721);
        float _725 = _715 * 0.15915493667125701904296875;
        float _727 = _713 * 6.283185482025146484375;
        float _729 = sin(_727);
        float _731 = 1.0 / _723;
        float _733 = _725 * 6.283185482025146484375;
        float _735 = cos(_733);
        float _737 = _729 * _731;
        float _739 = _725 * 6.283185482025146484375;
        float _741 = sin(_739);
        float _743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _745 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _743;
        float _747 = _735 * _737;
        float _749 = 1.0 / _719;
        float _751 = 1.0 / _747;
        float _753 = 1.0 / _745;
        float _755 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _757 = _749 * _755;
        float _759 = _741 * _751;
        float _761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _763 = fma(_759, _757, _761);
        float _765 = _763 * _753;
        float _767 = precise::clamp(_765, 0.0, 1.0);
        _707 = _713;
        _709 = _725;
        _645 = _767;
    }
    float _769 = _707;
    float _771 = _709;
    float _773 = _645;
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _777 = _697 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _781 = _699 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _785 = _701 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_781, _781, _787);
    float _791 = fma(_785, _785, _789);
    float _793 = rsqrt(_791);
    float _795 = sqrt(_791);
    float _797 = _793 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _799 = _781 * _797;
    float _801 = _785 * _797;
    float _803 = _799 * _799;
    float _805 = _801 * _801;
    float _807 = _803 + _805;
    float _809 = sqrt(_807);
    bool _811 = _809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _815 = _809 + _813;
    float _817 = _793;
    float _819 = _807;
    float _821 = _815;
    float _823 = _769;
    float _825 = _777;
    float _827 = _797;
    if (_811)
    {
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _817 = _829;
    }
    float _831 = _817;
    if (_811)
    {
        float _833 = rsqrt(_807);
        _819 = _833;
    }
    float _835 = _819;
    float _837 = _835;
    if (_811)
    {
        float _839 = _815 * _831;
        _821 = _839;
    }
    float _841 = _821;
    if (_811)
    {
        float _843 = _841 * 0.15915493667125701904296875;
        _823 = _843;
    }
    float _845 = _823;
    float _847 = _785;
    if (_811)
    {
        float _849 = _845 * 6.283185482025146484375;
        float _851 = sin(_849);
        _847 = _851;
    }
    float _853 = _847;
    float _855 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _857 = precise::max(0.0, _855);
    float _859 = _771;
    float _861 = _857;
    float _863 = _855;
    if (_811)
    {
        float _865 = _845 * 6.283185482025146484375;
        float _867 = cos(_865);
        _859 = _867;
    }
    float _869 = _859;
    float _871 = -_797;
    float _873 = -_857;
    float _875 = fma(_777, _871, _873);
    if (!_811)
    {
        _825 = _801;
    }
    float _877 = _825;
    float _879 = _877;
    if (_811)
    {
        float _881 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _881;
    }
    float _883 = _861;
    float _885 = _853;
    float _887 = _883;
    if (_811)
    {
        float _889 = fma(_853, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _885 = _889;
    }
    float _891 = _885;
    float _893 = _891;
    if (!_811)
    {
        _887 = _799;
    }
    float _895 = _887;
    float _897 = _895;
    if (_811)
    {
        float _899 = _869 + (-1.0);
        _863 = _899;
    }
    float _901 = _863;
    float _903 = 0.0;
    float _905 = _901;
    if (_811)
    {
        float _907 = _835 * _891;
        _903 = _907;
    }
    float _909 = _903;
    if (!_811)
    {
        _893 = _875;
    }
    float _911 = _893;
    float _913 = _911;
    if (_811)
    {
        float _915 = _901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _827 = _915;
    }
    float _917 = _827;
    if (_811)
    {
        float _919 = _799 * _909;
        _897 = _919;
    }
    float _921 = _897;
    if (!_811)
    {
        _837 = _803;
    }
    float _923 = _837;
    float _925 = _923;
    if (_811)
    {
        float _927 = _801 * _909;
        _879 = _927;
    }
    float _929 = _879;
    if (_811)
    {
        float _931 = fma(_875, _869, _917);
        _913 = _931;
    }
    float _933 = _913;
    if (_811)
    {
        float _935 = _921 * _921;
        _925 = _935;
    }
    float _937 = _925;
    if (!_811)
    {
        _905 = _805;
    }
    float _939 = _905;
    float _941 = _939;
    if (_811)
    {
        float _943 = _929 * _929;
        _941 = _943;
    }
    float _945 = _941;
    float _947 = fma(_933, _933, _937);
    float _949 = _947 + _945;
    float _951 = _697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _955 = fma(_795, (*spvDescriptorSet0.vp_c15)._m0[23].w, _953);
    float _957 = precise::clamp(_955, 0.0, 1.0);
    float _959 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _961 = rsqrt(_949);
    float _963 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _951);
    float _965 = _697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _967 = _697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = -_957;
    float _971 = _969 + 1.0;
    float _973 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _975 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _965);
    float _977 = _697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _979 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _967);
    float _981 = abs(_971);
    float _983 = log2(_981);
    float _985 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _975);
    float _987 = _973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _989 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _991 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _977);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = _987 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _999 = _961 * _921;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1003 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _991);
    float _1005 = _961 * _933;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1001);
    float _1011 = -_995;
    float _1013 = fma(_1011, _959, 1.0);
    float _1015 = _961 * _929;
    float _1017 = -_1007;
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1017);
    float _1021 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1023 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1009);
    float _1025 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1027 = -_1015;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1019);
    float _1031 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1033 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1023);
    float _1035 = exp2(_1025);
    float _1037 = fma(_1029, -0.5, 0.5);
    float _1039 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1041 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1031);
    float _1043 = fma(_1029, 0.5, 0.5);
    float _1045 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1039);
    float _1047 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1041);
    float _1049 = 1.0 / _1033;
    float _1051 = _1005 + 1.0;
    float _1053 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1045);
    float _1055 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1047);
    float _1057 = fma(_1043, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1059 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1053);
    float _1061 = log2(_1013);
    float _1063 = fma(_1043, _1057, -0.212114393711090087890625);
    float _1065 = -_1005;
    float _1067 = fma(_1035, _1051, _1065);
    float _1069 = fma(_1043, _1063, 1.570728778839111328125);
    float _1071 = sqrt(_1037);
    float _1073 = _1055 * _1049;
    float _1075 = _1059 * _1049;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = fma(_1075, -0.5, 0.5);
    float _1081 = _1061 * 0.693147182464599609375;
    float _1083 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1085 = _1071 * 0.636619746685028076171875;
    float _1087 = fma(_1067, 0.5, 0.5);
    float3 _2974 = float3(_1077, _1079, _1083);
    float _1089 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2974, float3(0.0), isnan(_2974)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2974, float3(0.0), isnan(_2974)), level(0.0)).x;
    float3 _2985 = float3(_1077, _1079, _1083);
    float4 _1092 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2985, float3(0.0), isnan(_2985)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2985, float3(0.0), isnan(_2985)), level(0.0)).xyzw;
    float _1094 = _1092.x;
    float _1096 = _1092.y;
    float _1098 = _1092.z;
    float _1100 = _1092.w;
    float _1102 = -_1069;
    float _1104 = fma(_1085, _1102, 1.0);
    float2 _3007 = float2(_1104, _1087);
    float3 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3007, float2(0.0), isnan(_3007)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3007, float2(0.0), isnan(_3007)), level(0.0)).xyz;
    float _1110 = _1108.x;
    float _1112 = _1108.y;
    float _1114 = _1108.z;
    float _1116 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1118 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1130 = 1.0 / _1122;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1138 = _417 + _1136;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1142 = 1.0 / _1126;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1148 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1152 = _417 + _1150;
    float _1154 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1118);
    bool _1156 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1158 = isnan(_417);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1152 * _1130;
    bool _1170 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1172 = isnan(_417);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1182;
    bool _1186 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1188 = isnan(_417);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    out.m_58.x = _1144;
    out.m_58.y = _1146;
    out.m_58.z = _1148;
    out.m_58.w = _1140;
    float _1198 = exp2(_1116);
    float _1200 = -_1180;
    float _1202 = _1200 + 1.0;
    float _1204 = fma(_1184, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1206 = _1138 * _1142;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1212;
    float _1216 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1154);
    float _1218 = fma(_1210, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1220 = fma(_1214, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1222 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1224 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1226 = _773 > 0.0;
    bool _1228 = isnan(_773);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan(0.0);
    bool _1234 = _1230 || _1232;
    float _1236 = -_1166;
    float _1238 = _1236 + 1.0;
    float _1240 = _1196 * _1202;
    float _1242 = -_1196;
    float _1244 = _1242 + 1.0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1250 = _1180 * _1238;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1256 = _1204 * _1240;
    float _1258 = _1218 * _1240;
    float _1260 = _1220 * _1240;
    float _1262 = fma(_1254, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1256);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1270 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1258);
    float _1272 = fma(_1248, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1274 = fma(_1262, _1250, _1264);
    float _1276 = fma(_1268, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1278 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1260);
    float _1280 = fma(_1272, _1250, _1270);
    float _1282 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1274);
    float _1284 = _1222 + _1033;
    float _1286 = fma(_1276, _1250, _1278);
    float _1288 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1280);
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1294 = -_1198;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1286);
    float _1300 = _1284 * 0.5;
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1312 = _1224 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1314 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = -_1304;
    float _1318 = _1316 + 1.0;
    out.gl_Position.x = _1055;
    out.gl_Position.y = _1059;
    out.gl_Position.z = _1222;
    out.gl_Position.w = _1033;
    out.m_60.x = _1308;
    out.m_60.y = _1310;
    out.m_60.z = _1314;
    out.m_60.w = _1292;
    out.m_62.z = _1300;
    out.m_62.w = _1033;
    out.m_45.x = _1312;
    float _1320 = _1304 * _1089;
    float _1322 = _1100 * _1318;
    float _1324 = _1100 * _1320;
    float _1326 = _1114 * _1320;
    float _1328 = fma(_1110, _1324, _1094);
    float _1330 = fma(_1112, _1324, _1096);
    float _1332 = fma(_1100, _1326, _1098);
    out.m_64.x = _1328;
    out.m_64.y = _1330;
    out.m_64.z = _1332;
    out.m_64.w = _1322;
    if (_1234)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1334;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _409 = false;
    bool _263 = false;
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
        float _1391 = as_type<float>(_99);
        out.gl_Position.z = _1391;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1460 = as_type<float>(_135);
        out.gl_Position.z = _1460;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    int _163 = _161 ? (-1090519040) : 1056964608;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    bool _175 = !_151;
    int _177 = _175 ? (-1090519040) : 1056964608;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = cos(_179);
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    bool _187 = !_169;
    int _189 = _187 ? 0 : 1;
    out.m_54.x = as_type<float>(_177);
    out.m_54.y = as_type<float>(_163);
    bool _191 = !_185;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_189);
    float _197 = -_159;
    float _199 = _147 + _197;
    int _201 = abs(_193);
    float _203 = -_199;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _209 = float(_195);
    float _211 = fma(_181, 0.5, 0.5);
    bool _213 = !_173;
    int _215 = _213 ? 0 : 1;
    bool _217 = _199 < 0.5;
    float _219 = float(_217);
    float _221 = abs(_205);
    float _223 = _209 * _221;
    int _225 = abs(_215);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_201);
    float _233 = -_219;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _223);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_207;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    bool _277 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_271);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    bool _289 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_271);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_287;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _303;
    bool _315 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_271);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -_299;
    float _331 = _329 + 1.0;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _335 = _325 * _331;
    float _337 = 1.0 / _307;
    float _339 = -_325;
    float _341 = _339 + 1.0;
    float _343 = _275 * _313;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _271 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = fma(_351, _343, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_355, _343, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = _347 * _337;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _357 * _335;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = _359 * _335;
    float _375 = fma(_365, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _367);
    float _379 = fma(_371, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = fma(_375, _327, _377);
    float _385 = fma(_379, _327, _381);
    float _387 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    bool _391 = !_333;
    float _407;
    if (!_391)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_83);
        float _413 = 1.0 / _411;
        float _415 = _117 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = in.m_56.x;
    float _421 = in.m_56.y;
    float _423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_163));
    float _425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_177));
    float _427 = in.m_42.x;
    float _429 = in.m_42.y;
    float _431 = in.m_42.z;
    bool _433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _435 = isnan(0.5);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _441 = _437 || _439;
    bool _443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _445 = isnan(0.5);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _451 = _447 || _449;
    float _453 = _389 * _421;
    float _455 = _387 * _419;
    float _457 = _243 * _453;
    float _459 = _243 * _455;
    float _461 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _463 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _465 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _461);
    float _469 = _463 * _423;
    float _471 = _465 * _425;
    float _473 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _475 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _481 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
    float _483 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[26].x, _477);
    float _487 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _489 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _481);
    float _491 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[24].x, _479);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _485);
    float _495 = _483 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _497 = _489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _503 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _505 = _469 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _509 = _497 + _501;
    float _511 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
    float _513 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[25].x, _505);
    float _515 = _495 + _507;
    float _517 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _519 = _509 + _517;
    float _521 = _511 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _523 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _513);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _515 + _525;
    float _529 = _519 * _519;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _533 = _523 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _535 = fma(_527, _527, _529);
    float _537 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[11].x, _531);
    float _539 = _521 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _541 = _521 + _533;
    float _543 = sqrt(_535);
    float _545 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[11].z, _537);
    float _547 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[10].x, _539);
    float _549 = _545 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _551 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[10].z, _547);
    float _553 = 1.0 / _549;
    float _555 = _551 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _557 = _555 + _549;
    bool _559 = _543 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _561 = _557 * _553;
    float _563 = _561 * 0.5;
    float _565 = _557;
    float _567 = _475;
    float _569 = _545;
    float _571 = _505;
    float _573 = _509;
    float _575 = _549;
    if (!_559)
    {
        _565 = _515;
    }
    float _577 = _565;
    float _579 = _577;
    if (!_559)
    {
        _567 = _509;
    }
    float _581 = _567;
    float _583 = _581;
    if (!_559)
    {
        _569 = _541;
    }
    float _585 = _569;
    bool _587 = !_559;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _595 = _543 + _593;
        float _597 = _541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _599 = rsqrt(_535);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = fma(_611, _597, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _617 = _613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _619 = _599 * _615;
        float _621 = fma(_541, _607, _617);
        float _623 = fma(_527, _619, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _625 = fma(_519, _619, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _579 = _623;
        _589 = _621;
        _583 = _625;
        _571 = _619;
    }
    float _627 = _579;
    float _629 = _589;
    float _631 = _583;
    float _633 = _571;
    float _635 = _629;
    float _637 = _627;
    float _639 = _631;
    float _641 = _633;
    if (_451)
    {
        _573 = 1.0;
    }
    float _643 = _573;
    float _645 = _643;
    if (!_441)
    {
        float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _649 = _521 + _647;
        float _651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _653 = _495 + _651;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _657 = -_495;
        float _659 = _657 + _627;
        float _661 = _649 * _649;
        float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _665 = _497 + _663;
        float _667 = -_521;
        float _669 = _667 + _629;
        float _671 = fma(_653, _653, _661);
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _675 = fma(_665, _665, _671);
        float _677 = sqrt(_675);
        float _679 = _655 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _681 = precise::min(_677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _683 = _681 * _673;
        float _685 = _679 * _683;
        float _687 = -_497;
        float _689 = _687 + _631;
        float _691 = fma(_659, _685, _495);
        float _693 = fma(_669, _685, _521);
        float _695 = fma(_689, _685, _497);
        _635 = _693;
        _637 = _691;
        _639 = _695;
        _575 = _673;
        _641 = _685;
    }
    float _697 = _635;
    float _699 = _637;
    float _701 = _639;
    float _703 = _575;
    float _705 = _641;
    float _707 = _703;
    float _709 = _705;
    if (!_451)
    {
        float _711 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _713 = _711 * 0.15915493667125701904296875;
        float _715 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _719 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _717);
        float _721 = _713 * 6.283185482025146484375;
        float _723 = cos(_721);
        float _725 = _715 * 0.15915493667125701904296875;
        float _727 = _713 * 6.283185482025146484375;
        float _729 = sin(_727);
        float _731 = 1.0 / _723;
        float _733 = _725 * 6.283185482025146484375;
        float _735 = cos(_733);
        float _737 = _729 * _731;
        float _739 = _725 * 6.283185482025146484375;
        float _741 = sin(_739);
        float _743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _745 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _743;
        float _747 = _735 * _737;
        float _749 = 1.0 / _719;
        float _751 = 1.0 / _747;
        float _753 = 1.0 / _745;
        float _755 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _757 = _749 * _755;
        float _759 = _741 * _751;
        float _761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _763 = fma(_759, _757, _761);
        float _765 = _763 * _753;
        float _767 = precise::clamp(_765, 0.0, 1.0);
        _707 = _713;
        _709 = _725;
        _645 = _767;
    }
    float _769 = _707;
    float _771 = _709;
    float _773 = _645;
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _777 = _697 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _781 = _699 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _785 = _701 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_781, _781, _787);
    float _791 = fma(_785, _785, _789);
    float _793 = rsqrt(_791);
    float _795 = sqrt(_791);
    float _797 = _793 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _799 = _781 * _797;
    float _801 = _785 * _797;
    float _803 = _799 * _799;
    float _805 = _801 * _801;
    float _807 = _803 + _805;
    float _809 = sqrt(_807);
    bool _811 = _809 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _815 = _809 + _813;
    float _817 = _793;
    float _819 = _807;
    float _821 = _815;
    float _823 = _769;
    float _825 = _777;
    float _827 = _797;
    if (_811)
    {
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _817 = _829;
    }
    float _831 = _817;
    if (_811)
    {
        float _833 = rsqrt(_807);
        _819 = _833;
    }
    float _835 = _819;
    float _837 = _835;
    if (_811)
    {
        float _839 = _815 * _831;
        _821 = _839;
    }
    float _841 = _821;
    if (_811)
    {
        float _843 = _841 * 0.15915493667125701904296875;
        _823 = _843;
    }
    float _845 = _823;
    float _847 = _785;
    if (_811)
    {
        float _849 = _845 * 6.283185482025146484375;
        float _851 = sin(_849);
        _847 = _851;
    }
    float _853 = _847;
    float _855 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _857 = precise::max(0.0, _855);
    float _859 = _771;
    float _861 = _857;
    float _863 = _855;
    if (_811)
    {
        float _865 = _845 * 6.283185482025146484375;
        float _867 = cos(_865);
        _859 = _867;
    }
    float _869 = _859;
    float _871 = -_797;
    float _873 = -_857;
    float _875 = fma(_777, _871, _873);
    if (!_811)
    {
        _825 = _801;
    }
    float _877 = _825;
    float _879 = _877;
    if (_811)
    {
        float _881 = _875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _881;
    }
    float _883 = _861;
    float _885 = _853;
    float _887 = _883;
    if (_811)
    {
        float _889 = fma(_853, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _885 = _889;
    }
    float _891 = _885;
    float _893 = _891;
    if (!_811)
    {
        _887 = _799;
    }
    float _895 = _887;
    float _897 = _895;
    if (_811)
    {
        float _899 = _869 + (-1.0);
        _863 = _899;
    }
    float _901 = _863;
    float _903 = 0.0;
    float _905 = _901;
    if (_811)
    {
        float _907 = _835 * _891;
        _903 = _907;
    }
    float _909 = _903;
    if (!_811)
    {
        _893 = _875;
    }
    float _911 = _893;
    float _913 = _911;
    if (_811)
    {
        float _915 = _901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _827 = _915;
    }
    float _917 = _827;
    if (_811)
    {
        float _919 = _799 * _909;
        _897 = _919;
    }
    float _921 = _897;
    if (!_811)
    {
        _837 = _803;
    }
    float _923 = _837;
    float _925 = _923;
    if (_811)
    {
        float _927 = _801 * _909;
        _879 = _927;
    }
    float _929 = _879;
    if (_811)
    {
        float _931 = fma(_875, _869, _917);
        _913 = _931;
    }
    float _933 = _913;
    if (_811)
    {
        float _935 = _921 * _921;
        _925 = _935;
    }
    float _937 = _925;
    if (!_811)
    {
        _905 = _805;
    }
    float _939 = _905;
    float _941 = _939;
    if (_811)
    {
        float _943 = _929 * _929;
        _941 = _943;
    }
    float _945 = _941;
    float _947 = fma(_933, _933, _937);
    float _949 = _947 + _945;
    float _951 = _697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _955 = fma(_795, (*spvDescriptorSet0.vp_c15)._m0[23].w, _953);
    float _957 = precise::clamp(_955, 0.0, 1.0);
    float _959 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _961 = rsqrt(_949);
    float _963 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _951);
    float _965 = _697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _967 = _697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _969 = -_957;
    float _971 = _969 + 1.0;
    float _973 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _975 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _965);
    float _977 = _697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _979 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _967);
    float _981 = abs(_971);
    float _983 = log2(_981);
    float _985 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _975);
    float _987 = _973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _989 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _991 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _977);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = _987 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _999 = _961 * _921;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1003 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _991);
    float _1005 = _961 * _933;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1001);
    float _1011 = -_995;
    float _1013 = fma(_1011, _959, 1.0);
    float _1015 = _961 * _929;
    float _1017 = -_1007;
    float _1019 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1017);
    float _1021 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1023 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1009);
    float _1025 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1027 = -_1015;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1019);
    float _1031 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1033 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1023);
    float _1035 = exp2(_1025);
    float _1037 = fma(_1029, -0.5, 0.5);
    float _1039 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1041 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1031);
    float _1043 = fma(_1029, 0.5, 0.5);
    float _1045 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1039);
    float _1047 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1041);
    float _1049 = 1.0 / _1033;
    float _1051 = _1005 + 1.0;
    float _1053 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1045);
    float _1055 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1047);
    float _1057 = fma(_1043, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1059 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1053);
    float _1061 = log2(_1013);
    float _1063 = fma(_1043, _1057, -0.212114393711090087890625);
    float _1065 = -_1005;
    float _1067 = fma(_1035, _1051, _1065);
    float _1069 = fma(_1043, _1063, 1.570728778839111328125);
    float _1071 = sqrt(_1037);
    float _1073 = _1055 * _1049;
    float _1075 = _1059 * _1049;
    float _1077 = fma(_1073, 0.5, 0.5);
    float _1079 = fma(_1075, -0.5, 0.5);
    float _1081 = _1061 * 0.693147182464599609375;
    float _1083 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1085 = _1071 * 0.636619746685028076171875;
    float _1087 = fma(_1067, 0.5, 0.5);
    float3 _2974 = float3(_1077, _1079, _1083);
    float _1089 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2974, float3(0.0), isnan(_2974)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2974, float3(0.0), isnan(_2974)), level(0.0)).x;
    float3 _2985 = float3(_1077, _1079, _1083);
    float4 _1092 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2985, float3(0.0), isnan(_2985)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2985, float3(0.0), isnan(_2985)), level(0.0)).xyzw;
    float _1094 = _1092.x;
    float _1096 = _1092.y;
    float _1098 = _1092.z;
    float _1100 = _1092.w;
    float _1102 = -_1069;
    float _1104 = fma(_1085, _1102, 1.0);
    float2 _3007 = float2(_1104, _1087);
    float3 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3007, float2(0.0), isnan(_3007)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3007, float2(0.0), isnan(_3007)), level(0.0)).xyz;
    float _1110 = _1108.x;
    float _1112 = _1108.y;
    float _1114 = _1108.z;
    float _1116 = _983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1118 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1130 = 1.0 / _1122;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1138 = _417 + _1136;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1142 = 1.0 / _1126;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1148 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1152 = _417 + _1150;
    float _1154 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1118);
    bool _1156 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1158 = isnan(_417);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1152 * _1130;
    bool _1170 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1172 = isnan(_417);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1182;
    bool _1186 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1188 = isnan(_417);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    out.m_58.x = _1144;
    out.m_58.y = _1146;
    out.m_58.z = _1148;
    out.m_58.w = _1140;
    float _1198 = exp2(_1116);
    float _1200 = -_1180;
    float _1202 = _1200 + 1.0;
    float _1204 = fma(_1184, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1206 = _1138 * _1142;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1212;
    float _1216 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1154);
    float _1218 = fma(_1210, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1220 = fma(_1214, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1222 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1216);
    float _1224 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1226 = _773 > 0.0;
    bool _1228 = isnan(_773);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan(0.0);
    bool _1234 = _1230 || _1232;
    float _1236 = -_1166;
    float _1238 = _1236 + 1.0;
    float _1240 = _1196 * _1202;
    float _1242 = -_1196;
    float _1244 = _1242 + 1.0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1250 = _1180 * _1238;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1256 = _1204 * _1240;
    float _1258 = _1218 * _1240;
    float _1260 = _1220 * _1240;
    float _1262 = fma(_1254, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1256);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1270 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1258);
    float _1272 = fma(_1248, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1274 = fma(_1262, _1250, _1264);
    float _1276 = fma(_1268, _1206, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1278 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1260);
    float _1280 = fma(_1272, _1250, _1270);
    float _1282 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1274);
    float _1284 = _1222 + _1033;
    float _1286 = fma(_1276, _1250, _1278);
    float _1288 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1280);
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1294 = -_1198;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1286);
    float _1300 = _1284 * 0.5;
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1312 = _1224 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1314 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = -_1304;
    float _1318 = _1316 + 1.0;
    out.gl_Position.x = _1055;
    out.gl_Position.y = _1059;
    out.gl_Position.z = _1222;
    out.gl_Position.w = _1033;
    out.m_60.x = _1308;
    out.m_60.y = _1310;
    out.m_60.z = _1314;
    out.m_60.w = _1292;
    out.m_62.z = _1300;
    out.m_62.w = _1033;
    out.m_45.x = _1312;
    float _1320 = _1304 * _1089;
    float _1322 = _1100 * _1318;
    float _1324 = _1100 * _1320;
    float _1326 = _1114 * _1320;
    float _1328 = fma(_1110, _1324, _1094);
    float _1330 = fma(_1112, _1324, _1096);
    float _1332 = fma(_1100, _1326, _1098);
    out.m_64.x = _1328;
    out.m_64.y = _1330;
    out.m_64.z = _1332;
    out.m_64.w = _1322;
    if (_1234)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1334;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

