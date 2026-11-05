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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_76 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3205 = false;
    bool _2004 = false;
    bool _1992 = false;
    bool _627 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3364 = as_type<float>(_115);
        out.gl_Position.z = _3364;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3434 = as_type<float>(_153);
        out.gl_Position.z = _3434;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_57.x;
    float _179 = in.m_57.y;
    float _181 = in.m_57.z;
    float _183 = in.m_59.w;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = _155 * _155;
    float _193 = _157 * _157;
    float _195 = fma(_161, _161, _191);
    float _197 = fma(_163, _163, _193);
    float _199 = fma(_177, _177, _195);
    float _201 = _159 * _159;
    float _203 = fma(_179, _179, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_165, _165, _201);
    float _209 = fma(_181, _181, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = 0.0;
    float _221 = _203;
    float _223 = _199;
    float _225 = _181;
    float _227 = _179;
    float _229 = _163;
    float _231 = _165;
    if (_215)
    {
        float _233 = rsqrt(_199);
        _219 = _233;
    }
    float _235 = _219;
    float _237 = 0.0;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _213 > 0.0;
    float _243 = in.m_51.x;
    float _245 = in.m_51.y;
    float _247 = in.m_51.z;
    float _249 = 0.0;
    float _251 = _239;
    if (!_215)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = 0.0;
    float _259 = _253;
    if (!_217)
    {
        _255 = 0.0;
        _257 = 0.0;
    }
    float _261 = _255;
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _261;
    float _269 = _263;
    if (_217)
    {
        float _271 = rsqrt(_203);
        _265 = _271;
    }
    float _273 = _265;
    float _275 = 0.0;
    if (!_215)
    {
        _275 = 0.0;
    }
    float _277 = _275;
    float _279 = 0.0;
    float _281 = _277;
    if (_241)
    {
        float _283 = rsqrt(_209);
        _279 = _283;
    }
    float _285 = _279;
    if (_215)
    {
        float _287 = _235 * _161;
        _251 = _287;
    }
    float _289 = _251;
    float _291 = _289;
    float _293 = _289;
    if (_215)
    {
        float _295 = _235 * _155;
        _259 = _295;
    }
    float _297 = _259;
    if (_215)
    {
        float _299 = _235 * _177;
        _281 = _299;
    }
    float _301 = _281;
    float _303 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _305 = 0.0;
    float _307 = 0.0;
    float _309 = _303;
    if (!_241)
    {
        _305 = 0.0;
        _307 = 0.0;
    }
    float _311 = _305;
    float _313 = _307;
    float _315 = _313;
    float _317 = _311;
    if (!_217)
    {
        _221 = 0.0;
    }
    float _319 = _221;
    float _321 = _319;
    if (!_175)
    {
        float _323 = _303 * _303;
        float _325 = _323 * 0.5;
        _223 = _325;
    }
    float _327 = _223;
    float _329 = 0.0;
    float _331 = _327;
    if (!_241)
    {
        _329 = 0.0;
    }
    float _333 = _329;
    float _335 = _333;
    if (_217)
    {
        float _337 = _273 * _163;
        _321 = _337;
    }
    float _339 = _321;
    if (_217)
    {
        float _341 = _273 * _157;
        _267 = _341;
    }
    float _343 = _267;
    if (_217)
    {
        float _345 = _273 * _179;
        _269 = _345;
    }
    float _347 = _269;
    if (!_175)
    {
        float _349 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _349;
    }
    float _351 = _331;
    float _353 = _351;
    if (_241)
    {
        float _355 = _285 * _165;
        _315 = _355;
    }
    float _357 = _315;
    if (_241)
    {
        float _359 = _285 * _159;
        _317 = _359;
    }
    float _361 = _317;
    if (_241)
    {
        float _363 = _285 * _181;
        _335 = _363;
    }
    float _365 = _335;
    bool _367 = !_175;
    if (!_367)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = _303 * _371;
        float _381 = 1.0 / _375;
        float _383 = _377 * 0.693147182464599609375;
        float _385 = exp2(_379);
        float _387 = 1.0 / _383;
        float _389 = _385 + (-1.0);
        float _391 = -_389;
        float _393 = fma(_391, _387, _303);
        float _395 = _393 * _381;
        float _397 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _353 = _397;
    }
    float _399 = _353;
    float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _403 = !_175;
    float _405 = _401;
    float _407 = _399;
    if (!_403)
    {
        float _409 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _411 = log2(_409);
        float _413 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _415 = _413 + 1.0;
        float _417 = 1.0 / _415;
        float _419 = _303 * _411;
        float _421 = exp2(_419);
        float _423 = -_421;
        float _425 = _423 + 1.0;
        float _427 = _425 * _417;
        _309 = _427;
    }
    float _429 = _309;
    float _431 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _433 = _401 * _297;
    float _435 = _401 * _343;
    float _437 = _401 * _361;
    float _439 = _429;
    if (!_175)
    {
        float _441 = _133 * _133;
        float _443 = _441 * 0.5;
        _405 = _443;
    }
    float _445 = _405;
    float _447 = fma(_431, _289, _433);
    float _449 = fma(_431, _339, _435);
    float _451 = fma(_431, _357, _437);
    float _453 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_175)
    {
        float _455 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _407 = _455;
    }
    float _457 = _407;
    bool _459 = !_175;
    float _461 = _457;
    if (!_459)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = _133 * _465;
        float _475 = 1.0 / _469;
        float _477 = _471 * 0.693147182464599609375;
        float _479 = exp2(_473);
        float _481 = 1.0 / _477;
        float _483 = _479 + (-1.0);
        float _485 = -_483;
        float _487 = fma(_485, _481, _133);
        float _489 = _487 * _475;
        float _491 = _489 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _491;
    }
    float _493 = _461;
    float _495 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _497 = fma(_453, _301, _447);
    float _499 = fma(_453, _347, _449);
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _503 = _495 * _297;
    float _505 = _495 * _343;
    float _507 = _495 * _361;
    float _509 = fma(_453, _365, _451);
    float _511 = fma(_501, _289, _503);
    float _513 = fma(_501, _339, _505);
    float _515 = fma(_501, _357, _507);
    float _517 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _519 = fma(_429, _243, _497);
    float _521 = fma(_429, _245, _499);
    float _523 = fma(_429, _247, _509);
    float _525 = fma(_517, _301, _511);
    float _527 = fma(_517, _347, _513);
    float _529 = fma(_517, _365, _515);
    if (!_175)
    {
        _439 = _133;
    }
    float _531 = _439;
    bool _533 = !_175;
    float _535 = _531;
    if (!_533)
    {
        float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _539 = log2(_537);
        float _541 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _543 = _541 + 1.0;
        float _545 = 1.0 / _543;
        float _547 = _133 * _539;
        float _549 = exp2(_547);
        float _551 = -_549;
        float _553 = _551 + 1.0;
        float _555 = _553 * _545;
        _535 = _555;
    }
    float _557 = _535;
    float _559 = fma(_557, _245, _527);
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _563 = fma(_557, _243, _525);
    float _565 = fma(_521, _183, _187);
    float _567 = -_559;
    float _569 = _521 + _567;
    float _571 = fma(_557, _247, _529);
    float _573 = fma(_519, _183, _185);
    float _575 = -_563;
    float _577 = _519 + _575;
    float _579 = _569 * _163;
    float _581 = _569 * _157;
    float _583 = _569 * _179;
    float _585 = -_571;
    float _587 = _523 + _585;
    float _589 = fma(_577, _161, _579);
    float _591 = fma(_577, _155, _581);
    float _593 = fma(_577, _177, _583);
    float _595 = fma(_523, _183, _189);
    float _597 = fma(_587, _165, _589);
    float _599 = fma(_587, _159, _591);
    float _601 = fma(_587, _181, _593);
    bool _603 = !_561;
    float _623;
    float _625;
    if (!_603)
    {
        float _605 = in.m_61.x;
        float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _609 = float(_99);
        float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _615 = _613 * _607;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = _609;
        _627 = true;
    }
    else
    {
        float _629 = float(_99);
        float _631 = 1.0 / _629;
        float _633 = _133 * _631;
        _623 = _633;
        _625 = _629;
    }
    _627 = false;
    float _635 = _623;
    float _637 = _625;
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _641 = int(_639);
    float _643 = in.m_61.x;
    float _645 = in.m_61.y;
    float _647 = _565 * _157;
    float _649 = as_type<float>(int(gl_VertexIndex));
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _653 = _651 != 0;
    float _655 = fma(_573, _155, _647);
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _659 = int(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _635 + _661;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _675 = _673 != 0;
    float _677 = fma(_595, _159, _655);
    float _679 = in.m_57.w;
    float _681 = 1.0 / _637;
    float _683 = float(_641);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _689 = _687 != 0;
    float _691 = in.m_53.w;
    bool _693 = !_671;
    int _695 = _693 ? 0 : 1;
    bool _697 = !_667;
    int _699 = _697 ? 0 : 1;
    float _701 = 1.0 / _683;
    float _703 = float(uint(_659));
    float _705 = _643 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    float _711 = _645 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _715 = _713 != 0;
    float _717 = -_685;
    float _719 = fma(_705, 2.0, _717);
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _723 = _721 != 0;
    float _725 = 1.0 / _703;
    float _727 = _565 * _179;
    bool _729 = !_653;
    float _731 = _729 ? 7.345489978790283203125 : 1.0;
    float _733 = _643 * 2.0;
    bool _735 = !_689;
    int _737 = _735 ? 0 : 1;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _741 = as_type<int>(_649) & 1;
    bool _743 = _741 != 0;
    int _745 = as_type<int>(_649) & 2;
    bool _747 = _745 != 0;
    float _749 = _133 * _701;
    float _751 = _565 * _163;
    float _753 = fma(_711, -2.0, _739);
    float _755 = floor(_733);
    float _757 = fma(_573, _161, _751);
    float _759 = fma(_573, _177, _727);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _761;
    int _765 = as_type<int>(_725) + (-2);
    float _767 = fma(_595, _165, _757);
    float _769 = fma(_595, _181, _759);
    float _771 = trunc(_749);
    int _773 = int(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _789 = 1.0 / _763;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _795 = float(uint(_773));
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = 1.0 / _777;
    float _805 = as_type<float>(_765) * _795;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _811 = ~_659;
    int _813 = _811 + 1;
    float _815 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = trunc(_805);
    float _823 = precise::max(_821, 0.0);
    uint _826 = uint(_823);
    float _828 = in.m_61.z;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _832 = _635 + _830;
    float _834 = float(_659);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _838 = _635 + _836;
    out.m_66.x = _797;
    out.m_66.y = _799;
    out.m_66.z = _801;
    out.m_66.w = _793;
    float _840 = _832 * _789;
    int _842 = ~_659;
    int _844 = _842 + 1;
    float _846 = 1.0 / _781;
    out.m_68.x = _815;
    out.m_68.y = _817;
    out.m_68.z = _819;
    float _848 = _133 * _834;
    float _850 = _663 * _803;
    bool _852 = !_723;
    int _854 = _852 ? 0 : 1;
    float _856 = _769 + _679;
    bool _858 = _755 > 0.0;
    float _860 = _848 * _681;
    float _862 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _753);
    int _864 = _813 * int(_826);
    int _866 = _864 + _773;
    float _868 = _645 * 2.0;
    float _870 = trunc(_860);
    int _872 = int(_870);
    bool _874 = !_675;
    int _876 = _874 ? 0 : 1;
    float _878 = _838 * _846;
    float _880 = float(uint(_866));
    float _882 = _645 + _643;
    bool _884 = !_743;
    float _886 = _884 ? (-0.5) : 0.5;
    float _888 = _828 + _643;
    bool _890 = _755 >= 0.0;
    bool _892 = isnan(_755);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = floor(_868);
    float _902 = as_type<float>(_765) * _880;
    float _904 = _882 + (-1.0);
    bool _906 = !_747;
    float _908 = _906 ? (-0.5) : 0.5;
    float _910 = _888 + (-1.0);
    bool _912 = _643 > 0.5;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = _898 ? 0 : 1;
    float _918 = trunc(_902);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    float _924 = _856 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _926 = -_886;
    int _928 = _912 ? as_type<int>(_926) : as_type<int>(_886);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _932 = !_709;
    float _934 = _932 ? _886 : as_type<float>(_928);
    float _936 = _828 * 2.0;
    int _938 = ~_916;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    int _944 = _942;
    if (!_858)
    {
        int _946 = ~_916;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    bool _952 = _900 > 0.0;
    float _954 = in.m_55.w;
    bool _956 = _900 >= 0.0;
    bool _958 = isnan(_900);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = _645 + _828;
    int _968 = int(_826) + int(_922);
    float _970 = floor(_936);
    bool _972 = _645 > 0.5;
    float _974 = _966 + (-1.0);
    float _976 = _731 * _643;
    int _978 = _964 ? 0 : 1;
    int _980 = _844 * _968;
    int _982 = _980 + _773;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _986 = -_908;
    int _988 = _972 ? as_type<int>(_986) : as_type<int>(_908);
    float _990 = floor(_976);
    int _992 = ~_978;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    float _998 = _828 + (-0.5);
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1002 = _1000 != 0;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1010 = _1008 != 0;
    int _1012 = _996;
    if (!_952)
    {
        int _1014 = ~_978;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    bool _1020 = uint(_982) >= uint(_659);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    float _1026 = _767 + _954;
    bool _1028 = !_715;
    float _1030 = _1028 ? _908 : as_type<float>(_988);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1036;
    float _1040 = -_990;
    float _1042 = _976 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1048 = fma(_1034, _840, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1054 = fma(_1038, _840, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1056 = float(_773);
    float _1058 = _1042 * _834;
    bool _1060 = !_1020;
    int _1062 = _1060 ? 0 : (-1);
    float _1064 = fma(_1046, _878, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1066 = _133 * _1024;
    bool _1068 = _1056 >= _834;
    bool _1070 = isnan(_1056);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(_834);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    float _1080 = _1026 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1082 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1084 = isnan(_635);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = exp2(_1066);
    bool _1096 = _970 > 0.0;
    bool _1098 = _970 >= 0.0;
    bool _1100 = isnan(_970);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _677 + _691;
    float _1110 = fma(_1052, _878, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1112 = ~_968;
    int _1114 = _1112 + _1062;
    int _1116 = _1114 + 1;
    float _1118 = -_1092;
    float _1120 = _1118 + 1.0;
    float _1122 = trunc(_1078);
    int _1124 = int(_1122);
    bool _1126 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1128 = isnan(_635);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1108 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _1140 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1142 = isnan(_635);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    int _1152 = _659 * _1116;
    int _1154 = _1152 + _773;
    int _1156 = _1106 ? 0 : 1;
    float _1158 = -_1094;
    float _1160 = _1158 + 1.0;
    bool _1162 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1164 = isnan(0.0);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1170 = _1166 || _1168;
    float _1172 = _1150 * _1120;
    bool _1174 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1176 = isnan(_635);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = -_1136;
    float _1188 = _1186 + 1.0;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1192 = 1.0 + _1190;
    float _1194 = -_1150;
    float _1196 = _1194 + 1.0;
    float _1198 = _1170 ? _1160 : 0.0;
    float _1200 = _1092 * _1188;
    bool _1202 = _659 == 0;
    float _1204 = 1.0 / _1192;
    float _1206 = _1184 * _1196;
    int _1208 = abs(_695);
    bool _1210 = !_1202;
    int _1212 = _1210 ? _1154 : (-1);
    float _1214 = _1048 * _1206;
    float _1216 = _1054 * _1206;
    int _1218 = _659 + (-1);
    float _1220 = trunc(_1058);
    int _1222 = int(_1220);
    int _1224 = ~_1124;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    int _1230 = abs(_854);
    int _1232 = _1212 * _1228;
    float _1234 = _1198 * _1204;
    int _1236 = _1124 * _1218;
    int _1238 = _1236 + _1232;
    int _1240 = abs(_699);
    float _1242 = -_1184;
    float _1244 = _1242 + 1.0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1246;
    int _1250 = _1238 * _1208;
    float _1252 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1214);
    float _1254 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1216);
    int _1256 = abs(_876);
    float _1258 = -_133;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _719);
    int _1262 = _1222 * _1230;
    int _1264 = _1262 + _773;
    int _1266 = abs(_737);
    int _1268 = _872 * _1240;
    int _1270 = _1268 + _1250;
    float _1272 = _934 + 0.5;
    float _1274 = _1030 + (-0.5);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1276;
    float _1280 = fma(_1248, _850, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1282 = _1264 * _1256;
    int _1284 = _1282 + _1270;
    float _1286 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1260);
    float _1288 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1290 = -_1274;
    float _1292 = -_862;
    float _1294 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1292);
    int _1296 = _1222 * _1266;
    int _1298 = _1296 + _1284;
    float _1300 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1302 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1304 = ~_1156;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    float _1310 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1288);
    float _1312 = float(uint(_1298));
    float _1314 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1300);
    int _1316 = _1308;
    if (!_1096)
    {
        int _1318 = ~_1156;
        int _1320 = _1318 + 1;
        _1316 = _1320;
    }
    int _1322 = _1316;
    float _1324 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1302);
    float _1326 = fma(_1064, _1172, _1252);
    float _1328 = as_type<float>(_765) * _1312;
    float _1330 = fma(_1110, _1172, _1254);
    bool _1332 = !_1002;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1310);
    float _1338 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1314);
    float _1340 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1324);
    float _1342 = trunc(_1328);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    bool _1348 = !_1006;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_1278, _850, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _1354 = abs(_1334);
    float _1356 = fma(_1280, _1200, _1326);
    int _1358 = ~_659;
    int _1360 = _1358 + 1;
    float _1362 = in.m_70.x;
    float _1364 = in.m_70.y;
    float _1366 = in.m_70.z;
    int _1368 = abs(_1350);
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1372 = float(_1354);
    float _1374 = fma(_1352, _1200, _1330);
    float _1376 = float(_1322);
    float _1378 = _1336 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1380 = _1340 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _1382 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1384 = isnan(1.0);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1390 = _1386 || _1388;
    int _1392 = _1360 * int(_1346);
    int _1394 = _1392 + _1298;
    float _1396 = _1372 * _1376;
    float _1398 = float(_950);
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1402 = float(_1368);
    float _1404 = _1338 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1406 = float(uint(_1394));
    float _1408 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1374);
    float _1410 = _1402 * _1398;
    float _1412 = _1378 * _1370;
    float _1414 = as_type<float>(_765) * _1406;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1418 = _1396 * (-2.0);
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1422 = float(uint(_1264));
    float _1424 = _1410 * (-2.0);
    float _1426 = fma(_914, _1418, _914);
    float _1428 = fma(_1418, _1362, _1362);
    float _1430 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1420);
    float _1432 = trunc(_1414);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    float _1438 = _643 + (-0.5);
    float _1440 = as_type<float>(_765) * _1422;
    bool _1442 = !_1390;
    float _1444 = _1442 ? _133 : _1234;
    float _1446 = _1404 * _1400;
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1428);
    float _1450 = fma(_1412, 0.5, 0.5);
    float _1452 = _1380 * _1416;
    bool _1454 = !_1010;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = trunc(_1440);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = fma(_1444, _1426, _1448);
    float _1466 = fma(_984, _1424, _984);
    int _1468 = abs(_1456);
    float _1470 = fma(_1452, 0.5, 0.5);
    float _1472 = float(_1018);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1476 = int(_1346) + int(_1436);
    float _1478 = fma(_1446, 0.5, 0.5);
    int _1480 = ~_659;
    int _1482 = _1480 + 1;
    float _1484 = in.m_59.x;
    float _1486 = in.m_59.y;
    float _1488 = float(_1468);
    float _1490 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1474);
    float _1492 = _645 + (-0.5);
    int _1494 = _1482 * _1476;
    int _1496 = _1494 + _1298;
    float _1498 = fma(_1424, _1364, _1364);
    float _1500 = _1488 * _1472;
    float _1502 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1490);
    float _1504 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1356);
    bool _1506 = uint(_1496) >= uint(_659);
    float _1508 = _1500 * (-2.0);
    float _1510 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1498);
    float _1512 = _1464 * 0.15915493667125701904296875;
    bool _1514 = !_1506;
    int _1516 = _1514 ? 0 : (-1);
    float _1518 = fma(_930, _1508, _930);
    float _1520 = fma(_1508, _1366, _1366);
    float _1522 = fma(_1444, _1466, _1510);
    int _1524 = ~_1476;
    int _1526 = _1524 + _1516;
    int _1528 = _1526 + 1;
    float _1530 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1430);
    float _1532 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1520);
    float _1534 = _1522 * 0.15915493667125701904296875;
    float _1536 = -_1502;
    float _1538 = _1536 + 1.0;
    int _1540 = _659 * _1528;
    int _1542 = _1540 + _1298;
    float _1544 = fma(_1444, _1518, _1532);
    int _1546 = ~_659;
    int _1548 = _1546 + 1;
    float _1550 = _1408 * _1486;
    float _1552 = fma(_1030, _1538, _1294);
    bool _1554 = !_1202;
    int _1556 = _1554 ? _1542 : (-1);
    float _1558 = _1512 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = -_1530;
    float _1564 = _1562 + 1.0;
    float _1566 = _1544 * 0.15915493667125701904296875;
    int _1568 = _1556 >> 31;
    float _1570 = -_1564;
    float _1572 = fma(_934, _1570, _1286);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _1576 = _1512 * 6.283185482025146484375;
    float _1578 = cos(_1576);
    float _1580 = _1550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1582 = _1568 & 3;
    float _1584 = _1504 * _1484;
    int _1586 = _1548 * int(_1462);
    int _1588 = _1586 + _1264;
    float _1590 = _1580 * _1574;
    int _1592 = _1556 + _1582;
    out.m_72.x = _1572;
    out.m_72.y = _1552;
    float _1594 = _1534 * 6.283185482025146484375;
    float _1596 = sin(_1594);
    float _1598 = float(uint(_1588));
    float _1600 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1602 = _1592 >> 2;
    int _1604 = _1556 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1610 = _1608 != 0;
    float _1612 = _1534 * 6.283185482025146484375;
    float _1614 = cos(_1612);
    int _1616 = _1602 << 4;
    int _1618 = _1616 + 368;
    float _1620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    int _1622 = _1556 & 3;
    bool _1624 = _1622 != 0;
    bool _1626 = uint(_1622) > 1u;
    float _1628 = floor(_1450);
    float _1630 = _1578 * _1596;
    float _1632 = _1566 * 6.283185482025146484375;
    float _1634 = sin(_1632);
    float _1636 = _1560 * _1614;
    float _1638 = _1566 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = -_1628;
    float _1644 = _1450 + _1642;
    float _1646 = as_type<float>(_765) * _1598;
    float _1648 = _1560 * _1596;
    float _1650 = -_1630;
    float _1652 = fma(_1634, _1636, _1650);
    float _1654 = -_1636;
    float _1656 = fma(_1634, _1630, _1654);
    float _1658 = floor(_1470);
    uint _1660 = uint(int(uint(_1618) >> uint(2)));
    uint _1662 = uint(int(uint(int(_1660)) >> uint(2)));
    int _1664 = int(_1660) & 3;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[int(_1662)][_1664];
    int _1668 = int(_1660) + 1;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    int _1672 = _1668 & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    float _1676 = -_1590;
    float _1678 = _1634 * _1676;
    float _1680 = _1596 * _1640;
    float _1682 = _1614 * _1640;
    float _1684 = floor(_1478);
    float _1686 = _1640 * _1590;
    int _1688 = _1618 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    float _1706 = trunc(_1646);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    float _1712 = -_1658;
    float _1714 = _1470 + _1712;
    float _1716 = _1578 * _1614;
    float _1718 = fma(_1714, 2.0, -1.0);
    float _1720 = fma(_1634, _1648, _1716);
    float _1722 = -_1684;
    float _1724 = _1478 + _1722;
    float _1726 = fma(_1634, _1716, _1648);
    float _1728 = _1600 * _1620;
    float _1730 = fma(_1724, 2.0, -1.0);
    float _1732 = fma(_1682, _1728, _1678);
    float _1734 = _1578 * _1686;
    int _1736 = int(_1462) + int(_1710);
    float _1738 = _1560 * _1686;
    int _1740 = _1606 ? 0 : 1;
    float _1742 = fma(_1644, 2.0, -1.0);
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1746 = ~_659;
    int _1748 = _1746 + 1;
    float _1750 = fma(_1726, _1728, _1734);
    int _1752 = ~_1740;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    int _1760 = _1756;
    float _1762 = _1730;
    float _1764 = _1742;
    float _1766 = _1728;
    if (!_1626)
    {
        int _1768 = ~_1740;
        int _1770 = _1768 + 1;
        _1760 = _1770;
    }
    int _1772 = _1760;
    float _1774 = _1742 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1776 = _1622 != 3;
    float _1778 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    bool _1780 = uint(_1622) >= 2u;
    float _1782 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _1784 = abs(_1772);
    float _1786 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1758);
    int _1788 = _1748 * _1736;
    int _1790 = _1788 + _1264;
    int _1792 = _1780 ? 0 : 1;
    float _1794 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1778);
    bool _1796 = !_1624;
    int _1798 = _1796 ? 0 : 1;
    float _1800 = fma(_1652, _1728, _1738);
    int _1802 = ~_1784;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    float _1808 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1782);
    int _1810 = ~_1792;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    bool _1816 = _1622 != 3;
    int _1818 = _1806 * as_type<int>(_1674);
    int _1820 = abs(_1798);
    int _1822 = _1814;
    if (_1776)
    {
        int _1824 = ~_1792;
        int _1826 = _1824 + 1;
        _1822 = _1826;
    }
    int _1828 = _1822;
    bool _1830 = !_1816;
    int _1832 = _1830 ? 0 : (-1);
    bool _1834 = !_1610;
    int _1836 = _1834 ? 0 : 1;
    bool _1838 = uint(_1790) >= uint(_659);
    int _1840 = abs(_1828);
    int _1842 = ~_1820;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = abs(_1832);
    int _1850 = abs(_1836);
    int _1852 = _1846 * as_type<int>(_1666);
    int _1854 = _1852 + _1818;
    bool _1856 = !_1838;
    int _1858 = _1856 ? 0 : (-1);
    int _1860 = ~_1840;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = ~_1736;
    int _1868 = _1866 + _1858;
    int _1870 = _1868 + 1;
    int _1872 = ~_1848;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    int _1878 = _1864 * as_type<int>(_1696);
    int _1880 = _1878 + _1854;
    int _1882 = _659 * _1870;
    int _1884 = _1882 + _1264;
    float _1886 = _1718 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _1888 = _1876 * as_type<int>(_1704);
    int _1890 = _1888 + _1880;
    int _1892 = ~_1850;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1900 = !_1202;
    int _1902 = _1900 ? _1884 : (-1);
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1786);
    bool _1906 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1908 = isnan(1.0);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1914 = _1910 || _1912;
    float _1916 = fma(_1656, _1898, _1750);
    int _1918 = _1890 * _1896;
    float _1920 = fma(_1680, _1898, _1732);
    float _1922 = fma(_1720, _1898, _1800);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1926 = _1902 * _1850;
    int _1928 = _1926 + _1918;
    float _1930 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1932 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1934 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1924);
    float _1936 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1794);
    float _1938 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1930);
    float _1940 = float(_1928);
    float _1942 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1932);
    float _1944 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1934);
    float _1946 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1938);
    float _1948 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1808);
    float _1950 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1942);
    out.m_74.x = _1940;
    float _1952 = _1936 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1954 = _1904 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1956 = _1948 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1958 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1960 = _1946 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1962 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1964 = _1958 + _1952;
    float _1966 = _1960 + _1954;
    float _1968 = _1962 + _1956;
    float _1970 = _1962;
    float _1972 = as_type<float>(_1896);
    float _1974 = _1960;
    float _1976 = as_type<float>(_1896);
    float _1978 = _1958;
    float _1980 = _1960;
    float _1982 = _1962;
    float _1984 = _1968;
    float _1986 = _1904;
    float _1996;
    float _1998;
    float _2000;
    float _2002;
    if (!_1914)
    {
        bool _1988 = _1954 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1990 = !_1988;
        _1992 = _1990;
        if (!_1992)
        {
            float _1994 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1996 = _1994;
            _1998 = 0.0;
            _2000 = 0.0;
            _2002 = 0.0;
            _2004 = true;
        }
    }
    if ((!_2004) || _1992)
    {
        bool _2042;
        if (!_1992)
        {
            bool _2006 = _1954 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2008 = isnan(_1954);
            bool _2010 = _2006 || _2008;
            bool _2012 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2014 = _2010 || _2012;
            bool _2016 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2018 = !_2014;
            bool _2020 = _2016 && _2018;
            bool _2022 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2024 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2020)
            {
                _1970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2026 = _1970;
            float _2028 = _2026;
            if (_2020)
            {
                _1972 = 0.0;
            }
            float _2030 = _1972;
            _1976 = _2030;
            _1998 = _2030;
            if (_2020)
            {
                _1974 = 0.0;
            }
            float _2032 = _1974;
            _1980 = _2032;
            _2000 = _2032;
            if (_2020)
            {
                float _2034 = _2026 * 5.0;
                _2028 = _2034;
            }
            float _2036 = _2028;
            _1982 = _2036;
            _1996 = _2036;
            if (_2020)
            {
                _2024 = 0.0;
            }
            float _2038 = _2024;
            bool _2040 = !_2014;
            _2042 = _2040 && _2022;
            _1978 = _2038;
            _2002 = _2038;
        }
        if ((!_2042) || _1992)
        {
            _1992 = false;
            float _2044 = _1976;
            float _2046 = _1978;
            float _2048 = _1980;
            float _2050 = _1982;
            bool _2052 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2054 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2058 = _2044;
            float _2060 = _2046;
            float _2062 = _2048;
            float _2064 = _2050;
            if (_2052)
            {
                float _2066 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2058 = _2066;
            }
            float _2068 = _2058;
            if (_2052)
            {
                float _2070 = abs(_1742);
                float _2072 = -_2070;
                float _2074 = _2072 + 1.0;
                _2060 = _2074;
            }
            float _2076 = _2060;
            float _2078 = _2076;
            if (_2054)
            {
                float _2080 = abs(_1730);
                float _2082 = -_2080;
                float _2084 = _2082 + 1.0;
                _1762 = _2084;
            }
            float _2086 = _1762;
            if (!_2052)
            {
                _2062 = 1.0;
            }
            float _2088 = _2062;
            float _2090 = _2088;
            if (_2056)
            {
                float _2092 = abs(_1718);
                float _2094 = -_2092;
                float _2096 = _2094 + 1.0;
                _2064 = _2096;
            }
            float _2098 = _2064;
            if (!_2054)
            {
                _1764 = 1.0;
            }
            float _2100 = _1764;
            float _2102 = _1930;
            float _2104 = _2100;
            if (_2054)
            {
                float _2106 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2102 = _2106;
            }
            float _2108 = _2102;
            float _2110 = _1950;
            if (_2056)
            {
                float _2112 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2110 = _2112;
            }
            float _2114 = _2110;
            if (_2052)
            {
                float _2116 = _2076 * _2068;
                float _2118 = precise::clamp(_2116, 0.0, 1.0);
                _2090 = _2118;
            }
            float _2120 = _2090;
            if (!_2056)
            {
                _2078 = 1.0;
            }
            float _2122 = _2078;
            float _2124 = _2122;
            _1998 = _1964;
            if (_2054)
            {
                float _2126 = _2086 * _2108;
                float _2128 = precise::clamp(_2126, 0.0, 1.0);
                _2104 = _2128;
            }
            float _2130 = _2104;
            float _2132 = _2120 * _2130;
            _2000 = _1966;
            if (_2056)
            {
                float _2134 = _2098 * _2114;
                float _2136 = precise::clamp(_2134, 0.0, 1.0);
                _2124 = _2136;
            }
            float _2138 = _2124;
            float _2140 = _2132 * _2138;
            _1996 = _1968;
            _2002 = _2140;
        }
    }
    _2004 = false;
    float _2142 = _1996;
    float _2144 = _1998;
    float _2146 = _2000;
    float _2148 = _2002;
    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2152 = _2142 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2156 = _2144 + _2154;
    float _2158 = _2152 * _2152;
    float _2160 = fma(_2156, _2156, _2158);
    float _2162 = sqrt(_2160);
    bool _2164 = _2162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2166 = _2158;
    float _2168 = _2146;
    float _2170 = _2142;
    float _2172 = _2156;
    if (!_2164)
    {
        _2166 = _2144;
    }
    float _2174 = _2166;
    bool _2176 = !_2164;
    float _2178 = _2174;
    if (!_2176)
    {
        float _2180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2184 = _2162 + _2182;
        float _2186 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2188 = rsqrt(_2160);
        float _2190 = _2184 * _2180;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = _2192 * 6.283185482025146484375;
        float _2196 = cos(_2194);
        float _2198 = _2192 * 6.283185482025146484375;
        float _2200 = sin(_2198);
        float _2202 = _2196 + (-1.0);
        float _2204 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2206 = fma(_2200, _2186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2208 = fma(_2196, _2146, _2204);
        float _2210 = _2188 * _2206;
        float _2212 = fma(_2156, _2210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2214 = fma(_2152, _2210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2168 = _2208;
        _2178 = _2212;
        _2170 = _2214;
    }
    float _2216 = _2168;
    float _2218 = _2178;
    float _2220 = _2170;
    float _2222 = -_1954;
    float _2224 = _2222 + _2216;
    float _2226 = -_1952;
    float _2228 = _2226 + _2218;
    float _2230 = -_1956;
    float _2232 = _2230 + _2220;
    float _2234 = _2224 * _2224;
    float _2236 = fma(_2228, _2228, _2234);
    float _2238 = fma(_2232, _2232, _2236);
    float _2240 = sqrt(_2238);
    bool _2242 = _2240 > 0.0;
    bool _2244 = !_2242;
    float _2246 = _2240;
    float _2248 = _2218;
    float _2250 = _2220;
    float _2252 = _2216;
    if (!_2244)
    {
        bool _2254 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2256 = _1750;
        if (_2254)
        {
            float _2258 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2256 = _2258;
        }
        float _2260 = _2256;
        if (_2254)
        {
            _1984 = _597;
        }
        float _2262 = _1984;
        float _2264 = _2262;
        if (_2254)
        {
            _2172 = _599;
        }
        float _2266 = _2172;
        float _2268 = _2266;
        if (_2254)
        {
            _2246 = _601;
        }
        float _2270 = _2246;
        float _2272 = _2260;
        float _2274 = _2270;
        if (_2254)
        {
            float _2276 = _597 * _2260;
            _1986 = _2276;
        }
        float _2278 = _1986;
        float _2280 = _2278;
        if (_2254)
        {
            float _2282 = _599 * _2260;
            _1766 = _2282;
        }
        float _2284 = _1766;
        float _2286 = _2284;
        if (_2254)
        {
            float _2288 = _601 * _2260;
            _2272 = _2288;
        }
        float _2290 = _2272;
        float _2292 = _2290;
        if (!_2254)
        {
            float _2294 = _133 + 1.0;
            if (!_175)
            {
                float _2296 = _2294 * _2294;
                float _2298 = _2296 * 0.5;
                _135 = _2298;
            }
            float _2300 = _135;
            float _2302 = _2300;
            if (!_175)
            {
                float _2304 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2302 = _2304;
            }
            float _2306 = _2302;
            bool _2308 = !_175;
            float _2310 = _2306;
            if (!_2308)
            {
                float _2312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2314 = log2(_2312);
                float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2318 = 1.0 + _2316;
                float _2320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2322 = _2314 * _2294;
                float _2324 = 1.0 / _2318;
                float _2326 = _2320 * 0.693147182464599609375;
                float _2328 = exp2(_2322);
                float _2330 = 1.0 / _2326;
                float _2332 = _2328 + (-1.0);
                float _2334 = -_2332;
                float _2336 = fma(_2334, _2330, _2294);
                float _2338 = _2336 * _2324;
                float _2340 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2310 = _2340;
            }
            float _2342 = _2310;
            float _2344 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2346 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2348 = _2344 * _343;
            float _2350 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2352 = _2344 * _297;
            float _2354 = _2344 * _361;
            float _2356 = fma(_2346, _339, _2348);
            float _2358 = _2342;
            if (!_175)
            {
                _2358 = _2294;
            }
            float _2360 = _2358;
            float _2362 = fma(_2346, _289, _2352);
            float _2364 = fma(_2350, _347, _2356);
            bool _2366 = !_175;
            float _2368 = _2360;
            if (!_2366)
            {
                float _2370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2372 = log2(_2370);
                float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2376 = 1.0 + _2374;
                float _2378 = 1.0 / _2376;
                float _2380 = _2372 * _2294;
                float _2382 = exp2(_2380);
                float _2384 = -_2382;
                float _2386 = _2384 + 1.0;
                float _2388 = _2386 * _2378;
                _2368 = _2388;
            }
            float _2390 = _2368;
            float _2392 = fma(_2346, _357, _2354);
            float _2394 = fma(_2350, _301, _2362);
            float _2396 = fma(_2390, _245, _2364);
            float _2398 = fma(_2350, _365, _2392);
            float _2400 = fma(_2390, _243, _2394);
            float _2402 = -_559;
            float _2404 = _2402 + _2396;
            float _2406 = fma(_2390, _247, _2398);
            float _2408 = -_563;
            float _2410 = _2408 + _2400;
            float _2412 = _2404 * _163;
            float _2414 = _2404 * _157;
            float _2416 = _2404 * _179;
            float _2418 = -_571;
            float _2420 = _2418 + _2406;
            float _2422 = fma(_2410, _161, _2412);
            float _2424 = fma(_2410, _155, _2414);
            float _2426 = fma(_2410, _177, _2416);
            float _2428 = fma(_2420, _165, _2422);
            float _2430 = fma(_2420, _159, _2424);
            float _2432 = fma(_2420, _181, _2426);
            _2268 = _2430;
            _2264 = _2428;
            _2274 = _2432;
            _2280 = _2428;
            _2286 = _2430;
            _2292 = _2432;
            _291 = _2394;
        }
        float _2434 = _2268;
        float _2436 = _2264;
        float _2438 = _2274;
        float _2440 = _2280;
        float _2442 = _2286;
        float _2444 = _2292;
        float _2446 = _291;
        float _2448 = _2434 * _2434;
        float _2450 = rsqrt(_2238);
        float _2452 = fma(_2436, _2436, _2448);
        float _2454 = fma(_2438, _2438, _2452);
        float _2456 = sqrt(_2454);
        float _2458 = _2228 * _2450;
        float _2460 = _2224 * _2450;
        float _2462 = _2232 * _2450;
        bool _2464 = _2456 > 0.0;
        bool _2466 = !_2464;
        _293 = _2446;
        _225 = _2454;
        _227 = _2462;
        if (!_2466)
        {
            float _2468 = rsqrt(_2454);
            float _2470 = _2468 * _2434;
            float _2472 = _2468 * _2436;
            float _2474 = _2468 * _2438;
            float _2476 = _2460 * _2470;
            float _2478 = fma(_2458, _2472, _2476);
            float _2480 = fma(_2462, _2474, _2478);
            float _2482 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2484 = fma(_2440, _2482, _2218);
            float _2486 = fma(_2442, _2482, _2216);
            float _2488 = fma(_2444, _2482, _2220);
            _2248 = _2484;
            _2250 = _2488;
            _2252 = _2486;
        }
    }
    float _2490 = _2248;
    float _2492 = _2250;
    float _2494 = _2252;
    float _2496 = _293;
    float _2498 = _225;
    float _2500 = _227;
    float _2502 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2506 = isnan(0.5);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2512 = _2508 || _2510;
    bool _2514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2516 = isnan(0.5);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2522 = _2518 || _2520;
    float _2524 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2502);
    float _2526 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2528 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2524);
    float _2530 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2526);
    float _2532 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2534 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2530);
    float _2536 = _2496;
    float _2538 = _2494;
    float _2540 = _2500;
    float _2542 = _2498;
    if (_2512)
    {
        _2536 = _2490;
    }
    float _2544 = _2536;
    float _2546 = 1.0 / _2532;
    float _2548 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2550 = _2548;
    float _2552 = _2544;
    if (_2512)
    {
        _229 = _2492;
    }
    float _2554 = _229;
    float _2556 = _2548 + _2532;
    float _2558 = _2554;
    if (_2512)
    {
        _2550 = _2494;
    }
    float _2560 = _2550;
    float _2562 = _2560;
    float _2564 = _2546;
    if (!_2512)
    {
        float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2568 = _1954 + _2566;
        float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2572 = _1952 + _2570;
        float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2576 = -_1952;
        float _2578 = _2576 + _2490;
        float _2580 = _2568 * _2568;
        float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2584 = _1956 + _2582;
        float _2586 = -_1954;
        float _2588 = _2586 + _2494;
        float _2590 = -_1956;
        float _2592 = _2590 + _2492;
        float _2594 = fma(_2572, _2572, _2580);
        float _2596 = fma(_2584, _2584, _2594);
        float _2598 = sqrt(_2596);
        float _2600 = precise::min(_2598, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2602 = _2600 * _2574;
        float _2604 = fma(_2578, _2602, _1952);
        float _2606 = fma(_2588, _2602, _1954);
        float _2608 = fma(_2592, _2602, _1956);
        _2562 = _2606;
        _2552 = _2604;
        _2558 = _2608;
        _2538 = _2588;
    }
    float _2610 = _2562;
    float _2612 = _2552;
    float _2614 = _2558;
    float _2616 = _2538;
    float _2618 = _2616;
    if (_2522)
    {
        _2540 = 1.0;
    }
    float _2620 = _2540;
    float _2622 = _2556 * _2546;
    float _2624 = _2622 * 0.5;
    float _2626 = _2620;
    if (!_2522)
    {
        float _2628 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2630 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2628);
        float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2636 = 1.0 / _2630;
        float _2638 = 1.0 / _2634;
        float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2644 = fma(_2636, _2640, _2642);
        float _2646 = _2644 * _2638;
        float _2648 = precise::clamp(_2646, 0.0, 1.0);
        _2626 = _2648;
    }
    float _2650 = _2626;
    float _2652 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2654 = _2610 + _2652;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2658 = _2612 + _2656;
    float _2660 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2662 = _2614 + _2660;
    float _2664 = _2654 * _2654;
    float _2666 = fma(_2658, _2658, _2664);
    float _2668 = fma(_2662, _2662, _2666);
    float _2670 = rsqrt(_2668);
    float _2672 = sqrt(_2668);
    float _2674 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2676 = _2658 * _2674;
    float _2678 = _2662 * _2674;
    float _2680 = _2676 * _2676;
    float _2682 = _2678 * _2678;
    float _2684 = _2680 + _2682;
    float _2686 = sqrt(_2684);
    bool _2688 = _2686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2692 = _2686 + _2690;
    float _2694 = _2670;
    float _2696 = _2692;
    float _2698 = _2654;
    if (_2688)
    {
        float _2700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2694 = _2700;
    }
    float _2702 = _2694;
    if (_2688)
    {
        float _2704 = rsqrt(_2684);
        _2542 = _2704;
    }
    float _2706 = _2542;
    float _2708 = _2706;
    if (_2688)
    {
        float _2710 = _2692 * _2702;
        _2696 = _2710;
    }
    float _2712 = _2696;
    if (_2688)
    {
        float _2714 = _2712 * 0.15915493667125701904296875;
        _231 = _2714;
    }
    float _2716 = _231;
    float _2718 = _2662;
    if (_2688)
    {
        float _2720 = _2716 * 6.283185482025146484375;
        float _2722 = sin(_2720);
        _2718 = _2722;
    }
    float _2724 = _2718;
    float _2726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2728 = precise::max(0.0, _2726);
    float _2730 = _2702;
    float _2732 = _2728;
    if (_2688)
    {
        float _2734 = _2716 * 6.283185482025146484375;
        float _2736 = cos(_2734);
        _2730 = _2736;
    }
    float _2738 = _2730;
    float _2740 = -_2674;
    float _2742 = -_2728;
    float _2744 = fma(_2654, _2740, _2742);
    if (_2688)
    {
        float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2698 = _2746;
    }
    float _2748 = _2698;
    float _2750 = _2724;
    float _2752 = _2748;
    if (_2688)
    {
        float _2754 = fma(_2724, _2748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2750 = _2754;
    }
    float _2756 = _2750;
    float _2758 = _2756;
    if (!_2688)
    {
        _2752 = _2680;
    }
    float _2760 = _2752;
    float _2762 = _2760;
    float _2764 = _2738;
    if (_2688)
    {
        float _2766 = _2738 + (-1.0);
        _2732 = _2766;
    }
    float _2768 = _2732;
    float _2770 = _2768;
    if (_2688)
    {
        float _2772 = _2706 * _2756;
        _2618 = _2772;
    }
    float _2774 = _2618;
    if (!_2688)
    {
        _2708 = _2676;
    }
    float _2776 = _2708;
    float _2778 = _2776;
    if (_2688)
    {
        float _2780 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2780;
    }
    float _2782 = _2564;
    if (_2688)
    {
        float _2784 = _2676 * _2774;
        _2778 = _2784;
    }
    float _2786 = _2778;
    if (!_2688)
    {
        _2758 = _2744;
    }
    float _2788 = _2758;
    float _2790 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2792 = _2788;
    if (!_2688)
    {
        _2770 = _2678;
    }
    float _2794 = _2770;
    float _2796 = _2794;
    if (_2688)
    {
        float _2798 = fma(_2744, _2738, _2782);
        _2792 = _2798;
    }
    float _2800 = _2792;
    if (_2688)
    {
        float _2802 = _2678 * _2774;
        _2796 = _2802;
    }
    float _2804 = _2796;
    if (_2688)
    {
        float _2806 = _2786 * _2786;
        _2762 = _2806;
    }
    float _2808 = _2762;
    if (!_2688)
    {
        _2764 = _2682;
    }
    float _2810 = _2764;
    float _2812 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2814 = _2810;
    if (_2688)
    {
        float _2816 = _2804 * _2804;
        _2814 = _2816;
    }
    float _2818 = _2814;
    float _2820 = fma(_2800, _2800, _2808);
    float _2822 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2824 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2790);
    float _2826 = _2820 + _2818;
    float _2828 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2822);
    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2832 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2830);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = rsqrt(_2826);
    float _2838 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2840 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2828);
    float _2842 = -_2834;
    float _2844 = _2842 + 1.0;
    float _2846 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2848 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2838);
    float _2850 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2852 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2824);
    float _2854 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2846);
    float _2856 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2848);
    float _2858 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2860 = abs(_2844);
    float _2862 = log2(_2860);
    float _2864 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2854);
    float _2866 = _2856 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2868 = -_2858;
    float _2870 = fma(_2868, _2812, 1.0);
    float _2872 = _2852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2874 = _2836 * _2786;
    float _2876 = _2864 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2878 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2880 = _2836 * _2800;
    float _2882 = _2874 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2884 = _2836 * _2804;
    float _2886 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2878);
    float _2888 = log2(_2870);
    float _2890 = -_2882;
    float _2892 = fma(_2880, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2890);
    float _2894 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2886);
    float _2896 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2898 = -_2884;
    float _2900 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2892);
    float _2902 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2904 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2894);
    float _2906 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2908 = fma(_2900, -0.5, 0.5);
    float _2910 = exp2(_2896);
    float _2912 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2902);
    float _2914 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2906);
    float _2916 = fma(_2900, 0.5, 0.5);
    float _2918 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2912);
    float _2920 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2914);
    float _2922 = fma(_2916, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2924 = 1.0 / _2904;
    float _2926 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2918);
    float _2928 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2920);
    float _2930 = _2880 + 1.0;
    float _2932 = fma(_2916, _2922, -0.212114393711090087890625);
    float _2934 = _2888 * 0.693147182464599609375;
    float _2936 = sqrt(_2908);
    float _2938 = -_2880;
    float _2940 = fma(_2910, _2930, _2938);
    float _2942 = fma(_2916, _2932, 1.570728778839111328125);
    float _2944 = _2926 * _2924;
    float _2946 = _2928 * _2924;
    float _2948 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2950 = fma(_2940, 0.5, 0.5);
    float _2952 = fma(_2944, 0.5, 0.5);
    float _2954 = fma(_2946, -0.5, 0.5);
    float _2956 = _2936 * 0.636619746685028076171875;
    float3 _7636 = float3(_2952, _2954, _2948);
    float _2958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7636, float3(0.0), isnan(_7636)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7636, float3(0.0), isnan(_7636)), level(0.0)).x;
    float3 _7647 = float3(_2952, _2954, _2948);
    float4 _2961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7647, float3(0.0), isnan(_7647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7647, float3(0.0), isnan(_7647)), level(0.0)).xyzw;
    float _2963 = _2961.x;
    float _2965 = _2961.y;
    float _2967 = _2961.z;
    float _2969 = _2961.w;
    float _2971 = -_2942;
    float _2973 = fma(_2956, _2971, 1.0);
    float2 _7669 = float2(_2973, _2950);
    float3 _2977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7669, float2(0.0), isnan(_7669)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7669, float2(0.0), isnan(_7669)), level(0.0)).xyz;
    float _2979 = _2977.x;
    float _2981 = _2977.y;
    float _2983 = _2977.z;
    float _2985 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2987 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2989 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2991 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2993 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2985);
    float _2995 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2987);
    float _2997 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2989);
    float _2999 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2991);
    float _3001 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2993);
    float _3003 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2995);
    float _3005 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2997);
    float _3007 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2999);
    float _3009 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3011 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3013 = _3005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_76.y = 1.0;
    float _3015 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3017 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3019 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3021 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3023 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3015);
    float _3025 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3017);
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3029 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3019);
    float _3031 = _3007 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3033 = _3021 + _3023;
    float _3035 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3025);
    float _3037 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3039 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3041 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3033);
    float _3043 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3027);
    float _3045 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3035);
    float _3047 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3039);
    float _3049 = exp2(_3037);
    float _3051 = -_597;
    float _3053 = _3051 + _2612;
    float _3055 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3057 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3047);
    float _3059 = -_599;
    float _3061 = _3059 + _2610;
    float _3063 = -_601;
    float _3065 = _3063 + _2614;
    float _3067 = _3055 + _3029;
    float _3069 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3057);
    float _3071 = 1.0 / _3041;
    float _3073 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3075 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3067);
    float _3077 = _3069 + _2904;
    float _3079 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3081 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3073);
    float _3083 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3085 = -_3049;
    float _3087 = _3085 + 1.0;
    float _3089 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3081);
    float _3091 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3095 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3097 = _3077 * 0.5;
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3091);
    float _3101 = _3075 * _3071;
    float _3103 = _3045 * _3071;
    float _3105 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3079);
    float _3107 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3099);
    out.gl_Position.x = _2926;
    out.gl_Position.y = _2928;
    out.gl_Position.z = _3069;
    out.gl_Position.w = _2904;
    bool _3109 = _3103 > 0.0;
    float _3111 = 1.0 / _3095;
    float _3113 = _3083 + _3043;
    out.m_78.z = _3097;
    out.m_78.w = _2904;
    bool _3115 = _3103 < 1.0;
    bool _3117 = _3115 && _3109;
    float _3119 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3105);
    float _3121 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3113);
    float _3123 = _3107 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _3125 = _2944 > (-1.0);
    bool _3127 = _3125 && _3117;
    float _3129 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3131 = _3121 * _3071;
    bool _3133 = _2946 > (-1.0);
    bool _3135 = _3133 && _3127;
    bool _3137 = _2944 < 1.0;
    bool _3139 = _3137 && _3135;
    float _3141 = _3123 * _3111;
    float _3143 = _3129 * _3111;
    bool _3145 = _2946 < 1.0;
    bool _3147 = _3145 && _3139;
    float _3149 = _3093 * _2958;
    float _3151 = -_3093;
    float _3153 = _3151 + 1.0;
    float _3155 = _2969 * _3149;
    float _3157 = _2983 * _3149;
    float _3159 = fma(_2979, _3155, _2963);
    float _3161 = fma(_2981, _3155, _2965);
    float _3163 = _2969 * _3153;
    float _3165 = fma(_2969, _3157, _2967);
    out.m_80.x = _3159;
    out.m_80.y = _3161;
    out.m_80.z = _3165;
    out.m_80.w = _3163;
    bool _3167 = !_3147;
    float _3203;
    if (!_3167)
    {
        float _3169 = -_3131;
        float _3171 = _2946 + _3169;
        float _3173 = -_3101;
        float _3175 = _2944 + _3173;
        float _3177 = _2148 * _2650;
        float _3179 = -_3141;
        float _3181 = _2944 + _3179;
        float _3183 = _3171 * _3171;
        float _3185 = -_3143;
        float _3187 = _2946 + _3185;
        float _3189 = _3177 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3191 = fma(_3175, _3175, _3183);
        float _3193 = sqrt(_3191);
        bool _3195 = _3193 > 0.0;
        float _3197 = _3193;
        if (!_3195)
        {
            _3197 = _3189;
        }
        float _3199 = _3197;
        bool _3201 = !_3195;
        _3203 = _3199;
        _3205 = _3201;
        if (!_3205)
        {
            float _3207 = _3187 * _3187;
            float _3209 = fma(_3181, _3181, _3207);
            float _3211 = rsqrt(_3191);
            float _3213 = sqrt(_3209);
            float _3215 = _3175 * _3211;
            float _3217 = _3171 * _3211;
            bool _3219 = _3213 > 0.0;
            float _3221 = _3211;
            if (!_3219)
            {
                _3221 = _3189;
            }
            float _3223 = _3221;
            bool _3225 = !_3219;
            _3203 = _3223;
            _3205 = _3225;
            if (!_3205)
            {
                float _3227 = _1600 * _3031;
                float _3229 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3231 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3021);
                float _3233 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3055);
                float _3235 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3083);
                float _3237 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3231);
                float _3239 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3235);
                float _3241 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3233);
                float _3243 = rsqrt(_3209);
                float _3245 = _3229 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3247 = 1.0 / _3237;
                float _3249 = _3187 * _3245;
                float _3251 = _3181 * _3245;
                float _3253 = _3249 * _3249;
                float _3255 = fma(_3251, _3251, _3253);
                float _3257 = _3187 * _3243;
                float _3259 = _3181 * _3243;
                float _3261 = _3217 * _3257;
                float _3263 = sqrt(_3255);
                float _3265 = _3239 * _3247;
                float _3267 = _3241 * _3247;
                float _3269 = fma(_3215, _3259, _3261);
                float _3271 = _3265 * _3265;
                float _3273 = precise::min(0.0, _3269);
                float _3275 = fma(_3267, _3267, _3271);
                float _3277 = sqrt(_3275);
                float _3279 = _2904 * _3273;
                float _3281 = fma(_3251, _3279, _2926);
                float _3283 = fma(_3249, _3279, _2928);
                out.gl_Position.x = _3281;
                out.gl_Position.y = _3283;
                float _3285 = fma(_3263, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3277);
                float _3287 = 1.0 / _3285;
                float _3289 = _3277 * _3287;
                out.m_76.y = _3289;
                _3203 = _3189;
                _3205 = true;
            }
        }
    }
    else
    {
        float _3291 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3291;
        _3203 = 0.0;
    }
    _3205 = false;
    float _3293 = _3203;
    bool _3295 = _2650 > 0.0;
    bool _3297 = isnan(_2650);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan(0.0);
    bool _3303 = _3299 || _3301;
    float _3305 = _3293 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _3305;
    if (_3303)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3307 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3307;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3205 = false;
    bool _2004 = false;
    bool _1992 = false;
    bool _627 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3364 = as_type<float>(_115);
        out.gl_Position.z = _3364;
    }
    if (!_103)
    {
        return out;
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3434 = as_type<float>(_153);
        out.gl_Position.z = _3434;
    }
    if (_145)
    {
        return out;
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_57.x;
    float _179 = in.m_57.y;
    float _181 = in.m_57.z;
    float _183 = in.m_59.w;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = _155 * _155;
    float _193 = _157 * _157;
    float _195 = fma(_161, _161, _191);
    float _197 = fma(_163, _163, _193);
    float _199 = fma(_177, _177, _195);
    float _201 = _159 * _159;
    float _203 = fma(_179, _179, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_165, _165, _201);
    float _209 = fma(_181, _181, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = 0.0;
    float _221 = _203;
    float _223 = _199;
    float _225 = _181;
    float _227 = _179;
    float _229 = _163;
    float _231 = _165;
    if (_215)
    {
        float _233 = rsqrt(_199);
        _219 = _233;
    }
    float _235 = _219;
    float _237 = 0.0;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _213 > 0.0;
    float _243 = in.m_51.x;
    float _245 = in.m_51.y;
    float _247 = in.m_51.z;
    float _249 = 0.0;
    float _251 = _239;
    if (!_215)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = 0.0;
    float _259 = _253;
    if (!_217)
    {
        _255 = 0.0;
        _257 = 0.0;
    }
    float _261 = _255;
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _261;
    float _269 = _263;
    if (_217)
    {
        float _271 = rsqrt(_203);
        _265 = _271;
    }
    float _273 = _265;
    float _275 = 0.0;
    if (!_215)
    {
        _275 = 0.0;
    }
    float _277 = _275;
    float _279 = 0.0;
    float _281 = _277;
    if (_241)
    {
        float _283 = rsqrt(_209);
        _279 = _283;
    }
    float _285 = _279;
    if (_215)
    {
        float _287 = _235 * _161;
        _251 = _287;
    }
    float _289 = _251;
    float _291 = _289;
    float _293 = _289;
    if (_215)
    {
        float _295 = _235 * _155;
        _259 = _295;
    }
    float _297 = _259;
    if (_215)
    {
        float _299 = _235 * _177;
        _281 = _299;
    }
    float _301 = _281;
    float _303 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _305 = 0.0;
    float _307 = 0.0;
    float _309 = _303;
    if (!_241)
    {
        _305 = 0.0;
        _307 = 0.0;
    }
    float _311 = _305;
    float _313 = _307;
    float _315 = _313;
    float _317 = _311;
    if (!_217)
    {
        _221 = 0.0;
    }
    float _319 = _221;
    float _321 = _319;
    if (!_175)
    {
        float _323 = _303 * _303;
        float _325 = _323 * 0.5;
        _223 = _325;
    }
    float _327 = _223;
    float _329 = 0.0;
    float _331 = _327;
    if (!_241)
    {
        _329 = 0.0;
    }
    float _333 = _329;
    float _335 = _333;
    if (_217)
    {
        float _337 = _273 * _163;
        _321 = _337;
    }
    float _339 = _321;
    if (_217)
    {
        float _341 = _273 * _157;
        _267 = _341;
    }
    float _343 = _267;
    if (_217)
    {
        float _345 = _273 * _179;
        _269 = _345;
    }
    float _347 = _269;
    if (!_175)
    {
        float _349 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _349;
    }
    float _351 = _331;
    float _353 = _351;
    if (_241)
    {
        float _355 = _285 * _165;
        _315 = _355;
    }
    float _357 = _315;
    if (_241)
    {
        float _359 = _285 * _159;
        _317 = _359;
    }
    float _361 = _317;
    if (_241)
    {
        float _363 = _285 * _181;
        _335 = _363;
    }
    float _365 = _335;
    bool _367 = !_175;
    if (!_367)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = _303 * _371;
        float _381 = 1.0 / _375;
        float _383 = _377 * 0.693147182464599609375;
        float _385 = exp2(_379);
        float _387 = 1.0 / _383;
        float _389 = _385 + (-1.0);
        float _391 = -_389;
        float _393 = fma(_391, _387, _303);
        float _395 = _393 * _381;
        float _397 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _353 = _397;
    }
    float _399 = _353;
    float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _403 = !_175;
    float _405 = _401;
    float _407 = _399;
    if (!_403)
    {
        float _409 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _411 = log2(_409);
        float _413 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _415 = _413 + 1.0;
        float _417 = 1.0 / _415;
        float _419 = _303 * _411;
        float _421 = exp2(_419);
        float _423 = -_421;
        float _425 = _423 + 1.0;
        float _427 = _425 * _417;
        _309 = _427;
    }
    float _429 = _309;
    float _431 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _433 = _401 * _297;
    float _435 = _401 * _343;
    float _437 = _401 * _361;
    float _439 = _429;
    if (!_175)
    {
        float _441 = _133 * _133;
        float _443 = _441 * 0.5;
        _405 = _443;
    }
    float _445 = _405;
    float _447 = fma(_431, _289, _433);
    float _449 = fma(_431, _339, _435);
    float _451 = fma(_431, _357, _437);
    float _453 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_175)
    {
        float _455 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _407 = _455;
    }
    float _457 = _407;
    bool _459 = !_175;
    float _461 = _457;
    if (!_459)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = _133 * _465;
        float _475 = 1.0 / _469;
        float _477 = _471 * 0.693147182464599609375;
        float _479 = exp2(_473);
        float _481 = 1.0 / _477;
        float _483 = _479 + (-1.0);
        float _485 = -_483;
        float _487 = fma(_485, _481, _133);
        float _489 = _487 * _475;
        float _491 = _489 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _491;
    }
    float _493 = _461;
    float _495 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _497 = fma(_453, _301, _447);
    float _499 = fma(_453, _347, _449);
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _503 = _495 * _297;
    float _505 = _495 * _343;
    float _507 = _495 * _361;
    float _509 = fma(_453, _365, _451);
    float _511 = fma(_501, _289, _503);
    float _513 = fma(_501, _339, _505);
    float _515 = fma(_501, _357, _507);
    float _517 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _519 = fma(_429, _243, _497);
    float _521 = fma(_429, _245, _499);
    float _523 = fma(_429, _247, _509);
    float _525 = fma(_517, _301, _511);
    float _527 = fma(_517, _347, _513);
    float _529 = fma(_517, _365, _515);
    if (!_175)
    {
        _439 = _133;
    }
    float _531 = _439;
    bool _533 = !_175;
    float _535 = _531;
    if (!_533)
    {
        float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _539 = log2(_537);
        float _541 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _543 = _541 + 1.0;
        float _545 = 1.0 / _543;
        float _547 = _133 * _539;
        float _549 = exp2(_547);
        float _551 = -_549;
        float _553 = _551 + 1.0;
        float _555 = _553 * _545;
        _535 = _555;
    }
    float _557 = _535;
    float _559 = fma(_557, _245, _527);
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _563 = fma(_557, _243, _525);
    float _565 = fma(_521, _183, _187);
    float _567 = -_559;
    float _569 = _521 + _567;
    float _571 = fma(_557, _247, _529);
    float _573 = fma(_519, _183, _185);
    float _575 = -_563;
    float _577 = _519 + _575;
    float _579 = _569 * _163;
    float _581 = _569 * _157;
    float _583 = _569 * _179;
    float _585 = -_571;
    float _587 = _523 + _585;
    float _589 = fma(_577, _161, _579);
    float _591 = fma(_577, _155, _581);
    float _593 = fma(_577, _177, _583);
    float _595 = fma(_523, _183, _189);
    float _597 = fma(_587, _165, _589);
    float _599 = fma(_587, _159, _591);
    float _601 = fma(_587, _181, _593);
    bool _603 = !_561;
    float _623;
    float _625;
    if (!_603)
    {
        float _605 = in.m_61.x;
        float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _609 = float(_99);
        float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _615 = _613 * _607;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = _609;
        _627 = true;
    }
    else
    {
        float _629 = float(_99);
        float _631 = 1.0 / _629;
        float _633 = _133 * _631;
        _623 = _633;
        _625 = _629;
    }
    _627 = false;
    float _635 = _623;
    float _637 = _625;
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _641 = int(_639);
    float _643 = in.m_61.x;
    float _645 = in.m_61.y;
    float _647 = _565 * _157;
    float _649 = as_type<float>(int(gl_VertexIndex));
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _653 = _651 != 0;
    float _655 = fma(_573, _155, _647);
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _659 = int(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _635 + _661;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _675 = _673 != 0;
    float _677 = fma(_595, _159, _655);
    float _679 = in.m_57.w;
    float _681 = 1.0 / _637;
    float _683 = float(_641);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _689 = _687 != 0;
    float _691 = in.m_53.w;
    bool _693 = !_671;
    int _695 = _693 ? 0 : 1;
    bool _697 = !_667;
    int _699 = _697 ? 0 : 1;
    float _701 = 1.0 / _683;
    float _703 = float(uint(_659));
    float _705 = _643 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    float _711 = _645 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _715 = _713 != 0;
    float _717 = -_685;
    float _719 = fma(_705, 2.0, _717);
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _723 = _721 != 0;
    float _725 = 1.0 / _703;
    float _727 = _565 * _179;
    bool _729 = !_653;
    float _731 = _729 ? 7.345489978790283203125 : 1.0;
    float _733 = _643 * 2.0;
    bool _735 = !_689;
    int _737 = _735 ? 0 : 1;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _741 = as_type<int>(_649) & 1;
    bool _743 = _741 != 0;
    int _745 = as_type<int>(_649) & 2;
    bool _747 = _745 != 0;
    float _749 = _133 * _701;
    float _751 = _565 * _163;
    float _753 = fma(_711, -2.0, _739);
    float _755 = floor(_733);
    float _757 = fma(_573, _161, _751);
    float _759 = fma(_573, _177, _727);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _761;
    int _765 = as_type<int>(_725) + (-2);
    float _767 = fma(_595, _165, _757);
    float _769 = fma(_595, _181, _759);
    float _771 = trunc(_749);
    int _773 = int(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _789 = 1.0 / _763;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _795 = float(uint(_773));
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = 1.0 / _777;
    float _805 = as_type<float>(_765) * _795;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _811 = ~_659;
    int _813 = _811 + 1;
    float _815 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = trunc(_805);
    float _823 = precise::max(_821, 0.0);
    uint _826 = uint(_823);
    float _828 = in.m_61.z;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _832 = _635 + _830;
    float _834 = float(_659);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _838 = _635 + _836;
    out.m_66.x = _797;
    out.m_66.y = _799;
    out.m_66.z = _801;
    out.m_66.w = _793;
    float _840 = _832 * _789;
    int _842 = ~_659;
    int _844 = _842 + 1;
    float _846 = 1.0 / _781;
    out.m_68.x = _815;
    out.m_68.y = _817;
    out.m_68.z = _819;
    float _848 = _133 * _834;
    float _850 = _663 * _803;
    bool _852 = !_723;
    int _854 = _852 ? 0 : 1;
    float _856 = _769 + _679;
    bool _858 = _755 > 0.0;
    float _860 = _848 * _681;
    float _862 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _753);
    int _864 = _813 * int(_826);
    int _866 = _864 + _773;
    float _868 = _645 * 2.0;
    float _870 = trunc(_860);
    int _872 = int(_870);
    bool _874 = !_675;
    int _876 = _874 ? 0 : 1;
    float _878 = _838 * _846;
    float _880 = float(uint(_866));
    float _882 = _645 + _643;
    bool _884 = !_743;
    float _886 = _884 ? (-0.5) : 0.5;
    float _888 = _828 + _643;
    bool _890 = _755 >= 0.0;
    bool _892 = isnan(_755);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = floor(_868);
    float _902 = as_type<float>(_765) * _880;
    float _904 = _882 + (-1.0);
    bool _906 = !_747;
    float _908 = _906 ? (-0.5) : 0.5;
    float _910 = _888 + (-1.0);
    bool _912 = _643 > 0.5;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = _898 ? 0 : 1;
    float _918 = trunc(_902);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    float _924 = _856 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _926 = -_886;
    int _928 = _912 ? as_type<int>(_926) : as_type<int>(_886);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _932 = !_709;
    float _934 = _932 ? _886 : as_type<float>(_928);
    float _936 = _828 * 2.0;
    int _938 = ~_916;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    int _944 = _942;
    if (!_858)
    {
        int _946 = ~_916;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    bool _952 = _900 > 0.0;
    float _954 = in.m_55.w;
    bool _956 = _900 >= 0.0;
    bool _958 = isnan(_900);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = _645 + _828;
    int _968 = int(_826) + int(_922);
    float _970 = floor(_936);
    bool _972 = _645 > 0.5;
    float _974 = _966 + (-1.0);
    float _976 = _731 * _643;
    int _978 = _964 ? 0 : 1;
    int _980 = _844 * _968;
    int _982 = _980 + _773;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _986 = -_908;
    int _988 = _972 ? as_type<int>(_986) : as_type<int>(_908);
    float _990 = floor(_976);
    int _992 = ~_978;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    float _998 = _828 + (-0.5);
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1002 = _1000 != 0;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1010 = _1008 != 0;
    int _1012 = _996;
    if (!_952)
    {
        int _1014 = ~_978;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    bool _1020 = uint(_982) >= uint(_659);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    float _1026 = _767 + _954;
    bool _1028 = !_715;
    float _1030 = _1028 ? _908 : as_type<float>(_988);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1036;
    float _1040 = -_990;
    float _1042 = _976 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1048 = fma(_1034, _840, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1054 = fma(_1038, _840, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1056 = float(_773);
    float _1058 = _1042 * _834;
    bool _1060 = !_1020;
    int _1062 = _1060 ? 0 : (-1);
    float _1064 = fma(_1046, _878, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1066 = _133 * _1024;
    bool _1068 = _1056 >= _834;
    bool _1070 = isnan(_1056);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(_834);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    float _1080 = _1026 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1082 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1084 = isnan(_635);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = exp2(_1066);
    bool _1096 = _970 > 0.0;
    bool _1098 = _970 >= 0.0;
    bool _1100 = isnan(_970);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _677 + _691;
    float _1110 = fma(_1052, _878, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1112 = ~_968;
    int _1114 = _1112 + _1062;
    int _1116 = _1114 + 1;
    float _1118 = -_1092;
    float _1120 = _1118 + 1.0;
    float _1122 = trunc(_1078);
    int _1124 = int(_1122);
    bool _1126 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1128 = isnan(_635);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1108 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _1140 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1142 = isnan(_635);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    int _1152 = _659 * _1116;
    int _1154 = _1152 + _773;
    int _1156 = _1106 ? 0 : 1;
    float _1158 = -_1094;
    float _1160 = _1158 + 1.0;
    bool _1162 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1164 = isnan(0.0);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1170 = _1166 || _1168;
    float _1172 = _1150 * _1120;
    bool _1174 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1176 = isnan(_635);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = -_1136;
    float _1188 = _1186 + 1.0;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1192 = 1.0 + _1190;
    float _1194 = -_1150;
    float _1196 = _1194 + 1.0;
    float _1198 = _1170 ? _1160 : 0.0;
    float _1200 = _1092 * _1188;
    bool _1202 = _659 == 0;
    float _1204 = 1.0 / _1192;
    float _1206 = _1184 * _1196;
    int _1208 = abs(_695);
    bool _1210 = !_1202;
    int _1212 = _1210 ? _1154 : (-1);
    float _1214 = _1048 * _1206;
    float _1216 = _1054 * _1206;
    int _1218 = _659 + (-1);
    float _1220 = trunc(_1058);
    int _1222 = int(_1220);
    int _1224 = ~_1124;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    int _1230 = abs(_854);
    int _1232 = _1212 * _1228;
    float _1234 = _1198 * _1204;
    int _1236 = _1124 * _1218;
    int _1238 = _1236 + _1232;
    int _1240 = abs(_699);
    float _1242 = -_1184;
    float _1244 = _1242 + 1.0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1246;
    int _1250 = _1238 * _1208;
    float _1252 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1214);
    float _1254 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1216);
    int _1256 = abs(_876);
    float _1258 = -_133;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _719);
    int _1262 = _1222 * _1230;
    int _1264 = _1262 + _773;
    int _1266 = abs(_737);
    int _1268 = _872 * _1240;
    int _1270 = _1268 + _1250;
    float _1272 = _934 + 0.5;
    float _1274 = _1030 + (-0.5);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1276;
    float _1280 = fma(_1248, _850, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1282 = _1264 * _1256;
    int _1284 = _1282 + _1270;
    float _1286 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1260);
    float _1288 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1290 = -_1274;
    float _1292 = -_862;
    float _1294 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1292);
    int _1296 = _1222 * _1266;
    int _1298 = _1296 + _1284;
    float _1300 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1302 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1304 = ~_1156;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    float _1310 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1288);
    float _1312 = float(uint(_1298));
    float _1314 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1300);
    int _1316 = _1308;
    if (!_1096)
    {
        int _1318 = ~_1156;
        int _1320 = _1318 + 1;
        _1316 = _1320;
    }
    int _1322 = _1316;
    float _1324 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1302);
    float _1326 = fma(_1064, _1172, _1252);
    float _1328 = as_type<float>(_765) * _1312;
    float _1330 = fma(_1110, _1172, _1254);
    bool _1332 = !_1002;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1310);
    float _1338 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1314);
    float _1340 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1324);
    float _1342 = trunc(_1328);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    bool _1348 = !_1006;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_1278, _850, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _1354 = abs(_1334);
    float _1356 = fma(_1280, _1200, _1326);
    int _1358 = ~_659;
    int _1360 = _1358 + 1;
    float _1362 = in.m_70.x;
    float _1364 = in.m_70.y;
    float _1366 = in.m_70.z;
    int _1368 = abs(_1350);
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1372 = float(_1354);
    float _1374 = fma(_1352, _1200, _1330);
    float _1376 = float(_1322);
    float _1378 = _1336 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1380 = _1340 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _1382 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1384 = isnan(1.0);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1390 = _1386 || _1388;
    int _1392 = _1360 * int(_1346);
    int _1394 = _1392 + _1298;
    float _1396 = _1372 * _1376;
    float _1398 = float(_950);
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1402 = float(_1368);
    float _1404 = _1338 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1406 = float(uint(_1394));
    float _1408 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1374);
    float _1410 = _1402 * _1398;
    float _1412 = _1378 * _1370;
    float _1414 = as_type<float>(_765) * _1406;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1418 = _1396 * (-2.0);
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1422 = float(uint(_1264));
    float _1424 = _1410 * (-2.0);
    float _1426 = fma(_914, _1418, _914);
    float _1428 = fma(_1418, _1362, _1362);
    float _1430 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1420);
    float _1432 = trunc(_1414);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    float _1438 = _643 + (-0.5);
    float _1440 = as_type<float>(_765) * _1422;
    bool _1442 = !_1390;
    float _1444 = _1442 ? _133 : _1234;
    float _1446 = _1404 * _1400;
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1428);
    float _1450 = fma(_1412, 0.5, 0.5);
    float _1452 = _1380 * _1416;
    bool _1454 = !_1010;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = trunc(_1440);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = fma(_1444, _1426, _1448);
    float _1466 = fma(_984, _1424, _984);
    int _1468 = abs(_1456);
    float _1470 = fma(_1452, 0.5, 0.5);
    float _1472 = float(_1018);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1476 = int(_1346) + int(_1436);
    float _1478 = fma(_1446, 0.5, 0.5);
    int _1480 = ~_659;
    int _1482 = _1480 + 1;
    float _1484 = in.m_59.x;
    float _1486 = in.m_59.y;
    float _1488 = float(_1468);
    float _1490 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1474);
    float _1492 = _645 + (-0.5);
    int _1494 = _1482 * _1476;
    int _1496 = _1494 + _1298;
    float _1498 = fma(_1424, _1364, _1364);
    float _1500 = _1488 * _1472;
    float _1502 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1490);
    float _1504 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1356);
    bool _1506 = uint(_1496) >= uint(_659);
    float _1508 = _1500 * (-2.0);
    float _1510 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1498);
    float _1512 = _1464 * 0.15915493667125701904296875;
    bool _1514 = !_1506;
    int _1516 = _1514 ? 0 : (-1);
    float _1518 = fma(_930, _1508, _930);
    float _1520 = fma(_1508, _1366, _1366);
    float _1522 = fma(_1444, _1466, _1510);
    int _1524 = ~_1476;
    int _1526 = _1524 + _1516;
    int _1528 = _1526 + 1;
    float _1530 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1430);
    float _1532 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1520);
    float _1534 = _1522 * 0.15915493667125701904296875;
    float _1536 = -_1502;
    float _1538 = _1536 + 1.0;
    int _1540 = _659 * _1528;
    int _1542 = _1540 + _1298;
    float _1544 = fma(_1444, _1518, _1532);
    int _1546 = ~_659;
    int _1548 = _1546 + 1;
    float _1550 = _1408 * _1486;
    float _1552 = fma(_1030, _1538, _1294);
    bool _1554 = !_1202;
    int _1556 = _1554 ? _1542 : (-1);
    float _1558 = _1512 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = -_1530;
    float _1564 = _1562 + 1.0;
    float _1566 = _1544 * 0.15915493667125701904296875;
    int _1568 = _1556 >> 31;
    float _1570 = -_1564;
    float _1572 = fma(_934, _1570, _1286);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _1576 = _1512 * 6.283185482025146484375;
    float _1578 = cos(_1576);
    float _1580 = _1550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1582 = _1568 & 3;
    float _1584 = _1504 * _1484;
    int _1586 = _1548 * int(_1462);
    int _1588 = _1586 + _1264;
    float _1590 = _1580 * _1574;
    int _1592 = _1556 + _1582;
    out.m_72.x = _1572;
    out.m_72.y = _1552;
    float _1594 = _1534 * 6.283185482025146484375;
    float _1596 = sin(_1594);
    float _1598 = float(uint(_1588));
    float _1600 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1602 = _1592 >> 2;
    int _1604 = _1556 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1610 = _1608 != 0;
    float _1612 = _1534 * 6.283185482025146484375;
    float _1614 = cos(_1612);
    int _1616 = _1602 << 4;
    int _1618 = _1616 + 368;
    float _1620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    int _1622 = _1556 & 3;
    bool _1624 = _1622 != 0;
    bool _1626 = uint(_1622) > 1u;
    float _1628 = floor(_1450);
    float _1630 = _1578 * _1596;
    float _1632 = _1566 * 6.283185482025146484375;
    float _1634 = sin(_1632);
    float _1636 = _1560 * _1614;
    float _1638 = _1566 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = -_1628;
    float _1644 = _1450 + _1642;
    float _1646 = as_type<float>(_765) * _1598;
    float _1648 = _1560 * _1596;
    float _1650 = -_1630;
    float _1652 = fma(_1634, _1636, _1650);
    float _1654 = -_1636;
    float _1656 = fma(_1634, _1630, _1654);
    float _1658 = floor(_1470);
    uint _1660 = uint(int(uint(_1618) >> uint(2)));
    uint _1662 = uint(int(uint(int(_1660)) >> uint(2)));
    int _1664 = int(_1660) & 3;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[int(_1662)][_1664];
    int _1668 = int(_1660) + 1;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    int _1672 = _1668 & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    float _1676 = -_1590;
    float _1678 = _1634 * _1676;
    float _1680 = _1596 * _1640;
    float _1682 = _1614 * _1640;
    float _1684 = floor(_1478);
    float _1686 = _1640 * _1590;
    int _1688 = _1618 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    float _1706 = trunc(_1646);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    float _1712 = -_1658;
    float _1714 = _1470 + _1712;
    float _1716 = _1578 * _1614;
    float _1718 = fma(_1714, 2.0, -1.0);
    float _1720 = fma(_1634, _1648, _1716);
    float _1722 = -_1684;
    float _1724 = _1478 + _1722;
    float _1726 = fma(_1634, _1716, _1648);
    float _1728 = _1600 * _1620;
    float _1730 = fma(_1724, 2.0, -1.0);
    float _1732 = fma(_1682, _1728, _1678);
    float _1734 = _1578 * _1686;
    int _1736 = int(_1462) + int(_1710);
    float _1738 = _1560 * _1686;
    int _1740 = _1606 ? 0 : 1;
    float _1742 = fma(_1644, 2.0, -1.0);
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1746 = ~_659;
    int _1748 = _1746 + 1;
    float _1750 = fma(_1726, _1728, _1734);
    int _1752 = ~_1740;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    int _1760 = _1756;
    float _1762 = _1730;
    float _1764 = _1742;
    float _1766 = _1728;
    if (!_1626)
    {
        int _1768 = ~_1740;
        int _1770 = _1768 + 1;
        _1760 = _1770;
    }
    int _1772 = _1760;
    float _1774 = _1742 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1776 = _1622 != 3;
    float _1778 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    bool _1780 = uint(_1622) >= 2u;
    float _1782 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _1784 = abs(_1772);
    float _1786 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1758);
    int _1788 = _1748 * _1736;
    int _1790 = _1788 + _1264;
    int _1792 = _1780 ? 0 : 1;
    float _1794 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1778);
    bool _1796 = !_1624;
    int _1798 = _1796 ? 0 : 1;
    float _1800 = fma(_1652, _1728, _1738);
    int _1802 = ~_1784;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    float _1808 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1782);
    int _1810 = ~_1792;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    bool _1816 = _1622 != 3;
    int _1818 = _1806 * as_type<int>(_1674);
    int _1820 = abs(_1798);
    int _1822 = _1814;
    if (_1776)
    {
        int _1824 = ~_1792;
        int _1826 = _1824 + 1;
        _1822 = _1826;
    }
    int _1828 = _1822;
    bool _1830 = !_1816;
    int _1832 = _1830 ? 0 : (-1);
    bool _1834 = !_1610;
    int _1836 = _1834 ? 0 : 1;
    bool _1838 = uint(_1790) >= uint(_659);
    int _1840 = abs(_1828);
    int _1842 = ~_1820;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = abs(_1832);
    int _1850 = abs(_1836);
    int _1852 = _1846 * as_type<int>(_1666);
    int _1854 = _1852 + _1818;
    bool _1856 = !_1838;
    int _1858 = _1856 ? 0 : (-1);
    int _1860 = ~_1840;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = ~_1736;
    int _1868 = _1866 + _1858;
    int _1870 = _1868 + 1;
    int _1872 = ~_1848;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    int _1878 = _1864 * as_type<int>(_1696);
    int _1880 = _1878 + _1854;
    int _1882 = _659 * _1870;
    int _1884 = _1882 + _1264;
    float _1886 = _1718 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _1888 = _1876 * as_type<int>(_1704);
    int _1890 = _1888 + _1880;
    int _1892 = ~_1850;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1900 = !_1202;
    int _1902 = _1900 ? _1884 : (-1);
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1786);
    bool _1906 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1908 = isnan(1.0);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1914 = _1910 || _1912;
    float _1916 = fma(_1656, _1898, _1750);
    int _1918 = _1890 * _1896;
    float _1920 = fma(_1680, _1898, _1732);
    float _1922 = fma(_1720, _1898, _1800);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1926 = _1902 * _1850;
    int _1928 = _1926 + _1918;
    float _1930 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1932 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1934 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1924);
    float _1936 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1794);
    float _1938 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1930);
    float _1940 = float(_1928);
    float _1942 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1932);
    float _1944 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1934);
    float _1946 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1938);
    float _1948 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1808);
    float _1950 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1942);
    out.m_74.x = _1940;
    float _1952 = _1936 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1954 = _1904 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1956 = _1948 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1958 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1960 = _1946 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1962 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1964 = _1958 + _1952;
    float _1966 = _1960 + _1954;
    float _1968 = _1962 + _1956;
    float _1970 = _1962;
    float _1972 = as_type<float>(_1896);
    float _1974 = _1960;
    float _1976 = as_type<float>(_1896);
    float _1978 = _1958;
    float _1980 = _1960;
    float _1982 = _1962;
    float _1984 = _1968;
    float _1986 = _1904;
    float _1996;
    float _1998;
    float _2000;
    float _2002;
    if (!_1914)
    {
        bool _1988 = _1954 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1990 = !_1988;
        _1992 = _1990;
        if (!_1992)
        {
            float _1994 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1996 = _1994;
            _1998 = 0.0;
            _2000 = 0.0;
            _2002 = 0.0;
            _2004 = true;
        }
    }
    if ((!_2004) || _1992)
    {
        bool _2042;
        if (!_1992)
        {
            bool _2006 = _1954 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2008 = isnan(_1954);
            bool _2010 = _2006 || _2008;
            bool _2012 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2014 = _2010 || _2012;
            bool _2016 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2018 = !_2014;
            bool _2020 = _2016 && _2018;
            bool _2022 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2024 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2020)
            {
                _1970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2026 = _1970;
            float _2028 = _2026;
            if (_2020)
            {
                _1972 = 0.0;
            }
            float _2030 = _1972;
            _1976 = _2030;
            _1998 = _2030;
            if (_2020)
            {
                _1974 = 0.0;
            }
            float _2032 = _1974;
            _1980 = _2032;
            _2000 = _2032;
            if (_2020)
            {
                float _2034 = _2026 * 5.0;
                _2028 = _2034;
            }
            float _2036 = _2028;
            _1982 = _2036;
            _1996 = _2036;
            if (_2020)
            {
                _2024 = 0.0;
            }
            float _2038 = _2024;
            bool _2040 = !_2014;
            _2042 = _2040 && _2022;
            _1978 = _2038;
            _2002 = _2038;
        }
        if ((!_2042) || _1992)
        {
            _1992 = false;
            float _2044 = _1976;
            float _2046 = _1978;
            float _2048 = _1980;
            float _2050 = _1982;
            bool _2052 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2054 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2058 = _2044;
            float _2060 = _2046;
            float _2062 = _2048;
            float _2064 = _2050;
            if (_2052)
            {
                float _2066 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2058 = _2066;
            }
            float _2068 = _2058;
            if (_2052)
            {
                float _2070 = abs(_1742);
                float _2072 = -_2070;
                float _2074 = _2072 + 1.0;
                _2060 = _2074;
            }
            float _2076 = _2060;
            float _2078 = _2076;
            if (_2054)
            {
                float _2080 = abs(_1730);
                float _2082 = -_2080;
                float _2084 = _2082 + 1.0;
                _1762 = _2084;
            }
            float _2086 = _1762;
            if (!_2052)
            {
                _2062 = 1.0;
            }
            float _2088 = _2062;
            float _2090 = _2088;
            if (_2056)
            {
                float _2092 = abs(_1718);
                float _2094 = -_2092;
                float _2096 = _2094 + 1.0;
                _2064 = _2096;
            }
            float _2098 = _2064;
            if (!_2054)
            {
                _1764 = 1.0;
            }
            float _2100 = _1764;
            float _2102 = _1930;
            float _2104 = _2100;
            if (_2054)
            {
                float _2106 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2102 = _2106;
            }
            float _2108 = _2102;
            float _2110 = _1950;
            if (_2056)
            {
                float _2112 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2110 = _2112;
            }
            float _2114 = _2110;
            if (_2052)
            {
                float _2116 = _2076 * _2068;
                float _2118 = precise::clamp(_2116, 0.0, 1.0);
                _2090 = _2118;
            }
            float _2120 = _2090;
            if (!_2056)
            {
                _2078 = 1.0;
            }
            float _2122 = _2078;
            float _2124 = _2122;
            _1998 = _1964;
            if (_2054)
            {
                float _2126 = _2086 * _2108;
                float _2128 = precise::clamp(_2126, 0.0, 1.0);
                _2104 = _2128;
            }
            float _2130 = _2104;
            float _2132 = _2120 * _2130;
            _2000 = _1966;
            if (_2056)
            {
                float _2134 = _2098 * _2114;
                float _2136 = precise::clamp(_2134, 0.0, 1.0);
                _2124 = _2136;
            }
            float _2138 = _2124;
            float _2140 = _2132 * _2138;
            _1996 = _1968;
            _2002 = _2140;
        }
    }
    _2004 = false;
    float _2142 = _1996;
    float _2144 = _1998;
    float _2146 = _2000;
    float _2148 = _2002;
    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2152 = _2142 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2156 = _2144 + _2154;
    float _2158 = _2152 * _2152;
    float _2160 = fma(_2156, _2156, _2158);
    float _2162 = sqrt(_2160);
    bool _2164 = _2162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2166 = _2158;
    float _2168 = _2146;
    float _2170 = _2142;
    float _2172 = _2156;
    if (!_2164)
    {
        _2166 = _2144;
    }
    float _2174 = _2166;
    bool _2176 = !_2164;
    float _2178 = _2174;
    if (!_2176)
    {
        float _2180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2184 = _2162 + _2182;
        float _2186 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2188 = rsqrt(_2160);
        float _2190 = _2184 * _2180;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = _2192 * 6.283185482025146484375;
        float _2196 = cos(_2194);
        float _2198 = _2192 * 6.283185482025146484375;
        float _2200 = sin(_2198);
        float _2202 = _2196 + (-1.0);
        float _2204 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2206 = fma(_2200, _2186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2208 = fma(_2196, _2146, _2204);
        float _2210 = _2188 * _2206;
        float _2212 = fma(_2156, _2210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2214 = fma(_2152, _2210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2168 = _2208;
        _2178 = _2212;
        _2170 = _2214;
    }
    float _2216 = _2168;
    float _2218 = _2178;
    float _2220 = _2170;
    float _2222 = -_1954;
    float _2224 = _2222 + _2216;
    float _2226 = -_1952;
    float _2228 = _2226 + _2218;
    float _2230 = -_1956;
    float _2232 = _2230 + _2220;
    float _2234 = _2224 * _2224;
    float _2236 = fma(_2228, _2228, _2234);
    float _2238 = fma(_2232, _2232, _2236);
    float _2240 = sqrt(_2238);
    bool _2242 = _2240 > 0.0;
    bool _2244 = !_2242;
    float _2246 = _2240;
    float _2248 = _2218;
    float _2250 = _2220;
    float _2252 = _2216;
    if (!_2244)
    {
        bool _2254 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2256 = _1750;
        if (_2254)
        {
            float _2258 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2256 = _2258;
        }
        float _2260 = _2256;
        if (_2254)
        {
            _1984 = _597;
        }
        float _2262 = _1984;
        float _2264 = _2262;
        if (_2254)
        {
            _2172 = _599;
        }
        float _2266 = _2172;
        float _2268 = _2266;
        if (_2254)
        {
            _2246 = _601;
        }
        float _2270 = _2246;
        float _2272 = _2260;
        float _2274 = _2270;
        if (_2254)
        {
            float _2276 = _597 * _2260;
            _1986 = _2276;
        }
        float _2278 = _1986;
        float _2280 = _2278;
        if (_2254)
        {
            float _2282 = _599 * _2260;
            _1766 = _2282;
        }
        float _2284 = _1766;
        float _2286 = _2284;
        if (_2254)
        {
            float _2288 = _601 * _2260;
            _2272 = _2288;
        }
        float _2290 = _2272;
        float _2292 = _2290;
        if (!_2254)
        {
            float _2294 = _133 + 1.0;
            if (!_175)
            {
                float _2296 = _2294 * _2294;
                float _2298 = _2296 * 0.5;
                _135 = _2298;
            }
            float _2300 = _135;
            float _2302 = _2300;
            if (!_175)
            {
                float _2304 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2302 = _2304;
            }
            float _2306 = _2302;
            bool _2308 = !_175;
            float _2310 = _2306;
            if (!_2308)
            {
                float _2312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2314 = log2(_2312);
                float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2318 = 1.0 + _2316;
                float _2320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2322 = _2314 * _2294;
                float _2324 = 1.0 / _2318;
                float _2326 = _2320 * 0.693147182464599609375;
                float _2328 = exp2(_2322);
                float _2330 = 1.0 / _2326;
                float _2332 = _2328 + (-1.0);
                float _2334 = -_2332;
                float _2336 = fma(_2334, _2330, _2294);
                float _2338 = _2336 * _2324;
                float _2340 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2310 = _2340;
            }
            float _2342 = _2310;
            float _2344 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2346 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2348 = _2344 * _343;
            float _2350 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2352 = _2344 * _297;
            float _2354 = _2344 * _361;
            float _2356 = fma(_2346, _339, _2348);
            float _2358 = _2342;
            if (!_175)
            {
                _2358 = _2294;
            }
            float _2360 = _2358;
            float _2362 = fma(_2346, _289, _2352);
            float _2364 = fma(_2350, _347, _2356);
            bool _2366 = !_175;
            float _2368 = _2360;
            if (!_2366)
            {
                float _2370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2372 = log2(_2370);
                float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2376 = 1.0 + _2374;
                float _2378 = 1.0 / _2376;
                float _2380 = _2372 * _2294;
                float _2382 = exp2(_2380);
                float _2384 = -_2382;
                float _2386 = _2384 + 1.0;
                float _2388 = _2386 * _2378;
                _2368 = _2388;
            }
            float _2390 = _2368;
            float _2392 = fma(_2346, _357, _2354);
            float _2394 = fma(_2350, _301, _2362);
            float _2396 = fma(_2390, _245, _2364);
            float _2398 = fma(_2350, _365, _2392);
            float _2400 = fma(_2390, _243, _2394);
            float _2402 = -_559;
            float _2404 = _2402 + _2396;
            float _2406 = fma(_2390, _247, _2398);
            float _2408 = -_563;
            float _2410 = _2408 + _2400;
            float _2412 = _2404 * _163;
            float _2414 = _2404 * _157;
            float _2416 = _2404 * _179;
            float _2418 = -_571;
            float _2420 = _2418 + _2406;
            float _2422 = fma(_2410, _161, _2412);
            float _2424 = fma(_2410, _155, _2414);
            float _2426 = fma(_2410, _177, _2416);
            float _2428 = fma(_2420, _165, _2422);
            float _2430 = fma(_2420, _159, _2424);
            float _2432 = fma(_2420, _181, _2426);
            _2268 = _2430;
            _2264 = _2428;
            _2274 = _2432;
            _2280 = _2428;
            _2286 = _2430;
            _2292 = _2432;
            _291 = _2394;
        }
        float _2434 = _2268;
        float _2436 = _2264;
        float _2438 = _2274;
        float _2440 = _2280;
        float _2442 = _2286;
        float _2444 = _2292;
        float _2446 = _291;
        float _2448 = _2434 * _2434;
        float _2450 = rsqrt(_2238);
        float _2452 = fma(_2436, _2436, _2448);
        float _2454 = fma(_2438, _2438, _2452);
        float _2456 = sqrt(_2454);
        float _2458 = _2228 * _2450;
        float _2460 = _2224 * _2450;
        float _2462 = _2232 * _2450;
        bool _2464 = _2456 > 0.0;
        bool _2466 = !_2464;
        _293 = _2446;
        _225 = _2454;
        _227 = _2462;
        if (!_2466)
        {
            float _2468 = rsqrt(_2454);
            float _2470 = _2468 * _2434;
            float _2472 = _2468 * _2436;
            float _2474 = _2468 * _2438;
            float _2476 = _2460 * _2470;
            float _2478 = fma(_2458, _2472, _2476);
            float _2480 = fma(_2462, _2474, _2478);
            float _2482 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2484 = fma(_2440, _2482, _2218);
            float _2486 = fma(_2442, _2482, _2216);
            float _2488 = fma(_2444, _2482, _2220);
            _2248 = _2484;
            _2250 = _2488;
            _2252 = _2486;
        }
    }
    float _2490 = _2248;
    float _2492 = _2250;
    float _2494 = _2252;
    float _2496 = _293;
    float _2498 = _225;
    float _2500 = _227;
    float _2502 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2506 = isnan(0.5);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2512 = _2508 || _2510;
    bool _2514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2516 = isnan(0.5);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2522 = _2518 || _2520;
    float _2524 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2502);
    float _2526 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2528 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2524);
    float _2530 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2526);
    float _2532 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2534 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2530);
    float _2536 = _2496;
    float _2538 = _2494;
    float _2540 = _2500;
    float _2542 = _2498;
    if (_2512)
    {
        _2536 = _2490;
    }
    float _2544 = _2536;
    float _2546 = 1.0 / _2532;
    float _2548 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2550 = _2548;
    float _2552 = _2544;
    if (_2512)
    {
        _229 = _2492;
    }
    float _2554 = _229;
    float _2556 = _2548 + _2532;
    float _2558 = _2554;
    if (_2512)
    {
        _2550 = _2494;
    }
    float _2560 = _2550;
    float _2562 = _2560;
    float _2564 = _2546;
    if (!_2512)
    {
        float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2568 = _1954 + _2566;
        float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2572 = _1952 + _2570;
        float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2576 = -_1952;
        float _2578 = _2576 + _2490;
        float _2580 = _2568 * _2568;
        float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2584 = _1956 + _2582;
        float _2586 = -_1954;
        float _2588 = _2586 + _2494;
        float _2590 = -_1956;
        float _2592 = _2590 + _2492;
        float _2594 = fma(_2572, _2572, _2580);
        float _2596 = fma(_2584, _2584, _2594);
        float _2598 = sqrt(_2596);
        float _2600 = precise::min(_2598, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2602 = _2600 * _2574;
        float _2604 = fma(_2578, _2602, _1952);
        float _2606 = fma(_2588, _2602, _1954);
        float _2608 = fma(_2592, _2602, _1956);
        _2562 = _2606;
        _2552 = _2604;
        _2558 = _2608;
        _2538 = _2588;
    }
    float _2610 = _2562;
    float _2612 = _2552;
    float _2614 = _2558;
    float _2616 = _2538;
    float _2618 = _2616;
    if (_2522)
    {
        _2540 = 1.0;
    }
    float _2620 = _2540;
    float _2622 = _2556 * _2546;
    float _2624 = _2622 * 0.5;
    float _2626 = _2620;
    if (!_2522)
    {
        float _2628 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2630 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2628);
        float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2636 = 1.0 / _2630;
        float _2638 = 1.0 / _2634;
        float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2644 = fma(_2636, _2640, _2642);
        float _2646 = _2644 * _2638;
        float _2648 = precise::clamp(_2646, 0.0, 1.0);
        _2626 = _2648;
    }
    float _2650 = _2626;
    float _2652 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2654 = _2610 + _2652;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2658 = _2612 + _2656;
    float _2660 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2662 = _2614 + _2660;
    float _2664 = _2654 * _2654;
    float _2666 = fma(_2658, _2658, _2664);
    float _2668 = fma(_2662, _2662, _2666);
    float _2670 = rsqrt(_2668);
    float _2672 = sqrt(_2668);
    float _2674 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2676 = _2658 * _2674;
    float _2678 = _2662 * _2674;
    float _2680 = _2676 * _2676;
    float _2682 = _2678 * _2678;
    float _2684 = _2680 + _2682;
    float _2686 = sqrt(_2684);
    bool _2688 = _2686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2692 = _2686 + _2690;
    float _2694 = _2670;
    float _2696 = _2692;
    float _2698 = _2654;
    if (_2688)
    {
        float _2700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2694 = _2700;
    }
    float _2702 = _2694;
    if (_2688)
    {
        float _2704 = rsqrt(_2684);
        _2542 = _2704;
    }
    float _2706 = _2542;
    float _2708 = _2706;
    if (_2688)
    {
        float _2710 = _2692 * _2702;
        _2696 = _2710;
    }
    float _2712 = _2696;
    if (_2688)
    {
        float _2714 = _2712 * 0.15915493667125701904296875;
        _231 = _2714;
    }
    float _2716 = _231;
    float _2718 = _2662;
    if (_2688)
    {
        float _2720 = _2716 * 6.283185482025146484375;
        float _2722 = sin(_2720);
        _2718 = _2722;
    }
    float _2724 = _2718;
    float _2726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2728 = precise::max(0.0, _2726);
    float _2730 = _2702;
    float _2732 = _2728;
    if (_2688)
    {
        float _2734 = _2716 * 6.283185482025146484375;
        float _2736 = cos(_2734);
        _2730 = _2736;
    }
    float _2738 = _2730;
    float _2740 = -_2674;
    float _2742 = -_2728;
    float _2744 = fma(_2654, _2740, _2742);
    if (_2688)
    {
        float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2698 = _2746;
    }
    float _2748 = _2698;
    float _2750 = _2724;
    float _2752 = _2748;
    if (_2688)
    {
        float _2754 = fma(_2724, _2748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2750 = _2754;
    }
    float _2756 = _2750;
    float _2758 = _2756;
    if (!_2688)
    {
        _2752 = _2680;
    }
    float _2760 = _2752;
    float _2762 = _2760;
    float _2764 = _2738;
    if (_2688)
    {
        float _2766 = _2738 + (-1.0);
        _2732 = _2766;
    }
    float _2768 = _2732;
    float _2770 = _2768;
    if (_2688)
    {
        float _2772 = _2706 * _2756;
        _2618 = _2772;
    }
    float _2774 = _2618;
    if (!_2688)
    {
        _2708 = _2676;
    }
    float _2776 = _2708;
    float _2778 = _2776;
    if (_2688)
    {
        float _2780 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2780;
    }
    float _2782 = _2564;
    if (_2688)
    {
        float _2784 = _2676 * _2774;
        _2778 = _2784;
    }
    float _2786 = _2778;
    if (!_2688)
    {
        _2758 = _2744;
    }
    float _2788 = _2758;
    float _2790 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2792 = _2788;
    if (!_2688)
    {
        _2770 = _2678;
    }
    float _2794 = _2770;
    float _2796 = _2794;
    if (_2688)
    {
        float _2798 = fma(_2744, _2738, _2782);
        _2792 = _2798;
    }
    float _2800 = _2792;
    if (_2688)
    {
        float _2802 = _2678 * _2774;
        _2796 = _2802;
    }
    float _2804 = _2796;
    if (_2688)
    {
        float _2806 = _2786 * _2786;
        _2762 = _2806;
    }
    float _2808 = _2762;
    if (!_2688)
    {
        _2764 = _2682;
    }
    float _2810 = _2764;
    float _2812 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2814 = _2810;
    if (_2688)
    {
        float _2816 = _2804 * _2804;
        _2814 = _2816;
    }
    float _2818 = _2814;
    float _2820 = fma(_2800, _2800, _2808);
    float _2822 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2824 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2790);
    float _2826 = _2820 + _2818;
    float _2828 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2822);
    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2832 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2830);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = rsqrt(_2826);
    float _2838 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2840 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2828);
    float _2842 = -_2834;
    float _2844 = _2842 + 1.0;
    float _2846 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2848 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2838);
    float _2850 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2852 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2824);
    float _2854 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2846);
    float _2856 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2848);
    float _2858 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2860 = abs(_2844);
    float _2862 = log2(_2860);
    float _2864 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2854);
    float _2866 = _2856 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2868 = -_2858;
    float _2870 = fma(_2868, _2812, 1.0);
    float _2872 = _2852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2874 = _2836 * _2786;
    float _2876 = _2864 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2878 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2880 = _2836 * _2800;
    float _2882 = _2874 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2884 = _2836 * _2804;
    float _2886 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2878);
    float _2888 = log2(_2870);
    float _2890 = -_2882;
    float _2892 = fma(_2880, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2890);
    float _2894 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2886);
    float _2896 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2898 = -_2884;
    float _2900 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2892);
    float _2902 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2904 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2894);
    float _2906 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2908 = fma(_2900, -0.5, 0.5);
    float _2910 = exp2(_2896);
    float _2912 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2902);
    float _2914 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2906);
    float _2916 = fma(_2900, 0.5, 0.5);
    float _2918 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2912);
    float _2920 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2914);
    float _2922 = fma(_2916, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2924 = 1.0 / _2904;
    float _2926 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2918);
    float _2928 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2920);
    float _2930 = _2880 + 1.0;
    float _2932 = fma(_2916, _2922, -0.212114393711090087890625);
    float _2934 = _2888 * 0.693147182464599609375;
    float _2936 = sqrt(_2908);
    float _2938 = -_2880;
    float _2940 = fma(_2910, _2930, _2938);
    float _2942 = fma(_2916, _2932, 1.570728778839111328125);
    float _2944 = _2926 * _2924;
    float _2946 = _2928 * _2924;
    float _2948 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2950 = fma(_2940, 0.5, 0.5);
    float _2952 = fma(_2944, 0.5, 0.5);
    float _2954 = fma(_2946, -0.5, 0.5);
    float _2956 = _2936 * 0.636619746685028076171875;
    float3 _7636 = float3(_2952, _2954, _2948);
    float _2958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7636, float3(0.0), isnan(_7636)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7636, float3(0.0), isnan(_7636)), level(0.0)).x;
    float3 _7647 = float3(_2952, _2954, _2948);
    float4 _2961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7647, float3(0.0), isnan(_7647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7647, float3(0.0), isnan(_7647)), level(0.0)).xyzw;
    float _2963 = _2961.x;
    float _2965 = _2961.y;
    float _2967 = _2961.z;
    float _2969 = _2961.w;
    float _2971 = -_2942;
    float _2973 = fma(_2956, _2971, 1.0);
    float2 _7669 = float2(_2973, _2950);
    float3 _2977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7669, float2(0.0), isnan(_7669)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7669, float2(0.0), isnan(_7669)), level(0.0)).xyz;
    float _2979 = _2977.x;
    float _2981 = _2977.y;
    float _2983 = _2977.z;
    float _2985 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2987 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2989 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2991 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2993 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2985);
    float _2995 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2987);
    float _2997 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2989);
    float _2999 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2991);
    float _3001 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2993);
    float _3003 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2995);
    float _3005 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2997);
    float _3007 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2999);
    float _3009 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3011 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3013 = _3005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_76.y = 1.0;
    float _3015 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3017 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3019 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3021 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3023 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3015);
    float _3025 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3017);
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3029 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3019);
    float _3031 = _3007 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3033 = _3021 + _3023;
    float _3035 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3025);
    float _3037 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3039 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3041 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3033);
    float _3043 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3027);
    float _3045 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3035);
    float _3047 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3039);
    float _3049 = exp2(_3037);
    float _3051 = -_597;
    float _3053 = _3051 + _2612;
    float _3055 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3057 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3047);
    float _3059 = -_599;
    float _3061 = _3059 + _2610;
    float _3063 = -_601;
    float _3065 = _3063 + _2614;
    float _3067 = _3055 + _3029;
    float _3069 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3057);
    float _3071 = 1.0 / _3041;
    float _3073 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3075 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3067);
    float _3077 = _3069 + _2904;
    float _3079 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3081 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3073);
    float _3083 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3085 = -_3049;
    float _3087 = _3085 + 1.0;
    float _3089 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3081);
    float _3091 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3095 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3097 = _3077 * 0.5;
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3091);
    float _3101 = _3075 * _3071;
    float _3103 = _3045 * _3071;
    float _3105 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3079);
    float _3107 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3099);
    out.gl_Position.x = _2926;
    out.gl_Position.y = _2928;
    out.gl_Position.z = _3069;
    out.gl_Position.w = _2904;
    bool _3109 = _3103 > 0.0;
    float _3111 = 1.0 / _3095;
    float _3113 = _3083 + _3043;
    out.m_78.z = _3097;
    out.m_78.w = _2904;
    bool _3115 = _3103 < 1.0;
    bool _3117 = _3115 && _3109;
    float _3119 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3105);
    float _3121 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3113);
    float _3123 = _3107 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _3125 = _2944 > (-1.0);
    bool _3127 = _3125 && _3117;
    float _3129 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3131 = _3121 * _3071;
    bool _3133 = _2946 > (-1.0);
    bool _3135 = _3133 && _3127;
    bool _3137 = _2944 < 1.0;
    bool _3139 = _3137 && _3135;
    float _3141 = _3123 * _3111;
    float _3143 = _3129 * _3111;
    bool _3145 = _2946 < 1.0;
    bool _3147 = _3145 && _3139;
    float _3149 = _3093 * _2958;
    float _3151 = -_3093;
    float _3153 = _3151 + 1.0;
    float _3155 = _2969 * _3149;
    float _3157 = _2983 * _3149;
    float _3159 = fma(_2979, _3155, _2963);
    float _3161 = fma(_2981, _3155, _2965);
    float _3163 = _2969 * _3153;
    float _3165 = fma(_2969, _3157, _2967);
    out.m_80.x = _3159;
    out.m_80.y = _3161;
    out.m_80.z = _3165;
    out.m_80.w = _3163;
    bool _3167 = !_3147;
    float _3203;
    if (!_3167)
    {
        float _3169 = -_3131;
        float _3171 = _2946 + _3169;
        float _3173 = -_3101;
        float _3175 = _2944 + _3173;
        float _3177 = _2148 * _2650;
        float _3179 = -_3141;
        float _3181 = _2944 + _3179;
        float _3183 = _3171 * _3171;
        float _3185 = -_3143;
        float _3187 = _2946 + _3185;
        float _3189 = _3177 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3191 = fma(_3175, _3175, _3183);
        float _3193 = sqrt(_3191);
        bool _3195 = _3193 > 0.0;
        float _3197 = _3193;
        if (!_3195)
        {
            _3197 = _3189;
        }
        float _3199 = _3197;
        bool _3201 = !_3195;
        _3203 = _3199;
        _3205 = _3201;
        if (!_3205)
        {
            float _3207 = _3187 * _3187;
            float _3209 = fma(_3181, _3181, _3207);
            float _3211 = rsqrt(_3191);
            float _3213 = sqrt(_3209);
            float _3215 = _3175 * _3211;
            float _3217 = _3171 * _3211;
            bool _3219 = _3213 > 0.0;
            float _3221 = _3211;
            if (!_3219)
            {
                _3221 = _3189;
            }
            float _3223 = _3221;
            bool _3225 = !_3219;
            _3203 = _3223;
            _3205 = _3225;
            if (!_3205)
            {
                float _3227 = _1600 * _3031;
                float _3229 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3231 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3021);
                float _3233 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3055);
                float _3235 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3083);
                float _3237 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3231);
                float _3239 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3235);
                float _3241 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3233);
                float _3243 = rsqrt(_3209);
                float _3245 = _3229 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3247 = 1.0 / _3237;
                float _3249 = _3187 * _3245;
                float _3251 = _3181 * _3245;
                float _3253 = _3249 * _3249;
                float _3255 = fma(_3251, _3251, _3253);
                float _3257 = _3187 * _3243;
                float _3259 = _3181 * _3243;
                float _3261 = _3217 * _3257;
                float _3263 = sqrt(_3255);
                float _3265 = _3239 * _3247;
                float _3267 = _3241 * _3247;
                float _3269 = fma(_3215, _3259, _3261);
                float _3271 = _3265 * _3265;
                float _3273 = precise::min(0.0, _3269);
                float _3275 = fma(_3267, _3267, _3271);
                float _3277 = sqrt(_3275);
                float _3279 = _2904 * _3273;
                float _3281 = fma(_3251, _3279, _2926);
                float _3283 = fma(_3249, _3279, _2928);
                out.gl_Position.x = _3281;
                out.gl_Position.y = _3283;
                float _3285 = fma(_3263, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3277);
                float _3287 = 1.0 / _3285;
                float _3289 = _3277 * _3287;
                out.m_76.y = _3289;
                _3203 = _3189;
                _3205 = true;
            }
        }
    }
    else
    {
        float _3291 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3291;
        _3203 = 0.0;
    }
    _3205 = false;
    float _3293 = _3203;
    bool _3295 = _2650 > 0.0;
    bool _3297 = isnan(_2650);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan(0.0);
    bool _3303 = _3299 || _3301;
    float _3305 = _3293 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _3305;
    if (_3303)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3307 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3307;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3205 = false;
    bool _2004 = false;
    bool _1992 = false;
    bool _627 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3364 = as_type<float>(_115);
        out.gl_Position.z = _3364;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3434 = as_type<float>(_153);
        out.gl_Position.z = _3434;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_57.x;
    float _179 = in.m_57.y;
    float _181 = in.m_57.z;
    float _183 = in.m_59.w;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = _155 * _155;
    float _193 = _157 * _157;
    float _195 = fma(_161, _161, _191);
    float _197 = fma(_163, _163, _193);
    float _199 = fma(_177, _177, _195);
    float _201 = _159 * _159;
    float _203 = fma(_179, _179, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_165, _165, _201);
    float _209 = fma(_181, _181, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = 0.0;
    float _221 = _203;
    float _223 = _199;
    float _225 = _181;
    float _227 = _179;
    float _229 = _163;
    float _231 = _165;
    if (_215)
    {
        float _233 = rsqrt(_199);
        _219 = _233;
    }
    float _235 = _219;
    float _237 = 0.0;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _213 > 0.0;
    float _243 = in.m_51.x;
    float _245 = in.m_51.y;
    float _247 = in.m_51.z;
    float _249 = 0.0;
    float _251 = _239;
    if (!_215)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = 0.0;
    float _259 = _253;
    if (!_217)
    {
        _255 = 0.0;
        _257 = 0.0;
    }
    float _261 = _255;
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _261;
    float _269 = _263;
    if (_217)
    {
        float _271 = rsqrt(_203);
        _265 = _271;
    }
    float _273 = _265;
    float _275 = 0.0;
    if (!_215)
    {
        _275 = 0.0;
    }
    float _277 = _275;
    float _279 = 0.0;
    float _281 = _277;
    if (_241)
    {
        float _283 = rsqrt(_209);
        _279 = _283;
    }
    float _285 = _279;
    if (_215)
    {
        float _287 = _235 * _161;
        _251 = _287;
    }
    float _289 = _251;
    float _291 = _289;
    float _293 = _289;
    if (_215)
    {
        float _295 = _235 * _155;
        _259 = _295;
    }
    float _297 = _259;
    if (_215)
    {
        float _299 = _235 * _177;
        _281 = _299;
    }
    float _301 = _281;
    float _303 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _305 = 0.0;
    float _307 = 0.0;
    float _309 = _303;
    if (!_241)
    {
        _305 = 0.0;
        _307 = 0.0;
    }
    float _311 = _305;
    float _313 = _307;
    float _315 = _313;
    float _317 = _311;
    if (!_217)
    {
        _221 = 0.0;
    }
    float _319 = _221;
    float _321 = _319;
    if (!_175)
    {
        float _323 = _303 * _303;
        float _325 = _323 * 0.5;
        _223 = _325;
    }
    float _327 = _223;
    float _329 = 0.0;
    float _331 = _327;
    if (!_241)
    {
        _329 = 0.0;
    }
    float _333 = _329;
    float _335 = _333;
    if (_217)
    {
        float _337 = _273 * _163;
        _321 = _337;
    }
    float _339 = _321;
    if (_217)
    {
        float _341 = _273 * _157;
        _267 = _341;
    }
    float _343 = _267;
    if (_217)
    {
        float _345 = _273 * _179;
        _269 = _345;
    }
    float _347 = _269;
    if (!_175)
    {
        float _349 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _349;
    }
    float _351 = _331;
    float _353 = _351;
    if (_241)
    {
        float _355 = _285 * _165;
        _315 = _355;
    }
    float _357 = _315;
    if (_241)
    {
        float _359 = _285 * _159;
        _317 = _359;
    }
    float _361 = _317;
    if (_241)
    {
        float _363 = _285 * _181;
        _335 = _363;
    }
    float _365 = _335;
    bool _367 = !_175;
    if (!_367)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = _303 * _371;
        float _381 = 1.0 / _375;
        float _383 = _377 * 0.693147182464599609375;
        float _385 = exp2(_379);
        float _387 = 1.0 / _383;
        float _389 = _385 + (-1.0);
        float _391 = -_389;
        float _393 = fma(_391, _387, _303);
        float _395 = _393 * _381;
        float _397 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _353 = _397;
    }
    float _399 = _353;
    float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _403 = !_175;
    float _405 = _401;
    float _407 = _399;
    if (!_403)
    {
        float _409 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _411 = log2(_409);
        float _413 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _415 = _413 + 1.0;
        float _417 = 1.0 / _415;
        float _419 = _303 * _411;
        float _421 = exp2(_419);
        float _423 = -_421;
        float _425 = _423 + 1.0;
        float _427 = _425 * _417;
        _309 = _427;
    }
    float _429 = _309;
    float _431 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _433 = _401 * _297;
    float _435 = _401 * _343;
    float _437 = _401 * _361;
    float _439 = _429;
    if (!_175)
    {
        float _441 = _133 * _133;
        float _443 = _441 * 0.5;
        _405 = _443;
    }
    float _445 = _405;
    float _447 = fma(_431, _289, _433);
    float _449 = fma(_431, _339, _435);
    float _451 = fma(_431, _357, _437);
    float _453 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_175)
    {
        float _455 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _407 = _455;
    }
    float _457 = _407;
    bool _459 = !_175;
    float _461 = _457;
    if (!_459)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = _133 * _465;
        float _475 = 1.0 / _469;
        float _477 = _471 * 0.693147182464599609375;
        float _479 = exp2(_473);
        float _481 = 1.0 / _477;
        float _483 = _479 + (-1.0);
        float _485 = -_483;
        float _487 = fma(_485, _481, _133);
        float _489 = _487 * _475;
        float _491 = _489 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _491;
    }
    float _493 = _461;
    float _495 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _497 = fma(_453, _301, _447);
    float _499 = fma(_453, _347, _449);
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _503 = _495 * _297;
    float _505 = _495 * _343;
    float _507 = _495 * _361;
    float _509 = fma(_453, _365, _451);
    float _511 = fma(_501, _289, _503);
    float _513 = fma(_501, _339, _505);
    float _515 = fma(_501, _357, _507);
    float _517 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _519 = fma(_429, _243, _497);
    float _521 = fma(_429, _245, _499);
    float _523 = fma(_429, _247, _509);
    float _525 = fma(_517, _301, _511);
    float _527 = fma(_517, _347, _513);
    float _529 = fma(_517, _365, _515);
    if (!_175)
    {
        _439 = _133;
    }
    float _531 = _439;
    bool _533 = !_175;
    float _535 = _531;
    if (!_533)
    {
        float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _539 = log2(_537);
        float _541 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _543 = _541 + 1.0;
        float _545 = 1.0 / _543;
        float _547 = _133 * _539;
        float _549 = exp2(_547);
        float _551 = -_549;
        float _553 = _551 + 1.0;
        float _555 = _553 * _545;
        _535 = _555;
    }
    float _557 = _535;
    float _559 = fma(_557, _245, _527);
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _563 = fma(_557, _243, _525);
    float _565 = fma(_521, _183, _187);
    float _567 = -_559;
    float _569 = _521 + _567;
    float _571 = fma(_557, _247, _529);
    float _573 = fma(_519, _183, _185);
    float _575 = -_563;
    float _577 = _519 + _575;
    float _579 = _569 * _163;
    float _581 = _569 * _157;
    float _583 = _569 * _179;
    float _585 = -_571;
    float _587 = _523 + _585;
    float _589 = fma(_577, _161, _579);
    float _591 = fma(_577, _155, _581);
    float _593 = fma(_577, _177, _583);
    float _595 = fma(_523, _183, _189);
    float _597 = fma(_587, _165, _589);
    float _599 = fma(_587, _159, _591);
    float _601 = fma(_587, _181, _593);
    bool _603 = !_561;
    float _623;
    float _625;
    if (!_603)
    {
        float _605 = in.m_61.x;
        float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _609 = float(_99);
        float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _615 = _613 * _607;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = _609;
        _627 = true;
    }
    else
    {
        float _629 = float(_99);
        float _631 = 1.0 / _629;
        float _633 = _133 * _631;
        _623 = _633;
        _625 = _629;
    }
    _627 = false;
    float _635 = _623;
    float _637 = _625;
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _641 = int(_639);
    float _643 = in.m_61.x;
    float _645 = in.m_61.y;
    float _647 = _565 * _157;
    float _649 = as_type<float>(int(gl_VertexIndex));
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _653 = _651 != 0;
    float _655 = fma(_573, _155, _647);
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _659 = int(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _635 + _661;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _675 = _673 != 0;
    float _677 = fma(_595, _159, _655);
    float _679 = in.m_57.w;
    float _681 = 1.0 / _637;
    float _683 = float(_641);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _689 = _687 != 0;
    float _691 = in.m_53.w;
    bool _693 = !_671;
    int _695 = _693 ? 0 : 1;
    bool _697 = !_667;
    int _699 = _697 ? 0 : 1;
    float _701 = 1.0 / _683;
    float _703 = float(uint(_659));
    float _705 = _643 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _709 = _707 != 0;
    float _711 = _645 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _715 = _713 != 0;
    float _717 = -_685;
    float _719 = fma(_705, 2.0, _717);
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _723 = _721 != 0;
    float _725 = 1.0 / _703;
    float _727 = _565 * _179;
    bool _729 = !_653;
    float _731 = _729 ? 7.345489978790283203125 : 1.0;
    float _733 = _643 * 2.0;
    bool _735 = !_689;
    int _737 = _735 ? 0 : 1;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _741 = as_type<int>(_649) & 1;
    bool _743 = _741 != 0;
    int _745 = as_type<int>(_649) & 2;
    bool _747 = _745 != 0;
    float _749 = _133 * _701;
    float _751 = _565 * _163;
    float _753 = fma(_711, -2.0, _739);
    float _755 = floor(_733);
    float _757 = fma(_573, _161, _751);
    float _759 = fma(_573, _177, _727);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _761;
    int _765 = as_type<int>(_725) + (-2);
    float _767 = fma(_595, _165, _757);
    float _769 = fma(_595, _181, _759);
    float _771 = trunc(_749);
    int _773 = int(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _789 = 1.0 / _763;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _795 = float(uint(_773));
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = 1.0 / _777;
    float _805 = as_type<float>(_765) * _795;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _811 = ~_659;
    int _813 = _811 + 1;
    float _815 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = trunc(_805);
    float _823 = precise::max(_821, 0.0);
    uint _826 = uint(_823);
    float _828 = in.m_61.z;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _832 = _635 + _830;
    float _834 = float(_659);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _838 = _635 + _836;
    out.m_66.x = _797;
    out.m_66.y = _799;
    out.m_66.z = _801;
    out.m_66.w = _793;
    float _840 = _832 * _789;
    int _842 = ~_659;
    int _844 = _842 + 1;
    float _846 = 1.0 / _781;
    out.m_68.x = _815;
    out.m_68.y = _817;
    out.m_68.z = _819;
    float _848 = _133 * _834;
    float _850 = _663 * _803;
    bool _852 = !_723;
    int _854 = _852 ? 0 : 1;
    float _856 = _769 + _679;
    bool _858 = _755 > 0.0;
    float _860 = _848 * _681;
    float _862 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _753);
    int _864 = _813 * int(_826);
    int _866 = _864 + _773;
    float _868 = _645 * 2.0;
    float _870 = trunc(_860);
    int _872 = int(_870);
    bool _874 = !_675;
    int _876 = _874 ? 0 : 1;
    float _878 = _838 * _846;
    float _880 = float(uint(_866));
    float _882 = _645 + _643;
    bool _884 = !_743;
    float _886 = _884 ? (-0.5) : 0.5;
    float _888 = _828 + _643;
    bool _890 = _755 >= 0.0;
    bool _892 = isnan(_755);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = floor(_868);
    float _902 = as_type<float>(_765) * _880;
    float _904 = _882 + (-1.0);
    bool _906 = !_747;
    float _908 = _906 ? (-0.5) : 0.5;
    float _910 = _888 + (-1.0);
    bool _912 = _643 > 0.5;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = _898 ? 0 : 1;
    float _918 = trunc(_902);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    float _924 = _856 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _926 = -_886;
    int _928 = _912 ? as_type<int>(_926) : as_type<int>(_886);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _932 = !_709;
    float _934 = _932 ? _886 : as_type<float>(_928);
    float _936 = _828 * 2.0;
    int _938 = ~_916;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    int _944 = _942;
    if (!_858)
    {
        int _946 = ~_916;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    bool _952 = _900 > 0.0;
    float _954 = in.m_55.w;
    bool _956 = _900 >= 0.0;
    bool _958 = isnan(_900);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = _645 + _828;
    int _968 = int(_826) + int(_922);
    float _970 = floor(_936);
    bool _972 = _645 > 0.5;
    float _974 = _966 + (-1.0);
    float _976 = _731 * _643;
    int _978 = _964 ? 0 : 1;
    int _980 = _844 * _968;
    int _982 = _980 + _773;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _986 = -_908;
    int _988 = _972 ? as_type<int>(_986) : as_type<int>(_908);
    float _990 = floor(_976);
    int _992 = ~_978;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    float _998 = _828 + (-0.5);
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1002 = _1000 != 0;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1010 = _1008 != 0;
    int _1012 = _996;
    if (!_952)
    {
        int _1014 = ~_978;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    bool _1020 = uint(_982) >= uint(_659);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    float _1026 = _767 + _954;
    bool _1028 = !_715;
    float _1030 = _1028 ? _908 : as_type<float>(_988);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1036;
    float _1040 = -_990;
    float _1042 = _976 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1048 = fma(_1034, _840, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1054 = fma(_1038, _840, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1056 = float(_773);
    float _1058 = _1042 * _834;
    bool _1060 = !_1020;
    int _1062 = _1060 ? 0 : (-1);
    float _1064 = fma(_1046, _878, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1066 = _133 * _1024;
    bool _1068 = _1056 >= _834;
    bool _1070 = isnan(_1056);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(_834);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    float _1080 = _1026 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1082 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1084 = isnan(_635);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = exp2(_1066);
    bool _1096 = _970 > 0.0;
    bool _1098 = _970 >= 0.0;
    bool _1100 = isnan(_970);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _677 + _691;
    float _1110 = fma(_1052, _878, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1112 = ~_968;
    int _1114 = _1112 + _1062;
    int _1116 = _1114 + 1;
    float _1118 = -_1092;
    float _1120 = _1118 + 1.0;
    float _1122 = trunc(_1078);
    int _1124 = int(_1122);
    bool _1126 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1128 = isnan(_635);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1108 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _1140 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1142 = isnan(_635);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    int _1152 = _659 * _1116;
    int _1154 = _1152 + _773;
    int _1156 = _1106 ? 0 : 1;
    float _1158 = -_1094;
    float _1160 = _1158 + 1.0;
    bool _1162 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1164 = isnan(0.0);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1170 = _1166 || _1168;
    float _1172 = _1150 * _1120;
    bool _1174 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1176 = isnan(_635);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = -_1136;
    float _1188 = _1186 + 1.0;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1192 = 1.0 + _1190;
    float _1194 = -_1150;
    float _1196 = _1194 + 1.0;
    float _1198 = _1170 ? _1160 : 0.0;
    float _1200 = _1092 * _1188;
    bool _1202 = _659 == 0;
    float _1204 = 1.0 / _1192;
    float _1206 = _1184 * _1196;
    int _1208 = abs(_695);
    bool _1210 = !_1202;
    int _1212 = _1210 ? _1154 : (-1);
    float _1214 = _1048 * _1206;
    float _1216 = _1054 * _1206;
    int _1218 = _659 + (-1);
    float _1220 = trunc(_1058);
    int _1222 = int(_1220);
    int _1224 = ~_1124;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    int _1230 = abs(_854);
    int _1232 = _1212 * _1228;
    float _1234 = _1198 * _1204;
    int _1236 = _1124 * _1218;
    int _1238 = _1236 + _1232;
    int _1240 = abs(_699);
    float _1242 = -_1184;
    float _1244 = _1242 + 1.0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1246;
    int _1250 = _1238 * _1208;
    float _1252 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1214);
    float _1254 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1216);
    int _1256 = abs(_876);
    float _1258 = -_133;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _719);
    int _1262 = _1222 * _1230;
    int _1264 = _1262 + _773;
    int _1266 = abs(_737);
    int _1268 = _872 * _1240;
    int _1270 = _1268 + _1250;
    float _1272 = _934 + 0.5;
    float _1274 = _1030 + (-0.5);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1276;
    float _1280 = fma(_1248, _850, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1282 = _1264 * _1256;
    int _1284 = _1282 + _1270;
    float _1286 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1260);
    float _1288 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1290 = -_1274;
    float _1292 = -_862;
    float _1294 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1292);
    int _1296 = _1222 * _1266;
    int _1298 = _1296 + _1284;
    float _1300 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1302 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1304 = ~_1156;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    float _1310 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1288);
    float _1312 = float(uint(_1298));
    float _1314 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1300);
    int _1316 = _1308;
    if (!_1096)
    {
        int _1318 = ~_1156;
        int _1320 = _1318 + 1;
        _1316 = _1320;
    }
    int _1322 = _1316;
    float _1324 = fma(_1080, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1302);
    float _1326 = fma(_1064, _1172, _1252);
    float _1328 = as_type<float>(_765) * _1312;
    float _1330 = fma(_1110, _1172, _1254);
    bool _1332 = !_1002;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1310);
    float _1338 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1314);
    float _1340 = fma(_924, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1324);
    float _1342 = trunc(_1328);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    bool _1348 = !_1006;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_1278, _850, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _1354 = abs(_1334);
    float _1356 = fma(_1280, _1200, _1326);
    int _1358 = ~_659;
    int _1360 = _1358 + 1;
    float _1362 = in.m_70.x;
    float _1364 = in.m_70.y;
    float _1366 = in.m_70.z;
    int _1368 = abs(_1350);
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1372 = float(_1354);
    float _1374 = fma(_1352, _1200, _1330);
    float _1376 = float(_1322);
    float _1378 = _1336 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1380 = _1340 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _1382 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1384 = isnan(1.0);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1390 = _1386 || _1388;
    int _1392 = _1360 * int(_1346);
    int _1394 = _1392 + _1298;
    float _1396 = _1372 * _1376;
    float _1398 = float(_950);
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1402 = float(_1368);
    float _1404 = _1338 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1406 = float(uint(_1394));
    float _1408 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1374);
    float _1410 = _1402 * _1398;
    float _1412 = _1378 * _1370;
    float _1414 = as_type<float>(_765) * _1406;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1418 = _1396 * (-2.0);
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1422 = float(uint(_1264));
    float _1424 = _1410 * (-2.0);
    float _1426 = fma(_914, _1418, _914);
    float _1428 = fma(_1418, _1362, _1362);
    float _1430 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1420);
    float _1432 = trunc(_1414);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    float _1438 = _643 + (-0.5);
    float _1440 = as_type<float>(_765) * _1422;
    bool _1442 = !_1390;
    float _1444 = _1442 ? _133 : _1234;
    float _1446 = _1404 * _1400;
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1428);
    float _1450 = fma(_1412, 0.5, 0.5);
    float _1452 = _1380 * _1416;
    bool _1454 = !_1010;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = trunc(_1440);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = fma(_1444, _1426, _1448);
    float _1466 = fma(_984, _1424, _984);
    int _1468 = abs(_1456);
    float _1470 = fma(_1452, 0.5, 0.5);
    float _1472 = float(_1018);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1476 = int(_1346) + int(_1436);
    float _1478 = fma(_1446, 0.5, 0.5);
    int _1480 = ~_659;
    int _1482 = _1480 + 1;
    float _1484 = in.m_59.x;
    float _1486 = in.m_59.y;
    float _1488 = float(_1468);
    float _1490 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1474);
    float _1492 = _645 + (-0.5);
    int _1494 = _1482 * _1476;
    int _1496 = _1494 + _1298;
    float _1498 = fma(_1424, _1364, _1364);
    float _1500 = _1488 * _1472;
    float _1502 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1490);
    float _1504 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1356);
    bool _1506 = uint(_1496) >= uint(_659);
    float _1508 = _1500 * (-2.0);
    float _1510 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1498);
    float _1512 = _1464 * 0.15915493667125701904296875;
    bool _1514 = !_1506;
    int _1516 = _1514 ? 0 : (-1);
    float _1518 = fma(_930, _1508, _930);
    float _1520 = fma(_1508, _1366, _1366);
    float _1522 = fma(_1444, _1466, _1510);
    int _1524 = ~_1476;
    int _1526 = _1524 + _1516;
    int _1528 = _1526 + 1;
    float _1530 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1430);
    float _1532 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1520);
    float _1534 = _1522 * 0.15915493667125701904296875;
    float _1536 = -_1502;
    float _1538 = _1536 + 1.0;
    int _1540 = _659 * _1528;
    int _1542 = _1540 + _1298;
    float _1544 = fma(_1444, _1518, _1532);
    int _1546 = ~_659;
    int _1548 = _1546 + 1;
    float _1550 = _1408 * _1486;
    float _1552 = fma(_1030, _1538, _1294);
    bool _1554 = !_1202;
    int _1556 = _1554 ? _1542 : (-1);
    float _1558 = _1512 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = -_1530;
    float _1564 = _1562 + 1.0;
    float _1566 = _1544 * 0.15915493667125701904296875;
    int _1568 = _1556 >> 31;
    float _1570 = -_1564;
    float _1572 = fma(_934, _1570, _1286);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _1576 = _1512 * 6.283185482025146484375;
    float _1578 = cos(_1576);
    float _1580 = _1550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1582 = _1568 & 3;
    float _1584 = _1504 * _1484;
    int _1586 = _1548 * int(_1462);
    int _1588 = _1586 + _1264;
    float _1590 = _1580 * _1574;
    int _1592 = _1556 + _1582;
    out.m_72.x = _1572;
    out.m_72.y = _1552;
    float _1594 = _1534 * 6.283185482025146484375;
    float _1596 = sin(_1594);
    float _1598 = float(uint(_1588));
    float _1600 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1602 = _1592 >> 2;
    int _1604 = _1556 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1610 = _1608 != 0;
    float _1612 = _1534 * 6.283185482025146484375;
    float _1614 = cos(_1612);
    int _1616 = _1602 << 4;
    int _1618 = _1616 + 368;
    float _1620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    int _1622 = _1556 & 3;
    bool _1624 = _1622 != 0;
    bool _1626 = uint(_1622) > 1u;
    float _1628 = floor(_1450);
    float _1630 = _1578 * _1596;
    float _1632 = _1566 * 6.283185482025146484375;
    float _1634 = sin(_1632);
    float _1636 = _1560 * _1614;
    float _1638 = _1566 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = -_1628;
    float _1644 = _1450 + _1642;
    float _1646 = as_type<float>(_765) * _1598;
    float _1648 = _1560 * _1596;
    float _1650 = -_1630;
    float _1652 = fma(_1634, _1636, _1650);
    float _1654 = -_1636;
    float _1656 = fma(_1634, _1630, _1654);
    float _1658 = floor(_1470);
    uint _1660 = uint(int(uint(_1618) >> uint(2)));
    uint _1662 = uint(int(uint(int(_1660)) >> uint(2)));
    int _1664 = int(_1660) & 3;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[int(_1662)][_1664];
    int _1668 = int(_1660) + 1;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    int _1672 = _1668 & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    float _1676 = -_1590;
    float _1678 = _1634 * _1676;
    float _1680 = _1596 * _1640;
    float _1682 = _1614 * _1640;
    float _1684 = floor(_1478);
    float _1686 = _1640 * _1590;
    int _1688 = _1618 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    float _1706 = trunc(_1646);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    float _1712 = -_1658;
    float _1714 = _1470 + _1712;
    float _1716 = _1578 * _1614;
    float _1718 = fma(_1714, 2.0, -1.0);
    float _1720 = fma(_1634, _1648, _1716);
    float _1722 = -_1684;
    float _1724 = _1478 + _1722;
    float _1726 = fma(_1634, _1716, _1648);
    float _1728 = _1600 * _1620;
    float _1730 = fma(_1724, 2.0, -1.0);
    float _1732 = fma(_1682, _1728, _1678);
    float _1734 = _1578 * _1686;
    int _1736 = int(_1462) + int(_1710);
    float _1738 = _1560 * _1686;
    int _1740 = _1606 ? 0 : 1;
    float _1742 = fma(_1644, 2.0, -1.0);
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1746 = ~_659;
    int _1748 = _1746 + 1;
    float _1750 = fma(_1726, _1728, _1734);
    int _1752 = ~_1740;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    int _1760 = _1756;
    float _1762 = _1730;
    float _1764 = _1742;
    float _1766 = _1728;
    if (!_1626)
    {
        int _1768 = ~_1740;
        int _1770 = _1768 + 1;
        _1760 = _1770;
    }
    int _1772 = _1760;
    float _1774 = _1742 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1776 = _1622 != 3;
    float _1778 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    bool _1780 = uint(_1622) >= 2u;
    float _1782 = _1744 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _1784 = abs(_1772);
    float _1786 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1758);
    int _1788 = _1748 * _1736;
    int _1790 = _1788 + _1264;
    int _1792 = _1780 ? 0 : 1;
    float _1794 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1778);
    bool _1796 = !_1624;
    int _1798 = _1796 ? 0 : 1;
    float _1800 = fma(_1652, _1728, _1738);
    int _1802 = ~_1784;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    float _1808 = fma(_1774, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1782);
    int _1810 = ~_1792;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    bool _1816 = _1622 != 3;
    int _1818 = _1806 * as_type<int>(_1674);
    int _1820 = abs(_1798);
    int _1822 = _1814;
    if (_1776)
    {
        int _1824 = ~_1792;
        int _1826 = _1824 + 1;
        _1822 = _1826;
    }
    int _1828 = _1822;
    bool _1830 = !_1816;
    int _1832 = _1830 ? 0 : (-1);
    bool _1834 = !_1610;
    int _1836 = _1834 ? 0 : 1;
    bool _1838 = uint(_1790) >= uint(_659);
    int _1840 = abs(_1828);
    int _1842 = ~_1820;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = abs(_1832);
    int _1850 = abs(_1836);
    int _1852 = _1846 * as_type<int>(_1666);
    int _1854 = _1852 + _1818;
    bool _1856 = !_1838;
    int _1858 = _1856 ? 0 : (-1);
    int _1860 = ~_1840;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = ~_1736;
    int _1868 = _1866 + _1858;
    int _1870 = _1868 + 1;
    int _1872 = ~_1848;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    int _1878 = _1864 * as_type<int>(_1696);
    int _1880 = _1878 + _1854;
    int _1882 = _659 * _1870;
    int _1884 = _1882 + _1264;
    float _1886 = _1718 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _1888 = _1876 * as_type<int>(_1704);
    int _1890 = _1888 + _1880;
    int _1892 = ~_1850;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1900 = !_1202;
    int _1902 = _1900 ? _1884 : (-1);
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1786);
    bool _1906 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1908 = isnan(1.0);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1914 = _1910 || _1912;
    float _1916 = fma(_1656, _1898, _1750);
    int _1918 = _1890 * _1896;
    float _1920 = fma(_1680, _1898, _1732);
    float _1922 = fma(_1720, _1898, _1800);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1926 = _1902 * _1850;
    int _1928 = _1926 + _1918;
    float _1930 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1932 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1934 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1924);
    float _1936 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1794);
    float _1938 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1930);
    float _1940 = float(_1928);
    float _1942 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1932);
    float _1944 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1934);
    float _1946 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1938);
    float _1948 = fma(_1886, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1808);
    float _1950 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1942);
    out.m_74.x = _1940;
    float _1952 = _1936 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1954 = _1904 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1956 = _1948 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1958 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1960 = _1946 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1962 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1964 = _1958 + _1952;
    float _1966 = _1960 + _1954;
    float _1968 = _1962 + _1956;
    float _1970 = _1962;
    float _1972 = as_type<float>(_1896);
    float _1974 = _1960;
    float _1976 = as_type<float>(_1896);
    float _1978 = _1958;
    float _1980 = _1960;
    float _1982 = _1962;
    float _1984 = _1968;
    float _1986 = _1904;
    float _1996;
    float _1998;
    float _2000;
    float _2002;
    if (!_1914)
    {
        bool _1988 = _1954 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1990 = !_1988;
        _1992 = _1990;
        if (!_1992)
        {
            float _1994 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1996 = _1994;
            _1998 = 0.0;
            _2000 = 0.0;
            _2002 = 0.0;
            _2004 = true;
        }
    }
    if ((!_2004) || _1992)
    {
        bool _2042;
        if (!_1992)
        {
            bool _2006 = _1954 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2008 = isnan(_1954);
            bool _2010 = _2006 || _2008;
            bool _2012 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2014 = _2010 || _2012;
            bool _2016 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2018 = !_2014;
            bool _2020 = _2016 && _2018;
            bool _2022 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2024 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2020)
            {
                _1970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2026 = _1970;
            float _2028 = _2026;
            if (_2020)
            {
                _1972 = 0.0;
            }
            float _2030 = _1972;
            _1976 = _2030;
            _1998 = _2030;
            if (_2020)
            {
                _1974 = 0.0;
            }
            float _2032 = _1974;
            _1980 = _2032;
            _2000 = _2032;
            if (_2020)
            {
                float _2034 = _2026 * 5.0;
                _2028 = _2034;
            }
            float _2036 = _2028;
            _1982 = _2036;
            _1996 = _2036;
            if (_2020)
            {
                _2024 = 0.0;
            }
            float _2038 = _2024;
            bool _2040 = !_2014;
            _2042 = _2040 && _2022;
            _1978 = _2038;
            _2002 = _2038;
        }
        if ((!_2042) || _1992)
        {
            _1992 = false;
            float _2044 = _1976;
            float _2046 = _1978;
            float _2048 = _1980;
            float _2050 = _1982;
            bool _2052 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2054 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2058 = _2044;
            float _2060 = _2046;
            float _2062 = _2048;
            float _2064 = _2050;
            if (_2052)
            {
                float _2066 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2058 = _2066;
            }
            float _2068 = _2058;
            if (_2052)
            {
                float _2070 = abs(_1742);
                float _2072 = -_2070;
                float _2074 = _2072 + 1.0;
                _2060 = _2074;
            }
            float _2076 = _2060;
            float _2078 = _2076;
            if (_2054)
            {
                float _2080 = abs(_1730);
                float _2082 = -_2080;
                float _2084 = _2082 + 1.0;
                _1762 = _2084;
            }
            float _2086 = _1762;
            if (!_2052)
            {
                _2062 = 1.0;
            }
            float _2088 = _2062;
            float _2090 = _2088;
            if (_2056)
            {
                float _2092 = abs(_1718);
                float _2094 = -_2092;
                float _2096 = _2094 + 1.0;
                _2064 = _2096;
            }
            float _2098 = _2064;
            if (!_2054)
            {
                _1764 = 1.0;
            }
            float _2100 = _1764;
            float _2102 = _1930;
            float _2104 = _2100;
            if (_2054)
            {
                float _2106 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2102 = _2106;
            }
            float _2108 = _2102;
            float _2110 = _1950;
            if (_2056)
            {
                float _2112 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2110 = _2112;
            }
            float _2114 = _2110;
            if (_2052)
            {
                float _2116 = _2076 * _2068;
                float _2118 = precise::clamp(_2116, 0.0, 1.0);
                _2090 = _2118;
            }
            float _2120 = _2090;
            if (!_2056)
            {
                _2078 = 1.0;
            }
            float _2122 = _2078;
            float _2124 = _2122;
            _1998 = _1964;
            if (_2054)
            {
                float _2126 = _2086 * _2108;
                float _2128 = precise::clamp(_2126, 0.0, 1.0);
                _2104 = _2128;
            }
            float _2130 = _2104;
            float _2132 = _2120 * _2130;
            _2000 = _1966;
            if (_2056)
            {
                float _2134 = _2098 * _2114;
                float _2136 = precise::clamp(_2134, 0.0, 1.0);
                _2124 = _2136;
            }
            float _2138 = _2124;
            float _2140 = _2132 * _2138;
            _1996 = _1968;
            _2002 = _2140;
        }
    }
    _2004 = false;
    float _2142 = _1996;
    float _2144 = _1998;
    float _2146 = _2000;
    float _2148 = _2002;
    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2152 = _2142 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2156 = _2144 + _2154;
    float _2158 = _2152 * _2152;
    float _2160 = fma(_2156, _2156, _2158);
    float _2162 = sqrt(_2160);
    bool _2164 = _2162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2166 = _2158;
    float _2168 = _2146;
    float _2170 = _2142;
    float _2172 = _2156;
    if (!_2164)
    {
        _2166 = _2144;
    }
    float _2174 = _2166;
    bool _2176 = !_2164;
    float _2178 = _2174;
    if (!_2176)
    {
        float _2180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2184 = _2162 + _2182;
        float _2186 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2188 = rsqrt(_2160);
        float _2190 = _2184 * _2180;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = _2192 * 6.283185482025146484375;
        float _2196 = cos(_2194);
        float _2198 = _2192 * 6.283185482025146484375;
        float _2200 = sin(_2198);
        float _2202 = _2196 + (-1.0);
        float _2204 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2206 = fma(_2200, _2186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2208 = fma(_2196, _2146, _2204);
        float _2210 = _2188 * _2206;
        float _2212 = fma(_2156, _2210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2214 = fma(_2152, _2210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2168 = _2208;
        _2178 = _2212;
        _2170 = _2214;
    }
    float _2216 = _2168;
    float _2218 = _2178;
    float _2220 = _2170;
    float _2222 = -_1954;
    float _2224 = _2222 + _2216;
    float _2226 = -_1952;
    float _2228 = _2226 + _2218;
    float _2230 = -_1956;
    float _2232 = _2230 + _2220;
    float _2234 = _2224 * _2224;
    float _2236 = fma(_2228, _2228, _2234);
    float _2238 = fma(_2232, _2232, _2236);
    float _2240 = sqrt(_2238);
    bool _2242 = _2240 > 0.0;
    bool _2244 = !_2242;
    float _2246 = _2240;
    float _2248 = _2218;
    float _2250 = _2220;
    float _2252 = _2216;
    if (!_2244)
    {
        bool _2254 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2256 = _1750;
        if (_2254)
        {
            float _2258 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2256 = _2258;
        }
        float _2260 = _2256;
        if (_2254)
        {
            _1984 = _597;
        }
        float _2262 = _1984;
        float _2264 = _2262;
        if (_2254)
        {
            _2172 = _599;
        }
        float _2266 = _2172;
        float _2268 = _2266;
        if (_2254)
        {
            _2246 = _601;
        }
        float _2270 = _2246;
        float _2272 = _2260;
        float _2274 = _2270;
        if (_2254)
        {
            float _2276 = _597 * _2260;
            _1986 = _2276;
        }
        float _2278 = _1986;
        float _2280 = _2278;
        if (_2254)
        {
            float _2282 = _599 * _2260;
            _1766 = _2282;
        }
        float _2284 = _1766;
        float _2286 = _2284;
        if (_2254)
        {
            float _2288 = _601 * _2260;
            _2272 = _2288;
        }
        float _2290 = _2272;
        float _2292 = _2290;
        if (!_2254)
        {
            float _2294 = _133 + 1.0;
            if (!_175)
            {
                float _2296 = _2294 * _2294;
                float _2298 = _2296 * 0.5;
                _135 = _2298;
            }
            float _2300 = _135;
            float _2302 = _2300;
            if (!_175)
            {
                float _2304 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2302 = _2304;
            }
            float _2306 = _2302;
            bool _2308 = !_175;
            float _2310 = _2306;
            if (!_2308)
            {
                float _2312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2314 = log2(_2312);
                float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2318 = 1.0 + _2316;
                float _2320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2322 = _2314 * _2294;
                float _2324 = 1.0 / _2318;
                float _2326 = _2320 * 0.693147182464599609375;
                float _2328 = exp2(_2322);
                float _2330 = 1.0 / _2326;
                float _2332 = _2328 + (-1.0);
                float _2334 = -_2332;
                float _2336 = fma(_2334, _2330, _2294);
                float _2338 = _2336 * _2324;
                float _2340 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2310 = _2340;
            }
            float _2342 = _2310;
            float _2344 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2346 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2348 = _2344 * _343;
            float _2350 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2352 = _2344 * _297;
            float _2354 = _2344 * _361;
            float _2356 = fma(_2346, _339, _2348);
            float _2358 = _2342;
            if (!_175)
            {
                _2358 = _2294;
            }
            float _2360 = _2358;
            float _2362 = fma(_2346, _289, _2352);
            float _2364 = fma(_2350, _347, _2356);
            bool _2366 = !_175;
            float _2368 = _2360;
            if (!_2366)
            {
                float _2370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2372 = log2(_2370);
                float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2376 = 1.0 + _2374;
                float _2378 = 1.0 / _2376;
                float _2380 = _2372 * _2294;
                float _2382 = exp2(_2380);
                float _2384 = -_2382;
                float _2386 = _2384 + 1.0;
                float _2388 = _2386 * _2378;
                _2368 = _2388;
            }
            float _2390 = _2368;
            float _2392 = fma(_2346, _357, _2354);
            float _2394 = fma(_2350, _301, _2362);
            float _2396 = fma(_2390, _245, _2364);
            float _2398 = fma(_2350, _365, _2392);
            float _2400 = fma(_2390, _243, _2394);
            float _2402 = -_559;
            float _2404 = _2402 + _2396;
            float _2406 = fma(_2390, _247, _2398);
            float _2408 = -_563;
            float _2410 = _2408 + _2400;
            float _2412 = _2404 * _163;
            float _2414 = _2404 * _157;
            float _2416 = _2404 * _179;
            float _2418 = -_571;
            float _2420 = _2418 + _2406;
            float _2422 = fma(_2410, _161, _2412);
            float _2424 = fma(_2410, _155, _2414);
            float _2426 = fma(_2410, _177, _2416);
            float _2428 = fma(_2420, _165, _2422);
            float _2430 = fma(_2420, _159, _2424);
            float _2432 = fma(_2420, _181, _2426);
            _2268 = _2430;
            _2264 = _2428;
            _2274 = _2432;
            _2280 = _2428;
            _2286 = _2430;
            _2292 = _2432;
            _291 = _2394;
        }
        float _2434 = _2268;
        float _2436 = _2264;
        float _2438 = _2274;
        float _2440 = _2280;
        float _2442 = _2286;
        float _2444 = _2292;
        float _2446 = _291;
        float _2448 = _2434 * _2434;
        float _2450 = rsqrt(_2238);
        float _2452 = fma(_2436, _2436, _2448);
        float _2454 = fma(_2438, _2438, _2452);
        float _2456 = sqrt(_2454);
        float _2458 = _2228 * _2450;
        float _2460 = _2224 * _2450;
        float _2462 = _2232 * _2450;
        bool _2464 = _2456 > 0.0;
        bool _2466 = !_2464;
        _293 = _2446;
        _225 = _2454;
        _227 = _2462;
        if (!_2466)
        {
            float _2468 = rsqrt(_2454);
            float _2470 = _2468 * _2434;
            float _2472 = _2468 * _2436;
            float _2474 = _2468 * _2438;
            float _2476 = _2460 * _2470;
            float _2478 = fma(_2458, _2472, _2476);
            float _2480 = fma(_2462, _2474, _2478);
            float _2482 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2484 = fma(_2440, _2482, _2218);
            float _2486 = fma(_2442, _2482, _2216);
            float _2488 = fma(_2444, _2482, _2220);
            _2248 = _2484;
            _2250 = _2488;
            _2252 = _2486;
        }
    }
    float _2490 = _2248;
    float _2492 = _2250;
    float _2494 = _2252;
    float _2496 = _293;
    float _2498 = _225;
    float _2500 = _227;
    float _2502 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2506 = isnan(0.5);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2512 = _2508 || _2510;
    bool _2514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2516 = isnan(0.5);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2522 = _2518 || _2520;
    float _2524 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2502);
    float _2526 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2528 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2524);
    float _2530 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2526);
    float _2532 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2534 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2530);
    float _2536 = _2496;
    float _2538 = _2494;
    float _2540 = _2500;
    float _2542 = _2498;
    if (_2512)
    {
        _2536 = _2490;
    }
    float _2544 = _2536;
    float _2546 = 1.0 / _2532;
    float _2548 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2550 = _2548;
    float _2552 = _2544;
    if (_2512)
    {
        _229 = _2492;
    }
    float _2554 = _229;
    float _2556 = _2548 + _2532;
    float _2558 = _2554;
    if (_2512)
    {
        _2550 = _2494;
    }
    float _2560 = _2550;
    float _2562 = _2560;
    float _2564 = _2546;
    if (!_2512)
    {
        float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2568 = _1954 + _2566;
        float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2572 = _1952 + _2570;
        float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2576 = -_1952;
        float _2578 = _2576 + _2490;
        float _2580 = _2568 * _2568;
        float _2582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2584 = _1956 + _2582;
        float _2586 = -_1954;
        float _2588 = _2586 + _2494;
        float _2590 = -_1956;
        float _2592 = _2590 + _2492;
        float _2594 = fma(_2572, _2572, _2580);
        float _2596 = fma(_2584, _2584, _2594);
        float _2598 = sqrt(_2596);
        float _2600 = precise::min(_2598, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2602 = _2600 * _2574;
        float _2604 = fma(_2578, _2602, _1952);
        float _2606 = fma(_2588, _2602, _1954);
        float _2608 = fma(_2592, _2602, _1956);
        _2562 = _2606;
        _2552 = _2604;
        _2558 = _2608;
        _2538 = _2588;
    }
    float _2610 = _2562;
    float _2612 = _2552;
    float _2614 = _2558;
    float _2616 = _2538;
    float _2618 = _2616;
    if (_2522)
    {
        _2540 = 1.0;
    }
    float _2620 = _2540;
    float _2622 = _2556 * _2546;
    float _2624 = _2622 * 0.5;
    float _2626 = _2620;
    if (!_2522)
    {
        float _2628 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2630 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2628);
        float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2634 = _2632 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2636 = 1.0 / _2630;
        float _2638 = 1.0 / _2634;
        float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2644 = fma(_2636, _2640, _2642);
        float _2646 = _2644 * _2638;
        float _2648 = precise::clamp(_2646, 0.0, 1.0);
        _2626 = _2648;
    }
    float _2650 = _2626;
    float _2652 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2654 = _2610 + _2652;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2658 = _2612 + _2656;
    float _2660 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2662 = _2614 + _2660;
    float _2664 = _2654 * _2654;
    float _2666 = fma(_2658, _2658, _2664);
    float _2668 = fma(_2662, _2662, _2666);
    float _2670 = rsqrt(_2668);
    float _2672 = sqrt(_2668);
    float _2674 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2676 = _2658 * _2674;
    float _2678 = _2662 * _2674;
    float _2680 = _2676 * _2676;
    float _2682 = _2678 * _2678;
    float _2684 = _2680 + _2682;
    float _2686 = sqrt(_2684);
    bool _2688 = _2686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2692 = _2686 + _2690;
    float _2694 = _2670;
    float _2696 = _2692;
    float _2698 = _2654;
    if (_2688)
    {
        float _2700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2694 = _2700;
    }
    float _2702 = _2694;
    if (_2688)
    {
        float _2704 = rsqrt(_2684);
        _2542 = _2704;
    }
    float _2706 = _2542;
    float _2708 = _2706;
    if (_2688)
    {
        float _2710 = _2692 * _2702;
        _2696 = _2710;
    }
    float _2712 = _2696;
    if (_2688)
    {
        float _2714 = _2712 * 0.15915493667125701904296875;
        _231 = _2714;
    }
    float _2716 = _231;
    float _2718 = _2662;
    if (_2688)
    {
        float _2720 = _2716 * 6.283185482025146484375;
        float _2722 = sin(_2720);
        _2718 = _2722;
    }
    float _2724 = _2718;
    float _2726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2728 = precise::max(0.0, _2726);
    float _2730 = _2702;
    float _2732 = _2728;
    if (_2688)
    {
        float _2734 = _2716 * 6.283185482025146484375;
        float _2736 = cos(_2734);
        _2730 = _2736;
    }
    float _2738 = _2730;
    float _2740 = -_2674;
    float _2742 = -_2728;
    float _2744 = fma(_2654, _2740, _2742);
    if (_2688)
    {
        float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2698 = _2746;
    }
    float _2748 = _2698;
    float _2750 = _2724;
    float _2752 = _2748;
    if (_2688)
    {
        float _2754 = fma(_2724, _2748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2750 = _2754;
    }
    float _2756 = _2750;
    float _2758 = _2756;
    if (!_2688)
    {
        _2752 = _2680;
    }
    float _2760 = _2752;
    float _2762 = _2760;
    float _2764 = _2738;
    if (_2688)
    {
        float _2766 = _2738 + (-1.0);
        _2732 = _2766;
    }
    float _2768 = _2732;
    float _2770 = _2768;
    if (_2688)
    {
        float _2772 = _2706 * _2756;
        _2618 = _2772;
    }
    float _2774 = _2618;
    if (!_2688)
    {
        _2708 = _2676;
    }
    float _2776 = _2708;
    float _2778 = _2776;
    if (_2688)
    {
        float _2780 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2780;
    }
    float _2782 = _2564;
    if (_2688)
    {
        float _2784 = _2676 * _2774;
        _2778 = _2784;
    }
    float _2786 = _2778;
    if (!_2688)
    {
        _2758 = _2744;
    }
    float _2788 = _2758;
    float _2790 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2792 = _2788;
    if (!_2688)
    {
        _2770 = _2678;
    }
    float _2794 = _2770;
    float _2796 = _2794;
    if (_2688)
    {
        float _2798 = fma(_2744, _2738, _2782);
        _2792 = _2798;
    }
    float _2800 = _2792;
    if (_2688)
    {
        float _2802 = _2678 * _2774;
        _2796 = _2802;
    }
    float _2804 = _2796;
    if (_2688)
    {
        float _2806 = _2786 * _2786;
        _2762 = _2806;
    }
    float _2808 = _2762;
    if (!_2688)
    {
        _2764 = _2682;
    }
    float _2810 = _2764;
    float _2812 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2814 = _2810;
    if (_2688)
    {
        float _2816 = _2804 * _2804;
        _2814 = _2816;
    }
    float _2818 = _2814;
    float _2820 = fma(_2800, _2800, _2808);
    float _2822 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2824 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2790);
    float _2826 = _2820 + _2818;
    float _2828 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2822);
    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2832 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2830);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = rsqrt(_2826);
    float _2838 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2840 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2828);
    float _2842 = -_2834;
    float _2844 = _2842 + 1.0;
    float _2846 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2848 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2838);
    float _2850 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2852 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2824);
    float _2854 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2846);
    float _2856 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2848);
    float _2858 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2860 = abs(_2844);
    float _2862 = log2(_2860);
    float _2864 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2854);
    float _2866 = _2856 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2868 = -_2858;
    float _2870 = fma(_2868, _2812, 1.0);
    float _2872 = _2852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2874 = _2836 * _2786;
    float _2876 = _2864 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2878 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2880 = _2836 * _2800;
    float _2882 = _2874 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2884 = _2836 * _2804;
    float _2886 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2878);
    float _2888 = log2(_2870);
    float _2890 = -_2882;
    float _2892 = fma(_2880, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2890);
    float _2894 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2886);
    float _2896 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2898 = -_2884;
    float _2900 = fma(_2898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2892);
    float _2902 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2904 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2894);
    float _2906 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2908 = fma(_2900, -0.5, 0.5);
    float _2910 = exp2(_2896);
    float _2912 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2902);
    float _2914 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2906);
    float _2916 = fma(_2900, 0.5, 0.5);
    float _2918 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2912);
    float _2920 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2914);
    float _2922 = fma(_2916, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2924 = 1.0 / _2904;
    float _2926 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2918);
    float _2928 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2920);
    float _2930 = _2880 + 1.0;
    float _2932 = fma(_2916, _2922, -0.212114393711090087890625);
    float _2934 = _2888 * 0.693147182464599609375;
    float _2936 = sqrt(_2908);
    float _2938 = -_2880;
    float _2940 = fma(_2910, _2930, _2938);
    float _2942 = fma(_2916, _2932, 1.570728778839111328125);
    float _2944 = _2926 * _2924;
    float _2946 = _2928 * _2924;
    float _2948 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2950 = fma(_2940, 0.5, 0.5);
    float _2952 = fma(_2944, 0.5, 0.5);
    float _2954 = fma(_2946, -0.5, 0.5);
    float _2956 = _2936 * 0.636619746685028076171875;
    float3 _7636 = float3(_2952, _2954, _2948);
    float _2958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7636, float3(0.0), isnan(_7636)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7636, float3(0.0), isnan(_7636)), level(0.0)).x;
    float3 _7647 = float3(_2952, _2954, _2948);
    float4 _2961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7647, float3(0.0), isnan(_7647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7647, float3(0.0), isnan(_7647)), level(0.0)).xyzw;
    float _2963 = _2961.x;
    float _2965 = _2961.y;
    float _2967 = _2961.z;
    float _2969 = _2961.w;
    float _2971 = -_2942;
    float _2973 = fma(_2956, _2971, 1.0);
    float2 _7669 = float2(_2973, _2950);
    float3 _2977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7669, float2(0.0), isnan(_7669)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7669, float2(0.0), isnan(_7669)), level(0.0)).xyz;
    float _2979 = _2977.x;
    float _2981 = _2977.y;
    float _2983 = _2977.z;
    float _2985 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2987 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2989 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2991 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2993 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2985);
    float _2995 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2987);
    float _2997 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2989);
    float _2999 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2991);
    float _3001 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2993);
    float _3003 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2995);
    float _3005 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2997);
    float _3007 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2999);
    float _3009 = _3001 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3011 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3013 = _3005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_76.y = 1.0;
    float _3015 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3017 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3019 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3021 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3023 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3015);
    float _3025 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3017);
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3029 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3019);
    float _3031 = _3007 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3033 = _3021 + _3023;
    float _3035 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3025);
    float _3037 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3039 = _2866 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3041 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3033);
    float _3043 = fma(_3011, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3027);
    float _3045 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3035);
    float _3047 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3039);
    float _3049 = exp2(_3037);
    float _3051 = -_597;
    float _3053 = _3051 + _2612;
    float _3055 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3057 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3047);
    float _3059 = -_599;
    float _3061 = _3059 + _2610;
    float _3063 = -_601;
    float _3065 = _3063 + _2614;
    float _3067 = _3055 + _3029;
    float _3069 = fma(_2872, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3057);
    float _3071 = 1.0 / _3041;
    float _3073 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3075 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3067);
    float _3077 = _3069 + _2904;
    float _3079 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3081 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3073);
    float _3083 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3085 = -_3049;
    float _3087 = _3085 + 1.0;
    float _3089 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3081);
    float _3091 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3095 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3097 = _3077 * 0.5;
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3091);
    float _3101 = _3075 * _3071;
    float _3103 = _3045 * _3071;
    float _3105 = fma(_3053, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3079);
    float _3107 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3099);
    out.gl_Position.x = _2926;
    out.gl_Position.y = _2928;
    out.gl_Position.z = _3069;
    out.gl_Position.w = _2904;
    bool _3109 = _3103 > 0.0;
    float _3111 = 1.0 / _3095;
    float _3113 = _3083 + _3043;
    out.m_78.z = _3097;
    out.m_78.w = _2904;
    bool _3115 = _3103 < 1.0;
    bool _3117 = _3115 && _3109;
    float _3119 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3105);
    float _3121 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3113);
    float _3123 = _3107 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _3125 = _2944 > (-1.0);
    bool _3127 = _3125 && _3117;
    float _3129 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3131 = _3121 * _3071;
    bool _3133 = _2946 > (-1.0);
    bool _3135 = _3133 && _3127;
    bool _3137 = _2944 < 1.0;
    bool _3139 = _3137 && _3135;
    float _3141 = _3123 * _3111;
    float _3143 = _3129 * _3111;
    bool _3145 = _2946 < 1.0;
    bool _3147 = _3145 && _3139;
    float _3149 = _3093 * _2958;
    float _3151 = -_3093;
    float _3153 = _3151 + 1.0;
    float _3155 = _2969 * _3149;
    float _3157 = _2983 * _3149;
    float _3159 = fma(_2979, _3155, _2963);
    float _3161 = fma(_2981, _3155, _2965);
    float _3163 = _2969 * _3153;
    float _3165 = fma(_2969, _3157, _2967);
    out.m_80.x = _3159;
    out.m_80.y = _3161;
    out.m_80.z = _3165;
    out.m_80.w = _3163;
    bool _3167 = !_3147;
    float _3203;
    if (!_3167)
    {
        float _3169 = -_3131;
        float _3171 = _2946 + _3169;
        float _3173 = -_3101;
        float _3175 = _2944 + _3173;
        float _3177 = _2148 * _2650;
        float _3179 = -_3141;
        float _3181 = _2944 + _3179;
        float _3183 = _3171 * _3171;
        float _3185 = -_3143;
        float _3187 = _2946 + _3185;
        float _3189 = _3177 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3191 = fma(_3175, _3175, _3183);
        float _3193 = sqrt(_3191);
        bool _3195 = _3193 > 0.0;
        float _3197 = _3193;
        if (!_3195)
        {
            _3197 = _3189;
        }
        float _3199 = _3197;
        bool _3201 = !_3195;
        _3203 = _3199;
        _3205 = _3201;
        if (!_3205)
        {
            float _3207 = _3187 * _3187;
            float _3209 = fma(_3181, _3181, _3207);
            float _3211 = rsqrt(_3191);
            float _3213 = sqrt(_3209);
            float _3215 = _3175 * _3211;
            float _3217 = _3171 * _3211;
            bool _3219 = _3213 > 0.0;
            float _3221 = _3211;
            if (!_3219)
            {
                _3221 = _3189;
            }
            float _3223 = _3221;
            bool _3225 = !_3219;
            _3203 = _3223;
            _3205 = _3225;
            if (!_3205)
            {
                float _3227 = _1600 * _3031;
                float _3229 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3231 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3021);
                float _3233 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3055);
                float _3235 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3083);
                float _3237 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3231);
                float _3239 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3235);
                float _3241 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3233);
                float _3243 = rsqrt(_3209);
                float _3245 = _3229 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3247 = 1.0 / _3237;
                float _3249 = _3187 * _3245;
                float _3251 = _3181 * _3245;
                float _3253 = _3249 * _3249;
                float _3255 = fma(_3251, _3251, _3253);
                float _3257 = _3187 * _3243;
                float _3259 = _3181 * _3243;
                float _3261 = _3217 * _3257;
                float _3263 = sqrt(_3255);
                float _3265 = _3239 * _3247;
                float _3267 = _3241 * _3247;
                float _3269 = fma(_3215, _3259, _3261);
                float _3271 = _3265 * _3265;
                float _3273 = precise::min(0.0, _3269);
                float _3275 = fma(_3267, _3267, _3271);
                float _3277 = sqrt(_3275);
                float _3279 = _2904 * _3273;
                float _3281 = fma(_3251, _3279, _2926);
                float _3283 = fma(_3249, _3279, _2928);
                out.gl_Position.x = _3281;
                out.gl_Position.y = _3283;
                float _3285 = fma(_3263, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3277);
                float _3287 = 1.0 / _3285;
                float _3289 = _3277 * _3287;
                out.m_76.y = _3289;
                _3203 = _3189;
                _3205 = true;
            }
        }
    }
    else
    {
        float _3291 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3291;
        _3203 = 0.0;
    }
    _3205 = false;
    float _3293 = _3203;
    bool _3295 = _2650 > 0.0;
    bool _3297 = isnan(_2650);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan(0.0);
    bool _3303 = _3299 || _3301;
    float _3305 = _3293 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _3305;
    if (_3303)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3307 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3307;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

