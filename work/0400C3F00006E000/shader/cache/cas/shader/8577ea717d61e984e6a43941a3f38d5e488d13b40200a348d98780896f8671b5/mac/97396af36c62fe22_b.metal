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
    float4 m_68 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_76 [[user(locn11)]];
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3803 = false;
    bool _3585 = false;
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
        float _4108 = as_type<float>(_123);
        out.gl_Position.z = _4108;
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
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4182 = as_type<float>(_163);
        out.gl_Position.z = _4182;
    }
    if (_155)
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
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_49.x;
    float _189 = in.m_49.y;
    float _191 = in.m_49.z;
    float _193 = _165 * _165;
    float _195 = _167 * _167;
    float _197 = fma(_173, _173, _193);
    float _199 = fma(_175, _175, _195);
    float _201 = fma(_179, _179, _197);
    float _203 = _169 * _169;
    float _205 = fma(_181, _181, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_177, _177, _203);
    float _211 = fma(_183, _183, _209);
    float _213 = sqrt(_205);
    float _215 = sqrt(_211);
    bool _217 = _207 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = 0.0;
    float _223 = _171;
    float _225 = _165;
    if (_217)
    {
        float _227 = rsqrt(_201);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_217)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _215 > 0.0;
    float _237 = 0.0;
    float _239 = _215;
    float _241 = _233;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    int _245 = as_type<int>(_185) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_185) & 2;
    bool _251 = _249 != 0;
    float _253 = _207;
    float _255 = _185;
    float _257 = _243;
    if (_219)
    {
        float _259 = rsqrt(_205);
        _253 = _259;
    }
    float _261 = _253;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = 0.0;
    if (!_219)
    {
        _273 = 0.0;
    }
    float _275 = _273;
    float _277 = 0.0;
    float _279 = _275;
    if (!_219)
    {
        _277 = 0.0;
    }
    float _281 = _277;
    float _283 = _281;
    if (!_219)
    {
        _239 = 0.0;
    }
    float _285 = _239;
    float _287 = _211;
    float _289 = _285;
    if (_235)
    {
        float _291 = rsqrt(_211);
        _287 = _291;
    }
    float _293 = _287;
    if (!_217)
    {
        _255 = 0.0;
    }
    float _295 = _255;
    float _297 = _295;
    if (_217)
    {
        float _299 = _229 * _173;
        _241 = _299;
    }
    float _301 = _241;
    if (_217)
    {
        float _303 = _229 * _165;
        _257 = _303;
    }
    float _305 = _257;
    if (_217)
    {
        float _307 = _229 * _179;
        _297 = _307;
    }
    float _309 = _297;
    float _311 = 0.0;
    if (!_235)
    {
        _311 = 0.0;
    }
    float _313 = _311;
    float _315 = 0.0;
    float _317 = _313;
    if (!_271)
    {
        float _319 = _171 * _171;
        float _321 = _319 * 0.5;
        _315 = _321;
    }
    float _323 = _315;
    float _325 = 0.0;
    float _327 = _323;
    if (!_235)
    {
        _325 = 0.0;
    }
    float _329 = _325;
    float _331 = _329;
    if (_219)
    {
        float _333 = _261 * _175;
        _279 = _333;
    }
    float _335 = _279;
    if (_219)
    {
        float _337 = _261 * _167;
        _283 = _337;
    }
    float _339 = _283;
    if (_219)
    {
        float _341 = _261 * _181;
        _289 = _341;
    }
    float _343 = _289;
    float _345 = _343;
    if (!_271)
    {
        float _347 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _347;
    }
    float _349 = _327;
    float _351 = 0.0;
    float _353 = _349;
    if (!_235)
    {
        _351 = 0.0;
    }
    float _355 = _351;
    bool _357 = !_247;
    float _359 = _357 ? (-0.5) : 0.5;
    float _361 = _355;
    if (_235)
    {
        float _363 = _293 * _177;
        _317 = _363;
    }
    float _365 = _317;
    if (_235)
    {
        float _367 = _293 * _169;
        _331 = _367;
    }
    float _369 = _331;
    if (_235)
    {
        float _371 = _293 * _183;
        _361 = _371;
    }
    float _373 = _361;
    bool _375 = !_251;
    float _377 = _375 ? (-0.5) : 0.5;
    bool _379 = !_271;
    if (!_379)
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
        _353 = _409;
    }
    float _411 = _353;
    float _413 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _415 = !_271;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = 1.0 / _425;
        float _429 = _171 * _421;
        float _431 = exp2(_429);
        float _433 = -_431;
        float _435 = _433 + 1.0;
        float _437 = _435 * _427;
        _223 = _437;
    }
    float _439 = _223;
    float _441 = _413 * _305;
    float _443 = _413 * _339;
    float _445 = _413 * _369;
    float _447 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_271)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _417 = _451;
    }
    float _453 = _417;
    float _455 = fma(_447, _301, _441);
    float _457 = fma(_447, _335, _443);
    float _459 = fma(_447, _365, _445);
    float _461 = _453;
    if (!_271)
    {
        float _463 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _463;
    }
    float _465 = _461;
    bool _467 = !_271;
    float _469 = _465;
    if (!_467)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _477 = _475 + 1.0;
        float _479 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _481 = _143 * _473;
        float _483 = 1.0 / _477;
        float _485 = _479 * 0.693147182464599609375;
        float _487 = exp2(_481);
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
    float _515 = _505 * _305;
    float _517 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _505 * _339;
    float _521 = _505 * _369;
    float _523 = fma(_507, _309, _455);
    float _525 = fma(_517, _301, _515);
    float _527 = fma(_517, _335, _519);
    float _529 = fma(_507, _343, _457);
    float _531 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _533 = fma(_507, _373, _459);
    float _535 = fma(_517, _365, _521);
    float _537 = fma(_439, _187, _523);
    float _539 = fma(_439, _189, _529);
    float _541 = fma(_531, _343, _527);
    float _543 = fma(_439, _191, _533);
    float _545 = fma(_531, _309, _525);
    float _547 = fma(_531, _373, _535);
    if (!_271)
    {
        _345 = _143;
    }
    float _549 = _345;
    bool _551 = !_271;
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
    float _577 = fma(_575, _189, _541);
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _581 = fma(_575, _187, _545);
    float _583 = fma(_575, _191, _547);
    float _585 = -_577;
    float _587 = _539 + _585;
    float _589 = fma(_539, _503, _511);
    float _591 = fma(_537, _503, _509);
    float _593 = -_581;
    float _595 = _537 + _593;
    float _597 = _587 * _175;
    float _599 = _587 * _167;
    float _601 = _587 * _181;
    float _603 = -_583;
    float _605 = _543 + _603;
    float _607 = fma(_595, _173, _597);
    float _609 = fma(_595, _165, _599);
    float _611 = fma(_595, _179, _601);
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
    float _655 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _657 = int(_655);
    bool _659 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _661 = isnan(_647);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _673 = isnan(_647);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = float(_651);
    float _689 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _691 = int(_689);
    float _693 = _681 * _685;
    float _695 = -_681;
    float _697 = _695 + 1.0;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = float(uint(_657));
    float _703 = 1.0 / _687;
    int _705 = ~_657;
    int _707 = _705 + 1;
    float _709 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    int _711 = ~_657;
    int _713 = _711 + 1;
    bool _715 = _657 == 0;
    float _717 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _719 = 1.0 / _701;
    float _721 = float(_691);
    float _723 = -_717;
    float _725 = _723 + 1.0;
    float _727 = _703 * _143;
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _731 = int(_729);
    int _733 = as_type<int>(_719) + (-2);
    float _735 = trunc(_727);
    int _737 = int(_735);
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _741 = _739 != 0;
    float _743 = 1.0 / _721;
    float _745 = float(uint(_731));
    int _747 = ~_731;
    int _749 = _747 + 1;
    int _751 = ~_731;
    int _753 = _751 + 1;
    float _755 = float(uint(_737));
    float _757 = 1.0 / _745;
    float _759 = as_type<float>(_733) * _755;
    float _761 = _743 * _143;
    float _763 = trunc(_759);
    float _765 = precise::max(_763, 0.0);
    uint _768 = uint(_765);
    float _770 = in.m_51.y;
    float _772 = trunc(_761);
    int _774 = int(_772);
    int _776 = as_type<int>(_757) + (-2);
    float _778 = _759;
    if (_741)
    {
        _778 = _129;
    }
    float _780 = _778;
    int _782 = _707 * int(_768);
    int _784 = _782 + _737;
    float _786 = 1.0 / _653;
    float _788 = float(uint(_784));
    float _790 = as_type<float>(_784);
    float _792 = _780;
    if (_741)
    {
        _790 = 1.0;
    }
    float _794 = _790;
    float _796 = float(uint(_774));
    float _798 = as_type<float>(_733) * _788;
    float _800 = _794;
    float _802 = _796;
    if (!_741)
    {
        _800 = 1.2345600128173828125;
    }
    float _804 = _800;
    if (!_741)
    {
        _792 = _770;
    }
    float _806 = _792;
    float _808 = as_type<float>(_776) * _796;
    if (_741)
    {
        _802 = 1.0;
    }
    float _810 = _802;
    float _812 = trunc(_798);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _810;
    if (!_741)
    {
        _818 = 7.345489978790283203125;
    }
    float _820 = _818;
    float _822 = _804 * _806;
    float _824 = float(_731);
    float _826 = _820 * _129;
    float _828 = trunc(_808);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = floor(_826);
    int _836 = ~_731;
    int _838 = _836 + 1;
    int _840 = int(_768) + int(_816);
    int _842 = _838 * int(_832);
    int _844 = _842 + _774;
    float _846 = floor(_822);
    int _848 = _713 * _840;
    int _850 = _848 + _737;
    float _852 = float(uint(_844));
    float _854 = -_834;
    float _856 = _826 + _854;
    bool _858 = uint(_850) >= uint(_657);
    float _860 = as_type<float>(_776) * _852;
    float _862 = float(_657);
    float _864 = _786 * _143;
    float _866 = trunc(_860);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    float _872 = _856 * _862;
    bool _874 = !_858;
    int _876 = _874 ? 0 : (-1);
    float _878 = -_846;
    float _880 = _822 + _878;
    float _882 = float(_737);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _886 = _884 != 0;
    float _888 = trunc(_872);
    int _890 = int(_888);
    bool _892 = _882 >= _862;
    bool _894 = isnan(_882);
    bool _896 = _892 || _894;
    bool _898 = isnan(_862);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _862 * _864;
    int _906 = ~_840;
    int _908 = _906 + _876;
    int _910 = _908 + 1;
    float _912 = _824 * _864;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    float _918 = _880 * _824;
    float _920 = float(_774);
    float _922 = trunc(_902);
    int _924 = int(_922);
    int _926 = abs(_916);
    bool _928 = _920 >= _824;
    bool _930 = isnan(_920);
    bool _932 = _928 || _930;
    bool _934 = isnan(_824);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    int _940 = int(_832) + int(_870);
    int _942 = _890 * _926;
    int _944 = _942 + _737;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _948 = _946 != 0;
    int _950 = _657 * _910;
    int _952 = _950 + _737;
    int _954 = _749 * _940;
    int _956 = _954 + _774;
    float _958 = trunc(_918);
    int _960 = int(_958);
    bool _962 = !_948;
    int _964 = _962 ? 0 : 1;
    float _966 = _589 * _167;
    bool _968 = !_715;
    int _970 = _968 ? _952 : (-1);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _982 = _980 != 0;
    bool _984 = uint(_956) >= uint(_731);
    float _986 = trunc(_904);
    int _988 = int(_986);
    int _990 = ~_924;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    bool _996 = !_984;
    int _998 = _996 ? 0 : (-1);
    int _1000 = abs(_964);
    int _1002 = _970 * _994;
    bool _1004 = !_978;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = trunc(_938);
    int _1010 = int(_1008);
    int _1012 = _657 + (-1);
    int _1014 = ~_940;
    int _1016 = _1014 + _998;
    int _1018 = _1016 + 1;
    int _1020 = abs(_1006);
    int _1022 = _924 * _1012;
    int _1024 = _1022 + _1002;
    bool _1026 = !_974;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _960 * _1000;
    int _1032 = _1030 + _774;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1036 = _1034 != 0;
    int _1038 = _731 * _1018;
    int _1040 = _1038 + _774;
    bool _1042 = !_982;
    int _1044 = _1042 ? 0 : 1;
    int _1046 = _1024 * _1020;
    int _1048 = abs(_1028);
    float _1050 = trunc(_912);
    int _1052 = int(_1050);
    bool _1054 = _731 == 0;
    float _1056 = in.m_51.w;
    int _1058 = abs(_1044);
    int _1060 = _988 * _1048;
    int _1062 = _1060 + _1046;
    bool _1064 = !_1036;
    int _1066 = _1064 ? 0 : 1;
    int _1068 = ~_1010;
    int _1070 = _1068 + 1;
    int _1072 = _1070 + 1;
    bool _1074 = !_1054;
    int _1076 = _1074 ? _1040 : (-1);
    float _1078 = _589 * _175;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1094 = _1092 != 0;
    int _1096 = _1076 * _1072;
    int _1098 = abs(_1066);
    int _1100 = _944 * _1058;
    int _1102 = _1100 + _1062;
    int _1104 = _731 + (-1);
    float _1106 = fma(_591, _173, _1078);
    float _1108 = _770 * 2.0;
    bool _1110 = !_1086;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1010 * _1104;
    int _1116 = _1114 + _1096;
    bool _1118 = !_1082;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _890 * _1098;
    int _1124 = _1122 + _1102;
    int _1126 = abs(_1112);
    bool _1128 = !_1090;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = abs(_1120);
    bool _1134 = !_1094;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = abs(_1130);
    int _1140 = _1116 * _1126;
    float _1142 = float(uint(_1124));
    float _1144 = _589 * _181;
    int _1146 = abs(_1136);
    int _1148 = _1052 * _1132;
    int _1150 = _1148 + _1140;
    float _1152 = as_type<float>(_733) * _1142;
    float _1154 = in.m_51.z;
    int _1156 = ~_731;
    int _1158 = _1156 + 1;
    int _1160 = _1032 * _1138;
    int _1162 = _1160 + _1150;
    int _1164 = ~_657;
    int _1166 = _1164 + 1;
    float _1168 = trunc(_1152);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = _657 == 0;
    int _1176 = _960 * _1146;
    int _1178 = _1176 + _1162;
    int _1180 = ~_657;
    int _1182 = _1180 + 1;
    float _1184 = float(uint(_1178));
    float _1186 = as_type<float>(_776) * _1184;
    int _1188 = _1182 * int(_1172);
    int _1190 = _1188 + _1124;
    float _1192 = trunc(_1186);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = float(uint(_1190));
    float _1200 = as_type<float>(_733) * _1198;
    float _1202 = trunc(_1200);
    float _1204 = precise::max(_1202, 0.0);
    uint _1206 = uint(_1204);
    int _1208 = _1158 * int(_1196);
    int _1210 = _1208 + _1178;
    float _1212 = float(uint(_1210));
    float _1214 = as_type<float>(_776) * _1212;
    int _1216 = int(_1172) + int(_1206);
    float _1218 = trunc(_1214);
    float _1220 = precise::max(_1218, 0.0);
    uint _1222 = uint(_1220);
    int _1224 = ~_731;
    int _1226 = _1224 + 1;
    int _1228 = _1166 * _1216;
    int _1230 = _1228 + _1124;
    bool _1232 = uint(_1230) >= uint(_657);
    bool _1234 = !_1232;
    int _1236 = _1234 ? 0 : (-1);
    int _1238 = int(_1196) + int(_1222);
    int _1240 = ~_1216;
    int _1242 = _1240 + _1236;
    int _1244 = _1242 + 1;
    float _1246 = float(uint(_944));
    int _1248 = _657 * _1244;
    int _1250 = _1248 + _1124;
    int _1252 = _1226 * _1238;
    int _1254 = _1252 + _1178;
    float _1256 = as_type<float>(_733) * _1246;
    bool _1258 = !_1174;
    int _1260 = _1258 ? _1250 : (-1);
    bool _1262 = uint(_1254) >= uint(_731);
    float _1264 = trunc(_1256);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    int _1270 = _1260 & 3;
    bool _1272 = _1270 != 0;
    bool _1274 = !_1262;
    int _1276 = _1274 ? 0 : (-1);
    bool _1278 = uint(_1270) > 1u;
    int _1280 = _1260 & 3;
    bool _1282 = _1280 != 0;
    int _1284 = ~_1238;
    int _1286 = _1284 + _1276;
    int _1288 = _1286 + 1;
    int _1290 = _1282 ? 0 : 1;
    bool _1292 = _1270 != 3;
    int _1294 = _731 * _1288;
    int _1296 = _1294 + _1178;
    int _1298 = ~_1290;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = _129 * 2.0;
    bool _1306 = uint(_1270) >= 2u;
    int _1308 = _1302;
    float _1310 = _1108;
    if (!_1278)
    {
        int _1312 = ~_1290;
        int _1314 = _1312 + 1;
        _1308 = _1314;
    }
    int _1316 = _1308;
    float _1318 = floor(_1304);
    float _1320 = float(uint(_1032));
    int _1322 = _1306 ? 0 : 1;
    bool _1324 = !_1054;
    int _1326 = _1324 ? _1296 : (-1);
    float _1328 = as_type<float>(_776) * _1320;
    int _1330 = ~_1322;
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1334;
    if (_1292)
    {
        int _1338 = ~_1322;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = trunc(_1328);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    int _1350 = _1326 & 3;
    bool _1352 = _1350 != 0;
    int _1354 = _1326 & 3;
    bool _1356 = _1354 != 0;
    int _1358 = ~_657;
    int _1360 = _1358 + 1;
    bool _1362 = uint(_1350) >= 2u;
    int _1364 = _1356 ? 0 : 1;
    int _1366 = _1360 * int(_1268);
    int _1368 = _1366 + _944;
    bool _1370 = uint(_1350) > 1u;
    int _1372 = _1362 ? 0 : 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1376 = _1374 != 0;
    bool _1378 = _1350 != 3;
    float _1380 = floor(_1108);
    float _1382 = float(uint(_1368));
    int _1384 = _753 * int(_1348);
    int _1386 = _1384 + _1032;
    int _1388 = ~_1364;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    int _1394 = ~_1372;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    float _1400 = as_type<float>(_733) * _1382;
    float _1402 = float(uint(_1386));
    int _1404 = _1392;
    int _1406 = as_type<int>(_1382);
    int _1408 = _1398;
    if (!_1370)
    {
        int _1410 = ~_1364;
        int _1412 = _1410 + 1;
        _1404 = _1412;
    }
    int _1414 = _1404;
    float _1416 = as_type<float>(_776) * _1402;
    bool _1418 = _129 > 0.5;
    float _1420 = trunc(_1400);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    if (_1376)
    {
        _1406 = 0;
    }
    int _1426 = _1406;
    int _1428 = _1426;
    if (_1378)
    {
        int _1430 = ~_1372;
        int _1432 = _1430 + 1;
        _1408 = _1432;
    }
    int _1434 = _1408;
    if (!_1376)
    {
        _1428 = 1;
    }
    int _1436 = _1428;
    int _1438 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1440 = _1438 != 0;
    float _1442 = trunc(_1416);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    float _1448 = -_359;
    int _1450 = _1418 ? as_type<int>(_1448) : as_type<int>(_359);
    bool _1452 = _770 > 0.5;
    bool _1454 = !_1440;
    float _1456 = _1454 ? _359 : as_type<float>(_1450);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1460 = _1458 != 0;
    float _1462 = -_377;
    float _1464 = _1452 ? _1462 : _377;
    bool _1466 = _1154 > 0.5;
    bool _1468 = _1056 > 0.5;
    float _1470 = fma(_591, _165, _966);
    bool _1472 = !_1460;
    float _1474 = _1472 ? _377 : _1464;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    float _1480 = -_359;
    int _1482 = _1466 ? as_type<int>(_1480) : as_type<int>(_359);
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1486 = _1484 != 0;
    float _1488 = -_377;
    int _1490 = _1468 ? as_type<int>(_1488) : as_type<int>(_377);
    bool _1492 = !_1478;
    float _1494 = _1492 ? _359 : as_type<float>(_1482);
    bool _1496 = _1436 != 1;
    bool _1498 = _1318 > 0.0;
    float _1500 = _1494 + 0.5;
    bool _1502 = !_1486;
    float _1504 = _1502 ? _377 : as_type<float>(_1490);
    bool _1506 = _1318 >= 0.0;
    bool _1508 = isnan(_1318);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    int _1516 = int(_1268) + int(_1424);
    int _1518 = ~_657;
    int _1520 = _1518 + 1;
    int _1522 = _1514 ? 0 : 1;
    int _1524 = ~_731;
    int _1526 = _1524 + 1;
    int _1528 = _1520 * _1516;
    int _1530 = _1528 + _944;
    int _1532 = int(_1348) + int(_1446);
    int _1534 = ~_1522;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = _1464;
    float _1542 = as_type<float>(_1446);
    int _1544 = _1538;
    if (!_1496)
    {
        _225 = _770;
    }
    float _1546 = _225;
    float _1548 = _1546;
    if (!_1496)
    {
        _1540 = _770;
    }
    float _1550 = _1540;
    float _1552 = _1550;
    if (!_1496)
    {
        _1542 = _1154;
    }
    float _1554 = _1542;
    float _1556 = _1554;
    if (!_1496)
    {
        _1310 = _1154;
    }
    float _1558 = _1310;
    float _1560 = _1558;
    if (_1496)
    {
        _1548 = _129;
    }
    float _1562 = _1548;
    if (_1496)
    {
        _1552 = _129;
    }
    float _1564 = _1552;
    if (_1496)
    {
        _1556 = _770;
    }
    float _1566 = _1556;
    if (_1496)
    {
        _1560 = _770;
    }
    float _1568 = _1560;
    if (!_1498)
    {
        int _1570 = ~_1522;
        int _1572 = _1570 + 1;
        _1544 = _1572;
    }
    int _1574 = _1544;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1578 = _1380 > 0.0;
    bool _1580 = _1380 >= 0.0;
    bool _1582 = isnan(_1380);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    bool _1590 = uint(_1530) >= uint(_657);
    int _1592 = _1526 * _1532;
    int _1594 = _1592 + _1032;
    float _1596 = fma(_591, _179, _1144);
    int _1598 = _1588 ? 0 : 1;
    bool _1600 = uint(_1594) >= uint(_731);
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1610 = !_1590;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1614;
    float _1618 = 1.0 / _1604;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1622 = _1620 != 0;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1626 = _1624 != 0;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1630 = _1628 != 0;
    float _1632 = fma(_613, _183, _1596);
    int _1634 = ~_1598;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1644 = !_1272;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = in.m_57.w;
    int _1650 = _1638;
    if (!_1578)
    {
        int _1652 = ~_1598;
        int _1654 = _1652 + 1;
        _1650 = _1654;
    }
    int _1656 = _1650;
    float _1658 = 1.0 / _1608;
    float _1660 = fma(_613, _177, _1106);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1664 = _647 + _1662;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1672 = _647 + _1670;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1676 = _1674 != 0;
    float _1678 = fma(_613, _169, _1470);
    float _1680 = 1.0 / _1616;
    float _1682 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1686 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1688 = _1672 * _1618;
    float _1690 = fma(_1682, -2.0, _1684);
    float _1692 = 1.0 / _1642;
    float _1694 = _1154 * 2.0;
    float _1696 = in.m_55.w;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1700 = _1664 * _1658;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1704 = _647 + _1702;
    bool _1706 = !_1600;
    int _1708 = _1706 ? 0 : (-1);
    float _1710 = -_1698;
    float _1712 = fma(_1686, 2.0, _1710);
    float _1714 = floor(_1694);
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1718 = _647 + _1716;
    float _1720 = _129 + _770;
    float _1722 = _1660 + _1648;
    float _1724 = -_143;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1712);
    float _1728 = _1718 * _1680;
    float _1730 = _1720 + (-1.0);
    float _1732 = in.m_59.w;
    float _1734 = _1704 * _1692;
    float _1736 = _129 + _1154;
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1740 = _1154 + _770;
    float _1742 = _1736 + (-1.0);
    bool _1744 = !_1626;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1690);
    bool _1750 = _1714 >= 0.0;
    bool _1752 = isnan(_1714);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan(0.0);
    bool _1758 = _1754 || _1756;
    float _1760 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1762 = _1678 + _1696;
    int _1764 = _1758 ? 0 : 1;
    float _1766 = _1740 + (-1.0);
    bool _1768 = _1714 > 0.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1774;
    bool _1778 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1780 = isnan(_647);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1792 = fma(_1772, _1688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1794 = fma(_1776, _1688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1804 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1806 = isnan(_647);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = -_1788;
    float _1818 = _1816 + 1.0;
    float _1820 = fma(_1798, _1700, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1822 = _1632 + _1732;
    float _1824 = fma(_1802, _1700, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1826 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1828 = isnan(_647);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1834 = _1830 || _1832;
    float _1836 = float(_1834);
    float _1838 = _1814 * _1818;
    float _1840 = -_1814;
    float _1842 = _1840 + 1.0;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1846 = _1722 + _1844;
    float _1848 = _1836 * _1842;
    float _1850 = -_1836;
    float _1852 = _1850 + 1.0;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1854;
    bool _1858 = !_1622;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1862;
    float _1866 = _669 * _1852;
    float _1868 = fma(_1856, _1728, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1870 = _1456 + 0.5;
    float _1872 = fma(_1864, _1728, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1874 = _1792 * _693;
    float _1876 = _1794 * _693;
    int _1878 = abs(_1746);
    float _1880 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1726);
    float _1882 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1874);
    float _1884 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1876);
    float _1886 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1888 = log2(_1886);
    float _1890 = fma(_1820, _1866, _1882);
    float _1892 = float(_1878);
    float _1894 = fma(_1824, _1866, _1884);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1898 = _1474 + (-0.5);
    float _1900 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1896);
    float _1902 = float(_1574);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1906 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1908 = _1326 >> 31;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1762 + _1910;
    float _1914 = _1892 * _1902;
    float _1916 = -_1904;
    float _1918 = fma(_1906, 2.0, _1916);
    int _1920 = abs(_1860);
    float _1922 = _1888 * _143;
    int _1924 = _1260 >> 31;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1928 = _1908 & 3;
    float _1930 = -_1898;
    float _1932 = -_1748;
    float _1934 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1932);
    int _1936 = _1924 & 3;
    float _1938 = exp2(_1922);
    int _1940 = _1326 + _1928;
    float _1942 = fma(_1872, _1848, _1894);
    int _1944 = _1260 + _1936;
    float _1946 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1948 = !_1352;
    int _1950 = _1948 ? 0 : 1;
    float _1952 = fma(_1576, -2.0, _1926);
    int _1954 = _1944 >> 2;
    float _1956 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1946);
    bool _1958 = _1270 != 3;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1962 = _1822 + _1960;
    int _1964 = _1940 >> 2;
    float _1966 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1900);
    int _1968 = ~_1764;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1956);
    int _1976 = _1954 << 4;
    int _1978 = _1976 + 368;
    float _1980 = -_1938;
    float _1982 = _1980 + 1.0;
    int _1984 = _1972;
    if (!_1768)
    {
        int _1986 = ~_1764;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    float _1992 = _129 + (-0.5);
    bool _1994 = !_1958;
    int _1996 = _1994 ? 0 : (-1);
    bool _1998 = _1350 != 3;
    uint _2000 = uint(int(uint(_1978) >> uint(2)));
    uint _2002 = uint(int(uint(int(_2000)) >> uint(2)));
    int _2004 = int(_2000) & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = int(_2000) + 1;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    int _2012 = _2008 & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = _1964 << 4;
    int _2018 = _2016 + 512;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2030 = _2026 || _2028;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2034 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2020);
    float _2036 = _2030 ? _1982 : 0.0;
    uint _2038 = uint(int(uint(_2018) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    int _2046 = int(_2038) + 1;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    int _2050 = _2046 & 3;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[int(_2048)][_2050];
    float _2054 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2032);
    float _2056 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2034);
    float _2058 = -_143;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1918);
    bool _2062 = _1974 >= 0.0;
    float _2064 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2054);
    float _2066 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1952);
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2070 = 1.0 + _2068;
    int _2072 = _1978 + 8;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    uint _2076 = uint(int(uint(int(_2074)) >> uint(2)));
    int _2078 = int(_2074) & 3;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[int(_2076)][_2078];
    int _2082 = int(_2074) + 1;
    uint _2084 = uint(int(uint(_2082) >> uint(2)));
    int _2086 = _2082 & 3;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[int(_2084)][_2086];
    bool _2090 = !_1998;
    int _2092 = _2090 ? 0 : (-1);
    float _2094 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2060);
    bool _2096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2098 = isnan(1.0);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2104 = _2100 || _2102;
    float _2106 = 1.0 / _2070;
    float _2108 = float(_1920);
    int _2110 = _2018 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = float(_1990);
    if (_2062)
    {
        out.m_47.x = 0.0;
    }
    float _2130 = 0.0;
    if (_2062)
    {
        _2130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2132 = _2130;
    int _2134 = ~_1516;
    int _2136 = _2134 + _1612;
    int _2138 = _2136 + 1;
    float _2140 = _2108 * _2128;
    int _2142 = abs(_1316);
    float _2144 = in.m_66.x;
    float _2146 = in.m_66.y;
    float _2148 = in.m_66.z;
    int _2150 = abs(_1646);
    float _2152 = _2140 * (-2.0);
    int _2154 = as_type<int>(_2140);
    if (_2062)
    {
        float _2156 = _2132 * 5.0;
        _2154 = as_type<int>(_2156);
    }
    int _2158 = _2154;
    int _2160 = abs(_1414);
    if (_2104)
    {
        float _2162 = _2036 * _2106;
        _145 = _2162;
    }
    float _2164 = _145;
    int _2166 = ~_2142;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = abs(_1950);
    int _2174 = _657 * _2138;
    int _2176 = _2174 + _944;
    int _2178 = abs(_2092);
    float _2180 = _1504 + (-0.5);
    if (_2062)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7083 = as_type<float>(_2158);
        out.gl_Position.z = _7083;
    }
    int _2182 = ~_1532;
    int _2184 = _2182 + _1708;
    int _2186 = _2184 + 1;
    float _2188 = fma(_1738, _2152, _1738);
    bool _2190 = _657 == 0;
    int _2192 = _2170 * as_type<int>(_2014);
    bool _2194 = _731 == 0;
    int _2196 = _731 * _2186;
    int _2198 = _2196 + _1032;
    bool _2200 = !_2190;
    int _2202 = _2200 ? _2176 : (-1);
    float _2204 = -_2180;
    float _2206 = -_2066;
    float _2208 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2206);
    bool _2210 = !_2194;
    int _2212 = _2210 ? _2198 : (-1);
    float _2214 = _1912 * _1912;
    int _2216 = ~_2160;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = fma(_2152, _2144, _2144);
    int _2224 = ~_2150;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_1846, _1846, _2214);
    int _2232 = ~_2172;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2220 * as_type<int>(_2052);
    float _2240 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2222);
    int _2242 = _2228 * as_type<int>(_2006);
    int _2244 = _2242 + _2192;
    int _2246 = abs(_1342);
    int _2248 = _2236 * as_type<int>(_2044);
    int _2250 = _2248 + _2238;
    int _2252 = abs(_1434);
    float _2254 = fma(_1962, _1962, _2230);
    int _2256 = ~_2246;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    bool _2262 = !_1668;
    int _2264 = _2262 ? 0 : 1;
    float _2266 = rsqrt(_2254);
    int _2268 = ~_2252;
    int _2270 = _2268 + 1;
    int _2272 = _2270 + 1;
    int _2274 = _2260 * as_type<int>(_2080);
    int _2276 = _2274 + _2244;
    int _2278 = abs(_1996);
    int _2280 = abs(_2264);
    int _2282 = _2272 * as_type<int>(_2118);
    int _2284 = _2282 + _2250;
    bool _2286 = !_1676;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = ~_2278;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2178;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    int _2302 = _2294 * as_type<int>(_2088);
    int _2304 = _2302 + _2276;
    int _2306 = abs(_2288);
    float _2308 = _1912 * _2266;
    int _2310 = ~_2280;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2300 * as_type<int>(_2126);
    int _2318 = _2316 + _2284;
    int _2320 = ~_2306;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = _1846 * _2266;
    float _2328 = -_2308;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    int _2332 = _2304 * _2314;
    float _2334 = -_2064;
    float _2336 = _2334 + 1.0;
    int _2338 = _2318 * _2324;
    float _2340 = -_2056;
    float _2342 = _2340 + 1.0;
    int _2344 = _2202 * _2280;
    int _2346 = _2344 + _2332;
    float _2348 = -_2326;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    int _2352 = _2212 * _2306;
    int _2354 = _2352 + _2338;
    float _2356 = -_1966;
    float _2358 = _2356 + 1.0;
    float _2360 = _2330 * _2330;
    float _2362 = -_725;
    float _2364 = fma(_1456, _2362, _1880);
    float _2366 = fma(_1474, _2336, _1934);
    float _2368 = _1962 * _2266;
    float _2370 = -_2358;
    float _2372 = fma(_1494, _2370, _2094);
    float _2374 = fma(_1504, _2342, _2208);
    float _2376 = float(_2346);
    float _2378 = fma(_2350, _2350, _2360);
    float _2380 = float(_2354);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    bool _2386 = !_1630;
    int _2388 = _2386 ? 0 : 1;
    out.m_68.x = _2364;
    out.m_68.y = _2366;
    out.m_68.z = _2372;
    out.m_68.w = _2374;
    float _2390 = fma(_2384, _2384, _2378);
    int _2392 = abs(_2388);
    out.m_70.x = _2376;
    out.m_70.y = _2380;
    float _2394 = _2148;
    if (_2062)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2396 = -_2308;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _2400 = -_2326;
    float _2402 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _2404 = -_2368;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _2408 = float(_1656);
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2412 = _2398 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2402 + _2414;
    float _2418 = float(_2392);
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2422 = _2406 + _2420;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2426 = _1914 * (-2.0);
    float _2428 = fma(_2188, _2164, _2240);
    float _2430 = _2418 * _2408;
    float _2432 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2424);
    float _2434 = _770 + (-0.5);
    float _2436 = fma(_2426, _2146, _2146);
    float _2438 = _2430 * (-2.0);
    float _2440 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2432);
    float _2442 = _2428 * 0.15915493667125701904296875;
    float _2444 = fma(_1790, _2426, _1790);
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2436);
    float _2448 = fma(_2438, _2148, _2148);
    bool _2450 = _2440 >= 0.0;
    float _2452 = _1154 + (-0.5);
    float _2454 = fma(_1760, _2438, _1760);
    float _2456 = fma(_2444, _2164, _2446);
    float _2458 = in.m_64.x;
    float _2460 = in.m_64.y;
    float _2462 = fma(_2452, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2448);
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2468 = _2456 * 0.15915493667125701904296875;
    float _2470 = fma(_1868, _1848, _1890);
    float _2472 = sqrt(_2390);
    float _2474 = fma(_2466, _1734, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2478 = _2476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2480 = _2416;
    if (_2450)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2482 = _2394;
    float _2484 = fma(_2474, _1838, _1942);
    float _2486 = fma(_2454, _2164, _2462);
    int _2488 = as_type<int>(_2482);
    if (_2450)
    {
        out.m_47.x = 0.0;
    }
    float _2490 = _2442 * 6.283185482025146484375;
    float _2492 = sin(_2490);
    if (_2450)
    {
        float _2494 = _2482 * 5.0;
        _2488 = as_type<int>(_2494);
    }
    int _2496 = _2488;
    float _2498 = fma(_2478, _1734, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2500 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2484);
    float _2502 = _2486 * 0.15915493667125701904296875;
    if (_2450)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7578 = as_type<float>(_2496);
        out.gl_Position.z = _7578;
    }
    float _2504 = _2442 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    float _2508 = _2468 * 6.283185482025146484375;
    float _2510 = sin(_2508);
    float _2512 = _2468 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    if (_2450)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2516 = _2500 * _2460;
    float _2518 = _2502 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    float _2522 = fma(_2498, _1838, _2470);
    float _2524 = _2266 * _2472;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _377);
    float _2530 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2522);
    float _2532 = _2492 * _2510;
    float _2534 = _2524 * _2526;
    float _2536 = _2502 * 6.283185482025146484375;
    float _2538 = sin(_2536);
    float _2540 = _2530 * _2458;
    float _2542 = _2506 * _2514;
    float _2544 = _2528 * _2534;
    float _2546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _359);
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2550 = _2492 * _2514;
    float _2552 = _2506 * _2510;
    float _2554 = _2506 * _2520;
    float _2556 = _2548 * _2524;
    float _2558 = _2514 * _2520;
    float _2560 = _2492 * _2520;
    float _2562 = _2510 * _2520;
    float _2564 = _2556 * _2546;
    float _2566 = _2554 * _2544;
    float _2568 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2570 = _2568 * 0.5;
    float _2572 = fma(_2538, _2542, _2532);
    float _2574 = -_2550;
    float _2576 = fma(_2538, _2552, _2574);
    float _2578 = -_2544;
    float _2580 = _2538 * _2578;
    float _2582 = -_2552;
    float _2584 = fma(_2538, _2550, _2582);
    float _2586 = fma(_2572, _2564, _2566);
    float _2588 = _2560 * _2544;
    float _2590 = fma(_2558, _2564, _2580);
    float _2592 = fma(_2538, _2532, _2542);
    float _2594 = fma(_2576, _2570, _2586);
    float _2596 = fma(_2584, _2564, _2588);
    float _2598 = fma(_2562, _2570, _2590);
    float _2600 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2592, _2570, _2596);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2606 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2608 = isnan(0.5);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2614 = _2610 || _2612;
    float _2616 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2618 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2620 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2622 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2616);
    float _2624 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2618);
    float _2626 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2620);
    float _2628 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2630 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2632 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2626);
    float _2634 = _1822 + _2628;
    float _2636 = _1722 + _2630;
    float _2638 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2642 = _2634 + _2640;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2646 = _2636 + _2644;
    float _2648 = _1762 + _2638;
    float _2650 = _2642 * _2642;
    float _2652 = fma(_2646, _2646, _2650);
    float _2654 = sqrt(_2652);
    bool _2656 = _2654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2602;
    float _2660 = _2550;
    float _2662 = _2636;
    float _2664 = _2648;
    float _2666 = _2556;
    if (!_2656)
    {
        _2658 = _2634;
    }
    float _2668 = _2658;
    float _2670 = _2668;
    if (!_2656)
    {
        _2660 = _2648;
    }
    float _2672 = _2660;
    bool _2674 = !_2656;
    float _2676 = _2672;
    if (!_2674)
    {
        float _2678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2682 = _2654 + _2680;
        float _2684 = rsqrt(_2652);
        float _2686 = _2682 * _2678;
        float _2688 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2690 = _2686 * 0.15915493667125701904296875;
        float _2692 = _2690 * 6.283185482025146484375;
        float _2694 = sin(_2692);
        float _2696 = _2690 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = fma(_2694, _2688, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2702 = _2684 * _2700;
        float _2704 = _2698 + (-1.0);
        float _2706 = fma(_2646, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2708 = fma(_2642, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2710 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2712 = fma(_2648, _2698, _2710);
        _2662 = _2706;
        _2676 = _2712;
        _2670 = _2708;
    }
    float _2714 = _2662;
    float _2716 = _2676;
    float _2718 = _2670;
    float _2720 = -_2326;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2714);
    float _2724 = -_2308;
    float _2726 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2716);
    float _2728 = -_2368;
    float _2730 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2718);
    float _2732 = _2726;
    float _2734 = _2722;
    float _2736 = _2730;
    if (!_2614)
    {
        float _2738 = _2412 * _2412;
        float _2740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2742 = -_1822;
        float _2744 = _2742 + _2718;
        float _2746 = fma(_2416, _2416, _2738);
        float _2748 = fma(_2422, _2422, _2746);
        float _2750 = 1.0 / _2524;
        float _2752 = sqrt(_2748);
        float _2754 = precise::min(_2752, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2756 = _2754 * _2740;
        float _2758 = -_1722;
        float _2760 = _2758 + _2714;
        float _2762 = _2756 * _2750;
        float _2764 = -_1762;
        float _2766 = _2764 + _2716;
        float _2768 = fma(_2760, _2762, _2402);
        float _2770 = fma(_2766, _2762, _2398);
        float _2772 = fma(_2744, _2762, _2406);
        _2732 = _2770;
        _2734 = _2768;
        _2736 = _2772;
    }
    float _2774 = _2732;
    float _2776 = _2734;
    float _2778 = _2736;
    float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2782 = _2774 + _2780;
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2786 = _2776 + _2784;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2790 = _2778 + _2788;
    float _2792 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2794 = _2782 * _2782;
    float _2796 = fma(_2786, _2786, _2794);
    float _2798 = fma(_2790, _2790, _2796);
    float _2800 = rsqrt(_2798);
    float _2802 = sqrt(_2798);
    float _2804 = _2800 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2806 = _2786 * _2804;
    float _2808 = _2790 * _2804;
    float _2810 = _2806 * _2806;
    float _2812 = _2808 * _2808;
    float _2814 = _2810 + _2812;
    float _2816 = sqrt(_2814);
    bool _2818 = _2816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2822 = _2816 + _2820;
    float _2824 = _2790;
    float _2826 = _2814;
    float _2828 = _2822;
    float _2830 = _2804;
    if (_2818)
    {
        float _2832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _2832;
    }
    float _2834 = _2824;
    if (_2818)
    {
        float _2836 = rsqrt(_2814);
        _2826 = _2836;
    }
    float _2838 = _2826;
    float _2840 = _2838;
    if (_2818)
    {
        float _2842 = _2822 * _2834;
        _2828 = _2842;
    }
    float _2844 = _2828;
    if (_2818)
    {
        float _2846 = _2844 * 0.15915493667125701904296875;
        _2480 = _2846;
    }
    float _2848 = _2480;
    float _2850 = _2834;
    if (_2818)
    {
        float _2852 = _2848 * 6.283185482025146484375;
        float _2854 = sin(_2852);
        _2850 = _2854;
    }
    float _2856 = _2850;
    float _2858 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2860 = precise::max(0.0, _2858);
    float _2862 = _2794;
    float _2864 = _2860;
    if (_2818)
    {
        float _2866 = _2848 * 6.283185482025146484375;
        float _2868 = cos(_2866);
        _2862 = _2868;
    }
    float _2870 = _2862;
    float _2872 = -_2804;
    float _2874 = -_2860;
    float _2876 = fma(_2782, _2872, _2874);
    float _2878 = _2876;
    if (_2818)
    {
        float _2880 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2864 = _2880;
    }
    float _2882 = _2864;
    float _2884 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2886 = _2856;
    float _2888 = _2882;
    if (_2818)
    {
        float _2890 = fma(_2856, _2882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2886 = _2890;
    }
    float _2892 = _2886;
    float _2894 = _2892;
    float _2896 = _2870;
    if (_2818)
    {
        float _2898 = _2870 + (-1.0);
        _2888 = _2898;
    }
    float _2900 = _2888;
    float _2902 = _2900;
    if (_2818)
    {
        float _2904 = _2838 * _2892;
        _2664 = _2904;
    }
    float _2906 = _2664;
    if (!_2818)
    {
        _2894 = _2806;
    }
    float _2908 = _2894;
    float _2910 = _2908;
    if (_2818)
    {
        float _2912 = _2900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2830 = _2912;
    }
    float _2914 = _2830;
    if (_2818)
    {
        float _2916 = _2806 * _2906;
        _2910 = _2916;
    }
    float _2918 = _2910;
    if (!_2818)
    {
        _2902 = _2808;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    if (_2818)
    {
        float _2924 = _2808 * _2906;
        _2922 = _2924;
    }
    float _2926 = _2922;
    if (!_2818)
    {
        _2840 = _2810;
    }
    float _2928 = _2840;
    float _2930 = _2928;
    if (_2818)
    {
        float _2932 = fma(_2876, _2870, _2914);
        _2878 = _2932;
    }
    float _2934 = _2878;
    if (_2818)
    {
        float _2936 = _2918 * _2918;
        _2930 = _2936;
    }
    float _2938 = _2930;
    if (!_2818)
    {
        _2896 = _2812;
    }
    float _2940 = _2896;
    float _2942 = _2940;
    if (_2818)
    {
        float _2944 = _2926 * _2926;
        _2942 = _2944;
    }
    float _2946 = _2942;
    float _2948 = fma(_2934, _2934, _2938);
    float _2950 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2952 = _2948 + _2946;
    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2956 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2954);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2884);
    float _2962 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2964 = rsqrt(_2952);
    float _2966 = -_2958;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2960);
    float _2972 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2974 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2962);
    float _2976 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2950);
    float _2978 = _2970 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2980 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2972);
    float _2982 = abs(_2968);
    float _2984 = log2(_2982);
    float _2986 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2974);
    float _2988 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2976);
    float _2990 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2980);
    float _2992 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2994 = _2986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2996 = _2988 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2998 = _2990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3000 = _2964 * _2918;
    float _3002 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2964 * _2934;
    float _3006 = _2964 * _2926;
    float _3008 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3010 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3012 = -_2992;
    float _3014 = fma(_3012, _2792, 1.0);
    float _3016 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3018 = -_3008;
    float _3020 = fma(_3004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3018);
    float _3022 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3010);
    float _3024 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3026 = log2(_3014);
    float _3028 = -_3006;
    float _3030 = fma(_3028, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3020);
    float _3032 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3022);
    float _3034 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3036 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3024);
    float _3038 = fma(_3030, -0.5, 0.5);
    float _3040 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3034);
    float _3042 = exp2(_3016);
    float _3044 = _3004 + 1.0;
    float _3046 = fma(_3030, 0.5, 0.5);
    float _3048 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3040);
    float _3050 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3036);
    float _3052 = fma(_3046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3054 = 1.0 / _3032;
    float _3056 = _3026 * 0.693147182464599609375;
    float _3058 = fma(_3046, _3052, -0.212114393711090087890625);
    float _3060 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3062 = fma(_3046, _3058, 1.570728778839111328125);
    float _3064 = sqrt(_3038);
    float _3066 = -_3004;
    float _3068 = fma(_3042, _3044, _3066);
    float _3070 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3048);
    float _3072 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3050);
    float _3074 = fma(_3068, 0.5, 0.5);
    float _3076 = _3070 * _3054;
    float _3078 = _3072 * _3054;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = fma(_3078, -0.5, 0.5);
    float _3084 = _3064 * 0.636619746685028076171875;
    float3 _8529 = float3(_3080, _3082, _3060);
    float _3086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8529, float3(0.0), isnan(_8529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8529, float3(0.0), isnan(_8529)), level(0.0)).x;
    float _3088 = -_3062;
    float _3090 = fma(_3084, _3088, 1.0);
    float3 _8545 = float3(_3080, _3082, _3060);
    float4 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8545, float3(0.0), isnan(_8545)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8545, float3(0.0), isnan(_8545)), level(0.0)).xyzw;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = _3093.w;
    float2 _8562 = float2(_3090, _3074);
    float3 _3105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8562, float2(0.0), isnan(_8562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8562, float2(0.0), isnan(_8562)), level(0.0)).xyz;
    float _3107 = _3105.x;
    float _3109 = _3105.y;
    float _3111 = _3105.z;
    float _3113 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3115 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3117 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3119 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3121 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3113);
    float _3123 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3125 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3127 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3129 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3117);
    float _3131 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3115);
    float _3133 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3135 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3121);
    float _3137 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3139 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3119);
    float _3141 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3123);
    float _3143 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3125);
    float _3145 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3127);
    float _3147 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3129);
    float _3149 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3133);
    float _3151 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3153 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3137);
    float _3155 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3157 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3159 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3139);
    float _3161 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3141);
    float _3163 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3143);
    float _3165 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3167 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3145);
    float _3169 = -_2538;
    float _3171 = fma(_3169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3155);
    float _3173 = 1.0 / _3151;
    float _3175 = -_2538;
    float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3157);
    float _3179 = -_2538;
    float _3181 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3165);
    float _3183 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3185 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3187 = isnan(0.5);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3193 = _3189 || _3191;
    float _3195 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3197 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3199 = _377 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3201 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3203 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3195);
    float _3205 = _3159 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3207 = _3161 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3209 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3197);
    float _3211 = fma(_3199, _3199, 1.0);
    float _3213 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3171);
    float _3215 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3181);
    float _3217 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3177);
    float _3219 = _3205 + _3151;
    float _3221 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3223 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3203);
    float _3225 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3227 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3229 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3209);
    float _3231 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3233 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3235 = rsqrt(_3211);
    float _3237 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3239 = _3219 * _3173;
    float _3241 = _3239 * 0.5;
    float _3243 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3227);
    float _3245 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3231);
    float _3247 = _3123;
    float _3249 = _3173;
    float _3251 = _3213;
    float _3253 = _3151;
    float _3255 = _3119;
    float _3257 = _3217;
    float _3259 = _3070;
    float _3261 = _3072;
    float _3263 = _3032;
    if (!_3193)
    {
        _3247 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3265 = _3247;
    float _3267 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3233);
    float _3269 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3237);
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3273 = fma(_3241, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3271);
    float _3275 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3149);
    if (!_3193)
    {
        float _3277 = -_3265;
        float _3279 = _3277 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3249 = _3279;
    }
    float _3281 = _3249;
    float _3283 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3285 = 1.0 / _3273;
    float _3287 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3153);
    float _3289 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3291 = _3199 * _3235;
    float _3293 = _3199 * _3213;
    float _3295 = _3199 * _3217;
    out.m_72.x = _3275;
    out.m_72.y = _3283;
    out.m_72.z = _3287;
    float _3297 = -_3221;
    float _3299 = _3291 * _3297;
    float _3301 = _3281;
    float _3303 = _3289;
    if (!_3193)
    {
        float _3305 = 1.0 / _3281;
        _3301 = _3305;
    }
    float _3307 = _3301;
    float _3309 = fma(_3289, _3275, _3293);
    float _3311 = fma(_3289, _3283, _3295);
    float _3313 = _3199 * _3215;
    float _3315 = -_3223;
    float _3317 = _3291 * _3315;
    float _3319 = -_3229;
    float _3321 = _3291 * _3319;
    float _3323 = -_617;
    float _3325 = _3323 + _2774;
    float _3327 = fma(_3289, _3287, _3313);
    if (_3193)
    {
        _3303 = 1.0;
    }
    float _3329 = _3303;
    float _3331 = -_615;
    float _3333 = _3331 + _2776;
    float _3335 = fma(_3235, _3213, _3299);
    float _3337 = _3329;
    if (!_3193)
    {
        float _3339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3341 = -_3265;
        float _3343 = fma(_3285, _3339, _3341);
        _3251 = _3343;
    }
    float _3345 = _3251;
    float _3347 = fma(_3235, _3217, _3317);
    float _3349 = fma(_3235, _3215, _3321);
    float _3351 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3353 = -_619;
    float _3355 = _3353 + _2778;
    if (!_3193)
    {
        float _3357 = _3345 * _3307;
        float _3359 = precise::clamp(_3357, 0.0, 1.0);
        _3337 = _3359;
    }
    float _3361 = _3337;
    float _3363 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    out.m_74.x = _3335;
    out.m_74.y = _3347;
    out.m_74.z = _3349;
    float _3365 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3351);
    float _3367 = _3163 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3369 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3363);
    if (!_3193)
    {
        _3253 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3371 = _3253;
    float _3373 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3365);
    float _3375 = _3167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3377 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3369);
    out.m_76.y = 1.0;
    float _3379 = _3371;
    if (!_3193)
    {
        float _3381 = -_3371;
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3255 = _3383;
    }
    float _3385 = _3255;
    float _3387 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3373);
    float _3389 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3391 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3393 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3395 = fma(_3367, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3267);
    float _3397 = _3385;
    if (!_3193)
    {
        float _3399 = 1.0 / _3385;
        _3397 = _3399;
    }
    float _3401 = _3397;
    float _3403 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3391);
    float _3405 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3393);
    float _3407 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3409 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3411 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3403);
    float _3413 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3405);
    float _3415 = _3407 + _3269;
    float _3417 = 1.0 / _3389;
    float _3419 = _3411 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3421 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3423 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3415);
    if (!_3193)
    {
        float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3427 = -_3371;
        float _3429 = fma(_3285, _3425, _3427);
        _3379 = _3429;
    }
    float _3431 = _3379;
    float _3433 = _3387 + _3032;
    float _3435 = _3070 + _3032;
    float _3437 = _3032 * 0.5;
    float _3439 = exp2(_3409);
    float _3441 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3395);
    float _3443 = _3431;
    if (!_3193)
    {
        float _3445 = _3431 * _3401;
        float _3447 = precise::clamp(_3445, 0.0, 1.0);
        _3443 = _3447;
    }
    float _3449 = _3443;
    float _3451 = _3433 * 0.5;
    float _3453 = _3435 * 0.5;
    float _3455 = fma(_3072, -0.5, _3437);
    if (_3193)
    {
        _3257 = 1.0;
    }
    float _3457 = _3257;
    float _3459 = 1.0 / _3423;
    float _3461 = _3419 * _3417;
    float _3463 = _3421 * _3417;
    float _3465 = _3457;
    if (!_3193)
    {
        float _3467 = -_3449;
        float _3469 = _3467 + 1.0;
        _3465 = _3469;
    }
    float _3471 = _3465;
    out.m_78.x = _3453;
    out.m_78.y = _3455;
    out.m_78.z = _3451;
    out.m_78.w = _3032;
    float _3473 = _3221 + _3309;
    float _3475 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3477 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3479 = -_3439;
    float _3481 = _3479 + 1.0;
    out.gl_Position.x = _3070;
    out.gl_Position.y = _3072;
    out.gl_Position.z = _3387;
    out.gl_Position.w = _3032;
    float _3483 = _3223 + _3311;
    float _3485 = _3229 + _3327;
    float _3487 = _3481 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2776;
    out.m_80.y = _2774;
    out.m_80.z = _2778;
    float _3489 = _3475 + _3243;
    float _3491 = _3477 + _3245;
    float _3493 = _3441 * _3459;
    out.m_82.x = _3473;
    out.m_82.y = _3483;
    out.m_82.z = _3485;
    float _3495 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3489);
    float _3497 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3491);
    bool _3499 = _3493 > 0.0;
    float _3501 = -_3487;
    float _3503 = _3501 + 1.0;
    float _3505 = _3497 * _3459;
    bool _3507 = _3493 < 1.0;
    bool _3509 = _3507 && _3499;
    bool _3511 = _3076 > (-1.0);
    bool _3513 = _3511 && _3509;
    bool _3515 = _3078 > (-1.0);
    bool _3517 = _3515 && _3513;
    bool _3519 = _3076 < 1.0;
    bool _3521 = _3519 && _3517;
    bool _3523 = _3078 < 1.0;
    bool _3525 = _3523 && _3521;
    float _3527 = _3487 * _3086;
    float _3529 = _3495 * _3459;
    float _3531 = _3101 * _3527;
    float _3533 = _3101 * _3503;
    float _3535 = _3111 * _3527;
    float _3537 = fma(_3107, _3531, _3095);
    float _3539 = fma(_3109, _3531, _3097);
    float _3541 = fma(_3101, _3535, _3099);
    out.m_84.x = _3537;
    out.m_84.y = _3539;
    out.m_84.z = _3541;
    out.m_84.w = _3533;
    bool _3543 = !_3525;
    float _3545 = _3539;
    float _3547 = _3537;
    float _3577;
    float _3583;
    if (!_3543)
    {
        float _3549 = -_3505;
        float _3551 = _3078 + _3549;
        float _3553 = -_3529;
        float _3555 = _3076 + _3553;
        float _3557 = -_3461;
        float _3559 = _3076 + _3557;
        float _3561 = -_3463;
        float _3563 = _3078 + _3561;
        float _3565 = _3551 * _3551;
        float _3567 = fma(_3555, _3555, _3565);
        float _3569 = sqrt(_3567);
        bool _3571 = _3569 > 0.0;
        float _3573 = _3361 * _3471;
        float _3575 = _3573 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        _3547 = _3567;
        _3577 = _3573;
        if (!_3571)
        {
            _3545 = _3575;
        }
        float _3579 = _3545;
        bool _3581 = !_3571;
        _3583 = _3579;
        _3585 = _3581;
        if (!_3585)
        {
            float _3587 = _3563 * _3563;
            float _3589 = fma(_3559, _3559, _3587);
            float _3591 = rsqrt(_3567);
            float _3593 = sqrt(_3589);
            float _3595 = _3555 * _3591;
            float _3597 = _3551 * _3591;
            bool _3599 = _3593 > 0.0;
            float _3601 = _3593;
            _3577 = _3591;
            if (!_3599)
            {
                _3601 = _3575;
            }
            float _3603 = _3601;
            bool _3605 = !_3599;
            _3583 = _3603;
            _3585 = _3605;
            if (!_3585)
            {
                float _3607 = _2556 * _3375;
                float _3609 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3611 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3407);
                float _3613 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3477);
                float _3615 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3475);
                float _3617 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3611);
                float _3619 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3613);
                float _3621 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3615);
                float _3623 = rsqrt(_3589);
                float _3625 = _3609 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3627 = 1.0 / _3617;
                float _3629 = _3563 * _3625;
                float _3631 = _3559 * _3625;
                float _3633 = _3629 * _3629;
                float _3635 = fma(_3631, _3631, _3633);
                float _3637 = _3619 * _3627;
                float _3639 = _3621 * _3627;
                float _3641 = sqrt(_3635);
                float _3643 = _3637 * _3637;
                float _3645 = fma(_3639, _3639, _3643);
                float _3647 = _3563 * _3623;
                float _3649 = _3559 * _3623;
                float _3651 = _3597 * _3647;
                float _3653 = sqrt(_3645);
                float _3655 = fma(_3595, _3649, _3651);
                float _3657 = precise::min(0.0, _3655);
                float _3659 = _3032 * _3657;
                float _3661 = fma(_3641, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3653);
                float _3663 = fma(_3631, _3659, _3070);
                float _3665 = fma(_3629, _3659, _3072);
                float _3667 = 1.0 / _3661;
                out.gl_Position.x = _3663;
                out.gl_Position.y = _3665;
                float _3669 = _3653 * _3667;
                out.m_76.y = _3669;
                _3259 = _3663;
                _3583 = _3575;
                _3547 = _3629;
                _3261 = _3665;
                _3577 = _3659;
                _2666 = _3655;
                _3585 = true;
            }
        }
    }
    else
    {
        float _3671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3671;
        _3259 = 0.0;
        _3583 = 0.0;
        _3261 = 0.0;
        _3577 = _3671;
    }
    _3585 = false;
    float _3673 = _3259;
    float _3675 = _3583;
    float _3677 = _3547;
    float _3679 = _3261;
    float _3681 = _3577;
    float _3683 = _2666;
    bool _3685 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3687 = isnan(_2802);
    bool _3689 = _3685 || _3687;
    bool _3691 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3693 = _3689 || _3691;
    float _3695 = _3677;
    float _3697 = _3681;
    float _3699 = _3679;
    float _3701 = _3673;
    float _3703 = _3683;
    if (!_3693)
    {
        _3695 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3705 = _3695;
    float _3707 = _3705;
    float _3709 = _3705;
    if (!_3693)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3711 = _3263;
    float _3713 = _3711;
    float _3715 = _3711;
    if (!_3693)
    {
        _3697 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3717 = _3697;
    float _3719 = _3717;
    float _3721 = _3717;
    if (!_3693)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3723 = _3699;
    float _3725 = _3723;
    float _3727 = _3723;
    if (!_3693)
    {
        _3701 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3729 = _3701;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3693)
    {
        _3703 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3735 = _3703;
    bool _3737 = !_3693;
    float _3739 = _3735;
    float _3741 = _3735;
    if (!_3737)
    {
        bool _3743 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3745 = isnan(_2802);
        bool _3747 = _3743 || _3745;
        bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3751 = _3747 || _3749;
        if (!_3751)
        {
            float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3755 = _2802 + _3753;
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3765 = 1.0 / _3759;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3783 = _3755 * _3765;
            float _3785 = precise::clamp(_3783, 0.0, 1.0);
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3791 = fma(_3785, _3763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3715 = _3795;
            _3733 = _3799;
            _3709 = _3791;
            _3727 = _3797;
            _3721 = _3793;
            _3741 = _3801;
            _3803 = true;
        }
        else
        {
            bool _3805 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3807 = isnan(_2802);
            bool _3809 = _3805 || _3807;
            bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3813 = _3809 || _3811;
            if (!_3813)
            {
                _3707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3815 = _3707;
            _3709 = _3815;
            if (!_3813)
            {
                _3713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3817 = _3713;
            _3715 = _3817;
            if (!_3813)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3819 = _3719;
            _3721 = _3819;
            if (!_3813)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3821 = _3725;
            _3727 = _3821;
            if (!_3813)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3823 = _3731;
            _3733 = _3823;
            if (!_3813)
            {
                _3739 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3825 = _3739;
            bool _3827 = !_3813;
            _3741 = _3825;
            if (!_3827)
            {
                bool _3829 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3831 = isnan(_2802);
                bool _3833 = _3829 || _3831;
                bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3837 = _3833 || _3835;
                if (!_3837)
                {
                    float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3841 = _2802 + _3839;
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3851 = 1.0 / _3845;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3869 = _3841 * _3851;
                    float _3871 = precise::clamp(_3869, 0.0, 1.0);
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3877 = fma(_3871, _3849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3715 = _3881;
                    _3733 = _3885;
                    _3709 = _3877;
                    _3727 = _3883;
                    _3721 = _3879;
                    _3741 = _3887;
                    _3803 = true;
                }
                else
                {
                    _3715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3741 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3803 = false;
    float _3889 = _3715;
    float _3891 = _3733;
    float _3893 = _3709;
    float _3895 = _3727;
    float _3897 = _3721;
    float _3899 = _3741;
    float _3901 = fma(_3483, -0.5, 0.5);
    float _3903 = precise::clamp(_3901, 0.0, 1.0);
    float _3905 = -_3889;
    float _3907 = _3905 + _3891;
    float _3909 = _3675 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3911 = -_3893;
    float _3913 = _3911 + _3895;
    float _3915 = fma(_3903, _3907, _3889);
    out.m_86.x = 0.0;
    float _3917 = -_3897;
    float _3919 = _3917 + _3899;
    float _3921 = fma(_3903, _3913, _3893);
    float _3923 = _3915 * 0.586610972881317138671875;
    out.m_47.x = _3909;
    bool _3925 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3927 = fma(_3903, _3919, _3897);
    float _3929 = fma(_3921, 0.298911988735198974609375, _3923);
    bool _3931 = _3361 > 0.0;
    bool _3933 = isnan(_3361);
    bool _3935 = _3931 || _3933;
    bool _3937 = isnan(0.0);
    bool _3939 = _3935 || _3937;
    float _3941 = fma(_3927, 0.114477999508380889892578125, _3929);
    bool _3943 = _3471 <= 0.0;
    bool _3945 = !_3939;
    bool _3947 = _3943 || _3945;
    float _3949 = -_3941;
    float _3951 = _3921 + _3949;
    float _3953 = -_3941;
    float _3955 = _3915 + _3953;
    float _3957 = -_3941;
    float _3959 = _3927 + _3957;
    float _3961 = fma(_3951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    float _3963 = fma(_3955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    float _3965 = fma(_3959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    bool _3967 = !_3925;
    if (!_3967)
    {
        float _3969 = -_2774;
        float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3973 = -_2776;
        float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3977 = -_2778;
        float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3981 = _3971 * _3971;
        float _3983 = fma(_3975, _3975, _3981);
        float _3985 = fma(_3979, _3979, _3983);
        float _3987 = sqrt(_3985);
        float _3989 = rsqrt(_3985);
        float _3991 = -_3987;
        float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3995 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3997 = precise::clamp(_3995, 0.0, 1.0);
        float _3999 = _3975 * _3989;
        float _4001 = _3971 * _3989;
        float _4003 = abs(_3997);
        float _4005 = log2(_4003);
        float _4007 = _3979 * _3989;
        float _4009 = _3999 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4011 = _3483 * _4001;
        float _4013 = -_4001;
        float _4015 = -_4009;
        float _4017 = fma(_4013, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4015);
        float _4019 = fma(_3473, _3999, _4011);
        float _4021 = -_4007;
        float _4023 = fma(_4021, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4017);
        float _4025 = fma(_3485, _4007, _4019);
        float _4027 = precise::clamp(_4025, 0.0, 1.0);
        float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4031 = _4023 + _4029;
        float _4033 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4035 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4037 = precise::clamp(_4035, 0.0, 1.0);
        float _4039 = exp2(_4033);
        float _4041 = _4039 * _4037;
        float _4043 = _4027 * _4041;
        float _4045 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4047 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4049 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _4045;
        out.m_86.y = _4047;
        out.m_86.z = _4049;
    }
    out.m_88.x = _3961;
    out.m_88.y = _3963;
    out.m_88.z = _3965;
    if (!_3947)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_47.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4051;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3803 = false;
    bool _3585 = false;
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
        float _4108 = as_type<float>(_123);
        out.gl_Position.z = _4108;
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
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4182 = as_type<float>(_163);
        out.gl_Position.z = _4182;
    }
    if (_155)
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
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_49.x;
    float _189 = in.m_49.y;
    float _191 = in.m_49.z;
    float _193 = _165 * _165;
    float _195 = _167 * _167;
    float _197 = fma(_173, _173, _193);
    float _199 = fma(_175, _175, _195);
    float _201 = fma(_179, _179, _197);
    float _203 = _169 * _169;
    float _205 = fma(_181, _181, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_177, _177, _203);
    float _211 = fma(_183, _183, _209);
    float _213 = sqrt(_205);
    float _215 = sqrt(_211);
    bool _217 = _207 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = 0.0;
    float _223 = _171;
    float _225 = _165;
    if (_217)
    {
        float _227 = rsqrt(_201);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_217)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _215 > 0.0;
    float _237 = 0.0;
    float _239 = _215;
    float _241 = _233;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    int _245 = as_type<int>(_185) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_185) & 2;
    bool _251 = _249 != 0;
    float _253 = _207;
    float _255 = _185;
    float _257 = _243;
    if (_219)
    {
        float _259 = rsqrt(_205);
        _253 = _259;
    }
    float _261 = _253;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = 0.0;
    if (!_219)
    {
        _273 = 0.0;
    }
    float _275 = _273;
    float _277 = 0.0;
    float _279 = _275;
    if (!_219)
    {
        _277 = 0.0;
    }
    float _281 = _277;
    float _283 = _281;
    if (!_219)
    {
        _239 = 0.0;
    }
    float _285 = _239;
    float _287 = _211;
    float _289 = _285;
    if (_235)
    {
        float _291 = rsqrt(_211);
        _287 = _291;
    }
    float _293 = _287;
    if (!_217)
    {
        _255 = 0.0;
    }
    float _295 = _255;
    float _297 = _295;
    if (_217)
    {
        float _299 = _229 * _173;
        _241 = _299;
    }
    float _301 = _241;
    if (_217)
    {
        float _303 = _229 * _165;
        _257 = _303;
    }
    float _305 = _257;
    if (_217)
    {
        float _307 = _229 * _179;
        _297 = _307;
    }
    float _309 = _297;
    float _311 = 0.0;
    if (!_235)
    {
        _311 = 0.0;
    }
    float _313 = _311;
    float _315 = 0.0;
    float _317 = _313;
    if (!_271)
    {
        float _319 = _171 * _171;
        float _321 = _319 * 0.5;
        _315 = _321;
    }
    float _323 = _315;
    float _325 = 0.0;
    float _327 = _323;
    if (!_235)
    {
        _325 = 0.0;
    }
    float _329 = _325;
    float _331 = _329;
    if (_219)
    {
        float _333 = _261 * _175;
        _279 = _333;
    }
    float _335 = _279;
    if (_219)
    {
        float _337 = _261 * _167;
        _283 = _337;
    }
    float _339 = _283;
    if (_219)
    {
        float _341 = _261 * _181;
        _289 = _341;
    }
    float _343 = _289;
    float _345 = _343;
    if (!_271)
    {
        float _347 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _347;
    }
    float _349 = _327;
    float _351 = 0.0;
    float _353 = _349;
    if (!_235)
    {
        _351 = 0.0;
    }
    float _355 = _351;
    bool _357 = !_247;
    float _359 = _357 ? (-0.5) : 0.5;
    float _361 = _355;
    if (_235)
    {
        float _363 = _293 * _177;
        _317 = _363;
    }
    float _365 = _317;
    if (_235)
    {
        float _367 = _293 * _169;
        _331 = _367;
    }
    float _369 = _331;
    if (_235)
    {
        float _371 = _293 * _183;
        _361 = _371;
    }
    float _373 = _361;
    bool _375 = !_251;
    float _377 = _375 ? (-0.5) : 0.5;
    bool _379 = !_271;
    if (!_379)
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
        _353 = _409;
    }
    float _411 = _353;
    float _413 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _415 = !_271;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = 1.0 / _425;
        float _429 = _171 * _421;
        float _431 = exp2(_429);
        float _433 = -_431;
        float _435 = _433 + 1.0;
        float _437 = _435 * _427;
        _223 = _437;
    }
    float _439 = _223;
    float _441 = _413 * _305;
    float _443 = _413 * _339;
    float _445 = _413 * _369;
    float _447 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_271)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _417 = _451;
    }
    float _453 = _417;
    float _455 = fma(_447, _301, _441);
    float _457 = fma(_447, _335, _443);
    float _459 = fma(_447, _365, _445);
    float _461 = _453;
    if (!_271)
    {
        float _463 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _463;
    }
    float _465 = _461;
    bool _467 = !_271;
    float _469 = _465;
    if (!_467)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _477 = _475 + 1.0;
        float _479 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _481 = _143 * _473;
        float _483 = 1.0 / _477;
        float _485 = _479 * 0.693147182464599609375;
        float _487 = exp2(_481);
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
    float _515 = _505 * _305;
    float _517 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _505 * _339;
    float _521 = _505 * _369;
    float _523 = fma(_507, _309, _455);
    float _525 = fma(_517, _301, _515);
    float _527 = fma(_517, _335, _519);
    float _529 = fma(_507, _343, _457);
    float _531 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _533 = fma(_507, _373, _459);
    float _535 = fma(_517, _365, _521);
    float _537 = fma(_439, _187, _523);
    float _539 = fma(_439, _189, _529);
    float _541 = fma(_531, _343, _527);
    float _543 = fma(_439, _191, _533);
    float _545 = fma(_531, _309, _525);
    float _547 = fma(_531, _373, _535);
    if (!_271)
    {
        _345 = _143;
    }
    float _549 = _345;
    bool _551 = !_271;
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
    float _577 = fma(_575, _189, _541);
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _581 = fma(_575, _187, _545);
    float _583 = fma(_575, _191, _547);
    float _585 = -_577;
    float _587 = _539 + _585;
    float _589 = fma(_539, _503, _511);
    float _591 = fma(_537, _503, _509);
    float _593 = -_581;
    float _595 = _537 + _593;
    float _597 = _587 * _175;
    float _599 = _587 * _167;
    float _601 = _587 * _181;
    float _603 = -_583;
    float _605 = _543 + _603;
    float _607 = fma(_595, _173, _597);
    float _609 = fma(_595, _165, _599);
    float _611 = fma(_595, _179, _601);
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
    float _655 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _657 = int(_655);
    bool _659 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _661 = isnan(_647);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _673 = isnan(_647);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = float(_651);
    float _689 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _691 = int(_689);
    float _693 = _681 * _685;
    float _695 = -_681;
    float _697 = _695 + 1.0;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = float(uint(_657));
    float _703 = 1.0 / _687;
    int _705 = ~_657;
    int _707 = _705 + 1;
    float _709 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    int _711 = ~_657;
    int _713 = _711 + 1;
    bool _715 = _657 == 0;
    float _717 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _719 = 1.0 / _701;
    float _721 = float(_691);
    float _723 = -_717;
    float _725 = _723 + 1.0;
    float _727 = _703 * _143;
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _731 = int(_729);
    int _733 = as_type<int>(_719) + (-2);
    float _735 = trunc(_727);
    int _737 = int(_735);
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _741 = _739 != 0;
    float _743 = 1.0 / _721;
    float _745 = float(uint(_731));
    int _747 = ~_731;
    int _749 = _747 + 1;
    int _751 = ~_731;
    int _753 = _751 + 1;
    float _755 = float(uint(_737));
    float _757 = 1.0 / _745;
    float _759 = as_type<float>(_733) * _755;
    float _761 = _743 * _143;
    float _763 = trunc(_759);
    float _765 = precise::max(_763, 0.0);
    uint _768 = uint(_765);
    float _770 = in.m_51.y;
    float _772 = trunc(_761);
    int _774 = int(_772);
    int _776 = as_type<int>(_757) + (-2);
    float _778 = _759;
    if (_741)
    {
        _778 = _129;
    }
    float _780 = _778;
    int _782 = _707 * int(_768);
    int _784 = _782 + _737;
    float _786 = 1.0 / _653;
    float _788 = float(uint(_784));
    float _790 = as_type<float>(_784);
    float _792 = _780;
    if (_741)
    {
        _790 = 1.0;
    }
    float _794 = _790;
    float _796 = float(uint(_774));
    float _798 = as_type<float>(_733) * _788;
    float _800 = _794;
    float _802 = _796;
    if (!_741)
    {
        _800 = 1.2345600128173828125;
    }
    float _804 = _800;
    if (!_741)
    {
        _792 = _770;
    }
    float _806 = _792;
    float _808 = as_type<float>(_776) * _796;
    if (_741)
    {
        _802 = 1.0;
    }
    float _810 = _802;
    float _812 = trunc(_798);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _810;
    if (!_741)
    {
        _818 = 7.345489978790283203125;
    }
    float _820 = _818;
    float _822 = _804 * _806;
    float _824 = float(_731);
    float _826 = _820 * _129;
    float _828 = trunc(_808);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = floor(_826);
    int _836 = ~_731;
    int _838 = _836 + 1;
    int _840 = int(_768) + int(_816);
    int _842 = _838 * int(_832);
    int _844 = _842 + _774;
    float _846 = floor(_822);
    int _848 = _713 * _840;
    int _850 = _848 + _737;
    float _852 = float(uint(_844));
    float _854 = -_834;
    float _856 = _826 + _854;
    bool _858 = uint(_850) >= uint(_657);
    float _860 = as_type<float>(_776) * _852;
    float _862 = float(_657);
    float _864 = _786 * _143;
    float _866 = trunc(_860);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    float _872 = _856 * _862;
    bool _874 = !_858;
    int _876 = _874 ? 0 : (-1);
    float _878 = -_846;
    float _880 = _822 + _878;
    float _882 = float(_737);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _886 = _884 != 0;
    float _888 = trunc(_872);
    int _890 = int(_888);
    bool _892 = _882 >= _862;
    bool _894 = isnan(_882);
    bool _896 = _892 || _894;
    bool _898 = isnan(_862);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _862 * _864;
    int _906 = ~_840;
    int _908 = _906 + _876;
    int _910 = _908 + 1;
    float _912 = _824 * _864;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    float _918 = _880 * _824;
    float _920 = float(_774);
    float _922 = trunc(_902);
    int _924 = int(_922);
    int _926 = abs(_916);
    bool _928 = _920 >= _824;
    bool _930 = isnan(_920);
    bool _932 = _928 || _930;
    bool _934 = isnan(_824);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    int _940 = int(_832) + int(_870);
    int _942 = _890 * _926;
    int _944 = _942 + _737;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _948 = _946 != 0;
    int _950 = _657 * _910;
    int _952 = _950 + _737;
    int _954 = _749 * _940;
    int _956 = _954 + _774;
    float _958 = trunc(_918);
    int _960 = int(_958);
    bool _962 = !_948;
    int _964 = _962 ? 0 : 1;
    float _966 = _589 * _167;
    bool _968 = !_715;
    int _970 = _968 ? _952 : (-1);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _982 = _980 != 0;
    bool _984 = uint(_956) >= uint(_731);
    float _986 = trunc(_904);
    int _988 = int(_986);
    int _990 = ~_924;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    bool _996 = !_984;
    int _998 = _996 ? 0 : (-1);
    int _1000 = abs(_964);
    int _1002 = _970 * _994;
    bool _1004 = !_978;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = trunc(_938);
    int _1010 = int(_1008);
    int _1012 = _657 + (-1);
    int _1014 = ~_940;
    int _1016 = _1014 + _998;
    int _1018 = _1016 + 1;
    int _1020 = abs(_1006);
    int _1022 = _924 * _1012;
    int _1024 = _1022 + _1002;
    bool _1026 = !_974;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _960 * _1000;
    int _1032 = _1030 + _774;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1036 = _1034 != 0;
    int _1038 = _731 * _1018;
    int _1040 = _1038 + _774;
    bool _1042 = !_982;
    int _1044 = _1042 ? 0 : 1;
    int _1046 = _1024 * _1020;
    int _1048 = abs(_1028);
    float _1050 = trunc(_912);
    int _1052 = int(_1050);
    bool _1054 = _731 == 0;
    float _1056 = in.m_51.w;
    int _1058 = abs(_1044);
    int _1060 = _988 * _1048;
    int _1062 = _1060 + _1046;
    bool _1064 = !_1036;
    int _1066 = _1064 ? 0 : 1;
    int _1068 = ~_1010;
    int _1070 = _1068 + 1;
    int _1072 = _1070 + 1;
    bool _1074 = !_1054;
    int _1076 = _1074 ? _1040 : (-1);
    float _1078 = _589 * _175;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1094 = _1092 != 0;
    int _1096 = _1076 * _1072;
    int _1098 = abs(_1066);
    int _1100 = _944 * _1058;
    int _1102 = _1100 + _1062;
    int _1104 = _731 + (-1);
    float _1106 = fma(_591, _173, _1078);
    float _1108 = _770 * 2.0;
    bool _1110 = !_1086;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1010 * _1104;
    int _1116 = _1114 + _1096;
    bool _1118 = !_1082;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _890 * _1098;
    int _1124 = _1122 + _1102;
    int _1126 = abs(_1112);
    bool _1128 = !_1090;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = abs(_1120);
    bool _1134 = !_1094;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = abs(_1130);
    int _1140 = _1116 * _1126;
    float _1142 = float(uint(_1124));
    float _1144 = _589 * _181;
    int _1146 = abs(_1136);
    int _1148 = _1052 * _1132;
    int _1150 = _1148 + _1140;
    float _1152 = as_type<float>(_733) * _1142;
    float _1154 = in.m_51.z;
    int _1156 = ~_731;
    int _1158 = _1156 + 1;
    int _1160 = _1032 * _1138;
    int _1162 = _1160 + _1150;
    int _1164 = ~_657;
    int _1166 = _1164 + 1;
    float _1168 = trunc(_1152);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = _657 == 0;
    int _1176 = _960 * _1146;
    int _1178 = _1176 + _1162;
    int _1180 = ~_657;
    int _1182 = _1180 + 1;
    float _1184 = float(uint(_1178));
    float _1186 = as_type<float>(_776) * _1184;
    int _1188 = _1182 * int(_1172);
    int _1190 = _1188 + _1124;
    float _1192 = trunc(_1186);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = float(uint(_1190));
    float _1200 = as_type<float>(_733) * _1198;
    float _1202 = trunc(_1200);
    float _1204 = precise::max(_1202, 0.0);
    uint _1206 = uint(_1204);
    int _1208 = _1158 * int(_1196);
    int _1210 = _1208 + _1178;
    float _1212 = float(uint(_1210));
    float _1214 = as_type<float>(_776) * _1212;
    int _1216 = int(_1172) + int(_1206);
    float _1218 = trunc(_1214);
    float _1220 = precise::max(_1218, 0.0);
    uint _1222 = uint(_1220);
    int _1224 = ~_731;
    int _1226 = _1224 + 1;
    int _1228 = _1166 * _1216;
    int _1230 = _1228 + _1124;
    bool _1232 = uint(_1230) >= uint(_657);
    bool _1234 = !_1232;
    int _1236 = _1234 ? 0 : (-1);
    int _1238 = int(_1196) + int(_1222);
    int _1240 = ~_1216;
    int _1242 = _1240 + _1236;
    int _1244 = _1242 + 1;
    float _1246 = float(uint(_944));
    int _1248 = _657 * _1244;
    int _1250 = _1248 + _1124;
    int _1252 = _1226 * _1238;
    int _1254 = _1252 + _1178;
    float _1256 = as_type<float>(_733) * _1246;
    bool _1258 = !_1174;
    int _1260 = _1258 ? _1250 : (-1);
    bool _1262 = uint(_1254) >= uint(_731);
    float _1264 = trunc(_1256);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    int _1270 = _1260 & 3;
    bool _1272 = _1270 != 0;
    bool _1274 = !_1262;
    int _1276 = _1274 ? 0 : (-1);
    bool _1278 = uint(_1270) > 1u;
    int _1280 = _1260 & 3;
    bool _1282 = _1280 != 0;
    int _1284 = ~_1238;
    int _1286 = _1284 + _1276;
    int _1288 = _1286 + 1;
    int _1290 = _1282 ? 0 : 1;
    bool _1292 = _1270 != 3;
    int _1294 = _731 * _1288;
    int _1296 = _1294 + _1178;
    int _1298 = ~_1290;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = _129 * 2.0;
    bool _1306 = uint(_1270) >= 2u;
    int _1308 = _1302;
    float _1310 = _1108;
    if (!_1278)
    {
        int _1312 = ~_1290;
        int _1314 = _1312 + 1;
        _1308 = _1314;
    }
    int _1316 = _1308;
    float _1318 = floor(_1304);
    float _1320 = float(uint(_1032));
    int _1322 = _1306 ? 0 : 1;
    bool _1324 = !_1054;
    int _1326 = _1324 ? _1296 : (-1);
    float _1328 = as_type<float>(_776) * _1320;
    int _1330 = ~_1322;
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1334;
    if (_1292)
    {
        int _1338 = ~_1322;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = trunc(_1328);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    int _1350 = _1326 & 3;
    bool _1352 = _1350 != 0;
    int _1354 = _1326 & 3;
    bool _1356 = _1354 != 0;
    int _1358 = ~_657;
    int _1360 = _1358 + 1;
    bool _1362 = uint(_1350) >= 2u;
    int _1364 = _1356 ? 0 : 1;
    int _1366 = _1360 * int(_1268);
    int _1368 = _1366 + _944;
    bool _1370 = uint(_1350) > 1u;
    int _1372 = _1362 ? 0 : 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1376 = _1374 != 0;
    bool _1378 = _1350 != 3;
    float _1380 = floor(_1108);
    float _1382 = float(uint(_1368));
    int _1384 = _753 * int(_1348);
    int _1386 = _1384 + _1032;
    int _1388 = ~_1364;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    int _1394 = ~_1372;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    float _1400 = as_type<float>(_733) * _1382;
    float _1402 = float(uint(_1386));
    int _1404 = _1392;
    int _1406 = as_type<int>(_1382);
    int _1408 = _1398;
    if (!_1370)
    {
        int _1410 = ~_1364;
        int _1412 = _1410 + 1;
        _1404 = _1412;
    }
    int _1414 = _1404;
    float _1416 = as_type<float>(_776) * _1402;
    bool _1418 = _129 > 0.5;
    float _1420 = trunc(_1400);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    if (_1376)
    {
        _1406 = 0;
    }
    int _1426 = _1406;
    int _1428 = _1426;
    if (_1378)
    {
        int _1430 = ~_1372;
        int _1432 = _1430 + 1;
        _1408 = _1432;
    }
    int _1434 = _1408;
    if (!_1376)
    {
        _1428 = 1;
    }
    int _1436 = _1428;
    int _1438 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1440 = _1438 != 0;
    float _1442 = trunc(_1416);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    float _1448 = -_359;
    int _1450 = _1418 ? as_type<int>(_1448) : as_type<int>(_359);
    bool _1452 = _770 > 0.5;
    bool _1454 = !_1440;
    float _1456 = _1454 ? _359 : as_type<float>(_1450);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1460 = _1458 != 0;
    float _1462 = -_377;
    float _1464 = _1452 ? _1462 : _377;
    bool _1466 = _1154 > 0.5;
    bool _1468 = _1056 > 0.5;
    float _1470 = fma(_591, _165, _966);
    bool _1472 = !_1460;
    float _1474 = _1472 ? _377 : _1464;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    float _1480 = -_359;
    int _1482 = _1466 ? as_type<int>(_1480) : as_type<int>(_359);
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1486 = _1484 != 0;
    float _1488 = -_377;
    int _1490 = _1468 ? as_type<int>(_1488) : as_type<int>(_377);
    bool _1492 = !_1478;
    float _1494 = _1492 ? _359 : as_type<float>(_1482);
    bool _1496 = _1436 != 1;
    bool _1498 = _1318 > 0.0;
    float _1500 = _1494 + 0.5;
    bool _1502 = !_1486;
    float _1504 = _1502 ? _377 : as_type<float>(_1490);
    bool _1506 = _1318 >= 0.0;
    bool _1508 = isnan(_1318);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    int _1516 = int(_1268) + int(_1424);
    int _1518 = ~_657;
    int _1520 = _1518 + 1;
    int _1522 = _1514 ? 0 : 1;
    int _1524 = ~_731;
    int _1526 = _1524 + 1;
    int _1528 = _1520 * _1516;
    int _1530 = _1528 + _944;
    int _1532 = int(_1348) + int(_1446);
    int _1534 = ~_1522;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = _1464;
    float _1542 = as_type<float>(_1446);
    int _1544 = _1538;
    if (!_1496)
    {
        _225 = _770;
    }
    float _1546 = _225;
    float _1548 = _1546;
    if (!_1496)
    {
        _1540 = _770;
    }
    float _1550 = _1540;
    float _1552 = _1550;
    if (!_1496)
    {
        _1542 = _1154;
    }
    float _1554 = _1542;
    float _1556 = _1554;
    if (!_1496)
    {
        _1310 = _1154;
    }
    float _1558 = _1310;
    float _1560 = _1558;
    if (_1496)
    {
        _1548 = _129;
    }
    float _1562 = _1548;
    if (_1496)
    {
        _1552 = _129;
    }
    float _1564 = _1552;
    if (_1496)
    {
        _1556 = _770;
    }
    float _1566 = _1556;
    if (_1496)
    {
        _1560 = _770;
    }
    float _1568 = _1560;
    if (!_1498)
    {
        int _1570 = ~_1522;
        int _1572 = _1570 + 1;
        _1544 = _1572;
    }
    int _1574 = _1544;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1578 = _1380 > 0.0;
    bool _1580 = _1380 >= 0.0;
    bool _1582 = isnan(_1380);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    bool _1590 = uint(_1530) >= uint(_657);
    int _1592 = _1526 * _1532;
    int _1594 = _1592 + _1032;
    float _1596 = fma(_591, _179, _1144);
    int _1598 = _1588 ? 0 : 1;
    bool _1600 = uint(_1594) >= uint(_731);
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1610 = !_1590;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1614;
    float _1618 = 1.0 / _1604;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1622 = _1620 != 0;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1626 = _1624 != 0;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1630 = _1628 != 0;
    float _1632 = fma(_613, _183, _1596);
    int _1634 = ~_1598;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1644 = !_1272;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = in.m_57.w;
    int _1650 = _1638;
    if (!_1578)
    {
        int _1652 = ~_1598;
        int _1654 = _1652 + 1;
        _1650 = _1654;
    }
    int _1656 = _1650;
    float _1658 = 1.0 / _1608;
    float _1660 = fma(_613, _177, _1106);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1664 = _647 + _1662;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1672 = _647 + _1670;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1676 = _1674 != 0;
    float _1678 = fma(_613, _169, _1470);
    float _1680 = 1.0 / _1616;
    float _1682 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1686 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1688 = _1672 * _1618;
    float _1690 = fma(_1682, -2.0, _1684);
    float _1692 = 1.0 / _1642;
    float _1694 = _1154 * 2.0;
    float _1696 = in.m_55.w;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1700 = _1664 * _1658;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1704 = _647 + _1702;
    bool _1706 = !_1600;
    int _1708 = _1706 ? 0 : (-1);
    float _1710 = -_1698;
    float _1712 = fma(_1686, 2.0, _1710);
    float _1714 = floor(_1694);
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1718 = _647 + _1716;
    float _1720 = _129 + _770;
    float _1722 = _1660 + _1648;
    float _1724 = -_143;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1712);
    float _1728 = _1718 * _1680;
    float _1730 = _1720 + (-1.0);
    float _1732 = in.m_59.w;
    float _1734 = _1704 * _1692;
    float _1736 = _129 + _1154;
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1740 = _1154 + _770;
    float _1742 = _1736 + (-1.0);
    bool _1744 = !_1626;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1690);
    bool _1750 = _1714 >= 0.0;
    bool _1752 = isnan(_1714);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan(0.0);
    bool _1758 = _1754 || _1756;
    float _1760 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1762 = _1678 + _1696;
    int _1764 = _1758 ? 0 : 1;
    float _1766 = _1740 + (-1.0);
    bool _1768 = _1714 > 0.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1774;
    bool _1778 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1780 = isnan(_647);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1792 = fma(_1772, _1688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1794 = fma(_1776, _1688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1804 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1806 = isnan(_647);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = -_1788;
    float _1818 = _1816 + 1.0;
    float _1820 = fma(_1798, _1700, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1822 = _1632 + _1732;
    float _1824 = fma(_1802, _1700, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1826 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1828 = isnan(_647);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1834 = _1830 || _1832;
    float _1836 = float(_1834);
    float _1838 = _1814 * _1818;
    float _1840 = -_1814;
    float _1842 = _1840 + 1.0;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1846 = _1722 + _1844;
    float _1848 = _1836 * _1842;
    float _1850 = -_1836;
    float _1852 = _1850 + 1.0;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1854;
    bool _1858 = !_1622;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1862;
    float _1866 = _669 * _1852;
    float _1868 = fma(_1856, _1728, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1870 = _1456 + 0.5;
    float _1872 = fma(_1864, _1728, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1874 = _1792 * _693;
    float _1876 = _1794 * _693;
    int _1878 = abs(_1746);
    float _1880 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1726);
    float _1882 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1874);
    float _1884 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1876);
    float _1886 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1888 = log2(_1886);
    float _1890 = fma(_1820, _1866, _1882);
    float _1892 = float(_1878);
    float _1894 = fma(_1824, _1866, _1884);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1898 = _1474 + (-0.5);
    float _1900 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1896);
    float _1902 = float(_1574);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1906 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1908 = _1326 >> 31;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1762 + _1910;
    float _1914 = _1892 * _1902;
    float _1916 = -_1904;
    float _1918 = fma(_1906, 2.0, _1916);
    int _1920 = abs(_1860);
    float _1922 = _1888 * _143;
    int _1924 = _1260 >> 31;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1928 = _1908 & 3;
    float _1930 = -_1898;
    float _1932 = -_1748;
    float _1934 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1932);
    int _1936 = _1924 & 3;
    float _1938 = exp2(_1922);
    int _1940 = _1326 + _1928;
    float _1942 = fma(_1872, _1848, _1894);
    int _1944 = _1260 + _1936;
    float _1946 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1948 = !_1352;
    int _1950 = _1948 ? 0 : 1;
    float _1952 = fma(_1576, -2.0, _1926);
    int _1954 = _1944 >> 2;
    float _1956 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1946);
    bool _1958 = _1270 != 3;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1962 = _1822 + _1960;
    int _1964 = _1940 >> 2;
    float _1966 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1900);
    int _1968 = ~_1764;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1956);
    int _1976 = _1954 << 4;
    int _1978 = _1976 + 368;
    float _1980 = -_1938;
    float _1982 = _1980 + 1.0;
    int _1984 = _1972;
    if (!_1768)
    {
        int _1986 = ~_1764;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    float _1992 = _129 + (-0.5);
    bool _1994 = !_1958;
    int _1996 = _1994 ? 0 : (-1);
    bool _1998 = _1350 != 3;
    uint _2000 = uint(int(uint(_1978) >> uint(2)));
    uint _2002 = uint(int(uint(int(_2000)) >> uint(2)));
    int _2004 = int(_2000) & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = int(_2000) + 1;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    int _2012 = _2008 & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = _1964 << 4;
    int _2018 = _2016 + 512;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2030 = _2026 || _2028;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2034 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2020);
    float _2036 = _2030 ? _1982 : 0.0;
    uint _2038 = uint(int(uint(_2018) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    int _2046 = int(_2038) + 1;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    int _2050 = _2046 & 3;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[int(_2048)][_2050];
    float _2054 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2032);
    float _2056 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2034);
    float _2058 = -_143;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1918);
    bool _2062 = _1974 >= 0.0;
    float _2064 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2054);
    float _2066 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1952);
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2070 = 1.0 + _2068;
    int _2072 = _1978 + 8;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    uint _2076 = uint(int(uint(int(_2074)) >> uint(2)));
    int _2078 = int(_2074) & 3;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[int(_2076)][_2078];
    int _2082 = int(_2074) + 1;
    uint _2084 = uint(int(uint(_2082) >> uint(2)));
    int _2086 = _2082 & 3;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[int(_2084)][_2086];
    bool _2090 = !_1998;
    int _2092 = _2090 ? 0 : (-1);
    float _2094 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2060);
    bool _2096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2098 = isnan(1.0);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2104 = _2100 || _2102;
    float _2106 = 1.0 / _2070;
    float _2108 = float(_1920);
    int _2110 = _2018 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = float(_1990);
    if (_2062)
    {
        out.m_47.x = 0.0;
    }
    float _2130 = 0.0;
    if (_2062)
    {
        _2130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2132 = _2130;
    int _2134 = ~_1516;
    int _2136 = _2134 + _1612;
    int _2138 = _2136 + 1;
    float _2140 = _2108 * _2128;
    int _2142 = abs(_1316);
    float _2144 = in.m_66.x;
    float _2146 = in.m_66.y;
    float _2148 = in.m_66.z;
    int _2150 = abs(_1646);
    float _2152 = _2140 * (-2.0);
    int _2154 = as_type<int>(_2140);
    if (_2062)
    {
        float _2156 = _2132 * 5.0;
        _2154 = as_type<int>(_2156);
    }
    int _2158 = _2154;
    int _2160 = abs(_1414);
    if (_2104)
    {
        float _2162 = _2036 * _2106;
        _145 = _2162;
    }
    float _2164 = _145;
    int _2166 = ~_2142;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = abs(_1950);
    int _2174 = _657 * _2138;
    int _2176 = _2174 + _944;
    int _2178 = abs(_2092);
    float _2180 = _1504 + (-0.5);
    if (_2062)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7083 = as_type<float>(_2158);
        out.gl_Position.z = _7083;
    }
    int _2182 = ~_1532;
    int _2184 = _2182 + _1708;
    int _2186 = _2184 + 1;
    float _2188 = fma(_1738, _2152, _1738);
    bool _2190 = _657 == 0;
    int _2192 = _2170 * as_type<int>(_2014);
    bool _2194 = _731 == 0;
    int _2196 = _731 * _2186;
    int _2198 = _2196 + _1032;
    bool _2200 = !_2190;
    int _2202 = _2200 ? _2176 : (-1);
    float _2204 = -_2180;
    float _2206 = -_2066;
    float _2208 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2206);
    bool _2210 = !_2194;
    int _2212 = _2210 ? _2198 : (-1);
    float _2214 = _1912 * _1912;
    int _2216 = ~_2160;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = fma(_2152, _2144, _2144);
    int _2224 = ~_2150;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_1846, _1846, _2214);
    int _2232 = ~_2172;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2220 * as_type<int>(_2052);
    float _2240 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2222);
    int _2242 = _2228 * as_type<int>(_2006);
    int _2244 = _2242 + _2192;
    int _2246 = abs(_1342);
    int _2248 = _2236 * as_type<int>(_2044);
    int _2250 = _2248 + _2238;
    int _2252 = abs(_1434);
    float _2254 = fma(_1962, _1962, _2230);
    int _2256 = ~_2246;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    bool _2262 = !_1668;
    int _2264 = _2262 ? 0 : 1;
    float _2266 = rsqrt(_2254);
    int _2268 = ~_2252;
    int _2270 = _2268 + 1;
    int _2272 = _2270 + 1;
    int _2274 = _2260 * as_type<int>(_2080);
    int _2276 = _2274 + _2244;
    int _2278 = abs(_1996);
    int _2280 = abs(_2264);
    int _2282 = _2272 * as_type<int>(_2118);
    int _2284 = _2282 + _2250;
    bool _2286 = !_1676;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = ~_2278;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2178;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    int _2302 = _2294 * as_type<int>(_2088);
    int _2304 = _2302 + _2276;
    int _2306 = abs(_2288);
    float _2308 = _1912 * _2266;
    int _2310 = ~_2280;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2300 * as_type<int>(_2126);
    int _2318 = _2316 + _2284;
    int _2320 = ~_2306;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = _1846 * _2266;
    float _2328 = -_2308;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    int _2332 = _2304 * _2314;
    float _2334 = -_2064;
    float _2336 = _2334 + 1.0;
    int _2338 = _2318 * _2324;
    float _2340 = -_2056;
    float _2342 = _2340 + 1.0;
    int _2344 = _2202 * _2280;
    int _2346 = _2344 + _2332;
    float _2348 = -_2326;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    int _2352 = _2212 * _2306;
    int _2354 = _2352 + _2338;
    float _2356 = -_1966;
    float _2358 = _2356 + 1.0;
    float _2360 = _2330 * _2330;
    float _2362 = -_725;
    float _2364 = fma(_1456, _2362, _1880);
    float _2366 = fma(_1474, _2336, _1934);
    float _2368 = _1962 * _2266;
    float _2370 = -_2358;
    float _2372 = fma(_1494, _2370, _2094);
    float _2374 = fma(_1504, _2342, _2208);
    float _2376 = float(_2346);
    float _2378 = fma(_2350, _2350, _2360);
    float _2380 = float(_2354);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    bool _2386 = !_1630;
    int _2388 = _2386 ? 0 : 1;
    out.m_68.x = _2364;
    out.m_68.y = _2366;
    out.m_68.z = _2372;
    out.m_68.w = _2374;
    float _2390 = fma(_2384, _2384, _2378);
    int _2392 = abs(_2388);
    out.m_70.x = _2376;
    out.m_70.y = _2380;
    float _2394 = _2148;
    if (_2062)
    {
        return out;
    }
    float _2396 = -_2308;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _2400 = -_2326;
    float _2402 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _2404 = -_2368;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _2408 = float(_1656);
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2412 = _2398 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2402 + _2414;
    float _2418 = float(_2392);
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2422 = _2406 + _2420;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2426 = _1914 * (-2.0);
    float _2428 = fma(_2188, _2164, _2240);
    float _2430 = _2418 * _2408;
    float _2432 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2424);
    float _2434 = _770 + (-0.5);
    float _2436 = fma(_2426, _2146, _2146);
    float _2438 = _2430 * (-2.0);
    float _2440 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2432);
    float _2442 = _2428 * 0.15915493667125701904296875;
    float _2444 = fma(_1790, _2426, _1790);
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2436);
    float _2448 = fma(_2438, _2148, _2148);
    bool _2450 = _2440 >= 0.0;
    float _2452 = _1154 + (-0.5);
    float _2454 = fma(_1760, _2438, _1760);
    float _2456 = fma(_2444, _2164, _2446);
    float _2458 = in.m_64.x;
    float _2460 = in.m_64.y;
    float _2462 = fma(_2452, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2448);
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2468 = _2456 * 0.15915493667125701904296875;
    float _2470 = fma(_1868, _1848, _1890);
    float _2472 = sqrt(_2390);
    float _2474 = fma(_2466, _1734, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2478 = _2476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2480 = _2416;
    if (_2450)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2482 = _2394;
    float _2484 = fma(_2474, _1838, _1942);
    float _2486 = fma(_2454, _2164, _2462);
    int _2488 = as_type<int>(_2482);
    if (_2450)
    {
        out.m_47.x = 0.0;
    }
    float _2490 = _2442 * 6.283185482025146484375;
    float _2492 = sin(_2490);
    if (_2450)
    {
        float _2494 = _2482 * 5.0;
        _2488 = as_type<int>(_2494);
    }
    int _2496 = _2488;
    float _2498 = fma(_2478, _1734, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2500 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2484);
    float _2502 = _2486 * 0.15915493667125701904296875;
    if (_2450)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7578 = as_type<float>(_2496);
        out.gl_Position.z = _7578;
    }
    float _2504 = _2442 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    float _2508 = _2468 * 6.283185482025146484375;
    float _2510 = sin(_2508);
    float _2512 = _2468 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    if (_2450)
    {
        return out;
    }
    float _2516 = _2500 * _2460;
    float _2518 = _2502 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    float _2522 = fma(_2498, _1838, _2470);
    float _2524 = _2266 * _2472;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _377);
    float _2530 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2522);
    float _2532 = _2492 * _2510;
    float _2534 = _2524 * _2526;
    float _2536 = _2502 * 6.283185482025146484375;
    float _2538 = sin(_2536);
    float _2540 = _2530 * _2458;
    float _2542 = _2506 * _2514;
    float _2544 = _2528 * _2534;
    float _2546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _359);
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2550 = _2492 * _2514;
    float _2552 = _2506 * _2510;
    float _2554 = _2506 * _2520;
    float _2556 = _2548 * _2524;
    float _2558 = _2514 * _2520;
    float _2560 = _2492 * _2520;
    float _2562 = _2510 * _2520;
    float _2564 = _2556 * _2546;
    float _2566 = _2554 * _2544;
    float _2568 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2570 = _2568 * 0.5;
    float _2572 = fma(_2538, _2542, _2532);
    float _2574 = -_2550;
    float _2576 = fma(_2538, _2552, _2574);
    float _2578 = -_2544;
    float _2580 = _2538 * _2578;
    float _2582 = -_2552;
    float _2584 = fma(_2538, _2550, _2582);
    float _2586 = fma(_2572, _2564, _2566);
    float _2588 = _2560 * _2544;
    float _2590 = fma(_2558, _2564, _2580);
    float _2592 = fma(_2538, _2532, _2542);
    float _2594 = fma(_2576, _2570, _2586);
    float _2596 = fma(_2584, _2564, _2588);
    float _2598 = fma(_2562, _2570, _2590);
    float _2600 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2592, _2570, _2596);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2606 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2608 = isnan(0.5);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2614 = _2610 || _2612;
    float _2616 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2618 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2620 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2622 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2616);
    float _2624 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2618);
    float _2626 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2620);
    float _2628 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2630 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2632 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2626);
    float _2634 = _1822 + _2628;
    float _2636 = _1722 + _2630;
    float _2638 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2642 = _2634 + _2640;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2646 = _2636 + _2644;
    float _2648 = _1762 + _2638;
    float _2650 = _2642 * _2642;
    float _2652 = fma(_2646, _2646, _2650);
    float _2654 = sqrt(_2652);
    bool _2656 = _2654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2602;
    float _2660 = _2550;
    float _2662 = _2636;
    float _2664 = _2648;
    float _2666 = _2556;
    if (!_2656)
    {
        _2658 = _2634;
    }
    float _2668 = _2658;
    float _2670 = _2668;
    if (!_2656)
    {
        _2660 = _2648;
    }
    float _2672 = _2660;
    bool _2674 = !_2656;
    float _2676 = _2672;
    if (!_2674)
    {
        float _2678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2682 = _2654 + _2680;
        float _2684 = rsqrt(_2652);
        float _2686 = _2682 * _2678;
        float _2688 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2690 = _2686 * 0.15915493667125701904296875;
        float _2692 = _2690 * 6.283185482025146484375;
        float _2694 = sin(_2692);
        float _2696 = _2690 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = fma(_2694, _2688, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2702 = _2684 * _2700;
        float _2704 = _2698 + (-1.0);
        float _2706 = fma(_2646, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2708 = fma(_2642, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2710 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2712 = fma(_2648, _2698, _2710);
        _2662 = _2706;
        _2676 = _2712;
        _2670 = _2708;
    }
    float _2714 = _2662;
    float _2716 = _2676;
    float _2718 = _2670;
    float _2720 = -_2326;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2714);
    float _2724 = -_2308;
    float _2726 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2716);
    float _2728 = -_2368;
    float _2730 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2718);
    float _2732 = _2726;
    float _2734 = _2722;
    float _2736 = _2730;
    if (!_2614)
    {
        float _2738 = _2412 * _2412;
        float _2740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2742 = -_1822;
        float _2744 = _2742 + _2718;
        float _2746 = fma(_2416, _2416, _2738);
        float _2748 = fma(_2422, _2422, _2746);
        float _2750 = 1.0 / _2524;
        float _2752 = sqrt(_2748);
        float _2754 = precise::min(_2752, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2756 = _2754 * _2740;
        float _2758 = -_1722;
        float _2760 = _2758 + _2714;
        float _2762 = _2756 * _2750;
        float _2764 = -_1762;
        float _2766 = _2764 + _2716;
        float _2768 = fma(_2760, _2762, _2402);
        float _2770 = fma(_2766, _2762, _2398);
        float _2772 = fma(_2744, _2762, _2406);
        _2732 = _2770;
        _2734 = _2768;
        _2736 = _2772;
    }
    float _2774 = _2732;
    float _2776 = _2734;
    float _2778 = _2736;
    float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2782 = _2774 + _2780;
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2786 = _2776 + _2784;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2790 = _2778 + _2788;
    float _2792 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2794 = _2782 * _2782;
    float _2796 = fma(_2786, _2786, _2794);
    float _2798 = fma(_2790, _2790, _2796);
    float _2800 = rsqrt(_2798);
    float _2802 = sqrt(_2798);
    float _2804 = _2800 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2806 = _2786 * _2804;
    float _2808 = _2790 * _2804;
    float _2810 = _2806 * _2806;
    float _2812 = _2808 * _2808;
    float _2814 = _2810 + _2812;
    float _2816 = sqrt(_2814);
    bool _2818 = _2816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2822 = _2816 + _2820;
    float _2824 = _2790;
    float _2826 = _2814;
    float _2828 = _2822;
    float _2830 = _2804;
    if (_2818)
    {
        float _2832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _2832;
    }
    float _2834 = _2824;
    if (_2818)
    {
        float _2836 = rsqrt(_2814);
        _2826 = _2836;
    }
    float _2838 = _2826;
    float _2840 = _2838;
    if (_2818)
    {
        float _2842 = _2822 * _2834;
        _2828 = _2842;
    }
    float _2844 = _2828;
    if (_2818)
    {
        float _2846 = _2844 * 0.15915493667125701904296875;
        _2480 = _2846;
    }
    float _2848 = _2480;
    float _2850 = _2834;
    if (_2818)
    {
        float _2852 = _2848 * 6.283185482025146484375;
        float _2854 = sin(_2852);
        _2850 = _2854;
    }
    float _2856 = _2850;
    float _2858 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2860 = precise::max(0.0, _2858);
    float _2862 = _2794;
    float _2864 = _2860;
    if (_2818)
    {
        float _2866 = _2848 * 6.283185482025146484375;
        float _2868 = cos(_2866);
        _2862 = _2868;
    }
    float _2870 = _2862;
    float _2872 = -_2804;
    float _2874 = -_2860;
    float _2876 = fma(_2782, _2872, _2874);
    float _2878 = _2876;
    if (_2818)
    {
        float _2880 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2864 = _2880;
    }
    float _2882 = _2864;
    float _2884 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2886 = _2856;
    float _2888 = _2882;
    if (_2818)
    {
        float _2890 = fma(_2856, _2882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2886 = _2890;
    }
    float _2892 = _2886;
    float _2894 = _2892;
    float _2896 = _2870;
    if (_2818)
    {
        float _2898 = _2870 + (-1.0);
        _2888 = _2898;
    }
    float _2900 = _2888;
    float _2902 = _2900;
    if (_2818)
    {
        float _2904 = _2838 * _2892;
        _2664 = _2904;
    }
    float _2906 = _2664;
    if (!_2818)
    {
        _2894 = _2806;
    }
    float _2908 = _2894;
    float _2910 = _2908;
    if (_2818)
    {
        float _2912 = _2900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2830 = _2912;
    }
    float _2914 = _2830;
    if (_2818)
    {
        float _2916 = _2806 * _2906;
        _2910 = _2916;
    }
    float _2918 = _2910;
    if (!_2818)
    {
        _2902 = _2808;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    if (_2818)
    {
        float _2924 = _2808 * _2906;
        _2922 = _2924;
    }
    float _2926 = _2922;
    if (!_2818)
    {
        _2840 = _2810;
    }
    float _2928 = _2840;
    float _2930 = _2928;
    if (_2818)
    {
        float _2932 = fma(_2876, _2870, _2914);
        _2878 = _2932;
    }
    float _2934 = _2878;
    if (_2818)
    {
        float _2936 = _2918 * _2918;
        _2930 = _2936;
    }
    float _2938 = _2930;
    if (!_2818)
    {
        _2896 = _2812;
    }
    float _2940 = _2896;
    float _2942 = _2940;
    if (_2818)
    {
        float _2944 = _2926 * _2926;
        _2942 = _2944;
    }
    float _2946 = _2942;
    float _2948 = fma(_2934, _2934, _2938);
    float _2950 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2952 = _2948 + _2946;
    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2956 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2954);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2884);
    float _2962 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2964 = rsqrt(_2952);
    float _2966 = -_2958;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2960);
    float _2972 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2974 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2962);
    float _2976 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2950);
    float _2978 = _2970 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2980 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2972);
    float _2982 = abs(_2968);
    float _2984 = log2(_2982);
    float _2986 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2974);
    float _2988 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2976);
    float _2990 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2980);
    float _2992 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2994 = _2986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2996 = _2988 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2998 = _2990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3000 = _2964 * _2918;
    float _3002 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2964 * _2934;
    float _3006 = _2964 * _2926;
    float _3008 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3010 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3012 = -_2992;
    float _3014 = fma(_3012, _2792, 1.0);
    float _3016 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3018 = -_3008;
    float _3020 = fma(_3004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3018);
    float _3022 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3010);
    float _3024 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3026 = log2(_3014);
    float _3028 = -_3006;
    float _3030 = fma(_3028, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3020);
    float _3032 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3022);
    float _3034 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3036 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3024);
    float _3038 = fma(_3030, -0.5, 0.5);
    float _3040 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3034);
    float _3042 = exp2(_3016);
    float _3044 = _3004 + 1.0;
    float _3046 = fma(_3030, 0.5, 0.5);
    float _3048 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3040);
    float _3050 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3036);
    float _3052 = fma(_3046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3054 = 1.0 / _3032;
    float _3056 = _3026 * 0.693147182464599609375;
    float _3058 = fma(_3046, _3052, -0.212114393711090087890625);
    float _3060 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3062 = fma(_3046, _3058, 1.570728778839111328125);
    float _3064 = sqrt(_3038);
    float _3066 = -_3004;
    float _3068 = fma(_3042, _3044, _3066);
    float _3070 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3048);
    float _3072 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3050);
    float _3074 = fma(_3068, 0.5, 0.5);
    float _3076 = _3070 * _3054;
    float _3078 = _3072 * _3054;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = fma(_3078, -0.5, 0.5);
    float _3084 = _3064 * 0.636619746685028076171875;
    float3 _8529 = float3(_3080, _3082, _3060);
    float _3086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8529, float3(0.0), isnan(_8529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8529, float3(0.0), isnan(_8529)), level(0.0)).x;
    float _3088 = -_3062;
    float _3090 = fma(_3084, _3088, 1.0);
    float3 _8545 = float3(_3080, _3082, _3060);
    float4 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8545, float3(0.0), isnan(_8545)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8545, float3(0.0), isnan(_8545)), level(0.0)).xyzw;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = _3093.w;
    float2 _8562 = float2(_3090, _3074);
    float3 _3105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8562, float2(0.0), isnan(_8562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8562, float2(0.0), isnan(_8562)), level(0.0)).xyz;
    float _3107 = _3105.x;
    float _3109 = _3105.y;
    float _3111 = _3105.z;
    float _3113 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3115 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3117 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3119 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3121 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3113);
    float _3123 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3125 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3127 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3129 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3117);
    float _3131 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3115);
    float _3133 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3135 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3121);
    float _3137 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3139 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3119);
    float _3141 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3123);
    float _3143 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3125);
    float _3145 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3127);
    float _3147 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3129);
    float _3149 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3133);
    float _3151 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3153 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3137);
    float _3155 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3157 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3159 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3139);
    float _3161 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3141);
    float _3163 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3143);
    float _3165 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3167 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3145);
    float _3169 = -_2538;
    float _3171 = fma(_3169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3155);
    float _3173 = 1.0 / _3151;
    float _3175 = -_2538;
    float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3157);
    float _3179 = -_2538;
    float _3181 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3165);
    float _3183 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3185 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3187 = isnan(0.5);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3193 = _3189 || _3191;
    float _3195 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3197 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3199 = _377 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3201 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3203 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3195);
    float _3205 = _3159 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3207 = _3161 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3209 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3197);
    float _3211 = fma(_3199, _3199, 1.0);
    float _3213 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3171);
    float _3215 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3181);
    float _3217 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3177);
    float _3219 = _3205 + _3151;
    float _3221 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3223 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3203);
    float _3225 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3227 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3229 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3209);
    float _3231 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3233 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3235 = rsqrt(_3211);
    float _3237 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3239 = _3219 * _3173;
    float _3241 = _3239 * 0.5;
    float _3243 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3227);
    float _3245 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3231);
    float _3247 = _3123;
    float _3249 = _3173;
    float _3251 = _3213;
    float _3253 = _3151;
    float _3255 = _3119;
    float _3257 = _3217;
    float _3259 = _3070;
    float _3261 = _3072;
    float _3263 = _3032;
    if (!_3193)
    {
        _3247 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3265 = _3247;
    float _3267 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3233);
    float _3269 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3237);
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3273 = fma(_3241, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3271);
    float _3275 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3149);
    if (!_3193)
    {
        float _3277 = -_3265;
        float _3279 = _3277 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3249 = _3279;
    }
    float _3281 = _3249;
    float _3283 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3285 = 1.0 / _3273;
    float _3287 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3153);
    float _3289 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3291 = _3199 * _3235;
    float _3293 = _3199 * _3213;
    float _3295 = _3199 * _3217;
    out.m_72.x = _3275;
    out.m_72.y = _3283;
    out.m_72.z = _3287;
    float _3297 = -_3221;
    float _3299 = _3291 * _3297;
    float _3301 = _3281;
    float _3303 = _3289;
    if (!_3193)
    {
        float _3305 = 1.0 / _3281;
        _3301 = _3305;
    }
    float _3307 = _3301;
    float _3309 = fma(_3289, _3275, _3293);
    float _3311 = fma(_3289, _3283, _3295);
    float _3313 = _3199 * _3215;
    float _3315 = -_3223;
    float _3317 = _3291 * _3315;
    float _3319 = -_3229;
    float _3321 = _3291 * _3319;
    float _3323 = -_617;
    float _3325 = _3323 + _2774;
    float _3327 = fma(_3289, _3287, _3313);
    if (_3193)
    {
        _3303 = 1.0;
    }
    float _3329 = _3303;
    float _3331 = -_615;
    float _3333 = _3331 + _2776;
    float _3335 = fma(_3235, _3213, _3299);
    float _3337 = _3329;
    if (!_3193)
    {
        float _3339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3341 = -_3265;
        float _3343 = fma(_3285, _3339, _3341);
        _3251 = _3343;
    }
    float _3345 = _3251;
    float _3347 = fma(_3235, _3217, _3317);
    float _3349 = fma(_3235, _3215, _3321);
    float _3351 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3353 = -_619;
    float _3355 = _3353 + _2778;
    if (!_3193)
    {
        float _3357 = _3345 * _3307;
        float _3359 = precise::clamp(_3357, 0.0, 1.0);
        _3337 = _3359;
    }
    float _3361 = _3337;
    float _3363 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    out.m_74.x = _3335;
    out.m_74.y = _3347;
    out.m_74.z = _3349;
    float _3365 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3351);
    float _3367 = _3163 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3369 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3363);
    if (!_3193)
    {
        _3253 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3371 = _3253;
    float _3373 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3365);
    float _3375 = _3167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3377 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3369);
    out.m_76.y = 1.0;
    float _3379 = _3371;
    if (!_3193)
    {
        float _3381 = -_3371;
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3255 = _3383;
    }
    float _3385 = _3255;
    float _3387 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3373);
    float _3389 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3391 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3393 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3395 = fma(_3367, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3267);
    float _3397 = _3385;
    if (!_3193)
    {
        float _3399 = 1.0 / _3385;
        _3397 = _3399;
    }
    float _3401 = _3397;
    float _3403 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3391);
    float _3405 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3393);
    float _3407 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3409 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3411 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3403);
    float _3413 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3405);
    float _3415 = _3407 + _3269;
    float _3417 = 1.0 / _3389;
    float _3419 = _3411 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3421 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3423 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3415);
    if (!_3193)
    {
        float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3427 = -_3371;
        float _3429 = fma(_3285, _3425, _3427);
        _3379 = _3429;
    }
    float _3431 = _3379;
    float _3433 = _3387 + _3032;
    float _3435 = _3070 + _3032;
    float _3437 = _3032 * 0.5;
    float _3439 = exp2(_3409);
    float _3441 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3395);
    float _3443 = _3431;
    if (!_3193)
    {
        float _3445 = _3431 * _3401;
        float _3447 = precise::clamp(_3445, 0.0, 1.0);
        _3443 = _3447;
    }
    float _3449 = _3443;
    float _3451 = _3433 * 0.5;
    float _3453 = _3435 * 0.5;
    float _3455 = fma(_3072, -0.5, _3437);
    if (_3193)
    {
        _3257 = 1.0;
    }
    float _3457 = _3257;
    float _3459 = 1.0 / _3423;
    float _3461 = _3419 * _3417;
    float _3463 = _3421 * _3417;
    float _3465 = _3457;
    if (!_3193)
    {
        float _3467 = -_3449;
        float _3469 = _3467 + 1.0;
        _3465 = _3469;
    }
    float _3471 = _3465;
    out.m_78.x = _3453;
    out.m_78.y = _3455;
    out.m_78.z = _3451;
    out.m_78.w = _3032;
    float _3473 = _3221 + _3309;
    float _3475 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3477 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3479 = -_3439;
    float _3481 = _3479 + 1.0;
    out.gl_Position.x = _3070;
    out.gl_Position.y = _3072;
    out.gl_Position.z = _3387;
    out.gl_Position.w = _3032;
    float _3483 = _3223 + _3311;
    float _3485 = _3229 + _3327;
    float _3487 = _3481 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2776;
    out.m_80.y = _2774;
    out.m_80.z = _2778;
    float _3489 = _3475 + _3243;
    float _3491 = _3477 + _3245;
    float _3493 = _3441 * _3459;
    out.m_82.x = _3473;
    out.m_82.y = _3483;
    out.m_82.z = _3485;
    float _3495 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3489);
    float _3497 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3491);
    bool _3499 = _3493 > 0.0;
    float _3501 = -_3487;
    float _3503 = _3501 + 1.0;
    float _3505 = _3497 * _3459;
    bool _3507 = _3493 < 1.0;
    bool _3509 = _3507 && _3499;
    bool _3511 = _3076 > (-1.0);
    bool _3513 = _3511 && _3509;
    bool _3515 = _3078 > (-1.0);
    bool _3517 = _3515 && _3513;
    bool _3519 = _3076 < 1.0;
    bool _3521 = _3519 && _3517;
    bool _3523 = _3078 < 1.0;
    bool _3525 = _3523 && _3521;
    float _3527 = _3487 * _3086;
    float _3529 = _3495 * _3459;
    float _3531 = _3101 * _3527;
    float _3533 = _3101 * _3503;
    float _3535 = _3111 * _3527;
    float _3537 = fma(_3107, _3531, _3095);
    float _3539 = fma(_3109, _3531, _3097);
    float _3541 = fma(_3101, _3535, _3099);
    out.m_84.x = _3537;
    out.m_84.y = _3539;
    out.m_84.z = _3541;
    out.m_84.w = _3533;
    bool _3543 = !_3525;
    float _3545 = _3539;
    float _3547 = _3537;
    float _3577;
    float _3583;
    if (!_3543)
    {
        float _3549 = -_3505;
        float _3551 = _3078 + _3549;
        float _3553 = -_3529;
        float _3555 = _3076 + _3553;
        float _3557 = -_3461;
        float _3559 = _3076 + _3557;
        float _3561 = -_3463;
        float _3563 = _3078 + _3561;
        float _3565 = _3551 * _3551;
        float _3567 = fma(_3555, _3555, _3565);
        float _3569 = sqrt(_3567);
        bool _3571 = _3569 > 0.0;
        float _3573 = _3361 * _3471;
        float _3575 = _3573 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        _3547 = _3567;
        _3577 = _3573;
        if (!_3571)
        {
            _3545 = _3575;
        }
        float _3579 = _3545;
        bool _3581 = !_3571;
        _3583 = _3579;
        _3585 = _3581;
        if (!_3585)
        {
            float _3587 = _3563 * _3563;
            float _3589 = fma(_3559, _3559, _3587);
            float _3591 = rsqrt(_3567);
            float _3593 = sqrt(_3589);
            float _3595 = _3555 * _3591;
            float _3597 = _3551 * _3591;
            bool _3599 = _3593 > 0.0;
            float _3601 = _3593;
            _3577 = _3591;
            if (!_3599)
            {
                _3601 = _3575;
            }
            float _3603 = _3601;
            bool _3605 = !_3599;
            _3583 = _3603;
            _3585 = _3605;
            if (!_3585)
            {
                float _3607 = _2556 * _3375;
                float _3609 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3611 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3407);
                float _3613 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3477);
                float _3615 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3475);
                float _3617 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3611);
                float _3619 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3613);
                float _3621 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3615);
                float _3623 = rsqrt(_3589);
                float _3625 = _3609 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3627 = 1.0 / _3617;
                float _3629 = _3563 * _3625;
                float _3631 = _3559 * _3625;
                float _3633 = _3629 * _3629;
                float _3635 = fma(_3631, _3631, _3633);
                float _3637 = _3619 * _3627;
                float _3639 = _3621 * _3627;
                float _3641 = sqrt(_3635);
                float _3643 = _3637 * _3637;
                float _3645 = fma(_3639, _3639, _3643);
                float _3647 = _3563 * _3623;
                float _3649 = _3559 * _3623;
                float _3651 = _3597 * _3647;
                float _3653 = sqrt(_3645);
                float _3655 = fma(_3595, _3649, _3651);
                float _3657 = precise::min(0.0, _3655);
                float _3659 = _3032 * _3657;
                float _3661 = fma(_3641, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3653);
                float _3663 = fma(_3631, _3659, _3070);
                float _3665 = fma(_3629, _3659, _3072);
                float _3667 = 1.0 / _3661;
                out.gl_Position.x = _3663;
                out.gl_Position.y = _3665;
                float _3669 = _3653 * _3667;
                out.m_76.y = _3669;
                _3259 = _3663;
                _3583 = _3575;
                _3547 = _3629;
                _3261 = _3665;
                _3577 = _3659;
                _2666 = _3655;
                _3585 = true;
            }
        }
    }
    else
    {
        float _3671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3671;
        _3259 = 0.0;
        _3583 = 0.0;
        _3261 = 0.0;
        _3577 = _3671;
    }
    _3585 = false;
    float _3673 = _3259;
    float _3675 = _3583;
    float _3677 = _3547;
    float _3679 = _3261;
    float _3681 = _3577;
    float _3683 = _2666;
    bool _3685 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3687 = isnan(_2802);
    bool _3689 = _3685 || _3687;
    bool _3691 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3693 = _3689 || _3691;
    float _3695 = _3677;
    float _3697 = _3681;
    float _3699 = _3679;
    float _3701 = _3673;
    float _3703 = _3683;
    if (!_3693)
    {
        _3695 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3705 = _3695;
    float _3707 = _3705;
    float _3709 = _3705;
    if (!_3693)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3711 = _3263;
    float _3713 = _3711;
    float _3715 = _3711;
    if (!_3693)
    {
        _3697 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3717 = _3697;
    float _3719 = _3717;
    float _3721 = _3717;
    if (!_3693)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3723 = _3699;
    float _3725 = _3723;
    float _3727 = _3723;
    if (!_3693)
    {
        _3701 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3729 = _3701;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3693)
    {
        _3703 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3735 = _3703;
    bool _3737 = !_3693;
    float _3739 = _3735;
    float _3741 = _3735;
    if (!_3737)
    {
        bool _3743 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3745 = isnan(_2802);
        bool _3747 = _3743 || _3745;
        bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3751 = _3747 || _3749;
        if (!_3751)
        {
            float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3755 = _2802 + _3753;
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3765 = 1.0 / _3759;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3783 = _3755 * _3765;
            float _3785 = precise::clamp(_3783, 0.0, 1.0);
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3791 = fma(_3785, _3763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3715 = _3795;
            _3733 = _3799;
            _3709 = _3791;
            _3727 = _3797;
            _3721 = _3793;
            _3741 = _3801;
            _3803 = true;
        }
        else
        {
            bool _3805 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3807 = isnan(_2802);
            bool _3809 = _3805 || _3807;
            bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3813 = _3809 || _3811;
            if (!_3813)
            {
                _3707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3815 = _3707;
            _3709 = _3815;
            if (!_3813)
            {
                _3713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3817 = _3713;
            _3715 = _3817;
            if (!_3813)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3819 = _3719;
            _3721 = _3819;
            if (!_3813)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3821 = _3725;
            _3727 = _3821;
            if (!_3813)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3823 = _3731;
            _3733 = _3823;
            if (!_3813)
            {
                _3739 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3825 = _3739;
            bool _3827 = !_3813;
            _3741 = _3825;
            if (!_3827)
            {
                bool _3829 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3831 = isnan(_2802);
                bool _3833 = _3829 || _3831;
                bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3837 = _3833 || _3835;
                if (!_3837)
                {
                    float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3841 = _2802 + _3839;
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3851 = 1.0 / _3845;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3869 = _3841 * _3851;
                    float _3871 = precise::clamp(_3869, 0.0, 1.0);
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3877 = fma(_3871, _3849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3715 = _3881;
                    _3733 = _3885;
                    _3709 = _3877;
                    _3727 = _3883;
                    _3721 = _3879;
                    _3741 = _3887;
                    _3803 = true;
                }
                else
                {
                    _3715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3741 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3803 = false;
    float _3889 = _3715;
    float _3891 = _3733;
    float _3893 = _3709;
    float _3895 = _3727;
    float _3897 = _3721;
    float _3899 = _3741;
    float _3901 = fma(_3483, -0.5, 0.5);
    float _3903 = precise::clamp(_3901, 0.0, 1.0);
    float _3905 = -_3889;
    float _3907 = _3905 + _3891;
    float _3909 = _3675 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3911 = -_3893;
    float _3913 = _3911 + _3895;
    float _3915 = fma(_3903, _3907, _3889);
    out.m_86.x = 0.0;
    float _3917 = -_3897;
    float _3919 = _3917 + _3899;
    float _3921 = fma(_3903, _3913, _3893);
    float _3923 = _3915 * 0.586610972881317138671875;
    out.m_47.x = _3909;
    bool _3925 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3927 = fma(_3903, _3919, _3897);
    float _3929 = fma(_3921, 0.298911988735198974609375, _3923);
    bool _3931 = _3361 > 0.0;
    bool _3933 = isnan(_3361);
    bool _3935 = _3931 || _3933;
    bool _3937 = isnan(0.0);
    bool _3939 = _3935 || _3937;
    float _3941 = fma(_3927, 0.114477999508380889892578125, _3929);
    bool _3943 = _3471 <= 0.0;
    bool _3945 = !_3939;
    bool _3947 = _3943 || _3945;
    float _3949 = -_3941;
    float _3951 = _3921 + _3949;
    float _3953 = -_3941;
    float _3955 = _3915 + _3953;
    float _3957 = -_3941;
    float _3959 = _3927 + _3957;
    float _3961 = fma(_3951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    float _3963 = fma(_3955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    float _3965 = fma(_3959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    bool _3967 = !_3925;
    if (!_3967)
    {
        float _3969 = -_2774;
        float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3973 = -_2776;
        float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3977 = -_2778;
        float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3981 = _3971 * _3971;
        float _3983 = fma(_3975, _3975, _3981);
        float _3985 = fma(_3979, _3979, _3983);
        float _3987 = sqrt(_3985);
        float _3989 = rsqrt(_3985);
        float _3991 = -_3987;
        float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3995 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3997 = precise::clamp(_3995, 0.0, 1.0);
        float _3999 = _3975 * _3989;
        float _4001 = _3971 * _3989;
        float _4003 = abs(_3997);
        float _4005 = log2(_4003);
        float _4007 = _3979 * _3989;
        float _4009 = _3999 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4011 = _3483 * _4001;
        float _4013 = -_4001;
        float _4015 = -_4009;
        float _4017 = fma(_4013, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4015);
        float _4019 = fma(_3473, _3999, _4011);
        float _4021 = -_4007;
        float _4023 = fma(_4021, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4017);
        float _4025 = fma(_3485, _4007, _4019);
        float _4027 = precise::clamp(_4025, 0.0, 1.0);
        float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4031 = _4023 + _4029;
        float _4033 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4035 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4037 = precise::clamp(_4035, 0.0, 1.0);
        float _4039 = exp2(_4033);
        float _4041 = _4039 * _4037;
        float _4043 = _4027 * _4041;
        float _4045 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4047 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4049 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _4045;
        out.m_86.y = _4047;
        out.m_86.z = _4049;
    }
    out.m_88.x = _3961;
    out.m_88.y = _3963;
    out.m_88.z = _3965;
    if (!_3947)
    {
        return out;
    }
    float _4051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_47.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4051;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3803 = false;
    bool _3585 = false;
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
        float _4108 = as_type<float>(_123);
        out.gl_Position.z = _4108;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4182 = as_type<float>(_163);
        out.gl_Position.z = _4182;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_49.x;
    float _189 = in.m_49.y;
    float _191 = in.m_49.z;
    float _193 = _165 * _165;
    float _195 = _167 * _167;
    float _197 = fma(_173, _173, _193);
    float _199 = fma(_175, _175, _195);
    float _201 = fma(_179, _179, _197);
    float _203 = _169 * _169;
    float _205 = fma(_181, _181, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_177, _177, _203);
    float _211 = fma(_183, _183, _209);
    float _213 = sqrt(_205);
    float _215 = sqrt(_211);
    bool _217 = _207 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = 0.0;
    float _223 = _171;
    float _225 = _165;
    if (_217)
    {
        float _227 = rsqrt(_201);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_217)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _215 > 0.0;
    float _237 = 0.0;
    float _239 = _215;
    float _241 = _233;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    int _245 = as_type<int>(_185) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_185) & 2;
    bool _251 = _249 != 0;
    float _253 = _207;
    float _255 = _185;
    float _257 = _243;
    if (_219)
    {
        float _259 = rsqrt(_205);
        _253 = _259;
    }
    float _261 = _253;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = 0.0;
    if (!_219)
    {
        _273 = 0.0;
    }
    float _275 = _273;
    float _277 = 0.0;
    float _279 = _275;
    if (!_219)
    {
        _277 = 0.0;
    }
    float _281 = _277;
    float _283 = _281;
    if (!_219)
    {
        _239 = 0.0;
    }
    float _285 = _239;
    float _287 = _211;
    float _289 = _285;
    if (_235)
    {
        float _291 = rsqrt(_211);
        _287 = _291;
    }
    float _293 = _287;
    if (!_217)
    {
        _255 = 0.0;
    }
    float _295 = _255;
    float _297 = _295;
    if (_217)
    {
        float _299 = _229 * _173;
        _241 = _299;
    }
    float _301 = _241;
    if (_217)
    {
        float _303 = _229 * _165;
        _257 = _303;
    }
    float _305 = _257;
    if (_217)
    {
        float _307 = _229 * _179;
        _297 = _307;
    }
    float _309 = _297;
    float _311 = 0.0;
    if (!_235)
    {
        _311 = 0.0;
    }
    float _313 = _311;
    float _315 = 0.0;
    float _317 = _313;
    if (!_271)
    {
        float _319 = _171 * _171;
        float _321 = _319 * 0.5;
        _315 = _321;
    }
    float _323 = _315;
    float _325 = 0.0;
    float _327 = _323;
    if (!_235)
    {
        _325 = 0.0;
    }
    float _329 = _325;
    float _331 = _329;
    if (_219)
    {
        float _333 = _261 * _175;
        _279 = _333;
    }
    float _335 = _279;
    if (_219)
    {
        float _337 = _261 * _167;
        _283 = _337;
    }
    float _339 = _283;
    if (_219)
    {
        float _341 = _261 * _181;
        _289 = _341;
    }
    float _343 = _289;
    float _345 = _343;
    if (!_271)
    {
        float _347 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _347;
    }
    float _349 = _327;
    float _351 = 0.0;
    float _353 = _349;
    if (!_235)
    {
        _351 = 0.0;
    }
    float _355 = _351;
    bool _357 = !_247;
    float _359 = _357 ? (-0.5) : 0.5;
    float _361 = _355;
    if (_235)
    {
        float _363 = _293 * _177;
        _317 = _363;
    }
    float _365 = _317;
    if (_235)
    {
        float _367 = _293 * _169;
        _331 = _367;
    }
    float _369 = _331;
    if (_235)
    {
        float _371 = _293 * _183;
        _361 = _371;
    }
    float _373 = _361;
    bool _375 = !_251;
    float _377 = _375 ? (-0.5) : 0.5;
    bool _379 = !_271;
    if (!_379)
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
        _353 = _409;
    }
    float _411 = _353;
    float _413 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _415 = !_271;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = 1.0 / _425;
        float _429 = _171 * _421;
        float _431 = exp2(_429);
        float _433 = -_431;
        float _435 = _433 + 1.0;
        float _437 = _435 * _427;
        _223 = _437;
    }
    float _439 = _223;
    float _441 = _413 * _305;
    float _443 = _413 * _339;
    float _445 = _413 * _369;
    float _447 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_271)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _417 = _451;
    }
    float _453 = _417;
    float _455 = fma(_447, _301, _441);
    float _457 = fma(_447, _335, _443);
    float _459 = fma(_447, _365, _445);
    float _461 = _453;
    if (!_271)
    {
        float _463 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _463;
    }
    float _465 = _461;
    bool _467 = !_271;
    float _469 = _465;
    if (!_467)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _477 = _475 + 1.0;
        float _479 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _481 = _143 * _473;
        float _483 = 1.0 / _477;
        float _485 = _479 * 0.693147182464599609375;
        float _487 = exp2(_481);
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
    float _515 = _505 * _305;
    float _517 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _505 * _339;
    float _521 = _505 * _369;
    float _523 = fma(_507, _309, _455);
    float _525 = fma(_517, _301, _515);
    float _527 = fma(_517, _335, _519);
    float _529 = fma(_507, _343, _457);
    float _531 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _533 = fma(_507, _373, _459);
    float _535 = fma(_517, _365, _521);
    float _537 = fma(_439, _187, _523);
    float _539 = fma(_439, _189, _529);
    float _541 = fma(_531, _343, _527);
    float _543 = fma(_439, _191, _533);
    float _545 = fma(_531, _309, _525);
    float _547 = fma(_531, _373, _535);
    if (!_271)
    {
        _345 = _143;
    }
    float _549 = _345;
    bool _551 = !_271;
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
    float _577 = fma(_575, _189, _541);
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _581 = fma(_575, _187, _545);
    float _583 = fma(_575, _191, _547);
    float _585 = -_577;
    float _587 = _539 + _585;
    float _589 = fma(_539, _503, _511);
    float _591 = fma(_537, _503, _509);
    float _593 = -_581;
    float _595 = _537 + _593;
    float _597 = _587 * _175;
    float _599 = _587 * _167;
    float _601 = _587 * _181;
    float _603 = -_583;
    float _605 = _543 + _603;
    float _607 = fma(_595, _173, _597);
    float _609 = fma(_595, _165, _599);
    float _611 = fma(_595, _179, _601);
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
    float _655 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _657 = int(_655);
    bool _659 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _661 = isnan(_647);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _673 = isnan(_647);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = float(_651);
    float _689 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _691 = int(_689);
    float _693 = _681 * _685;
    float _695 = -_681;
    float _697 = _695 + 1.0;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = float(uint(_657));
    float _703 = 1.0 / _687;
    int _705 = ~_657;
    int _707 = _705 + 1;
    float _709 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    int _711 = ~_657;
    int _713 = _711 + 1;
    bool _715 = _657 == 0;
    float _717 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _719 = 1.0 / _701;
    float _721 = float(_691);
    float _723 = -_717;
    float _725 = _723 + 1.0;
    float _727 = _703 * _143;
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _731 = int(_729);
    int _733 = as_type<int>(_719) + (-2);
    float _735 = trunc(_727);
    int _737 = int(_735);
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _741 = _739 != 0;
    float _743 = 1.0 / _721;
    float _745 = float(uint(_731));
    int _747 = ~_731;
    int _749 = _747 + 1;
    int _751 = ~_731;
    int _753 = _751 + 1;
    float _755 = float(uint(_737));
    float _757 = 1.0 / _745;
    float _759 = as_type<float>(_733) * _755;
    float _761 = _743 * _143;
    float _763 = trunc(_759);
    float _765 = precise::max(_763, 0.0);
    uint _768 = uint(_765);
    float _770 = in.m_51.y;
    float _772 = trunc(_761);
    int _774 = int(_772);
    int _776 = as_type<int>(_757) + (-2);
    float _778 = _759;
    if (_741)
    {
        _778 = _129;
    }
    float _780 = _778;
    int _782 = _707 * int(_768);
    int _784 = _782 + _737;
    float _786 = 1.0 / _653;
    float _788 = float(uint(_784));
    float _790 = as_type<float>(_784);
    float _792 = _780;
    if (_741)
    {
        _790 = 1.0;
    }
    float _794 = _790;
    float _796 = float(uint(_774));
    float _798 = as_type<float>(_733) * _788;
    float _800 = _794;
    float _802 = _796;
    if (!_741)
    {
        _800 = 1.2345600128173828125;
    }
    float _804 = _800;
    if (!_741)
    {
        _792 = _770;
    }
    float _806 = _792;
    float _808 = as_type<float>(_776) * _796;
    if (_741)
    {
        _802 = 1.0;
    }
    float _810 = _802;
    float _812 = trunc(_798);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _810;
    if (!_741)
    {
        _818 = 7.345489978790283203125;
    }
    float _820 = _818;
    float _822 = _804 * _806;
    float _824 = float(_731);
    float _826 = _820 * _129;
    float _828 = trunc(_808);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = floor(_826);
    int _836 = ~_731;
    int _838 = _836 + 1;
    int _840 = int(_768) + int(_816);
    int _842 = _838 * int(_832);
    int _844 = _842 + _774;
    float _846 = floor(_822);
    int _848 = _713 * _840;
    int _850 = _848 + _737;
    float _852 = float(uint(_844));
    float _854 = -_834;
    float _856 = _826 + _854;
    bool _858 = uint(_850) >= uint(_657);
    float _860 = as_type<float>(_776) * _852;
    float _862 = float(_657);
    float _864 = _786 * _143;
    float _866 = trunc(_860);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    float _872 = _856 * _862;
    bool _874 = !_858;
    int _876 = _874 ? 0 : (-1);
    float _878 = -_846;
    float _880 = _822 + _878;
    float _882 = float(_737);
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _886 = _884 != 0;
    float _888 = trunc(_872);
    int _890 = int(_888);
    bool _892 = _882 >= _862;
    bool _894 = isnan(_882);
    bool _896 = _892 || _894;
    bool _898 = isnan(_862);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _862 * _864;
    int _906 = ~_840;
    int _908 = _906 + _876;
    int _910 = _908 + 1;
    float _912 = _824 * _864;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    float _918 = _880 * _824;
    float _920 = float(_774);
    float _922 = trunc(_902);
    int _924 = int(_922);
    int _926 = abs(_916);
    bool _928 = _920 >= _824;
    bool _930 = isnan(_920);
    bool _932 = _928 || _930;
    bool _934 = isnan(_824);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    int _940 = int(_832) + int(_870);
    int _942 = _890 * _926;
    int _944 = _942 + _737;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _948 = _946 != 0;
    int _950 = _657 * _910;
    int _952 = _950 + _737;
    int _954 = _749 * _940;
    int _956 = _954 + _774;
    float _958 = trunc(_918);
    int _960 = int(_958);
    bool _962 = !_948;
    int _964 = _962 ? 0 : 1;
    float _966 = _589 * _167;
    bool _968 = !_715;
    int _970 = _968 ? _952 : (-1);
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _974 = _972 != 0;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _982 = _980 != 0;
    bool _984 = uint(_956) >= uint(_731);
    float _986 = trunc(_904);
    int _988 = int(_986);
    int _990 = ~_924;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    bool _996 = !_984;
    int _998 = _996 ? 0 : (-1);
    int _1000 = abs(_964);
    int _1002 = _970 * _994;
    bool _1004 = !_978;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = trunc(_938);
    int _1010 = int(_1008);
    int _1012 = _657 + (-1);
    int _1014 = ~_940;
    int _1016 = _1014 + _998;
    int _1018 = _1016 + 1;
    int _1020 = abs(_1006);
    int _1022 = _924 * _1012;
    int _1024 = _1022 + _1002;
    bool _1026 = !_974;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _960 * _1000;
    int _1032 = _1030 + _774;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1036 = _1034 != 0;
    int _1038 = _731 * _1018;
    int _1040 = _1038 + _774;
    bool _1042 = !_982;
    int _1044 = _1042 ? 0 : 1;
    int _1046 = _1024 * _1020;
    int _1048 = abs(_1028);
    float _1050 = trunc(_912);
    int _1052 = int(_1050);
    bool _1054 = _731 == 0;
    float _1056 = in.m_51.w;
    int _1058 = abs(_1044);
    int _1060 = _988 * _1048;
    int _1062 = _1060 + _1046;
    bool _1064 = !_1036;
    int _1066 = _1064 ? 0 : 1;
    int _1068 = ~_1010;
    int _1070 = _1068 + 1;
    int _1072 = _1070 + 1;
    bool _1074 = !_1054;
    int _1076 = _1074 ? _1040 : (-1);
    float _1078 = _589 * _175;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1094 = _1092 != 0;
    int _1096 = _1076 * _1072;
    int _1098 = abs(_1066);
    int _1100 = _944 * _1058;
    int _1102 = _1100 + _1062;
    int _1104 = _731 + (-1);
    float _1106 = fma(_591, _173, _1078);
    float _1108 = _770 * 2.0;
    bool _1110 = !_1086;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1010 * _1104;
    int _1116 = _1114 + _1096;
    bool _1118 = !_1082;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _890 * _1098;
    int _1124 = _1122 + _1102;
    int _1126 = abs(_1112);
    bool _1128 = !_1090;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = abs(_1120);
    bool _1134 = !_1094;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = abs(_1130);
    int _1140 = _1116 * _1126;
    float _1142 = float(uint(_1124));
    float _1144 = _589 * _181;
    int _1146 = abs(_1136);
    int _1148 = _1052 * _1132;
    int _1150 = _1148 + _1140;
    float _1152 = as_type<float>(_733) * _1142;
    float _1154 = in.m_51.z;
    int _1156 = ~_731;
    int _1158 = _1156 + 1;
    int _1160 = _1032 * _1138;
    int _1162 = _1160 + _1150;
    int _1164 = ~_657;
    int _1166 = _1164 + 1;
    float _1168 = trunc(_1152);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = _657 == 0;
    int _1176 = _960 * _1146;
    int _1178 = _1176 + _1162;
    int _1180 = ~_657;
    int _1182 = _1180 + 1;
    float _1184 = float(uint(_1178));
    float _1186 = as_type<float>(_776) * _1184;
    int _1188 = _1182 * int(_1172);
    int _1190 = _1188 + _1124;
    float _1192 = trunc(_1186);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = float(uint(_1190));
    float _1200 = as_type<float>(_733) * _1198;
    float _1202 = trunc(_1200);
    float _1204 = precise::max(_1202, 0.0);
    uint _1206 = uint(_1204);
    int _1208 = _1158 * int(_1196);
    int _1210 = _1208 + _1178;
    float _1212 = float(uint(_1210));
    float _1214 = as_type<float>(_776) * _1212;
    int _1216 = int(_1172) + int(_1206);
    float _1218 = trunc(_1214);
    float _1220 = precise::max(_1218, 0.0);
    uint _1222 = uint(_1220);
    int _1224 = ~_731;
    int _1226 = _1224 + 1;
    int _1228 = _1166 * _1216;
    int _1230 = _1228 + _1124;
    bool _1232 = uint(_1230) >= uint(_657);
    bool _1234 = !_1232;
    int _1236 = _1234 ? 0 : (-1);
    int _1238 = int(_1196) + int(_1222);
    int _1240 = ~_1216;
    int _1242 = _1240 + _1236;
    int _1244 = _1242 + 1;
    float _1246 = float(uint(_944));
    int _1248 = _657 * _1244;
    int _1250 = _1248 + _1124;
    int _1252 = _1226 * _1238;
    int _1254 = _1252 + _1178;
    float _1256 = as_type<float>(_733) * _1246;
    bool _1258 = !_1174;
    int _1260 = _1258 ? _1250 : (-1);
    bool _1262 = uint(_1254) >= uint(_731);
    float _1264 = trunc(_1256);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    int _1270 = _1260 & 3;
    bool _1272 = _1270 != 0;
    bool _1274 = !_1262;
    int _1276 = _1274 ? 0 : (-1);
    bool _1278 = uint(_1270) > 1u;
    int _1280 = _1260 & 3;
    bool _1282 = _1280 != 0;
    int _1284 = ~_1238;
    int _1286 = _1284 + _1276;
    int _1288 = _1286 + 1;
    int _1290 = _1282 ? 0 : 1;
    bool _1292 = _1270 != 3;
    int _1294 = _731 * _1288;
    int _1296 = _1294 + _1178;
    int _1298 = ~_1290;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = _129 * 2.0;
    bool _1306 = uint(_1270) >= 2u;
    int _1308 = _1302;
    float _1310 = _1108;
    if (!_1278)
    {
        int _1312 = ~_1290;
        int _1314 = _1312 + 1;
        _1308 = _1314;
    }
    int _1316 = _1308;
    float _1318 = floor(_1304);
    float _1320 = float(uint(_1032));
    int _1322 = _1306 ? 0 : 1;
    bool _1324 = !_1054;
    int _1326 = _1324 ? _1296 : (-1);
    float _1328 = as_type<float>(_776) * _1320;
    int _1330 = ~_1322;
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1334;
    if (_1292)
    {
        int _1338 = ~_1322;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = trunc(_1328);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    int _1350 = _1326 & 3;
    bool _1352 = _1350 != 0;
    int _1354 = _1326 & 3;
    bool _1356 = _1354 != 0;
    int _1358 = ~_657;
    int _1360 = _1358 + 1;
    bool _1362 = uint(_1350) >= 2u;
    int _1364 = _1356 ? 0 : 1;
    int _1366 = _1360 * int(_1268);
    int _1368 = _1366 + _944;
    bool _1370 = uint(_1350) > 1u;
    int _1372 = _1362 ? 0 : 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1376 = _1374 != 0;
    bool _1378 = _1350 != 3;
    float _1380 = floor(_1108);
    float _1382 = float(uint(_1368));
    int _1384 = _753 * int(_1348);
    int _1386 = _1384 + _1032;
    int _1388 = ~_1364;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    int _1394 = ~_1372;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    float _1400 = as_type<float>(_733) * _1382;
    float _1402 = float(uint(_1386));
    int _1404 = _1392;
    int _1406 = as_type<int>(_1382);
    int _1408 = _1398;
    if (!_1370)
    {
        int _1410 = ~_1364;
        int _1412 = _1410 + 1;
        _1404 = _1412;
    }
    int _1414 = _1404;
    float _1416 = as_type<float>(_776) * _1402;
    bool _1418 = _129 > 0.5;
    float _1420 = trunc(_1400);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    if (_1376)
    {
        _1406 = 0;
    }
    int _1426 = _1406;
    int _1428 = _1426;
    if (_1378)
    {
        int _1430 = ~_1372;
        int _1432 = _1430 + 1;
        _1408 = _1432;
    }
    int _1434 = _1408;
    if (!_1376)
    {
        _1428 = 1;
    }
    int _1436 = _1428;
    int _1438 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1440 = _1438 != 0;
    float _1442 = trunc(_1416);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    float _1448 = -_359;
    int _1450 = _1418 ? as_type<int>(_1448) : as_type<int>(_359);
    bool _1452 = _770 > 0.5;
    bool _1454 = !_1440;
    float _1456 = _1454 ? _359 : as_type<float>(_1450);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1460 = _1458 != 0;
    float _1462 = -_377;
    float _1464 = _1452 ? _1462 : _377;
    bool _1466 = _1154 > 0.5;
    bool _1468 = _1056 > 0.5;
    float _1470 = fma(_591, _165, _966);
    bool _1472 = !_1460;
    float _1474 = _1472 ? _377 : _1464;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    float _1480 = -_359;
    int _1482 = _1466 ? as_type<int>(_1480) : as_type<int>(_359);
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1486 = _1484 != 0;
    float _1488 = -_377;
    int _1490 = _1468 ? as_type<int>(_1488) : as_type<int>(_377);
    bool _1492 = !_1478;
    float _1494 = _1492 ? _359 : as_type<float>(_1482);
    bool _1496 = _1436 != 1;
    bool _1498 = _1318 > 0.0;
    float _1500 = _1494 + 0.5;
    bool _1502 = !_1486;
    float _1504 = _1502 ? _377 : as_type<float>(_1490);
    bool _1506 = _1318 >= 0.0;
    bool _1508 = isnan(_1318);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    int _1516 = int(_1268) + int(_1424);
    int _1518 = ~_657;
    int _1520 = _1518 + 1;
    int _1522 = _1514 ? 0 : 1;
    int _1524 = ~_731;
    int _1526 = _1524 + 1;
    int _1528 = _1520 * _1516;
    int _1530 = _1528 + _944;
    int _1532 = int(_1348) + int(_1446);
    int _1534 = ~_1522;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = _1464;
    float _1542 = as_type<float>(_1446);
    int _1544 = _1538;
    if (!_1496)
    {
        _225 = _770;
    }
    float _1546 = _225;
    float _1548 = _1546;
    if (!_1496)
    {
        _1540 = _770;
    }
    float _1550 = _1540;
    float _1552 = _1550;
    if (!_1496)
    {
        _1542 = _1154;
    }
    float _1554 = _1542;
    float _1556 = _1554;
    if (!_1496)
    {
        _1310 = _1154;
    }
    float _1558 = _1310;
    float _1560 = _1558;
    if (_1496)
    {
        _1548 = _129;
    }
    float _1562 = _1548;
    if (_1496)
    {
        _1552 = _129;
    }
    float _1564 = _1552;
    if (_1496)
    {
        _1556 = _770;
    }
    float _1566 = _1556;
    if (_1496)
    {
        _1560 = _770;
    }
    float _1568 = _1560;
    if (!_1498)
    {
        int _1570 = ~_1522;
        int _1572 = _1570 + 1;
        _1544 = _1572;
    }
    int _1574 = _1544;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1578 = _1380 > 0.0;
    bool _1580 = _1380 >= 0.0;
    bool _1582 = isnan(_1380);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    bool _1590 = uint(_1530) >= uint(_657);
    int _1592 = _1526 * _1532;
    int _1594 = _1592 + _1032;
    float _1596 = fma(_591, _179, _1144);
    int _1598 = _1588 ? 0 : 1;
    bool _1600 = uint(_1594) >= uint(_731);
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1610 = !_1590;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1614;
    float _1618 = 1.0 / _1604;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1622 = _1620 != 0;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1626 = _1624 != 0;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1630 = _1628 != 0;
    float _1632 = fma(_613, _183, _1596);
    int _1634 = ~_1598;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1644 = !_1272;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = in.m_57.w;
    int _1650 = _1638;
    if (!_1578)
    {
        int _1652 = ~_1598;
        int _1654 = _1652 + 1;
        _1650 = _1654;
    }
    int _1656 = _1650;
    float _1658 = 1.0 / _1608;
    float _1660 = fma(_613, _177, _1106);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1664 = _647 + _1662;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1672 = _647 + _1670;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1676 = _1674 != 0;
    float _1678 = fma(_613, _169, _1470);
    float _1680 = 1.0 / _1616;
    float _1682 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1686 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1688 = _1672 * _1618;
    float _1690 = fma(_1682, -2.0, _1684);
    float _1692 = 1.0 / _1642;
    float _1694 = _1154 * 2.0;
    float _1696 = in.m_55.w;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1700 = _1664 * _1658;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1704 = _647 + _1702;
    bool _1706 = !_1600;
    int _1708 = _1706 ? 0 : (-1);
    float _1710 = -_1698;
    float _1712 = fma(_1686, 2.0, _1710);
    float _1714 = floor(_1694);
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1718 = _647 + _1716;
    float _1720 = _129 + _770;
    float _1722 = _1660 + _1648;
    float _1724 = -_143;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1712);
    float _1728 = _1718 * _1680;
    float _1730 = _1720 + (-1.0);
    float _1732 = in.m_59.w;
    float _1734 = _1704 * _1692;
    float _1736 = _129 + _1154;
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1740 = _1154 + _770;
    float _1742 = _1736 + (-1.0);
    bool _1744 = !_1626;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1690);
    bool _1750 = _1714 >= 0.0;
    bool _1752 = isnan(_1714);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan(0.0);
    bool _1758 = _1754 || _1756;
    float _1760 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1762 = _1678 + _1696;
    int _1764 = _1758 ? 0 : 1;
    float _1766 = _1740 + (-1.0);
    bool _1768 = _1714 > 0.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1774;
    bool _1778 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1780 = isnan(_647);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1792 = fma(_1772, _1688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1794 = fma(_1776, _1688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1804 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1806 = isnan(_647);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = -_1788;
    float _1818 = _1816 + 1.0;
    float _1820 = fma(_1798, _1700, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1822 = _1632 + _1732;
    float _1824 = fma(_1802, _1700, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1826 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1828 = isnan(_647);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1834 = _1830 || _1832;
    float _1836 = float(_1834);
    float _1838 = _1814 * _1818;
    float _1840 = -_1814;
    float _1842 = _1840 + 1.0;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1846 = _1722 + _1844;
    float _1848 = _1836 * _1842;
    float _1850 = -_1836;
    float _1852 = _1850 + 1.0;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1854;
    bool _1858 = !_1622;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1862;
    float _1866 = _669 * _1852;
    float _1868 = fma(_1856, _1728, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1870 = _1456 + 0.5;
    float _1872 = fma(_1864, _1728, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1874 = _1792 * _693;
    float _1876 = _1794 * _693;
    int _1878 = abs(_1746);
    float _1880 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1726);
    float _1882 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1874);
    float _1884 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1876);
    float _1886 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1888 = log2(_1886);
    float _1890 = fma(_1820, _1866, _1882);
    float _1892 = float(_1878);
    float _1894 = fma(_1824, _1866, _1884);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1898 = _1474 + (-0.5);
    float _1900 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1896);
    float _1902 = float(_1574);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1906 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1908 = _1326 >> 31;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1762 + _1910;
    float _1914 = _1892 * _1902;
    float _1916 = -_1904;
    float _1918 = fma(_1906, 2.0, _1916);
    int _1920 = abs(_1860);
    float _1922 = _1888 * _143;
    int _1924 = _1260 >> 31;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1928 = _1908 & 3;
    float _1930 = -_1898;
    float _1932 = -_1748;
    float _1934 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1932);
    int _1936 = _1924 & 3;
    float _1938 = exp2(_1922);
    int _1940 = _1326 + _1928;
    float _1942 = fma(_1872, _1848, _1894);
    int _1944 = _1260 + _1936;
    float _1946 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1948 = !_1352;
    int _1950 = _1948 ? 0 : 1;
    float _1952 = fma(_1576, -2.0, _1926);
    int _1954 = _1944 >> 2;
    float _1956 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1946);
    bool _1958 = _1270 != 3;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1962 = _1822 + _1960;
    int _1964 = _1940 >> 2;
    float _1966 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1900);
    int _1968 = ~_1764;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1956);
    int _1976 = _1954 << 4;
    int _1978 = _1976 + 368;
    float _1980 = -_1938;
    float _1982 = _1980 + 1.0;
    int _1984 = _1972;
    if (!_1768)
    {
        int _1986 = ~_1764;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    float _1992 = _129 + (-0.5);
    bool _1994 = !_1958;
    int _1996 = _1994 ? 0 : (-1);
    bool _1998 = _1350 != 3;
    uint _2000 = uint(int(uint(_1978) >> uint(2)));
    uint _2002 = uint(int(uint(int(_2000)) >> uint(2)));
    int _2004 = int(_2000) & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = int(_2000) + 1;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    int _2012 = _2008 & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = _1964 << 4;
    int _2018 = _2016 + 512;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2030 = _2026 || _2028;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2034 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2020);
    float _2036 = _2030 ? _1982 : 0.0;
    uint _2038 = uint(int(uint(_2018) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    int _2046 = int(_2038) + 1;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    int _2050 = _2046 & 3;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[int(_2048)][_2050];
    float _2054 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2032);
    float _2056 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2034);
    float _2058 = -_143;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1918);
    bool _2062 = _1974 >= 0.0;
    float _2064 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2054);
    float _2066 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1952);
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2070 = 1.0 + _2068;
    int _2072 = _1978 + 8;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    uint _2076 = uint(int(uint(int(_2074)) >> uint(2)));
    int _2078 = int(_2074) & 3;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[int(_2076)][_2078];
    int _2082 = int(_2074) + 1;
    uint _2084 = uint(int(uint(_2082) >> uint(2)));
    int _2086 = _2082 & 3;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[int(_2084)][_2086];
    bool _2090 = !_1998;
    int _2092 = _2090 ? 0 : (-1);
    float _2094 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2060);
    bool _2096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2098 = isnan(1.0);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2104 = _2100 || _2102;
    float _2106 = 1.0 / _2070;
    float _2108 = float(_1920);
    int _2110 = _2018 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = float(_1990);
    if (_2062)
    {
        out.m_47.x = 0.0;
    }
    float _2130 = 0.0;
    if (_2062)
    {
        _2130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2132 = _2130;
    int _2134 = ~_1516;
    int _2136 = _2134 + _1612;
    int _2138 = _2136 + 1;
    float _2140 = _2108 * _2128;
    int _2142 = abs(_1316);
    float _2144 = in.m_66.x;
    float _2146 = in.m_66.y;
    float _2148 = in.m_66.z;
    int _2150 = abs(_1646);
    float _2152 = _2140 * (-2.0);
    int _2154 = as_type<int>(_2140);
    if (_2062)
    {
        float _2156 = _2132 * 5.0;
        _2154 = as_type<int>(_2156);
    }
    int _2158 = _2154;
    int _2160 = abs(_1414);
    if (_2104)
    {
        float _2162 = _2036 * _2106;
        _145 = _2162;
    }
    float _2164 = _145;
    int _2166 = ~_2142;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = abs(_1950);
    int _2174 = _657 * _2138;
    int _2176 = _2174 + _944;
    int _2178 = abs(_2092);
    float _2180 = _1504 + (-0.5);
    if (_2062)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7083 = as_type<float>(_2158);
        out.gl_Position.z = _7083;
    }
    int _2182 = ~_1532;
    int _2184 = _2182 + _1708;
    int _2186 = _2184 + 1;
    float _2188 = fma(_1738, _2152, _1738);
    bool _2190 = _657 == 0;
    int _2192 = _2170 * as_type<int>(_2014);
    bool _2194 = _731 == 0;
    int _2196 = _731 * _2186;
    int _2198 = _2196 + _1032;
    bool _2200 = !_2190;
    int _2202 = _2200 ? _2176 : (-1);
    float _2204 = -_2180;
    float _2206 = -_2066;
    float _2208 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2206);
    bool _2210 = !_2194;
    int _2212 = _2210 ? _2198 : (-1);
    float _2214 = _1912 * _1912;
    int _2216 = ~_2160;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    float _2222 = fma(_2152, _2144, _2144);
    int _2224 = ~_2150;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_1846, _1846, _2214);
    int _2232 = ~_2172;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2220 * as_type<int>(_2052);
    float _2240 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2222);
    int _2242 = _2228 * as_type<int>(_2006);
    int _2244 = _2242 + _2192;
    int _2246 = abs(_1342);
    int _2248 = _2236 * as_type<int>(_2044);
    int _2250 = _2248 + _2238;
    int _2252 = abs(_1434);
    float _2254 = fma(_1962, _1962, _2230);
    int _2256 = ~_2246;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    bool _2262 = !_1668;
    int _2264 = _2262 ? 0 : 1;
    float _2266 = rsqrt(_2254);
    int _2268 = ~_2252;
    int _2270 = _2268 + 1;
    int _2272 = _2270 + 1;
    int _2274 = _2260 * as_type<int>(_2080);
    int _2276 = _2274 + _2244;
    int _2278 = abs(_1996);
    int _2280 = abs(_2264);
    int _2282 = _2272 * as_type<int>(_2118);
    int _2284 = _2282 + _2250;
    bool _2286 = !_1676;
    int _2288 = _2286 ? 0 : 1;
    int _2290 = ~_2278;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2178;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    int _2302 = _2294 * as_type<int>(_2088);
    int _2304 = _2302 + _2276;
    int _2306 = abs(_2288);
    float _2308 = _1912 * _2266;
    int _2310 = ~_2280;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2300 * as_type<int>(_2126);
    int _2318 = _2316 + _2284;
    int _2320 = ~_2306;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = _1846 * _2266;
    float _2328 = -_2308;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    int _2332 = _2304 * _2314;
    float _2334 = -_2064;
    float _2336 = _2334 + 1.0;
    int _2338 = _2318 * _2324;
    float _2340 = -_2056;
    float _2342 = _2340 + 1.0;
    int _2344 = _2202 * _2280;
    int _2346 = _2344 + _2332;
    float _2348 = -_2326;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    int _2352 = _2212 * _2306;
    int _2354 = _2352 + _2338;
    float _2356 = -_1966;
    float _2358 = _2356 + 1.0;
    float _2360 = _2330 * _2330;
    float _2362 = -_725;
    float _2364 = fma(_1456, _2362, _1880);
    float _2366 = fma(_1474, _2336, _1934);
    float _2368 = _1962 * _2266;
    float _2370 = -_2358;
    float _2372 = fma(_1494, _2370, _2094);
    float _2374 = fma(_1504, _2342, _2208);
    float _2376 = float(_2346);
    float _2378 = fma(_2350, _2350, _2360);
    float _2380 = float(_2354);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    bool _2386 = !_1630;
    int _2388 = _2386 ? 0 : 1;
    out.m_68.x = _2364;
    out.m_68.y = _2366;
    out.m_68.z = _2372;
    out.m_68.w = _2374;
    float _2390 = fma(_2384, _2384, _2378);
    int _2392 = abs(_2388);
    out.m_70.x = _2376;
    out.m_70.y = _2380;
    float _2394 = _2148;
    if (_2062)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2396 = -_2308;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1762);
    float _2400 = -_2326;
    float _2402 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _2404 = -_2368;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _2408 = float(_1656);
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2412 = _2398 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2402 + _2414;
    float _2418 = float(_2392);
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2422 = _2406 + _2420;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2426 = _1914 * (-2.0);
    float _2428 = fma(_2188, _2164, _2240);
    float _2430 = _2418 * _2408;
    float _2432 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2424);
    float _2434 = _770 + (-0.5);
    float _2436 = fma(_2426, _2146, _2146);
    float _2438 = _2430 * (-2.0);
    float _2440 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2432);
    float _2442 = _2428 * 0.15915493667125701904296875;
    float _2444 = fma(_1790, _2426, _1790);
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2436);
    float _2448 = fma(_2438, _2148, _2148);
    bool _2450 = _2440 >= 0.0;
    float _2452 = _1154 + (-0.5);
    float _2454 = fma(_1760, _2438, _1760);
    float _2456 = fma(_2444, _2164, _2446);
    float _2458 = in.m_64.x;
    float _2460 = in.m_64.y;
    float _2462 = fma(_2452, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2448);
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2468 = _2456 * 0.15915493667125701904296875;
    float _2470 = fma(_1868, _1848, _1890);
    float _2472 = sqrt(_2390);
    float _2474 = fma(_2466, _1734, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2478 = _2476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2480 = _2416;
    if (_2450)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2482 = _2394;
    float _2484 = fma(_2474, _1838, _1942);
    float _2486 = fma(_2454, _2164, _2462);
    int _2488 = as_type<int>(_2482);
    if (_2450)
    {
        out.m_47.x = 0.0;
    }
    float _2490 = _2442 * 6.283185482025146484375;
    float _2492 = sin(_2490);
    if (_2450)
    {
        float _2494 = _2482 * 5.0;
        _2488 = as_type<int>(_2494);
    }
    int _2496 = _2488;
    float _2498 = fma(_2478, _1734, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2500 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2484);
    float _2502 = _2486 * 0.15915493667125701904296875;
    if (_2450)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7578 = as_type<float>(_2496);
        out.gl_Position.z = _7578;
    }
    float _2504 = _2442 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    float _2508 = _2468 * 6.283185482025146484375;
    float _2510 = sin(_2508);
    float _2512 = _2468 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    if (_2450)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2516 = _2500 * _2460;
    float _2518 = _2502 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    float _2522 = fma(_2498, _1838, _2470);
    float _2524 = _2266 * _2472;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _377);
    float _2530 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2522);
    float _2532 = _2492 * _2510;
    float _2534 = _2524 * _2526;
    float _2536 = _2502 * 6.283185482025146484375;
    float _2538 = sin(_2536);
    float _2540 = _2530 * _2458;
    float _2542 = _2506 * _2514;
    float _2544 = _2528 * _2534;
    float _2546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _359);
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2550 = _2492 * _2514;
    float _2552 = _2506 * _2510;
    float _2554 = _2506 * _2520;
    float _2556 = _2548 * _2524;
    float _2558 = _2514 * _2520;
    float _2560 = _2492 * _2520;
    float _2562 = _2510 * _2520;
    float _2564 = _2556 * _2546;
    float _2566 = _2554 * _2544;
    float _2568 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2570 = _2568 * 0.5;
    float _2572 = fma(_2538, _2542, _2532);
    float _2574 = -_2550;
    float _2576 = fma(_2538, _2552, _2574);
    float _2578 = -_2544;
    float _2580 = _2538 * _2578;
    float _2582 = -_2552;
    float _2584 = fma(_2538, _2550, _2582);
    float _2586 = fma(_2572, _2564, _2566);
    float _2588 = _2560 * _2544;
    float _2590 = fma(_2558, _2564, _2580);
    float _2592 = fma(_2538, _2532, _2542);
    float _2594 = fma(_2576, _2570, _2586);
    float _2596 = fma(_2584, _2564, _2588);
    float _2598 = fma(_2562, _2570, _2590);
    float _2600 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2592, _2570, _2596);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2606 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2608 = isnan(0.5);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2614 = _2610 || _2612;
    float _2616 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2618 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2620 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2622 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2616);
    float _2624 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2618);
    float _2626 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2620);
    float _2628 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2630 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2632 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2626);
    float _2634 = _1822 + _2628;
    float _2636 = _1722 + _2630;
    float _2638 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2642 = _2634 + _2640;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2646 = _2636 + _2644;
    float _2648 = _1762 + _2638;
    float _2650 = _2642 * _2642;
    float _2652 = fma(_2646, _2646, _2650);
    float _2654 = sqrt(_2652);
    bool _2656 = _2654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2602;
    float _2660 = _2550;
    float _2662 = _2636;
    float _2664 = _2648;
    float _2666 = _2556;
    if (!_2656)
    {
        _2658 = _2634;
    }
    float _2668 = _2658;
    float _2670 = _2668;
    if (!_2656)
    {
        _2660 = _2648;
    }
    float _2672 = _2660;
    bool _2674 = !_2656;
    float _2676 = _2672;
    if (!_2674)
    {
        float _2678 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2682 = _2654 + _2680;
        float _2684 = rsqrt(_2652);
        float _2686 = _2682 * _2678;
        float _2688 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2690 = _2686 * 0.15915493667125701904296875;
        float _2692 = _2690 * 6.283185482025146484375;
        float _2694 = sin(_2692);
        float _2696 = _2690 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = fma(_2694, _2688, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2702 = _2684 * _2700;
        float _2704 = _2698 + (-1.0);
        float _2706 = fma(_2646, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2708 = fma(_2642, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2710 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2712 = fma(_2648, _2698, _2710);
        _2662 = _2706;
        _2676 = _2712;
        _2670 = _2708;
    }
    float _2714 = _2662;
    float _2716 = _2676;
    float _2718 = _2670;
    float _2720 = -_2326;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2714);
    float _2724 = -_2308;
    float _2726 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2716);
    float _2728 = -_2368;
    float _2730 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2718);
    float _2732 = _2726;
    float _2734 = _2722;
    float _2736 = _2730;
    if (!_2614)
    {
        float _2738 = _2412 * _2412;
        float _2740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2742 = -_1822;
        float _2744 = _2742 + _2718;
        float _2746 = fma(_2416, _2416, _2738);
        float _2748 = fma(_2422, _2422, _2746);
        float _2750 = 1.0 / _2524;
        float _2752 = sqrt(_2748);
        float _2754 = precise::min(_2752, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2756 = _2754 * _2740;
        float _2758 = -_1722;
        float _2760 = _2758 + _2714;
        float _2762 = _2756 * _2750;
        float _2764 = -_1762;
        float _2766 = _2764 + _2716;
        float _2768 = fma(_2760, _2762, _2402);
        float _2770 = fma(_2766, _2762, _2398);
        float _2772 = fma(_2744, _2762, _2406);
        _2732 = _2770;
        _2734 = _2768;
        _2736 = _2772;
    }
    float _2774 = _2732;
    float _2776 = _2734;
    float _2778 = _2736;
    float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2782 = _2774 + _2780;
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2786 = _2776 + _2784;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2790 = _2778 + _2788;
    float _2792 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2794 = _2782 * _2782;
    float _2796 = fma(_2786, _2786, _2794);
    float _2798 = fma(_2790, _2790, _2796);
    float _2800 = rsqrt(_2798);
    float _2802 = sqrt(_2798);
    float _2804 = _2800 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2806 = _2786 * _2804;
    float _2808 = _2790 * _2804;
    float _2810 = _2806 * _2806;
    float _2812 = _2808 * _2808;
    float _2814 = _2810 + _2812;
    float _2816 = sqrt(_2814);
    bool _2818 = _2816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2822 = _2816 + _2820;
    float _2824 = _2790;
    float _2826 = _2814;
    float _2828 = _2822;
    float _2830 = _2804;
    if (_2818)
    {
        float _2832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _2832;
    }
    float _2834 = _2824;
    if (_2818)
    {
        float _2836 = rsqrt(_2814);
        _2826 = _2836;
    }
    float _2838 = _2826;
    float _2840 = _2838;
    if (_2818)
    {
        float _2842 = _2822 * _2834;
        _2828 = _2842;
    }
    float _2844 = _2828;
    if (_2818)
    {
        float _2846 = _2844 * 0.15915493667125701904296875;
        _2480 = _2846;
    }
    float _2848 = _2480;
    float _2850 = _2834;
    if (_2818)
    {
        float _2852 = _2848 * 6.283185482025146484375;
        float _2854 = sin(_2852);
        _2850 = _2854;
    }
    float _2856 = _2850;
    float _2858 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2860 = precise::max(0.0, _2858);
    float _2862 = _2794;
    float _2864 = _2860;
    if (_2818)
    {
        float _2866 = _2848 * 6.283185482025146484375;
        float _2868 = cos(_2866);
        _2862 = _2868;
    }
    float _2870 = _2862;
    float _2872 = -_2804;
    float _2874 = -_2860;
    float _2876 = fma(_2782, _2872, _2874);
    float _2878 = _2876;
    if (_2818)
    {
        float _2880 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2864 = _2880;
    }
    float _2882 = _2864;
    float _2884 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2886 = _2856;
    float _2888 = _2882;
    if (_2818)
    {
        float _2890 = fma(_2856, _2882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2886 = _2890;
    }
    float _2892 = _2886;
    float _2894 = _2892;
    float _2896 = _2870;
    if (_2818)
    {
        float _2898 = _2870 + (-1.0);
        _2888 = _2898;
    }
    float _2900 = _2888;
    float _2902 = _2900;
    if (_2818)
    {
        float _2904 = _2838 * _2892;
        _2664 = _2904;
    }
    float _2906 = _2664;
    if (!_2818)
    {
        _2894 = _2806;
    }
    float _2908 = _2894;
    float _2910 = _2908;
    if (_2818)
    {
        float _2912 = _2900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2830 = _2912;
    }
    float _2914 = _2830;
    if (_2818)
    {
        float _2916 = _2806 * _2906;
        _2910 = _2916;
    }
    float _2918 = _2910;
    if (!_2818)
    {
        _2902 = _2808;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    if (_2818)
    {
        float _2924 = _2808 * _2906;
        _2922 = _2924;
    }
    float _2926 = _2922;
    if (!_2818)
    {
        _2840 = _2810;
    }
    float _2928 = _2840;
    float _2930 = _2928;
    if (_2818)
    {
        float _2932 = fma(_2876, _2870, _2914);
        _2878 = _2932;
    }
    float _2934 = _2878;
    if (_2818)
    {
        float _2936 = _2918 * _2918;
        _2930 = _2936;
    }
    float _2938 = _2930;
    if (!_2818)
    {
        _2896 = _2812;
    }
    float _2940 = _2896;
    float _2942 = _2940;
    if (_2818)
    {
        float _2944 = _2926 * _2926;
        _2942 = _2944;
    }
    float _2946 = _2942;
    float _2948 = fma(_2934, _2934, _2938);
    float _2950 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2952 = _2948 + _2946;
    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2956 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2954);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2884);
    float _2962 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2964 = rsqrt(_2952);
    float _2966 = -_2958;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2960);
    float _2972 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2974 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2962);
    float _2976 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2950);
    float _2978 = _2970 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2980 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2972);
    float _2982 = abs(_2968);
    float _2984 = log2(_2982);
    float _2986 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2974);
    float _2988 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2976);
    float _2990 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2980);
    float _2992 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2994 = _2986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2996 = _2988 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2998 = _2990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3000 = _2964 * _2918;
    float _3002 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2964 * _2934;
    float _3006 = _2964 * _2926;
    float _3008 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3010 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3012 = -_2992;
    float _3014 = fma(_3012, _2792, 1.0);
    float _3016 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3018 = -_3008;
    float _3020 = fma(_3004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3018);
    float _3022 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3010);
    float _3024 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3026 = log2(_3014);
    float _3028 = -_3006;
    float _3030 = fma(_3028, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3020);
    float _3032 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3022);
    float _3034 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3036 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3024);
    float _3038 = fma(_3030, -0.5, 0.5);
    float _3040 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3034);
    float _3042 = exp2(_3016);
    float _3044 = _3004 + 1.0;
    float _3046 = fma(_3030, 0.5, 0.5);
    float _3048 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3040);
    float _3050 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3036);
    float _3052 = fma(_3046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3054 = 1.0 / _3032;
    float _3056 = _3026 * 0.693147182464599609375;
    float _3058 = fma(_3046, _3052, -0.212114393711090087890625);
    float _3060 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3062 = fma(_3046, _3058, 1.570728778839111328125);
    float _3064 = sqrt(_3038);
    float _3066 = -_3004;
    float _3068 = fma(_3042, _3044, _3066);
    float _3070 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3048);
    float _3072 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3050);
    float _3074 = fma(_3068, 0.5, 0.5);
    float _3076 = _3070 * _3054;
    float _3078 = _3072 * _3054;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = fma(_3078, -0.5, 0.5);
    float _3084 = _3064 * 0.636619746685028076171875;
    float3 _8529 = float3(_3080, _3082, _3060);
    float _3086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8529, float3(0.0), isnan(_8529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8529, float3(0.0), isnan(_8529)), level(0.0)).x;
    float _3088 = -_3062;
    float _3090 = fma(_3084, _3088, 1.0);
    float3 _8545 = float3(_3080, _3082, _3060);
    float4 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8545, float3(0.0), isnan(_8545)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8545, float3(0.0), isnan(_8545)), level(0.0)).xyzw;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = _3093.w;
    float2 _8562 = float2(_3090, _3074);
    float3 _3105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8562, float2(0.0), isnan(_8562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8562, float2(0.0), isnan(_8562)), level(0.0)).xyz;
    float _3107 = _3105.x;
    float _3109 = _3105.y;
    float _3111 = _3105.z;
    float _3113 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3115 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3117 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3119 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3121 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3113);
    float _3123 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3125 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3127 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3129 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3117);
    float _3131 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3115);
    float _3133 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3135 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3121);
    float _3137 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3139 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3119);
    float _3141 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3123);
    float _3143 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3125);
    float _3145 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3127);
    float _3147 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3129);
    float _3149 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3133);
    float _3151 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3153 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3137);
    float _3155 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3157 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3159 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3139);
    float _3161 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3141);
    float _3163 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3143);
    float _3165 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3167 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3145);
    float _3169 = -_2538;
    float _3171 = fma(_3169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3155);
    float _3173 = 1.0 / _3151;
    float _3175 = -_2538;
    float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3157);
    float _3179 = -_2538;
    float _3181 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3165);
    float _3183 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3185 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3187 = isnan(0.5);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3193 = _3189 || _3191;
    float _3195 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3197 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3199 = _377 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3201 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3183);
    float _3203 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3195);
    float _3205 = _3159 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3207 = _3161 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3209 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3197);
    float _3211 = fma(_3199, _3199, 1.0);
    float _3213 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3171);
    float _3215 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3181);
    float _3217 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3177);
    float _3219 = _3205 + _3151;
    float _3221 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3223 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3203);
    float _3225 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3227 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3229 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3209);
    float _3231 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3233 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3235 = rsqrt(_3211);
    float _3237 = _3207 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3239 = _3219 * _3173;
    float _3241 = _3239 * 0.5;
    float _3243 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3227);
    float _3245 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3231);
    float _3247 = _3123;
    float _3249 = _3173;
    float _3251 = _3213;
    float _3253 = _3151;
    float _3255 = _3119;
    float _3257 = _3217;
    float _3259 = _3070;
    float _3261 = _3072;
    float _3263 = _3032;
    if (!_3193)
    {
        _3247 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3265 = _3247;
    float _3267 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3233);
    float _3269 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3237);
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3273 = fma(_3241, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3271);
    float _3275 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3149);
    if (!_3193)
    {
        float _3277 = -_3265;
        float _3279 = _3277 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3249 = _3279;
    }
    float _3281 = _3249;
    float _3283 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3285 = 1.0 / _3273;
    float _3287 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3153);
    float _3289 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3291 = _3199 * _3235;
    float _3293 = _3199 * _3213;
    float _3295 = _3199 * _3217;
    out.m_72.x = _3275;
    out.m_72.y = _3283;
    out.m_72.z = _3287;
    float _3297 = -_3221;
    float _3299 = _3291 * _3297;
    float _3301 = _3281;
    float _3303 = _3289;
    if (!_3193)
    {
        float _3305 = 1.0 / _3281;
        _3301 = _3305;
    }
    float _3307 = _3301;
    float _3309 = fma(_3289, _3275, _3293);
    float _3311 = fma(_3289, _3283, _3295);
    float _3313 = _3199 * _3215;
    float _3315 = -_3223;
    float _3317 = _3291 * _3315;
    float _3319 = -_3229;
    float _3321 = _3291 * _3319;
    float _3323 = -_617;
    float _3325 = _3323 + _2774;
    float _3327 = fma(_3289, _3287, _3313);
    if (_3193)
    {
        _3303 = 1.0;
    }
    float _3329 = _3303;
    float _3331 = -_615;
    float _3333 = _3331 + _2776;
    float _3335 = fma(_3235, _3213, _3299);
    float _3337 = _3329;
    if (!_3193)
    {
        float _3339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3341 = -_3265;
        float _3343 = fma(_3285, _3339, _3341);
        _3251 = _3343;
    }
    float _3345 = _3251;
    float _3347 = fma(_3235, _3217, _3317);
    float _3349 = fma(_3235, _3215, _3321);
    float _3351 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3353 = -_619;
    float _3355 = _3353 + _2778;
    if (!_3193)
    {
        float _3357 = _3345 * _3307;
        float _3359 = precise::clamp(_3357, 0.0, 1.0);
        _3337 = _3359;
    }
    float _3361 = _3337;
    float _3363 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    out.m_74.x = _3335;
    out.m_74.y = _3347;
    out.m_74.z = _3349;
    float _3365 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3351);
    float _3367 = _3163 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3369 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3363);
    if (!_3193)
    {
        _3253 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3371 = _3253;
    float _3373 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3365);
    float _3375 = _3167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3377 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3369);
    out.m_76.y = 1.0;
    float _3379 = _3371;
    if (!_3193)
    {
        float _3381 = -_3371;
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3255 = _3383;
    }
    float _3385 = _3255;
    float _3387 = fma(_2996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3373);
    float _3389 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3391 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3393 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3395 = fma(_3367, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3267);
    float _3397 = _3385;
    if (!_3193)
    {
        float _3399 = 1.0 / _3385;
        _3397 = _3399;
    }
    float _3401 = _3397;
    float _3403 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3391);
    float _3405 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3393);
    float _3407 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3409 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3411 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3403);
    float _3413 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3405);
    float _3415 = _3407 + _3269;
    float _3417 = 1.0 / _3389;
    float _3419 = _3411 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3421 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3423 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3415);
    if (!_3193)
    {
        float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3427 = -_3371;
        float _3429 = fma(_3285, _3425, _3427);
        _3379 = _3429;
    }
    float _3431 = _3379;
    float _3433 = _3387 + _3032;
    float _3435 = _3070 + _3032;
    float _3437 = _3032 * 0.5;
    float _3439 = exp2(_3409);
    float _3441 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3395);
    float _3443 = _3431;
    if (!_3193)
    {
        float _3445 = _3431 * _3401;
        float _3447 = precise::clamp(_3445, 0.0, 1.0);
        _3443 = _3447;
    }
    float _3449 = _3443;
    float _3451 = _3433 * 0.5;
    float _3453 = _3435 * 0.5;
    float _3455 = fma(_3072, -0.5, _3437);
    if (_3193)
    {
        _3257 = 1.0;
    }
    float _3457 = _3257;
    float _3459 = 1.0 / _3423;
    float _3461 = _3419 * _3417;
    float _3463 = _3421 * _3417;
    float _3465 = _3457;
    if (!_3193)
    {
        float _3467 = -_3449;
        float _3469 = _3467 + 1.0;
        _3465 = _3469;
    }
    float _3471 = _3465;
    out.m_78.x = _3453;
    out.m_78.y = _3455;
    out.m_78.z = _3451;
    out.m_78.w = _3032;
    float _3473 = _3221 + _3309;
    float _3475 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3477 = _3367 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3479 = -_3439;
    float _3481 = _3479 + 1.0;
    out.gl_Position.x = _3070;
    out.gl_Position.y = _3072;
    out.gl_Position.z = _3387;
    out.gl_Position.w = _3032;
    float _3483 = _3223 + _3311;
    float _3485 = _3229 + _3327;
    float _3487 = _3481 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2776;
    out.m_80.y = _2774;
    out.m_80.z = _2778;
    float _3489 = _3475 + _3243;
    float _3491 = _3477 + _3245;
    float _3493 = _3441 * _3459;
    out.m_82.x = _3473;
    out.m_82.y = _3483;
    out.m_82.z = _3485;
    float _3495 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3489);
    float _3497 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3491);
    bool _3499 = _3493 > 0.0;
    float _3501 = -_3487;
    float _3503 = _3501 + 1.0;
    float _3505 = _3497 * _3459;
    bool _3507 = _3493 < 1.0;
    bool _3509 = _3507 && _3499;
    bool _3511 = _3076 > (-1.0);
    bool _3513 = _3511 && _3509;
    bool _3515 = _3078 > (-1.0);
    bool _3517 = _3515 && _3513;
    bool _3519 = _3076 < 1.0;
    bool _3521 = _3519 && _3517;
    bool _3523 = _3078 < 1.0;
    bool _3525 = _3523 && _3521;
    float _3527 = _3487 * _3086;
    float _3529 = _3495 * _3459;
    float _3531 = _3101 * _3527;
    float _3533 = _3101 * _3503;
    float _3535 = _3111 * _3527;
    float _3537 = fma(_3107, _3531, _3095);
    float _3539 = fma(_3109, _3531, _3097);
    float _3541 = fma(_3101, _3535, _3099);
    out.m_84.x = _3537;
    out.m_84.y = _3539;
    out.m_84.z = _3541;
    out.m_84.w = _3533;
    bool _3543 = !_3525;
    float _3545 = _3539;
    float _3547 = _3537;
    float _3577;
    float _3583;
    if (!_3543)
    {
        float _3549 = -_3505;
        float _3551 = _3078 + _3549;
        float _3553 = -_3529;
        float _3555 = _3076 + _3553;
        float _3557 = -_3461;
        float _3559 = _3076 + _3557;
        float _3561 = -_3463;
        float _3563 = _3078 + _3561;
        float _3565 = _3551 * _3551;
        float _3567 = fma(_3555, _3555, _3565);
        float _3569 = sqrt(_3567);
        bool _3571 = _3569 > 0.0;
        float _3573 = _3361 * _3471;
        float _3575 = _3573 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        _3547 = _3567;
        _3577 = _3573;
        if (!_3571)
        {
            _3545 = _3575;
        }
        float _3579 = _3545;
        bool _3581 = !_3571;
        _3583 = _3579;
        _3585 = _3581;
        if (!_3585)
        {
            float _3587 = _3563 * _3563;
            float _3589 = fma(_3559, _3559, _3587);
            float _3591 = rsqrt(_3567);
            float _3593 = sqrt(_3589);
            float _3595 = _3555 * _3591;
            float _3597 = _3551 * _3591;
            bool _3599 = _3593 > 0.0;
            float _3601 = _3593;
            _3577 = _3591;
            if (!_3599)
            {
                _3601 = _3575;
            }
            float _3603 = _3601;
            bool _3605 = !_3599;
            _3583 = _3603;
            _3585 = _3605;
            if (!_3585)
            {
                float _3607 = _2556 * _3375;
                float _3609 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3611 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3407);
                float _3613 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3477);
                float _3615 = fma(_3607, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3475);
                float _3617 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3611);
                float _3619 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3613);
                float _3621 = fma(_3375, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3615);
                float _3623 = rsqrt(_3589);
                float _3625 = _3609 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3627 = 1.0 / _3617;
                float _3629 = _3563 * _3625;
                float _3631 = _3559 * _3625;
                float _3633 = _3629 * _3629;
                float _3635 = fma(_3631, _3631, _3633);
                float _3637 = _3619 * _3627;
                float _3639 = _3621 * _3627;
                float _3641 = sqrt(_3635);
                float _3643 = _3637 * _3637;
                float _3645 = fma(_3639, _3639, _3643);
                float _3647 = _3563 * _3623;
                float _3649 = _3559 * _3623;
                float _3651 = _3597 * _3647;
                float _3653 = sqrt(_3645);
                float _3655 = fma(_3595, _3649, _3651);
                float _3657 = precise::min(0.0, _3655);
                float _3659 = _3032 * _3657;
                float _3661 = fma(_3641, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3653);
                float _3663 = fma(_3631, _3659, _3070);
                float _3665 = fma(_3629, _3659, _3072);
                float _3667 = 1.0 / _3661;
                out.gl_Position.x = _3663;
                out.gl_Position.y = _3665;
                float _3669 = _3653 * _3667;
                out.m_76.y = _3669;
                _3259 = _3663;
                _3583 = _3575;
                _3547 = _3629;
                _3261 = _3665;
                _3577 = _3659;
                _2666 = _3655;
                _3585 = true;
            }
        }
    }
    else
    {
        float _3671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3671;
        _3259 = 0.0;
        _3583 = 0.0;
        _3261 = 0.0;
        _3577 = _3671;
    }
    _3585 = false;
    float _3673 = _3259;
    float _3675 = _3583;
    float _3677 = _3547;
    float _3679 = _3261;
    float _3681 = _3577;
    float _3683 = _2666;
    bool _3685 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3687 = isnan(_2802);
    bool _3689 = _3685 || _3687;
    bool _3691 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3693 = _3689 || _3691;
    float _3695 = _3677;
    float _3697 = _3681;
    float _3699 = _3679;
    float _3701 = _3673;
    float _3703 = _3683;
    if (!_3693)
    {
        _3695 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3705 = _3695;
    float _3707 = _3705;
    float _3709 = _3705;
    if (!_3693)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3711 = _3263;
    float _3713 = _3711;
    float _3715 = _3711;
    if (!_3693)
    {
        _3697 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3717 = _3697;
    float _3719 = _3717;
    float _3721 = _3717;
    if (!_3693)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3723 = _3699;
    float _3725 = _3723;
    float _3727 = _3723;
    if (!_3693)
    {
        _3701 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3729 = _3701;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3693)
    {
        _3703 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3735 = _3703;
    bool _3737 = !_3693;
    float _3739 = _3735;
    float _3741 = _3735;
    if (!_3737)
    {
        bool _3743 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3745 = isnan(_2802);
        bool _3747 = _3743 || _3745;
        bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3751 = _3747 || _3749;
        if (!_3751)
        {
            float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3755 = _2802 + _3753;
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3765 = 1.0 / _3759;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3783 = _3755 * _3765;
            float _3785 = precise::clamp(_3783, 0.0, 1.0);
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3791 = fma(_3785, _3763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3715 = _3795;
            _3733 = _3799;
            _3709 = _3791;
            _3727 = _3797;
            _3721 = _3793;
            _3741 = _3801;
            _3803 = true;
        }
        else
        {
            bool _3805 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3807 = isnan(_2802);
            bool _3809 = _3805 || _3807;
            bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3813 = _3809 || _3811;
            if (!_3813)
            {
                _3707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3815 = _3707;
            _3709 = _3815;
            if (!_3813)
            {
                _3713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3817 = _3713;
            _3715 = _3817;
            if (!_3813)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3819 = _3719;
            _3721 = _3819;
            if (!_3813)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3821 = _3725;
            _3727 = _3821;
            if (!_3813)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3823 = _3731;
            _3733 = _3823;
            if (!_3813)
            {
                _3739 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3825 = _3739;
            bool _3827 = !_3813;
            _3741 = _3825;
            if (!_3827)
            {
                bool _3829 = _2802 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3831 = isnan(_2802);
                bool _3833 = _3829 || _3831;
                bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3837 = _3833 || _3835;
                if (!_3837)
                {
                    float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3841 = _2802 + _3839;
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3851 = 1.0 / _3845;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3869 = _3841 * _3851;
                    float _3871 = precise::clamp(_3869, 0.0, 1.0);
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3877 = fma(_3871, _3849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3715 = _3881;
                    _3733 = _3885;
                    _3709 = _3877;
                    _3727 = _3883;
                    _3721 = _3879;
                    _3741 = _3887;
                    _3803 = true;
                }
                else
                {
                    _3715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3741 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3803 = false;
    float _3889 = _3715;
    float _3891 = _3733;
    float _3893 = _3709;
    float _3895 = _3727;
    float _3897 = _3721;
    float _3899 = _3741;
    float _3901 = fma(_3483, -0.5, 0.5);
    float _3903 = precise::clamp(_3901, 0.0, 1.0);
    float _3905 = -_3889;
    float _3907 = _3905 + _3891;
    float _3909 = _3675 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3911 = -_3893;
    float _3913 = _3911 + _3895;
    float _3915 = fma(_3903, _3907, _3889);
    out.m_86.x = 0.0;
    float _3917 = -_3897;
    float _3919 = _3917 + _3899;
    float _3921 = fma(_3903, _3913, _3893);
    float _3923 = _3915 * 0.586610972881317138671875;
    out.m_47.x = _3909;
    bool _3925 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3927 = fma(_3903, _3919, _3897);
    float _3929 = fma(_3921, 0.298911988735198974609375, _3923);
    bool _3931 = _3361 > 0.0;
    bool _3933 = isnan(_3361);
    bool _3935 = _3931 || _3933;
    bool _3937 = isnan(0.0);
    bool _3939 = _3935 || _3937;
    float _3941 = fma(_3927, 0.114477999508380889892578125, _3929);
    bool _3943 = _3471 <= 0.0;
    bool _3945 = !_3939;
    bool _3947 = _3943 || _3945;
    float _3949 = -_3941;
    float _3951 = _3921 + _3949;
    float _3953 = -_3941;
    float _3955 = _3915 + _3953;
    float _3957 = -_3941;
    float _3959 = _3927 + _3957;
    float _3961 = fma(_3951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    float _3963 = fma(_3955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    float _3965 = fma(_3959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3941);
    bool _3967 = !_3925;
    if (!_3967)
    {
        float _3969 = -_2774;
        float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3973 = -_2776;
        float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3977 = -_2778;
        float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3981 = _3971 * _3971;
        float _3983 = fma(_3975, _3975, _3981);
        float _3985 = fma(_3979, _3979, _3983);
        float _3987 = sqrt(_3985);
        float _3989 = rsqrt(_3985);
        float _3991 = -_3987;
        float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3995 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3997 = precise::clamp(_3995, 0.0, 1.0);
        float _3999 = _3975 * _3989;
        float _4001 = _3971 * _3989;
        float _4003 = abs(_3997);
        float _4005 = log2(_4003);
        float _4007 = _3979 * _3989;
        float _4009 = _3999 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4011 = _3483 * _4001;
        float _4013 = -_4001;
        float _4015 = -_4009;
        float _4017 = fma(_4013, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4015);
        float _4019 = fma(_3473, _3999, _4011);
        float _4021 = -_4007;
        float _4023 = fma(_4021, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4017);
        float _4025 = fma(_3485, _4007, _4019);
        float _4027 = precise::clamp(_4025, 0.0, 1.0);
        float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4031 = _4023 + _4029;
        float _4033 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4035 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4037 = precise::clamp(_4035, 0.0, 1.0);
        float _4039 = exp2(_4033);
        float _4041 = _4039 * _4037;
        float _4043 = _4027 * _4041;
        float _4045 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4047 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4049 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _4045;
        out.m_86.y = _4047;
        out.m_86.z = _4049;
    }
    out.m_88.x = _3961;
    out.m_88.y = _3963;
    out.m_88.z = _3965;
    if (!_3947)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_47.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4051;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

