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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1476 = false;
    bool _299 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_119);
        out.gl_Position.z = _1781;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    if (_133)
    {
        float _141 = float(_103);
        _139 = _141;
    }
    float _143 = _139;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    if (_149)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _113;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _121 = as_type<int>(_153);
    }
    int _155 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1849 = as_type<float>(_155);
        out.gl_Position.z = _1849;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_157) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_157) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_159;
    float _195;
    if (!_177)
    {
        float _179 = in.m_56.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_103);
        float _201 = 1.0 / _199;
        float _203 = _137 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _243;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _225;
    float _251 = _241 * _229;
    float _253 = -_241;
    float _255 = _253 + 1.0;
    float _257 = _209 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _259;
    float _263 = fma(_245, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_261, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = _263 * _251;
    float _269 = _265 * _251;
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_247;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_103);
        float _303 = 1.0 / _301;
        float _305 = _137 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = in.m_46.z;
    bool _315 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _317 = isnan(0.5);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _323 = _319 || _321;
    float _325 = in.m_58.x;
    float _327 = in.m_58.y;
    float _329 = in.m_58.z;
    float _331 = in.m_58.w;
    bool _333 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _335 = isnan(0.5);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _341 = _337 || _339;
    float _343 = in.m_60.x;
    float _345 = in.m_60.y;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = in.m_62.z;
    float _353 = in.m_62.w;
    float _355 = in.m_64.x;
    float _357 = in.m_64.y;
    float _359 = in.m_64.z;
    float _361 = in.m_64.w;
    float _363 = _311 * _327;
    float _365 = _277 * _345;
    float _367 = fma(_309, _325, _363);
    float _369 = _275 * _343;
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _373 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _375 = _311 * _349;
    float _377 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _379 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _381 = _311 * _357;
    float _383 = _373 * _371;
    float _385 = fma(_309, _347, _375);
    float _387 = _379 * _377;
    float _389 = fma(_309, _355, _381);
    float _391 = _383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _393 = fma(_313, _351, _385);
    float _395 = _383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _397 = fma(_313, _359, _389);
    float _399 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[26].x, _391);
    float _403 = fma(_313, _329, _367);
    float _405 = _397 + _361;
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[24].x, _395);
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[26].z, _401);
    float _411 = _393 + _353;
    float _413 = _405 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _415 = _403 + _331;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[24].z, _407);
    float _419 = _409 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[11].x, _413);
    float _423 = _417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _425 = _415 + _419;
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _421);
    float _429 = _405 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _431 = _411 + _423;
    float _433 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _435 = _425 + _433;
    float _437 = _427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _439 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[10].x, _429);
    float _441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _443 = _431 + _441;
    float _445 = _435 * _435;
    float _447 = 1.0 / _437;
    float _449 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _439);
    float _451 = fma(_443, _443, _445);
    float _453 = _383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _449 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _457 = sqrt(_451);
    float _459 = _455 + _437;
    float _461 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _463 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[25].z, _461);
    float _465 = _459 * _447;
    float _467 = _465 * 0.5;
    float _469 = _463 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _471);
    float _475 = _405 + _469;
    bool _477 = _457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _479 = 1.0 / _473;
    float _481 = _355;
    float _483 = _425;
    float _485 = _431;
    float _487 = _397;
    float _489 = _473;
    float _491 = _405;
    if (!_477)
    {
        _481 = _475;
    }
    float _493 = _481;
    bool _495 = !_477;
    float _497 = _493;
    if (!_495)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _503 = _457 + _501;
        float _505 = _475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _507 = rsqrt(_451);
        float _509 = _503 * _499;
        float _511 = _509 * 0.15915493667125701904296875;
        float _513 = _511 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _511 * 6.283185482025146484375;
        float _519 = sin(_517);
        float _521 = _515 + (-1.0);
        float _523 = _521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _525 = fma(_519, _505, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _527 = fma(_475, _515, _523);
        float _529 = _507 * _525;
        float _531 = fma(_443, _529, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _533 = fma(_435, _529, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _497 = _527;
        _483 = _533;
        _485 = _531;
    }
    float _535 = _497;
    float _537 = _483;
    float _539 = _485;
    float _541 = _535;
    float _543 = _539;
    float _545 = _537;
    if (_341)
    {
        _487 = 1.0;
    }
    float _547 = _487;
    float _549 = _547;
    if (!_323)
    {
        float _551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _553 = _405 + _551;
        float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _557 = _411 + _555;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _561 = -_405;
        float _563 = _561 + _535;
        float _565 = _553 * _553;
        float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _569 = _415 + _567;
        float _571 = fma(_557, _557, _565);
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _575 = fma(_569, _569, _571);
        float _577 = sqrt(_575);
        float _579 = _559 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _581 = precise::min(_577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _583 = _581 * _573;
        float _585 = -_415;
        float _587 = _585 + _537;
        float _589 = _579 * _583;
        float _591 = -_411;
        float _593 = _591 + _539;
        float _595 = fma(_563, _589, _405);
        float _597 = fma(_593, _589, _411);
        float _599 = fma(_587, _589, _415);
        _489 = _587;
        _541 = _595;
        _543 = _597;
        _545 = _599;
    }
    float _601 = _489;
    float _603 = _541;
    float _605 = _543;
    float _607 = _545;
    float _609 = _601;
    if (_341)
    {
        _491 = 1.0;
    }
    float _611 = _491;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _615 = _479 * _613;
    float _617 = _611;
    if (!_341)
    {
        float _619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _621 = _619 * 0.15915493667125701904296875;
        float _623 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _625 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _627 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _625;
        float _629 = _621 * 6.283185482025146484375;
        float _631 = cos(_629);
        float _633 = _623 * 0.15915493667125701904296875;
        float _635 = _621 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = 1.0 / _631;
        float _641 = _633 * 6.283185482025146484375;
        float _643 = cos(_641);
        float _645 = _637 * _639;
        float _647 = _633 * 6.283185482025146484375;
        float _649 = sin(_647);
        float _651 = _643 * _645;
        float _653 = 1.0 / _627;
        float _655 = 1.0 / _651;
        float _657 = _649 * _655;
        float _659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _661 = fma(_615, _657, _659);
        float _663 = _661 * _653;
        float _665 = precise::clamp(_663, 0.0, 1.0);
        _609 = _645;
        _549 = _665;
    }
    float _667 = _609;
    float _669 = _549;
    float _671 = _667;
    if (!_341)
    {
        float _673 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _675 = _673 * 0.15915493667125701904296875;
        float _677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _679 = _675 * 6.283185482025146484375;
        float _681 = cos(_679);
        float _683 = _677 * 0.15915493667125701904296875;
        float _685 = _675 * 6.283185482025146484375;
        float _687 = sin(_685);
        float _689 = 1.0 / _681;
        float _691 = _683 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = _687 * _689;
        float _697 = _683 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = _693 * _695;
        float _703 = 1.0 / _701;
        float _705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _705;
        float _709 = 1.0 / _707;
        float _711 = _699 * _703;
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _715 = fma(_615, _711, _713);
        float _717 = _715 * _709;
        float _719 = precise::clamp(_717, 0.0, 1.0);
        float _721 = -_719;
        float _723 = _721 + 1.0;
        _671 = _689;
        _617 = _723;
    }
    float _725 = _671;
    float _727 = _617;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _603 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _605 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _607 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _747 = fma(_739, _739, _743);
    float _749 = rsqrt(_747);
    float _751 = sqrt(_747);
    float _753 = _749 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _755 = _735 * _753;
    float _757 = _739 * _753;
    float _759 = _755 * _755;
    float _761 = _757 * _757;
    float _763 = _759 + _761;
    float _765 = sqrt(_763);
    bool _767 = _765 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _771 = _765 + _769;
    float _773 = _739;
    float _775 = _749;
    float _777 = _771;
    float _779 = _725;
    float _781 = _731;
    float _783 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_767)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _785;
    }
    float _787 = _773;
    if (_767)
    {
        float _789 = rsqrt(_763);
        _775 = _789;
    }
    float _791 = _775;
    float _793 = _791;
    if (_767)
    {
        float _795 = _771 * _787;
        _777 = _795;
    }
    float _797 = _777;
    if (_767)
    {
        float _799 = _797 * 0.15915493667125701904296875;
        _779 = _799;
    }
    float _801 = _779;
    float _803 = _787;
    float _805 = _801;
    if (_767)
    {
        float _807 = _801 * 6.283185482025146484375;
        float _809 = sin(_807);
        _803 = _809;
    }
    float _811 = _803;
    float _813 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _815 = precise::max(0.0, _813);
    float _817 = _741;
    float _819 = _815;
    if (_767)
    {
        float _821 = _801 * 6.283185482025146484375;
        float _823 = cos(_821);
        _817 = _823;
    }
    float _825 = _817;
    float _827 = -_753;
    float _829 = -_815;
    float _831 = fma(_731, _827, _829);
    if (!_767)
    {
        _781 = _757;
    }
    float _833 = _781;
    float _835 = _833;
    if (_767)
    {
        float _837 = _831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _819 = _837;
    }
    float _839 = _819;
    float _841 = _839;
    if (!_767)
    {
        _805 = _759;
    }
    float _843 = _805;
    float _845 = _811;
    float _847 = _843;
    if (_767)
    {
        float _849 = fma(_811, _839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = _851;
    float _855 = _825;
    if (_767)
    {
        float _857 = _825 + (-1.0);
        _841 = _857;
    }
    float _859 = _841;
    float _861 = _859;
    if (_767)
    {
        float _863 = _791 * _851;
        _783 = _863;
    }
    float _865 = _783;
    if (!_767)
    {
        _793 = _755;
    }
    float _867 = _793;
    float _869 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _871 = _867;
    if (_767)
    {
        float _873 = _859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _873;
    }
    float _875 = _861;
    if (_767)
    {
        float _877 = _755 * _865;
        _871 = _877;
    }
    float _879 = _871;
    if (!_767)
    {
        _853 = _831;
    }
    float _881 = _853;
    float _883 = _881;
    if (_767)
    {
        float _885 = _757 * _865;
        _835 = _885;
    }
    float _887 = _835;
    if (_767)
    {
        float _889 = fma(_831, _825, _875);
        _883 = _889;
    }
    float _891 = _883;
    if (_767)
    {
        float _893 = _879 * _879;
        _847 = _893;
    }
    float _895 = _847;
    if (!_767)
    {
        _855 = _761;
    }
    float _897 = _855;
    float _899 = _897;
    if (_767)
    {
        float _901 = _887 * _887;
        _899 = _901;
    }
    float _903 = _899;
    float _905 = fma(_891, _891, _895);
    float _907 = _603 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _909 = floor(_745);
    float _911 = _603 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = _905 + _903;
    float _915 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _907);
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _919 = fma(_751, (*spvDescriptorSet0.vp_c15)._m0[23].w, _917);
    float _921 = precise::clamp(_919, 0.0, 1.0);
    float _923 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _925 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[2].z, _915);
    float _927 = rsqrt(_913);
    float _929 = -_921;
    float _931 = _929 + 1.0;
    float _933 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[3].z, _923);
    float _935 = _925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _939 = _933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _941 = _935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _943 = abs(_931);
    float _945 = log2(_943);
    float _947 = _603 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _949 = -_909;
    float _951 = _745 + _949;
    float _953 = -_941;
    float _955 = fma(_953, _937, 1.0);
    float _957 = _603 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _959 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _947);
    float _961 = _927 * _879;
    float _963 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _957);
    float _965 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _959);
    float _967 = _927 * _891;
    float _969 = _961 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _971 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _973 = _965 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _975 = floor(_869);
    float _977 = -_969;
    float _979 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[21].y, _977);
    float _981 = _971 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _985 = _927 * _887;
    float _987 = _945 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _989 = _973 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[7].x, _983);
    float _993 = -_985;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[21].z, _979);
    float _997 = log2(_955);
    float _999 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _1001 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _991);
    float _1003 = fma(_995, 0.5, 0.5);
    float _1005 = _973 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1007 = _967 + 1.0;
    float _1009 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1001);
    float _1011 = -_975;
    float _1013 = _869 + _1011;
    float _1015 = exp2(_987);
    float _1017 = fma(_995, -0.5, 0.5);
    float _1019 = fma(_1003, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1021 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1005);
    float _1023 = fma(_1003, _1019, -0.212114393711090087890625);
    float _1025 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _999);
    float _1027 = 1.0 / _1009;
    float _1029 = _997 * 0.693147182464599609375;
    float _1031 = fma(_1003, _1023, 1.570728778839111328125);
    float _1033 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1025);
    float2 _3222 = float2(_951, _1013);
    float _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3222, float2(0.0), isnan(_3222)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3222, float2(0.0), isnan(_3222)), level(0.0)).x;
    float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1039 = sqrt(_1017);
    float _1041 = -_967;
    float _1043 = fma(_1015, _1007, _1041);
    float _1045 = fma(_1043, 0.5, 0.5);
    float _1047 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1021);
    float _1049 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1047);
    float _1051 = _1033 * _1027;
    float _1053 = _1039 * 0.636619746685028076171875;
    float _1055 = _1049 * _1027;
    float _1057 = fma(_1051, 0.5, 0.5);
    float _1059 = -_1031;
    float _1061 = fma(_1053, _1059, 1.0);
    float _1063 = fma(_1055, -0.5, 0.5);
    float3 _3275 = float3(_1057, _1063, _1037);
    float _1065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3275, float3(0.0), isnan(_3275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3275, float3(0.0), isnan(_3275)), level(0.0)).x;
    float3 _3286 = float3(_1057, _1063, _1037);
    float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3286, float3(0.0), isnan(_3286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3286, float3(0.0), isnan(_3286)), level(0.0)).xyzw;
    float _1070 = _1068.x;
    float _1072 = _1068.y;
    float _1074 = _1068.z;
    float _1076 = _1068.w;
    float2 _3302 = float2(_1061, _1045);
    float3 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3302, float2(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3302, float2(0.0), isnan(_3302)), level(0.0)).xyz;
    float _1082 = _1080.x;
    float _1084 = _1080.y;
    float _1086 = _1080.z;
    float _1088 = in.m_56.x;
    float _1090 = in.m_56.y;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1094 = _307 + _1092;
    bool _1096 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1098 = isnan(_307);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1104 = _1100 || _1102;
    float _1106 = float(_1104);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1112 = _171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1114;
    float _1118 = _973 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1120 = abs(_615);
    float _1122 = log2(_1120);
    bool _1124 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1126 = isnan(_307);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = -_1106;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1118);
    float _1142 = _1134 * _1138;
    float _1144 = _945 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1146 = 1.0 / _1110;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1150 = _1148 != 0;
    float _1152 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1140);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    bool _1158 = _1088 > 0.5;
    float _1160 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1162 = _1090 > 0.5;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1166 = _1116 * _1146;
    float _1168 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1170 = exp2(_1160);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = fma(_1166, _1094, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = _1174 * _1142;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1186 = -_1134;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1176);
    float _1192 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1178);
    float _1194 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1196 = -_171;
    int _1198 = _1158 ? as_type<int>(_1196) : as_type<int>(_171);
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1182);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1206 = fma(_1170, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1208 = precise::clamp(_1206, 0.0, 1.0);
    bool _1210 = !_1150;
    float _1212 = _1210 ? _171 : as_type<float>(_1198);
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = fma(_1208, -2.0, 3.0);
    float _1222 = _1208 * _1208;
    float _1224 = _1212 + 0.5;
    float _1226 = exp2(_1144);
    out.m_66.x = _1214;
    out.m_66.y = _1216;
    out.m_66.z = _1218;
    out.m_66.w = _1184;
    float _1228 = _1222 * _1220;
    float _1230 = -_175;
    int _1232 = _1162 ? as_type<int>(_1230) : as_type<int>(_175);
    bool _1234 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1236 = isnan(_751);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1242 = _1238 || _1240;
    bool _1244 = !_1156;
    float _1246 = _1244 ? _175 : as_type<float>(_1232);
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1250 = -_1246;
    float _1252 = _1250 + 0.5;
    float _1254 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1256 = -_1228;
    float _1258 = _1256 + 1.0;
    float _1260 = in.m_68.x;
    float _1262 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1200);
    float _1264 = _1254 * _1164;
    float _1266 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1152);
    bool _1268 = _615 <= 8000.0;
    bool _1270 = isnan(_615);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan(8000.0);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1228);
    float _1282 = _1009 * 0.5;
    float _1284 = -_1226;
    float _1286 = _1284 + 1.0;
    float _1288 = _1278 * _1280;
    float _1290 = fma(_1049, -0.5, _1282);
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1294 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1300 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1312 = _1266 + _1009;
    float _1314 = _1033 + _1009;
    out.gl_Position.x = _1033;
    out.gl_Position.y = _1049;
    out.gl_Position.z = _1266;
    out.gl_Position.w = _1009;
    float _1316 = _1300 * _1248;
    float _1318 = _1312 * 0.5;
    float _1320 = _1314 * 0.5;
    out.m_70.x = _1304;
    out.m_70.y = _1306;
    out.m_70.z = _1308;
    out.m_70.w = _1310;
    out.m_72.x = _1264;
    out.m_72.y = _1316;
    out.m_74.x = _1320;
    out.m_74.y = _1290;
    out.m_74.z = _1318;
    out.m_74.w = _1009;
    float _1322 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1324 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1326 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1328 = _669 * _727;
    out.m_76.x = _1322;
    out.m_76.y = _1324;
    out.m_76.z = _1326;
    float _1330 = _1009;
    float _1332 = _1318;
    float _1334 = _1290;
    float _1336 = _1320;
    float _1338 = _1328;
    if (!_1242)
    {
        _1330 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1340 = _1330;
    float _1342 = _1340;
    float _1344 = _1340;
    if (!_1242)
    {
        _1332 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1346 = _1332;
    float _1348 = _1346;
    float _1350 = _1346;
    if (!_1242)
    {
        _1334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1352 = _1334;
    float _1354 = _1352;
    float _1356 = _1352;
    if (!_1242)
    {
        _1336 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1358 = _1336;
    float _1360 = -_1035;
    float _1362 = _1360 + 1.0;
    float _1364 = _1362 * _1294;
    float _1366 = precise::clamp(_1364, 0.0, 1.0);
    float _1368 = -_1366;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1372 = _1370 * _1260;
    float _1374 = _1372 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _1374;
    float _1376 = _1302 * _1065;
    float _1378 = -_1302;
    float _1380 = _1378 + 1.0;
    float _1382 = _1076 * _1376;
    float _1384 = _1086 * _1376;
    float _1386 = _1076 * _1380;
    float _1388 = fma(_1082, _1382, _1070);
    float _1390 = fma(_1084, _1382, _1072);
    float _1392 = fma(_1076, _1384, _1074);
    float _1394 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1396 = _1070;
    float _1398 = _1358;
    float _1400 = _1358;
    if (!_1242)
    {
        _1396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1402 = _1396;
    float _1404 = _1402;
    float _1406 = _1402;
    if (!_1242)
    {
        _1338 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1408 = _1338;
    out.m_80.x = _1388;
    out.m_80.y = _1390;
    out.m_80.z = _1392;
    out.m_80.w = _1386;
    bool _1410 = !_1242;
    float _1412 = _1408;
    float _1414 = _1408;
    if (!_1410)
    {
        bool _1416 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1418 = isnan(_751);
        bool _1420 = _1416 || _1418;
        bool _1422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1424 = _1420 || _1422;
        if (!_1424)
        {
            float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1428 = _751 + _1426;
            float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1430;
            float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1436 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1438 = 1.0 / _1432;
            float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1442 = _1440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1450 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1456 = _1428 * _1438;
            float _1458 = precise::clamp(_1456, 0.0, 1.0);
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1464 = fma(_1458, _1436, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1466 = fma(_1458, _1462, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1468 = fma(_1458, _1442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1470 = fma(_1458, _1446, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1472 = fma(_1458, _1450, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1474 = fma(_1458, _1454, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1344 = _1468;
            _1400 = _1472;
            _1406 = _1464;
            _1356 = _1470;
            _1350 = _1466;
            _1414 = _1474;
            _1476 = true;
        }
        else
        {
            bool _1478 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1480 = isnan(_751);
            bool _1482 = _1478 || _1480;
            bool _1484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1486 = _1482 || _1484;
            if (!_1486)
            {
                _1404 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1488 = _1404;
            _1406 = _1488;
            if (!_1486)
            {
                _1342 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1490 = _1342;
            _1344 = _1490;
            if (!_1486)
            {
                _1348 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1492 = _1348;
            _1350 = _1492;
            if (!_1486)
            {
                _1354 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1494 = _1354;
            _1356 = _1494;
            if (!_1486)
            {
                _1398 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1496 = _1398;
            _1400 = _1496;
            if (!_1486)
            {
                _1412 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1498 = _1412;
            bool _1500 = !_1486;
            _1414 = _1498;
            if (!_1500)
            {
                bool _1502 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1504 = isnan(_751);
                bool _1506 = _1502 || _1504;
                bool _1508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1510 = _1506 || _1508;
                if (!_1510)
                {
                    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1514 = _751 + _1512;
                    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1516;
                    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1522 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1524 = 1.0 / _1518;
                    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1528 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1532 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1540 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1542 = _1514 * _1524;
                    float _1544 = precise::clamp(_1542, 0.0, 1.0);
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1550 = fma(_1544, _1522, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1552 = fma(_1544, _1548, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1554 = fma(_1544, _1528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1556 = fma(_1544, _1532, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1558 = fma(_1544, _1536, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1560 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1344 = _1554;
                    _1400 = _1558;
                    _1406 = _1550;
                    _1356 = _1556;
                    _1350 = _1552;
                    _1414 = _1560;
                    _1476 = true;
                }
                else
                {
                    _1344 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1400 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1406 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1356 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1350 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1414 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1476 = false;
    float _1562 = _1344;
    float _1564 = _1400;
    float _1566 = _1406;
    float _1568 = _1356;
    float _1570 = _1350;
    float _1572 = _1414;
    float _1574 = fma(_1324, -0.5, 0.5);
    float _1576 = precise::clamp(_1574, 0.0, 1.0);
    float _1578 = -_1562;
    float _1580 = _1578 + _1564;
    float _1582 = _1394 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1584 = -_1566;
    float _1586 = _1584 + _1568;
    out.m_82.x = 0.0;
    float _1588 = fma(_1576, _1580, _1562);
    float _1590 = fma(_1576, _1586, _1566);
    out.m_49.x = _1582;
    float _1592 = -_1570;
    float _1594 = _1592 + _1572;
    float _1596 = _1588 * 0.586610972881317138671875;
    bool _1598 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1600 = fma(_1576, _1594, _1570);
    float _1602 = fma(_1590, 0.298911988735198974609375, _1596);
    bool _1604 = _669 > 0.0;
    bool _1606 = isnan(_669);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(0.0);
    bool _1612 = _1608 || _1610;
    float _1614 = fma(_1600, 0.114477999508380889892578125, _1602);
    bool _1616 = _727 <= 0.0;
    bool _1618 = !_1612;
    bool _1620 = _1616 || _1618;
    float _1622 = -_1614;
    float _1624 = _1590 + _1622;
    float _1626 = -_1614;
    float _1628 = _1588 + _1626;
    float _1630 = -_1614;
    float _1632 = _1600 + _1630;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    float _1636 = fma(_1628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    float _1638 = fma(_1632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    bool _1640 = !_1598;
    if (!_1640)
    {
        float _1642 = -_603;
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1646 = -_605;
        float _1648 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1650 = -_607;
        float _1652 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1654 = _1644 * _1644;
        float _1656 = fma(_1648, _1648, _1654);
        float _1658 = fma(_1652, _1652, _1656);
        float _1660 = sqrt(_1658);
        float _1662 = rsqrt(_1658);
        float _1664 = -_1660;
        float _1666 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1668 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1670 = precise::clamp(_1668, 0.0, 1.0);
        float _1672 = _1648 * _1662;
        float _1674 = _1644 * _1662;
        float _1676 = abs(_1670);
        float _1678 = log2(_1676);
        float _1680 = _1652 * _1662;
        float _1682 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1684 = _1324 * _1674;
        float _1686 = -_1674;
        float _1688 = -_1682;
        float _1690 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1688);
        float _1692 = fma(_1322, _1672, _1684);
        float _1694 = -_1680;
        float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1690);
        float _1698 = fma(_1326, _1680, _1692);
        float _1700 = precise::clamp(_1698, 0.0, 1.0);
        float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1704 = _1696 + _1702;
        float _1706 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1708 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1710 = precise::clamp(_1708, 0.0, 1.0);
        float _1712 = exp2(_1706);
        float _1714 = _1712 * _1710;
        float _1716 = _1700 * _1714;
        float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1722 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _1718;
        out.m_82.y = _1720;
        out.m_82.z = _1722;
    }
    out.m_84.x = _1634;
    out.m_84.y = _1636;
    out.m_84.z = _1638;
    if (!_1620)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1724;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1476 = false;
    bool _299 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_119);
        out.gl_Position.z = _1781;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    if (_133)
    {
        float _141 = float(_103);
        _139 = _141;
    }
    float _143 = _139;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    if (_149)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _113;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _121 = as_type<int>(_153);
    }
    int _155 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1849 = as_type<float>(_155);
        out.gl_Position.z = _1849;
    }
    if (_149)
    {
        return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_157) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_157) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_159;
    float _195;
    if (!_177)
    {
        float _179 = in.m_56.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_103);
        float _201 = 1.0 / _199;
        float _203 = _137 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _243;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _225;
    float _251 = _241 * _229;
    float _253 = -_241;
    float _255 = _253 + 1.0;
    float _257 = _209 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _259;
    float _263 = fma(_245, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_261, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = _263 * _251;
    float _269 = _265 * _251;
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_247;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_103);
        float _303 = 1.0 / _301;
        float _305 = _137 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = in.m_46.z;
    bool _315 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _317 = isnan(0.5);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _323 = _319 || _321;
    float _325 = in.m_58.x;
    float _327 = in.m_58.y;
    float _329 = in.m_58.z;
    float _331 = in.m_58.w;
    bool _333 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _335 = isnan(0.5);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _341 = _337 || _339;
    float _343 = in.m_60.x;
    float _345 = in.m_60.y;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = in.m_62.z;
    float _353 = in.m_62.w;
    float _355 = in.m_64.x;
    float _357 = in.m_64.y;
    float _359 = in.m_64.z;
    float _361 = in.m_64.w;
    float _363 = _311 * _327;
    float _365 = _277 * _345;
    float _367 = fma(_309, _325, _363);
    float _369 = _275 * _343;
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _373 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _375 = _311 * _349;
    float _377 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _379 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _381 = _311 * _357;
    float _383 = _373 * _371;
    float _385 = fma(_309, _347, _375);
    float _387 = _379 * _377;
    float _389 = fma(_309, _355, _381);
    float _391 = _383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _393 = fma(_313, _351, _385);
    float _395 = _383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _397 = fma(_313, _359, _389);
    float _399 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[26].x, _391);
    float _403 = fma(_313, _329, _367);
    float _405 = _397 + _361;
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[24].x, _395);
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[26].z, _401);
    float _411 = _393 + _353;
    float _413 = _405 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _415 = _403 + _331;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[24].z, _407);
    float _419 = _409 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[11].x, _413);
    float _423 = _417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _425 = _415 + _419;
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _421);
    float _429 = _405 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _431 = _411 + _423;
    float _433 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _435 = _425 + _433;
    float _437 = _427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _439 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[10].x, _429);
    float _441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _443 = _431 + _441;
    float _445 = _435 * _435;
    float _447 = 1.0 / _437;
    float _449 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _439);
    float _451 = fma(_443, _443, _445);
    float _453 = _383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _449 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _457 = sqrt(_451);
    float _459 = _455 + _437;
    float _461 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _463 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[25].z, _461);
    float _465 = _459 * _447;
    float _467 = _465 * 0.5;
    float _469 = _463 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _471);
    float _475 = _405 + _469;
    bool _477 = _457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _479 = 1.0 / _473;
    float _481 = _355;
    float _483 = _425;
    float _485 = _431;
    float _487 = _397;
    float _489 = _473;
    float _491 = _405;
    if (!_477)
    {
        _481 = _475;
    }
    float _493 = _481;
    bool _495 = !_477;
    float _497 = _493;
    if (!_495)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _503 = _457 + _501;
        float _505 = _475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _507 = rsqrt(_451);
        float _509 = _503 * _499;
        float _511 = _509 * 0.15915493667125701904296875;
        float _513 = _511 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _511 * 6.283185482025146484375;
        float _519 = sin(_517);
        float _521 = _515 + (-1.0);
        float _523 = _521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _525 = fma(_519, _505, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _527 = fma(_475, _515, _523);
        float _529 = _507 * _525;
        float _531 = fma(_443, _529, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _533 = fma(_435, _529, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _497 = _527;
        _483 = _533;
        _485 = _531;
    }
    float _535 = _497;
    float _537 = _483;
    float _539 = _485;
    float _541 = _535;
    float _543 = _539;
    float _545 = _537;
    if (_341)
    {
        _487 = 1.0;
    }
    float _547 = _487;
    float _549 = _547;
    if (!_323)
    {
        float _551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _553 = _405 + _551;
        float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _557 = _411 + _555;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _561 = -_405;
        float _563 = _561 + _535;
        float _565 = _553 * _553;
        float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _569 = _415 + _567;
        float _571 = fma(_557, _557, _565);
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _575 = fma(_569, _569, _571);
        float _577 = sqrt(_575);
        float _579 = _559 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _581 = precise::min(_577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _583 = _581 * _573;
        float _585 = -_415;
        float _587 = _585 + _537;
        float _589 = _579 * _583;
        float _591 = -_411;
        float _593 = _591 + _539;
        float _595 = fma(_563, _589, _405);
        float _597 = fma(_593, _589, _411);
        float _599 = fma(_587, _589, _415);
        _489 = _587;
        _541 = _595;
        _543 = _597;
        _545 = _599;
    }
    float _601 = _489;
    float _603 = _541;
    float _605 = _543;
    float _607 = _545;
    float _609 = _601;
    if (_341)
    {
        _491 = 1.0;
    }
    float _611 = _491;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _615 = _479 * _613;
    float _617 = _611;
    if (!_341)
    {
        float _619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _621 = _619 * 0.15915493667125701904296875;
        float _623 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _625 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _627 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _625;
        float _629 = _621 * 6.283185482025146484375;
        float _631 = cos(_629);
        float _633 = _623 * 0.15915493667125701904296875;
        float _635 = _621 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = 1.0 / _631;
        float _641 = _633 * 6.283185482025146484375;
        float _643 = cos(_641);
        float _645 = _637 * _639;
        float _647 = _633 * 6.283185482025146484375;
        float _649 = sin(_647);
        float _651 = _643 * _645;
        float _653 = 1.0 / _627;
        float _655 = 1.0 / _651;
        float _657 = _649 * _655;
        float _659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _661 = fma(_615, _657, _659);
        float _663 = _661 * _653;
        float _665 = precise::clamp(_663, 0.0, 1.0);
        _609 = _645;
        _549 = _665;
    }
    float _667 = _609;
    float _669 = _549;
    float _671 = _667;
    if (!_341)
    {
        float _673 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _675 = _673 * 0.15915493667125701904296875;
        float _677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _679 = _675 * 6.283185482025146484375;
        float _681 = cos(_679);
        float _683 = _677 * 0.15915493667125701904296875;
        float _685 = _675 * 6.283185482025146484375;
        float _687 = sin(_685);
        float _689 = 1.0 / _681;
        float _691 = _683 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = _687 * _689;
        float _697 = _683 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = _693 * _695;
        float _703 = 1.0 / _701;
        float _705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _705;
        float _709 = 1.0 / _707;
        float _711 = _699 * _703;
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _715 = fma(_615, _711, _713);
        float _717 = _715 * _709;
        float _719 = precise::clamp(_717, 0.0, 1.0);
        float _721 = -_719;
        float _723 = _721 + 1.0;
        _671 = _689;
        _617 = _723;
    }
    float _725 = _671;
    float _727 = _617;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _603 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _605 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _607 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _747 = fma(_739, _739, _743);
    float _749 = rsqrt(_747);
    float _751 = sqrt(_747);
    float _753 = _749 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _755 = _735 * _753;
    float _757 = _739 * _753;
    float _759 = _755 * _755;
    float _761 = _757 * _757;
    float _763 = _759 + _761;
    float _765 = sqrt(_763);
    bool _767 = _765 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _771 = _765 + _769;
    float _773 = _739;
    float _775 = _749;
    float _777 = _771;
    float _779 = _725;
    float _781 = _731;
    float _783 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_767)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _785;
    }
    float _787 = _773;
    if (_767)
    {
        float _789 = rsqrt(_763);
        _775 = _789;
    }
    float _791 = _775;
    float _793 = _791;
    if (_767)
    {
        float _795 = _771 * _787;
        _777 = _795;
    }
    float _797 = _777;
    if (_767)
    {
        float _799 = _797 * 0.15915493667125701904296875;
        _779 = _799;
    }
    float _801 = _779;
    float _803 = _787;
    float _805 = _801;
    if (_767)
    {
        float _807 = _801 * 6.283185482025146484375;
        float _809 = sin(_807);
        _803 = _809;
    }
    float _811 = _803;
    float _813 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _815 = precise::max(0.0, _813);
    float _817 = _741;
    float _819 = _815;
    if (_767)
    {
        float _821 = _801 * 6.283185482025146484375;
        float _823 = cos(_821);
        _817 = _823;
    }
    float _825 = _817;
    float _827 = -_753;
    float _829 = -_815;
    float _831 = fma(_731, _827, _829);
    if (!_767)
    {
        _781 = _757;
    }
    float _833 = _781;
    float _835 = _833;
    if (_767)
    {
        float _837 = _831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _819 = _837;
    }
    float _839 = _819;
    float _841 = _839;
    if (!_767)
    {
        _805 = _759;
    }
    float _843 = _805;
    float _845 = _811;
    float _847 = _843;
    if (_767)
    {
        float _849 = fma(_811, _839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = _851;
    float _855 = _825;
    if (_767)
    {
        float _857 = _825 + (-1.0);
        _841 = _857;
    }
    float _859 = _841;
    float _861 = _859;
    if (_767)
    {
        float _863 = _791 * _851;
        _783 = _863;
    }
    float _865 = _783;
    if (!_767)
    {
        _793 = _755;
    }
    float _867 = _793;
    float _869 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _871 = _867;
    if (_767)
    {
        float _873 = _859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _873;
    }
    float _875 = _861;
    if (_767)
    {
        float _877 = _755 * _865;
        _871 = _877;
    }
    float _879 = _871;
    if (!_767)
    {
        _853 = _831;
    }
    float _881 = _853;
    float _883 = _881;
    if (_767)
    {
        float _885 = _757 * _865;
        _835 = _885;
    }
    float _887 = _835;
    if (_767)
    {
        float _889 = fma(_831, _825, _875);
        _883 = _889;
    }
    float _891 = _883;
    if (_767)
    {
        float _893 = _879 * _879;
        _847 = _893;
    }
    float _895 = _847;
    if (!_767)
    {
        _855 = _761;
    }
    float _897 = _855;
    float _899 = _897;
    if (_767)
    {
        float _901 = _887 * _887;
        _899 = _901;
    }
    float _903 = _899;
    float _905 = fma(_891, _891, _895);
    float _907 = _603 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _909 = floor(_745);
    float _911 = _603 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = _905 + _903;
    float _915 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _907);
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _919 = fma(_751, (*spvDescriptorSet0.vp_c15)._m0[23].w, _917);
    float _921 = precise::clamp(_919, 0.0, 1.0);
    float _923 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _925 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[2].z, _915);
    float _927 = rsqrt(_913);
    float _929 = -_921;
    float _931 = _929 + 1.0;
    float _933 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[3].z, _923);
    float _935 = _925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _939 = _933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _941 = _935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _943 = abs(_931);
    float _945 = log2(_943);
    float _947 = _603 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _949 = -_909;
    float _951 = _745 + _949;
    float _953 = -_941;
    float _955 = fma(_953, _937, 1.0);
    float _957 = _603 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _959 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _947);
    float _961 = _927 * _879;
    float _963 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _957);
    float _965 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _959);
    float _967 = _927 * _891;
    float _969 = _961 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _971 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _973 = _965 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _975 = floor(_869);
    float _977 = -_969;
    float _979 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[21].y, _977);
    float _981 = _971 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _985 = _927 * _887;
    float _987 = _945 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _989 = _973 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[7].x, _983);
    float _993 = -_985;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[21].z, _979);
    float _997 = log2(_955);
    float _999 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _1001 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _991);
    float _1003 = fma(_995, 0.5, 0.5);
    float _1005 = _973 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1007 = _967 + 1.0;
    float _1009 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1001);
    float _1011 = -_975;
    float _1013 = _869 + _1011;
    float _1015 = exp2(_987);
    float _1017 = fma(_995, -0.5, 0.5);
    float _1019 = fma(_1003, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1021 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1005);
    float _1023 = fma(_1003, _1019, -0.212114393711090087890625);
    float _1025 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _999);
    float _1027 = 1.0 / _1009;
    float _1029 = _997 * 0.693147182464599609375;
    float _1031 = fma(_1003, _1023, 1.570728778839111328125);
    float _1033 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1025);
    float2 _3222 = float2(_951, _1013);
    float _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3222, float2(0.0), isnan(_3222)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3222, float2(0.0), isnan(_3222)), level(0.0)).x;
    float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1039 = sqrt(_1017);
    float _1041 = -_967;
    float _1043 = fma(_1015, _1007, _1041);
    float _1045 = fma(_1043, 0.5, 0.5);
    float _1047 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1021);
    float _1049 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1047);
    float _1051 = _1033 * _1027;
    float _1053 = _1039 * 0.636619746685028076171875;
    float _1055 = _1049 * _1027;
    float _1057 = fma(_1051, 0.5, 0.5);
    float _1059 = -_1031;
    float _1061 = fma(_1053, _1059, 1.0);
    float _1063 = fma(_1055, -0.5, 0.5);
    float3 _3275 = float3(_1057, _1063, _1037);
    float _1065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3275, float3(0.0), isnan(_3275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3275, float3(0.0), isnan(_3275)), level(0.0)).x;
    float3 _3286 = float3(_1057, _1063, _1037);
    float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3286, float3(0.0), isnan(_3286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3286, float3(0.0), isnan(_3286)), level(0.0)).xyzw;
    float _1070 = _1068.x;
    float _1072 = _1068.y;
    float _1074 = _1068.z;
    float _1076 = _1068.w;
    float2 _3302 = float2(_1061, _1045);
    float3 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3302, float2(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3302, float2(0.0), isnan(_3302)), level(0.0)).xyz;
    float _1082 = _1080.x;
    float _1084 = _1080.y;
    float _1086 = _1080.z;
    float _1088 = in.m_56.x;
    float _1090 = in.m_56.y;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1094 = _307 + _1092;
    bool _1096 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1098 = isnan(_307);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1104 = _1100 || _1102;
    float _1106 = float(_1104);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1112 = _171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1114;
    float _1118 = _973 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1120 = abs(_615);
    float _1122 = log2(_1120);
    bool _1124 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1126 = isnan(_307);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = -_1106;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1118);
    float _1142 = _1134 * _1138;
    float _1144 = _945 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1146 = 1.0 / _1110;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1150 = _1148 != 0;
    float _1152 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1140);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    bool _1158 = _1088 > 0.5;
    float _1160 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1162 = _1090 > 0.5;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1166 = _1116 * _1146;
    float _1168 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1170 = exp2(_1160);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = fma(_1166, _1094, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = _1174 * _1142;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1186 = -_1134;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1176);
    float _1192 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1178);
    float _1194 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1196 = -_171;
    int _1198 = _1158 ? as_type<int>(_1196) : as_type<int>(_171);
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1182);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1206 = fma(_1170, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1208 = precise::clamp(_1206, 0.0, 1.0);
    bool _1210 = !_1150;
    float _1212 = _1210 ? _171 : as_type<float>(_1198);
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = fma(_1208, -2.0, 3.0);
    float _1222 = _1208 * _1208;
    float _1224 = _1212 + 0.5;
    float _1226 = exp2(_1144);
    out.m_66.x = _1214;
    out.m_66.y = _1216;
    out.m_66.z = _1218;
    out.m_66.w = _1184;
    float _1228 = _1222 * _1220;
    float _1230 = -_175;
    int _1232 = _1162 ? as_type<int>(_1230) : as_type<int>(_175);
    bool _1234 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1236 = isnan(_751);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1242 = _1238 || _1240;
    bool _1244 = !_1156;
    float _1246 = _1244 ? _175 : as_type<float>(_1232);
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1250 = -_1246;
    float _1252 = _1250 + 0.5;
    float _1254 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1256 = -_1228;
    float _1258 = _1256 + 1.0;
    float _1260 = in.m_68.x;
    float _1262 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1200);
    float _1264 = _1254 * _1164;
    float _1266 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1152);
    bool _1268 = _615 <= 8000.0;
    bool _1270 = isnan(_615);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan(8000.0);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1228);
    float _1282 = _1009 * 0.5;
    float _1284 = -_1226;
    float _1286 = _1284 + 1.0;
    float _1288 = _1278 * _1280;
    float _1290 = fma(_1049, -0.5, _1282);
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1294 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1300 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1312 = _1266 + _1009;
    float _1314 = _1033 + _1009;
    out.gl_Position.x = _1033;
    out.gl_Position.y = _1049;
    out.gl_Position.z = _1266;
    out.gl_Position.w = _1009;
    float _1316 = _1300 * _1248;
    float _1318 = _1312 * 0.5;
    float _1320 = _1314 * 0.5;
    out.m_70.x = _1304;
    out.m_70.y = _1306;
    out.m_70.z = _1308;
    out.m_70.w = _1310;
    out.m_72.x = _1264;
    out.m_72.y = _1316;
    out.m_74.x = _1320;
    out.m_74.y = _1290;
    out.m_74.z = _1318;
    out.m_74.w = _1009;
    float _1322 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1324 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1326 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1328 = _669 * _727;
    out.m_76.x = _1322;
    out.m_76.y = _1324;
    out.m_76.z = _1326;
    float _1330 = _1009;
    float _1332 = _1318;
    float _1334 = _1290;
    float _1336 = _1320;
    float _1338 = _1328;
    if (!_1242)
    {
        _1330 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1340 = _1330;
    float _1342 = _1340;
    float _1344 = _1340;
    if (!_1242)
    {
        _1332 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1346 = _1332;
    float _1348 = _1346;
    float _1350 = _1346;
    if (!_1242)
    {
        _1334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1352 = _1334;
    float _1354 = _1352;
    float _1356 = _1352;
    if (!_1242)
    {
        _1336 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1358 = _1336;
    float _1360 = -_1035;
    float _1362 = _1360 + 1.0;
    float _1364 = _1362 * _1294;
    float _1366 = precise::clamp(_1364, 0.0, 1.0);
    float _1368 = -_1366;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1372 = _1370 * _1260;
    float _1374 = _1372 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _1374;
    float _1376 = _1302 * _1065;
    float _1378 = -_1302;
    float _1380 = _1378 + 1.0;
    float _1382 = _1076 * _1376;
    float _1384 = _1086 * _1376;
    float _1386 = _1076 * _1380;
    float _1388 = fma(_1082, _1382, _1070);
    float _1390 = fma(_1084, _1382, _1072);
    float _1392 = fma(_1076, _1384, _1074);
    float _1394 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1396 = _1070;
    float _1398 = _1358;
    float _1400 = _1358;
    if (!_1242)
    {
        _1396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1402 = _1396;
    float _1404 = _1402;
    float _1406 = _1402;
    if (!_1242)
    {
        _1338 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1408 = _1338;
    out.m_80.x = _1388;
    out.m_80.y = _1390;
    out.m_80.z = _1392;
    out.m_80.w = _1386;
    bool _1410 = !_1242;
    float _1412 = _1408;
    float _1414 = _1408;
    if (!_1410)
    {
        bool _1416 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1418 = isnan(_751);
        bool _1420 = _1416 || _1418;
        bool _1422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1424 = _1420 || _1422;
        if (!_1424)
        {
            float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1428 = _751 + _1426;
            float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1430;
            float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1436 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1438 = 1.0 / _1432;
            float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1442 = _1440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1450 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1456 = _1428 * _1438;
            float _1458 = precise::clamp(_1456, 0.0, 1.0);
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1464 = fma(_1458, _1436, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1466 = fma(_1458, _1462, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1468 = fma(_1458, _1442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1470 = fma(_1458, _1446, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1472 = fma(_1458, _1450, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1474 = fma(_1458, _1454, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1344 = _1468;
            _1400 = _1472;
            _1406 = _1464;
            _1356 = _1470;
            _1350 = _1466;
            _1414 = _1474;
            _1476 = true;
        }
        else
        {
            bool _1478 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1480 = isnan(_751);
            bool _1482 = _1478 || _1480;
            bool _1484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1486 = _1482 || _1484;
            if (!_1486)
            {
                _1404 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1488 = _1404;
            _1406 = _1488;
            if (!_1486)
            {
                _1342 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1490 = _1342;
            _1344 = _1490;
            if (!_1486)
            {
                _1348 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1492 = _1348;
            _1350 = _1492;
            if (!_1486)
            {
                _1354 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1494 = _1354;
            _1356 = _1494;
            if (!_1486)
            {
                _1398 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1496 = _1398;
            _1400 = _1496;
            if (!_1486)
            {
                _1412 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1498 = _1412;
            bool _1500 = !_1486;
            _1414 = _1498;
            if (!_1500)
            {
                bool _1502 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1504 = isnan(_751);
                bool _1506 = _1502 || _1504;
                bool _1508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1510 = _1506 || _1508;
                if (!_1510)
                {
                    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1514 = _751 + _1512;
                    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1516;
                    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1522 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1524 = 1.0 / _1518;
                    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1528 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1532 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1540 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1542 = _1514 * _1524;
                    float _1544 = precise::clamp(_1542, 0.0, 1.0);
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1550 = fma(_1544, _1522, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1552 = fma(_1544, _1548, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1554 = fma(_1544, _1528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1556 = fma(_1544, _1532, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1558 = fma(_1544, _1536, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1560 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1344 = _1554;
                    _1400 = _1558;
                    _1406 = _1550;
                    _1356 = _1556;
                    _1350 = _1552;
                    _1414 = _1560;
                    _1476 = true;
                }
                else
                {
                    _1344 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1400 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1406 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1356 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1350 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1414 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1476 = false;
    float _1562 = _1344;
    float _1564 = _1400;
    float _1566 = _1406;
    float _1568 = _1356;
    float _1570 = _1350;
    float _1572 = _1414;
    float _1574 = fma(_1324, -0.5, 0.5);
    float _1576 = precise::clamp(_1574, 0.0, 1.0);
    float _1578 = -_1562;
    float _1580 = _1578 + _1564;
    float _1582 = _1394 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1584 = -_1566;
    float _1586 = _1584 + _1568;
    out.m_82.x = 0.0;
    float _1588 = fma(_1576, _1580, _1562);
    float _1590 = fma(_1576, _1586, _1566);
    out.m_49.x = _1582;
    float _1592 = -_1570;
    float _1594 = _1592 + _1572;
    float _1596 = _1588 * 0.586610972881317138671875;
    bool _1598 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1600 = fma(_1576, _1594, _1570);
    float _1602 = fma(_1590, 0.298911988735198974609375, _1596);
    bool _1604 = _669 > 0.0;
    bool _1606 = isnan(_669);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(0.0);
    bool _1612 = _1608 || _1610;
    float _1614 = fma(_1600, 0.114477999508380889892578125, _1602);
    bool _1616 = _727 <= 0.0;
    bool _1618 = !_1612;
    bool _1620 = _1616 || _1618;
    float _1622 = -_1614;
    float _1624 = _1590 + _1622;
    float _1626 = -_1614;
    float _1628 = _1588 + _1626;
    float _1630 = -_1614;
    float _1632 = _1600 + _1630;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    float _1636 = fma(_1628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    float _1638 = fma(_1632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    bool _1640 = !_1598;
    if (!_1640)
    {
        float _1642 = -_603;
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1646 = -_605;
        float _1648 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1650 = -_607;
        float _1652 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1654 = _1644 * _1644;
        float _1656 = fma(_1648, _1648, _1654);
        float _1658 = fma(_1652, _1652, _1656);
        float _1660 = sqrt(_1658);
        float _1662 = rsqrt(_1658);
        float _1664 = -_1660;
        float _1666 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1668 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1670 = precise::clamp(_1668, 0.0, 1.0);
        float _1672 = _1648 * _1662;
        float _1674 = _1644 * _1662;
        float _1676 = abs(_1670);
        float _1678 = log2(_1676);
        float _1680 = _1652 * _1662;
        float _1682 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1684 = _1324 * _1674;
        float _1686 = -_1674;
        float _1688 = -_1682;
        float _1690 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1688);
        float _1692 = fma(_1322, _1672, _1684);
        float _1694 = -_1680;
        float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1690);
        float _1698 = fma(_1326, _1680, _1692);
        float _1700 = precise::clamp(_1698, 0.0, 1.0);
        float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1704 = _1696 + _1702;
        float _1706 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1708 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1710 = precise::clamp(_1708, 0.0, 1.0);
        float _1712 = exp2(_1706);
        float _1714 = _1712 * _1710;
        float _1716 = _1700 * _1714;
        float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1722 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _1718;
        out.m_82.y = _1720;
        out.m_82.z = _1722;
    }
    out.m_84.x = _1634;
    out.m_84.y = _1636;
    out.m_84.z = _1638;
    if (!_1620)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1724;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1476 = false;
    bool _299 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_119);
        out.gl_Position.z = _1781;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    if (_133)
    {
        float _141 = float(_103);
        _139 = _141;
    }
    float _143 = _139;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    if (_149)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _113;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _121 = as_type<int>(_153);
    }
    int _155 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1849 = as_type<float>(_155);
        out.gl_Position.z = _1849;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_157) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_157) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_159;
    float _195;
    if (!_177)
    {
        float _179 = in.m_56.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_103);
        float _201 = 1.0 / _199;
        float _203 = _137 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _243;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _225;
    float _251 = _241 * _229;
    float _253 = -_241;
    float _255 = _253 + 1.0;
    float _257 = _209 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _259;
    float _263 = fma(_245, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_261, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = _263 * _251;
    float _269 = _265 * _251;
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_247;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_103);
        float _303 = 1.0 / _301;
        float _305 = _137 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = in.m_46.z;
    bool _315 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _317 = isnan(0.5);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _323 = _319 || _321;
    float _325 = in.m_58.x;
    float _327 = in.m_58.y;
    float _329 = in.m_58.z;
    float _331 = in.m_58.w;
    bool _333 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _335 = isnan(0.5);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _341 = _337 || _339;
    float _343 = in.m_60.x;
    float _345 = in.m_60.y;
    float _347 = in.m_62.x;
    float _349 = in.m_62.y;
    float _351 = in.m_62.z;
    float _353 = in.m_62.w;
    float _355 = in.m_64.x;
    float _357 = in.m_64.y;
    float _359 = in.m_64.z;
    float _361 = in.m_64.w;
    float _363 = _311 * _327;
    float _365 = _277 * _345;
    float _367 = fma(_309, _325, _363);
    float _369 = _275 * _343;
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _373 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _375 = _311 * _349;
    float _377 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _379 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _381 = _311 * _357;
    float _383 = _373 * _371;
    float _385 = fma(_309, _347, _375);
    float _387 = _379 * _377;
    float _389 = fma(_309, _355, _381);
    float _391 = _383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _393 = fma(_313, _351, _385);
    float _395 = _383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _397 = fma(_313, _359, _389);
    float _399 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[26].x, _391);
    float _403 = fma(_313, _329, _367);
    float _405 = _397 + _361;
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[24].x, _395);
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[26].z, _401);
    float _411 = _393 + _353;
    float _413 = _405 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _415 = _403 + _331;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[24].z, _407);
    float _419 = _409 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[11].x, _413);
    float _423 = _417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _425 = _415 + _419;
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _421);
    float _429 = _405 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _431 = _411 + _423;
    float _433 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _435 = _425 + _433;
    float _437 = _427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _439 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[10].x, _429);
    float _441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _443 = _431 + _441;
    float _445 = _435 * _435;
    float _447 = 1.0 / _437;
    float _449 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _439);
    float _451 = fma(_443, _443, _445);
    float _453 = _383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _449 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _457 = sqrt(_451);
    float _459 = _455 + _437;
    float _461 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _463 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[25].z, _461);
    float _465 = _459 * _447;
    float _467 = _465 * 0.5;
    float _469 = _463 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _471);
    float _475 = _405 + _469;
    bool _477 = _457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _479 = 1.0 / _473;
    float _481 = _355;
    float _483 = _425;
    float _485 = _431;
    float _487 = _397;
    float _489 = _473;
    float _491 = _405;
    if (!_477)
    {
        _481 = _475;
    }
    float _493 = _481;
    bool _495 = !_477;
    float _497 = _493;
    if (!_495)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _503 = _457 + _501;
        float _505 = _475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _507 = rsqrt(_451);
        float _509 = _503 * _499;
        float _511 = _509 * 0.15915493667125701904296875;
        float _513 = _511 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _511 * 6.283185482025146484375;
        float _519 = sin(_517);
        float _521 = _515 + (-1.0);
        float _523 = _521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _525 = fma(_519, _505, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _527 = fma(_475, _515, _523);
        float _529 = _507 * _525;
        float _531 = fma(_443, _529, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _533 = fma(_435, _529, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _497 = _527;
        _483 = _533;
        _485 = _531;
    }
    float _535 = _497;
    float _537 = _483;
    float _539 = _485;
    float _541 = _535;
    float _543 = _539;
    float _545 = _537;
    if (_341)
    {
        _487 = 1.0;
    }
    float _547 = _487;
    float _549 = _547;
    if (!_323)
    {
        float _551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _553 = _405 + _551;
        float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _557 = _411 + _555;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _561 = -_405;
        float _563 = _561 + _535;
        float _565 = _553 * _553;
        float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _569 = _415 + _567;
        float _571 = fma(_557, _557, _565);
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _575 = fma(_569, _569, _571);
        float _577 = sqrt(_575);
        float _579 = _559 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _581 = precise::min(_577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _583 = _581 * _573;
        float _585 = -_415;
        float _587 = _585 + _537;
        float _589 = _579 * _583;
        float _591 = -_411;
        float _593 = _591 + _539;
        float _595 = fma(_563, _589, _405);
        float _597 = fma(_593, _589, _411);
        float _599 = fma(_587, _589, _415);
        _489 = _587;
        _541 = _595;
        _543 = _597;
        _545 = _599;
    }
    float _601 = _489;
    float _603 = _541;
    float _605 = _543;
    float _607 = _545;
    float _609 = _601;
    if (_341)
    {
        _491 = 1.0;
    }
    float _611 = _491;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _615 = _479 * _613;
    float _617 = _611;
    if (!_341)
    {
        float _619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _621 = _619 * 0.15915493667125701904296875;
        float _623 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _625 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _627 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _625;
        float _629 = _621 * 6.283185482025146484375;
        float _631 = cos(_629);
        float _633 = _623 * 0.15915493667125701904296875;
        float _635 = _621 * 6.283185482025146484375;
        float _637 = sin(_635);
        float _639 = 1.0 / _631;
        float _641 = _633 * 6.283185482025146484375;
        float _643 = cos(_641);
        float _645 = _637 * _639;
        float _647 = _633 * 6.283185482025146484375;
        float _649 = sin(_647);
        float _651 = _643 * _645;
        float _653 = 1.0 / _627;
        float _655 = 1.0 / _651;
        float _657 = _649 * _655;
        float _659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _661 = fma(_615, _657, _659);
        float _663 = _661 * _653;
        float _665 = precise::clamp(_663, 0.0, 1.0);
        _609 = _645;
        _549 = _665;
    }
    float _667 = _609;
    float _669 = _549;
    float _671 = _667;
    if (!_341)
    {
        float _673 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _675 = _673 * 0.15915493667125701904296875;
        float _677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _679 = _675 * 6.283185482025146484375;
        float _681 = cos(_679);
        float _683 = _677 * 0.15915493667125701904296875;
        float _685 = _675 * 6.283185482025146484375;
        float _687 = sin(_685);
        float _689 = 1.0 / _681;
        float _691 = _683 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = _687 * _689;
        float _697 = _683 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = _693 * _695;
        float _703 = 1.0 / _701;
        float _705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _705;
        float _709 = 1.0 / _707;
        float _711 = _699 * _703;
        float _713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _715 = fma(_615, _711, _713);
        float _717 = _715 * _709;
        float _719 = precise::clamp(_717, 0.0, 1.0);
        float _721 = -_719;
        float _723 = _721 + 1.0;
        _671 = _689;
        _617 = _723;
    }
    float _725 = _671;
    float _727 = _617;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _603 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _605 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _607 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _747 = fma(_739, _739, _743);
    float _749 = rsqrt(_747);
    float _751 = sqrt(_747);
    float _753 = _749 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _755 = _735 * _753;
    float _757 = _739 * _753;
    float _759 = _755 * _755;
    float _761 = _757 * _757;
    float _763 = _759 + _761;
    float _765 = sqrt(_763);
    bool _767 = _765 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _771 = _765 + _769;
    float _773 = _739;
    float _775 = _749;
    float _777 = _771;
    float _779 = _725;
    float _781 = _731;
    float _783 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_767)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _785;
    }
    float _787 = _773;
    if (_767)
    {
        float _789 = rsqrt(_763);
        _775 = _789;
    }
    float _791 = _775;
    float _793 = _791;
    if (_767)
    {
        float _795 = _771 * _787;
        _777 = _795;
    }
    float _797 = _777;
    if (_767)
    {
        float _799 = _797 * 0.15915493667125701904296875;
        _779 = _799;
    }
    float _801 = _779;
    float _803 = _787;
    float _805 = _801;
    if (_767)
    {
        float _807 = _801 * 6.283185482025146484375;
        float _809 = sin(_807);
        _803 = _809;
    }
    float _811 = _803;
    float _813 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _815 = precise::max(0.0, _813);
    float _817 = _741;
    float _819 = _815;
    if (_767)
    {
        float _821 = _801 * 6.283185482025146484375;
        float _823 = cos(_821);
        _817 = _823;
    }
    float _825 = _817;
    float _827 = -_753;
    float _829 = -_815;
    float _831 = fma(_731, _827, _829);
    if (!_767)
    {
        _781 = _757;
    }
    float _833 = _781;
    float _835 = _833;
    if (_767)
    {
        float _837 = _831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _819 = _837;
    }
    float _839 = _819;
    float _841 = _839;
    if (!_767)
    {
        _805 = _759;
    }
    float _843 = _805;
    float _845 = _811;
    float _847 = _843;
    if (_767)
    {
        float _849 = fma(_811, _839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = _851;
    float _855 = _825;
    if (_767)
    {
        float _857 = _825 + (-1.0);
        _841 = _857;
    }
    float _859 = _841;
    float _861 = _859;
    if (_767)
    {
        float _863 = _791 * _851;
        _783 = _863;
    }
    float _865 = _783;
    if (!_767)
    {
        _793 = _755;
    }
    float _867 = _793;
    float _869 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _871 = _867;
    if (_767)
    {
        float _873 = _859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _861 = _873;
    }
    float _875 = _861;
    if (_767)
    {
        float _877 = _755 * _865;
        _871 = _877;
    }
    float _879 = _871;
    if (!_767)
    {
        _853 = _831;
    }
    float _881 = _853;
    float _883 = _881;
    if (_767)
    {
        float _885 = _757 * _865;
        _835 = _885;
    }
    float _887 = _835;
    if (_767)
    {
        float _889 = fma(_831, _825, _875);
        _883 = _889;
    }
    float _891 = _883;
    if (_767)
    {
        float _893 = _879 * _879;
        _847 = _893;
    }
    float _895 = _847;
    if (!_767)
    {
        _855 = _761;
    }
    float _897 = _855;
    float _899 = _897;
    if (_767)
    {
        float _901 = _887 * _887;
        _899 = _901;
    }
    float _903 = _899;
    float _905 = fma(_891, _891, _895);
    float _907 = _603 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _909 = floor(_745);
    float _911 = _603 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _913 = _905 + _903;
    float _915 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[2].x, _907);
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _919 = fma(_751, (*spvDescriptorSet0.vp_c15)._m0[23].w, _917);
    float _921 = precise::clamp(_919, 0.0, 1.0);
    float _923 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[3].x, _911);
    float _925 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[2].z, _915);
    float _927 = rsqrt(_913);
    float _929 = -_921;
    float _931 = _929 + 1.0;
    float _933 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[3].z, _923);
    float _935 = _925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _939 = _933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _941 = _935 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _943 = abs(_931);
    float _945 = log2(_943);
    float _947 = _603 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _949 = -_909;
    float _951 = _745 + _949;
    float _953 = -_941;
    float _955 = fma(_953, _937, 1.0);
    float _957 = _603 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _959 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[1].x, _947);
    float _961 = _927 * _879;
    float _963 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _957);
    float _965 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _959);
    float _967 = _927 * _891;
    float _969 = _961 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _971 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _973 = _965 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _975 = floor(_869);
    float _977 = -_969;
    float _979 = fma(_967, (*spvDescriptorSet0.vp_c15)._m0[21].y, _977);
    float _981 = _971 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _985 = _927 * _887;
    float _987 = _945 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _989 = _973 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[7].x, _983);
    float _993 = -_985;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[21].z, _979);
    float _997 = log2(_955);
    float _999 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _1001 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[7].z, _991);
    float _1003 = fma(_995, 0.5, 0.5);
    float _1005 = _973 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1007 = _967 + 1.0;
    float _1009 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1001);
    float _1011 = -_975;
    float _1013 = _869 + _1011;
    float _1015 = exp2(_987);
    float _1017 = fma(_995, -0.5, 0.5);
    float _1019 = fma(_1003, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1021 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1005);
    float _1023 = fma(_1003, _1019, -0.212114393711090087890625);
    float _1025 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[4].z, _999);
    float _1027 = 1.0 / _1009;
    float _1029 = _997 * 0.693147182464599609375;
    float _1031 = fma(_1003, _1023, 1.570728778839111328125);
    float _1033 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1025);
    float2 _3222 = float2(_951, _1013);
    float _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3222, float2(0.0), isnan(_3222)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3222, float2(0.0), isnan(_3222)), level(0.0)).x;
    float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1039 = sqrt(_1017);
    float _1041 = -_967;
    float _1043 = fma(_1015, _1007, _1041);
    float _1045 = fma(_1043, 0.5, 0.5);
    float _1047 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1021);
    float _1049 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1047);
    float _1051 = _1033 * _1027;
    float _1053 = _1039 * 0.636619746685028076171875;
    float _1055 = _1049 * _1027;
    float _1057 = fma(_1051, 0.5, 0.5);
    float _1059 = -_1031;
    float _1061 = fma(_1053, _1059, 1.0);
    float _1063 = fma(_1055, -0.5, 0.5);
    float3 _3275 = float3(_1057, _1063, _1037);
    float _1065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3275, float3(0.0), isnan(_3275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3275, float3(0.0), isnan(_3275)), level(0.0)).x;
    float3 _3286 = float3(_1057, _1063, _1037);
    float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3286, float3(0.0), isnan(_3286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3286, float3(0.0), isnan(_3286)), level(0.0)).xyzw;
    float _1070 = _1068.x;
    float _1072 = _1068.y;
    float _1074 = _1068.z;
    float _1076 = _1068.w;
    float2 _3302 = float2(_1061, _1045);
    float3 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3302, float2(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3302, float2(0.0), isnan(_3302)), level(0.0)).xyz;
    float _1082 = _1080.x;
    float _1084 = _1080.y;
    float _1086 = _1080.z;
    float _1088 = in.m_56.x;
    float _1090 = in.m_56.y;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1094 = _307 + _1092;
    bool _1096 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1098 = isnan(_307);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1104 = _1100 || _1102;
    float _1106 = float(_1104);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1112 = _171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1114;
    float _1118 = _973 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1120 = abs(_615);
    float _1122 = log2(_1120);
    bool _1124 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1126 = isnan(_307);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = -_1106;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1118);
    float _1142 = _1134 * _1138;
    float _1144 = _945 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1146 = 1.0 / _1110;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1150 = _1148 != 0;
    float _1152 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1140);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    bool _1158 = _1088 > 0.5;
    float _1160 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1162 = _1090 > 0.5;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1166 = _1116 * _1146;
    float _1168 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1170 = exp2(_1160);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1174 = fma(_1166, _1094, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = _1174 * _1142;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1186 = -_1134;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1176);
    float _1192 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1178);
    float _1194 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1196 = -_171;
    int _1198 = _1158 ? as_type<int>(_1196) : as_type<int>(_171);
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1182);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1206 = fma(_1170, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1208 = precise::clamp(_1206, 0.0, 1.0);
    bool _1210 = !_1150;
    float _1212 = _1210 ? _171 : as_type<float>(_1198);
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = fma(_1208, -2.0, 3.0);
    float _1222 = _1208 * _1208;
    float _1224 = _1212 + 0.5;
    float _1226 = exp2(_1144);
    out.m_66.x = _1214;
    out.m_66.y = _1216;
    out.m_66.z = _1218;
    out.m_66.w = _1184;
    float _1228 = _1222 * _1220;
    float _1230 = -_175;
    int _1232 = _1162 ? as_type<int>(_1230) : as_type<int>(_175);
    bool _1234 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1236 = isnan(_751);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1242 = _1238 || _1240;
    bool _1244 = !_1156;
    float _1246 = _1244 ? _175 : as_type<float>(_1232);
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1250 = -_1246;
    float _1252 = _1250 + 0.5;
    float _1254 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1256 = -_1228;
    float _1258 = _1256 + 1.0;
    float _1260 = in.m_68.x;
    float _1262 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1200);
    float _1264 = _1254 * _1164;
    float _1266 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1152);
    bool _1268 = _615 <= 8000.0;
    bool _1270 = isnan(_615);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan(8000.0);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1228);
    float _1282 = _1009 * 0.5;
    float _1284 = -_1226;
    float _1286 = _1284 + 1.0;
    float _1288 = _1278 * _1280;
    float _1290 = fma(_1049, -0.5, _1282);
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1294 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1300 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1312 = _1266 + _1009;
    float _1314 = _1033 + _1009;
    out.gl_Position.x = _1033;
    out.gl_Position.y = _1049;
    out.gl_Position.z = _1266;
    out.gl_Position.w = _1009;
    float _1316 = _1300 * _1248;
    float _1318 = _1312 * 0.5;
    float _1320 = _1314 * 0.5;
    out.m_70.x = _1304;
    out.m_70.y = _1306;
    out.m_70.z = _1308;
    out.m_70.w = _1310;
    out.m_72.x = _1264;
    out.m_72.y = _1316;
    out.m_74.x = _1320;
    out.m_74.y = _1290;
    out.m_74.z = _1318;
    out.m_74.w = _1009;
    float _1322 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1324 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1326 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1328 = _669 * _727;
    out.m_76.x = _1322;
    out.m_76.y = _1324;
    out.m_76.z = _1326;
    float _1330 = _1009;
    float _1332 = _1318;
    float _1334 = _1290;
    float _1336 = _1320;
    float _1338 = _1328;
    if (!_1242)
    {
        _1330 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1340 = _1330;
    float _1342 = _1340;
    float _1344 = _1340;
    if (!_1242)
    {
        _1332 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1346 = _1332;
    float _1348 = _1346;
    float _1350 = _1346;
    if (!_1242)
    {
        _1334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1352 = _1334;
    float _1354 = _1352;
    float _1356 = _1352;
    if (!_1242)
    {
        _1336 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1358 = _1336;
    float _1360 = -_1035;
    float _1362 = _1360 + 1.0;
    float _1364 = _1362 * _1294;
    float _1366 = precise::clamp(_1364, 0.0, 1.0);
    float _1368 = -_1366;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1372 = _1370 * _1260;
    float _1374 = _1372 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _1374;
    float _1376 = _1302 * _1065;
    float _1378 = -_1302;
    float _1380 = _1378 + 1.0;
    float _1382 = _1076 * _1376;
    float _1384 = _1086 * _1376;
    float _1386 = _1076 * _1380;
    float _1388 = fma(_1082, _1382, _1070);
    float _1390 = fma(_1084, _1382, _1072);
    float _1392 = fma(_1076, _1384, _1074);
    float _1394 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1396 = _1070;
    float _1398 = _1358;
    float _1400 = _1358;
    if (!_1242)
    {
        _1396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1402 = _1396;
    float _1404 = _1402;
    float _1406 = _1402;
    if (!_1242)
    {
        _1338 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1408 = _1338;
    out.m_80.x = _1388;
    out.m_80.y = _1390;
    out.m_80.z = _1392;
    out.m_80.w = _1386;
    bool _1410 = !_1242;
    float _1412 = _1408;
    float _1414 = _1408;
    if (!_1410)
    {
        bool _1416 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1418 = isnan(_751);
        bool _1420 = _1416 || _1418;
        bool _1422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1424 = _1420 || _1422;
        if (!_1424)
        {
            float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1428 = _751 + _1426;
            float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1430;
            float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1436 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1438 = 1.0 / _1432;
            float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1442 = _1440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1450 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1456 = _1428 * _1438;
            float _1458 = precise::clamp(_1456, 0.0, 1.0);
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1464 = fma(_1458, _1436, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1466 = fma(_1458, _1462, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1468 = fma(_1458, _1442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1470 = fma(_1458, _1446, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1472 = fma(_1458, _1450, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1474 = fma(_1458, _1454, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1344 = _1468;
            _1400 = _1472;
            _1406 = _1464;
            _1356 = _1470;
            _1350 = _1466;
            _1414 = _1474;
            _1476 = true;
        }
        else
        {
            bool _1478 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1480 = isnan(_751);
            bool _1482 = _1478 || _1480;
            bool _1484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1486 = _1482 || _1484;
            if (!_1486)
            {
                _1404 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1488 = _1404;
            _1406 = _1488;
            if (!_1486)
            {
                _1342 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1490 = _1342;
            _1344 = _1490;
            if (!_1486)
            {
                _1348 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1492 = _1348;
            _1350 = _1492;
            if (!_1486)
            {
                _1354 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1494 = _1354;
            _1356 = _1494;
            if (!_1486)
            {
                _1398 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1496 = _1398;
            _1400 = _1496;
            if (!_1486)
            {
                _1412 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1498 = _1412;
            bool _1500 = !_1486;
            _1414 = _1498;
            if (!_1500)
            {
                bool _1502 = _751 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1504 = isnan(_751);
                bool _1506 = _1502 || _1504;
                bool _1508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1510 = _1506 || _1508;
                if (!_1510)
                {
                    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1514 = _751 + _1512;
                    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1516;
                    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1522 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1524 = 1.0 / _1518;
                    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1528 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1532 = _1530 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1536 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1540 = _1538 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1542 = _1514 * _1524;
                    float _1544 = precise::clamp(_1542, 0.0, 1.0);
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1550 = fma(_1544, _1522, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1552 = fma(_1544, _1548, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1554 = fma(_1544, _1528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1556 = fma(_1544, _1532, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1558 = fma(_1544, _1536, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1560 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1344 = _1554;
                    _1400 = _1558;
                    _1406 = _1550;
                    _1356 = _1556;
                    _1350 = _1552;
                    _1414 = _1560;
                    _1476 = true;
                }
                else
                {
                    _1344 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1400 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1406 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1356 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1350 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1414 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1476 = false;
    float _1562 = _1344;
    float _1564 = _1400;
    float _1566 = _1406;
    float _1568 = _1356;
    float _1570 = _1350;
    float _1572 = _1414;
    float _1574 = fma(_1324, -0.5, 0.5);
    float _1576 = precise::clamp(_1574, 0.0, 1.0);
    float _1578 = -_1562;
    float _1580 = _1578 + _1564;
    float _1582 = _1394 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1584 = -_1566;
    float _1586 = _1584 + _1568;
    out.m_82.x = 0.0;
    float _1588 = fma(_1576, _1580, _1562);
    float _1590 = fma(_1576, _1586, _1566);
    out.m_49.x = _1582;
    float _1592 = -_1570;
    float _1594 = _1592 + _1572;
    float _1596 = _1588 * 0.586610972881317138671875;
    bool _1598 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1600 = fma(_1576, _1594, _1570);
    float _1602 = fma(_1590, 0.298911988735198974609375, _1596);
    bool _1604 = _669 > 0.0;
    bool _1606 = isnan(_669);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(0.0);
    bool _1612 = _1608 || _1610;
    float _1614 = fma(_1600, 0.114477999508380889892578125, _1602);
    bool _1616 = _727 <= 0.0;
    bool _1618 = !_1612;
    bool _1620 = _1616 || _1618;
    float _1622 = -_1614;
    float _1624 = _1590 + _1622;
    float _1626 = -_1614;
    float _1628 = _1588 + _1626;
    float _1630 = -_1614;
    float _1632 = _1600 + _1630;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    float _1636 = fma(_1628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    float _1638 = fma(_1632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1614);
    bool _1640 = !_1598;
    if (!_1640)
    {
        float _1642 = -_603;
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1646 = -_605;
        float _1648 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1650 = -_607;
        float _1652 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1654 = _1644 * _1644;
        float _1656 = fma(_1648, _1648, _1654);
        float _1658 = fma(_1652, _1652, _1656);
        float _1660 = sqrt(_1658);
        float _1662 = rsqrt(_1658);
        float _1664 = -_1660;
        float _1666 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1668 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1670 = precise::clamp(_1668, 0.0, 1.0);
        float _1672 = _1648 * _1662;
        float _1674 = _1644 * _1662;
        float _1676 = abs(_1670);
        float _1678 = log2(_1676);
        float _1680 = _1652 * _1662;
        float _1682 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1684 = _1324 * _1674;
        float _1686 = -_1674;
        float _1688 = -_1682;
        float _1690 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1688);
        float _1692 = fma(_1322, _1672, _1684);
        float _1694 = -_1680;
        float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1690);
        float _1698 = fma(_1326, _1680, _1692);
        float _1700 = precise::clamp(_1698, 0.0, 1.0);
        float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1704 = _1696 + _1702;
        float _1706 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1708 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1710 = precise::clamp(_1708, 0.0, 1.0);
        float _1712 = exp2(_1706);
        float _1714 = _1712 * _1710;
        float _1716 = _1700 * _1714;
        float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1722 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _1718;
        out.m_82.y = _1720;
        out.m_82.z = _1722;
    }
    out.m_84.x = _1634;
    out.m_84.y = _1636;
    out.m_84.z = _1638;
    if (!_1620)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1724;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

