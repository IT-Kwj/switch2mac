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
    float4 m_76 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3667 = false;
    bool _3449 = false;
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
        float _3952 = as_type<float>(_123);
        out.gl_Position.z = _3952;
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
        float _4026 = as_type<float>(_163);
        out.gl_Position.z = _4026;
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
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = _647 + _655;
    bool _659 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _661 = isnan(_647);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _673 = int(_671);
    bool _675 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_647);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = float(_651);
    float _689 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _691 = int(_689);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _695 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _693);
    float _697 = float(uint(_673));
    float _699 = 1.0 / _687;
    int _701 = ~_673;
    int _703 = _701 + 1;
    float _705 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _695);
    int _707 = ~_673;
    int _709 = _707 + 1;
    bool _711 = _673 == 0;
    float _713 = -_705;
    float _715 = _713 + 1.0;
    float _717 = 1.0 / _697;
    float _719 = float(_691);
    float _721 = _699 * _143;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _725 = int(_723);
    int _727 = as_type<int>(_717) + (-2);
    float _729 = trunc(_721);
    int _731 = int(_729);
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _735 = _733 != 0;
    float _737 = 1.0 / _719;
    float _739 = float(uint(_725));
    int _741 = ~_725;
    int _743 = _741 + 1;
    int _745 = ~_725;
    int _747 = _745 + 1;
    float _749 = float(uint(_731));
    float _751 = 1.0 / _739;
    float _753 = as_type<float>(_727) * _749;
    float _755 = _737 * _143;
    float _757 = trunc(_753);
    float _759 = precise::max(_757, 0.0);
    uint _762 = uint(_759);
    float _764 = in.m_51.y;
    float _766 = trunc(_755);
    int _768 = int(_766);
    int _770 = as_type<int>(_751) + (-2);
    float _772 = _753;
    if (_735)
    {
        _772 = _129;
    }
    float _774 = _772;
    int _776 = _703 * int(_762);
    int _778 = _776 + _731;
    float _780 = 1.0 / _653;
    float _782 = float(uint(_778));
    float _784 = as_type<float>(_778);
    float _786 = _774;
    if (_735)
    {
        _784 = 1.0;
    }
    float _788 = _784;
    float _790 = float(uint(_768));
    float _792 = as_type<float>(_727) * _782;
    float _794 = _788;
    float _796 = _790;
    if (!_735)
    {
        _794 = 1.2345600128173828125;
    }
    float _798 = _794;
    if (!_735)
    {
        _786 = _764;
    }
    float _800 = _786;
    float _802 = as_type<float>(_770) * _790;
    if (_735)
    {
        _796 = 1.0;
    }
    float _804 = _796;
    float _806 = trunc(_792);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    float _812 = _804;
    if (!_735)
    {
        _812 = 7.345489978790283203125;
    }
    float _814 = _812;
    float _816 = _798 * _800;
    float _818 = float(_725);
    float _820 = _814 * _129;
    float _822 = trunc(_802);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    float _828 = floor(_820);
    int _830 = ~_725;
    int _832 = _830 + 1;
    int _834 = int(_762) + int(_810);
    int _836 = _832 * int(_826);
    int _838 = _836 + _768;
    float _840 = floor(_816);
    int _842 = _709 * _834;
    int _844 = _842 + _731;
    float _846 = float(uint(_838));
    float _848 = -_828;
    float _850 = _820 + _848;
    bool _852 = uint(_844) >= uint(_673);
    float _854 = as_type<float>(_770) * _846;
    float _856 = float(_673);
    float _858 = _780 * _143;
    float _860 = trunc(_854);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = _850 * _856;
    bool _868 = !_852;
    int _870 = _868 ? 0 : (-1);
    float _872 = -_840;
    float _874 = _816 + _872;
    float _876 = float(_731);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _880 = _878 != 0;
    float _882 = trunc(_866);
    int _884 = int(_882);
    bool _886 = _876 >= _856;
    bool _888 = isnan(_876);
    bool _890 = _886 || _888;
    bool _892 = isnan(_856);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _856 * _858;
    int _900 = ~_834;
    int _902 = _900 + _870;
    int _904 = _902 + 1;
    float _906 = _818 * _858;
    bool _908 = !_880;
    int _910 = _908 ? 0 : 1;
    float _912 = _874 * _818;
    float _914 = float(_768);
    float _916 = trunc(_896);
    int _918 = int(_916);
    int _920 = abs(_910);
    bool _922 = _914 >= _818;
    bool _924 = isnan(_914);
    bool _926 = _922 || _924;
    bool _928 = isnan(_818);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    int _934 = int(_826) + int(_864);
    int _936 = _884 * _920;
    int _938 = _936 + _731;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _942 = _940 != 0;
    int _944 = _673 * _904;
    int _946 = _944 + _731;
    int _948 = _743 * _934;
    int _950 = _948 + _768;
    float _952 = trunc(_912);
    int _954 = int(_952);
    bool _956 = !_942;
    int _958 = _956 ? 0 : 1;
    float _960 = _589 * _167;
    bool _962 = !_711;
    int _964 = _962 ? _946 : (-1);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _972 = _970 != 0;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _976 = _974 != 0;
    bool _978 = uint(_950) >= uint(_725);
    float _980 = trunc(_898);
    int _982 = int(_980);
    int _984 = ~_918;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    bool _990 = !_978;
    int _992 = _990 ? 0 : (-1);
    int _994 = abs(_958);
    int _996 = _964 * _988;
    bool _998 = !_972;
    int _1000 = _998 ? 0 : 1;
    float _1002 = trunc(_932);
    int _1004 = int(_1002);
    int _1006 = _673 + (-1);
    int _1008 = ~_934;
    int _1010 = _1008 + _992;
    int _1012 = _1010 + 1;
    int _1014 = abs(_1000);
    int _1016 = _918 * _1006;
    int _1018 = _1016 + _996;
    bool _1020 = !_968;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _954 * _994;
    int _1026 = _1024 + _768;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1030 = _1028 != 0;
    int _1032 = _725 * _1012;
    int _1034 = _1032 + _768;
    bool _1036 = !_976;
    int _1038 = _1036 ? 0 : 1;
    int _1040 = _1018 * _1014;
    int _1042 = abs(_1022);
    float _1044 = trunc(_906);
    int _1046 = int(_1044);
    bool _1048 = _725 == 0;
    float _1050 = in.m_51.w;
    int _1052 = abs(_1038);
    int _1054 = _982 * _1042;
    int _1056 = _1054 + _1040;
    bool _1058 = !_1030;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = ~_1004;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1048;
    int _1070 = _1068 ? _1034 : (-1);
    float _1072 = _589 * _175;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1088 = _1086 != 0;
    int _1090 = _1070 * _1066;
    int _1092 = abs(_1060);
    int _1094 = _938 * _1052;
    int _1096 = _1094 + _1056;
    int _1098 = _725 + (-1);
    float _1100 = fma(_591, _173, _1072);
    float _1102 = _764 * 2.0;
    bool _1104 = !_1080;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1004 * _1098;
    int _1110 = _1108 + _1090;
    bool _1112 = !_1076;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _884 * _1092;
    int _1118 = _1116 + _1096;
    int _1120 = abs(_1106);
    bool _1122 = !_1084;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = abs(_1114);
    bool _1128 = !_1088;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = abs(_1124);
    int _1134 = _1110 * _1120;
    float _1136 = float(uint(_1118));
    float _1138 = _589 * _181;
    int _1140 = abs(_1130);
    int _1142 = _1046 * _1126;
    int _1144 = _1142 + _1134;
    float _1146 = as_type<float>(_727) * _1136;
    float _1148 = in.m_51.z;
    int _1150 = ~_725;
    int _1152 = _1150 + 1;
    int _1154 = _1026 * _1132;
    int _1156 = _1154 + _1144;
    int _1158 = ~_673;
    int _1160 = _1158 + 1;
    float _1162 = trunc(_1146);
    float _1164 = precise::max(_1162, 0.0);
    uint _1166 = uint(_1164);
    bool _1168 = _673 == 0;
    int _1170 = _954 * _1140;
    int _1172 = _1170 + _1156;
    int _1174 = ~_673;
    int _1176 = _1174 + 1;
    float _1178 = float(uint(_1172));
    float _1180 = as_type<float>(_770) * _1178;
    int _1182 = _1176 * int(_1166);
    int _1184 = _1182 + _1118;
    float _1186 = trunc(_1180);
    float _1188 = precise::max(_1186, 0.0);
    uint _1190 = uint(_1188);
    float _1192 = float(uint(_1184));
    float _1194 = as_type<float>(_727) * _1192;
    float _1196 = trunc(_1194);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = _1152 * int(_1190);
    int _1204 = _1202 + _1172;
    float _1206 = float(uint(_1204));
    float _1208 = as_type<float>(_770) * _1206;
    int _1210 = int(_1166) + int(_1200);
    float _1212 = trunc(_1208);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    int _1218 = ~_725;
    int _1220 = _1218 + 1;
    int _1222 = _1160 * _1210;
    int _1224 = _1222 + _1118;
    bool _1226 = uint(_1224) >= uint(_673);
    bool _1228 = !_1226;
    int _1230 = _1228 ? 0 : (-1);
    int _1232 = int(_1190) + int(_1216);
    int _1234 = ~_1210;
    int _1236 = _1234 + _1230;
    int _1238 = _1236 + 1;
    float _1240 = float(uint(_938));
    int _1242 = _673 * _1238;
    int _1244 = _1242 + _1118;
    int _1246 = _1220 * _1232;
    int _1248 = _1246 + _1172;
    float _1250 = as_type<float>(_727) * _1240;
    bool _1252 = !_1168;
    int _1254 = _1252 ? _1244 : (-1);
    bool _1256 = uint(_1248) >= uint(_725);
    float _1258 = trunc(_1250);
    float _1260 = precise::max(_1258, 0.0);
    uint _1262 = uint(_1260);
    int _1264 = _1254 & 3;
    bool _1266 = _1264 != 0;
    bool _1268 = !_1256;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = uint(_1264) > 1u;
    int _1274 = _1254 & 3;
    bool _1276 = _1274 != 0;
    int _1278 = ~_1232;
    int _1280 = _1278 + _1270;
    int _1282 = _1280 + 1;
    int _1284 = _1276 ? 0 : 1;
    bool _1286 = _1264 != 3;
    int _1288 = _725 * _1282;
    int _1290 = _1288 + _1172;
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _129 * 2.0;
    bool _1300 = uint(_1264) >= 2u;
    int _1302 = _1296;
    float _1304 = _1102;
    if (!_1272)
    {
        int _1306 = ~_1284;
        int _1308 = _1306 + 1;
        _1302 = _1308;
    }
    int _1310 = _1302;
    float _1312 = floor(_1298);
    float _1314 = float(uint(_1026));
    int _1316 = _1300 ? 0 : 1;
    bool _1318 = !_1048;
    int _1320 = _1318 ? _1290 : (-1);
    float _1322 = as_type<float>(_770) * _1314;
    int _1324 = ~_1316;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    int _1330 = _1328;
    if (_1286)
    {
        int _1332 = ~_1316;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = trunc(_1322);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    int _1344 = _1320 & 3;
    bool _1346 = _1344 != 0;
    int _1348 = _1320 & 3;
    bool _1350 = _1348 != 0;
    int _1352 = ~_673;
    int _1354 = _1352 + 1;
    bool _1356 = uint(_1344) >= 2u;
    int _1358 = _1350 ? 0 : 1;
    int _1360 = _1354 * int(_1262);
    int _1362 = _1360 + _938;
    bool _1364 = uint(_1344) > 1u;
    int _1366 = _1356 ? 0 : 1;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1370 = _1368 != 0;
    bool _1372 = _1344 != 3;
    float _1374 = floor(_1102);
    float _1376 = float(uint(_1362));
    int _1378 = _747 * int(_1342);
    int _1380 = _1378 + _1026;
    int _1382 = ~_1358;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    int _1388 = ~_1366;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = as_type<float>(_727) * _1376;
    float _1396 = float(uint(_1380));
    int _1398 = _1386;
    int _1400 = as_type<int>(_1376);
    int _1402 = _1392;
    if (!_1364)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1398 = _1406;
    }
    int _1408 = _1398;
    float _1410 = as_type<float>(_770) * _1396;
    bool _1412 = _129 > 0.5;
    float _1414 = trunc(_1394);
    float _1416 = precise::max(_1414, 0.0);
    uint _1418 = uint(_1416);
    if (_1370)
    {
        _1400 = 0;
    }
    int _1420 = _1400;
    int _1422 = _1420;
    if (_1372)
    {
        int _1424 = ~_1366;
        int _1426 = _1424 + 1;
        _1402 = _1426;
    }
    int _1428 = _1402;
    if (!_1370)
    {
        _1422 = 1;
    }
    int _1430 = _1422;
    int _1432 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1434 = _1432 != 0;
    float _1436 = trunc(_1410);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    float _1442 = -_359;
    int _1444 = _1412 ? as_type<int>(_1442) : as_type<int>(_359);
    bool _1446 = _764 > 0.5;
    bool _1448 = !_1434;
    float _1450 = _1448 ? _359 : as_type<float>(_1444);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1454 = _1452 != 0;
    float _1456 = -_377;
    float _1458 = _1446 ? _1456 : _377;
    float _1460 = _1450 + 0.5;
    bool _1462 = _1148 > 0.5;
    bool _1464 = _1050 > 0.5;
    float _1466 = fma(_591, _165, _960);
    bool _1468 = !_1454;
    float _1470 = _1468 ? _377 : _1458;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    float _1476 = -_359;
    int _1478 = _1462 ? as_type<int>(_1476) : as_type<int>(_359);
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1482 = _1480 != 0;
    float _1484 = -_377;
    int _1486 = _1464 ? as_type<int>(_1484) : as_type<int>(_377);
    bool _1488 = !_1474;
    float _1490 = _1488 ? _359 : as_type<float>(_1478);
    bool _1492 = _1430 != 1;
    bool _1494 = _1312 > 0.0;
    float _1496 = _1490 + 0.5;
    bool _1498 = !_1482;
    float _1500 = _1498 ? _377 : as_type<float>(_1486);
    bool _1502 = _1312 >= 0.0;
    bool _1504 = isnan(_1312);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    int _1512 = int(_1262) + int(_1418);
    int _1514 = ~_673;
    int _1516 = _1514 + 1;
    int _1518 = _1510 ? 0 : 1;
    int _1520 = ~_725;
    int _1522 = _1520 + 1;
    int _1524 = _1516 * _1512;
    int _1526 = _1524 + _938;
    int _1528 = int(_1342) + int(_1440);
    bool _1530 = _1374 > 0.0;
    int _1532 = ~_1518;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    float _1538 = as_type<float>(_1440);
    float _1540 = _1458;
    int _1542 = _1536;
    if (!_1492)
    {
        _225 = _764;
    }
    float _1544 = _225;
    float _1546 = _1544;
    if (!_1492)
    {
        _1304 = _764;
    }
    float _1548 = _1304;
    float _1550 = _1548;
    if (!_1492)
    {
        _1538 = _1148;
    }
    float _1552 = _1538;
    float _1554 = _1552;
    if (!_1492)
    {
        _1540 = _1148;
    }
    float _1556 = _1540;
    float _1558 = _1556;
    if (!_1494)
    {
        int _1560 = ~_1518;
        int _1562 = _1560 + 1;
        _1542 = _1562;
    }
    int _1564 = _1542;
    if (_1492)
    {
        _1546 = _129;
    }
    float _1566 = _1546;
    if (_1492)
    {
        _1550 = _129;
    }
    float _1568 = _1550;
    if (_1492)
    {
        _1554 = _764;
    }
    float _1570 = _1554;
    if (_1492)
    {
        _1558 = _764;
    }
    float _1572 = _1558;
    bool _1574 = uint(_1526) >= uint(_673);
    int _1576 = _1522 * _1528;
    int _1578 = _1576 + _1026;
    bool _1580 = _1374 >= 0.0;
    bool _1582 = isnan(_1374);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    float _1590 = fma(_591, _179, _1138);
    float _1592 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1594 = _1588 ? 0 : 1;
    bool _1596 = uint(_1578) >= uint(_725);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1610 = !_1574;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = 1.0 / _1600;
    int _1616 = ~_1594;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    bool _1622 = !_1266;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1636 = _1634 != 0;
    float _1638 = fma(_613, _183, _1590);
    int _1640 = _1620;
    if (!_1530)
    {
        int _1642 = ~_1594;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = 1.0 / _1604;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1652 = _1650 != 0;
    float _1654 = _1148 * 2.0;
    int _1656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1658 = _1656 != 0;
    float _1660 = fma(_613, _169, _1466);
    float _1662 = _764 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1668 = in.m_57.w;
    float _1670 = fma(_613, _177, _1100);
    float _1672 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1676 = 1.0 / _1666;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1680 = _647 + _1678;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1684 = -_1674;
    float _1686 = fma(_1672, 2.0, _1684);
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1690 = _647 + _1688;
    float _1692 = _657 * _1648;
    float _1694 = fma(_1662, -2.0, _1682);
    float _1696 = floor(_1654);
    float _1698 = in.m_55.w;
    float _1700 = _129 + _764;
    float _1702 = _1690 * _1614;
    bool _1704 = !_1596;
    int _1706 = _1704 ? 0 : (-1);
    float _1708 = in.m_59.w;
    float _1710 = _1700 + (-1.0);
    float _1712 = _1148 + _764;
    float _1714 = 1.0 / _1608;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1718 = _647 + _1716;
    float _1720 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1722 = _1712 + (-1.0);
    float _1724 = _1680 * _1676;
    float _1726 = _1670 + _1668;
    float _1728 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1730 = _129 + _1148;
    bool _1732 = _1696 >= 0.0;
    bool _1734 = isnan(_1696);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan(0.0);
    bool _1740 = _1736 || _1738;
    float _1742 = -_143;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1686);
    float _1746 = _1730 + (-1.0);
    int _1748 = _1740 ? 0 : 1;
    float _1750 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1694);
    float _1752 = _1718 * _1714;
    bool _1754 = _1696 > 0.0;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1756;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1762;
    bool _1766 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1768 = isnan(_647);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = _1660 + _1698;
    float _1780 = fma(_1758, _1692, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1782 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1784 = isnan(_647);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = fma(_1764, _1692, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1800 = _1638 + _1708;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1806 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1808 = isnan(_647);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = -_1776;
    float _1820 = _1818 + 1.0;
    float _1822 = fma(_1798, _1752, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1824 = -_1792;
    float _1826 = _1824 + 1.0;
    float _1828 = fma(_1804, _1752, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1830 = _1816 * _1820;
    float _1832 = _669 * _1826;
    float _1834 = -_669;
    float _1836 = _1834 + 1.0;
    bool _1838 = !_1632;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = -_1816;
    float _1844 = _1842 + 1.0;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1846;
    float _1850 = _685 * _1836;
    int _1852 = abs(_1840);
    float _1854 = -_685;
    float _1856 = _1854 + 1.0;
    float _1858 = fma(_1848, _1702, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1860 = _1780 * _1850;
    float _1862 = _1794 * _1850;
    float _1864 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1860);
    float _1866 = _1792 * _1844;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1862);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1872;
    float _1876 = fma(_1822, _1832, _1864);
    float _1878 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1868);
    float _1880 = fma(_1828, _1832, _1870);
    float _1882 = float(_1564);
    float _1884 = fma(_1874, _1702, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1886 = float(_1852);
    float _1888 = _1470 + (-0.5);
    float _1890 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1892 = !_1628;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = _1886 * _1882;
    float _1898 = -_1888;
    float _1900 = -_1750;
    float _1902 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1900);
    float _1904 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1906 = log2(_1904);
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1910 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1744);
    int _1912 = _1320 >> 31;
    float _1914 = -_1908;
    float _1916 = fma(_1890, 2.0, _1914);
    int _1918 = abs(_1894);
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1922 = _1254 >> 31;
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1778 + _1924;
    int _1928 = _1912 & 3;
    float _1930 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1920);
    int _1932 = _1922 & 3;
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1936 = _1726 + _1934;
    float _1938 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1930);
    int _1940 = _1254 + _1932;
    float _1942 = _1906 * _143;
    int _1944 = _1320 + _1928;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1948 = _1940 >> 2;
    float _1950 = fma(_1858, _1866, _1880);
    bool _1952 = !_1346;
    int _1954 = _1952 ? 0 : 1;
    float _1956 = exp2(_1942);
    bool _1958 = _1264 != 3;
    float _1960 = fma(_1592, -2.0, _1946);
    int _1962 = _1944 >> 2;
    float _1964 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1966 = _1948 << 4;
    int _1968 = _1966 + 368;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1972 = _1800 + _1970;
    bool _1974 = !_1958;
    int _1976 = _1974 ? 0 : (-1);
    float _1978 = -_143;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1916);
    bool _1982 = _1344 != 3;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1986 = 1.0 + _1984;
    uint _1988 = uint(int(uint(_1968) >> uint(2)));
    uint _1990 = uint(int(uint(int(_1988)) >> uint(2)));
    int _1992 = int(_1988) & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = int(_1988) + 1;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    int _2000 = _1996 & 3;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[int(_1998)][_2000];
    int _2004 = _1962 << 4;
    int _2006 = _2004 + 512;
    float _2008 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1878);
    int _2010 = ~_1748;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2018 = _2014;
    if (!_1754)
    {
        int _2020 = ~_1748;
        int _2022 = _2020 + 1;
        _2018 = _2022;
    }
    int _2024 = _2018;
    float _2026 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1964);
    float _2028 = -_1956;
    float _2030 = _2028 + 1.0;
    uint _2032 = uint(int(uint(_2006) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    float _2048 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2016);
    bool _2050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2026);
    float _2062 = 1.0 / _1986;
    float _2064 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2048);
    float _2066 = _2058 ? _2030 : 0.0;
    float _2068 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1980);
    int _2070 = _1968 + 8;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    bool _2088 = _2060 >= 0.0;
    float _2090 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1960);
    bool _2092 = !_1982;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = _129 + (-0.5);
    bool _2098 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2100 = isnan(1.0);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_1918);
    int _2110 = _2006 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = float(_2024);
    int _2130 = ~_1512;
    int _2132 = _2130 + _1612;
    int _2134 = _2132 + 1;
    int _2136 = abs(_1310);
    float _2138 = _2108 * _2128;
    float _2140 = 0.0;
    int _2142 = as_type<int>(_2138);
    if (_2088)
    {
        _2140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2144 = _2140;
    float _2146 = in.m_66.x;
    float _2148 = in.m_66.y;
    float _2150 = in.m_66.z;
    int _2152 = abs(_1624);
    if (_2106)
    {
        float _2154 = _2066 * _2062;
        _145 = _2154;
    }
    float _2156 = _145;
    int _2158 = abs(_1408);
    float _2160 = _2138 * (-2.0);
    if (_2088)
    {
        float _2162 = _2144 * 5.0;
        _2142 = as_type<int>(_2162);
    }
    int _2164 = _2142;
    int _2166 = _673 * _2134;
    int _2168 = _2166 + _938;
    int _2170 = abs(_1954);
    float _2172 = _1500 + (-0.5);
    if (_2088)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6915 = as_type<float>(_2164);
        out.gl_Position.z = _6915;
    }
    int _2174 = ~_2136;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = _1926 * _1926;
    int _2182 = abs(_2094);
    float _2184 = -_2172;
    float _2186 = -_2090;
    float _2188 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2186);
    int _2190 = ~_1528;
    int _2192 = _2190 + _1706;
    int _2194 = _2192 + 1;
    int _2196 = _2178 * as_type<int>(_2002);
    bool _2198 = _673 == 0;
    if (_2088)
    {
        out.m_47.x = 0.0;
    }
    bool _2200 = _725 == 0;
    int _2202 = _725 * _2194;
    int _2204 = _2202 + _1026;
    bool _2206 = !_2198;
    int _2208 = _2206 ? _2168 : (-1);
    float _2210 = fma(_2160, _2146, _2146);
    float _2212 = fma(_1720, _2160, _1720);
    int _2214 = ~_2158;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    float _2220 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2210);
    int _2222 = ~_2152;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = fma(_1936, _1936, _2180);
    int _2230 = ~_2170;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    int _2236 = _2218 * as_type<int>(_2046);
    int _2238 = abs(_1976);
    int _2240 = _2226 * as_type<int>(_1994);
    int _2242 = _2240 + _2196;
    int _2244 = abs(_1336);
    int _2246 = _2234 * as_type<int>(_2038);
    int _2248 = _2246 + _2236;
    int _2250 = abs(_1428);
    float _2252 = fma(_1972, _1972, _2228);
    int _2254 = ~_2244;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    bool _2260 = !_1652;
    int _2262 = _2260 ? 0 : 1;
    int _2264 = ~_2250;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = _2258 * as_type<int>(_2078);
    int _2272 = _2270 + _2242;
    int _2274 = abs(_2262);
    float _2276 = rsqrt(_2252);
    int _2278 = _2268 * as_type<int>(_2118);
    int _2280 = _2278 + _2248;
    int _2282 = ~_2238;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    bool _2288 = !_1658;
    int _2290 = _2288 ? 0 : 1;
    int _2292 = ~_2182;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    int _2298 = _2286 * as_type<int>(_2086);
    int _2300 = _2298 + _2272;
    int _2302 = abs(_2290);
    int _2304 = ~_2274;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = _2296 * as_type<int>(_2126);
    int _2312 = _2310 + _2280;
    bool _2314 = !_2200;
    int _2316 = _2314 ? _2204 : (-1);
    int _2318 = _2300 * _2308;
    int _2320 = ~_2302;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = _1926 * _2276;
    float _2328 = _1936 * _2276;
    int _2330 = _2208 * _2274;
    int _2332 = _2330 + _2318;
    float _2334 = -_2064;
    float _2336 = _2334 + 1.0;
    int _2338 = _2312 * _2324;
    float _2340 = -_2326;
    float _2342 = fma(_2340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2344 = -_2008;
    float _2346 = _2344 + 1.0;
    float _2348 = -_2328;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1936);
    int _2352 = _2316 * _2302;
    int _2354 = _2352 + _2338;
    float _2356 = -_1938;
    float _2358 = _2356 + 1.0;
    float _2360 = _2342 * _2342;
    float _2362 = -_715;
    float _2364 = fma(_1450, _2362, _1910);
    float _2366 = fma(_1470, _2336, _1902);
    float _2368 = _1972 * _2276;
    float _2370 = -_2358;
    float _2372 = fma(_1490, _2370, _2068);
    float _2374 = fma(_1500, _2346, _2188);
    float _2376 = float(_2332);
    float _2378 = fma(_2350, _2350, _2360);
    float _2380 = float(_2354);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    bool _2386 = !_1636;
    int _2388 = _2386 ? 0 : 1;
    out.m_68.x = _2364;
    out.m_68.y = _2366;
    out.m_68.z = _2372;
    out.m_68.w = _2374;
    float _2390 = fma(_2384, _2384, _2378);
    int _2392 = abs(_2388);
    out.m_70.x = _2376;
    out.m_70.y = _2380;
    float _2394 = _2150;
    float _2396 = _2368;
    if (_2088)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2398 = -_2326;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1778);
    float _2402 = -_2328;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _2406 = -_2368;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _2410 = float(_1646);
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2414 = _2400 + _2412;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2404 + _2416;
    float _2420 = float(_2392);
    float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2424 = _2408 + _2422;
    float _2426 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2428 = _764 + (-0.5);
    float _2430 = fma(_2212, _2156, _2220);
    float _2432 = _2420 * _2410;
    float _2434 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2426);
    float _2436 = _1896 * (-2.0);
    float _2438 = _1148 + (-0.5);
    float _2440 = _2432 * (-2.0);
    float _2442 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2434);
    float _2444 = fma(_2436, _2148, _2148);
    float _2446 = fma(_1728, _2436, _1728);
    float _2448 = _2430 * 0.15915493667125701904296875;
    float _2450 = sqrt(_2390);
    bool _2452 = _2442 >= 0.0;
    float _2454 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2444);
    float _2456 = fma(_2440, _2150, _2150);
    float _2458 = fma(_1760, _2440, _1760);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2464 = fma(_2446, _2156, _2454);
    float _2466 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2456);
    float _2468 = in.m_64.x;
    float _2470 = in.m_64.y;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2476 = _2464 * 0.15915493667125701904296875;
    float _2478 = _2448 * 6.283185482025146484375;
    float _2480 = sin(_2478);
    float _2482 = fma(_2458, _2156, _2466);
    float _2484 = fma(_2474, _1724, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    if (_2452)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2486 = _2394;
    int _2488 = as_type<int>(_2486);
    if (_2452)
    {
        out.m_47.x = 0.0;
    }
    float _2490 = fma(_2484, _1830, _1950);
    float _2492 = fma(_2462, _1724, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2494 = _2448 * 6.283185482025146484375;
    float _2496 = cos(_2494);
    if (_2452)
    {
        float _2498 = _2486 * 5.0;
        _2488 = as_type<int>(_2498);
    }
    int _2500 = _2488;
    float _2502 = fma(_1884, _1866, _1876);
    float _2504 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2490);
    float _2506 = _2482 * 0.15915493667125701904296875;
    if (_2452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7426 = as_type<float>(_2500);
        out.gl_Position.z = _7426;
    }
    float _2508 = _2476 * 6.283185482025146484375;
    float _2510 = sin(_2508);
    float _2512 = _2476 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    if (_2452)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2516 = _2504 * _2470;
    float _2518 = _2506 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    float _2522 = fma(_2492, _1830, _2502);
    float _2524 = _2276 * _2450;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _377);
    float _2530 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2522);
    float _2532 = _2496 * _2514;
    float _2534 = _2524 * _2526;
    float _2536 = _2506 * 6.283185482025146484375;
    float _2538 = sin(_2536);
    float _2540 = _2530 * _2468;
    float _2542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _359);
    float _2544 = _2528 * _2534;
    float _2546 = _2480 * _2510;
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2550 = _2480 * _2514;
    float _2552 = _2496 * _2510;
    float _2554 = _2496 * _2520;
    float _2556 = _2548 * _2524;
    float _2558 = _2514 * _2520;
    float _2560 = _2480 * _2520;
    float _2562 = _2510 * _2520;
    float _2564 = _2556 * _2542;
    float _2566 = _2554 * _2544;
    float _2568 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2570 = _2568 * 0.5;
    float _2572 = fma(_2538, _2532, _2546);
    float _2574 = -_2550;
    float _2576 = fma(_2538, _2552, _2574);
    float _2578 = -_2544;
    float _2580 = _2538 * _2578;
    float _2582 = -_2552;
    float _2584 = fma(_2538, _2550, _2582);
    float _2586 = fma(_2572, _2564, _2566);
    float _2588 = _2560 * _2544;
    float _2590 = fma(_2558, _2564, _2580);
    float _2592 = fma(_2538, _2546, _2532);
    float _2594 = fma(_2576, _2570, _2586);
    float _2596 = fma(_2584, _2564, _2588);
    float _2598 = fma(_2562, _2570, _2590);
    float _2600 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2592, _2570, _2596);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    bool _2610 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2612 = isnan(0.5);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2618 = _2614 || _2616;
    float _2620 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2622 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2624 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2626 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2620);
    float _2628 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2622);
    float _2630 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2632 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2634 = _1800 + _2630;
    float _2636 = _1726 + _2632;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2640 = _2634 + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2644 = _2636 + _2642;
    float _2646 = _2640 * _2640;
    float _2648 = fma(_2644, _2644, _2646);
    float _2650 = _2628 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2652 = sqrt(_2648);
    float _2654 = _1778 + _2650;
    bool _2656 = _2652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2564;
    float _2660 = _2636;
    float _2662 = _2634;
    float _2664 = _2556;
    if (!_2656)
    {
        _2658 = _2654;
    }
    float _2666 = _2658;
    bool _2668 = !_2656;
    float _2670 = _2666;
    if (!_2668)
    {
        float _2672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2676 = _2652 + _2674;
        float _2678 = rsqrt(_2648);
        float _2680 = _2676 * _2672;
        float _2682 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2684 = _2680 * 0.15915493667125701904296875;
        float _2686 = _2684 * 6.283185482025146484375;
        float _2688 = cos(_2686);
        float _2690 = _2684 * 6.283185482025146484375;
        float _2692 = sin(_2690);
        float _2694 = _2688 + (-1.0);
        float _2696 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2698 = fma(_2692, _2682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2700 = fma(_2654, _2688, _2696);
        float _2702 = _2678 * _2698;
        float _2704 = fma(_2644, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2706 = fma(_2640, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2660 = _2704;
        _2670 = _2700;
        _2662 = _2706;
    }
    float _2708 = _2660;
    float _2710 = _2670;
    float _2712 = _2662;
    float _2714 = -_2328;
    float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2708);
    float _2718 = -_2326;
    float _2720 = fma(_2718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2710);
    float _2722 = -_2368;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2712);
    float _2726 = _2720;
    float _2728 = _2716;
    float _2730 = _2724;
    if (!_2618)
    {
        float _2732 = _2414 * _2414;
        float _2734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2736 = -_1800;
        float _2738 = _2736 + _2712;
        float _2740 = fma(_2418, _2418, _2732);
        float _2742 = fma(_2424, _2424, _2740);
        float _2744 = 1.0 / _2524;
        float _2746 = sqrt(_2742);
        float _2748 = precise::min(_2746, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2750 = _2748 * _2734;
        float _2752 = -_1726;
        float _2754 = _2752 + _2708;
        float _2756 = _2750 * _2744;
        float _2758 = -_1778;
        float _2760 = _2758 + _2710;
        float _2762 = fma(_2754, _2756, _2404);
        float _2764 = fma(_2760, _2756, _2400);
        float _2766 = fma(_2738, _2756, _2408);
        _2726 = _2764;
        _2728 = _2762;
        _2730 = _2766;
    }
    float _2768 = _2726;
    float _2770 = _2728;
    float _2772 = _2730;
    float _2774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2776 = _2768 + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2780 = _2770 + _2778;
    float _2782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2784 = _2772 + _2782;
    float _2786 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2788 = _2776 * _2776;
    float _2790 = fma(_2780, _2780, _2788);
    float _2792 = fma(_2784, _2784, _2790);
    float _2794 = rsqrt(_2792);
    float _2796 = sqrt(_2792);
    float _2798 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2800 = _2780 * _2798;
    float _2802 = _2784 * _2798;
    float _2804 = _2800 * _2800;
    float _2806 = _2802 * _2802;
    float _2808 = _2804 + _2806;
    float _2810 = sqrt(_2808);
    bool _2812 = _2810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2816 = _2810 + _2814;
    float _2818 = _2784;
    float _2820 = _2808;
    float _2822 = _2816;
    float _2824 = _2798;
    if (_2812)
    {
        float _2826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2818 = _2826;
    }
    float _2828 = _2818;
    if (_2812)
    {
        float _2830 = rsqrt(_2808);
        _2820 = _2830;
    }
    float _2832 = _2820;
    float _2834 = _2832;
    if (_2812)
    {
        float _2836 = _2816 * _2828;
        _2822 = _2836;
    }
    float _2838 = _2822;
    if (_2812)
    {
        float _2840 = _2838 * 0.15915493667125701904296875;
        _2396 = _2840;
    }
    float _2842 = _2396;
    float _2844 = _2828;
    float _2846 = _2842;
    if (_2812)
    {
        float _2848 = _2842 * 6.283185482025146484375;
        float _2850 = sin(_2848);
        _2844 = _2850;
    }
    float _2852 = _2844;
    float _2854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2856 = precise::max(0.0, _2854);
    float _2858 = _2788;
    float _2860 = _2856;
    if (_2812)
    {
        float _2862 = _2842 * 6.283185482025146484375;
        float _2864 = cos(_2862);
        _2858 = _2864;
    }
    float _2866 = _2858;
    float _2868 = -_2798;
    float _2870 = -_2856;
    float _2872 = fma(_2776, _2868, _2870);
    float _2874 = _2872;
    if (_2812)
    {
        float _2876 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2860 = _2876;
    }
    float _2878 = _2860;
    float _2880 = _2852;
    float _2882 = _2878;
    if (_2812)
    {
        float _2884 = fma(_2852, _2878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2880 = _2884;
    }
    float _2886 = _2880;
    float _2888 = _2886;
    float _2890 = _2866;
    if (_2812)
    {
        float _2892 = _2866 + (-1.0);
        _2882 = _2892;
    }
    float _2894 = _2882;
    float _2896 = _2894;
    if (_2812)
    {
        float _2898 = _2832 * _2886;
        _2824 = _2898;
    }
    float _2900 = _2824;
    if (!_2812)
    {
        _2888 = _2800;
    }
    float _2902 = _2888;
    float _2904 = _2902;
    if (_2812)
    {
        float _2906 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2906;
    }
    float _2908 = _2846;
    if (_2812)
    {
        float _2910 = _2800 * _2900;
        _2904 = _2910;
    }
    float _2912 = _2904;
    if (!_2812)
    {
        _2896 = _2802;
    }
    float _2914 = _2896;
    float _2916 = _2914;
    if (_2812)
    {
        float _2918 = _2802 * _2900;
        _2916 = _2918;
    }
    float _2920 = _2916;
    if (!_2812)
    {
        _2834 = _2804;
    }
    float _2922 = _2834;
    float _2924 = _2922;
    if (_2812)
    {
        float _2926 = fma(_2872, _2866, _2908);
        _2874 = _2926;
    }
    float _2928 = _2874;
    if (_2812)
    {
        float _2930 = _2912 * _2912;
        _2924 = _2930;
    }
    float _2932 = _2924;
    if (!_2812)
    {
        _2890 = _2806;
    }
    float _2934 = _2890;
    float _2936 = _2934;
    if (_2812)
    {
        float _2938 = _2920 * _2920;
        _2936 = _2938;
    }
    float _2940 = _2936;
    float _2942 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2944 = fma(_2928, _2928, _2932);
    float _2946 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2948 = _2944 + _2940;
    float _2950 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2942);
    float _2952 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2956 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2954);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = rsqrt(_2948);
    float _2962 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2950);
    float _2964 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2966 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2952);
    float _2968 = -_2958;
    float _2970 = _2968 + 1.0;
    float _2972 = _2962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2974 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2964);
    float _2976 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2966);
    float _2978 = abs(_2970);
    float _2980 = log2(_2978);
    float _2982 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2984 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2974);
    float _2986 = _2976 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2988 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2946);
    float _2990 = -_2982;
    float _2992 = fma(_2990, _2786, 1.0);
    float _2994 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2996 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2998 = _2960 * _2912;
    float _3000 = _2960 * _2928;
    float _3002 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2988);
    float _3004 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2996);
    float _3006 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3008 = _2960 * _2920;
    float _3010 = _3002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3012 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3004);
    float _3014 = -_3006;
    float _3016 = fma(_3000, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3014);
    float _3018 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3020 = log2(_2992);
    float _3022 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3012);
    float _3024 = -_3008;
    float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3016);
    float _3028 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3030 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3032 = _3000 + 1.0;
    float _3034 = fma(_3026, -0.5, 0.5);
    float _3036 = fma(_3026, 0.5, 0.5);
    float _3038 = 1.0 / _3022;
    float _3040 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3028);
    float _3042 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3030);
    float _3044 = fma(_3036, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3046 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3040);
    float _3048 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3042);
    float _3050 = fma(_3036, _3044, -0.212114393711090087890625);
    float _3052 = exp2(_3018);
    float _3054 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3046);
    float _3056 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3048);
    float _3058 = _3020 * 0.693147182464599609375;
    float _3060 = fma(_3036, _3050, 1.570728778839111328125);
    float _3062 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3064 = sqrt(_3034);
    float _3066 = _3054 * _3038;
    float _3068 = _3056 * _3038;
    float _3070 = fma(_3066, 0.5, 0.5);
    float _3072 = fma(_3068, -0.5, 0.5);
    float _3074 = -_3000;
    float _3076 = fma(_3052, _3032, _3074);
    float3 _8361 = float3(_3070, _3072, _3062);
    float _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8361, float3(0.0), isnan(_8361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8361, float3(0.0), isnan(_8361)), level(0.0)).x;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = _3064 * 0.636619746685028076171875;
    float _3084 = -_3060;
    float _3086 = fma(_3082, _3084, 1.0);
    float3 _8382 = float3(_3070, _3072, _3062);
    float4 _3089 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8382, float3(0.0), isnan(_8382)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8382, float3(0.0), isnan(_8382)), level(0.0)).xyzw;
    float _3091 = _3089.x;
    float _3093 = _3089.y;
    float _3095 = _3089.z;
    float _3097 = _3089.w;
    float2 _8399 = float2(_3086, _3080);
    float3 _3101 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8399, float2(0.0), isnan(_8399)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8399, float2(0.0), isnan(_8399)), level(0.0)).xyz;
    float _3103 = _3101.x;
    float _3105 = _3101.y;
    float _3107 = _3101.z;
    float _3109 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3111 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3113 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3115 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3117 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3119 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3121 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3109);
    float _3123 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3111);
    float _3125 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3113);
    float _3127 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3115);
    float _3129 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3119);
    float _3131 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3133 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3135 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3137 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3121);
    float _3139 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3123);
    float _3141 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3143 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3145 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3147 = _377 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3149 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3141);
    float _3151 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3143);
    float _3153 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3145);
    float _3155 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3117);
    float _3157 = _3139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3159 = -_2538;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3131);
    float _3163 = -_2538;
    float _3165 = fma(_3163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3133);
    float _3167 = -_2538;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3135);
    float _3171 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3173 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3149);
    float _3175 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3151);
    float _3177 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3153);
    float _3179 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3155);
    float _3181 = fma(_3147, _3147, 1.0);
    float _3183 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3185 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3187 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3189 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3191 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3193 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3171);
    float _3195 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3161);
    float _3197 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3165);
    float _3199 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3169);
    float _3201 = rsqrt(_3181);
    float _3203 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3185);
    float _3205 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3187);
    float _3207 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3189);
    float _3209 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3191);
    float _3211 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3213 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3215 = _3147 * _3197;
    float _3217 = -_617;
    float _3219 = _3217 + _2768;
    float _3221 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3125);
    float _3223 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3225 = _3147 * _3195;
    float _3227 = -_615;
    float _3229 = _3227 + _2770;
    float _3231 = -_619;
    float _3233 = _3231 + _2772;
    float _3235 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3129);
    float _3237 = fma(_3213, _3221, _3225);
    float _3239 = fma(_3213, _3223, _3215);
    float _3241 = _3147 * _3199;
    out.m_72.x = _3221;
    out.m_72.y = _3223;
    out.m_72.z = _3211;
    float _3243 = _3147 * _3201;
    float _3245 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3247 = fma(_3213, _3211, _3241);
    out.m_74.x = _2770;
    out.m_74.y = _2768;
    out.m_74.z = _2772;
    float _3249 = -_3173;
    float _3251 = _3243 * _3249;
    float _3253 = -_3175;
    float _3255 = _3243 * _3253;
    float _3257 = -_3177;
    float _3259 = _3243 * _3257;
    float _3261 = exp2(_3245);
    float _3263 = fma(_3201, _3195, _3251);
    float _3265 = fma(_3201, _3197, _3255);
    float _3267 = fma(_3201, _3199, _3259);
    float _3269 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3271 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3273 = _3179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3275 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3269);
    float _3277 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3271);
    float _3279 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_76.x = _3263;
    out.m_76.y = _3265;
    out.m_76.z = _3267;
    float _3281 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3275);
    float _3283 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3285 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3279);
    float _3287 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3277);
    float _3289 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3291 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3283);
    float _3293 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3295 = _3235 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3297 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3285);
    float _3299 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3291);
    float _3301 = _3293 + _3209;
    float _3303 = 1.0 / _3289;
    float _3305 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3287);
    float _3307 = _3299 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3309 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3301);
    float _3311 = fma(_3273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3207);
    float _3313 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3315 = _3305 + _3022;
    float _3317 = _3054 + _3022;
    float _3319 = _3022 * 0.5;
    float _3321 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3311);
    float _3323 = -_3261;
    float _3325 = _3323 + 1.0;
    float _3327 = _3315 * 0.5;
    float _3329 = _3317 * 0.5;
    float _3331 = fma(_3056, -0.5, _3319);
    float _3333 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _3054;
    out.gl_Position.y = _3056;
    out.gl_Position.z = _3305;
    out.gl_Position.w = _3022;
    float _3335 = _3307 * _3303;
    float _3337 = _3313 * _3303;
    float _3339 = 1.0 / _3309;
    out.m_78.x = _3329;
    out.m_78.y = _3331;
    out.m_78.z = _3327;
    out.m_78.w = _3022;
    float _3341 = _3173 + _3237;
    float _3343 = _3175 + _3239;
    float _3345 = _3177 + _3247;
    out.m_80.y = 1.0;
    float _3347 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3349 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.m_82.x = _3341;
    out.m_82.y = _3343;
    out.m_82.z = _3345;
    float _3351 = _3347 + _3203;
    float _3353 = -_3333;
    float _3355 = _3353 + 1.0;
    float _3357 = _3349 + _3205;
    float _3359 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3351);
    float _3361 = _3321 * _3339;
    float _3363 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3357);
    float _3365 = _3359 * _3339;
    bool _3367 = _3361 > 0.0;
    bool _3369 = _3361 < 1.0;
    bool _3371 = _3369 && _3367;
    bool _3373 = _3066 > (-1.0);
    bool _3375 = _3373 && _3371;
    bool _3377 = _3068 > (-1.0);
    bool _3379 = _3377 && _3375;
    bool _3381 = _3066 < 1.0;
    bool _3383 = _3381 && _3379;
    bool _3385 = _3068 < 1.0;
    bool _3387 = _3385 && _3383;
    float _3389 = _3333 * _3078;
    float _3391 = _3363 * _3339;
    float _3393 = _3097 * _3389;
    float _3395 = _3097 * _3355;
    float _3397 = _3107 * _3389;
    float _3399 = fma(_3103, _3393, _3091);
    float _3401 = fma(_3105, _3393, _3093);
    float _3403 = fma(_3097, _3397, _3095);
    out.m_84.x = _3399;
    out.m_84.y = _3401;
    out.m_84.z = _3403;
    out.m_84.w = _3395;
    bool _3405 = !_3387;
    float _3407 = _3401;
    float _3409 = _3054;
    float _3411 = _3399;
    float _3413 = _3056;
    float _3415 = _3022;
    float _3441;
    float _3447;
    if (!_3405)
    {
        float _3417 = -_3391;
        float _3419 = _3068 + _3417;
        float _3421 = -_3365;
        float _3423 = _3066 + _3421;
        float _3425 = -_3337;
        float _3427 = _3066 + _3425;
        float _3429 = -_3335;
        float _3431 = _3068 + _3429;
        float _3433 = _3419 * _3419;
        float _3435 = fma(_3423, _3423, _3433);
        float _3437 = sqrt(_3435);
        bool _3439 = _3437 > 0.0;
        _3411 = _3435;
        _3441 = _3437;
        if (!_3439)
        {
            _3407 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3443 = _3407;
        bool _3445 = !_3439;
        _3447 = _3443;
        _3449 = _3445;
        if (!_3449)
        {
            float _3451 = _3431 * _3431;
            float _3453 = fma(_3427, _3427, _3451);
            float _3455 = rsqrt(_3435);
            float _3457 = sqrt(_3453);
            float _3459 = _3423 * _3455;
            float _3461 = _3419 * _3455;
            bool _3463 = _3457 > 0.0;
            float _3465 = _3457;
            _3441 = _3455;
            if (!_3463)
            {
                _3465 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3467 = _3465;
            bool _3469 = !_3463;
            _3447 = _3467;
            _3449 = _3469;
            if (!_3449)
            {
                float _3471 = _2556 * _3295;
                float _3473 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3475 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3293);
                float _3477 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3349);
                float _3479 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3347);
                float _3481 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3475);
                float _3483 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3477);
                float _3485 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3479);
                float _3487 = rsqrt(_3453);
                float _3489 = _3473 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3491 = 1.0 / _3481;
                float _3493 = _3431 * _3489;
                float _3495 = _3427 * _3489;
                float _3497 = _3493 * _3493;
                float _3499 = fma(_3495, _3495, _3497);
                float _3501 = _3483 * _3491;
                float _3503 = _3485 * _3491;
                float _3505 = sqrt(_3499);
                float _3507 = _3501 * _3501;
                float _3509 = fma(_3503, _3503, _3507);
                float _3511 = _3431 * _3487;
                float _3513 = _3427 * _3487;
                float _3515 = _3461 * _3511;
                float _3517 = sqrt(_3509);
                float _3519 = fma(_3459, _3513, _3515);
                float _3521 = precise::min(0.0, _3519);
                float _3523 = _3022 * _3521;
                float _3525 = fma(_3505, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3517);
                float _3527 = fma(_3495, _3523, _3054);
                float _3529 = fma(_3493, _3523, _3056);
                float _3531 = 1.0 / _3525;
                out.gl_Position.x = _3527;
                out.gl_Position.y = _3529;
                float _3533 = _3517 * _3531;
                out.m_80.y = _3533;
                _3409 = _3527;
                _3411 = _3493;
                _3413 = _3529;
                _3441 = _3523;
                _2664 = _3519;
                _3447 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3449 = true;
            }
        }
    }
    else
    {
        float _3535 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3535;
        _3409 = 0.0;
        _3413 = 0.0;
        _3441 = _3535;
        _2664 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3447 = 0.0;
    }
    _3449 = false;
    float _3537 = _3409;
    float _3539 = _3411;
    float _3541 = _3413;
    float _3543 = _3441;
    float _3545 = _2664;
    float _3547 = _3447;
    bool _3549 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3551 = isnan(_2796);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3557 = _3553 || _3555;
    float _3559 = _3539;
    float _3561 = _3543;
    float _3563 = _3541;
    float _3565 = _3537;
    float _3567 = _3545;
    if (!_3557)
    {
        _3559 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3569 = _3559;
    float _3571 = _3569;
    float _3573 = _3569;
    if (!_3557)
    {
        _3415 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3575 = _3415;
    float _3577 = _3575;
    float _3579 = _3575;
    if (!_3557)
    {
        _3561 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3581 = _3561;
    float _3583 = _3581;
    float _3585 = _3581;
    if (!_3557)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3587 = _3563;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3557)
    {
        _3565 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3593 = _3565;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3557)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3599 = _3567;
    bool _3601 = !_3557;
    float _3603 = _3599;
    float _3605 = _3599;
    if (!_3601)
    {
        bool _3607 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3609 = isnan(_2796);
        bool _3611 = _3607 || _3609;
        bool _3613 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3615 = _3611 || _3613;
        if (!_3615)
        {
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3619 = _2796 + _3617;
            float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3623 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3621;
            float _3625 = 1.0 / _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3629 = _3627 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3647 = _3619 * _3625;
            float _3649 = precise::clamp(_3647, 0.0, 1.0);
            float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3655 = fma(_3649, _3629, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3657 = fma(_3649, _3653, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3659 = fma(_3649, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3661 = fma(_3649, _3637, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3663 = fma(_3649, _3641, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3665 = fma(_3649, _3645, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3579 = _3657;
            _3597 = _3663;
            _3573 = _3655;
            _3591 = _3661;
            _3585 = _3659;
            _3605 = _3665;
            _3667 = true;
        }
        else
        {
            bool _3669 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3671 = isnan(_2796);
            bool _3673 = _3669 || _3671;
            bool _3675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3677 = _3673 || _3675;
            if (!_3677)
            {
                _3571 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3679 = _3571;
            _3573 = _3679;
            if (!_3677)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3681 = _3577;
            _3579 = _3681;
            if (!_3677)
            {
                _3583 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3683 = _3583;
            _3585 = _3683;
            if (!_3677)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3685 = _3589;
            _3591 = _3685;
            if (!_3677)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3687 = _3595;
            _3597 = _3687;
            if (!_3677)
            {
                _3603 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3689 = _3603;
            bool _3691 = !_3677;
            _3605 = _3689;
            if (!_3691)
            {
                bool _3693 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3695 = isnan(_2796);
                bool _3697 = _3693 || _3695;
                bool _3699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3701 = _3697 || _3699;
                if (!_3701)
                {
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3705 = _2796 + _3703;
                    float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3709 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3707;
                    float _3711 = 1.0 / _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3733 = _3705 * _3711;
                    float _3735 = precise::clamp(_3733, 0.0, 1.0);
                    float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3739 = _3737 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3741 = fma(_3735, _3715, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3743 = fma(_3735, _3739, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3745 = fma(_3735, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3747 = fma(_3735, _3723, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3749 = fma(_3735, _3727, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3751 = fma(_3735, _3731, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3579 = _3743;
                    _3597 = _3749;
                    _3573 = _3741;
                    _3591 = _3747;
                    _3585 = _3745;
                    _3605 = _3751;
                    _3667 = true;
                }
                else
                {
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3573 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3585 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3605 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3667 = false;
    float _3753 = _3579;
    float _3755 = _3597;
    float _3757 = _3573;
    float _3759 = _3591;
    float _3761 = _3585;
    float _3763 = _3605;
    float _3765 = fma(_3343, -0.5, 0.5);
    float _3767 = precise::clamp(_3765, 0.0, 1.0);
    float _3769 = -_3753;
    float _3771 = _3769 + _3755;
    float _3773 = -_3757;
    float _3775 = _3773 + _3759;
    float _3777 = -_3761;
    float _3779 = _3777 + _3763;
    bool _3781 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3783 = fma(_3767, _3771, _3753);
    float _3785 = fma(_3767, _3775, _3757);
    float _3787 = fma(_3767, _3779, _3761);
    float _3789 = _3547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3791 = _3783 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3793 = fma(_3785, 0.298911988735198974609375, _3791);
    out.m_80.w = _3789;
    float _3795 = fma(_3787, 0.114477999508380889892578125, _3793);
    float _3797 = -_3795;
    float _3799 = _3785 + _3797;
    float _3801 = -_3795;
    float _3803 = _3783 + _3801;
    float _3805 = -_3795;
    float _3807 = _3787 + _3805;
    out.m_86.x = 0.0;
    float _3809 = fma(_3799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    float _3811 = fma(_3803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    float _3813 = fma(_3807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    out.m_88.x = _3809;
    out.m_88.y = _3811;
    out.m_88.z = _3813;
    if (!_3781)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3815 = -_2768;
    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3819 = -_2770;
    float _3821 = _3819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3823 = -_2772;
    float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3827 = _3817 * _3817;
    float _3829 = fma(_3821, _3821, _3827);
    float _3831 = fma(_3825, _3825, _3829);
    float _3833 = sqrt(_3831);
    float _3835 = rsqrt(_3831);
    float _3837 = -_3833;
    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3841 = _3839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3843 = precise::clamp(_3841, 0.0, 1.0);
    float _3845 = _3821 * _3835;
    float _3847 = _3817 * _3835;
    float _3849 = abs(_3843);
    float _3851 = log2(_3849);
    float _3853 = _3825 * _3835;
    float _3855 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3857 = _3343 * _3847;
    float _3859 = -_3847;
    float _3861 = -_3855;
    float _3863 = fma(_3859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3861);
    float _3865 = fma(_3341, _3845, _3857);
    float _3867 = -_3853;
    float _3869 = fma(_3867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3863);
    float _3871 = fma(_3345, _3853, _3865);
    float _3873 = precise::clamp(_3871, 0.0, 1.0);
    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3877 = _3869 + _3875;
    float _3879 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3881 = _3877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = exp2(_3879);
    float _3887 = _3885 * _3883;
    float _3889 = _3873 * _3887;
    float _3891 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3893 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3895 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3891;
    out.m_86.y = _3893;
    out.m_86.z = _3895;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3667 = false;
    bool _3449 = false;
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
        float _3952 = as_type<float>(_123);
        out.gl_Position.z = _3952;
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
        float _4026 = as_type<float>(_163);
        out.gl_Position.z = _4026;
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
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = _647 + _655;
    bool _659 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _661 = isnan(_647);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _673 = int(_671);
    bool _675 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_647);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = float(_651);
    float _689 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _691 = int(_689);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _695 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _693);
    float _697 = float(uint(_673));
    float _699 = 1.0 / _687;
    int _701 = ~_673;
    int _703 = _701 + 1;
    float _705 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _695);
    int _707 = ~_673;
    int _709 = _707 + 1;
    bool _711 = _673 == 0;
    float _713 = -_705;
    float _715 = _713 + 1.0;
    float _717 = 1.0 / _697;
    float _719 = float(_691);
    float _721 = _699 * _143;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _725 = int(_723);
    int _727 = as_type<int>(_717) + (-2);
    float _729 = trunc(_721);
    int _731 = int(_729);
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _735 = _733 != 0;
    float _737 = 1.0 / _719;
    float _739 = float(uint(_725));
    int _741 = ~_725;
    int _743 = _741 + 1;
    int _745 = ~_725;
    int _747 = _745 + 1;
    float _749 = float(uint(_731));
    float _751 = 1.0 / _739;
    float _753 = as_type<float>(_727) * _749;
    float _755 = _737 * _143;
    float _757 = trunc(_753);
    float _759 = precise::max(_757, 0.0);
    uint _762 = uint(_759);
    float _764 = in.m_51.y;
    float _766 = trunc(_755);
    int _768 = int(_766);
    int _770 = as_type<int>(_751) + (-2);
    float _772 = _753;
    if (_735)
    {
        _772 = _129;
    }
    float _774 = _772;
    int _776 = _703 * int(_762);
    int _778 = _776 + _731;
    float _780 = 1.0 / _653;
    float _782 = float(uint(_778));
    float _784 = as_type<float>(_778);
    float _786 = _774;
    if (_735)
    {
        _784 = 1.0;
    }
    float _788 = _784;
    float _790 = float(uint(_768));
    float _792 = as_type<float>(_727) * _782;
    float _794 = _788;
    float _796 = _790;
    if (!_735)
    {
        _794 = 1.2345600128173828125;
    }
    float _798 = _794;
    if (!_735)
    {
        _786 = _764;
    }
    float _800 = _786;
    float _802 = as_type<float>(_770) * _790;
    if (_735)
    {
        _796 = 1.0;
    }
    float _804 = _796;
    float _806 = trunc(_792);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    float _812 = _804;
    if (!_735)
    {
        _812 = 7.345489978790283203125;
    }
    float _814 = _812;
    float _816 = _798 * _800;
    float _818 = float(_725);
    float _820 = _814 * _129;
    float _822 = trunc(_802);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    float _828 = floor(_820);
    int _830 = ~_725;
    int _832 = _830 + 1;
    int _834 = int(_762) + int(_810);
    int _836 = _832 * int(_826);
    int _838 = _836 + _768;
    float _840 = floor(_816);
    int _842 = _709 * _834;
    int _844 = _842 + _731;
    float _846 = float(uint(_838));
    float _848 = -_828;
    float _850 = _820 + _848;
    bool _852 = uint(_844) >= uint(_673);
    float _854 = as_type<float>(_770) * _846;
    float _856 = float(_673);
    float _858 = _780 * _143;
    float _860 = trunc(_854);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = _850 * _856;
    bool _868 = !_852;
    int _870 = _868 ? 0 : (-1);
    float _872 = -_840;
    float _874 = _816 + _872;
    float _876 = float(_731);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _880 = _878 != 0;
    float _882 = trunc(_866);
    int _884 = int(_882);
    bool _886 = _876 >= _856;
    bool _888 = isnan(_876);
    bool _890 = _886 || _888;
    bool _892 = isnan(_856);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _856 * _858;
    int _900 = ~_834;
    int _902 = _900 + _870;
    int _904 = _902 + 1;
    float _906 = _818 * _858;
    bool _908 = !_880;
    int _910 = _908 ? 0 : 1;
    float _912 = _874 * _818;
    float _914 = float(_768);
    float _916 = trunc(_896);
    int _918 = int(_916);
    int _920 = abs(_910);
    bool _922 = _914 >= _818;
    bool _924 = isnan(_914);
    bool _926 = _922 || _924;
    bool _928 = isnan(_818);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    int _934 = int(_826) + int(_864);
    int _936 = _884 * _920;
    int _938 = _936 + _731;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _942 = _940 != 0;
    int _944 = _673 * _904;
    int _946 = _944 + _731;
    int _948 = _743 * _934;
    int _950 = _948 + _768;
    float _952 = trunc(_912);
    int _954 = int(_952);
    bool _956 = !_942;
    int _958 = _956 ? 0 : 1;
    float _960 = _589 * _167;
    bool _962 = !_711;
    int _964 = _962 ? _946 : (-1);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _972 = _970 != 0;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _976 = _974 != 0;
    bool _978 = uint(_950) >= uint(_725);
    float _980 = trunc(_898);
    int _982 = int(_980);
    int _984 = ~_918;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    bool _990 = !_978;
    int _992 = _990 ? 0 : (-1);
    int _994 = abs(_958);
    int _996 = _964 * _988;
    bool _998 = !_972;
    int _1000 = _998 ? 0 : 1;
    float _1002 = trunc(_932);
    int _1004 = int(_1002);
    int _1006 = _673 + (-1);
    int _1008 = ~_934;
    int _1010 = _1008 + _992;
    int _1012 = _1010 + 1;
    int _1014 = abs(_1000);
    int _1016 = _918 * _1006;
    int _1018 = _1016 + _996;
    bool _1020 = !_968;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _954 * _994;
    int _1026 = _1024 + _768;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1030 = _1028 != 0;
    int _1032 = _725 * _1012;
    int _1034 = _1032 + _768;
    bool _1036 = !_976;
    int _1038 = _1036 ? 0 : 1;
    int _1040 = _1018 * _1014;
    int _1042 = abs(_1022);
    float _1044 = trunc(_906);
    int _1046 = int(_1044);
    bool _1048 = _725 == 0;
    float _1050 = in.m_51.w;
    int _1052 = abs(_1038);
    int _1054 = _982 * _1042;
    int _1056 = _1054 + _1040;
    bool _1058 = !_1030;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = ~_1004;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1048;
    int _1070 = _1068 ? _1034 : (-1);
    float _1072 = _589 * _175;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1088 = _1086 != 0;
    int _1090 = _1070 * _1066;
    int _1092 = abs(_1060);
    int _1094 = _938 * _1052;
    int _1096 = _1094 + _1056;
    int _1098 = _725 + (-1);
    float _1100 = fma(_591, _173, _1072);
    float _1102 = _764 * 2.0;
    bool _1104 = !_1080;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1004 * _1098;
    int _1110 = _1108 + _1090;
    bool _1112 = !_1076;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _884 * _1092;
    int _1118 = _1116 + _1096;
    int _1120 = abs(_1106);
    bool _1122 = !_1084;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = abs(_1114);
    bool _1128 = !_1088;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = abs(_1124);
    int _1134 = _1110 * _1120;
    float _1136 = float(uint(_1118));
    float _1138 = _589 * _181;
    int _1140 = abs(_1130);
    int _1142 = _1046 * _1126;
    int _1144 = _1142 + _1134;
    float _1146 = as_type<float>(_727) * _1136;
    float _1148 = in.m_51.z;
    int _1150 = ~_725;
    int _1152 = _1150 + 1;
    int _1154 = _1026 * _1132;
    int _1156 = _1154 + _1144;
    int _1158 = ~_673;
    int _1160 = _1158 + 1;
    float _1162 = trunc(_1146);
    float _1164 = precise::max(_1162, 0.0);
    uint _1166 = uint(_1164);
    bool _1168 = _673 == 0;
    int _1170 = _954 * _1140;
    int _1172 = _1170 + _1156;
    int _1174 = ~_673;
    int _1176 = _1174 + 1;
    float _1178 = float(uint(_1172));
    float _1180 = as_type<float>(_770) * _1178;
    int _1182 = _1176 * int(_1166);
    int _1184 = _1182 + _1118;
    float _1186 = trunc(_1180);
    float _1188 = precise::max(_1186, 0.0);
    uint _1190 = uint(_1188);
    float _1192 = float(uint(_1184));
    float _1194 = as_type<float>(_727) * _1192;
    float _1196 = trunc(_1194);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = _1152 * int(_1190);
    int _1204 = _1202 + _1172;
    float _1206 = float(uint(_1204));
    float _1208 = as_type<float>(_770) * _1206;
    int _1210 = int(_1166) + int(_1200);
    float _1212 = trunc(_1208);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    int _1218 = ~_725;
    int _1220 = _1218 + 1;
    int _1222 = _1160 * _1210;
    int _1224 = _1222 + _1118;
    bool _1226 = uint(_1224) >= uint(_673);
    bool _1228 = !_1226;
    int _1230 = _1228 ? 0 : (-1);
    int _1232 = int(_1190) + int(_1216);
    int _1234 = ~_1210;
    int _1236 = _1234 + _1230;
    int _1238 = _1236 + 1;
    float _1240 = float(uint(_938));
    int _1242 = _673 * _1238;
    int _1244 = _1242 + _1118;
    int _1246 = _1220 * _1232;
    int _1248 = _1246 + _1172;
    float _1250 = as_type<float>(_727) * _1240;
    bool _1252 = !_1168;
    int _1254 = _1252 ? _1244 : (-1);
    bool _1256 = uint(_1248) >= uint(_725);
    float _1258 = trunc(_1250);
    float _1260 = precise::max(_1258, 0.0);
    uint _1262 = uint(_1260);
    int _1264 = _1254 & 3;
    bool _1266 = _1264 != 0;
    bool _1268 = !_1256;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = uint(_1264) > 1u;
    int _1274 = _1254 & 3;
    bool _1276 = _1274 != 0;
    int _1278 = ~_1232;
    int _1280 = _1278 + _1270;
    int _1282 = _1280 + 1;
    int _1284 = _1276 ? 0 : 1;
    bool _1286 = _1264 != 3;
    int _1288 = _725 * _1282;
    int _1290 = _1288 + _1172;
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _129 * 2.0;
    bool _1300 = uint(_1264) >= 2u;
    int _1302 = _1296;
    float _1304 = _1102;
    if (!_1272)
    {
        int _1306 = ~_1284;
        int _1308 = _1306 + 1;
        _1302 = _1308;
    }
    int _1310 = _1302;
    float _1312 = floor(_1298);
    float _1314 = float(uint(_1026));
    int _1316 = _1300 ? 0 : 1;
    bool _1318 = !_1048;
    int _1320 = _1318 ? _1290 : (-1);
    float _1322 = as_type<float>(_770) * _1314;
    int _1324 = ~_1316;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    int _1330 = _1328;
    if (_1286)
    {
        int _1332 = ~_1316;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = trunc(_1322);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    int _1344 = _1320 & 3;
    bool _1346 = _1344 != 0;
    int _1348 = _1320 & 3;
    bool _1350 = _1348 != 0;
    int _1352 = ~_673;
    int _1354 = _1352 + 1;
    bool _1356 = uint(_1344) >= 2u;
    int _1358 = _1350 ? 0 : 1;
    int _1360 = _1354 * int(_1262);
    int _1362 = _1360 + _938;
    bool _1364 = uint(_1344) > 1u;
    int _1366 = _1356 ? 0 : 1;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1370 = _1368 != 0;
    bool _1372 = _1344 != 3;
    float _1374 = floor(_1102);
    float _1376 = float(uint(_1362));
    int _1378 = _747 * int(_1342);
    int _1380 = _1378 + _1026;
    int _1382 = ~_1358;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    int _1388 = ~_1366;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = as_type<float>(_727) * _1376;
    float _1396 = float(uint(_1380));
    int _1398 = _1386;
    int _1400 = as_type<int>(_1376);
    int _1402 = _1392;
    if (!_1364)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1398 = _1406;
    }
    int _1408 = _1398;
    float _1410 = as_type<float>(_770) * _1396;
    bool _1412 = _129 > 0.5;
    float _1414 = trunc(_1394);
    float _1416 = precise::max(_1414, 0.0);
    uint _1418 = uint(_1416);
    if (_1370)
    {
        _1400 = 0;
    }
    int _1420 = _1400;
    int _1422 = _1420;
    if (_1372)
    {
        int _1424 = ~_1366;
        int _1426 = _1424 + 1;
        _1402 = _1426;
    }
    int _1428 = _1402;
    if (!_1370)
    {
        _1422 = 1;
    }
    int _1430 = _1422;
    int _1432 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1434 = _1432 != 0;
    float _1436 = trunc(_1410);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    float _1442 = -_359;
    int _1444 = _1412 ? as_type<int>(_1442) : as_type<int>(_359);
    bool _1446 = _764 > 0.5;
    bool _1448 = !_1434;
    float _1450 = _1448 ? _359 : as_type<float>(_1444);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1454 = _1452 != 0;
    float _1456 = -_377;
    float _1458 = _1446 ? _1456 : _377;
    float _1460 = _1450 + 0.5;
    bool _1462 = _1148 > 0.5;
    bool _1464 = _1050 > 0.5;
    float _1466 = fma(_591, _165, _960);
    bool _1468 = !_1454;
    float _1470 = _1468 ? _377 : _1458;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    float _1476 = -_359;
    int _1478 = _1462 ? as_type<int>(_1476) : as_type<int>(_359);
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1482 = _1480 != 0;
    float _1484 = -_377;
    int _1486 = _1464 ? as_type<int>(_1484) : as_type<int>(_377);
    bool _1488 = !_1474;
    float _1490 = _1488 ? _359 : as_type<float>(_1478);
    bool _1492 = _1430 != 1;
    bool _1494 = _1312 > 0.0;
    float _1496 = _1490 + 0.5;
    bool _1498 = !_1482;
    float _1500 = _1498 ? _377 : as_type<float>(_1486);
    bool _1502 = _1312 >= 0.0;
    bool _1504 = isnan(_1312);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    int _1512 = int(_1262) + int(_1418);
    int _1514 = ~_673;
    int _1516 = _1514 + 1;
    int _1518 = _1510 ? 0 : 1;
    int _1520 = ~_725;
    int _1522 = _1520 + 1;
    int _1524 = _1516 * _1512;
    int _1526 = _1524 + _938;
    int _1528 = int(_1342) + int(_1440);
    bool _1530 = _1374 > 0.0;
    int _1532 = ~_1518;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    float _1538 = as_type<float>(_1440);
    float _1540 = _1458;
    int _1542 = _1536;
    if (!_1492)
    {
        _225 = _764;
    }
    float _1544 = _225;
    float _1546 = _1544;
    if (!_1492)
    {
        _1304 = _764;
    }
    float _1548 = _1304;
    float _1550 = _1548;
    if (!_1492)
    {
        _1538 = _1148;
    }
    float _1552 = _1538;
    float _1554 = _1552;
    if (!_1492)
    {
        _1540 = _1148;
    }
    float _1556 = _1540;
    float _1558 = _1556;
    if (!_1494)
    {
        int _1560 = ~_1518;
        int _1562 = _1560 + 1;
        _1542 = _1562;
    }
    int _1564 = _1542;
    if (_1492)
    {
        _1546 = _129;
    }
    float _1566 = _1546;
    if (_1492)
    {
        _1550 = _129;
    }
    float _1568 = _1550;
    if (_1492)
    {
        _1554 = _764;
    }
    float _1570 = _1554;
    if (_1492)
    {
        _1558 = _764;
    }
    float _1572 = _1558;
    bool _1574 = uint(_1526) >= uint(_673);
    int _1576 = _1522 * _1528;
    int _1578 = _1576 + _1026;
    bool _1580 = _1374 >= 0.0;
    bool _1582 = isnan(_1374);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    float _1590 = fma(_591, _179, _1138);
    float _1592 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1594 = _1588 ? 0 : 1;
    bool _1596 = uint(_1578) >= uint(_725);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1610 = !_1574;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = 1.0 / _1600;
    int _1616 = ~_1594;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    bool _1622 = !_1266;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1636 = _1634 != 0;
    float _1638 = fma(_613, _183, _1590);
    int _1640 = _1620;
    if (!_1530)
    {
        int _1642 = ~_1594;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = 1.0 / _1604;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1652 = _1650 != 0;
    float _1654 = _1148 * 2.0;
    int _1656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1658 = _1656 != 0;
    float _1660 = fma(_613, _169, _1466);
    float _1662 = _764 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1668 = in.m_57.w;
    float _1670 = fma(_613, _177, _1100);
    float _1672 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1676 = 1.0 / _1666;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1680 = _647 + _1678;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1684 = -_1674;
    float _1686 = fma(_1672, 2.0, _1684);
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1690 = _647 + _1688;
    float _1692 = _657 * _1648;
    float _1694 = fma(_1662, -2.0, _1682);
    float _1696 = floor(_1654);
    float _1698 = in.m_55.w;
    float _1700 = _129 + _764;
    float _1702 = _1690 * _1614;
    bool _1704 = !_1596;
    int _1706 = _1704 ? 0 : (-1);
    float _1708 = in.m_59.w;
    float _1710 = _1700 + (-1.0);
    float _1712 = _1148 + _764;
    float _1714 = 1.0 / _1608;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1718 = _647 + _1716;
    float _1720 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1722 = _1712 + (-1.0);
    float _1724 = _1680 * _1676;
    float _1726 = _1670 + _1668;
    float _1728 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1730 = _129 + _1148;
    bool _1732 = _1696 >= 0.0;
    bool _1734 = isnan(_1696);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan(0.0);
    bool _1740 = _1736 || _1738;
    float _1742 = -_143;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1686);
    float _1746 = _1730 + (-1.0);
    int _1748 = _1740 ? 0 : 1;
    float _1750 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1694);
    float _1752 = _1718 * _1714;
    bool _1754 = _1696 > 0.0;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1756;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1762;
    bool _1766 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1768 = isnan(_647);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = _1660 + _1698;
    float _1780 = fma(_1758, _1692, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1782 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1784 = isnan(_647);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = fma(_1764, _1692, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1800 = _1638 + _1708;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1806 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1808 = isnan(_647);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = -_1776;
    float _1820 = _1818 + 1.0;
    float _1822 = fma(_1798, _1752, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1824 = -_1792;
    float _1826 = _1824 + 1.0;
    float _1828 = fma(_1804, _1752, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1830 = _1816 * _1820;
    float _1832 = _669 * _1826;
    float _1834 = -_669;
    float _1836 = _1834 + 1.0;
    bool _1838 = !_1632;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = -_1816;
    float _1844 = _1842 + 1.0;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1846;
    float _1850 = _685 * _1836;
    int _1852 = abs(_1840);
    float _1854 = -_685;
    float _1856 = _1854 + 1.0;
    float _1858 = fma(_1848, _1702, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1860 = _1780 * _1850;
    float _1862 = _1794 * _1850;
    float _1864 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1860);
    float _1866 = _1792 * _1844;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1862);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1872;
    float _1876 = fma(_1822, _1832, _1864);
    float _1878 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1868);
    float _1880 = fma(_1828, _1832, _1870);
    float _1882 = float(_1564);
    float _1884 = fma(_1874, _1702, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1886 = float(_1852);
    float _1888 = _1470 + (-0.5);
    float _1890 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1892 = !_1628;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = _1886 * _1882;
    float _1898 = -_1888;
    float _1900 = -_1750;
    float _1902 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1900);
    float _1904 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1906 = log2(_1904);
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1910 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1744);
    int _1912 = _1320 >> 31;
    float _1914 = -_1908;
    float _1916 = fma(_1890, 2.0, _1914);
    int _1918 = abs(_1894);
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1922 = _1254 >> 31;
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1778 + _1924;
    int _1928 = _1912 & 3;
    float _1930 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1920);
    int _1932 = _1922 & 3;
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1936 = _1726 + _1934;
    float _1938 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1930);
    int _1940 = _1254 + _1932;
    float _1942 = _1906 * _143;
    int _1944 = _1320 + _1928;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1948 = _1940 >> 2;
    float _1950 = fma(_1858, _1866, _1880);
    bool _1952 = !_1346;
    int _1954 = _1952 ? 0 : 1;
    float _1956 = exp2(_1942);
    bool _1958 = _1264 != 3;
    float _1960 = fma(_1592, -2.0, _1946);
    int _1962 = _1944 >> 2;
    float _1964 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1966 = _1948 << 4;
    int _1968 = _1966 + 368;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1972 = _1800 + _1970;
    bool _1974 = !_1958;
    int _1976 = _1974 ? 0 : (-1);
    float _1978 = -_143;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1916);
    bool _1982 = _1344 != 3;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1986 = 1.0 + _1984;
    uint _1988 = uint(int(uint(_1968) >> uint(2)));
    uint _1990 = uint(int(uint(int(_1988)) >> uint(2)));
    int _1992 = int(_1988) & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = int(_1988) + 1;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    int _2000 = _1996 & 3;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[int(_1998)][_2000];
    int _2004 = _1962 << 4;
    int _2006 = _2004 + 512;
    float _2008 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1878);
    int _2010 = ~_1748;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2018 = _2014;
    if (!_1754)
    {
        int _2020 = ~_1748;
        int _2022 = _2020 + 1;
        _2018 = _2022;
    }
    int _2024 = _2018;
    float _2026 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1964);
    float _2028 = -_1956;
    float _2030 = _2028 + 1.0;
    uint _2032 = uint(int(uint(_2006) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    float _2048 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2016);
    bool _2050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2026);
    float _2062 = 1.0 / _1986;
    float _2064 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2048);
    float _2066 = _2058 ? _2030 : 0.0;
    float _2068 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1980);
    int _2070 = _1968 + 8;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    bool _2088 = _2060 >= 0.0;
    float _2090 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1960);
    bool _2092 = !_1982;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = _129 + (-0.5);
    bool _2098 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2100 = isnan(1.0);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_1918);
    int _2110 = _2006 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = float(_2024);
    int _2130 = ~_1512;
    int _2132 = _2130 + _1612;
    int _2134 = _2132 + 1;
    int _2136 = abs(_1310);
    float _2138 = _2108 * _2128;
    float _2140 = 0.0;
    int _2142 = as_type<int>(_2138);
    if (_2088)
    {
        _2140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2144 = _2140;
    float _2146 = in.m_66.x;
    float _2148 = in.m_66.y;
    float _2150 = in.m_66.z;
    int _2152 = abs(_1624);
    if (_2106)
    {
        float _2154 = _2066 * _2062;
        _145 = _2154;
    }
    float _2156 = _145;
    int _2158 = abs(_1408);
    float _2160 = _2138 * (-2.0);
    if (_2088)
    {
        float _2162 = _2144 * 5.0;
        _2142 = as_type<int>(_2162);
    }
    int _2164 = _2142;
    int _2166 = _673 * _2134;
    int _2168 = _2166 + _938;
    int _2170 = abs(_1954);
    float _2172 = _1500 + (-0.5);
    if (_2088)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6915 = as_type<float>(_2164);
        out.gl_Position.z = _6915;
    }
    int _2174 = ~_2136;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = _1926 * _1926;
    int _2182 = abs(_2094);
    float _2184 = -_2172;
    float _2186 = -_2090;
    float _2188 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2186);
    int _2190 = ~_1528;
    int _2192 = _2190 + _1706;
    int _2194 = _2192 + 1;
    int _2196 = _2178 * as_type<int>(_2002);
    bool _2198 = _673 == 0;
    if (_2088)
    {
        out.m_47.x = 0.0;
    }
    bool _2200 = _725 == 0;
    int _2202 = _725 * _2194;
    int _2204 = _2202 + _1026;
    bool _2206 = !_2198;
    int _2208 = _2206 ? _2168 : (-1);
    float _2210 = fma(_2160, _2146, _2146);
    float _2212 = fma(_1720, _2160, _1720);
    int _2214 = ~_2158;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    float _2220 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2210);
    int _2222 = ~_2152;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = fma(_1936, _1936, _2180);
    int _2230 = ~_2170;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    int _2236 = _2218 * as_type<int>(_2046);
    int _2238 = abs(_1976);
    int _2240 = _2226 * as_type<int>(_1994);
    int _2242 = _2240 + _2196;
    int _2244 = abs(_1336);
    int _2246 = _2234 * as_type<int>(_2038);
    int _2248 = _2246 + _2236;
    int _2250 = abs(_1428);
    float _2252 = fma(_1972, _1972, _2228);
    int _2254 = ~_2244;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    bool _2260 = !_1652;
    int _2262 = _2260 ? 0 : 1;
    int _2264 = ~_2250;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = _2258 * as_type<int>(_2078);
    int _2272 = _2270 + _2242;
    int _2274 = abs(_2262);
    float _2276 = rsqrt(_2252);
    int _2278 = _2268 * as_type<int>(_2118);
    int _2280 = _2278 + _2248;
    int _2282 = ~_2238;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    bool _2288 = !_1658;
    int _2290 = _2288 ? 0 : 1;
    int _2292 = ~_2182;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    int _2298 = _2286 * as_type<int>(_2086);
    int _2300 = _2298 + _2272;
    int _2302 = abs(_2290);
    int _2304 = ~_2274;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = _2296 * as_type<int>(_2126);
    int _2312 = _2310 + _2280;
    bool _2314 = !_2200;
    int _2316 = _2314 ? _2204 : (-1);
    int _2318 = _2300 * _2308;
    int _2320 = ~_2302;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = _1926 * _2276;
    float _2328 = _1936 * _2276;
    int _2330 = _2208 * _2274;
    int _2332 = _2330 + _2318;
    float _2334 = -_2064;
    float _2336 = _2334 + 1.0;
    int _2338 = _2312 * _2324;
    float _2340 = -_2326;
    float _2342 = fma(_2340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2344 = -_2008;
    float _2346 = _2344 + 1.0;
    float _2348 = -_2328;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1936);
    int _2352 = _2316 * _2302;
    int _2354 = _2352 + _2338;
    float _2356 = -_1938;
    float _2358 = _2356 + 1.0;
    float _2360 = _2342 * _2342;
    float _2362 = -_715;
    float _2364 = fma(_1450, _2362, _1910);
    float _2366 = fma(_1470, _2336, _1902);
    float _2368 = _1972 * _2276;
    float _2370 = -_2358;
    float _2372 = fma(_1490, _2370, _2068);
    float _2374 = fma(_1500, _2346, _2188);
    float _2376 = float(_2332);
    float _2378 = fma(_2350, _2350, _2360);
    float _2380 = float(_2354);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    bool _2386 = !_1636;
    int _2388 = _2386 ? 0 : 1;
    out.m_68.x = _2364;
    out.m_68.y = _2366;
    out.m_68.z = _2372;
    out.m_68.w = _2374;
    float _2390 = fma(_2384, _2384, _2378);
    int _2392 = abs(_2388);
    out.m_70.x = _2376;
    out.m_70.y = _2380;
    float _2394 = _2150;
    float _2396 = _2368;
    if (_2088)
    {
        return out;
    }
    float _2398 = -_2326;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1778);
    float _2402 = -_2328;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _2406 = -_2368;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _2410 = float(_1646);
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2414 = _2400 + _2412;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2404 + _2416;
    float _2420 = float(_2392);
    float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2424 = _2408 + _2422;
    float _2426 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2428 = _764 + (-0.5);
    float _2430 = fma(_2212, _2156, _2220);
    float _2432 = _2420 * _2410;
    float _2434 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2426);
    float _2436 = _1896 * (-2.0);
    float _2438 = _1148 + (-0.5);
    float _2440 = _2432 * (-2.0);
    float _2442 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2434);
    float _2444 = fma(_2436, _2148, _2148);
    float _2446 = fma(_1728, _2436, _1728);
    float _2448 = _2430 * 0.15915493667125701904296875;
    float _2450 = sqrt(_2390);
    bool _2452 = _2442 >= 0.0;
    float _2454 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2444);
    float _2456 = fma(_2440, _2150, _2150);
    float _2458 = fma(_1760, _2440, _1760);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2464 = fma(_2446, _2156, _2454);
    float _2466 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2456);
    float _2468 = in.m_64.x;
    float _2470 = in.m_64.y;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2476 = _2464 * 0.15915493667125701904296875;
    float _2478 = _2448 * 6.283185482025146484375;
    float _2480 = sin(_2478);
    float _2482 = fma(_2458, _2156, _2466);
    float _2484 = fma(_2474, _1724, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    if (_2452)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2486 = _2394;
    int _2488 = as_type<int>(_2486);
    if (_2452)
    {
        out.m_47.x = 0.0;
    }
    float _2490 = fma(_2484, _1830, _1950);
    float _2492 = fma(_2462, _1724, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2494 = _2448 * 6.283185482025146484375;
    float _2496 = cos(_2494);
    if (_2452)
    {
        float _2498 = _2486 * 5.0;
        _2488 = as_type<int>(_2498);
    }
    int _2500 = _2488;
    float _2502 = fma(_1884, _1866, _1876);
    float _2504 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2490);
    float _2506 = _2482 * 0.15915493667125701904296875;
    if (_2452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7426 = as_type<float>(_2500);
        out.gl_Position.z = _7426;
    }
    float _2508 = _2476 * 6.283185482025146484375;
    float _2510 = sin(_2508);
    float _2512 = _2476 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    if (_2452)
    {
        return out;
    }
    float _2516 = _2504 * _2470;
    float _2518 = _2506 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    float _2522 = fma(_2492, _1830, _2502);
    float _2524 = _2276 * _2450;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _377);
    float _2530 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2522);
    float _2532 = _2496 * _2514;
    float _2534 = _2524 * _2526;
    float _2536 = _2506 * 6.283185482025146484375;
    float _2538 = sin(_2536);
    float _2540 = _2530 * _2468;
    float _2542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _359);
    float _2544 = _2528 * _2534;
    float _2546 = _2480 * _2510;
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2550 = _2480 * _2514;
    float _2552 = _2496 * _2510;
    float _2554 = _2496 * _2520;
    float _2556 = _2548 * _2524;
    float _2558 = _2514 * _2520;
    float _2560 = _2480 * _2520;
    float _2562 = _2510 * _2520;
    float _2564 = _2556 * _2542;
    float _2566 = _2554 * _2544;
    float _2568 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2570 = _2568 * 0.5;
    float _2572 = fma(_2538, _2532, _2546);
    float _2574 = -_2550;
    float _2576 = fma(_2538, _2552, _2574);
    float _2578 = -_2544;
    float _2580 = _2538 * _2578;
    float _2582 = -_2552;
    float _2584 = fma(_2538, _2550, _2582);
    float _2586 = fma(_2572, _2564, _2566);
    float _2588 = _2560 * _2544;
    float _2590 = fma(_2558, _2564, _2580);
    float _2592 = fma(_2538, _2546, _2532);
    float _2594 = fma(_2576, _2570, _2586);
    float _2596 = fma(_2584, _2564, _2588);
    float _2598 = fma(_2562, _2570, _2590);
    float _2600 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2592, _2570, _2596);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    bool _2610 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2612 = isnan(0.5);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2618 = _2614 || _2616;
    float _2620 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2622 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2624 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2626 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2620);
    float _2628 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2622);
    float _2630 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2632 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2634 = _1800 + _2630;
    float _2636 = _1726 + _2632;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2640 = _2634 + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2644 = _2636 + _2642;
    float _2646 = _2640 * _2640;
    float _2648 = fma(_2644, _2644, _2646);
    float _2650 = _2628 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2652 = sqrt(_2648);
    float _2654 = _1778 + _2650;
    bool _2656 = _2652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2564;
    float _2660 = _2636;
    float _2662 = _2634;
    float _2664 = _2556;
    if (!_2656)
    {
        _2658 = _2654;
    }
    float _2666 = _2658;
    bool _2668 = !_2656;
    float _2670 = _2666;
    if (!_2668)
    {
        float _2672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2676 = _2652 + _2674;
        float _2678 = rsqrt(_2648);
        float _2680 = _2676 * _2672;
        float _2682 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2684 = _2680 * 0.15915493667125701904296875;
        float _2686 = _2684 * 6.283185482025146484375;
        float _2688 = cos(_2686);
        float _2690 = _2684 * 6.283185482025146484375;
        float _2692 = sin(_2690);
        float _2694 = _2688 + (-1.0);
        float _2696 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2698 = fma(_2692, _2682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2700 = fma(_2654, _2688, _2696);
        float _2702 = _2678 * _2698;
        float _2704 = fma(_2644, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2706 = fma(_2640, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2660 = _2704;
        _2670 = _2700;
        _2662 = _2706;
    }
    float _2708 = _2660;
    float _2710 = _2670;
    float _2712 = _2662;
    float _2714 = -_2328;
    float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2708);
    float _2718 = -_2326;
    float _2720 = fma(_2718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2710);
    float _2722 = -_2368;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2712);
    float _2726 = _2720;
    float _2728 = _2716;
    float _2730 = _2724;
    if (!_2618)
    {
        float _2732 = _2414 * _2414;
        float _2734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2736 = -_1800;
        float _2738 = _2736 + _2712;
        float _2740 = fma(_2418, _2418, _2732);
        float _2742 = fma(_2424, _2424, _2740);
        float _2744 = 1.0 / _2524;
        float _2746 = sqrt(_2742);
        float _2748 = precise::min(_2746, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2750 = _2748 * _2734;
        float _2752 = -_1726;
        float _2754 = _2752 + _2708;
        float _2756 = _2750 * _2744;
        float _2758 = -_1778;
        float _2760 = _2758 + _2710;
        float _2762 = fma(_2754, _2756, _2404);
        float _2764 = fma(_2760, _2756, _2400);
        float _2766 = fma(_2738, _2756, _2408);
        _2726 = _2764;
        _2728 = _2762;
        _2730 = _2766;
    }
    float _2768 = _2726;
    float _2770 = _2728;
    float _2772 = _2730;
    float _2774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2776 = _2768 + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2780 = _2770 + _2778;
    float _2782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2784 = _2772 + _2782;
    float _2786 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2788 = _2776 * _2776;
    float _2790 = fma(_2780, _2780, _2788);
    float _2792 = fma(_2784, _2784, _2790);
    float _2794 = rsqrt(_2792);
    float _2796 = sqrt(_2792);
    float _2798 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2800 = _2780 * _2798;
    float _2802 = _2784 * _2798;
    float _2804 = _2800 * _2800;
    float _2806 = _2802 * _2802;
    float _2808 = _2804 + _2806;
    float _2810 = sqrt(_2808);
    bool _2812 = _2810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2816 = _2810 + _2814;
    float _2818 = _2784;
    float _2820 = _2808;
    float _2822 = _2816;
    float _2824 = _2798;
    if (_2812)
    {
        float _2826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2818 = _2826;
    }
    float _2828 = _2818;
    if (_2812)
    {
        float _2830 = rsqrt(_2808);
        _2820 = _2830;
    }
    float _2832 = _2820;
    float _2834 = _2832;
    if (_2812)
    {
        float _2836 = _2816 * _2828;
        _2822 = _2836;
    }
    float _2838 = _2822;
    if (_2812)
    {
        float _2840 = _2838 * 0.15915493667125701904296875;
        _2396 = _2840;
    }
    float _2842 = _2396;
    float _2844 = _2828;
    float _2846 = _2842;
    if (_2812)
    {
        float _2848 = _2842 * 6.283185482025146484375;
        float _2850 = sin(_2848);
        _2844 = _2850;
    }
    float _2852 = _2844;
    float _2854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2856 = precise::max(0.0, _2854);
    float _2858 = _2788;
    float _2860 = _2856;
    if (_2812)
    {
        float _2862 = _2842 * 6.283185482025146484375;
        float _2864 = cos(_2862);
        _2858 = _2864;
    }
    float _2866 = _2858;
    float _2868 = -_2798;
    float _2870 = -_2856;
    float _2872 = fma(_2776, _2868, _2870);
    float _2874 = _2872;
    if (_2812)
    {
        float _2876 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2860 = _2876;
    }
    float _2878 = _2860;
    float _2880 = _2852;
    float _2882 = _2878;
    if (_2812)
    {
        float _2884 = fma(_2852, _2878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2880 = _2884;
    }
    float _2886 = _2880;
    float _2888 = _2886;
    float _2890 = _2866;
    if (_2812)
    {
        float _2892 = _2866 + (-1.0);
        _2882 = _2892;
    }
    float _2894 = _2882;
    float _2896 = _2894;
    if (_2812)
    {
        float _2898 = _2832 * _2886;
        _2824 = _2898;
    }
    float _2900 = _2824;
    if (!_2812)
    {
        _2888 = _2800;
    }
    float _2902 = _2888;
    float _2904 = _2902;
    if (_2812)
    {
        float _2906 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2906;
    }
    float _2908 = _2846;
    if (_2812)
    {
        float _2910 = _2800 * _2900;
        _2904 = _2910;
    }
    float _2912 = _2904;
    if (!_2812)
    {
        _2896 = _2802;
    }
    float _2914 = _2896;
    float _2916 = _2914;
    if (_2812)
    {
        float _2918 = _2802 * _2900;
        _2916 = _2918;
    }
    float _2920 = _2916;
    if (!_2812)
    {
        _2834 = _2804;
    }
    float _2922 = _2834;
    float _2924 = _2922;
    if (_2812)
    {
        float _2926 = fma(_2872, _2866, _2908);
        _2874 = _2926;
    }
    float _2928 = _2874;
    if (_2812)
    {
        float _2930 = _2912 * _2912;
        _2924 = _2930;
    }
    float _2932 = _2924;
    if (!_2812)
    {
        _2890 = _2806;
    }
    float _2934 = _2890;
    float _2936 = _2934;
    if (_2812)
    {
        float _2938 = _2920 * _2920;
        _2936 = _2938;
    }
    float _2940 = _2936;
    float _2942 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2944 = fma(_2928, _2928, _2932);
    float _2946 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2948 = _2944 + _2940;
    float _2950 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2942);
    float _2952 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2956 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2954);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = rsqrt(_2948);
    float _2962 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2950);
    float _2964 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2966 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2952);
    float _2968 = -_2958;
    float _2970 = _2968 + 1.0;
    float _2972 = _2962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2974 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2964);
    float _2976 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2966);
    float _2978 = abs(_2970);
    float _2980 = log2(_2978);
    float _2982 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2984 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2974);
    float _2986 = _2976 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2988 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2946);
    float _2990 = -_2982;
    float _2992 = fma(_2990, _2786, 1.0);
    float _2994 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2996 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2998 = _2960 * _2912;
    float _3000 = _2960 * _2928;
    float _3002 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2988);
    float _3004 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2996);
    float _3006 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3008 = _2960 * _2920;
    float _3010 = _3002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3012 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3004);
    float _3014 = -_3006;
    float _3016 = fma(_3000, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3014);
    float _3018 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3020 = log2(_2992);
    float _3022 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3012);
    float _3024 = -_3008;
    float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3016);
    float _3028 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3030 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3032 = _3000 + 1.0;
    float _3034 = fma(_3026, -0.5, 0.5);
    float _3036 = fma(_3026, 0.5, 0.5);
    float _3038 = 1.0 / _3022;
    float _3040 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3028);
    float _3042 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3030);
    float _3044 = fma(_3036, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3046 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3040);
    float _3048 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3042);
    float _3050 = fma(_3036, _3044, -0.212114393711090087890625);
    float _3052 = exp2(_3018);
    float _3054 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3046);
    float _3056 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3048);
    float _3058 = _3020 * 0.693147182464599609375;
    float _3060 = fma(_3036, _3050, 1.570728778839111328125);
    float _3062 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3064 = sqrt(_3034);
    float _3066 = _3054 * _3038;
    float _3068 = _3056 * _3038;
    float _3070 = fma(_3066, 0.5, 0.5);
    float _3072 = fma(_3068, -0.5, 0.5);
    float _3074 = -_3000;
    float _3076 = fma(_3052, _3032, _3074);
    float3 _8361 = float3(_3070, _3072, _3062);
    float _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8361, float3(0.0), isnan(_8361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8361, float3(0.0), isnan(_8361)), level(0.0)).x;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = _3064 * 0.636619746685028076171875;
    float _3084 = -_3060;
    float _3086 = fma(_3082, _3084, 1.0);
    float3 _8382 = float3(_3070, _3072, _3062);
    float4 _3089 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8382, float3(0.0), isnan(_8382)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8382, float3(0.0), isnan(_8382)), level(0.0)).xyzw;
    float _3091 = _3089.x;
    float _3093 = _3089.y;
    float _3095 = _3089.z;
    float _3097 = _3089.w;
    float2 _8399 = float2(_3086, _3080);
    float3 _3101 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8399, float2(0.0), isnan(_8399)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8399, float2(0.0), isnan(_8399)), level(0.0)).xyz;
    float _3103 = _3101.x;
    float _3105 = _3101.y;
    float _3107 = _3101.z;
    float _3109 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3111 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3113 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3115 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3117 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3119 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3121 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3109);
    float _3123 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3111);
    float _3125 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3113);
    float _3127 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3115);
    float _3129 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3119);
    float _3131 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3133 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3135 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3137 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3121);
    float _3139 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3123);
    float _3141 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3143 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3145 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3147 = _377 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3149 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3141);
    float _3151 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3143);
    float _3153 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3145);
    float _3155 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3117);
    float _3157 = _3139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3159 = -_2538;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3131);
    float _3163 = -_2538;
    float _3165 = fma(_3163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3133);
    float _3167 = -_2538;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3135);
    float _3171 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3173 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3149);
    float _3175 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3151);
    float _3177 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3153);
    float _3179 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3155);
    float _3181 = fma(_3147, _3147, 1.0);
    float _3183 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3185 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3187 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3189 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3191 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3193 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3171);
    float _3195 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3161);
    float _3197 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3165);
    float _3199 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3169);
    float _3201 = rsqrt(_3181);
    float _3203 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3185);
    float _3205 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3187);
    float _3207 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3189);
    float _3209 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3191);
    float _3211 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3213 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3215 = _3147 * _3197;
    float _3217 = -_617;
    float _3219 = _3217 + _2768;
    float _3221 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3125);
    float _3223 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3225 = _3147 * _3195;
    float _3227 = -_615;
    float _3229 = _3227 + _2770;
    float _3231 = -_619;
    float _3233 = _3231 + _2772;
    float _3235 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3129);
    float _3237 = fma(_3213, _3221, _3225);
    float _3239 = fma(_3213, _3223, _3215);
    float _3241 = _3147 * _3199;
    out.m_72.x = _3221;
    out.m_72.y = _3223;
    out.m_72.z = _3211;
    float _3243 = _3147 * _3201;
    float _3245 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3247 = fma(_3213, _3211, _3241);
    out.m_74.x = _2770;
    out.m_74.y = _2768;
    out.m_74.z = _2772;
    float _3249 = -_3173;
    float _3251 = _3243 * _3249;
    float _3253 = -_3175;
    float _3255 = _3243 * _3253;
    float _3257 = -_3177;
    float _3259 = _3243 * _3257;
    float _3261 = exp2(_3245);
    float _3263 = fma(_3201, _3195, _3251);
    float _3265 = fma(_3201, _3197, _3255);
    float _3267 = fma(_3201, _3199, _3259);
    float _3269 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3271 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3273 = _3179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3275 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3269);
    float _3277 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3271);
    float _3279 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_76.x = _3263;
    out.m_76.y = _3265;
    out.m_76.z = _3267;
    float _3281 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3275);
    float _3283 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3285 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3279);
    float _3287 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3277);
    float _3289 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3291 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3283);
    float _3293 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3295 = _3235 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3297 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3285);
    float _3299 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3291);
    float _3301 = _3293 + _3209;
    float _3303 = 1.0 / _3289;
    float _3305 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3287);
    float _3307 = _3299 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3309 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3301);
    float _3311 = fma(_3273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3207);
    float _3313 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3315 = _3305 + _3022;
    float _3317 = _3054 + _3022;
    float _3319 = _3022 * 0.5;
    float _3321 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3311);
    float _3323 = -_3261;
    float _3325 = _3323 + 1.0;
    float _3327 = _3315 * 0.5;
    float _3329 = _3317 * 0.5;
    float _3331 = fma(_3056, -0.5, _3319);
    float _3333 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _3054;
    out.gl_Position.y = _3056;
    out.gl_Position.z = _3305;
    out.gl_Position.w = _3022;
    float _3335 = _3307 * _3303;
    float _3337 = _3313 * _3303;
    float _3339 = 1.0 / _3309;
    out.m_78.x = _3329;
    out.m_78.y = _3331;
    out.m_78.z = _3327;
    out.m_78.w = _3022;
    float _3341 = _3173 + _3237;
    float _3343 = _3175 + _3239;
    float _3345 = _3177 + _3247;
    out.m_80.y = 1.0;
    float _3347 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3349 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.m_82.x = _3341;
    out.m_82.y = _3343;
    out.m_82.z = _3345;
    float _3351 = _3347 + _3203;
    float _3353 = -_3333;
    float _3355 = _3353 + 1.0;
    float _3357 = _3349 + _3205;
    float _3359 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3351);
    float _3361 = _3321 * _3339;
    float _3363 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3357);
    float _3365 = _3359 * _3339;
    bool _3367 = _3361 > 0.0;
    bool _3369 = _3361 < 1.0;
    bool _3371 = _3369 && _3367;
    bool _3373 = _3066 > (-1.0);
    bool _3375 = _3373 && _3371;
    bool _3377 = _3068 > (-1.0);
    bool _3379 = _3377 && _3375;
    bool _3381 = _3066 < 1.0;
    bool _3383 = _3381 && _3379;
    bool _3385 = _3068 < 1.0;
    bool _3387 = _3385 && _3383;
    float _3389 = _3333 * _3078;
    float _3391 = _3363 * _3339;
    float _3393 = _3097 * _3389;
    float _3395 = _3097 * _3355;
    float _3397 = _3107 * _3389;
    float _3399 = fma(_3103, _3393, _3091);
    float _3401 = fma(_3105, _3393, _3093);
    float _3403 = fma(_3097, _3397, _3095);
    out.m_84.x = _3399;
    out.m_84.y = _3401;
    out.m_84.z = _3403;
    out.m_84.w = _3395;
    bool _3405 = !_3387;
    float _3407 = _3401;
    float _3409 = _3054;
    float _3411 = _3399;
    float _3413 = _3056;
    float _3415 = _3022;
    float _3441;
    float _3447;
    if (!_3405)
    {
        float _3417 = -_3391;
        float _3419 = _3068 + _3417;
        float _3421 = -_3365;
        float _3423 = _3066 + _3421;
        float _3425 = -_3337;
        float _3427 = _3066 + _3425;
        float _3429 = -_3335;
        float _3431 = _3068 + _3429;
        float _3433 = _3419 * _3419;
        float _3435 = fma(_3423, _3423, _3433);
        float _3437 = sqrt(_3435);
        bool _3439 = _3437 > 0.0;
        _3411 = _3435;
        _3441 = _3437;
        if (!_3439)
        {
            _3407 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3443 = _3407;
        bool _3445 = !_3439;
        _3447 = _3443;
        _3449 = _3445;
        if (!_3449)
        {
            float _3451 = _3431 * _3431;
            float _3453 = fma(_3427, _3427, _3451);
            float _3455 = rsqrt(_3435);
            float _3457 = sqrt(_3453);
            float _3459 = _3423 * _3455;
            float _3461 = _3419 * _3455;
            bool _3463 = _3457 > 0.0;
            float _3465 = _3457;
            _3441 = _3455;
            if (!_3463)
            {
                _3465 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3467 = _3465;
            bool _3469 = !_3463;
            _3447 = _3467;
            _3449 = _3469;
            if (!_3449)
            {
                float _3471 = _2556 * _3295;
                float _3473 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3475 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3293);
                float _3477 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3349);
                float _3479 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3347);
                float _3481 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3475);
                float _3483 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3477);
                float _3485 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3479);
                float _3487 = rsqrt(_3453);
                float _3489 = _3473 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3491 = 1.0 / _3481;
                float _3493 = _3431 * _3489;
                float _3495 = _3427 * _3489;
                float _3497 = _3493 * _3493;
                float _3499 = fma(_3495, _3495, _3497);
                float _3501 = _3483 * _3491;
                float _3503 = _3485 * _3491;
                float _3505 = sqrt(_3499);
                float _3507 = _3501 * _3501;
                float _3509 = fma(_3503, _3503, _3507);
                float _3511 = _3431 * _3487;
                float _3513 = _3427 * _3487;
                float _3515 = _3461 * _3511;
                float _3517 = sqrt(_3509);
                float _3519 = fma(_3459, _3513, _3515);
                float _3521 = precise::min(0.0, _3519);
                float _3523 = _3022 * _3521;
                float _3525 = fma(_3505, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3517);
                float _3527 = fma(_3495, _3523, _3054);
                float _3529 = fma(_3493, _3523, _3056);
                float _3531 = 1.0 / _3525;
                out.gl_Position.x = _3527;
                out.gl_Position.y = _3529;
                float _3533 = _3517 * _3531;
                out.m_80.y = _3533;
                _3409 = _3527;
                _3411 = _3493;
                _3413 = _3529;
                _3441 = _3523;
                _2664 = _3519;
                _3447 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3449 = true;
            }
        }
    }
    else
    {
        float _3535 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3535;
        _3409 = 0.0;
        _3413 = 0.0;
        _3441 = _3535;
        _2664 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3447 = 0.0;
    }
    _3449 = false;
    float _3537 = _3409;
    float _3539 = _3411;
    float _3541 = _3413;
    float _3543 = _3441;
    float _3545 = _2664;
    float _3547 = _3447;
    bool _3549 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3551 = isnan(_2796);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3557 = _3553 || _3555;
    float _3559 = _3539;
    float _3561 = _3543;
    float _3563 = _3541;
    float _3565 = _3537;
    float _3567 = _3545;
    if (!_3557)
    {
        _3559 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3569 = _3559;
    float _3571 = _3569;
    float _3573 = _3569;
    if (!_3557)
    {
        _3415 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3575 = _3415;
    float _3577 = _3575;
    float _3579 = _3575;
    if (!_3557)
    {
        _3561 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3581 = _3561;
    float _3583 = _3581;
    float _3585 = _3581;
    if (!_3557)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3587 = _3563;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3557)
    {
        _3565 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3593 = _3565;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3557)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3599 = _3567;
    bool _3601 = !_3557;
    float _3603 = _3599;
    float _3605 = _3599;
    if (!_3601)
    {
        bool _3607 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3609 = isnan(_2796);
        bool _3611 = _3607 || _3609;
        bool _3613 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3615 = _3611 || _3613;
        if (!_3615)
        {
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3619 = _2796 + _3617;
            float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3623 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3621;
            float _3625 = 1.0 / _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3629 = _3627 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3647 = _3619 * _3625;
            float _3649 = precise::clamp(_3647, 0.0, 1.0);
            float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3655 = fma(_3649, _3629, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3657 = fma(_3649, _3653, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3659 = fma(_3649, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3661 = fma(_3649, _3637, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3663 = fma(_3649, _3641, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3665 = fma(_3649, _3645, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3579 = _3657;
            _3597 = _3663;
            _3573 = _3655;
            _3591 = _3661;
            _3585 = _3659;
            _3605 = _3665;
            _3667 = true;
        }
        else
        {
            bool _3669 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3671 = isnan(_2796);
            bool _3673 = _3669 || _3671;
            bool _3675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3677 = _3673 || _3675;
            if (!_3677)
            {
                _3571 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3679 = _3571;
            _3573 = _3679;
            if (!_3677)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3681 = _3577;
            _3579 = _3681;
            if (!_3677)
            {
                _3583 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3683 = _3583;
            _3585 = _3683;
            if (!_3677)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3685 = _3589;
            _3591 = _3685;
            if (!_3677)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3687 = _3595;
            _3597 = _3687;
            if (!_3677)
            {
                _3603 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3689 = _3603;
            bool _3691 = !_3677;
            _3605 = _3689;
            if (!_3691)
            {
                bool _3693 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3695 = isnan(_2796);
                bool _3697 = _3693 || _3695;
                bool _3699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3701 = _3697 || _3699;
                if (!_3701)
                {
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3705 = _2796 + _3703;
                    float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3709 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3707;
                    float _3711 = 1.0 / _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3733 = _3705 * _3711;
                    float _3735 = precise::clamp(_3733, 0.0, 1.0);
                    float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3739 = _3737 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3741 = fma(_3735, _3715, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3743 = fma(_3735, _3739, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3745 = fma(_3735, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3747 = fma(_3735, _3723, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3749 = fma(_3735, _3727, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3751 = fma(_3735, _3731, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3579 = _3743;
                    _3597 = _3749;
                    _3573 = _3741;
                    _3591 = _3747;
                    _3585 = _3745;
                    _3605 = _3751;
                    _3667 = true;
                }
                else
                {
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3573 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3585 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3605 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3667 = false;
    float _3753 = _3579;
    float _3755 = _3597;
    float _3757 = _3573;
    float _3759 = _3591;
    float _3761 = _3585;
    float _3763 = _3605;
    float _3765 = fma(_3343, -0.5, 0.5);
    float _3767 = precise::clamp(_3765, 0.0, 1.0);
    float _3769 = -_3753;
    float _3771 = _3769 + _3755;
    float _3773 = -_3757;
    float _3775 = _3773 + _3759;
    float _3777 = -_3761;
    float _3779 = _3777 + _3763;
    bool _3781 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3783 = fma(_3767, _3771, _3753);
    float _3785 = fma(_3767, _3775, _3757);
    float _3787 = fma(_3767, _3779, _3761);
    float _3789 = _3547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3791 = _3783 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3793 = fma(_3785, 0.298911988735198974609375, _3791);
    out.m_80.w = _3789;
    float _3795 = fma(_3787, 0.114477999508380889892578125, _3793);
    float _3797 = -_3795;
    float _3799 = _3785 + _3797;
    float _3801 = -_3795;
    float _3803 = _3783 + _3801;
    float _3805 = -_3795;
    float _3807 = _3787 + _3805;
    out.m_86.x = 0.0;
    float _3809 = fma(_3799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    float _3811 = fma(_3803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    float _3813 = fma(_3807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    out.m_88.x = _3809;
    out.m_88.y = _3811;
    out.m_88.z = _3813;
    if (!_3781)
    {
        return out;
    }
    float _3815 = -_2768;
    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3819 = -_2770;
    float _3821 = _3819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3823 = -_2772;
    float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3827 = _3817 * _3817;
    float _3829 = fma(_3821, _3821, _3827);
    float _3831 = fma(_3825, _3825, _3829);
    float _3833 = sqrt(_3831);
    float _3835 = rsqrt(_3831);
    float _3837 = -_3833;
    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3841 = _3839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3843 = precise::clamp(_3841, 0.0, 1.0);
    float _3845 = _3821 * _3835;
    float _3847 = _3817 * _3835;
    float _3849 = abs(_3843);
    float _3851 = log2(_3849);
    float _3853 = _3825 * _3835;
    float _3855 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3857 = _3343 * _3847;
    float _3859 = -_3847;
    float _3861 = -_3855;
    float _3863 = fma(_3859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3861);
    float _3865 = fma(_3341, _3845, _3857);
    float _3867 = -_3853;
    float _3869 = fma(_3867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3863);
    float _3871 = fma(_3345, _3853, _3865);
    float _3873 = precise::clamp(_3871, 0.0, 1.0);
    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3877 = _3869 + _3875;
    float _3879 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3881 = _3877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = exp2(_3879);
    float _3887 = _3885 * _3883;
    float _3889 = _3873 * _3887;
    float _3891 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3893 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3895 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3891;
    out.m_86.y = _3893;
    out.m_86.z = _3895;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3667 = false;
    bool _3449 = false;
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
        float _3952 = as_type<float>(_123);
        out.gl_Position.z = _3952;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4026 = as_type<float>(_163);
        out.gl_Position.z = _4026;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = _647 + _655;
    bool _659 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _661 = isnan(_647);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _673 = int(_671);
    bool _675 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_647);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = float(_651);
    float _689 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _691 = int(_689);
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _695 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _693);
    float _697 = float(uint(_673));
    float _699 = 1.0 / _687;
    int _701 = ~_673;
    int _703 = _701 + 1;
    float _705 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _695);
    int _707 = ~_673;
    int _709 = _707 + 1;
    bool _711 = _673 == 0;
    float _713 = -_705;
    float _715 = _713 + 1.0;
    float _717 = 1.0 / _697;
    float _719 = float(_691);
    float _721 = _699 * _143;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _725 = int(_723);
    int _727 = as_type<int>(_717) + (-2);
    float _729 = trunc(_721);
    int _731 = int(_729);
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _735 = _733 != 0;
    float _737 = 1.0 / _719;
    float _739 = float(uint(_725));
    int _741 = ~_725;
    int _743 = _741 + 1;
    int _745 = ~_725;
    int _747 = _745 + 1;
    float _749 = float(uint(_731));
    float _751 = 1.0 / _739;
    float _753 = as_type<float>(_727) * _749;
    float _755 = _737 * _143;
    float _757 = trunc(_753);
    float _759 = precise::max(_757, 0.0);
    uint _762 = uint(_759);
    float _764 = in.m_51.y;
    float _766 = trunc(_755);
    int _768 = int(_766);
    int _770 = as_type<int>(_751) + (-2);
    float _772 = _753;
    if (_735)
    {
        _772 = _129;
    }
    float _774 = _772;
    int _776 = _703 * int(_762);
    int _778 = _776 + _731;
    float _780 = 1.0 / _653;
    float _782 = float(uint(_778));
    float _784 = as_type<float>(_778);
    float _786 = _774;
    if (_735)
    {
        _784 = 1.0;
    }
    float _788 = _784;
    float _790 = float(uint(_768));
    float _792 = as_type<float>(_727) * _782;
    float _794 = _788;
    float _796 = _790;
    if (!_735)
    {
        _794 = 1.2345600128173828125;
    }
    float _798 = _794;
    if (!_735)
    {
        _786 = _764;
    }
    float _800 = _786;
    float _802 = as_type<float>(_770) * _790;
    if (_735)
    {
        _796 = 1.0;
    }
    float _804 = _796;
    float _806 = trunc(_792);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    float _812 = _804;
    if (!_735)
    {
        _812 = 7.345489978790283203125;
    }
    float _814 = _812;
    float _816 = _798 * _800;
    float _818 = float(_725);
    float _820 = _814 * _129;
    float _822 = trunc(_802);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    float _828 = floor(_820);
    int _830 = ~_725;
    int _832 = _830 + 1;
    int _834 = int(_762) + int(_810);
    int _836 = _832 * int(_826);
    int _838 = _836 + _768;
    float _840 = floor(_816);
    int _842 = _709 * _834;
    int _844 = _842 + _731;
    float _846 = float(uint(_838));
    float _848 = -_828;
    float _850 = _820 + _848;
    bool _852 = uint(_844) >= uint(_673);
    float _854 = as_type<float>(_770) * _846;
    float _856 = float(_673);
    float _858 = _780 * _143;
    float _860 = trunc(_854);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = _850 * _856;
    bool _868 = !_852;
    int _870 = _868 ? 0 : (-1);
    float _872 = -_840;
    float _874 = _816 + _872;
    float _876 = float(_731);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _880 = _878 != 0;
    float _882 = trunc(_866);
    int _884 = int(_882);
    bool _886 = _876 >= _856;
    bool _888 = isnan(_876);
    bool _890 = _886 || _888;
    bool _892 = isnan(_856);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _856 * _858;
    int _900 = ~_834;
    int _902 = _900 + _870;
    int _904 = _902 + 1;
    float _906 = _818 * _858;
    bool _908 = !_880;
    int _910 = _908 ? 0 : 1;
    float _912 = _874 * _818;
    float _914 = float(_768);
    float _916 = trunc(_896);
    int _918 = int(_916);
    int _920 = abs(_910);
    bool _922 = _914 >= _818;
    bool _924 = isnan(_914);
    bool _926 = _922 || _924;
    bool _928 = isnan(_818);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    int _934 = int(_826) + int(_864);
    int _936 = _884 * _920;
    int _938 = _936 + _731;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _942 = _940 != 0;
    int _944 = _673 * _904;
    int _946 = _944 + _731;
    int _948 = _743 * _934;
    int _950 = _948 + _768;
    float _952 = trunc(_912);
    int _954 = int(_952);
    bool _956 = !_942;
    int _958 = _956 ? 0 : 1;
    float _960 = _589 * _167;
    bool _962 = !_711;
    int _964 = _962 ? _946 : (-1);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _972 = _970 != 0;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _976 = _974 != 0;
    bool _978 = uint(_950) >= uint(_725);
    float _980 = trunc(_898);
    int _982 = int(_980);
    int _984 = ~_918;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    bool _990 = !_978;
    int _992 = _990 ? 0 : (-1);
    int _994 = abs(_958);
    int _996 = _964 * _988;
    bool _998 = !_972;
    int _1000 = _998 ? 0 : 1;
    float _1002 = trunc(_932);
    int _1004 = int(_1002);
    int _1006 = _673 + (-1);
    int _1008 = ~_934;
    int _1010 = _1008 + _992;
    int _1012 = _1010 + 1;
    int _1014 = abs(_1000);
    int _1016 = _918 * _1006;
    int _1018 = _1016 + _996;
    bool _1020 = !_968;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _954 * _994;
    int _1026 = _1024 + _768;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1030 = _1028 != 0;
    int _1032 = _725 * _1012;
    int _1034 = _1032 + _768;
    bool _1036 = !_976;
    int _1038 = _1036 ? 0 : 1;
    int _1040 = _1018 * _1014;
    int _1042 = abs(_1022);
    float _1044 = trunc(_906);
    int _1046 = int(_1044);
    bool _1048 = _725 == 0;
    float _1050 = in.m_51.w;
    int _1052 = abs(_1038);
    int _1054 = _982 * _1042;
    int _1056 = _1054 + _1040;
    bool _1058 = !_1030;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = ~_1004;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1048;
    int _1070 = _1068 ? _1034 : (-1);
    float _1072 = _589 * _175;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1088 = _1086 != 0;
    int _1090 = _1070 * _1066;
    int _1092 = abs(_1060);
    int _1094 = _938 * _1052;
    int _1096 = _1094 + _1056;
    int _1098 = _725 + (-1);
    float _1100 = fma(_591, _173, _1072);
    float _1102 = _764 * 2.0;
    bool _1104 = !_1080;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1004 * _1098;
    int _1110 = _1108 + _1090;
    bool _1112 = !_1076;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _884 * _1092;
    int _1118 = _1116 + _1096;
    int _1120 = abs(_1106);
    bool _1122 = !_1084;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = abs(_1114);
    bool _1128 = !_1088;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = abs(_1124);
    int _1134 = _1110 * _1120;
    float _1136 = float(uint(_1118));
    float _1138 = _589 * _181;
    int _1140 = abs(_1130);
    int _1142 = _1046 * _1126;
    int _1144 = _1142 + _1134;
    float _1146 = as_type<float>(_727) * _1136;
    float _1148 = in.m_51.z;
    int _1150 = ~_725;
    int _1152 = _1150 + 1;
    int _1154 = _1026 * _1132;
    int _1156 = _1154 + _1144;
    int _1158 = ~_673;
    int _1160 = _1158 + 1;
    float _1162 = trunc(_1146);
    float _1164 = precise::max(_1162, 0.0);
    uint _1166 = uint(_1164);
    bool _1168 = _673 == 0;
    int _1170 = _954 * _1140;
    int _1172 = _1170 + _1156;
    int _1174 = ~_673;
    int _1176 = _1174 + 1;
    float _1178 = float(uint(_1172));
    float _1180 = as_type<float>(_770) * _1178;
    int _1182 = _1176 * int(_1166);
    int _1184 = _1182 + _1118;
    float _1186 = trunc(_1180);
    float _1188 = precise::max(_1186, 0.0);
    uint _1190 = uint(_1188);
    float _1192 = float(uint(_1184));
    float _1194 = as_type<float>(_727) * _1192;
    float _1196 = trunc(_1194);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = _1152 * int(_1190);
    int _1204 = _1202 + _1172;
    float _1206 = float(uint(_1204));
    float _1208 = as_type<float>(_770) * _1206;
    int _1210 = int(_1166) + int(_1200);
    float _1212 = trunc(_1208);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    int _1218 = ~_725;
    int _1220 = _1218 + 1;
    int _1222 = _1160 * _1210;
    int _1224 = _1222 + _1118;
    bool _1226 = uint(_1224) >= uint(_673);
    bool _1228 = !_1226;
    int _1230 = _1228 ? 0 : (-1);
    int _1232 = int(_1190) + int(_1216);
    int _1234 = ~_1210;
    int _1236 = _1234 + _1230;
    int _1238 = _1236 + 1;
    float _1240 = float(uint(_938));
    int _1242 = _673 * _1238;
    int _1244 = _1242 + _1118;
    int _1246 = _1220 * _1232;
    int _1248 = _1246 + _1172;
    float _1250 = as_type<float>(_727) * _1240;
    bool _1252 = !_1168;
    int _1254 = _1252 ? _1244 : (-1);
    bool _1256 = uint(_1248) >= uint(_725);
    float _1258 = trunc(_1250);
    float _1260 = precise::max(_1258, 0.0);
    uint _1262 = uint(_1260);
    int _1264 = _1254 & 3;
    bool _1266 = _1264 != 0;
    bool _1268 = !_1256;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = uint(_1264) > 1u;
    int _1274 = _1254 & 3;
    bool _1276 = _1274 != 0;
    int _1278 = ~_1232;
    int _1280 = _1278 + _1270;
    int _1282 = _1280 + 1;
    int _1284 = _1276 ? 0 : 1;
    bool _1286 = _1264 != 3;
    int _1288 = _725 * _1282;
    int _1290 = _1288 + _1172;
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _129 * 2.0;
    bool _1300 = uint(_1264) >= 2u;
    int _1302 = _1296;
    float _1304 = _1102;
    if (!_1272)
    {
        int _1306 = ~_1284;
        int _1308 = _1306 + 1;
        _1302 = _1308;
    }
    int _1310 = _1302;
    float _1312 = floor(_1298);
    float _1314 = float(uint(_1026));
    int _1316 = _1300 ? 0 : 1;
    bool _1318 = !_1048;
    int _1320 = _1318 ? _1290 : (-1);
    float _1322 = as_type<float>(_770) * _1314;
    int _1324 = ~_1316;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    int _1330 = _1328;
    if (_1286)
    {
        int _1332 = ~_1316;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = trunc(_1322);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    int _1344 = _1320 & 3;
    bool _1346 = _1344 != 0;
    int _1348 = _1320 & 3;
    bool _1350 = _1348 != 0;
    int _1352 = ~_673;
    int _1354 = _1352 + 1;
    bool _1356 = uint(_1344) >= 2u;
    int _1358 = _1350 ? 0 : 1;
    int _1360 = _1354 * int(_1262);
    int _1362 = _1360 + _938;
    bool _1364 = uint(_1344) > 1u;
    int _1366 = _1356 ? 0 : 1;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1370 = _1368 != 0;
    bool _1372 = _1344 != 3;
    float _1374 = floor(_1102);
    float _1376 = float(uint(_1362));
    int _1378 = _747 * int(_1342);
    int _1380 = _1378 + _1026;
    int _1382 = ~_1358;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    int _1388 = ~_1366;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = as_type<float>(_727) * _1376;
    float _1396 = float(uint(_1380));
    int _1398 = _1386;
    int _1400 = as_type<int>(_1376);
    int _1402 = _1392;
    if (!_1364)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1398 = _1406;
    }
    int _1408 = _1398;
    float _1410 = as_type<float>(_770) * _1396;
    bool _1412 = _129 > 0.5;
    float _1414 = trunc(_1394);
    float _1416 = precise::max(_1414, 0.0);
    uint _1418 = uint(_1416);
    if (_1370)
    {
        _1400 = 0;
    }
    int _1420 = _1400;
    int _1422 = _1420;
    if (_1372)
    {
        int _1424 = ~_1366;
        int _1426 = _1424 + 1;
        _1402 = _1426;
    }
    int _1428 = _1402;
    if (!_1370)
    {
        _1422 = 1;
    }
    int _1430 = _1422;
    int _1432 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1434 = _1432 != 0;
    float _1436 = trunc(_1410);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    float _1442 = -_359;
    int _1444 = _1412 ? as_type<int>(_1442) : as_type<int>(_359);
    bool _1446 = _764 > 0.5;
    bool _1448 = !_1434;
    float _1450 = _1448 ? _359 : as_type<float>(_1444);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1454 = _1452 != 0;
    float _1456 = -_377;
    float _1458 = _1446 ? _1456 : _377;
    float _1460 = _1450 + 0.5;
    bool _1462 = _1148 > 0.5;
    bool _1464 = _1050 > 0.5;
    float _1466 = fma(_591, _165, _960);
    bool _1468 = !_1454;
    float _1470 = _1468 ? _377 : _1458;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    float _1476 = -_359;
    int _1478 = _1462 ? as_type<int>(_1476) : as_type<int>(_359);
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1482 = _1480 != 0;
    float _1484 = -_377;
    int _1486 = _1464 ? as_type<int>(_1484) : as_type<int>(_377);
    bool _1488 = !_1474;
    float _1490 = _1488 ? _359 : as_type<float>(_1478);
    bool _1492 = _1430 != 1;
    bool _1494 = _1312 > 0.0;
    float _1496 = _1490 + 0.5;
    bool _1498 = !_1482;
    float _1500 = _1498 ? _377 : as_type<float>(_1486);
    bool _1502 = _1312 >= 0.0;
    bool _1504 = isnan(_1312);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    int _1512 = int(_1262) + int(_1418);
    int _1514 = ~_673;
    int _1516 = _1514 + 1;
    int _1518 = _1510 ? 0 : 1;
    int _1520 = ~_725;
    int _1522 = _1520 + 1;
    int _1524 = _1516 * _1512;
    int _1526 = _1524 + _938;
    int _1528 = int(_1342) + int(_1440);
    bool _1530 = _1374 > 0.0;
    int _1532 = ~_1518;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    float _1538 = as_type<float>(_1440);
    float _1540 = _1458;
    int _1542 = _1536;
    if (!_1492)
    {
        _225 = _764;
    }
    float _1544 = _225;
    float _1546 = _1544;
    if (!_1492)
    {
        _1304 = _764;
    }
    float _1548 = _1304;
    float _1550 = _1548;
    if (!_1492)
    {
        _1538 = _1148;
    }
    float _1552 = _1538;
    float _1554 = _1552;
    if (!_1492)
    {
        _1540 = _1148;
    }
    float _1556 = _1540;
    float _1558 = _1556;
    if (!_1494)
    {
        int _1560 = ~_1518;
        int _1562 = _1560 + 1;
        _1542 = _1562;
    }
    int _1564 = _1542;
    if (_1492)
    {
        _1546 = _129;
    }
    float _1566 = _1546;
    if (_1492)
    {
        _1550 = _129;
    }
    float _1568 = _1550;
    if (_1492)
    {
        _1554 = _764;
    }
    float _1570 = _1554;
    if (_1492)
    {
        _1558 = _764;
    }
    float _1572 = _1558;
    bool _1574 = uint(_1526) >= uint(_673);
    int _1576 = _1522 * _1528;
    int _1578 = _1576 + _1026;
    bool _1580 = _1374 >= 0.0;
    bool _1582 = isnan(_1374);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    float _1590 = fma(_591, _179, _1138);
    float _1592 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1594 = _1588 ? 0 : 1;
    bool _1596 = uint(_1578) >= uint(_725);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1610 = !_1574;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = 1.0 / _1600;
    int _1616 = ~_1594;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    bool _1622 = !_1266;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1636 = _1634 != 0;
    float _1638 = fma(_613, _183, _1590);
    int _1640 = _1620;
    if (!_1530)
    {
        int _1642 = ~_1594;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    float _1648 = 1.0 / _1604;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1652 = _1650 != 0;
    float _1654 = _1148 * 2.0;
    int _1656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1658 = _1656 != 0;
    float _1660 = fma(_613, _169, _1466);
    float _1662 = _764 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1668 = in.m_57.w;
    float _1670 = fma(_613, _177, _1100);
    float _1672 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1676 = 1.0 / _1666;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1680 = _647 + _1678;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1684 = -_1674;
    float _1686 = fma(_1672, 2.0, _1684);
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1690 = _647 + _1688;
    float _1692 = _657 * _1648;
    float _1694 = fma(_1662, -2.0, _1682);
    float _1696 = floor(_1654);
    float _1698 = in.m_55.w;
    float _1700 = _129 + _764;
    float _1702 = _1690 * _1614;
    bool _1704 = !_1596;
    int _1706 = _1704 ? 0 : (-1);
    float _1708 = in.m_59.w;
    float _1710 = _1700 + (-1.0);
    float _1712 = _1148 + _764;
    float _1714 = 1.0 / _1608;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1718 = _647 + _1716;
    float _1720 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1722 = _1712 + (-1.0);
    float _1724 = _1680 * _1676;
    float _1726 = _1670 + _1668;
    float _1728 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1730 = _129 + _1148;
    bool _1732 = _1696 >= 0.0;
    bool _1734 = isnan(_1696);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan(0.0);
    bool _1740 = _1736 || _1738;
    float _1742 = -_143;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1686);
    float _1746 = _1730 + (-1.0);
    int _1748 = _1740 ? 0 : 1;
    float _1750 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1694);
    float _1752 = _1718 * _1714;
    bool _1754 = _1696 > 0.0;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1756;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1762;
    bool _1766 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1768 = isnan(_647);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = _1660 + _1698;
    float _1780 = fma(_1758, _1692, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1782 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1784 = isnan(_647);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = fma(_1764, _1692, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1800 = _1638 + _1708;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1806 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1808 = isnan(_647);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = -_1776;
    float _1820 = _1818 + 1.0;
    float _1822 = fma(_1798, _1752, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1824 = -_1792;
    float _1826 = _1824 + 1.0;
    float _1828 = fma(_1804, _1752, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1830 = _1816 * _1820;
    float _1832 = _669 * _1826;
    float _1834 = -_669;
    float _1836 = _1834 + 1.0;
    bool _1838 = !_1632;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = -_1816;
    float _1844 = _1842 + 1.0;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1846;
    float _1850 = _685 * _1836;
    int _1852 = abs(_1840);
    float _1854 = -_685;
    float _1856 = _1854 + 1.0;
    float _1858 = fma(_1848, _1702, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1860 = _1780 * _1850;
    float _1862 = _1794 * _1850;
    float _1864 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1860);
    float _1866 = _1792 * _1844;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1862);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1872;
    float _1876 = fma(_1822, _1832, _1864);
    float _1878 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1868);
    float _1880 = fma(_1828, _1832, _1870);
    float _1882 = float(_1564);
    float _1884 = fma(_1874, _1702, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1886 = float(_1852);
    float _1888 = _1470 + (-0.5);
    float _1890 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1892 = !_1628;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = _1886 * _1882;
    float _1898 = -_1888;
    float _1900 = -_1750;
    float _1902 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1900);
    float _1904 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1906 = log2(_1904);
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1910 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1744);
    int _1912 = _1320 >> 31;
    float _1914 = -_1908;
    float _1916 = fma(_1890, 2.0, _1914);
    int _1918 = abs(_1894);
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1922 = _1254 >> 31;
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1778 + _1924;
    int _1928 = _1912 & 3;
    float _1930 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1920);
    int _1932 = _1922 & 3;
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1936 = _1726 + _1934;
    float _1938 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1930);
    int _1940 = _1254 + _1932;
    float _1942 = _1906 * _143;
    int _1944 = _1320 + _1928;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1948 = _1940 >> 2;
    float _1950 = fma(_1858, _1866, _1880);
    bool _1952 = !_1346;
    int _1954 = _1952 ? 0 : 1;
    float _1956 = exp2(_1942);
    bool _1958 = _1264 != 3;
    float _1960 = fma(_1592, -2.0, _1946);
    int _1962 = _1944 >> 2;
    float _1964 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1966 = _1948 << 4;
    int _1968 = _1966 + 368;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1972 = _1800 + _1970;
    bool _1974 = !_1958;
    int _1976 = _1974 ? 0 : (-1);
    float _1978 = -_143;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1916);
    bool _1982 = _1344 != 3;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1986 = 1.0 + _1984;
    uint _1988 = uint(int(uint(_1968) >> uint(2)));
    uint _1990 = uint(int(uint(int(_1988)) >> uint(2)));
    int _1992 = int(_1988) & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    int _1996 = int(_1988) + 1;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    int _2000 = _1996 & 3;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[int(_1998)][_2000];
    int _2004 = _1962 << 4;
    int _2006 = _2004 + 512;
    float _2008 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1878);
    int _2010 = ~_1748;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2018 = _2014;
    if (!_1754)
    {
        int _2020 = ~_1748;
        int _2022 = _2020 + 1;
        _2018 = _2022;
    }
    int _2024 = _2018;
    float _2026 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1964);
    float _2028 = -_1956;
    float _2030 = _2028 + 1.0;
    uint _2032 = uint(int(uint(_2006) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    float _2048 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2016);
    bool _2050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2026);
    float _2062 = 1.0 / _1986;
    float _2064 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2048);
    float _2066 = _2058 ? _2030 : 0.0;
    float _2068 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1980);
    int _2070 = _1968 + 8;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    bool _2088 = _2060 >= 0.0;
    float _2090 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1960);
    bool _2092 = !_1982;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = _129 + (-0.5);
    bool _2098 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2100 = isnan(1.0);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_1918);
    int _2110 = _2006 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    float _2128 = float(_2024);
    int _2130 = ~_1512;
    int _2132 = _2130 + _1612;
    int _2134 = _2132 + 1;
    int _2136 = abs(_1310);
    float _2138 = _2108 * _2128;
    float _2140 = 0.0;
    int _2142 = as_type<int>(_2138);
    if (_2088)
    {
        _2140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2144 = _2140;
    float _2146 = in.m_66.x;
    float _2148 = in.m_66.y;
    float _2150 = in.m_66.z;
    int _2152 = abs(_1624);
    if (_2106)
    {
        float _2154 = _2066 * _2062;
        _145 = _2154;
    }
    float _2156 = _145;
    int _2158 = abs(_1408);
    float _2160 = _2138 * (-2.0);
    if (_2088)
    {
        float _2162 = _2144 * 5.0;
        _2142 = as_type<int>(_2162);
    }
    int _2164 = _2142;
    int _2166 = _673 * _2134;
    int _2168 = _2166 + _938;
    int _2170 = abs(_1954);
    float _2172 = _1500 + (-0.5);
    if (_2088)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6915 = as_type<float>(_2164);
        out.gl_Position.z = _6915;
    }
    int _2174 = ~_2136;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = _1926 * _1926;
    int _2182 = abs(_2094);
    float _2184 = -_2172;
    float _2186 = -_2090;
    float _2188 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2186);
    int _2190 = ~_1528;
    int _2192 = _2190 + _1706;
    int _2194 = _2192 + 1;
    int _2196 = _2178 * as_type<int>(_2002);
    bool _2198 = _673 == 0;
    if (_2088)
    {
        out.m_47.x = 0.0;
    }
    bool _2200 = _725 == 0;
    int _2202 = _725 * _2194;
    int _2204 = _2202 + _1026;
    bool _2206 = !_2198;
    int _2208 = _2206 ? _2168 : (-1);
    float _2210 = fma(_2160, _2146, _2146);
    float _2212 = fma(_1720, _2160, _1720);
    int _2214 = ~_2158;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    float _2220 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2210);
    int _2222 = ~_2152;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = fma(_1936, _1936, _2180);
    int _2230 = ~_2170;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    int _2236 = _2218 * as_type<int>(_2046);
    int _2238 = abs(_1976);
    int _2240 = _2226 * as_type<int>(_1994);
    int _2242 = _2240 + _2196;
    int _2244 = abs(_1336);
    int _2246 = _2234 * as_type<int>(_2038);
    int _2248 = _2246 + _2236;
    int _2250 = abs(_1428);
    float _2252 = fma(_1972, _1972, _2228);
    int _2254 = ~_2244;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    bool _2260 = !_1652;
    int _2262 = _2260 ? 0 : 1;
    int _2264 = ~_2250;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = _2258 * as_type<int>(_2078);
    int _2272 = _2270 + _2242;
    int _2274 = abs(_2262);
    float _2276 = rsqrt(_2252);
    int _2278 = _2268 * as_type<int>(_2118);
    int _2280 = _2278 + _2248;
    int _2282 = ~_2238;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    bool _2288 = !_1658;
    int _2290 = _2288 ? 0 : 1;
    int _2292 = ~_2182;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    int _2298 = _2286 * as_type<int>(_2086);
    int _2300 = _2298 + _2272;
    int _2302 = abs(_2290);
    int _2304 = ~_2274;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = _2296 * as_type<int>(_2126);
    int _2312 = _2310 + _2280;
    bool _2314 = !_2200;
    int _2316 = _2314 ? _2204 : (-1);
    int _2318 = _2300 * _2308;
    int _2320 = ~_2302;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = _1926 * _2276;
    float _2328 = _1936 * _2276;
    int _2330 = _2208 * _2274;
    int _2332 = _2330 + _2318;
    float _2334 = -_2064;
    float _2336 = _2334 + 1.0;
    int _2338 = _2312 * _2324;
    float _2340 = -_2326;
    float _2342 = fma(_2340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2344 = -_2008;
    float _2346 = _2344 + 1.0;
    float _2348 = -_2328;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1936);
    int _2352 = _2316 * _2302;
    int _2354 = _2352 + _2338;
    float _2356 = -_1938;
    float _2358 = _2356 + 1.0;
    float _2360 = _2342 * _2342;
    float _2362 = -_715;
    float _2364 = fma(_1450, _2362, _1910);
    float _2366 = fma(_1470, _2336, _1902);
    float _2368 = _1972 * _2276;
    float _2370 = -_2358;
    float _2372 = fma(_1490, _2370, _2068);
    float _2374 = fma(_1500, _2346, _2188);
    float _2376 = float(_2332);
    float _2378 = fma(_2350, _2350, _2360);
    float _2380 = float(_2354);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    bool _2386 = !_1636;
    int _2388 = _2386 ? 0 : 1;
    out.m_68.x = _2364;
    out.m_68.y = _2366;
    out.m_68.z = _2372;
    out.m_68.w = _2374;
    float _2390 = fma(_2384, _2384, _2378);
    int _2392 = abs(_2388);
    out.m_70.x = _2376;
    out.m_70.y = _2380;
    float _2394 = _2150;
    float _2396 = _2368;
    if (_2088)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2398 = -_2326;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1778);
    float _2402 = -_2328;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _2406 = -_2368;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _2410 = float(_1646);
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2414 = _2400 + _2412;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2404 + _2416;
    float _2420 = float(_2392);
    float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2424 = _2408 + _2422;
    float _2426 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2428 = _764 + (-0.5);
    float _2430 = fma(_2212, _2156, _2220);
    float _2432 = _2420 * _2410;
    float _2434 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2426);
    float _2436 = _1896 * (-2.0);
    float _2438 = _1148 + (-0.5);
    float _2440 = _2432 * (-2.0);
    float _2442 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2434);
    float _2444 = fma(_2436, _2148, _2148);
    float _2446 = fma(_1728, _2436, _1728);
    float _2448 = _2430 * 0.15915493667125701904296875;
    float _2450 = sqrt(_2390);
    bool _2452 = _2442 >= 0.0;
    float _2454 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2444);
    float _2456 = fma(_2440, _2150, _2150);
    float _2458 = fma(_1760, _2440, _1760);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2464 = fma(_2446, _2156, _2454);
    float _2466 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2456);
    float _2468 = in.m_64.x;
    float _2470 = in.m_64.y;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2476 = _2464 * 0.15915493667125701904296875;
    float _2478 = _2448 * 6.283185482025146484375;
    float _2480 = sin(_2478);
    float _2482 = fma(_2458, _2156, _2466);
    float _2484 = fma(_2474, _1724, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    if (_2452)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2486 = _2394;
    int _2488 = as_type<int>(_2486);
    if (_2452)
    {
        out.m_47.x = 0.0;
    }
    float _2490 = fma(_2484, _1830, _1950);
    float _2492 = fma(_2462, _1724, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2494 = _2448 * 6.283185482025146484375;
    float _2496 = cos(_2494);
    if (_2452)
    {
        float _2498 = _2486 * 5.0;
        _2488 = as_type<int>(_2498);
    }
    int _2500 = _2488;
    float _2502 = fma(_1884, _1866, _1876);
    float _2504 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2490);
    float _2506 = _2482 * 0.15915493667125701904296875;
    if (_2452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7426 = as_type<float>(_2500);
        out.gl_Position.z = _7426;
    }
    float _2508 = _2476 * 6.283185482025146484375;
    float _2510 = sin(_2508);
    float _2512 = _2476 * 6.283185482025146484375;
    float _2514 = cos(_2512);
    if (_2452)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2516 = _2504 * _2470;
    float _2518 = _2506 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    float _2522 = fma(_2492, _1830, _2502);
    float _2524 = _2276 * _2450;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _377);
    float _2530 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2522);
    float _2532 = _2496 * _2514;
    float _2534 = _2524 * _2526;
    float _2536 = _2506 * 6.283185482025146484375;
    float _2538 = sin(_2536);
    float _2540 = _2530 * _2468;
    float _2542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _359);
    float _2544 = _2528 * _2534;
    float _2546 = _2480 * _2510;
    float _2548 = _2540 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2550 = _2480 * _2514;
    float _2552 = _2496 * _2510;
    float _2554 = _2496 * _2520;
    float _2556 = _2548 * _2524;
    float _2558 = _2514 * _2520;
    float _2560 = _2480 * _2520;
    float _2562 = _2510 * _2520;
    float _2564 = _2556 * _2542;
    float _2566 = _2554 * _2544;
    float _2568 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2570 = _2568 * 0.5;
    float _2572 = fma(_2538, _2532, _2546);
    float _2574 = -_2550;
    float _2576 = fma(_2538, _2552, _2574);
    float _2578 = -_2544;
    float _2580 = _2538 * _2578;
    float _2582 = -_2552;
    float _2584 = fma(_2538, _2550, _2582);
    float _2586 = fma(_2572, _2564, _2566);
    float _2588 = _2560 * _2544;
    float _2590 = fma(_2558, _2564, _2580);
    float _2592 = fma(_2538, _2546, _2532);
    float _2594 = fma(_2576, _2570, _2586);
    float _2596 = fma(_2584, _2564, _2588);
    float _2598 = fma(_2562, _2570, _2590);
    float _2600 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2592, _2570, _2596);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    bool _2610 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2612 = isnan(0.5);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2618 = _2614 || _2616;
    float _2620 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2622 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2624 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2626 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2620);
    float _2628 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2622);
    float _2630 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2632 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2634 = _1800 + _2630;
    float _2636 = _1726 + _2632;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2640 = _2634 + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2644 = _2636 + _2642;
    float _2646 = _2640 * _2640;
    float _2648 = fma(_2644, _2644, _2646);
    float _2650 = _2628 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2652 = sqrt(_2648);
    float _2654 = _1778 + _2650;
    bool _2656 = _2652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2658 = _2564;
    float _2660 = _2636;
    float _2662 = _2634;
    float _2664 = _2556;
    if (!_2656)
    {
        _2658 = _2654;
    }
    float _2666 = _2658;
    bool _2668 = !_2656;
    float _2670 = _2666;
    if (!_2668)
    {
        float _2672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2676 = _2652 + _2674;
        float _2678 = rsqrt(_2648);
        float _2680 = _2676 * _2672;
        float _2682 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2684 = _2680 * 0.15915493667125701904296875;
        float _2686 = _2684 * 6.283185482025146484375;
        float _2688 = cos(_2686);
        float _2690 = _2684 * 6.283185482025146484375;
        float _2692 = sin(_2690);
        float _2694 = _2688 + (-1.0);
        float _2696 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2698 = fma(_2692, _2682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2700 = fma(_2654, _2688, _2696);
        float _2702 = _2678 * _2698;
        float _2704 = fma(_2644, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2706 = fma(_2640, _2702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2660 = _2704;
        _2670 = _2700;
        _2662 = _2706;
    }
    float _2708 = _2660;
    float _2710 = _2670;
    float _2712 = _2662;
    float _2714 = -_2328;
    float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2708);
    float _2718 = -_2326;
    float _2720 = fma(_2718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2710);
    float _2722 = -_2368;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2712);
    float _2726 = _2720;
    float _2728 = _2716;
    float _2730 = _2724;
    if (!_2618)
    {
        float _2732 = _2414 * _2414;
        float _2734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2736 = -_1800;
        float _2738 = _2736 + _2712;
        float _2740 = fma(_2418, _2418, _2732);
        float _2742 = fma(_2424, _2424, _2740);
        float _2744 = 1.0 / _2524;
        float _2746 = sqrt(_2742);
        float _2748 = precise::min(_2746, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2750 = _2748 * _2734;
        float _2752 = -_1726;
        float _2754 = _2752 + _2708;
        float _2756 = _2750 * _2744;
        float _2758 = -_1778;
        float _2760 = _2758 + _2710;
        float _2762 = fma(_2754, _2756, _2404);
        float _2764 = fma(_2760, _2756, _2400);
        float _2766 = fma(_2738, _2756, _2408);
        _2726 = _2764;
        _2728 = _2762;
        _2730 = _2766;
    }
    float _2768 = _2726;
    float _2770 = _2728;
    float _2772 = _2730;
    float _2774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2776 = _2768 + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2780 = _2770 + _2778;
    float _2782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2784 = _2772 + _2782;
    float _2786 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2788 = _2776 * _2776;
    float _2790 = fma(_2780, _2780, _2788);
    float _2792 = fma(_2784, _2784, _2790);
    float _2794 = rsqrt(_2792);
    float _2796 = sqrt(_2792);
    float _2798 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2800 = _2780 * _2798;
    float _2802 = _2784 * _2798;
    float _2804 = _2800 * _2800;
    float _2806 = _2802 * _2802;
    float _2808 = _2804 + _2806;
    float _2810 = sqrt(_2808);
    bool _2812 = _2810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2816 = _2810 + _2814;
    float _2818 = _2784;
    float _2820 = _2808;
    float _2822 = _2816;
    float _2824 = _2798;
    if (_2812)
    {
        float _2826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2818 = _2826;
    }
    float _2828 = _2818;
    if (_2812)
    {
        float _2830 = rsqrt(_2808);
        _2820 = _2830;
    }
    float _2832 = _2820;
    float _2834 = _2832;
    if (_2812)
    {
        float _2836 = _2816 * _2828;
        _2822 = _2836;
    }
    float _2838 = _2822;
    if (_2812)
    {
        float _2840 = _2838 * 0.15915493667125701904296875;
        _2396 = _2840;
    }
    float _2842 = _2396;
    float _2844 = _2828;
    float _2846 = _2842;
    if (_2812)
    {
        float _2848 = _2842 * 6.283185482025146484375;
        float _2850 = sin(_2848);
        _2844 = _2850;
    }
    float _2852 = _2844;
    float _2854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2856 = precise::max(0.0, _2854);
    float _2858 = _2788;
    float _2860 = _2856;
    if (_2812)
    {
        float _2862 = _2842 * 6.283185482025146484375;
        float _2864 = cos(_2862);
        _2858 = _2864;
    }
    float _2866 = _2858;
    float _2868 = -_2798;
    float _2870 = -_2856;
    float _2872 = fma(_2776, _2868, _2870);
    float _2874 = _2872;
    if (_2812)
    {
        float _2876 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2860 = _2876;
    }
    float _2878 = _2860;
    float _2880 = _2852;
    float _2882 = _2878;
    if (_2812)
    {
        float _2884 = fma(_2852, _2878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2880 = _2884;
    }
    float _2886 = _2880;
    float _2888 = _2886;
    float _2890 = _2866;
    if (_2812)
    {
        float _2892 = _2866 + (-1.0);
        _2882 = _2892;
    }
    float _2894 = _2882;
    float _2896 = _2894;
    if (_2812)
    {
        float _2898 = _2832 * _2886;
        _2824 = _2898;
    }
    float _2900 = _2824;
    if (!_2812)
    {
        _2888 = _2800;
    }
    float _2902 = _2888;
    float _2904 = _2902;
    if (_2812)
    {
        float _2906 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2906;
    }
    float _2908 = _2846;
    if (_2812)
    {
        float _2910 = _2800 * _2900;
        _2904 = _2910;
    }
    float _2912 = _2904;
    if (!_2812)
    {
        _2896 = _2802;
    }
    float _2914 = _2896;
    float _2916 = _2914;
    if (_2812)
    {
        float _2918 = _2802 * _2900;
        _2916 = _2918;
    }
    float _2920 = _2916;
    if (!_2812)
    {
        _2834 = _2804;
    }
    float _2922 = _2834;
    float _2924 = _2922;
    if (_2812)
    {
        float _2926 = fma(_2872, _2866, _2908);
        _2874 = _2926;
    }
    float _2928 = _2874;
    if (_2812)
    {
        float _2930 = _2912 * _2912;
        _2924 = _2930;
    }
    float _2932 = _2924;
    if (!_2812)
    {
        _2890 = _2806;
    }
    float _2934 = _2890;
    float _2936 = _2934;
    if (_2812)
    {
        float _2938 = _2920 * _2920;
        _2936 = _2938;
    }
    float _2940 = _2936;
    float _2942 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2944 = fma(_2928, _2928, _2932);
    float _2946 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2948 = _2944 + _2940;
    float _2950 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2942);
    float _2952 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2956 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2954);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = rsqrt(_2948);
    float _2962 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2950);
    float _2964 = _2768 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2966 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2952);
    float _2968 = -_2958;
    float _2970 = _2968 + 1.0;
    float _2972 = _2962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2974 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2964);
    float _2976 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2966);
    float _2978 = abs(_2970);
    float _2980 = log2(_2978);
    float _2982 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2984 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2974);
    float _2986 = _2976 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2988 = fma(_2770, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2946);
    float _2990 = -_2982;
    float _2992 = fma(_2990, _2786, 1.0);
    float _2994 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2996 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2998 = _2960 * _2912;
    float _3000 = _2960 * _2928;
    float _3002 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2988);
    float _3004 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2996);
    float _3006 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3008 = _2960 * _2920;
    float _3010 = _3002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3012 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3004);
    float _3014 = -_3006;
    float _3016 = fma(_3000, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3014);
    float _3018 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3020 = log2(_2992);
    float _3022 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3012);
    float _3024 = -_3008;
    float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3016);
    float _3028 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3030 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3032 = _3000 + 1.0;
    float _3034 = fma(_3026, -0.5, 0.5);
    float _3036 = fma(_3026, 0.5, 0.5);
    float _3038 = 1.0 / _3022;
    float _3040 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3028);
    float _3042 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3030);
    float _3044 = fma(_3036, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3046 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3040);
    float _3048 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3042);
    float _3050 = fma(_3036, _3044, -0.212114393711090087890625);
    float _3052 = exp2(_3018);
    float _3054 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3046);
    float _3056 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3048);
    float _3058 = _3020 * 0.693147182464599609375;
    float _3060 = fma(_3036, _3050, 1.570728778839111328125);
    float _3062 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3064 = sqrt(_3034);
    float _3066 = _3054 * _3038;
    float _3068 = _3056 * _3038;
    float _3070 = fma(_3066, 0.5, 0.5);
    float _3072 = fma(_3068, -0.5, 0.5);
    float _3074 = -_3000;
    float _3076 = fma(_3052, _3032, _3074);
    float3 _8361 = float3(_3070, _3072, _3062);
    float _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8361, float3(0.0), isnan(_8361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8361, float3(0.0), isnan(_8361)), level(0.0)).x;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = _3064 * 0.636619746685028076171875;
    float _3084 = -_3060;
    float _3086 = fma(_3082, _3084, 1.0);
    float3 _8382 = float3(_3070, _3072, _3062);
    float4 _3089 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8382, float3(0.0), isnan(_8382)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8382, float3(0.0), isnan(_8382)), level(0.0)).xyzw;
    float _3091 = _3089.x;
    float _3093 = _3089.y;
    float _3095 = _3089.z;
    float _3097 = _3089.w;
    float2 _8399 = float2(_3086, _3080);
    float3 _3101 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8399, float2(0.0), isnan(_8399)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8399, float2(0.0), isnan(_8399)), level(0.0)).xyz;
    float _3103 = _3101.x;
    float _3105 = _3101.y;
    float _3107 = _3101.z;
    float _3109 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3111 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3113 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3115 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3117 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3119 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3121 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3109);
    float _3123 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3111);
    float _3125 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3113);
    float _3127 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3115);
    float _3129 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3119);
    float _3131 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3133 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3135 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3137 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3121);
    float _3139 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3123);
    float _3141 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3143 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3145 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3147 = _377 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3149 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3141);
    float _3151 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3143);
    float _3153 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3145);
    float _3155 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3117);
    float _3157 = _3139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3159 = -_2538;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3131);
    float _3163 = -_2538;
    float _3165 = fma(_3163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3133);
    float _3167 = -_2538;
    float _3169 = fma(_3167, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3135);
    float _3171 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3173 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3149);
    float _3175 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3151);
    float _3177 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3153);
    float _3179 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3155);
    float _3181 = fma(_3147, _3147, 1.0);
    float _3183 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3185 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3187 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3189 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3191 = _3157 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3193 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3171);
    float _3195 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3161);
    float _3197 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3165);
    float _3199 = fma(_2560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3169);
    float _3201 = rsqrt(_3181);
    float _3203 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3185);
    float _3205 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3187);
    float _3207 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3189);
    float _3209 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3191);
    float _3211 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3213 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3215 = _3147 * _3197;
    float _3217 = -_617;
    float _3219 = _3217 + _2768;
    float _3221 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3125);
    float _3223 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3225 = _3147 * _3195;
    float _3227 = -_615;
    float _3229 = _3227 + _2770;
    float _3231 = -_619;
    float _3233 = _3231 + _2772;
    float _3235 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3129);
    float _3237 = fma(_3213, _3221, _3225);
    float _3239 = fma(_3213, _3223, _3215);
    float _3241 = _3147 * _3199;
    out.m_72.x = _3221;
    out.m_72.y = _3223;
    out.m_72.z = _3211;
    float _3243 = _3147 * _3201;
    float _3245 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3247 = fma(_3213, _3211, _3241);
    out.m_74.x = _2770;
    out.m_74.y = _2768;
    out.m_74.z = _2772;
    float _3249 = -_3173;
    float _3251 = _3243 * _3249;
    float _3253 = -_3175;
    float _3255 = _3243 * _3253;
    float _3257 = -_3177;
    float _3259 = _3243 * _3257;
    float _3261 = exp2(_3245);
    float _3263 = fma(_3201, _3195, _3251);
    float _3265 = fma(_3201, _3197, _3255);
    float _3267 = fma(_3201, _3199, _3259);
    float _3269 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3271 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3273 = _3179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3275 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3269);
    float _3277 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3271);
    float _3279 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_76.x = _3263;
    out.m_76.y = _3265;
    out.m_76.z = _3267;
    float _3281 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3275);
    float _3283 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3285 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3279);
    float _3287 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3277);
    float _3289 = _3281 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3291 = fma(_3229, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3283);
    float _3293 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3295 = _3235 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3297 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3285);
    float _3299 = fma(_3233, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3291);
    float _3301 = _3293 + _3209;
    float _3303 = 1.0 / _3289;
    float _3305 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3287);
    float _3307 = _3299 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3309 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3301);
    float _3311 = fma(_3273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3207);
    float _3313 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3315 = _3305 + _3022;
    float _3317 = _3054 + _3022;
    float _3319 = _3022 * 0.5;
    float _3321 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3311);
    float _3323 = -_3261;
    float _3325 = _3323 + 1.0;
    float _3327 = _3315 * 0.5;
    float _3329 = _3317 * 0.5;
    float _3331 = fma(_3056, -0.5, _3319);
    float _3333 = _3325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _3054;
    out.gl_Position.y = _3056;
    out.gl_Position.z = _3305;
    out.gl_Position.w = _3022;
    float _3335 = _3307 * _3303;
    float _3337 = _3313 * _3303;
    float _3339 = 1.0 / _3309;
    out.m_78.x = _3329;
    out.m_78.y = _3331;
    out.m_78.z = _3327;
    out.m_78.w = _3022;
    float _3341 = _3173 + _3237;
    float _3343 = _3175 + _3239;
    float _3345 = _3177 + _3247;
    out.m_80.y = 1.0;
    float _3347 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3349 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.m_82.x = _3341;
    out.m_82.y = _3343;
    out.m_82.z = _3345;
    float _3351 = _3347 + _3203;
    float _3353 = -_3333;
    float _3355 = _3353 + 1.0;
    float _3357 = _3349 + _3205;
    float _3359 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3351);
    float _3361 = _3321 * _3339;
    float _3363 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3357);
    float _3365 = _3359 * _3339;
    bool _3367 = _3361 > 0.0;
    bool _3369 = _3361 < 1.0;
    bool _3371 = _3369 && _3367;
    bool _3373 = _3066 > (-1.0);
    bool _3375 = _3373 && _3371;
    bool _3377 = _3068 > (-1.0);
    bool _3379 = _3377 && _3375;
    bool _3381 = _3066 < 1.0;
    bool _3383 = _3381 && _3379;
    bool _3385 = _3068 < 1.0;
    bool _3387 = _3385 && _3383;
    float _3389 = _3333 * _3078;
    float _3391 = _3363 * _3339;
    float _3393 = _3097 * _3389;
    float _3395 = _3097 * _3355;
    float _3397 = _3107 * _3389;
    float _3399 = fma(_3103, _3393, _3091);
    float _3401 = fma(_3105, _3393, _3093);
    float _3403 = fma(_3097, _3397, _3095);
    out.m_84.x = _3399;
    out.m_84.y = _3401;
    out.m_84.z = _3403;
    out.m_84.w = _3395;
    bool _3405 = !_3387;
    float _3407 = _3401;
    float _3409 = _3054;
    float _3411 = _3399;
    float _3413 = _3056;
    float _3415 = _3022;
    float _3441;
    float _3447;
    if (!_3405)
    {
        float _3417 = -_3391;
        float _3419 = _3068 + _3417;
        float _3421 = -_3365;
        float _3423 = _3066 + _3421;
        float _3425 = -_3337;
        float _3427 = _3066 + _3425;
        float _3429 = -_3335;
        float _3431 = _3068 + _3429;
        float _3433 = _3419 * _3419;
        float _3435 = fma(_3423, _3423, _3433);
        float _3437 = sqrt(_3435);
        bool _3439 = _3437 > 0.0;
        _3411 = _3435;
        _3441 = _3437;
        if (!_3439)
        {
            _3407 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3443 = _3407;
        bool _3445 = !_3439;
        _3447 = _3443;
        _3449 = _3445;
        if (!_3449)
        {
            float _3451 = _3431 * _3431;
            float _3453 = fma(_3427, _3427, _3451);
            float _3455 = rsqrt(_3435);
            float _3457 = sqrt(_3453);
            float _3459 = _3423 * _3455;
            float _3461 = _3419 * _3455;
            bool _3463 = _3457 > 0.0;
            float _3465 = _3457;
            _3441 = _3455;
            if (!_3463)
            {
                _3465 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3467 = _3465;
            bool _3469 = !_3463;
            _3447 = _3467;
            _3449 = _3469;
            if (!_3449)
            {
                float _3471 = _2556 * _3295;
                float _3473 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3475 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3293);
                float _3477 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3349);
                float _3479 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3347);
                float _3481 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3475);
                float _3483 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3477);
                float _3485 = fma(_3295, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3479);
                float _3487 = rsqrt(_3453);
                float _3489 = _3473 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3491 = 1.0 / _3481;
                float _3493 = _3431 * _3489;
                float _3495 = _3427 * _3489;
                float _3497 = _3493 * _3493;
                float _3499 = fma(_3495, _3495, _3497);
                float _3501 = _3483 * _3491;
                float _3503 = _3485 * _3491;
                float _3505 = sqrt(_3499);
                float _3507 = _3501 * _3501;
                float _3509 = fma(_3503, _3503, _3507);
                float _3511 = _3431 * _3487;
                float _3513 = _3427 * _3487;
                float _3515 = _3461 * _3511;
                float _3517 = sqrt(_3509);
                float _3519 = fma(_3459, _3513, _3515);
                float _3521 = precise::min(0.0, _3519);
                float _3523 = _3022 * _3521;
                float _3525 = fma(_3505, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3517);
                float _3527 = fma(_3495, _3523, _3054);
                float _3529 = fma(_3493, _3523, _3056);
                float _3531 = 1.0 / _3525;
                out.gl_Position.x = _3527;
                out.gl_Position.y = _3529;
                float _3533 = _3517 * _3531;
                out.m_80.y = _3533;
                _3409 = _3527;
                _3411 = _3493;
                _3413 = _3529;
                _3441 = _3523;
                _2664 = _3519;
                _3447 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3449 = true;
            }
        }
    }
    else
    {
        float _3535 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3535;
        _3409 = 0.0;
        _3413 = 0.0;
        _3441 = _3535;
        _2664 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3447 = 0.0;
    }
    _3449 = false;
    float _3537 = _3409;
    float _3539 = _3411;
    float _3541 = _3413;
    float _3543 = _3441;
    float _3545 = _2664;
    float _3547 = _3447;
    bool _3549 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3551 = isnan(_2796);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3557 = _3553 || _3555;
    float _3559 = _3539;
    float _3561 = _3543;
    float _3563 = _3541;
    float _3565 = _3537;
    float _3567 = _3545;
    if (!_3557)
    {
        _3559 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3569 = _3559;
    float _3571 = _3569;
    float _3573 = _3569;
    if (!_3557)
    {
        _3415 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3575 = _3415;
    float _3577 = _3575;
    float _3579 = _3575;
    if (!_3557)
    {
        _3561 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3581 = _3561;
    float _3583 = _3581;
    float _3585 = _3581;
    if (!_3557)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3587 = _3563;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3557)
    {
        _3565 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3593 = _3565;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3557)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3599 = _3567;
    bool _3601 = !_3557;
    float _3603 = _3599;
    float _3605 = _3599;
    if (!_3601)
    {
        bool _3607 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3609 = isnan(_2796);
        bool _3611 = _3607 || _3609;
        bool _3613 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3615 = _3611 || _3613;
        if (!_3615)
        {
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3619 = _2796 + _3617;
            float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3623 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3621;
            float _3625 = 1.0 / _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3629 = _3627 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3635 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3637 = _3635 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3647 = _3619 * _3625;
            float _3649 = precise::clamp(_3647, 0.0, 1.0);
            float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3655 = fma(_3649, _3629, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3657 = fma(_3649, _3653, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3659 = fma(_3649, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3661 = fma(_3649, _3637, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3663 = fma(_3649, _3641, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3665 = fma(_3649, _3645, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3579 = _3657;
            _3597 = _3663;
            _3573 = _3655;
            _3591 = _3661;
            _3585 = _3659;
            _3605 = _3665;
            _3667 = true;
        }
        else
        {
            bool _3669 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3671 = isnan(_2796);
            bool _3673 = _3669 || _3671;
            bool _3675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3677 = _3673 || _3675;
            if (!_3677)
            {
                _3571 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3679 = _3571;
            _3573 = _3679;
            if (!_3677)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3681 = _3577;
            _3579 = _3681;
            if (!_3677)
            {
                _3583 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3683 = _3583;
            _3585 = _3683;
            if (!_3677)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3685 = _3589;
            _3591 = _3685;
            if (!_3677)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3687 = _3595;
            _3597 = _3687;
            if (!_3677)
            {
                _3603 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3689 = _3603;
            bool _3691 = !_3677;
            _3605 = _3689;
            if (!_3691)
            {
                bool _3693 = _2796 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3695 = isnan(_2796);
                bool _3697 = _3693 || _3695;
                bool _3699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3701 = _3697 || _3699;
                if (!_3701)
                {
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3705 = _2796 + _3703;
                    float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3709 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3707;
                    float _3711 = 1.0 / _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3733 = _3705 * _3711;
                    float _3735 = precise::clamp(_3733, 0.0, 1.0);
                    float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3739 = _3737 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3741 = fma(_3735, _3715, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3743 = fma(_3735, _3739, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3745 = fma(_3735, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3747 = fma(_3735, _3723, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3749 = fma(_3735, _3727, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3751 = fma(_3735, _3731, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3579 = _3743;
                    _3597 = _3749;
                    _3573 = _3741;
                    _3591 = _3747;
                    _3585 = _3745;
                    _3605 = _3751;
                    _3667 = true;
                }
                else
                {
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3573 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3585 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3605 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3667 = false;
    float _3753 = _3579;
    float _3755 = _3597;
    float _3757 = _3573;
    float _3759 = _3591;
    float _3761 = _3585;
    float _3763 = _3605;
    float _3765 = fma(_3343, -0.5, 0.5);
    float _3767 = precise::clamp(_3765, 0.0, 1.0);
    float _3769 = -_3753;
    float _3771 = _3769 + _3755;
    float _3773 = -_3757;
    float _3775 = _3773 + _3759;
    float _3777 = -_3761;
    float _3779 = _3777 + _3763;
    bool _3781 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3783 = fma(_3767, _3771, _3753);
    float _3785 = fma(_3767, _3775, _3757);
    float _3787 = fma(_3767, _3779, _3761);
    float _3789 = _3547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3791 = _3783 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3793 = fma(_3785, 0.298911988735198974609375, _3791);
    out.m_80.w = _3789;
    float _3795 = fma(_3787, 0.114477999508380889892578125, _3793);
    float _3797 = -_3795;
    float _3799 = _3785 + _3797;
    float _3801 = -_3795;
    float _3803 = _3783 + _3801;
    float _3805 = -_3795;
    float _3807 = _3787 + _3805;
    out.m_86.x = 0.0;
    float _3809 = fma(_3799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    float _3811 = fma(_3803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    float _3813 = fma(_3807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3795);
    out.m_88.x = _3809;
    out.m_88.y = _3811;
    out.m_88.z = _3813;
    if (!_3781)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3815 = -_2768;
    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3819 = -_2770;
    float _3821 = _3819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3823 = -_2772;
    float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3827 = _3817 * _3817;
    float _3829 = fma(_3821, _3821, _3827);
    float _3831 = fma(_3825, _3825, _3829);
    float _3833 = sqrt(_3831);
    float _3835 = rsqrt(_3831);
    float _3837 = -_3833;
    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3841 = _3839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3843 = precise::clamp(_3841, 0.0, 1.0);
    float _3845 = _3821 * _3835;
    float _3847 = _3817 * _3835;
    float _3849 = abs(_3843);
    float _3851 = log2(_3849);
    float _3853 = _3825 * _3835;
    float _3855 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3857 = _3343 * _3847;
    float _3859 = -_3847;
    float _3861 = -_3855;
    float _3863 = fma(_3859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3861);
    float _3865 = fma(_3341, _3845, _3857);
    float _3867 = -_3853;
    float _3869 = fma(_3867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3863);
    float _3871 = fma(_3345, _3853, _3865);
    float _3873 = precise::clamp(_3871, 0.0, 1.0);
    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3877 = _3869 + _3875;
    float _3879 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3881 = _3877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = exp2(_3879);
    float _3887 = _3885 * _3883;
    float _3889 = _3873 * _3887;
    float _3891 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3893 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3895 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3891;
    out.m_86.y = _3893;
    out.m_86.z = _3895;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

