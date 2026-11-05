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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_66 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3130 = as_type<float>(_113);
        out.gl_Position.z = _3130;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3199 = as_type<float>(_151);
        out.gl_Position.z = _3199;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_53.x;
    float _181 = in.m_53.y;
    float _183 = in.m_53.z;
    float _185 = in.m_55.x;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _161 * _159;
    float _191 = _155 * _155;
    float _193 = _153 * _153;
    float _195 = _157 * _157;
    float _197 = fma(_165, _165, _191);
    float _199 = fma(_163, _163, _193);
    float _201 = fma(_167, _167, _195);
    float _203 = fma(_181, _181, _197);
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_183, _183, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[20].x, _189);
    float _213 = _211 * 6.283185482025146484375;
    float _215 = sqrt(_205);
    float _217 = _213 * 0.15915493667125701904296875;
    bool _219 = _209 > 0.0;
    float _221 = floor(_211);
    bool _223 = _215 > 0.0;
    float _225 = sqrt(_207);
    int _227 = as_type<int>(_187) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_187) & 2;
    bool _233 = _231 != 0;
    float _235 = _217 * 6.283185482025146484375;
    float _237 = cos(_235);
    float _239 = -_221;
    float _241 = _211 + _239;
    bool _243 = !_229;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_233;
    float _249 = _247 ? (-0.5) : 0.5;
    float _251 = 0.0;
    float _253 = _187;
    float _255 = _203;
    float _257 = _215;
    float _259 = _211;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _263 = _157;
    float _265 = _155;
    float _267 = _153;
    if (_219)
    {
        float _269 = rsqrt(_203);
        _251 = _269;
    }
    float _271 = _251;
    bool _273 = _225 > 0.0;
    float _275 = _213;
    float _277 = _225;
    if (_223)
    {
        float _279 = rsqrt(_205);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _285 = _283;
    if (!_177)
    {
        float _287 = _283 * _283;
        float _289 = _287 * 0.5;
        _253 = _289;
    }
    float _291 = _253;
    float _293 = _291;
    if (!_177)
    {
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _295;
    }
    float _297 = _293;
    bool _299 = !_177;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _283 * _305;
        float _315 = 1.0 / _309;
        float _317 = _311 * 0.693147182464599609375;
        float _319 = exp2(_313);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _283);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _319;
        _257 = _321;
        _301 = _331;
        _277 = _315;
        _259 = _329;
    }
    float _333 = _255;
    float _335 = _257;
    float _337 = _301;
    float _339 = _277;
    float _341 = _259;
    bool _343 = !_177;
    float _345 = _333;
    float _347 = _341;
    float _349 = _339;
    if (!_343)
    {
        float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _353 = log2(_351);
        float _355 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _357 = _355 + 1.0;
        float _359 = 1.0 / _357;
        float _361 = _283 * _353;
        float _363 = exp2(_361);
        float _365 = -_363;
        float _367 = _365 + 1.0;
        float _369 = _367 * _359;
        _345 = _361;
        _347 = _359;
        _261 = _357;
        _285 = _369;
    }
    float _371 = _345;
    float _373 = _347;
    float _375 = _261;
    float _377 = _285;
    float _379 = _335;
    float _381 = _371;
    float _383 = _375;
    float _385 = _373;
    if (_273)
    {
        float _387 = rsqrt(_207);
        _379 = _387;
    }
    float _389 = _379;
    bool _391 = _241 < 0.5;
    float _393 = float(_391);
    float _395 = fma(_237, 0.5, 0.5);
    float _397 = 0.0;
    if (!_273)
    {
        _397 = 0.0;
    }
    float _399 = _397;
    float _401 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _403 = _399;
    if (!_273)
    {
        _381 = 0.0;
    }
    float _405 = _381;
    float _407 = _405;
    if (!_273)
    {
        _383 = 0.0;
    }
    float _409 = _383;
    float _411 = 0.0;
    float _413 = _409;
    if (!_223)
    {
        _411 = 0.0;
    }
    float _415 = _411;
    float _417 = _415;
    if (_223)
    {
        float _419 = _281 * _163;
        _417 = _419;
    }
    float _421 = _417;
    float _423 = 0.0;
    if (!_223)
    {
        _423 = 0.0;
    }
    float _425 = _423;
    float _427 = _425;
    if (_223)
    {
        float _429 = _281 * _153;
        _427 = _429;
    }
    float _431 = _427;
    float _433 = 0.0;
    if (!_223)
    {
        _433 = 0.0;
    }
    float _435 = _433;
    float _437 = _435;
    if (_273)
    {
        float _439 = _389 * _167;
        _403 = _439;
    }
    float _441 = _403;
    if (_273)
    {
        float _443 = _389 * _157;
        _407 = _443;
    }
    float _445 = _407;
    if (_273)
    {
        float _447 = _389 * _183;
        _413 = _447;
    }
    float _449 = _413;
    float _451 = -_241;
    float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (!_219)
    {
        _349 = 0.0;
    }
    float _455 = _349;
    float _457 = _455;
    if (_223)
    {
        float _459 = _281 * _179;
        _437 = _459;
    }
    float _461 = _437;
    float _463 = -_393;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _467 = -_395;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (_219)
    {
        float _471 = _271 * _155;
        _457 = _471;
    }
    float _473 = _457;
    float _475 = in.m_47.x;
    float _477 = in.m_47.y;
    float _479 = in.m_47.z;
    if (!_219)
    {
        _385 = 0.0;
    }
    float _481 = _385;
    float _483 = _481;
    if (_219)
    {
        float _485 = _271 * _165;
        _483 = _485;
    }
    float _487 = _483;
    float _489 = 0.0;
    if (!_219)
    {
        _489 = 0.0;
    }
    float _491 = _489;
    float _493 = _491;
    if (_219)
    {
        float _495 = _271 * _181;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = _401 * _431;
    float _501 = _401 * _473;
    float _503 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _505 = _401 * _445;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _513 = _511 != 0;
    float _515 = fma(_503, _421, _499);
    float _517 = fma(_503, _487, _501);
    int _519 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _521 = _519 != 0;
    float _523 = in.m_60.w;
    float _525 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _527 = !_509;
    int _529 = _527 ? 0 : 1;
    float _531 = fma(_503, _441, _505);
    float _533 = in.m_42.x;
    float _535 = in.m_42.y;
    float _537 = in.m_42.z;
    bool _539 = !_521;
    int _541 = _539 ? 0 : 1;
    float _543 = fma(_525, _461, _515);
    float _545 = fma(_525, _497, _517);
    int _547 = abs(_529);
    int _549 = abs(_541);
    float _551 = fma(_525, _449, _531);
    bool _553 = !_513;
    int _555 = _553 ? 0 : 1;
    float _557 = fma(_377, _475, _543);
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _561 = fma(_377, _477, _545);
    float _563 = fma(_377, _479, _551);
    int _565 = abs(_555);
    float _567 = float(_547);
    float _569 = float(_549);
    float _571 = abs(_453);
    float _573 = _567 * _571;
    float _575 = float(_565);
    float _577 = fma(_569, _469, _573);
    float _579 = fma(_557, _523, _533);
    float _581 = fma(_561, _523, _535);
    float _583 = fma(_563, _523, _537);
    float _585 = abs(_465);
    float _587 = fma(_575, _585, _577);
    bool _589 = !_559;
    float _605;
    if (!_589)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_97);
        float _611 = 1.0 / _609;
        float _613 = _131 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = in.m_55.y;
    float _619 = _185 * 2.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _623 = _615 + _621;
    float _625 = floor(_619);
    float _627 = in.m_55.z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _635 = _615 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    float _641 = _185 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = 1.0 / _639;
    float _649 = -_629;
    float _651 = fma(_641, 2.0, _649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = _615 + _657;
    bool _661 = _625 > 0.0;
    float _663 = -_131;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _667 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _669 = _617 * 2.0;
    float _671 = _185 + _617;
    float _673 = fma(_667, -2.0, _631);
    bool _675 = _625 >= 0.0;
    bool _677 = isnan(_625);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    float _685 = floor(_669);
    float _687 = _671 + (-1.0);
    float _689 = _623 * _647;
    int _691 = _683 ? 0 : 1;
    float _693 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _695 = 1.0 / _655;
    int _697 = ~_691;
    int _699 = _697 + 1;
    int _701 = _699 + 1;
    int _703 = _701;
    if (!_661)
    {
        int _705 = ~_691;
        int _707 = _705 + 1;
        _703 = _707;
    }
    int _709 = _703;
    float _711 = 1.0 / _645;
    bool _713 = _685 > 0.0;
    float _715 = _185 + _627;
    bool _717 = _685 >= 0.0;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = _715 + (-1.0);
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    float _741 = _659 * _695;
    bool _743 = _617 > 0.5;
    float _745 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _747 = _627 > 0.5;
    float _749 = _627 * 2.0;
    bool _751 = !_735;
    int _753 = _751 ? 0 : 1;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = _635 * _711;
    bool _761 = !_731;
    int _763 = _761 ? 0 : 1;
    float _765 = _627 + _617;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _773 = _771 != 0;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _777 = floor(_749);
    float _779 = -_245;
    int _781 = _743 ? as_type<int>(_779) : as_type<int>(_245);
    float _783 = _765 + (-1.0);
    float _785 = -_249;
    int _787 = _747 ? as_type<int>(_785) : as_type<int>(_249);
    bool _789 = !_739;
    int _791 = _789 ? 0 : 1;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _795 = !_769;
    float _797 = _795 ? _245 : as_type<float>(_781);
    bool _799 = !_773;
    float _801 = _799 ? _249 : as_type<float>(_787);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _813 = _811 != 0;
    float _815 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _817 = int(_815);
    int _819 = _725 ? 0 : 1;
    bool _821 = !_809;
    int _823 = _821 ? 0 : 1;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _827 = _825 != 0;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _829;
    int _833 = ~_819;
    int _835 = _833 + 1;
    int _837 = _835 + 1;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _839;
    int _843 = _837;
    float _845 = as_type<float>(_817);
    if (!_713)
    {
        int _847 = ~_819;
        int _849 = _847 + 1;
        _843 = _849;
    }
    int _851 = _843;
    float _853 = fma(_831, _689, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _855 = _777 > 0.0;
    float _857 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _859 = int(_857);
    bool _861 = _777 >= 0.0;
    bool _863 = isnan(_777);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    float _871 = fma(_841, _689, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _881 = _869 ? 0 : 1;
    int _883 = as_type<int>(_777);
    float _885 = _879;
    if (_827)
    {
        _883 = 0;
    }
    int _887 = _883;
    float _889 = fma(_875, _759, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _891 = _887;
    if (!_827)
    {
        _891 = 1;
    }
    int _893 = _891;
    float _895 = fma(_879, _759, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _897 = ~_881;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    bool _903 = _893 != 1;
    int _905 = _901;
    float _907 = as_type<float>(_893);
    if (!_855)
    {
        int _909 = ~_881;
        int _911 = _909 + 1;
        _905 = _911;
    }
    int _913 = _905;
    float _915 = float(_859);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _919 = float(_97);
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _923 = as_type<float>(_859);
    if (!_903)
    {
        _885 = _617;
    }
    float _925 = _885;
    float _927 = 1.0 / _915;
    float _929 = _925;
    if (_903)
    {
        _929 = _185;
    }
    float _931 = _929;
    if (!_903)
    {
        _907 = _627;
    }
    float _933 = _907;
    float _935 = _933;
    if (!_903)
    {
        _923 = _617;
    }
    float _937 = _923;
    float _939 = _931 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _941 = _937;
    if (_903)
    {
        _935 = _617;
    }
    float _943 = _935;
    float _945 = 1.0 / _919;
    float _947 = float(_817);
    if (_903)
    {
        _941 = _185;
    }
    float _949 = _941;
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[83].w, _775);
    if (!_903)
    {
        _845 = _627;
    }
    float _953 = _845;
    float _955 = -_917;
    float _957 = fma(_939, 2.0, _955);
    float _959 = _953;
    if (_903)
    {
        _959 = _617;
    }
    float _961 = _959;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[83].z, _921);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _967 = !_813;
    int _969 = _967 ? 0 : 1;
    float _971 = 1.0 / _947;
    float _973 = _961 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _975 = !_805;
    int _977 = _975 ? 0 : 1;
    float _979 = _927 * _131;
    int _981 = abs(_823);
    float _983 = fma(_973, -2.0, _965);
    int _985 = abs(_969);
    float _987 = _757 * _131;
    float _989 = float(_709);
    float _991 = _945 * _131;
    int _993 = abs(_977);
    float _995 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _963);
    float _997 = float(_851);
    float _999 = exp2(_987);
    float _1001 = float(_981);
    float _1003 = -_131;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[81].x, _957);
    float _1007 = float(_985);
    float _1009 = _1001 * _989;
    float _1011 = float(_913);
    float _1013 = _1007 * _997;
    float _1015 = float(_993);
    float _1017 = in.m_62.x;
    float _1019 = in.m_62.y;
    float _1021 = in.m_62.z;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1025 = 1.0 + _1023;
    float _1027 = _1015 * _1011;
    float _1029 = -_999;
    float _1031 = _1029 + 1.0;
    float _1033 = 1.0 / _1025;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1037 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(1.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1057 = _1053 || _1055;
    float _1059 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1047);
    float _1061 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1035);
    float _1063 = _971 * _131;
    float _1065 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    float _1067 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _673);
    float _1069 = _1057 ? _1031 : 0.0;
    float _1071 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _951);
    float _1073 = _1027 * (-2.0);
    float _1075 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1061);
    float _1077 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _983);
    if (_1045)
    {
        float _1079 = _1069 * _1033;
        _135 = _1079;
    }
    float _1081 = _135;
    float _1083 = _1009 * (-2.0);
    float _1085 = fma(_1073, _1017, _1017);
    float _1087 = fma(_693, _1073, _693);
    float _1089 = _185 + (-0.5);
    bool _1091 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1093 = isnan(_615);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = fma(_793, _1083, _793);
    float _1105 = fma(_1083, _1019, _1019);
    float _1107 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1085);
    float _1109 = _617 + (-0.5);
    bool _1111 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1113 = isnan(_615);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1119 = _1115 || _1117;
    float _1121 = float(_1119);
    float _1123 = -_1101;
    float _1125 = _1123 + 1.0;
    float _1127 = fma(_1087, _1081, _1107);
    float _1129 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1105);
    bool _1131 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1133 = isnan(_615);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _1121 * _1125;
    float _1145 = -_1121;
    float _1147 = _1145 + 1.0;
    float _1149 = _1127 * 0.15915493667125701904296875;
    float _1151 = _1013 * (-2.0);
    bool _1153 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1155 = isnan(_615);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1141 * _1147;
    float _1167 = -_1141;
    float _1169 = _1167 + 1.0;
    float _1171 = fma(_1103, _1081, _1129);
    float _1173 = fma(_745, _1151, _745);
    float _1175 = in.m_60.x;
    float _1177 = in.m_60.y;
    float _1179 = _1163 * _1169;
    float _1181 = fma(_1151, _1021, _1021);
    float _1183 = _627 + (-0.5);
    float _1185 = -_1163;
    float _1187 = _1185 + 1.0;
    float _1189 = _871 * _1179;
    float _1191 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1193;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1189);
    float _1199 = _853 * _1179;
    float _1201 = fma(_1173, _1081, _1191);
    float _1203 = fma(_1195, _741, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1205 = fma(_895, _1165, _1197);
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1207;
    float _1211 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1199);
    float _1213 = _1201 * 0.15915493667125701904296875;
    float _1215 = fma(_1203, _1143, _1205);
    float _1217 = fma(_1209, _741, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1219 = fma(_889, _1165, _1211);
    float _1221 = _1171 * 0.15915493667125701904296875;
    float _1223 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1215);
    float _1225 = _1213 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = fma(_1217, _1143, _1219);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _249);
    float _1233 = _1223 * _1177;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1245 = _1243 != 0;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1249 = _1247 != 0;
    float _1251 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1229);
    float _1253 = _587 * _1233;
    float _1255 = _1149 * 6.283185482025146484375;
    float _1257 = sin(_1255);
    float _1259 = _1251 * _1175;
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1263 = _587 * _1259;
    float _1265 = _1261 * _1231;
    float _1267 = _1149 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1275 = _1227 * _1265;
    float _1277 = _1273 * _1271;
    float _1279 = _581 * _181;
    float _1281 = _1221 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = fma(_579, _179, _1279);
    float _1287 = in.m_53.w;
    float _1289 = _1221 * 6.283185482025146484375;
    float _1291 = cos(_1289);
    float _1293 = _1269 * _1275;
    float _1295 = _1257 * _1275;
    float _1297 = _1213 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1257 * _1283;
    float _1303 = _1283 * _1227;
    float _1305 = _1269 * _1291;
    float _1307 = _1291 * _1227;
    float _1309 = _1269 * _1283;
    float _1311 = _1257 * _1291;
    float _1313 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1315 = fma(_1299, _1305, _1301);
    float _1317 = -_1265;
    float _1319 = _1299 * _1317;
    float _1321 = -_1311;
    float _1323 = fma(_1299, _1309, _1321);
    float _1325 = fma(_1299, _1301, _1305);
    float _1327 = fma(_1315, _1277, _1293);
    float _1329 = -_1309;
    float _1331 = fma(_1299, _1311, _1329);
    float _1333 = in.m_51.w;
    float _1335 = fma(_1307, _1277, _1319);
    float _1337 = fma(_1323, _1313, _1327);
    float _1339 = fma(_1331, _1277, _1295);
    float _1341 = _581 * _165;
    float _1343 = fma(_1303, _1313, _1335);
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1347 = fma(_1325, _1313, _1339);
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1351 = fma(_579, _163, _1341);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1345);
    float _1355 = fma(_583, _183, _1285);
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1349);
    float _1359 = fma(_583, _167, _1351);
    float _1361 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1353);
    float _1363 = _1355 + _1287;
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1357);
    float _1367 = in.m_49.w;
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1371 = _581 * _155;
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1375 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1377 = _1363 + _1369;
    float _1379 = fma(_579, _153, _1371);
    float _1381 = _1359 + _1333;
    float _1383 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1375);
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1387 = _1377 + _1385;
    bool _1389 = !_1241;
    int _1391 = _1389 ? 0 : 1;
    float _1393 = _1381 + _1373;
    float _1395 = fma(_583, _157, _1379);
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1383);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1403 = _1393 + _1401;
    bool _1405 = !_1237;
    int _1407 = _1405 ? 0 : 1;
    float _1409 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1411 = fma(_1403, _1403, _1397);
    bool _1413 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1415 = isnan(0.5);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1421 = _1417 || _1419;
    bool _1423 = !_1245;
    int _1425 = _1423 ? 0 : 1;
    float _1427 = sqrt(_1411);
    float _1429 = _1395 + _1367;
    bool _1431 = !_1249;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = _1429 + _1409;
    bool _1437 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1439 = _1411;
    float _1441 = _1343;
    float _1443 = _1427;
    float _1445 = _1403;
    float _1447 = _1387;
    float _1449 = _1367;
    if (!_1437)
    {
        _263 = _1393;
    }
    float _1451 = _263;
    float _1453 = _1451;
    if (!_1437)
    {
        _265 = _1377;
    }
    float _1455 = _265;
    float _1457 = _1455;
    if (!_1437)
    {
        _267 = _1435;
    }
    float _1459 = _267;
    bool _1461 = !_1437;
    float _1463 = _1459;
    if (!_1461)
    {
        float _1465 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1469 = _1427 + _1467;
        float _1471 = _1435 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1473 = rsqrt(_1411);
        float _1475 = _1469 * _1465;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = _1477 * 6.283185482025146484375;
        float _1481 = cos(_1479);
        float _1483 = _1477 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1481 + (-1.0);
        float _1489 = fma(_1485, _1471, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1493 = _1473 * _1489;
        float _1495 = fma(_1435, _1481, _1491);
        float _1497 = fma(_1403, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1499 = fma(_1387, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1453 = _1497;
        _1463 = _1495;
        _1457 = _1499;
        _1439 = _1473;
        _1441 = _1477;
        _1443 = _1487;
    }
    float _1501 = _1453;
    float _1503 = _1463;
    float _1505 = _1457;
    float _1507 = _1439;
    float _1509 = _1441;
    float _1511 = _1443;
    float _1513 = _1507;
    float _1515 = _1511;
    if (_1421)
    {
        _1445 = _1501;
    }
    float _1517 = _1445;
    float _1519 = _1517;
    if (_1421)
    {
        _1513 = _1503;
    }
    float _1521 = _1513;
    float _1523 = _1521;
    if (_1421)
    {
        _1447 = _1505;
    }
    float _1525 = _1447;
    float _1527 = _1525;
    if (!_1421)
    {
        float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1531 = _1429 + _1529;
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1535 = _1381 + _1533;
        float _1537 = -_1429;
        float _1539 = _1537 + _1503;
        float _1541 = -_1363;
        float _1543 = _1541 + _1505;
        float _1545 = _1531 * _1531;
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1549 = _1363 + _1547;
        float _1551 = fma(_1535, _1535, _1545);
        float _1553 = -_1381;
        float _1555 = _1553 + _1501;
        float _1557 = fma(_1549, _1549, _1551);
        float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1561 = sqrt(_1557);
        float _1563 = precise::min(_1561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1565 = _1563 * _1559;
        float _1567 = fma(_1555, _1565, _1381);
        float _1569 = fma(_1539, _1565, _1429);
        float _1571 = fma(_1543, _1565, _1363);
        _1523 = _1569;
        _1519 = _1567;
        _1527 = _1571;
        _1515 = _1561;
    }
    float _1573 = _1523;
    float _1575 = _1519;
    float _1577 = _1527;
    float _1579 = _1515;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1583 = _1573 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1575 + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1591 = _1577 + _1589;
    float _1593 = _1583 * _1583;
    float _1595 = fma(_1587, _1587, _1593);
    float _1597 = fma(_1591, _1591, _1595);
    float _1599 = rsqrt(_1597);
    float _1601 = sqrt(_1597);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1605 = _1587 * _1603;
    float _1607 = _1591 * _1603;
    float _1609 = _1605 * _1605;
    float _1611 = _1607 * _1607;
    float _1613 = _1609 + _1611;
    float _1615 = sqrt(_1613);
    bool _1617 = _1615 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = _1615 + _1619;
    float _1623 = _1501;
    float _1625 = _1613;
    float _1627 = _1621;
    float _1629 = _1605;
    float _1631 = _1607;
    float _1633 = _1611;
    if (_1617)
    {
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1623 = _1635;
    }
    float _1637 = _1623;
    if (_1617)
    {
        float _1639 = rsqrt(_1613);
        _1625 = _1639;
    }
    float _1641 = _1625;
    if (_1617)
    {
        float _1643 = _1621 * _1637;
        _1627 = _1643;
    }
    float _1645 = _1627;
    if (_1617)
    {
        float _1647 = _1645 * 0.15915493667125701904296875;
        _1449 = _1647;
    }
    float _1649 = _1449;
    float _1651 = _1509;
    if (_1617)
    {
        float _1653 = _1649 * 6.283185482025146484375;
        float _1655 = sin(_1653);
        _1651 = _1655;
    }
    float _1657 = _1651;
    float _1659 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1661 = precise::max(0.0, _1659);
    float _1663 = _1579;
    float _1665 = _1661;
    float _1667 = _1659;
    if (_1617)
    {
        float _1669 = _1649 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        _1663 = _1671;
    }
    float _1673 = _1663;
    float _1675 = -_1603;
    float _1677 = -_1661;
    float _1679 = fma(_1583, _1675, _1677);
    float _1681 = _1679;
    if (_1617)
    {
        float _1683 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1683;
    }
    float _1685 = _1665;
    float _1687 = _1685;
    float _1689 = _1657;
    if (_1617)
    {
        float _1691 = fma(_1657, _1685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = _1693;
    if (_1617)
    {
        float _1697 = _1673 + (-1.0);
        _1667 = _1697;
    }
    float _1699 = _1667;
    float _1701 = _1699;
    if (_1617)
    {
        float _1703 = _1641 * _1693;
        _1689 = _1703;
    }
    float _1705 = _1689;
    if (!_1617)
    {
        _1695 = _1609;
    }
    float _1707 = _1695;
    float _1709 = _1707;
    if (_1617)
    {
        float _1711 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1711;
    }
    float _1713 = _1701;
    if (_1617)
    {
        float _1715 = _1605 * _1705;
        _1629 = _1715;
    }
    float _1717 = _1629;
    if (_1617)
    {
        float _1719 = _1607 * _1705;
        _1631 = _1719;
    }
    float _1721 = _1631;
    if (_1617)
    {
        float _1723 = fma(_1679, _1673, _1713);
        _1681 = _1723;
    }
    float _1725 = _1681;
    if (_1617)
    {
        float _1727 = _1717 * _1717;
        _1709 = _1727;
    }
    float _1729 = _1709;
    if (_1617)
    {
        float _1731 = _1721 * _1721;
        _1633 = _1731;
    }
    float _1733 = _1633;
    float _1735 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1739 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1737);
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = fma(_1725, _1725, _1729);
    float _1745 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1747 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1749 = -_1741;
    float _1751 = _1749 + 1.0;
    float _1753 = _1743 + _1733;
    float _1755 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1757 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1759 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1761 = abs(_1751);
    float _1763 = log2(_1761);
    float _1765 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1755);
    float _1767 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1759);
    float _1771 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1773 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1775 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1777 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1769);
    float _1779 = rsqrt(_1753);
    float _1781 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1783 = -_1775;
    float _1785 = fma(_1783, _1745, 1.0);
    float _1787 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1789 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1771);
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1793 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1789);
    float _1795 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1791);
    float _1797 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1799 = log2(_1785);
    float _1801 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1803 = _1779 * _1717;
    float _1805 = _1779 * _1725;
    float _1807 = _1779 * _1721;
    float _1809 = exp2(_1797);
    float _1811 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1813 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1795);
    float _1815 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1817 = -_1811;
    float _1819 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1817);
    float _1821 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1815);
    float _1825 = -_1807;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1819);
    float _1829 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1831 = 1.0 / _1821;
    float _1833 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1835 = fma(_1827, -0.5, 0.5);
    float _1837 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1829);
    float _1839 = fma(_1827, 0.5, 0.5);
    float _1841 = _1805 + 1.0;
    float _1843 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1837);
    float _1845 = sqrt(_1835);
    float _1847 = fma(_1839, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1849 = -_1805;
    float _1851 = fma(_1809, _1841, _1849);
    float _1853 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1843);
    float _1855 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1833);
    float _1857 = fma(_1839, _1847, -0.212114393711090087890625);
    float _1859 = _1799 * 0.693147182464599609375;
    float _1861 = _1853 * _1831;
    float _1863 = fma(_1839, _1857, 1.570728778839111328125);
    float _1865 = _1855 * _1831;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = fma(_1861, 0.5, 0.5);
    float _1871 = fma(_1851, 0.5, 0.5);
    float _1873 = fma(_1865, -0.5, 0.5);
    float _1875 = _1845 * 0.636619746685028076171875;
    float _1877 = -_1863;
    float _1879 = fma(_1875, _1877, 1.0);
    float3 _5813 = float3(_1869, _1873, _1867);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5813, float3(0.0), isnan(_5813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5813, float3(0.0), isnan(_5813)), level(0.0)).x;
    float3 _5824 = float3(_1869, _1873, _1867);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5824, float3(0.0), isnan(_5824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5824, float3(0.0), isnan(_5824)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float2 _5841 = float2(_1879, _1871);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5841, float2(0.0), isnan(_5841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5841, float2(0.0), isnan(_5841)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1906 = int(_1904);
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1910 = _1908 != 0;
    out.m_45.x = 1.0;
    int _1912 = abs(_753);
    float _1914 = _797 + 0.5;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1918 = _1916 != 0;
    float _1920 = -_801;
    float _1922 = _1920 + 0.5;
    int _1924 = abs(_763);
    float _1926 = trunc(_979);
    int _1928 = int(_1926);
    int _1930 = abs(_1391);
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1934 = abs(_1407);
    float _1936 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1938 = abs(_1425);
    float _1940 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1942 = abs(_1433);
    float _1944 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1946 = int(_1944);
    float _1948 = float(uint(_1906));
    float _1950 = -_1065;
    float _1952 = _1950 + 1.0;
    int _1954 = ~_1906;
    int _1956 = _1954 + 1;
    int _1958 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1960 = _1958 != 0;
    bool _1962 = _627 > 0.5;
    float _1964 = 1.0 / _1948;
    float _1966 = float(uint(_1928));
    float _1968 = float(uint(_1946));
    float _1970 = trunc(_1063);
    int _1972 = int(_1970);
    int _1974 = ~_1906;
    int _1976 = _1974 + 1;
    int _1978 = ~_1946;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>(_1964) + (-2);
    float _1984 = 1.0 / _1968;
    float _1986 = as_type<float>(_1982) * _1966;
    float _1988 = trunc(_1986);
    float _1990 = precise::max(_1988, 0.0);
    uint _1993 = uint(_1990);
    int _1995 = as_type<int>(_1984) + (-2);
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1999 = _1986;
    float _2001 = _1984;
    if (_827)
    {
        _1999 = 1.0;
    }
    float _2003 = _1999;
    float _2005 = _2003;
    if (!_827)
    {
        _2005 = 7.345489978790283203125;
    }
    float _2007 = _2005;
    if (_827)
    {
        _2001 = 1.0;
    }
    float _2009 = _2001;
    int _2011 = _1976 * int(_1993);
    int _2013 = _2011 + _1928;
    float _2015 = _2007 * _185;
    float _2017 = _2009;
    if (!_827)
    {
        _2017 = 1.2345600128173828125;
    }
    float _2019 = _2017;
    float _2021 = exp2(_1940);
    float _2023 = float(uint(_2013));
    float _2025 = _1932 * _1997;
    float _2027 = as_type<float>(_1982) * _2023;
    float _2029 = float(uint(_1972));
    float _2031 = floor(_2015);
    float _2033 = as_type<float>(_1995) * _2029;
    float _2035 = _2029;
    if (_827)
    {
        _2035 = _185;
    }
    float _2037 = _2035;
    float _2039 = _2037;
    if (!_827)
    {
        _2039 = _617;
    }
    float _2041 = _2039;
    float _2043 = trunc(_2027);
    float _2045 = precise::max(_2043, 0.0);
    uint _2047 = uint(_2045);
    bool _2049 = _617 > 0.5;
    float _2051 = -_2021;
    float _2053 = _2051 + 1.0;
    float _2055 = _2019 * _2041;
    float _2057 = float(_1928);
    float _2059 = trunc(_2033);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = int(_1993) + int(_2047);
    float _2067 = floor(_2055);
    float _2069 = float(_1906);
    int _2071 = _1956 * _2065;
    int _2073 = _2071 + _1928;
    bool _2075 = _2057 >= _2069;
    bool _2077 = isnan(_2057);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(_2069);
    bool _2083 = _2079 || _2081;
    float _2085 = float(_2083);
    int _2087 = _1980 * int(_2063);
    int _2089 = _2087 + _1972;
    bool _2091 = uint(_2073) >= uint(_1906);
    float _2093 = trunc(_2085);
    int _2095 = int(_2093);
    float _2097 = float(uint(_2089));
    bool _2099 = !_2091;
    int _2101 = _2099 ? 0 : (-1);
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2105 = _2103 != 0;
    float _2107 = as_type<float>(_1995) * _2097;
    float _2109 = -_2031;
    float _2111 = _2015 + _2109;
    float _2113 = -_2067;
    float _2115 = _2055 + _2113;
    float _2117 = float(_1946);
    float _2119 = trunc(_2107);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = _2111 * _2069;
    int _2127 = ~_2065;
    int _2129 = _2127 + _2101;
    int _2131 = _2129 + 1;
    float _2133 = _2069 * _991;
    float _2135 = float(_1972);
    float _2137 = _2117 * _991;
    bool _2139 = !_1910;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = _2115 * _2117;
    float _2145 = trunc(_2125);
    int _2147 = int(_2145);
    bool _2149 = _2135 >= _2117;
    bool _2151 = isnan(_2135);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(_2117);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    int _2161 = _1906 * _2131;
    int _2163 = _2161 + _1928;
    bool _2165 = _1906 == 0;
    int _2167 = abs(_2141);
    int _2169 = ~_1946;
    int _2171 = _2169 + 1;
    float _2173 = trunc(_2133);
    int _2175 = int(_2173);
    int _2177 = ~_2095;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    bool _2183 = !_2165;
    int _2185 = _2183 ? _2163 : (-1);
    int _2187 = int(_2063) + int(_2123);
    int _2189 = _2147 * _2167;
    int _2191 = _2189 + _1928;
    int _2193 = _1906 + (-1);
    int _2195 = _2185 * _2181;
    float _2197 = trunc(_2143);
    int _2199 = int(_2197);
    int _2201 = _2171 * _2187;
    int _2203 = _2201 + _1972;
    int _2205 = _2095 * _2193;
    int _2207 = _2205 + _2195;
    bool _2209 = !_1918;
    int _2211 = _2209 ? 0 : 1;
    bool _2213 = uint(_2203) >= uint(_1946);
    int _2215 = _2207 * _1912;
    float _2217 = trunc(_2159);
    int _2219 = int(_2217);
    int _2221 = abs(_2211);
    bool _2223 = !_2213;
    int _2225 = _2223 ? 0 : (-1);
    int _2227 = _2175 * _1924;
    int _2229 = _2227 + _2215;
    int _2231 = abs(_791);
    bool _2233 = !_2105;
    int _2235 = _2233 ? 0 : 1;
    float _2237 = trunc(_2137);
    int _2239 = int(_2237);
    int _2241 = ~_2187;
    int _2243 = _2241 + _2225;
    int _2245 = _2243 + 1;
    int _2247 = abs(_2235);
    int _2249 = _1946 * _2245;
    int _2251 = _2249 + _1972;
    bool _2253 = _1946 == 0;
    int _2255 = _2199 * _2221;
    int _2257 = _2255 + _1972;
    int _2259 = ~_2219;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    int _2265 = _2191 * _2231;
    int _2267 = _2265 + _2229;
    bool _2269 = !_2253;
    int _2271 = _2269 ? _2251 : (-1);
    int _2273 = _1946 + (-1);
    int _2275 = _2147 * _2247;
    int _2277 = _2275 + _2267;
    int _2279 = _2271 * _2263;
    float _2281 = float(uint(_2277));
    int _2283 = _2219 * _2273;
    int _2285 = _2283 + _2279;
    float _2287 = as_type<float>(_1982) * _2281;
    int _2289 = _2285 * _1930;
    float _2291 = trunc(_2287);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2239 * _1934;
    int _2299 = _2297 + _2289;
    int _2301 = ~_1906;
    int _2303 = _2301 + 1;
    int _2305 = _2257 * _1938;
    int _2307 = _2305 + _2299;
    int _2309 = ~_1906;
    int _2311 = _2309 + 1;
    int _2313 = _2199 * _1942;
    int _2315 = _2313 + _2307;
    int _2317 = ~_1946;
    int _2319 = _2317 + 1;
    float _2321 = float(uint(_2315));
    int _2323 = _2303 * int(_2295);
    int _2325 = _2323 + _2277;
    float _2327 = as_type<float>(_1995) * _2321;
    float _2329 = float(uint(_2325));
    float _2331 = trunc(_2327);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    float _2337 = as_type<float>(_1982) * _2329;
    float _2339 = trunc(_2337);
    float _2341 = precise::max(_2339, 0.0);
    uint _2343 = uint(_2341);
    int _2345 = _2319 * int(_2335);
    int _2347 = _2345 + _2315;
    float _2349 = float(uint(_2191));
    float _2351 = float(uint(_2347));
    float _2353 = as_type<float>(_1982) * _2349;
    float _2355 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2357 = int(_2295) + int(_2343);
    float _2359 = as_type<float>(_1995) * _2351;
    float _2361 = trunc(_2353);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    float _2367 = _2355 * _185;
    int _2369 = ~_1946;
    int _2371 = _2369 + 1;
    int _2373 = _2311 * _2357;
    int _2375 = _2373 + _2277;
    float _2377 = trunc(_2359);
    float _2379 = precise::max(_2377, 0.0);
    uint _2381 = uint(_2379);
    bool _2383 = uint(_2375) >= uint(_1906);
    bool _2385 = !_2383;
    int _2387 = _2385 ? 0 : (-1);
    float _2389 = trunc(_2367);
    int _2391 = int(_2389);
    int _2393 = ~_2357;
    int _2395 = _2393 + _2387;
    int _2397 = _2395 + 1;
    int _2399 = ~_1946;
    int _2401 = _2399 + 1;
    float _2403 = in.m_55.w;
    int _2405 = _1906 * _2397;
    int _2407 = _2405 + _2277;
    int _2409 = ~_1906;
    int _2411 = _2409 + 1;
    int _2413 = int(_2335) + int(_2381);
    bool _2415 = !_2165;
    int _2417 = _2415 ? _2407 : (-1);
    int _2419 = _2411 * int(_2365);
    int _2421 = _2419 + _2191;
    int _2423 = _2401 * _2413;
    int _2425 = _2423 + _2315;
    float _2427 = float(uint(_2257));
    int _2429 = _2417 & 3;
    bool _2431 = _2429 != 0;
    int _2433 = _2391 << 4;
    int _2435 = _2433 + 1712;
    float _2437 = as_type<float>(_1995) * _2427;
    float _2439 = float(uint(_2421));
    int _2441 = _2431 ? 0 : 1;
    bool _2443 = _185 > 0.5;
    float _2445 = as_type<float>(_1982) * _2439;
    float _2447 = trunc(_2437);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    float _2453 = -_249;
    int _2455 = _2049 ? as_type<int>(_2453) : as_type<int>(_249);
    uint _2457 = uint(int(uint(_2435) >> uint(2)));
    uint _2459 = uint(int(uint(int(_2457)) >> uint(2)));
    int _2461 = int(_2457) & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    int _2465 = int(_2457) + 1;
    uint _2467 = uint(int(uint(_2465) >> uint(2)));
    int _2469 = _2465 & 3;
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[int(_2467)][_2469];
    float _2473 = -_245;
    int _2475 = _2443 ? as_type<int>(_2473) : as_type<int>(_245);
    bool _2477 = uint(_2425) >= uint(_1946);
    bool _2479 = !_1960;
    float _2481 = _2479 ? _245 : as_type<float>(_2475);
    float _2483 = trunc(_2445);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2477;
    int _2495 = _2493 ? 0 : (-1);
    bool _2497 = !_2491;
    float _2499 = _2497 ? _249 : as_type<float>(_2455);
    int _2501 = _2435 + 8;
    uint _2503 = uint(int(uint(_2501) >> uint(2)));
    uint _2505 = uint(int(uint(int(_2503)) >> uint(2)));
    int _2507 = int(_2503) & 3;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[int(_2505)][_2507];
    int _2511 = _2371 * int(_2451);
    int _2513 = _2511 + _2257;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2517 = _2515 != 0;
    bool _2519 = _2403 > 0.5;
    float _2521 = float(uint(_2513));
    float _2523 = -_245;
    int _2525 = _1962 ? as_type<int>(_2523) : as_type<int>(_245);
    float _2527 = as_type<float>(_1995) * _2521;
    float _2529 = _2499 + (-0.5);
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2533 = !_2517;
    float _2535 = _2533 ? _245 : as_type<float>(_2525);
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2539 = _2417 & 3;
    bool _2541 = _2539 != 0;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2545 = -_249;
    int _2547 = _2519 ? as_type<int>(_2545) : as_type<int>(_249);
    float _2549 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2551 = uint(_2539) > 1u;
    float _2553 = _2537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2555 = ~_2413;
    int _2557 = _2555 + _2495;
    int _2559 = _2557 + 1;
    float _2561 = _2543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2563 = int(_2365) + int(_2487);
    float _2565 = trunc(_2527);
    float _2567 = precise::max(_2565, 0.0);
    uint _2569 = uint(_2567);
    int _2571 = ~_1906;
    int _2573 = _2571 + 1;
    int _2575 = _1946 * _2559;
    int _2577 = _2575 + _2315;
    out.m_64.x = _2549;
    out.m_64.y = _2553;
    out.m_64.z = _2561;
    int _2579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2581 = _2579 != 0;
    int _2583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2585 = _2583 != 0;
    bool _2587 = !_2253;
    int _2589 = _2587 ? _2577 : (-1);
    float _2591 = -_2529;
    float _2593 = -_1067;
    float _2595 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2593);
    int _2597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2599 = _2597 != 0;
    float _2601 = _2481 + 0.5;
    bool _2603 = !_2581;
    float _2605 = _2603 ? _249 : as_type<float>(_2547);
    float _2607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2609 = _2573 * _2563;
    int _2611 = _2609 + _2191;
    int _2613 = _2417 >> 31;
    float _2615 = fma(_2601, (*spvDescriptorSet0.vp_c9)._m0[80].x, _665);
    int _2617 = ~_2441;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = _2621;
    if (!_2551)
    {
        int _2625 = ~_2441;
        int _2627 = _2625 + 1;
        _2623 = _2627;
    }
    int _2629 = _2623;
    int _2631 = _2613 & 3;
    float _2633 = _2463 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2635 = uint(_2611) >= uint(_1906);
    int _2637 = _2589 >> 31;
    float _2639 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2641 = _2417 + _2631;
    float _2643 = _2471 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2645 = _2637 & 3;
    float _2647 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2649 = _2641 >> 2;
    float _2651 = _2643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2653 = _2589 + _2645;
    float _2655 = _2647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2657 = _2653 >> 2;
    int _2659 = _2649 << 4;
    int _2661 = _2659 + 368;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2665 = _2657 << 4;
    int _2667 = _2665 + 512;
    bool _2669 = !_2635;
    int _2671 = _2669 ? 0 : (-1);
    uint _2673 = uint(int(uint(_2661) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    bool _2689 = uint(_2539) >= 2u;
    out.m_66.x = _2639;
    out.m_66.y = _2651;
    out.m_66.z = _2655;
    out.m_66.w = _2663;
    int _2691 = int(_2451) + int(_2569);
    float _2693 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2695 = _2689 ? 0 : 1;
    bool _2697 = _2539 != 3;
    uint _2699 = uint(int(uint(_2667) >> uint(2)));
    uint _2701 = uint(int(uint(int(_2699)) >> uint(2)));
    int _2703 = int(_2699) & 3;
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[int(_2701)][_2703];
    int _2707 = int(_2699) + 1;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    int _2711 = _2707 & 3;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[int(_2709)][_2711];
    int _2715 = ~_1946;
    int _2717 = _2715 + 1;
    float _2719 = _2693 * _2607;
    float _2721 = _2535 + 0.5;
    int _2723 = ~_2695;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    int _2729 = _2717 * _2691;
    int _2731 = _2729 + _2257;
    float _2733 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1005);
    int _2735 = _2661 + 8;
    uint _2737 = uint(int(uint(_2735) >> uint(2)));
    uint _2739 = uint(int(uint(int(_2737)) >> uint(2)));
    int _2741 = int(_2737) & 3;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[int(_2739)][_2741];
    int _2745 = int(_2737) + 1;
    uint _2747 = uint(int(uint(_2745) >> uint(2)));
    int _2749 = _2745 & 3;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[int(_2747)][_2749];
    int _2753 = ~_2563;
    int _2755 = _2753 + _2671;
    int _2757 = _2755 + 1;
    out.m_68.x = _2025;
    out.m_68.y = _2719;
    bool _2759 = uint(_2731) >= uint(_1946);
    int _2761 = _2727;
    if (_2697)
    {
        int _2763 = ~_2695;
        int _2765 = _2763 + 1;
        _2761 = _2765;
    }
    int _2767 = _2761;
    float _2769 = _2605 + (-0.5);
    int _2771 = _2589 & 3;
    bool _2773 = _2771 != 0;
    int _2775 = _2667 + 8;
    uint _2777 = uint(int(uint(_2775) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    bool _2793 = !_2759;
    int _2795 = _2793 ? 0 : (-1);
    int _2797 = _1906 * _2757;
    int _2799 = _2797 + _2191;
    bool _2801 = uint(_2771) > 1u;
    float _2803 = -_2769;
    float _2805 = -_1077;
    float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2805);
    bool _2809 = !_2541;
    int _2811 = _2809 ? 0 : 1;
    int _2813 = _2589 & 3;
    bool _2815 = _2813 != 0;
    int _2817 = ~_2691;
    int _2819 = _2817 + _2795;
    int _2821 = _2819 + 1;
    int _2823 = _2815 ? 0 : 1;
    bool _2825 = !_2773;
    int _2827 = _2825 ? 0 : 1;
    int _2829 = _1946 * _2821;
    int _2831 = _2829 + _2257;
    int _2833 = ~_2823;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = _2837;
    if (!_2801)
    {
        int _2841 = ~_2823;
        int _2843 = _2841 + 1;
        _2839 = _2843;
    }
    int _2845 = _2839;
    bool _2847 = _2539 != 3;
    int _2849 = abs(_2629);
    float _2851 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1936);
    int _2853 = abs(_2845);
    int _2855 = abs(_2811);
    float _2857 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2851);
    int _2859 = abs(_2827);
    int _2861 = ~_2849;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    float _2867 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2857);
    bool _2869 = _2771 != 3;
    int _2871 = _2865 * as_type<int>(_2687);
    int _2873 = ~_2853;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    out.gl_Position.x = _1853;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _2867;
    out.gl_Position.w = _1821;
    int _2879 = ~_2855;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    bool _2885 = uint(_2771) >= 2u;
    int _2887 = _2877 * as_type<int>(_2713);
    int _2889 = ~_2859;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    int _2895 = _2883 * as_type<int>(_2679);
    int _2897 = _2895 + _2871;
    int _2899 = _2885 ? 0 : 1;
    bool _2901 = _2771 != 3;
    int _2903 = _2893 * as_type<int>(_2705);
    int _2905 = _2903 + _2887;
    int _2907 = abs(_2767);
    bool _2909 = !_2847;
    int _2911 = _2909 ? 0 : (-1);
    int _2913 = ~_2899;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = _2917;
    if (_2869)
    {
        int _2921 = ~_2899;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    bool _2927 = !_2901;
    int _2929 = _2927 ? 0 : (-1);
    int _2931 = abs(_2911);
    int _2933 = ~_2907;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2925);
    int _2941 = abs(_2929);
    int _2943 = _2937 * as_type<int>(_2743);
    int _2945 = _2943 + _2897;
    int _2947 = ~_2939;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    bool _2953 = !_2585;
    int _2955 = _2953 ? 0 : 1;
    int _2957 = _2951 * as_type<int>(_2783);
    int _2959 = _2957 + _2905;
    int _2961 = ~_2931;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = abs(_2955);
    int _2969 = ~_2941;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = _2965 * as_type<int>(_2751);
    int _2977 = _2975 + _2945;
    bool _2979 = !_2599;
    int _2981 = _2979 ? 0 : 1;
    float _2983 = -_1075;
    float _2985 = _2983 + 1.0;
    int _2987 = ~_2967;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = _2973 * as_type<int>(_2791);
    int _2995 = _2993 + _2959;
    int _2997 = abs(_2981);
    float _2999 = -_995;
    float _3001 = _2999 + 1.0;
    float _3003 = -_1071;
    float _3005 = _3003 + 1.0;
    int _3007 = _2977 * _2991;
    float _3009 = -_1952;
    float _3011 = fma(_2481, _3009, _2615);
    float _3013 = fma(_2499, _2985, _2595);
    float _3015 = -_3001;
    float _3017 = fma(_2535, _3015, _2733);
    float _3019 = fma(_2605, _3005, _2807);
    bool _3021 = !_2165;
    int _3023 = _3021 ? _2799 : (-1);
    int _3025 = ~_2997;
    int _3027 = _3025 + 1;
    int _3029 = _3027 + 1;
    out.m_70.x = _3011;
    out.m_70.y = _3013;
    out.m_70.z = _3017;
    out.m_70.w = _3019;
    int _3031 = _3023 * _2967;
    int _3033 = _3031 + _3007;
    float _3035 = _2867 + _1821;
    bool _3037 = !_2253;
    int _3039 = _3037 ? _2831 : (-1);
    int _3041 = _2995 * _3029;
    float _3043 = _3035 * 0.5;
    int _3045 = _3039 * _2997;
    int _3047 = _3045 + _3041;
    float _3049 = float(_3033);
    out.m_72.z = _3043;
    out.m_72.w = _1821;
    float _3051 = float(_3047);
    float _3053 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3055 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3057 = _3053 * _1881;
    float _3059 = -_3053;
    float _3061 = _3059 + 1.0;
    out.m_74.x = _3049;
    out.m_74.y = _3051;
    float _3063 = _1892 * _3057;
    float _3065 = _1902 * _3057;
    float _3067 = _1892 * _3061;
    out.m_76.w = _3055;
    float _3069 = fma(_1898, _3063, _1886);
    float _3071 = fma(_1900, _3063, _1888);
    float _3073 = fma(_1892, _3065, _1890);
    out.m_78.x = _3069;
    out.m_78.y = _3071;
    out.m_78.z = _3073;
    out.m_78.w = _3067;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3130 = as_type<float>(_113);
        out.gl_Position.z = _3130;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3199 = as_type<float>(_151);
        out.gl_Position.z = _3199;
    }
    if (_145)
    {
        return out;
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_53.x;
    float _181 = in.m_53.y;
    float _183 = in.m_53.z;
    float _185 = in.m_55.x;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _161 * _159;
    float _191 = _155 * _155;
    float _193 = _153 * _153;
    float _195 = _157 * _157;
    float _197 = fma(_165, _165, _191);
    float _199 = fma(_163, _163, _193);
    float _201 = fma(_167, _167, _195);
    float _203 = fma(_181, _181, _197);
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_183, _183, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[20].x, _189);
    float _213 = _211 * 6.283185482025146484375;
    float _215 = sqrt(_205);
    float _217 = _213 * 0.15915493667125701904296875;
    bool _219 = _209 > 0.0;
    float _221 = floor(_211);
    bool _223 = _215 > 0.0;
    float _225 = sqrt(_207);
    int _227 = as_type<int>(_187) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_187) & 2;
    bool _233 = _231 != 0;
    float _235 = _217 * 6.283185482025146484375;
    float _237 = cos(_235);
    float _239 = -_221;
    float _241 = _211 + _239;
    bool _243 = !_229;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_233;
    float _249 = _247 ? (-0.5) : 0.5;
    float _251 = 0.0;
    float _253 = _187;
    float _255 = _203;
    float _257 = _215;
    float _259 = _211;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _263 = _157;
    float _265 = _155;
    float _267 = _153;
    if (_219)
    {
        float _269 = rsqrt(_203);
        _251 = _269;
    }
    float _271 = _251;
    bool _273 = _225 > 0.0;
    float _275 = _213;
    float _277 = _225;
    if (_223)
    {
        float _279 = rsqrt(_205);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _285 = _283;
    if (!_177)
    {
        float _287 = _283 * _283;
        float _289 = _287 * 0.5;
        _253 = _289;
    }
    float _291 = _253;
    float _293 = _291;
    if (!_177)
    {
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _295;
    }
    float _297 = _293;
    bool _299 = !_177;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _283 * _305;
        float _315 = 1.0 / _309;
        float _317 = _311 * 0.693147182464599609375;
        float _319 = exp2(_313);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _283);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _319;
        _257 = _321;
        _301 = _331;
        _277 = _315;
        _259 = _329;
    }
    float _333 = _255;
    float _335 = _257;
    float _337 = _301;
    float _339 = _277;
    float _341 = _259;
    bool _343 = !_177;
    float _345 = _333;
    float _347 = _341;
    float _349 = _339;
    if (!_343)
    {
        float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _353 = log2(_351);
        float _355 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _357 = _355 + 1.0;
        float _359 = 1.0 / _357;
        float _361 = _283 * _353;
        float _363 = exp2(_361);
        float _365 = -_363;
        float _367 = _365 + 1.0;
        float _369 = _367 * _359;
        _345 = _361;
        _347 = _359;
        _261 = _357;
        _285 = _369;
    }
    float _371 = _345;
    float _373 = _347;
    float _375 = _261;
    float _377 = _285;
    float _379 = _335;
    float _381 = _371;
    float _383 = _375;
    float _385 = _373;
    if (_273)
    {
        float _387 = rsqrt(_207);
        _379 = _387;
    }
    float _389 = _379;
    bool _391 = _241 < 0.5;
    float _393 = float(_391);
    float _395 = fma(_237, 0.5, 0.5);
    float _397 = 0.0;
    if (!_273)
    {
        _397 = 0.0;
    }
    float _399 = _397;
    float _401 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _403 = _399;
    if (!_273)
    {
        _381 = 0.0;
    }
    float _405 = _381;
    float _407 = _405;
    if (!_273)
    {
        _383 = 0.0;
    }
    float _409 = _383;
    float _411 = 0.0;
    float _413 = _409;
    if (!_223)
    {
        _411 = 0.0;
    }
    float _415 = _411;
    float _417 = _415;
    if (_223)
    {
        float _419 = _281 * _163;
        _417 = _419;
    }
    float _421 = _417;
    float _423 = 0.0;
    if (!_223)
    {
        _423 = 0.0;
    }
    float _425 = _423;
    float _427 = _425;
    if (_223)
    {
        float _429 = _281 * _153;
        _427 = _429;
    }
    float _431 = _427;
    float _433 = 0.0;
    if (!_223)
    {
        _433 = 0.0;
    }
    float _435 = _433;
    float _437 = _435;
    if (_273)
    {
        float _439 = _389 * _167;
        _403 = _439;
    }
    float _441 = _403;
    if (_273)
    {
        float _443 = _389 * _157;
        _407 = _443;
    }
    float _445 = _407;
    if (_273)
    {
        float _447 = _389 * _183;
        _413 = _447;
    }
    float _449 = _413;
    float _451 = -_241;
    float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (!_219)
    {
        _349 = 0.0;
    }
    float _455 = _349;
    float _457 = _455;
    if (_223)
    {
        float _459 = _281 * _179;
        _437 = _459;
    }
    float _461 = _437;
    float _463 = -_393;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _467 = -_395;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (_219)
    {
        float _471 = _271 * _155;
        _457 = _471;
    }
    float _473 = _457;
    float _475 = in.m_47.x;
    float _477 = in.m_47.y;
    float _479 = in.m_47.z;
    if (!_219)
    {
        _385 = 0.0;
    }
    float _481 = _385;
    float _483 = _481;
    if (_219)
    {
        float _485 = _271 * _165;
        _483 = _485;
    }
    float _487 = _483;
    float _489 = 0.0;
    if (!_219)
    {
        _489 = 0.0;
    }
    float _491 = _489;
    float _493 = _491;
    if (_219)
    {
        float _495 = _271 * _181;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = _401 * _431;
    float _501 = _401 * _473;
    float _503 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _505 = _401 * _445;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _513 = _511 != 0;
    float _515 = fma(_503, _421, _499);
    float _517 = fma(_503, _487, _501);
    int _519 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _521 = _519 != 0;
    float _523 = in.m_60.w;
    float _525 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _527 = !_509;
    int _529 = _527 ? 0 : 1;
    float _531 = fma(_503, _441, _505);
    float _533 = in.m_42.x;
    float _535 = in.m_42.y;
    float _537 = in.m_42.z;
    bool _539 = !_521;
    int _541 = _539 ? 0 : 1;
    float _543 = fma(_525, _461, _515);
    float _545 = fma(_525, _497, _517);
    int _547 = abs(_529);
    int _549 = abs(_541);
    float _551 = fma(_525, _449, _531);
    bool _553 = !_513;
    int _555 = _553 ? 0 : 1;
    float _557 = fma(_377, _475, _543);
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _561 = fma(_377, _477, _545);
    float _563 = fma(_377, _479, _551);
    int _565 = abs(_555);
    float _567 = float(_547);
    float _569 = float(_549);
    float _571 = abs(_453);
    float _573 = _567 * _571;
    float _575 = float(_565);
    float _577 = fma(_569, _469, _573);
    float _579 = fma(_557, _523, _533);
    float _581 = fma(_561, _523, _535);
    float _583 = fma(_563, _523, _537);
    float _585 = abs(_465);
    float _587 = fma(_575, _585, _577);
    bool _589 = !_559;
    float _605;
    if (!_589)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_97);
        float _611 = 1.0 / _609;
        float _613 = _131 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = in.m_55.y;
    float _619 = _185 * 2.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _623 = _615 + _621;
    float _625 = floor(_619);
    float _627 = in.m_55.z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _635 = _615 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    float _641 = _185 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = 1.0 / _639;
    float _649 = -_629;
    float _651 = fma(_641, 2.0, _649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = _615 + _657;
    bool _661 = _625 > 0.0;
    float _663 = -_131;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _667 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _669 = _617 * 2.0;
    float _671 = _185 + _617;
    float _673 = fma(_667, -2.0, _631);
    bool _675 = _625 >= 0.0;
    bool _677 = isnan(_625);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    float _685 = floor(_669);
    float _687 = _671 + (-1.0);
    float _689 = _623 * _647;
    int _691 = _683 ? 0 : 1;
    float _693 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _695 = 1.0 / _655;
    int _697 = ~_691;
    int _699 = _697 + 1;
    int _701 = _699 + 1;
    int _703 = _701;
    if (!_661)
    {
        int _705 = ~_691;
        int _707 = _705 + 1;
        _703 = _707;
    }
    int _709 = _703;
    float _711 = 1.0 / _645;
    bool _713 = _685 > 0.0;
    float _715 = _185 + _627;
    bool _717 = _685 >= 0.0;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = _715 + (-1.0);
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    float _741 = _659 * _695;
    bool _743 = _617 > 0.5;
    float _745 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _747 = _627 > 0.5;
    float _749 = _627 * 2.0;
    bool _751 = !_735;
    int _753 = _751 ? 0 : 1;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = _635 * _711;
    bool _761 = !_731;
    int _763 = _761 ? 0 : 1;
    float _765 = _627 + _617;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _773 = _771 != 0;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _777 = floor(_749);
    float _779 = -_245;
    int _781 = _743 ? as_type<int>(_779) : as_type<int>(_245);
    float _783 = _765 + (-1.0);
    float _785 = -_249;
    int _787 = _747 ? as_type<int>(_785) : as_type<int>(_249);
    bool _789 = !_739;
    int _791 = _789 ? 0 : 1;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _795 = !_769;
    float _797 = _795 ? _245 : as_type<float>(_781);
    bool _799 = !_773;
    float _801 = _799 ? _249 : as_type<float>(_787);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _813 = _811 != 0;
    float _815 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _817 = int(_815);
    int _819 = _725 ? 0 : 1;
    bool _821 = !_809;
    int _823 = _821 ? 0 : 1;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _827 = _825 != 0;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _829;
    int _833 = ~_819;
    int _835 = _833 + 1;
    int _837 = _835 + 1;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _839;
    int _843 = _837;
    float _845 = as_type<float>(_817);
    if (!_713)
    {
        int _847 = ~_819;
        int _849 = _847 + 1;
        _843 = _849;
    }
    int _851 = _843;
    float _853 = fma(_831, _689, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _855 = _777 > 0.0;
    float _857 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _859 = int(_857);
    bool _861 = _777 >= 0.0;
    bool _863 = isnan(_777);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    float _871 = fma(_841, _689, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _881 = _869 ? 0 : 1;
    int _883 = as_type<int>(_777);
    float _885 = _879;
    if (_827)
    {
        _883 = 0;
    }
    int _887 = _883;
    float _889 = fma(_875, _759, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _891 = _887;
    if (!_827)
    {
        _891 = 1;
    }
    int _893 = _891;
    float _895 = fma(_879, _759, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _897 = ~_881;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    bool _903 = _893 != 1;
    int _905 = _901;
    float _907 = as_type<float>(_893);
    if (!_855)
    {
        int _909 = ~_881;
        int _911 = _909 + 1;
        _905 = _911;
    }
    int _913 = _905;
    float _915 = float(_859);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _919 = float(_97);
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _923 = as_type<float>(_859);
    if (!_903)
    {
        _885 = _617;
    }
    float _925 = _885;
    float _927 = 1.0 / _915;
    float _929 = _925;
    if (_903)
    {
        _929 = _185;
    }
    float _931 = _929;
    if (!_903)
    {
        _907 = _627;
    }
    float _933 = _907;
    float _935 = _933;
    if (!_903)
    {
        _923 = _617;
    }
    float _937 = _923;
    float _939 = _931 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _941 = _937;
    if (_903)
    {
        _935 = _617;
    }
    float _943 = _935;
    float _945 = 1.0 / _919;
    float _947 = float(_817);
    if (_903)
    {
        _941 = _185;
    }
    float _949 = _941;
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[83].w, _775);
    if (!_903)
    {
        _845 = _627;
    }
    float _953 = _845;
    float _955 = -_917;
    float _957 = fma(_939, 2.0, _955);
    float _959 = _953;
    if (_903)
    {
        _959 = _617;
    }
    float _961 = _959;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[83].z, _921);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _967 = !_813;
    int _969 = _967 ? 0 : 1;
    float _971 = 1.0 / _947;
    float _973 = _961 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _975 = !_805;
    int _977 = _975 ? 0 : 1;
    float _979 = _927 * _131;
    int _981 = abs(_823);
    float _983 = fma(_973, -2.0, _965);
    int _985 = abs(_969);
    float _987 = _757 * _131;
    float _989 = float(_709);
    float _991 = _945 * _131;
    int _993 = abs(_977);
    float _995 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _963);
    float _997 = float(_851);
    float _999 = exp2(_987);
    float _1001 = float(_981);
    float _1003 = -_131;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[81].x, _957);
    float _1007 = float(_985);
    float _1009 = _1001 * _989;
    float _1011 = float(_913);
    float _1013 = _1007 * _997;
    float _1015 = float(_993);
    float _1017 = in.m_62.x;
    float _1019 = in.m_62.y;
    float _1021 = in.m_62.z;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1025 = 1.0 + _1023;
    float _1027 = _1015 * _1011;
    float _1029 = -_999;
    float _1031 = _1029 + 1.0;
    float _1033 = 1.0 / _1025;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1037 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(1.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1057 = _1053 || _1055;
    float _1059 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1047);
    float _1061 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1035);
    float _1063 = _971 * _131;
    float _1065 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    float _1067 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _673);
    float _1069 = _1057 ? _1031 : 0.0;
    float _1071 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _951);
    float _1073 = _1027 * (-2.0);
    float _1075 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1061);
    float _1077 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _983);
    if (_1045)
    {
        float _1079 = _1069 * _1033;
        _135 = _1079;
    }
    float _1081 = _135;
    float _1083 = _1009 * (-2.0);
    float _1085 = fma(_1073, _1017, _1017);
    float _1087 = fma(_693, _1073, _693);
    float _1089 = _185 + (-0.5);
    bool _1091 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1093 = isnan(_615);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = fma(_793, _1083, _793);
    float _1105 = fma(_1083, _1019, _1019);
    float _1107 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1085);
    float _1109 = _617 + (-0.5);
    bool _1111 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1113 = isnan(_615);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1119 = _1115 || _1117;
    float _1121 = float(_1119);
    float _1123 = -_1101;
    float _1125 = _1123 + 1.0;
    float _1127 = fma(_1087, _1081, _1107);
    float _1129 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1105);
    bool _1131 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1133 = isnan(_615);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _1121 * _1125;
    float _1145 = -_1121;
    float _1147 = _1145 + 1.0;
    float _1149 = _1127 * 0.15915493667125701904296875;
    float _1151 = _1013 * (-2.0);
    bool _1153 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1155 = isnan(_615);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1141 * _1147;
    float _1167 = -_1141;
    float _1169 = _1167 + 1.0;
    float _1171 = fma(_1103, _1081, _1129);
    float _1173 = fma(_745, _1151, _745);
    float _1175 = in.m_60.x;
    float _1177 = in.m_60.y;
    float _1179 = _1163 * _1169;
    float _1181 = fma(_1151, _1021, _1021);
    float _1183 = _627 + (-0.5);
    float _1185 = -_1163;
    float _1187 = _1185 + 1.0;
    float _1189 = _871 * _1179;
    float _1191 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1193;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1189);
    float _1199 = _853 * _1179;
    float _1201 = fma(_1173, _1081, _1191);
    float _1203 = fma(_1195, _741, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1205 = fma(_895, _1165, _1197);
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1207;
    float _1211 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1199);
    float _1213 = _1201 * 0.15915493667125701904296875;
    float _1215 = fma(_1203, _1143, _1205);
    float _1217 = fma(_1209, _741, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1219 = fma(_889, _1165, _1211);
    float _1221 = _1171 * 0.15915493667125701904296875;
    float _1223 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1215);
    float _1225 = _1213 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = fma(_1217, _1143, _1219);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _249);
    float _1233 = _1223 * _1177;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1245 = _1243 != 0;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1249 = _1247 != 0;
    float _1251 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1229);
    float _1253 = _587 * _1233;
    float _1255 = _1149 * 6.283185482025146484375;
    float _1257 = sin(_1255);
    float _1259 = _1251 * _1175;
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1263 = _587 * _1259;
    float _1265 = _1261 * _1231;
    float _1267 = _1149 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1275 = _1227 * _1265;
    float _1277 = _1273 * _1271;
    float _1279 = _581 * _181;
    float _1281 = _1221 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = fma(_579, _179, _1279);
    float _1287 = in.m_53.w;
    float _1289 = _1221 * 6.283185482025146484375;
    float _1291 = cos(_1289);
    float _1293 = _1269 * _1275;
    float _1295 = _1257 * _1275;
    float _1297 = _1213 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1257 * _1283;
    float _1303 = _1283 * _1227;
    float _1305 = _1269 * _1291;
    float _1307 = _1291 * _1227;
    float _1309 = _1269 * _1283;
    float _1311 = _1257 * _1291;
    float _1313 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1315 = fma(_1299, _1305, _1301);
    float _1317 = -_1265;
    float _1319 = _1299 * _1317;
    float _1321 = -_1311;
    float _1323 = fma(_1299, _1309, _1321);
    float _1325 = fma(_1299, _1301, _1305);
    float _1327 = fma(_1315, _1277, _1293);
    float _1329 = -_1309;
    float _1331 = fma(_1299, _1311, _1329);
    float _1333 = in.m_51.w;
    float _1335 = fma(_1307, _1277, _1319);
    float _1337 = fma(_1323, _1313, _1327);
    float _1339 = fma(_1331, _1277, _1295);
    float _1341 = _581 * _165;
    float _1343 = fma(_1303, _1313, _1335);
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1347 = fma(_1325, _1313, _1339);
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1351 = fma(_579, _163, _1341);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1345);
    float _1355 = fma(_583, _183, _1285);
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1349);
    float _1359 = fma(_583, _167, _1351);
    float _1361 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1353);
    float _1363 = _1355 + _1287;
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1357);
    float _1367 = in.m_49.w;
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1371 = _581 * _155;
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1375 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1377 = _1363 + _1369;
    float _1379 = fma(_579, _153, _1371);
    float _1381 = _1359 + _1333;
    float _1383 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1375);
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1387 = _1377 + _1385;
    bool _1389 = !_1241;
    int _1391 = _1389 ? 0 : 1;
    float _1393 = _1381 + _1373;
    float _1395 = fma(_583, _157, _1379);
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1383);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1403 = _1393 + _1401;
    bool _1405 = !_1237;
    int _1407 = _1405 ? 0 : 1;
    float _1409 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1411 = fma(_1403, _1403, _1397);
    bool _1413 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1415 = isnan(0.5);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1421 = _1417 || _1419;
    bool _1423 = !_1245;
    int _1425 = _1423 ? 0 : 1;
    float _1427 = sqrt(_1411);
    float _1429 = _1395 + _1367;
    bool _1431 = !_1249;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = _1429 + _1409;
    bool _1437 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1439 = _1411;
    float _1441 = _1343;
    float _1443 = _1427;
    float _1445 = _1403;
    float _1447 = _1387;
    float _1449 = _1367;
    if (!_1437)
    {
        _263 = _1393;
    }
    float _1451 = _263;
    float _1453 = _1451;
    if (!_1437)
    {
        _265 = _1377;
    }
    float _1455 = _265;
    float _1457 = _1455;
    if (!_1437)
    {
        _267 = _1435;
    }
    float _1459 = _267;
    bool _1461 = !_1437;
    float _1463 = _1459;
    if (!_1461)
    {
        float _1465 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1469 = _1427 + _1467;
        float _1471 = _1435 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1473 = rsqrt(_1411);
        float _1475 = _1469 * _1465;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = _1477 * 6.283185482025146484375;
        float _1481 = cos(_1479);
        float _1483 = _1477 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1481 + (-1.0);
        float _1489 = fma(_1485, _1471, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1493 = _1473 * _1489;
        float _1495 = fma(_1435, _1481, _1491);
        float _1497 = fma(_1403, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1499 = fma(_1387, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1453 = _1497;
        _1463 = _1495;
        _1457 = _1499;
        _1439 = _1473;
        _1441 = _1477;
        _1443 = _1487;
    }
    float _1501 = _1453;
    float _1503 = _1463;
    float _1505 = _1457;
    float _1507 = _1439;
    float _1509 = _1441;
    float _1511 = _1443;
    float _1513 = _1507;
    float _1515 = _1511;
    if (_1421)
    {
        _1445 = _1501;
    }
    float _1517 = _1445;
    float _1519 = _1517;
    if (_1421)
    {
        _1513 = _1503;
    }
    float _1521 = _1513;
    float _1523 = _1521;
    if (_1421)
    {
        _1447 = _1505;
    }
    float _1525 = _1447;
    float _1527 = _1525;
    if (!_1421)
    {
        float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1531 = _1429 + _1529;
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1535 = _1381 + _1533;
        float _1537 = -_1429;
        float _1539 = _1537 + _1503;
        float _1541 = -_1363;
        float _1543 = _1541 + _1505;
        float _1545 = _1531 * _1531;
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1549 = _1363 + _1547;
        float _1551 = fma(_1535, _1535, _1545);
        float _1553 = -_1381;
        float _1555 = _1553 + _1501;
        float _1557 = fma(_1549, _1549, _1551);
        float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1561 = sqrt(_1557);
        float _1563 = precise::min(_1561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1565 = _1563 * _1559;
        float _1567 = fma(_1555, _1565, _1381);
        float _1569 = fma(_1539, _1565, _1429);
        float _1571 = fma(_1543, _1565, _1363);
        _1523 = _1569;
        _1519 = _1567;
        _1527 = _1571;
        _1515 = _1561;
    }
    float _1573 = _1523;
    float _1575 = _1519;
    float _1577 = _1527;
    float _1579 = _1515;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1583 = _1573 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1575 + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1591 = _1577 + _1589;
    float _1593 = _1583 * _1583;
    float _1595 = fma(_1587, _1587, _1593);
    float _1597 = fma(_1591, _1591, _1595);
    float _1599 = rsqrt(_1597);
    float _1601 = sqrt(_1597);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1605 = _1587 * _1603;
    float _1607 = _1591 * _1603;
    float _1609 = _1605 * _1605;
    float _1611 = _1607 * _1607;
    float _1613 = _1609 + _1611;
    float _1615 = sqrt(_1613);
    bool _1617 = _1615 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = _1615 + _1619;
    float _1623 = _1501;
    float _1625 = _1613;
    float _1627 = _1621;
    float _1629 = _1605;
    float _1631 = _1607;
    float _1633 = _1611;
    if (_1617)
    {
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1623 = _1635;
    }
    float _1637 = _1623;
    if (_1617)
    {
        float _1639 = rsqrt(_1613);
        _1625 = _1639;
    }
    float _1641 = _1625;
    if (_1617)
    {
        float _1643 = _1621 * _1637;
        _1627 = _1643;
    }
    float _1645 = _1627;
    if (_1617)
    {
        float _1647 = _1645 * 0.15915493667125701904296875;
        _1449 = _1647;
    }
    float _1649 = _1449;
    float _1651 = _1509;
    if (_1617)
    {
        float _1653 = _1649 * 6.283185482025146484375;
        float _1655 = sin(_1653);
        _1651 = _1655;
    }
    float _1657 = _1651;
    float _1659 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1661 = precise::max(0.0, _1659);
    float _1663 = _1579;
    float _1665 = _1661;
    float _1667 = _1659;
    if (_1617)
    {
        float _1669 = _1649 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        _1663 = _1671;
    }
    float _1673 = _1663;
    float _1675 = -_1603;
    float _1677 = -_1661;
    float _1679 = fma(_1583, _1675, _1677);
    float _1681 = _1679;
    if (_1617)
    {
        float _1683 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1683;
    }
    float _1685 = _1665;
    float _1687 = _1685;
    float _1689 = _1657;
    if (_1617)
    {
        float _1691 = fma(_1657, _1685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = _1693;
    if (_1617)
    {
        float _1697 = _1673 + (-1.0);
        _1667 = _1697;
    }
    float _1699 = _1667;
    float _1701 = _1699;
    if (_1617)
    {
        float _1703 = _1641 * _1693;
        _1689 = _1703;
    }
    float _1705 = _1689;
    if (!_1617)
    {
        _1695 = _1609;
    }
    float _1707 = _1695;
    float _1709 = _1707;
    if (_1617)
    {
        float _1711 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1711;
    }
    float _1713 = _1701;
    if (_1617)
    {
        float _1715 = _1605 * _1705;
        _1629 = _1715;
    }
    float _1717 = _1629;
    if (_1617)
    {
        float _1719 = _1607 * _1705;
        _1631 = _1719;
    }
    float _1721 = _1631;
    if (_1617)
    {
        float _1723 = fma(_1679, _1673, _1713);
        _1681 = _1723;
    }
    float _1725 = _1681;
    if (_1617)
    {
        float _1727 = _1717 * _1717;
        _1709 = _1727;
    }
    float _1729 = _1709;
    if (_1617)
    {
        float _1731 = _1721 * _1721;
        _1633 = _1731;
    }
    float _1733 = _1633;
    float _1735 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1739 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1737);
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = fma(_1725, _1725, _1729);
    float _1745 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1747 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1749 = -_1741;
    float _1751 = _1749 + 1.0;
    float _1753 = _1743 + _1733;
    float _1755 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1757 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1759 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1761 = abs(_1751);
    float _1763 = log2(_1761);
    float _1765 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1755);
    float _1767 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1759);
    float _1771 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1773 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1775 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1777 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1769);
    float _1779 = rsqrt(_1753);
    float _1781 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1783 = -_1775;
    float _1785 = fma(_1783, _1745, 1.0);
    float _1787 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1789 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1771);
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1793 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1789);
    float _1795 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1791);
    float _1797 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1799 = log2(_1785);
    float _1801 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1803 = _1779 * _1717;
    float _1805 = _1779 * _1725;
    float _1807 = _1779 * _1721;
    float _1809 = exp2(_1797);
    float _1811 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1813 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1795);
    float _1815 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1817 = -_1811;
    float _1819 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1817);
    float _1821 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1815);
    float _1825 = -_1807;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1819);
    float _1829 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1831 = 1.0 / _1821;
    float _1833 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1835 = fma(_1827, -0.5, 0.5);
    float _1837 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1829);
    float _1839 = fma(_1827, 0.5, 0.5);
    float _1841 = _1805 + 1.0;
    float _1843 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1837);
    float _1845 = sqrt(_1835);
    float _1847 = fma(_1839, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1849 = -_1805;
    float _1851 = fma(_1809, _1841, _1849);
    float _1853 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1843);
    float _1855 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1833);
    float _1857 = fma(_1839, _1847, -0.212114393711090087890625);
    float _1859 = _1799 * 0.693147182464599609375;
    float _1861 = _1853 * _1831;
    float _1863 = fma(_1839, _1857, 1.570728778839111328125);
    float _1865 = _1855 * _1831;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = fma(_1861, 0.5, 0.5);
    float _1871 = fma(_1851, 0.5, 0.5);
    float _1873 = fma(_1865, -0.5, 0.5);
    float _1875 = _1845 * 0.636619746685028076171875;
    float _1877 = -_1863;
    float _1879 = fma(_1875, _1877, 1.0);
    float3 _5813 = float3(_1869, _1873, _1867);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5813, float3(0.0), isnan(_5813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5813, float3(0.0), isnan(_5813)), level(0.0)).x;
    float3 _5824 = float3(_1869, _1873, _1867);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5824, float3(0.0), isnan(_5824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5824, float3(0.0), isnan(_5824)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float2 _5841 = float2(_1879, _1871);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5841, float2(0.0), isnan(_5841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5841, float2(0.0), isnan(_5841)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1906 = int(_1904);
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1910 = _1908 != 0;
    out.m_45.x = 1.0;
    int _1912 = abs(_753);
    float _1914 = _797 + 0.5;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1918 = _1916 != 0;
    float _1920 = -_801;
    float _1922 = _1920 + 0.5;
    int _1924 = abs(_763);
    float _1926 = trunc(_979);
    int _1928 = int(_1926);
    int _1930 = abs(_1391);
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1934 = abs(_1407);
    float _1936 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1938 = abs(_1425);
    float _1940 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1942 = abs(_1433);
    float _1944 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1946 = int(_1944);
    float _1948 = float(uint(_1906));
    float _1950 = -_1065;
    float _1952 = _1950 + 1.0;
    int _1954 = ~_1906;
    int _1956 = _1954 + 1;
    int _1958 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1960 = _1958 != 0;
    bool _1962 = _627 > 0.5;
    float _1964 = 1.0 / _1948;
    float _1966 = float(uint(_1928));
    float _1968 = float(uint(_1946));
    float _1970 = trunc(_1063);
    int _1972 = int(_1970);
    int _1974 = ~_1906;
    int _1976 = _1974 + 1;
    int _1978 = ~_1946;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>(_1964) + (-2);
    float _1984 = 1.0 / _1968;
    float _1986 = as_type<float>(_1982) * _1966;
    float _1988 = trunc(_1986);
    float _1990 = precise::max(_1988, 0.0);
    uint _1993 = uint(_1990);
    int _1995 = as_type<int>(_1984) + (-2);
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1999 = _1986;
    float _2001 = _1984;
    if (_827)
    {
        _1999 = 1.0;
    }
    float _2003 = _1999;
    float _2005 = _2003;
    if (!_827)
    {
        _2005 = 7.345489978790283203125;
    }
    float _2007 = _2005;
    if (_827)
    {
        _2001 = 1.0;
    }
    float _2009 = _2001;
    int _2011 = _1976 * int(_1993);
    int _2013 = _2011 + _1928;
    float _2015 = _2007 * _185;
    float _2017 = _2009;
    if (!_827)
    {
        _2017 = 1.2345600128173828125;
    }
    float _2019 = _2017;
    float _2021 = exp2(_1940);
    float _2023 = float(uint(_2013));
    float _2025 = _1932 * _1997;
    float _2027 = as_type<float>(_1982) * _2023;
    float _2029 = float(uint(_1972));
    float _2031 = floor(_2015);
    float _2033 = as_type<float>(_1995) * _2029;
    float _2035 = _2029;
    if (_827)
    {
        _2035 = _185;
    }
    float _2037 = _2035;
    float _2039 = _2037;
    if (!_827)
    {
        _2039 = _617;
    }
    float _2041 = _2039;
    float _2043 = trunc(_2027);
    float _2045 = precise::max(_2043, 0.0);
    uint _2047 = uint(_2045);
    bool _2049 = _617 > 0.5;
    float _2051 = -_2021;
    float _2053 = _2051 + 1.0;
    float _2055 = _2019 * _2041;
    float _2057 = float(_1928);
    float _2059 = trunc(_2033);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = int(_1993) + int(_2047);
    float _2067 = floor(_2055);
    float _2069 = float(_1906);
    int _2071 = _1956 * _2065;
    int _2073 = _2071 + _1928;
    bool _2075 = _2057 >= _2069;
    bool _2077 = isnan(_2057);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(_2069);
    bool _2083 = _2079 || _2081;
    float _2085 = float(_2083);
    int _2087 = _1980 * int(_2063);
    int _2089 = _2087 + _1972;
    bool _2091 = uint(_2073) >= uint(_1906);
    float _2093 = trunc(_2085);
    int _2095 = int(_2093);
    float _2097 = float(uint(_2089));
    bool _2099 = !_2091;
    int _2101 = _2099 ? 0 : (-1);
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2105 = _2103 != 0;
    float _2107 = as_type<float>(_1995) * _2097;
    float _2109 = -_2031;
    float _2111 = _2015 + _2109;
    float _2113 = -_2067;
    float _2115 = _2055 + _2113;
    float _2117 = float(_1946);
    float _2119 = trunc(_2107);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = _2111 * _2069;
    int _2127 = ~_2065;
    int _2129 = _2127 + _2101;
    int _2131 = _2129 + 1;
    float _2133 = _2069 * _991;
    float _2135 = float(_1972);
    float _2137 = _2117 * _991;
    bool _2139 = !_1910;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = _2115 * _2117;
    float _2145 = trunc(_2125);
    int _2147 = int(_2145);
    bool _2149 = _2135 >= _2117;
    bool _2151 = isnan(_2135);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(_2117);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    int _2161 = _1906 * _2131;
    int _2163 = _2161 + _1928;
    bool _2165 = _1906 == 0;
    int _2167 = abs(_2141);
    int _2169 = ~_1946;
    int _2171 = _2169 + 1;
    float _2173 = trunc(_2133);
    int _2175 = int(_2173);
    int _2177 = ~_2095;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    bool _2183 = !_2165;
    int _2185 = _2183 ? _2163 : (-1);
    int _2187 = int(_2063) + int(_2123);
    int _2189 = _2147 * _2167;
    int _2191 = _2189 + _1928;
    int _2193 = _1906 + (-1);
    int _2195 = _2185 * _2181;
    float _2197 = trunc(_2143);
    int _2199 = int(_2197);
    int _2201 = _2171 * _2187;
    int _2203 = _2201 + _1972;
    int _2205 = _2095 * _2193;
    int _2207 = _2205 + _2195;
    bool _2209 = !_1918;
    int _2211 = _2209 ? 0 : 1;
    bool _2213 = uint(_2203) >= uint(_1946);
    int _2215 = _2207 * _1912;
    float _2217 = trunc(_2159);
    int _2219 = int(_2217);
    int _2221 = abs(_2211);
    bool _2223 = !_2213;
    int _2225 = _2223 ? 0 : (-1);
    int _2227 = _2175 * _1924;
    int _2229 = _2227 + _2215;
    int _2231 = abs(_791);
    bool _2233 = !_2105;
    int _2235 = _2233 ? 0 : 1;
    float _2237 = trunc(_2137);
    int _2239 = int(_2237);
    int _2241 = ~_2187;
    int _2243 = _2241 + _2225;
    int _2245 = _2243 + 1;
    int _2247 = abs(_2235);
    int _2249 = _1946 * _2245;
    int _2251 = _2249 + _1972;
    bool _2253 = _1946 == 0;
    int _2255 = _2199 * _2221;
    int _2257 = _2255 + _1972;
    int _2259 = ~_2219;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    int _2265 = _2191 * _2231;
    int _2267 = _2265 + _2229;
    bool _2269 = !_2253;
    int _2271 = _2269 ? _2251 : (-1);
    int _2273 = _1946 + (-1);
    int _2275 = _2147 * _2247;
    int _2277 = _2275 + _2267;
    int _2279 = _2271 * _2263;
    float _2281 = float(uint(_2277));
    int _2283 = _2219 * _2273;
    int _2285 = _2283 + _2279;
    float _2287 = as_type<float>(_1982) * _2281;
    int _2289 = _2285 * _1930;
    float _2291 = trunc(_2287);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2239 * _1934;
    int _2299 = _2297 + _2289;
    int _2301 = ~_1906;
    int _2303 = _2301 + 1;
    int _2305 = _2257 * _1938;
    int _2307 = _2305 + _2299;
    int _2309 = ~_1906;
    int _2311 = _2309 + 1;
    int _2313 = _2199 * _1942;
    int _2315 = _2313 + _2307;
    int _2317 = ~_1946;
    int _2319 = _2317 + 1;
    float _2321 = float(uint(_2315));
    int _2323 = _2303 * int(_2295);
    int _2325 = _2323 + _2277;
    float _2327 = as_type<float>(_1995) * _2321;
    float _2329 = float(uint(_2325));
    float _2331 = trunc(_2327);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    float _2337 = as_type<float>(_1982) * _2329;
    float _2339 = trunc(_2337);
    float _2341 = precise::max(_2339, 0.0);
    uint _2343 = uint(_2341);
    int _2345 = _2319 * int(_2335);
    int _2347 = _2345 + _2315;
    float _2349 = float(uint(_2191));
    float _2351 = float(uint(_2347));
    float _2353 = as_type<float>(_1982) * _2349;
    float _2355 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2357 = int(_2295) + int(_2343);
    float _2359 = as_type<float>(_1995) * _2351;
    float _2361 = trunc(_2353);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    float _2367 = _2355 * _185;
    int _2369 = ~_1946;
    int _2371 = _2369 + 1;
    int _2373 = _2311 * _2357;
    int _2375 = _2373 + _2277;
    float _2377 = trunc(_2359);
    float _2379 = precise::max(_2377, 0.0);
    uint _2381 = uint(_2379);
    bool _2383 = uint(_2375) >= uint(_1906);
    bool _2385 = !_2383;
    int _2387 = _2385 ? 0 : (-1);
    float _2389 = trunc(_2367);
    int _2391 = int(_2389);
    int _2393 = ~_2357;
    int _2395 = _2393 + _2387;
    int _2397 = _2395 + 1;
    int _2399 = ~_1946;
    int _2401 = _2399 + 1;
    float _2403 = in.m_55.w;
    int _2405 = _1906 * _2397;
    int _2407 = _2405 + _2277;
    int _2409 = ~_1906;
    int _2411 = _2409 + 1;
    int _2413 = int(_2335) + int(_2381);
    bool _2415 = !_2165;
    int _2417 = _2415 ? _2407 : (-1);
    int _2419 = _2411 * int(_2365);
    int _2421 = _2419 + _2191;
    int _2423 = _2401 * _2413;
    int _2425 = _2423 + _2315;
    float _2427 = float(uint(_2257));
    int _2429 = _2417 & 3;
    bool _2431 = _2429 != 0;
    int _2433 = _2391 << 4;
    int _2435 = _2433 + 1712;
    float _2437 = as_type<float>(_1995) * _2427;
    float _2439 = float(uint(_2421));
    int _2441 = _2431 ? 0 : 1;
    bool _2443 = _185 > 0.5;
    float _2445 = as_type<float>(_1982) * _2439;
    float _2447 = trunc(_2437);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    float _2453 = -_249;
    int _2455 = _2049 ? as_type<int>(_2453) : as_type<int>(_249);
    uint _2457 = uint(int(uint(_2435) >> uint(2)));
    uint _2459 = uint(int(uint(int(_2457)) >> uint(2)));
    int _2461 = int(_2457) & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    int _2465 = int(_2457) + 1;
    uint _2467 = uint(int(uint(_2465) >> uint(2)));
    int _2469 = _2465 & 3;
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[int(_2467)][_2469];
    float _2473 = -_245;
    int _2475 = _2443 ? as_type<int>(_2473) : as_type<int>(_245);
    bool _2477 = uint(_2425) >= uint(_1946);
    bool _2479 = !_1960;
    float _2481 = _2479 ? _245 : as_type<float>(_2475);
    float _2483 = trunc(_2445);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2477;
    int _2495 = _2493 ? 0 : (-1);
    bool _2497 = !_2491;
    float _2499 = _2497 ? _249 : as_type<float>(_2455);
    int _2501 = _2435 + 8;
    uint _2503 = uint(int(uint(_2501) >> uint(2)));
    uint _2505 = uint(int(uint(int(_2503)) >> uint(2)));
    int _2507 = int(_2503) & 3;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[int(_2505)][_2507];
    int _2511 = _2371 * int(_2451);
    int _2513 = _2511 + _2257;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2517 = _2515 != 0;
    bool _2519 = _2403 > 0.5;
    float _2521 = float(uint(_2513));
    float _2523 = -_245;
    int _2525 = _1962 ? as_type<int>(_2523) : as_type<int>(_245);
    float _2527 = as_type<float>(_1995) * _2521;
    float _2529 = _2499 + (-0.5);
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2533 = !_2517;
    float _2535 = _2533 ? _245 : as_type<float>(_2525);
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2539 = _2417 & 3;
    bool _2541 = _2539 != 0;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2545 = -_249;
    int _2547 = _2519 ? as_type<int>(_2545) : as_type<int>(_249);
    float _2549 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2551 = uint(_2539) > 1u;
    float _2553 = _2537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2555 = ~_2413;
    int _2557 = _2555 + _2495;
    int _2559 = _2557 + 1;
    float _2561 = _2543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2563 = int(_2365) + int(_2487);
    float _2565 = trunc(_2527);
    float _2567 = precise::max(_2565, 0.0);
    uint _2569 = uint(_2567);
    int _2571 = ~_1906;
    int _2573 = _2571 + 1;
    int _2575 = _1946 * _2559;
    int _2577 = _2575 + _2315;
    out.m_64.x = _2549;
    out.m_64.y = _2553;
    out.m_64.z = _2561;
    int _2579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2581 = _2579 != 0;
    int _2583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2585 = _2583 != 0;
    bool _2587 = !_2253;
    int _2589 = _2587 ? _2577 : (-1);
    float _2591 = -_2529;
    float _2593 = -_1067;
    float _2595 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2593);
    int _2597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2599 = _2597 != 0;
    float _2601 = _2481 + 0.5;
    bool _2603 = !_2581;
    float _2605 = _2603 ? _249 : as_type<float>(_2547);
    float _2607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2609 = _2573 * _2563;
    int _2611 = _2609 + _2191;
    int _2613 = _2417 >> 31;
    float _2615 = fma(_2601, (*spvDescriptorSet0.vp_c9)._m0[80].x, _665);
    int _2617 = ~_2441;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = _2621;
    if (!_2551)
    {
        int _2625 = ~_2441;
        int _2627 = _2625 + 1;
        _2623 = _2627;
    }
    int _2629 = _2623;
    int _2631 = _2613 & 3;
    float _2633 = _2463 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2635 = uint(_2611) >= uint(_1906);
    int _2637 = _2589 >> 31;
    float _2639 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2641 = _2417 + _2631;
    float _2643 = _2471 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2645 = _2637 & 3;
    float _2647 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2649 = _2641 >> 2;
    float _2651 = _2643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2653 = _2589 + _2645;
    float _2655 = _2647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2657 = _2653 >> 2;
    int _2659 = _2649 << 4;
    int _2661 = _2659 + 368;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2665 = _2657 << 4;
    int _2667 = _2665 + 512;
    bool _2669 = !_2635;
    int _2671 = _2669 ? 0 : (-1);
    uint _2673 = uint(int(uint(_2661) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    bool _2689 = uint(_2539) >= 2u;
    out.m_66.x = _2639;
    out.m_66.y = _2651;
    out.m_66.z = _2655;
    out.m_66.w = _2663;
    int _2691 = int(_2451) + int(_2569);
    float _2693 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2695 = _2689 ? 0 : 1;
    bool _2697 = _2539 != 3;
    uint _2699 = uint(int(uint(_2667) >> uint(2)));
    uint _2701 = uint(int(uint(int(_2699)) >> uint(2)));
    int _2703 = int(_2699) & 3;
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[int(_2701)][_2703];
    int _2707 = int(_2699) + 1;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    int _2711 = _2707 & 3;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[int(_2709)][_2711];
    int _2715 = ~_1946;
    int _2717 = _2715 + 1;
    float _2719 = _2693 * _2607;
    float _2721 = _2535 + 0.5;
    int _2723 = ~_2695;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    int _2729 = _2717 * _2691;
    int _2731 = _2729 + _2257;
    float _2733 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1005);
    int _2735 = _2661 + 8;
    uint _2737 = uint(int(uint(_2735) >> uint(2)));
    uint _2739 = uint(int(uint(int(_2737)) >> uint(2)));
    int _2741 = int(_2737) & 3;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[int(_2739)][_2741];
    int _2745 = int(_2737) + 1;
    uint _2747 = uint(int(uint(_2745) >> uint(2)));
    int _2749 = _2745 & 3;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[int(_2747)][_2749];
    int _2753 = ~_2563;
    int _2755 = _2753 + _2671;
    int _2757 = _2755 + 1;
    out.m_68.x = _2025;
    out.m_68.y = _2719;
    bool _2759 = uint(_2731) >= uint(_1946);
    int _2761 = _2727;
    if (_2697)
    {
        int _2763 = ~_2695;
        int _2765 = _2763 + 1;
        _2761 = _2765;
    }
    int _2767 = _2761;
    float _2769 = _2605 + (-0.5);
    int _2771 = _2589 & 3;
    bool _2773 = _2771 != 0;
    int _2775 = _2667 + 8;
    uint _2777 = uint(int(uint(_2775) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    bool _2793 = !_2759;
    int _2795 = _2793 ? 0 : (-1);
    int _2797 = _1906 * _2757;
    int _2799 = _2797 + _2191;
    bool _2801 = uint(_2771) > 1u;
    float _2803 = -_2769;
    float _2805 = -_1077;
    float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2805);
    bool _2809 = !_2541;
    int _2811 = _2809 ? 0 : 1;
    int _2813 = _2589 & 3;
    bool _2815 = _2813 != 0;
    int _2817 = ~_2691;
    int _2819 = _2817 + _2795;
    int _2821 = _2819 + 1;
    int _2823 = _2815 ? 0 : 1;
    bool _2825 = !_2773;
    int _2827 = _2825 ? 0 : 1;
    int _2829 = _1946 * _2821;
    int _2831 = _2829 + _2257;
    int _2833 = ~_2823;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = _2837;
    if (!_2801)
    {
        int _2841 = ~_2823;
        int _2843 = _2841 + 1;
        _2839 = _2843;
    }
    int _2845 = _2839;
    bool _2847 = _2539 != 3;
    int _2849 = abs(_2629);
    float _2851 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1936);
    int _2853 = abs(_2845);
    int _2855 = abs(_2811);
    float _2857 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2851);
    int _2859 = abs(_2827);
    int _2861 = ~_2849;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    float _2867 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2857);
    bool _2869 = _2771 != 3;
    int _2871 = _2865 * as_type<int>(_2687);
    int _2873 = ~_2853;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    out.gl_Position.x = _1853;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _2867;
    out.gl_Position.w = _1821;
    int _2879 = ~_2855;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    bool _2885 = uint(_2771) >= 2u;
    int _2887 = _2877 * as_type<int>(_2713);
    int _2889 = ~_2859;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    int _2895 = _2883 * as_type<int>(_2679);
    int _2897 = _2895 + _2871;
    int _2899 = _2885 ? 0 : 1;
    bool _2901 = _2771 != 3;
    int _2903 = _2893 * as_type<int>(_2705);
    int _2905 = _2903 + _2887;
    int _2907 = abs(_2767);
    bool _2909 = !_2847;
    int _2911 = _2909 ? 0 : (-1);
    int _2913 = ~_2899;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = _2917;
    if (_2869)
    {
        int _2921 = ~_2899;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    bool _2927 = !_2901;
    int _2929 = _2927 ? 0 : (-1);
    int _2931 = abs(_2911);
    int _2933 = ~_2907;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2925);
    int _2941 = abs(_2929);
    int _2943 = _2937 * as_type<int>(_2743);
    int _2945 = _2943 + _2897;
    int _2947 = ~_2939;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    bool _2953 = !_2585;
    int _2955 = _2953 ? 0 : 1;
    int _2957 = _2951 * as_type<int>(_2783);
    int _2959 = _2957 + _2905;
    int _2961 = ~_2931;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = abs(_2955);
    int _2969 = ~_2941;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = _2965 * as_type<int>(_2751);
    int _2977 = _2975 + _2945;
    bool _2979 = !_2599;
    int _2981 = _2979 ? 0 : 1;
    float _2983 = -_1075;
    float _2985 = _2983 + 1.0;
    int _2987 = ~_2967;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = _2973 * as_type<int>(_2791);
    int _2995 = _2993 + _2959;
    int _2997 = abs(_2981);
    float _2999 = -_995;
    float _3001 = _2999 + 1.0;
    float _3003 = -_1071;
    float _3005 = _3003 + 1.0;
    int _3007 = _2977 * _2991;
    float _3009 = -_1952;
    float _3011 = fma(_2481, _3009, _2615);
    float _3013 = fma(_2499, _2985, _2595);
    float _3015 = -_3001;
    float _3017 = fma(_2535, _3015, _2733);
    float _3019 = fma(_2605, _3005, _2807);
    bool _3021 = !_2165;
    int _3023 = _3021 ? _2799 : (-1);
    int _3025 = ~_2997;
    int _3027 = _3025 + 1;
    int _3029 = _3027 + 1;
    out.m_70.x = _3011;
    out.m_70.y = _3013;
    out.m_70.z = _3017;
    out.m_70.w = _3019;
    int _3031 = _3023 * _2967;
    int _3033 = _3031 + _3007;
    float _3035 = _2867 + _1821;
    bool _3037 = !_2253;
    int _3039 = _3037 ? _2831 : (-1);
    int _3041 = _2995 * _3029;
    float _3043 = _3035 * 0.5;
    int _3045 = _3039 * _2997;
    int _3047 = _3045 + _3041;
    float _3049 = float(_3033);
    out.m_72.z = _3043;
    out.m_72.w = _1821;
    float _3051 = float(_3047);
    float _3053 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3055 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3057 = _3053 * _1881;
    float _3059 = -_3053;
    float _3061 = _3059 + 1.0;
    out.m_74.x = _3049;
    out.m_74.y = _3051;
    float _3063 = _1892 * _3057;
    float _3065 = _1902 * _3057;
    float _3067 = _1892 * _3061;
    out.m_76.w = _3055;
    float _3069 = fma(_1898, _3063, _1886);
    float _3071 = fma(_1900, _3063, _1888);
    float _3073 = fma(_1892, _3065, _1890);
    out.m_78.x = _3069;
    out.m_78.y = _3071;
    out.m_78.z = _3073;
    out.m_78.w = _3067;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3130 = as_type<float>(_113);
        out.gl_Position.z = _3130;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3199 = as_type<float>(_151);
        out.gl_Position.z = _3199;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_53.x;
    float _181 = in.m_53.y;
    float _183 = in.m_53.z;
    float _185 = in.m_55.x;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _161 * _159;
    float _191 = _155 * _155;
    float _193 = _153 * _153;
    float _195 = _157 * _157;
    float _197 = fma(_165, _165, _191);
    float _199 = fma(_163, _163, _193);
    float _201 = fma(_167, _167, _195);
    float _203 = fma(_181, _181, _197);
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_183, _183, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[20].x, _189);
    float _213 = _211 * 6.283185482025146484375;
    float _215 = sqrt(_205);
    float _217 = _213 * 0.15915493667125701904296875;
    bool _219 = _209 > 0.0;
    float _221 = floor(_211);
    bool _223 = _215 > 0.0;
    float _225 = sqrt(_207);
    int _227 = as_type<int>(_187) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_187) & 2;
    bool _233 = _231 != 0;
    float _235 = _217 * 6.283185482025146484375;
    float _237 = cos(_235);
    float _239 = -_221;
    float _241 = _211 + _239;
    bool _243 = !_229;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_233;
    float _249 = _247 ? (-0.5) : 0.5;
    float _251 = 0.0;
    float _253 = _187;
    float _255 = _203;
    float _257 = _215;
    float _259 = _211;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _263 = _157;
    float _265 = _155;
    float _267 = _153;
    if (_219)
    {
        float _269 = rsqrt(_203);
        _251 = _269;
    }
    float _271 = _251;
    bool _273 = _225 > 0.0;
    float _275 = _213;
    float _277 = _225;
    if (_223)
    {
        float _279 = rsqrt(_205);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _285 = _283;
    if (!_177)
    {
        float _287 = _283 * _283;
        float _289 = _287 * 0.5;
        _253 = _289;
    }
    float _291 = _253;
    float _293 = _291;
    if (!_177)
    {
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _295;
    }
    float _297 = _293;
    bool _299 = !_177;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _283 * _305;
        float _315 = 1.0 / _309;
        float _317 = _311 * 0.693147182464599609375;
        float _319 = exp2(_313);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _283);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _319;
        _257 = _321;
        _301 = _331;
        _277 = _315;
        _259 = _329;
    }
    float _333 = _255;
    float _335 = _257;
    float _337 = _301;
    float _339 = _277;
    float _341 = _259;
    bool _343 = !_177;
    float _345 = _333;
    float _347 = _341;
    float _349 = _339;
    if (!_343)
    {
        float _351 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _353 = log2(_351);
        float _355 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _357 = _355 + 1.0;
        float _359 = 1.0 / _357;
        float _361 = _283 * _353;
        float _363 = exp2(_361);
        float _365 = -_363;
        float _367 = _365 + 1.0;
        float _369 = _367 * _359;
        _345 = _361;
        _347 = _359;
        _261 = _357;
        _285 = _369;
    }
    float _371 = _345;
    float _373 = _347;
    float _375 = _261;
    float _377 = _285;
    float _379 = _335;
    float _381 = _371;
    float _383 = _375;
    float _385 = _373;
    if (_273)
    {
        float _387 = rsqrt(_207);
        _379 = _387;
    }
    float _389 = _379;
    bool _391 = _241 < 0.5;
    float _393 = float(_391);
    float _395 = fma(_237, 0.5, 0.5);
    float _397 = 0.0;
    if (!_273)
    {
        _397 = 0.0;
    }
    float _399 = _397;
    float _401 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _403 = _399;
    if (!_273)
    {
        _381 = 0.0;
    }
    float _405 = _381;
    float _407 = _405;
    if (!_273)
    {
        _383 = 0.0;
    }
    float _409 = _383;
    float _411 = 0.0;
    float _413 = _409;
    if (!_223)
    {
        _411 = 0.0;
    }
    float _415 = _411;
    float _417 = _415;
    if (_223)
    {
        float _419 = _281 * _163;
        _417 = _419;
    }
    float _421 = _417;
    float _423 = 0.0;
    if (!_223)
    {
        _423 = 0.0;
    }
    float _425 = _423;
    float _427 = _425;
    if (_223)
    {
        float _429 = _281 * _153;
        _427 = _429;
    }
    float _431 = _427;
    float _433 = 0.0;
    if (!_223)
    {
        _433 = 0.0;
    }
    float _435 = _433;
    float _437 = _435;
    if (_273)
    {
        float _439 = _389 * _167;
        _403 = _439;
    }
    float _441 = _403;
    if (_273)
    {
        float _443 = _389 * _157;
        _407 = _443;
    }
    float _445 = _407;
    if (_273)
    {
        float _447 = _389 * _183;
        _413 = _447;
    }
    float _449 = _413;
    float _451 = -_241;
    float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (!_219)
    {
        _349 = 0.0;
    }
    float _455 = _349;
    float _457 = _455;
    if (_223)
    {
        float _459 = _281 * _179;
        _437 = _459;
    }
    float _461 = _437;
    float _463 = -_393;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _467 = -_395;
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    if (_219)
    {
        float _471 = _271 * _155;
        _457 = _471;
    }
    float _473 = _457;
    float _475 = in.m_47.x;
    float _477 = in.m_47.y;
    float _479 = in.m_47.z;
    if (!_219)
    {
        _385 = 0.0;
    }
    float _481 = _385;
    float _483 = _481;
    if (_219)
    {
        float _485 = _271 * _165;
        _483 = _485;
    }
    float _487 = _483;
    float _489 = 0.0;
    if (!_219)
    {
        _489 = 0.0;
    }
    float _491 = _489;
    float _493 = _491;
    if (_219)
    {
        float _495 = _271 * _181;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = _401 * _431;
    float _501 = _401 * _473;
    float _503 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _505 = _401 * _445;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _513 = _511 != 0;
    float _515 = fma(_503, _421, _499);
    float _517 = fma(_503, _487, _501);
    int _519 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _521 = _519 != 0;
    float _523 = in.m_60.w;
    float _525 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _527 = !_509;
    int _529 = _527 ? 0 : 1;
    float _531 = fma(_503, _441, _505);
    float _533 = in.m_42.x;
    float _535 = in.m_42.y;
    float _537 = in.m_42.z;
    bool _539 = !_521;
    int _541 = _539 ? 0 : 1;
    float _543 = fma(_525, _461, _515);
    float _545 = fma(_525, _497, _517);
    int _547 = abs(_529);
    int _549 = abs(_541);
    float _551 = fma(_525, _449, _531);
    bool _553 = !_513;
    int _555 = _553 ? 0 : 1;
    float _557 = fma(_377, _475, _543);
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _561 = fma(_377, _477, _545);
    float _563 = fma(_377, _479, _551);
    int _565 = abs(_555);
    float _567 = float(_547);
    float _569 = float(_549);
    float _571 = abs(_453);
    float _573 = _567 * _571;
    float _575 = float(_565);
    float _577 = fma(_569, _469, _573);
    float _579 = fma(_557, _523, _533);
    float _581 = fma(_561, _523, _535);
    float _583 = fma(_563, _523, _537);
    float _585 = abs(_465);
    float _587 = fma(_575, _585, _577);
    bool _589 = !_559;
    float _605;
    if (!_589)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_97);
        float _611 = 1.0 / _609;
        float _613 = _131 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = in.m_55.y;
    float _619 = _185 * 2.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _623 = _615 + _621;
    float _625 = floor(_619);
    float _627 = in.m_55.z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _635 = _615 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    float _641 = _185 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = 1.0 / _639;
    float _649 = -_629;
    float _651 = fma(_641, 2.0, _649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = _615 + _657;
    bool _661 = _625 > 0.0;
    float _663 = -_131;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _667 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _669 = _617 * 2.0;
    float _671 = _185 + _617;
    float _673 = fma(_667, -2.0, _631);
    bool _675 = _625 >= 0.0;
    bool _677 = isnan(_625);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    float _685 = floor(_669);
    float _687 = _671 + (-1.0);
    float _689 = _623 * _647;
    int _691 = _683 ? 0 : 1;
    float _693 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _695 = 1.0 / _655;
    int _697 = ~_691;
    int _699 = _697 + 1;
    int _701 = _699 + 1;
    int _703 = _701;
    if (!_661)
    {
        int _705 = ~_691;
        int _707 = _705 + 1;
        _703 = _707;
    }
    int _709 = _703;
    float _711 = 1.0 / _645;
    bool _713 = _685 > 0.0;
    float _715 = _185 + _627;
    bool _717 = _685 >= 0.0;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = _715 + (-1.0);
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    float _741 = _659 * _695;
    bool _743 = _617 > 0.5;
    float _745 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _747 = _627 > 0.5;
    float _749 = _627 * 2.0;
    bool _751 = !_735;
    int _753 = _751 ? 0 : 1;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    float _759 = _635 * _711;
    bool _761 = !_731;
    int _763 = _761 ? 0 : 1;
    float _765 = _627 + _617;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _773 = _771 != 0;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _777 = floor(_749);
    float _779 = -_245;
    int _781 = _743 ? as_type<int>(_779) : as_type<int>(_245);
    float _783 = _765 + (-1.0);
    float _785 = -_249;
    int _787 = _747 ? as_type<int>(_785) : as_type<int>(_249);
    bool _789 = !_739;
    int _791 = _789 ? 0 : 1;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _795 = !_769;
    float _797 = _795 ? _245 : as_type<float>(_781);
    bool _799 = !_773;
    float _801 = _799 ? _249 : as_type<float>(_787);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _813 = _811 != 0;
    float _815 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _817 = int(_815);
    int _819 = _725 ? 0 : 1;
    bool _821 = !_809;
    int _823 = _821 ? 0 : 1;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _827 = _825 != 0;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _829;
    int _833 = ~_819;
    int _835 = _833 + 1;
    int _837 = _835 + 1;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _839;
    int _843 = _837;
    float _845 = as_type<float>(_817);
    if (!_713)
    {
        int _847 = ~_819;
        int _849 = _847 + 1;
        _843 = _849;
    }
    int _851 = _843;
    float _853 = fma(_831, _689, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _855 = _777 > 0.0;
    float _857 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _859 = int(_857);
    bool _861 = _777 >= 0.0;
    bool _863 = isnan(_777);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    float _871 = fma(_841, _689, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _881 = _869 ? 0 : 1;
    int _883 = as_type<int>(_777);
    float _885 = _879;
    if (_827)
    {
        _883 = 0;
    }
    int _887 = _883;
    float _889 = fma(_875, _759, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _891 = _887;
    if (!_827)
    {
        _891 = 1;
    }
    int _893 = _891;
    float _895 = fma(_879, _759, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _897 = ~_881;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    bool _903 = _893 != 1;
    int _905 = _901;
    float _907 = as_type<float>(_893);
    if (!_855)
    {
        int _909 = ~_881;
        int _911 = _909 + 1;
        _905 = _911;
    }
    int _913 = _905;
    float _915 = float(_859);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _919 = float(_97);
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _923 = as_type<float>(_859);
    if (!_903)
    {
        _885 = _617;
    }
    float _925 = _885;
    float _927 = 1.0 / _915;
    float _929 = _925;
    if (_903)
    {
        _929 = _185;
    }
    float _931 = _929;
    if (!_903)
    {
        _907 = _627;
    }
    float _933 = _907;
    float _935 = _933;
    if (!_903)
    {
        _923 = _617;
    }
    float _937 = _923;
    float _939 = _931 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _941 = _937;
    if (_903)
    {
        _935 = _617;
    }
    float _943 = _935;
    float _945 = 1.0 / _919;
    float _947 = float(_817);
    if (_903)
    {
        _941 = _185;
    }
    float _949 = _941;
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[83].w, _775);
    if (!_903)
    {
        _845 = _627;
    }
    float _953 = _845;
    float _955 = -_917;
    float _957 = fma(_939, 2.0, _955);
    float _959 = _953;
    if (_903)
    {
        _959 = _617;
    }
    float _961 = _959;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[83].z, _921);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _967 = !_813;
    int _969 = _967 ? 0 : 1;
    float _971 = 1.0 / _947;
    float _973 = _961 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _975 = !_805;
    int _977 = _975 ? 0 : 1;
    float _979 = _927 * _131;
    int _981 = abs(_823);
    float _983 = fma(_973, -2.0, _965);
    int _985 = abs(_969);
    float _987 = _757 * _131;
    float _989 = float(_709);
    float _991 = _945 * _131;
    int _993 = abs(_977);
    float _995 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _963);
    float _997 = float(_851);
    float _999 = exp2(_987);
    float _1001 = float(_981);
    float _1003 = -_131;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[81].x, _957);
    float _1007 = float(_985);
    float _1009 = _1001 * _989;
    float _1011 = float(_913);
    float _1013 = _1007 * _997;
    float _1015 = float(_993);
    float _1017 = in.m_62.x;
    float _1019 = in.m_62.y;
    float _1021 = in.m_62.z;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1025 = 1.0 + _1023;
    float _1027 = _1015 * _1011;
    float _1029 = -_999;
    float _1031 = _1029 + 1.0;
    float _1033 = 1.0 / _1025;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1037 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(1.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1049 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1057 = _1053 || _1055;
    float _1059 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1047);
    float _1061 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1035);
    float _1063 = _971 * _131;
    float _1065 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1059);
    float _1067 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _673);
    float _1069 = _1057 ? _1031 : 0.0;
    float _1071 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _951);
    float _1073 = _1027 * (-2.0);
    float _1075 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1061);
    float _1077 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _983);
    if (_1045)
    {
        float _1079 = _1069 * _1033;
        _135 = _1079;
    }
    float _1081 = _135;
    float _1083 = _1009 * (-2.0);
    float _1085 = fma(_1073, _1017, _1017);
    float _1087 = fma(_693, _1073, _693);
    float _1089 = _185 + (-0.5);
    bool _1091 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1093 = isnan(_615);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = fma(_793, _1083, _793);
    float _1105 = fma(_1083, _1019, _1019);
    float _1107 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1085);
    float _1109 = _617 + (-0.5);
    bool _1111 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1113 = isnan(_615);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1119 = _1115 || _1117;
    float _1121 = float(_1119);
    float _1123 = -_1101;
    float _1125 = _1123 + 1.0;
    float _1127 = fma(_1087, _1081, _1107);
    float _1129 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1105);
    bool _1131 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1133 = isnan(_615);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _1121 * _1125;
    float _1145 = -_1121;
    float _1147 = _1145 + 1.0;
    float _1149 = _1127 * 0.15915493667125701904296875;
    float _1151 = _1013 * (-2.0);
    bool _1153 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1155 = isnan(_615);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1141 * _1147;
    float _1167 = -_1141;
    float _1169 = _1167 + 1.0;
    float _1171 = fma(_1103, _1081, _1129);
    float _1173 = fma(_745, _1151, _745);
    float _1175 = in.m_60.x;
    float _1177 = in.m_60.y;
    float _1179 = _1163 * _1169;
    float _1181 = fma(_1151, _1021, _1021);
    float _1183 = _627 + (-0.5);
    float _1185 = -_1163;
    float _1187 = _1185 + 1.0;
    float _1189 = _871 * _1179;
    float _1191 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1193;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1189);
    float _1199 = _853 * _1179;
    float _1201 = fma(_1173, _1081, _1191);
    float _1203 = fma(_1195, _741, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1205 = fma(_895, _1165, _1197);
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1207;
    float _1211 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1199);
    float _1213 = _1201 * 0.15915493667125701904296875;
    float _1215 = fma(_1203, _1143, _1205);
    float _1217 = fma(_1209, _741, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1219 = fma(_889, _1165, _1211);
    float _1221 = _1171 * 0.15915493667125701904296875;
    float _1223 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1215);
    float _1225 = _1213 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = fma(_1217, _1143, _1219);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _249);
    float _1233 = _1223 * _1177;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1245 = _1243 != 0;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1249 = _1247 != 0;
    float _1251 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1229);
    float _1253 = _587 * _1233;
    float _1255 = _1149 * 6.283185482025146484375;
    float _1257 = sin(_1255);
    float _1259 = _1251 * _1175;
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1263 = _587 * _1259;
    float _1265 = _1261 * _1231;
    float _1267 = _1149 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1275 = _1227 * _1265;
    float _1277 = _1273 * _1271;
    float _1279 = _581 * _181;
    float _1281 = _1221 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = fma(_579, _179, _1279);
    float _1287 = in.m_53.w;
    float _1289 = _1221 * 6.283185482025146484375;
    float _1291 = cos(_1289);
    float _1293 = _1269 * _1275;
    float _1295 = _1257 * _1275;
    float _1297 = _1213 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1257 * _1283;
    float _1303 = _1283 * _1227;
    float _1305 = _1269 * _1291;
    float _1307 = _1291 * _1227;
    float _1309 = _1269 * _1283;
    float _1311 = _1257 * _1291;
    float _1313 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1315 = fma(_1299, _1305, _1301);
    float _1317 = -_1265;
    float _1319 = _1299 * _1317;
    float _1321 = -_1311;
    float _1323 = fma(_1299, _1309, _1321);
    float _1325 = fma(_1299, _1301, _1305);
    float _1327 = fma(_1315, _1277, _1293);
    float _1329 = -_1309;
    float _1331 = fma(_1299, _1311, _1329);
    float _1333 = in.m_51.w;
    float _1335 = fma(_1307, _1277, _1319);
    float _1337 = fma(_1323, _1313, _1327);
    float _1339 = fma(_1331, _1277, _1295);
    float _1341 = _581 * _165;
    float _1343 = fma(_1303, _1313, _1335);
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1347 = fma(_1325, _1313, _1339);
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1351 = fma(_579, _163, _1341);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1345);
    float _1355 = fma(_583, _183, _1285);
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1349);
    float _1359 = fma(_583, _167, _1351);
    float _1361 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1353);
    float _1363 = _1355 + _1287;
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1357);
    float _1367 = in.m_49.w;
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1371 = _581 * _155;
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1375 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1377 = _1363 + _1369;
    float _1379 = fma(_579, _153, _1371);
    float _1381 = _1359 + _1333;
    float _1383 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1375);
    float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1387 = _1377 + _1385;
    bool _1389 = !_1241;
    int _1391 = _1389 ? 0 : 1;
    float _1393 = _1381 + _1373;
    float _1395 = fma(_583, _157, _1379);
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1383);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1403 = _1393 + _1401;
    bool _1405 = !_1237;
    int _1407 = _1405 ? 0 : 1;
    float _1409 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1411 = fma(_1403, _1403, _1397);
    bool _1413 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1415 = isnan(0.5);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1421 = _1417 || _1419;
    bool _1423 = !_1245;
    int _1425 = _1423 ? 0 : 1;
    float _1427 = sqrt(_1411);
    float _1429 = _1395 + _1367;
    bool _1431 = !_1249;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = _1429 + _1409;
    bool _1437 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1439 = _1411;
    float _1441 = _1343;
    float _1443 = _1427;
    float _1445 = _1403;
    float _1447 = _1387;
    float _1449 = _1367;
    if (!_1437)
    {
        _263 = _1393;
    }
    float _1451 = _263;
    float _1453 = _1451;
    if (!_1437)
    {
        _265 = _1377;
    }
    float _1455 = _265;
    float _1457 = _1455;
    if (!_1437)
    {
        _267 = _1435;
    }
    float _1459 = _267;
    bool _1461 = !_1437;
    float _1463 = _1459;
    if (!_1461)
    {
        float _1465 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1469 = _1427 + _1467;
        float _1471 = _1435 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1473 = rsqrt(_1411);
        float _1475 = _1469 * _1465;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = _1477 * 6.283185482025146484375;
        float _1481 = cos(_1479);
        float _1483 = _1477 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1481 + (-1.0);
        float _1489 = fma(_1485, _1471, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1493 = _1473 * _1489;
        float _1495 = fma(_1435, _1481, _1491);
        float _1497 = fma(_1403, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1499 = fma(_1387, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1453 = _1497;
        _1463 = _1495;
        _1457 = _1499;
        _1439 = _1473;
        _1441 = _1477;
        _1443 = _1487;
    }
    float _1501 = _1453;
    float _1503 = _1463;
    float _1505 = _1457;
    float _1507 = _1439;
    float _1509 = _1441;
    float _1511 = _1443;
    float _1513 = _1507;
    float _1515 = _1511;
    if (_1421)
    {
        _1445 = _1501;
    }
    float _1517 = _1445;
    float _1519 = _1517;
    if (_1421)
    {
        _1513 = _1503;
    }
    float _1521 = _1513;
    float _1523 = _1521;
    if (_1421)
    {
        _1447 = _1505;
    }
    float _1525 = _1447;
    float _1527 = _1525;
    if (!_1421)
    {
        float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1531 = _1429 + _1529;
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1535 = _1381 + _1533;
        float _1537 = -_1429;
        float _1539 = _1537 + _1503;
        float _1541 = -_1363;
        float _1543 = _1541 + _1505;
        float _1545 = _1531 * _1531;
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1549 = _1363 + _1547;
        float _1551 = fma(_1535, _1535, _1545);
        float _1553 = -_1381;
        float _1555 = _1553 + _1501;
        float _1557 = fma(_1549, _1549, _1551);
        float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1561 = sqrt(_1557);
        float _1563 = precise::min(_1561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1565 = _1563 * _1559;
        float _1567 = fma(_1555, _1565, _1381);
        float _1569 = fma(_1539, _1565, _1429);
        float _1571 = fma(_1543, _1565, _1363);
        _1523 = _1569;
        _1519 = _1567;
        _1527 = _1571;
        _1515 = _1561;
    }
    float _1573 = _1523;
    float _1575 = _1519;
    float _1577 = _1527;
    float _1579 = _1515;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1583 = _1573 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1587 = _1575 + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1591 = _1577 + _1589;
    float _1593 = _1583 * _1583;
    float _1595 = fma(_1587, _1587, _1593);
    float _1597 = fma(_1591, _1591, _1595);
    float _1599 = rsqrt(_1597);
    float _1601 = sqrt(_1597);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1605 = _1587 * _1603;
    float _1607 = _1591 * _1603;
    float _1609 = _1605 * _1605;
    float _1611 = _1607 * _1607;
    float _1613 = _1609 + _1611;
    float _1615 = sqrt(_1613);
    bool _1617 = _1615 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1621 = _1615 + _1619;
    float _1623 = _1501;
    float _1625 = _1613;
    float _1627 = _1621;
    float _1629 = _1605;
    float _1631 = _1607;
    float _1633 = _1611;
    if (_1617)
    {
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1623 = _1635;
    }
    float _1637 = _1623;
    if (_1617)
    {
        float _1639 = rsqrt(_1613);
        _1625 = _1639;
    }
    float _1641 = _1625;
    if (_1617)
    {
        float _1643 = _1621 * _1637;
        _1627 = _1643;
    }
    float _1645 = _1627;
    if (_1617)
    {
        float _1647 = _1645 * 0.15915493667125701904296875;
        _1449 = _1647;
    }
    float _1649 = _1449;
    float _1651 = _1509;
    if (_1617)
    {
        float _1653 = _1649 * 6.283185482025146484375;
        float _1655 = sin(_1653);
        _1651 = _1655;
    }
    float _1657 = _1651;
    float _1659 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1661 = precise::max(0.0, _1659);
    float _1663 = _1579;
    float _1665 = _1661;
    float _1667 = _1659;
    if (_1617)
    {
        float _1669 = _1649 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        _1663 = _1671;
    }
    float _1673 = _1663;
    float _1675 = -_1603;
    float _1677 = -_1661;
    float _1679 = fma(_1583, _1675, _1677);
    float _1681 = _1679;
    if (_1617)
    {
        float _1683 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1683;
    }
    float _1685 = _1665;
    float _1687 = _1685;
    float _1689 = _1657;
    if (_1617)
    {
        float _1691 = fma(_1657, _1685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1687 = _1691;
    }
    float _1693 = _1687;
    float _1695 = _1693;
    if (_1617)
    {
        float _1697 = _1673 + (-1.0);
        _1667 = _1697;
    }
    float _1699 = _1667;
    float _1701 = _1699;
    if (_1617)
    {
        float _1703 = _1641 * _1693;
        _1689 = _1703;
    }
    float _1705 = _1689;
    if (!_1617)
    {
        _1695 = _1609;
    }
    float _1707 = _1695;
    float _1709 = _1707;
    if (_1617)
    {
        float _1711 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1711;
    }
    float _1713 = _1701;
    if (_1617)
    {
        float _1715 = _1605 * _1705;
        _1629 = _1715;
    }
    float _1717 = _1629;
    if (_1617)
    {
        float _1719 = _1607 * _1705;
        _1631 = _1719;
    }
    float _1721 = _1631;
    if (_1617)
    {
        float _1723 = fma(_1679, _1673, _1713);
        _1681 = _1723;
    }
    float _1725 = _1681;
    if (_1617)
    {
        float _1727 = _1717 * _1717;
        _1709 = _1727;
    }
    float _1729 = _1709;
    if (_1617)
    {
        float _1731 = _1721 * _1721;
        _1633 = _1731;
    }
    float _1733 = _1633;
    float _1735 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1739 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1737);
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = fma(_1725, _1725, _1729);
    float _1745 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1747 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1749 = -_1741;
    float _1751 = _1749 + 1.0;
    float _1753 = _1743 + _1733;
    float _1755 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1757 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1759 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1761 = abs(_1751);
    float _1763 = log2(_1761);
    float _1765 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1755);
    float _1767 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1759);
    float _1771 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1773 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1775 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1777 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1769);
    float _1779 = rsqrt(_1753);
    float _1781 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1783 = -_1775;
    float _1785 = fma(_1783, _1745, 1.0);
    float _1787 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1789 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1771);
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1793 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1789);
    float _1795 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1791);
    float _1797 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1799 = log2(_1785);
    float _1801 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1803 = _1779 * _1717;
    float _1805 = _1779 * _1725;
    float _1807 = _1779 * _1721;
    float _1809 = exp2(_1797);
    float _1811 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1813 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1795);
    float _1815 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1817 = -_1811;
    float _1819 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1817);
    float _1821 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1815);
    float _1825 = -_1807;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1819);
    float _1829 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1831 = 1.0 / _1821;
    float _1833 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1835 = fma(_1827, -0.5, 0.5);
    float _1837 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1829);
    float _1839 = fma(_1827, 0.5, 0.5);
    float _1841 = _1805 + 1.0;
    float _1843 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1837);
    float _1845 = sqrt(_1835);
    float _1847 = fma(_1839, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1849 = -_1805;
    float _1851 = fma(_1809, _1841, _1849);
    float _1853 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1843);
    float _1855 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1833);
    float _1857 = fma(_1839, _1847, -0.212114393711090087890625);
    float _1859 = _1799 * 0.693147182464599609375;
    float _1861 = _1853 * _1831;
    float _1863 = fma(_1839, _1857, 1.570728778839111328125);
    float _1865 = _1855 * _1831;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = fma(_1861, 0.5, 0.5);
    float _1871 = fma(_1851, 0.5, 0.5);
    float _1873 = fma(_1865, -0.5, 0.5);
    float _1875 = _1845 * 0.636619746685028076171875;
    float _1877 = -_1863;
    float _1879 = fma(_1875, _1877, 1.0);
    float3 _5813 = float3(_1869, _1873, _1867);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5813, float3(0.0), isnan(_5813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5813, float3(0.0), isnan(_5813)), level(0.0)).x;
    float3 _5824 = float3(_1869, _1873, _1867);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5824, float3(0.0), isnan(_5824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5824, float3(0.0), isnan(_5824)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float2 _5841 = float2(_1879, _1871);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5841, float2(0.0), isnan(_5841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5841, float2(0.0), isnan(_5841)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1906 = int(_1904);
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1910 = _1908 != 0;
    out.m_45.x = 1.0;
    int _1912 = abs(_753);
    float _1914 = _797 + 0.5;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1918 = _1916 != 0;
    float _1920 = -_801;
    float _1922 = _1920 + 0.5;
    int _1924 = abs(_763);
    float _1926 = trunc(_979);
    int _1928 = int(_1926);
    int _1930 = abs(_1391);
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1934 = abs(_1407);
    float _1936 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1938 = abs(_1425);
    float _1940 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1942 = abs(_1433);
    float _1944 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1946 = int(_1944);
    float _1948 = float(uint(_1906));
    float _1950 = -_1065;
    float _1952 = _1950 + 1.0;
    int _1954 = ~_1906;
    int _1956 = _1954 + 1;
    int _1958 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1960 = _1958 != 0;
    bool _1962 = _627 > 0.5;
    float _1964 = 1.0 / _1948;
    float _1966 = float(uint(_1928));
    float _1968 = float(uint(_1946));
    float _1970 = trunc(_1063);
    int _1972 = int(_1970);
    int _1974 = ~_1906;
    int _1976 = _1974 + 1;
    int _1978 = ~_1946;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>(_1964) + (-2);
    float _1984 = 1.0 / _1968;
    float _1986 = as_type<float>(_1982) * _1966;
    float _1988 = trunc(_1986);
    float _1990 = precise::max(_1988, 0.0);
    uint _1993 = uint(_1990);
    int _1995 = as_type<int>(_1984) + (-2);
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1999 = _1986;
    float _2001 = _1984;
    if (_827)
    {
        _1999 = 1.0;
    }
    float _2003 = _1999;
    float _2005 = _2003;
    if (!_827)
    {
        _2005 = 7.345489978790283203125;
    }
    float _2007 = _2005;
    if (_827)
    {
        _2001 = 1.0;
    }
    float _2009 = _2001;
    int _2011 = _1976 * int(_1993);
    int _2013 = _2011 + _1928;
    float _2015 = _2007 * _185;
    float _2017 = _2009;
    if (!_827)
    {
        _2017 = 1.2345600128173828125;
    }
    float _2019 = _2017;
    float _2021 = exp2(_1940);
    float _2023 = float(uint(_2013));
    float _2025 = _1932 * _1997;
    float _2027 = as_type<float>(_1982) * _2023;
    float _2029 = float(uint(_1972));
    float _2031 = floor(_2015);
    float _2033 = as_type<float>(_1995) * _2029;
    float _2035 = _2029;
    if (_827)
    {
        _2035 = _185;
    }
    float _2037 = _2035;
    float _2039 = _2037;
    if (!_827)
    {
        _2039 = _617;
    }
    float _2041 = _2039;
    float _2043 = trunc(_2027);
    float _2045 = precise::max(_2043, 0.0);
    uint _2047 = uint(_2045);
    bool _2049 = _617 > 0.5;
    float _2051 = -_2021;
    float _2053 = _2051 + 1.0;
    float _2055 = _2019 * _2041;
    float _2057 = float(_1928);
    float _2059 = trunc(_2033);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = int(_1993) + int(_2047);
    float _2067 = floor(_2055);
    float _2069 = float(_1906);
    int _2071 = _1956 * _2065;
    int _2073 = _2071 + _1928;
    bool _2075 = _2057 >= _2069;
    bool _2077 = isnan(_2057);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(_2069);
    bool _2083 = _2079 || _2081;
    float _2085 = float(_2083);
    int _2087 = _1980 * int(_2063);
    int _2089 = _2087 + _1972;
    bool _2091 = uint(_2073) >= uint(_1906);
    float _2093 = trunc(_2085);
    int _2095 = int(_2093);
    float _2097 = float(uint(_2089));
    bool _2099 = !_2091;
    int _2101 = _2099 ? 0 : (-1);
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2105 = _2103 != 0;
    float _2107 = as_type<float>(_1995) * _2097;
    float _2109 = -_2031;
    float _2111 = _2015 + _2109;
    float _2113 = -_2067;
    float _2115 = _2055 + _2113;
    float _2117 = float(_1946);
    float _2119 = trunc(_2107);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = _2111 * _2069;
    int _2127 = ~_2065;
    int _2129 = _2127 + _2101;
    int _2131 = _2129 + 1;
    float _2133 = _2069 * _991;
    float _2135 = float(_1972);
    float _2137 = _2117 * _991;
    bool _2139 = !_1910;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = _2115 * _2117;
    float _2145 = trunc(_2125);
    int _2147 = int(_2145);
    bool _2149 = _2135 >= _2117;
    bool _2151 = isnan(_2135);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(_2117);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    int _2161 = _1906 * _2131;
    int _2163 = _2161 + _1928;
    bool _2165 = _1906 == 0;
    int _2167 = abs(_2141);
    int _2169 = ~_1946;
    int _2171 = _2169 + 1;
    float _2173 = trunc(_2133);
    int _2175 = int(_2173);
    int _2177 = ~_2095;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    bool _2183 = !_2165;
    int _2185 = _2183 ? _2163 : (-1);
    int _2187 = int(_2063) + int(_2123);
    int _2189 = _2147 * _2167;
    int _2191 = _2189 + _1928;
    int _2193 = _1906 + (-1);
    int _2195 = _2185 * _2181;
    float _2197 = trunc(_2143);
    int _2199 = int(_2197);
    int _2201 = _2171 * _2187;
    int _2203 = _2201 + _1972;
    int _2205 = _2095 * _2193;
    int _2207 = _2205 + _2195;
    bool _2209 = !_1918;
    int _2211 = _2209 ? 0 : 1;
    bool _2213 = uint(_2203) >= uint(_1946);
    int _2215 = _2207 * _1912;
    float _2217 = trunc(_2159);
    int _2219 = int(_2217);
    int _2221 = abs(_2211);
    bool _2223 = !_2213;
    int _2225 = _2223 ? 0 : (-1);
    int _2227 = _2175 * _1924;
    int _2229 = _2227 + _2215;
    int _2231 = abs(_791);
    bool _2233 = !_2105;
    int _2235 = _2233 ? 0 : 1;
    float _2237 = trunc(_2137);
    int _2239 = int(_2237);
    int _2241 = ~_2187;
    int _2243 = _2241 + _2225;
    int _2245 = _2243 + 1;
    int _2247 = abs(_2235);
    int _2249 = _1946 * _2245;
    int _2251 = _2249 + _1972;
    bool _2253 = _1946 == 0;
    int _2255 = _2199 * _2221;
    int _2257 = _2255 + _1972;
    int _2259 = ~_2219;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    int _2265 = _2191 * _2231;
    int _2267 = _2265 + _2229;
    bool _2269 = !_2253;
    int _2271 = _2269 ? _2251 : (-1);
    int _2273 = _1946 + (-1);
    int _2275 = _2147 * _2247;
    int _2277 = _2275 + _2267;
    int _2279 = _2271 * _2263;
    float _2281 = float(uint(_2277));
    int _2283 = _2219 * _2273;
    int _2285 = _2283 + _2279;
    float _2287 = as_type<float>(_1982) * _2281;
    int _2289 = _2285 * _1930;
    float _2291 = trunc(_2287);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2239 * _1934;
    int _2299 = _2297 + _2289;
    int _2301 = ~_1906;
    int _2303 = _2301 + 1;
    int _2305 = _2257 * _1938;
    int _2307 = _2305 + _2299;
    int _2309 = ~_1906;
    int _2311 = _2309 + 1;
    int _2313 = _2199 * _1942;
    int _2315 = _2313 + _2307;
    int _2317 = ~_1946;
    int _2319 = _2317 + 1;
    float _2321 = float(uint(_2315));
    int _2323 = _2303 * int(_2295);
    int _2325 = _2323 + _2277;
    float _2327 = as_type<float>(_1995) * _2321;
    float _2329 = float(uint(_2325));
    float _2331 = trunc(_2327);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    float _2337 = as_type<float>(_1982) * _2329;
    float _2339 = trunc(_2337);
    float _2341 = precise::max(_2339, 0.0);
    uint _2343 = uint(_2341);
    int _2345 = _2319 * int(_2335);
    int _2347 = _2345 + _2315;
    float _2349 = float(uint(_2191));
    float _2351 = float(uint(_2347));
    float _2353 = as_type<float>(_1982) * _2349;
    float _2355 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _2357 = int(_2295) + int(_2343);
    float _2359 = as_type<float>(_1995) * _2351;
    float _2361 = trunc(_2353);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    float _2367 = _2355 * _185;
    int _2369 = ~_1946;
    int _2371 = _2369 + 1;
    int _2373 = _2311 * _2357;
    int _2375 = _2373 + _2277;
    float _2377 = trunc(_2359);
    float _2379 = precise::max(_2377, 0.0);
    uint _2381 = uint(_2379);
    bool _2383 = uint(_2375) >= uint(_1906);
    bool _2385 = !_2383;
    int _2387 = _2385 ? 0 : (-1);
    float _2389 = trunc(_2367);
    int _2391 = int(_2389);
    int _2393 = ~_2357;
    int _2395 = _2393 + _2387;
    int _2397 = _2395 + 1;
    int _2399 = ~_1946;
    int _2401 = _2399 + 1;
    float _2403 = in.m_55.w;
    int _2405 = _1906 * _2397;
    int _2407 = _2405 + _2277;
    int _2409 = ~_1906;
    int _2411 = _2409 + 1;
    int _2413 = int(_2335) + int(_2381);
    bool _2415 = !_2165;
    int _2417 = _2415 ? _2407 : (-1);
    int _2419 = _2411 * int(_2365);
    int _2421 = _2419 + _2191;
    int _2423 = _2401 * _2413;
    int _2425 = _2423 + _2315;
    float _2427 = float(uint(_2257));
    int _2429 = _2417 & 3;
    bool _2431 = _2429 != 0;
    int _2433 = _2391 << 4;
    int _2435 = _2433 + 1712;
    float _2437 = as_type<float>(_1995) * _2427;
    float _2439 = float(uint(_2421));
    int _2441 = _2431 ? 0 : 1;
    bool _2443 = _185 > 0.5;
    float _2445 = as_type<float>(_1982) * _2439;
    float _2447 = trunc(_2437);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    float _2453 = -_249;
    int _2455 = _2049 ? as_type<int>(_2453) : as_type<int>(_249);
    uint _2457 = uint(int(uint(_2435) >> uint(2)));
    uint _2459 = uint(int(uint(int(_2457)) >> uint(2)));
    int _2461 = int(_2457) & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    int _2465 = int(_2457) + 1;
    uint _2467 = uint(int(uint(_2465) >> uint(2)));
    int _2469 = _2465 & 3;
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[int(_2467)][_2469];
    float _2473 = -_245;
    int _2475 = _2443 ? as_type<int>(_2473) : as_type<int>(_245);
    bool _2477 = uint(_2425) >= uint(_1946);
    bool _2479 = !_1960;
    float _2481 = _2479 ? _245 : as_type<float>(_2475);
    float _2483 = trunc(_2445);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2477;
    int _2495 = _2493 ? 0 : (-1);
    bool _2497 = !_2491;
    float _2499 = _2497 ? _249 : as_type<float>(_2455);
    int _2501 = _2435 + 8;
    uint _2503 = uint(int(uint(_2501) >> uint(2)));
    uint _2505 = uint(int(uint(int(_2503)) >> uint(2)));
    int _2507 = int(_2503) & 3;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[int(_2505)][_2507];
    int _2511 = _2371 * int(_2451);
    int _2513 = _2511 + _2257;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2517 = _2515 != 0;
    bool _2519 = _2403 > 0.5;
    float _2521 = float(uint(_2513));
    float _2523 = -_245;
    int _2525 = _1962 ? as_type<int>(_2523) : as_type<int>(_245);
    float _2527 = as_type<float>(_1995) * _2521;
    float _2529 = _2499 + (-0.5);
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2533 = !_2517;
    float _2535 = _2533 ? _245 : as_type<float>(_2525);
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2539 = _2417 & 3;
    bool _2541 = _2539 != 0;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2545 = -_249;
    int _2547 = _2519 ? as_type<int>(_2545) : as_type<int>(_249);
    float _2549 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2551 = uint(_2539) > 1u;
    float _2553 = _2537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2555 = ~_2413;
    int _2557 = _2555 + _2495;
    int _2559 = _2557 + 1;
    float _2561 = _2543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2563 = int(_2365) + int(_2487);
    float _2565 = trunc(_2527);
    float _2567 = precise::max(_2565, 0.0);
    uint _2569 = uint(_2567);
    int _2571 = ~_1906;
    int _2573 = _2571 + 1;
    int _2575 = _1946 * _2559;
    int _2577 = _2575 + _2315;
    out.m_64.x = _2549;
    out.m_64.y = _2553;
    out.m_64.z = _2561;
    int _2579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2581 = _2579 != 0;
    int _2583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2585 = _2583 != 0;
    bool _2587 = !_2253;
    int _2589 = _2587 ? _2577 : (-1);
    float _2591 = -_2529;
    float _2593 = -_1067;
    float _2595 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2593);
    int _2597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2599 = _2597 != 0;
    float _2601 = _2481 + 0.5;
    bool _2603 = !_2581;
    float _2605 = _2603 ? _249 : as_type<float>(_2547);
    float _2607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2609 = _2573 * _2563;
    int _2611 = _2609 + _2191;
    int _2613 = _2417 >> 31;
    float _2615 = fma(_2601, (*spvDescriptorSet0.vp_c9)._m0[80].x, _665);
    int _2617 = ~_2441;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = _2621;
    if (!_2551)
    {
        int _2625 = ~_2441;
        int _2627 = _2625 + 1;
        _2623 = _2627;
    }
    int _2629 = _2623;
    int _2631 = _2613 & 3;
    float _2633 = _2463 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2635 = uint(_2611) >= uint(_1906);
    int _2637 = _2589 >> 31;
    float _2639 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2641 = _2417 + _2631;
    float _2643 = _2471 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2645 = _2637 & 3;
    float _2647 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2649 = _2641 >> 2;
    float _2651 = _2643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2653 = _2589 + _2645;
    float _2655 = _2647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2657 = _2653 >> 2;
    int _2659 = _2649 << 4;
    int _2661 = _2659 + 368;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2665 = _2657 << 4;
    int _2667 = _2665 + 512;
    bool _2669 = !_2635;
    int _2671 = _2669 ? 0 : (-1);
    uint _2673 = uint(int(uint(_2661) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    bool _2689 = uint(_2539) >= 2u;
    out.m_66.x = _2639;
    out.m_66.y = _2651;
    out.m_66.z = _2655;
    out.m_66.w = _2663;
    int _2691 = int(_2451) + int(_2569);
    float _2693 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2695 = _2689 ? 0 : 1;
    bool _2697 = _2539 != 3;
    uint _2699 = uint(int(uint(_2667) >> uint(2)));
    uint _2701 = uint(int(uint(int(_2699)) >> uint(2)));
    int _2703 = int(_2699) & 3;
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[int(_2701)][_2703];
    int _2707 = int(_2699) + 1;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    int _2711 = _2707 & 3;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[int(_2709)][_2711];
    int _2715 = ~_1946;
    int _2717 = _2715 + 1;
    float _2719 = _2693 * _2607;
    float _2721 = _2535 + 0.5;
    int _2723 = ~_2695;
    int _2725 = _2723 + 1;
    int _2727 = _2725 + 1;
    int _2729 = _2717 * _2691;
    int _2731 = _2729 + _2257;
    float _2733 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1005);
    int _2735 = _2661 + 8;
    uint _2737 = uint(int(uint(_2735) >> uint(2)));
    uint _2739 = uint(int(uint(int(_2737)) >> uint(2)));
    int _2741 = int(_2737) & 3;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[int(_2739)][_2741];
    int _2745 = int(_2737) + 1;
    uint _2747 = uint(int(uint(_2745) >> uint(2)));
    int _2749 = _2745 & 3;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[int(_2747)][_2749];
    int _2753 = ~_2563;
    int _2755 = _2753 + _2671;
    int _2757 = _2755 + 1;
    out.m_68.x = _2025;
    out.m_68.y = _2719;
    bool _2759 = uint(_2731) >= uint(_1946);
    int _2761 = _2727;
    if (_2697)
    {
        int _2763 = ~_2695;
        int _2765 = _2763 + 1;
        _2761 = _2765;
    }
    int _2767 = _2761;
    float _2769 = _2605 + (-0.5);
    int _2771 = _2589 & 3;
    bool _2773 = _2771 != 0;
    int _2775 = _2667 + 8;
    uint _2777 = uint(int(uint(_2775) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    bool _2793 = !_2759;
    int _2795 = _2793 ? 0 : (-1);
    int _2797 = _1906 * _2757;
    int _2799 = _2797 + _2191;
    bool _2801 = uint(_2771) > 1u;
    float _2803 = -_2769;
    float _2805 = -_1077;
    float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2805);
    bool _2809 = !_2541;
    int _2811 = _2809 ? 0 : 1;
    int _2813 = _2589 & 3;
    bool _2815 = _2813 != 0;
    int _2817 = ~_2691;
    int _2819 = _2817 + _2795;
    int _2821 = _2819 + 1;
    int _2823 = _2815 ? 0 : 1;
    bool _2825 = !_2773;
    int _2827 = _2825 ? 0 : 1;
    int _2829 = _1946 * _2821;
    int _2831 = _2829 + _2257;
    int _2833 = ~_2823;
    int _2835 = _2833 + 1;
    int _2837 = _2835 + 1;
    int _2839 = _2837;
    if (!_2801)
    {
        int _2841 = ~_2823;
        int _2843 = _2841 + 1;
        _2839 = _2843;
    }
    int _2845 = _2839;
    bool _2847 = _2539 != 3;
    int _2849 = abs(_2629);
    float _2851 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1936);
    int _2853 = abs(_2845);
    int _2855 = abs(_2811);
    float _2857 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2851);
    int _2859 = abs(_2827);
    int _2861 = ~_2849;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    float _2867 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2857);
    bool _2869 = _2771 != 3;
    int _2871 = _2865 * as_type<int>(_2687);
    int _2873 = ~_2853;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    out.gl_Position.x = _1853;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _2867;
    out.gl_Position.w = _1821;
    int _2879 = ~_2855;
    int _2881 = _2879 + 1;
    int _2883 = _2881 + 1;
    bool _2885 = uint(_2771) >= 2u;
    int _2887 = _2877 * as_type<int>(_2713);
    int _2889 = ~_2859;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    int _2895 = _2883 * as_type<int>(_2679);
    int _2897 = _2895 + _2871;
    int _2899 = _2885 ? 0 : 1;
    bool _2901 = _2771 != 3;
    int _2903 = _2893 * as_type<int>(_2705);
    int _2905 = _2903 + _2887;
    int _2907 = abs(_2767);
    bool _2909 = !_2847;
    int _2911 = _2909 ? 0 : (-1);
    int _2913 = ~_2899;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    int _2919 = _2917;
    if (_2869)
    {
        int _2921 = ~_2899;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    bool _2927 = !_2901;
    int _2929 = _2927 ? 0 : (-1);
    int _2931 = abs(_2911);
    int _2933 = ~_2907;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2925);
    int _2941 = abs(_2929);
    int _2943 = _2937 * as_type<int>(_2743);
    int _2945 = _2943 + _2897;
    int _2947 = ~_2939;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    bool _2953 = !_2585;
    int _2955 = _2953 ? 0 : 1;
    int _2957 = _2951 * as_type<int>(_2783);
    int _2959 = _2957 + _2905;
    int _2961 = ~_2931;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = abs(_2955);
    int _2969 = ~_2941;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = _2965 * as_type<int>(_2751);
    int _2977 = _2975 + _2945;
    bool _2979 = !_2599;
    int _2981 = _2979 ? 0 : 1;
    float _2983 = -_1075;
    float _2985 = _2983 + 1.0;
    int _2987 = ~_2967;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    int _2993 = _2973 * as_type<int>(_2791);
    int _2995 = _2993 + _2959;
    int _2997 = abs(_2981);
    float _2999 = -_995;
    float _3001 = _2999 + 1.0;
    float _3003 = -_1071;
    float _3005 = _3003 + 1.0;
    int _3007 = _2977 * _2991;
    float _3009 = -_1952;
    float _3011 = fma(_2481, _3009, _2615);
    float _3013 = fma(_2499, _2985, _2595);
    float _3015 = -_3001;
    float _3017 = fma(_2535, _3015, _2733);
    float _3019 = fma(_2605, _3005, _2807);
    bool _3021 = !_2165;
    int _3023 = _3021 ? _2799 : (-1);
    int _3025 = ~_2997;
    int _3027 = _3025 + 1;
    int _3029 = _3027 + 1;
    out.m_70.x = _3011;
    out.m_70.y = _3013;
    out.m_70.z = _3017;
    out.m_70.w = _3019;
    int _3031 = _3023 * _2967;
    int _3033 = _3031 + _3007;
    float _3035 = _2867 + _1821;
    bool _3037 = !_2253;
    int _3039 = _3037 ? _2831 : (-1);
    int _3041 = _2995 * _3029;
    float _3043 = _3035 * 0.5;
    int _3045 = _3039 * _2997;
    int _3047 = _3045 + _3041;
    float _3049 = float(_3033);
    out.m_72.z = _3043;
    out.m_72.w = _1821;
    float _3051 = float(_3047);
    float _3053 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3055 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3057 = _3053 * _1881;
    float _3059 = -_3053;
    float _3061 = _3059 + 1.0;
    out.m_74.x = _3049;
    out.m_74.y = _3051;
    float _3063 = _1892 * _3057;
    float _3065 = _1902 * _3057;
    float _3067 = _1892 * _3061;
    out.m_76.w = _3055;
    float _3069 = fma(_1898, _3063, _1886);
    float _3071 = fma(_1900, _3063, _1888);
    float _3073 = fma(_1892, _3065, _1890);
    out.m_78.x = _3069;
    out.m_78.y = _3071;
    out.m_78.z = _3073;
    out.m_78.w = _3067;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

