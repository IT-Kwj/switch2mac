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
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_70 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3715 = false;
    bool _3497 = false;
    bool _639 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4000 = as_type<float>(_123);
        out.gl_Position.z = _4000;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_107);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4073 = as_type<float>(_163);
        out.gl_Position.z = _4073;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _165 * _165;
    float _193 = _169 * _169;
    float _195 = _167 * _167;
    float _197 = fma(_173, _173, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_175, _175, _195);
    float _203 = fma(_179, _179, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    float _217 = as_type<float>(int(gl_VertexIndex));
    bool _219 = _211 > 0.0;
    float _221 = _203;
    float _223 = _205;
    float _225 = _211;
    float _227 = _171;
    int _229 = as_type<int>(_173);
    if (_215)
    {
        float _231 = rsqrt(_203);
        _221 = _231;
    }
    float _233 = _221;
    float _235 = 0.0;
    if (!_215)
    {
        _235 = 0.0;
    }
    float _237 = _235;
    bool _239 = _213 > 0.0;
    float _241 = 0.0;
    float _243 = _237;
    if (!_215)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (_219)
    {
        float _251 = rsqrt(_205);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_219)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_219)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    int _265 = as_type<int>(_217) & 1;
    bool _267 = _265 != 0;
    int _269 = as_type<int>(_217) & 2;
    bool _271 = _269 != 0;
    bool _273 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _277 = _273 || _275;
    bool _279 = isnan(1.0);
    bool _281 = _277 || _279;
    float _283 = 0.0;
    float _285 = _217;
    float _287 = _263;
    if (_239)
    {
        float _289 = rsqrt(_207);
        _283 = _289;
    }
    float _291 = _283;
    if (!_215)
    {
        _285 = 0.0;
    }
    float _293 = _285;
    float _295 = _293;
    if (_215)
    {
        float _297 = _233 * _173;
        _243 = _297;
    }
    float _299 = _243;
    if (!_219)
    {
        _223 = 0.0;
    }
    float _301 = _223;
    float _303 = _301;
    if (_215)
    {
        float _305 = _233 * _165;
        _249 = _305;
    }
    float _307 = _249;
    float _309 = 0.0;
    if (!_239)
    {
        _309 = 0.0;
    }
    float _311 = _309;
    float _313 = _311;
    if (_215)
    {
        float _315 = _233 * _179;
        _295 = _315;
    }
    float _317 = _295;
    float _319 = 0.0;
    if (!_239)
    {
        _319 = 0.0;
    }
    float _321 = _319;
    float _323 = _321;
    if (_219)
    {
        float _325 = _253 * _177;
        _261 = _325;
    }
    float _327 = _261;
    if (_219)
    {
        float _329 = _253 * _169;
        _287 = _329;
    }
    float _331 = _287;
    if (!_239)
    {
        _225 = 0.0;
    }
    float _333 = _225;
    float _335 = 0.0;
    float _337 = _333;
    if (!_281)
    {
        float _339 = _171 * _171;
        float _341 = _339 * 0.5;
        _335 = _341;
    }
    float _343 = _335;
    float _345 = _343;
    if (_219)
    {
        float _347 = _253 * _183;
        _303 = _347;
    }
    float _349 = _303;
    bool _351 = !_267;
    float _353 = _351 ? (-0.5) : 0.5;
    if (_239)
    {
        float _355 = _291 * _175;
        _313 = _355;
    }
    float _357 = _313;
    if (_239)
    {
        float _359 = _291 * _167;
        _323 = _359;
    }
    float _361 = _323;
    if (_239)
    {
        float _363 = _291 * _181;
        _337 = _363;
    }
    float _365 = _337;
    bool _367 = !_271;
    float _369 = _367 ? (-0.5) : 0.5;
    float _371 = _365;
    if (!_281)
    {
        float _373 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _345 = _373;
    }
    float _375 = _345;
    bool _377 = !_281;
    float _379 = _375;
    if (!_377)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = _171 * _383;
        float _393 = 1.0 / _387;
        float _395 = _389 * 0.693147182464599609375;
        float _397 = exp2(_391);
        float _399 = 1.0 / _395;
        float _401 = _397 + (-1.0);
        float _403 = -_401;
        float _405 = fma(_403, _399, _171);
        float _407 = _405 * _393;
        float _409 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _379 = _409;
    }
    float _411 = _379;
    float _413 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _415 = !_281;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _171 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _227 = _435;
    }
    float _437 = _227;
    float _439 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _413 * _307;
    float _443 = _413 * _361;
    float _445 = _413 * _331;
    float _447 = 0.0;
    if (!_281)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _447 = _451;
    }
    float _453 = _447;
    float _455 = fma(_439, _299, _441);
    float _457 = fma(_439, _357, _443);
    float _459 = fma(_439, _327, _445);
    float _461 = _453;
    if (!_281)
    {
        float _463 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _463;
    }
    float _465 = _461;
    bool _467 = !_281;
    float _469 = _465;
    if (!_467)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = _143 * _473;
        float _479 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _481 = _479 + 1.0;
        float _483 = 1.0 / _481;
        float _485 = _475 * 0.693147182464599609375;
        float _487 = exp2(_477);
        float _489 = 1.0 / _485;
        float _491 = _487 + (-1.0);
        float _493 = -_491;
        float _495 = fma(_493, _489, _143);
        float _497 = _495 * _483;
        float _499 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _469 = _499;
    }
    float _501 = _469;
    float _503 = in.m_64.w;
    float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _507 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _509 = in.m_44.x;
    float _511 = in.m_44.y;
    float _513 = in.m_44.z;
    float _515 = _505 * _361;
    float _517 = _505 * _307;
    float _519 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _521 = _505 * _331;
    float _523 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = fma(_507, _317, _455);
    float _527 = fma(_519, _357, _515);
    float _529 = fma(_507, _365, _457);
    float _531 = fma(_507, _349, _459);
    float _533 = fma(_519, _299, _517);
    float _535 = fma(_519, _327, _521);
    float _537 = fma(_523, _365, _527);
    float _539 = fma(_437, _185, _525);
    float _541 = fma(_437, _187, _529);
    float _543 = fma(_437, _189, _531);
    float _545 = fma(_523, _317, _533);
    float _547 = fma(_523, _349, _535);
    if (!_281)
    {
        _371 = _143;
    }
    float _549 = _371;
    bool _551 = !_281;
    float _553 = _549;
    if (!_551)
    {
        float _555 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _557 = log2(_555);
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _561 = _559 + 1.0;
        float _563 = 1.0 / _561;
        float _565 = _143 * _557;
        float _567 = exp2(_565);
        float _569 = -_567;
        float _571 = _569 + 1.0;
        float _573 = _571 * _563;
        _553 = _573;
    }
    float _575 = _553;
    float _577 = fma(_575, _187, _537);
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _581 = fma(_575, _185, _545);
    float _583 = fma(_575, _189, _547);
    float _585 = -_577;
    float _587 = _541 + _585;
    float _589 = fma(_539, _503, _509);
    float _591 = -_581;
    float _593 = _539 + _591;
    float _595 = fma(_541, _503, _511);
    float _597 = _587 * _175;
    float _599 = _587 * _167;
    float _601 = _587 * _181;
    float _603 = -_583;
    float _605 = _543 + _603;
    float _607 = fma(_593, _173, _597);
    float _609 = fma(_593, _165, _599);
    float _611 = fma(_593, _179, _601);
    float _613 = fma(_543, _503, _513);
    float _615 = fma(_605, _177, _607);
    float _617 = fma(_605, _169, _609);
    float _619 = fma(_605, _183, _611);
    bool _621 = !_579;
    float _637;
    if (!_621)
    {
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _625 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_107);
        float _643 = 1.0 / _641;
        float _645 = _143 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _651 = int(_649);
    float _653 = float(_107);
    float _655 = _595 * _167;
    float _657 = fma(_589, _165, _655);
    float _659 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _661 = int(_659);
    float _663 = fma(_613, _169, _657);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _667 = float(_651);
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _671 = int(_669);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _675 = float(_661);
    float _677 = 1.0 / _667;
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _681 = int(_679);
    float _683 = float(uint(_671));
    int _685 = ~_671;
    int _687 = _685 + 1;
    bool _689 = _671 == 0;
    float _691 = 1.0 / _675;
    float _693 = _677 * _143;
    float _695 = 1.0 / _683;
    float _697 = float(uint(_681));
    float _699 = in.m_51.y;
    int _701 = ~_681;
    int _703 = _701 + 1;
    float _705 = trunc(_693);
    int _707 = int(_705);
    float _709 = _691 * _143;
    float _711 = 1.0 / _697;
    int _713 = as_type<int>(_695) + (-2);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _717 = _715 != 0;
    float _719 = trunc(_709);
    int _721 = int(_719);
    float _723 = float(uint(_707));
    float _725 = _699 * 2.0;
    float _727 = as_type<float>(_713) * _723;
    int _729 = as_type<int>(_711) + (-2);
    float _731 = 1.0 / _653;
    float _733 = _711;
    if (_717)
    {
        _733 = 1.0;
    }
    float _735 = _733;
    float _737 = _735;
    if (!_717)
    {
        _737 = 7.345489978790283203125;
    }
    float _739 = _737;
    float _741 = float(uint(_721));
    float _743 = trunc(_727);
    float _745 = precise::max(_743, 0.0);
    uint _748 = uint(_745);
    float _750 = as_type<float>(_729) * _741;
    int _752 = ~_671;
    int _754 = _752 + 1;
    float _756 = trunc(_750);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = _731 * _143;
    float _764 = float(_681);
    int _766 = _754 * int(_748);
    int _768 = _766 + _707;
    float _770 = _739 * _129;
    float _772 = float(uint(_768));
    int _774 = _703 * int(_760);
    int _776 = _774 + _721;
    float _778 = as_type<float>(_713) * _772;
    float _780 = floor(_770);
    float _782 = _772;
    float _784 = as_type<float>(_776);
    if (_717)
    {
        _782 = _129;
    }
    float _786 = _782;
    float _788 = float(uint(_776));
    float _790 = _786;
    if (_717)
    {
        _784 = 1.0;
    }
    float _792 = _784;
    float _794 = _792;
    if (!_717)
    {
        _794 = 1.2345600128173828125;
    }
    float _796 = _794;
    float _798 = trunc(_778);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    float _804 = as_type<float>(_729) * _788;
    if (!_717)
    {
        _790 = _699;
    }
    float _806 = _790;
    float _808 = _796 * _806;
    float _810 = trunc(_804);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    float _816 = float(_671);
    float _818 = -_780;
    float _820 = _770 + _818;
    float _822 = float(_707);
    float _824 = _820 * _816;
    int _826 = int(_748) + int(_802);
    float _828 = floor(_808);
    bool _830 = _822 >= _816;
    bool _832 = isnan(_822);
    bool _834 = _830 || _832;
    bool _836 = isnan(_816);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    int _842 = _687 * _826;
    int _844 = _842 + _707;
    int _846 = int(_760) + int(_814);
    float _848 = trunc(_824);
    int _850 = int(_848);
    int _852 = ~_681;
    int _854 = _852 + 1;
    bool _856 = uint(_844) >= uint(_671);
    int _858 = _854 * _846;
    int _860 = _858 + _721;
    bool _862 = !_856;
    int _864 = _862 ? 0 : (-1);
    float _866 = trunc(_840);
    int _868 = int(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _872 = _870 != 0;
    float _874 = -_828;
    float _876 = _808 + _874;
    int _878 = ~_826;
    int _880 = _878 + _864;
    int _882 = _880 + 1;
    bool _884 = !_872;
    int _886 = _884 ? 0 : 1;
    bool _888 = uint(_860) >= uint(_681);
    int _890 = _671 * _882;
    int _892 = _890 + _707;
    int _894 = abs(_886);
    bool _896 = !_888;
    int _898 = _896 ? 0 : (-1);
    int _900 = _850 * _894;
    int _902 = _900 + _707;
    bool _904 = !_689;
    int _906 = _904 ? _892 : (-1);
    int _908 = ~_868;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _924 = _922 != 0;
    int _926 = ~_846;
    int _928 = _926 + _898;
    int _930 = _928 + 1;
    float _932 = _816 * _762;
    float _934 = float(_721);
    int _936 = _906 * _912;
    bool _938 = !_920;
    int _940 = _938 ? 0 : 1;
    int _942 = _681 * _930;
    int _944 = _942 + _721;
    bool _946 = _934 >= _764;
    bool _948 = isnan(_934);
    bool _950 = _946 || _948;
    bool _952 = isnan(_764);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = trunc(_932);
    int _960 = int(_958);
    int _962 = _671 + (-1);
    bool _964 = !_916;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_940);
    int _970 = _868 * _962;
    int _972 = _970 + _936;
    int _974 = abs(_966);
    float _976 = trunc(_956);
    int _978 = int(_976);
    float _980 = _876 * _764;
    bool _982 = !_924;
    int _984 = _982 ? 0 : 1;
    float _986 = _764 * _762;
    int _988 = _972 * _968;
    int _990 = abs(_984);
    float _992 = trunc(_980);
    int _994 = int(_992);
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _998 = _996 != 0;
    int _1000 = _960 * _974;
    int _1002 = _1000 + _988;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1006 = _1004 != 0;
    float _1008 = in.m_55.w;
    bool _1010 = !_998;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = trunc(_986);
    int _1016 = int(_1014);
    bool _1018 = !_1006;
    int _1020 = _1018 ? 0 : 1;
    int _1022 = _902 * _990;
    int _1024 = _1022 + _1002;
    bool _1026 = _681 == 0;
    float _1028 = in.m_59.w;
    int _1030 = abs(_1012);
    int _1032 = abs(_1020);
    int _1034 = ~_978;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    int _1040 = _994 * _1030;
    int _1042 = _1040 + _721;
    bool _1044 = !_1026;
    int _1046 = _1044 ? _944 : (-1);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1062 = _1060 != 0;
    int _1064 = _681 + (-1);
    int _1066 = _1046 * _1038;
    bool _1068 = _671 == 0;
    int _1070 = _850 * _1032;
    int _1072 = _1070 + _1024;
    bool _1074 = !_1054;
    int _1076 = _1074 ? 0 : 1;
    int _1078 = _978 * _1064;
    int _1080 = _1078 + _1066;
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1076);
    bool _1088 = !_1058;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1084);
    int _1094 = _1080 * _1086;
    bool _1096 = !_1062;
    int _1098 = _1096 ? 0 : 1;
    int _1100 = abs(_1090);
    float _1102 = float(uint(_1072));
    int _1104 = abs(_1098);
    float _1106 = as_type<float>(_713) * _1102;
    int _1108 = _1016 * _1092;
    int _1110 = _1108 + _1094;
    float _1112 = trunc(_1106);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = ~_671;
    int _1120 = _1118 + 1;
    int _1122 = _1042 * _1100;
    int _1124 = _1122 + _1110;
    int _1126 = ~_671;
    int _1128 = _1126 + 1;
    int _1130 = _994 * _1104;
    int _1132 = _1130 + _1124;
    int _1134 = ~_681;
    int _1136 = _1134 + 1;
    float _1138 = float(uint(_1132));
    float _1140 = as_type<float>(_729) * _1138;
    int _1142 = _1128 * int(_1116);
    int _1144 = _1142 + _1072;
    float _1146 = trunc(_1140);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = float(uint(_1144));
    float _1154 = as_type<float>(_713) * _1152;
    float _1156 = trunc(_1154);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    int _1162 = _1136 * int(_1150);
    int _1164 = _1162 + _1132;
    float _1166 = float(uint(_1164));
    float _1168 = as_type<float>(_729) * _1166;
    int _1170 = int(_1116) + int(_1160);
    float _1172 = trunc(_1168);
    float _1174 = precise::max(_1172, 0.0);
    uint _1176 = uint(_1174);
    int _1178 = _1120 * _1170;
    int _1180 = _1178 + _1072;
    float _1182 = in.m_57.w;
    bool _1184 = uint(_1180) >= uint(_671);
    int _1186 = ~_681;
    int _1188 = _1186 + 1;
    bool _1190 = !_1184;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = ~_1170;
    int _1196 = _1194 + _1192;
    int _1198 = _1196 + 1;
    int _1200 = int(_1150) + int(_1176);
    int _1202 = _671 * _1198;
    int _1204 = _1202 + _1072;
    int _1206 = _1188 * _1200;
    int _1208 = _1206 + _1132;
    bool _1210 = !_1068;
    int _1212 = _1210 ? _1204 : (-1);
    bool _1214 = uint(_1208) >= uint(_681);
    int _1216 = _1212 & 3;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1214;
    int _1222 = _1220 ? 0 : (-1);
    bool _1224 = uint(_1216) > 1u;
    int _1226 = ~_1200;
    int _1228 = _1226 + _1222;
    int _1230 = _1228 + 1;
    float _1232 = _595 * _175;
    int _1234 = _1212 & 3;
    bool _1236 = _1234 != 0;
    bool _1238 = uint(_1216) >= 2u;
    int _1240 = _681 * _1230;
    int _1242 = _1240 + _1132;
    int _1244 = _1236 ? 0 : 1;
    bool _1246 = _1216 != 3;
    bool _1248 = !_1026;
    int _1250 = _1248 ? _1242 : (-1);
    int _1252 = ~_1244;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = _1238 ? 0 : 1;
    int _1260 = _1256;
    if (!_1224)
    {
        int _1262 = ~_1244;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _595 * _181;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1272 = _1270 != 0;
    float _1274 = fma(_589, _173, _1232);
    int _1276 = _1250 & 3;
    bool _1278 = _1276 != 0;
    float _1280 = in.m_51.w;
    bool _1282 = !_1272;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = fma(_589, _179, _1268);
    bool _1288 = uint(_1276) > 1u;
    float _1290 = _129 * 2.0;
    int _1292 = ~_1258;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_613, _177, _1274);
    int _1300 = _1296;
    if (_1246)
    {
        int _1302 = ~_1258;
        int _1304 = _1302 + 1;
        _1300 = _1304;
    }
    int _1306 = _1300;
    float _1308 = fma(_613, _183, _1286);
    int _1310 = _1250 & 3;
    bool _1312 = _1310 != 0;
    float _1314 = floor(_1290);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1318 = _1316 != 0;
    float _1320 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1322 = _1312 ? 0 : 1;
    float _1324 = in.m_51.z;
    float _1326 = float(uint(_902));
    bool _1328 = _1276 != 3;
    float _1330 = floor(_725);
    int _1332 = ~_1322;
    int _1334 = _1332 + 1;
    int _1336 = _1334 + 1;
    float _1338 = as_type<float>(_713) * _1326;
    bool _1340 = uint(_1276) >= 2u;
    int _1342 = _1336;
    if (!_1288)
    {
        int _1344 = ~_1322;
        int _1346 = _1344 + 1;
        _1342 = _1346;
    }
    int _1348 = _1342;
    bool _1350 = _129 > 0.5;
    float _1352 = trunc(_1338);
    float _1354 = precise::max(_1352, 0.0);
    uint _1356 = uint(_1354);
    float _1358 = float(uint(_1042));
    int _1360 = _1340 ? 0 : 1;
    float _1362 = -_353;
    int _1364 = _1350 ? as_type<int>(_1362) : as_type<int>(_353);
    float _1366 = as_type<float>(_729) * _1358;
    bool _1368 = _699 > 0.5;
    int _1370 = ~_1360;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = trunc(_1366);
    float _1378 = precise::max(_1376, 0.0);
    uint _1380 = uint(_1378);
    int _1382 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1384 = _1382 != 0;
    int _1386 = _1374;
    if (_1328)
    {
        int _1388 = ~_1360;
        int _1390 = _1388 + 1;
        _1386 = _1390;
    }
    int _1392 = _1386;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1394;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1400 = _1398 != 0;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1406 = -_369;
    int _1408 = _1368 ? as_type<int>(_1406) : as_type<int>(_369);
    bool _1410 = !_1384;
    float _1412 = _1410 ? _353 : as_type<float>(_1364);
    float _1414 = 1.0 / _1396;
    bool _1416 = !_1400;
    float _1418 = _1416 ? _369 : as_type<float>(_1408);
    int _1420 = ~_671;
    int _1422 = _1420 + 1;
    float _1424 = _1412 + 0.5;
    bool _1426 = _1324 > 0.5;
    int _1428 = ~_681;
    int _1430 = _1428 + 1;
    int _1432 = _1422 * int(_1356);
    int _1434 = _1432 + _902;
    float _1436 = 1.0 / _1404;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1440 = _1438 != 0;
    float _1442 = -_353;
    int _1444 = _1426 ? as_type<int>(_1442) : as_type<int>(_353);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1454 = _1452 != 0;
    float _1456 = -_1446;
    float _1458 = fma(_1320, 2.0, _1456);
    float _1460 = float(uint(_1434));
    int _1462 = _1430 * int(_1380);
    int _1464 = _1462 + _1042;
    bool _1466 = !_1440;
    float _1468 = _1466 ? _353 : as_type<float>(_1444);
    bool _1470 = _1280 > 0.5;
    float _1472 = as_type<float>(_713) * _1460;
    float _1474 = float(uint(_1464));
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1478 = _647 + _1476;
    float _1480 = -_369;
    int _1482 = _1470 ? as_type<int>(_1480) : as_type<int>(_369);
    float _1484 = as_type<float>(_1430);
    if (_1318)
    {
        _229 = 0;
    }
    int _1486 = _229;
    float _1488 = as_type<float>(_729) * _1474;
    bool _1490 = !_1454;
    float _1492 = _1490 ? _369 : as_type<float>(_1482);
    float _1494 = trunc(_1472);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    bool _1500 = _1314 >= 0.0;
    bool _1502 = isnan(_1314);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    float _1510 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1512 = _1486;
    float _1514 = _1510;
    if (!_1318)
    {
        _1512 = 1;
    }
    int _1516 = _1512;
    float _1518 = _1478 * _1414;
    bool _1520 = _1314 > 0.0;
    float _1522 = _1508 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1524 = trunc(_1488);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    bool _1530 = _1516 != 1;
    int _1532 = ~_671;
    int _1534 = _1532 + 1;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1538 = ~as_type<int>(_1522);
    int _1540 = _1538 + 1;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1544;
    int _1548 = _1542;
    float _1550 = _1522;
    float _1552 = _1414;
    if (!_1520)
    {
        int _1554 = ~as_type<int>(_1522);
        int _1556 = _1554 + 1;
        _1548 = _1556;
    }
    int _1558 = _1548;
    float _1560 = fma(_1510, -2.0, _1536);
    int _1562 = int(_1356) + int(_1498);
    if (!_1530)
    {
        _1484 = _699;
    }
    float _1564 = _1484;
    float _1566 = 1.0 / _1546;
    float _1568 = _1564;
    if (!_1530)
    {
        _1550 = _699;
    }
    float _1570 = _1550;
    float _1572 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1560);
    float _1574 = _1570;
    if (!_1530)
    {
        _1552 = _1324;
    }
    float _1576 = _1552;
    float _1578 = _1576;
    if (!_1530)
    {
        _1514 = _1324;
    }
    float _1580 = _1514;
    float _1582 = _1580;
    if (_1530)
    {
        _1568 = _129;
    }
    float _1584 = _1568;
    if (_1530)
    {
        _1574 = _129;
    }
    float _1586 = _1574;
    if (_1530)
    {
        _1578 = _699;
    }
    float _1588 = _1578;
    float _1590 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1530)
    {
        _1582 = _699;
    }
    float _1592 = _1582;
    bool _1594 = _1330 > 0.0;
    float _1596 = -_665;
    float _1598 = fma(_1590, 2.0, _1596);
    bool _1600 = _1330 >= 0.0;
    bool _1602 = isnan(_1330);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.0);
    bool _1608 = _1604 || _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1612 = _647 + _1610;
    float _1614 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1616 = int(_1380) + int(_1528);
    float _1618 = _1612 * _1436;
    int _1620 = ~_681;
    int _1622 = _1620 + 1;
    int _1624 = _1534 * _1562;
    int _1626 = _1624 + _902;
    int _1628 = _1608 ? 0 : 1;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1632 = _647 + _1630;
    bool _1634 = !_1218;
    int _1636 = _1634 ? 0 : 1;
    int _1638 = _1622 * _1616;
    int _1640 = _1638 + _1042;
    float _1642 = _1324 * 2.0;
    int _1644 = ~_1628;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = _1632 * _1566;
    bool _1652 = uint(_1626) >= uint(_671);
    float _1654 = _129 + _699;
    int _1656 = _1648;
    float _1658 = _1592;
    if (!_1594)
    {
        int _1660 = ~_1628;
        int _1662 = _1660 + 1;
        _1656 = _1662;
    }
    int _1664 = _1656;
    float _1666 = floor(_1642);
    bool _1668 = uint(_1640) >= uint(_681);
    float _1670 = _1654 + (-1.0);
    bool _1672 = !_1652;
    int _1674 = _1672 ? 0 : (-1);
    float _1676 = _129 + _1324;
    int _1678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1680 = _1678 != 0;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1684 = _1682 != 0;
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1688 = _1686 != 0;
    float _1690 = _1324 + _699;
    float _1692 = _1676 + (-1.0);
    float _1694 = _1690 + (-1.0);
    bool _1696 = !_1684;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1702 = _1468 + 0.5;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1708 = _1666 >= 0.0;
    bool _1710 = isnan(_1666);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan(0.0);
    bool _1716 = _1712 || _1714;
    float _1718 = _663 + _1008;
    float _1720 = -_143;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1458);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1724;
    int _1728 = _1716 ? 0 : 1;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1734 = _1666 > 0.0;
    float _1736 = _1298 + _1182;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1738;
    float _1742 = fma(_1726, _1518, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1744 = _1308 + _1028;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1750 = fma(_1740, _1518, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1752 = fma(_1732, _1618, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1754 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1722);
    int _1756 = _1212 >> 31;
    float _1758 = fma(_1748, _1618, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1760 = _1418 + (-0.5);
    int _1762 = _1756 & 3;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1766 = _1718 + _1764;
    int _1768 = _1250 >> 31;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1772 = _1212 + _1762;
    float _1774 = -_1760;
    float _1776 = -_1572;
    float _1778 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1776);
    int _1780 = _1768 & 3;
    float _1782 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1770);
    int _1784 = _1772 >> 2;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1736 + _1786;
    int _1790 = _1250 + _1780;
    float _1792 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1794 = _1784 << 4;
    int _1796 = _1794 + 368;
    float _1798 = -_143;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1598);
    int _1802 = ~_1728;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1792);
    uint _1810 = uint(int(uint(_1796) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    int _1826 = _1806;
    if (!_1734)
    {
        int _1828 = ~_1728;
        int _1830 = _1828 + 1;
        _1826 = _1830;
    }
    int _1832 = _1826;
    float _1834 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[83].w, _673);
    bool _1836 = !_1278;
    int _1838 = _1836 ? 0 : 1;
    float _1840 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1800);
    int _1842 = _1790 >> 2;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1744 + _1844;
    bool _1848 = _1216 != 3;
    float _1850 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1782);
    int _1852 = _1842 << 4;
    int _1854 = _1852 + 512;
    float _1856 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1808);
    bool _1858 = !_1848;
    int _1860 = _1858 ? 0 : (-1);
    float _1862 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1834);
    bool _1864 = _1276 != 3;
    uint _1866 = uint(int(uint(_1854) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    int _1882 = abs(_1698);
    bool _1884 = !_1864;
    int _1886 = _1884 ? 0 : (-1);
    bool _1888 = _1856 >= 0.0;
    int _1890 = abs(_1266);
    int _1892 = _1796 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = int(_1894) + 1;
    uint _1904 = uint(int(uint(_1902) >> uint(2)));
    int _1906 = _1902 & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    float _1910 = float(_1558);
    int _1912 = abs(_1636);
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1916 = abs(_1838);
    int _1918 = _1854 + 8;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = abs(_1348);
    if (_1888)
    {
        out.m_47.x = 0.0;
    }
    if (_1888)
    {
        _1658 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1938 = _1658;
    int _1940 = ~_1890;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = float(_1882);
    float _1948 = fma(_1614, -2.0, _1914);
    int _1950 = as_type<int>(_1938);
    if (_1888)
    {
        float _1952 = _1938 * 5.0;
        _1950 = as_type<int>(_1952);
    }
    int _1954 = _1950;
    int _1956 = abs(_1860);
    float _1958 = _1492 + (-0.5);
    float _1960 = _1946 * _1910;
    int _1962 = ~_1562;
    int _1964 = _1962 + _1674;
    int _1966 = _1964 + 1;
    int _1968 = ~_1936;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = _1944 * as_type<int>(_1824);
    int _1976 = _671 * _1966;
    int _1978 = _1976 + _902;
    if (_1888)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6681 = as_type<float>(_1954);
        out.gl_Position.z = _6681;
    }
    int _1980 = abs(_1392);
    float _1982 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1948);
    bool _1984 = !_1668;
    int _1986 = _1984 ? 0 : (-1);
    bool _1988 = _671 == 0;
    float _1990 = -_1958;
    float _1992 = -_1982;
    float _1994 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1992);
    int _1996 = ~_1616;
    int _1998 = _1996 + _1986;
    int _2000 = _1998 + 1;
    bool _2002 = !_1988;
    int _2004 = _2002 ? _1978 : (-1);
    int _2006 = _1972 * as_type<int>(_1880);
    int _2008 = abs(_1306);
    int _2010 = _681 * _2000;
    int _2012 = _2010 + _1042;
    int _2014 = ~_1912;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = _2018 * as_type<int>(_1816);
    int _2022 = _2020 + _1974;
    int _2024 = ~_2008;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_1916;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = _2028 * as_type<int>(_1900);
    int _2038 = _2036 + _2022;
    int _2040 = ~_1956;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _2034 * as_type<int>(_1872);
    int _2048 = _2046 + _2006;
    int _2050 = ~_1980;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = abs(_1284);
    int _2058 = _2044 * as_type<int>(_1908);
    int _2060 = _2058 + _2038;
    bool _2062 = !_1450;
    int _2064 = _2062 ? 0 : 1;
    int _2066 = _2054 * as_type<int>(_1926);
    int _2068 = _2066 + _2048;
    int _2070 = abs(_1886);
    float _2072 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2074 = log2(_2072);
    int _2076 = abs(_2064);
    int _2078 = ~_2056;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = ~_2070;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    int _2090 = _2060 * _2082;
    bool _2092 = _681 == 0;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2096 = _2088 * as_type<int>(_1934);
    int _2098 = _2096 + _2068;
    int _2100 = ~_2076;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    float _2106 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2094);
    int _2108 = _2004 * _2056;
    int _2110 = _2108 + _2090;
    bool _2112 = !_2092;
    int _2114 = _2112 ? _2012 : (-1);
    float _2116 = _1766 * _1766;
    int _2118 = _2098 * _2104;
    float _2120 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2106);
    float _2122 = _2074 * _143;
    float _2124 = fma(_1788, _1788, _2116);
    int _2126 = _2114 * _2076;
    int _2128 = _2126 + _2118;
    float _2130 = -_2120;
    float _2132 = _2130 + 1.0;
    bool _2134 = !_1680;
    int _2136 = _2134 ? 0 : 1;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2140 = exp2(_2122);
    float _2142 = fma(_1846, _1846, _2124);
    float _2144 = float(_2110);
    float _2146 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2138);
    float _2148 = fma(_1418, _2132, _1778);
    float _2150 = -_1850;
    float _2152 = _2150 + 1.0;
    int _2154 = abs(_2136);
    float _2156 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2146);
    float _2158 = float(_2128);
    float _2160 = rsqrt(_2142);
    float _2162 = in.m_66.x;
    float _2164 = in.m_66.y;
    float _2166 = in.m_66.z;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2170 = 1.0 + _2168;
    float _2172 = -_2156;
    float _2174 = _2172 + 1.0;
    float _2176 = -_1862;
    float _2178 = _2176 + 1.0;
    float _2180 = -_2152;
    float _2182 = fma(_1468, _2180, _1840);
    out.m_68.x = _2144;
    out.m_68.y = _2158;
    float _2184 = -_2174;
    float _2186 = fma(_1412, _2184, _1754);
    float _2188 = 1.0 / _2170;
    float _2190 = fma(_1492, _2178, _1994);
    bool _2192 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2194 = isnan(0.0);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2200 = _2196 || _2198;
    float _2202 = -_2140;
    float _2204 = _2202 + 1.0;
    bool _2206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2208 = isnan(1.0);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2214 = _2210 || _2212;
    out.m_70.x = _2186;
    out.m_70.y = _2148;
    out.m_70.z = _2182;
    out.m_70.w = _2190;
    bool _2216 = !_1688;
    int _2218 = _2216 ? 0 : 1;
    float _2220 = _1788 * _2160;
    float _2222 = float(_2154);
    float _2224 = _1766 * _2160;
    float _2226 = float(_1832);
    if (_1888)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2228 = -_2224;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1718);
    float _2232 = _2200 ? _2204 : 0.0;
    float _2234 = _1846 * _2160;
    float _2236 = -_2220;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2242 = _2230 + _2240;
    float _2244 = _2222 * _2226;
    float _2246 = -_2234;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1744);
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2252 = _2238 + _2250;
    float _2254 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_2214)
    {
        float _2256 = _2232 * _2188;
        _147 = _2256;
    }
    float _2258 = _147;
    float _2260 = _2244 * (-2.0);
    float _2262 = _129 + (-0.5);
    bool _2264 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2266 = isnan(_647);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2278 = _2248 + _2276;
    float _2280 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2254);
    float _2282 = fma(_2260, _2162, _2162);
    float _2284 = fma(_1700, _2260, _1700);
    bool _2286 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2288 = isnan(_647);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = -_2274;
    float _2300 = _2298 + 1.0;
    float _2302 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2280);
    float _2304 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2282);
    float _2306 = -_2224;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    bool _2310 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2312 = isnan(_647);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2318 = _2314 || _2316;
    float _2320 = float(_2318);
    float _2322 = _2296 * _2300;
    float _2324 = -_2296;
    float _2326 = _2324 + 1.0;
    bool _2328 = _2302 >= 0.0;
    float _2330 = -_2220;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2334 = _2308 * _2308;
    float _2336 = _2320 * _2326;
    float _2338 = -_2320;
    float _2340 = _2338 + 1.0;
    float _2342 = -_2234;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _2346 = fma(_2332, _2332, _2334);
    float _2348 = fma(_2284, _2258, _2304);
    bool _2350 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2352 = isnan(_647);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    float _2362 = fma(_2344, _2344, _2346);
    float _2364 = _2348 * 0.15915493667125701904296875;
    int _2366 = abs(_2218);
    float _2368 = _2360 * _2340;
    float _2370 = _2304;
    if (_2328)
    {
        _2370 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2372 = _2370;
    float _2374 = _2364 * 6.283185482025146484375;
    float _2376 = sin(_2374);
    float _2378 = float(_1664);
    int _2380 = as_type<int>(_2372);
    if (_2328)
    {
        float _2382 = _2372 * 5.0;
        _2380 = as_type<int>(_2382);
    }
    int _2384 = _2380;
    float _2386 = float(_2366);
    float _2388 = _1742 * _2368;
    float _2390 = _1960 * (-2.0);
    float _2392 = sqrt(_2362);
    if (_2328)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7286 = as_type<float>(_2384);
        out.gl_Position.z = _7286;
    }
    float _2394 = _1750 * _2368;
    float _2396 = _2386 * _2378;
    float _2398 = fma(_1704, _2390, _1704);
    if (_2328)
    {
        out.m_47.x = 0.0;
    }
    if (_2328)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2400 = -_1718;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2404 = fma(_2390, _2164, _2164);
    float _2406 = -_1736;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2410 = -_1744;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2414 = _2402 * _2402;
    float _2416 = _699 + (-0.5);
    float _2418 = -_2360;
    float _2420 = _2418 + 1.0;
    float _2422 = _2396 * (-2.0);
    float _2424 = fma(_2408, _2408, _2414);
    float _2426 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2404);
    float _2428 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2394);
    float _2430 = fma(_2412, _2412, _2424);
    float _2432 = fma(_2398, _2258, _2426);
    float _2434 = _2364 * 6.283185482025146484375;
    float _2436 = cos(_2434);
    float _2438 = _1324 + (-0.5);
    float _2440 = _2432 * 0.15915493667125701904296875;
    float _2442 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2388);
    float _2444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2444;
    float _2448 = in.m_64.x;
    float _2450 = in.m_64.y;
    float _2452 = fma(_1758, _2336, _2428);
    float _2454 = fma(_1752, _2336, _2442);
    float _2456 = rsqrt(_2430);
    float _2458 = fma(_2422, _2166, _2166);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2460;
    float _2464 = fma(_1706, _2422, _1706);
    float _2466 = _2160 * _2392;
    float _2468 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2458);
    float _2470 = fma(_2462, _1650, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2472 = fma(_2446, _1650, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2474 = _2440 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    float _2478 = fma(_2464, _2258, _2468);
    float _2480 = fma(_2470, _2322, _2452);
    float _2482 = fma(_2472, _2322, _2454);
    float _2484 = _2478 * 0.15915493667125701904296875;
    float _2486 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2480);
    float _2488 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2482);
    float _2490 = _2408 * _2456;
    float _2492 = _2412 * _2456;
    float _2494 = _2402 * _2456;
    float _2496 = _2440 * 6.283185482025146484375;
    float _2498 = cos(_2496);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2502 = _2490 * _2500;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2506 = _2492 * _2504;
    float _2508 = _2486 * _2448;
    float _2510 = _2488 * _2450;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2514 = -_2502;
    float _2516 = fma(_2492, _2512, _2514);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2520 = _2494 * _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2524 = -_2506;
    float _2526 = fma(_2494, _2522, _2524);
    float _2528 = _2484 * 6.283185482025146484375;
    float _2530 = sin(_2528);
    float _2532 = _2516 * _2516;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2536 = -_2520;
    float _2538 = fma(_2490, _2534, _2536);
    float _2540 = _2510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2542 = _2376 * _2476;
    float _2544 = fma(_2526, _2526, _2532);
    float _2546 = _2508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _369);
    float _2550 = _2484 * 6.283185482025146484375;
    float _2552 = cos(_2550);
    float _2554 = fma(_2538, _2538, _2544);
    float _2556 = _2436 * _2498;
    float _2558 = _2466 * _2540;
    float _2560 = _2546 * _2466;
    float _2562 = _2436 * _2476;
    float _2564 = _2376 * _2498;
    float _2566 = _2548 * _2558;
    float _2568 = rsqrt(_2554);
    float _2570 = fma(_2530, _2556, _2542);
    float _2572 = fma(_2530, _2542, _2556);
    float _2574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2576 = -_2562;
    float _2578 = fma(_2530, _2564, _2576);
    float _2580 = -_2564;
    float _2582 = fma(_2530, _2562, _2580);
    float _2584 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2586 = _2584 * 0.5;
    float _2588 = _2560 * _2574;
    float _2590 = _2436 * _2552;
    float _2592 = _2498 * _2552;
    float _2594 = _2376 * _2552;
    float _2596 = _2476 * _2552;
    float _2598 = _2590 * _2566;
    float _2600 = -_2566;
    float _2602 = _2530 * _2600;
    float _2604 = _2594 * _2566;
    bool _2606 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2608 = isnan(0.5);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2614 = _2610 || _2612;
    float _2616 = _2526 * _2568;
    float _2618 = _2516 * _2568;
    float _2620 = fma(_2570, _2588, _2598);
    float _2622 = fma(_2592, _2588, _2602);
    float _2624 = _2494 * _2616;
    float _2626 = _2538 * _2568;
    float _2628 = fma(_2582, _2586, _2620);
    float _2630 = _2492 * _2618;
    float _2632 = -_2624;
    float _2634 = fma(_2490, _2618, _2632);
    float _2636 = fma(_2578, _2588, _2604);
    float _2638 = fma(_2596, _2586, _2622);
    float _2640 = -_2630;
    float _2642 = fma(_2494, _2626, _2640);
    float _2644 = _2634 * _2628;
    float _2646 = fma(_2572, _2586, _2636);
    float _2648 = _2490 * _2626;
    float _2650 = _2642 * _2628;
    float _2652 = fma(_2626, _2638, _2644);
    float _2654 = -_2648;
    float _2656 = fma(_2492, _2616, _2654);
    float _2658 = fma(_2616, _2638, _2650);
    float _2660 = fma(_2492, _2646, _2652);
    float _2662 = _2656 * _2628;
    float _2664 = fma(_2490, _2646, _2658);
    float _2666 = _1744 + _2660;
    float _2668 = _1736 + _2664;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2672 = _2666 + _2670;
    float _2674 = fma(_2618, _2638, _2662);
    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2678 = _2668 + _2676;
    float _2680 = _2672 * _2672;
    float _2682 = fma(_2494, _2646, _2674);
    float _2684 = fma(_2678, _2678, _2680);
    float _2686 = _1718 + _2682;
    float _2688 = sqrt(_2684);
    bool _2690 = _2688 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2692 = _2674;
    float _2694 = _2680;
    float _2696 = _2668;
    float _2698 = _2466;
    if (!_2690)
    {
        _2692 = _2668;
    }
    float _2700 = _2692;
    float _2702 = _2700;
    if (!_2690)
    {
        _2694 = _2666;
    }
    float _2704 = _2694;
    float _2706 = _2704;
    if (!_2690)
    {
        _2696 = _2686;
    }
    float _2708 = _2696;
    bool _2710 = !_2690;
    float _2712 = _2708;
    if (!_2710)
    {
        float _2714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2718 = _2688 + _2716;
        float _2720 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2722 = rsqrt(_2684);
        float _2724 = _2718 * _2714;
        float _2726 = _2724 * 0.15915493667125701904296875;
        float _2728 = _2726 * 6.283185482025146484375;
        float _2730 = sin(_2728);
        float _2732 = _2726 * 6.283185482025146484375;
        float _2734 = cos(_2732);
        float _2736 = fma(_2730, _2720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2738 = _2722 * _2736;
        float _2740 = _2734 + (-1.0);
        float _2742 = fma(_2678, _2738, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2744 = fma(_2672, _2738, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2746 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2748 = fma(_2686, _2734, _2746);
        _2702 = _2742;
        _2712 = _2748;
        _2706 = _2744;
    }
    float _2750 = _2702;
    float _2752 = _2712;
    float _2754 = _2706;
    float _2756 = -_2220;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2750);
    float _2760 = -_2224;
    float _2762 = fma(_2760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2752);
    float _2764 = -_2234;
    float _2766 = fma(_2764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2754);
    float _2768 = _2762;
    float _2770 = _2758;
    float _2772 = _2766;
    if (!_2614)
    {
        float _2774 = _2242 * _2242;
        float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2778 = fma(_2252, _2252, _2774);
        float _2780 = fma(_2278, _2278, _2778);
        float _2782 = 1.0 / _2466;
        float _2784 = sqrt(_2780);
        float _2786 = precise::min(_2784, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2788 = _2786 * _2776;
        float _2790 = -_1736;
        float _2792 = _2790 + _2750;
        float _2794 = -_1744;
        float _2796 = _2794 + _2754;
        float _2798 = _2788 * _2782;
        float _2800 = -_1718;
        float _2802 = _2800 + _2752;
        float _2804 = fma(_2792, _2798, _2238);
        float _2806 = fma(_2802, _2798, _2230);
        float _2808 = fma(_2796, _2798, _2248);
        _2768 = _2806;
        _2770 = _2804;
        _2772 = _2808;
        _2698 = _2782;
    }
    float _2810 = _2768;
    float _2812 = _2770;
    float _2814 = _2772;
    float _2816 = _2698;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2820 = _2810 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2824 = _2812 + _2822;
    float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2828 = _2814 + _2826;
    float _2830 = _2820 * _2820;
    float _2832 = fma(_2824, _2824, _2830);
    float _2834 = fma(_2828, _2828, _2832);
    float _2836 = rsqrt(_2834);
    float _2838 = sqrt(_2834);
    float _2840 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2842 = _2824 * _2840;
    float _2844 = _2828 * _2840;
    float _2846 = _2842 * _2842;
    float _2848 = _2844 * _2844;
    float _2850 = _2846 + _2848;
    float _2852 = sqrt(_2850);
    bool _2854 = _2852 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2858 = _2852 + _2856;
    float _2860 = _2828;
    float _2862 = _2850;
    float _2864 = _2858;
    float _2866 = _2816;
    float _2868 = _2840;
    if (_2854)
    {
        float _2870 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2860 = _2870;
    }
    float _2872 = _2860;
    if (_2854)
    {
        float _2874 = rsqrt(_2850);
        _2862 = _2874;
    }
    float _2876 = _2862;
    float _2878 = _2876;
    if (_2854)
    {
        float _2880 = _2858 * _2872;
        _2864 = _2880;
    }
    float _2882 = _2864;
    if (_2854)
    {
        float _2884 = _2882 * 0.15915493667125701904296875;
        _2866 = _2884;
    }
    float _2886 = _2866;
    float _2888 = _2872;
    float _2890 = _2886;
    if (_2854)
    {
        float _2892 = _2886 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        _2888 = _2894;
    }
    float _2896 = _2888;
    float _2898 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2900 = precise::max(0.0, _2898);
    float _2902 = _2830;
    float _2904 = _2900;
    if (_2854)
    {
        float _2906 = _2886 * 6.283185482025146484375;
        float _2908 = cos(_2906);
        _2902 = _2908;
    }
    float _2910 = _2902;
    float _2912 = -_2840;
    float _2914 = -_2900;
    float _2916 = fma(_2820, _2912, _2914);
    float _2918 = _2916;
    if (_2854)
    {
        float _2920 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2904 = _2920;
    }
    float _2922 = _2904;
    float _2924 = _2896;
    float _2926 = _2922;
    if (_2854)
    {
        float _2928 = fma(_2896, _2922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2924 = _2928;
    }
    float _2930 = _2924;
    float _2932 = _2930;
    float _2934 = _2910;
    if (_2854)
    {
        float _2936 = _2910 + (-1.0);
        _2926 = _2936;
    }
    float _2938 = _2926;
    float _2940 = _2938;
    if (_2854)
    {
        float _2942 = _2876 * _2930;
        _2868 = _2942;
    }
    float _2944 = _2868;
    if (!_2854)
    {
        _2932 = _2842;
    }
    float _2946 = _2932;
    float _2948 = _2946;
    if (_2854)
    {
        float _2950 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2890 = _2950;
    }
    float _2952 = _2890;
    if (_2854)
    {
        float _2954 = _2842 * _2944;
        _2948 = _2954;
    }
    float _2956 = _2948;
    if (!_2854)
    {
        _2940 = _2844;
    }
    float _2958 = _2940;
    float _2960 = _2958;
    if (_2854)
    {
        float _2962 = _2844 * _2944;
        _2960 = _2962;
    }
    float _2964 = _2960;
    if (!_2854)
    {
        _2878 = _2846;
    }
    float _2966 = _2878;
    float _2968 = _2966;
    if (_2854)
    {
        float _2970 = fma(_2916, _2910, _2952);
        _2918 = _2970;
    }
    float _2972 = _2918;
    if (_2854)
    {
        float _2974 = _2956 * _2956;
        _2968 = _2974;
    }
    float _2976 = _2968;
    if (!_2854)
    {
        _2934 = _2848;
    }
    float _2978 = _2934;
    float _2980 = _2978;
    if (_2854)
    {
        float _2982 = _2964 * _2964;
        _2980 = _2982;
    }
    float _2984 = _2980;
    float _2986 = fma(_2972, _2972, _2976);
    float _2988 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2990 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2992 = _2986 + _2984;
    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2996 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2994);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2988);
    float _3002 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3004 = rsqrt(_2992);
    float _3006 = -_2998;
    float _3008 = _3006 + 1.0;
    float _3010 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3000);
    float _3012 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3014 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3002);
    float _3016 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3020 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3012);
    float _3022 = abs(_3008);
    float _3024 = log2(_3022);
    float _3026 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3014);
    float _3028 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3016);
    float _3030 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3020);
    float _3032 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3034 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3036 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3028);
    float _3038 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3040 = _3004 * _2956;
    float _3042 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3044 = _3004 * _2972;
    float _3046 = _3004 * _2964;
    float _3048 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3050 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3042);
    float _3052 = _3036 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3054 = -_3032;
    float _3056 = fma(_3054, _2990, 1.0);
    float _3058 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3060 = -_3048;
    float _3062 = fma(_3044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3060);
    float _3064 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3050);
    float _3066 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3068 = -_3046;
    float _3070 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3062);
    float _3072 = exp2(_3058);
    float _3074 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3064);
    float _3076 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3078 = fma(_3070, -0.5, 0.5);
    float _3080 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3066);
    float _3082 = _3044 + 1.0;
    float _3084 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3076);
    float _3086 = fma(_3070, 0.5, 0.5);
    float _3088 = log2(_3056);
    float _3090 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3080);
    float _3092 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3084);
    float _3094 = fma(_3086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3096 = fma(_3086, _3094, -0.212114393711090087890625);
    float _3098 = 1.0 / _3074;
    float _3100 = -_3044;
    float _3102 = fma(_3072, _3082, _3100);
    float _3104 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3092);
    float _3106 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3090);
    float _3108 = fma(_3086, _3096, 1.570728778839111328125);
    float _3110 = fma(_3102, 0.5, 0.5);
    float _3112 = sqrt(_3078);
    float _3114 = _3088 * 0.693147182464599609375;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3118 = _3104 * _3098;
    float _3120 = _3106 * _3098;
    float _3122 = fma(_3118, 0.5, 0.5);
    float _3124 = fma(_3120, -0.5, 0.5);
    float _3126 = _3112 * 0.636619746685028076171875;
    float3 _8471 = float3(_3122, _3124, _3116);
    float _3128 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8471, float3(0.0), isnan(_8471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8471, float3(0.0), isnan(_8471)), level(0.0)).x;
    float _3130 = -_3108;
    float _3132 = fma(_3126, _3130, 1.0);
    float3 _8487 = float3(_3122, _3124, _3116);
    float4 _3135 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8487, float3(0.0), isnan(_8487)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8487, float3(0.0), isnan(_8487)), level(0.0)).xyzw;
    float _3137 = _3135.x;
    float _3139 = _3135.y;
    float _3141 = _3135.z;
    float _3143 = _3135.w;
    float2 _8504 = float2(_3132, _3110);
    float3 _3147 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8504, float2(0.0), isnan(_8504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8504, float2(0.0), isnan(_8504)), level(0.0)).xyz;
    float _3149 = _3147.x;
    float _3151 = _3147.y;
    float _3153 = _3147.z;
    float _3155 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3159 = _369 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3161 = _2590 * _2642;
    float _3163 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3165 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3167 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3169 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3157);
    float _3171 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3163);
    float _3173 = fma(_3159, _3159, 1.0);
    float _3175 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3165);
    float _3177 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3167);
    float _3179 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3169);
    float _3181 = _3171 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3183 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3175);
    float _3185 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3177);
    float _3187 = rsqrt(_3173);
    float _3189 = _3179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3191 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3193 = _2570 * _2642;
    float _3195 = _2570 * _2656;
    float _3197 = _2570 * _2634;
    float _3199 = _2590 * _2656;
    float _3201 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3191);
    float _3203 = _2590 * _2634;
    float _3205 = _2582 * _2642;
    float _3207 = _2582 * _2656;
    float _3209 = fma(_2592, _2618, _3195);
    float _3211 = _2582 * _2634;
    float _3213 = fma(_2592, _2616, _3193);
    float _3215 = fma(_2592, _2626, _3197);
    float _3217 = -_2530;
    float _3219 = fma(_3217, _2616, _3161);
    float _3221 = -_2530;
    float _3223 = fma(_3221, _2618, _3199);
    float _3225 = -_2530;
    float _3227 = fma(_3225, _2626, _3203);
    float _3229 = fma(_2596, _2616, _3205);
    float _3231 = fma(_2596, _2618, _3207);
    float _3233 = fma(_2596, _2626, _3211);
    float _3235 = fma(_2594, _2490, _3219);
    float _3237 = fma(_2594, _2494, _3223);
    float _3239 = fma(_2594, _2492, _3227);
    float _3241 = fma(_2572, _2490, _3229);
    float _3243 = fma(_2572, _2494, _3231);
    float _3245 = fma(_2572, _2492, _3233);
    float _3247 = fma(_2578, _2492, _3215);
    float _3249 = _3159 * _3187;
    float _3251 = fma(_2578, _2490, _3213);
    float _3253 = fma(_2578, _2494, _3209);
    float _3255 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3257 = -_3241;
    float _3259 = _3249 * _3257;
    float _3261 = -_3243;
    float _3263 = _3249 * _3261;
    float _3265 = -_3245;
    float _3267 = _3249 * _3265;
    float _3269 = _3159 * _3239;
    float _3271 = -_617;
    float _3273 = _3271 + _2810;
    out.m_72.x = _3251;
    out.m_72.y = _3253;
    out.m_72.z = _3247;
    float _3275 = _3159 * _3235;
    float _3277 = -_615;
    float _3279 = _3277 + _2812;
    float _3281 = _3159 * _3237;
    float _3283 = fma(_3187, _3237, _3263);
    float _3285 = fma(_3255, _3251, _3275);
    float _3287 = -_619;
    float _3289 = _3287 + _2814;
    float _3291 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3293 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3295 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3297 = fma(_3187, _3235, _3259);
    float _3299 = fma(_3255, _3253, _3281);
    float _3301 = fma(_3255, _3247, _3269);
    float _3303 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3305 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3307 = fma(_3187, _3239, _3267);
    float _3309 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3291);
    float _3311 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3303);
    float _3313 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3315 = _3183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3317 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3293);
    float _3319 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3311);
    float _3321 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3313);
    float _3323 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3305);
    float _3325 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3295);
    float _3327 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    out.m_74.x = _3297;
    out.m_74.y = _3283;
    out.m_74.z = _3307;
    float _3329 = _3185 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3331 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3333 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3321);
    float _3335 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3323);
    float _3337 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3317);
    float _3339 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3331);
    float _3341 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3343 = _3074 * 0.5;
    float _3345 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3337);
    float _3347 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3339);
    float _3349 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3351 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3353 = _3327 + _3325;
    float _3355 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3347);
    float _3357 = _3104 + _3074;
    float _3359 = 1.0 / _3351;
    float _3361 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3353);
    float _3363 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3365 = _3355 + _3074;
    float _3367 = _3357 * 0.5;
    out.gl_Position.x = _3104;
    out.gl_Position.y = _3106;
    out.gl_Position.z = _3355;
    out.gl_Position.w = _3074;
    float _3369 = _3365 * 0.5;
    float _3371 = exp2(_3363);
    float _3373 = fma(_3106, -0.5, _3343);
    float _3375 = _3241 + _3285;
    float _3377 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3379 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3381 = _3245 + _3301;
    out.m_76.x = _3367;
    out.m_76.y = _3373;
    out.m_76.z = _3369;
    out.m_76.w = _3074;
    float _3383 = _3377 + _3309;
    float _3385 = 1.0 / _3361;
    float _3387 = _3349 * _3359;
    out.m_78.x = _2812;
    out.m_78.y = _2810;
    out.m_78.z = _2814;
    float _3389 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3383);
    float _3391 = _3341 * _3359;
    out.m_80.y = 1.0;
    float _3393 = -_3371;
    float _3395 = _3393 + 1.0;
    float _3397 = _3243 + _3299;
    float _3399 = _3379 + _3201;
    float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _3375;
    out.m_82.y = _3397;
    out.m_82.z = _3381;
    float _3403 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3399);
    float _3405 = _3345 * _3385;
    float _3407 = -_3401;
    float _3409 = _3407 + 1.0;
    float _3411 = _3389 * _3385;
    bool _3413 = _3405 > 0.0;
    bool _3415 = _3405 < 1.0;
    bool _3417 = _3415 && _3413;
    bool _3419 = _3118 > (-1.0);
    bool _3421 = _3419 && _3417;
    bool _3423 = _3120 > (-1.0);
    bool _3425 = _3423 && _3421;
    bool _3427 = _3118 < 1.0;
    bool _3429 = _3427 && _3425;
    bool _3431 = _3120 < 1.0;
    bool _3433 = _3431 && _3429;
    float _3435 = _3401 * _3128;
    float _3437 = _3403 * _3385;
    float _3439 = _3143 * _3435;
    float _3441 = _3143 * _3409;
    float _3443 = _3153 * _3435;
    float _3445 = fma(_3149, _3439, _3137);
    float _3447 = fma(_3151, _3439, _3139);
    float _3449 = fma(_3143, _3443, _3141);
    out.m_84.x = _3445;
    out.m_84.y = _3447;
    out.m_84.z = _3449;
    out.m_84.w = _3441;
    bool _3451 = !_3433;
    float _3453 = _3104;
    float _3455 = _3445;
    float _3457 = _3106;
    float _3459 = _3411;
    float _3461 = _3379;
    float _3463 = _3074;
    float _3495;
    if (!_3451)
    {
        float _3465 = -_3437;
        float _3467 = _3120 + _3465;
        float _3469 = -_3411;
        float _3471 = _3118 + _3469;
        float _3473 = -_3391;
        float _3475 = _3118 + _3473;
        float _3477 = -_3387;
        float _3479 = _3120 + _3477;
        float _3481 = _3467 * _3467;
        float _3483 = fma(_3471, _3471, _3481);
        float _3485 = sqrt(_3483);
        bool _3487 = _3485 > 0.0;
        float _3489 = _3485;
        _3459 = _3483;
        if (!_3487)
        {
            _3489 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3491 = _3489;
        bool _3493 = !_3487;
        _3495 = _3491;
        _3497 = _3493;
        if (!_3497)
        {
            float _3499 = _3479 * _3479;
            float _3501 = fma(_3475, _3475, _3499);
            float _3503 = rsqrt(_3483);
            float _3505 = sqrt(_3501);
            float _3507 = _3471 * _3503;
            float _3509 = _3467 * _3503;
            bool _3511 = _3505 > 0.0;
            float _3513 = _3503;
            _3455 = _3505;
            if (!_3511)
            {
                _3513 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3515 = _3513;
            bool _3517 = !_3511;
            _3495 = _3515;
            _3497 = _3517;
            if (!_3497)
            {
                float _3519 = _2560 * _3329;
                float _3521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3523 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3327);
                float _3525 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3379);
                float _3527 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3523);
                float _3529 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3377);
                float _3531 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3525);
                float _3533 = rsqrt(_3501);
                float _3535 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3529);
                float _3537 = _3521 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3539 = 1.0 / _3527;
                float _3541 = _3479 * _3537;
                float _3543 = _3475 * _3537;
                float _3545 = _3541 * _3541;
                float _3547 = fma(_3543, _3543, _3545);
                float _3549 = _3479 * _3533;
                float _3551 = _3475 * _3533;
                float _3553 = _3509 * _3549;
                float _3555 = _3531 * _3539;
                float _3557 = _3535 * _3539;
                float _3559 = sqrt(_3547);
                float _3561 = fma(_3507, _3551, _3553);
                float _3563 = _3555 * _3555;
                float _3565 = fma(_3557, _3557, _3563);
                float _3567 = precise::min(0.0, _3561);
                float _3569 = sqrt(_3565);
                float _3571 = _3074 * _3567;
                float _3573 = fma(_3543, _3571, _3104);
                float _3575 = fma(_3541, _3571, _3106);
                out.gl_Position.x = _3573;
                out.gl_Position.y = _3575;
                float _3577 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3569);
                float _3579 = 1.0 / _3577;
                float _3581 = _3569 * _3579;
                out.m_80.y = _3581;
                _3453 = _3573;
                _3455 = _3581;
                _3457 = _3575;
                _3459 = _3541;
                _3461 = _3561;
                _3495 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3497 = true;
            }
        }
    }
    else
    {
        float _3583 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3583;
        _3455 = 0.0;
        _3461 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3495 = 0.0;
    }
    _3497 = false;
    float _3585 = _3453;
    float _3587 = _3455;
    float _3589 = _3457;
    float _3591 = _3459;
    float _3593 = _3461;
    float _3595 = _3495;
    bool _3597 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3599 = isnan(_2838);
    bool _3601 = _3597 || _3599;
    bool _3603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3605 = _3601 || _3603;
    float _3607 = _3587;
    float _3609 = _3591;
    float _3611 = _3589;
    float _3613 = _3585;
    float _3615 = _3593;
    if (!_3605)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3617 = _3607;
    float _3619 = _3617;
    float _3621 = _3617;
    if (!_3605)
    {
        _3463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3623 = _3463;
    float _3625 = _3623;
    float _3627 = _3623;
    if (!_3605)
    {
        _3609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3629 = _3609;
    float _3631 = _3629;
    float _3633 = _3629;
    if (!_3605)
    {
        _3611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3635 = _3611;
    float _3637 = _3635;
    float _3639 = _3635;
    if (!_3605)
    {
        _3613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3641 = _3613;
    float _3643 = _3641;
    float _3645 = _3641;
    if (!_3605)
    {
        _3615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3647 = _3615;
    bool _3649 = !_3605;
    float _3651 = _3647;
    float _3653 = _3647;
    if (!_3649)
    {
        bool _3655 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3657 = isnan(_2838);
        bool _3659 = _3655 || _3657;
        bool _3661 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3663 = _3659 || _3661;
        if (!_3663)
        {
            float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3667 = _2838 + _3665;
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3671 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3669;
            float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3675 = _3673 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3677 = 1.0 / _3671;
            float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3695 = _3667 * _3677;
            float _3697 = precise::clamp(_3695, 0.0, 1.0);
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3703 = fma(_3697, _3675, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3705 = fma(_3697, _3701, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3707 = fma(_3697, _3681, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3709 = fma(_3697, _3685, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3711 = fma(_3697, _3689, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3713 = fma(_3697, _3693, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3627 = _3707;
            _3645 = _3711;
            _3621 = _3703;
            _3639 = _3709;
            _3633 = _3705;
            _3653 = _3713;
            _3715 = true;
        }
        else
        {
            bool _3717 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3719 = isnan(_2838);
            bool _3721 = _3717 || _3719;
            bool _3723 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3725 = _3721 || _3723;
            if (!_3725)
            {
                _3619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3727 = _3619;
            _3621 = _3727;
            if (!_3725)
            {
                _3625 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3729 = _3625;
            _3627 = _3729;
            if (!_3725)
            {
                _3631 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3731 = _3631;
            _3633 = _3731;
            if (!_3725)
            {
                _3637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3733 = _3637;
            _3639 = _3733;
            if (!_3725)
            {
                _3643 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3735 = _3643;
            _3645 = _3735;
            if (!_3725)
            {
                _3651 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3737 = _3651;
            bool _3739 = !_3725;
            _3653 = _3737;
            if (!_3739)
            {
                bool _3741 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3743 = isnan(_2838);
                bool _3745 = _3741 || _3743;
                bool _3747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3749 = _3745 || _3747;
                if (!_3749)
                {
                    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3753 = _2838 + _3751;
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3757 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3755;
                    float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3763 = 1.0 / _3757;
                    float _3765 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3767 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3781 = _3753 * _3763;
                    float _3783 = precise::clamp(_3781, 0.0, 1.0);
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3789 = fma(_3783, _3761, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3791 = fma(_3783, _3787, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3793 = fma(_3783, _3767, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3795 = fma(_3783, _3771, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3797 = fma(_3783, _3775, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3799 = fma(_3783, _3779, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3627 = _3793;
                    _3645 = _3797;
                    _3621 = _3789;
                    _3639 = _3795;
                    _3633 = _3791;
                    _3653 = _3799;
                    _3715 = true;
                }
                else
                {
                    _3627 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3645 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3633 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3653 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3715 = false;
    float _3801 = _3627;
    float _3803 = _3645;
    float _3805 = _3621;
    float _3807 = _3639;
    float _3809 = _3633;
    float _3811 = _3653;
    float _3813 = fma(_3397, -0.5, 0.5);
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = -_3801;
    float _3819 = _3817 + _3803;
    float _3821 = -_3805;
    float _3823 = _3821 + _3807;
    float _3825 = -_3809;
    float _3827 = _3825 + _3811;
    bool _3829 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3831 = fma(_3815, _3819, _3801);
    float _3833 = fma(_3815, _3823, _3805);
    float _3835 = fma(_3815, _3827, _3809);
    float _3837 = _3595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3839 = _3831 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3841 = fma(_3833, 0.298911988735198974609375, _3839);
    out.m_80.w = _3837;
    float _3843 = fma(_3835, 0.114477999508380889892578125, _3841);
    float _3845 = -_3843;
    float _3847 = _3833 + _3845;
    float _3849 = -_3843;
    float _3851 = _3831 + _3849;
    float _3853 = -_3843;
    float _3855 = _3835 + _3853;
    out.m_86.x = 0.0;
    float _3857 = fma(_3847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3859 = fma(_3851, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3861 = fma(_3855, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    out.m_88.x = _3857;
    out.m_88.y = _3859;
    out.m_88.z = _3861;
    if (!_3829)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3863 = -_2810;
    float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3867 = -_2812;
    float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3871 = -_2814;
    float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3875 = _3865 * _3865;
    float _3877 = fma(_3869, _3869, _3875);
    float _3879 = fma(_3873, _3873, _3877);
    float _3881 = sqrt(_3879);
    float _3883 = rsqrt(_3879);
    float _3885 = -_3881;
    float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3889 = _3887 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = _3869 * _3883;
    float _3895 = _3865 * _3883;
    float _3897 = abs(_3891);
    float _3899 = log2(_3897);
    float _3901 = _3873 * _3883;
    float _3903 = _3893 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3905 = _3397 * _3895;
    float _3907 = -_3895;
    float _3909 = -_3903;
    float _3911 = fma(_3907, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3909);
    float _3913 = fma(_3375, _3893, _3905);
    float _3915 = -_3901;
    float _3917 = fma(_3915, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3911);
    float _3919 = fma(_3381, _3901, _3913);
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3925 = _3917 + _3923;
    float _3927 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3929 = _3925 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = exp2(_3927);
    float _3935 = _3933 * _3931;
    float _3937 = _3921 * _3935;
    float _3939 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3941 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3943 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3939;
    out.m_86.y = _3941;
    out.m_86.z = _3943;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3715 = false;
    bool _3497 = false;
    bool _639 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4000 = as_type<float>(_123);
        out.gl_Position.z = _4000;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_107);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4073 = as_type<float>(_163);
        out.gl_Position.z = _4073;
    }
    if (_157)
    {
        return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _165 * _165;
    float _193 = _169 * _169;
    float _195 = _167 * _167;
    float _197 = fma(_173, _173, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_175, _175, _195);
    float _203 = fma(_179, _179, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    float _217 = as_type<float>(int(gl_VertexIndex));
    bool _219 = _211 > 0.0;
    float _221 = _203;
    float _223 = _205;
    float _225 = _211;
    float _227 = _171;
    int _229 = as_type<int>(_173);
    if (_215)
    {
        float _231 = rsqrt(_203);
        _221 = _231;
    }
    float _233 = _221;
    float _235 = 0.0;
    if (!_215)
    {
        _235 = 0.0;
    }
    float _237 = _235;
    bool _239 = _213 > 0.0;
    float _241 = 0.0;
    float _243 = _237;
    if (!_215)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (_219)
    {
        float _251 = rsqrt(_205);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_219)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_219)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    int _265 = as_type<int>(_217) & 1;
    bool _267 = _265 != 0;
    int _269 = as_type<int>(_217) & 2;
    bool _271 = _269 != 0;
    bool _273 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _277 = _273 || _275;
    bool _279 = isnan(1.0);
    bool _281 = _277 || _279;
    float _283 = 0.0;
    float _285 = _217;
    float _287 = _263;
    if (_239)
    {
        float _289 = rsqrt(_207);
        _283 = _289;
    }
    float _291 = _283;
    if (!_215)
    {
        _285 = 0.0;
    }
    float _293 = _285;
    float _295 = _293;
    if (_215)
    {
        float _297 = _233 * _173;
        _243 = _297;
    }
    float _299 = _243;
    if (!_219)
    {
        _223 = 0.0;
    }
    float _301 = _223;
    float _303 = _301;
    if (_215)
    {
        float _305 = _233 * _165;
        _249 = _305;
    }
    float _307 = _249;
    float _309 = 0.0;
    if (!_239)
    {
        _309 = 0.0;
    }
    float _311 = _309;
    float _313 = _311;
    if (_215)
    {
        float _315 = _233 * _179;
        _295 = _315;
    }
    float _317 = _295;
    float _319 = 0.0;
    if (!_239)
    {
        _319 = 0.0;
    }
    float _321 = _319;
    float _323 = _321;
    if (_219)
    {
        float _325 = _253 * _177;
        _261 = _325;
    }
    float _327 = _261;
    if (_219)
    {
        float _329 = _253 * _169;
        _287 = _329;
    }
    float _331 = _287;
    if (!_239)
    {
        _225 = 0.0;
    }
    float _333 = _225;
    float _335 = 0.0;
    float _337 = _333;
    if (!_281)
    {
        float _339 = _171 * _171;
        float _341 = _339 * 0.5;
        _335 = _341;
    }
    float _343 = _335;
    float _345 = _343;
    if (_219)
    {
        float _347 = _253 * _183;
        _303 = _347;
    }
    float _349 = _303;
    bool _351 = !_267;
    float _353 = _351 ? (-0.5) : 0.5;
    if (_239)
    {
        float _355 = _291 * _175;
        _313 = _355;
    }
    float _357 = _313;
    if (_239)
    {
        float _359 = _291 * _167;
        _323 = _359;
    }
    float _361 = _323;
    if (_239)
    {
        float _363 = _291 * _181;
        _337 = _363;
    }
    float _365 = _337;
    bool _367 = !_271;
    float _369 = _367 ? (-0.5) : 0.5;
    float _371 = _365;
    if (!_281)
    {
        float _373 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _345 = _373;
    }
    float _375 = _345;
    bool _377 = !_281;
    float _379 = _375;
    if (!_377)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = _171 * _383;
        float _393 = 1.0 / _387;
        float _395 = _389 * 0.693147182464599609375;
        float _397 = exp2(_391);
        float _399 = 1.0 / _395;
        float _401 = _397 + (-1.0);
        float _403 = -_401;
        float _405 = fma(_403, _399, _171);
        float _407 = _405 * _393;
        float _409 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _379 = _409;
    }
    float _411 = _379;
    float _413 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _415 = !_281;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _171 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _227 = _435;
    }
    float _437 = _227;
    float _439 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _413 * _307;
    float _443 = _413 * _361;
    float _445 = _413 * _331;
    float _447 = 0.0;
    if (!_281)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _447 = _451;
    }
    float _453 = _447;
    float _455 = fma(_439, _299, _441);
    float _457 = fma(_439, _357, _443);
    float _459 = fma(_439, _327, _445);
    float _461 = _453;
    if (!_281)
    {
        float _463 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _463;
    }
    float _465 = _461;
    bool _467 = !_281;
    float _469 = _465;
    if (!_467)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = _143 * _473;
        float _479 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _481 = _479 + 1.0;
        float _483 = 1.0 / _481;
        float _485 = _475 * 0.693147182464599609375;
        float _487 = exp2(_477);
        float _489 = 1.0 / _485;
        float _491 = _487 + (-1.0);
        float _493 = -_491;
        float _495 = fma(_493, _489, _143);
        float _497 = _495 * _483;
        float _499 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _469 = _499;
    }
    float _501 = _469;
    float _503 = in.m_64.w;
    float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _507 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _509 = in.m_44.x;
    float _511 = in.m_44.y;
    float _513 = in.m_44.z;
    float _515 = _505 * _361;
    float _517 = _505 * _307;
    float _519 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _521 = _505 * _331;
    float _523 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = fma(_507, _317, _455);
    float _527 = fma(_519, _357, _515);
    float _529 = fma(_507, _365, _457);
    float _531 = fma(_507, _349, _459);
    float _533 = fma(_519, _299, _517);
    float _535 = fma(_519, _327, _521);
    float _537 = fma(_523, _365, _527);
    float _539 = fma(_437, _185, _525);
    float _541 = fma(_437, _187, _529);
    float _543 = fma(_437, _189, _531);
    float _545 = fma(_523, _317, _533);
    float _547 = fma(_523, _349, _535);
    if (!_281)
    {
        _371 = _143;
    }
    float _549 = _371;
    bool _551 = !_281;
    float _553 = _549;
    if (!_551)
    {
        float _555 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _557 = log2(_555);
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _561 = _559 + 1.0;
        float _563 = 1.0 / _561;
        float _565 = _143 * _557;
        float _567 = exp2(_565);
        float _569 = -_567;
        float _571 = _569 + 1.0;
        float _573 = _571 * _563;
        _553 = _573;
    }
    float _575 = _553;
    float _577 = fma(_575, _187, _537);
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _581 = fma(_575, _185, _545);
    float _583 = fma(_575, _189, _547);
    float _585 = -_577;
    float _587 = _541 + _585;
    float _589 = fma(_539, _503, _509);
    float _591 = -_581;
    float _593 = _539 + _591;
    float _595 = fma(_541, _503, _511);
    float _597 = _587 * _175;
    float _599 = _587 * _167;
    float _601 = _587 * _181;
    float _603 = -_583;
    float _605 = _543 + _603;
    float _607 = fma(_593, _173, _597);
    float _609 = fma(_593, _165, _599);
    float _611 = fma(_593, _179, _601);
    float _613 = fma(_543, _503, _513);
    float _615 = fma(_605, _177, _607);
    float _617 = fma(_605, _169, _609);
    float _619 = fma(_605, _183, _611);
    bool _621 = !_579;
    float _637;
    if (!_621)
    {
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _625 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_107);
        float _643 = 1.0 / _641;
        float _645 = _143 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _651 = int(_649);
    float _653 = float(_107);
    float _655 = _595 * _167;
    float _657 = fma(_589, _165, _655);
    float _659 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _661 = int(_659);
    float _663 = fma(_613, _169, _657);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _667 = float(_651);
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _671 = int(_669);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _675 = float(_661);
    float _677 = 1.0 / _667;
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _681 = int(_679);
    float _683 = float(uint(_671));
    int _685 = ~_671;
    int _687 = _685 + 1;
    bool _689 = _671 == 0;
    float _691 = 1.0 / _675;
    float _693 = _677 * _143;
    float _695 = 1.0 / _683;
    float _697 = float(uint(_681));
    float _699 = in.m_51.y;
    int _701 = ~_681;
    int _703 = _701 + 1;
    float _705 = trunc(_693);
    int _707 = int(_705);
    float _709 = _691 * _143;
    float _711 = 1.0 / _697;
    int _713 = as_type<int>(_695) + (-2);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _717 = _715 != 0;
    float _719 = trunc(_709);
    int _721 = int(_719);
    float _723 = float(uint(_707));
    float _725 = _699 * 2.0;
    float _727 = as_type<float>(_713) * _723;
    int _729 = as_type<int>(_711) + (-2);
    float _731 = 1.0 / _653;
    float _733 = _711;
    if (_717)
    {
        _733 = 1.0;
    }
    float _735 = _733;
    float _737 = _735;
    if (!_717)
    {
        _737 = 7.345489978790283203125;
    }
    float _739 = _737;
    float _741 = float(uint(_721));
    float _743 = trunc(_727);
    float _745 = precise::max(_743, 0.0);
    uint _748 = uint(_745);
    float _750 = as_type<float>(_729) * _741;
    int _752 = ~_671;
    int _754 = _752 + 1;
    float _756 = trunc(_750);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = _731 * _143;
    float _764 = float(_681);
    int _766 = _754 * int(_748);
    int _768 = _766 + _707;
    float _770 = _739 * _129;
    float _772 = float(uint(_768));
    int _774 = _703 * int(_760);
    int _776 = _774 + _721;
    float _778 = as_type<float>(_713) * _772;
    float _780 = floor(_770);
    float _782 = _772;
    float _784 = as_type<float>(_776);
    if (_717)
    {
        _782 = _129;
    }
    float _786 = _782;
    float _788 = float(uint(_776));
    float _790 = _786;
    if (_717)
    {
        _784 = 1.0;
    }
    float _792 = _784;
    float _794 = _792;
    if (!_717)
    {
        _794 = 1.2345600128173828125;
    }
    float _796 = _794;
    float _798 = trunc(_778);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    float _804 = as_type<float>(_729) * _788;
    if (!_717)
    {
        _790 = _699;
    }
    float _806 = _790;
    float _808 = _796 * _806;
    float _810 = trunc(_804);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    float _816 = float(_671);
    float _818 = -_780;
    float _820 = _770 + _818;
    float _822 = float(_707);
    float _824 = _820 * _816;
    int _826 = int(_748) + int(_802);
    float _828 = floor(_808);
    bool _830 = _822 >= _816;
    bool _832 = isnan(_822);
    bool _834 = _830 || _832;
    bool _836 = isnan(_816);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    int _842 = _687 * _826;
    int _844 = _842 + _707;
    int _846 = int(_760) + int(_814);
    float _848 = trunc(_824);
    int _850 = int(_848);
    int _852 = ~_681;
    int _854 = _852 + 1;
    bool _856 = uint(_844) >= uint(_671);
    int _858 = _854 * _846;
    int _860 = _858 + _721;
    bool _862 = !_856;
    int _864 = _862 ? 0 : (-1);
    float _866 = trunc(_840);
    int _868 = int(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _872 = _870 != 0;
    float _874 = -_828;
    float _876 = _808 + _874;
    int _878 = ~_826;
    int _880 = _878 + _864;
    int _882 = _880 + 1;
    bool _884 = !_872;
    int _886 = _884 ? 0 : 1;
    bool _888 = uint(_860) >= uint(_681);
    int _890 = _671 * _882;
    int _892 = _890 + _707;
    int _894 = abs(_886);
    bool _896 = !_888;
    int _898 = _896 ? 0 : (-1);
    int _900 = _850 * _894;
    int _902 = _900 + _707;
    bool _904 = !_689;
    int _906 = _904 ? _892 : (-1);
    int _908 = ~_868;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _924 = _922 != 0;
    int _926 = ~_846;
    int _928 = _926 + _898;
    int _930 = _928 + 1;
    float _932 = _816 * _762;
    float _934 = float(_721);
    int _936 = _906 * _912;
    bool _938 = !_920;
    int _940 = _938 ? 0 : 1;
    int _942 = _681 * _930;
    int _944 = _942 + _721;
    bool _946 = _934 >= _764;
    bool _948 = isnan(_934);
    bool _950 = _946 || _948;
    bool _952 = isnan(_764);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = trunc(_932);
    int _960 = int(_958);
    int _962 = _671 + (-1);
    bool _964 = !_916;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_940);
    int _970 = _868 * _962;
    int _972 = _970 + _936;
    int _974 = abs(_966);
    float _976 = trunc(_956);
    int _978 = int(_976);
    float _980 = _876 * _764;
    bool _982 = !_924;
    int _984 = _982 ? 0 : 1;
    float _986 = _764 * _762;
    int _988 = _972 * _968;
    int _990 = abs(_984);
    float _992 = trunc(_980);
    int _994 = int(_992);
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _998 = _996 != 0;
    int _1000 = _960 * _974;
    int _1002 = _1000 + _988;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1006 = _1004 != 0;
    float _1008 = in.m_55.w;
    bool _1010 = !_998;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = trunc(_986);
    int _1016 = int(_1014);
    bool _1018 = !_1006;
    int _1020 = _1018 ? 0 : 1;
    int _1022 = _902 * _990;
    int _1024 = _1022 + _1002;
    bool _1026 = _681 == 0;
    float _1028 = in.m_59.w;
    int _1030 = abs(_1012);
    int _1032 = abs(_1020);
    int _1034 = ~_978;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    int _1040 = _994 * _1030;
    int _1042 = _1040 + _721;
    bool _1044 = !_1026;
    int _1046 = _1044 ? _944 : (-1);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1062 = _1060 != 0;
    int _1064 = _681 + (-1);
    int _1066 = _1046 * _1038;
    bool _1068 = _671 == 0;
    int _1070 = _850 * _1032;
    int _1072 = _1070 + _1024;
    bool _1074 = !_1054;
    int _1076 = _1074 ? 0 : 1;
    int _1078 = _978 * _1064;
    int _1080 = _1078 + _1066;
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1076);
    bool _1088 = !_1058;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1084);
    int _1094 = _1080 * _1086;
    bool _1096 = !_1062;
    int _1098 = _1096 ? 0 : 1;
    int _1100 = abs(_1090);
    float _1102 = float(uint(_1072));
    int _1104 = abs(_1098);
    float _1106 = as_type<float>(_713) * _1102;
    int _1108 = _1016 * _1092;
    int _1110 = _1108 + _1094;
    float _1112 = trunc(_1106);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = ~_671;
    int _1120 = _1118 + 1;
    int _1122 = _1042 * _1100;
    int _1124 = _1122 + _1110;
    int _1126 = ~_671;
    int _1128 = _1126 + 1;
    int _1130 = _994 * _1104;
    int _1132 = _1130 + _1124;
    int _1134 = ~_681;
    int _1136 = _1134 + 1;
    float _1138 = float(uint(_1132));
    float _1140 = as_type<float>(_729) * _1138;
    int _1142 = _1128 * int(_1116);
    int _1144 = _1142 + _1072;
    float _1146 = trunc(_1140);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = float(uint(_1144));
    float _1154 = as_type<float>(_713) * _1152;
    float _1156 = trunc(_1154);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    int _1162 = _1136 * int(_1150);
    int _1164 = _1162 + _1132;
    float _1166 = float(uint(_1164));
    float _1168 = as_type<float>(_729) * _1166;
    int _1170 = int(_1116) + int(_1160);
    float _1172 = trunc(_1168);
    float _1174 = precise::max(_1172, 0.0);
    uint _1176 = uint(_1174);
    int _1178 = _1120 * _1170;
    int _1180 = _1178 + _1072;
    float _1182 = in.m_57.w;
    bool _1184 = uint(_1180) >= uint(_671);
    int _1186 = ~_681;
    int _1188 = _1186 + 1;
    bool _1190 = !_1184;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = ~_1170;
    int _1196 = _1194 + _1192;
    int _1198 = _1196 + 1;
    int _1200 = int(_1150) + int(_1176);
    int _1202 = _671 * _1198;
    int _1204 = _1202 + _1072;
    int _1206 = _1188 * _1200;
    int _1208 = _1206 + _1132;
    bool _1210 = !_1068;
    int _1212 = _1210 ? _1204 : (-1);
    bool _1214 = uint(_1208) >= uint(_681);
    int _1216 = _1212 & 3;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1214;
    int _1222 = _1220 ? 0 : (-1);
    bool _1224 = uint(_1216) > 1u;
    int _1226 = ~_1200;
    int _1228 = _1226 + _1222;
    int _1230 = _1228 + 1;
    float _1232 = _595 * _175;
    int _1234 = _1212 & 3;
    bool _1236 = _1234 != 0;
    bool _1238 = uint(_1216) >= 2u;
    int _1240 = _681 * _1230;
    int _1242 = _1240 + _1132;
    int _1244 = _1236 ? 0 : 1;
    bool _1246 = _1216 != 3;
    bool _1248 = !_1026;
    int _1250 = _1248 ? _1242 : (-1);
    int _1252 = ~_1244;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = _1238 ? 0 : 1;
    int _1260 = _1256;
    if (!_1224)
    {
        int _1262 = ~_1244;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _595 * _181;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1272 = _1270 != 0;
    float _1274 = fma(_589, _173, _1232);
    int _1276 = _1250 & 3;
    bool _1278 = _1276 != 0;
    float _1280 = in.m_51.w;
    bool _1282 = !_1272;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = fma(_589, _179, _1268);
    bool _1288 = uint(_1276) > 1u;
    float _1290 = _129 * 2.0;
    int _1292 = ~_1258;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_613, _177, _1274);
    int _1300 = _1296;
    if (_1246)
    {
        int _1302 = ~_1258;
        int _1304 = _1302 + 1;
        _1300 = _1304;
    }
    int _1306 = _1300;
    float _1308 = fma(_613, _183, _1286);
    int _1310 = _1250 & 3;
    bool _1312 = _1310 != 0;
    float _1314 = floor(_1290);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1318 = _1316 != 0;
    float _1320 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1322 = _1312 ? 0 : 1;
    float _1324 = in.m_51.z;
    float _1326 = float(uint(_902));
    bool _1328 = _1276 != 3;
    float _1330 = floor(_725);
    int _1332 = ~_1322;
    int _1334 = _1332 + 1;
    int _1336 = _1334 + 1;
    float _1338 = as_type<float>(_713) * _1326;
    bool _1340 = uint(_1276) >= 2u;
    int _1342 = _1336;
    if (!_1288)
    {
        int _1344 = ~_1322;
        int _1346 = _1344 + 1;
        _1342 = _1346;
    }
    int _1348 = _1342;
    bool _1350 = _129 > 0.5;
    float _1352 = trunc(_1338);
    float _1354 = precise::max(_1352, 0.0);
    uint _1356 = uint(_1354);
    float _1358 = float(uint(_1042));
    int _1360 = _1340 ? 0 : 1;
    float _1362 = -_353;
    int _1364 = _1350 ? as_type<int>(_1362) : as_type<int>(_353);
    float _1366 = as_type<float>(_729) * _1358;
    bool _1368 = _699 > 0.5;
    int _1370 = ~_1360;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = trunc(_1366);
    float _1378 = precise::max(_1376, 0.0);
    uint _1380 = uint(_1378);
    int _1382 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1384 = _1382 != 0;
    int _1386 = _1374;
    if (_1328)
    {
        int _1388 = ~_1360;
        int _1390 = _1388 + 1;
        _1386 = _1390;
    }
    int _1392 = _1386;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1394;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1400 = _1398 != 0;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1406 = -_369;
    int _1408 = _1368 ? as_type<int>(_1406) : as_type<int>(_369);
    bool _1410 = !_1384;
    float _1412 = _1410 ? _353 : as_type<float>(_1364);
    float _1414 = 1.0 / _1396;
    bool _1416 = !_1400;
    float _1418 = _1416 ? _369 : as_type<float>(_1408);
    int _1420 = ~_671;
    int _1422 = _1420 + 1;
    float _1424 = _1412 + 0.5;
    bool _1426 = _1324 > 0.5;
    int _1428 = ~_681;
    int _1430 = _1428 + 1;
    int _1432 = _1422 * int(_1356);
    int _1434 = _1432 + _902;
    float _1436 = 1.0 / _1404;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1440 = _1438 != 0;
    float _1442 = -_353;
    int _1444 = _1426 ? as_type<int>(_1442) : as_type<int>(_353);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1454 = _1452 != 0;
    float _1456 = -_1446;
    float _1458 = fma(_1320, 2.0, _1456);
    float _1460 = float(uint(_1434));
    int _1462 = _1430 * int(_1380);
    int _1464 = _1462 + _1042;
    bool _1466 = !_1440;
    float _1468 = _1466 ? _353 : as_type<float>(_1444);
    bool _1470 = _1280 > 0.5;
    float _1472 = as_type<float>(_713) * _1460;
    float _1474 = float(uint(_1464));
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1478 = _647 + _1476;
    float _1480 = -_369;
    int _1482 = _1470 ? as_type<int>(_1480) : as_type<int>(_369);
    float _1484 = as_type<float>(_1430);
    if (_1318)
    {
        _229 = 0;
    }
    int _1486 = _229;
    float _1488 = as_type<float>(_729) * _1474;
    bool _1490 = !_1454;
    float _1492 = _1490 ? _369 : as_type<float>(_1482);
    float _1494 = trunc(_1472);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    bool _1500 = _1314 >= 0.0;
    bool _1502 = isnan(_1314);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    float _1510 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1512 = _1486;
    float _1514 = _1510;
    if (!_1318)
    {
        _1512 = 1;
    }
    int _1516 = _1512;
    float _1518 = _1478 * _1414;
    bool _1520 = _1314 > 0.0;
    float _1522 = _1508 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1524 = trunc(_1488);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    bool _1530 = _1516 != 1;
    int _1532 = ~_671;
    int _1534 = _1532 + 1;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1538 = ~as_type<int>(_1522);
    int _1540 = _1538 + 1;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1544;
    int _1548 = _1542;
    float _1550 = _1522;
    float _1552 = _1414;
    if (!_1520)
    {
        int _1554 = ~as_type<int>(_1522);
        int _1556 = _1554 + 1;
        _1548 = _1556;
    }
    int _1558 = _1548;
    float _1560 = fma(_1510, -2.0, _1536);
    int _1562 = int(_1356) + int(_1498);
    if (!_1530)
    {
        _1484 = _699;
    }
    float _1564 = _1484;
    float _1566 = 1.0 / _1546;
    float _1568 = _1564;
    if (!_1530)
    {
        _1550 = _699;
    }
    float _1570 = _1550;
    float _1572 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1560);
    float _1574 = _1570;
    if (!_1530)
    {
        _1552 = _1324;
    }
    float _1576 = _1552;
    float _1578 = _1576;
    if (!_1530)
    {
        _1514 = _1324;
    }
    float _1580 = _1514;
    float _1582 = _1580;
    if (_1530)
    {
        _1568 = _129;
    }
    float _1584 = _1568;
    if (_1530)
    {
        _1574 = _129;
    }
    float _1586 = _1574;
    if (_1530)
    {
        _1578 = _699;
    }
    float _1588 = _1578;
    float _1590 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1530)
    {
        _1582 = _699;
    }
    float _1592 = _1582;
    bool _1594 = _1330 > 0.0;
    float _1596 = -_665;
    float _1598 = fma(_1590, 2.0, _1596);
    bool _1600 = _1330 >= 0.0;
    bool _1602 = isnan(_1330);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.0);
    bool _1608 = _1604 || _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1612 = _647 + _1610;
    float _1614 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1616 = int(_1380) + int(_1528);
    float _1618 = _1612 * _1436;
    int _1620 = ~_681;
    int _1622 = _1620 + 1;
    int _1624 = _1534 * _1562;
    int _1626 = _1624 + _902;
    int _1628 = _1608 ? 0 : 1;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1632 = _647 + _1630;
    bool _1634 = !_1218;
    int _1636 = _1634 ? 0 : 1;
    int _1638 = _1622 * _1616;
    int _1640 = _1638 + _1042;
    float _1642 = _1324 * 2.0;
    int _1644 = ~_1628;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = _1632 * _1566;
    bool _1652 = uint(_1626) >= uint(_671);
    float _1654 = _129 + _699;
    int _1656 = _1648;
    float _1658 = _1592;
    if (!_1594)
    {
        int _1660 = ~_1628;
        int _1662 = _1660 + 1;
        _1656 = _1662;
    }
    int _1664 = _1656;
    float _1666 = floor(_1642);
    bool _1668 = uint(_1640) >= uint(_681);
    float _1670 = _1654 + (-1.0);
    bool _1672 = !_1652;
    int _1674 = _1672 ? 0 : (-1);
    float _1676 = _129 + _1324;
    int _1678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1680 = _1678 != 0;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1684 = _1682 != 0;
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1688 = _1686 != 0;
    float _1690 = _1324 + _699;
    float _1692 = _1676 + (-1.0);
    float _1694 = _1690 + (-1.0);
    bool _1696 = !_1684;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1702 = _1468 + 0.5;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1708 = _1666 >= 0.0;
    bool _1710 = isnan(_1666);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan(0.0);
    bool _1716 = _1712 || _1714;
    float _1718 = _663 + _1008;
    float _1720 = -_143;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1458);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1724;
    int _1728 = _1716 ? 0 : 1;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1734 = _1666 > 0.0;
    float _1736 = _1298 + _1182;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1738;
    float _1742 = fma(_1726, _1518, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1744 = _1308 + _1028;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1750 = fma(_1740, _1518, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1752 = fma(_1732, _1618, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1754 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1722);
    int _1756 = _1212 >> 31;
    float _1758 = fma(_1748, _1618, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1760 = _1418 + (-0.5);
    int _1762 = _1756 & 3;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1766 = _1718 + _1764;
    int _1768 = _1250 >> 31;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1772 = _1212 + _1762;
    float _1774 = -_1760;
    float _1776 = -_1572;
    float _1778 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1776);
    int _1780 = _1768 & 3;
    float _1782 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1770);
    int _1784 = _1772 >> 2;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1736 + _1786;
    int _1790 = _1250 + _1780;
    float _1792 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1794 = _1784 << 4;
    int _1796 = _1794 + 368;
    float _1798 = -_143;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1598);
    int _1802 = ~_1728;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1792);
    uint _1810 = uint(int(uint(_1796) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    int _1826 = _1806;
    if (!_1734)
    {
        int _1828 = ~_1728;
        int _1830 = _1828 + 1;
        _1826 = _1830;
    }
    int _1832 = _1826;
    float _1834 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[83].w, _673);
    bool _1836 = !_1278;
    int _1838 = _1836 ? 0 : 1;
    float _1840 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1800);
    int _1842 = _1790 >> 2;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1744 + _1844;
    bool _1848 = _1216 != 3;
    float _1850 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1782);
    int _1852 = _1842 << 4;
    int _1854 = _1852 + 512;
    float _1856 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1808);
    bool _1858 = !_1848;
    int _1860 = _1858 ? 0 : (-1);
    float _1862 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1834);
    bool _1864 = _1276 != 3;
    uint _1866 = uint(int(uint(_1854) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    int _1882 = abs(_1698);
    bool _1884 = !_1864;
    int _1886 = _1884 ? 0 : (-1);
    bool _1888 = _1856 >= 0.0;
    int _1890 = abs(_1266);
    int _1892 = _1796 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = int(_1894) + 1;
    uint _1904 = uint(int(uint(_1902) >> uint(2)));
    int _1906 = _1902 & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    float _1910 = float(_1558);
    int _1912 = abs(_1636);
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1916 = abs(_1838);
    int _1918 = _1854 + 8;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = abs(_1348);
    if (_1888)
    {
        out.m_47.x = 0.0;
    }
    if (_1888)
    {
        _1658 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1938 = _1658;
    int _1940 = ~_1890;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = float(_1882);
    float _1948 = fma(_1614, -2.0, _1914);
    int _1950 = as_type<int>(_1938);
    if (_1888)
    {
        float _1952 = _1938 * 5.0;
        _1950 = as_type<int>(_1952);
    }
    int _1954 = _1950;
    int _1956 = abs(_1860);
    float _1958 = _1492 + (-0.5);
    float _1960 = _1946 * _1910;
    int _1962 = ~_1562;
    int _1964 = _1962 + _1674;
    int _1966 = _1964 + 1;
    int _1968 = ~_1936;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = _1944 * as_type<int>(_1824);
    int _1976 = _671 * _1966;
    int _1978 = _1976 + _902;
    if (_1888)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6681 = as_type<float>(_1954);
        out.gl_Position.z = _6681;
    }
    int _1980 = abs(_1392);
    float _1982 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1948);
    bool _1984 = !_1668;
    int _1986 = _1984 ? 0 : (-1);
    bool _1988 = _671 == 0;
    float _1990 = -_1958;
    float _1992 = -_1982;
    float _1994 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1992);
    int _1996 = ~_1616;
    int _1998 = _1996 + _1986;
    int _2000 = _1998 + 1;
    bool _2002 = !_1988;
    int _2004 = _2002 ? _1978 : (-1);
    int _2006 = _1972 * as_type<int>(_1880);
    int _2008 = abs(_1306);
    int _2010 = _681 * _2000;
    int _2012 = _2010 + _1042;
    int _2014 = ~_1912;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = _2018 * as_type<int>(_1816);
    int _2022 = _2020 + _1974;
    int _2024 = ~_2008;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_1916;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = _2028 * as_type<int>(_1900);
    int _2038 = _2036 + _2022;
    int _2040 = ~_1956;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _2034 * as_type<int>(_1872);
    int _2048 = _2046 + _2006;
    int _2050 = ~_1980;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = abs(_1284);
    int _2058 = _2044 * as_type<int>(_1908);
    int _2060 = _2058 + _2038;
    bool _2062 = !_1450;
    int _2064 = _2062 ? 0 : 1;
    int _2066 = _2054 * as_type<int>(_1926);
    int _2068 = _2066 + _2048;
    int _2070 = abs(_1886);
    float _2072 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2074 = log2(_2072);
    int _2076 = abs(_2064);
    int _2078 = ~_2056;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = ~_2070;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    int _2090 = _2060 * _2082;
    bool _2092 = _681 == 0;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2096 = _2088 * as_type<int>(_1934);
    int _2098 = _2096 + _2068;
    int _2100 = ~_2076;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    float _2106 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2094);
    int _2108 = _2004 * _2056;
    int _2110 = _2108 + _2090;
    bool _2112 = !_2092;
    int _2114 = _2112 ? _2012 : (-1);
    float _2116 = _1766 * _1766;
    int _2118 = _2098 * _2104;
    float _2120 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2106);
    float _2122 = _2074 * _143;
    float _2124 = fma(_1788, _1788, _2116);
    int _2126 = _2114 * _2076;
    int _2128 = _2126 + _2118;
    float _2130 = -_2120;
    float _2132 = _2130 + 1.0;
    bool _2134 = !_1680;
    int _2136 = _2134 ? 0 : 1;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2140 = exp2(_2122);
    float _2142 = fma(_1846, _1846, _2124);
    float _2144 = float(_2110);
    float _2146 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2138);
    float _2148 = fma(_1418, _2132, _1778);
    float _2150 = -_1850;
    float _2152 = _2150 + 1.0;
    int _2154 = abs(_2136);
    float _2156 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2146);
    float _2158 = float(_2128);
    float _2160 = rsqrt(_2142);
    float _2162 = in.m_66.x;
    float _2164 = in.m_66.y;
    float _2166 = in.m_66.z;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2170 = 1.0 + _2168;
    float _2172 = -_2156;
    float _2174 = _2172 + 1.0;
    float _2176 = -_1862;
    float _2178 = _2176 + 1.0;
    float _2180 = -_2152;
    float _2182 = fma(_1468, _2180, _1840);
    out.m_68.x = _2144;
    out.m_68.y = _2158;
    float _2184 = -_2174;
    float _2186 = fma(_1412, _2184, _1754);
    float _2188 = 1.0 / _2170;
    float _2190 = fma(_1492, _2178, _1994);
    bool _2192 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2194 = isnan(0.0);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2200 = _2196 || _2198;
    float _2202 = -_2140;
    float _2204 = _2202 + 1.0;
    bool _2206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2208 = isnan(1.0);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2214 = _2210 || _2212;
    out.m_70.x = _2186;
    out.m_70.y = _2148;
    out.m_70.z = _2182;
    out.m_70.w = _2190;
    bool _2216 = !_1688;
    int _2218 = _2216 ? 0 : 1;
    float _2220 = _1788 * _2160;
    float _2222 = float(_2154);
    float _2224 = _1766 * _2160;
    float _2226 = float(_1832);
    if (_1888)
    {
        return out;
    }
    float _2228 = -_2224;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1718);
    float _2232 = _2200 ? _2204 : 0.0;
    float _2234 = _1846 * _2160;
    float _2236 = -_2220;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2242 = _2230 + _2240;
    float _2244 = _2222 * _2226;
    float _2246 = -_2234;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1744);
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2252 = _2238 + _2250;
    float _2254 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_2214)
    {
        float _2256 = _2232 * _2188;
        _147 = _2256;
    }
    float _2258 = _147;
    float _2260 = _2244 * (-2.0);
    float _2262 = _129 + (-0.5);
    bool _2264 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2266 = isnan(_647);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2278 = _2248 + _2276;
    float _2280 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2254);
    float _2282 = fma(_2260, _2162, _2162);
    float _2284 = fma(_1700, _2260, _1700);
    bool _2286 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2288 = isnan(_647);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = -_2274;
    float _2300 = _2298 + 1.0;
    float _2302 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2280);
    float _2304 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2282);
    float _2306 = -_2224;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    bool _2310 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2312 = isnan(_647);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2318 = _2314 || _2316;
    float _2320 = float(_2318);
    float _2322 = _2296 * _2300;
    float _2324 = -_2296;
    float _2326 = _2324 + 1.0;
    bool _2328 = _2302 >= 0.0;
    float _2330 = -_2220;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2334 = _2308 * _2308;
    float _2336 = _2320 * _2326;
    float _2338 = -_2320;
    float _2340 = _2338 + 1.0;
    float _2342 = -_2234;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _2346 = fma(_2332, _2332, _2334);
    float _2348 = fma(_2284, _2258, _2304);
    bool _2350 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2352 = isnan(_647);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    float _2362 = fma(_2344, _2344, _2346);
    float _2364 = _2348 * 0.15915493667125701904296875;
    int _2366 = abs(_2218);
    float _2368 = _2360 * _2340;
    float _2370 = _2304;
    if (_2328)
    {
        _2370 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2372 = _2370;
    float _2374 = _2364 * 6.283185482025146484375;
    float _2376 = sin(_2374);
    float _2378 = float(_1664);
    int _2380 = as_type<int>(_2372);
    if (_2328)
    {
        float _2382 = _2372 * 5.0;
        _2380 = as_type<int>(_2382);
    }
    int _2384 = _2380;
    float _2386 = float(_2366);
    float _2388 = _1742 * _2368;
    float _2390 = _1960 * (-2.0);
    float _2392 = sqrt(_2362);
    if (_2328)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7286 = as_type<float>(_2384);
        out.gl_Position.z = _7286;
    }
    float _2394 = _1750 * _2368;
    float _2396 = _2386 * _2378;
    float _2398 = fma(_1704, _2390, _1704);
    if (_2328)
    {
        out.m_47.x = 0.0;
    }
    if (_2328)
    {
        return out;
    }
    float _2400 = -_1718;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2404 = fma(_2390, _2164, _2164);
    float _2406 = -_1736;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2410 = -_1744;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2414 = _2402 * _2402;
    float _2416 = _699 + (-0.5);
    float _2418 = -_2360;
    float _2420 = _2418 + 1.0;
    float _2422 = _2396 * (-2.0);
    float _2424 = fma(_2408, _2408, _2414);
    float _2426 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2404);
    float _2428 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2394);
    float _2430 = fma(_2412, _2412, _2424);
    float _2432 = fma(_2398, _2258, _2426);
    float _2434 = _2364 * 6.283185482025146484375;
    float _2436 = cos(_2434);
    float _2438 = _1324 + (-0.5);
    float _2440 = _2432 * 0.15915493667125701904296875;
    float _2442 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2388);
    float _2444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2444;
    float _2448 = in.m_64.x;
    float _2450 = in.m_64.y;
    float _2452 = fma(_1758, _2336, _2428);
    float _2454 = fma(_1752, _2336, _2442);
    float _2456 = rsqrt(_2430);
    float _2458 = fma(_2422, _2166, _2166);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2460;
    float _2464 = fma(_1706, _2422, _1706);
    float _2466 = _2160 * _2392;
    float _2468 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2458);
    float _2470 = fma(_2462, _1650, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2472 = fma(_2446, _1650, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2474 = _2440 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    float _2478 = fma(_2464, _2258, _2468);
    float _2480 = fma(_2470, _2322, _2452);
    float _2482 = fma(_2472, _2322, _2454);
    float _2484 = _2478 * 0.15915493667125701904296875;
    float _2486 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2480);
    float _2488 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2482);
    float _2490 = _2408 * _2456;
    float _2492 = _2412 * _2456;
    float _2494 = _2402 * _2456;
    float _2496 = _2440 * 6.283185482025146484375;
    float _2498 = cos(_2496);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2502 = _2490 * _2500;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2506 = _2492 * _2504;
    float _2508 = _2486 * _2448;
    float _2510 = _2488 * _2450;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2514 = -_2502;
    float _2516 = fma(_2492, _2512, _2514);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2520 = _2494 * _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2524 = -_2506;
    float _2526 = fma(_2494, _2522, _2524);
    float _2528 = _2484 * 6.283185482025146484375;
    float _2530 = sin(_2528);
    float _2532 = _2516 * _2516;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2536 = -_2520;
    float _2538 = fma(_2490, _2534, _2536);
    float _2540 = _2510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2542 = _2376 * _2476;
    float _2544 = fma(_2526, _2526, _2532);
    float _2546 = _2508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _369);
    float _2550 = _2484 * 6.283185482025146484375;
    float _2552 = cos(_2550);
    float _2554 = fma(_2538, _2538, _2544);
    float _2556 = _2436 * _2498;
    float _2558 = _2466 * _2540;
    float _2560 = _2546 * _2466;
    float _2562 = _2436 * _2476;
    float _2564 = _2376 * _2498;
    float _2566 = _2548 * _2558;
    float _2568 = rsqrt(_2554);
    float _2570 = fma(_2530, _2556, _2542);
    float _2572 = fma(_2530, _2542, _2556);
    float _2574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2576 = -_2562;
    float _2578 = fma(_2530, _2564, _2576);
    float _2580 = -_2564;
    float _2582 = fma(_2530, _2562, _2580);
    float _2584 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2586 = _2584 * 0.5;
    float _2588 = _2560 * _2574;
    float _2590 = _2436 * _2552;
    float _2592 = _2498 * _2552;
    float _2594 = _2376 * _2552;
    float _2596 = _2476 * _2552;
    float _2598 = _2590 * _2566;
    float _2600 = -_2566;
    float _2602 = _2530 * _2600;
    float _2604 = _2594 * _2566;
    bool _2606 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2608 = isnan(0.5);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2614 = _2610 || _2612;
    float _2616 = _2526 * _2568;
    float _2618 = _2516 * _2568;
    float _2620 = fma(_2570, _2588, _2598);
    float _2622 = fma(_2592, _2588, _2602);
    float _2624 = _2494 * _2616;
    float _2626 = _2538 * _2568;
    float _2628 = fma(_2582, _2586, _2620);
    float _2630 = _2492 * _2618;
    float _2632 = -_2624;
    float _2634 = fma(_2490, _2618, _2632);
    float _2636 = fma(_2578, _2588, _2604);
    float _2638 = fma(_2596, _2586, _2622);
    float _2640 = -_2630;
    float _2642 = fma(_2494, _2626, _2640);
    float _2644 = _2634 * _2628;
    float _2646 = fma(_2572, _2586, _2636);
    float _2648 = _2490 * _2626;
    float _2650 = _2642 * _2628;
    float _2652 = fma(_2626, _2638, _2644);
    float _2654 = -_2648;
    float _2656 = fma(_2492, _2616, _2654);
    float _2658 = fma(_2616, _2638, _2650);
    float _2660 = fma(_2492, _2646, _2652);
    float _2662 = _2656 * _2628;
    float _2664 = fma(_2490, _2646, _2658);
    float _2666 = _1744 + _2660;
    float _2668 = _1736 + _2664;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2672 = _2666 + _2670;
    float _2674 = fma(_2618, _2638, _2662);
    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2678 = _2668 + _2676;
    float _2680 = _2672 * _2672;
    float _2682 = fma(_2494, _2646, _2674);
    float _2684 = fma(_2678, _2678, _2680);
    float _2686 = _1718 + _2682;
    float _2688 = sqrt(_2684);
    bool _2690 = _2688 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2692 = _2674;
    float _2694 = _2680;
    float _2696 = _2668;
    float _2698 = _2466;
    if (!_2690)
    {
        _2692 = _2668;
    }
    float _2700 = _2692;
    float _2702 = _2700;
    if (!_2690)
    {
        _2694 = _2666;
    }
    float _2704 = _2694;
    float _2706 = _2704;
    if (!_2690)
    {
        _2696 = _2686;
    }
    float _2708 = _2696;
    bool _2710 = !_2690;
    float _2712 = _2708;
    if (!_2710)
    {
        float _2714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2718 = _2688 + _2716;
        float _2720 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2722 = rsqrt(_2684);
        float _2724 = _2718 * _2714;
        float _2726 = _2724 * 0.15915493667125701904296875;
        float _2728 = _2726 * 6.283185482025146484375;
        float _2730 = sin(_2728);
        float _2732 = _2726 * 6.283185482025146484375;
        float _2734 = cos(_2732);
        float _2736 = fma(_2730, _2720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2738 = _2722 * _2736;
        float _2740 = _2734 + (-1.0);
        float _2742 = fma(_2678, _2738, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2744 = fma(_2672, _2738, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2746 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2748 = fma(_2686, _2734, _2746);
        _2702 = _2742;
        _2712 = _2748;
        _2706 = _2744;
    }
    float _2750 = _2702;
    float _2752 = _2712;
    float _2754 = _2706;
    float _2756 = -_2220;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2750);
    float _2760 = -_2224;
    float _2762 = fma(_2760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2752);
    float _2764 = -_2234;
    float _2766 = fma(_2764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2754);
    float _2768 = _2762;
    float _2770 = _2758;
    float _2772 = _2766;
    if (!_2614)
    {
        float _2774 = _2242 * _2242;
        float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2778 = fma(_2252, _2252, _2774);
        float _2780 = fma(_2278, _2278, _2778);
        float _2782 = 1.0 / _2466;
        float _2784 = sqrt(_2780);
        float _2786 = precise::min(_2784, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2788 = _2786 * _2776;
        float _2790 = -_1736;
        float _2792 = _2790 + _2750;
        float _2794 = -_1744;
        float _2796 = _2794 + _2754;
        float _2798 = _2788 * _2782;
        float _2800 = -_1718;
        float _2802 = _2800 + _2752;
        float _2804 = fma(_2792, _2798, _2238);
        float _2806 = fma(_2802, _2798, _2230);
        float _2808 = fma(_2796, _2798, _2248);
        _2768 = _2806;
        _2770 = _2804;
        _2772 = _2808;
        _2698 = _2782;
    }
    float _2810 = _2768;
    float _2812 = _2770;
    float _2814 = _2772;
    float _2816 = _2698;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2820 = _2810 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2824 = _2812 + _2822;
    float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2828 = _2814 + _2826;
    float _2830 = _2820 * _2820;
    float _2832 = fma(_2824, _2824, _2830);
    float _2834 = fma(_2828, _2828, _2832);
    float _2836 = rsqrt(_2834);
    float _2838 = sqrt(_2834);
    float _2840 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2842 = _2824 * _2840;
    float _2844 = _2828 * _2840;
    float _2846 = _2842 * _2842;
    float _2848 = _2844 * _2844;
    float _2850 = _2846 + _2848;
    float _2852 = sqrt(_2850);
    bool _2854 = _2852 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2858 = _2852 + _2856;
    float _2860 = _2828;
    float _2862 = _2850;
    float _2864 = _2858;
    float _2866 = _2816;
    float _2868 = _2840;
    if (_2854)
    {
        float _2870 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2860 = _2870;
    }
    float _2872 = _2860;
    if (_2854)
    {
        float _2874 = rsqrt(_2850);
        _2862 = _2874;
    }
    float _2876 = _2862;
    float _2878 = _2876;
    if (_2854)
    {
        float _2880 = _2858 * _2872;
        _2864 = _2880;
    }
    float _2882 = _2864;
    if (_2854)
    {
        float _2884 = _2882 * 0.15915493667125701904296875;
        _2866 = _2884;
    }
    float _2886 = _2866;
    float _2888 = _2872;
    float _2890 = _2886;
    if (_2854)
    {
        float _2892 = _2886 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        _2888 = _2894;
    }
    float _2896 = _2888;
    float _2898 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2900 = precise::max(0.0, _2898);
    float _2902 = _2830;
    float _2904 = _2900;
    if (_2854)
    {
        float _2906 = _2886 * 6.283185482025146484375;
        float _2908 = cos(_2906);
        _2902 = _2908;
    }
    float _2910 = _2902;
    float _2912 = -_2840;
    float _2914 = -_2900;
    float _2916 = fma(_2820, _2912, _2914);
    float _2918 = _2916;
    if (_2854)
    {
        float _2920 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2904 = _2920;
    }
    float _2922 = _2904;
    float _2924 = _2896;
    float _2926 = _2922;
    if (_2854)
    {
        float _2928 = fma(_2896, _2922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2924 = _2928;
    }
    float _2930 = _2924;
    float _2932 = _2930;
    float _2934 = _2910;
    if (_2854)
    {
        float _2936 = _2910 + (-1.0);
        _2926 = _2936;
    }
    float _2938 = _2926;
    float _2940 = _2938;
    if (_2854)
    {
        float _2942 = _2876 * _2930;
        _2868 = _2942;
    }
    float _2944 = _2868;
    if (!_2854)
    {
        _2932 = _2842;
    }
    float _2946 = _2932;
    float _2948 = _2946;
    if (_2854)
    {
        float _2950 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2890 = _2950;
    }
    float _2952 = _2890;
    if (_2854)
    {
        float _2954 = _2842 * _2944;
        _2948 = _2954;
    }
    float _2956 = _2948;
    if (!_2854)
    {
        _2940 = _2844;
    }
    float _2958 = _2940;
    float _2960 = _2958;
    if (_2854)
    {
        float _2962 = _2844 * _2944;
        _2960 = _2962;
    }
    float _2964 = _2960;
    if (!_2854)
    {
        _2878 = _2846;
    }
    float _2966 = _2878;
    float _2968 = _2966;
    if (_2854)
    {
        float _2970 = fma(_2916, _2910, _2952);
        _2918 = _2970;
    }
    float _2972 = _2918;
    if (_2854)
    {
        float _2974 = _2956 * _2956;
        _2968 = _2974;
    }
    float _2976 = _2968;
    if (!_2854)
    {
        _2934 = _2848;
    }
    float _2978 = _2934;
    float _2980 = _2978;
    if (_2854)
    {
        float _2982 = _2964 * _2964;
        _2980 = _2982;
    }
    float _2984 = _2980;
    float _2986 = fma(_2972, _2972, _2976);
    float _2988 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2990 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2992 = _2986 + _2984;
    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2996 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2994);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2988);
    float _3002 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3004 = rsqrt(_2992);
    float _3006 = -_2998;
    float _3008 = _3006 + 1.0;
    float _3010 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3000);
    float _3012 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3014 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3002);
    float _3016 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3020 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3012);
    float _3022 = abs(_3008);
    float _3024 = log2(_3022);
    float _3026 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3014);
    float _3028 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3016);
    float _3030 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3020);
    float _3032 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3034 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3036 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3028);
    float _3038 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3040 = _3004 * _2956;
    float _3042 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3044 = _3004 * _2972;
    float _3046 = _3004 * _2964;
    float _3048 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3050 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3042);
    float _3052 = _3036 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3054 = -_3032;
    float _3056 = fma(_3054, _2990, 1.0);
    float _3058 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3060 = -_3048;
    float _3062 = fma(_3044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3060);
    float _3064 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3050);
    float _3066 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3068 = -_3046;
    float _3070 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3062);
    float _3072 = exp2(_3058);
    float _3074 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3064);
    float _3076 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3078 = fma(_3070, -0.5, 0.5);
    float _3080 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3066);
    float _3082 = _3044 + 1.0;
    float _3084 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3076);
    float _3086 = fma(_3070, 0.5, 0.5);
    float _3088 = log2(_3056);
    float _3090 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3080);
    float _3092 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3084);
    float _3094 = fma(_3086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3096 = fma(_3086, _3094, -0.212114393711090087890625);
    float _3098 = 1.0 / _3074;
    float _3100 = -_3044;
    float _3102 = fma(_3072, _3082, _3100);
    float _3104 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3092);
    float _3106 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3090);
    float _3108 = fma(_3086, _3096, 1.570728778839111328125);
    float _3110 = fma(_3102, 0.5, 0.5);
    float _3112 = sqrt(_3078);
    float _3114 = _3088 * 0.693147182464599609375;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3118 = _3104 * _3098;
    float _3120 = _3106 * _3098;
    float _3122 = fma(_3118, 0.5, 0.5);
    float _3124 = fma(_3120, -0.5, 0.5);
    float _3126 = _3112 * 0.636619746685028076171875;
    float3 _8471 = float3(_3122, _3124, _3116);
    float _3128 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8471, float3(0.0), isnan(_8471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8471, float3(0.0), isnan(_8471)), level(0.0)).x;
    float _3130 = -_3108;
    float _3132 = fma(_3126, _3130, 1.0);
    float3 _8487 = float3(_3122, _3124, _3116);
    float4 _3135 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8487, float3(0.0), isnan(_8487)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8487, float3(0.0), isnan(_8487)), level(0.0)).xyzw;
    float _3137 = _3135.x;
    float _3139 = _3135.y;
    float _3141 = _3135.z;
    float _3143 = _3135.w;
    float2 _8504 = float2(_3132, _3110);
    float3 _3147 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8504, float2(0.0), isnan(_8504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8504, float2(0.0), isnan(_8504)), level(0.0)).xyz;
    float _3149 = _3147.x;
    float _3151 = _3147.y;
    float _3153 = _3147.z;
    float _3155 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3159 = _369 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3161 = _2590 * _2642;
    float _3163 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3165 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3167 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3169 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3157);
    float _3171 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3163);
    float _3173 = fma(_3159, _3159, 1.0);
    float _3175 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3165);
    float _3177 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3167);
    float _3179 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3169);
    float _3181 = _3171 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3183 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3175);
    float _3185 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3177);
    float _3187 = rsqrt(_3173);
    float _3189 = _3179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3191 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3193 = _2570 * _2642;
    float _3195 = _2570 * _2656;
    float _3197 = _2570 * _2634;
    float _3199 = _2590 * _2656;
    float _3201 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3191);
    float _3203 = _2590 * _2634;
    float _3205 = _2582 * _2642;
    float _3207 = _2582 * _2656;
    float _3209 = fma(_2592, _2618, _3195);
    float _3211 = _2582 * _2634;
    float _3213 = fma(_2592, _2616, _3193);
    float _3215 = fma(_2592, _2626, _3197);
    float _3217 = -_2530;
    float _3219 = fma(_3217, _2616, _3161);
    float _3221 = -_2530;
    float _3223 = fma(_3221, _2618, _3199);
    float _3225 = -_2530;
    float _3227 = fma(_3225, _2626, _3203);
    float _3229 = fma(_2596, _2616, _3205);
    float _3231 = fma(_2596, _2618, _3207);
    float _3233 = fma(_2596, _2626, _3211);
    float _3235 = fma(_2594, _2490, _3219);
    float _3237 = fma(_2594, _2494, _3223);
    float _3239 = fma(_2594, _2492, _3227);
    float _3241 = fma(_2572, _2490, _3229);
    float _3243 = fma(_2572, _2494, _3231);
    float _3245 = fma(_2572, _2492, _3233);
    float _3247 = fma(_2578, _2492, _3215);
    float _3249 = _3159 * _3187;
    float _3251 = fma(_2578, _2490, _3213);
    float _3253 = fma(_2578, _2494, _3209);
    float _3255 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3257 = -_3241;
    float _3259 = _3249 * _3257;
    float _3261 = -_3243;
    float _3263 = _3249 * _3261;
    float _3265 = -_3245;
    float _3267 = _3249 * _3265;
    float _3269 = _3159 * _3239;
    float _3271 = -_617;
    float _3273 = _3271 + _2810;
    out.m_72.x = _3251;
    out.m_72.y = _3253;
    out.m_72.z = _3247;
    float _3275 = _3159 * _3235;
    float _3277 = -_615;
    float _3279 = _3277 + _2812;
    float _3281 = _3159 * _3237;
    float _3283 = fma(_3187, _3237, _3263);
    float _3285 = fma(_3255, _3251, _3275);
    float _3287 = -_619;
    float _3289 = _3287 + _2814;
    float _3291 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3293 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3295 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3297 = fma(_3187, _3235, _3259);
    float _3299 = fma(_3255, _3253, _3281);
    float _3301 = fma(_3255, _3247, _3269);
    float _3303 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3305 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3307 = fma(_3187, _3239, _3267);
    float _3309 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3291);
    float _3311 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3303);
    float _3313 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3315 = _3183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3317 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3293);
    float _3319 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3311);
    float _3321 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3313);
    float _3323 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3305);
    float _3325 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3295);
    float _3327 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    out.m_74.x = _3297;
    out.m_74.y = _3283;
    out.m_74.z = _3307;
    float _3329 = _3185 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3331 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3333 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3321);
    float _3335 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3323);
    float _3337 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3317);
    float _3339 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3331);
    float _3341 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3343 = _3074 * 0.5;
    float _3345 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3337);
    float _3347 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3339);
    float _3349 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3351 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3353 = _3327 + _3325;
    float _3355 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3347);
    float _3357 = _3104 + _3074;
    float _3359 = 1.0 / _3351;
    float _3361 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3353);
    float _3363 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3365 = _3355 + _3074;
    float _3367 = _3357 * 0.5;
    out.gl_Position.x = _3104;
    out.gl_Position.y = _3106;
    out.gl_Position.z = _3355;
    out.gl_Position.w = _3074;
    float _3369 = _3365 * 0.5;
    float _3371 = exp2(_3363);
    float _3373 = fma(_3106, -0.5, _3343);
    float _3375 = _3241 + _3285;
    float _3377 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3379 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3381 = _3245 + _3301;
    out.m_76.x = _3367;
    out.m_76.y = _3373;
    out.m_76.z = _3369;
    out.m_76.w = _3074;
    float _3383 = _3377 + _3309;
    float _3385 = 1.0 / _3361;
    float _3387 = _3349 * _3359;
    out.m_78.x = _2812;
    out.m_78.y = _2810;
    out.m_78.z = _2814;
    float _3389 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3383);
    float _3391 = _3341 * _3359;
    out.m_80.y = 1.0;
    float _3393 = -_3371;
    float _3395 = _3393 + 1.0;
    float _3397 = _3243 + _3299;
    float _3399 = _3379 + _3201;
    float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _3375;
    out.m_82.y = _3397;
    out.m_82.z = _3381;
    float _3403 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3399);
    float _3405 = _3345 * _3385;
    float _3407 = -_3401;
    float _3409 = _3407 + 1.0;
    float _3411 = _3389 * _3385;
    bool _3413 = _3405 > 0.0;
    bool _3415 = _3405 < 1.0;
    bool _3417 = _3415 && _3413;
    bool _3419 = _3118 > (-1.0);
    bool _3421 = _3419 && _3417;
    bool _3423 = _3120 > (-1.0);
    bool _3425 = _3423 && _3421;
    bool _3427 = _3118 < 1.0;
    bool _3429 = _3427 && _3425;
    bool _3431 = _3120 < 1.0;
    bool _3433 = _3431 && _3429;
    float _3435 = _3401 * _3128;
    float _3437 = _3403 * _3385;
    float _3439 = _3143 * _3435;
    float _3441 = _3143 * _3409;
    float _3443 = _3153 * _3435;
    float _3445 = fma(_3149, _3439, _3137);
    float _3447 = fma(_3151, _3439, _3139);
    float _3449 = fma(_3143, _3443, _3141);
    out.m_84.x = _3445;
    out.m_84.y = _3447;
    out.m_84.z = _3449;
    out.m_84.w = _3441;
    bool _3451 = !_3433;
    float _3453 = _3104;
    float _3455 = _3445;
    float _3457 = _3106;
    float _3459 = _3411;
    float _3461 = _3379;
    float _3463 = _3074;
    float _3495;
    if (!_3451)
    {
        float _3465 = -_3437;
        float _3467 = _3120 + _3465;
        float _3469 = -_3411;
        float _3471 = _3118 + _3469;
        float _3473 = -_3391;
        float _3475 = _3118 + _3473;
        float _3477 = -_3387;
        float _3479 = _3120 + _3477;
        float _3481 = _3467 * _3467;
        float _3483 = fma(_3471, _3471, _3481);
        float _3485 = sqrt(_3483);
        bool _3487 = _3485 > 0.0;
        float _3489 = _3485;
        _3459 = _3483;
        if (!_3487)
        {
            _3489 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3491 = _3489;
        bool _3493 = !_3487;
        _3495 = _3491;
        _3497 = _3493;
        if (!_3497)
        {
            float _3499 = _3479 * _3479;
            float _3501 = fma(_3475, _3475, _3499);
            float _3503 = rsqrt(_3483);
            float _3505 = sqrt(_3501);
            float _3507 = _3471 * _3503;
            float _3509 = _3467 * _3503;
            bool _3511 = _3505 > 0.0;
            float _3513 = _3503;
            _3455 = _3505;
            if (!_3511)
            {
                _3513 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3515 = _3513;
            bool _3517 = !_3511;
            _3495 = _3515;
            _3497 = _3517;
            if (!_3497)
            {
                float _3519 = _2560 * _3329;
                float _3521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3523 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3327);
                float _3525 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3379);
                float _3527 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3523);
                float _3529 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3377);
                float _3531 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3525);
                float _3533 = rsqrt(_3501);
                float _3535 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3529);
                float _3537 = _3521 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3539 = 1.0 / _3527;
                float _3541 = _3479 * _3537;
                float _3543 = _3475 * _3537;
                float _3545 = _3541 * _3541;
                float _3547 = fma(_3543, _3543, _3545);
                float _3549 = _3479 * _3533;
                float _3551 = _3475 * _3533;
                float _3553 = _3509 * _3549;
                float _3555 = _3531 * _3539;
                float _3557 = _3535 * _3539;
                float _3559 = sqrt(_3547);
                float _3561 = fma(_3507, _3551, _3553);
                float _3563 = _3555 * _3555;
                float _3565 = fma(_3557, _3557, _3563);
                float _3567 = precise::min(0.0, _3561);
                float _3569 = sqrt(_3565);
                float _3571 = _3074 * _3567;
                float _3573 = fma(_3543, _3571, _3104);
                float _3575 = fma(_3541, _3571, _3106);
                out.gl_Position.x = _3573;
                out.gl_Position.y = _3575;
                float _3577 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3569);
                float _3579 = 1.0 / _3577;
                float _3581 = _3569 * _3579;
                out.m_80.y = _3581;
                _3453 = _3573;
                _3455 = _3581;
                _3457 = _3575;
                _3459 = _3541;
                _3461 = _3561;
                _3495 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3497 = true;
            }
        }
    }
    else
    {
        float _3583 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3583;
        _3455 = 0.0;
        _3461 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3495 = 0.0;
    }
    _3497 = false;
    float _3585 = _3453;
    float _3587 = _3455;
    float _3589 = _3457;
    float _3591 = _3459;
    float _3593 = _3461;
    float _3595 = _3495;
    bool _3597 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3599 = isnan(_2838);
    bool _3601 = _3597 || _3599;
    bool _3603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3605 = _3601 || _3603;
    float _3607 = _3587;
    float _3609 = _3591;
    float _3611 = _3589;
    float _3613 = _3585;
    float _3615 = _3593;
    if (!_3605)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3617 = _3607;
    float _3619 = _3617;
    float _3621 = _3617;
    if (!_3605)
    {
        _3463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3623 = _3463;
    float _3625 = _3623;
    float _3627 = _3623;
    if (!_3605)
    {
        _3609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3629 = _3609;
    float _3631 = _3629;
    float _3633 = _3629;
    if (!_3605)
    {
        _3611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3635 = _3611;
    float _3637 = _3635;
    float _3639 = _3635;
    if (!_3605)
    {
        _3613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3641 = _3613;
    float _3643 = _3641;
    float _3645 = _3641;
    if (!_3605)
    {
        _3615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3647 = _3615;
    bool _3649 = !_3605;
    float _3651 = _3647;
    float _3653 = _3647;
    if (!_3649)
    {
        bool _3655 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3657 = isnan(_2838);
        bool _3659 = _3655 || _3657;
        bool _3661 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3663 = _3659 || _3661;
        if (!_3663)
        {
            float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3667 = _2838 + _3665;
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3671 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3669;
            float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3675 = _3673 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3677 = 1.0 / _3671;
            float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3695 = _3667 * _3677;
            float _3697 = precise::clamp(_3695, 0.0, 1.0);
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3703 = fma(_3697, _3675, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3705 = fma(_3697, _3701, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3707 = fma(_3697, _3681, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3709 = fma(_3697, _3685, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3711 = fma(_3697, _3689, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3713 = fma(_3697, _3693, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3627 = _3707;
            _3645 = _3711;
            _3621 = _3703;
            _3639 = _3709;
            _3633 = _3705;
            _3653 = _3713;
            _3715 = true;
        }
        else
        {
            bool _3717 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3719 = isnan(_2838);
            bool _3721 = _3717 || _3719;
            bool _3723 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3725 = _3721 || _3723;
            if (!_3725)
            {
                _3619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3727 = _3619;
            _3621 = _3727;
            if (!_3725)
            {
                _3625 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3729 = _3625;
            _3627 = _3729;
            if (!_3725)
            {
                _3631 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3731 = _3631;
            _3633 = _3731;
            if (!_3725)
            {
                _3637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3733 = _3637;
            _3639 = _3733;
            if (!_3725)
            {
                _3643 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3735 = _3643;
            _3645 = _3735;
            if (!_3725)
            {
                _3651 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3737 = _3651;
            bool _3739 = !_3725;
            _3653 = _3737;
            if (!_3739)
            {
                bool _3741 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3743 = isnan(_2838);
                bool _3745 = _3741 || _3743;
                bool _3747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3749 = _3745 || _3747;
                if (!_3749)
                {
                    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3753 = _2838 + _3751;
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3757 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3755;
                    float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3763 = 1.0 / _3757;
                    float _3765 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3767 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3781 = _3753 * _3763;
                    float _3783 = precise::clamp(_3781, 0.0, 1.0);
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3789 = fma(_3783, _3761, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3791 = fma(_3783, _3787, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3793 = fma(_3783, _3767, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3795 = fma(_3783, _3771, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3797 = fma(_3783, _3775, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3799 = fma(_3783, _3779, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3627 = _3793;
                    _3645 = _3797;
                    _3621 = _3789;
                    _3639 = _3795;
                    _3633 = _3791;
                    _3653 = _3799;
                    _3715 = true;
                }
                else
                {
                    _3627 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3645 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3633 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3653 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3715 = false;
    float _3801 = _3627;
    float _3803 = _3645;
    float _3805 = _3621;
    float _3807 = _3639;
    float _3809 = _3633;
    float _3811 = _3653;
    float _3813 = fma(_3397, -0.5, 0.5);
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = -_3801;
    float _3819 = _3817 + _3803;
    float _3821 = -_3805;
    float _3823 = _3821 + _3807;
    float _3825 = -_3809;
    float _3827 = _3825 + _3811;
    bool _3829 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3831 = fma(_3815, _3819, _3801);
    float _3833 = fma(_3815, _3823, _3805);
    float _3835 = fma(_3815, _3827, _3809);
    float _3837 = _3595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3839 = _3831 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3841 = fma(_3833, 0.298911988735198974609375, _3839);
    out.m_80.w = _3837;
    float _3843 = fma(_3835, 0.114477999508380889892578125, _3841);
    float _3845 = -_3843;
    float _3847 = _3833 + _3845;
    float _3849 = -_3843;
    float _3851 = _3831 + _3849;
    float _3853 = -_3843;
    float _3855 = _3835 + _3853;
    out.m_86.x = 0.0;
    float _3857 = fma(_3847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3859 = fma(_3851, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3861 = fma(_3855, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    out.m_88.x = _3857;
    out.m_88.y = _3859;
    out.m_88.z = _3861;
    if (!_3829)
    {
        return out;
    }
    float _3863 = -_2810;
    float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3867 = -_2812;
    float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3871 = -_2814;
    float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3875 = _3865 * _3865;
    float _3877 = fma(_3869, _3869, _3875);
    float _3879 = fma(_3873, _3873, _3877);
    float _3881 = sqrt(_3879);
    float _3883 = rsqrt(_3879);
    float _3885 = -_3881;
    float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3889 = _3887 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = _3869 * _3883;
    float _3895 = _3865 * _3883;
    float _3897 = abs(_3891);
    float _3899 = log2(_3897);
    float _3901 = _3873 * _3883;
    float _3903 = _3893 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3905 = _3397 * _3895;
    float _3907 = -_3895;
    float _3909 = -_3903;
    float _3911 = fma(_3907, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3909);
    float _3913 = fma(_3375, _3893, _3905);
    float _3915 = -_3901;
    float _3917 = fma(_3915, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3911);
    float _3919 = fma(_3381, _3901, _3913);
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3925 = _3917 + _3923;
    float _3927 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3929 = _3925 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = exp2(_3927);
    float _3935 = _3933 * _3931;
    float _3937 = _3921 * _3935;
    float _3939 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3941 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3943 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3939;
    out.m_86.y = _3941;
    out.m_86.z = _3943;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3715 = false;
    bool _3497 = false;
    bool _639 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4000 = as_type<float>(_123);
        out.gl_Position.z = _4000;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_107);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4073 = as_type<float>(_163);
        out.gl_Position.z = _4073;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _165 * _165;
    float _193 = _169 * _169;
    float _195 = _167 * _167;
    float _197 = fma(_173, _173, _191);
    float _199 = fma(_177, _177, _193);
    float _201 = fma(_175, _175, _195);
    float _203 = fma(_179, _179, _197);
    float _205 = fma(_183, _183, _199);
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    float _217 = as_type<float>(int(gl_VertexIndex));
    bool _219 = _211 > 0.0;
    float _221 = _203;
    float _223 = _205;
    float _225 = _211;
    float _227 = _171;
    int _229 = as_type<int>(_173);
    if (_215)
    {
        float _231 = rsqrt(_203);
        _221 = _231;
    }
    float _233 = _221;
    float _235 = 0.0;
    if (!_215)
    {
        _235 = 0.0;
    }
    float _237 = _235;
    bool _239 = _213 > 0.0;
    float _241 = 0.0;
    float _243 = _237;
    if (!_215)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (_219)
    {
        float _251 = rsqrt(_205);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_219)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_219)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    int _265 = as_type<int>(_217) & 1;
    bool _267 = _265 != 0;
    int _269 = as_type<int>(_217) & 2;
    bool _271 = _269 != 0;
    bool _273 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _277 = _273 || _275;
    bool _279 = isnan(1.0);
    bool _281 = _277 || _279;
    float _283 = 0.0;
    float _285 = _217;
    float _287 = _263;
    if (_239)
    {
        float _289 = rsqrt(_207);
        _283 = _289;
    }
    float _291 = _283;
    if (!_215)
    {
        _285 = 0.0;
    }
    float _293 = _285;
    float _295 = _293;
    if (_215)
    {
        float _297 = _233 * _173;
        _243 = _297;
    }
    float _299 = _243;
    if (!_219)
    {
        _223 = 0.0;
    }
    float _301 = _223;
    float _303 = _301;
    if (_215)
    {
        float _305 = _233 * _165;
        _249 = _305;
    }
    float _307 = _249;
    float _309 = 0.0;
    if (!_239)
    {
        _309 = 0.0;
    }
    float _311 = _309;
    float _313 = _311;
    if (_215)
    {
        float _315 = _233 * _179;
        _295 = _315;
    }
    float _317 = _295;
    float _319 = 0.0;
    if (!_239)
    {
        _319 = 0.0;
    }
    float _321 = _319;
    float _323 = _321;
    if (_219)
    {
        float _325 = _253 * _177;
        _261 = _325;
    }
    float _327 = _261;
    if (_219)
    {
        float _329 = _253 * _169;
        _287 = _329;
    }
    float _331 = _287;
    if (!_239)
    {
        _225 = 0.0;
    }
    float _333 = _225;
    float _335 = 0.0;
    float _337 = _333;
    if (!_281)
    {
        float _339 = _171 * _171;
        float _341 = _339 * 0.5;
        _335 = _341;
    }
    float _343 = _335;
    float _345 = _343;
    if (_219)
    {
        float _347 = _253 * _183;
        _303 = _347;
    }
    float _349 = _303;
    bool _351 = !_267;
    float _353 = _351 ? (-0.5) : 0.5;
    if (_239)
    {
        float _355 = _291 * _175;
        _313 = _355;
    }
    float _357 = _313;
    if (_239)
    {
        float _359 = _291 * _167;
        _323 = _359;
    }
    float _361 = _323;
    if (_239)
    {
        float _363 = _291 * _181;
        _337 = _363;
    }
    float _365 = _337;
    bool _367 = !_271;
    float _369 = _367 ? (-0.5) : 0.5;
    float _371 = _365;
    if (!_281)
    {
        float _373 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _345 = _373;
    }
    float _375 = _345;
    bool _377 = !_281;
    float _379 = _375;
    if (!_377)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = _171 * _383;
        float _393 = 1.0 / _387;
        float _395 = _389 * 0.693147182464599609375;
        float _397 = exp2(_391);
        float _399 = 1.0 / _395;
        float _401 = _397 + (-1.0);
        float _403 = -_401;
        float _405 = fma(_403, _399, _171);
        float _407 = _405 * _393;
        float _409 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _379 = _409;
    }
    float _411 = _379;
    float _413 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _415 = !_281;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _171 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _227 = _435;
    }
    float _437 = _227;
    float _439 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _413 * _307;
    float _443 = _413 * _361;
    float _445 = _413 * _331;
    float _447 = 0.0;
    if (!_281)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _447 = _451;
    }
    float _453 = _447;
    float _455 = fma(_439, _299, _441);
    float _457 = fma(_439, _357, _443);
    float _459 = fma(_439, _327, _445);
    float _461 = _453;
    if (!_281)
    {
        float _463 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _463;
    }
    float _465 = _461;
    bool _467 = !_281;
    float _469 = _465;
    if (!_467)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = _143 * _473;
        float _479 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _481 = _479 + 1.0;
        float _483 = 1.0 / _481;
        float _485 = _475 * 0.693147182464599609375;
        float _487 = exp2(_477);
        float _489 = 1.0 / _485;
        float _491 = _487 + (-1.0);
        float _493 = -_491;
        float _495 = fma(_493, _489, _143);
        float _497 = _495 * _483;
        float _499 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _469 = _499;
    }
    float _501 = _469;
    float _503 = in.m_64.w;
    float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _507 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _509 = in.m_44.x;
    float _511 = in.m_44.y;
    float _513 = in.m_44.z;
    float _515 = _505 * _361;
    float _517 = _505 * _307;
    float _519 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _521 = _505 * _331;
    float _523 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = fma(_507, _317, _455);
    float _527 = fma(_519, _357, _515);
    float _529 = fma(_507, _365, _457);
    float _531 = fma(_507, _349, _459);
    float _533 = fma(_519, _299, _517);
    float _535 = fma(_519, _327, _521);
    float _537 = fma(_523, _365, _527);
    float _539 = fma(_437, _185, _525);
    float _541 = fma(_437, _187, _529);
    float _543 = fma(_437, _189, _531);
    float _545 = fma(_523, _317, _533);
    float _547 = fma(_523, _349, _535);
    if (!_281)
    {
        _371 = _143;
    }
    float _549 = _371;
    bool _551 = !_281;
    float _553 = _549;
    if (!_551)
    {
        float _555 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _557 = log2(_555);
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _561 = _559 + 1.0;
        float _563 = 1.0 / _561;
        float _565 = _143 * _557;
        float _567 = exp2(_565);
        float _569 = -_567;
        float _571 = _569 + 1.0;
        float _573 = _571 * _563;
        _553 = _573;
    }
    float _575 = _553;
    float _577 = fma(_575, _187, _537);
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _581 = fma(_575, _185, _545);
    float _583 = fma(_575, _189, _547);
    float _585 = -_577;
    float _587 = _541 + _585;
    float _589 = fma(_539, _503, _509);
    float _591 = -_581;
    float _593 = _539 + _591;
    float _595 = fma(_541, _503, _511);
    float _597 = _587 * _175;
    float _599 = _587 * _167;
    float _601 = _587 * _181;
    float _603 = -_583;
    float _605 = _543 + _603;
    float _607 = fma(_593, _173, _597);
    float _609 = fma(_593, _165, _599);
    float _611 = fma(_593, _179, _601);
    float _613 = fma(_543, _503, _513);
    float _615 = fma(_605, _177, _607);
    float _617 = fma(_605, _169, _609);
    float _619 = fma(_605, _183, _611);
    bool _621 = !_579;
    float _637;
    if (!_621)
    {
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _625 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = true;
    }
    else
    {
        float _641 = float(_107);
        float _643 = 1.0 / _641;
        float _645 = _143 * _643;
        _637 = _645;
    }
    _639 = false;
    float _647 = _637;
    float _649 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _651 = int(_649);
    float _653 = float(_107);
    float _655 = _595 * _167;
    float _657 = fma(_589, _165, _655);
    float _659 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _661 = int(_659);
    float _663 = fma(_613, _169, _657);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _667 = float(_651);
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _671 = int(_669);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _675 = float(_661);
    float _677 = 1.0 / _667;
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _681 = int(_679);
    float _683 = float(uint(_671));
    int _685 = ~_671;
    int _687 = _685 + 1;
    bool _689 = _671 == 0;
    float _691 = 1.0 / _675;
    float _693 = _677 * _143;
    float _695 = 1.0 / _683;
    float _697 = float(uint(_681));
    float _699 = in.m_51.y;
    int _701 = ~_681;
    int _703 = _701 + 1;
    float _705 = trunc(_693);
    int _707 = int(_705);
    float _709 = _691 * _143;
    float _711 = 1.0 / _697;
    int _713 = as_type<int>(_695) + (-2);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _717 = _715 != 0;
    float _719 = trunc(_709);
    int _721 = int(_719);
    float _723 = float(uint(_707));
    float _725 = _699 * 2.0;
    float _727 = as_type<float>(_713) * _723;
    int _729 = as_type<int>(_711) + (-2);
    float _731 = 1.0 / _653;
    float _733 = _711;
    if (_717)
    {
        _733 = 1.0;
    }
    float _735 = _733;
    float _737 = _735;
    if (!_717)
    {
        _737 = 7.345489978790283203125;
    }
    float _739 = _737;
    float _741 = float(uint(_721));
    float _743 = trunc(_727);
    float _745 = precise::max(_743, 0.0);
    uint _748 = uint(_745);
    float _750 = as_type<float>(_729) * _741;
    int _752 = ~_671;
    int _754 = _752 + 1;
    float _756 = trunc(_750);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = _731 * _143;
    float _764 = float(_681);
    int _766 = _754 * int(_748);
    int _768 = _766 + _707;
    float _770 = _739 * _129;
    float _772 = float(uint(_768));
    int _774 = _703 * int(_760);
    int _776 = _774 + _721;
    float _778 = as_type<float>(_713) * _772;
    float _780 = floor(_770);
    float _782 = _772;
    float _784 = as_type<float>(_776);
    if (_717)
    {
        _782 = _129;
    }
    float _786 = _782;
    float _788 = float(uint(_776));
    float _790 = _786;
    if (_717)
    {
        _784 = 1.0;
    }
    float _792 = _784;
    float _794 = _792;
    if (!_717)
    {
        _794 = 1.2345600128173828125;
    }
    float _796 = _794;
    float _798 = trunc(_778);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    float _804 = as_type<float>(_729) * _788;
    if (!_717)
    {
        _790 = _699;
    }
    float _806 = _790;
    float _808 = _796 * _806;
    float _810 = trunc(_804);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    float _816 = float(_671);
    float _818 = -_780;
    float _820 = _770 + _818;
    float _822 = float(_707);
    float _824 = _820 * _816;
    int _826 = int(_748) + int(_802);
    float _828 = floor(_808);
    bool _830 = _822 >= _816;
    bool _832 = isnan(_822);
    bool _834 = _830 || _832;
    bool _836 = isnan(_816);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    int _842 = _687 * _826;
    int _844 = _842 + _707;
    int _846 = int(_760) + int(_814);
    float _848 = trunc(_824);
    int _850 = int(_848);
    int _852 = ~_681;
    int _854 = _852 + 1;
    bool _856 = uint(_844) >= uint(_671);
    int _858 = _854 * _846;
    int _860 = _858 + _721;
    bool _862 = !_856;
    int _864 = _862 ? 0 : (-1);
    float _866 = trunc(_840);
    int _868 = int(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _872 = _870 != 0;
    float _874 = -_828;
    float _876 = _808 + _874;
    int _878 = ~_826;
    int _880 = _878 + _864;
    int _882 = _880 + 1;
    bool _884 = !_872;
    int _886 = _884 ? 0 : 1;
    bool _888 = uint(_860) >= uint(_681);
    int _890 = _671 * _882;
    int _892 = _890 + _707;
    int _894 = abs(_886);
    bool _896 = !_888;
    int _898 = _896 ? 0 : (-1);
    int _900 = _850 * _894;
    int _902 = _900 + _707;
    bool _904 = !_689;
    int _906 = _904 ? _892 : (-1);
    int _908 = ~_868;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _924 = _922 != 0;
    int _926 = ~_846;
    int _928 = _926 + _898;
    int _930 = _928 + 1;
    float _932 = _816 * _762;
    float _934 = float(_721);
    int _936 = _906 * _912;
    bool _938 = !_920;
    int _940 = _938 ? 0 : 1;
    int _942 = _681 * _930;
    int _944 = _942 + _721;
    bool _946 = _934 >= _764;
    bool _948 = isnan(_934);
    bool _950 = _946 || _948;
    bool _952 = isnan(_764);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = trunc(_932);
    int _960 = int(_958);
    int _962 = _671 + (-1);
    bool _964 = !_916;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_940);
    int _970 = _868 * _962;
    int _972 = _970 + _936;
    int _974 = abs(_966);
    float _976 = trunc(_956);
    int _978 = int(_976);
    float _980 = _876 * _764;
    bool _982 = !_924;
    int _984 = _982 ? 0 : 1;
    float _986 = _764 * _762;
    int _988 = _972 * _968;
    int _990 = abs(_984);
    float _992 = trunc(_980);
    int _994 = int(_992);
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _998 = _996 != 0;
    int _1000 = _960 * _974;
    int _1002 = _1000 + _988;
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1006 = _1004 != 0;
    float _1008 = in.m_55.w;
    bool _1010 = !_998;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = trunc(_986);
    int _1016 = int(_1014);
    bool _1018 = !_1006;
    int _1020 = _1018 ? 0 : 1;
    int _1022 = _902 * _990;
    int _1024 = _1022 + _1002;
    bool _1026 = _681 == 0;
    float _1028 = in.m_59.w;
    int _1030 = abs(_1012);
    int _1032 = abs(_1020);
    int _1034 = ~_978;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    int _1040 = _994 * _1030;
    int _1042 = _1040 + _721;
    bool _1044 = !_1026;
    int _1046 = _1044 ? _944 : (-1);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1062 = _1060 != 0;
    int _1064 = _681 + (-1);
    int _1066 = _1046 * _1038;
    bool _1068 = _671 == 0;
    int _1070 = _850 * _1032;
    int _1072 = _1070 + _1024;
    bool _1074 = !_1054;
    int _1076 = _1074 ? 0 : 1;
    int _1078 = _978 * _1064;
    int _1080 = _1078 + _1066;
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1076);
    bool _1088 = !_1058;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1084);
    int _1094 = _1080 * _1086;
    bool _1096 = !_1062;
    int _1098 = _1096 ? 0 : 1;
    int _1100 = abs(_1090);
    float _1102 = float(uint(_1072));
    int _1104 = abs(_1098);
    float _1106 = as_type<float>(_713) * _1102;
    int _1108 = _1016 * _1092;
    int _1110 = _1108 + _1094;
    float _1112 = trunc(_1106);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    int _1118 = ~_671;
    int _1120 = _1118 + 1;
    int _1122 = _1042 * _1100;
    int _1124 = _1122 + _1110;
    int _1126 = ~_671;
    int _1128 = _1126 + 1;
    int _1130 = _994 * _1104;
    int _1132 = _1130 + _1124;
    int _1134 = ~_681;
    int _1136 = _1134 + 1;
    float _1138 = float(uint(_1132));
    float _1140 = as_type<float>(_729) * _1138;
    int _1142 = _1128 * int(_1116);
    int _1144 = _1142 + _1072;
    float _1146 = trunc(_1140);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = float(uint(_1144));
    float _1154 = as_type<float>(_713) * _1152;
    float _1156 = trunc(_1154);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    int _1162 = _1136 * int(_1150);
    int _1164 = _1162 + _1132;
    float _1166 = float(uint(_1164));
    float _1168 = as_type<float>(_729) * _1166;
    int _1170 = int(_1116) + int(_1160);
    float _1172 = trunc(_1168);
    float _1174 = precise::max(_1172, 0.0);
    uint _1176 = uint(_1174);
    int _1178 = _1120 * _1170;
    int _1180 = _1178 + _1072;
    float _1182 = in.m_57.w;
    bool _1184 = uint(_1180) >= uint(_671);
    int _1186 = ~_681;
    int _1188 = _1186 + 1;
    bool _1190 = !_1184;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = ~_1170;
    int _1196 = _1194 + _1192;
    int _1198 = _1196 + 1;
    int _1200 = int(_1150) + int(_1176);
    int _1202 = _671 * _1198;
    int _1204 = _1202 + _1072;
    int _1206 = _1188 * _1200;
    int _1208 = _1206 + _1132;
    bool _1210 = !_1068;
    int _1212 = _1210 ? _1204 : (-1);
    bool _1214 = uint(_1208) >= uint(_681);
    int _1216 = _1212 & 3;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1214;
    int _1222 = _1220 ? 0 : (-1);
    bool _1224 = uint(_1216) > 1u;
    int _1226 = ~_1200;
    int _1228 = _1226 + _1222;
    int _1230 = _1228 + 1;
    float _1232 = _595 * _175;
    int _1234 = _1212 & 3;
    bool _1236 = _1234 != 0;
    bool _1238 = uint(_1216) >= 2u;
    int _1240 = _681 * _1230;
    int _1242 = _1240 + _1132;
    int _1244 = _1236 ? 0 : 1;
    bool _1246 = _1216 != 3;
    bool _1248 = !_1026;
    int _1250 = _1248 ? _1242 : (-1);
    int _1252 = ~_1244;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = _1238 ? 0 : 1;
    int _1260 = _1256;
    if (!_1224)
    {
        int _1262 = ~_1244;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _595 * _181;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1272 = _1270 != 0;
    float _1274 = fma(_589, _173, _1232);
    int _1276 = _1250 & 3;
    bool _1278 = _1276 != 0;
    float _1280 = in.m_51.w;
    bool _1282 = !_1272;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = fma(_589, _179, _1268);
    bool _1288 = uint(_1276) > 1u;
    float _1290 = _129 * 2.0;
    int _1292 = ~_1258;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_613, _177, _1274);
    int _1300 = _1296;
    if (_1246)
    {
        int _1302 = ~_1258;
        int _1304 = _1302 + 1;
        _1300 = _1304;
    }
    int _1306 = _1300;
    float _1308 = fma(_613, _183, _1286);
    int _1310 = _1250 & 3;
    bool _1312 = _1310 != 0;
    float _1314 = floor(_1290);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1318 = _1316 != 0;
    float _1320 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1322 = _1312 ? 0 : 1;
    float _1324 = in.m_51.z;
    float _1326 = float(uint(_902));
    bool _1328 = _1276 != 3;
    float _1330 = floor(_725);
    int _1332 = ~_1322;
    int _1334 = _1332 + 1;
    int _1336 = _1334 + 1;
    float _1338 = as_type<float>(_713) * _1326;
    bool _1340 = uint(_1276) >= 2u;
    int _1342 = _1336;
    if (!_1288)
    {
        int _1344 = ~_1322;
        int _1346 = _1344 + 1;
        _1342 = _1346;
    }
    int _1348 = _1342;
    bool _1350 = _129 > 0.5;
    float _1352 = trunc(_1338);
    float _1354 = precise::max(_1352, 0.0);
    uint _1356 = uint(_1354);
    float _1358 = float(uint(_1042));
    int _1360 = _1340 ? 0 : 1;
    float _1362 = -_353;
    int _1364 = _1350 ? as_type<int>(_1362) : as_type<int>(_353);
    float _1366 = as_type<float>(_729) * _1358;
    bool _1368 = _699 > 0.5;
    int _1370 = ~_1360;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = trunc(_1366);
    float _1378 = precise::max(_1376, 0.0);
    uint _1380 = uint(_1378);
    int _1382 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1384 = _1382 != 0;
    int _1386 = _1374;
    if (_1328)
    {
        int _1388 = ~_1360;
        int _1390 = _1388 + 1;
        _1386 = _1390;
    }
    int _1392 = _1386;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1394;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1400 = _1398 != 0;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1406 = -_369;
    int _1408 = _1368 ? as_type<int>(_1406) : as_type<int>(_369);
    bool _1410 = !_1384;
    float _1412 = _1410 ? _353 : as_type<float>(_1364);
    float _1414 = 1.0 / _1396;
    bool _1416 = !_1400;
    float _1418 = _1416 ? _369 : as_type<float>(_1408);
    int _1420 = ~_671;
    int _1422 = _1420 + 1;
    float _1424 = _1412 + 0.5;
    bool _1426 = _1324 > 0.5;
    int _1428 = ~_681;
    int _1430 = _1428 + 1;
    int _1432 = _1422 * int(_1356);
    int _1434 = _1432 + _902;
    float _1436 = 1.0 / _1404;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1440 = _1438 != 0;
    float _1442 = -_353;
    int _1444 = _1426 ? as_type<int>(_1442) : as_type<int>(_353);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1450 = _1448 != 0;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1454 = _1452 != 0;
    float _1456 = -_1446;
    float _1458 = fma(_1320, 2.0, _1456);
    float _1460 = float(uint(_1434));
    int _1462 = _1430 * int(_1380);
    int _1464 = _1462 + _1042;
    bool _1466 = !_1440;
    float _1468 = _1466 ? _353 : as_type<float>(_1444);
    bool _1470 = _1280 > 0.5;
    float _1472 = as_type<float>(_713) * _1460;
    float _1474 = float(uint(_1464));
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1478 = _647 + _1476;
    float _1480 = -_369;
    int _1482 = _1470 ? as_type<int>(_1480) : as_type<int>(_369);
    float _1484 = as_type<float>(_1430);
    if (_1318)
    {
        _229 = 0;
    }
    int _1486 = _229;
    float _1488 = as_type<float>(_729) * _1474;
    bool _1490 = !_1454;
    float _1492 = _1490 ? _369 : as_type<float>(_1482);
    float _1494 = trunc(_1472);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    bool _1500 = _1314 >= 0.0;
    bool _1502 = isnan(_1314);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    float _1510 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1512 = _1486;
    float _1514 = _1510;
    if (!_1318)
    {
        _1512 = 1;
    }
    int _1516 = _1512;
    float _1518 = _1478 * _1414;
    bool _1520 = _1314 > 0.0;
    float _1522 = _1508 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1524 = trunc(_1488);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    bool _1530 = _1516 != 1;
    int _1532 = ~_671;
    int _1534 = _1532 + 1;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1538 = ~as_type<int>(_1522);
    int _1540 = _1538 + 1;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1544;
    int _1548 = _1542;
    float _1550 = _1522;
    float _1552 = _1414;
    if (!_1520)
    {
        int _1554 = ~as_type<int>(_1522);
        int _1556 = _1554 + 1;
        _1548 = _1556;
    }
    int _1558 = _1548;
    float _1560 = fma(_1510, -2.0, _1536);
    int _1562 = int(_1356) + int(_1498);
    if (!_1530)
    {
        _1484 = _699;
    }
    float _1564 = _1484;
    float _1566 = 1.0 / _1546;
    float _1568 = _1564;
    if (!_1530)
    {
        _1550 = _699;
    }
    float _1570 = _1550;
    float _1572 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1560);
    float _1574 = _1570;
    if (!_1530)
    {
        _1552 = _1324;
    }
    float _1576 = _1552;
    float _1578 = _1576;
    if (!_1530)
    {
        _1514 = _1324;
    }
    float _1580 = _1514;
    float _1582 = _1580;
    if (_1530)
    {
        _1568 = _129;
    }
    float _1584 = _1568;
    if (_1530)
    {
        _1574 = _129;
    }
    float _1586 = _1574;
    if (_1530)
    {
        _1578 = _699;
    }
    float _1588 = _1578;
    float _1590 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1530)
    {
        _1582 = _699;
    }
    float _1592 = _1582;
    bool _1594 = _1330 > 0.0;
    float _1596 = -_665;
    float _1598 = fma(_1590, 2.0, _1596);
    bool _1600 = _1330 >= 0.0;
    bool _1602 = isnan(_1330);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.0);
    bool _1608 = _1604 || _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1612 = _647 + _1610;
    float _1614 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1616 = int(_1380) + int(_1528);
    float _1618 = _1612 * _1436;
    int _1620 = ~_681;
    int _1622 = _1620 + 1;
    int _1624 = _1534 * _1562;
    int _1626 = _1624 + _902;
    int _1628 = _1608 ? 0 : 1;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1632 = _647 + _1630;
    bool _1634 = !_1218;
    int _1636 = _1634 ? 0 : 1;
    int _1638 = _1622 * _1616;
    int _1640 = _1638 + _1042;
    float _1642 = _1324 * 2.0;
    int _1644 = ~_1628;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = _1632 * _1566;
    bool _1652 = uint(_1626) >= uint(_671);
    float _1654 = _129 + _699;
    int _1656 = _1648;
    float _1658 = _1592;
    if (!_1594)
    {
        int _1660 = ~_1628;
        int _1662 = _1660 + 1;
        _1656 = _1662;
    }
    int _1664 = _1656;
    float _1666 = floor(_1642);
    bool _1668 = uint(_1640) >= uint(_681);
    float _1670 = _1654 + (-1.0);
    bool _1672 = !_1652;
    int _1674 = _1672 ? 0 : (-1);
    float _1676 = _129 + _1324;
    int _1678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1680 = _1678 != 0;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1684 = _1682 != 0;
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1688 = _1686 != 0;
    float _1690 = _1324 + _699;
    float _1692 = _1676 + (-1.0);
    float _1694 = _1690 + (-1.0);
    bool _1696 = !_1684;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1702 = _1468 + 0.5;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1706 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1708 = _1666 >= 0.0;
    bool _1710 = isnan(_1666);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan(0.0);
    bool _1716 = _1712 || _1714;
    float _1718 = _663 + _1008;
    float _1720 = -_143;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1458);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1724;
    int _1728 = _1716 ? 0 : 1;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1734 = _1666 > 0.0;
    float _1736 = _1298 + _1182;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1738;
    float _1742 = fma(_1726, _1518, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1744 = _1308 + _1028;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1750 = fma(_1740, _1518, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1752 = fma(_1732, _1618, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1754 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1722);
    int _1756 = _1212 >> 31;
    float _1758 = fma(_1748, _1618, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1760 = _1418 + (-0.5);
    int _1762 = _1756 & 3;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1766 = _1718 + _1764;
    int _1768 = _1250 >> 31;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1772 = _1212 + _1762;
    float _1774 = -_1760;
    float _1776 = -_1572;
    float _1778 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1776);
    int _1780 = _1768 & 3;
    float _1782 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1770);
    int _1784 = _1772 >> 2;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1736 + _1786;
    int _1790 = _1250 + _1780;
    float _1792 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1794 = _1784 << 4;
    int _1796 = _1794 + 368;
    float _1798 = -_143;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1598);
    int _1802 = ~_1728;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1792);
    uint _1810 = uint(int(uint(_1796) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    int _1826 = _1806;
    if (!_1734)
    {
        int _1828 = ~_1728;
        int _1830 = _1828 + 1;
        _1826 = _1830;
    }
    int _1832 = _1826;
    float _1834 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[83].w, _673);
    bool _1836 = !_1278;
    int _1838 = _1836 ? 0 : 1;
    float _1840 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1800);
    int _1842 = _1790 >> 2;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1744 + _1844;
    bool _1848 = _1216 != 3;
    float _1850 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1782);
    int _1852 = _1842 << 4;
    int _1854 = _1852 + 512;
    float _1856 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1808);
    bool _1858 = !_1848;
    int _1860 = _1858 ? 0 : (-1);
    float _1862 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1834);
    bool _1864 = _1276 != 3;
    uint _1866 = uint(int(uint(_1854) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    int _1882 = abs(_1698);
    bool _1884 = !_1864;
    int _1886 = _1884 ? 0 : (-1);
    bool _1888 = _1856 >= 0.0;
    int _1890 = abs(_1266);
    int _1892 = _1796 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = int(_1894) + 1;
    uint _1904 = uint(int(uint(_1902) >> uint(2)));
    int _1906 = _1902 & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    float _1910 = float(_1558);
    int _1912 = abs(_1636);
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1916 = abs(_1838);
    int _1918 = _1854 + 8;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = abs(_1348);
    if (_1888)
    {
        out.m_47.x = 0.0;
    }
    if (_1888)
    {
        _1658 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1938 = _1658;
    int _1940 = ~_1890;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    float _1946 = float(_1882);
    float _1948 = fma(_1614, -2.0, _1914);
    int _1950 = as_type<int>(_1938);
    if (_1888)
    {
        float _1952 = _1938 * 5.0;
        _1950 = as_type<int>(_1952);
    }
    int _1954 = _1950;
    int _1956 = abs(_1860);
    float _1958 = _1492 + (-0.5);
    float _1960 = _1946 * _1910;
    int _1962 = ~_1562;
    int _1964 = _1962 + _1674;
    int _1966 = _1964 + 1;
    int _1968 = ~_1936;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = _1944 * as_type<int>(_1824);
    int _1976 = _671 * _1966;
    int _1978 = _1976 + _902;
    if (_1888)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6681 = as_type<float>(_1954);
        out.gl_Position.z = _6681;
    }
    int _1980 = abs(_1392);
    float _1982 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1948);
    bool _1984 = !_1668;
    int _1986 = _1984 ? 0 : (-1);
    bool _1988 = _671 == 0;
    float _1990 = -_1958;
    float _1992 = -_1982;
    float _1994 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1992);
    int _1996 = ~_1616;
    int _1998 = _1996 + _1986;
    int _2000 = _1998 + 1;
    bool _2002 = !_1988;
    int _2004 = _2002 ? _1978 : (-1);
    int _2006 = _1972 * as_type<int>(_1880);
    int _2008 = abs(_1306);
    int _2010 = _681 * _2000;
    int _2012 = _2010 + _1042;
    int _2014 = ~_1912;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = _2018 * as_type<int>(_1816);
    int _2022 = _2020 + _1974;
    int _2024 = ~_2008;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_1916;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    int _2036 = _2028 * as_type<int>(_1900);
    int _2038 = _2036 + _2022;
    int _2040 = ~_1956;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _2034 * as_type<int>(_1872);
    int _2048 = _2046 + _2006;
    int _2050 = ~_1980;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = abs(_1284);
    int _2058 = _2044 * as_type<int>(_1908);
    int _2060 = _2058 + _2038;
    bool _2062 = !_1450;
    int _2064 = _2062 ? 0 : 1;
    int _2066 = _2054 * as_type<int>(_1926);
    int _2068 = _2066 + _2048;
    int _2070 = abs(_1886);
    float _2072 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2074 = log2(_2072);
    int _2076 = abs(_2064);
    int _2078 = ~_2056;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = ~_2070;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    int _2090 = _2060 * _2082;
    bool _2092 = _681 == 0;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2096 = _2088 * as_type<int>(_1934);
    int _2098 = _2096 + _2068;
    int _2100 = ~_2076;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    float _2106 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2094);
    int _2108 = _2004 * _2056;
    int _2110 = _2108 + _2090;
    bool _2112 = !_2092;
    int _2114 = _2112 ? _2012 : (-1);
    float _2116 = _1766 * _1766;
    int _2118 = _2098 * _2104;
    float _2120 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2106);
    float _2122 = _2074 * _143;
    float _2124 = fma(_1788, _1788, _2116);
    int _2126 = _2114 * _2076;
    int _2128 = _2126 + _2118;
    float _2130 = -_2120;
    float _2132 = _2130 + 1.0;
    bool _2134 = !_1680;
    int _2136 = _2134 ? 0 : 1;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2140 = exp2(_2122);
    float _2142 = fma(_1846, _1846, _2124);
    float _2144 = float(_2110);
    float _2146 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2138);
    float _2148 = fma(_1418, _2132, _1778);
    float _2150 = -_1850;
    float _2152 = _2150 + 1.0;
    int _2154 = abs(_2136);
    float _2156 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2146);
    float _2158 = float(_2128);
    float _2160 = rsqrt(_2142);
    float _2162 = in.m_66.x;
    float _2164 = in.m_66.y;
    float _2166 = in.m_66.z;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2170 = 1.0 + _2168;
    float _2172 = -_2156;
    float _2174 = _2172 + 1.0;
    float _2176 = -_1862;
    float _2178 = _2176 + 1.0;
    float _2180 = -_2152;
    float _2182 = fma(_1468, _2180, _1840);
    out.m_68.x = _2144;
    out.m_68.y = _2158;
    float _2184 = -_2174;
    float _2186 = fma(_1412, _2184, _1754);
    float _2188 = 1.0 / _2170;
    float _2190 = fma(_1492, _2178, _1994);
    bool _2192 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2194 = isnan(0.0);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2200 = _2196 || _2198;
    float _2202 = -_2140;
    float _2204 = _2202 + 1.0;
    bool _2206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2208 = isnan(1.0);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2214 = _2210 || _2212;
    out.m_70.x = _2186;
    out.m_70.y = _2148;
    out.m_70.z = _2182;
    out.m_70.w = _2190;
    bool _2216 = !_1688;
    int _2218 = _2216 ? 0 : 1;
    float _2220 = _1788 * _2160;
    float _2222 = float(_2154);
    float _2224 = _1766 * _2160;
    float _2226 = float(_1832);
    if (_1888)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2228 = -_2224;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1718);
    float _2232 = _2200 ? _2204 : 0.0;
    float _2234 = _1846 * _2160;
    float _2236 = -_2220;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2242 = _2230 + _2240;
    float _2244 = _2222 * _2226;
    float _2246 = -_2234;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1744);
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2252 = _2238 + _2250;
    float _2254 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_2214)
    {
        float _2256 = _2232 * _2188;
        _147 = _2256;
    }
    float _2258 = _147;
    float _2260 = _2244 * (-2.0);
    float _2262 = _129 + (-0.5);
    bool _2264 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2266 = isnan(_647);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2278 = _2248 + _2276;
    float _2280 = fma(_2252, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2254);
    float _2282 = fma(_2260, _2162, _2162);
    float _2284 = fma(_1700, _2260, _1700);
    bool _2286 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2288 = isnan(_647);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2294 = _2290 || _2292;
    float _2296 = float(_2294);
    float _2298 = -_2274;
    float _2300 = _2298 + 1.0;
    float _2302 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2280);
    float _2304 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2282);
    float _2306 = -_2224;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    bool _2310 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2312 = isnan(_647);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2318 = _2314 || _2316;
    float _2320 = float(_2318);
    float _2322 = _2296 * _2300;
    float _2324 = -_2296;
    float _2326 = _2324 + 1.0;
    bool _2328 = _2302 >= 0.0;
    float _2330 = -_2220;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2334 = _2308 * _2308;
    float _2336 = _2320 * _2326;
    float _2338 = -_2320;
    float _2340 = _2338 + 1.0;
    float _2342 = -_2234;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _2346 = fma(_2332, _2332, _2334);
    float _2348 = fma(_2284, _2258, _2304);
    bool _2350 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2352 = isnan(_647);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    float _2362 = fma(_2344, _2344, _2346);
    float _2364 = _2348 * 0.15915493667125701904296875;
    int _2366 = abs(_2218);
    float _2368 = _2360 * _2340;
    float _2370 = _2304;
    if (_2328)
    {
        _2370 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2372 = _2370;
    float _2374 = _2364 * 6.283185482025146484375;
    float _2376 = sin(_2374);
    float _2378 = float(_1664);
    int _2380 = as_type<int>(_2372);
    if (_2328)
    {
        float _2382 = _2372 * 5.0;
        _2380 = as_type<int>(_2382);
    }
    int _2384 = _2380;
    float _2386 = float(_2366);
    float _2388 = _1742 * _2368;
    float _2390 = _1960 * (-2.0);
    float _2392 = sqrt(_2362);
    if (_2328)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7286 = as_type<float>(_2384);
        out.gl_Position.z = _7286;
    }
    float _2394 = _1750 * _2368;
    float _2396 = _2386 * _2378;
    float _2398 = fma(_1704, _2390, _1704);
    if (_2328)
    {
        out.m_47.x = 0.0;
    }
    if (_2328)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2400 = -_1718;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2404 = fma(_2390, _2164, _2164);
    float _2406 = -_1736;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2410 = -_1744;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2414 = _2402 * _2402;
    float _2416 = _699 + (-0.5);
    float _2418 = -_2360;
    float _2420 = _2418 + 1.0;
    float _2422 = _2396 * (-2.0);
    float _2424 = fma(_2408, _2408, _2414);
    float _2426 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2404);
    float _2428 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2394);
    float _2430 = fma(_2412, _2412, _2424);
    float _2432 = fma(_2398, _2258, _2426);
    float _2434 = _2364 * 6.283185482025146484375;
    float _2436 = cos(_2434);
    float _2438 = _1324 + (-0.5);
    float _2440 = _2432 * 0.15915493667125701904296875;
    float _2442 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2388);
    float _2444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2444;
    float _2448 = in.m_64.x;
    float _2450 = in.m_64.y;
    float _2452 = fma(_1758, _2336, _2428);
    float _2454 = fma(_1752, _2336, _2442);
    float _2456 = rsqrt(_2430);
    float _2458 = fma(_2422, _2166, _2166);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2460;
    float _2464 = fma(_1706, _2422, _1706);
    float _2466 = _2160 * _2392;
    float _2468 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2458);
    float _2470 = fma(_2462, _1650, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2472 = fma(_2446, _1650, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2474 = _2440 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    float _2478 = fma(_2464, _2258, _2468);
    float _2480 = fma(_2470, _2322, _2452);
    float _2482 = fma(_2472, _2322, _2454);
    float _2484 = _2478 * 0.15915493667125701904296875;
    float _2486 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2480);
    float _2488 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2482);
    float _2490 = _2408 * _2456;
    float _2492 = _2412 * _2456;
    float _2494 = _2402 * _2456;
    float _2496 = _2440 * 6.283185482025146484375;
    float _2498 = cos(_2496);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2502 = _2490 * _2500;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2506 = _2492 * _2504;
    float _2508 = _2486 * _2448;
    float _2510 = _2488 * _2450;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2514 = -_2502;
    float _2516 = fma(_2492, _2512, _2514);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2520 = _2494 * _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2524 = -_2506;
    float _2526 = fma(_2494, _2522, _2524);
    float _2528 = _2484 * 6.283185482025146484375;
    float _2530 = sin(_2528);
    float _2532 = _2516 * _2516;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2536 = -_2520;
    float _2538 = fma(_2490, _2534, _2536);
    float _2540 = _2510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2542 = _2376 * _2476;
    float _2544 = fma(_2526, _2526, _2532);
    float _2546 = _2508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _369);
    float _2550 = _2484 * 6.283185482025146484375;
    float _2552 = cos(_2550);
    float _2554 = fma(_2538, _2538, _2544);
    float _2556 = _2436 * _2498;
    float _2558 = _2466 * _2540;
    float _2560 = _2546 * _2466;
    float _2562 = _2436 * _2476;
    float _2564 = _2376 * _2498;
    float _2566 = _2548 * _2558;
    float _2568 = rsqrt(_2554);
    float _2570 = fma(_2530, _2556, _2542);
    float _2572 = fma(_2530, _2542, _2556);
    float _2574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2576 = -_2562;
    float _2578 = fma(_2530, _2564, _2576);
    float _2580 = -_2564;
    float _2582 = fma(_2530, _2562, _2580);
    float _2584 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2586 = _2584 * 0.5;
    float _2588 = _2560 * _2574;
    float _2590 = _2436 * _2552;
    float _2592 = _2498 * _2552;
    float _2594 = _2376 * _2552;
    float _2596 = _2476 * _2552;
    float _2598 = _2590 * _2566;
    float _2600 = -_2566;
    float _2602 = _2530 * _2600;
    float _2604 = _2594 * _2566;
    bool _2606 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2608 = isnan(0.5);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2614 = _2610 || _2612;
    float _2616 = _2526 * _2568;
    float _2618 = _2516 * _2568;
    float _2620 = fma(_2570, _2588, _2598);
    float _2622 = fma(_2592, _2588, _2602);
    float _2624 = _2494 * _2616;
    float _2626 = _2538 * _2568;
    float _2628 = fma(_2582, _2586, _2620);
    float _2630 = _2492 * _2618;
    float _2632 = -_2624;
    float _2634 = fma(_2490, _2618, _2632);
    float _2636 = fma(_2578, _2588, _2604);
    float _2638 = fma(_2596, _2586, _2622);
    float _2640 = -_2630;
    float _2642 = fma(_2494, _2626, _2640);
    float _2644 = _2634 * _2628;
    float _2646 = fma(_2572, _2586, _2636);
    float _2648 = _2490 * _2626;
    float _2650 = _2642 * _2628;
    float _2652 = fma(_2626, _2638, _2644);
    float _2654 = -_2648;
    float _2656 = fma(_2492, _2616, _2654);
    float _2658 = fma(_2616, _2638, _2650);
    float _2660 = fma(_2492, _2646, _2652);
    float _2662 = _2656 * _2628;
    float _2664 = fma(_2490, _2646, _2658);
    float _2666 = _1744 + _2660;
    float _2668 = _1736 + _2664;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2672 = _2666 + _2670;
    float _2674 = fma(_2618, _2638, _2662);
    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2678 = _2668 + _2676;
    float _2680 = _2672 * _2672;
    float _2682 = fma(_2494, _2646, _2674);
    float _2684 = fma(_2678, _2678, _2680);
    float _2686 = _1718 + _2682;
    float _2688 = sqrt(_2684);
    bool _2690 = _2688 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2692 = _2674;
    float _2694 = _2680;
    float _2696 = _2668;
    float _2698 = _2466;
    if (!_2690)
    {
        _2692 = _2668;
    }
    float _2700 = _2692;
    float _2702 = _2700;
    if (!_2690)
    {
        _2694 = _2666;
    }
    float _2704 = _2694;
    float _2706 = _2704;
    if (!_2690)
    {
        _2696 = _2686;
    }
    float _2708 = _2696;
    bool _2710 = !_2690;
    float _2712 = _2708;
    if (!_2710)
    {
        float _2714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2718 = _2688 + _2716;
        float _2720 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2722 = rsqrt(_2684);
        float _2724 = _2718 * _2714;
        float _2726 = _2724 * 0.15915493667125701904296875;
        float _2728 = _2726 * 6.283185482025146484375;
        float _2730 = sin(_2728);
        float _2732 = _2726 * 6.283185482025146484375;
        float _2734 = cos(_2732);
        float _2736 = fma(_2730, _2720, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2738 = _2722 * _2736;
        float _2740 = _2734 + (-1.0);
        float _2742 = fma(_2678, _2738, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2744 = fma(_2672, _2738, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2746 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2748 = fma(_2686, _2734, _2746);
        _2702 = _2742;
        _2712 = _2748;
        _2706 = _2744;
    }
    float _2750 = _2702;
    float _2752 = _2712;
    float _2754 = _2706;
    float _2756 = -_2220;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2750);
    float _2760 = -_2224;
    float _2762 = fma(_2760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2752);
    float _2764 = -_2234;
    float _2766 = fma(_2764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2754);
    float _2768 = _2762;
    float _2770 = _2758;
    float _2772 = _2766;
    if (!_2614)
    {
        float _2774 = _2242 * _2242;
        float _2776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2778 = fma(_2252, _2252, _2774);
        float _2780 = fma(_2278, _2278, _2778);
        float _2782 = 1.0 / _2466;
        float _2784 = sqrt(_2780);
        float _2786 = precise::min(_2784, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2788 = _2786 * _2776;
        float _2790 = -_1736;
        float _2792 = _2790 + _2750;
        float _2794 = -_1744;
        float _2796 = _2794 + _2754;
        float _2798 = _2788 * _2782;
        float _2800 = -_1718;
        float _2802 = _2800 + _2752;
        float _2804 = fma(_2792, _2798, _2238);
        float _2806 = fma(_2802, _2798, _2230);
        float _2808 = fma(_2796, _2798, _2248);
        _2768 = _2806;
        _2770 = _2804;
        _2772 = _2808;
        _2698 = _2782;
    }
    float _2810 = _2768;
    float _2812 = _2770;
    float _2814 = _2772;
    float _2816 = _2698;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2820 = _2810 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2824 = _2812 + _2822;
    float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2828 = _2814 + _2826;
    float _2830 = _2820 * _2820;
    float _2832 = fma(_2824, _2824, _2830);
    float _2834 = fma(_2828, _2828, _2832);
    float _2836 = rsqrt(_2834);
    float _2838 = sqrt(_2834);
    float _2840 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2842 = _2824 * _2840;
    float _2844 = _2828 * _2840;
    float _2846 = _2842 * _2842;
    float _2848 = _2844 * _2844;
    float _2850 = _2846 + _2848;
    float _2852 = sqrt(_2850);
    bool _2854 = _2852 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2858 = _2852 + _2856;
    float _2860 = _2828;
    float _2862 = _2850;
    float _2864 = _2858;
    float _2866 = _2816;
    float _2868 = _2840;
    if (_2854)
    {
        float _2870 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2860 = _2870;
    }
    float _2872 = _2860;
    if (_2854)
    {
        float _2874 = rsqrt(_2850);
        _2862 = _2874;
    }
    float _2876 = _2862;
    float _2878 = _2876;
    if (_2854)
    {
        float _2880 = _2858 * _2872;
        _2864 = _2880;
    }
    float _2882 = _2864;
    if (_2854)
    {
        float _2884 = _2882 * 0.15915493667125701904296875;
        _2866 = _2884;
    }
    float _2886 = _2866;
    float _2888 = _2872;
    float _2890 = _2886;
    if (_2854)
    {
        float _2892 = _2886 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        _2888 = _2894;
    }
    float _2896 = _2888;
    float _2898 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2900 = precise::max(0.0, _2898);
    float _2902 = _2830;
    float _2904 = _2900;
    if (_2854)
    {
        float _2906 = _2886 * 6.283185482025146484375;
        float _2908 = cos(_2906);
        _2902 = _2908;
    }
    float _2910 = _2902;
    float _2912 = -_2840;
    float _2914 = -_2900;
    float _2916 = fma(_2820, _2912, _2914);
    float _2918 = _2916;
    if (_2854)
    {
        float _2920 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2904 = _2920;
    }
    float _2922 = _2904;
    float _2924 = _2896;
    float _2926 = _2922;
    if (_2854)
    {
        float _2928 = fma(_2896, _2922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2924 = _2928;
    }
    float _2930 = _2924;
    float _2932 = _2930;
    float _2934 = _2910;
    if (_2854)
    {
        float _2936 = _2910 + (-1.0);
        _2926 = _2936;
    }
    float _2938 = _2926;
    float _2940 = _2938;
    if (_2854)
    {
        float _2942 = _2876 * _2930;
        _2868 = _2942;
    }
    float _2944 = _2868;
    if (!_2854)
    {
        _2932 = _2842;
    }
    float _2946 = _2932;
    float _2948 = _2946;
    if (_2854)
    {
        float _2950 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2890 = _2950;
    }
    float _2952 = _2890;
    if (_2854)
    {
        float _2954 = _2842 * _2944;
        _2948 = _2954;
    }
    float _2956 = _2948;
    if (!_2854)
    {
        _2940 = _2844;
    }
    float _2958 = _2940;
    float _2960 = _2958;
    if (_2854)
    {
        float _2962 = _2844 * _2944;
        _2960 = _2962;
    }
    float _2964 = _2960;
    if (!_2854)
    {
        _2878 = _2846;
    }
    float _2966 = _2878;
    float _2968 = _2966;
    if (_2854)
    {
        float _2970 = fma(_2916, _2910, _2952);
        _2918 = _2970;
    }
    float _2972 = _2918;
    if (_2854)
    {
        float _2974 = _2956 * _2956;
        _2968 = _2974;
    }
    float _2976 = _2968;
    if (!_2854)
    {
        _2934 = _2848;
    }
    float _2978 = _2934;
    float _2980 = _2978;
    if (_2854)
    {
        float _2982 = _2964 * _2964;
        _2980 = _2982;
    }
    float _2984 = _2980;
    float _2986 = fma(_2972, _2972, _2976);
    float _2988 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2990 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2992 = _2986 + _2984;
    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2996 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2994);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2988);
    float _3002 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3004 = rsqrt(_2992);
    float _3006 = -_2998;
    float _3008 = _3006 + 1.0;
    float _3010 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3000);
    float _3012 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3014 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3002);
    float _3016 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3020 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3012);
    float _3022 = abs(_3008);
    float _3024 = log2(_3022);
    float _3026 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3014);
    float _3028 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3016);
    float _3030 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3020);
    float _3032 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3034 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3036 = fma(_2814, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3028);
    float _3038 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3040 = _3004 * _2956;
    float _3042 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3044 = _3004 * _2972;
    float _3046 = _3004 * _2964;
    float _3048 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3050 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3042);
    float _3052 = _3036 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3054 = -_3032;
    float _3056 = fma(_3054, _2990, 1.0);
    float _3058 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3060 = -_3048;
    float _3062 = fma(_3044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3060);
    float _3064 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3050);
    float _3066 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3068 = -_3046;
    float _3070 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3062);
    float _3072 = exp2(_3058);
    float _3074 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3064);
    float _3076 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3078 = fma(_3070, -0.5, 0.5);
    float _3080 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3066);
    float _3082 = _3044 + 1.0;
    float _3084 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3076);
    float _3086 = fma(_3070, 0.5, 0.5);
    float _3088 = log2(_3056);
    float _3090 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3080);
    float _3092 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3084);
    float _3094 = fma(_3086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3096 = fma(_3086, _3094, -0.212114393711090087890625);
    float _3098 = 1.0 / _3074;
    float _3100 = -_3044;
    float _3102 = fma(_3072, _3082, _3100);
    float _3104 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3092);
    float _3106 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3090);
    float _3108 = fma(_3086, _3096, 1.570728778839111328125);
    float _3110 = fma(_3102, 0.5, 0.5);
    float _3112 = sqrt(_3078);
    float _3114 = _3088 * 0.693147182464599609375;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3118 = _3104 * _3098;
    float _3120 = _3106 * _3098;
    float _3122 = fma(_3118, 0.5, 0.5);
    float _3124 = fma(_3120, -0.5, 0.5);
    float _3126 = _3112 * 0.636619746685028076171875;
    float3 _8471 = float3(_3122, _3124, _3116);
    float _3128 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8471, float3(0.0), isnan(_8471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8471, float3(0.0), isnan(_8471)), level(0.0)).x;
    float _3130 = -_3108;
    float _3132 = fma(_3126, _3130, 1.0);
    float3 _8487 = float3(_3122, _3124, _3116);
    float4 _3135 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8487, float3(0.0), isnan(_8487)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8487, float3(0.0), isnan(_8487)), level(0.0)).xyzw;
    float _3137 = _3135.x;
    float _3139 = _3135.y;
    float _3141 = _3135.z;
    float _3143 = _3135.w;
    float2 _8504 = float2(_3132, _3110);
    float3 _3147 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8504, float2(0.0), isnan(_8504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8504, float2(0.0), isnan(_8504)), level(0.0)).xyz;
    float _3149 = _3147.x;
    float _3151 = _3147.y;
    float _3153 = _3147.z;
    float _3155 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3159 = _369 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3161 = _2590 * _2642;
    float _3163 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3165 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3167 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3169 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3157);
    float _3171 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3163);
    float _3173 = fma(_3159, _3159, 1.0);
    float _3175 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3165);
    float _3177 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3167);
    float _3179 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3169);
    float _3181 = _3171 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3183 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3175);
    float _3185 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3177);
    float _3187 = rsqrt(_3173);
    float _3189 = _3179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3191 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3193 = _2570 * _2642;
    float _3195 = _2570 * _2656;
    float _3197 = _2570 * _2634;
    float _3199 = _2590 * _2656;
    float _3201 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3191);
    float _3203 = _2590 * _2634;
    float _3205 = _2582 * _2642;
    float _3207 = _2582 * _2656;
    float _3209 = fma(_2592, _2618, _3195);
    float _3211 = _2582 * _2634;
    float _3213 = fma(_2592, _2616, _3193);
    float _3215 = fma(_2592, _2626, _3197);
    float _3217 = -_2530;
    float _3219 = fma(_3217, _2616, _3161);
    float _3221 = -_2530;
    float _3223 = fma(_3221, _2618, _3199);
    float _3225 = -_2530;
    float _3227 = fma(_3225, _2626, _3203);
    float _3229 = fma(_2596, _2616, _3205);
    float _3231 = fma(_2596, _2618, _3207);
    float _3233 = fma(_2596, _2626, _3211);
    float _3235 = fma(_2594, _2490, _3219);
    float _3237 = fma(_2594, _2494, _3223);
    float _3239 = fma(_2594, _2492, _3227);
    float _3241 = fma(_2572, _2490, _3229);
    float _3243 = fma(_2572, _2494, _3231);
    float _3245 = fma(_2572, _2492, _3233);
    float _3247 = fma(_2578, _2492, _3215);
    float _3249 = _3159 * _3187;
    float _3251 = fma(_2578, _2490, _3213);
    float _3253 = fma(_2578, _2494, _3209);
    float _3255 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3257 = -_3241;
    float _3259 = _3249 * _3257;
    float _3261 = -_3243;
    float _3263 = _3249 * _3261;
    float _3265 = -_3245;
    float _3267 = _3249 * _3265;
    float _3269 = _3159 * _3239;
    float _3271 = -_617;
    float _3273 = _3271 + _2810;
    out.m_72.x = _3251;
    out.m_72.y = _3253;
    out.m_72.z = _3247;
    float _3275 = _3159 * _3235;
    float _3277 = -_615;
    float _3279 = _3277 + _2812;
    float _3281 = _3159 * _3237;
    float _3283 = fma(_3187, _3237, _3263);
    float _3285 = fma(_3255, _3251, _3275);
    float _3287 = -_619;
    float _3289 = _3287 + _2814;
    float _3291 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3293 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3295 = _3181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3297 = fma(_3187, _3235, _3259);
    float _3299 = fma(_3255, _3253, _3281);
    float _3301 = fma(_3255, _3247, _3269);
    float _3303 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3305 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3307 = fma(_3187, _3239, _3267);
    float _3309 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3291);
    float _3311 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3303);
    float _3313 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3315 = _3183 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3317 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3293);
    float _3319 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3311);
    float _3321 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3313);
    float _3323 = fma(_3279, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3305);
    float _3325 = fma(_3189, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3295);
    float _3327 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    out.m_74.x = _3297;
    out.m_74.y = _3283;
    out.m_74.z = _3307;
    float _3329 = _3185 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3331 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3333 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3321);
    float _3335 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3323);
    float _3337 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3317);
    float _3339 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3331);
    float _3341 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3343 = _3074 * 0.5;
    float _3345 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3337);
    float _3347 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3339);
    float _3349 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3351 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3353 = _3327 + _3325;
    float _3355 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3347);
    float _3357 = _3104 + _3074;
    float _3359 = 1.0 / _3351;
    float _3361 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3353);
    float _3363 = _3024 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3365 = _3355 + _3074;
    float _3367 = _3357 * 0.5;
    out.gl_Position.x = _3104;
    out.gl_Position.y = _3106;
    out.gl_Position.z = _3355;
    out.gl_Position.w = _3074;
    float _3369 = _3365 * 0.5;
    float _3371 = exp2(_3363);
    float _3373 = fma(_3106, -0.5, _3343);
    float _3375 = _3241 + _3285;
    float _3377 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3379 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3381 = _3245 + _3301;
    out.m_76.x = _3367;
    out.m_76.y = _3373;
    out.m_76.z = _3369;
    out.m_76.w = _3074;
    float _3383 = _3377 + _3309;
    float _3385 = 1.0 / _3361;
    float _3387 = _3349 * _3359;
    out.m_78.x = _2812;
    out.m_78.y = _2810;
    out.m_78.z = _2814;
    float _3389 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3383);
    float _3391 = _3341 * _3359;
    out.m_80.y = 1.0;
    float _3393 = -_3371;
    float _3395 = _3393 + 1.0;
    float _3397 = _3243 + _3299;
    float _3399 = _3379 + _3201;
    float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _3375;
    out.m_82.y = _3397;
    out.m_82.z = _3381;
    float _3403 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3399);
    float _3405 = _3345 * _3385;
    float _3407 = -_3401;
    float _3409 = _3407 + 1.0;
    float _3411 = _3389 * _3385;
    bool _3413 = _3405 > 0.0;
    bool _3415 = _3405 < 1.0;
    bool _3417 = _3415 && _3413;
    bool _3419 = _3118 > (-1.0);
    bool _3421 = _3419 && _3417;
    bool _3423 = _3120 > (-1.0);
    bool _3425 = _3423 && _3421;
    bool _3427 = _3118 < 1.0;
    bool _3429 = _3427 && _3425;
    bool _3431 = _3120 < 1.0;
    bool _3433 = _3431 && _3429;
    float _3435 = _3401 * _3128;
    float _3437 = _3403 * _3385;
    float _3439 = _3143 * _3435;
    float _3441 = _3143 * _3409;
    float _3443 = _3153 * _3435;
    float _3445 = fma(_3149, _3439, _3137);
    float _3447 = fma(_3151, _3439, _3139);
    float _3449 = fma(_3143, _3443, _3141);
    out.m_84.x = _3445;
    out.m_84.y = _3447;
    out.m_84.z = _3449;
    out.m_84.w = _3441;
    bool _3451 = !_3433;
    float _3453 = _3104;
    float _3455 = _3445;
    float _3457 = _3106;
    float _3459 = _3411;
    float _3461 = _3379;
    float _3463 = _3074;
    float _3495;
    if (!_3451)
    {
        float _3465 = -_3437;
        float _3467 = _3120 + _3465;
        float _3469 = -_3411;
        float _3471 = _3118 + _3469;
        float _3473 = -_3391;
        float _3475 = _3118 + _3473;
        float _3477 = -_3387;
        float _3479 = _3120 + _3477;
        float _3481 = _3467 * _3467;
        float _3483 = fma(_3471, _3471, _3481);
        float _3485 = sqrt(_3483);
        bool _3487 = _3485 > 0.0;
        float _3489 = _3485;
        _3459 = _3483;
        if (!_3487)
        {
            _3489 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3491 = _3489;
        bool _3493 = !_3487;
        _3495 = _3491;
        _3497 = _3493;
        if (!_3497)
        {
            float _3499 = _3479 * _3479;
            float _3501 = fma(_3475, _3475, _3499);
            float _3503 = rsqrt(_3483);
            float _3505 = sqrt(_3501);
            float _3507 = _3471 * _3503;
            float _3509 = _3467 * _3503;
            bool _3511 = _3505 > 0.0;
            float _3513 = _3503;
            _3455 = _3505;
            if (!_3511)
            {
                _3513 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3515 = _3513;
            bool _3517 = !_3511;
            _3495 = _3515;
            _3497 = _3517;
            if (!_3497)
            {
                float _3519 = _2560 * _3329;
                float _3521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3523 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3327);
                float _3525 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3379);
                float _3527 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3523);
                float _3529 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3377);
                float _3531 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3525);
                float _3533 = rsqrt(_3501);
                float _3535 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3529);
                float _3537 = _3521 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3539 = 1.0 / _3527;
                float _3541 = _3479 * _3537;
                float _3543 = _3475 * _3537;
                float _3545 = _3541 * _3541;
                float _3547 = fma(_3543, _3543, _3545);
                float _3549 = _3479 * _3533;
                float _3551 = _3475 * _3533;
                float _3553 = _3509 * _3549;
                float _3555 = _3531 * _3539;
                float _3557 = _3535 * _3539;
                float _3559 = sqrt(_3547);
                float _3561 = fma(_3507, _3551, _3553);
                float _3563 = _3555 * _3555;
                float _3565 = fma(_3557, _3557, _3563);
                float _3567 = precise::min(0.0, _3561);
                float _3569 = sqrt(_3565);
                float _3571 = _3074 * _3567;
                float _3573 = fma(_3543, _3571, _3104);
                float _3575 = fma(_3541, _3571, _3106);
                out.gl_Position.x = _3573;
                out.gl_Position.y = _3575;
                float _3577 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3569);
                float _3579 = 1.0 / _3577;
                float _3581 = _3569 * _3579;
                out.m_80.y = _3581;
                _3453 = _3573;
                _3455 = _3581;
                _3457 = _3575;
                _3459 = _3541;
                _3461 = _3561;
                _3495 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3497 = true;
            }
        }
    }
    else
    {
        float _3583 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3583;
        _3455 = 0.0;
        _3461 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3495 = 0.0;
    }
    _3497 = false;
    float _3585 = _3453;
    float _3587 = _3455;
    float _3589 = _3457;
    float _3591 = _3459;
    float _3593 = _3461;
    float _3595 = _3495;
    bool _3597 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3599 = isnan(_2838);
    bool _3601 = _3597 || _3599;
    bool _3603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3605 = _3601 || _3603;
    float _3607 = _3587;
    float _3609 = _3591;
    float _3611 = _3589;
    float _3613 = _3585;
    float _3615 = _3593;
    if (!_3605)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3617 = _3607;
    float _3619 = _3617;
    float _3621 = _3617;
    if (!_3605)
    {
        _3463 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3623 = _3463;
    float _3625 = _3623;
    float _3627 = _3623;
    if (!_3605)
    {
        _3609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3629 = _3609;
    float _3631 = _3629;
    float _3633 = _3629;
    if (!_3605)
    {
        _3611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3635 = _3611;
    float _3637 = _3635;
    float _3639 = _3635;
    if (!_3605)
    {
        _3613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3641 = _3613;
    float _3643 = _3641;
    float _3645 = _3641;
    if (!_3605)
    {
        _3615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3647 = _3615;
    bool _3649 = !_3605;
    float _3651 = _3647;
    float _3653 = _3647;
    if (!_3649)
    {
        bool _3655 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3657 = isnan(_2838);
        bool _3659 = _3655 || _3657;
        bool _3661 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3663 = _3659 || _3661;
        if (!_3663)
        {
            float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3667 = _2838 + _3665;
            float _3669 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3671 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3669;
            float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3675 = _3673 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3677 = 1.0 / _3671;
            float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3695 = _3667 * _3677;
            float _3697 = precise::clamp(_3695, 0.0, 1.0);
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3703 = fma(_3697, _3675, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3705 = fma(_3697, _3701, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3707 = fma(_3697, _3681, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3709 = fma(_3697, _3685, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3711 = fma(_3697, _3689, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3713 = fma(_3697, _3693, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3627 = _3707;
            _3645 = _3711;
            _3621 = _3703;
            _3639 = _3709;
            _3633 = _3705;
            _3653 = _3713;
            _3715 = true;
        }
        else
        {
            bool _3717 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3719 = isnan(_2838);
            bool _3721 = _3717 || _3719;
            bool _3723 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3725 = _3721 || _3723;
            if (!_3725)
            {
                _3619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3727 = _3619;
            _3621 = _3727;
            if (!_3725)
            {
                _3625 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3729 = _3625;
            _3627 = _3729;
            if (!_3725)
            {
                _3631 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3731 = _3631;
            _3633 = _3731;
            if (!_3725)
            {
                _3637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3733 = _3637;
            _3639 = _3733;
            if (!_3725)
            {
                _3643 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3735 = _3643;
            _3645 = _3735;
            if (!_3725)
            {
                _3651 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3737 = _3651;
            bool _3739 = !_3725;
            _3653 = _3737;
            if (!_3739)
            {
                bool _3741 = _2838 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3743 = isnan(_2838);
                bool _3745 = _3741 || _3743;
                bool _3747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3749 = _3745 || _3747;
                if (!_3749)
                {
                    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3753 = _2838 + _3751;
                    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3757 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3755;
                    float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3763 = 1.0 / _3757;
                    float _3765 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3767 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3771 = _3769 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3781 = _3753 * _3763;
                    float _3783 = precise::clamp(_3781, 0.0, 1.0);
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3789 = fma(_3783, _3761, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3791 = fma(_3783, _3787, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3793 = fma(_3783, _3767, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3795 = fma(_3783, _3771, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3797 = fma(_3783, _3775, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3799 = fma(_3783, _3779, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3627 = _3793;
                    _3645 = _3797;
                    _3621 = _3789;
                    _3639 = _3795;
                    _3633 = _3791;
                    _3653 = _3799;
                    _3715 = true;
                }
                else
                {
                    _3627 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3645 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3633 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3653 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3715 = false;
    float _3801 = _3627;
    float _3803 = _3645;
    float _3805 = _3621;
    float _3807 = _3639;
    float _3809 = _3633;
    float _3811 = _3653;
    float _3813 = fma(_3397, -0.5, 0.5);
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = -_3801;
    float _3819 = _3817 + _3803;
    float _3821 = -_3805;
    float _3823 = _3821 + _3807;
    float _3825 = -_3809;
    float _3827 = _3825 + _3811;
    bool _3829 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3831 = fma(_3815, _3819, _3801);
    float _3833 = fma(_3815, _3823, _3805);
    float _3835 = fma(_3815, _3827, _3809);
    float _3837 = _3595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3839 = _3831 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3841 = fma(_3833, 0.298911988735198974609375, _3839);
    out.m_80.w = _3837;
    float _3843 = fma(_3835, 0.114477999508380889892578125, _3841);
    float _3845 = -_3843;
    float _3847 = _3833 + _3845;
    float _3849 = -_3843;
    float _3851 = _3831 + _3849;
    float _3853 = -_3843;
    float _3855 = _3835 + _3853;
    out.m_86.x = 0.0;
    float _3857 = fma(_3847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3859 = fma(_3851, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3861 = fma(_3855, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    out.m_88.x = _3857;
    out.m_88.y = _3859;
    out.m_88.z = _3861;
    if (!_3829)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3863 = -_2810;
    float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3867 = -_2812;
    float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3871 = -_2814;
    float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3875 = _3865 * _3865;
    float _3877 = fma(_3869, _3869, _3875);
    float _3879 = fma(_3873, _3873, _3877);
    float _3881 = sqrt(_3879);
    float _3883 = rsqrt(_3879);
    float _3885 = -_3881;
    float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3889 = _3887 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3891 = precise::clamp(_3889, 0.0, 1.0);
    float _3893 = _3869 * _3883;
    float _3895 = _3865 * _3883;
    float _3897 = abs(_3891);
    float _3899 = log2(_3897);
    float _3901 = _3873 * _3883;
    float _3903 = _3893 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3905 = _3397 * _3895;
    float _3907 = -_3895;
    float _3909 = -_3903;
    float _3911 = fma(_3907, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3909);
    float _3913 = fma(_3375, _3893, _3905);
    float _3915 = -_3901;
    float _3917 = fma(_3915, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3911);
    float _3919 = fma(_3381, _3901, _3913);
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3925 = _3917 + _3923;
    float _3927 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3929 = _3925 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = exp2(_3927);
    float _3935 = _3933 * _3931;
    float _3937 = _3921 * _3935;
    float _3939 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3941 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3943 = _3937 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3939;
    out.m_86.y = _3941;
    out.m_86.z = _3943;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

