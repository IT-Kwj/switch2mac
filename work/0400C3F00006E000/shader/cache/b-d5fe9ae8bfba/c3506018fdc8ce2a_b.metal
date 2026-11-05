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
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1161 = as_type<float>(_99);
        out.gl_Position.z = _1161;
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
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _91 = _121;
    }
    float _123 = _91;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1230 = as_type<float>(_137);
        out.gl_Position.z = _1230;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = _147;
    if (!_157)
    {
        float _163 = _147 * _147;
        float _165 = _163 * 0.5;
        _119 = _165;
    }
    float _167 = _119;
    float _169 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _171 = _167;
    if (!_157)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = floor(_169);
    float _179 = _169 * 6.283185482025146484375;
    bool _181 = !_157;
    float _183 = _175;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _147 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _147);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_157;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _147 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _161 = _237;
    }
    float _239 = _161;
    float _241 = _179 * 0.15915493667125701904296875;
    float _243 = -_177;
    float _245 = _169 + _243;
    int _247 = as_type<int>(_145) & 1;
    bool _249 = _247 != 0;
    int _251 = as_type<int>(_145) & 2;
    bool _253 = _251 != 0;
    float _255 = in.m_47.x;
    float _257 = in.m_47.y;
    float _259 = in.m_47.z;
    float _261 = _241 * 6.283185482025146484375;
    float _263 = cos(_261);
    float _265 = in.m_54.x;
    int _267 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _269 = _267 != 0;
    bool _271 = !_253;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = in.m_54.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _283 = _281 != 0;
    bool _285 = !_269;
    int _287 = _285 ? 0 : 1;
    float _289 = in.m_54.y;
    bool _291 = !_279;
    int _293 = _291 ? 0 : 1;
    int _295 = abs(_287);
    float _297 = fma(_263, 0.5, 0.5);
    int _299 = abs(_293);
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    bool _307 = _245 < 0.5;
    float _309 = float(_307);
    float _311 = -_245;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_283;
    int _317 = _315 ? 0 : 1;
    float _319 = float(_299);
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_317);
    float _327 = -_297;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = float(_295);
    float _333 = abs(_313);
    float _335 = _319 * _333;
    float _337 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_325);
    float _345 = fma(_331, _329, _335);
    float _347 = fma(_239, _255, _337);
    float _349 = fma(_239, _257, _339);
    float _351 = fma(_239, _259, _341);
    float _353 = abs(_323);
    float _355 = fma(_343, _353, _345);
    float _357 = _265 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _359 = !_249;
    float _361 = _359 ? (-0.5) : 0.5;
    float _363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _365 = fma(_347, _275, _301);
    float _367 = _355 * _357;
    float _369 = _289 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _361);
    float _373 = fma(_349, _275, _303);
    float _375 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _377 = _355 * _369;
    float _379 = fma(_351, _275, _305);
    float _381 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = _375 * _371;
    float _385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _387 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _393 = _385 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _395 = _387 * _363;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _399 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _389);
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _393);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[8].x, _397);
    float _407 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _409 = _401 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _411 = -_395;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[10].z, _403);
    float _415 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _419 = -_395;
    float _421 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[8].z, _405);
    float _423 = _409 + _413;
    float _425 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _427 = _385 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _429 = _417 + _421;
    float _431 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _433 = _423 + _431;
    float _435 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _425);
    bool _437 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _439 = isnan(0.5);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _449 = _429 + _447;
    float _451 = _433 * _433;
    float _453 = _435 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[9].x, _427);
    float _457 = fma(_449, _449, _451);
    float _459 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _461 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _463 = -_395;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[9].z, _455);
    float _467 = sqrt(_457);
    float _469 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[11].x, _459);
    float _471 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[10].x, _461);
    float _473 = _453 + _465;
    float _475 = _335;
    float _477 = _423;
    float _479 = _429;
    if (_445)
    {
        _475 = 1.0;
    }
    float _481 = _475;
    float _483 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[11].z, _469);
    float _485 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[10].z, _471);
    float _487 = _483 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _489 = _485 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _491 = 1.0 / _487;
    float _493 = _489 + _487;
    bool _495 = _467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _497 = _493 * _491;
    float _499 = _497 * 0.5;
    float _501 = _487;
    float _503 = _493;
    float _505 = _491;
    float _507 = _481;
    float _509 = _499;
    if (!_495)
    {
        _501 = _429;
    }
    float _511 = _501;
    float _513 = _511;
    if (!_495)
    {
        _503 = _423;
    }
    float _515 = _503;
    float _517 = _515;
    if (!_495)
    {
        _505 = _473;
    }
    float _519 = _505;
    bool _521 = !_495;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _467 + _527;
        float _531 = rsqrt(_457);
        float _533 = _529 * _525;
        float _535 = _473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _537 = _533 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = sin(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = fma(_541, _535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _549 = _531 * _547;
        float _551 = _545 + (-1.0);
        float _553 = fma(_449, _549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _555 = fma(_433, _549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _557 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _559 = fma(_473, _545, _557);
        _523 = _559;
        _513 = _553;
        _517 = _555;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    if (!_445)
    {
        float _567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _569 = _567 * 0.15915493667125701904296875;
        float _571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _573 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _575 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[30].w, _573);
        float _577 = _569 * 6.283185482025146484375;
        float _579 = cos(_577);
        float _581 = _571 * 0.15915493667125701904296875;
        float _583 = _569 * 6.283185482025146484375;
        float _585 = sin(_583);
        float _587 = 1.0 / _579;
        float _589 = _581 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _585 * _587;
        float _595 = _581 * 6.283185482025146484375;
        float _597 = sin(_595);
        float _599 = _591 * _593;
        float _601 = 1.0 / _575;
        float _603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _605 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _603;
        float _607 = 1.0 / _599;
        float _609 = 1.0 / _605;
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _613 = _601 * _611;
        float _615 = _597 * _607;
        float _617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _619 = fma(_615, _613, _617);
        float _621 = _619 * _609;
        float _623 = precise::clamp(_621, 0.0, 1.0);
        _477 = _581;
        _479 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _507 = _623;
    }
    float _625 = _477;
    float _627 = _479;
    float _629 = _507;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _633 = _561 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _637 = _563 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _641 = _565 + _639;
    float _643 = _633 * _633;
    float _645 = fma(_637, _637, _643);
    float _647 = fma(_641, _641, _645);
    float _649 = rsqrt(_647);
    float _651 = _649 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _653 = _637 * _651;
    float _655 = _641 * _651;
    float _657 = _653 * _653;
    float _659 = _655 * _655;
    float _661 = _657 + _659;
    float _663 = sqrt(_661);
    bool _665 = _663 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _667 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _669 = _663 + _667;
    float _671 = _641;
    float _673 = _627;
    float _675 = _669;
    float _677 = _625;
    float _679 = _633;
    float _681 = _653;
    if (_665)
    {
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _671 = _683;
    }
    float _685 = _671;
    if (_665)
    {
        float _687 = rsqrt(_661);
        _673 = _687;
    }
    float _689 = _673;
    float _691 = _689;
    if (_665)
    {
        float _693 = _669 * _685;
        _675 = _693;
    }
    float _695 = _675;
    if (_665)
    {
        float _697 = _695 * 0.15915493667125701904296875;
        _677 = _697;
    }
    float _699 = _677;
    float _701 = _685;
    if (_665)
    {
        float _703 = _699 * 6.283185482025146484375;
        float _705 = sin(_703);
        _701 = _705;
    }
    float _707 = _701;
    float _709 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _711 = precise::max(0.0, _709);
    float _713 = _643;
    float _715 = _711;
    if (_665)
    {
        float _717 = _699 * 6.283185482025146484375;
        float _719 = cos(_717);
        _713 = _719;
    }
    float _721 = _713;
    float _723 = -_651;
    float _725 = -_711;
    float _727 = fma(_633, _723, _725);
    if (!_665)
    {
        _679 = _655;
    }
    float _729 = _679;
    float _731 = _729;
    if (_665)
    {
        float _733 = _727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _715 = _733;
    }
    float _735 = _715;
    float _737 = sqrt(_647);
    float _739 = _707;
    float _741 = _735;
    if (_665)
    {
        float _743 = fma(_707, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _739 = _743;
    }
    float _745 = _739;
    float _747 = _745;
    float _749 = _721;
    if (_665)
    {
        float _751 = _721 + (-1.0);
        _741 = _751;
    }
    float _753 = _741;
    float _755 = _753;
    if (_665)
    {
        float _757 = _689 * _745;
        _509 = _757;
    }
    float _759 = _509;
    if (!_665)
    {
        _747 = _727;
    }
    float _761 = _747;
    float _763 = _761;
    if (_665)
    {
        float _765 = _753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _691 = _765;
    }
    float _767 = _691;
    if (_665)
    {
        float _769 = _653 * _759;
        _681 = _769;
    }
    float _771 = _681;
    if (!_665)
    {
        _755 = _657;
    }
    float _773 = _755;
    float _775 = _773;
    if (_665)
    {
        float _777 = _655 * _759;
        _731 = _777;
    }
    float _779 = _731;
    if (_665)
    {
        float _781 = fma(_727, _721, _767);
        _763 = _781;
    }
    float _783 = _763;
    if (_665)
    {
        float _785 = _771 * _771;
        _775 = _785;
    }
    float _787 = _775;
    if (!_665)
    {
        _749 = _659;
    }
    float _789 = _749;
    float _791 = _789;
    if (_665)
    {
        float _793 = _779 * _779;
        _791 = _793;
    }
    float _795 = _791;
    float _797 = fma(_783, _783, _787);
    float _799 = _797 + _795;
    float _801 = _561 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _805 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[23].w, _803);
    float _807 = precise::clamp(_805, 0.0, 1.0);
    float _809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _811 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[2].x, _801);
    float _813 = rsqrt(_799);
    float _815 = -_807;
    float _817 = _815 + 1.0;
    float _819 = _561 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _821 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[2].z, _811);
    float _823 = _561 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _825 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[1].x, _819);
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _829 = abs(_817);
    float _831 = log2(_829);
    float _833 = _561 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _835 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[0].x, _823);
    float _837 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[1].z, _825);
    float _839 = _827 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _841 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[3].x, _833);
    float _843 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[0].z, _835);
    float _845 = _837 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _847 = _813 * _771;
    float _849 = _813 * _783;
    float _851 = _843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _853 = _845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _855 = _847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _857 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[3].z, _841);
    float _859 = _813 * _779;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _853);
    float _863 = _831 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _865 = -_855;
    float _867 = fma(_849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _865);
    float _869 = _857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _871 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[7].z, _861);
    float _873 = -_839;
    float _875 = fma(_873, _809, 1.0);
    float _877 = -_859;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c15)._m0[21].z, _867);
    float _881 = exp2(_863);
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _871);
    float _885 = _845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _887 = fma(_879, -0.5, 0.5);
    float _889 = _845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _891 = fma(_879, 0.5, 0.5);
    float _893 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _885);
    float _895 = _849 + 1.0;
    float _897 = log2(_875);
    float _899 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _889);
    float _901 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[4].z, _893);
    float _903 = fma(_891, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _905 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[5].z, _899);
    float _907 = fma(_891, _903, -0.212114393711090087890625);
    float _909 = 1.0 / _883;
    float _911 = -_849;
    float _913 = fma(_881, _895, _911);
    float _915 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _901);
    float _917 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _905);
    float _919 = fma(_891, _907, 1.570728778839111328125);
    float _921 = fma(_913, 0.5, 0.5);
    float _923 = sqrt(_887);
    float _925 = _897 * 0.693147182464599609375;
    float _927 = _925 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _929 = _915 * _909;
    float _931 = _917 * _909;
    float _933 = fma(_929, 0.5, 0.5);
    float _935 = fma(_931, -0.5, 0.5);
    float _937 = _923 * 0.636619746685028076171875;
    float3 _2500 = float3(_933, _935, _927);
    float _939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2500, float3(0.0), isnan(_2500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2500, float3(0.0), isnan(_2500)), level(0.0)).x;
    float _941 = -_919;
    float _943 = fma(_937, _941, 1.0);
    float3 _2516 = float3(_933, _935, _927);
    float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2516, float3(0.0), isnan(_2516)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2516, float3(0.0), isnan(_2516)), level(0.0)).xyzw;
    float _948 = _946.x;
    float _950 = _946.y;
    float _952 = _946.z;
    float _954 = _946.w;
    float2 _2533 = float2(_943, _921);
    float3 _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2533, float2(0.0), isnan(_2533)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2533, float2(0.0), isnan(_2533)), level(0.0)).xyz;
    float _960 = _958.x;
    float _962 = _958.y;
    float _964 = _958.z;
    float _966 = in.m_49.y;
    float _968 = _831 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _970 = _139 > 0.5;
    float _972 = _845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _976 = _974 != 0;
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _982 = _980 != 0;
    float _984 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _972);
    float _986 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[6].z, _984);
    float _988 = exp2(_968);
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _996 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1000 = _966 > 0.5;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1010 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = -_361;
    int _1020 = _970 ? as_type<int>(_1018) : as_type<int>(_361);
    out.m_56.x = _996;
    out.m_56.y = _998;
    out.m_56.z = _1010;
    out.m_56.w = _1008;
    float _1022 = -_273;
    int _1024 = _1000 ? as_type<int>(_1022) : as_type<int>(_273);
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    out.m_58.x = _1012;
    out.m_58.y = _1014;
    out.m_58.z = _1016;
    bool _1032 = !_976;
    float _1034 = _1032 ? _361 : as_type<float>(_1020);
    float _1036 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _986);
    bool _1038 = !_982;
    float _1040 = _1038 ? _273 : as_type<float>(_1024);
    bool _1042 = _629 > 0.0;
    bool _1044 = isnan(_629);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = _1034 + 0.5;
    out.gl_Position.x = _915;
    out.gl_Position.y = _917;
    out.gl_Position.z = _1036;
    out.gl_Position.w = _883;
    float _1054 = -_1040;
    float _1056 = _1054 + 0.5;
    float _1058 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1062 = _883 * 0.5;
    float _1064 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1066 = _355 * _1058;
    float _1068 = _1036 + _883;
    float _1070 = fma(_917, -0.5, _1062);
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1074 = _915 + _883;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1078 = _1060 * _978;
    float _1080 = _1064 * _1026;
    float _1082 = _1068 * 0.5;
    float _1084 = _1074 * 0.5;
    out.m_60.x = _1078;
    out.m_60.y = _1080;
    out.m_62.x = _1084;
    out.m_62.y = _1070;
    out.m_62.z = _1082;
    out.m_62.w = _883;
    out.m_45.x = _1076;
    float _1086 = _1072 * _939;
    float _1088 = -_1072;
    float _1090 = _1088 + 1.0;
    float _1092 = _954 * _1086;
    float _1094 = _954 * _1090;
    float _1096 = _964 * _1086;
    float _1098 = fma(_960, _1092, _948);
    float _1100 = fma(_962, _1092, _950);
    float _1102 = fma(_954, _1096, _952);
    out.m_64.x = _1098;
    out.m_64.y = _1100;
    out.m_64.z = _1102;
    out.m_64.w = _1094;
    if (_1050)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1104;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1161 = as_type<float>(_99);
        out.gl_Position.z = _1161;
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
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _91 = _121;
    }
    float _123 = _91;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1230 = as_type<float>(_137);
        out.gl_Position.z = _1230;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = _147;
    if (!_157)
    {
        float _163 = _147 * _147;
        float _165 = _163 * 0.5;
        _119 = _165;
    }
    float _167 = _119;
    float _169 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _171 = _167;
    if (!_157)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = floor(_169);
    float _179 = _169 * 6.283185482025146484375;
    bool _181 = !_157;
    float _183 = _175;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _147 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _147);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_157;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _147 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _161 = _237;
    }
    float _239 = _161;
    float _241 = _179 * 0.15915493667125701904296875;
    float _243 = -_177;
    float _245 = _169 + _243;
    int _247 = as_type<int>(_145) & 1;
    bool _249 = _247 != 0;
    int _251 = as_type<int>(_145) & 2;
    bool _253 = _251 != 0;
    float _255 = in.m_47.x;
    float _257 = in.m_47.y;
    float _259 = in.m_47.z;
    float _261 = _241 * 6.283185482025146484375;
    float _263 = cos(_261);
    float _265 = in.m_54.x;
    int _267 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _269 = _267 != 0;
    bool _271 = !_253;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = in.m_54.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _283 = _281 != 0;
    bool _285 = !_269;
    int _287 = _285 ? 0 : 1;
    float _289 = in.m_54.y;
    bool _291 = !_279;
    int _293 = _291 ? 0 : 1;
    int _295 = abs(_287);
    float _297 = fma(_263, 0.5, 0.5);
    int _299 = abs(_293);
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    bool _307 = _245 < 0.5;
    float _309 = float(_307);
    float _311 = -_245;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_283;
    int _317 = _315 ? 0 : 1;
    float _319 = float(_299);
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_317);
    float _327 = -_297;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = float(_295);
    float _333 = abs(_313);
    float _335 = _319 * _333;
    float _337 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_325);
    float _345 = fma(_331, _329, _335);
    float _347 = fma(_239, _255, _337);
    float _349 = fma(_239, _257, _339);
    float _351 = fma(_239, _259, _341);
    float _353 = abs(_323);
    float _355 = fma(_343, _353, _345);
    float _357 = _265 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _359 = !_249;
    float _361 = _359 ? (-0.5) : 0.5;
    float _363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _365 = fma(_347, _275, _301);
    float _367 = _355 * _357;
    float _369 = _289 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _361);
    float _373 = fma(_349, _275, _303);
    float _375 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _377 = _355 * _369;
    float _379 = fma(_351, _275, _305);
    float _381 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = _375 * _371;
    float _385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _387 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _393 = _385 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _395 = _387 * _363;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _399 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _389);
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _393);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[8].x, _397);
    float _407 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _409 = _401 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _411 = -_395;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[10].z, _403);
    float _415 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _419 = -_395;
    float _421 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[8].z, _405);
    float _423 = _409 + _413;
    float _425 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _427 = _385 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _429 = _417 + _421;
    float _431 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _433 = _423 + _431;
    float _435 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _425);
    bool _437 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _439 = isnan(0.5);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _449 = _429 + _447;
    float _451 = _433 * _433;
    float _453 = _435 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[9].x, _427);
    float _457 = fma(_449, _449, _451);
    float _459 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _461 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _463 = -_395;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[9].z, _455);
    float _467 = sqrt(_457);
    float _469 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[11].x, _459);
    float _471 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[10].x, _461);
    float _473 = _453 + _465;
    float _475 = _335;
    float _477 = _423;
    float _479 = _429;
    if (_445)
    {
        _475 = 1.0;
    }
    float _481 = _475;
    float _483 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[11].z, _469);
    float _485 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[10].z, _471);
    float _487 = _483 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _489 = _485 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _491 = 1.0 / _487;
    float _493 = _489 + _487;
    bool _495 = _467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _497 = _493 * _491;
    float _499 = _497 * 0.5;
    float _501 = _487;
    float _503 = _493;
    float _505 = _491;
    float _507 = _481;
    float _509 = _499;
    if (!_495)
    {
        _501 = _429;
    }
    float _511 = _501;
    float _513 = _511;
    if (!_495)
    {
        _503 = _423;
    }
    float _515 = _503;
    float _517 = _515;
    if (!_495)
    {
        _505 = _473;
    }
    float _519 = _505;
    bool _521 = !_495;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _467 + _527;
        float _531 = rsqrt(_457);
        float _533 = _529 * _525;
        float _535 = _473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _537 = _533 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = sin(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = fma(_541, _535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _549 = _531 * _547;
        float _551 = _545 + (-1.0);
        float _553 = fma(_449, _549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _555 = fma(_433, _549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _557 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _559 = fma(_473, _545, _557);
        _523 = _559;
        _513 = _553;
        _517 = _555;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    if (!_445)
    {
        float _567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _569 = _567 * 0.15915493667125701904296875;
        float _571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _573 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _575 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[30].w, _573);
        float _577 = _569 * 6.283185482025146484375;
        float _579 = cos(_577);
        float _581 = _571 * 0.15915493667125701904296875;
        float _583 = _569 * 6.283185482025146484375;
        float _585 = sin(_583);
        float _587 = 1.0 / _579;
        float _589 = _581 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _585 * _587;
        float _595 = _581 * 6.283185482025146484375;
        float _597 = sin(_595);
        float _599 = _591 * _593;
        float _601 = 1.0 / _575;
        float _603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _605 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _603;
        float _607 = 1.0 / _599;
        float _609 = 1.0 / _605;
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _613 = _601 * _611;
        float _615 = _597 * _607;
        float _617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _619 = fma(_615, _613, _617);
        float _621 = _619 * _609;
        float _623 = precise::clamp(_621, 0.0, 1.0);
        _477 = _581;
        _479 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _507 = _623;
    }
    float _625 = _477;
    float _627 = _479;
    float _629 = _507;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _633 = _561 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _637 = _563 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _641 = _565 + _639;
    float _643 = _633 * _633;
    float _645 = fma(_637, _637, _643);
    float _647 = fma(_641, _641, _645);
    float _649 = rsqrt(_647);
    float _651 = _649 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _653 = _637 * _651;
    float _655 = _641 * _651;
    float _657 = _653 * _653;
    float _659 = _655 * _655;
    float _661 = _657 + _659;
    float _663 = sqrt(_661);
    bool _665 = _663 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _667 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _669 = _663 + _667;
    float _671 = _641;
    float _673 = _627;
    float _675 = _669;
    float _677 = _625;
    float _679 = _633;
    float _681 = _653;
    if (_665)
    {
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _671 = _683;
    }
    float _685 = _671;
    if (_665)
    {
        float _687 = rsqrt(_661);
        _673 = _687;
    }
    float _689 = _673;
    float _691 = _689;
    if (_665)
    {
        float _693 = _669 * _685;
        _675 = _693;
    }
    float _695 = _675;
    if (_665)
    {
        float _697 = _695 * 0.15915493667125701904296875;
        _677 = _697;
    }
    float _699 = _677;
    float _701 = _685;
    if (_665)
    {
        float _703 = _699 * 6.283185482025146484375;
        float _705 = sin(_703);
        _701 = _705;
    }
    float _707 = _701;
    float _709 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _711 = precise::max(0.0, _709);
    float _713 = _643;
    float _715 = _711;
    if (_665)
    {
        float _717 = _699 * 6.283185482025146484375;
        float _719 = cos(_717);
        _713 = _719;
    }
    float _721 = _713;
    float _723 = -_651;
    float _725 = -_711;
    float _727 = fma(_633, _723, _725);
    if (!_665)
    {
        _679 = _655;
    }
    float _729 = _679;
    float _731 = _729;
    if (_665)
    {
        float _733 = _727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _715 = _733;
    }
    float _735 = _715;
    float _737 = sqrt(_647);
    float _739 = _707;
    float _741 = _735;
    if (_665)
    {
        float _743 = fma(_707, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _739 = _743;
    }
    float _745 = _739;
    float _747 = _745;
    float _749 = _721;
    if (_665)
    {
        float _751 = _721 + (-1.0);
        _741 = _751;
    }
    float _753 = _741;
    float _755 = _753;
    if (_665)
    {
        float _757 = _689 * _745;
        _509 = _757;
    }
    float _759 = _509;
    if (!_665)
    {
        _747 = _727;
    }
    float _761 = _747;
    float _763 = _761;
    if (_665)
    {
        float _765 = _753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _691 = _765;
    }
    float _767 = _691;
    if (_665)
    {
        float _769 = _653 * _759;
        _681 = _769;
    }
    float _771 = _681;
    if (!_665)
    {
        _755 = _657;
    }
    float _773 = _755;
    float _775 = _773;
    if (_665)
    {
        float _777 = _655 * _759;
        _731 = _777;
    }
    float _779 = _731;
    if (_665)
    {
        float _781 = fma(_727, _721, _767);
        _763 = _781;
    }
    float _783 = _763;
    if (_665)
    {
        float _785 = _771 * _771;
        _775 = _785;
    }
    float _787 = _775;
    if (!_665)
    {
        _749 = _659;
    }
    float _789 = _749;
    float _791 = _789;
    if (_665)
    {
        float _793 = _779 * _779;
        _791 = _793;
    }
    float _795 = _791;
    float _797 = fma(_783, _783, _787);
    float _799 = _797 + _795;
    float _801 = _561 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _805 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[23].w, _803);
    float _807 = precise::clamp(_805, 0.0, 1.0);
    float _809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _811 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[2].x, _801);
    float _813 = rsqrt(_799);
    float _815 = -_807;
    float _817 = _815 + 1.0;
    float _819 = _561 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _821 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[2].z, _811);
    float _823 = _561 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _825 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[1].x, _819);
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _829 = abs(_817);
    float _831 = log2(_829);
    float _833 = _561 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _835 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[0].x, _823);
    float _837 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[1].z, _825);
    float _839 = _827 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _841 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[3].x, _833);
    float _843 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[0].z, _835);
    float _845 = _837 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _847 = _813 * _771;
    float _849 = _813 * _783;
    float _851 = _843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _853 = _845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _855 = _847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _857 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[3].z, _841);
    float _859 = _813 * _779;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _853);
    float _863 = _831 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _865 = -_855;
    float _867 = fma(_849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _865);
    float _869 = _857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _871 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[7].z, _861);
    float _873 = -_839;
    float _875 = fma(_873, _809, 1.0);
    float _877 = -_859;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c15)._m0[21].z, _867);
    float _881 = exp2(_863);
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _871);
    float _885 = _845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _887 = fma(_879, -0.5, 0.5);
    float _889 = _845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _891 = fma(_879, 0.5, 0.5);
    float _893 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _885);
    float _895 = _849 + 1.0;
    float _897 = log2(_875);
    float _899 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _889);
    float _901 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[4].z, _893);
    float _903 = fma(_891, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _905 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[5].z, _899);
    float _907 = fma(_891, _903, -0.212114393711090087890625);
    float _909 = 1.0 / _883;
    float _911 = -_849;
    float _913 = fma(_881, _895, _911);
    float _915 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _901);
    float _917 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _905);
    float _919 = fma(_891, _907, 1.570728778839111328125);
    float _921 = fma(_913, 0.5, 0.5);
    float _923 = sqrt(_887);
    float _925 = _897 * 0.693147182464599609375;
    float _927 = _925 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _929 = _915 * _909;
    float _931 = _917 * _909;
    float _933 = fma(_929, 0.5, 0.5);
    float _935 = fma(_931, -0.5, 0.5);
    float _937 = _923 * 0.636619746685028076171875;
    float3 _2500 = float3(_933, _935, _927);
    float _939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2500, float3(0.0), isnan(_2500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2500, float3(0.0), isnan(_2500)), level(0.0)).x;
    float _941 = -_919;
    float _943 = fma(_937, _941, 1.0);
    float3 _2516 = float3(_933, _935, _927);
    float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2516, float3(0.0), isnan(_2516)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2516, float3(0.0), isnan(_2516)), level(0.0)).xyzw;
    float _948 = _946.x;
    float _950 = _946.y;
    float _952 = _946.z;
    float _954 = _946.w;
    float2 _2533 = float2(_943, _921);
    float3 _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2533, float2(0.0), isnan(_2533)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2533, float2(0.0), isnan(_2533)), level(0.0)).xyz;
    float _960 = _958.x;
    float _962 = _958.y;
    float _964 = _958.z;
    float _966 = in.m_49.y;
    float _968 = _831 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _970 = _139 > 0.5;
    float _972 = _845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _976 = _974 != 0;
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _982 = _980 != 0;
    float _984 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _972);
    float _986 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[6].z, _984);
    float _988 = exp2(_968);
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _996 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1000 = _966 > 0.5;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1010 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = -_361;
    int _1020 = _970 ? as_type<int>(_1018) : as_type<int>(_361);
    out.m_56.x = _996;
    out.m_56.y = _998;
    out.m_56.z = _1010;
    out.m_56.w = _1008;
    float _1022 = -_273;
    int _1024 = _1000 ? as_type<int>(_1022) : as_type<int>(_273);
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    out.m_58.x = _1012;
    out.m_58.y = _1014;
    out.m_58.z = _1016;
    bool _1032 = !_976;
    float _1034 = _1032 ? _361 : as_type<float>(_1020);
    float _1036 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _986);
    bool _1038 = !_982;
    float _1040 = _1038 ? _273 : as_type<float>(_1024);
    bool _1042 = _629 > 0.0;
    bool _1044 = isnan(_629);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = _1034 + 0.5;
    out.gl_Position.x = _915;
    out.gl_Position.y = _917;
    out.gl_Position.z = _1036;
    out.gl_Position.w = _883;
    float _1054 = -_1040;
    float _1056 = _1054 + 0.5;
    float _1058 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1062 = _883 * 0.5;
    float _1064 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1066 = _355 * _1058;
    float _1068 = _1036 + _883;
    float _1070 = fma(_917, -0.5, _1062);
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1074 = _915 + _883;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1078 = _1060 * _978;
    float _1080 = _1064 * _1026;
    float _1082 = _1068 * 0.5;
    float _1084 = _1074 * 0.5;
    out.m_60.x = _1078;
    out.m_60.y = _1080;
    out.m_62.x = _1084;
    out.m_62.y = _1070;
    out.m_62.z = _1082;
    out.m_62.w = _883;
    out.m_45.x = _1076;
    float _1086 = _1072 * _939;
    float _1088 = -_1072;
    float _1090 = _1088 + 1.0;
    float _1092 = _954 * _1086;
    float _1094 = _954 * _1090;
    float _1096 = _964 * _1086;
    float _1098 = fma(_960, _1092, _948);
    float _1100 = fma(_962, _1092, _950);
    float _1102 = fma(_954, _1096, _952);
    out.m_64.x = _1098;
    out.m_64.y = _1100;
    out.m_64.z = _1102;
    out.m_64.w = _1094;
    if (_1050)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1104;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1161 = as_type<float>(_99);
        out.gl_Position.z = _1161;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _91 = _121;
    }
    float _123 = _91;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1230 = as_type<float>(_137);
        out.gl_Position.z = _1230;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = _147;
    if (!_157)
    {
        float _163 = _147 * _147;
        float _165 = _163 * 0.5;
        _119 = _165;
    }
    float _167 = _119;
    float _169 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _171 = _167;
    if (!_157)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = floor(_169);
    float _179 = _169 * 6.283185482025146484375;
    bool _181 = !_157;
    float _183 = _175;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _147 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _147);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_157;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _147 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _161 = _237;
    }
    float _239 = _161;
    float _241 = _179 * 0.15915493667125701904296875;
    float _243 = -_177;
    float _245 = _169 + _243;
    int _247 = as_type<int>(_145) & 1;
    bool _249 = _247 != 0;
    int _251 = as_type<int>(_145) & 2;
    bool _253 = _251 != 0;
    float _255 = in.m_47.x;
    float _257 = in.m_47.y;
    float _259 = in.m_47.z;
    float _261 = _241 * 6.283185482025146484375;
    float _263 = cos(_261);
    float _265 = in.m_54.x;
    int _267 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _269 = _267 != 0;
    bool _271 = !_253;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = in.m_54.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _283 = _281 != 0;
    bool _285 = !_269;
    int _287 = _285 ? 0 : 1;
    float _289 = in.m_54.y;
    bool _291 = !_279;
    int _293 = _291 ? 0 : 1;
    int _295 = abs(_287);
    float _297 = fma(_263, 0.5, 0.5);
    int _299 = abs(_293);
    float _301 = in.m_42.x;
    float _303 = in.m_42.y;
    float _305 = in.m_42.z;
    bool _307 = _245 < 0.5;
    float _309 = float(_307);
    float _311 = -_245;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_283;
    int _317 = _315 ? 0 : 1;
    float _319 = float(_299);
    float _321 = -_309;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_317);
    float _327 = -_297;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = float(_295);
    float _333 = abs(_313);
    float _335 = _319 * _333;
    float _337 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_325);
    float _345 = fma(_331, _329, _335);
    float _347 = fma(_239, _255, _337);
    float _349 = fma(_239, _257, _339);
    float _351 = fma(_239, _259, _341);
    float _353 = abs(_323);
    float _355 = fma(_343, _353, _345);
    float _357 = _265 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _359 = !_249;
    float _361 = _359 ? (-0.5) : 0.5;
    float _363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _365 = fma(_347, _275, _301);
    float _367 = _355 * _357;
    float _369 = _289 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _361);
    float _373 = fma(_349, _275, _303);
    float _375 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _377 = _355 * _369;
    float _379 = fma(_351, _275, _305);
    float _381 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = _375 * _371;
    float _385 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _387 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _389 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _393 = _385 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _395 = _387 * _363;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _399 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _389);
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _393);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[8].x, _397);
    float _407 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _409 = _401 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _411 = -_395;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[10].z, _403);
    float _415 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _419 = -_395;
    float _421 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[8].z, _405);
    float _423 = _409 + _413;
    float _425 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _427 = _385 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _429 = _417 + _421;
    float _431 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _433 = _423 + _431;
    float _435 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _425);
    bool _437 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _439 = isnan(0.5);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _449 = _429 + _447;
    float _451 = _433 * _433;
    float _453 = _435 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[9].x, _427);
    float _457 = fma(_449, _449, _451);
    float _459 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _461 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _463 = -_395;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[9].z, _455);
    float _467 = sqrt(_457);
    float _469 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[11].x, _459);
    float _471 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[10].x, _461);
    float _473 = _453 + _465;
    float _475 = _335;
    float _477 = _423;
    float _479 = _429;
    if (_445)
    {
        _475 = 1.0;
    }
    float _481 = _475;
    float _483 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[11].z, _469);
    float _485 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[10].z, _471);
    float _487 = _483 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _489 = _485 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _491 = 1.0 / _487;
    float _493 = _489 + _487;
    bool _495 = _467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _497 = _493 * _491;
    float _499 = _497 * 0.5;
    float _501 = _487;
    float _503 = _493;
    float _505 = _491;
    float _507 = _481;
    float _509 = _499;
    if (!_495)
    {
        _501 = _429;
    }
    float _511 = _501;
    float _513 = _511;
    if (!_495)
    {
        _503 = _423;
    }
    float _515 = _503;
    float _517 = _515;
    if (!_495)
    {
        _505 = _473;
    }
    float _519 = _505;
    bool _521 = !_495;
    float _523 = _519;
    if (!_521)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _527 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _529 = _467 + _527;
        float _531 = rsqrt(_457);
        float _533 = _529 * _525;
        float _535 = _473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _537 = _533 * 0.15915493667125701904296875;
        float _539 = _537 * 6.283185482025146484375;
        float _541 = sin(_539);
        float _543 = _537 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = fma(_541, _535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _549 = _531 * _547;
        float _551 = _545 + (-1.0);
        float _553 = fma(_449, _549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _555 = fma(_433, _549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _557 = _551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _559 = fma(_473, _545, _557);
        _523 = _559;
        _513 = _553;
        _517 = _555;
    }
    float _561 = _523;
    float _563 = _513;
    float _565 = _517;
    if (!_445)
    {
        float _567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _569 = _567 * 0.15915493667125701904296875;
        float _571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _573 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _575 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[30].w, _573);
        float _577 = _569 * 6.283185482025146484375;
        float _579 = cos(_577);
        float _581 = _571 * 0.15915493667125701904296875;
        float _583 = _569 * 6.283185482025146484375;
        float _585 = sin(_583);
        float _587 = 1.0 / _579;
        float _589 = _581 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _585 * _587;
        float _595 = _581 * 6.283185482025146484375;
        float _597 = sin(_595);
        float _599 = _591 * _593;
        float _601 = 1.0 / _575;
        float _603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _605 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _603;
        float _607 = 1.0 / _599;
        float _609 = 1.0 / _605;
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _613 = _601 * _611;
        float _615 = _597 * _607;
        float _617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _619 = fma(_615, _613, _617);
        float _621 = _619 * _609;
        float _623 = precise::clamp(_621, 0.0, 1.0);
        _477 = _581;
        _479 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _507 = _623;
    }
    float _625 = _477;
    float _627 = _479;
    float _629 = _507;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _633 = _561 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _637 = _563 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _641 = _565 + _639;
    float _643 = _633 * _633;
    float _645 = fma(_637, _637, _643);
    float _647 = fma(_641, _641, _645);
    float _649 = rsqrt(_647);
    float _651 = _649 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _653 = _637 * _651;
    float _655 = _641 * _651;
    float _657 = _653 * _653;
    float _659 = _655 * _655;
    float _661 = _657 + _659;
    float _663 = sqrt(_661);
    bool _665 = _663 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _667 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _669 = _663 + _667;
    float _671 = _641;
    float _673 = _627;
    float _675 = _669;
    float _677 = _625;
    float _679 = _633;
    float _681 = _653;
    if (_665)
    {
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _671 = _683;
    }
    float _685 = _671;
    if (_665)
    {
        float _687 = rsqrt(_661);
        _673 = _687;
    }
    float _689 = _673;
    float _691 = _689;
    if (_665)
    {
        float _693 = _669 * _685;
        _675 = _693;
    }
    float _695 = _675;
    if (_665)
    {
        float _697 = _695 * 0.15915493667125701904296875;
        _677 = _697;
    }
    float _699 = _677;
    float _701 = _685;
    if (_665)
    {
        float _703 = _699 * 6.283185482025146484375;
        float _705 = sin(_703);
        _701 = _705;
    }
    float _707 = _701;
    float _709 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _711 = precise::max(0.0, _709);
    float _713 = _643;
    float _715 = _711;
    if (_665)
    {
        float _717 = _699 * 6.283185482025146484375;
        float _719 = cos(_717);
        _713 = _719;
    }
    float _721 = _713;
    float _723 = -_651;
    float _725 = -_711;
    float _727 = fma(_633, _723, _725);
    if (!_665)
    {
        _679 = _655;
    }
    float _729 = _679;
    float _731 = _729;
    if (_665)
    {
        float _733 = _727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _715 = _733;
    }
    float _735 = _715;
    float _737 = sqrt(_647);
    float _739 = _707;
    float _741 = _735;
    if (_665)
    {
        float _743 = fma(_707, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _739 = _743;
    }
    float _745 = _739;
    float _747 = _745;
    float _749 = _721;
    if (_665)
    {
        float _751 = _721 + (-1.0);
        _741 = _751;
    }
    float _753 = _741;
    float _755 = _753;
    if (_665)
    {
        float _757 = _689 * _745;
        _509 = _757;
    }
    float _759 = _509;
    if (!_665)
    {
        _747 = _727;
    }
    float _761 = _747;
    float _763 = _761;
    if (_665)
    {
        float _765 = _753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _691 = _765;
    }
    float _767 = _691;
    if (_665)
    {
        float _769 = _653 * _759;
        _681 = _769;
    }
    float _771 = _681;
    if (!_665)
    {
        _755 = _657;
    }
    float _773 = _755;
    float _775 = _773;
    if (_665)
    {
        float _777 = _655 * _759;
        _731 = _777;
    }
    float _779 = _731;
    if (_665)
    {
        float _781 = fma(_727, _721, _767);
        _763 = _781;
    }
    float _783 = _763;
    if (_665)
    {
        float _785 = _771 * _771;
        _775 = _785;
    }
    float _787 = _775;
    if (!_665)
    {
        _749 = _659;
    }
    float _789 = _749;
    float _791 = _789;
    if (_665)
    {
        float _793 = _779 * _779;
        _791 = _793;
    }
    float _795 = _791;
    float _797 = fma(_783, _783, _787);
    float _799 = _797 + _795;
    float _801 = _561 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _805 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[23].w, _803);
    float _807 = precise::clamp(_805, 0.0, 1.0);
    float _809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _811 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[2].x, _801);
    float _813 = rsqrt(_799);
    float _815 = -_807;
    float _817 = _815 + 1.0;
    float _819 = _561 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _821 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[2].z, _811);
    float _823 = _561 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _825 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[1].x, _819);
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _829 = abs(_817);
    float _831 = log2(_829);
    float _833 = _561 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _835 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[0].x, _823);
    float _837 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[1].z, _825);
    float _839 = _827 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _841 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[3].x, _833);
    float _843 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[0].z, _835);
    float _845 = _837 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _847 = _813 * _771;
    float _849 = _813 * _783;
    float _851 = _843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _853 = _845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _855 = _847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _857 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[3].z, _841);
    float _859 = _813 * _779;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _853);
    float _863 = _831 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _865 = -_855;
    float _867 = fma(_849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _865);
    float _869 = _857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _871 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[7].z, _861);
    float _873 = -_839;
    float _875 = fma(_873, _809, 1.0);
    float _877 = -_859;
    float _879 = fma(_877, (*spvDescriptorSet0.vp_c15)._m0[21].z, _867);
    float _881 = exp2(_863);
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _871);
    float _885 = _845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _887 = fma(_879, -0.5, 0.5);
    float _889 = _845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _891 = fma(_879, 0.5, 0.5);
    float _893 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _885);
    float _895 = _849 + 1.0;
    float _897 = log2(_875);
    float _899 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _889);
    float _901 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[4].z, _893);
    float _903 = fma(_891, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _905 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[5].z, _899);
    float _907 = fma(_891, _903, -0.212114393711090087890625);
    float _909 = 1.0 / _883;
    float _911 = -_849;
    float _913 = fma(_881, _895, _911);
    float _915 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _901);
    float _917 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _905);
    float _919 = fma(_891, _907, 1.570728778839111328125);
    float _921 = fma(_913, 0.5, 0.5);
    float _923 = sqrt(_887);
    float _925 = _897 * 0.693147182464599609375;
    float _927 = _925 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _929 = _915 * _909;
    float _931 = _917 * _909;
    float _933 = fma(_929, 0.5, 0.5);
    float _935 = fma(_931, -0.5, 0.5);
    float _937 = _923 * 0.636619746685028076171875;
    float3 _2500 = float3(_933, _935, _927);
    float _939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2500, float3(0.0), isnan(_2500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2500, float3(0.0), isnan(_2500)), level(0.0)).x;
    float _941 = -_919;
    float _943 = fma(_937, _941, 1.0);
    float3 _2516 = float3(_933, _935, _927);
    float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2516, float3(0.0), isnan(_2516)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2516, float3(0.0), isnan(_2516)), level(0.0)).xyzw;
    float _948 = _946.x;
    float _950 = _946.y;
    float _952 = _946.z;
    float _954 = _946.w;
    float2 _2533 = float2(_943, _921);
    float3 _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2533, float2(0.0), isnan(_2533)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2533, float2(0.0), isnan(_2533)), level(0.0)).xyz;
    float _960 = _958.x;
    float _962 = _958.y;
    float _964 = _958.z;
    float _966 = in.m_49.y;
    float _968 = _831 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _970 = _139 > 0.5;
    float _972 = _845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _976 = _974 != 0;
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _982 = _980 != 0;
    float _984 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _972);
    float _986 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[6].z, _984);
    float _988 = exp2(_968);
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _996 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1000 = _966 > 0.5;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1010 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = -_361;
    int _1020 = _970 ? as_type<int>(_1018) : as_type<int>(_361);
    out.m_56.x = _996;
    out.m_56.y = _998;
    out.m_56.z = _1010;
    out.m_56.w = _1008;
    float _1022 = -_273;
    int _1024 = _1000 ? as_type<int>(_1022) : as_type<int>(_273);
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    out.m_58.x = _1012;
    out.m_58.y = _1014;
    out.m_58.z = _1016;
    bool _1032 = !_976;
    float _1034 = _1032 ? _361 : as_type<float>(_1020);
    float _1036 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _986);
    bool _1038 = !_982;
    float _1040 = _1038 ? _273 : as_type<float>(_1024);
    bool _1042 = _629 > 0.0;
    bool _1044 = isnan(_629);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = _1034 + 0.5;
    out.gl_Position.x = _915;
    out.gl_Position.y = _917;
    out.gl_Position.z = _1036;
    out.gl_Position.w = _883;
    float _1054 = -_1040;
    float _1056 = _1054 + 0.5;
    float _1058 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1062 = _883 * 0.5;
    float _1064 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1066 = _355 * _1058;
    float _1068 = _1036 + _883;
    float _1070 = fma(_917, -0.5, _1062);
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1074 = _915 + _883;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1078 = _1060 * _978;
    float _1080 = _1064 * _1026;
    float _1082 = _1068 * 0.5;
    float _1084 = _1074 * 0.5;
    out.m_60.x = _1078;
    out.m_60.y = _1080;
    out.m_62.x = _1084;
    out.m_62.y = _1070;
    out.m_62.z = _1082;
    out.m_62.w = _883;
    out.m_45.x = _1076;
    float _1086 = _1072 * _939;
    float _1088 = -_1072;
    float _1090 = _1088 + 1.0;
    float _1092 = _954 * _1086;
    float _1094 = _954 * _1090;
    float _1096 = _964 * _1086;
    float _1098 = fma(_960, _1092, _948);
    float _1100 = fma(_962, _1092, _950);
    float _1102 = fma(_954, _1096, _952);
    out.m_64.x = _1098;
    out.m_64.y = _1100;
    out.m_64.z = _1102;
    out.m_64.w = _1094;
    if (_1050)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1104;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

