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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _421 = false;
    bool _275 = false;
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
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1482 = as_type<float>(_99);
        out.gl_Position.z = _1482;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_135);
        out.gl_Position.z = _1551;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = _155 * 6.283185482025146484375;
    float _159 = floor(_155);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _157 * 0.15915493667125701904296875;
    float _173 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _177 = !_163;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    int _189 = abs(_179);
    float _191 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    bool _193 = !_153;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _201 = -_159;
    float _203 = _155 + _201;
    bool _205 = !_167;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _215 = float(_189);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_187, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _215 * _223;
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_235, _233, _225);
    float _245 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _247 = abs(_239);
    float _249 = fma(_241, _247, _243);
    bool _251 = !_217;
    float _253 = _245;
    float _255 = _199;
    float _257 = _197;
    float _273;
    if (!_251)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_83);
        float _279 = 1.0 / _277;
        float _281 = _115 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    bool _301 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_283);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = 1.0 / _315;
    bool _327 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_283);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _311 * _323;
    float _341 = -_311;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = _337 * _343;
    float _349 = 1.0 / _319;
    float _351 = -_337;
    float _353 = _351 + 1.0;
    float _355 = _287 * _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _359 = _283 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_363, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _359 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _369 * _347;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _371 * _347;
    float _387 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _391 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _395 = fma(_387, _339, _389);
    float _397 = fma(_391, _339, _393);
    float _399 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    float _401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _403 = !_345;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_83);
        float _425 = 1.0 / _423;
        float _427 = _115 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = as_type<float>(int(gl_VertexIndex));
    float _433 = in.m_56.x;
    float _435 = in.m_56.y;
    float _437 = in.m_42.x;
    float _439 = in.m_42.y;
    float _441 = in.m_42.z;
    int _443 = as_type<int>(_431) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_431) & 2;
    bool _449 = _447 != 0;
    float _451 = _401 * _435;
    bool _453 = !_449;
    float _455 = _453 ? (-0.5) : 0.5;
    float _457 = _399 * _433;
    bool _459 = !_445;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _455);
    float _467 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _461);
    float _471 = _463 * _465;
    float _473 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _475 = _467 * _469;
    float _477 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _479 = _471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _481 = _471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _483 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _485 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _479);
    float _489 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _477);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].x, _481);
    float _493 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].z, _487);
    float _497 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _489);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _509 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _501 + _503;
    float _513 = _471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _515 = _505 + _507;
    float _517 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _521 = _511 + _519;
    float _523 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].x, _513);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _515 + _525;
    float _529 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
    float _531 = _521 * _521;
    float _533 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].z, _523);
    float _535 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _537 = fma(_527, _527, _531);
    float _539 = _533 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _541 = sqrt(_537);
    float _543 = _535 + _539;
    bool _545 = _541 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _547 = _483;
    float _549 = _441;
    float _551 = _539;
    float _553 = _537;
    if (!_545)
    {
        _547 = _515;
    }
    float _555 = _547;
    float _557 = _555;
    if (!_545)
    {
        _549 = _511;
    }
    float _559 = _549;
    float _561 = _559;
    if (!_545)
    {
        _551 = _543;
    }
    float _563 = _551;
    bool _565 = !_545;
    float _567 = _563;
    if (!_565)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _573 = _541 + _571;
        float _575 = rsqrt(_537);
        float _577 = _573 * _569;
        float _579 = _543 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = _577 * 0.15915493667125701904296875;
        float _583 = _581 * 6.283185482025146484375;
        float _585 = cos(_583);
        float _587 = _581 * 6.283185482025146484375;
        float _589 = sin(_587);
        float _591 = _585 + (-1.0);
        float _593 = fma(_589, _579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = _591 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _597 = _575 * _593;
        float _599 = fma(_543, _585, _595);
        float _601 = fma(_527, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _603 = fma(_521, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _567 = _599;
        _557 = _601;
        _561 = _603;
    }
    float _605 = _567;
    float _607 = _557;
    float _609 = _561;
    float _611 = -_535;
    float _613 = _611 + _605;
    float _615 = -_505;
    float _617 = _615 + _607;
    float _619 = -_501;
    float _621 = _619 + _609;
    float _623 = _535 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _625 = _613 * _613;
    bool _627 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _629 = isnan(0.5);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _635 = _631 || _633;
    float _637 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _623);
    float _639 = fma(_617, _617, _625);
    bool _641 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _643 = isnan(0.5);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _649 = _645 || _647;
    float _651 = fma(_621, _621, _639);
    float _653 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _637);
    float _655 = _535 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _657 = sqrt(_651);
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _661 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _655);
    float _663 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _661);
    float _665 = 1.0 / _659;
    float _667 = _663 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _669 = _657 > 0.0;
    float _671 = _667 + _659;
    float _673 = _671 * _665;
    float _675 = _673 * 0.5;
    bool _677 = !_669;
    float _679 = _607;
    float _681 = _605;
    float _683 = _609;
    float _685 = _659;
    if (!_677)
    {
        float _687 = _245 * _245;
        float _689 = rsqrt(_651);
        float _691 = fma(_197, _197, _687);
        float _693 = fma(_199, _199, _691);
        float _695 = sqrt(_693);
        float _697 = _617 * _689;
        float _699 = _613 * _689;
        float _701 = _621 * _689;
        bool _703 = _695 > 0.0;
        bool _705 = !_703;
        _685 = _689;
        _553 = _699;
        if (!_705)
        {
            float _707 = rsqrt(_693);
            float _709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _711 = _245 * _707;
            float _713 = _197 * _707;
            float _715 = _699 * _711;
            float _717 = _199 * _707;
            float _719 = fma(_697, _713, _715);
            float _721 = _709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _723 = fma(_701, _717, _719);
            float _725 = _723 * _721;
            float _727 = fma(_197, _725, _607);
            float _729 = fma(_245, _725, _605);
            float _731 = fma(_199, _725, _609);
            _679 = _727;
            _681 = _729;
            _683 = _731;
            _685 = _725;
        }
    }
    float _733 = _679;
    float _735 = _681;
    float _737 = _683;
    float _739 = _685;
    float _741 = _553;
    float _743 = _739;
    float _745 = _733;
    float _747 = _735;
    float _749 = _741;
    if (_649)
    {
        _743 = 1.0;
    }
    float _751 = _743;
    float _753 = _751;
    if (_635)
    {
        _253 = _733;
    }
    float _755 = _253;
    float _757 = _755;
    if (_635)
    {
        _255 = _735;
    }
    float _759 = _255;
    float _761 = _759;
    if (_635)
    {
        _257 = _737;
    }
    float _763 = _257;
    float _765 = _763;
    if (!_635)
    {
        float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _769 = _535 + _767;
        float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _773 = _505 + _771;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _777 = -_501;
        float _779 = _777 + _737;
        float _781 = _769 * _769;
        float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _785 = _501 + _783;
        float _787 = fma(_773, _773, _781);
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _791 = fma(_785, _785, _787);
        float _793 = sqrt(_791);
        float _795 = _775 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _797 = precise::min(_793, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _799 = _797 * _789;
        float _801 = -_505;
        float _803 = _801 + _733;
        float _805 = _795 * _799;
        float _807 = -_535;
        float _809 = _807 + _735;
        float _811 = fma(_803, _805, _505);
        float _813 = fma(_809, _805, _535);
        float _815 = fma(_779, _805, _501);
        _761 = _813;
        _757 = _811;
        _765 = _815;
    }
    float _817 = _761;
    float _819 = _757;
    float _821 = _765;
    if (!_649)
    {
        float _823 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _825 = _823 * 0.15915493667125701904296875;
        float _827 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _831 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _829);
        float _833 = _825 * 6.283185482025146484375;
        float _835 = cos(_833);
        float _837 = _827 * 0.15915493667125701904296875;
        float _839 = _825 * 6.283185482025146484375;
        float _841 = sin(_839);
        float _843 = 1.0 / _835;
        float _845 = _837 * 6.283185482025146484375;
        float _847 = cos(_845);
        float _849 = _841 * _843;
        float _851 = _837 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _855;
        float _859 = _847 * _849;
        float _861 = 1.0 / _831;
        float _863 = 1.0 / _859;
        float _865 = 1.0 / _857;
        float _867 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _869 = _861 * _867;
        float _871 = _853 * _863;
        float _873 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _875 = fma(_871, _869, _873);
        float _877 = _875 * _865;
        float _879 = precise::clamp(_877, 0.0, 1.0);
        _745 = _865;
        _747 = _837;
        _753 = _879;
    }
    float _881 = _745;
    float _883 = _747;
    float _885 = _753;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _889 = _817 + _887;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _893 = _819 + _891;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _897 = _821 + _895;
    float _899 = _889 * _889;
    float _901 = fma(_893, _893, _899);
    float _903 = fma(_897, _897, _901);
    float _905 = rsqrt(_903);
    float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _909 = _893 * _907;
    float _911 = _897 * _907;
    float _913 = _909 * _909;
    float _915 = _911 * _911;
    float _917 = _913 + _915;
    float _919 = sqrt(_917);
    bool _921 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _925 = _919 + _923;
    float _927 = _905;
    float _929 = _917;
    float _931 = _925;
    float _933 = _881;
    float _935 = _889;
    float _937 = _883;
    if (_921)
    {
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _939;
    }
    float _941 = _927;
    if (_921)
    {
        float _943 = rsqrt(_917);
        _929 = _943;
    }
    float _945 = _929;
    float _947 = _945;
    if (_921)
    {
        float _949 = _925 * _941;
        _931 = _949;
    }
    float _951 = _931;
    if (_921)
    {
        float _953 = _951 * 0.15915493667125701904296875;
        _933 = _953;
    }
    float _955 = _933;
    float _957 = _897;
    if (_921)
    {
        float _959 = _955 * 6.283185482025146484375;
        float _961 = sin(_959);
        _957 = _961;
    }
    float _963 = _957;
    float _965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _967 = precise::max(0.0, _965);
    float _969 = _941;
    float _971 = _967;
    if (_921)
    {
        float _973 = _955 * 6.283185482025146484375;
        float _975 = cos(_973);
        _969 = _975;
    }
    float _977 = _969;
    float _979 = -_907;
    float _981 = -_967;
    float _983 = fma(_889, _979, _981);
    if (_921)
    {
        float _985 = _983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _985;
    }
    float _987 = _935;
    float _989 = sqrt(_903);
    float _991 = _987;
    float _993 = _963;
    if (_921)
    {
        float _995 = fma(_963, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _997;
    if (!_921)
    {
        _993 = _909;
    }
    float _1001 = _993;
    float _1003 = _1001;
    float _1005 = _977;
    if (_921)
    {
        float _1007 = _977 + (-1.0);
        _971 = _1007;
    }
    float _1009 = _971;
    float _1011 = _1009;
    if (_921)
    {
        float _1013 = _945 * _997;
        _749 = _1013;
    }
    float _1015 = _749;
    if (!_921)
    {
        _999 = _983;
    }
    float _1017 = _999;
    float _1019 = _1017;
    if (_921)
    {
        float _1021 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _1021;
    }
    float _1023 = _937;
    if (_921)
    {
        float _1025 = _909 * _1015;
        _1003 = _1025;
    }
    float _1027 = _1003;
    if (!_921)
    {
        _1011 = _911;
    }
    float _1029 = _1011;
    float _1031 = _1029;
    if (_921)
    {
        float _1033 = _911 * _1015;
        _1031 = _1033;
    }
    float _1035 = _1031;
    if (!_921)
    {
        _947 = _913;
    }
    float _1037 = _947;
    float _1039 = _1037;
    if (_921)
    {
        float _1041 = fma(_983, _977, _1023);
        _1019 = _1041;
    }
    float _1043 = _1019;
    if (_921)
    {
        float _1045 = _1027 * _1027;
        _1039 = _1045;
    }
    float _1047 = _1039;
    if (!_921)
    {
        _1005 = _915;
    }
    float _1049 = _1005;
    float _1051 = _1049;
    if (_921)
    {
        float _1053 = _1035 * _1035;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_1043, _1043, _1047);
    float _1059 = _1057 + _1055;
    float _1061 = _817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1065 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1063);
    float _1067 = precise::clamp(_1065, 0.0, 1.0);
    float _1069 = _817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = rsqrt(_1059);
    float _1073 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = -_1067;
    float _1077 = _1075 + 1.0;
    float _1079 = _817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1083 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1085 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1087 = _817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1089 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1093 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1095 = abs(_1077);
    float _1097 = log2(_1095);
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1087);
    float _1103 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1093);
    float _1105 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1107 = _1071 * _1027;
    float _1109 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1101);
    float _1111 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1113 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1119 = -_1105;
    float _1121 = fma(_1119, _1085, 1.0);
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1113);
    float _1125 = _1071 * _1043;
    float _1127 = _1071 * _1035;
    float _1129 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1131 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1133 = -_1115;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1133);
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1123);
    float _1139 = log2(_1121);
    float _1141 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = -_1127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1135);
    float _1147 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1137);
    float _1149 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1129);
    float _1151 = fma(_1145, -0.5, 0.5);
    float _1153 = fma(_1145, 0.5, 0.5);
    float _1155 = exp2(_1131);
    float _1157 = _1125 + 1.0;
    float _1159 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1161 = 1.0 / _1147;
    float _1163 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1165 = fma(_1153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1167 = _1139 * 0.693147182464599609375;
    float _1169 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1163);
    float _1171 = fma(_1153, _1165, -0.212114393711090087890625);
    float _1173 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1175 = sqrt(_1151);
    float _1177 = -_1125;
    float _1179 = fma(_1155, _1157, _1177);
    float _1181 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1159);
    float _1183 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1169);
    float _1185 = fma(_1153, _1171, 1.570728778839111328125);
    float _1187 = fma(_1179, 0.5, 0.5);
    float _1189 = _1181 * _1161;
    float _1191 = _1183 * _1161;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1175 * 0.636619746685028076171875;
    float3 _3236 = float3(_1193, _1195, _1173);
    float _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).x;
    float3 _3247 = float3(_1193, _1195, _1173);
    float4 _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).xyzw;
    float _1204 = _1202.x;
    float _1206 = _1202.y;
    float _1208 = _1202.z;
    float _1210 = _1202.w;
    float _1212 = -_1185;
    float _1214 = fma(_1197, _1212, 1.0);
    float2 _3269 = float2(_1214, _1187);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3269, float2(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3269, float2(0.0), isnan(_3269)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_49.y;
    bool _1228 = _137 > 0.5;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1232 = _429 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1234;
    float _1238 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1240 = -_461;
    int _1242 = _1228 ? as_type<int>(_1240) : as_type<int>(_461);
    float _1244 = 1.0 / _1236;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    bool _1256 = !_1248;
    float _1258 = _1256 ? _461 : as_type<float>(_1242);
    float _1260 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1250);
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1264 = _885 > 0.0;
    bool _1266 = isnan(_885);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan(0.0);
    bool _1272 = _1268 || _1270;
    float _1274 = _1258 + 0.5;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1278 = _1232 * _1244;
    bool _1280 = _1226 > 0.5;
    bool _1282 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1284 = isnan(_429);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1294;
    bool _1298 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1300 = isnan(_429);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1310;
    float _1314 = -_455;
    int _1316 = _1280 ? as_type<int>(_1314) : as_type<int>(_455);
    float _1318 = -_1292;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1296, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1324;
    bool _1328 = !_1254;
    float _1330 = _1328 ? _455 : as_type<float>(_1316);
    float _1332 = _1308 * _1320;
    float _1334 = -_1308;
    float _1336 = _1334 + 1.0;
    float _1338 = fma(_1312, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1340 = fma(_1326, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1342 = _1322 * _1332;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1346 = _1338 * _1332;
    float _1348 = _1340 * _1332;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1342);
    float _1352 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1348);
    float _1358 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1360 = exp2(_1352);
    float _1362 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1350);
    float _1364 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1354);
    float _1366 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1356);
    float _1368 = _249 * _1358;
    float _1370 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1260);
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1376 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1378 = _1370 + _1147;
    float _1380 = -_1330;
    float _1382 = _1380 + 0.5;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = -_1360;
    float _1392 = _1390 + 1.0;
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1378 * 0.5;
    float _1398 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1181;
    out.gl_Position.y = _1183;
    out.gl_Position.z = _1370;
    out.gl_Position.w = _1147;
    float _1402 = _1276 * _1262;
    float _1404 = _1398 * _1344;
    float _1406 = -_1400;
    float _1408 = _1406 + 1.0;
    out.m_58.x = _1386;
    out.m_58.y = _1388;
    out.m_58.z = _1394;
    out.m_58.w = _1384;
    float _1410 = _1368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1402;
    out.m_60.y = _1404;
    out.m_62.z = _1396;
    out.m_62.w = _1147;
    out.m_45.x = _1410;
    float _1412 = _1400 * _1199;
    float _1414 = _1210 * _1408;
    float _1416 = _1210 * _1412;
    float _1418 = _1224 * _1412;
    float _1420 = fma(_1220, _1416, _1204);
    float _1422 = fma(_1222, _1416, _1206);
    float _1424 = fma(_1210, _1418, _1208);
    out.m_64.x = _1420;
    out.m_64.y = _1422;
    out.m_64.z = _1424;
    out.m_64.w = _1414;
    if (_1272)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1426 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1426;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _421 = false;
    bool _275 = false;
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
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1482 = as_type<float>(_99);
        out.gl_Position.z = _1482;
    }
    if (!_87)
    {
        return out;
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_135);
        out.gl_Position.z = _1551;
    }
    if (_125)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = _155 * 6.283185482025146484375;
    float _159 = floor(_155);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _157 * 0.15915493667125701904296875;
    float _173 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _177 = !_163;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    int _189 = abs(_179);
    float _191 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    bool _193 = !_153;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _201 = -_159;
    float _203 = _155 + _201;
    bool _205 = !_167;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _215 = float(_189);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_187, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _215 * _223;
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_235, _233, _225);
    float _245 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _247 = abs(_239);
    float _249 = fma(_241, _247, _243);
    bool _251 = !_217;
    float _253 = _245;
    float _255 = _199;
    float _257 = _197;
    float _273;
    if (!_251)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_83);
        float _279 = 1.0 / _277;
        float _281 = _115 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    bool _301 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_283);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = 1.0 / _315;
    bool _327 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_283);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _311 * _323;
    float _341 = -_311;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = _337 * _343;
    float _349 = 1.0 / _319;
    float _351 = -_337;
    float _353 = _351 + 1.0;
    float _355 = _287 * _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _359 = _283 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_363, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _359 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _369 * _347;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _371 * _347;
    float _387 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _391 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _395 = fma(_387, _339, _389);
    float _397 = fma(_391, _339, _393);
    float _399 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    float _401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _403 = !_345;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_83);
        float _425 = 1.0 / _423;
        float _427 = _115 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = as_type<float>(int(gl_VertexIndex));
    float _433 = in.m_56.x;
    float _435 = in.m_56.y;
    float _437 = in.m_42.x;
    float _439 = in.m_42.y;
    float _441 = in.m_42.z;
    int _443 = as_type<int>(_431) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_431) & 2;
    bool _449 = _447 != 0;
    float _451 = _401 * _435;
    bool _453 = !_449;
    float _455 = _453 ? (-0.5) : 0.5;
    float _457 = _399 * _433;
    bool _459 = !_445;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _455);
    float _467 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _461);
    float _471 = _463 * _465;
    float _473 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _475 = _467 * _469;
    float _477 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _479 = _471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _481 = _471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _483 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _485 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _479);
    float _489 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _477);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].x, _481);
    float _493 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].z, _487);
    float _497 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _489);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _509 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _501 + _503;
    float _513 = _471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _515 = _505 + _507;
    float _517 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _521 = _511 + _519;
    float _523 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].x, _513);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _515 + _525;
    float _529 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
    float _531 = _521 * _521;
    float _533 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].z, _523);
    float _535 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _537 = fma(_527, _527, _531);
    float _539 = _533 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _541 = sqrt(_537);
    float _543 = _535 + _539;
    bool _545 = _541 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _547 = _483;
    float _549 = _441;
    float _551 = _539;
    float _553 = _537;
    if (!_545)
    {
        _547 = _515;
    }
    float _555 = _547;
    float _557 = _555;
    if (!_545)
    {
        _549 = _511;
    }
    float _559 = _549;
    float _561 = _559;
    if (!_545)
    {
        _551 = _543;
    }
    float _563 = _551;
    bool _565 = !_545;
    float _567 = _563;
    if (!_565)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _573 = _541 + _571;
        float _575 = rsqrt(_537);
        float _577 = _573 * _569;
        float _579 = _543 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = _577 * 0.15915493667125701904296875;
        float _583 = _581 * 6.283185482025146484375;
        float _585 = cos(_583);
        float _587 = _581 * 6.283185482025146484375;
        float _589 = sin(_587);
        float _591 = _585 + (-1.0);
        float _593 = fma(_589, _579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = _591 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _597 = _575 * _593;
        float _599 = fma(_543, _585, _595);
        float _601 = fma(_527, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _603 = fma(_521, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _567 = _599;
        _557 = _601;
        _561 = _603;
    }
    float _605 = _567;
    float _607 = _557;
    float _609 = _561;
    float _611 = -_535;
    float _613 = _611 + _605;
    float _615 = -_505;
    float _617 = _615 + _607;
    float _619 = -_501;
    float _621 = _619 + _609;
    float _623 = _535 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _625 = _613 * _613;
    bool _627 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _629 = isnan(0.5);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _635 = _631 || _633;
    float _637 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _623);
    float _639 = fma(_617, _617, _625);
    bool _641 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _643 = isnan(0.5);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _649 = _645 || _647;
    float _651 = fma(_621, _621, _639);
    float _653 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _637);
    float _655 = _535 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _657 = sqrt(_651);
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _661 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _655);
    float _663 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _661);
    float _665 = 1.0 / _659;
    float _667 = _663 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _669 = _657 > 0.0;
    float _671 = _667 + _659;
    float _673 = _671 * _665;
    float _675 = _673 * 0.5;
    bool _677 = !_669;
    float _679 = _607;
    float _681 = _605;
    float _683 = _609;
    float _685 = _659;
    if (!_677)
    {
        float _687 = _245 * _245;
        float _689 = rsqrt(_651);
        float _691 = fma(_197, _197, _687);
        float _693 = fma(_199, _199, _691);
        float _695 = sqrt(_693);
        float _697 = _617 * _689;
        float _699 = _613 * _689;
        float _701 = _621 * _689;
        bool _703 = _695 > 0.0;
        bool _705 = !_703;
        _685 = _689;
        _553 = _699;
        if (!_705)
        {
            float _707 = rsqrt(_693);
            float _709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _711 = _245 * _707;
            float _713 = _197 * _707;
            float _715 = _699 * _711;
            float _717 = _199 * _707;
            float _719 = fma(_697, _713, _715);
            float _721 = _709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _723 = fma(_701, _717, _719);
            float _725 = _723 * _721;
            float _727 = fma(_197, _725, _607);
            float _729 = fma(_245, _725, _605);
            float _731 = fma(_199, _725, _609);
            _679 = _727;
            _681 = _729;
            _683 = _731;
            _685 = _725;
        }
    }
    float _733 = _679;
    float _735 = _681;
    float _737 = _683;
    float _739 = _685;
    float _741 = _553;
    float _743 = _739;
    float _745 = _733;
    float _747 = _735;
    float _749 = _741;
    if (_649)
    {
        _743 = 1.0;
    }
    float _751 = _743;
    float _753 = _751;
    if (_635)
    {
        _253 = _733;
    }
    float _755 = _253;
    float _757 = _755;
    if (_635)
    {
        _255 = _735;
    }
    float _759 = _255;
    float _761 = _759;
    if (_635)
    {
        _257 = _737;
    }
    float _763 = _257;
    float _765 = _763;
    if (!_635)
    {
        float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _769 = _535 + _767;
        float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _773 = _505 + _771;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _777 = -_501;
        float _779 = _777 + _737;
        float _781 = _769 * _769;
        float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _785 = _501 + _783;
        float _787 = fma(_773, _773, _781);
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _791 = fma(_785, _785, _787);
        float _793 = sqrt(_791);
        float _795 = _775 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _797 = precise::min(_793, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _799 = _797 * _789;
        float _801 = -_505;
        float _803 = _801 + _733;
        float _805 = _795 * _799;
        float _807 = -_535;
        float _809 = _807 + _735;
        float _811 = fma(_803, _805, _505);
        float _813 = fma(_809, _805, _535);
        float _815 = fma(_779, _805, _501);
        _761 = _813;
        _757 = _811;
        _765 = _815;
    }
    float _817 = _761;
    float _819 = _757;
    float _821 = _765;
    if (!_649)
    {
        float _823 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _825 = _823 * 0.15915493667125701904296875;
        float _827 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _831 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _829);
        float _833 = _825 * 6.283185482025146484375;
        float _835 = cos(_833);
        float _837 = _827 * 0.15915493667125701904296875;
        float _839 = _825 * 6.283185482025146484375;
        float _841 = sin(_839);
        float _843 = 1.0 / _835;
        float _845 = _837 * 6.283185482025146484375;
        float _847 = cos(_845);
        float _849 = _841 * _843;
        float _851 = _837 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _855;
        float _859 = _847 * _849;
        float _861 = 1.0 / _831;
        float _863 = 1.0 / _859;
        float _865 = 1.0 / _857;
        float _867 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _869 = _861 * _867;
        float _871 = _853 * _863;
        float _873 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _875 = fma(_871, _869, _873);
        float _877 = _875 * _865;
        float _879 = precise::clamp(_877, 0.0, 1.0);
        _745 = _865;
        _747 = _837;
        _753 = _879;
    }
    float _881 = _745;
    float _883 = _747;
    float _885 = _753;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _889 = _817 + _887;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _893 = _819 + _891;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _897 = _821 + _895;
    float _899 = _889 * _889;
    float _901 = fma(_893, _893, _899);
    float _903 = fma(_897, _897, _901);
    float _905 = rsqrt(_903);
    float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _909 = _893 * _907;
    float _911 = _897 * _907;
    float _913 = _909 * _909;
    float _915 = _911 * _911;
    float _917 = _913 + _915;
    float _919 = sqrt(_917);
    bool _921 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _925 = _919 + _923;
    float _927 = _905;
    float _929 = _917;
    float _931 = _925;
    float _933 = _881;
    float _935 = _889;
    float _937 = _883;
    if (_921)
    {
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _939;
    }
    float _941 = _927;
    if (_921)
    {
        float _943 = rsqrt(_917);
        _929 = _943;
    }
    float _945 = _929;
    float _947 = _945;
    if (_921)
    {
        float _949 = _925 * _941;
        _931 = _949;
    }
    float _951 = _931;
    if (_921)
    {
        float _953 = _951 * 0.15915493667125701904296875;
        _933 = _953;
    }
    float _955 = _933;
    float _957 = _897;
    if (_921)
    {
        float _959 = _955 * 6.283185482025146484375;
        float _961 = sin(_959);
        _957 = _961;
    }
    float _963 = _957;
    float _965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _967 = precise::max(0.0, _965);
    float _969 = _941;
    float _971 = _967;
    if (_921)
    {
        float _973 = _955 * 6.283185482025146484375;
        float _975 = cos(_973);
        _969 = _975;
    }
    float _977 = _969;
    float _979 = -_907;
    float _981 = -_967;
    float _983 = fma(_889, _979, _981);
    if (_921)
    {
        float _985 = _983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _985;
    }
    float _987 = _935;
    float _989 = sqrt(_903);
    float _991 = _987;
    float _993 = _963;
    if (_921)
    {
        float _995 = fma(_963, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _997;
    if (!_921)
    {
        _993 = _909;
    }
    float _1001 = _993;
    float _1003 = _1001;
    float _1005 = _977;
    if (_921)
    {
        float _1007 = _977 + (-1.0);
        _971 = _1007;
    }
    float _1009 = _971;
    float _1011 = _1009;
    if (_921)
    {
        float _1013 = _945 * _997;
        _749 = _1013;
    }
    float _1015 = _749;
    if (!_921)
    {
        _999 = _983;
    }
    float _1017 = _999;
    float _1019 = _1017;
    if (_921)
    {
        float _1021 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _1021;
    }
    float _1023 = _937;
    if (_921)
    {
        float _1025 = _909 * _1015;
        _1003 = _1025;
    }
    float _1027 = _1003;
    if (!_921)
    {
        _1011 = _911;
    }
    float _1029 = _1011;
    float _1031 = _1029;
    if (_921)
    {
        float _1033 = _911 * _1015;
        _1031 = _1033;
    }
    float _1035 = _1031;
    if (!_921)
    {
        _947 = _913;
    }
    float _1037 = _947;
    float _1039 = _1037;
    if (_921)
    {
        float _1041 = fma(_983, _977, _1023);
        _1019 = _1041;
    }
    float _1043 = _1019;
    if (_921)
    {
        float _1045 = _1027 * _1027;
        _1039 = _1045;
    }
    float _1047 = _1039;
    if (!_921)
    {
        _1005 = _915;
    }
    float _1049 = _1005;
    float _1051 = _1049;
    if (_921)
    {
        float _1053 = _1035 * _1035;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_1043, _1043, _1047);
    float _1059 = _1057 + _1055;
    float _1061 = _817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1065 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1063);
    float _1067 = precise::clamp(_1065, 0.0, 1.0);
    float _1069 = _817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = rsqrt(_1059);
    float _1073 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = -_1067;
    float _1077 = _1075 + 1.0;
    float _1079 = _817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1083 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1085 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1087 = _817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1089 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1093 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1095 = abs(_1077);
    float _1097 = log2(_1095);
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1087);
    float _1103 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1093);
    float _1105 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1107 = _1071 * _1027;
    float _1109 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1101);
    float _1111 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1113 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1119 = -_1105;
    float _1121 = fma(_1119, _1085, 1.0);
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1113);
    float _1125 = _1071 * _1043;
    float _1127 = _1071 * _1035;
    float _1129 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1131 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1133 = -_1115;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1133);
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1123);
    float _1139 = log2(_1121);
    float _1141 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = -_1127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1135);
    float _1147 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1137);
    float _1149 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1129);
    float _1151 = fma(_1145, -0.5, 0.5);
    float _1153 = fma(_1145, 0.5, 0.5);
    float _1155 = exp2(_1131);
    float _1157 = _1125 + 1.0;
    float _1159 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1161 = 1.0 / _1147;
    float _1163 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1165 = fma(_1153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1167 = _1139 * 0.693147182464599609375;
    float _1169 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1163);
    float _1171 = fma(_1153, _1165, -0.212114393711090087890625);
    float _1173 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1175 = sqrt(_1151);
    float _1177 = -_1125;
    float _1179 = fma(_1155, _1157, _1177);
    float _1181 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1159);
    float _1183 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1169);
    float _1185 = fma(_1153, _1171, 1.570728778839111328125);
    float _1187 = fma(_1179, 0.5, 0.5);
    float _1189 = _1181 * _1161;
    float _1191 = _1183 * _1161;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1175 * 0.636619746685028076171875;
    float3 _3236 = float3(_1193, _1195, _1173);
    float _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).x;
    float3 _3247 = float3(_1193, _1195, _1173);
    float4 _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).xyzw;
    float _1204 = _1202.x;
    float _1206 = _1202.y;
    float _1208 = _1202.z;
    float _1210 = _1202.w;
    float _1212 = -_1185;
    float _1214 = fma(_1197, _1212, 1.0);
    float2 _3269 = float2(_1214, _1187);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3269, float2(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3269, float2(0.0), isnan(_3269)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_49.y;
    bool _1228 = _137 > 0.5;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1232 = _429 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1234;
    float _1238 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1240 = -_461;
    int _1242 = _1228 ? as_type<int>(_1240) : as_type<int>(_461);
    float _1244 = 1.0 / _1236;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    bool _1256 = !_1248;
    float _1258 = _1256 ? _461 : as_type<float>(_1242);
    float _1260 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1250);
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1264 = _885 > 0.0;
    bool _1266 = isnan(_885);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan(0.0);
    bool _1272 = _1268 || _1270;
    float _1274 = _1258 + 0.5;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1278 = _1232 * _1244;
    bool _1280 = _1226 > 0.5;
    bool _1282 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1284 = isnan(_429);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1294;
    bool _1298 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1300 = isnan(_429);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1310;
    float _1314 = -_455;
    int _1316 = _1280 ? as_type<int>(_1314) : as_type<int>(_455);
    float _1318 = -_1292;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1296, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1324;
    bool _1328 = !_1254;
    float _1330 = _1328 ? _455 : as_type<float>(_1316);
    float _1332 = _1308 * _1320;
    float _1334 = -_1308;
    float _1336 = _1334 + 1.0;
    float _1338 = fma(_1312, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1340 = fma(_1326, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1342 = _1322 * _1332;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1346 = _1338 * _1332;
    float _1348 = _1340 * _1332;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1342);
    float _1352 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1348);
    float _1358 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1360 = exp2(_1352);
    float _1362 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1350);
    float _1364 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1354);
    float _1366 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1356);
    float _1368 = _249 * _1358;
    float _1370 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1260);
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1376 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1378 = _1370 + _1147;
    float _1380 = -_1330;
    float _1382 = _1380 + 0.5;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = -_1360;
    float _1392 = _1390 + 1.0;
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1378 * 0.5;
    float _1398 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1181;
    out.gl_Position.y = _1183;
    out.gl_Position.z = _1370;
    out.gl_Position.w = _1147;
    float _1402 = _1276 * _1262;
    float _1404 = _1398 * _1344;
    float _1406 = -_1400;
    float _1408 = _1406 + 1.0;
    out.m_58.x = _1386;
    out.m_58.y = _1388;
    out.m_58.z = _1394;
    out.m_58.w = _1384;
    float _1410 = _1368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1402;
    out.m_60.y = _1404;
    out.m_62.z = _1396;
    out.m_62.w = _1147;
    out.m_45.x = _1410;
    float _1412 = _1400 * _1199;
    float _1414 = _1210 * _1408;
    float _1416 = _1210 * _1412;
    float _1418 = _1224 * _1412;
    float _1420 = fma(_1220, _1416, _1204);
    float _1422 = fma(_1222, _1416, _1206);
    float _1424 = fma(_1210, _1418, _1208);
    out.m_64.x = _1420;
    out.m_64.y = _1422;
    out.m_64.z = _1424;
    out.m_64.w = _1414;
    if (_1272)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1426 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1426;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _421 = false;
    bool _275 = false;
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
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1482 = as_type<float>(_99);
        out.gl_Position.z = _1482;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_135);
        out.gl_Position.z = _1551;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.x;
    float _145 = in.m_51.y;
    float _147 = in.m_51.z;
    float _149 = _141 * _139;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _157 = _155 * 6.283185482025146484375;
    float _159 = floor(_155);
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _163 = _161 != 0;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _167 = _165 != 0;
    float _169 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _157 * 0.15915493667125701904296875;
    float _173 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _177 = !_163;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    int _189 = abs(_179);
    float _191 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    bool _193 = !_153;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _201 = -_159;
    float _203 = _155 + _201;
    bool _205 = !_167;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _215 = float(_189);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_187, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _215 * _223;
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_235, _233, _225);
    float _245 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _247 = abs(_239);
    float _249 = fma(_241, _247, _243);
    bool _251 = !_217;
    float _253 = _245;
    float _255 = _199;
    float _257 = _197;
    float _273;
    if (!_251)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_83);
        float _279 = 1.0 / _277;
        float _281 = _115 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = _283 + _285;
    bool _289 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_283);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    bool _301 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_283);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = 1.0 / _315;
    bool _327 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_283);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _311 * _323;
    float _341 = -_311;
    float _343 = _341 + 1.0;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = _337 * _343;
    float _349 = 1.0 / _319;
    float _351 = -_337;
    float _353 = _351 + 1.0;
    float _355 = _287 * _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _359 = _283 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = fma(_363, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = fma(_367, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = _359 * _349;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _369 * _347;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _371 * _347;
    float _387 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _391 = fma(_383, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _395 = fma(_387, _339, _389);
    float _397 = fma(_391, _339, _393);
    float _399 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    float _401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _403 = !_345;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_83);
        float _425 = 1.0 / _423;
        float _427 = _115 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = as_type<float>(int(gl_VertexIndex));
    float _433 = in.m_56.x;
    float _435 = in.m_56.y;
    float _437 = in.m_42.x;
    float _439 = in.m_42.y;
    float _441 = in.m_42.z;
    int _443 = as_type<int>(_431) & 1;
    bool _445 = _443 != 0;
    int _447 = as_type<int>(_431) & 2;
    bool _449 = _447 != 0;
    float _451 = _401 * _435;
    bool _453 = !_449;
    float _455 = _453 ? (-0.5) : 0.5;
    float _457 = _399 * _433;
    bool _459 = !_445;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _455);
    float _467 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _461);
    float _471 = _463 * _465;
    float _473 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _475 = _467 * _469;
    float _477 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _479 = _471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _481 = _471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _483 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _485 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _479);
    float _489 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _477);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].x, _481);
    float _493 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].z, _487);
    float _497 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _489);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _501 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _509 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _501 + _503;
    float _513 = _471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _515 = _505 + _507;
    float _517 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _521 = _511 + _519;
    float _523 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].x, _513);
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _527 = _515 + _525;
    float _529 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
    float _531 = _521 * _521;
    float _533 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].z, _523);
    float _535 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _537 = fma(_527, _527, _531);
    float _539 = _533 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _541 = sqrt(_537);
    float _543 = _535 + _539;
    bool _545 = _541 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _547 = _483;
    float _549 = _441;
    float _551 = _539;
    float _553 = _537;
    if (!_545)
    {
        _547 = _515;
    }
    float _555 = _547;
    float _557 = _555;
    if (!_545)
    {
        _549 = _511;
    }
    float _559 = _549;
    float _561 = _559;
    if (!_545)
    {
        _551 = _543;
    }
    float _563 = _551;
    bool _565 = !_545;
    float _567 = _563;
    if (!_565)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _573 = _541 + _571;
        float _575 = rsqrt(_537);
        float _577 = _573 * _569;
        float _579 = _543 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = _577 * 0.15915493667125701904296875;
        float _583 = _581 * 6.283185482025146484375;
        float _585 = cos(_583);
        float _587 = _581 * 6.283185482025146484375;
        float _589 = sin(_587);
        float _591 = _585 + (-1.0);
        float _593 = fma(_589, _579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _595 = _591 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _597 = _575 * _593;
        float _599 = fma(_543, _585, _595);
        float _601 = fma(_527, _597, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _603 = fma(_521, _597, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _567 = _599;
        _557 = _601;
        _561 = _603;
    }
    float _605 = _567;
    float _607 = _557;
    float _609 = _561;
    float _611 = -_535;
    float _613 = _611 + _605;
    float _615 = -_505;
    float _617 = _615 + _607;
    float _619 = -_501;
    float _621 = _619 + _609;
    float _623 = _535 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _625 = _613 * _613;
    bool _627 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _629 = isnan(0.5);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _635 = _631 || _633;
    float _637 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _623);
    float _639 = fma(_617, _617, _625);
    bool _641 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _643 = isnan(0.5);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _649 = _645 || _647;
    float _651 = fma(_621, _621, _639);
    float _653 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[11].z, _637);
    float _655 = _535 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _657 = sqrt(_651);
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _661 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _655);
    float _663 = fma(_501, (*spvDescriptorSet0.vp_c8)._m0[10].z, _661);
    float _665 = 1.0 / _659;
    float _667 = _663 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _669 = _657 > 0.0;
    float _671 = _667 + _659;
    float _673 = _671 * _665;
    float _675 = _673 * 0.5;
    bool _677 = !_669;
    float _679 = _607;
    float _681 = _605;
    float _683 = _609;
    float _685 = _659;
    if (!_677)
    {
        float _687 = _245 * _245;
        float _689 = rsqrt(_651);
        float _691 = fma(_197, _197, _687);
        float _693 = fma(_199, _199, _691);
        float _695 = sqrt(_693);
        float _697 = _617 * _689;
        float _699 = _613 * _689;
        float _701 = _621 * _689;
        bool _703 = _695 > 0.0;
        bool _705 = !_703;
        _685 = _689;
        _553 = _699;
        if (!_705)
        {
            float _707 = rsqrt(_693);
            float _709 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _711 = _245 * _707;
            float _713 = _197 * _707;
            float _715 = _699 * _711;
            float _717 = _199 * _707;
            float _719 = fma(_697, _713, _715);
            float _721 = _709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _723 = fma(_701, _717, _719);
            float _725 = _723 * _721;
            float _727 = fma(_197, _725, _607);
            float _729 = fma(_245, _725, _605);
            float _731 = fma(_199, _725, _609);
            _679 = _727;
            _681 = _729;
            _683 = _731;
            _685 = _725;
        }
    }
    float _733 = _679;
    float _735 = _681;
    float _737 = _683;
    float _739 = _685;
    float _741 = _553;
    float _743 = _739;
    float _745 = _733;
    float _747 = _735;
    float _749 = _741;
    if (_649)
    {
        _743 = 1.0;
    }
    float _751 = _743;
    float _753 = _751;
    if (_635)
    {
        _253 = _733;
    }
    float _755 = _253;
    float _757 = _755;
    if (_635)
    {
        _255 = _735;
    }
    float _759 = _255;
    float _761 = _759;
    if (_635)
    {
        _257 = _737;
    }
    float _763 = _257;
    float _765 = _763;
    if (!_635)
    {
        float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _769 = _535 + _767;
        float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _773 = _505 + _771;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _777 = -_501;
        float _779 = _777 + _737;
        float _781 = _769 * _769;
        float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _785 = _501 + _783;
        float _787 = fma(_773, _773, _781);
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _791 = fma(_785, _785, _787);
        float _793 = sqrt(_791);
        float _795 = _775 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _797 = precise::min(_793, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _799 = _797 * _789;
        float _801 = -_505;
        float _803 = _801 + _733;
        float _805 = _795 * _799;
        float _807 = -_535;
        float _809 = _807 + _735;
        float _811 = fma(_803, _805, _505);
        float _813 = fma(_809, _805, _535);
        float _815 = fma(_779, _805, _501);
        _761 = _813;
        _757 = _811;
        _765 = _815;
    }
    float _817 = _761;
    float _819 = _757;
    float _821 = _765;
    if (!_649)
    {
        float _823 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _825 = _823 * 0.15915493667125701904296875;
        float _827 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _831 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _829);
        float _833 = _825 * 6.283185482025146484375;
        float _835 = cos(_833);
        float _837 = _827 * 0.15915493667125701904296875;
        float _839 = _825 * 6.283185482025146484375;
        float _841 = sin(_839);
        float _843 = 1.0 / _835;
        float _845 = _837 * 6.283185482025146484375;
        float _847 = cos(_845);
        float _849 = _841 * _843;
        float _851 = _837 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _857 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _855;
        float _859 = _847 * _849;
        float _861 = 1.0 / _831;
        float _863 = 1.0 / _859;
        float _865 = 1.0 / _857;
        float _867 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _869 = _861 * _867;
        float _871 = _853 * _863;
        float _873 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _875 = fma(_871, _869, _873);
        float _877 = _875 * _865;
        float _879 = precise::clamp(_877, 0.0, 1.0);
        _745 = _865;
        _747 = _837;
        _753 = _879;
    }
    float _881 = _745;
    float _883 = _747;
    float _885 = _753;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _889 = _817 + _887;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _893 = _819 + _891;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _897 = _821 + _895;
    float _899 = _889 * _889;
    float _901 = fma(_893, _893, _899);
    float _903 = fma(_897, _897, _901);
    float _905 = rsqrt(_903);
    float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _909 = _893 * _907;
    float _911 = _897 * _907;
    float _913 = _909 * _909;
    float _915 = _911 * _911;
    float _917 = _913 + _915;
    float _919 = sqrt(_917);
    bool _921 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _925 = _919 + _923;
    float _927 = _905;
    float _929 = _917;
    float _931 = _925;
    float _933 = _881;
    float _935 = _889;
    float _937 = _883;
    if (_921)
    {
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _939;
    }
    float _941 = _927;
    if (_921)
    {
        float _943 = rsqrt(_917);
        _929 = _943;
    }
    float _945 = _929;
    float _947 = _945;
    if (_921)
    {
        float _949 = _925 * _941;
        _931 = _949;
    }
    float _951 = _931;
    if (_921)
    {
        float _953 = _951 * 0.15915493667125701904296875;
        _933 = _953;
    }
    float _955 = _933;
    float _957 = _897;
    if (_921)
    {
        float _959 = _955 * 6.283185482025146484375;
        float _961 = sin(_959);
        _957 = _961;
    }
    float _963 = _957;
    float _965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _967 = precise::max(0.0, _965);
    float _969 = _941;
    float _971 = _967;
    if (_921)
    {
        float _973 = _955 * 6.283185482025146484375;
        float _975 = cos(_973);
        _969 = _975;
    }
    float _977 = _969;
    float _979 = -_907;
    float _981 = -_967;
    float _983 = fma(_889, _979, _981);
    if (_921)
    {
        float _985 = _983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _985;
    }
    float _987 = _935;
    float _989 = sqrt(_903);
    float _991 = _987;
    float _993 = _963;
    if (_921)
    {
        float _995 = fma(_963, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _997;
    if (!_921)
    {
        _993 = _909;
    }
    float _1001 = _993;
    float _1003 = _1001;
    float _1005 = _977;
    if (_921)
    {
        float _1007 = _977 + (-1.0);
        _971 = _1007;
    }
    float _1009 = _971;
    float _1011 = _1009;
    if (_921)
    {
        float _1013 = _945 * _997;
        _749 = _1013;
    }
    float _1015 = _749;
    if (!_921)
    {
        _999 = _983;
    }
    float _1017 = _999;
    float _1019 = _1017;
    if (_921)
    {
        float _1021 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _1021;
    }
    float _1023 = _937;
    if (_921)
    {
        float _1025 = _909 * _1015;
        _1003 = _1025;
    }
    float _1027 = _1003;
    if (!_921)
    {
        _1011 = _911;
    }
    float _1029 = _1011;
    float _1031 = _1029;
    if (_921)
    {
        float _1033 = _911 * _1015;
        _1031 = _1033;
    }
    float _1035 = _1031;
    if (!_921)
    {
        _947 = _913;
    }
    float _1037 = _947;
    float _1039 = _1037;
    if (_921)
    {
        float _1041 = fma(_983, _977, _1023);
        _1019 = _1041;
    }
    float _1043 = _1019;
    if (_921)
    {
        float _1045 = _1027 * _1027;
        _1039 = _1045;
    }
    float _1047 = _1039;
    if (!_921)
    {
        _1005 = _915;
    }
    float _1049 = _1005;
    float _1051 = _1049;
    if (_921)
    {
        float _1053 = _1035 * _1035;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_1043, _1043, _1047);
    float _1059 = _1057 + _1055;
    float _1061 = _817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1065 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1063);
    float _1067 = precise::clamp(_1065, 0.0, 1.0);
    float _1069 = _817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = rsqrt(_1059);
    float _1073 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1061);
    float _1075 = -_1067;
    float _1077 = _1075 + 1.0;
    float _1079 = _817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1081 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1083 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1073);
    float _1085 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1087 = _817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1089 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1093 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1079);
    float _1095 = abs(_1077);
    float _1097 = log2(_1095);
    float _1099 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1101 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1087);
    float _1103 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1093);
    float _1105 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1107 = _1071 * _1027;
    float _1109 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1101);
    float _1111 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1113 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1119 = -_1105;
    float _1121 = fma(_1119, _1085, 1.0);
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1113);
    float _1125 = _1071 * _1043;
    float _1127 = _1071 * _1035;
    float _1129 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1131 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1133 = -_1115;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1133);
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1123);
    float _1139 = log2(_1121);
    float _1141 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = -_1127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1135);
    float _1147 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1137);
    float _1149 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1129);
    float _1151 = fma(_1145, -0.5, 0.5);
    float _1153 = fma(_1145, 0.5, 0.5);
    float _1155 = exp2(_1131);
    float _1157 = _1125 + 1.0;
    float _1159 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1161 = 1.0 / _1147;
    float _1163 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1165 = fma(_1153, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1167 = _1139 * 0.693147182464599609375;
    float _1169 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1163);
    float _1171 = fma(_1153, _1165, -0.212114393711090087890625);
    float _1173 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1175 = sqrt(_1151);
    float _1177 = -_1125;
    float _1179 = fma(_1155, _1157, _1177);
    float _1181 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1159);
    float _1183 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1169);
    float _1185 = fma(_1153, _1171, 1.570728778839111328125);
    float _1187 = fma(_1179, 0.5, 0.5);
    float _1189 = _1181 * _1161;
    float _1191 = _1183 * _1161;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1175 * 0.636619746685028076171875;
    float3 _3236 = float3(_1193, _1195, _1173);
    float _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).x;
    float3 _3247 = float3(_1193, _1195, _1173);
    float4 _1202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).xyzw;
    float _1204 = _1202.x;
    float _1206 = _1202.y;
    float _1208 = _1202.z;
    float _1210 = _1202.w;
    float _1212 = -_1185;
    float _1214 = fma(_1197, _1212, 1.0);
    float2 _3269 = float2(_1214, _1187);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3269, float2(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3269, float2(0.0), isnan(_3269)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_49.y;
    bool _1228 = _137 > 0.5;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1232 = _429 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1234;
    float _1238 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1240 = -_461;
    int _1242 = _1228 ? as_type<int>(_1240) : as_type<int>(_461);
    float _1244 = 1.0 / _1236;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1248 = _1246 != 0;
    float _1250 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1238);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    bool _1256 = !_1248;
    float _1258 = _1256 ? _461 : as_type<float>(_1242);
    float _1260 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1250);
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1264 = _885 > 0.0;
    bool _1266 = isnan(_885);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan(0.0);
    bool _1272 = _1268 || _1270;
    float _1274 = _1258 + 0.5;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1278 = _1232 * _1244;
    bool _1280 = _1226 > 0.5;
    bool _1282 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1284 = isnan(_429);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1294;
    bool _1298 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1300 = isnan(_429);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1310;
    float _1314 = -_455;
    int _1316 = _1280 ? as_type<int>(_1314) : as_type<int>(_455);
    float _1318 = -_1292;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1296, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1324;
    bool _1328 = !_1254;
    float _1330 = _1328 ? _455 : as_type<float>(_1316);
    float _1332 = _1308 * _1320;
    float _1334 = -_1308;
    float _1336 = _1334 + 1.0;
    float _1338 = fma(_1312, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1340 = fma(_1326, _1278, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1342 = _1322 * _1332;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1346 = _1338 * _1332;
    float _1348 = _1340 * _1332;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1342);
    float _1352 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1348);
    float _1358 = _885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1360 = exp2(_1352);
    float _1362 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1350);
    float _1364 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1354);
    float _1366 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1356);
    float _1368 = _249 * _1358;
    float _1370 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1260);
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1376 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1378 = _1370 + _1147;
    float _1380 = -_1330;
    float _1382 = _1380 + 0.5;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = -_1360;
    float _1392 = _1390 + 1.0;
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1378 * 0.5;
    float _1398 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1181;
    out.gl_Position.y = _1183;
    out.gl_Position.z = _1370;
    out.gl_Position.w = _1147;
    float _1402 = _1276 * _1262;
    float _1404 = _1398 * _1344;
    float _1406 = -_1400;
    float _1408 = _1406 + 1.0;
    out.m_58.x = _1386;
    out.m_58.y = _1388;
    out.m_58.z = _1394;
    out.m_58.w = _1384;
    float _1410 = _1368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1402;
    out.m_60.y = _1404;
    out.m_62.z = _1396;
    out.m_62.w = _1147;
    out.m_45.x = _1410;
    float _1412 = _1400 * _1199;
    float _1414 = _1210 * _1408;
    float _1416 = _1210 * _1412;
    float _1418 = _1224 * _1412;
    float _1420 = fma(_1220, _1416, _1204);
    float _1422 = fma(_1222, _1416, _1206);
    float _1424 = fma(_1210, _1418, _1208);
    out.m_64.x = _1420;
    out.m_64.y = _1422;
    out.m_64.z = _1424;
    out.m_64.w = _1414;
    if (_1272)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1426 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1426;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

