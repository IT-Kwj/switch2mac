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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2037 = false;
    bool _1170 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2402 = as_type<float>(_129);
        out.gl_Position.z = _2402;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2472 = as_type<float>(_167);
        out.gl_Position.z = _2472;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = _169 * _169;
    float _189 = _171 * _171;
    float _191 = _173 * _173;
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _189);
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = sqrt(_199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _205 > 0.0;
    bool _213 = _207 > 0.0;
    float _215 = _207;
    float _217 = _205;
    float _219 = _199;
    if (_211)
    {
        float _221 = rsqrt(_199);
        _215 = _221;
    }
    float _223 = _215;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _225 = _217;
    bool _227 = _209 > 0.0;
    float _229 = _209;
    float _231 = _225;
    if (!_211)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (_213)
    {
        float _245 = rsqrt(_201);
        _241 = _245;
    }
    float _247 = _241;
    float _249 = 0.0;
    if (!_213)
    {
        _249 = 0.0;
    }
    float _251 = _249;
    float _253 = 0.0;
    float _255 = _251;
    if (!_213)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_213)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_203);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = _223;
    if (_211)
    {
        float _275 = _223 * _169;
        _237 = _275;
    }
    float _277 = _237;
    if (_211)
    {
        float _279 = _223 * _175;
        _231 = _279;
    }
    float _281 = _231;
    if (_211)
    {
        float _283 = _223 * _181;
        _243 = _283;
    }
    float _285 = _243;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_227)
    {
        _273 = 0.0;
    }
    float _289 = _273;
    float _291 = 0.0;
    float _293 = _289;
    if (!_227)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = _295;
    if (_213)
    {
        float _299 = _247 * _171;
        _255 = _299;
    }
    float _301 = _255;
    if (!_227)
    {
        _219 = 0.0;
    }
    float _303 = _219;
    float _305 = _303;
    if (_213)
    {
        float _307 = _247 * _177;
        _261 = _307;
    }
    float _309 = _261;
    if (_213)
    {
        float _311 = _247 * _183;
        _267 = _311;
    }
    float _313 = _267;
    if (_227)
    {
        float _315 = _271 * _173;
        _293 = _315;
    }
    float _317 = _293;
    float _319 = _317;
    if (_227)
    {
        float _321 = _271 * _179;
        _297 = _321;
    }
    float _323 = _297;
    if (_227)
    {
        float _325 = _271 * _185;
        _305 = _325;
    }
    float _327 = _305;
    bool _329 = !_287;
    float _331 = _327;
    float _349;
    if (!_329)
    {
        float _333 = in.m_61.x;
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _363 = log2(_361);
    float _365 = in.m_61.z;
    float _367 = in.m_61.x;
    bool _369 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(1.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _381 = 1.0 + _379;
    bool _383 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _391 = _387 || _389;
    float _393 = as_type<float>(int(gl_VertexIndex));
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = in.m_61.y;
    float _401 = 1.0 / _381;
    float _403 = _363 * _147;
    float _405 = in.m_59.w;
    float _407 = in.m_48.x;
    float _409 = in.m_48.y;
    float _411 = in.m_48.z;
    float _413 = exp2(_403);
    float _415 = _365 * 2.0;
    float _417 = 1.0 / _397;
    float _419 = _399 * 2.0;
    float _421 = floor(_415);
    float _423 = -_413;
    float _425 = _423 + 1.0;
    float _427 = _367 * 2.0;
    float _429 = _367 + _365;
    float _431 = _391 ? _425 : 0.0;
    float _433 = _177 * _409;
    float _435 = floor(_427);
    int _437 = as_type<int>(_393) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>(_393) & 2;
    bool _443 = _441 != 0;
    float _445 = _429 + (-1.0);
    float _447 = fma(_175, _407, _433);
    float _449 = _399 + _365;
    if (_377)
    {
        float _451 = _431 * _401;
        _149 = _451;
    }
    float _453 = _149;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _465 = _463 != 0;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _469 = _359 + _467;
    bool _471 = _421 > 0.0;
    float _473 = _449 + (-1.0);
    bool _475 = _421 >= 0.0;
    bool _477 = isnan(_421);
    bool _479 = _475 || _477;
    bool _481 = isnan(0.0);
    bool _483 = _479 || _481;
    float _485 = floor(_419);
    float _487 = _469 * _417;
    float _489 = _367 + _399;
    int _491 = _483 ? 0 : 1;
    float _493 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _495 = _435 > 0.0;
    float _497 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _499 = !_457;
    int _501 = _499 ? 0 : 1;
    float _503 = _489 + (-1.0);
    bool _505 = _435 >= 0.0;
    bool _507 = isnan(_435);
    bool _509 = _505 || _507;
    bool _511 = isnan(0.0);
    bool _513 = _509 || _511;
    float _515 = _365 + (-0.5);
    float _517 = in.m_66.x;
    float _519 = in.m_66.y;
    float _521 = in.m_66.z;
    int _523 = abs(_501);
    float _525 = _183 * _409;
    int _527 = ~_491;
    int _529 = _527 + 1;
    int _531 = _529 + 1;
    float _533 = fma(_179, _411, _447);
    int _535 = _531;
    if (!_471)
    {
        int _537 = ~_491;
        int _539 = _537 + 1;
        _535 = _539;
    }
    int _541 = _535;
    bool _543 = _485 > 0.0;
    float _545 = float(_523);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _549 = float(_541);
    int _551 = _513 ? 0 : 1;
    bool _553 = _485 >= 0.0;
    bool _555 = isnan(_485);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = _545 * _549;
    bool _565 = !_465;
    int _567 = _565 ? 0 : 1;
    int _569 = _561 ? 0 : 1;
    int _571 = ~_551;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    int _577 = abs(_567);
    int _579 = _575;
    if (!_495)
    {
        int _581 = ~_551;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = _563 * (-2.0);
    int _589 = ~_569;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = _367 + (-0.5);
    int _597 = _593;
    if (!_543)
    {
        int _599 = ~_569;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    float _605 = fma(_587, _517, _517);
    float _607 = fma(_547, _587, _547);
    float _609 = float(_577);
    float _611 = float(_603);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _605);
    bool _615 = !_461;
    int _617 = _615 ? 0 : 1;
    float _619 = _609 * _611;
    float _621 = fma(_607, _453, _613);
    int _623 = abs(_617);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = float(_585);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _631;
    float _635 = _619 * (-2.0);
    float _637 = float(_623);
    float _639 = _621 * 0.15915493667125701904296875;
    float _641 = fma(_627, _487, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _643 = fma(_635, _521, _521);
    float _645 = fma(_497, _635, _497);
    float _647 = _637 * _629;
    float _649 = fma(_633, _487, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _651 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[196].z, _643);
    float _653 = _399 + (-0.5);
    float _655 = _647 * (-2.0);
    bool _657 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _659 = isnan(_359);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = fma(_645, _453, _651);
    bool _671 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_359);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = in.m_68.x;
    float _685 = in.m_68.y;
    float _687 = fma(_655, _519, _519);
    float _689 = fma(_493, _655, _493);
    float _691 = _669 * 0.15915493667125701904296875;
    float _693 = -_681;
    float _695 = _693 + 1.0;
    float _697 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _687);
    float _699 = _639 * 6.283185482025146484375;
    float _701 = sin(_699);
    float _703 = in.m_57.w;
    float _705 = _667 * _695;
    float _707 = -_667;
    float _709 = _707 + 1.0;
    float _711 = fma(_689, _453, _697);
    float _713 = _641 * _705;
    float _715 = _649 * _705;
    float _717 = _711 * 0.15915493667125701904296875;
    float _719 = _639 * 6.283185482025146484375;
    float _721 = cos(_719);
    float _723 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].x, _713);
    float _725 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].y, _715);
    bool _727 = !_443;
    float _729 = _727 ? (-0.5) : 0.5;
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].x, _723);
    float _733 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].y, _725);
    bool _735 = !_439;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = _691 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = _731 * _683;
    float _745 = _733 * _685;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _729);
    float _749 = fma(_181, _407, _525);
    float _751 = _743 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _755 = _367 > 0.5;
    float _757 = _691 * 6.283185482025146484375;
    float _759 = cos(_757);
    float _761 = fma(_185, _411, _749);
    float _763 = _753 * _747;
    float _765 = _533 + _703;
    bool _767 = _399 > 0.5;
    float _769 = _761 + _405;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = _729 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _777 = _717 * 6.283185482025146484375;
    float _779 = cos(_777);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _783 = _701 * _741;
    float _785 = _721 * _741;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = _751 * _781;
    float _793 = -_729;
    int _795 = _767 ? as_type<int>(_793) : as_type<int>(_729);
    float _797 = _717 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = _721 * _759;
    float _803 = _701 * _759;
    bool _805 = !_789;
    float _807 = _805 ? _729 : as_type<float>(_795);
    float _809 = _779 * _741;
    float _811 = _779 * _759;
    float _813 = _701 * _779;
    float _815 = _721 * _779;
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = _813 * _775;
    float _821 = fma(_799, _783, _801);
    float _823 = fma(_799, _801, _783);
    float _825 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _827 = -_785;
    float _829 = fma(_799, _803, _827);
    float _831 = _821 * _763;
    float _833 = -_803;
    float _835 = fma(_799, _785, _833);
    float _837 = _825 * _367;
    float _839 = _829 * _763;
    float _841 = fma(_809, _791, _831);
    float _843 = _813 * _763;
    float _845 = in.m_70.y;
    float _847 = fma(_811, _791, _839);
    float _849 = trunc(_837);
    int _851 = int(_849);
    float _853 = fma(_835, _817, _841);
    float _855 = -_799;
    float _857 = fma(_855, _791, _843);
    float _859 = fma(_823, _817, _847);
    float _861 = -_737;
    int _863 = _755 ? as_type<int>(_861) : as_type<int>(_737);
    float _865 = _853 * _309;
    float _867 = _853 * _313;
    float _869 = fma(_815, _817, _857);
    float _871 = _829 * _775;
    float _873 = fma(_859, _281, _865);
    float _875 = fma(_859, _285, _867);
    float _877 = _853 * _301;
    float _879 = _821 * _775;
    float _881 = fma(_869, _323, _873);
    float _883 = fma(_869, _327, _875);
    float _885 = fma(_859, _277, _877);
    int _887 = _851 << 4;
    int _889 = _887 + 1712;
    float _891 = _765 + _881;
    float _893 = _769 + _883;
    float _895 = fma(_869, _317, _885);
    int _897 = _889 + 8;
    uint _900 = uint(int(uint(_897) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[int(_902)][_904];
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _910 = _891 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _914 = _893 + _912;
    float _916 = _409 + _845;
    bool _918 = !_773;
    float _920 = _918 ? _737 : as_type<float>(_863);
    float _922 = _910 * _910;
    float _924 = _914 * _914;
    float _926 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _928 = uint(int(uint(_889) >> uint(2)));
    uint _930 = uint(int(uint(int(_928)) >> uint(2)));
    int _932 = int(_928) & 3;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[int(_930)][_932];
    int _936 = int(_928) + 1;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    int _940 = _936 & 3;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[int(_938)][_940];
    float _944 = _916 + _895;
    float _946 = _922 + _924;
    float _948 = fma(_809, _926, _879);
    float _950 = -_799;
    float _952 = fma(_950, _926, _819);
    float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _956 = fma(_811, _926, _871);
    float _958 = _835 + _948;
    float _960 = _815 + _952;
    float _962 = _823 + _956;
    float _964 = sqrt(_946);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = _879;
    float _970 = _922;
    float _972 = _924;
    float _974 = _893;
    float _976 = _891;
    float _978 = _835;
    float _980 = _910;
    if (!_966)
    {
        _968 = _944;
    }
    float _982 = _968;
    bool _984 = !_966;
    float _986 = _982;
    if (!_984)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _964 + _990;
        float _994 = rsqrt(_946);
        float _996 = _992 * _988;
        float _998 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _994 * _1010;
        float _1014 = fma(_910, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = _1008 + (-1.0);
        float _1018 = fma(_914, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1022 = _1014 + _1020;
        float _1024 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1028 = _1018 + _1026;
        float _1030 = _1022 * _1022;
        float _1032 = fma(_944, _1008, _1024);
        float _1034 = _1028 * _1028;
        _986 = _1032;
        _970 = _1030;
        _972 = _1034;
        _974 = _1018;
        _976 = _1014;
        _978 = _1000;
    }
    float _1036 = _986;
    float _1038 = _970;
    float _1040 = _972;
    float _1042 = _974;
    float _1044 = _976;
    float _1046 = _978;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1050 = _1036 + _1048;
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1054 = _958 * _309;
    float _1056 = _958 * _301;
    float _1058 = fma(_1050, _1050, _1038);
    float _1060 = _920 + 0.5;
    float _1062 = _958 * _313;
    float _1064 = fma(_962, _277, _1056);
    float _1066 = _1058 + _1040;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1070 = fma(_962, _285, _1062);
    float _1072 = fma(_962, _281, _1054);
    float _1074 = -_807;
    float _1076 = _1074 + 0.5;
    float _1078 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1080 = _1068 * _954;
    float _1082 = sqrt(_1066);
    float _1084 = fma(_960, _323, _1072);
    float _1086 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1090 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * _1052;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = fma(_960, _317, _1064);
    float _1116 = fma(_960, _327, _1070);
    out.m_72.x = _1104;
    out.m_72.y = _1106;
    out.m_72.z = _1108;
    bool _1118 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1120 = isnan(_1082);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1126 = _1122 || _1124;
    out.m_74.x = _1110;
    out.m_74.y = _1112;
    out.m_74.z = _1100;
    out.m_74.w = _1098;
    out.m_76.x = _1080;
    out.m_76.y = _1102;
    out.m_78.x = _1084;
    out.m_78.y = _1114;
    out.m_78.z = _1116;
    float _1128 = _1102;
    float _1130 = _1088;
    float _1132 = _1050;
    float _1134 = _1046;
    if (!_1126)
    {
        _331 = 1.0;
    }
    float _1136 = _331;
    bool _1138 = !_1126;
    float _1140 = _1136;
    if (!_1138)
    {
        bool _1142 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1144 = isnan(_1082);
        bool _1146 = _1142 || _1144;
        bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1150 = _1146 || _1148;
        if (!_1150)
        {
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = _1082 + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1158 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1156;
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1162 = _1160 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1164 = 1.0 / _1158;
            float _1166 = _1154 * _1164;
            float _1168 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1140 = _1168;
            _1170 = true;
        }
        else
        {
            bool _1172 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1174 = isnan(_1082);
            bool _1176 = _1172 || _1174;
            bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1180 = _1176 || _1178;
            if (!_1180)
            {
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1082 + _1182;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1194 = 1.0 / _1188;
                float _1196 = _1184 * _1194;
                float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1140 = _1198;
                _1170 = true;
            }
            else
            {
                _1140 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1170 = false;
    float _1200 = _1140;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1036 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1042 + _1206;
    bool _1210 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1222 = _1044 + _1220;
    float _1224 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1226 = fma(_1208, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1228 = fma(_1222, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1230 = _1204;
    float _1232 = _1224;
    float _1234 = _1226;
    if (_1218)
    {
        _1230 = _1228;
    }
    float _1236 = _1230;
    float _1238 = _1236;
    if (!_1218)
    {
        float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1242 = _916 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1246 = _765 + _1244;
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = -_916;
        float _1252 = _1250 + _1224;
        float _1254 = _1242 * _1242;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1258 = _769 + _1256;
        float _1260 = fma(_1246, _1246, _1254);
        float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1264 = fma(_1258, _1258, _1260);
        float _1266 = sqrt(_1264);
        float _1268 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1270 = precise::min(_1266, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1272 = _1270 * _1262;
        float _1274 = -_765;
        float _1276 = _1274 + _1228;
        float _1278 = _1268 * _1272;
        float _1280 = -_769;
        float _1282 = _1280 + _1226;
        float _1284 = fma(_1276, _1278, _765);
        float _1286 = fma(_1252, _1278, _916);
        float _1288 = fma(_1282, _1278, _769);
        _1232 = _1286;
        _1238 = _1284;
        _1234 = _1288;
        _1128 = _1282;
        _319 = _1248;
    }
    float _1290 = _1232;
    float _1292 = _1238;
    float _1294 = _1234;
    float _1296 = _1128;
    float _1298 = _319;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1306 = _1292 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1294 + _1308;
    float _1312 = _1302 * _1302;
    float _1314 = fma(_1306, _1306, _1312);
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1318 = fma(_1310, _1310, _1314);
    float _1320 = rsqrt(_1318);
    float _1322 = sqrt(_1318);
    float _1324 = _1306 * _1320;
    float _1326 = _1310 * _1320;
    float _1328 = _1302 * _1320;
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1334 = _1330 * _1330;
    float _1336 = _1332 * _1332;
    float _1338 = _1334 + _1336;
    float _1340 = sqrt(_1338);
    bool _1342 = _1340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = _1340 + _1344;
    float _1348 = _1296;
    float _1350 = _1338;
    float _1352 = _1346;
    float _1354 = _1310;
    if (_1342)
    {
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1348 = _1356;
    }
    float _1358 = _1348;
    if (_1342)
    {
        float _1360 = rsqrt(_1338);
        _1350 = _1360;
    }
    float _1362 = _1350;
    float _1364 = _1362;
    if (_1342)
    {
        float _1366 = _1346 * _1358;
        _1352 = _1366;
    }
    float _1368 = _1352;
    float _1370 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1342)
    {
        float _1372 = _1368 * 0.15915493667125701904296875;
        _1130 = _1372;
    }
    float _1374 = _1130;
    float _1376 = floor(_1370);
    float _1378 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1380 = _1298;
    float _1382 = _1374;
    if (_1342)
    {
        float _1384 = _1374 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        _1380 = _1386;
    }
    float _1388 = _1380;
    float _1390 = precise::max(0.0, _1378);
    float _1392 = -_1328;
    float _1394 = -_1390;
    float _1396 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1394);
    float _1398 = _960;
    float _1400 = _1390;
    if (_1342)
    {
        float _1402 = _1374 * 6.283185482025146484375;
        float _1404 = cos(_1402);
        _1398 = _1404;
    }
    float _1406 = _1398;
    if (_1342)
    {
        float _1408 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = _1388;
    float _1414 = _1410;
    if (_1342)
    {
        float _1416 = fma(_1388, _1410, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1132 = _1416;
    }
    float _1418 = _1132;
    float _1420 = _1418;
    if (!_1342)
    {
        _1412 = _1330;
    }
    float _1422 = _1412;
    float _1424 = _1422;
    if (!_1342)
    {
        _1382 = _1332;
    }
    float _1426 = _1382;
    float _1428 = _1426;
    if (_1342)
    {
        float _1430 = _1362 * _1418;
        _980 = _1430;
    }
    float _1432 = _980;
    if (!_1342)
    {
        _1420 = _1396;
    }
    float _1434 = _1420;
    float _1436 = _1434;
    if (!_1342)
    {
        _1364 = _1334;
    }
    float _1438 = _1364;
    float _1440 = _1438;
    if (_1342)
    {
        float _1442 = _1406 + (-1.0);
        _1414 = _1442;
    }
    float _1444 = _1414;
    float _1446 = _1444;
    if (_1342)
    {
        float _1448 = _1330 * _1432;
        _1424 = _1448;
    }
    float _1450 = _1424;
    if (_1342)
    {
        float _1452 = _1332 * _1432;
        _1428 = _1452;
    }
    float _1454 = _1428;
    if (_1342)
    {
        float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1456;
    }
    float _1458 = _1134;
    if (_1342)
    {
        float _1460 = _1450 * _1450;
        _1440 = _1460;
    }
    float _1462 = _1440;
    if (!_1342)
    {
        _1446 = _1336;
    }
    float _1464 = _1446;
    float _1466 = _1464;
    if (_1342)
    {
        float _1468 = _1454 * _1454;
        _1466 = _1468;
    }
    float _1470 = _1466;
    if (_1342)
    {
        float _1472 = fma(_1396, _1406, _1458);
        _1436 = _1472;
    }
    float _1474 = _1436;
    float _1476 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1480 = fma(_1474, _1474, _1462);
    float _1482 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1484 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1488 = _1480 + _1470;
    float _1490 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1492 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1494 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1498 = fma(_1322, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1496);
    float _1500 = precise::clamp(_1498, 0.0, 1.0);
    float _1502 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1490);
    float _1504 = rsqrt(_1488);
    float _1506 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1510 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1502);
    float _1512 = -_1500;
    float _1514 = _1512 + 1.0;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1518 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1478);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1522 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1524 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1526 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1518);
    float _1528 = abs(_1514);
    float _1530 = log2(_1528);
    float _1532 = -_1522;
    float _1534 = fma(_1532, _1316, 1.0);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1524);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = _1504 * _1450;
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1536);
    float _1544 = _1504 * _1474;
    float _1546 = _1504 * _1454;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1542);
    float _1552 = floor(_1482);
    float _1554 = -_1548;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1560 = -_1546;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1564 = -_1376;
    float _1566 = _1370 + _1564;
    float _1568 = 1.0 / _1550;
    float _1570 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1562, -0.5, 0.5);
    float _1574 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1576 = fma(_1562, 0.5, 0.5);
    float _1578 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1580 = exp2(_1558);
    float _1582 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1574);
    float _1584 = -_1552;
    float _1586 = _1482 + _1584;
    float _1588 = _1544 + 1.0;
    float _1590 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1592 = sqrt(_1572);
    float _1594 = fma(_1576, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1596 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1598 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1590);
    float _1600 = fma(_1576, _1594, -0.212114393711090087890625);
    float _1602 = log2(_1534);
    float _1604 = -_1544;
    float _1606 = fma(_1580, _1588, _1604);
    float _1608 = fma(_1576, _1600, 1.570728778839111328125);
    float _1610 = _1598 * _1568;
    float2 _4711 = float2(_1566, _1586);
    float _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4711, float2(0.0), isnan(_4711)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4711, float2(0.0), isnan(_4711)), level(0.0)).x;
    float _1614 = fma(_1610, -0.5, 0.5);
    float _1616 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1596);
    float _1618 = _1592 * 0.636619746685028076171875;
    float _1620 = _1616 * _1568;
    float _1622 = _1602 * 0.693147182464599609375;
    float _1624 = fma(_1620, 0.5, 0.5);
    float _1626 = -_1608;
    float _1628 = fma(_1618, _1626, 1.0);
    float _1630 = fma(_1606, 0.5, 0.5);
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4751 = float3(_1624, _1614, _1632);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).x;
    float3 _4762 = float3(_1624, _1614, _1632);
    float4 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4762, float3(0.0), isnan(_4762)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4762, float3(0.0), isnan(_4762)), level(0.0)).xyzw;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = _1637.w;
    float2 _4778 = float2(_1628, _1630);
    float3 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4778, float2(0.0), isnan(_4778)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4778, float2(0.0), isnan(_4778)), level(0.0)).xyz;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1659 = _916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1661 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1663 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1665 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1657);
    float _1667 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1659);
    float _1669 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1661);
    float _1671 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1665);
    float _1673 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1667);
    float _1675 = exp2(_1663);
    float _1677 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_80.x = _1306;
    out.m_80.y = _1302;
    out.m_80.z = _1310;
    float _1681 = _1679 + _1677;
    float _1683 = 1.0 / _1677;
    bool _1685 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.5);
    bool _1693 = _1689 || _1691;
    float _1695 = _1681 * _1683;
    float _1697 = _1695 * 0.5;
    float _1699 = _1538;
    float _1701 = _1550;
    if (_1693)
    {
        _1354 = 1.0;
    }
    float _1703 = _1354;
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1705);
    float _1709 = 1.0 / _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1713 = _1709 * _1711;
    float _1715 = abs(_1713);
    float _1717 = log2(_1715);
    float _1719 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1721 = exp2(_1719);
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1725 = precise::clamp(_1723, 0.0, 1.0);
    float _1727 = fma(_1725, -2.0, 3.0);
    float _1729 = _1725 * _1725;
    float _1731 = in.m_70.x;
    float _1733 = _1729 * _1727;
    float _1735 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1669);
    bool _1737 = _1713 <= 8000.0;
    bool _1739 = isnan(_1713);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = -_1733;
    float _1751 = _1749 + 1.0;
    float _1753 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1735);
    float _1755 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1733);
    float _1757 = _1753 + _1550;
    float _1759 = _1703;
    if (_1693)
    {
        _1699 = 1.0;
    }
    float _1761 = _1699;
    float _1763 = _1757 * 0.5;
    float _1765 = _1761;
    float _1767 = _1653;
    float _1769 = _1651;
    float _1771 = _1763;
    float _1773 = _1731;
    if (!_1693)
    {
        float _1775 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = _1775 * 0.15915493667125701904296875;
        float _1783 = _1781 * 6.283185482025146484375;
        float _1785 = cos(_1783);
        float _1787 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1781 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = 1.0 / _1785;
        float _1797 = _1789 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = _1793 * _1795;
        float _1803 = _1789 * 6.283185482025146484375;
        float _1805 = sin(_1803);
        float _1807 = _1799 * _1801;
        float _1809 = 1.0 / _1779;
        float _1811 = 1.0 / _1807;
        float _1813 = _1805 * _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = fma(_1713, _1813, _1815);
        float _1819 = _1817 * _1809;
        float _1821 = precise::clamp(_1819, 0.0, 1.0);
        _1765 = _1821;
    }
    float _1823 = _1765;
    if (!_1693)
    {
        float _1825 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1827 = _1825 * 0.15915493667125701904296875;
        float _1829 = _1827 * 6.283185482025146484375;
        float _1831 = cos(_1829);
        float _1833 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1835 = _1833 * 0.15915493667125701904296875;
        float _1837 = _1827 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        float _1841 = 1.0 / _1831;
        float _1843 = _1835 * 6.283185482025146484375;
        float _1845 = cos(_1843);
        float _1847 = _1839 * _1841;
        float _1849 = _1835 * 6.283185482025146484375;
        float _1851 = sin(_1849);
        float _1853 = _1845 * _1847;
        float _1855 = 1.0 / _1853;
        float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1859 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1857;
        float _1861 = 1.0 / _1859;
        float _1863 = _1851 * _1855;
        float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1867 = fma(_1713, _1863, _1865);
        float _1869 = _1867 * _1861;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        float _1873 = -_1871;
        float _1875 = _1873 + 1.0;
        _1759 = _1875;
    }
    float _1877 = _1759;
    float _1879 = _1747 * _1755;
    float _1881 = -_1675;
    float _1883 = _1881 + 1.0;
    float _1885 = -_1612;
    float _1887 = _1885 + 1.0;
    out.gl_Position.x = _1616;
    out.gl_Position.y = _1598;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1550;
    float _1889 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _1292;
    out.m_82.y = _1290;
    out.m_82.z = _1294;
    float _1893 = _1887 * _1889;
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    bool _1897 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1899 = isnan(_1322);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1905 = _1901 || _1903;
    float _1907 = _1891 * _1634;
    float _1909 = -_1891;
    float _1911 = _1909 + 1.0;
    float _1913 = -_1895;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1917 = _1645 * _1907;
    out.m_84.z = _1763;
    out.m_84.w = _1550;
    float _1919 = _1915 * _1731;
    float _1921 = _1655 * _1907;
    float _1923 = fma(_1651, _1917, _1639);
    float _1925 = fma(_1653, _1917, _1641);
    float _1927 = _1645 * _1911;
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1931 = fma(_1645, _1921, _1643);
    float _1933 = _1823 * _1877;
    float _1935 = _1919;
    if (!_1905)
    {
        _1767 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1937 = _1767;
    out.m_86.x = _1929;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1905)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1943 = _1701;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1947 = _1943;
    float _1949 = _1943;
    if (!_1905)
    {
        _1769 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1951 = _1769;
    out.m_88.x = _1923;
    out.m_88.y = _1925;
    out.m_88.z = _1931;
    out.m_88.w = _1927;
    float _1953 = _1951;
    float _1955 = _1951;
    if (!_1905)
    {
        _1771 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1957 = _1771;
    float _1959 = _1957;
    float _1961 = _1957;
    if (!_1905)
    {
        _1773 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1963 = _1773;
    float _1965 = _1963;
    float _1967 = _1963;
    if (!_1905)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1969 = _1935;
    bool _1971 = !_1905;
    float _1973 = _1969;
    float _1975 = _1969;
    if (!_1971)
    {
        bool _1977 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1979 = isnan(_1322);
        bool _1981 = _1977 || _1979;
        bool _1983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1985 = _1981 || _1983;
        if (!_1985)
        {
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1989 = _1322 + _1987;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1993 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1991;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2003 = 1.0 / _1993;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2017 = _1989 * _2003;
            float _2019 = precise::clamp(_2017, 0.0, 1.0);
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2025 = fma(_2019, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2019, _2001, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2029 = fma(_2019, _2007, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2031 = fma(_2019, _2011, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2033 = fma(_2019, _2023, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2035 = fma(_2019, _2015, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1949 = _2025;
            _1967 = _2033;
            _1941 = _2027;
            _1961 = _2031;
            _1955 = _2029;
            _1975 = _2035;
            _2037 = true;
        }
        else
        {
            bool _2039 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2041 = isnan(_1322);
            bool _2043 = _2039 || _2041;
            bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2047 = _2043 || _2045;
            if (!_2047)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2049 = _1939;
            _1941 = _2049;
            if (!_2047)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2051 = _1947;
            _1949 = _2051;
            if (!_2047)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2053 = _1953;
            _1955 = _2053;
            if (!_2047)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2055 = _1959;
            _1961 = _2055;
            if (!_2047)
            {
                _1965 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2057 = _1965;
            _1967 = _2057;
            if (!_2047)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2059 = _1973;
            bool _2061 = !_2047;
            _1975 = _2059;
            if (!_2061)
            {
                bool _2063 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2065 = isnan(_1322);
                bool _2067 = _2063 || _2065;
                bool _2069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2071 = _2067 || _2069;
                if (!_2071)
                {
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2075 = _1322 + _2073;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2079 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2077;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2089 = 1.0 / _2079;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2103 = _2075 * _2089;
                    float _2105 = precise::clamp(_2103, 0.0, 1.0);
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2111 = fma(_2105, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2105, _2087, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2115 = fma(_2105, _2093, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2117 = fma(_2105, _2097, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2119 = fma(_2105, _2109, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2121 = fma(_2105, _2101, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1949 = _2111;
                    _1967 = _2119;
                    _1941 = _2113;
                    _1961 = _2117;
                    _1955 = _2115;
                    _1975 = _2121;
                    _2037 = true;
                }
                else
                {
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1967 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2037 = false;
    float _2123 = _1949;
    float _2125 = _1967;
    float _2127 = _1941;
    float _2129 = _1961;
    float _2131 = _1955;
    float _2133 = _1975;
    float _2135 = fma(_1114, -0.5, 0.5);
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2123;
    float _2141 = _2139 + _2125;
    float _2143 = _1945 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = -_2127;
    float _2147 = _2145 + _2129;
    out.m_90.x = 0.0;
    float _2149 = fma(_2137, _2141, _2123);
    float _2151 = fma(_2137, _2147, _2127);
    out.m_51.x = _2143;
    float _2153 = -_2131;
    float _2155 = _2153 + _2133;
    float _2157 = _2149 * 0.586610972881317138671875;
    bool _2159 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2161 = fma(_2137, _2155, _2131);
    float _2163 = fma(_2151, 0.298911988735198974609375, _2157);
    bool _2165 = _1823 > 0.0;
    bool _2167 = isnan(_1823);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(0.0);
    bool _2173 = _2169 || _2171;
    out.m_92.x = 0.0;
    float _2175 = fma(_2161, 0.114477999508380889892578125, _2163);
    bool _2177 = _1877 <= 0.0;
    bool _2179 = !_2173;
    bool _2181 = _2177 || _2179;
    float _2183 = -_2175;
    float _2185 = _2151 + _2183;
    float _2187 = -_2175;
    float _2189 = _2149 + _2187;
    float _2191 = -_2175;
    float _2193 = _2161 + _2191;
    float _2195 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    float _2197 = fma(_2189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    float _2199 = fma(_2193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    bool _2201 = !_2159;
    if (!_2201)
    {
        float _2203 = -_1290;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2207 = -_1292;
        float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2211 = -_1294;
        float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2215 = _2205 * _2205;
        float _2217 = fma(_2209, _2209, _2215);
        float _2219 = fma(_2213, _2213, _2217);
        float _2221 = rsqrt(_2219);
        float _2223 = _2205 * _2221;
        float _2225 = _2209 * _2221;
        float _2227 = _2213 * _2221;
        float _2229 = -_1328;
        float _2231 = _2229 + _2223;
        float _2233 = -_1324;
        float _2235 = _2233 + _2225;
        float _2237 = -_1326;
        float _2239 = _2237 + _2227;
        float _2241 = sqrt(_2219);
        float _2243 = _2231 * _2231;
        float _2245 = fma(_2235, _2235, _2243);
        float _2247 = fma(_2239, _2239, _2245);
        float _2249 = rsqrt(_2247);
        float _2251 = -_2241;
        float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2255 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = abs(_2257);
        float _2261 = log2(_2259);
        float _2263 = _2231 * _2249;
        float _2265 = _2235 * _2249;
        float _2267 = _2239 * _2249;
        float _2269 = _1114 * _2263;
        float _2271 = _1114 * _2223;
        float _2273 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = fma(_1084, _2265, _2269);
        float _2279 = fma(_1084, _2225, _2271);
        float _2281 = _2275 * _2275;
        float _2283 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2285 = fma(_1116, _2267, _2277);
        float _2287 = precise::clamp(_2285, 0.0, 1.0);
        float _2289 = fma(_1116, _2227, _2279);
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = _2281 + (-1.0);
        float _2295 = _2287 * _2287;
        float _2297 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2299 = exp2(_2283);
        float _2301 = fma(_2295, _2293, 1.0);
        float _2303 = -_2223;
        float _2305 = -_2297;
        float _2307 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2305);
        float _2309 = _2301 * _2301;
        float _2311 = -_2227;
        float _2313 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2307);
        float _2315 = 1.0 / _2309;
        float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2319 = _2313 + _2317;
        float _2321 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2323 = precise::clamp(_2321, 0.0, 1.0);
        float _2325 = _2299 * _2323;
        float _2327 = _2291 * _2325;
        float _2329 = _2281 * _2315;
        float _2331 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2333 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2335 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2337 = _2327 * _2329;
        float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2331;
        out.m_90.y = _2333;
        out.m_90.z = _2335;
        out.m_92.x = _2339;
        out.m_92.y = _2341;
        out.m_92.z = _2343;
    }
    out.m_94.x = _2195;
    out.m_94.y = _2197;
    out.m_94.z = _2199;
    if (!_2181)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2345 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2345;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2037 = false;
    bool _1170 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2402 = as_type<float>(_129);
        out.gl_Position.z = _2402;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2472 = as_type<float>(_167);
        out.gl_Position.z = _2472;
    }
    if (_159)
    {
        return out;
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = _169 * _169;
    float _189 = _171 * _171;
    float _191 = _173 * _173;
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _189);
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = sqrt(_199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _205 > 0.0;
    bool _213 = _207 > 0.0;
    float _215 = _207;
    float _217 = _205;
    float _219 = _199;
    if (_211)
    {
        float _221 = rsqrt(_199);
        _215 = _221;
    }
    float _223 = _215;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _225 = _217;
    bool _227 = _209 > 0.0;
    float _229 = _209;
    float _231 = _225;
    if (!_211)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (_213)
    {
        float _245 = rsqrt(_201);
        _241 = _245;
    }
    float _247 = _241;
    float _249 = 0.0;
    if (!_213)
    {
        _249 = 0.0;
    }
    float _251 = _249;
    float _253 = 0.0;
    float _255 = _251;
    if (!_213)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_213)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_203);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = _223;
    if (_211)
    {
        float _275 = _223 * _169;
        _237 = _275;
    }
    float _277 = _237;
    if (_211)
    {
        float _279 = _223 * _175;
        _231 = _279;
    }
    float _281 = _231;
    if (_211)
    {
        float _283 = _223 * _181;
        _243 = _283;
    }
    float _285 = _243;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_227)
    {
        _273 = 0.0;
    }
    float _289 = _273;
    float _291 = 0.0;
    float _293 = _289;
    if (!_227)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = _295;
    if (_213)
    {
        float _299 = _247 * _171;
        _255 = _299;
    }
    float _301 = _255;
    if (!_227)
    {
        _219 = 0.0;
    }
    float _303 = _219;
    float _305 = _303;
    if (_213)
    {
        float _307 = _247 * _177;
        _261 = _307;
    }
    float _309 = _261;
    if (_213)
    {
        float _311 = _247 * _183;
        _267 = _311;
    }
    float _313 = _267;
    if (_227)
    {
        float _315 = _271 * _173;
        _293 = _315;
    }
    float _317 = _293;
    float _319 = _317;
    if (_227)
    {
        float _321 = _271 * _179;
        _297 = _321;
    }
    float _323 = _297;
    if (_227)
    {
        float _325 = _271 * _185;
        _305 = _325;
    }
    float _327 = _305;
    bool _329 = !_287;
    float _331 = _327;
    float _349;
    if (!_329)
    {
        float _333 = in.m_61.x;
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _363 = log2(_361);
    float _365 = in.m_61.z;
    float _367 = in.m_61.x;
    bool _369 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(1.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _381 = 1.0 + _379;
    bool _383 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _391 = _387 || _389;
    float _393 = as_type<float>(int(gl_VertexIndex));
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = in.m_61.y;
    float _401 = 1.0 / _381;
    float _403 = _363 * _147;
    float _405 = in.m_59.w;
    float _407 = in.m_48.x;
    float _409 = in.m_48.y;
    float _411 = in.m_48.z;
    float _413 = exp2(_403);
    float _415 = _365 * 2.0;
    float _417 = 1.0 / _397;
    float _419 = _399 * 2.0;
    float _421 = floor(_415);
    float _423 = -_413;
    float _425 = _423 + 1.0;
    float _427 = _367 * 2.0;
    float _429 = _367 + _365;
    float _431 = _391 ? _425 : 0.0;
    float _433 = _177 * _409;
    float _435 = floor(_427);
    int _437 = as_type<int>(_393) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>(_393) & 2;
    bool _443 = _441 != 0;
    float _445 = _429 + (-1.0);
    float _447 = fma(_175, _407, _433);
    float _449 = _399 + _365;
    if (_377)
    {
        float _451 = _431 * _401;
        _149 = _451;
    }
    float _453 = _149;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _465 = _463 != 0;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _469 = _359 + _467;
    bool _471 = _421 > 0.0;
    float _473 = _449 + (-1.0);
    bool _475 = _421 >= 0.0;
    bool _477 = isnan(_421);
    bool _479 = _475 || _477;
    bool _481 = isnan(0.0);
    bool _483 = _479 || _481;
    float _485 = floor(_419);
    float _487 = _469 * _417;
    float _489 = _367 + _399;
    int _491 = _483 ? 0 : 1;
    float _493 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _495 = _435 > 0.0;
    float _497 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _499 = !_457;
    int _501 = _499 ? 0 : 1;
    float _503 = _489 + (-1.0);
    bool _505 = _435 >= 0.0;
    bool _507 = isnan(_435);
    bool _509 = _505 || _507;
    bool _511 = isnan(0.0);
    bool _513 = _509 || _511;
    float _515 = _365 + (-0.5);
    float _517 = in.m_66.x;
    float _519 = in.m_66.y;
    float _521 = in.m_66.z;
    int _523 = abs(_501);
    float _525 = _183 * _409;
    int _527 = ~_491;
    int _529 = _527 + 1;
    int _531 = _529 + 1;
    float _533 = fma(_179, _411, _447);
    int _535 = _531;
    if (!_471)
    {
        int _537 = ~_491;
        int _539 = _537 + 1;
        _535 = _539;
    }
    int _541 = _535;
    bool _543 = _485 > 0.0;
    float _545 = float(_523);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _549 = float(_541);
    int _551 = _513 ? 0 : 1;
    bool _553 = _485 >= 0.0;
    bool _555 = isnan(_485);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = _545 * _549;
    bool _565 = !_465;
    int _567 = _565 ? 0 : 1;
    int _569 = _561 ? 0 : 1;
    int _571 = ~_551;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    int _577 = abs(_567);
    int _579 = _575;
    if (!_495)
    {
        int _581 = ~_551;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = _563 * (-2.0);
    int _589 = ~_569;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = _367 + (-0.5);
    int _597 = _593;
    if (!_543)
    {
        int _599 = ~_569;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    float _605 = fma(_587, _517, _517);
    float _607 = fma(_547, _587, _547);
    float _609 = float(_577);
    float _611 = float(_603);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _605);
    bool _615 = !_461;
    int _617 = _615 ? 0 : 1;
    float _619 = _609 * _611;
    float _621 = fma(_607, _453, _613);
    int _623 = abs(_617);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = float(_585);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _631;
    float _635 = _619 * (-2.0);
    float _637 = float(_623);
    float _639 = _621 * 0.15915493667125701904296875;
    float _641 = fma(_627, _487, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _643 = fma(_635, _521, _521);
    float _645 = fma(_497, _635, _497);
    float _647 = _637 * _629;
    float _649 = fma(_633, _487, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _651 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[196].z, _643);
    float _653 = _399 + (-0.5);
    float _655 = _647 * (-2.0);
    bool _657 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _659 = isnan(_359);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = fma(_645, _453, _651);
    bool _671 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_359);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = in.m_68.x;
    float _685 = in.m_68.y;
    float _687 = fma(_655, _519, _519);
    float _689 = fma(_493, _655, _493);
    float _691 = _669 * 0.15915493667125701904296875;
    float _693 = -_681;
    float _695 = _693 + 1.0;
    float _697 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _687);
    float _699 = _639 * 6.283185482025146484375;
    float _701 = sin(_699);
    float _703 = in.m_57.w;
    float _705 = _667 * _695;
    float _707 = -_667;
    float _709 = _707 + 1.0;
    float _711 = fma(_689, _453, _697);
    float _713 = _641 * _705;
    float _715 = _649 * _705;
    float _717 = _711 * 0.15915493667125701904296875;
    float _719 = _639 * 6.283185482025146484375;
    float _721 = cos(_719);
    float _723 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].x, _713);
    float _725 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].y, _715);
    bool _727 = !_443;
    float _729 = _727 ? (-0.5) : 0.5;
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].x, _723);
    float _733 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].y, _725);
    bool _735 = !_439;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = _691 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = _731 * _683;
    float _745 = _733 * _685;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _729);
    float _749 = fma(_181, _407, _525);
    float _751 = _743 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _755 = _367 > 0.5;
    float _757 = _691 * 6.283185482025146484375;
    float _759 = cos(_757);
    float _761 = fma(_185, _411, _749);
    float _763 = _753 * _747;
    float _765 = _533 + _703;
    bool _767 = _399 > 0.5;
    float _769 = _761 + _405;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = _729 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _777 = _717 * 6.283185482025146484375;
    float _779 = cos(_777);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _783 = _701 * _741;
    float _785 = _721 * _741;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = _751 * _781;
    float _793 = -_729;
    int _795 = _767 ? as_type<int>(_793) : as_type<int>(_729);
    float _797 = _717 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = _721 * _759;
    float _803 = _701 * _759;
    bool _805 = !_789;
    float _807 = _805 ? _729 : as_type<float>(_795);
    float _809 = _779 * _741;
    float _811 = _779 * _759;
    float _813 = _701 * _779;
    float _815 = _721 * _779;
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = _813 * _775;
    float _821 = fma(_799, _783, _801);
    float _823 = fma(_799, _801, _783);
    float _825 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _827 = -_785;
    float _829 = fma(_799, _803, _827);
    float _831 = _821 * _763;
    float _833 = -_803;
    float _835 = fma(_799, _785, _833);
    float _837 = _825 * _367;
    float _839 = _829 * _763;
    float _841 = fma(_809, _791, _831);
    float _843 = _813 * _763;
    float _845 = in.m_70.y;
    float _847 = fma(_811, _791, _839);
    float _849 = trunc(_837);
    int _851 = int(_849);
    float _853 = fma(_835, _817, _841);
    float _855 = -_799;
    float _857 = fma(_855, _791, _843);
    float _859 = fma(_823, _817, _847);
    float _861 = -_737;
    int _863 = _755 ? as_type<int>(_861) : as_type<int>(_737);
    float _865 = _853 * _309;
    float _867 = _853 * _313;
    float _869 = fma(_815, _817, _857);
    float _871 = _829 * _775;
    float _873 = fma(_859, _281, _865);
    float _875 = fma(_859, _285, _867);
    float _877 = _853 * _301;
    float _879 = _821 * _775;
    float _881 = fma(_869, _323, _873);
    float _883 = fma(_869, _327, _875);
    float _885 = fma(_859, _277, _877);
    int _887 = _851 << 4;
    int _889 = _887 + 1712;
    float _891 = _765 + _881;
    float _893 = _769 + _883;
    float _895 = fma(_869, _317, _885);
    int _897 = _889 + 8;
    uint _900 = uint(int(uint(_897) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[int(_902)][_904];
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _910 = _891 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _914 = _893 + _912;
    float _916 = _409 + _845;
    bool _918 = !_773;
    float _920 = _918 ? _737 : as_type<float>(_863);
    float _922 = _910 * _910;
    float _924 = _914 * _914;
    float _926 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _928 = uint(int(uint(_889) >> uint(2)));
    uint _930 = uint(int(uint(int(_928)) >> uint(2)));
    int _932 = int(_928) & 3;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[int(_930)][_932];
    int _936 = int(_928) + 1;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    int _940 = _936 & 3;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[int(_938)][_940];
    float _944 = _916 + _895;
    float _946 = _922 + _924;
    float _948 = fma(_809, _926, _879);
    float _950 = -_799;
    float _952 = fma(_950, _926, _819);
    float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _956 = fma(_811, _926, _871);
    float _958 = _835 + _948;
    float _960 = _815 + _952;
    float _962 = _823 + _956;
    float _964 = sqrt(_946);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = _879;
    float _970 = _922;
    float _972 = _924;
    float _974 = _893;
    float _976 = _891;
    float _978 = _835;
    float _980 = _910;
    if (!_966)
    {
        _968 = _944;
    }
    float _982 = _968;
    bool _984 = !_966;
    float _986 = _982;
    if (!_984)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _964 + _990;
        float _994 = rsqrt(_946);
        float _996 = _992 * _988;
        float _998 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _994 * _1010;
        float _1014 = fma(_910, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = _1008 + (-1.0);
        float _1018 = fma(_914, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1022 = _1014 + _1020;
        float _1024 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1028 = _1018 + _1026;
        float _1030 = _1022 * _1022;
        float _1032 = fma(_944, _1008, _1024);
        float _1034 = _1028 * _1028;
        _986 = _1032;
        _970 = _1030;
        _972 = _1034;
        _974 = _1018;
        _976 = _1014;
        _978 = _1000;
    }
    float _1036 = _986;
    float _1038 = _970;
    float _1040 = _972;
    float _1042 = _974;
    float _1044 = _976;
    float _1046 = _978;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1050 = _1036 + _1048;
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1054 = _958 * _309;
    float _1056 = _958 * _301;
    float _1058 = fma(_1050, _1050, _1038);
    float _1060 = _920 + 0.5;
    float _1062 = _958 * _313;
    float _1064 = fma(_962, _277, _1056);
    float _1066 = _1058 + _1040;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1070 = fma(_962, _285, _1062);
    float _1072 = fma(_962, _281, _1054);
    float _1074 = -_807;
    float _1076 = _1074 + 0.5;
    float _1078 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1080 = _1068 * _954;
    float _1082 = sqrt(_1066);
    float _1084 = fma(_960, _323, _1072);
    float _1086 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1090 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * _1052;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = fma(_960, _317, _1064);
    float _1116 = fma(_960, _327, _1070);
    out.m_72.x = _1104;
    out.m_72.y = _1106;
    out.m_72.z = _1108;
    bool _1118 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1120 = isnan(_1082);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1126 = _1122 || _1124;
    out.m_74.x = _1110;
    out.m_74.y = _1112;
    out.m_74.z = _1100;
    out.m_74.w = _1098;
    out.m_76.x = _1080;
    out.m_76.y = _1102;
    out.m_78.x = _1084;
    out.m_78.y = _1114;
    out.m_78.z = _1116;
    float _1128 = _1102;
    float _1130 = _1088;
    float _1132 = _1050;
    float _1134 = _1046;
    if (!_1126)
    {
        _331 = 1.0;
    }
    float _1136 = _331;
    bool _1138 = !_1126;
    float _1140 = _1136;
    if (!_1138)
    {
        bool _1142 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1144 = isnan(_1082);
        bool _1146 = _1142 || _1144;
        bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1150 = _1146 || _1148;
        if (!_1150)
        {
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = _1082 + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1158 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1156;
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1162 = _1160 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1164 = 1.0 / _1158;
            float _1166 = _1154 * _1164;
            float _1168 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1140 = _1168;
            _1170 = true;
        }
        else
        {
            bool _1172 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1174 = isnan(_1082);
            bool _1176 = _1172 || _1174;
            bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1180 = _1176 || _1178;
            if (!_1180)
            {
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1082 + _1182;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1194 = 1.0 / _1188;
                float _1196 = _1184 * _1194;
                float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1140 = _1198;
                _1170 = true;
            }
            else
            {
                _1140 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1170 = false;
    float _1200 = _1140;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1036 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1042 + _1206;
    bool _1210 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1222 = _1044 + _1220;
    float _1224 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1226 = fma(_1208, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1228 = fma(_1222, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1230 = _1204;
    float _1232 = _1224;
    float _1234 = _1226;
    if (_1218)
    {
        _1230 = _1228;
    }
    float _1236 = _1230;
    float _1238 = _1236;
    if (!_1218)
    {
        float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1242 = _916 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1246 = _765 + _1244;
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = -_916;
        float _1252 = _1250 + _1224;
        float _1254 = _1242 * _1242;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1258 = _769 + _1256;
        float _1260 = fma(_1246, _1246, _1254);
        float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1264 = fma(_1258, _1258, _1260);
        float _1266 = sqrt(_1264);
        float _1268 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1270 = precise::min(_1266, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1272 = _1270 * _1262;
        float _1274 = -_765;
        float _1276 = _1274 + _1228;
        float _1278 = _1268 * _1272;
        float _1280 = -_769;
        float _1282 = _1280 + _1226;
        float _1284 = fma(_1276, _1278, _765);
        float _1286 = fma(_1252, _1278, _916);
        float _1288 = fma(_1282, _1278, _769);
        _1232 = _1286;
        _1238 = _1284;
        _1234 = _1288;
        _1128 = _1282;
        _319 = _1248;
    }
    float _1290 = _1232;
    float _1292 = _1238;
    float _1294 = _1234;
    float _1296 = _1128;
    float _1298 = _319;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1306 = _1292 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1294 + _1308;
    float _1312 = _1302 * _1302;
    float _1314 = fma(_1306, _1306, _1312);
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1318 = fma(_1310, _1310, _1314);
    float _1320 = rsqrt(_1318);
    float _1322 = sqrt(_1318);
    float _1324 = _1306 * _1320;
    float _1326 = _1310 * _1320;
    float _1328 = _1302 * _1320;
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1334 = _1330 * _1330;
    float _1336 = _1332 * _1332;
    float _1338 = _1334 + _1336;
    float _1340 = sqrt(_1338);
    bool _1342 = _1340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = _1340 + _1344;
    float _1348 = _1296;
    float _1350 = _1338;
    float _1352 = _1346;
    float _1354 = _1310;
    if (_1342)
    {
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1348 = _1356;
    }
    float _1358 = _1348;
    if (_1342)
    {
        float _1360 = rsqrt(_1338);
        _1350 = _1360;
    }
    float _1362 = _1350;
    float _1364 = _1362;
    if (_1342)
    {
        float _1366 = _1346 * _1358;
        _1352 = _1366;
    }
    float _1368 = _1352;
    float _1370 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1342)
    {
        float _1372 = _1368 * 0.15915493667125701904296875;
        _1130 = _1372;
    }
    float _1374 = _1130;
    float _1376 = floor(_1370);
    float _1378 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1380 = _1298;
    float _1382 = _1374;
    if (_1342)
    {
        float _1384 = _1374 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        _1380 = _1386;
    }
    float _1388 = _1380;
    float _1390 = precise::max(0.0, _1378);
    float _1392 = -_1328;
    float _1394 = -_1390;
    float _1396 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1394);
    float _1398 = _960;
    float _1400 = _1390;
    if (_1342)
    {
        float _1402 = _1374 * 6.283185482025146484375;
        float _1404 = cos(_1402);
        _1398 = _1404;
    }
    float _1406 = _1398;
    if (_1342)
    {
        float _1408 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = _1388;
    float _1414 = _1410;
    if (_1342)
    {
        float _1416 = fma(_1388, _1410, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1132 = _1416;
    }
    float _1418 = _1132;
    float _1420 = _1418;
    if (!_1342)
    {
        _1412 = _1330;
    }
    float _1422 = _1412;
    float _1424 = _1422;
    if (!_1342)
    {
        _1382 = _1332;
    }
    float _1426 = _1382;
    float _1428 = _1426;
    if (_1342)
    {
        float _1430 = _1362 * _1418;
        _980 = _1430;
    }
    float _1432 = _980;
    if (!_1342)
    {
        _1420 = _1396;
    }
    float _1434 = _1420;
    float _1436 = _1434;
    if (!_1342)
    {
        _1364 = _1334;
    }
    float _1438 = _1364;
    float _1440 = _1438;
    if (_1342)
    {
        float _1442 = _1406 + (-1.0);
        _1414 = _1442;
    }
    float _1444 = _1414;
    float _1446 = _1444;
    if (_1342)
    {
        float _1448 = _1330 * _1432;
        _1424 = _1448;
    }
    float _1450 = _1424;
    if (_1342)
    {
        float _1452 = _1332 * _1432;
        _1428 = _1452;
    }
    float _1454 = _1428;
    if (_1342)
    {
        float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1456;
    }
    float _1458 = _1134;
    if (_1342)
    {
        float _1460 = _1450 * _1450;
        _1440 = _1460;
    }
    float _1462 = _1440;
    if (!_1342)
    {
        _1446 = _1336;
    }
    float _1464 = _1446;
    float _1466 = _1464;
    if (_1342)
    {
        float _1468 = _1454 * _1454;
        _1466 = _1468;
    }
    float _1470 = _1466;
    if (_1342)
    {
        float _1472 = fma(_1396, _1406, _1458);
        _1436 = _1472;
    }
    float _1474 = _1436;
    float _1476 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1480 = fma(_1474, _1474, _1462);
    float _1482 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1484 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1488 = _1480 + _1470;
    float _1490 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1492 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1494 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1498 = fma(_1322, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1496);
    float _1500 = precise::clamp(_1498, 0.0, 1.0);
    float _1502 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1490);
    float _1504 = rsqrt(_1488);
    float _1506 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1510 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1502);
    float _1512 = -_1500;
    float _1514 = _1512 + 1.0;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1518 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1478);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1522 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1524 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1526 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1518);
    float _1528 = abs(_1514);
    float _1530 = log2(_1528);
    float _1532 = -_1522;
    float _1534 = fma(_1532, _1316, 1.0);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1524);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = _1504 * _1450;
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1536);
    float _1544 = _1504 * _1474;
    float _1546 = _1504 * _1454;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1542);
    float _1552 = floor(_1482);
    float _1554 = -_1548;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1560 = -_1546;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1564 = -_1376;
    float _1566 = _1370 + _1564;
    float _1568 = 1.0 / _1550;
    float _1570 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1562, -0.5, 0.5);
    float _1574 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1576 = fma(_1562, 0.5, 0.5);
    float _1578 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1580 = exp2(_1558);
    float _1582 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1574);
    float _1584 = -_1552;
    float _1586 = _1482 + _1584;
    float _1588 = _1544 + 1.0;
    float _1590 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1592 = sqrt(_1572);
    float _1594 = fma(_1576, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1596 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1598 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1590);
    float _1600 = fma(_1576, _1594, -0.212114393711090087890625);
    float _1602 = log2(_1534);
    float _1604 = -_1544;
    float _1606 = fma(_1580, _1588, _1604);
    float _1608 = fma(_1576, _1600, 1.570728778839111328125);
    float _1610 = _1598 * _1568;
    float2 _4711 = float2(_1566, _1586);
    float _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4711, float2(0.0), isnan(_4711)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4711, float2(0.0), isnan(_4711)), level(0.0)).x;
    float _1614 = fma(_1610, -0.5, 0.5);
    float _1616 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1596);
    float _1618 = _1592 * 0.636619746685028076171875;
    float _1620 = _1616 * _1568;
    float _1622 = _1602 * 0.693147182464599609375;
    float _1624 = fma(_1620, 0.5, 0.5);
    float _1626 = -_1608;
    float _1628 = fma(_1618, _1626, 1.0);
    float _1630 = fma(_1606, 0.5, 0.5);
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4751 = float3(_1624, _1614, _1632);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).x;
    float3 _4762 = float3(_1624, _1614, _1632);
    float4 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4762, float3(0.0), isnan(_4762)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4762, float3(0.0), isnan(_4762)), level(0.0)).xyzw;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = _1637.w;
    float2 _4778 = float2(_1628, _1630);
    float3 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4778, float2(0.0), isnan(_4778)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4778, float2(0.0), isnan(_4778)), level(0.0)).xyz;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1659 = _916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1661 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1663 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1665 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1657);
    float _1667 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1659);
    float _1669 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1661);
    float _1671 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1665);
    float _1673 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1667);
    float _1675 = exp2(_1663);
    float _1677 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_80.x = _1306;
    out.m_80.y = _1302;
    out.m_80.z = _1310;
    float _1681 = _1679 + _1677;
    float _1683 = 1.0 / _1677;
    bool _1685 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.5);
    bool _1693 = _1689 || _1691;
    float _1695 = _1681 * _1683;
    float _1697 = _1695 * 0.5;
    float _1699 = _1538;
    float _1701 = _1550;
    if (_1693)
    {
        _1354 = 1.0;
    }
    float _1703 = _1354;
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1705);
    float _1709 = 1.0 / _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1713 = _1709 * _1711;
    float _1715 = abs(_1713);
    float _1717 = log2(_1715);
    float _1719 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1721 = exp2(_1719);
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1725 = precise::clamp(_1723, 0.0, 1.0);
    float _1727 = fma(_1725, -2.0, 3.0);
    float _1729 = _1725 * _1725;
    float _1731 = in.m_70.x;
    float _1733 = _1729 * _1727;
    float _1735 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1669);
    bool _1737 = _1713 <= 8000.0;
    bool _1739 = isnan(_1713);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = -_1733;
    float _1751 = _1749 + 1.0;
    float _1753 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1735);
    float _1755 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1733);
    float _1757 = _1753 + _1550;
    float _1759 = _1703;
    if (_1693)
    {
        _1699 = 1.0;
    }
    float _1761 = _1699;
    float _1763 = _1757 * 0.5;
    float _1765 = _1761;
    float _1767 = _1653;
    float _1769 = _1651;
    float _1771 = _1763;
    float _1773 = _1731;
    if (!_1693)
    {
        float _1775 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = _1775 * 0.15915493667125701904296875;
        float _1783 = _1781 * 6.283185482025146484375;
        float _1785 = cos(_1783);
        float _1787 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1781 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = 1.0 / _1785;
        float _1797 = _1789 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = _1793 * _1795;
        float _1803 = _1789 * 6.283185482025146484375;
        float _1805 = sin(_1803);
        float _1807 = _1799 * _1801;
        float _1809 = 1.0 / _1779;
        float _1811 = 1.0 / _1807;
        float _1813 = _1805 * _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = fma(_1713, _1813, _1815);
        float _1819 = _1817 * _1809;
        float _1821 = precise::clamp(_1819, 0.0, 1.0);
        _1765 = _1821;
    }
    float _1823 = _1765;
    if (!_1693)
    {
        float _1825 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1827 = _1825 * 0.15915493667125701904296875;
        float _1829 = _1827 * 6.283185482025146484375;
        float _1831 = cos(_1829);
        float _1833 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1835 = _1833 * 0.15915493667125701904296875;
        float _1837 = _1827 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        float _1841 = 1.0 / _1831;
        float _1843 = _1835 * 6.283185482025146484375;
        float _1845 = cos(_1843);
        float _1847 = _1839 * _1841;
        float _1849 = _1835 * 6.283185482025146484375;
        float _1851 = sin(_1849);
        float _1853 = _1845 * _1847;
        float _1855 = 1.0 / _1853;
        float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1859 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1857;
        float _1861 = 1.0 / _1859;
        float _1863 = _1851 * _1855;
        float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1867 = fma(_1713, _1863, _1865);
        float _1869 = _1867 * _1861;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        float _1873 = -_1871;
        float _1875 = _1873 + 1.0;
        _1759 = _1875;
    }
    float _1877 = _1759;
    float _1879 = _1747 * _1755;
    float _1881 = -_1675;
    float _1883 = _1881 + 1.0;
    float _1885 = -_1612;
    float _1887 = _1885 + 1.0;
    out.gl_Position.x = _1616;
    out.gl_Position.y = _1598;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1550;
    float _1889 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _1292;
    out.m_82.y = _1290;
    out.m_82.z = _1294;
    float _1893 = _1887 * _1889;
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    bool _1897 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1899 = isnan(_1322);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1905 = _1901 || _1903;
    float _1907 = _1891 * _1634;
    float _1909 = -_1891;
    float _1911 = _1909 + 1.0;
    float _1913 = -_1895;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1917 = _1645 * _1907;
    out.m_84.z = _1763;
    out.m_84.w = _1550;
    float _1919 = _1915 * _1731;
    float _1921 = _1655 * _1907;
    float _1923 = fma(_1651, _1917, _1639);
    float _1925 = fma(_1653, _1917, _1641);
    float _1927 = _1645 * _1911;
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1931 = fma(_1645, _1921, _1643);
    float _1933 = _1823 * _1877;
    float _1935 = _1919;
    if (!_1905)
    {
        _1767 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1937 = _1767;
    out.m_86.x = _1929;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1905)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1943 = _1701;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1947 = _1943;
    float _1949 = _1943;
    if (!_1905)
    {
        _1769 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1951 = _1769;
    out.m_88.x = _1923;
    out.m_88.y = _1925;
    out.m_88.z = _1931;
    out.m_88.w = _1927;
    float _1953 = _1951;
    float _1955 = _1951;
    if (!_1905)
    {
        _1771 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1957 = _1771;
    float _1959 = _1957;
    float _1961 = _1957;
    if (!_1905)
    {
        _1773 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1963 = _1773;
    float _1965 = _1963;
    float _1967 = _1963;
    if (!_1905)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1969 = _1935;
    bool _1971 = !_1905;
    float _1973 = _1969;
    float _1975 = _1969;
    if (!_1971)
    {
        bool _1977 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1979 = isnan(_1322);
        bool _1981 = _1977 || _1979;
        bool _1983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1985 = _1981 || _1983;
        if (!_1985)
        {
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1989 = _1322 + _1987;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1993 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1991;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2003 = 1.0 / _1993;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2017 = _1989 * _2003;
            float _2019 = precise::clamp(_2017, 0.0, 1.0);
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2025 = fma(_2019, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2019, _2001, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2029 = fma(_2019, _2007, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2031 = fma(_2019, _2011, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2033 = fma(_2019, _2023, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2035 = fma(_2019, _2015, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1949 = _2025;
            _1967 = _2033;
            _1941 = _2027;
            _1961 = _2031;
            _1955 = _2029;
            _1975 = _2035;
            _2037 = true;
        }
        else
        {
            bool _2039 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2041 = isnan(_1322);
            bool _2043 = _2039 || _2041;
            bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2047 = _2043 || _2045;
            if (!_2047)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2049 = _1939;
            _1941 = _2049;
            if (!_2047)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2051 = _1947;
            _1949 = _2051;
            if (!_2047)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2053 = _1953;
            _1955 = _2053;
            if (!_2047)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2055 = _1959;
            _1961 = _2055;
            if (!_2047)
            {
                _1965 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2057 = _1965;
            _1967 = _2057;
            if (!_2047)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2059 = _1973;
            bool _2061 = !_2047;
            _1975 = _2059;
            if (!_2061)
            {
                bool _2063 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2065 = isnan(_1322);
                bool _2067 = _2063 || _2065;
                bool _2069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2071 = _2067 || _2069;
                if (!_2071)
                {
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2075 = _1322 + _2073;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2079 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2077;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2089 = 1.0 / _2079;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2103 = _2075 * _2089;
                    float _2105 = precise::clamp(_2103, 0.0, 1.0);
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2111 = fma(_2105, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2105, _2087, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2115 = fma(_2105, _2093, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2117 = fma(_2105, _2097, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2119 = fma(_2105, _2109, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2121 = fma(_2105, _2101, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1949 = _2111;
                    _1967 = _2119;
                    _1941 = _2113;
                    _1961 = _2117;
                    _1955 = _2115;
                    _1975 = _2121;
                    _2037 = true;
                }
                else
                {
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1967 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2037 = false;
    float _2123 = _1949;
    float _2125 = _1967;
    float _2127 = _1941;
    float _2129 = _1961;
    float _2131 = _1955;
    float _2133 = _1975;
    float _2135 = fma(_1114, -0.5, 0.5);
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2123;
    float _2141 = _2139 + _2125;
    float _2143 = _1945 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = -_2127;
    float _2147 = _2145 + _2129;
    out.m_90.x = 0.0;
    float _2149 = fma(_2137, _2141, _2123);
    float _2151 = fma(_2137, _2147, _2127);
    out.m_51.x = _2143;
    float _2153 = -_2131;
    float _2155 = _2153 + _2133;
    float _2157 = _2149 * 0.586610972881317138671875;
    bool _2159 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2161 = fma(_2137, _2155, _2131);
    float _2163 = fma(_2151, 0.298911988735198974609375, _2157);
    bool _2165 = _1823 > 0.0;
    bool _2167 = isnan(_1823);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(0.0);
    bool _2173 = _2169 || _2171;
    out.m_92.x = 0.0;
    float _2175 = fma(_2161, 0.114477999508380889892578125, _2163);
    bool _2177 = _1877 <= 0.0;
    bool _2179 = !_2173;
    bool _2181 = _2177 || _2179;
    float _2183 = -_2175;
    float _2185 = _2151 + _2183;
    float _2187 = -_2175;
    float _2189 = _2149 + _2187;
    float _2191 = -_2175;
    float _2193 = _2161 + _2191;
    float _2195 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    float _2197 = fma(_2189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    float _2199 = fma(_2193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    bool _2201 = !_2159;
    if (!_2201)
    {
        float _2203 = -_1290;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2207 = -_1292;
        float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2211 = -_1294;
        float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2215 = _2205 * _2205;
        float _2217 = fma(_2209, _2209, _2215);
        float _2219 = fma(_2213, _2213, _2217);
        float _2221 = rsqrt(_2219);
        float _2223 = _2205 * _2221;
        float _2225 = _2209 * _2221;
        float _2227 = _2213 * _2221;
        float _2229 = -_1328;
        float _2231 = _2229 + _2223;
        float _2233 = -_1324;
        float _2235 = _2233 + _2225;
        float _2237 = -_1326;
        float _2239 = _2237 + _2227;
        float _2241 = sqrt(_2219);
        float _2243 = _2231 * _2231;
        float _2245 = fma(_2235, _2235, _2243);
        float _2247 = fma(_2239, _2239, _2245);
        float _2249 = rsqrt(_2247);
        float _2251 = -_2241;
        float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2255 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = abs(_2257);
        float _2261 = log2(_2259);
        float _2263 = _2231 * _2249;
        float _2265 = _2235 * _2249;
        float _2267 = _2239 * _2249;
        float _2269 = _1114 * _2263;
        float _2271 = _1114 * _2223;
        float _2273 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = fma(_1084, _2265, _2269);
        float _2279 = fma(_1084, _2225, _2271);
        float _2281 = _2275 * _2275;
        float _2283 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2285 = fma(_1116, _2267, _2277);
        float _2287 = precise::clamp(_2285, 0.0, 1.0);
        float _2289 = fma(_1116, _2227, _2279);
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = _2281 + (-1.0);
        float _2295 = _2287 * _2287;
        float _2297 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2299 = exp2(_2283);
        float _2301 = fma(_2295, _2293, 1.0);
        float _2303 = -_2223;
        float _2305 = -_2297;
        float _2307 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2305);
        float _2309 = _2301 * _2301;
        float _2311 = -_2227;
        float _2313 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2307);
        float _2315 = 1.0 / _2309;
        float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2319 = _2313 + _2317;
        float _2321 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2323 = precise::clamp(_2321, 0.0, 1.0);
        float _2325 = _2299 * _2323;
        float _2327 = _2291 * _2325;
        float _2329 = _2281 * _2315;
        float _2331 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2333 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2335 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2337 = _2327 * _2329;
        float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2331;
        out.m_90.y = _2333;
        out.m_90.z = _2335;
        out.m_92.x = _2339;
        out.m_92.y = _2341;
        out.m_92.z = _2343;
    }
    out.m_94.x = _2195;
    out.m_94.y = _2197;
    out.m_94.z = _2199;
    if (!_2181)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2345 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2345;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2037 = false;
    bool _1170 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2402 = as_type<float>(_129);
        out.gl_Position.z = _2402;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2472 = as_type<float>(_167);
        out.gl_Position.z = _2472;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = _169 * _169;
    float _189 = _171 * _171;
    float _191 = _173 * _173;
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _189);
    float _197 = fma(_179, _179, _191);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = sqrt(_199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _205 > 0.0;
    bool _213 = _207 > 0.0;
    float _215 = _207;
    float _217 = _205;
    float _219 = _199;
    if (_211)
    {
        float _221 = rsqrt(_199);
        _215 = _221;
    }
    float _223 = _215;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _225 = _217;
    bool _227 = _209 > 0.0;
    float _229 = _209;
    float _231 = _225;
    if (!_211)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (_213)
    {
        float _245 = rsqrt(_201);
        _241 = _245;
    }
    float _247 = _241;
    float _249 = 0.0;
    if (!_213)
    {
        _249 = 0.0;
    }
    float _251 = _249;
    float _253 = 0.0;
    float _255 = _251;
    if (!_213)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_213)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_203);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = _223;
    if (_211)
    {
        float _275 = _223 * _169;
        _237 = _275;
    }
    float _277 = _237;
    if (_211)
    {
        float _279 = _223 * _175;
        _231 = _279;
    }
    float _281 = _231;
    if (_211)
    {
        float _283 = _223 * _181;
        _243 = _283;
    }
    float _285 = _243;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_227)
    {
        _273 = 0.0;
    }
    float _289 = _273;
    float _291 = 0.0;
    float _293 = _289;
    if (!_227)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = _295;
    if (_213)
    {
        float _299 = _247 * _171;
        _255 = _299;
    }
    float _301 = _255;
    if (!_227)
    {
        _219 = 0.0;
    }
    float _303 = _219;
    float _305 = _303;
    if (_213)
    {
        float _307 = _247 * _177;
        _261 = _307;
    }
    float _309 = _261;
    if (_213)
    {
        float _311 = _247 * _183;
        _267 = _311;
    }
    float _313 = _267;
    if (_227)
    {
        float _315 = _271 * _173;
        _293 = _315;
    }
    float _317 = _293;
    float _319 = _317;
    if (_227)
    {
        float _321 = _271 * _179;
        _297 = _321;
    }
    float _323 = _297;
    if (_227)
    {
        float _325 = _271 * _185;
        _305 = _325;
    }
    float _327 = _305;
    bool _329 = !_287;
    float _331 = _327;
    float _349;
    if (!_329)
    {
        float _333 = in.m_61.x;
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _363 = log2(_361);
    float _365 = in.m_61.z;
    float _367 = in.m_61.x;
    bool _369 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(1.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _381 = 1.0 + _379;
    bool _383 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _391 = _387 || _389;
    float _393 = as_type<float>(int(gl_VertexIndex));
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = in.m_61.y;
    float _401 = 1.0 / _381;
    float _403 = _363 * _147;
    float _405 = in.m_59.w;
    float _407 = in.m_48.x;
    float _409 = in.m_48.y;
    float _411 = in.m_48.z;
    float _413 = exp2(_403);
    float _415 = _365 * 2.0;
    float _417 = 1.0 / _397;
    float _419 = _399 * 2.0;
    float _421 = floor(_415);
    float _423 = -_413;
    float _425 = _423 + 1.0;
    float _427 = _367 * 2.0;
    float _429 = _367 + _365;
    float _431 = _391 ? _425 : 0.0;
    float _433 = _177 * _409;
    float _435 = floor(_427);
    int _437 = as_type<int>(_393) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>(_393) & 2;
    bool _443 = _441 != 0;
    float _445 = _429 + (-1.0);
    float _447 = fma(_175, _407, _433);
    float _449 = _399 + _365;
    if (_377)
    {
        float _451 = _431 * _401;
        _149 = _451;
    }
    float _453 = _149;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _465 = _463 != 0;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _469 = _359 + _467;
    bool _471 = _421 > 0.0;
    float _473 = _449 + (-1.0);
    bool _475 = _421 >= 0.0;
    bool _477 = isnan(_421);
    bool _479 = _475 || _477;
    bool _481 = isnan(0.0);
    bool _483 = _479 || _481;
    float _485 = floor(_419);
    float _487 = _469 * _417;
    float _489 = _367 + _399;
    int _491 = _483 ? 0 : 1;
    float _493 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _495 = _435 > 0.0;
    float _497 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _499 = !_457;
    int _501 = _499 ? 0 : 1;
    float _503 = _489 + (-1.0);
    bool _505 = _435 >= 0.0;
    bool _507 = isnan(_435);
    bool _509 = _505 || _507;
    bool _511 = isnan(0.0);
    bool _513 = _509 || _511;
    float _515 = _365 + (-0.5);
    float _517 = in.m_66.x;
    float _519 = in.m_66.y;
    float _521 = in.m_66.z;
    int _523 = abs(_501);
    float _525 = _183 * _409;
    int _527 = ~_491;
    int _529 = _527 + 1;
    int _531 = _529 + 1;
    float _533 = fma(_179, _411, _447);
    int _535 = _531;
    if (!_471)
    {
        int _537 = ~_491;
        int _539 = _537 + 1;
        _535 = _539;
    }
    int _541 = _535;
    bool _543 = _485 > 0.0;
    float _545 = float(_523);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _549 = float(_541);
    int _551 = _513 ? 0 : 1;
    bool _553 = _485 >= 0.0;
    bool _555 = isnan(_485);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = _545 * _549;
    bool _565 = !_465;
    int _567 = _565 ? 0 : 1;
    int _569 = _561 ? 0 : 1;
    int _571 = ~_551;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    int _577 = abs(_567);
    int _579 = _575;
    if (!_495)
    {
        int _581 = ~_551;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = _563 * (-2.0);
    int _589 = ~_569;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = _367 + (-0.5);
    int _597 = _593;
    if (!_543)
    {
        int _599 = ~_569;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    float _605 = fma(_587, _517, _517);
    float _607 = fma(_547, _587, _547);
    float _609 = float(_577);
    float _611 = float(_603);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _605);
    bool _615 = !_461;
    int _617 = _615 ? 0 : 1;
    float _619 = _609 * _611;
    float _621 = fma(_607, _453, _613);
    int _623 = abs(_617);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = float(_585);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _631;
    float _635 = _619 * (-2.0);
    float _637 = float(_623);
    float _639 = _621 * 0.15915493667125701904296875;
    float _641 = fma(_627, _487, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _643 = fma(_635, _521, _521);
    float _645 = fma(_497, _635, _497);
    float _647 = _637 * _629;
    float _649 = fma(_633, _487, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _651 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[196].z, _643);
    float _653 = _399 + (-0.5);
    float _655 = _647 * (-2.0);
    bool _657 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _659 = isnan(_359);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = fma(_645, _453, _651);
    bool _671 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_359);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = in.m_68.x;
    float _685 = in.m_68.y;
    float _687 = fma(_655, _519, _519);
    float _689 = fma(_493, _655, _493);
    float _691 = _669 * 0.15915493667125701904296875;
    float _693 = -_681;
    float _695 = _693 + 1.0;
    float _697 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _687);
    float _699 = _639 * 6.283185482025146484375;
    float _701 = sin(_699);
    float _703 = in.m_57.w;
    float _705 = _667 * _695;
    float _707 = -_667;
    float _709 = _707 + 1.0;
    float _711 = fma(_689, _453, _697);
    float _713 = _641 * _705;
    float _715 = _649 * _705;
    float _717 = _711 * 0.15915493667125701904296875;
    float _719 = _639 * 6.283185482025146484375;
    float _721 = cos(_719);
    float _723 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].x, _713);
    float _725 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].y, _715);
    bool _727 = !_443;
    float _729 = _727 ? (-0.5) : 0.5;
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].x, _723);
    float _733 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].y, _725);
    bool _735 = !_439;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = _691 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = _731 * _683;
    float _745 = _733 * _685;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _729);
    float _749 = fma(_181, _407, _525);
    float _751 = _743 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _755 = _367 > 0.5;
    float _757 = _691 * 6.283185482025146484375;
    float _759 = cos(_757);
    float _761 = fma(_185, _411, _749);
    float _763 = _753 * _747;
    float _765 = _533 + _703;
    bool _767 = _399 > 0.5;
    float _769 = _761 + _405;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = _729 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _777 = _717 * 6.283185482025146484375;
    float _779 = cos(_777);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _783 = _701 * _741;
    float _785 = _721 * _741;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _789 = _787 != 0;
    float _791 = _751 * _781;
    float _793 = -_729;
    int _795 = _767 ? as_type<int>(_793) : as_type<int>(_729);
    float _797 = _717 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = _721 * _759;
    float _803 = _701 * _759;
    bool _805 = !_789;
    float _807 = _805 ? _729 : as_type<float>(_795);
    float _809 = _779 * _741;
    float _811 = _779 * _759;
    float _813 = _701 * _779;
    float _815 = _721 * _779;
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = _813 * _775;
    float _821 = fma(_799, _783, _801);
    float _823 = fma(_799, _801, _783);
    float _825 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _827 = -_785;
    float _829 = fma(_799, _803, _827);
    float _831 = _821 * _763;
    float _833 = -_803;
    float _835 = fma(_799, _785, _833);
    float _837 = _825 * _367;
    float _839 = _829 * _763;
    float _841 = fma(_809, _791, _831);
    float _843 = _813 * _763;
    float _845 = in.m_70.y;
    float _847 = fma(_811, _791, _839);
    float _849 = trunc(_837);
    int _851 = int(_849);
    float _853 = fma(_835, _817, _841);
    float _855 = -_799;
    float _857 = fma(_855, _791, _843);
    float _859 = fma(_823, _817, _847);
    float _861 = -_737;
    int _863 = _755 ? as_type<int>(_861) : as_type<int>(_737);
    float _865 = _853 * _309;
    float _867 = _853 * _313;
    float _869 = fma(_815, _817, _857);
    float _871 = _829 * _775;
    float _873 = fma(_859, _281, _865);
    float _875 = fma(_859, _285, _867);
    float _877 = _853 * _301;
    float _879 = _821 * _775;
    float _881 = fma(_869, _323, _873);
    float _883 = fma(_869, _327, _875);
    float _885 = fma(_859, _277, _877);
    int _887 = _851 << 4;
    int _889 = _887 + 1712;
    float _891 = _765 + _881;
    float _893 = _769 + _883;
    float _895 = fma(_869, _317, _885);
    int _897 = _889 + 8;
    uint _900 = uint(int(uint(_897) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[int(_902)][_904];
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _910 = _891 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _914 = _893 + _912;
    float _916 = _409 + _845;
    bool _918 = !_773;
    float _920 = _918 ? _737 : as_type<float>(_863);
    float _922 = _910 * _910;
    float _924 = _914 * _914;
    float _926 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _928 = uint(int(uint(_889) >> uint(2)));
    uint _930 = uint(int(uint(int(_928)) >> uint(2)));
    int _932 = int(_928) & 3;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[int(_930)][_932];
    int _936 = int(_928) + 1;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    int _940 = _936 & 3;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[int(_938)][_940];
    float _944 = _916 + _895;
    float _946 = _922 + _924;
    float _948 = fma(_809, _926, _879);
    float _950 = -_799;
    float _952 = fma(_950, _926, _819);
    float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _956 = fma(_811, _926, _871);
    float _958 = _835 + _948;
    float _960 = _815 + _952;
    float _962 = _823 + _956;
    float _964 = sqrt(_946);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = _879;
    float _970 = _922;
    float _972 = _924;
    float _974 = _893;
    float _976 = _891;
    float _978 = _835;
    float _980 = _910;
    if (!_966)
    {
        _968 = _944;
    }
    float _982 = _968;
    bool _984 = !_966;
    float _986 = _982;
    if (!_984)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _964 + _990;
        float _994 = rsqrt(_946);
        float _996 = _992 * _988;
        float _998 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1000 = _996 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _994 * _1010;
        float _1014 = fma(_910, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = _1008 + (-1.0);
        float _1018 = fma(_914, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1022 = _1014 + _1020;
        float _1024 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1028 = _1018 + _1026;
        float _1030 = _1022 * _1022;
        float _1032 = fma(_944, _1008, _1024);
        float _1034 = _1028 * _1028;
        _986 = _1032;
        _970 = _1030;
        _972 = _1034;
        _974 = _1018;
        _976 = _1014;
        _978 = _1000;
    }
    float _1036 = _986;
    float _1038 = _970;
    float _1040 = _972;
    float _1042 = _974;
    float _1044 = _976;
    float _1046 = _978;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1050 = _1036 + _1048;
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1054 = _958 * _309;
    float _1056 = _958 * _301;
    float _1058 = fma(_1050, _1050, _1038);
    float _1060 = _920 + 0.5;
    float _1062 = _958 * _313;
    float _1064 = fma(_962, _277, _1056);
    float _1066 = _1058 + _1040;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1070 = fma(_962, _285, _1062);
    float _1072 = fma(_962, _281, _1054);
    float _1074 = -_807;
    float _1076 = _1074 + 0.5;
    float _1078 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1080 = _1068 * _954;
    float _1082 = sqrt(_1066);
    float _1084 = fma(_960, _323, _1072);
    float _1086 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1090 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * _1052;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = fma(_960, _317, _1064);
    float _1116 = fma(_960, _327, _1070);
    out.m_72.x = _1104;
    out.m_72.y = _1106;
    out.m_72.z = _1108;
    bool _1118 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1120 = isnan(_1082);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1126 = _1122 || _1124;
    out.m_74.x = _1110;
    out.m_74.y = _1112;
    out.m_74.z = _1100;
    out.m_74.w = _1098;
    out.m_76.x = _1080;
    out.m_76.y = _1102;
    out.m_78.x = _1084;
    out.m_78.y = _1114;
    out.m_78.z = _1116;
    float _1128 = _1102;
    float _1130 = _1088;
    float _1132 = _1050;
    float _1134 = _1046;
    if (!_1126)
    {
        _331 = 1.0;
    }
    float _1136 = _331;
    bool _1138 = !_1126;
    float _1140 = _1136;
    if (!_1138)
    {
        bool _1142 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1144 = isnan(_1082);
        bool _1146 = _1142 || _1144;
        bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1150 = _1146 || _1148;
        if (!_1150)
        {
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = _1082 + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1158 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1156;
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1162 = _1160 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1164 = 1.0 / _1158;
            float _1166 = _1154 * _1164;
            float _1168 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1140 = _1168;
            _1170 = true;
        }
        else
        {
            bool _1172 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1174 = isnan(_1082);
            bool _1176 = _1172 || _1174;
            bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1180 = _1176 || _1178;
            if (!_1180)
            {
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1082 + _1182;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1194 = 1.0 / _1188;
                float _1196 = _1184 * _1194;
                float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1140 = _1198;
                _1170 = true;
            }
            else
            {
                _1140 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1170 = false;
    float _1200 = _1140;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1036 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1042 + _1206;
    bool _1210 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1222 = _1044 + _1220;
    float _1224 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1226 = fma(_1208, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1228 = fma(_1222, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1230 = _1204;
    float _1232 = _1224;
    float _1234 = _1226;
    if (_1218)
    {
        _1230 = _1228;
    }
    float _1236 = _1230;
    float _1238 = _1236;
    if (!_1218)
    {
        float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1242 = _916 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1246 = _765 + _1244;
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = -_916;
        float _1252 = _1250 + _1224;
        float _1254 = _1242 * _1242;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1258 = _769 + _1256;
        float _1260 = fma(_1246, _1246, _1254);
        float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1264 = fma(_1258, _1258, _1260);
        float _1266 = sqrt(_1264);
        float _1268 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1270 = precise::min(_1266, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1272 = _1270 * _1262;
        float _1274 = -_765;
        float _1276 = _1274 + _1228;
        float _1278 = _1268 * _1272;
        float _1280 = -_769;
        float _1282 = _1280 + _1226;
        float _1284 = fma(_1276, _1278, _765);
        float _1286 = fma(_1252, _1278, _916);
        float _1288 = fma(_1282, _1278, _769);
        _1232 = _1286;
        _1238 = _1284;
        _1234 = _1288;
        _1128 = _1282;
        _319 = _1248;
    }
    float _1290 = _1232;
    float _1292 = _1238;
    float _1294 = _1234;
    float _1296 = _1128;
    float _1298 = _319;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1306 = _1292 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1294 + _1308;
    float _1312 = _1302 * _1302;
    float _1314 = fma(_1306, _1306, _1312);
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1318 = fma(_1310, _1310, _1314);
    float _1320 = rsqrt(_1318);
    float _1322 = sqrt(_1318);
    float _1324 = _1306 * _1320;
    float _1326 = _1310 * _1320;
    float _1328 = _1302 * _1320;
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1334 = _1330 * _1330;
    float _1336 = _1332 * _1332;
    float _1338 = _1334 + _1336;
    float _1340 = sqrt(_1338);
    bool _1342 = _1340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = _1340 + _1344;
    float _1348 = _1296;
    float _1350 = _1338;
    float _1352 = _1346;
    float _1354 = _1310;
    if (_1342)
    {
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1348 = _1356;
    }
    float _1358 = _1348;
    if (_1342)
    {
        float _1360 = rsqrt(_1338);
        _1350 = _1360;
    }
    float _1362 = _1350;
    float _1364 = _1362;
    if (_1342)
    {
        float _1366 = _1346 * _1358;
        _1352 = _1366;
    }
    float _1368 = _1352;
    float _1370 = fma(_765, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1342)
    {
        float _1372 = _1368 * 0.15915493667125701904296875;
        _1130 = _1372;
    }
    float _1374 = _1130;
    float _1376 = floor(_1370);
    float _1378 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1380 = _1298;
    float _1382 = _1374;
    if (_1342)
    {
        float _1384 = _1374 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        _1380 = _1386;
    }
    float _1388 = _1380;
    float _1390 = precise::max(0.0, _1378);
    float _1392 = -_1328;
    float _1394 = -_1390;
    float _1396 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1394);
    float _1398 = _960;
    float _1400 = _1390;
    if (_1342)
    {
        float _1402 = _1374 * 6.283185482025146484375;
        float _1404 = cos(_1402);
        _1398 = _1404;
    }
    float _1406 = _1398;
    if (_1342)
    {
        float _1408 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1400 = _1408;
    }
    float _1410 = _1400;
    float _1412 = _1388;
    float _1414 = _1410;
    if (_1342)
    {
        float _1416 = fma(_1388, _1410, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1132 = _1416;
    }
    float _1418 = _1132;
    float _1420 = _1418;
    if (!_1342)
    {
        _1412 = _1330;
    }
    float _1422 = _1412;
    float _1424 = _1422;
    if (!_1342)
    {
        _1382 = _1332;
    }
    float _1426 = _1382;
    float _1428 = _1426;
    if (_1342)
    {
        float _1430 = _1362 * _1418;
        _980 = _1430;
    }
    float _1432 = _980;
    if (!_1342)
    {
        _1420 = _1396;
    }
    float _1434 = _1420;
    float _1436 = _1434;
    if (!_1342)
    {
        _1364 = _1334;
    }
    float _1438 = _1364;
    float _1440 = _1438;
    if (_1342)
    {
        float _1442 = _1406 + (-1.0);
        _1414 = _1442;
    }
    float _1444 = _1414;
    float _1446 = _1444;
    if (_1342)
    {
        float _1448 = _1330 * _1432;
        _1424 = _1448;
    }
    float _1450 = _1424;
    if (_1342)
    {
        float _1452 = _1332 * _1432;
        _1428 = _1452;
    }
    float _1454 = _1428;
    if (_1342)
    {
        float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1134 = _1456;
    }
    float _1458 = _1134;
    if (_1342)
    {
        float _1460 = _1450 * _1450;
        _1440 = _1460;
    }
    float _1462 = _1440;
    if (!_1342)
    {
        _1446 = _1336;
    }
    float _1464 = _1446;
    float _1466 = _1464;
    if (_1342)
    {
        float _1468 = _1454 * _1454;
        _1466 = _1468;
    }
    float _1470 = _1466;
    if (_1342)
    {
        float _1472 = fma(_1396, _1406, _1458);
        _1436 = _1472;
    }
    float _1474 = _1436;
    float _1476 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1480 = fma(_1474, _1474, _1462);
    float _1482 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1484 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1488 = _1480 + _1470;
    float _1490 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1492 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1494 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1498 = fma(_1322, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1496);
    float _1500 = precise::clamp(_1498, 0.0, 1.0);
    float _1502 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1490);
    float _1504 = rsqrt(_1488);
    float _1506 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1510 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1502);
    float _1512 = -_1500;
    float _1514 = _1512 + 1.0;
    float _1516 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1518 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1478);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1522 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1524 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1526 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1518);
    float _1528 = abs(_1514);
    float _1530 = log2(_1528);
    float _1532 = -_1522;
    float _1534 = fma(_1532, _1316, 1.0);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1524);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = _1504 * _1450;
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1536);
    float _1544 = _1504 * _1474;
    float _1546 = _1504 * _1454;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1542);
    float _1552 = floor(_1482);
    float _1554 = -_1548;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1560 = -_1546;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1564 = -_1376;
    float _1566 = _1370 + _1564;
    float _1568 = 1.0 / _1550;
    float _1570 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1562, -0.5, 0.5);
    float _1574 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1576 = fma(_1562, 0.5, 0.5);
    float _1578 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1580 = exp2(_1558);
    float _1582 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1574);
    float _1584 = -_1552;
    float _1586 = _1482 + _1584;
    float _1588 = _1544 + 1.0;
    float _1590 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1592 = sqrt(_1572);
    float _1594 = fma(_1576, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1596 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1598 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1590);
    float _1600 = fma(_1576, _1594, -0.212114393711090087890625);
    float _1602 = log2(_1534);
    float _1604 = -_1544;
    float _1606 = fma(_1580, _1588, _1604);
    float _1608 = fma(_1576, _1600, 1.570728778839111328125);
    float _1610 = _1598 * _1568;
    float2 _4711 = float2(_1566, _1586);
    float _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4711, float2(0.0), isnan(_4711)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4711, float2(0.0), isnan(_4711)), level(0.0)).x;
    float _1614 = fma(_1610, -0.5, 0.5);
    float _1616 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1596);
    float _1618 = _1592 * 0.636619746685028076171875;
    float _1620 = _1616 * _1568;
    float _1622 = _1602 * 0.693147182464599609375;
    float _1624 = fma(_1620, 0.5, 0.5);
    float _1626 = -_1608;
    float _1628 = fma(_1618, _1626, 1.0);
    float _1630 = fma(_1606, 0.5, 0.5);
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4751 = float3(_1624, _1614, _1632);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4751, float3(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4751, float3(0.0), isnan(_4751)), level(0.0)).x;
    float3 _4762 = float3(_1624, _1614, _1632);
    float4 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4762, float3(0.0), isnan(_4762)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4762, float3(0.0), isnan(_4762)), level(0.0)).xyzw;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = _1637.w;
    float2 _4778 = float2(_1628, _1630);
    float3 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4778, float2(0.0), isnan(_4778)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4778, float2(0.0), isnan(_4778)), level(0.0)).xyz;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1659 = _916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1661 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1663 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1665 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1657);
    float _1667 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1659);
    float _1669 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1661);
    float _1671 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1665);
    float _1673 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1667);
    float _1675 = exp2(_1663);
    float _1677 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1679 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_80.x = _1306;
    out.m_80.y = _1302;
    out.m_80.z = _1310;
    float _1681 = _1679 + _1677;
    float _1683 = 1.0 / _1677;
    bool _1685 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.5);
    bool _1693 = _1689 || _1691;
    float _1695 = _1681 * _1683;
    float _1697 = _1695 * 0.5;
    float _1699 = _1538;
    float _1701 = _1550;
    if (_1693)
    {
        _1354 = 1.0;
    }
    float _1703 = _1354;
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1705);
    float _1709 = 1.0 / _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1713 = _1709 * _1711;
    float _1715 = abs(_1713);
    float _1717 = log2(_1715);
    float _1719 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1721 = exp2(_1719);
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1725 = precise::clamp(_1723, 0.0, 1.0);
    float _1727 = fma(_1725, -2.0, 3.0);
    float _1729 = _1725 * _1725;
    float _1731 = in.m_70.x;
    float _1733 = _1729 * _1727;
    float _1735 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1669);
    bool _1737 = _1713 <= 8000.0;
    bool _1739 = isnan(_1713);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = -_1733;
    float _1751 = _1749 + 1.0;
    float _1753 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1735);
    float _1755 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1733);
    float _1757 = _1753 + _1550;
    float _1759 = _1703;
    if (_1693)
    {
        _1699 = 1.0;
    }
    float _1761 = _1699;
    float _1763 = _1757 * 0.5;
    float _1765 = _1761;
    float _1767 = _1653;
    float _1769 = _1651;
    float _1771 = _1763;
    float _1773 = _1731;
    if (!_1693)
    {
        float _1775 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = _1775 * 0.15915493667125701904296875;
        float _1783 = _1781 * 6.283185482025146484375;
        float _1785 = cos(_1783);
        float _1787 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1781 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = 1.0 / _1785;
        float _1797 = _1789 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = _1793 * _1795;
        float _1803 = _1789 * 6.283185482025146484375;
        float _1805 = sin(_1803);
        float _1807 = _1799 * _1801;
        float _1809 = 1.0 / _1779;
        float _1811 = 1.0 / _1807;
        float _1813 = _1805 * _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = fma(_1713, _1813, _1815);
        float _1819 = _1817 * _1809;
        float _1821 = precise::clamp(_1819, 0.0, 1.0);
        _1765 = _1821;
    }
    float _1823 = _1765;
    if (!_1693)
    {
        float _1825 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1827 = _1825 * 0.15915493667125701904296875;
        float _1829 = _1827 * 6.283185482025146484375;
        float _1831 = cos(_1829);
        float _1833 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1835 = _1833 * 0.15915493667125701904296875;
        float _1837 = _1827 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        float _1841 = 1.0 / _1831;
        float _1843 = _1835 * 6.283185482025146484375;
        float _1845 = cos(_1843);
        float _1847 = _1839 * _1841;
        float _1849 = _1835 * 6.283185482025146484375;
        float _1851 = sin(_1849);
        float _1853 = _1845 * _1847;
        float _1855 = 1.0 / _1853;
        float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1859 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1857;
        float _1861 = 1.0 / _1859;
        float _1863 = _1851 * _1855;
        float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1867 = fma(_1713, _1863, _1865);
        float _1869 = _1867 * _1861;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        float _1873 = -_1871;
        float _1875 = _1873 + 1.0;
        _1759 = _1875;
    }
    float _1877 = _1759;
    float _1879 = _1747 * _1755;
    float _1881 = -_1675;
    float _1883 = _1881 + 1.0;
    float _1885 = -_1612;
    float _1887 = _1885 + 1.0;
    out.gl_Position.x = _1616;
    out.gl_Position.y = _1598;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1550;
    float _1889 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _1292;
    out.m_82.y = _1290;
    out.m_82.z = _1294;
    float _1893 = _1887 * _1889;
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    bool _1897 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1899 = isnan(_1322);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1905 = _1901 || _1903;
    float _1907 = _1891 * _1634;
    float _1909 = -_1891;
    float _1911 = _1909 + 1.0;
    float _1913 = -_1895;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1917 = _1645 * _1907;
    out.m_84.z = _1763;
    out.m_84.w = _1550;
    float _1919 = _1915 * _1731;
    float _1921 = _1655 * _1907;
    float _1923 = fma(_1651, _1917, _1639);
    float _1925 = fma(_1653, _1917, _1641);
    float _1927 = _1645 * _1911;
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1931 = fma(_1645, _1921, _1643);
    float _1933 = _1823 * _1877;
    float _1935 = _1919;
    if (!_1905)
    {
        _1767 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1937 = _1767;
    out.m_86.x = _1929;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1905)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1943 = _1701;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1947 = _1943;
    float _1949 = _1943;
    if (!_1905)
    {
        _1769 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1951 = _1769;
    out.m_88.x = _1923;
    out.m_88.y = _1925;
    out.m_88.z = _1931;
    out.m_88.w = _1927;
    float _1953 = _1951;
    float _1955 = _1951;
    if (!_1905)
    {
        _1771 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1957 = _1771;
    float _1959 = _1957;
    float _1961 = _1957;
    if (!_1905)
    {
        _1773 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1963 = _1773;
    float _1965 = _1963;
    float _1967 = _1963;
    if (!_1905)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1969 = _1935;
    bool _1971 = !_1905;
    float _1973 = _1969;
    float _1975 = _1969;
    if (!_1971)
    {
        bool _1977 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1979 = isnan(_1322);
        bool _1981 = _1977 || _1979;
        bool _1983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1985 = _1981 || _1983;
        if (!_1985)
        {
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1989 = _1322 + _1987;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1993 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1991;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2003 = 1.0 / _1993;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2017 = _1989 * _2003;
            float _2019 = precise::clamp(_2017, 0.0, 1.0);
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2025 = fma(_2019, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2019, _2001, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2029 = fma(_2019, _2007, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2031 = fma(_2019, _2011, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2033 = fma(_2019, _2023, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2035 = fma(_2019, _2015, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1949 = _2025;
            _1967 = _2033;
            _1941 = _2027;
            _1961 = _2031;
            _1955 = _2029;
            _1975 = _2035;
            _2037 = true;
        }
        else
        {
            bool _2039 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2041 = isnan(_1322);
            bool _2043 = _2039 || _2041;
            bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2047 = _2043 || _2045;
            if (!_2047)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2049 = _1939;
            _1941 = _2049;
            if (!_2047)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2051 = _1947;
            _1949 = _2051;
            if (!_2047)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2053 = _1953;
            _1955 = _2053;
            if (!_2047)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2055 = _1959;
            _1961 = _2055;
            if (!_2047)
            {
                _1965 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2057 = _1965;
            _1967 = _2057;
            if (!_2047)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2059 = _1973;
            bool _2061 = !_2047;
            _1975 = _2059;
            if (!_2061)
            {
                bool _2063 = _1322 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2065 = isnan(_1322);
                bool _2067 = _2063 || _2065;
                bool _2069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2071 = _2067 || _2069;
                if (!_2071)
                {
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2075 = _1322 + _2073;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2079 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2077;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2089 = 1.0 / _2079;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2103 = _2075 * _2089;
                    float _2105 = precise::clamp(_2103, 0.0, 1.0);
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2111 = fma(_2105, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2105, _2087, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2115 = fma(_2105, _2093, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2117 = fma(_2105, _2097, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2119 = fma(_2105, _2109, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2121 = fma(_2105, _2101, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1949 = _2111;
                    _1967 = _2119;
                    _1941 = _2113;
                    _1961 = _2117;
                    _1955 = _2115;
                    _1975 = _2121;
                    _2037 = true;
                }
                else
                {
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1967 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2037 = false;
    float _2123 = _1949;
    float _2125 = _1967;
    float _2127 = _1941;
    float _2129 = _1961;
    float _2131 = _1955;
    float _2133 = _1975;
    float _2135 = fma(_1114, -0.5, 0.5);
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2123;
    float _2141 = _2139 + _2125;
    float _2143 = _1945 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = -_2127;
    float _2147 = _2145 + _2129;
    out.m_90.x = 0.0;
    float _2149 = fma(_2137, _2141, _2123);
    float _2151 = fma(_2137, _2147, _2127);
    out.m_51.x = _2143;
    float _2153 = -_2131;
    float _2155 = _2153 + _2133;
    float _2157 = _2149 * 0.586610972881317138671875;
    bool _2159 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2161 = fma(_2137, _2155, _2131);
    float _2163 = fma(_2151, 0.298911988735198974609375, _2157);
    bool _2165 = _1823 > 0.0;
    bool _2167 = isnan(_1823);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(0.0);
    bool _2173 = _2169 || _2171;
    out.m_92.x = 0.0;
    float _2175 = fma(_2161, 0.114477999508380889892578125, _2163);
    bool _2177 = _1877 <= 0.0;
    bool _2179 = !_2173;
    bool _2181 = _2177 || _2179;
    float _2183 = -_2175;
    float _2185 = _2151 + _2183;
    float _2187 = -_2175;
    float _2189 = _2149 + _2187;
    float _2191 = -_2175;
    float _2193 = _2161 + _2191;
    float _2195 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    float _2197 = fma(_2189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    float _2199 = fma(_2193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2175);
    bool _2201 = !_2159;
    if (!_2201)
    {
        float _2203 = -_1290;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2207 = -_1292;
        float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2211 = -_1294;
        float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2215 = _2205 * _2205;
        float _2217 = fma(_2209, _2209, _2215);
        float _2219 = fma(_2213, _2213, _2217);
        float _2221 = rsqrt(_2219);
        float _2223 = _2205 * _2221;
        float _2225 = _2209 * _2221;
        float _2227 = _2213 * _2221;
        float _2229 = -_1328;
        float _2231 = _2229 + _2223;
        float _2233 = -_1324;
        float _2235 = _2233 + _2225;
        float _2237 = -_1326;
        float _2239 = _2237 + _2227;
        float _2241 = sqrt(_2219);
        float _2243 = _2231 * _2231;
        float _2245 = fma(_2235, _2235, _2243);
        float _2247 = fma(_2239, _2239, _2245);
        float _2249 = rsqrt(_2247);
        float _2251 = -_2241;
        float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2255 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = abs(_2257);
        float _2261 = log2(_2259);
        float _2263 = _2231 * _2249;
        float _2265 = _2235 * _2249;
        float _2267 = _2239 * _2249;
        float _2269 = _1114 * _2263;
        float _2271 = _1114 * _2223;
        float _2273 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = fma(_1084, _2265, _2269);
        float _2279 = fma(_1084, _2225, _2271);
        float _2281 = _2275 * _2275;
        float _2283 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2285 = fma(_1116, _2267, _2277);
        float _2287 = precise::clamp(_2285, 0.0, 1.0);
        float _2289 = fma(_1116, _2227, _2279);
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = _2281 + (-1.0);
        float _2295 = _2287 * _2287;
        float _2297 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2299 = exp2(_2283);
        float _2301 = fma(_2295, _2293, 1.0);
        float _2303 = -_2223;
        float _2305 = -_2297;
        float _2307 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2305);
        float _2309 = _2301 * _2301;
        float _2311 = -_2227;
        float _2313 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2307);
        float _2315 = 1.0 / _2309;
        float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2319 = _2313 + _2317;
        float _2321 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2323 = precise::clamp(_2321, 0.0, 1.0);
        float _2325 = _2299 * _2323;
        float _2327 = _2291 * _2325;
        float _2329 = _2281 * _2315;
        float _2331 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2333 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2335 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2337 = _2327 * _2329;
        float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2331;
        out.m_90.y = _2333;
        out.m_90.z = _2335;
        out.m_92.x = _2339;
        out.m_92.y = _2341;
        out.m_92.z = _2343;
    }
    out.m_94.x = _2195;
    out.m_94.y = _2197;
    out.m_94.z = _2199;
    if (!_2181)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2345 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2345;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

