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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    sampler vp_t_tcb_28Smplr_w [[id(10)]];
    sampler vp_t_tcb_24Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(0)]];
    float4 m_50 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_52 [[attribute(3)]];
    float4 m_64 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_44 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
    float4 m_54 [[attribute(10)]];
    float4 m_56 [[attribute(11)]];
    float4 m_60 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
    bool _335 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_39.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_42.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2242 = as_type<float>(_117);
        out.gl_Position.z = _2242;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_44.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_42.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2311 = as_type<float>(_155);
        out.gl_Position.z = _2311;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_46.x;
    float _159 = in.m_46.y;
    float _161 = in.m_46.z;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_50.x;
    float _173 = in.m_50.y;
    float _175 = in.m_50.z;
    float _177 = in.m_52.x;
    float _179 = in.m_52.y;
    float _181 = in.m_52.z;
    float _183 = _159 * _167;
    float _185 = _159 * _173;
    float _187 = fma(_157, _165, _183);
    float _189 = _159 * _179;
    float _191 = fma(_157, _171, _185);
    float _193 = fma(_161, _169, _187);
    float _195 = fma(_157, _177, _189);
    float _197 = fma(_161, _175, _191);
    float _199 = fma(_161, _181, _195);
    bool _201 = !_163;
    float _219;
    if (!_201)
    {
        float _203 = in.m_54.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_101);
        float _225 = 1.0 / _223;
        float _227 = _135 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _249;
    float _255 = -_245;
    float _257 = _255 + 1.0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _259;
    float _263 = _233 * _253;
    bool _265 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_229);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = fma(_261, _263, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = _275 * _257;
    float _289 = fma(_279, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = fma(_285, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _293 = -_275;
    float _295 = _293 + 1.0;
    float _297 = _281 * _287;
    float _299 = _289 * _287;
    float _301 = _291 * _287;
    float _303 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].z, _297);
    float _305 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _309 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].z, _303);
    bool _315 = !_251;
    float _333;
    if (!_315)
    {
        float _317 = in.m_54.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_101);
        float _339 = 1.0 / _337;
        float _341 = _135 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = in.m_56.x;
    float _347 = in.m_56.y;
    float _349 = in.m_56.z;
    float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _353 = log2(_351);
    float _355 = in.m_39.x;
    float _357 = in.m_39.y;
    float _359 = in.m_39.z;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _367 = _365 != 0;
    float _369 = in.m_58.y;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _381 = _379 != 0;
    float _383 = in.m_60.y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _387 = in.m_54.y;
    float _389 = _353 * _135;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _393 = in.m_54.x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _397 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _309 * _345;
    float _403 = in.m_54.z;
    float _405 = exp2(_389);
    float _407 = _173 * _357;
    float _409 = _179 * _357;
    float _411 = _357 + _369;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _415 = in.m_60.x;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _421 = -_383;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _429 = fma(_171, _355, _407);
    float _431 = fma(_177, _355, _409);
    bool _433 = _387 > 0.5;
    float _435 = 1.0 / _419;
    float _437 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _383;
    float _441 = _397;
    if (_363)
    {
        float _443 = _433 ? _423 : _383;
        _439 = _443;
    }
    float _445 = _439;
    float _447 = fma(_181, _359, _431);
    bool _449 = _393 > 0.5;
    bool _451 = _449 && _367;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = 1.0 / _427;
    float _459 = _403 * 2.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_62.x = _397;
    out.m_62.y = _437;
    out.m_62.z = _399;
    out.m_62.w = _395;
    bool _465 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _467 = isnan(1.0);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _473 = _469 || _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _477 = 1.0 + _475;
    float _479 = -_405;
    float _481 = _479 + 1.0;
    float _483 = in.m_50.w;
    float _485 = floor(_459);
    float _487 = fma(_175, _359, _429);
    float _489 = _463 * _435;
    float _491 = _387 + _403;
    float _493 = _463;
    if (!_367)
    {
        _493 = _415;
    }
    float _495 = _493;
    float _497 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _499 = _491 + (-1.0);
    float _501 = _455 * _457;
    float _503 = _495;
    if (_367)
    {
        _441 = _415;
    }
    float _505 = _441;
    float _507 = _393 * 2.0;
    float _509 = 1.0 / _477;
    float _511 = _393 + _387;
    float _513 = _505;
    if (_451)
    {
        float _515 = -_505;
        float _517 = _515 + 1.0;
        _513 = _517;
    }
    float _519 = _513;
    float _521 = in.m_52.w;
    bool _523 = _485 > 0.0;
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _527 = _485 >= 0.0;
    bool _529 = isnan(_485);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    float _537 = _387 * 2.0;
    float _539 = floor(_507);
    int _541 = as_type<int>(_525);
    if (_367)
    {
        _503 = _519;
    }
    float _543 = _503;
    float _545 = _511 + (-1.0);
    bool _547 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _555 = _551 || _553;
    float _557 = _387 + (-0.5);
    bool _559 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = isnan(_343);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _573 = _555 ? _481 : 0.0;
    float _575 = floor(_537);
    bool _577 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_343);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -_569;
    float _591 = _589 + 1.0;
    bool _593 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _595 = isnan(_343);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    if (_473)
    {
        float _605 = _573 * _509;
        _139 = _605;
    }
    float _607 = _139;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _343 + _609;
    float _613 = _587 * _591;
    float _615 = -_587;
    float _617 = _615 + 1.0;
    bool _619 = _539 > 0.0;
    float _621 = fma(_501, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _623 = _539 >= 0.0;
    bool _625 = isnan(_539);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = _603 * _617;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _343 + _635;
    float _639 = _487 + _483;
    int _641 = _631 ? 0 : 1;
    float _643 = _621 * _633;
    float _645 = -_603;
    float _647 = _645 + 1.0;
    float _649 = fma(_489, _637, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _651 = _535 ? 0 : 1;
    float _653 = _447 + _521;
    int _655 = ~_641;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    float _661 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    int _663 = _659;
    if (!_619)
    {
        int _665 = ~_641;
        int _667 = _665 + 1;
        _663 = _667;
    }
    int _669 = _663;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _673 = _411 + _671;
    bool _675 = !_373;
    int _677 = _675 ? 0 : 1;
    float _679 = fma(_649, _613, _661);
    bool _681 = _575 > 0.0;
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _685 = ~_651;
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _693 = _653 + _691;
    int _695 = _689;
    if (!_523)
    {
        int _697 = ~_651;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _639 + _703;
    int _707 = abs(_677);
    float _709 = _673 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _711 = _575 >= 0.0;
    bool _713 = isnan(_575);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _723 = float(_701);
    float _725 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _709);
    int _727 = _719 ? 0 : 1;
    float _729 = _543 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _731 = float(_707);
    float _733 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _725);
    int _735 = ~_727;
    int _737 = _735 + 1;
    int _739 = _737 + 1;
    float _741 = _445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _743 = _739;
    if (!_681)
    {
        int _745 = ~_727;
        int _747 = _745 + 1;
        _743 = _747;
    }
    int _749 = _743;
    float _751 = _731 * _723;
    bool _753 = _733 >= 0.0;
    float _755 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[117].x, _679);
    bool _757 = !_377;
    int _759 = _757 ? 0 : 1;
    float _761 = _741 * _683;
    float _763 = in.m_64.x;
    float _765 = in.m_64.y;
    float _767 = in.m_64.z;
    float _769 = _729 * _721;
    float _771 = _673 * _673;
    int _773 = abs(_759);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _779 = float(_669);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _783 = float(_773);
    float _785 = fma(_705, _705, _771);
    float _787 = _751 * (-2.0);
    float _789 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _783 * _779;
    float _795 = fma(_693, _693, _785);
    float _797 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _755 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _769;
    out.m_66.y = _761;
    float _801 = _793 * (-2.0);
    float _803 = fma(_571, _787, _571);
    float _805 = rsqrt(_795);
    out.m_68.x = _789;
    out.m_68.y = _791;
    out.m_68.z = _797;
    out.m_68.w = _799;
    float _807 = fma(_525, _801, _525);
    float _809 = fma(_787, _763, _763);
    float _811 = _393 + (-0.5);
    float _813 = _769;
    float _815 = _767;
    if (_753)
    {
        out.m_42.x = 0.0;
    }
    if (_753)
    {
        _813 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _817 = _813;
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].x, _809);
    float _821 = _497 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _823 = fma(_801, _765, _765);
    if (_753)
    {
        float _825 = _817 * 5.0;
        _541 = as_type<int>(_825);
    }
    int _827 = _541;
    float _829 = fma(_803, _607, _819);
    bool _831 = !_381;
    int _833 = _831 ? 0 : 1;
    float _835 = _821 * _805;
    if (_753)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3362 = as_type<float>(_827);
        out.gl_Position.z = _3362;
    }
    int _837 = abs(_833);
    float _839 = _705 * _835;
    float _841 = _673 * _835;
    float _843 = float(_837);
    if (_753)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _845 = -_841;
    float _847 = _411 + _845;
    float _849 = _693 * _835;
    float _851 = -_839;
    float _853 = _639 + _851;
    float _855 = float(_749);
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _859 = _847 + _857;
    float _861 = -_849;
    float _863 = _653 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _867 = _853 + _865;
    float _869 = -_841;
    float _871 = _673 + _869;
    float _873 = _859 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _863 + _875;
    float _879 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _823);
    float _881 = _393 + _403;
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[28].x, _873);
    float _885 = _843 * _855;
    float _887 = -_839;
    float _889 = _705 + _887;
    float _891 = _871 * _871;
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _883);
    float _895 = fma(_807, _607, _879);
    float _897 = _881 + (-1.0);
    float _899 = _885 * (-2.0);
    bool _901 = _893 >= 0.0;
    float _903 = fma(_889, _889, _891);
    float _905 = -_849;
    float _907 = _693 + _905;
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _911 = _403 + (-0.5);
    float _913 = fma(_899, _767, _767);
    float _915 = _895 * 0.15915493667125701904296875;
    float _917 = fma(_907, _907, _903);
    float _919 = fma(_909, _899, _909);
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[196].z, _913);
    float _923 = _915 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = _829 * 0.15915493667125701904296875;
    float _929 = _849;
    if (_901)
    {
        _815 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _931 = _815;
    float _933 = fma(_919, _607, _921);
    int _935 = as_type<int>(_931);
    if (_901)
    {
        out.m_42.x = 0.0;
    }
    float _937 = _915 * 6.283185482025146484375;
    float _939 = cos(_937);
    if (_901)
    {
        float _941 = _931 * 5.0;
        _935 = as_type<int>(_941);
    }
    int _943 = _935;
    if (_901)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3542 = as_type<float>(_943);
        out.gl_Position.z = _3542;
    }
    float _945 = sqrt(_917);
    float _947 = _927 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _927 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = _933 * 0.15915493667125701904296875;
    if (_901)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _957 = in.m_70.x;
    float _959 = in.m_70.y;
    float _961 = in.m_70.z;
    float _963 = _955 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = _313 * _349;
    float _969 = _311 * _347;
    float _971 = _805 * _945;
    float _973 = _949 * _925;
    float _975 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _977 = _953 * _939;
    float _979 = _955 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _953 * _925;
    float _985 = _949 * _939;
    float _987 = _971 * _975;
    float _989 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _991 = _953 * _965;
    float _993 = _939 * _965;
    float _995 = _949 * _965;
    float _997 = _925 * _965;
    float _999 = _497 * _971;
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _959);
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _957);
    float _1005 = fma(_981, _977, _973);
    float _1007 = -_985;
    float _1009 = fma(_981, _983, _1007);
    float _1011 = _1001 * _987;
    float _1013 = _971 * _989;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _961);
    float _1017 = _1003 * _999;
    float _1019 = _991 * _1011;
    float _1021 = -_1011;
    float _1023 = _981 * _1021;
    float _1025 = _1015 * _1013;
    float _1027 = -_983;
    float _1029 = fma(_981, _985, _1027);
    float _1031 = fma(_1005, _1017, _1019);
    float _1033 = _995 * _1011;
    float _1035 = fma(_993, _1017, _1023);
    float _1037 = fma(_981, _973, _977);
    float _1039 = fma(_1009, _1025, _1031);
    float _1041 = fma(_1029, _1017, _1033);
    float _1043 = fma(_997, _1025, _1035);
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1037, _1025, _1041);
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1051 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1055 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1049);
    float _1057 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1053);
    float _1061 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1063 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1055);
    float _1065 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1069 = floor(_1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1075 = _653 + _1067;
    float _1077 = _639 + _1071;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1081 = _1075 + _1079;
    float _1083 = _411 + _1073;
    float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1087 = _1077 + _1085;
    float _1089 = _1081 * _1081;
    float _1091 = fma(_853, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1093 = fma(_1087, _1087, _1089);
    float _1095 = floor(_1091);
    float _1097 = sqrt(_1093);
    bool _1099 = _1097 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1101 = _1065;
    float _1103 = _1077;
    float _1105 = _1073;
    if (!_1099)
    {
        _1101 = _1077;
    }
    float _1107 = _1101;
    float _1109 = _1107;
    if (!_1099)
    {
        _1103 = _1075;
    }
    float _1111 = _1103;
    float _1113 = _1111;
    if (!_1099)
    {
        _1105 = _1083;
    }
    float _1115 = _1105;
    bool _1117 = !_1099;
    float _1119 = _1115;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1097 + _1123;
        float _1127 = rsqrt(_1093);
        float _1129 = _1125 * _1121;
        float _1131 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1133 = _1129 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = fma(_1141, _1131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1149 = fma(_1083, _1137, _1145);
        float _1151 = _1127 * _1147;
        float _1153 = fma(_1087, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_1081, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1155;
        _1109 = _1153;
        _1119 = _1149;
    }
    float _1157 = _1113;
    float _1159 = _1109;
    float _1161 = _1119;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1165 = _1157 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1169 = _1159 + _1167;
    float _1171 = -_1069;
    float _1173 = _1061 + _1171;
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1177 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1179 = -_1095;
    float _1181 = _1091 + _1179;
    float2 _3934 = float2(_1177, _1175);
    float _1183 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3934, float2(0.0), isnan(_3934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3934, float2(0.0), isnan(_3934)), level(0.0)).x;
    float2 _3944 = float2(_1181, _1173);
    float _1185 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3944, float2(0.0), isnan(_3944)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3944, float2(0.0), isnan(_3944)), level(0.0)).x;
    float _1187 = in.m_72.x;
    float _1189 = in.m_72.y;
    float _1191 = in.m_72.z;
    bool _1193 = _959 != 0.0;
    bool _1195 = isnan(_959);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.0);
    bool _1201 = _1197 || _1199;
    float _1203 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1205 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1207 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1209 = _957 == 0.0;
    bool _1211 = !_1201;
    bool _1213 = _1209 && _1211;
    float _1215 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1203);
    float _1217 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1205);
    float _1219 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1207);
    bool _1221 = _961 == 0.0;
    bool _1223 = _1221 && _1213;
    float _1225 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1227 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1229 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1231 = -_981;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1225);
    float _1235 = -_981;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1227);
    float _1239 = -_981;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1229);
    float _1243 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1245 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1215);
    float _1247 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1217);
    float _1249 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1219);
    float _1251 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1243);
    float _1253 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1233);
    float _1255 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1237);
    float _1257 = _1189;
    float _1259 = _1187;
    float _1261 = _1191;
    float _1263 = _1159;
    float _1265 = _1157;
    if (!_1223)
    {
        float _1267 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1189);
        _1257 = _1267;
    }
    float _1269 = _1257;
    float _1271 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1273 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1241);
    float _1275 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1223)
    {
        float _1277 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1187);
        _1259 = _1277;
    }
    float _1279 = _1259;
    float _1281 = _1253 * _1269;
    float _1283 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1271);
    float _1285 = _1255 * _1269;
    float _1287 = _1273 * _1269;
    float _1289 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1275);
    if (!_1223)
    {
        float _1291 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1191);
        _1261 = _1291;
    }
    float _1293 = _1261;
    float _1295 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1251);
    float _1297 = fma(_1245, _1279, _1281);
    float _1299 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1283);
    float _1301 = fma(_1247, _1279, _1285);
    float _1303 = fma(_1249, _1279, _1287);
    float _1305 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1289);
    float _1307 = fma(_1295, _1293, _1297);
    float _1309 = fma(_1299, _1293, _1301);
    float _1311 = -_411;
    float _1313 = _1311 + _1161;
    float _1315 = fma(_1305, _1293, _1303);
    float _1317 = -_639;
    float _1319 = _1317 + _1159;
    float _1321 = -_653;
    float _1323 = _1321 + _1157;
    bool _1325 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1327 = isnan(0.5);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1333 = _1329 || _1331;
    float _1335 = fma(_1183, 100.0, _411);
    float _1337 = fma(_1183, 100.0, _1161);
    float _1339 = -_841;
    float _1341 = _1339 + _1335;
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1347 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1349 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1345);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1353 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1347);
    float _1355 = 1.0 / _1351;
    float _1357 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1353);
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1361 = _1359 + _1351;
    float _1363 = _1361 * _1355;
    float _1365 = _1363 * 0.5;
    float _1367 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1369 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1367);
    float _1371 = _1313 * _1313;
    float _1373 = fma(_1319, _1319, _1371);
    float _1375 = 1.0 / _1369;
    float _1377 = fma(_1323, _1323, _1373);
    float _1379 = sqrt(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1383 = _1375 * _1381;
    float _1385 = abs(_1383);
    float _1387 = log2(_1385);
    bool _1389 = _1379 > 0.0;
    float _1391 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1393 = _1387;
    float _1395 = _1375;
    if (!_1389)
    {
        _1393 = _1337;
    }
    float _1397 = _1393;
    float _1399 = exp2(_1391);
    bool _1401 = !_1389;
    float _1403 = _1397;
    if (!_1401)
    {
        float _1405 = _193 * _193;
        float _1407 = fma(_197, _197, _1405);
        float _1409 = fma(_199, _199, _1407);
        float _1411 = rsqrt(_1377);
        float _1413 = sqrt(_1409);
        float _1415 = _1319 * _1411;
        float _1417 = _1313 * _1411;
        float _1419 = _1323 * _1411;
        bool _1421 = _1413 > 0.0;
        float _1423 = _1413;
        _1395 = _1409;
        if (!_1421)
        {
            _1423 = _1337;
        }
        float _1425 = _1423;
        bool _1427 = !_1421;
        _1403 = _1425;
        if (!_1427)
        {
            float _1429 = rsqrt(_1409);
            float _1431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1433 = _193 * _1429;
            float _1435 = _197 * _1429;
            float _1437 = _199 * _1429;
            float _1439 = _1417 * _1433;
            float _1441 = fma(_1415, _1435, _1439);
            float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1445 = fma(_1419, _1437, _1441);
            float _1447 = _1445 * _1443;
            float _1449 = fma(_197, _1447, _1159);
            float _1451 = fma(_193, _1447, _1337);
            float _1453 = fma(_199, _1447, _1157);
            _1263 = _1449;
            _1265 = _1453;
            _1403 = _1451;
        }
    }
    float _1455 = _1263;
    float _1457 = _1265;
    float _1459 = _1403;
    float _1461 = _1395;
    float _1463 = -_839;
    float _1465 = _1463 + _1455;
    float _1467 = -_849;
    float _1469 = _1467 + _1457;
    bool _1471 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1479 = _1475 || _1477;
    float _1481 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = -_841;
    float _1487 = _1485 + _1459;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _1491 = _1487;
    float _1493 = _1469;
    float _1495 = _1461;
    if (_1333)
    {
        _1489 = _1465;
    }
    float _1497 = _1489;
    float _1499 = fma(_1483, -2.0, 3.0);
    float _1501 = _1483 * _1483;
    float _1503 = _1497;
    if (!_1333)
    {
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1507 = _1341 + _1505;
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1511 = -_653;
        float _1513 = _1511 + _1457;
        float _1515 = -_639;
        float _1517 = _1515 + _1455;
        float _1519 = _1507 * _1507;
        float _1521 = -_1335;
        float _1523 = _1521 + _1459;
        float _1525 = fma(_867, _867, _1519);
        float _1527 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1529 = fma(_877, _877, _1525);
        float _1531 = 1.0 / _971;
        float _1533 = sqrt(_1529);
        float _1535 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1509;
        float _1541 = _1539 * _1531;
        float _1543 = _1535 * _1541;
        float _1545 = _1513 * _1541;
        float _1547 = fma(_1517, _1543, _853);
        float _1549 = fma(_1523, _1543, _1341);
        float _1551 = fma(_1535, _1545, _863);
        _1491 = _1549;
        _1503 = _1547;
        _1493 = _1551;
        _929 = _1535;
    }
    float _1553 = _1491;
    float _1555 = _1503;
    float _1557 = _1493;
    float _1559 = _929;
    float _1561 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1563 = _1501 * _1499;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1567 = _1559;
    if (_1479)
    {
        _1567 = 1.0;
    }
    float _1569 = _1567;
    float _1571 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1561);
    float _1573 = -_1563;
    float _1575 = _1573 + 1.0;
    float _1577 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1565);
    float _1579 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1571);
    float _1581 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1563);
    float _1583 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1577);
    float _1585 = _1575;
    float _1587 = _1569;
    if (_1479)
    {
        _1585 = 1.0;
    }
    float _1589 = _1585;
    float _1591 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = _1589;
    if (!_1479)
    {
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = _1595 * 0.15915493667125701904296875;
        float _1599 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = _1597 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        float _1609 = _1599 * 0.15915493667125701904296875;
        float _1611 = _1597 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1607;
        float _1617 = _1609 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = _1613 * _1615;
        float _1623 = _1609 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1603;
        float _1631 = 1.0 / _1627;
        float _1633 = _1625 * _1631;
        float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1637 = fma(_1383, _1633, _1635);
        float _1639 = _1637 * _1629;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1593 = _1641;
    }
    float _1643 = _1593;
    if (!_1479)
    {
        float _1645 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1647 = _1645 * 0.15915493667125701904296875;
        float _1649 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1651 = _1647 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1649 * 0.15915493667125701904296875;
        float _1657 = _1647 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = 1.0 / _1653;
        float _1663 = _1655 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        float _1667 = _1659 * _1661;
        float _1669 = _1655 * 6.283185482025146484375;
        float _1671 = sin(_1669);
        float _1673 = _1665 * _1667;
        float _1675 = 1.0 / _1673;
        float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1679 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1677;
        float _1681 = 1.0 / _1679;
        float _1683 = _1671 * _1675;
        float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1687 = fma(_1383, _1683, _1685);
        float _1689 = _1687 * _1681;
        float _1691 = precise::clamp(_1689, 0.0, 1.0);
        float _1693 = -_1691;
        float _1695 = _1693 + 1.0;
        _1587 = _1695;
    }
    float _1697 = _1587;
    bool _1699 = _1383 <= 8000.0;
    bool _1701 = isnan(_1383);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(8000.0);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1715 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1717 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1719 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1721 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1713);
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1715);
    float _1725 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1717);
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1719);
    float _1729 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1731 = in.m_58.x;
    float _1733 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1737 = _1553 + _1735;
    float _1739 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1729);
    float _1741 = _1709 * _1581;
    float _1743 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1733);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1747 = _1555 + _1745;
    float _1749 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1751 = _1737 * _1737;
    float _1753 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1755 = -_1185;
    float _1757 = _1755 + 1.0;
    float _1759 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1761 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1763 = fma(_1747, _1747, _1751);
    float _1765 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1557 + _1767;
    float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1721);
    float _1773 = _1757 * _1761;
    float _1775 = precise::clamp(_1773, 0.0, 1.0);
    float _1777 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1725);
    float _1779 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1727);
    float _1781 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1723);
    float _1783 = fma(_1769, _1769, _1763);
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1771);
    float _1787 = -_1775;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1791 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1777);
    float _1793 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1779);
    float _1795 = sqrt(_1783);
    float _1797 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1781);
    float _1799 = _1789 * _1731;
    float _1801 = _1785 + _1793;
    float _1803 = _1791 + _1793;
    float _1805 = _1793 * 0.5;
    float _1807 = _1801 * 0.5;
    float _1809 = _1803 * 0.5;
    float _1811 = fma(_1797, -0.5, _1805);
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_74.x = _1307;
    out.m_74.y = _1309;
    out.m_74.z = _1315;
    float _1815 = _1643 * _1697;
    out.m_76.x = _1807;
    out.m_76.y = _1811;
    out.m_76.z = _1809;
    out.m_76.w = _1793;
    bool _1817 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1819 = isnan(_1795);
    bool _1821 = _1817 || _1819;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1825 = _1821 || _1823;
    float _1827 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_78.x = _1813;
    out.gl_Position.x = _1785;
    out.gl_Position.y = _1797;
    out.gl_Position.z = _1791;
    out.gl_Position.w = _1793;
    float _1829 = _1783;
    float _1831 = _1805;
    float _1833 = _1725;
    float _1835 = _1785;
    float _1837 = _1815;
    if (!_1825)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1839 = _1829;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1825)
    {
        _1495 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1495;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1825)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1851 = _1831;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1825)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1857 = _1833;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1825)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1863 = _1835;
    float _1865 = _1863;
    float _1867 = _1863;
    if (!_1825)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1837;
    bool _1871 = !_1825;
    float _1873 = _1869;
    float _1875 = _1869;
    if (!_1871)
    {
        bool _1877 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1795);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1795 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1849 = _1929;
            _1867 = _1933;
            _1843 = _1925;
            _1861 = _1927;
            _1855 = _1931;
            _1875 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1795);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1841;
            _1843 = _1949;
            if (!_1947)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1847;
            _1849 = _1951;
            if (!_1947)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1853;
            _1855 = _1953;
            if (!_1947)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1859;
            _1861 = _1955;
            if (!_1947)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1865;
            _1867 = _1957;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1873;
            bool _1961 = !_1947;
            _1875 = _1959;
            if (!_1961)
            {
                bool _1963 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1795);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1795 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1849 = _2015;
                    _1867 = _2019;
                    _1843 = _2011;
                    _1861 = _2013;
                    _1855 = _2017;
                    _1875 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1849;
    float _2025 = _1867;
    float _2027 = _1843;
    float _2029 = _1861;
    float _2031 = _1855;
    float _2033 = _1875;
    float _2035 = fma(_1309, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2045 = -_2027;
    float _2047 = _2045 + _2029;
    float _2049 = fma(_2037, _2041, _2023);
    out.m_80.x = 0.0;
    float _2051 = -_2031;
    float _2053 = _2051 + _2033;
    float _2055 = fma(_2037, _2047, _2027);
    float _2057 = _2049 * 0.586610972881317138671875;
    out.m_42.x = _2043;
    bool _2059 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2061 = fma(_2037, _2053, _2031);
    float _2063 = fma(_2055, 0.298911988735198974609375, _2057);
    bool _2065 = _1643 > 0.0;
    bool _2067 = isnan(_1643);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = fma(_2061, 0.114477999508380889892578125, _2063);
    bool _2077 = _1697 <= 0.0;
    bool _2079 = !_2073;
    bool _2081 = _2077 || _2079;
    float _2083 = -_2075;
    float _2085 = _2055 + _2083;
    float _2087 = -_2075;
    float _2089 = _2049 + _2087;
    float _2091 = -_2075;
    float _2093 = _2061 + _2091;
    float _2095 = fma(_2085, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    float _2097 = fma(_2089, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    float _2099 = fma(_2093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    bool _2101 = !_2059;
    if (!_2101)
    {
        float _2103 = -_1553;
        float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2107 = -_1555;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2111 = -_1557;
        float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2115 = _2105 * _2105;
        float _2117 = fma(_2109, _2109, _2115);
        float _2119 = fma(_2113, _2113, _2117);
        float _2121 = sqrt(_2119);
        float _2123 = rsqrt(_2119);
        float _2125 = -_2121;
        float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2131 = precise::clamp(_2129, 0.0, 1.0);
        float _2133 = _2109 * _2123;
        float _2135 = _2105 * _2123;
        float _2137 = abs(_2131);
        float _2139 = log2(_2137);
        float _2141 = _2113 * _2123;
        float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2145 = _1309 * _2135;
        float _2147 = -_2135;
        float _2149 = -_2143;
        float _2151 = fma(_2147, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2149);
        float _2153 = fma(_1307, _2133, _2145);
        float _2155 = -_2141;
        float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2151);
        float _2159 = fma(_1315, _2141, _2153);
        float _2161 = precise::clamp(_2159, 0.0, 1.0);
        float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2165 = _2157 + _2163;
        float _2167 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2169 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2171 = precise::clamp(_2169, 0.0, 1.0);
        float _2173 = exp2(_2167);
        float _2175 = _2173 * _2171;
        float _2177 = _2161 * _2175;
        float _2179 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2181 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2183 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _2179;
        out.m_80.y = _2181;
        out.m_80.z = _2183;
    }
    out.m_82.x = _2095;
    out.m_82.y = _2097;
    out.m_82.z = _2099;
    if (!_2081)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2185 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_42.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2185;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
    bool _335 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_39.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_42.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2242 = as_type<float>(_117);
        out.gl_Position.z = _2242;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_44.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_42.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2311 = as_type<float>(_155);
        out.gl_Position.z = _2311;
    }
    if (_149)
    {
        return out;
    }
    float _157 = in.m_46.x;
    float _159 = in.m_46.y;
    float _161 = in.m_46.z;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_50.x;
    float _173 = in.m_50.y;
    float _175 = in.m_50.z;
    float _177 = in.m_52.x;
    float _179 = in.m_52.y;
    float _181 = in.m_52.z;
    float _183 = _159 * _167;
    float _185 = _159 * _173;
    float _187 = fma(_157, _165, _183);
    float _189 = _159 * _179;
    float _191 = fma(_157, _171, _185);
    float _193 = fma(_161, _169, _187);
    float _195 = fma(_157, _177, _189);
    float _197 = fma(_161, _175, _191);
    float _199 = fma(_161, _181, _195);
    bool _201 = !_163;
    float _219;
    if (!_201)
    {
        float _203 = in.m_54.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_101);
        float _225 = 1.0 / _223;
        float _227 = _135 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _249;
    float _255 = -_245;
    float _257 = _255 + 1.0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _259;
    float _263 = _233 * _253;
    bool _265 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_229);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = fma(_261, _263, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = _275 * _257;
    float _289 = fma(_279, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = fma(_285, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _293 = -_275;
    float _295 = _293 + 1.0;
    float _297 = _281 * _287;
    float _299 = _289 * _287;
    float _301 = _291 * _287;
    float _303 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].z, _297);
    float _305 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _309 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].z, _303);
    bool _315 = !_251;
    float _333;
    if (!_315)
    {
        float _317 = in.m_54.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_101);
        float _339 = 1.0 / _337;
        float _341 = _135 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = in.m_56.x;
    float _347 = in.m_56.y;
    float _349 = in.m_56.z;
    float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _353 = log2(_351);
    float _355 = in.m_39.x;
    float _357 = in.m_39.y;
    float _359 = in.m_39.z;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _367 = _365 != 0;
    float _369 = in.m_58.y;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _381 = _379 != 0;
    float _383 = in.m_60.y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _387 = in.m_54.y;
    float _389 = _353 * _135;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _393 = in.m_54.x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _397 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _309 * _345;
    float _403 = in.m_54.z;
    float _405 = exp2(_389);
    float _407 = _173 * _357;
    float _409 = _179 * _357;
    float _411 = _357 + _369;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _415 = in.m_60.x;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _421 = -_383;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _429 = fma(_171, _355, _407);
    float _431 = fma(_177, _355, _409);
    bool _433 = _387 > 0.5;
    float _435 = 1.0 / _419;
    float _437 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _383;
    float _441 = _397;
    if (_363)
    {
        float _443 = _433 ? _423 : _383;
        _439 = _443;
    }
    float _445 = _439;
    float _447 = fma(_181, _359, _431);
    bool _449 = _393 > 0.5;
    bool _451 = _449 && _367;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = 1.0 / _427;
    float _459 = _403 * 2.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_62.x = _397;
    out.m_62.y = _437;
    out.m_62.z = _399;
    out.m_62.w = _395;
    bool _465 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _467 = isnan(1.0);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _473 = _469 || _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _477 = 1.0 + _475;
    float _479 = -_405;
    float _481 = _479 + 1.0;
    float _483 = in.m_50.w;
    float _485 = floor(_459);
    float _487 = fma(_175, _359, _429);
    float _489 = _463 * _435;
    float _491 = _387 + _403;
    float _493 = _463;
    if (!_367)
    {
        _493 = _415;
    }
    float _495 = _493;
    float _497 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _499 = _491 + (-1.0);
    float _501 = _455 * _457;
    float _503 = _495;
    if (_367)
    {
        _441 = _415;
    }
    float _505 = _441;
    float _507 = _393 * 2.0;
    float _509 = 1.0 / _477;
    float _511 = _393 + _387;
    float _513 = _505;
    if (_451)
    {
        float _515 = -_505;
        float _517 = _515 + 1.0;
        _513 = _517;
    }
    float _519 = _513;
    float _521 = in.m_52.w;
    bool _523 = _485 > 0.0;
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _527 = _485 >= 0.0;
    bool _529 = isnan(_485);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    float _537 = _387 * 2.0;
    float _539 = floor(_507);
    int _541 = as_type<int>(_525);
    if (_367)
    {
        _503 = _519;
    }
    float _543 = _503;
    float _545 = _511 + (-1.0);
    bool _547 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _555 = _551 || _553;
    float _557 = _387 + (-0.5);
    bool _559 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = isnan(_343);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _573 = _555 ? _481 : 0.0;
    float _575 = floor(_537);
    bool _577 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_343);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -_569;
    float _591 = _589 + 1.0;
    bool _593 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _595 = isnan(_343);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    if (_473)
    {
        float _605 = _573 * _509;
        _139 = _605;
    }
    float _607 = _139;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _343 + _609;
    float _613 = _587 * _591;
    float _615 = -_587;
    float _617 = _615 + 1.0;
    bool _619 = _539 > 0.0;
    float _621 = fma(_501, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _623 = _539 >= 0.0;
    bool _625 = isnan(_539);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = _603 * _617;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _343 + _635;
    float _639 = _487 + _483;
    int _641 = _631 ? 0 : 1;
    float _643 = _621 * _633;
    float _645 = -_603;
    float _647 = _645 + 1.0;
    float _649 = fma(_489, _637, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _651 = _535 ? 0 : 1;
    float _653 = _447 + _521;
    int _655 = ~_641;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    float _661 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    int _663 = _659;
    if (!_619)
    {
        int _665 = ~_641;
        int _667 = _665 + 1;
        _663 = _667;
    }
    int _669 = _663;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _673 = _411 + _671;
    bool _675 = !_373;
    int _677 = _675 ? 0 : 1;
    float _679 = fma(_649, _613, _661);
    bool _681 = _575 > 0.0;
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _685 = ~_651;
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _693 = _653 + _691;
    int _695 = _689;
    if (!_523)
    {
        int _697 = ~_651;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _639 + _703;
    int _707 = abs(_677);
    float _709 = _673 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _711 = _575 >= 0.0;
    bool _713 = isnan(_575);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _723 = float(_701);
    float _725 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _709);
    int _727 = _719 ? 0 : 1;
    float _729 = _543 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _731 = float(_707);
    float _733 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _725);
    int _735 = ~_727;
    int _737 = _735 + 1;
    int _739 = _737 + 1;
    float _741 = _445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _743 = _739;
    if (!_681)
    {
        int _745 = ~_727;
        int _747 = _745 + 1;
        _743 = _747;
    }
    int _749 = _743;
    float _751 = _731 * _723;
    bool _753 = _733 >= 0.0;
    float _755 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[117].x, _679);
    bool _757 = !_377;
    int _759 = _757 ? 0 : 1;
    float _761 = _741 * _683;
    float _763 = in.m_64.x;
    float _765 = in.m_64.y;
    float _767 = in.m_64.z;
    float _769 = _729 * _721;
    float _771 = _673 * _673;
    int _773 = abs(_759);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _779 = float(_669);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _783 = float(_773);
    float _785 = fma(_705, _705, _771);
    float _787 = _751 * (-2.0);
    float _789 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _783 * _779;
    float _795 = fma(_693, _693, _785);
    float _797 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _755 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _769;
    out.m_66.y = _761;
    float _801 = _793 * (-2.0);
    float _803 = fma(_571, _787, _571);
    float _805 = rsqrt(_795);
    out.m_68.x = _789;
    out.m_68.y = _791;
    out.m_68.z = _797;
    out.m_68.w = _799;
    float _807 = fma(_525, _801, _525);
    float _809 = fma(_787, _763, _763);
    float _811 = _393 + (-0.5);
    float _813 = _769;
    float _815 = _767;
    if (_753)
    {
        out.m_42.x = 0.0;
    }
    if (_753)
    {
        _813 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _817 = _813;
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].x, _809);
    float _821 = _497 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _823 = fma(_801, _765, _765);
    if (_753)
    {
        float _825 = _817 * 5.0;
        _541 = as_type<int>(_825);
    }
    int _827 = _541;
    float _829 = fma(_803, _607, _819);
    bool _831 = !_381;
    int _833 = _831 ? 0 : 1;
    float _835 = _821 * _805;
    if (_753)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3362 = as_type<float>(_827);
        out.gl_Position.z = _3362;
    }
    int _837 = abs(_833);
    float _839 = _705 * _835;
    float _841 = _673 * _835;
    float _843 = float(_837);
    if (_753)
    {
        return out;
    }
    float _845 = -_841;
    float _847 = _411 + _845;
    float _849 = _693 * _835;
    float _851 = -_839;
    float _853 = _639 + _851;
    float _855 = float(_749);
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _859 = _847 + _857;
    float _861 = -_849;
    float _863 = _653 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _867 = _853 + _865;
    float _869 = -_841;
    float _871 = _673 + _869;
    float _873 = _859 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _863 + _875;
    float _879 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _823);
    float _881 = _393 + _403;
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[28].x, _873);
    float _885 = _843 * _855;
    float _887 = -_839;
    float _889 = _705 + _887;
    float _891 = _871 * _871;
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _883);
    float _895 = fma(_807, _607, _879);
    float _897 = _881 + (-1.0);
    float _899 = _885 * (-2.0);
    bool _901 = _893 >= 0.0;
    float _903 = fma(_889, _889, _891);
    float _905 = -_849;
    float _907 = _693 + _905;
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _911 = _403 + (-0.5);
    float _913 = fma(_899, _767, _767);
    float _915 = _895 * 0.15915493667125701904296875;
    float _917 = fma(_907, _907, _903);
    float _919 = fma(_909, _899, _909);
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[196].z, _913);
    float _923 = _915 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = _829 * 0.15915493667125701904296875;
    float _929 = _849;
    if (_901)
    {
        _815 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _931 = _815;
    float _933 = fma(_919, _607, _921);
    int _935 = as_type<int>(_931);
    if (_901)
    {
        out.m_42.x = 0.0;
    }
    float _937 = _915 * 6.283185482025146484375;
    float _939 = cos(_937);
    if (_901)
    {
        float _941 = _931 * 5.0;
        _935 = as_type<int>(_941);
    }
    int _943 = _935;
    if (_901)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3542 = as_type<float>(_943);
        out.gl_Position.z = _3542;
    }
    float _945 = sqrt(_917);
    float _947 = _927 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _927 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = _933 * 0.15915493667125701904296875;
    if (_901)
    {
        return out;
    }
    float _957 = in.m_70.x;
    float _959 = in.m_70.y;
    float _961 = in.m_70.z;
    float _963 = _955 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = _313 * _349;
    float _969 = _311 * _347;
    float _971 = _805 * _945;
    float _973 = _949 * _925;
    float _975 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _977 = _953 * _939;
    float _979 = _955 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _953 * _925;
    float _985 = _949 * _939;
    float _987 = _971 * _975;
    float _989 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _991 = _953 * _965;
    float _993 = _939 * _965;
    float _995 = _949 * _965;
    float _997 = _925 * _965;
    float _999 = _497 * _971;
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _959);
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _957);
    float _1005 = fma(_981, _977, _973);
    float _1007 = -_985;
    float _1009 = fma(_981, _983, _1007);
    float _1011 = _1001 * _987;
    float _1013 = _971 * _989;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _961);
    float _1017 = _1003 * _999;
    float _1019 = _991 * _1011;
    float _1021 = -_1011;
    float _1023 = _981 * _1021;
    float _1025 = _1015 * _1013;
    float _1027 = -_983;
    float _1029 = fma(_981, _985, _1027);
    float _1031 = fma(_1005, _1017, _1019);
    float _1033 = _995 * _1011;
    float _1035 = fma(_993, _1017, _1023);
    float _1037 = fma(_981, _973, _977);
    float _1039 = fma(_1009, _1025, _1031);
    float _1041 = fma(_1029, _1017, _1033);
    float _1043 = fma(_997, _1025, _1035);
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1037, _1025, _1041);
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1051 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1055 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1049);
    float _1057 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1053);
    float _1061 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1063 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1055);
    float _1065 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1069 = floor(_1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1075 = _653 + _1067;
    float _1077 = _639 + _1071;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1081 = _1075 + _1079;
    float _1083 = _411 + _1073;
    float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1087 = _1077 + _1085;
    float _1089 = _1081 * _1081;
    float _1091 = fma(_853, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1093 = fma(_1087, _1087, _1089);
    float _1095 = floor(_1091);
    float _1097 = sqrt(_1093);
    bool _1099 = _1097 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1101 = _1065;
    float _1103 = _1077;
    float _1105 = _1073;
    if (!_1099)
    {
        _1101 = _1077;
    }
    float _1107 = _1101;
    float _1109 = _1107;
    if (!_1099)
    {
        _1103 = _1075;
    }
    float _1111 = _1103;
    float _1113 = _1111;
    if (!_1099)
    {
        _1105 = _1083;
    }
    float _1115 = _1105;
    bool _1117 = !_1099;
    float _1119 = _1115;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1097 + _1123;
        float _1127 = rsqrt(_1093);
        float _1129 = _1125 * _1121;
        float _1131 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1133 = _1129 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = fma(_1141, _1131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1149 = fma(_1083, _1137, _1145);
        float _1151 = _1127 * _1147;
        float _1153 = fma(_1087, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_1081, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1155;
        _1109 = _1153;
        _1119 = _1149;
    }
    float _1157 = _1113;
    float _1159 = _1109;
    float _1161 = _1119;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1165 = _1157 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1169 = _1159 + _1167;
    float _1171 = -_1069;
    float _1173 = _1061 + _1171;
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1177 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1179 = -_1095;
    float _1181 = _1091 + _1179;
    float2 _3934 = float2(_1177, _1175);
    float _1183 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3934, float2(0.0), isnan(_3934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3934, float2(0.0), isnan(_3934)), level(0.0)).x;
    float2 _3944 = float2(_1181, _1173);
    float _1185 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3944, float2(0.0), isnan(_3944)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3944, float2(0.0), isnan(_3944)), level(0.0)).x;
    float _1187 = in.m_72.x;
    float _1189 = in.m_72.y;
    float _1191 = in.m_72.z;
    bool _1193 = _959 != 0.0;
    bool _1195 = isnan(_959);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.0);
    bool _1201 = _1197 || _1199;
    float _1203 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1205 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1207 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1209 = _957 == 0.0;
    bool _1211 = !_1201;
    bool _1213 = _1209 && _1211;
    float _1215 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1203);
    float _1217 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1205);
    float _1219 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1207);
    bool _1221 = _961 == 0.0;
    bool _1223 = _1221 && _1213;
    float _1225 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1227 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1229 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1231 = -_981;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1225);
    float _1235 = -_981;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1227);
    float _1239 = -_981;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1229);
    float _1243 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1245 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1215);
    float _1247 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1217);
    float _1249 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1219);
    float _1251 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1243);
    float _1253 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1233);
    float _1255 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1237);
    float _1257 = _1189;
    float _1259 = _1187;
    float _1261 = _1191;
    float _1263 = _1159;
    float _1265 = _1157;
    if (!_1223)
    {
        float _1267 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1189);
        _1257 = _1267;
    }
    float _1269 = _1257;
    float _1271 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1273 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1241);
    float _1275 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1223)
    {
        float _1277 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1187);
        _1259 = _1277;
    }
    float _1279 = _1259;
    float _1281 = _1253 * _1269;
    float _1283 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1271);
    float _1285 = _1255 * _1269;
    float _1287 = _1273 * _1269;
    float _1289 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1275);
    if (!_1223)
    {
        float _1291 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1191);
        _1261 = _1291;
    }
    float _1293 = _1261;
    float _1295 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1251);
    float _1297 = fma(_1245, _1279, _1281);
    float _1299 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1283);
    float _1301 = fma(_1247, _1279, _1285);
    float _1303 = fma(_1249, _1279, _1287);
    float _1305 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1289);
    float _1307 = fma(_1295, _1293, _1297);
    float _1309 = fma(_1299, _1293, _1301);
    float _1311 = -_411;
    float _1313 = _1311 + _1161;
    float _1315 = fma(_1305, _1293, _1303);
    float _1317 = -_639;
    float _1319 = _1317 + _1159;
    float _1321 = -_653;
    float _1323 = _1321 + _1157;
    bool _1325 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1327 = isnan(0.5);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1333 = _1329 || _1331;
    float _1335 = fma(_1183, 100.0, _411);
    float _1337 = fma(_1183, 100.0, _1161);
    float _1339 = -_841;
    float _1341 = _1339 + _1335;
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1347 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1349 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1345);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1353 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1347);
    float _1355 = 1.0 / _1351;
    float _1357 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1353);
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1361 = _1359 + _1351;
    float _1363 = _1361 * _1355;
    float _1365 = _1363 * 0.5;
    float _1367 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1369 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1367);
    float _1371 = _1313 * _1313;
    float _1373 = fma(_1319, _1319, _1371);
    float _1375 = 1.0 / _1369;
    float _1377 = fma(_1323, _1323, _1373);
    float _1379 = sqrt(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1383 = _1375 * _1381;
    float _1385 = abs(_1383);
    float _1387 = log2(_1385);
    bool _1389 = _1379 > 0.0;
    float _1391 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1393 = _1387;
    float _1395 = _1375;
    if (!_1389)
    {
        _1393 = _1337;
    }
    float _1397 = _1393;
    float _1399 = exp2(_1391);
    bool _1401 = !_1389;
    float _1403 = _1397;
    if (!_1401)
    {
        float _1405 = _193 * _193;
        float _1407 = fma(_197, _197, _1405);
        float _1409 = fma(_199, _199, _1407);
        float _1411 = rsqrt(_1377);
        float _1413 = sqrt(_1409);
        float _1415 = _1319 * _1411;
        float _1417 = _1313 * _1411;
        float _1419 = _1323 * _1411;
        bool _1421 = _1413 > 0.0;
        float _1423 = _1413;
        _1395 = _1409;
        if (!_1421)
        {
            _1423 = _1337;
        }
        float _1425 = _1423;
        bool _1427 = !_1421;
        _1403 = _1425;
        if (!_1427)
        {
            float _1429 = rsqrt(_1409);
            float _1431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1433 = _193 * _1429;
            float _1435 = _197 * _1429;
            float _1437 = _199 * _1429;
            float _1439 = _1417 * _1433;
            float _1441 = fma(_1415, _1435, _1439);
            float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1445 = fma(_1419, _1437, _1441);
            float _1447 = _1445 * _1443;
            float _1449 = fma(_197, _1447, _1159);
            float _1451 = fma(_193, _1447, _1337);
            float _1453 = fma(_199, _1447, _1157);
            _1263 = _1449;
            _1265 = _1453;
            _1403 = _1451;
        }
    }
    float _1455 = _1263;
    float _1457 = _1265;
    float _1459 = _1403;
    float _1461 = _1395;
    float _1463 = -_839;
    float _1465 = _1463 + _1455;
    float _1467 = -_849;
    float _1469 = _1467 + _1457;
    bool _1471 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1479 = _1475 || _1477;
    float _1481 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = -_841;
    float _1487 = _1485 + _1459;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _1491 = _1487;
    float _1493 = _1469;
    float _1495 = _1461;
    if (_1333)
    {
        _1489 = _1465;
    }
    float _1497 = _1489;
    float _1499 = fma(_1483, -2.0, 3.0);
    float _1501 = _1483 * _1483;
    float _1503 = _1497;
    if (!_1333)
    {
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1507 = _1341 + _1505;
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1511 = -_653;
        float _1513 = _1511 + _1457;
        float _1515 = -_639;
        float _1517 = _1515 + _1455;
        float _1519 = _1507 * _1507;
        float _1521 = -_1335;
        float _1523 = _1521 + _1459;
        float _1525 = fma(_867, _867, _1519);
        float _1527 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1529 = fma(_877, _877, _1525);
        float _1531 = 1.0 / _971;
        float _1533 = sqrt(_1529);
        float _1535 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1509;
        float _1541 = _1539 * _1531;
        float _1543 = _1535 * _1541;
        float _1545 = _1513 * _1541;
        float _1547 = fma(_1517, _1543, _853);
        float _1549 = fma(_1523, _1543, _1341);
        float _1551 = fma(_1535, _1545, _863);
        _1491 = _1549;
        _1503 = _1547;
        _1493 = _1551;
        _929 = _1535;
    }
    float _1553 = _1491;
    float _1555 = _1503;
    float _1557 = _1493;
    float _1559 = _929;
    float _1561 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1563 = _1501 * _1499;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1567 = _1559;
    if (_1479)
    {
        _1567 = 1.0;
    }
    float _1569 = _1567;
    float _1571 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1561);
    float _1573 = -_1563;
    float _1575 = _1573 + 1.0;
    float _1577 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1565);
    float _1579 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1571);
    float _1581 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1563);
    float _1583 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1577);
    float _1585 = _1575;
    float _1587 = _1569;
    if (_1479)
    {
        _1585 = 1.0;
    }
    float _1589 = _1585;
    float _1591 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = _1589;
    if (!_1479)
    {
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = _1595 * 0.15915493667125701904296875;
        float _1599 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = _1597 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        float _1609 = _1599 * 0.15915493667125701904296875;
        float _1611 = _1597 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1607;
        float _1617 = _1609 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = _1613 * _1615;
        float _1623 = _1609 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1603;
        float _1631 = 1.0 / _1627;
        float _1633 = _1625 * _1631;
        float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1637 = fma(_1383, _1633, _1635);
        float _1639 = _1637 * _1629;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1593 = _1641;
    }
    float _1643 = _1593;
    if (!_1479)
    {
        float _1645 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1647 = _1645 * 0.15915493667125701904296875;
        float _1649 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1651 = _1647 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1649 * 0.15915493667125701904296875;
        float _1657 = _1647 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = 1.0 / _1653;
        float _1663 = _1655 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        float _1667 = _1659 * _1661;
        float _1669 = _1655 * 6.283185482025146484375;
        float _1671 = sin(_1669);
        float _1673 = _1665 * _1667;
        float _1675 = 1.0 / _1673;
        float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1679 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1677;
        float _1681 = 1.0 / _1679;
        float _1683 = _1671 * _1675;
        float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1687 = fma(_1383, _1683, _1685);
        float _1689 = _1687 * _1681;
        float _1691 = precise::clamp(_1689, 0.0, 1.0);
        float _1693 = -_1691;
        float _1695 = _1693 + 1.0;
        _1587 = _1695;
    }
    float _1697 = _1587;
    bool _1699 = _1383 <= 8000.0;
    bool _1701 = isnan(_1383);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(8000.0);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1715 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1717 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1719 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1721 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1713);
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1715);
    float _1725 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1717);
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1719);
    float _1729 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1731 = in.m_58.x;
    float _1733 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1737 = _1553 + _1735;
    float _1739 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1729);
    float _1741 = _1709 * _1581;
    float _1743 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1733);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1747 = _1555 + _1745;
    float _1749 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1751 = _1737 * _1737;
    float _1753 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1755 = -_1185;
    float _1757 = _1755 + 1.0;
    float _1759 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1761 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1763 = fma(_1747, _1747, _1751);
    float _1765 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1557 + _1767;
    float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1721);
    float _1773 = _1757 * _1761;
    float _1775 = precise::clamp(_1773, 0.0, 1.0);
    float _1777 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1725);
    float _1779 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1727);
    float _1781 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1723);
    float _1783 = fma(_1769, _1769, _1763);
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1771);
    float _1787 = -_1775;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1791 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1777);
    float _1793 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1779);
    float _1795 = sqrt(_1783);
    float _1797 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1781);
    float _1799 = _1789 * _1731;
    float _1801 = _1785 + _1793;
    float _1803 = _1791 + _1793;
    float _1805 = _1793 * 0.5;
    float _1807 = _1801 * 0.5;
    float _1809 = _1803 * 0.5;
    float _1811 = fma(_1797, -0.5, _1805);
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_74.x = _1307;
    out.m_74.y = _1309;
    out.m_74.z = _1315;
    float _1815 = _1643 * _1697;
    out.m_76.x = _1807;
    out.m_76.y = _1811;
    out.m_76.z = _1809;
    out.m_76.w = _1793;
    bool _1817 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1819 = isnan(_1795);
    bool _1821 = _1817 || _1819;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1825 = _1821 || _1823;
    float _1827 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_78.x = _1813;
    out.gl_Position.x = _1785;
    out.gl_Position.y = _1797;
    out.gl_Position.z = _1791;
    out.gl_Position.w = _1793;
    float _1829 = _1783;
    float _1831 = _1805;
    float _1833 = _1725;
    float _1835 = _1785;
    float _1837 = _1815;
    if (!_1825)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1839 = _1829;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1825)
    {
        _1495 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1495;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1825)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1851 = _1831;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1825)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1857 = _1833;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1825)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1863 = _1835;
    float _1865 = _1863;
    float _1867 = _1863;
    if (!_1825)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1837;
    bool _1871 = !_1825;
    float _1873 = _1869;
    float _1875 = _1869;
    if (!_1871)
    {
        bool _1877 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1795);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1795 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1849 = _1929;
            _1867 = _1933;
            _1843 = _1925;
            _1861 = _1927;
            _1855 = _1931;
            _1875 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1795);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1841;
            _1843 = _1949;
            if (!_1947)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1847;
            _1849 = _1951;
            if (!_1947)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1853;
            _1855 = _1953;
            if (!_1947)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1859;
            _1861 = _1955;
            if (!_1947)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1865;
            _1867 = _1957;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1873;
            bool _1961 = !_1947;
            _1875 = _1959;
            if (!_1961)
            {
                bool _1963 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1795);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1795 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1849 = _2015;
                    _1867 = _2019;
                    _1843 = _2011;
                    _1861 = _2013;
                    _1855 = _2017;
                    _1875 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1849;
    float _2025 = _1867;
    float _2027 = _1843;
    float _2029 = _1861;
    float _2031 = _1855;
    float _2033 = _1875;
    float _2035 = fma(_1309, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2045 = -_2027;
    float _2047 = _2045 + _2029;
    float _2049 = fma(_2037, _2041, _2023);
    out.m_80.x = 0.0;
    float _2051 = -_2031;
    float _2053 = _2051 + _2033;
    float _2055 = fma(_2037, _2047, _2027);
    float _2057 = _2049 * 0.586610972881317138671875;
    out.m_42.x = _2043;
    bool _2059 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2061 = fma(_2037, _2053, _2031);
    float _2063 = fma(_2055, 0.298911988735198974609375, _2057);
    bool _2065 = _1643 > 0.0;
    bool _2067 = isnan(_1643);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = fma(_2061, 0.114477999508380889892578125, _2063);
    bool _2077 = _1697 <= 0.0;
    bool _2079 = !_2073;
    bool _2081 = _2077 || _2079;
    float _2083 = -_2075;
    float _2085 = _2055 + _2083;
    float _2087 = -_2075;
    float _2089 = _2049 + _2087;
    float _2091 = -_2075;
    float _2093 = _2061 + _2091;
    float _2095 = fma(_2085, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    float _2097 = fma(_2089, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    float _2099 = fma(_2093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    bool _2101 = !_2059;
    if (!_2101)
    {
        float _2103 = -_1553;
        float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2107 = -_1555;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2111 = -_1557;
        float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2115 = _2105 * _2105;
        float _2117 = fma(_2109, _2109, _2115);
        float _2119 = fma(_2113, _2113, _2117);
        float _2121 = sqrt(_2119);
        float _2123 = rsqrt(_2119);
        float _2125 = -_2121;
        float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2131 = precise::clamp(_2129, 0.0, 1.0);
        float _2133 = _2109 * _2123;
        float _2135 = _2105 * _2123;
        float _2137 = abs(_2131);
        float _2139 = log2(_2137);
        float _2141 = _2113 * _2123;
        float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2145 = _1309 * _2135;
        float _2147 = -_2135;
        float _2149 = -_2143;
        float _2151 = fma(_2147, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2149);
        float _2153 = fma(_1307, _2133, _2145);
        float _2155 = -_2141;
        float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2151);
        float _2159 = fma(_1315, _2141, _2153);
        float _2161 = precise::clamp(_2159, 0.0, 1.0);
        float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2165 = _2157 + _2163;
        float _2167 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2169 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2171 = precise::clamp(_2169, 0.0, 1.0);
        float _2173 = exp2(_2167);
        float _2175 = _2173 * _2171;
        float _2177 = _2161 * _2175;
        float _2179 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2181 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2183 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _2179;
        out.m_80.y = _2181;
        out.m_80.z = _2183;
    }
    out.m_82.x = _2095;
    out.m_82.y = _2097;
    out.m_82.z = _2099;
    if (!_2081)
    {
        return out;
    }
    float _2185 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_42.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2185;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1937 = false;
    bool _335 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_39.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_42.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2242 = as_type<float>(_117);
        out.gl_Position.z = _2242;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_44.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_42.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2311 = as_type<float>(_155);
        out.gl_Position.z = _2311;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_46.x;
    float _159 = in.m_46.y;
    float _161 = in.m_46.z;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_50.x;
    float _173 = in.m_50.y;
    float _175 = in.m_50.z;
    float _177 = in.m_52.x;
    float _179 = in.m_52.y;
    float _181 = in.m_52.z;
    float _183 = _159 * _167;
    float _185 = _159 * _173;
    float _187 = fma(_157, _165, _183);
    float _189 = _159 * _179;
    float _191 = fma(_157, _171, _185);
    float _193 = fma(_161, _169, _187);
    float _195 = fma(_157, _177, _189);
    float _197 = fma(_161, _175, _191);
    float _199 = fma(_161, _181, _195);
    bool _201 = !_163;
    float _219;
    if (!_201)
    {
        float _203 = in.m_54.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_101);
        float _225 = 1.0 / _223;
        float _227 = _135 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _249;
    float _255 = -_245;
    float _257 = _255 + 1.0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _259;
    float _263 = _233 * _253;
    bool _265 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_229);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = fma(_261, _263, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = _275 * _257;
    float _289 = fma(_279, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = fma(_285, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _293 = -_275;
    float _295 = _293 + 1.0;
    float _297 = _281 * _287;
    float _299 = _289 * _287;
    float _301 = _291 * _287;
    float _303 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].z, _297);
    float _305 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _309 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[144].z, _303);
    bool _315 = !_251;
    float _333;
    if (!_315)
    {
        float _317 = in.m_54.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_101);
        float _339 = 1.0 / _337;
        float _341 = _135 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = in.m_56.x;
    float _347 = in.m_56.y;
    float _349 = in.m_56.z;
    float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _353 = log2(_351);
    float _355 = in.m_39.x;
    float _357 = in.m_39.y;
    float _359 = in.m_39.z;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _367 = _365 != 0;
    float _369 = in.m_58.y;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _381 = _379 != 0;
    float _383 = in.m_60.y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _387 = in.m_54.y;
    float _389 = _353 * _135;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _393 = in.m_54.x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _397 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _309 * _345;
    float _403 = in.m_54.z;
    float _405 = exp2(_389);
    float _407 = _173 * _357;
    float _409 = _179 * _357;
    float _411 = _357 + _369;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _415 = in.m_60.x;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _421 = -_383;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _429 = fma(_171, _355, _407);
    float _431 = fma(_177, _355, _409);
    bool _433 = _387 > 0.5;
    float _435 = 1.0 / _419;
    float _437 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _383;
    float _441 = _397;
    if (_363)
    {
        float _443 = _433 ? _423 : _383;
        _439 = _443;
    }
    float _445 = _439;
    float _447 = fma(_181, _359, _431);
    bool _449 = _393 > 0.5;
    bool _451 = _449 && _367;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = 1.0 / _427;
    float _459 = _403 * 2.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_62.x = _397;
    out.m_62.y = _437;
    out.m_62.z = _399;
    out.m_62.w = _395;
    bool _465 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _467 = isnan(1.0);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _473 = _469 || _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _477 = 1.0 + _475;
    float _479 = -_405;
    float _481 = _479 + 1.0;
    float _483 = in.m_50.w;
    float _485 = floor(_459);
    float _487 = fma(_175, _359, _429);
    float _489 = _463 * _435;
    float _491 = _387 + _403;
    float _493 = _463;
    if (!_367)
    {
        _493 = _415;
    }
    float _495 = _493;
    float _497 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _499 = _491 + (-1.0);
    float _501 = _455 * _457;
    float _503 = _495;
    if (_367)
    {
        _441 = _415;
    }
    float _505 = _441;
    float _507 = _393 * 2.0;
    float _509 = 1.0 / _477;
    float _511 = _393 + _387;
    float _513 = _505;
    if (_451)
    {
        float _515 = -_505;
        float _517 = _515 + 1.0;
        _513 = _517;
    }
    float _519 = _513;
    float _521 = in.m_52.w;
    bool _523 = _485 > 0.0;
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _527 = _485 >= 0.0;
    bool _529 = isnan(_485);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    float _537 = _387 * 2.0;
    float _539 = floor(_507);
    int _541 = as_type<int>(_525);
    if (_367)
    {
        _503 = _519;
    }
    float _543 = _503;
    float _545 = _511 + (-1.0);
    bool _547 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _555 = _551 || _553;
    float _557 = _387 + (-0.5);
    bool _559 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = isnan(_343);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _573 = _555 ? _481 : 0.0;
    float _575 = floor(_537);
    bool _577 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_343);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -_569;
    float _591 = _589 + 1.0;
    bool _593 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _595 = isnan(_343);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    if (_473)
    {
        float _605 = _573 * _509;
        _139 = _605;
    }
    float _607 = _139;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _343 + _609;
    float _613 = _587 * _591;
    float _615 = -_587;
    float _617 = _615 + 1.0;
    bool _619 = _539 > 0.0;
    float _621 = fma(_501, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _623 = _539 >= 0.0;
    bool _625 = isnan(_539);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = _603 * _617;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _343 + _635;
    float _639 = _487 + _483;
    int _641 = _631 ? 0 : 1;
    float _643 = _621 * _633;
    float _645 = -_603;
    float _647 = _645 + 1.0;
    float _649 = fma(_489, _637, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _651 = _535 ? 0 : 1;
    float _653 = _447 + _521;
    int _655 = ~_641;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    float _661 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    int _663 = _659;
    if (!_619)
    {
        int _665 = ~_641;
        int _667 = _665 + 1;
        _663 = _667;
    }
    int _669 = _663;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _673 = _411 + _671;
    bool _675 = !_373;
    int _677 = _675 ? 0 : 1;
    float _679 = fma(_649, _613, _661);
    bool _681 = _575 > 0.0;
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _685 = ~_651;
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _693 = _653 + _691;
    int _695 = _689;
    if (!_523)
    {
        int _697 = ~_651;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _639 + _703;
    int _707 = abs(_677);
    float _709 = _673 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _711 = _575 >= 0.0;
    bool _713 = isnan(_575);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _723 = float(_701);
    float _725 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _709);
    int _727 = _719 ? 0 : 1;
    float _729 = _543 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _731 = float(_707);
    float _733 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _725);
    int _735 = ~_727;
    int _737 = _735 + 1;
    int _739 = _737 + 1;
    float _741 = _445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _743 = _739;
    if (!_681)
    {
        int _745 = ~_727;
        int _747 = _745 + 1;
        _743 = _747;
    }
    int _749 = _743;
    float _751 = _731 * _723;
    bool _753 = _733 >= 0.0;
    float _755 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[117].x, _679);
    bool _757 = !_377;
    int _759 = _757 ? 0 : 1;
    float _761 = _741 * _683;
    float _763 = in.m_64.x;
    float _765 = in.m_64.y;
    float _767 = in.m_64.z;
    float _769 = _729 * _721;
    float _771 = _673 * _673;
    int _773 = abs(_759);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _779 = float(_669);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _783 = float(_773);
    float _785 = fma(_705, _705, _771);
    float _787 = _751 * (-2.0);
    float _789 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _783 * _779;
    float _795 = fma(_693, _693, _785);
    float _797 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _755 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _769;
    out.m_66.y = _761;
    float _801 = _793 * (-2.0);
    float _803 = fma(_571, _787, _571);
    float _805 = rsqrt(_795);
    out.m_68.x = _789;
    out.m_68.y = _791;
    out.m_68.z = _797;
    out.m_68.w = _799;
    float _807 = fma(_525, _801, _525);
    float _809 = fma(_787, _763, _763);
    float _811 = _393 + (-0.5);
    float _813 = _769;
    float _815 = _767;
    if (_753)
    {
        out.m_42.x = 0.0;
    }
    if (_753)
    {
        _813 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _817 = _813;
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[196].x, _809);
    float _821 = _497 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _823 = fma(_801, _765, _765);
    if (_753)
    {
        float _825 = _817 * 5.0;
        _541 = as_type<int>(_825);
    }
    int _827 = _541;
    float _829 = fma(_803, _607, _819);
    bool _831 = !_381;
    int _833 = _831 ? 0 : 1;
    float _835 = _821 * _805;
    if (_753)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3362 = as_type<float>(_827);
        out.gl_Position.z = _3362;
    }
    int _837 = abs(_833);
    float _839 = _705 * _835;
    float _841 = _673 * _835;
    float _843 = float(_837);
    if (_753)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _845 = -_841;
    float _847 = _411 + _845;
    float _849 = _693 * _835;
    float _851 = -_839;
    float _853 = _639 + _851;
    float _855 = float(_749);
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _859 = _847 + _857;
    float _861 = -_849;
    float _863 = _653 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _867 = _853 + _865;
    float _869 = -_841;
    float _871 = _673 + _869;
    float _873 = _859 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _863 + _875;
    float _879 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _823);
    float _881 = _393 + _403;
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[28].x, _873);
    float _885 = _843 * _855;
    float _887 = -_839;
    float _889 = _705 + _887;
    float _891 = _871 * _871;
    float _893 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _883);
    float _895 = fma(_807, _607, _879);
    float _897 = _881 + (-1.0);
    float _899 = _885 * (-2.0);
    bool _901 = _893 >= 0.0;
    float _903 = fma(_889, _889, _891);
    float _905 = -_849;
    float _907 = _693 + _905;
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _911 = _403 + (-0.5);
    float _913 = fma(_899, _767, _767);
    float _915 = _895 * 0.15915493667125701904296875;
    float _917 = fma(_907, _907, _903);
    float _919 = fma(_909, _899, _909);
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[196].z, _913);
    float _923 = _915 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = _829 * 0.15915493667125701904296875;
    float _929 = _849;
    if (_901)
    {
        _815 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _931 = _815;
    float _933 = fma(_919, _607, _921);
    int _935 = as_type<int>(_931);
    if (_901)
    {
        out.m_42.x = 0.0;
    }
    float _937 = _915 * 6.283185482025146484375;
    float _939 = cos(_937);
    if (_901)
    {
        float _941 = _931 * 5.0;
        _935 = as_type<int>(_941);
    }
    int _943 = _935;
    if (_901)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3542 = as_type<float>(_943);
        out.gl_Position.z = _3542;
    }
    float _945 = sqrt(_917);
    float _947 = _927 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _927 * 6.283185482025146484375;
    float _953 = cos(_951);
    float _955 = _933 * 0.15915493667125701904296875;
    if (_901)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _957 = in.m_70.x;
    float _959 = in.m_70.y;
    float _961 = in.m_70.z;
    float _963 = _955 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = _313 * _349;
    float _969 = _311 * _347;
    float _971 = _805 * _945;
    float _973 = _949 * _925;
    float _975 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _977 = _953 * _939;
    float _979 = _955 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _953 * _925;
    float _985 = _949 * _939;
    float _987 = _971 * _975;
    float _989 = _967 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _991 = _953 * _965;
    float _993 = _939 * _965;
    float _995 = _949 * _965;
    float _997 = _925 * _965;
    float _999 = _497 * _971;
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _959);
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _957);
    float _1005 = fma(_981, _977, _973);
    float _1007 = -_985;
    float _1009 = fma(_981, _983, _1007);
    float _1011 = _1001 * _987;
    float _1013 = _971 * _989;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _961);
    float _1017 = _1003 * _999;
    float _1019 = _991 * _1011;
    float _1021 = -_1011;
    float _1023 = _981 * _1021;
    float _1025 = _1015 * _1013;
    float _1027 = -_983;
    float _1029 = fma(_981, _985, _1027);
    float _1031 = fma(_1005, _1017, _1019);
    float _1033 = _995 * _1011;
    float _1035 = fma(_993, _1017, _1023);
    float _1037 = fma(_981, _973, _977);
    float _1039 = fma(_1009, _1025, _1031);
    float _1041 = fma(_1029, _1017, _1033);
    float _1043 = fma(_997, _1025, _1035);
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1047 = fma(_1037, _1025, _1041);
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1051 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1045);
    float _1055 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1049);
    float _1057 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1053);
    float _1061 = fma(_863, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1063 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1055);
    float _1065 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1069 = floor(_1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1075 = _653 + _1067;
    float _1077 = _639 + _1071;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1081 = _1075 + _1079;
    float _1083 = _411 + _1073;
    float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1087 = _1077 + _1085;
    float _1089 = _1081 * _1081;
    float _1091 = fma(_853, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1093 = fma(_1087, _1087, _1089);
    float _1095 = floor(_1091);
    float _1097 = sqrt(_1093);
    bool _1099 = _1097 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1101 = _1065;
    float _1103 = _1077;
    float _1105 = _1073;
    if (!_1099)
    {
        _1101 = _1077;
    }
    float _1107 = _1101;
    float _1109 = _1107;
    if (!_1099)
    {
        _1103 = _1075;
    }
    float _1111 = _1103;
    float _1113 = _1111;
    if (!_1099)
    {
        _1105 = _1083;
    }
    float _1115 = _1105;
    bool _1117 = !_1099;
    float _1119 = _1115;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1097 + _1123;
        float _1127 = rsqrt(_1093);
        float _1129 = _1125 * _1121;
        float _1131 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1133 = _1129 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = fma(_1141, _1131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1149 = fma(_1083, _1137, _1145);
        float _1151 = _1127 * _1147;
        float _1153 = fma(_1087, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_1081, _1151, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1155;
        _1109 = _1153;
        _1119 = _1149;
    }
    float _1157 = _1113;
    float _1159 = _1109;
    float _1161 = _1119;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1165 = _1157 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1169 = _1159 + _1167;
    float _1171 = -_1069;
    float _1173 = _1061 + _1171;
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1177 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1179 = -_1095;
    float _1181 = _1091 + _1179;
    float2 _3934 = float2(_1177, _1175);
    float _1183 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3934, float2(0.0), isnan(_3934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3934, float2(0.0), isnan(_3934)), level(0.0)).x;
    float2 _3944 = float2(_1181, _1173);
    float _1185 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3944, float2(0.0), isnan(_3944)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3944, float2(0.0), isnan(_3944)), level(0.0)).x;
    float _1187 = in.m_72.x;
    float _1189 = in.m_72.y;
    float _1191 = in.m_72.z;
    bool _1193 = _959 != 0.0;
    bool _1195 = isnan(_959);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.0);
    bool _1201 = _1197 || _1199;
    float _1203 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1205 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1207 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1209 = _957 == 0.0;
    bool _1211 = !_1201;
    bool _1213 = _1209 && _1211;
    float _1215 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1203);
    float _1217 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1205);
    float _1219 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1207);
    bool _1221 = _961 == 0.0;
    bool _1223 = _1221 && _1213;
    float _1225 = _991 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1227 = _991 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1229 = _991 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1231 = -_981;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1225);
    float _1235 = -_981;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1227);
    float _1239 = -_981;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1229);
    float _1243 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1245 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1215);
    float _1247 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1217);
    float _1249 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1219);
    float _1251 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1243);
    float _1253 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1233);
    float _1255 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1237);
    float _1257 = _1189;
    float _1259 = _1187;
    float _1261 = _1191;
    float _1263 = _1159;
    float _1265 = _1157;
    if (!_1223)
    {
        float _1267 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1189);
        _1257 = _1267;
    }
    float _1269 = _1257;
    float _1271 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1273 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1241);
    float _1275 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1223)
    {
        float _1277 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1187);
        _1259 = _1277;
    }
    float _1279 = _1259;
    float _1281 = _1253 * _1269;
    float _1283 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1271);
    float _1285 = _1255 * _1269;
    float _1287 = _1273 * _1269;
    float _1289 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1275);
    if (!_1223)
    {
        float _1291 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1191);
        _1261 = _1291;
    }
    float _1293 = _1261;
    float _1295 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1251);
    float _1297 = fma(_1245, _1279, _1281);
    float _1299 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1283);
    float _1301 = fma(_1247, _1279, _1285);
    float _1303 = fma(_1249, _1279, _1287);
    float _1305 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1289);
    float _1307 = fma(_1295, _1293, _1297);
    float _1309 = fma(_1299, _1293, _1301);
    float _1311 = -_411;
    float _1313 = _1311 + _1161;
    float _1315 = fma(_1305, _1293, _1303);
    float _1317 = -_639;
    float _1319 = _1317 + _1159;
    float _1321 = -_653;
    float _1323 = _1321 + _1157;
    bool _1325 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1327 = isnan(0.5);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1333 = _1329 || _1331;
    float _1335 = fma(_1183, 100.0, _411);
    float _1337 = fma(_1183, 100.0, _1161);
    float _1339 = -_841;
    float _1341 = _1339 + _1335;
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1347 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1349 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1345);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1353 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1347);
    float _1355 = 1.0 / _1351;
    float _1357 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1353);
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1361 = _1359 + _1351;
    float _1363 = _1361 * _1355;
    float _1365 = _1363 * 0.5;
    float _1367 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1369 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1367);
    float _1371 = _1313 * _1313;
    float _1373 = fma(_1319, _1319, _1371);
    float _1375 = 1.0 / _1369;
    float _1377 = fma(_1323, _1323, _1373);
    float _1379 = sqrt(_1377);
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1383 = _1375 * _1381;
    float _1385 = abs(_1383);
    float _1387 = log2(_1385);
    bool _1389 = _1379 > 0.0;
    float _1391 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1393 = _1387;
    float _1395 = _1375;
    if (!_1389)
    {
        _1393 = _1337;
    }
    float _1397 = _1393;
    float _1399 = exp2(_1391);
    bool _1401 = !_1389;
    float _1403 = _1397;
    if (!_1401)
    {
        float _1405 = _193 * _193;
        float _1407 = fma(_197, _197, _1405);
        float _1409 = fma(_199, _199, _1407);
        float _1411 = rsqrt(_1377);
        float _1413 = sqrt(_1409);
        float _1415 = _1319 * _1411;
        float _1417 = _1313 * _1411;
        float _1419 = _1323 * _1411;
        bool _1421 = _1413 > 0.0;
        float _1423 = _1413;
        _1395 = _1409;
        if (!_1421)
        {
            _1423 = _1337;
        }
        float _1425 = _1423;
        bool _1427 = !_1421;
        _1403 = _1425;
        if (!_1427)
        {
            float _1429 = rsqrt(_1409);
            float _1431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1433 = _193 * _1429;
            float _1435 = _197 * _1429;
            float _1437 = _199 * _1429;
            float _1439 = _1417 * _1433;
            float _1441 = fma(_1415, _1435, _1439);
            float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1445 = fma(_1419, _1437, _1441);
            float _1447 = _1445 * _1443;
            float _1449 = fma(_197, _1447, _1159);
            float _1451 = fma(_193, _1447, _1337);
            float _1453 = fma(_199, _1447, _1157);
            _1263 = _1449;
            _1265 = _1453;
            _1403 = _1451;
        }
    }
    float _1455 = _1263;
    float _1457 = _1265;
    float _1459 = _1403;
    float _1461 = _1395;
    float _1463 = -_839;
    float _1465 = _1463 + _1455;
    float _1467 = -_849;
    float _1469 = _1467 + _1457;
    bool _1471 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1479 = _1475 || _1477;
    float _1481 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = -_841;
    float _1487 = _1485 + _1459;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _1491 = _1487;
    float _1493 = _1469;
    float _1495 = _1461;
    if (_1333)
    {
        _1489 = _1465;
    }
    float _1497 = _1489;
    float _1499 = fma(_1483, -2.0, 3.0);
    float _1501 = _1483 * _1483;
    float _1503 = _1497;
    if (!_1333)
    {
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1507 = _1341 + _1505;
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1511 = -_653;
        float _1513 = _1511 + _1457;
        float _1515 = -_639;
        float _1517 = _1515 + _1455;
        float _1519 = _1507 * _1507;
        float _1521 = -_1335;
        float _1523 = _1521 + _1459;
        float _1525 = fma(_867, _867, _1519);
        float _1527 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1529 = fma(_877, _877, _1525);
        float _1531 = 1.0 / _971;
        float _1533 = sqrt(_1529);
        float _1535 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1509;
        float _1541 = _1539 * _1531;
        float _1543 = _1535 * _1541;
        float _1545 = _1513 * _1541;
        float _1547 = fma(_1517, _1543, _853);
        float _1549 = fma(_1523, _1543, _1341);
        float _1551 = fma(_1535, _1545, _863);
        _1491 = _1549;
        _1503 = _1547;
        _1493 = _1551;
        _929 = _1535;
    }
    float _1553 = _1491;
    float _1555 = _1503;
    float _1557 = _1493;
    float _1559 = _929;
    float _1561 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1563 = _1501 * _1499;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1567 = _1559;
    if (_1479)
    {
        _1567 = 1.0;
    }
    float _1569 = _1567;
    float _1571 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1561);
    float _1573 = -_1563;
    float _1575 = _1573 + 1.0;
    float _1577 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1565);
    float _1579 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1571);
    float _1581 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1563);
    float _1583 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1577);
    float _1585 = _1575;
    float _1587 = _1569;
    if (_1479)
    {
        _1585 = 1.0;
    }
    float _1589 = _1585;
    float _1591 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1593 = _1589;
    if (!_1479)
    {
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = _1595 * 0.15915493667125701904296875;
        float _1599 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = _1597 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        float _1609 = _1599 * 0.15915493667125701904296875;
        float _1611 = _1597 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1607;
        float _1617 = _1609 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = _1613 * _1615;
        float _1623 = _1609 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1603;
        float _1631 = 1.0 / _1627;
        float _1633 = _1625 * _1631;
        float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1637 = fma(_1383, _1633, _1635);
        float _1639 = _1637 * _1629;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1593 = _1641;
    }
    float _1643 = _1593;
    if (!_1479)
    {
        float _1645 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1647 = _1645 * 0.15915493667125701904296875;
        float _1649 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1651 = _1647 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1649 * 0.15915493667125701904296875;
        float _1657 = _1647 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = 1.0 / _1653;
        float _1663 = _1655 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        float _1667 = _1659 * _1661;
        float _1669 = _1655 * 6.283185482025146484375;
        float _1671 = sin(_1669);
        float _1673 = _1665 * _1667;
        float _1675 = 1.0 / _1673;
        float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1679 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1677;
        float _1681 = 1.0 / _1679;
        float _1683 = _1671 * _1675;
        float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1687 = fma(_1383, _1683, _1685);
        float _1689 = _1687 * _1681;
        float _1691 = precise::clamp(_1689, 0.0, 1.0);
        float _1693 = -_1691;
        float _1695 = _1693 + 1.0;
        _1587 = _1695;
    }
    float _1697 = _1587;
    bool _1699 = _1383 <= 8000.0;
    bool _1701 = isnan(_1383);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(8000.0);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1715 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1717 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1719 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1721 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1713);
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1715);
    float _1725 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1717);
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1719);
    float _1729 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1731 = in.m_58.x;
    float _1733 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1737 = _1553 + _1735;
    float _1739 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1729);
    float _1741 = _1709 * _1581;
    float _1743 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1733);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1747 = _1555 + _1745;
    float _1749 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1751 = _1737 * _1737;
    float _1753 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1755 = -_1185;
    float _1757 = _1755 + 1.0;
    float _1759 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1761 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1763 = fma(_1747, _1747, _1751);
    float _1765 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1769 = _1557 + _1767;
    float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1721);
    float _1773 = _1757 * _1761;
    float _1775 = precise::clamp(_1773, 0.0, 1.0);
    float _1777 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1725);
    float _1779 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1727);
    float _1781 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1723);
    float _1783 = fma(_1769, _1769, _1763);
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1771);
    float _1787 = -_1775;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1791 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1777);
    float _1793 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1779);
    float _1795 = sqrt(_1783);
    float _1797 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1781);
    float _1799 = _1789 * _1731;
    float _1801 = _1785 + _1793;
    float _1803 = _1791 + _1793;
    float _1805 = _1793 * 0.5;
    float _1807 = _1801 * 0.5;
    float _1809 = _1803 * 0.5;
    float _1811 = fma(_1797, -0.5, _1805);
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_74.x = _1307;
    out.m_74.y = _1309;
    out.m_74.z = _1315;
    float _1815 = _1643 * _1697;
    out.m_76.x = _1807;
    out.m_76.y = _1811;
    out.m_76.z = _1809;
    out.m_76.w = _1793;
    bool _1817 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1819 = isnan(_1795);
    bool _1821 = _1817 || _1819;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1825 = _1821 || _1823;
    float _1827 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_78.x = _1813;
    out.gl_Position.x = _1785;
    out.gl_Position.y = _1797;
    out.gl_Position.z = _1791;
    out.gl_Position.w = _1793;
    float _1829 = _1783;
    float _1831 = _1805;
    float _1833 = _1725;
    float _1835 = _1785;
    float _1837 = _1815;
    if (!_1825)
    {
        _1829 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1839 = _1829;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1825)
    {
        _1495 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1845 = _1495;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1825)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1851 = _1831;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1825)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1857 = _1833;
    float _1859 = _1857;
    float _1861 = _1857;
    if (!_1825)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1863 = _1835;
    float _1865 = _1863;
    float _1867 = _1863;
    if (!_1825)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1837;
    bool _1871 = !_1825;
    float _1873 = _1869;
    float _1875 = _1869;
    if (!_1871)
    {
        bool _1877 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1879 = isnan(_1795);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1885 = _1881 || _1883;
        if (!_1885)
        {
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1889 = _1795 + _1887;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1893 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1891;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1899 = 1.0 / _1893;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1917 = _1889 * _1899;
            float _1919 = precise::clamp(_1917, 0.0, 1.0);
            float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1925 = fma(_1919, _1897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1927 = fma(_1919, _1923, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1929 = fma(_1919, _1903, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1931 = fma(_1919, _1907, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1933 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1935 = fma(_1919, _1915, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1849 = _1929;
            _1867 = _1933;
            _1843 = _1925;
            _1861 = _1927;
            _1855 = _1931;
            _1875 = _1935;
            _1937 = true;
        }
        else
        {
            bool _1939 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1941 = isnan(_1795);
            bool _1943 = _1939 || _1941;
            bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1947 = _1943 || _1945;
            if (!_1947)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1949 = _1841;
            _1843 = _1949;
            if (!_1947)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1951 = _1847;
            _1849 = _1951;
            if (!_1947)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1953 = _1853;
            _1855 = _1953;
            if (!_1947)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1955 = _1859;
            _1861 = _1955;
            if (!_1947)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1957 = _1865;
            _1867 = _1957;
            if (!_1947)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1959 = _1873;
            bool _1961 = !_1947;
            _1875 = _1959;
            if (!_1961)
            {
                bool _1963 = _1795 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1965 = isnan(_1795);
                bool _1967 = _1963 || _1965;
                bool _1969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1971 = _1967 || _1969;
                if (!_1971)
                {
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1975 = _1795 + _1973;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1979 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1977;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1985 = 1.0 / _1979;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2003 = _1975 * _1985;
                    float _2005 = precise::clamp(_2003, 0.0, 1.0);
                    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2011 = fma(_2005, _1983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2013 = fma(_2005, _2009, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2015 = fma(_2005, _1989, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2017 = fma(_2005, _1993, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2019 = fma(_2005, _1997, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2021 = fma(_2005, _2001, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1849 = _2015;
                    _1867 = _2019;
                    _1843 = _2011;
                    _1861 = _2013;
                    _1855 = _2017;
                    _1875 = _2021;
                    _1937 = true;
                }
                else
                {
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1937 = false;
    float _2023 = _1849;
    float _2025 = _1867;
    float _2027 = _1843;
    float _2029 = _1861;
    float _2031 = _1855;
    float _2033 = _1875;
    float _2035 = fma(_1309, -0.5, 0.5);
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = -_2023;
    float _2041 = _2039 + _2025;
    float _2043 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2045 = -_2027;
    float _2047 = _2045 + _2029;
    float _2049 = fma(_2037, _2041, _2023);
    out.m_80.x = 0.0;
    float _2051 = -_2031;
    float _2053 = _2051 + _2033;
    float _2055 = fma(_2037, _2047, _2027);
    float _2057 = _2049 * 0.586610972881317138671875;
    out.m_42.x = _2043;
    bool _2059 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2061 = fma(_2037, _2053, _2031);
    float _2063 = fma(_2055, 0.298911988735198974609375, _2057);
    bool _2065 = _1643 > 0.0;
    bool _2067 = isnan(_1643);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(0.0);
    bool _2073 = _2069 || _2071;
    float _2075 = fma(_2061, 0.114477999508380889892578125, _2063);
    bool _2077 = _1697 <= 0.0;
    bool _2079 = !_2073;
    bool _2081 = _2077 || _2079;
    float _2083 = -_2075;
    float _2085 = _2055 + _2083;
    float _2087 = -_2075;
    float _2089 = _2049 + _2087;
    float _2091 = -_2075;
    float _2093 = _2061 + _2091;
    float _2095 = fma(_2085, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    float _2097 = fma(_2089, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    float _2099 = fma(_2093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2075);
    bool _2101 = !_2059;
    if (!_2101)
    {
        float _2103 = -_1553;
        float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2107 = -_1555;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2111 = -_1557;
        float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2115 = _2105 * _2105;
        float _2117 = fma(_2109, _2109, _2115);
        float _2119 = fma(_2113, _2113, _2117);
        float _2121 = sqrt(_2119);
        float _2123 = rsqrt(_2119);
        float _2125 = -_2121;
        float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2131 = precise::clamp(_2129, 0.0, 1.0);
        float _2133 = _2109 * _2123;
        float _2135 = _2105 * _2123;
        float _2137 = abs(_2131);
        float _2139 = log2(_2137);
        float _2141 = _2113 * _2123;
        float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2145 = _1309 * _2135;
        float _2147 = -_2135;
        float _2149 = -_2143;
        float _2151 = fma(_2147, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2149);
        float _2153 = fma(_1307, _2133, _2145);
        float _2155 = -_2141;
        float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2151);
        float _2159 = fma(_1315, _2141, _2153);
        float _2161 = precise::clamp(_2159, 0.0, 1.0);
        float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2165 = _2157 + _2163;
        float _2167 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2169 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2171 = precise::clamp(_2169, 0.0, 1.0);
        float _2173 = exp2(_2167);
        float _2175 = _2173 * _2171;
        float _2177 = _2161 * _2175;
        float _2179 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2181 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2183 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _2179;
        out.m_80.y = _2181;
        out.m_80.z = _2183;
    }
    out.m_82.x = _2095;
    out.m_82.y = _2097;
    out.m_82.z = _2099;
    if (!_2081)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2185 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_42.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2185;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

