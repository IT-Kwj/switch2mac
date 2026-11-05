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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_78 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 m_74 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3547 = false;
    bool _687 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_133);
        out.gl_Position.z = _3843;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _135 = as_type<int>(_163);
    }
    int _165 = _135;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3906 = as_type<float>(_165);
        out.gl_Position.z = _3906;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = in.m_59.x;
    float _175 = in.m_59.y;
    float _177 = in.m_59.z;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_66.w;
    float _189 = in.m_44.x;
    float _191 = in.m_44.y;
    float _193 = in.m_44.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_175, _175, _197);
    float _203 = fma(_179, _179, _199);
    float _205 = _171 * _171;
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_177, _177, _205);
    float _213 = fma(_183, _183, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = _209;
    float _225 = _173;
    if (_219)
    {
        float _227 = rsqrt(_203);
        _223 = _227;
    }
    float _229 = _223;
    float _231 = 0.0;
    float _233 = 0.0;
    if (!_219)
    {
        _231 = 0.0;
        _233 = 0.0;
    }
    float _235 = _231;
    float _237 = _233;
    bool _239 = _217 > 0.0;
    float _241 = 0.0;
    float _243 = _235;
    float _245 = _237;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _247 = _241;
    int _249 = as_type<int>(_185) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_185) & 2;
    bool _255 = _253 != 0;
    float _257 = in.m_46.x;
    float _259 = in.m_46.y;
    float _261 = in.m_46.z;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = 0.0;
    float _275 = _247;
    if (_221)
    {
        float _277 = rsqrt(_207);
        _273 = _277;
    }
    float _279 = _273;
    float _281 = 0.0;
    if (!_221)
    {
        _281 = 0.0;
    }
    float _283 = _281;
    int _285 = int(_251);
    int _287 = _255 ? 2 : 0;
    int _289 = _285 | _287;
    int _291 = _219 ? 4 : 0;
    int _293 = _289 | _291;
    int _295 = _221 ? 8 : 0;
    int _297 = _293 | _295;
    int _299 = _239 ? 16 : 0;
    int _301 = _297 | _299;
    int _303 = _271 ? 32 : 0;
    int _305 = _301 | _303;
    int _307 = false ? 64 : 0;
    int _309 = _305 | _307;
    int _311 = _309 & 32;
    float _313 = 0.0;
    float _315 = as_type<float>(_311);
    float _317 = _283;
    if (!_221)
    {
        _313 = 0.0;
    }
    float _319 = _313;
    float _321 = _229;
    float _323 = _319;
    if (_219)
    {
        float _325 = _229 * _173;
        _275 = _325;
    }
    float _327 = _275;
    if (_219)
    {
        float _329 = _229 * _167;
        _243 = _329;
    }
    float _331 = _243;
    float _333 = _213;
    if (_239)
    {
        float _335 = rsqrt(_213);
        _333 = _335;
    }
    float _337 = _333;
    float _339 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _341 = _339;
    if (_219)
    {
        float _343 = _229 * _179;
        _245 = _343;
    }
    float _345 = _245;
    float _347 = 0.0;
    if (!_221)
    {
        _347 = 0.0;
    }
    float _349 = _347;
    float _351 = _349;
    if (!_271)
    {
        float _353 = _339 * _339;
        float _355 = _353 * 0.5;
        _315 = _355;
    }
    float _357 = _315;
    float _359 = 0.0;
    float _361 = _357;
    if (!_239)
    {
        _359 = 0.0;
    }
    float _363 = _359;
    float _365 = 0.0;
    float _367 = _363;
    if (!_239)
    {
        _365 = 0.0;
    }
    float _369 = _365;
    float _371 = _369;
    if (_221)
    {
        float _373 = _279 * _175;
        _317 = _373;
    }
    float _375 = _317;
    if (!_239)
    {
        _321 = 0.0;
    }
    float _377 = _321;
    float _379 = _377;
    if (_221)
    {
        float _381 = _279 * _169;
        _323 = _381;
    }
    float _383 = _323;
    if (_221)
    {
        float _385 = _279 * _181;
        _351 = _385;
    }
    float _387 = _351;
    bool _389 = !_251;
    float _391 = _389 ? (-0.5) : 0.5;
    if (!_271)
    {
        float _393 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _393;
    }
    float _395 = _361;
    bool _397 = !_255;
    float _399 = _397 ? (-0.5) : 0.5;
    float _401 = _395;
    if (_239)
    {
        float _403 = _337 * _177;
        _367 = _403;
    }
    float _405 = _367;
    if (_239)
    {
        float _407 = _337 * _171;
        _371 = _407;
    }
    float _409 = _371;
    if (_239)
    {
        float _411 = _337 * _183;
        _379 = _411;
    }
    float _413 = _379;
    bool _415 = !_271;
    float _417 = _261;
    float _419 = _259;
    float _421 = _257;
    float _423 = _261;
    if (!_415)
    {
        float _425 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _427 = log2(_425);
        float _429 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _431 = _429 + 1.0;
        float _433 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _435 = _339 * _427;
        float _437 = exp2(_435);
        float _439 = _433 * 0.693147182464599609375;
        float _441 = 1.0 / _439;
        float _443 = 1.0 / _431;
        float _445 = _437 + (-1.0);
        float _447 = -_445;
        float _449 = fma(_447, _441, _339);
        float _451 = _449 * _443;
        float _453 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _401 = _453;
    }
    float _455 = _401;
    float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _459 = !_271;
    float _461 = _455;
    if (!_459)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = 1.0 / _469;
        float _473 = _339 * _465;
        float _475 = exp2(_473);
        float _477 = -_475;
        float _479 = _477 + 1.0;
        float _481 = _479 * _471;
        _341 = _481;
    }
    float _483 = _341;
    float _485 = _457 * _331;
    float _487 = _457 * _383;
    float _489 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _491 = _457 * _409;
    float _493 = 0.0;
    if (!_271)
    {
        float _495 = _117 * _117;
        float _497 = _495 * 0.5;
        _493 = _497;
    }
    float _499 = _493;
    float _501 = fma(_489, _327, _485);
    float _503 = fma(_489, _375, _487);
    float _505 = fma(_489, _405, _491);
    float _507 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_271)
    {
        float _509 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _509;
    }
    float _511 = _461;
    bool _513 = !_271;
    float _515 = _511;
    if (!_513)
    {
        float _517 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _519 = log2(_517);
        float _521 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _523 = _521 + 1.0;
        float _525 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _527 = _117 * _519;
        float _529 = 1.0 / _523;
        float _531 = _525 * 0.693147182464599609375;
        float _533 = exp2(_527);
        float _535 = 1.0 / _531;
        float _537 = _533 + (-1.0);
        float _539 = -_537;
        float _541 = fma(_539, _535, _117);
        float _543 = _541 * _529;
        float _545 = _543 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _515 = _545;
    }
    float _547 = _515;
    float _549 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _551 = fma(_507, _345, _501);
    float _553 = fma(_507, _387, _503);
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _557 = _549 * _331;
    float _559 = _549 * _383;
    float _561 = _549 * _409;
    float _563 = fma(_507, _413, _505);
    float _565 = fma(_555, _327, _557);
    float _567 = fma(_555, _375, _559);
    float _569 = fma(_555, _405, _561);
    float _571 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _573 = fma(_483, _261, _563);
    float _575 = fma(_483, _257, _551);
    float _577 = fma(_483, _259, _553);
    float _579 = fma(_571, _345, _565);
    float _581 = fma(_571, _387, _567);
    float _583 = fma(_571, _413, _569);
    float _585 = _547;
    if (!_271)
    {
        _585 = _117;
    }
    float _587 = _585;
    bool _589 = !_271;
    float _591 = _587;
    if (!_589)
    {
        float _593 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _595 = log2(_593);
        float _597 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _599 = _597 + 1.0;
        float _601 = 1.0 / _599;
        float _603 = _117 * _595;
        float _605 = exp2(_603);
        float _607 = -_605;
        float _609 = _607 + 1.0;
        float _611 = _609 * _601;
        _591 = _611;
    }
    float _613 = _591;
    float _615 = fma(_613, _259, _581);
    float _617 = 1.0 / _149;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_613, _257, _579);
    float _623 = -_615;
    float _625 = _577 + _623;
    float _627 = fma(_613, _261, _583);
    float _629 = fma(_577, _187, _191);
    float _631 = fma(_575, _187, _189);
    float _633 = -_621;
    float _635 = _575 + _633;
    float _637 = _625 * _175;
    float _639 = _625 * _169;
    float _641 = _625 * _181;
    float _643 = -_627;
    float _645 = _573 + _643;
    float _647 = fma(_635, _173, _637);
    float _649 = fma(_635, _167, _639);
    float _651 = fma(_635, _179, _641);
    float _653 = fma(_573, _187, _193);
    float _655 = fma(_645, _177, _647);
    float _657 = fma(_645, _171, _649);
    float _659 = fma(_645, _183, _651);
    float _661 = _117 * _617;
    bool _663 = !_619;
    float _665 = _657;
    float _667 = _655;
    float _669 = _659;
    float _685;
    if (!_663)
    {
        float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _673 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _677 = _675 * _671;
        float _679 = floor(_677);
        float _681 = -_679;
        float _683 = _677 + _681;
        _685 = _683;
        _687 = true;
    }
    else
    {
        _685 = _661;
    }
    _687 = false;
    float _689 = _685;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    float _695 = _147 * 2.0;
    float _697 = _151 * 2.0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _709 = _707 != 0;
    float _711 = in.m_53.w;
    bool _713 = _147 > 0.5;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    int _719 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _721 = _719 != 0;
    float _723 = _629 * _175;
    float _725 = -_391;
    int _727 = _713 ? as_type<int>(_725) : as_type<int>(_391);
    float _729 = fma(_631, _173, _723);
    bool _731 = !_721;
    float _733 = _731 ? _391 : as_type<float>(_727);
    float _735 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _737 = int(_735);
    float _739 = float(_693);
    bool _741 = _151 > 0.5;
    float _743 = _733 + 0.5;
    bool _745 = !_705;
    int _747 = _745 ? 0 : 1;
    bool _749 = !_701;
    int _751 = _749 ? 0 : 1;
    float _753 = 1.0 / _739;
    float _755 = float(_717);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _767 = _765 != 0;
    float _769 = 1.0 / _755;
    float _771 = float(uint(_737));
    bool _773 = _159 > 0.5;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _777 = _775 != 0;
    float _779 = -_399;
    int _781 = _741 ? as_type<int>(_779) : as_type<int>(_399);
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _785 = int(_783);
    float _787 = _117 * _753;
    bool _789 = !_759;
    int _791 = _789 ? 0 : 1;
    bool _793 = !_763;
    int _795 = _793 ? 0 : 1;
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = 1.0 / _771;
    float _803 = _117 * _769;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _819 = _817 != 0;
    float _821 = -_391;
    int _823 = _773 ? as_type<int>(_821) : as_type<int>(_391);
    bool _825 = !_777;
    float _827 = _825 ? _399 : as_type<float>(_781);
    float _829 = trunc(_787);
    int _831 = int(_829);
    float _833 = float(uint(_785));
    bool _835 = !_811;
    int _837 = _835 ? 0 : 1;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _841 = _839 != 0;
    int _843 = ~_737;
    int _845 = _843 + 1;
    float _847 = floor(_695);
    bool _849 = !_841;
    float _851 = _849 ? _391 : as_type<float>(_823);
    bool _853 = !_709;
    int _855 = _853 ? 0 : 1;
    int _857 = ~_737;
    int _859 = _857 + 1;
    float _861 = 1.0 / _833;
    float _863 = float(uint(_831));
    float _865 = trunc(_803);
    int _867 = int(_865);
    int _869 = as_type<int>(_801) + (-2);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _873 = _847 > 0.0;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _877 = _847 >= 0.0;
    bool _879 = isnan(_847);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    float _887 = as_type<float>(_869) * _863;
    float _889 = floor(_697);
    int _891 = as_type<int>(_861) + (-2);
    int _893 = _885 ? 0 : 1;
    int _895 = ~_893;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    float _901 = trunc(_887);
    float _903 = precise::max(_901, 0.0);
    uint _906 = uint(_903);
    float _908 = float(uint(_867));
    int _910 = _899;
    float _912 = as_type<float>(_859);
    float _914 = as_type<float>(_785);
    if (!_873)
    {
        int _916 = ~_893;
        int _918 = _916 + 1;
        _910 = _918;
    }
    int _920 = _910;
    float _922 = as_type<float>(_891) * _908;
    int _924 = ~_785;
    int _926 = _924 + 1;
    bool _928 = _889 > 0.0;
    float _930 = _159 * 2.0;
    bool _932 = _889 >= 0.0;
    bool _934 = isnan(_889);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    int _942 = _940 ? 0 : 1;
    float _944 = floor(_930);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _948 = _946 != 0;
    bool _950 = _711 > 0.5;
    float _952 = trunc(_922);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    int _958 = _845 * int(_906);
    int _960 = _958 + _831;
    int _962 = ~_942;
    int _964 = _962 + 1;
    int _966 = _964 + 1;
    int _968 = _966;
    int _970 = _942;
    if (!_928)
    {
        int _972 = ~_942;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    float _978 = float(uint(_960));
    float _980 = 0.0;
    if (_948)
    {
        _980 = 1.0;
    }
    float _982 = _980;
    float _984 = -_399;
    int _986 = _950 ? as_type<int>(_984) : as_type<int>(_399);
    float _988 = as_type<float>(_869) * _978;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1000 = _998 != 0;
    float _1002 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1004 = log2(_1002);
    float _1006 = 0.0;
    float _1008 = _982;
    if (_948)
    {
        _1006 = 1.0;
    }
    float _1010 = _1006;
    int _1012 = _926 * int(_956);
    int _1014 = _1012 + _867;
    bool _1016 = !_996;
    int _1018 = _1016 ? 0 : 1;
    float _1020 = _1010;
    if (_948)
    {
        _970 = 0;
    }
    int _1022 = _970;
    float _1024 = float(uint(_1014));
    float _1026 = trunc(_988);
    float _1028 = precise::max(_1026, 0.0);
    uint _1030 = uint(_1028);
    float _1032 = 0.0;
    int _1034 = _1022;
    if (_948)
    {
        _1032 = _147;
    }
    float _1036 = _1032;
    bool _1038 = _944 >= 0.0;
    bool _1040 = isnan(_944);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    float _1048 = as_type<float>(_891) * _1024;
    float _1050 = _1036;
    if (!_948)
    {
        _1008 = 7.345489978790283203125;
    }
    float _1052 = _1008;
    if (!_948)
    {
        _1020 = 1.2345600128173828125;
    }
    float _1054 = _1020;
    float _1056 = trunc(_1048);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    if (!_948)
    {
        _1034 = 1;
    }
    int _1062 = _1034;
    if (!_948)
    {
        _1050 = _151;
    }
    float _1064 = _1050;
    bool _1066 = _944 > 0.0;
    int _1068 = _1046 ? 0 : 1;
    float _1070 = _1054 * _1064;
    bool _1072 = _1062 != 1;
    float _1074 = _117 * _1004;
    int _1076 = int(_906) + int(_1030);
    int _1078 = ~_1068;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = exp2(_1074);
    int _1086 = int(_956) + int(_1060);
    int _1088 = _1082;
    if (!_1066)
    {
        int _1090 = ~_1068;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    int _1096 = _859 * _1076;
    int _1098 = _1096 + _831;
    int _1100 = ~_785;
    int _1102 = _1100 + 1;
    float _1104 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1106 = !_992;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1110;
    bool _1114 = uint(_1098) >= uint(_737);
    float _1116 = fma(_1104, -2.0, _875);
    bool _1118 = !_1000;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _1102 * _1086;
    int _1124 = _1122 + _867;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1128 = _1126 != 0;
    float _1130 = -_1084;
    float _1132 = _1130 + 1.0;
    bool _1134 = !_1114;
    int _1136 = _1134 ? 0 : (-1);
    float _1138 = 1.0 / _1112;
    bool _1140 = uint(_1124) >= uint(_785);
    float _1142 = _629 * _169;
    bool _1144 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1146 = isnan(0.0);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1152 = _1148 || _1150;
    bool _1154 = !_1140;
    int _1156 = _1154 ? 0 : (-1);
    float _1158 = fma(_631, _167, _1142);
    float _1160 = _1152 ? _1132 : 0.0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1164 = _1162 != 0;
    float _1166 = fma(_653, _171, _1158);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1170 = _1168 != 0;
    float _1172 = _629 * _181;
    float _1174 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1176 = _151 + _159;
    bool _1178 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1180 = isnan(_689);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_631, _179, _1172);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1196 = -_871;
    float _1198 = fma(_1174, 2.0, _1196);
    float _1200 = fma(_653, _177, _729);
    float _1202 = fma(_653, _183, _1190);
    float _1204 = _147 + _151;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1206;
    float _1210 = 1.0 / _1194;
    float _1212 = _147 + _159;
    float _1214 = 0.0;
    float _1216 = as_type<float>(_1098);
    if (!_1072)
    {
        _1214 = _151;
    }
    float _1218 = _1214;
    float _1220 = _1218;
    if (!_1072)
    {
        _1216 = _151;
    }
    float _1222 = _1216;
    float _1224 = _1212 + (-1.0);
    float _1226 = _1176 + (-1.0);
    float _1228 = _1222;
    if (_1072)
    {
        _1220 = _147;
    }
    float _1230 = _1220;
    float _1232 = 1.0 / _1208;
    float _1234 = _1204 + (-1.0);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1238 = _689 + _1236;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1242 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1244 = _1238 * _1138;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1248 = _689 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1252 = _689 + _1250;
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1256 = _1248 * _1210;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1268 = 1.0 + _1266;
    float _1270 = _1252 * _1232;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1280 = fma(_1260, _1244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1282 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1284 = isnan(_689);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = fma(_1274, _1244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1296 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1298 = isnan(_689);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1264, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1310 = fma(_1278, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1312 = _1052 * _147;
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = -_1188;
    float _1320 = _1318 + 1.0;
    float _1322 = floor(_1312);
    float _1324 = 0.0;
    if (!_1072)
    {
        _1324 = _159;
    }
    float _1326 = _1324;
    float _1328 = _1188 * _1316;
    bool _1330 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1332 = isnan(_689);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -_1292;
    float _1344 = _1342 + 1.0;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1350;
    float _1354 = -_117;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1198);
    float _1358 = 1.0 / _1268;
    float _1360 = _1340 * _1344;
    float _1362 = fma(_1348, _1270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1364 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1116);
    float _1366 = -_1340;
    float _1368 = _1366 + 1.0;
    float _1370 = _1280 * _1360;
    float _1372 = _1294 * _1360;
    float _1374 = _1292 * _1320;
    float _1376 = floor(_1070);
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1370);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1372);
    float _1382 = -_1322;
    float _1384 = _1312 + _1382;
    float _1386 = fma(_1308, _1374, _1378);
    float _1388 = fma(_1310, _1374, _1380);
    float _1390 = float(_737);
    float _1392 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1356);
    float _1394 = float(_831);
    float _1396 = fma(_1352, _1270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1398 = float(_785);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1402 = float(_867);
    float _1404 = _1384 * _1390;
    float _1406 = -_1376;
    float _1408 = _1070 + _1406;
    bool _1410 = _1394 >= _1390;
    bool _1412 = isnan(_1394);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan(_1390);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = _661 * _1398;
    float _1424 = _1326;
    if (_1072)
    {
        _1228 = _147;
    }
    float _1426 = _1228;
    float _1428 = _661 * _1390;
    bool _1430 = _1402 >= _1398;
    bool _1432 = isnan(_1402);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1398);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    float _1442 = _1408 * _1398;
    if (!_1072)
    {
        _912 = _159;
    }
    float _1444 = _912;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1448 = _1444;
    if (_1072)
    {
        _1424 = _151;
    }
    float _1450 = _1424;
    float _1452 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1400);
    if (_1072)
    {
        _1448 = _151;
    }
    float _1454 = _1448;
    float _1456 = fma(_1362, _1328, _1386);
    float _1458 = fma(_1396, _1328, _1388);
    float _1460 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1462 = abs(_1108);
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1446);
    int _1466 = abs(_1120);
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1470 = float(_920);
    float _1472 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1476 = abs(_1018);
    float _1478 = trunc(_1420);
    int _1480 = int(_1478);
    float _1482 = float(_1466);
    float _1484 = fma(_1472, -2.0, _1468);
    float _1486 = -_1474;
    float _1488 = fma(_1460, 2.0, _1486);
    float _1490 = float(_1476);
    float _1492 = _1160 * _1358;
    float _1494 = float(_1094);
    float _1496 = -_117;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1488);
    float _1500 = float(_976);
    float _1502 = _1490 * _1470;
    float _1504 = float(_1462);
    float _1506 = trunc(_1404);
    int _1508 = int(_1506);
    bool _1510 = !_1170;
    float _1512 = _1510 ? _399 : as_type<float>(_986);
    float _1514 = _1482 * _1500;
    int _1516 = abs(_791);
    float _1518 = _1504 * _1494;
    int _1520 = ~_1076;
    int _1522 = _1520 + _1136;
    int _1524 = _1522 + 1;
    float _1526 = _851 + 0.5;
    float _1528 = in.m_68.x;
    float _1530 = in.m_68.y;
    float _1532 = in.m_68.z;
    bool _1534 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(1.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1458);
    int _1546 = _737 * _1524;
    int _1548 = _1546 + _831;
    float _1550 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1456);
    bool _1552 = !_1542;
    float _1554 = _1552 ? _117 : _1492;
    float _1556 = _1512 + (-0.5);
    bool _1558 = _737 == 0;
    int _1560 = _1508 * _1516;
    int _1562 = _1560 + _831;
    int _1564 = ~_1480;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1484);
    bool _1572 = !_1558;
    int _1574 = _1572 ? _1548 : (-1);
    float _1576 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1498);
    float _1578 = -_1556;
    float _1580 = -_1570;
    float _1582 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1580);
    int _1584 = _737 + (-1);
    int _1586 = _1574 * _1568;
    float _1588 = _1518 * (-2.0);
    float _1590 = trunc(_1442);
    int _1592 = int(_1590);
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1596 = _1480 * _1584;
    int _1598 = _1596 + _1586;
    float _1600 = fma(_1242, _1588, _1242);
    int _1602 = abs(_747);
    float _1604 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1594);
    float _1606 = _1502 * (-2.0);
    int _1608 = abs(_799);
    float _1610 = trunc(_1428);
    int _1612 = int(_1610);
    float _1614 = fma(_1588, _1528, _1528);
    float _1616 = _147 + (-0.5);
    float _1618 = fma(_1254, _1606, _1254);
    float _1620 = fma(_1606, _1530, _1530);
    float _1622 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1614);
    float _1624 = float(uint(_1562));
    float _1626 = in.m_66.x;
    float _1628 = in.m_66.y;
    int _1630 = _1592 * _1608;
    int _1632 = _1630 + _867;
    int _1634 = abs(_855);
    int _1636 = _1598 * _1602;
    int _1638 = abs(_751);
    float _1640 = as_type<float>(_869) * _1624;
    float _1642 = float(uint(_1632));
    float _1644 = fma(_1554, _1600, _1622);
    int _1646 = _1612 * _1638;
    int _1648 = _1646 + _1636;
    int _1650 = abs(_795);
    float _1652 = as_type<float>(_891) * _1642;
    float _1654 = _1514 * (-2.0);
    int _1656 = _1562 * _1634;
    int _1658 = _1656 + _1648;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1662 = trunc(_1640);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    float _1668 = _1644 * 0.15915493667125701904296875;
    int _1670 = _1508 * _1650;
    int _1672 = _1670 + _1658;
    float _1674 = fma(_1654, _1532, _1532);
    float _1676 = _159 + (-0.5);
    int _1678 = ~_785;
    int _1680 = _1678 + 1;
    float _1682 = _827 + (-0.5);
    float _1684 = in.m_57.w;
    float _1686 = trunc(_1440);
    int _1688 = int(_1686);
    float _1690 = fma(_1240, _1654, _1240);
    float _1692 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1660);
    float _1694 = _151 + (-0.5);
    float _1696 = float(uint(_1672));
    float _1698 = _1544 * _1628;
    float _1700 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1674);
    float _1702 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1620);
    int _1704 = ~_1086;
    int _1706 = _1704 + _1156;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_869) * _1696;
    float _1712 = _1550 * _1626;
    float _1714 = fma(_1554, _1618, _1702);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    float _1724 = _1712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1726 = fma(_1554, _1690, _1700);
    int _1728 = _785 * _1708;
    int _1730 = _1728 + _867;
    float _1732 = _1714 * 0.15915493667125701904296875;
    float _1734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _399);
    bool _1736 = !_807;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = _1698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1742 = _1724 * _1716;
    bool _1744 = _785 == 0;
    float _1746 = trunc(_1422);
    int _1748 = int(_1746);
    int _1750 = ~_737;
    int _1752 = _1750 + 1;
    float _1754 = _1740 * _1734;
    bool _1756 = !_1744;
    int _1758 = _1756 ? _1730 : (-1);
    float _1760 = -_1682;
    float _1762 = -_1364;
    float _1764 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1762);
    float _1766 = _391 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1768 = abs(_837);
    float _1770 = trunc(_1652);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    int _1776 = ~_1688;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1752 * int(_1722);
    int _1784 = _1782 + _1672;
    int _1786 = _785 + (-1);
    float _1788 = _1726 * 0.15915493667125701904296875;
    int _1790 = abs(_1738);
    int _1792 = _1758 * _1780;
    float _1794 = float(uint(_1784));
    float _1796 = _1732 * 6.283185482025146484375;
    float _1798 = sin(_1796);
    int _1800 = ~_785;
    int _1802 = _1800 + 1;
    int _1804 = _1688 * _1786;
    int _1806 = _1804 + _1792;
    int _1808 = ~_737;
    int _1810 = _1808 + 1;
    float _1812 = as_type<float>(_869) * _1794;
    bool _1814 = !_815;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1806 * _1768;
    bool _1820 = !_819;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = _1732 * 6.283185482025146484375;
    float _1826 = cos(_1824);
    int _1828 = abs(_1816);
    int _1830 = ~_785;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1812);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    int _1840 = ~_737;
    int _1842 = _1840 + 1;
    int _1844 = _1842 * int(_1666);
    int _1846 = _1844 + _1562;
    float _1848 = _1668 * 6.283185482025146484375;
    float _1850 = sin(_1848);
    int _1852 = abs(_1822);
    int _1854 = _1802 * int(_1774);
    int _1856 = _1854 + _1632;
    float _1858 = float(uint(_1846));
    int _1860 = _1748 * _1790;
    int _1862 = _1860 + _1818;
    float _1864 = float(uint(_1856));
    float _1866 = _1668 * 6.283185482025146484375;
    float _1868 = cos(_1866);
    float _1870 = as_type<float>(_869) * _1858;
    int _1872 = _1632 * _1828;
    int _1874 = _1872 + _1862;
    int _1876 = _1592 * _1852;
    int _1878 = _1876 + _1874;
    int _1880 = int(_1722) + int(_1838);
    float _1882 = _1788 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = _1850 * _1798;
    int _1888 = _1810 * _1880;
    int _1890 = _1888 + _1672;
    float _1892 = _1788 * 6.283185482025146484375;
    float _1894 = sin(_1892);
    bool _1896 = uint(_1890) >= uint(_737);
    float _1898 = _1868 * _1826;
    float _1900 = trunc(_1870);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    float _1906 = as_type<float>(_891) * _1864;
    float _1908 = _1798 * _1884;
    float _1910 = _1850 * _1826;
    float _1912 = _1850 * _1884;
    float _1914 = _1826 * _1884;
    float _1916 = _1868 * _1884;
    float _1918 = trunc(_1906);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    float _1924 = _1868 * _1798;
    float _1926 = float(uint(_1878));
    float _1928 = fma(_1894, _1898, _1886);
    float _1930 = fma(_1894, _1886, _1898);
    float _1932 = -_1924;
    float _1934 = fma(_1894, _1910, _1932);
    float _1936 = -_1910;
    float _1938 = fma(_1894, _1924, _1936);
    float _1940 = as_type<float>(_891) * _1926;
    int _1942 = int(_1666) + int(_1904);
    float _1944 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1946 = !_1896;
    int _1948 = _1946 ? 0 : (-1);
    float _1950 = trunc(_1940);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    float _1956 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1958 = -_1894;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1944);
    int _1962 = ~_1880;
    int _1964 = _1962 + _1948;
    int _1966 = _1964 + 1;
    float _1968 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1970 = int(_1774) + int(_1922);
    float _1972 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1974 = ~_785;
    int _1976 = _1974 + 1;
    int _1978 = _737 * _1966;
    int _1980 = _1978 + _1672;
    float _1982 = -_1894;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1956);
    float _1986 = -_1894;
    float _1988 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1972);
    float _1990 = -_1754;
    float _1992 = _1894 * _1990;
    float _1994 = _1916 * _1754;
    float _1996 = _1912 * _1754;
    bool _1998 = !_1558;
    int _2000 = _1998 ? _1980 : (-1);
    float _2002 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1960);
    int _2004 = _1976 * int(_1954);
    int _2006 = _2004 + _1878;
    float _2008 = fma(_1934, _1742, _1996);
    int _2010 = _2000 & 3;
    bool _2012 = _2010 != 0;
    float _2014 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1984);
    int _2016 = _2000 & 3;
    bool _2018 = _2016 != 0;
    float _2020 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1988);
    float _2022 = float(uint(_2006));
    float _2024 = fma(_1928, _1742, _1994);
    int _2026 = _2012 ? 0 : 1;
    float _2028 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2030 = uint(_2016) > 1u;
    float _2032 = as_type<float>(_891) * _2022;
    float _2034 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2036 = ~_2026;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = fma(_1914, _1742, _1992);
    float _2044 = trunc(_2032);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2052 = in.m_61.w;
    int _2054 = ~_737;
    int _2056 = _2054 + 1;
    float _2058 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2028);
    float _2060 = fma(_1908, _2050, _2042);
    float _2062 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = fma(_1930, _2050, _2008);
    int _2066 = _2040;
    float _2068 = as_type<float>(_1562);
    if (!_2030)
    {
        int _2070 = ~_2026;
        int _2072 = _2070 + 1;
        _2066 = _2072;
    }
    int _2074 = _2066;
    float _2076 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2078 = uint(_2016) >= 2u;
    float _2080 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2082 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    float _2084 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2076);
    int _2086 = _2078 ? 0 : 1;
    float _2088 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2080);
    bool _2090 = _2016 != 3;
    float _2092 = fma(_1938, _2050, _2024);
    int _2094 = int(_1954) + int(_2048);
    float _2096 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2034);
    int _2098 = ~_2086;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = in.m_59.w;
    float _2106 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1968);
    int _2108 = _1680 * _2094;
    int _2110 = _2108 + _1878;
    float _2112 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2084);
    float _2114 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2116 = _1202 + _2052;
    int _2118 = _1832 * _1970;
    int _2120 = _2118 + _1632;
    bool _2122 = !_2018;
    int _2124 = _2122 ? 0 : 1;
    float _2126 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2114);
    int _2128 = _2102;
    if (_2090)
    {
        int _2130 = ~_2086;
        int _2132 = _2130 + 1;
        _2128 = _2132;
    }
    int _2134 = _2128;
    float _2136 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2082);
    bool _2138 = uint(_2110) >= uint(_785);
    int _2140 = _2056 * _1942;
    int _2142 = _2140 + _1562;
    float _2144 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    bool _2146 = uint(_2120) >= uint(_785);
    bool _2148 = !_2138;
    int _2150 = _2148 ? 0 : (-1);
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _2154 = uint(_2142) >= uint(_737);
    int _2156 = ~_2094;
    int _2158 = _2156 + _2150;
    int _2160 = _2158 + 1;
    float _2162 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2088);
    int _2164 = _2000 >> 31;
    float _2166 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2168 = _1200 + _2104;
    int _2170 = _785 * _2160;
    int _2172 = _2170 + _1878;
    int _2174 = _2164 & 3;
    float _2176 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2166);
    float _2178 = _2116 + _2152;
    float _2180 = _399 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2182 = _2000 + _2174;
    float _2184 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    bool _2186 = !_1744;
    int _2188 = _2186 ? _2172 : (-1);
    float _2190 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2192 = _2182 >> 2;
    float _2194 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2196 = _2188 >> 31;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2200 = _2178 + _2198;
    int _2202 = _2192 << 4;
    int _2204 = _2202 + 368;
    float _2206 = _2168 + _2194;
    int _2208 = _2196 & 3;
    float _2210 = _2200 * _2200;
    uint _2212 = uint(int(uint(_2204) >> uint(2)));
    uint _2214 = uint(int(uint(int(_2212)) >> uint(2)));
    int _2216 = int(_2212) & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = int(_2212) + 1;
    uint _2222 = uint(int(uint(_2220) >> uint(2)));
    int _2224 = _2220 & 3;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[int(_2222)][_2224];
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2230 = _2206 + _2228;
    int _2232 = _2188 + _2208;
    float _2234 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2190);
    float _2236 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2238 = fma(_2230, _2230, _2210);
    int _2240 = _2232 >> 2;
    float _2242 = _2180 * _2002;
    int _2244 = _2204 + 8;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    float _2262 = sqrt(_2238);
    int _2264 = _2240 << 4;
    int _2266 = _2264 + 512;
    float _2268 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2096);
    float _2270 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2106);
    float _2272 = _2180 * _2014;
    float _2274 = _2180 * _2020;
    bool _2276 = !_2146;
    int _2278 = _2276 ? 0 : (-1);
    float _2280 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    bool _2282 = !_2154;
    int _2284 = _2282 ? 0 : (-1);
    float _2286 = fma(_1766, _2236, _2242);
    int _2288 = _2188 & 3;
    bool _2290 = _2288 != 0;
    float _2292 = fma(_1766, _2268, _2272);
    int _2294 = _2188 & 3;
    bool _2296 = _2294 != 0;
    float _2298 = fma(_1766, _2270, _2274);
    float _2300 = _1166 + _1684;
    float _2302 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2304 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _2306 = uint(int(uint(_2266) >> uint(2)));
    uint _2308 = uint(int(uint(int(_2306)) >> uint(2)));
    int _2310 = int(_2306) & 3;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[int(_2308)][_2310];
    int _2314 = int(_2306) + 1;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    int _2318 = _2314 & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = _2290 ? 0 : 1;
    bool _2324 = uint(_2294) >= 2u;
    int _2326 = ~_1942;
    int _2328 = _2326 + _2284;
    int _2330 = _2328 + 1;
    int _2332 = ~_1970;
    int _2334 = _2332 + _2278;
    int _2336 = _2334 + 1;
    int _2338 = _2266 + 8;
    uint _2340 = uint(int(uint(_2338) >> uint(2)));
    uint _2342 = uint(int(uint(int(_2340)) >> uint(2)));
    int _2344 = int(_2340) & 3;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[int(_2342)][_2344];
    int _2348 = int(_2340) + 1;
    uint _2350 = uint(int(uint(_2348) >> uint(2)));
    int _2352 = _2348 & 3;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[int(_2350)][_2352];
    int _2356 = _2324 ? 0 : 1;
    int _2358 = _737 * _2330;
    int _2360 = _2358 + _1562;
    bool _2362 = !_2296;
    int _2364 = _2362 ? 0 : 1;
    int _2366 = _785 * _2336;
    int _2368 = _2366 + _1632;
    float _2370 = as_type<float>(_2330);
    float _2372 = _2270;
    float _2374 = _2268;
    float _2376 = _2268;
    if (!_2304)
    {
        _2370 = _2206;
    }
    float _2378 = _2370;
    float _2380 = _2378;
    if (!_2304)
    {
        _2068 = _2178;
    }
    float _2382 = _2068;
    float _2384 = _2300 + _2302;
    bool _2386 = uint(_2294) > 1u;
    int _2388 = ~_2322;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    float _2394 = _2382;
    int _2396 = _2392;
    if (!_2304)
    {
        _914 = _2384;
    }
    float _2398 = _914;
    int _2400 = ~_2356;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    bool _2406 = _2294 != 3;
    bool _2408 = !_2304;
    float _2410 = _2398;
    int _2412 = _2404;
    if (!_2408)
    {
        float _2414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2418 = _2262 + _2416;
        float _2420 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2422 = rsqrt(_2238);
        float _2424 = _2418 * _2414;
        float _2426 = _2424 * 0.15915493667125701904296875;
        float _2428 = _2426 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        float _2432 = _2426 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = _2430 + (-1.0);
        float _2438 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2440 = fma(_2434, _2420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2442 = fma(_2384, _2430, _2438);
        float _2444 = _2422 * _2440;
        float _2446 = fma(_2230, _2444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2448 = fma(_2200, _2444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2410 = _2442;
        _2380 = _2446;
        _2394 = _2448;
    }
    float _2450 = _2410;
    float _2452 = _2380;
    float _2454 = _2394;
    float _2456 = _2452;
    float _2458 = _2450;
    float _2460 = _2454;
    if (!_2386)
    {
        int _2462 = ~_2322;
        int _2464 = _2462 + 1;
        _2396 = _2464;
    }
    int _2466 = _2396;
    float _2468 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1604);
    int _2470 = abs(_2074);
    float _2472 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1692);
    int _2474 = abs(_2466);
    float _2476 = -_2468;
    float _2478 = _2476 + 1.0;
    float _2480 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1452);
    int _2482 = abs(_2124);
    float _2484 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1464);
    int _2486 = ~_2470;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    out.m_70.x = _2236;
    out.m_70.y = _2268;
    out.m_70.z = _2270;
    int _2492 = ~_2474;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    int _2498 = abs(_2364);
    int _2500 = _2490 * as_type<int>(_2226);
    int _2502 = ~_2482;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _2496 * as_type<int>(_2320);
    int _2510 = abs(_2134);
    bool _2512 = _2016 != 3;
    int _2514 = _2506 * as_type<int>(_2218);
    int _2516 = _2514 + _2500;
    int _2518 = ~_2498;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    int _2524 = ~_2510;
    int _2526 = _2524 + 1;
    int _2528 = _2526 + 1;
    bool _2530 = !_2512;
    int _2532 = _2530 ? 0 : (-1);
    int _2534 = _2522 * as_type<int>(_2312);
    int _2536 = _2534 + _2508;
    bool _2538 = _2294 != 3;
    int _2540 = _2528 * as_type<int>(_2252);
    int _2542 = _2540 + _2516;
    if (_2406)
    {
        int _2544 = ~_2356;
        int _2546 = _2544 + 1;
        _2412 = _2546;
    }
    int _2548 = _2412;
    bool _2550 = !_1128;
    int _2552 = _2550 ? 0 : 1;
    bool _2554 = !_2538;
    int _2556 = _2554 ? 0 : (-1);
    int _2558 = abs(_2548);
    int _2560 = abs(_2532);
    int _2562 = abs(_2552);
    int _2564 = abs(_2556);
    int _2566 = ~_2558;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    int _2572 = _2570 * as_type<int>(_2346);
    int _2574 = _2572 + _2536;
    bool _2576 = !_1164;
    int _2578 = _2576 ? 0 : 1;
    int _2580 = ~_2564;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    int _2586 = abs(_2578);
    int _2588 = ~_2560;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    int _2594 = _2584 * as_type<int>(_2354);
    int _2596 = _2594 + _2574;
    int _2598 = ~_2586;
    int _2600 = _2598 + 1;
    int _2602 = _2600 + 1;
    bool _2604 = !_1744;
    int _2606 = _2604 ? _2368 : (-1);
    int _2608 = _2592 * as_type<int>(_2260);
    int _2610 = _2608 + _2542;
    float _2612 = fma(_2180, _2180, 1.0);
    int _2614 = _2596 * _2602;
    float _2616 = -_2472;
    float _2618 = _2616 + 1.0;
    int _2620 = ~_2562;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = rsqrt(_2612);
    int _2628 = _2606 * _2586;
    int _2630 = _2628 + _2614;
    float _2632 = -_2478;
    float _2634 = fma(_733, _2632, _1392);
    float _2636 = -_2300;
    float _2638 = _2636 + _2450;
    float _2640 = fma(_827, _2618, _1764);
    float _2642 = -_2168;
    float _2644 = _2642 + _2452;
    bool _2646 = !_1558;
    int _2648 = _2646 ? _2360 : (-1);
    float _2650 = _2638 * _2638;
    int _2652 = _2610 * _2624;
    float _2654 = -_2116;
    float _2656 = _2654 + _2454;
    float _2658 = -_2480;
    float _2660 = _2658 + 1.0;
    float _2662 = fma(_2644, _2644, _2650);
    int _2664 = _2648 * _2562;
    int _2666 = _2664 + _2652;
    float _2668 = -_2484;
    float _2670 = _2668 + 1.0;
    float _2672 = -_2660;
    float _2674 = fma(_851, _2672, _1576);
    float _2676 = fma(_2656, _2656, _2662);
    float _2678 = _2180 * _2626;
    float _2680 = fma(_1512, _2670, _1582);
    float _2682 = _2112 + _2286;
    float _2684 = sqrt(_2676);
    float _2686 = -_2112;
    float _2688 = _2678 * _2686;
    float _2690 = -_2136;
    float _2692 = _2678 * _2690;
    float _2694 = -_2162;
    float _2696 = _2678 * _2694;
    float _2698 = _2136 + _2292;
    float _2700 = fma(_2626, _2002, _2688);
    float _2702 = fma(_2626, _2014, _2692);
    float _2704 = fma(_2626, _2020, _2696);
    float _2706 = float(_2666);
    float _2708 = _2162 + _2298;
    float _2710 = float(_2630);
    out.m_72.x = _2634;
    out.m_72.y = _2640;
    out.m_72.z = _2674;
    out.m_72.w = _2680;
    out.m_74.x = _2700;
    out.m_74.y = _2702;
    out.m_74.z = _2704;
    bool _2712 = _2684 > 0.0;
    out.m_76.x = _2706;
    out.m_76.y = _2710;
    out.m_78.x = _2682;
    out.m_78.y = _2698;
    out.m_78.z = _2708;
    bool _2714 = !_2712;
    if (!_2714)
    {
        bool _2716 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2718 = _2236;
        if (_2716)
        {
            float _2720 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2718 = _2720;
        }
        float _2722 = _2718;
        float _2724 = _2722;
        if (_2716)
        {
            float _2726 = _655 * _2722;
            _2372 = _2726;
        }
        float _2728 = _2372;
        float _2730 = _2728;
        if (_2716)
        {
            float _2732 = _657 * _2722;
            _2374 = _2732;
        }
        float _2734 = _2374;
        float _2736 = _2734;
        if (_2716)
        {
            float _2738 = _659 * _2722;
            _2724 = _2738;
        }
        float _2740 = _2724;
        float _2742 = _2740;
        float _2744 = _2740;
        if (!_2716)
        {
            bool _2746 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan(1.0);
            bool _2754 = _2750 || _2752;
            float _2756 = _117 + 1.0;
            float _2758 = _2756;
            if (!_2754)
            {
                float _2760 = _2756 * _2756;
                float _2762 = _2760 * 0.5;
                _2742 = _2762;
            }
            float _2764 = _2742;
            float _2766 = _2764;
            if (!_2754)
            {
                float _2768 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2766 = _2768;
            }
            float _2770 = _2766;
            bool _2772 = !_2754;
            float _2774 = _2770;
            if (!_2772)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = _2778 * _2756;
                float _2788 = 1.0 / _2782;
                float _2790 = _2784 * 0.693147182464599609375;
                float _2792 = exp2(_2786);
                float _2794 = 1.0 / _2790;
                float _2796 = _2792 + (-1.0);
                float _2798 = -_2796;
                float _2800 = fma(_2798, _2794, _2756);
                float _2802 = _2800 * _2788;
                float _2804 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2804;
            }
            float _2806 = _2774;
            float _2808 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2810 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2812 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2814 = _2808 * _383;
            float _2816 = _2808 * _331;
            float _2818 = _2808 * _409;
            float _2820 = fma(_2810, _375, _2814);
            float _2822 = fma(_2810, _327, _2816);
            float _2824 = fma(_2812, _387, _2820);
            bool _2826 = !_2754;
            if (!_2826)
            {
                float _2828 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2830 = log2(_2828);
                float _2832 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2834 = 1.0 + _2832;
                float _2836 = 1.0 / _2834;
                float _2838 = _2830 * _2756;
                float _2840 = exp2(_2838);
                float _2842 = -_2840;
                float _2844 = _2842 + 1.0;
                float _2846 = _2844 * _2836;
                _2758 = _2846;
            }
            float _2848 = _2758;
            float _2850 = fma(_2812, _345, _2822);
            float _2852 = fma(_2810, _405, _2818);
            float _2854 = fma(_2848, _259, _2824);
            float _2856 = fma(_2848, _257, _2850);
            float _2858 = fma(_2812, _413, _2852);
            float _2860 = -_615;
            float _2862 = _2860 + _2854;
            float _2864 = -_621;
            float _2866 = _2864 + _2856;
            float _2868 = fma(_2848, _261, _2858);
            float _2870 = _2862 * _175;
            float _2872 = _2862 * _169;
            float _2874 = _2862 * _181;
            float _2876 = -_627;
            float _2878 = _2876 + _2868;
            float _2880 = fma(_2866, _173, _2870);
            float _2882 = fma(_2866, _167, _2872);
            float _2884 = fma(_2866, _179, _2874);
            float _2886 = fma(_2878, _177, _2880);
            float _2888 = fma(_2878, _171, _2882);
            float _2890 = fma(_2878, _183, _2884);
            _665 = _2888;
            _667 = _2886;
            _669 = _2890;
            _2730 = _2886;
            _2736 = _2888;
            _2744 = _2890;
            _417 = _2868;
        }
        float _2892 = _665;
        float _2894 = _667;
        float _2896 = _669;
        float _2898 = _2730;
        float _2900 = _2736;
        float _2902 = _2744;
        float _2904 = _417;
        float _2906 = _2892 * _2892;
        float _2908 = rsqrt(_2676);
        float _2910 = fma(_2894, _2894, _2906);
        float _2912 = fma(_2896, _2896, _2910);
        float _2914 = sqrt(_2912);
        float _2916 = _2644 * _2908;
        float _2918 = _2638 * _2908;
        float _2920 = _2656 * _2908;
        bool _2922 = _2914 > 0.0;
        bool _2924 = !_2922;
        _421 = _2914;
        _423 = _2904;
        _2376 = _2900;
        if (!_2924)
        {
            float _2926 = rsqrt(_2912);
            float _2928 = _2926 * _2892;
            float _2930 = _2926 * _2894;
            float _2932 = _2926 * _2896;
            float _2934 = _2918 * _2928;
            float _2936 = fma(_2916, _2930, _2934);
            float _2938 = fma(_2920, _2932, _2936);
            float _2940 = _2938 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2942 = fma(_2898, _2940, _2452);
            float _2944 = fma(_2900, _2940, _2450);
            float _2946 = fma(_2902, _2940, _2454);
            _2456 = _2942;
            _2458 = _2944;
            _2460 = _2946;
            _419 = _2936;
            _421 = _2940;
            _423 = _2934;
        }
    }
    float _2948 = _2456;
    float _2950 = _2458;
    float _2952 = _2460;
    float _2954 = _419;
    float _2956 = _421;
    float _2958 = _423;
    float _2960 = _2376;
    bool _2962 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2964 = isnan(0.5);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2970 = _2966 || _2968;
    float _2972 = _2956;
    float _2974 = _2954;
    float _2976 = _2958;
    float _2978 = _2960;
    if (_2970)
    {
        _2972 = _2948;
    }
    float _2980 = _2972;
    float _2982 = _2980;
    if (_2970)
    {
        _2974 = _2950;
    }
    float _2984 = _2974;
    float _2986 = _2984;
    if (_2970)
    {
        _2976 = _2952;
    }
    float _2988 = _2976;
    float _2990 = _2988;
    if (!_2970)
    {
        float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2994 = _2300 + _2992;
        float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2998 = _2168 + _2996;
        float _3000 = -_2168;
        float _3002 = _3000 + _2948;
        float _3004 = -_2300;
        float _3006 = _3004 + _2950;
        float _3008 = _2994 * _2994;
        float _3010 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3012 = _2116 + _3010;
        float _3014 = -_2116;
        float _3016 = _3014 + _2952;
        float _3018 = fma(_2998, _2998, _3008);
        float _3020 = fma(_3012, _3012, _3018);
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3024 = sqrt(_3020);
        float _3026 = precise::min(_3024, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3028 = _3026 * _3022;
        float _3030 = fma(_3002, _3028, _2168);
        float _3032 = fma(_3006, _3028, _2300);
        float _3034 = fma(_3016, _3028, _2116);
        _2986 = _3032;
        _2982 = _3030;
        _2990 = _3034;
    }
    float _3036 = _2986;
    float _3038 = _2982;
    float _3040 = _2990;
    float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3044 = _3036 + _3042;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3048 = _3038 + _3046;
    float _3050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3052 = _3040 + _3050;
    float _3054 = _3044 * _3044;
    float _3056 = fma(_3048, _3048, _3054);
    float _3058 = fma(_3052, _3052, _3056);
    float _3060 = rsqrt(_3058);
    float _3062 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3064 = _3048 * _3062;
    float _3066 = _3052 * _3062;
    float _3068 = _3064 * _3064;
    float _3070 = _3066 * _3066;
    float _3072 = _3068 + _3070;
    float _3074 = sqrt(_3072);
    bool _3076 = _3074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3080 = _3074 + _3078;
    float _3082 = _3060;
    float _3084 = _3080;
    float _3086 = _3044;
    float _3088 = _3062;
    if (_3076)
    {
        float _3090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3082 = _3090;
    }
    float _3092 = _3082;
    float _3094 = _3092;
    if (_3076)
    {
        float _3096 = _3080 * _3092;
        _3084 = _3096;
    }
    float _3098 = _3084;
    if (_3076)
    {
        float _3100 = rsqrt(_3072);
        _3094 = _3100;
    }
    float _3102 = _3094;
    float _3104 = _3102;
    if (_3076)
    {
        float _3106 = _3098 * 0.15915493667125701904296875;
        _225 = _3106;
    }
    float _3108 = _225;
    float _3110 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3112 = _3052;
    float _3114 = _3108;
    if (_3076)
    {
        float _3116 = _3108 * 6.283185482025146484375;
        float _3118 = sin(_3116);
        _3112 = _3118;
    }
    float _3120 = _3112;
    float _3122 = precise::max(0.0, _3110);
    float _3124 = _615;
    if (_3076)
    {
        float _3126 = _3108 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        _3124 = _3128;
    }
    float _3130 = _3124;
    float _3132 = -_3062;
    float _3134 = -_3122;
    float _3136 = fma(_3044, _3132, _3134);
    if (_3076)
    {
        float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3086 = _3138;
    }
    float _3140 = _3086;
    float _3142 = sqrt(_3058);
    float _3144 = _3120;
    float _3146 = _3140;
    if (_3076)
    {
        float _3148 = fma(_3120, _3140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3144 = _3148;
    }
    float _3150 = _3144;
    float _3152 = _3150;
    if (!_3076)
    {
        _3114 = _3068;
    }
    float _3154 = _3114;
    float _3156 = _3154;
    if (_3076)
    {
        float _3158 = _3102 * _3150;
        _2978 = _3158;
    }
    float _3160 = _2978;
    if (!_3076)
    {
        _3104 = _3064;
    }
    float _3162 = _3104;
    float _3164 = _3162;
    float _3166 = _3130;
    if (_3076)
    {
        float _3168 = _3130 + (-1.0);
        _3146 = _3168;
    }
    float _3170 = _3146;
    float _3172 = _3170;
    if (_3076)
    {
        float _3174 = _3064 * _3160;
        _3164 = _3174;
    }
    float _3176 = _3164;
    if (!_3076)
    {
        _3152 = _3136;
    }
    float _3178 = _3152;
    float _3180 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3182 = _3178;
    if (_3076)
    {
        float _3184 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3088 = _3184;
    }
    float _3186 = _3088;
    if (!_3076)
    {
        _3172 = _3066;
    }
    float _3188 = _3172;
    float _3190 = _3188;
    if (_3076)
    {
        float _3192 = _3066 * _3160;
        _3190 = _3192;
    }
    float _3194 = _3190;
    if (_3076)
    {
        float _3196 = _3176 * _3176;
        _3156 = _3196;
    }
    float _3198 = _3156;
    if (_3076)
    {
        float _3200 = fma(_3136, _3130, _3186);
        _3182 = _3200;
    }
    float _3202 = _3182;
    if (!_3076)
    {
        _3166 = _3070;
    }
    float _3204 = _3166;
    float _3206 = _3204;
    if (_3076)
    {
        float _3208 = _3194 * _3194;
        _3206 = _3208;
    }
    float _3210 = _3206;
    float _3212 = fma(_3202, _3202, _3198);
    float _3214 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3216 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3218 = _3212 + _3210;
    float _3220 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3180);
    float _3222 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3226 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3224);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = rsqrt(_3218);
    float _3232 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3220);
    float _3234 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3236 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3222);
    float _3238 = -_3228;
    float _3240 = _3238 + 1.0;
    float _3242 = _3232 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3244 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3234);
    float _3246 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3236);
    float _3248 = abs(_3240);
    float _3250 = log2(_3248);
    float _3252 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3254 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3244);
    float _3256 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3258 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3216);
    float _3260 = -_3252;
    float _3262 = fma(_3260, _3214, 1.0);
    float _3264 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3268 = _3230 * _3176;
    float _3270 = _3230 * _3202;
    float _3272 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3258);
    float _3274 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3266);
    float _3276 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3278 = _3230 * _3194;
    float _3280 = _3272 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3282 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3274);
    float _3284 = -_3276;
    float _3286 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3284);
    float _3288 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3290 = log2(_3262);
    float _3292 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3282);
    float _3294 = -_3278;
    float _3296 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3286);
    float _3298 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3300 = fma(_3296, -0.5, 0.5);
    float _3302 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3298);
    float _3304 = exp2(_3288);
    float _3306 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3308 = fma(_3296, 0.5, 0.5);
    float _3310 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3302);
    float _3312 = _3270 + 1.0;
    float _3314 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3306);
    float _3316 = fma(_3308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3318 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3310);
    float _3320 = 1.0 / _3292;
    float _3322 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3314);
    float _3324 = fma(_3308, _3316, -0.212114393711090087890625);
    float _3326 = _3290 * 0.693147182464599609375;
    float _3328 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3322);
    float _3330 = fma(_3308, _3324, 1.570728778839111328125);
    float _3332 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3334 = sqrt(_3300);
    float _3336 = -_3270;
    float _3338 = fma(_3304, _3312, _3336);
    float _3340 = fma(_3338, 0.5, 0.5);
    float _3342 = _3318 * _3320;
    float _3344 = _3328 * _3320;
    float _3346 = fma(_3342, 0.5, 0.5);
    float _3348 = fma(_3344, -0.5, 0.5);
    float _3350 = _3334 * 0.636619746685028076171875;
    float3 _8630 = float3(_3346, _3348, _3332);
    float _3352 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8630, float3(0.0), isnan(_8630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8630, float3(0.0), isnan(_8630)), level(0.0)).x;
    float3 _8641 = float3(_3346, _3348, _3332);
    float4 _3355 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).xyzw;
    float _3357 = _3355.x;
    float _3359 = _3355.y;
    float _3361 = _3355.z;
    float _3363 = _3355.w;
    float _3365 = -_3330;
    float _3367 = fma(_3350, _3365, 1.0);
    float2 _8663 = float2(_3367, _3340);
    float3 _3371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8663, float2(0.0), isnan(_8663)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8663, float2(0.0), isnan(_8663)), level(0.0)).xyz;
    float _3373 = _3371.x;
    float _3375 = _3371.y;
    float _3377 = _3371.z;
    float _3379 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3381 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3383 = _3292 * 0.5;
    out.m_80.x = _2168;
    out.m_80.y = _2300;
    out.m_80.z = _2116;
    bool _3385 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3387 = isnan(_3142);
    bool _3389 = _3385 || _3387;
    bool _3391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3393 = _3389 || _3391;
    float _3395 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3381);
    float _3397 = exp2(_3379);
    out.m_82.x = _3038;
    out.m_82.y = _3036;
    out.m_82.z = _3040;
    float _3399 = _3318 + _3292;
    float _3401 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3395);
    float _3403 = fma(_3328, -0.5, _3383);
    float _3405 = _3399 * 0.5;
    float _3407 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3401);
    float _3409 = _3407 + _3292;
    out.gl_Position.x = _3318;
    out.gl_Position.y = _3328;
    out.gl_Position.z = _3407;
    out.gl_Position.w = _3292;
    float _3411 = _3409 * 0.5;
    float _3413 = -_3397;
    float _3415 = _3413 + 1.0;
    float _3417 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3405;
    out.m_84.y = _3403;
    out.m_84.z = _3411;
    out.m_84.w = _3292;
    float _3419 = -_3417;
    float _3421 = _3419 + 1.0;
    float _3423 = _3292;
    float _3425 = _3407;
    float _3427 = _3328;
    float _3429 = _3318;
    float _3431 = _3403;
    float _3433 = _3405;
    if (!_3393)
    {
        _3423 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3435 = _3423;
    float _3437 = _3435;
    float _3439 = _3435;
    if (!_3393)
    {
        _3425 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3441 = _3425;
    float _3443 = _3441;
    float _3445 = _3441;
    if (!_3393)
    {
        _3427 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3447 = _3427;
    float _3449 = _3447;
    float _3451 = _3447;
    if (!_3393)
    {
        _3429 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3453 = _3429;
    float _3455 = _3453;
    float _3457 = _3453;
    if (!_3393)
    {
        _3431 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3459 = _3431;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3393)
    {
        _3433 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3465 = _3433;
    float _3467 = _3417 * _3352;
    float _3469 = _3363 * _3467;
    float _3471 = _3377 * _3467;
    float _3473 = fma(_3373, _3469, _3357);
    float _3475 = fma(_3375, _3469, _3359);
    float _3477 = _3363 * _3421;
    float _3479 = fma(_3363, _3471, _3361);
    out.m_86.x = _3473;
    out.m_86.y = _3475;
    out.m_86.z = _3479;
    out.m_86.w = _3477;
    bool _3481 = !_3393;
    float _3483 = _3465;
    float _3485 = _3465;
    if (!_3481)
    {
        bool _3487 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3489 = isnan(_3142);
        bool _3491 = _3487 || _3489;
        bool _3493 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3495 = _3491 || _3493;
        if (!_3495)
        {
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3499 = _3142 + _3497;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3503 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3501;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3509 = 1.0 / _3503;
            float _3511 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3513 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3517 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3521 = _3519 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3527 = _3499 * _3509;
            float _3529 = precise::clamp(_3527, 0.0, 1.0);
            float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3535 = fma(_3529, _3507, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3537 = fma(_3529, _3533, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3539 = fma(_3529, _3513, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3541 = fma(_3529, _3517, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3543 = fma(_3529, _3521, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3545 = fma(_3529, _3525, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3485 = _3539;
            _3451 = _3543;
            _3463 = _3535;
            _3445 = _3541;
            _3439 = _3537;
            _3457 = _3545;
            _3547 = true;
        }
        else
        {
            bool _3549 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3551 = isnan(_3142);
            bool _3553 = _3549 || _3551;
            bool _3555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3557 = _3553 || _3555;
            if (!_3557)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3559 = _3461;
            _3463 = _3559;
            if (!_3557)
            {
                _3483 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3561 = _3483;
            _3485 = _3561;
            if (!_3557)
            {
                _3437 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3563 = _3437;
            _3439 = _3563;
            if (!_3557)
            {
                _3443 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3565 = _3443;
            _3445 = _3565;
            if (!_3557)
            {
                _3449 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3567 = _3449;
            _3451 = _3567;
            if (!_3557)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3569 = _3455;
            bool _3571 = !_3557;
            _3457 = _3569;
            if (!_3571)
            {
                bool _3573 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3575 = isnan(_3142);
                bool _3577 = _3573 || _3575;
                bool _3579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3581 = _3577 || _3579;
                if (!_3581)
                {
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3585 = _3142 + _3583;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3589 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3587;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3595 = 1.0 / _3589;
                    float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3613 = _3585 * _3595;
                    float _3615 = precise::clamp(_3613, 0.0, 1.0);
                    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3621 = fma(_3615, _3593, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3623 = fma(_3615, _3619, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3625 = fma(_3615, _3599, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3627 = fma(_3615, _3603, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3629 = fma(_3615, _3607, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3631 = fma(_3615, _3611, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3485 = _3625;
                    _3451 = _3629;
                    _3463 = _3621;
                    _3445 = _3627;
                    _3439 = _3623;
                    _3457 = _3631;
                    _3547 = true;
                }
                else
                {
                    _3485 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3451 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3445 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3439 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3547 = false;
    float _3633 = _3485;
    float _3635 = _3451;
    float _3637 = _3463;
    float _3639 = _3445;
    float _3641 = _3439;
    float _3643 = _3457;
    float _3645 = fma(_2698, -0.5, 0.5);
    float _3647 = precise::clamp(_3645, 0.0, 1.0);
    float _3649 = -_3633;
    float _3651 = _3649 + _3635;
    float _3653 = -_3637;
    float _3655 = _3653 + _3639;
    float _3657 = -_3641;
    float _3659 = _3657 + _3643;
    bool _3661 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3663 = fma(_3647, _3651, _3633);
    float _3665 = fma(_3647, _3655, _3637);
    float _3667 = fma(_3647, _3659, _3641);
    float _3669 = _3663 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3671 = fma(_3665, 0.298911988735198974609375, _3669);
    float _3673 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3675 = fma(_3667, 0.114477999508380889892578125, _3671);
    out.m_88.w = _3673;
    float _3677 = -_3675;
    float _3679 = _3665 + _3677;
    float _3681 = -_3675;
    float _3683 = _3663 + _3681;
    float _3685 = -_3675;
    float _3687 = _3667 + _3685;
    out.m_90.x = 0.0;
    float _3689 = fma(_3679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    float _3691 = fma(_3683, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    float _3693 = fma(_3687, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    out.m_92.x = _3689;
    out.m_92.y = _3691;
    out.m_92.z = _3693;
    if (!_3661)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3695 = -_3036;
    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3699 = -_3038;
    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3703 = -_3040;
    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3707 = _3697 * _3697;
    float _3709 = fma(_3701, _3701, _3707);
    float _3711 = fma(_3705, _3705, _3709);
    float _3713 = sqrt(_3711);
    float _3715 = rsqrt(_3711);
    float _3717 = -_3713;
    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3721 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3701 * _3715;
    float _3727 = _3697 * _3715;
    float _3729 = abs(_3723);
    float _3731 = log2(_3729);
    float _3733 = _3705 * _3715;
    float _3735 = _3725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3737 = _2698 * _3727;
    float _3739 = -_3727;
    float _3741 = -_3735;
    float _3743 = fma(_3739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3741);
    float _3745 = fma(_2682, _3725, _3737);
    float _3747 = -_3733;
    float _3749 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3743);
    float _3751 = fma(_2708, _3733, _3745);
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3757 = _3749 + _3755;
    float _3759 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3761 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3763 = precise::clamp(_3761, 0.0, 1.0);
    float _3765 = exp2(_3759);
    float _3767 = _3765 * _3763;
    float _3769 = _3753 * _3767;
    float _3771 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3773 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3775 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3771;
    out.m_90.y = _3773;
    out.m_90.z = _3775;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3547 = false;
    bool _687 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_133);
        out.gl_Position.z = _3843;
    }
    if (!_121)
    {
        return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _135 = as_type<int>(_163);
    }
    int _165 = _135;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3906 = as_type<float>(_165);
        out.gl_Position.z = _3906;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    if (_157)
    {
        return out;
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = in.m_59.x;
    float _175 = in.m_59.y;
    float _177 = in.m_59.z;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_66.w;
    float _189 = in.m_44.x;
    float _191 = in.m_44.y;
    float _193 = in.m_44.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_175, _175, _197);
    float _203 = fma(_179, _179, _199);
    float _205 = _171 * _171;
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_177, _177, _205);
    float _213 = fma(_183, _183, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = _209;
    float _225 = _173;
    if (_219)
    {
        float _227 = rsqrt(_203);
        _223 = _227;
    }
    float _229 = _223;
    float _231 = 0.0;
    float _233 = 0.0;
    if (!_219)
    {
        _231 = 0.0;
        _233 = 0.0;
    }
    float _235 = _231;
    float _237 = _233;
    bool _239 = _217 > 0.0;
    float _241 = 0.0;
    float _243 = _235;
    float _245 = _237;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _247 = _241;
    int _249 = as_type<int>(_185) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_185) & 2;
    bool _255 = _253 != 0;
    float _257 = in.m_46.x;
    float _259 = in.m_46.y;
    float _261 = in.m_46.z;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = 0.0;
    float _275 = _247;
    if (_221)
    {
        float _277 = rsqrt(_207);
        _273 = _277;
    }
    float _279 = _273;
    float _281 = 0.0;
    if (!_221)
    {
        _281 = 0.0;
    }
    float _283 = _281;
    int _285 = int(_251);
    int _287 = _255 ? 2 : 0;
    int _289 = _285 | _287;
    int _291 = _219 ? 4 : 0;
    int _293 = _289 | _291;
    int _295 = _221 ? 8 : 0;
    int _297 = _293 | _295;
    int _299 = _239 ? 16 : 0;
    int _301 = _297 | _299;
    int _303 = _271 ? 32 : 0;
    int _305 = _301 | _303;
    int _307 = false ? 64 : 0;
    int _309 = _305 | _307;
    int _311 = _309 & 32;
    float _313 = 0.0;
    float _315 = as_type<float>(_311);
    float _317 = _283;
    if (!_221)
    {
        _313 = 0.0;
    }
    float _319 = _313;
    float _321 = _229;
    float _323 = _319;
    if (_219)
    {
        float _325 = _229 * _173;
        _275 = _325;
    }
    float _327 = _275;
    if (_219)
    {
        float _329 = _229 * _167;
        _243 = _329;
    }
    float _331 = _243;
    float _333 = _213;
    if (_239)
    {
        float _335 = rsqrt(_213);
        _333 = _335;
    }
    float _337 = _333;
    float _339 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _341 = _339;
    if (_219)
    {
        float _343 = _229 * _179;
        _245 = _343;
    }
    float _345 = _245;
    float _347 = 0.0;
    if (!_221)
    {
        _347 = 0.0;
    }
    float _349 = _347;
    float _351 = _349;
    if (!_271)
    {
        float _353 = _339 * _339;
        float _355 = _353 * 0.5;
        _315 = _355;
    }
    float _357 = _315;
    float _359 = 0.0;
    float _361 = _357;
    if (!_239)
    {
        _359 = 0.0;
    }
    float _363 = _359;
    float _365 = 0.0;
    float _367 = _363;
    if (!_239)
    {
        _365 = 0.0;
    }
    float _369 = _365;
    float _371 = _369;
    if (_221)
    {
        float _373 = _279 * _175;
        _317 = _373;
    }
    float _375 = _317;
    if (!_239)
    {
        _321 = 0.0;
    }
    float _377 = _321;
    float _379 = _377;
    if (_221)
    {
        float _381 = _279 * _169;
        _323 = _381;
    }
    float _383 = _323;
    if (_221)
    {
        float _385 = _279 * _181;
        _351 = _385;
    }
    float _387 = _351;
    bool _389 = !_251;
    float _391 = _389 ? (-0.5) : 0.5;
    if (!_271)
    {
        float _393 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _393;
    }
    float _395 = _361;
    bool _397 = !_255;
    float _399 = _397 ? (-0.5) : 0.5;
    float _401 = _395;
    if (_239)
    {
        float _403 = _337 * _177;
        _367 = _403;
    }
    float _405 = _367;
    if (_239)
    {
        float _407 = _337 * _171;
        _371 = _407;
    }
    float _409 = _371;
    if (_239)
    {
        float _411 = _337 * _183;
        _379 = _411;
    }
    float _413 = _379;
    bool _415 = !_271;
    float _417 = _261;
    float _419 = _259;
    float _421 = _257;
    float _423 = _261;
    if (!_415)
    {
        float _425 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _427 = log2(_425);
        float _429 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _431 = _429 + 1.0;
        float _433 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _435 = _339 * _427;
        float _437 = exp2(_435);
        float _439 = _433 * 0.693147182464599609375;
        float _441 = 1.0 / _439;
        float _443 = 1.0 / _431;
        float _445 = _437 + (-1.0);
        float _447 = -_445;
        float _449 = fma(_447, _441, _339);
        float _451 = _449 * _443;
        float _453 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _401 = _453;
    }
    float _455 = _401;
    float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _459 = !_271;
    float _461 = _455;
    if (!_459)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = 1.0 / _469;
        float _473 = _339 * _465;
        float _475 = exp2(_473);
        float _477 = -_475;
        float _479 = _477 + 1.0;
        float _481 = _479 * _471;
        _341 = _481;
    }
    float _483 = _341;
    float _485 = _457 * _331;
    float _487 = _457 * _383;
    float _489 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _491 = _457 * _409;
    float _493 = 0.0;
    if (!_271)
    {
        float _495 = _117 * _117;
        float _497 = _495 * 0.5;
        _493 = _497;
    }
    float _499 = _493;
    float _501 = fma(_489, _327, _485);
    float _503 = fma(_489, _375, _487);
    float _505 = fma(_489, _405, _491);
    float _507 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_271)
    {
        float _509 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _509;
    }
    float _511 = _461;
    bool _513 = !_271;
    float _515 = _511;
    if (!_513)
    {
        float _517 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _519 = log2(_517);
        float _521 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _523 = _521 + 1.0;
        float _525 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _527 = _117 * _519;
        float _529 = 1.0 / _523;
        float _531 = _525 * 0.693147182464599609375;
        float _533 = exp2(_527);
        float _535 = 1.0 / _531;
        float _537 = _533 + (-1.0);
        float _539 = -_537;
        float _541 = fma(_539, _535, _117);
        float _543 = _541 * _529;
        float _545 = _543 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _515 = _545;
    }
    float _547 = _515;
    float _549 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _551 = fma(_507, _345, _501);
    float _553 = fma(_507, _387, _503);
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _557 = _549 * _331;
    float _559 = _549 * _383;
    float _561 = _549 * _409;
    float _563 = fma(_507, _413, _505);
    float _565 = fma(_555, _327, _557);
    float _567 = fma(_555, _375, _559);
    float _569 = fma(_555, _405, _561);
    float _571 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _573 = fma(_483, _261, _563);
    float _575 = fma(_483, _257, _551);
    float _577 = fma(_483, _259, _553);
    float _579 = fma(_571, _345, _565);
    float _581 = fma(_571, _387, _567);
    float _583 = fma(_571, _413, _569);
    float _585 = _547;
    if (!_271)
    {
        _585 = _117;
    }
    float _587 = _585;
    bool _589 = !_271;
    float _591 = _587;
    if (!_589)
    {
        float _593 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _595 = log2(_593);
        float _597 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _599 = _597 + 1.0;
        float _601 = 1.0 / _599;
        float _603 = _117 * _595;
        float _605 = exp2(_603);
        float _607 = -_605;
        float _609 = _607 + 1.0;
        float _611 = _609 * _601;
        _591 = _611;
    }
    float _613 = _591;
    float _615 = fma(_613, _259, _581);
    float _617 = 1.0 / _149;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_613, _257, _579);
    float _623 = -_615;
    float _625 = _577 + _623;
    float _627 = fma(_613, _261, _583);
    float _629 = fma(_577, _187, _191);
    float _631 = fma(_575, _187, _189);
    float _633 = -_621;
    float _635 = _575 + _633;
    float _637 = _625 * _175;
    float _639 = _625 * _169;
    float _641 = _625 * _181;
    float _643 = -_627;
    float _645 = _573 + _643;
    float _647 = fma(_635, _173, _637);
    float _649 = fma(_635, _167, _639);
    float _651 = fma(_635, _179, _641);
    float _653 = fma(_573, _187, _193);
    float _655 = fma(_645, _177, _647);
    float _657 = fma(_645, _171, _649);
    float _659 = fma(_645, _183, _651);
    float _661 = _117 * _617;
    bool _663 = !_619;
    float _665 = _657;
    float _667 = _655;
    float _669 = _659;
    float _685;
    if (!_663)
    {
        float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _673 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _677 = _675 * _671;
        float _679 = floor(_677);
        float _681 = -_679;
        float _683 = _677 + _681;
        _685 = _683;
        _687 = true;
    }
    else
    {
        _685 = _661;
    }
    _687 = false;
    float _689 = _685;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    float _695 = _147 * 2.0;
    float _697 = _151 * 2.0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _709 = _707 != 0;
    float _711 = in.m_53.w;
    bool _713 = _147 > 0.5;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    int _719 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _721 = _719 != 0;
    float _723 = _629 * _175;
    float _725 = -_391;
    int _727 = _713 ? as_type<int>(_725) : as_type<int>(_391);
    float _729 = fma(_631, _173, _723);
    bool _731 = !_721;
    float _733 = _731 ? _391 : as_type<float>(_727);
    float _735 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _737 = int(_735);
    float _739 = float(_693);
    bool _741 = _151 > 0.5;
    float _743 = _733 + 0.5;
    bool _745 = !_705;
    int _747 = _745 ? 0 : 1;
    bool _749 = !_701;
    int _751 = _749 ? 0 : 1;
    float _753 = 1.0 / _739;
    float _755 = float(_717);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _767 = _765 != 0;
    float _769 = 1.0 / _755;
    float _771 = float(uint(_737));
    bool _773 = _159 > 0.5;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _777 = _775 != 0;
    float _779 = -_399;
    int _781 = _741 ? as_type<int>(_779) : as_type<int>(_399);
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _785 = int(_783);
    float _787 = _117 * _753;
    bool _789 = !_759;
    int _791 = _789 ? 0 : 1;
    bool _793 = !_763;
    int _795 = _793 ? 0 : 1;
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = 1.0 / _771;
    float _803 = _117 * _769;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _819 = _817 != 0;
    float _821 = -_391;
    int _823 = _773 ? as_type<int>(_821) : as_type<int>(_391);
    bool _825 = !_777;
    float _827 = _825 ? _399 : as_type<float>(_781);
    float _829 = trunc(_787);
    int _831 = int(_829);
    float _833 = float(uint(_785));
    bool _835 = !_811;
    int _837 = _835 ? 0 : 1;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _841 = _839 != 0;
    int _843 = ~_737;
    int _845 = _843 + 1;
    float _847 = floor(_695);
    bool _849 = !_841;
    float _851 = _849 ? _391 : as_type<float>(_823);
    bool _853 = !_709;
    int _855 = _853 ? 0 : 1;
    int _857 = ~_737;
    int _859 = _857 + 1;
    float _861 = 1.0 / _833;
    float _863 = float(uint(_831));
    float _865 = trunc(_803);
    int _867 = int(_865);
    int _869 = as_type<int>(_801) + (-2);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _873 = _847 > 0.0;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _877 = _847 >= 0.0;
    bool _879 = isnan(_847);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    float _887 = as_type<float>(_869) * _863;
    float _889 = floor(_697);
    int _891 = as_type<int>(_861) + (-2);
    int _893 = _885 ? 0 : 1;
    int _895 = ~_893;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    float _901 = trunc(_887);
    float _903 = precise::max(_901, 0.0);
    uint _906 = uint(_903);
    float _908 = float(uint(_867));
    int _910 = _899;
    float _912 = as_type<float>(_859);
    float _914 = as_type<float>(_785);
    if (!_873)
    {
        int _916 = ~_893;
        int _918 = _916 + 1;
        _910 = _918;
    }
    int _920 = _910;
    float _922 = as_type<float>(_891) * _908;
    int _924 = ~_785;
    int _926 = _924 + 1;
    bool _928 = _889 > 0.0;
    float _930 = _159 * 2.0;
    bool _932 = _889 >= 0.0;
    bool _934 = isnan(_889);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    int _942 = _940 ? 0 : 1;
    float _944 = floor(_930);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _948 = _946 != 0;
    bool _950 = _711 > 0.5;
    float _952 = trunc(_922);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    int _958 = _845 * int(_906);
    int _960 = _958 + _831;
    int _962 = ~_942;
    int _964 = _962 + 1;
    int _966 = _964 + 1;
    int _968 = _966;
    int _970 = _942;
    if (!_928)
    {
        int _972 = ~_942;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    float _978 = float(uint(_960));
    float _980 = 0.0;
    if (_948)
    {
        _980 = 1.0;
    }
    float _982 = _980;
    float _984 = -_399;
    int _986 = _950 ? as_type<int>(_984) : as_type<int>(_399);
    float _988 = as_type<float>(_869) * _978;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1000 = _998 != 0;
    float _1002 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1004 = log2(_1002);
    float _1006 = 0.0;
    float _1008 = _982;
    if (_948)
    {
        _1006 = 1.0;
    }
    float _1010 = _1006;
    int _1012 = _926 * int(_956);
    int _1014 = _1012 + _867;
    bool _1016 = !_996;
    int _1018 = _1016 ? 0 : 1;
    float _1020 = _1010;
    if (_948)
    {
        _970 = 0;
    }
    int _1022 = _970;
    float _1024 = float(uint(_1014));
    float _1026 = trunc(_988);
    float _1028 = precise::max(_1026, 0.0);
    uint _1030 = uint(_1028);
    float _1032 = 0.0;
    int _1034 = _1022;
    if (_948)
    {
        _1032 = _147;
    }
    float _1036 = _1032;
    bool _1038 = _944 >= 0.0;
    bool _1040 = isnan(_944);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    float _1048 = as_type<float>(_891) * _1024;
    float _1050 = _1036;
    if (!_948)
    {
        _1008 = 7.345489978790283203125;
    }
    float _1052 = _1008;
    if (!_948)
    {
        _1020 = 1.2345600128173828125;
    }
    float _1054 = _1020;
    float _1056 = trunc(_1048);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    if (!_948)
    {
        _1034 = 1;
    }
    int _1062 = _1034;
    if (!_948)
    {
        _1050 = _151;
    }
    float _1064 = _1050;
    bool _1066 = _944 > 0.0;
    int _1068 = _1046 ? 0 : 1;
    float _1070 = _1054 * _1064;
    bool _1072 = _1062 != 1;
    float _1074 = _117 * _1004;
    int _1076 = int(_906) + int(_1030);
    int _1078 = ~_1068;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = exp2(_1074);
    int _1086 = int(_956) + int(_1060);
    int _1088 = _1082;
    if (!_1066)
    {
        int _1090 = ~_1068;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    int _1096 = _859 * _1076;
    int _1098 = _1096 + _831;
    int _1100 = ~_785;
    int _1102 = _1100 + 1;
    float _1104 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1106 = !_992;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1110;
    bool _1114 = uint(_1098) >= uint(_737);
    float _1116 = fma(_1104, -2.0, _875);
    bool _1118 = !_1000;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _1102 * _1086;
    int _1124 = _1122 + _867;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1128 = _1126 != 0;
    float _1130 = -_1084;
    float _1132 = _1130 + 1.0;
    bool _1134 = !_1114;
    int _1136 = _1134 ? 0 : (-1);
    float _1138 = 1.0 / _1112;
    bool _1140 = uint(_1124) >= uint(_785);
    float _1142 = _629 * _169;
    bool _1144 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1146 = isnan(0.0);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1152 = _1148 || _1150;
    bool _1154 = !_1140;
    int _1156 = _1154 ? 0 : (-1);
    float _1158 = fma(_631, _167, _1142);
    float _1160 = _1152 ? _1132 : 0.0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1164 = _1162 != 0;
    float _1166 = fma(_653, _171, _1158);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1170 = _1168 != 0;
    float _1172 = _629 * _181;
    float _1174 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1176 = _151 + _159;
    bool _1178 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1180 = isnan(_689);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_631, _179, _1172);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1196 = -_871;
    float _1198 = fma(_1174, 2.0, _1196);
    float _1200 = fma(_653, _177, _729);
    float _1202 = fma(_653, _183, _1190);
    float _1204 = _147 + _151;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1206;
    float _1210 = 1.0 / _1194;
    float _1212 = _147 + _159;
    float _1214 = 0.0;
    float _1216 = as_type<float>(_1098);
    if (!_1072)
    {
        _1214 = _151;
    }
    float _1218 = _1214;
    float _1220 = _1218;
    if (!_1072)
    {
        _1216 = _151;
    }
    float _1222 = _1216;
    float _1224 = _1212 + (-1.0);
    float _1226 = _1176 + (-1.0);
    float _1228 = _1222;
    if (_1072)
    {
        _1220 = _147;
    }
    float _1230 = _1220;
    float _1232 = 1.0 / _1208;
    float _1234 = _1204 + (-1.0);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1238 = _689 + _1236;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1242 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1244 = _1238 * _1138;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1248 = _689 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1252 = _689 + _1250;
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1256 = _1248 * _1210;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1268 = 1.0 + _1266;
    float _1270 = _1252 * _1232;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1280 = fma(_1260, _1244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1282 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1284 = isnan(_689);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = fma(_1274, _1244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1296 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1298 = isnan(_689);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1264, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1310 = fma(_1278, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1312 = _1052 * _147;
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = -_1188;
    float _1320 = _1318 + 1.0;
    float _1322 = floor(_1312);
    float _1324 = 0.0;
    if (!_1072)
    {
        _1324 = _159;
    }
    float _1326 = _1324;
    float _1328 = _1188 * _1316;
    bool _1330 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1332 = isnan(_689);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -_1292;
    float _1344 = _1342 + 1.0;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1350;
    float _1354 = -_117;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1198);
    float _1358 = 1.0 / _1268;
    float _1360 = _1340 * _1344;
    float _1362 = fma(_1348, _1270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1364 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1116);
    float _1366 = -_1340;
    float _1368 = _1366 + 1.0;
    float _1370 = _1280 * _1360;
    float _1372 = _1294 * _1360;
    float _1374 = _1292 * _1320;
    float _1376 = floor(_1070);
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1370);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1372);
    float _1382 = -_1322;
    float _1384 = _1312 + _1382;
    float _1386 = fma(_1308, _1374, _1378);
    float _1388 = fma(_1310, _1374, _1380);
    float _1390 = float(_737);
    float _1392 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1356);
    float _1394 = float(_831);
    float _1396 = fma(_1352, _1270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1398 = float(_785);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1402 = float(_867);
    float _1404 = _1384 * _1390;
    float _1406 = -_1376;
    float _1408 = _1070 + _1406;
    bool _1410 = _1394 >= _1390;
    bool _1412 = isnan(_1394);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan(_1390);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = _661 * _1398;
    float _1424 = _1326;
    if (_1072)
    {
        _1228 = _147;
    }
    float _1426 = _1228;
    float _1428 = _661 * _1390;
    bool _1430 = _1402 >= _1398;
    bool _1432 = isnan(_1402);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1398);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    float _1442 = _1408 * _1398;
    if (!_1072)
    {
        _912 = _159;
    }
    float _1444 = _912;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1448 = _1444;
    if (_1072)
    {
        _1424 = _151;
    }
    float _1450 = _1424;
    float _1452 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1400);
    if (_1072)
    {
        _1448 = _151;
    }
    float _1454 = _1448;
    float _1456 = fma(_1362, _1328, _1386);
    float _1458 = fma(_1396, _1328, _1388);
    float _1460 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1462 = abs(_1108);
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1446);
    int _1466 = abs(_1120);
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1470 = float(_920);
    float _1472 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1476 = abs(_1018);
    float _1478 = trunc(_1420);
    int _1480 = int(_1478);
    float _1482 = float(_1466);
    float _1484 = fma(_1472, -2.0, _1468);
    float _1486 = -_1474;
    float _1488 = fma(_1460, 2.0, _1486);
    float _1490 = float(_1476);
    float _1492 = _1160 * _1358;
    float _1494 = float(_1094);
    float _1496 = -_117;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1488);
    float _1500 = float(_976);
    float _1502 = _1490 * _1470;
    float _1504 = float(_1462);
    float _1506 = trunc(_1404);
    int _1508 = int(_1506);
    bool _1510 = !_1170;
    float _1512 = _1510 ? _399 : as_type<float>(_986);
    float _1514 = _1482 * _1500;
    int _1516 = abs(_791);
    float _1518 = _1504 * _1494;
    int _1520 = ~_1076;
    int _1522 = _1520 + _1136;
    int _1524 = _1522 + 1;
    float _1526 = _851 + 0.5;
    float _1528 = in.m_68.x;
    float _1530 = in.m_68.y;
    float _1532 = in.m_68.z;
    bool _1534 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(1.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1458);
    int _1546 = _737 * _1524;
    int _1548 = _1546 + _831;
    float _1550 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1456);
    bool _1552 = !_1542;
    float _1554 = _1552 ? _117 : _1492;
    float _1556 = _1512 + (-0.5);
    bool _1558 = _737 == 0;
    int _1560 = _1508 * _1516;
    int _1562 = _1560 + _831;
    int _1564 = ~_1480;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1484);
    bool _1572 = !_1558;
    int _1574 = _1572 ? _1548 : (-1);
    float _1576 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1498);
    float _1578 = -_1556;
    float _1580 = -_1570;
    float _1582 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1580);
    int _1584 = _737 + (-1);
    int _1586 = _1574 * _1568;
    float _1588 = _1518 * (-2.0);
    float _1590 = trunc(_1442);
    int _1592 = int(_1590);
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1596 = _1480 * _1584;
    int _1598 = _1596 + _1586;
    float _1600 = fma(_1242, _1588, _1242);
    int _1602 = abs(_747);
    float _1604 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1594);
    float _1606 = _1502 * (-2.0);
    int _1608 = abs(_799);
    float _1610 = trunc(_1428);
    int _1612 = int(_1610);
    float _1614 = fma(_1588, _1528, _1528);
    float _1616 = _147 + (-0.5);
    float _1618 = fma(_1254, _1606, _1254);
    float _1620 = fma(_1606, _1530, _1530);
    float _1622 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1614);
    float _1624 = float(uint(_1562));
    float _1626 = in.m_66.x;
    float _1628 = in.m_66.y;
    int _1630 = _1592 * _1608;
    int _1632 = _1630 + _867;
    int _1634 = abs(_855);
    int _1636 = _1598 * _1602;
    int _1638 = abs(_751);
    float _1640 = as_type<float>(_869) * _1624;
    float _1642 = float(uint(_1632));
    float _1644 = fma(_1554, _1600, _1622);
    int _1646 = _1612 * _1638;
    int _1648 = _1646 + _1636;
    int _1650 = abs(_795);
    float _1652 = as_type<float>(_891) * _1642;
    float _1654 = _1514 * (-2.0);
    int _1656 = _1562 * _1634;
    int _1658 = _1656 + _1648;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1662 = trunc(_1640);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    float _1668 = _1644 * 0.15915493667125701904296875;
    int _1670 = _1508 * _1650;
    int _1672 = _1670 + _1658;
    float _1674 = fma(_1654, _1532, _1532);
    float _1676 = _159 + (-0.5);
    int _1678 = ~_785;
    int _1680 = _1678 + 1;
    float _1682 = _827 + (-0.5);
    float _1684 = in.m_57.w;
    float _1686 = trunc(_1440);
    int _1688 = int(_1686);
    float _1690 = fma(_1240, _1654, _1240);
    float _1692 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1660);
    float _1694 = _151 + (-0.5);
    float _1696 = float(uint(_1672));
    float _1698 = _1544 * _1628;
    float _1700 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1674);
    float _1702 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1620);
    int _1704 = ~_1086;
    int _1706 = _1704 + _1156;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_869) * _1696;
    float _1712 = _1550 * _1626;
    float _1714 = fma(_1554, _1618, _1702);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    float _1724 = _1712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1726 = fma(_1554, _1690, _1700);
    int _1728 = _785 * _1708;
    int _1730 = _1728 + _867;
    float _1732 = _1714 * 0.15915493667125701904296875;
    float _1734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _399);
    bool _1736 = !_807;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = _1698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1742 = _1724 * _1716;
    bool _1744 = _785 == 0;
    float _1746 = trunc(_1422);
    int _1748 = int(_1746);
    int _1750 = ~_737;
    int _1752 = _1750 + 1;
    float _1754 = _1740 * _1734;
    bool _1756 = !_1744;
    int _1758 = _1756 ? _1730 : (-1);
    float _1760 = -_1682;
    float _1762 = -_1364;
    float _1764 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1762);
    float _1766 = _391 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1768 = abs(_837);
    float _1770 = trunc(_1652);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    int _1776 = ~_1688;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1752 * int(_1722);
    int _1784 = _1782 + _1672;
    int _1786 = _785 + (-1);
    float _1788 = _1726 * 0.15915493667125701904296875;
    int _1790 = abs(_1738);
    int _1792 = _1758 * _1780;
    float _1794 = float(uint(_1784));
    float _1796 = _1732 * 6.283185482025146484375;
    float _1798 = sin(_1796);
    int _1800 = ~_785;
    int _1802 = _1800 + 1;
    int _1804 = _1688 * _1786;
    int _1806 = _1804 + _1792;
    int _1808 = ~_737;
    int _1810 = _1808 + 1;
    float _1812 = as_type<float>(_869) * _1794;
    bool _1814 = !_815;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1806 * _1768;
    bool _1820 = !_819;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = _1732 * 6.283185482025146484375;
    float _1826 = cos(_1824);
    int _1828 = abs(_1816);
    int _1830 = ~_785;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1812);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    int _1840 = ~_737;
    int _1842 = _1840 + 1;
    int _1844 = _1842 * int(_1666);
    int _1846 = _1844 + _1562;
    float _1848 = _1668 * 6.283185482025146484375;
    float _1850 = sin(_1848);
    int _1852 = abs(_1822);
    int _1854 = _1802 * int(_1774);
    int _1856 = _1854 + _1632;
    float _1858 = float(uint(_1846));
    int _1860 = _1748 * _1790;
    int _1862 = _1860 + _1818;
    float _1864 = float(uint(_1856));
    float _1866 = _1668 * 6.283185482025146484375;
    float _1868 = cos(_1866);
    float _1870 = as_type<float>(_869) * _1858;
    int _1872 = _1632 * _1828;
    int _1874 = _1872 + _1862;
    int _1876 = _1592 * _1852;
    int _1878 = _1876 + _1874;
    int _1880 = int(_1722) + int(_1838);
    float _1882 = _1788 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = _1850 * _1798;
    int _1888 = _1810 * _1880;
    int _1890 = _1888 + _1672;
    float _1892 = _1788 * 6.283185482025146484375;
    float _1894 = sin(_1892);
    bool _1896 = uint(_1890) >= uint(_737);
    float _1898 = _1868 * _1826;
    float _1900 = trunc(_1870);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    float _1906 = as_type<float>(_891) * _1864;
    float _1908 = _1798 * _1884;
    float _1910 = _1850 * _1826;
    float _1912 = _1850 * _1884;
    float _1914 = _1826 * _1884;
    float _1916 = _1868 * _1884;
    float _1918 = trunc(_1906);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    float _1924 = _1868 * _1798;
    float _1926 = float(uint(_1878));
    float _1928 = fma(_1894, _1898, _1886);
    float _1930 = fma(_1894, _1886, _1898);
    float _1932 = -_1924;
    float _1934 = fma(_1894, _1910, _1932);
    float _1936 = -_1910;
    float _1938 = fma(_1894, _1924, _1936);
    float _1940 = as_type<float>(_891) * _1926;
    int _1942 = int(_1666) + int(_1904);
    float _1944 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1946 = !_1896;
    int _1948 = _1946 ? 0 : (-1);
    float _1950 = trunc(_1940);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    float _1956 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1958 = -_1894;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1944);
    int _1962 = ~_1880;
    int _1964 = _1962 + _1948;
    int _1966 = _1964 + 1;
    float _1968 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1970 = int(_1774) + int(_1922);
    float _1972 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1974 = ~_785;
    int _1976 = _1974 + 1;
    int _1978 = _737 * _1966;
    int _1980 = _1978 + _1672;
    float _1982 = -_1894;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1956);
    float _1986 = -_1894;
    float _1988 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1972);
    float _1990 = -_1754;
    float _1992 = _1894 * _1990;
    float _1994 = _1916 * _1754;
    float _1996 = _1912 * _1754;
    bool _1998 = !_1558;
    int _2000 = _1998 ? _1980 : (-1);
    float _2002 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1960);
    int _2004 = _1976 * int(_1954);
    int _2006 = _2004 + _1878;
    float _2008 = fma(_1934, _1742, _1996);
    int _2010 = _2000 & 3;
    bool _2012 = _2010 != 0;
    float _2014 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1984);
    int _2016 = _2000 & 3;
    bool _2018 = _2016 != 0;
    float _2020 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1988);
    float _2022 = float(uint(_2006));
    float _2024 = fma(_1928, _1742, _1994);
    int _2026 = _2012 ? 0 : 1;
    float _2028 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2030 = uint(_2016) > 1u;
    float _2032 = as_type<float>(_891) * _2022;
    float _2034 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2036 = ~_2026;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = fma(_1914, _1742, _1992);
    float _2044 = trunc(_2032);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2052 = in.m_61.w;
    int _2054 = ~_737;
    int _2056 = _2054 + 1;
    float _2058 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2028);
    float _2060 = fma(_1908, _2050, _2042);
    float _2062 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = fma(_1930, _2050, _2008);
    int _2066 = _2040;
    float _2068 = as_type<float>(_1562);
    if (!_2030)
    {
        int _2070 = ~_2026;
        int _2072 = _2070 + 1;
        _2066 = _2072;
    }
    int _2074 = _2066;
    float _2076 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2078 = uint(_2016) >= 2u;
    float _2080 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2082 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    float _2084 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2076);
    int _2086 = _2078 ? 0 : 1;
    float _2088 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2080);
    bool _2090 = _2016 != 3;
    float _2092 = fma(_1938, _2050, _2024);
    int _2094 = int(_1954) + int(_2048);
    float _2096 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2034);
    int _2098 = ~_2086;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = in.m_59.w;
    float _2106 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1968);
    int _2108 = _1680 * _2094;
    int _2110 = _2108 + _1878;
    float _2112 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2084);
    float _2114 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2116 = _1202 + _2052;
    int _2118 = _1832 * _1970;
    int _2120 = _2118 + _1632;
    bool _2122 = !_2018;
    int _2124 = _2122 ? 0 : 1;
    float _2126 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2114);
    int _2128 = _2102;
    if (_2090)
    {
        int _2130 = ~_2086;
        int _2132 = _2130 + 1;
        _2128 = _2132;
    }
    int _2134 = _2128;
    float _2136 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2082);
    bool _2138 = uint(_2110) >= uint(_785);
    int _2140 = _2056 * _1942;
    int _2142 = _2140 + _1562;
    float _2144 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    bool _2146 = uint(_2120) >= uint(_785);
    bool _2148 = !_2138;
    int _2150 = _2148 ? 0 : (-1);
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _2154 = uint(_2142) >= uint(_737);
    int _2156 = ~_2094;
    int _2158 = _2156 + _2150;
    int _2160 = _2158 + 1;
    float _2162 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2088);
    int _2164 = _2000 >> 31;
    float _2166 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2168 = _1200 + _2104;
    int _2170 = _785 * _2160;
    int _2172 = _2170 + _1878;
    int _2174 = _2164 & 3;
    float _2176 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2166);
    float _2178 = _2116 + _2152;
    float _2180 = _399 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2182 = _2000 + _2174;
    float _2184 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    bool _2186 = !_1744;
    int _2188 = _2186 ? _2172 : (-1);
    float _2190 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2192 = _2182 >> 2;
    float _2194 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2196 = _2188 >> 31;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2200 = _2178 + _2198;
    int _2202 = _2192 << 4;
    int _2204 = _2202 + 368;
    float _2206 = _2168 + _2194;
    int _2208 = _2196 & 3;
    float _2210 = _2200 * _2200;
    uint _2212 = uint(int(uint(_2204) >> uint(2)));
    uint _2214 = uint(int(uint(int(_2212)) >> uint(2)));
    int _2216 = int(_2212) & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = int(_2212) + 1;
    uint _2222 = uint(int(uint(_2220) >> uint(2)));
    int _2224 = _2220 & 3;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[int(_2222)][_2224];
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2230 = _2206 + _2228;
    int _2232 = _2188 + _2208;
    float _2234 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2190);
    float _2236 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2238 = fma(_2230, _2230, _2210);
    int _2240 = _2232 >> 2;
    float _2242 = _2180 * _2002;
    int _2244 = _2204 + 8;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    float _2262 = sqrt(_2238);
    int _2264 = _2240 << 4;
    int _2266 = _2264 + 512;
    float _2268 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2096);
    float _2270 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2106);
    float _2272 = _2180 * _2014;
    float _2274 = _2180 * _2020;
    bool _2276 = !_2146;
    int _2278 = _2276 ? 0 : (-1);
    float _2280 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    bool _2282 = !_2154;
    int _2284 = _2282 ? 0 : (-1);
    float _2286 = fma(_1766, _2236, _2242);
    int _2288 = _2188 & 3;
    bool _2290 = _2288 != 0;
    float _2292 = fma(_1766, _2268, _2272);
    int _2294 = _2188 & 3;
    bool _2296 = _2294 != 0;
    float _2298 = fma(_1766, _2270, _2274);
    float _2300 = _1166 + _1684;
    float _2302 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2304 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _2306 = uint(int(uint(_2266) >> uint(2)));
    uint _2308 = uint(int(uint(int(_2306)) >> uint(2)));
    int _2310 = int(_2306) & 3;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[int(_2308)][_2310];
    int _2314 = int(_2306) + 1;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    int _2318 = _2314 & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = _2290 ? 0 : 1;
    bool _2324 = uint(_2294) >= 2u;
    int _2326 = ~_1942;
    int _2328 = _2326 + _2284;
    int _2330 = _2328 + 1;
    int _2332 = ~_1970;
    int _2334 = _2332 + _2278;
    int _2336 = _2334 + 1;
    int _2338 = _2266 + 8;
    uint _2340 = uint(int(uint(_2338) >> uint(2)));
    uint _2342 = uint(int(uint(int(_2340)) >> uint(2)));
    int _2344 = int(_2340) & 3;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[int(_2342)][_2344];
    int _2348 = int(_2340) + 1;
    uint _2350 = uint(int(uint(_2348) >> uint(2)));
    int _2352 = _2348 & 3;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[int(_2350)][_2352];
    int _2356 = _2324 ? 0 : 1;
    int _2358 = _737 * _2330;
    int _2360 = _2358 + _1562;
    bool _2362 = !_2296;
    int _2364 = _2362 ? 0 : 1;
    int _2366 = _785 * _2336;
    int _2368 = _2366 + _1632;
    float _2370 = as_type<float>(_2330);
    float _2372 = _2270;
    float _2374 = _2268;
    float _2376 = _2268;
    if (!_2304)
    {
        _2370 = _2206;
    }
    float _2378 = _2370;
    float _2380 = _2378;
    if (!_2304)
    {
        _2068 = _2178;
    }
    float _2382 = _2068;
    float _2384 = _2300 + _2302;
    bool _2386 = uint(_2294) > 1u;
    int _2388 = ~_2322;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    float _2394 = _2382;
    int _2396 = _2392;
    if (!_2304)
    {
        _914 = _2384;
    }
    float _2398 = _914;
    int _2400 = ~_2356;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    bool _2406 = _2294 != 3;
    bool _2408 = !_2304;
    float _2410 = _2398;
    int _2412 = _2404;
    if (!_2408)
    {
        float _2414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2418 = _2262 + _2416;
        float _2420 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2422 = rsqrt(_2238);
        float _2424 = _2418 * _2414;
        float _2426 = _2424 * 0.15915493667125701904296875;
        float _2428 = _2426 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        float _2432 = _2426 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = _2430 + (-1.0);
        float _2438 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2440 = fma(_2434, _2420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2442 = fma(_2384, _2430, _2438);
        float _2444 = _2422 * _2440;
        float _2446 = fma(_2230, _2444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2448 = fma(_2200, _2444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2410 = _2442;
        _2380 = _2446;
        _2394 = _2448;
    }
    float _2450 = _2410;
    float _2452 = _2380;
    float _2454 = _2394;
    float _2456 = _2452;
    float _2458 = _2450;
    float _2460 = _2454;
    if (!_2386)
    {
        int _2462 = ~_2322;
        int _2464 = _2462 + 1;
        _2396 = _2464;
    }
    int _2466 = _2396;
    float _2468 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1604);
    int _2470 = abs(_2074);
    float _2472 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1692);
    int _2474 = abs(_2466);
    float _2476 = -_2468;
    float _2478 = _2476 + 1.0;
    float _2480 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1452);
    int _2482 = abs(_2124);
    float _2484 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1464);
    int _2486 = ~_2470;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    out.m_70.x = _2236;
    out.m_70.y = _2268;
    out.m_70.z = _2270;
    int _2492 = ~_2474;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    int _2498 = abs(_2364);
    int _2500 = _2490 * as_type<int>(_2226);
    int _2502 = ~_2482;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _2496 * as_type<int>(_2320);
    int _2510 = abs(_2134);
    bool _2512 = _2016 != 3;
    int _2514 = _2506 * as_type<int>(_2218);
    int _2516 = _2514 + _2500;
    int _2518 = ~_2498;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    int _2524 = ~_2510;
    int _2526 = _2524 + 1;
    int _2528 = _2526 + 1;
    bool _2530 = !_2512;
    int _2532 = _2530 ? 0 : (-1);
    int _2534 = _2522 * as_type<int>(_2312);
    int _2536 = _2534 + _2508;
    bool _2538 = _2294 != 3;
    int _2540 = _2528 * as_type<int>(_2252);
    int _2542 = _2540 + _2516;
    if (_2406)
    {
        int _2544 = ~_2356;
        int _2546 = _2544 + 1;
        _2412 = _2546;
    }
    int _2548 = _2412;
    bool _2550 = !_1128;
    int _2552 = _2550 ? 0 : 1;
    bool _2554 = !_2538;
    int _2556 = _2554 ? 0 : (-1);
    int _2558 = abs(_2548);
    int _2560 = abs(_2532);
    int _2562 = abs(_2552);
    int _2564 = abs(_2556);
    int _2566 = ~_2558;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    int _2572 = _2570 * as_type<int>(_2346);
    int _2574 = _2572 + _2536;
    bool _2576 = !_1164;
    int _2578 = _2576 ? 0 : 1;
    int _2580 = ~_2564;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    int _2586 = abs(_2578);
    int _2588 = ~_2560;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    int _2594 = _2584 * as_type<int>(_2354);
    int _2596 = _2594 + _2574;
    int _2598 = ~_2586;
    int _2600 = _2598 + 1;
    int _2602 = _2600 + 1;
    bool _2604 = !_1744;
    int _2606 = _2604 ? _2368 : (-1);
    int _2608 = _2592 * as_type<int>(_2260);
    int _2610 = _2608 + _2542;
    float _2612 = fma(_2180, _2180, 1.0);
    int _2614 = _2596 * _2602;
    float _2616 = -_2472;
    float _2618 = _2616 + 1.0;
    int _2620 = ~_2562;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = rsqrt(_2612);
    int _2628 = _2606 * _2586;
    int _2630 = _2628 + _2614;
    float _2632 = -_2478;
    float _2634 = fma(_733, _2632, _1392);
    float _2636 = -_2300;
    float _2638 = _2636 + _2450;
    float _2640 = fma(_827, _2618, _1764);
    float _2642 = -_2168;
    float _2644 = _2642 + _2452;
    bool _2646 = !_1558;
    int _2648 = _2646 ? _2360 : (-1);
    float _2650 = _2638 * _2638;
    int _2652 = _2610 * _2624;
    float _2654 = -_2116;
    float _2656 = _2654 + _2454;
    float _2658 = -_2480;
    float _2660 = _2658 + 1.0;
    float _2662 = fma(_2644, _2644, _2650);
    int _2664 = _2648 * _2562;
    int _2666 = _2664 + _2652;
    float _2668 = -_2484;
    float _2670 = _2668 + 1.0;
    float _2672 = -_2660;
    float _2674 = fma(_851, _2672, _1576);
    float _2676 = fma(_2656, _2656, _2662);
    float _2678 = _2180 * _2626;
    float _2680 = fma(_1512, _2670, _1582);
    float _2682 = _2112 + _2286;
    float _2684 = sqrt(_2676);
    float _2686 = -_2112;
    float _2688 = _2678 * _2686;
    float _2690 = -_2136;
    float _2692 = _2678 * _2690;
    float _2694 = -_2162;
    float _2696 = _2678 * _2694;
    float _2698 = _2136 + _2292;
    float _2700 = fma(_2626, _2002, _2688);
    float _2702 = fma(_2626, _2014, _2692);
    float _2704 = fma(_2626, _2020, _2696);
    float _2706 = float(_2666);
    float _2708 = _2162 + _2298;
    float _2710 = float(_2630);
    out.m_72.x = _2634;
    out.m_72.y = _2640;
    out.m_72.z = _2674;
    out.m_72.w = _2680;
    out.m_74.x = _2700;
    out.m_74.y = _2702;
    out.m_74.z = _2704;
    bool _2712 = _2684 > 0.0;
    out.m_76.x = _2706;
    out.m_76.y = _2710;
    out.m_78.x = _2682;
    out.m_78.y = _2698;
    out.m_78.z = _2708;
    bool _2714 = !_2712;
    if (!_2714)
    {
        bool _2716 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2718 = _2236;
        if (_2716)
        {
            float _2720 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2718 = _2720;
        }
        float _2722 = _2718;
        float _2724 = _2722;
        if (_2716)
        {
            float _2726 = _655 * _2722;
            _2372 = _2726;
        }
        float _2728 = _2372;
        float _2730 = _2728;
        if (_2716)
        {
            float _2732 = _657 * _2722;
            _2374 = _2732;
        }
        float _2734 = _2374;
        float _2736 = _2734;
        if (_2716)
        {
            float _2738 = _659 * _2722;
            _2724 = _2738;
        }
        float _2740 = _2724;
        float _2742 = _2740;
        float _2744 = _2740;
        if (!_2716)
        {
            bool _2746 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan(1.0);
            bool _2754 = _2750 || _2752;
            float _2756 = _117 + 1.0;
            float _2758 = _2756;
            if (!_2754)
            {
                float _2760 = _2756 * _2756;
                float _2762 = _2760 * 0.5;
                _2742 = _2762;
            }
            float _2764 = _2742;
            float _2766 = _2764;
            if (!_2754)
            {
                float _2768 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2766 = _2768;
            }
            float _2770 = _2766;
            bool _2772 = !_2754;
            float _2774 = _2770;
            if (!_2772)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = _2778 * _2756;
                float _2788 = 1.0 / _2782;
                float _2790 = _2784 * 0.693147182464599609375;
                float _2792 = exp2(_2786);
                float _2794 = 1.0 / _2790;
                float _2796 = _2792 + (-1.0);
                float _2798 = -_2796;
                float _2800 = fma(_2798, _2794, _2756);
                float _2802 = _2800 * _2788;
                float _2804 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2804;
            }
            float _2806 = _2774;
            float _2808 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2810 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2812 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2814 = _2808 * _383;
            float _2816 = _2808 * _331;
            float _2818 = _2808 * _409;
            float _2820 = fma(_2810, _375, _2814);
            float _2822 = fma(_2810, _327, _2816);
            float _2824 = fma(_2812, _387, _2820);
            bool _2826 = !_2754;
            if (!_2826)
            {
                float _2828 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2830 = log2(_2828);
                float _2832 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2834 = 1.0 + _2832;
                float _2836 = 1.0 / _2834;
                float _2838 = _2830 * _2756;
                float _2840 = exp2(_2838);
                float _2842 = -_2840;
                float _2844 = _2842 + 1.0;
                float _2846 = _2844 * _2836;
                _2758 = _2846;
            }
            float _2848 = _2758;
            float _2850 = fma(_2812, _345, _2822);
            float _2852 = fma(_2810, _405, _2818);
            float _2854 = fma(_2848, _259, _2824);
            float _2856 = fma(_2848, _257, _2850);
            float _2858 = fma(_2812, _413, _2852);
            float _2860 = -_615;
            float _2862 = _2860 + _2854;
            float _2864 = -_621;
            float _2866 = _2864 + _2856;
            float _2868 = fma(_2848, _261, _2858);
            float _2870 = _2862 * _175;
            float _2872 = _2862 * _169;
            float _2874 = _2862 * _181;
            float _2876 = -_627;
            float _2878 = _2876 + _2868;
            float _2880 = fma(_2866, _173, _2870);
            float _2882 = fma(_2866, _167, _2872);
            float _2884 = fma(_2866, _179, _2874);
            float _2886 = fma(_2878, _177, _2880);
            float _2888 = fma(_2878, _171, _2882);
            float _2890 = fma(_2878, _183, _2884);
            _665 = _2888;
            _667 = _2886;
            _669 = _2890;
            _2730 = _2886;
            _2736 = _2888;
            _2744 = _2890;
            _417 = _2868;
        }
        float _2892 = _665;
        float _2894 = _667;
        float _2896 = _669;
        float _2898 = _2730;
        float _2900 = _2736;
        float _2902 = _2744;
        float _2904 = _417;
        float _2906 = _2892 * _2892;
        float _2908 = rsqrt(_2676);
        float _2910 = fma(_2894, _2894, _2906);
        float _2912 = fma(_2896, _2896, _2910);
        float _2914 = sqrt(_2912);
        float _2916 = _2644 * _2908;
        float _2918 = _2638 * _2908;
        float _2920 = _2656 * _2908;
        bool _2922 = _2914 > 0.0;
        bool _2924 = !_2922;
        _421 = _2914;
        _423 = _2904;
        _2376 = _2900;
        if (!_2924)
        {
            float _2926 = rsqrt(_2912);
            float _2928 = _2926 * _2892;
            float _2930 = _2926 * _2894;
            float _2932 = _2926 * _2896;
            float _2934 = _2918 * _2928;
            float _2936 = fma(_2916, _2930, _2934);
            float _2938 = fma(_2920, _2932, _2936);
            float _2940 = _2938 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2942 = fma(_2898, _2940, _2452);
            float _2944 = fma(_2900, _2940, _2450);
            float _2946 = fma(_2902, _2940, _2454);
            _2456 = _2942;
            _2458 = _2944;
            _2460 = _2946;
            _419 = _2936;
            _421 = _2940;
            _423 = _2934;
        }
    }
    float _2948 = _2456;
    float _2950 = _2458;
    float _2952 = _2460;
    float _2954 = _419;
    float _2956 = _421;
    float _2958 = _423;
    float _2960 = _2376;
    bool _2962 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2964 = isnan(0.5);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2970 = _2966 || _2968;
    float _2972 = _2956;
    float _2974 = _2954;
    float _2976 = _2958;
    float _2978 = _2960;
    if (_2970)
    {
        _2972 = _2948;
    }
    float _2980 = _2972;
    float _2982 = _2980;
    if (_2970)
    {
        _2974 = _2950;
    }
    float _2984 = _2974;
    float _2986 = _2984;
    if (_2970)
    {
        _2976 = _2952;
    }
    float _2988 = _2976;
    float _2990 = _2988;
    if (!_2970)
    {
        float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2994 = _2300 + _2992;
        float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2998 = _2168 + _2996;
        float _3000 = -_2168;
        float _3002 = _3000 + _2948;
        float _3004 = -_2300;
        float _3006 = _3004 + _2950;
        float _3008 = _2994 * _2994;
        float _3010 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3012 = _2116 + _3010;
        float _3014 = -_2116;
        float _3016 = _3014 + _2952;
        float _3018 = fma(_2998, _2998, _3008);
        float _3020 = fma(_3012, _3012, _3018);
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3024 = sqrt(_3020);
        float _3026 = precise::min(_3024, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3028 = _3026 * _3022;
        float _3030 = fma(_3002, _3028, _2168);
        float _3032 = fma(_3006, _3028, _2300);
        float _3034 = fma(_3016, _3028, _2116);
        _2986 = _3032;
        _2982 = _3030;
        _2990 = _3034;
    }
    float _3036 = _2986;
    float _3038 = _2982;
    float _3040 = _2990;
    float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3044 = _3036 + _3042;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3048 = _3038 + _3046;
    float _3050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3052 = _3040 + _3050;
    float _3054 = _3044 * _3044;
    float _3056 = fma(_3048, _3048, _3054);
    float _3058 = fma(_3052, _3052, _3056);
    float _3060 = rsqrt(_3058);
    float _3062 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3064 = _3048 * _3062;
    float _3066 = _3052 * _3062;
    float _3068 = _3064 * _3064;
    float _3070 = _3066 * _3066;
    float _3072 = _3068 + _3070;
    float _3074 = sqrt(_3072);
    bool _3076 = _3074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3080 = _3074 + _3078;
    float _3082 = _3060;
    float _3084 = _3080;
    float _3086 = _3044;
    float _3088 = _3062;
    if (_3076)
    {
        float _3090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3082 = _3090;
    }
    float _3092 = _3082;
    float _3094 = _3092;
    if (_3076)
    {
        float _3096 = _3080 * _3092;
        _3084 = _3096;
    }
    float _3098 = _3084;
    if (_3076)
    {
        float _3100 = rsqrt(_3072);
        _3094 = _3100;
    }
    float _3102 = _3094;
    float _3104 = _3102;
    if (_3076)
    {
        float _3106 = _3098 * 0.15915493667125701904296875;
        _225 = _3106;
    }
    float _3108 = _225;
    float _3110 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3112 = _3052;
    float _3114 = _3108;
    if (_3076)
    {
        float _3116 = _3108 * 6.283185482025146484375;
        float _3118 = sin(_3116);
        _3112 = _3118;
    }
    float _3120 = _3112;
    float _3122 = precise::max(0.0, _3110);
    float _3124 = _615;
    if (_3076)
    {
        float _3126 = _3108 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        _3124 = _3128;
    }
    float _3130 = _3124;
    float _3132 = -_3062;
    float _3134 = -_3122;
    float _3136 = fma(_3044, _3132, _3134);
    if (_3076)
    {
        float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3086 = _3138;
    }
    float _3140 = _3086;
    float _3142 = sqrt(_3058);
    float _3144 = _3120;
    float _3146 = _3140;
    if (_3076)
    {
        float _3148 = fma(_3120, _3140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3144 = _3148;
    }
    float _3150 = _3144;
    float _3152 = _3150;
    if (!_3076)
    {
        _3114 = _3068;
    }
    float _3154 = _3114;
    float _3156 = _3154;
    if (_3076)
    {
        float _3158 = _3102 * _3150;
        _2978 = _3158;
    }
    float _3160 = _2978;
    if (!_3076)
    {
        _3104 = _3064;
    }
    float _3162 = _3104;
    float _3164 = _3162;
    float _3166 = _3130;
    if (_3076)
    {
        float _3168 = _3130 + (-1.0);
        _3146 = _3168;
    }
    float _3170 = _3146;
    float _3172 = _3170;
    if (_3076)
    {
        float _3174 = _3064 * _3160;
        _3164 = _3174;
    }
    float _3176 = _3164;
    if (!_3076)
    {
        _3152 = _3136;
    }
    float _3178 = _3152;
    float _3180 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3182 = _3178;
    if (_3076)
    {
        float _3184 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3088 = _3184;
    }
    float _3186 = _3088;
    if (!_3076)
    {
        _3172 = _3066;
    }
    float _3188 = _3172;
    float _3190 = _3188;
    if (_3076)
    {
        float _3192 = _3066 * _3160;
        _3190 = _3192;
    }
    float _3194 = _3190;
    if (_3076)
    {
        float _3196 = _3176 * _3176;
        _3156 = _3196;
    }
    float _3198 = _3156;
    if (_3076)
    {
        float _3200 = fma(_3136, _3130, _3186);
        _3182 = _3200;
    }
    float _3202 = _3182;
    if (!_3076)
    {
        _3166 = _3070;
    }
    float _3204 = _3166;
    float _3206 = _3204;
    if (_3076)
    {
        float _3208 = _3194 * _3194;
        _3206 = _3208;
    }
    float _3210 = _3206;
    float _3212 = fma(_3202, _3202, _3198);
    float _3214 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3216 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3218 = _3212 + _3210;
    float _3220 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3180);
    float _3222 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3226 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3224);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = rsqrt(_3218);
    float _3232 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3220);
    float _3234 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3236 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3222);
    float _3238 = -_3228;
    float _3240 = _3238 + 1.0;
    float _3242 = _3232 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3244 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3234);
    float _3246 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3236);
    float _3248 = abs(_3240);
    float _3250 = log2(_3248);
    float _3252 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3254 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3244);
    float _3256 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3258 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3216);
    float _3260 = -_3252;
    float _3262 = fma(_3260, _3214, 1.0);
    float _3264 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3268 = _3230 * _3176;
    float _3270 = _3230 * _3202;
    float _3272 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3258);
    float _3274 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3266);
    float _3276 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3278 = _3230 * _3194;
    float _3280 = _3272 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3282 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3274);
    float _3284 = -_3276;
    float _3286 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3284);
    float _3288 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3290 = log2(_3262);
    float _3292 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3282);
    float _3294 = -_3278;
    float _3296 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3286);
    float _3298 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3300 = fma(_3296, -0.5, 0.5);
    float _3302 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3298);
    float _3304 = exp2(_3288);
    float _3306 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3308 = fma(_3296, 0.5, 0.5);
    float _3310 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3302);
    float _3312 = _3270 + 1.0;
    float _3314 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3306);
    float _3316 = fma(_3308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3318 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3310);
    float _3320 = 1.0 / _3292;
    float _3322 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3314);
    float _3324 = fma(_3308, _3316, -0.212114393711090087890625);
    float _3326 = _3290 * 0.693147182464599609375;
    float _3328 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3322);
    float _3330 = fma(_3308, _3324, 1.570728778839111328125);
    float _3332 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3334 = sqrt(_3300);
    float _3336 = -_3270;
    float _3338 = fma(_3304, _3312, _3336);
    float _3340 = fma(_3338, 0.5, 0.5);
    float _3342 = _3318 * _3320;
    float _3344 = _3328 * _3320;
    float _3346 = fma(_3342, 0.5, 0.5);
    float _3348 = fma(_3344, -0.5, 0.5);
    float _3350 = _3334 * 0.636619746685028076171875;
    float3 _8630 = float3(_3346, _3348, _3332);
    float _3352 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8630, float3(0.0), isnan(_8630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8630, float3(0.0), isnan(_8630)), level(0.0)).x;
    float3 _8641 = float3(_3346, _3348, _3332);
    float4 _3355 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).xyzw;
    float _3357 = _3355.x;
    float _3359 = _3355.y;
    float _3361 = _3355.z;
    float _3363 = _3355.w;
    float _3365 = -_3330;
    float _3367 = fma(_3350, _3365, 1.0);
    float2 _8663 = float2(_3367, _3340);
    float3 _3371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8663, float2(0.0), isnan(_8663)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8663, float2(0.0), isnan(_8663)), level(0.0)).xyz;
    float _3373 = _3371.x;
    float _3375 = _3371.y;
    float _3377 = _3371.z;
    float _3379 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3381 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3383 = _3292 * 0.5;
    out.m_80.x = _2168;
    out.m_80.y = _2300;
    out.m_80.z = _2116;
    bool _3385 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3387 = isnan(_3142);
    bool _3389 = _3385 || _3387;
    bool _3391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3393 = _3389 || _3391;
    float _3395 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3381);
    float _3397 = exp2(_3379);
    out.m_82.x = _3038;
    out.m_82.y = _3036;
    out.m_82.z = _3040;
    float _3399 = _3318 + _3292;
    float _3401 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3395);
    float _3403 = fma(_3328, -0.5, _3383);
    float _3405 = _3399 * 0.5;
    float _3407 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3401);
    float _3409 = _3407 + _3292;
    out.gl_Position.x = _3318;
    out.gl_Position.y = _3328;
    out.gl_Position.z = _3407;
    out.gl_Position.w = _3292;
    float _3411 = _3409 * 0.5;
    float _3413 = -_3397;
    float _3415 = _3413 + 1.0;
    float _3417 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3405;
    out.m_84.y = _3403;
    out.m_84.z = _3411;
    out.m_84.w = _3292;
    float _3419 = -_3417;
    float _3421 = _3419 + 1.0;
    float _3423 = _3292;
    float _3425 = _3407;
    float _3427 = _3328;
    float _3429 = _3318;
    float _3431 = _3403;
    float _3433 = _3405;
    if (!_3393)
    {
        _3423 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3435 = _3423;
    float _3437 = _3435;
    float _3439 = _3435;
    if (!_3393)
    {
        _3425 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3441 = _3425;
    float _3443 = _3441;
    float _3445 = _3441;
    if (!_3393)
    {
        _3427 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3447 = _3427;
    float _3449 = _3447;
    float _3451 = _3447;
    if (!_3393)
    {
        _3429 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3453 = _3429;
    float _3455 = _3453;
    float _3457 = _3453;
    if (!_3393)
    {
        _3431 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3459 = _3431;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3393)
    {
        _3433 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3465 = _3433;
    float _3467 = _3417 * _3352;
    float _3469 = _3363 * _3467;
    float _3471 = _3377 * _3467;
    float _3473 = fma(_3373, _3469, _3357);
    float _3475 = fma(_3375, _3469, _3359);
    float _3477 = _3363 * _3421;
    float _3479 = fma(_3363, _3471, _3361);
    out.m_86.x = _3473;
    out.m_86.y = _3475;
    out.m_86.z = _3479;
    out.m_86.w = _3477;
    bool _3481 = !_3393;
    float _3483 = _3465;
    float _3485 = _3465;
    if (!_3481)
    {
        bool _3487 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3489 = isnan(_3142);
        bool _3491 = _3487 || _3489;
        bool _3493 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3495 = _3491 || _3493;
        if (!_3495)
        {
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3499 = _3142 + _3497;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3503 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3501;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3509 = 1.0 / _3503;
            float _3511 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3513 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3517 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3521 = _3519 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3527 = _3499 * _3509;
            float _3529 = precise::clamp(_3527, 0.0, 1.0);
            float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3535 = fma(_3529, _3507, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3537 = fma(_3529, _3533, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3539 = fma(_3529, _3513, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3541 = fma(_3529, _3517, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3543 = fma(_3529, _3521, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3545 = fma(_3529, _3525, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3485 = _3539;
            _3451 = _3543;
            _3463 = _3535;
            _3445 = _3541;
            _3439 = _3537;
            _3457 = _3545;
            _3547 = true;
        }
        else
        {
            bool _3549 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3551 = isnan(_3142);
            bool _3553 = _3549 || _3551;
            bool _3555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3557 = _3553 || _3555;
            if (!_3557)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3559 = _3461;
            _3463 = _3559;
            if (!_3557)
            {
                _3483 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3561 = _3483;
            _3485 = _3561;
            if (!_3557)
            {
                _3437 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3563 = _3437;
            _3439 = _3563;
            if (!_3557)
            {
                _3443 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3565 = _3443;
            _3445 = _3565;
            if (!_3557)
            {
                _3449 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3567 = _3449;
            _3451 = _3567;
            if (!_3557)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3569 = _3455;
            bool _3571 = !_3557;
            _3457 = _3569;
            if (!_3571)
            {
                bool _3573 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3575 = isnan(_3142);
                bool _3577 = _3573 || _3575;
                bool _3579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3581 = _3577 || _3579;
                if (!_3581)
                {
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3585 = _3142 + _3583;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3589 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3587;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3595 = 1.0 / _3589;
                    float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3613 = _3585 * _3595;
                    float _3615 = precise::clamp(_3613, 0.0, 1.0);
                    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3621 = fma(_3615, _3593, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3623 = fma(_3615, _3619, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3625 = fma(_3615, _3599, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3627 = fma(_3615, _3603, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3629 = fma(_3615, _3607, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3631 = fma(_3615, _3611, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3485 = _3625;
                    _3451 = _3629;
                    _3463 = _3621;
                    _3445 = _3627;
                    _3439 = _3623;
                    _3457 = _3631;
                    _3547 = true;
                }
                else
                {
                    _3485 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3451 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3445 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3439 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3547 = false;
    float _3633 = _3485;
    float _3635 = _3451;
    float _3637 = _3463;
    float _3639 = _3445;
    float _3641 = _3439;
    float _3643 = _3457;
    float _3645 = fma(_2698, -0.5, 0.5);
    float _3647 = precise::clamp(_3645, 0.0, 1.0);
    float _3649 = -_3633;
    float _3651 = _3649 + _3635;
    float _3653 = -_3637;
    float _3655 = _3653 + _3639;
    float _3657 = -_3641;
    float _3659 = _3657 + _3643;
    bool _3661 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3663 = fma(_3647, _3651, _3633);
    float _3665 = fma(_3647, _3655, _3637);
    float _3667 = fma(_3647, _3659, _3641);
    float _3669 = _3663 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3671 = fma(_3665, 0.298911988735198974609375, _3669);
    float _3673 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3675 = fma(_3667, 0.114477999508380889892578125, _3671);
    out.m_88.w = _3673;
    float _3677 = -_3675;
    float _3679 = _3665 + _3677;
    float _3681 = -_3675;
    float _3683 = _3663 + _3681;
    float _3685 = -_3675;
    float _3687 = _3667 + _3685;
    out.m_90.x = 0.0;
    float _3689 = fma(_3679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    float _3691 = fma(_3683, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    float _3693 = fma(_3687, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    out.m_92.x = _3689;
    out.m_92.y = _3691;
    out.m_92.z = _3693;
    if (!_3661)
    {
        return out;
    }
    float _3695 = -_3036;
    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3699 = -_3038;
    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3703 = -_3040;
    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3707 = _3697 * _3697;
    float _3709 = fma(_3701, _3701, _3707);
    float _3711 = fma(_3705, _3705, _3709);
    float _3713 = sqrt(_3711);
    float _3715 = rsqrt(_3711);
    float _3717 = -_3713;
    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3721 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3701 * _3715;
    float _3727 = _3697 * _3715;
    float _3729 = abs(_3723);
    float _3731 = log2(_3729);
    float _3733 = _3705 * _3715;
    float _3735 = _3725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3737 = _2698 * _3727;
    float _3739 = -_3727;
    float _3741 = -_3735;
    float _3743 = fma(_3739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3741);
    float _3745 = fma(_2682, _3725, _3737);
    float _3747 = -_3733;
    float _3749 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3743);
    float _3751 = fma(_2708, _3733, _3745);
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3757 = _3749 + _3755;
    float _3759 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3761 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3763 = precise::clamp(_3761, 0.0, 1.0);
    float _3765 = exp2(_3759);
    float _3767 = _3765 * _3763;
    float _3769 = _3753 * _3767;
    float _3771 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3773 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3775 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3771;
    out.m_90.y = _3773;
    out.m_90.z = _3775;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3547 = false;
    bool _687 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_133);
        out.gl_Position.z = _3843;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _135 = as_type<int>(_163);
    }
    int _165 = _135;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3906 = as_type<float>(_165);
        out.gl_Position.z = _3906;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = in.m_59.x;
    float _175 = in.m_59.y;
    float _177 = in.m_59.z;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_66.w;
    float _189 = in.m_44.x;
    float _191 = in.m_44.y;
    float _193 = in.m_44.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_175, _175, _197);
    float _203 = fma(_179, _179, _199);
    float _205 = _171 * _171;
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_177, _177, _205);
    float _213 = fma(_183, _183, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = _209;
    float _225 = _173;
    if (_219)
    {
        float _227 = rsqrt(_203);
        _223 = _227;
    }
    float _229 = _223;
    float _231 = 0.0;
    float _233 = 0.0;
    if (!_219)
    {
        _231 = 0.0;
        _233 = 0.0;
    }
    float _235 = _231;
    float _237 = _233;
    bool _239 = _217 > 0.0;
    float _241 = 0.0;
    float _243 = _235;
    float _245 = _237;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _247 = _241;
    int _249 = as_type<int>(_185) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_185) & 2;
    bool _255 = _253 != 0;
    float _257 = in.m_46.x;
    float _259 = in.m_46.y;
    float _261 = in.m_46.z;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = 0.0;
    float _275 = _247;
    if (_221)
    {
        float _277 = rsqrt(_207);
        _273 = _277;
    }
    float _279 = _273;
    float _281 = 0.0;
    if (!_221)
    {
        _281 = 0.0;
    }
    float _283 = _281;
    int _285 = int(_251);
    int _287 = _255 ? 2 : 0;
    int _289 = _285 | _287;
    int _291 = _219 ? 4 : 0;
    int _293 = _289 | _291;
    int _295 = _221 ? 8 : 0;
    int _297 = _293 | _295;
    int _299 = _239 ? 16 : 0;
    int _301 = _297 | _299;
    int _303 = _271 ? 32 : 0;
    int _305 = _301 | _303;
    int _307 = false ? 64 : 0;
    int _309 = _305 | _307;
    int _311 = _309 & 32;
    float _313 = 0.0;
    float _315 = as_type<float>(_311);
    float _317 = _283;
    if (!_221)
    {
        _313 = 0.0;
    }
    float _319 = _313;
    float _321 = _229;
    float _323 = _319;
    if (_219)
    {
        float _325 = _229 * _173;
        _275 = _325;
    }
    float _327 = _275;
    if (_219)
    {
        float _329 = _229 * _167;
        _243 = _329;
    }
    float _331 = _243;
    float _333 = _213;
    if (_239)
    {
        float _335 = rsqrt(_213);
        _333 = _335;
    }
    float _337 = _333;
    float _339 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _341 = _339;
    if (_219)
    {
        float _343 = _229 * _179;
        _245 = _343;
    }
    float _345 = _245;
    float _347 = 0.0;
    if (!_221)
    {
        _347 = 0.0;
    }
    float _349 = _347;
    float _351 = _349;
    if (!_271)
    {
        float _353 = _339 * _339;
        float _355 = _353 * 0.5;
        _315 = _355;
    }
    float _357 = _315;
    float _359 = 0.0;
    float _361 = _357;
    if (!_239)
    {
        _359 = 0.0;
    }
    float _363 = _359;
    float _365 = 0.0;
    float _367 = _363;
    if (!_239)
    {
        _365 = 0.0;
    }
    float _369 = _365;
    float _371 = _369;
    if (_221)
    {
        float _373 = _279 * _175;
        _317 = _373;
    }
    float _375 = _317;
    if (!_239)
    {
        _321 = 0.0;
    }
    float _377 = _321;
    float _379 = _377;
    if (_221)
    {
        float _381 = _279 * _169;
        _323 = _381;
    }
    float _383 = _323;
    if (_221)
    {
        float _385 = _279 * _181;
        _351 = _385;
    }
    float _387 = _351;
    bool _389 = !_251;
    float _391 = _389 ? (-0.5) : 0.5;
    if (!_271)
    {
        float _393 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _393;
    }
    float _395 = _361;
    bool _397 = !_255;
    float _399 = _397 ? (-0.5) : 0.5;
    float _401 = _395;
    if (_239)
    {
        float _403 = _337 * _177;
        _367 = _403;
    }
    float _405 = _367;
    if (_239)
    {
        float _407 = _337 * _171;
        _371 = _407;
    }
    float _409 = _371;
    if (_239)
    {
        float _411 = _337 * _183;
        _379 = _411;
    }
    float _413 = _379;
    bool _415 = !_271;
    float _417 = _261;
    float _419 = _259;
    float _421 = _257;
    float _423 = _261;
    if (!_415)
    {
        float _425 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _427 = log2(_425);
        float _429 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _431 = _429 + 1.0;
        float _433 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _435 = _339 * _427;
        float _437 = exp2(_435);
        float _439 = _433 * 0.693147182464599609375;
        float _441 = 1.0 / _439;
        float _443 = 1.0 / _431;
        float _445 = _437 + (-1.0);
        float _447 = -_445;
        float _449 = fma(_447, _441, _339);
        float _451 = _449 * _443;
        float _453 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _401 = _453;
    }
    float _455 = _401;
    float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _459 = !_271;
    float _461 = _455;
    if (!_459)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = 1.0 / _469;
        float _473 = _339 * _465;
        float _475 = exp2(_473);
        float _477 = -_475;
        float _479 = _477 + 1.0;
        float _481 = _479 * _471;
        _341 = _481;
    }
    float _483 = _341;
    float _485 = _457 * _331;
    float _487 = _457 * _383;
    float _489 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _491 = _457 * _409;
    float _493 = 0.0;
    if (!_271)
    {
        float _495 = _117 * _117;
        float _497 = _495 * 0.5;
        _493 = _497;
    }
    float _499 = _493;
    float _501 = fma(_489, _327, _485);
    float _503 = fma(_489, _375, _487);
    float _505 = fma(_489, _405, _491);
    float _507 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_271)
    {
        float _509 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _509;
    }
    float _511 = _461;
    bool _513 = !_271;
    float _515 = _511;
    if (!_513)
    {
        float _517 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _519 = log2(_517);
        float _521 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _523 = _521 + 1.0;
        float _525 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _527 = _117 * _519;
        float _529 = 1.0 / _523;
        float _531 = _525 * 0.693147182464599609375;
        float _533 = exp2(_527);
        float _535 = 1.0 / _531;
        float _537 = _533 + (-1.0);
        float _539 = -_537;
        float _541 = fma(_539, _535, _117);
        float _543 = _541 * _529;
        float _545 = _543 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _515 = _545;
    }
    float _547 = _515;
    float _549 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _551 = fma(_507, _345, _501);
    float _553 = fma(_507, _387, _503);
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _557 = _549 * _331;
    float _559 = _549 * _383;
    float _561 = _549 * _409;
    float _563 = fma(_507, _413, _505);
    float _565 = fma(_555, _327, _557);
    float _567 = fma(_555, _375, _559);
    float _569 = fma(_555, _405, _561);
    float _571 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _573 = fma(_483, _261, _563);
    float _575 = fma(_483, _257, _551);
    float _577 = fma(_483, _259, _553);
    float _579 = fma(_571, _345, _565);
    float _581 = fma(_571, _387, _567);
    float _583 = fma(_571, _413, _569);
    float _585 = _547;
    if (!_271)
    {
        _585 = _117;
    }
    float _587 = _585;
    bool _589 = !_271;
    float _591 = _587;
    if (!_589)
    {
        float _593 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _595 = log2(_593);
        float _597 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _599 = _597 + 1.0;
        float _601 = 1.0 / _599;
        float _603 = _117 * _595;
        float _605 = exp2(_603);
        float _607 = -_605;
        float _609 = _607 + 1.0;
        float _611 = _609 * _601;
        _591 = _611;
    }
    float _613 = _591;
    float _615 = fma(_613, _259, _581);
    float _617 = 1.0 / _149;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_613, _257, _579);
    float _623 = -_615;
    float _625 = _577 + _623;
    float _627 = fma(_613, _261, _583);
    float _629 = fma(_577, _187, _191);
    float _631 = fma(_575, _187, _189);
    float _633 = -_621;
    float _635 = _575 + _633;
    float _637 = _625 * _175;
    float _639 = _625 * _169;
    float _641 = _625 * _181;
    float _643 = -_627;
    float _645 = _573 + _643;
    float _647 = fma(_635, _173, _637);
    float _649 = fma(_635, _167, _639);
    float _651 = fma(_635, _179, _641);
    float _653 = fma(_573, _187, _193);
    float _655 = fma(_645, _177, _647);
    float _657 = fma(_645, _171, _649);
    float _659 = fma(_645, _183, _651);
    float _661 = _117 * _617;
    bool _663 = !_619;
    float _665 = _657;
    float _667 = _655;
    float _669 = _659;
    float _685;
    if (!_663)
    {
        float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _673 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _677 = _675 * _671;
        float _679 = floor(_677);
        float _681 = -_679;
        float _683 = _677 + _681;
        _685 = _683;
        _687 = true;
    }
    else
    {
        _685 = _661;
    }
    _687 = false;
    float _689 = _685;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    float _695 = _147 * 2.0;
    float _697 = _151 * 2.0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _709 = _707 != 0;
    float _711 = in.m_53.w;
    bool _713 = _147 > 0.5;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    int _719 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _721 = _719 != 0;
    float _723 = _629 * _175;
    float _725 = -_391;
    int _727 = _713 ? as_type<int>(_725) : as_type<int>(_391);
    float _729 = fma(_631, _173, _723);
    bool _731 = !_721;
    float _733 = _731 ? _391 : as_type<float>(_727);
    float _735 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _737 = int(_735);
    float _739 = float(_693);
    bool _741 = _151 > 0.5;
    float _743 = _733 + 0.5;
    bool _745 = !_705;
    int _747 = _745 ? 0 : 1;
    bool _749 = !_701;
    int _751 = _749 ? 0 : 1;
    float _753 = 1.0 / _739;
    float _755 = float(_717);
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _767 = _765 != 0;
    float _769 = 1.0 / _755;
    float _771 = float(uint(_737));
    bool _773 = _159 > 0.5;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _777 = _775 != 0;
    float _779 = -_399;
    int _781 = _741 ? as_type<int>(_779) : as_type<int>(_399);
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _785 = int(_783);
    float _787 = _117 * _753;
    bool _789 = !_759;
    int _791 = _789 ? 0 : 1;
    bool _793 = !_763;
    int _795 = _793 ? 0 : 1;
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = 1.0 / _771;
    float _803 = _117 * _769;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _807 = _805 != 0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _819 = _817 != 0;
    float _821 = -_391;
    int _823 = _773 ? as_type<int>(_821) : as_type<int>(_391);
    bool _825 = !_777;
    float _827 = _825 ? _399 : as_type<float>(_781);
    float _829 = trunc(_787);
    int _831 = int(_829);
    float _833 = float(uint(_785));
    bool _835 = !_811;
    int _837 = _835 ? 0 : 1;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _841 = _839 != 0;
    int _843 = ~_737;
    int _845 = _843 + 1;
    float _847 = floor(_695);
    bool _849 = !_841;
    float _851 = _849 ? _391 : as_type<float>(_823);
    bool _853 = !_709;
    int _855 = _853 ? 0 : 1;
    int _857 = ~_737;
    int _859 = _857 + 1;
    float _861 = 1.0 / _833;
    float _863 = float(uint(_831));
    float _865 = trunc(_803);
    int _867 = int(_865);
    int _869 = as_type<int>(_801) + (-2);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _873 = _847 > 0.0;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _877 = _847 >= 0.0;
    bool _879 = isnan(_847);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    float _887 = as_type<float>(_869) * _863;
    float _889 = floor(_697);
    int _891 = as_type<int>(_861) + (-2);
    int _893 = _885 ? 0 : 1;
    int _895 = ~_893;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    float _901 = trunc(_887);
    float _903 = precise::max(_901, 0.0);
    uint _906 = uint(_903);
    float _908 = float(uint(_867));
    int _910 = _899;
    float _912 = as_type<float>(_859);
    float _914 = as_type<float>(_785);
    if (!_873)
    {
        int _916 = ~_893;
        int _918 = _916 + 1;
        _910 = _918;
    }
    int _920 = _910;
    float _922 = as_type<float>(_891) * _908;
    int _924 = ~_785;
    int _926 = _924 + 1;
    bool _928 = _889 > 0.0;
    float _930 = _159 * 2.0;
    bool _932 = _889 >= 0.0;
    bool _934 = isnan(_889);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    int _942 = _940 ? 0 : 1;
    float _944 = floor(_930);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _948 = _946 != 0;
    bool _950 = _711 > 0.5;
    float _952 = trunc(_922);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    int _958 = _845 * int(_906);
    int _960 = _958 + _831;
    int _962 = ~_942;
    int _964 = _962 + 1;
    int _966 = _964 + 1;
    int _968 = _966;
    int _970 = _942;
    if (!_928)
    {
        int _972 = ~_942;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    float _978 = float(uint(_960));
    float _980 = 0.0;
    if (_948)
    {
        _980 = 1.0;
    }
    float _982 = _980;
    float _984 = -_399;
    int _986 = _950 ? as_type<int>(_984) : as_type<int>(_399);
    float _988 = as_type<float>(_869) * _978;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1000 = _998 != 0;
    float _1002 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1004 = log2(_1002);
    float _1006 = 0.0;
    float _1008 = _982;
    if (_948)
    {
        _1006 = 1.0;
    }
    float _1010 = _1006;
    int _1012 = _926 * int(_956);
    int _1014 = _1012 + _867;
    bool _1016 = !_996;
    int _1018 = _1016 ? 0 : 1;
    float _1020 = _1010;
    if (_948)
    {
        _970 = 0;
    }
    int _1022 = _970;
    float _1024 = float(uint(_1014));
    float _1026 = trunc(_988);
    float _1028 = precise::max(_1026, 0.0);
    uint _1030 = uint(_1028);
    float _1032 = 0.0;
    int _1034 = _1022;
    if (_948)
    {
        _1032 = _147;
    }
    float _1036 = _1032;
    bool _1038 = _944 >= 0.0;
    bool _1040 = isnan(_944);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    float _1048 = as_type<float>(_891) * _1024;
    float _1050 = _1036;
    if (!_948)
    {
        _1008 = 7.345489978790283203125;
    }
    float _1052 = _1008;
    if (!_948)
    {
        _1020 = 1.2345600128173828125;
    }
    float _1054 = _1020;
    float _1056 = trunc(_1048);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    if (!_948)
    {
        _1034 = 1;
    }
    int _1062 = _1034;
    if (!_948)
    {
        _1050 = _151;
    }
    float _1064 = _1050;
    bool _1066 = _944 > 0.0;
    int _1068 = _1046 ? 0 : 1;
    float _1070 = _1054 * _1064;
    bool _1072 = _1062 != 1;
    float _1074 = _117 * _1004;
    int _1076 = int(_906) + int(_1030);
    int _1078 = ~_1068;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = exp2(_1074);
    int _1086 = int(_956) + int(_1060);
    int _1088 = _1082;
    if (!_1066)
    {
        int _1090 = ~_1068;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    int _1096 = _859 * _1076;
    int _1098 = _1096 + _831;
    int _1100 = ~_785;
    int _1102 = _1100 + 1;
    float _1104 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1106 = !_992;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1110;
    bool _1114 = uint(_1098) >= uint(_737);
    float _1116 = fma(_1104, -2.0, _875);
    bool _1118 = !_1000;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _1102 * _1086;
    int _1124 = _1122 + _867;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1128 = _1126 != 0;
    float _1130 = -_1084;
    float _1132 = _1130 + 1.0;
    bool _1134 = !_1114;
    int _1136 = _1134 ? 0 : (-1);
    float _1138 = 1.0 / _1112;
    bool _1140 = uint(_1124) >= uint(_785);
    float _1142 = _629 * _169;
    bool _1144 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1146 = isnan(0.0);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1152 = _1148 || _1150;
    bool _1154 = !_1140;
    int _1156 = _1154 ? 0 : (-1);
    float _1158 = fma(_631, _167, _1142);
    float _1160 = _1152 ? _1132 : 0.0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1164 = _1162 != 0;
    float _1166 = fma(_653, _171, _1158);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1170 = _1168 != 0;
    float _1172 = _629 * _181;
    float _1174 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1176 = _151 + _159;
    bool _1178 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1180 = isnan(_689);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_631, _179, _1172);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1196 = -_871;
    float _1198 = fma(_1174, 2.0, _1196);
    float _1200 = fma(_653, _177, _729);
    float _1202 = fma(_653, _183, _1190);
    float _1204 = _147 + _151;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1206;
    float _1210 = 1.0 / _1194;
    float _1212 = _147 + _159;
    float _1214 = 0.0;
    float _1216 = as_type<float>(_1098);
    if (!_1072)
    {
        _1214 = _151;
    }
    float _1218 = _1214;
    float _1220 = _1218;
    if (!_1072)
    {
        _1216 = _151;
    }
    float _1222 = _1216;
    float _1224 = _1212 + (-1.0);
    float _1226 = _1176 + (-1.0);
    float _1228 = _1222;
    if (_1072)
    {
        _1220 = _147;
    }
    float _1230 = _1220;
    float _1232 = 1.0 / _1208;
    float _1234 = _1204 + (-1.0);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1238 = _689 + _1236;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1242 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1244 = _1238 * _1138;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1248 = _689 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1252 = _689 + _1250;
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1256 = _1248 * _1210;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1268 = 1.0 + _1266;
    float _1270 = _1252 * _1232;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1280 = fma(_1260, _1244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1282 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1284 = isnan(_689);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = fma(_1274, _1244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1296 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1298 = isnan(_689);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1264, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1310 = fma(_1278, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1312 = _1052 * _147;
    float _1314 = -_1306;
    float _1316 = _1314 + 1.0;
    float _1318 = -_1188;
    float _1320 = _1318 + 1.0;
    float _1322 = floor(_1312);
    float _1324 = 0.0;
    if (!_1072)
    {
        _1324 = _159;
    }
    float _1326 = _1324;
    float _1328 = _1188 * _1316;
    bool _1330 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1332 = isnan(_689);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -_1292;
    float _1344 = _1342 + 1.0;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1350;
    float _1354 = -_117;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1198);
    float _1358 = 1.0 / _1268;
    float _1360 = _1340 * _1344;
    float _1362 = fma(_1348, _1270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1364 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1116);
    float _1366 = -_1340;
    float _1368 = _1366 + 1.0;
    float _1370 = _1280 * _1360;
    float _1372 = _1294 * _1360;
    float _1374 = _1292 * _1320;
    float _1376 = floor(_1070);
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1370);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1372);
    float _1382 = -_1322;
    float _1384 = _1312 + _1382;
    float _1386 = fma(_1308, _1374, _1378);
    float _1388 = fma(_1310, _1374, _1380);
    float _1390 = float(_737);
    float _1392 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1356);
    float _1394 = float(_831);
    float _1396 = fma(_1352, _1270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1398 = float(_785);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1402 = float(_867);
    float _1404 = _1384 * _1390;
    float _1406 = -_1376;
    float _1408 = _1070 + _1406;
    bool _1410 = _1394 >= _1390;
    bool _1412 = isnan(_1394);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan(_1390);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = _661 * _1398;
    float _1424 = _1326;
    if (_1072)
    {
        _1228 = _147;
    }
    float _1426 = _1228;
    float _1428 = _661 * _1390;
    bool _1430 = _1402 >= _1398;
    bool _1432 = isnan(_1402);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1398);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    float _1442 = _1408 * _1398;
    if (!_1072)
    {
        _912 = _159;
    }
    float _1444 = _912;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1448 = _1444;
    if (_1072)
    {
        _1424 = _151;
    }
    float _1450 = _1424;
    float _1452 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1400);
    if (_1072)
    {
        _1448 = _151;
    }
    float _1454 = _1448;
    float _1456 = fma(_1362, _1328, _1386);
    float _1458 = fma(_1396, _1328, _1388);
    float _1460 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1462 = abs(_1108);
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1446);
    int _1466 = abs(_1120);
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1470 = float(_920);
    float _1472 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1476 = abs(_1018);
    float _1478 = trunc(_1420);
    int _1480 = int(_1478);
    float _1482 = float(_1466);
    float _1484 = fma(_1472, -2.0, _1468);
    float _1486 = -_1474;
    float _1488 = fma(_1460, 2.0, _1486);
    float _1490 = float(_1476);
    float _1492 = _1160 * _1358;
    float _1494 = float(_1094);
    float _1496 = -_117;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1488);
    float _1500 = float(_976);
    float _1502 = _1490 * _1470;
    float _1504 = float(_1462);
    float _1506 = trunc(_1404);
    int _1508 = int(_1506);
    bool _1510 = !_1170;
    float _1512 = _1510 ? _399 : as_type<float>(_986);
    float _1514 = _1482 * _1500;
    int _1516 = abs(_791);
    float _1518 = _1504 * _1494;
    int _1520 = ~_1076;
    int _1522 = _1520 + _1136;
    int _1524 = _1522 + 1;
    float _1526 = _851 + 0.5;
    float _1528 = in.m_68.x;
    float _1530 = in.m_68.y;
    float _1532 = in.m_68.z;
    bool _1534 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(1.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1458);
    int _1546 = _737 * _1524;
    int _1548 = _1546 + _831;
    float _1550 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1456);
    bool _1552 = !_1542;
    float _1554 = _1552 ? _117 : _1492;
    float _1556 = _1512 + (-0.5);
    bool _1558 = _737 == 0;
    int _1560 = _1508 * _1516;
    int _1562 = _1560 + _831;
    int _1564 = ~_1480;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1484);
    bool _1572 = !_1558;
    int _1574 = _1572 ? _1548 : (-1);
    float _1576 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1498);
    float _1578 = -_1556;
    float _1580 = -_1570;
    float _1582 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1580);
    int _1584 = _737 + (-1);
    int _1586 = _1574 * _1568;
    float _1588 = _1518 * (-2.0);
    float _1590 = trunc(_1442);
    int _1592 = int(_1590);
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1596 = _1480 * _1584;
    int _1598 = _1596 + _1586;
    float _1600 = fma(_1242, _1588, _1242);
    int _1602 = abs(_747);
    float _1604 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1594);
    float _1606 = _1502 * (-2.0);
    int _1608 = abs(_799);
    float _1610 = trunc(_1428);
    int _1612 = int(_1610);
    float _1614 = fma(_1588, _1528, _1528);
    float _1616 = _147 + (-0.5);
    float _1618 = fma(_1254, _1606, _1254);
    float _1620 = fma(_1606, _1530, _1530);
    float _1622 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1614);
    float _1624 = float(uint(_1562));
    float _1626 = in.m_66.x;
    float _1628 = in.m_66.y;
    int _1630 = _1592 * _1608;
    int _1632 = _1630 + _867;
    int _1634 = abs(_855);
    int _1636 = _1598 * _1602;
    int _1638 = abs(_751);
    float _1640 = as_type<float>(_869) * _1624;
    float _1642 = float(uint(_1632));
    float _1644 = fma(_1554, _1600, _1622);
    int _1646 = _1612 * _1638;
    int _1648 = _1646 + _1636;
    int _1650 = abs(_795);
    float _1652 = as_type<float>(_891) * _1642;
    float _1654 = _1514 * (-2.0);
    int _1656 = _1562 * _1634;
    int _1658 = _1656 + _1648;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1662 = trunc(_1640);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    float _1668 = _1644 * 0.15915493667125701904296875;
    int _1670 = _1508 * _1650;
    int _1672 = _1670 + _1658;
    float _1674 = fma(_1654, _1532, _1532);
    float _1676 = _159 + (-0.5);
    int _1678 = ~_785;
    int _1680 = _1678 + 1;
    float _1682 = _827 + (-0.5);
    float _1684 = in.m_57.w;
    float _1686 = trunc(_1440);
    int _1688 = int(_1686);
    float _1690 = fma(_1240, _1654, _1240);
    float _1692 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1660);
    float _1694 = _151 + (-0.5);
    float _1696 = float(uint(_1672));
    float _1698 = _1544 * _1628;
    float _1700 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1674);
    float _1702 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1620);
    int _1704 = ~_1086;
    int _1706 = _1704 + _1156;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_869) * _1696;
    float _1712 = _1550 * _1626;
    float _1714 = fma(_1554, _1618, _1702);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    float _1724 = _1712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1726 = fma(_1554, _1690, _1700);
    int _1728 = _785 * _1708;
    int _1730 = _1728 + _867;
    float _1732 = _1714 * 0.15915493667125701904296875;
    float _1734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _399);
    bool _1736 = !_807;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = _1698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1742 = _1724 * _1716;
    bool _1744 = _785 == 0;
    float _1746 = trunc(_1422);
    int _1748 = int(_1746);
    int _1750 = ~_737;
    int _1752 = _1750 + 1;
    float _1754 = _1740 * _1734;
    bool _1756 = !_1744;
    int _1758 = _1756 ? _1730 : (-1);
    float _1760 = -_1682;
    float _1762 = -_1364;
    float _1764 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1762);
    float _1766 = _391 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1768 = abs(_837);
    float _1770 = trunc(_1652);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    int _1776 = ~_1688;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1752 * int(_1722);
    int _1784 = _1782 + _1672;
    int _1786 = _785 + (-1);
    float _1788 = _1726 * 0.15915493667125701904296875;
    int _1790 = abs(_1738);
    int _1792 = _1758 * _1780;
    float _1794 = float(uint(_1784));
    float _1796 = _1732 * 6.283185482025146484375;
    float _1798 = sin(_1796);
    int _1800 = ~_785;
    int _1802 = _1800 + 1;
    int _1804 = _1688 * _1786;
    int _1806 = _1804 + _1792;
    int _1808 = ~_737;
    int _1810 = _1808 + 1;
    float _1812 = as_type<float>(_869) * _1794;
    bool _1814 = !_815;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1806 * _1768;
    bool _1820 = !_819;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = _1732 * 6.283185482025146484375;
    float _1826 = cos(_1824);
    int _1828 = abs(_1816);
    int _1830 = ~_785;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1812);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    int _1840 = ~_737;
    int _1842 = _1840 + 1;
    int _1844 = _1842 * int(_1666);
    int _1846 = _1844 + _1562;
    float _1848 = _1668 * 6.283185482025146484375;
    float _1850 = sin(_1848);
    int _1852 = abs(_1822);
    int _1854 = _1802 * int(_1774);
    int _1856 = _1854 + _1632;
    float _1858 = float(uint(_1846));
    int _1860 = _1748 * _1790;
    int _1862 = _1860 + _1818;
    float _1864 = float(uint(_1856));
    float _1866 = _1668 * 6.283185482025146484375;
    float _1868 = cos(_1866);
    float _1870 = as_type<float>(_869) * _1858;
    int _1872 = _1632 * _1828;
    int _1874 = _1872 + _1862;
    int _1876 = _1592 * _1852;
    int _1878 = _1876 + _1874;
    int _1880 = int(_1722) + int(_1838);
    float _1882 = _1788 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = _1850 * _1798;
    int _1888 = _1810 * _1880;
    int _1890 = _1888 + _1672;
    float _1892 = _1788 * 6.283185482025146484375;
    float _1894 = sin(_1892);
    bool _1896 = uint(_1890) >= uint(_737);
    float _1898 = _1868 * _1826;
    float _1900 = trunc(_1870);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    float _1906 = as_type<float>(_891) * _1864;
    float _1908 = _1798 * _1884;
    float _1910 = _1850 * _1826;
    float _1912 = _1850 * _1884;
    float _1914 = _1826 * _1884;
    float _1916 = _1868 * _1884;
    float _1918 = trunc(_1906);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    float _1924 = _1868 * _1798;
    float _1926 = float(uint(_1878));
    float _1928 = fma(_1894, _1898, _1886);
    float _1930 = fma(_1894, _1886, _1898);
    float _1932 = -_1924;
    float _1934 = fma(_1894, _1910, _1932);
    float _1936 = -_1910;
    float _1938 = fma(_1894, _1924, _1936);
    float _1940 = as_type<float>(_891) * _1926;
    int _1942 = int(_1666) + int(_1904);
    float _1944 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1946 = !_1896;
    int _1948 = _1946 ? 0 : (-1);
    float _1950 = trunc(_1940);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    float _1956 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1958 = -_1894;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1944);
    int _1962 = ~_1880;
    int _1964 = _1962 + _1948;
    int _1966 = _1964 + 1;
    float _1968 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1970 = int(_1774) + int(_1922);
    float _1972 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1974 = ~_785;
    int _1976 = _1974 + 1;
    int _1978 = _737 * _1966;
    int _1980 = _1978 + _1672;
    float _1982 = -_1894;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1956);
    float _1986 = -_1894;
    float _1988 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1972);
    float _1990 = -_1754;
    float _1992 = _1894 * _1990;
    float _1994 = _1916 * _1754;
    float _1996 = _1912 * _1754;
    bool _1998 = !_1558;
    int _2000 = _1998 ? _1980 : (-1);
    float _2002 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1960);
    int _2004 = _1976 * int(_1954);
    int _2006 = _2004 + _1878;
    float _2008 = fma(_1934, _1742, _1996);
    int _2010 = _2000 & 3;
    bool _2012 = _2010 != 0;
    float _2014 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1984);
    int _2016 = _2000 & 3;
    bool _2018 = _2016 != 0;
    float _2020 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1988);
    float _2022 = float(uint(_2006));
    float _2024 = fma(_1928, _1742, _1994);
    int _2026 = _2012 ? 0 : 1;
    float _2028 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2030 = uint(_2016) > 1u;
    float _2032 = as_type<float>(_891) * _2022;
    float _2034 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2036 = ~_2026;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = fma(_1914, _1742, _1992);
    float _2044 = trunc(_2032);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2052 = in.m_61.w;
    int _2054 = ~_737;
    int _2056 = _2054 + 1;
    float _2058 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2028);
    float _2060 = fma(_1908, _2050, _2042);
    float _2062 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = fma(_1930, _2050, _2008);
    int _2066 = _2040;
    float _2068 = as_type<float>(_1562);
    if (!_2030)
    {
        int _2070 = ~_2026;
        int _2072 = _2070 + 1;
        _2066 = _2072;
    }
    int _2074 = _2066;
    float _2076 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2078 = uint(_2016) >= 2u;
    float _2080 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2082 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    float _2084 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2076);
    int _2086 = _2078 ? 0 : 1;
    float _2088 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2080);
    bool _2090 = _2016 != 3;
    float _2092 = fma(_1938, _2050, _2024);
    int _2094 = int(_1954) + int(_2048);
    float _2096 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2034);
    int _2098 = ~_2086;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = in.m_59.w;
    float _2106 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1968);
    int _2108 = _1680 * _2094;
    int _2110 = _2108 + _1878;
    float _2112 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2084);
    float _2114 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2116 = _1202 + _2052;
    int _2118 = _1832 * _1970;
    int _2120 = _2118 + _1632;
    bool _2122 = !_2018;
    int _2124 = _2122 ? 0 : 1;
    float _2126 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2114);
    int _2128 = _2102;
    if (_2090)
    {
        int _2130 = ~_2086;
        int _2132 = _2130 + 1;
        _2128 = _2132;
    }
    int _2134 = _2128;
    float _2136 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2082);
    bool _2138 = uint(_2110) >= uint(_785);
    int _2140 = _2056 * _1942;
    int _2142 = _2140 + _1562;
    float _2144 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    bool _2146 = uint(_2120) >= uint(_785);
    bool _2148 = !_2138;
    int _2150 = _2148 ? 0 : (-1);
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _2154 = uint(_2142) >= uint(_737);
    int _2156 = ~_2094;
    int _2158 = _2156 + _2150;
    int _2160 = _2158 + 1;
    float _2162 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2088);
    int _2164 = _2000 >> 31;
    float _2166 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2168 = _1200 + _2104;
    int _2170 = _785 * _2160;
    int _2172 = _2170 + _1878;
    int _2174 = _2164 & 3;
    float _2176 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2166);
    float _2178 = _2116 + _2152;
    float _2180 = _399 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2182 = _2000 + _2174;
    float _2184 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    bool _2186 = !_1744;
    int _2188 = _2186 ? _2172 : (-1);
    float _2190 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2192 = _2182 >> 2;
    float _2194 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2196 = _2188 >> 31;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2200 = _2178 + _2198;
    int _2202 = _2192 << 4;
    int _2204 = _2202 + 368;
    float _2206 = _2168 + _2194;
    int _2208 = _2196 & 3;
    float _2210 = _2200 * _2200;
    uint _2212 = uint(int(uint(_2204) >> uint(2)));
    uint _2214 = uint(int(uint(int(_2212)) >> uint(2)));
    int _2216 = int(_2212) & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = int(_2212) + 1;
    uint _2222 = uint(int(uint(_2220) >> uint(2)));
    int _2224 = _2220 & 3;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[int(_2222)][_2224];
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2230 = _2206 + _2228;
    int _2232 = _2188 + _2208;
    float _2234 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2190);
    float _2236 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2238 = fma(_2230, _2230, _2210);
    int _2240 = _2232 >> 2;
    float _2242 = _2180 * _2002;
    int _2244 = _2204 + 8;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    float _2262 = sqrt(_2238);
    int _2264 = _2240 << 4;
    int _2266 = _2264 + 512;
    float _2268 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2096);
    float _2270 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2106);
    float _2272 = _2180 * _2014;
    float _2274 = _2180 * _2020;
    bool _2276 = !_2146;
    int _2278 = _2276 ? 0 : (-1);
    float _2280 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    bool _2282 = !_2154;
    int _2284 = _2282 ? 0 : (-1);
    float _2286 = fma(_1766, _2236, _2242);
    int _2288 = _2188 & 3;
    bool _2290 = _2288 != 0;
    float _2292 = fma(_1766, _2268, _2272);
    int _2294 = _2188 & 3;
    bool _2296 = _2294 != 0;
    float _2298 = fma(_1766, _2270, _2274);
    float _2300 = _1166 + _1684;
    float _2302 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2304 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _2306 = uint(int(uint(_2266) >> uint(2)));
    uint _2308 = uint(int(uint(int(_2306)) >> uint(2)));
    int _2310 = int(_2306) & 3;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[int(_2308)][_2310];
    int _2314 = int(_2306) + 1;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    int _2318 = _2314 & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = _2290 ? 0 : 1;
    bool _2324 = uint(_2294) >= 2u;
    int _2326 = ~_1942;
    int _2328 = _2326 + _2284;
    int _2330 = _2328 + 1;
    int _2332 = ~_1970;
    int _2334 = _2332 + _2278;
    int _2336 = _2334 + 1;
    int _2338 = _2266 + 8;
    uint _2340 = uint(int(uint(_2338) >> uint(2)));
    uint _2342 = uint(int(uint(int(_2340)) >> uint(2)));
    int _2344 = int(_2340) & 3;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[int(_2342)][_2344];
    int _2348 = int(_2340) + 1;
    uint _2350 = uint(int(uint(_2348) >> uint(2)));
    int _2352 = _2348 & 3;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[int(_2350)][_2352];
    int _2356 = _2324 ? 0 : 1;
    int _2358 = _737 * _2330;
    int _2360 = _2358 + _1562;
    bool _2362 = !_2296;
    int _2364 = _2362 ? 0 : 1;
    int _2366 = _785 * _2336;
    int _2368 = _2366 + _1632;
    float _2370 = as_type<float>(_2330);
    float _2372 = _2270;
    float _2374 = _2268;
    float _2376 = _2268;
    if (!_2304)
    {
        _2370 = _2206;
    }
    float _2378 = _2370;
    float _2380 = _2378;
    if (!_2304)
    {
        _2068 = _2178;
    }
    float _2382 = _2068;
    float _2384 = _2300 + _2302;
    bool _2386 = uint(_2294) > 1u;
    int _2388 = ~_2322;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    float _2394 = _2382;
    int _2396 = _2392;
    if (!_2304)
    {
        _914 = _2384;
    }
    float _2398 = _914;
    int _2400 = ~_2356;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    bool _2406 = _2294 != 3;
    bool _2408 = !_2304;
    float _2410 = _2398;
    int _2412 = _2404;
    if (!_2408)
    {
        float _2414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2418 = _2262 + _2416;
        float _2420 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2422 = rsqrt(_2238);
        float _2424 = _2418 * _2414;
        float _2426 = _2424 * 0.15915493667125701904296875;
        float _2428 = _2426 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        float _2432 = _2426 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = _2430 + (-1.0);
        float _2438 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2440 = fma(_2434, _2420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2442 = fma(_2384, _2430, _2438);
        float _2444 = _2422 * _2440;
        float _2446 = fma(_2230, _2444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2448 = fma(_2200, _2444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2410 = _2442;
        _2380 = _2446;
        _2394 = _2448;
    }
    float _2450 = _2410;
    float _2452 = _2380;
    float _2454 = _2394;
    float _2456 = _2452;
    float _2458 = _2450;
    float _2460 = _2454;
    if (!_2386)
    {
        int _2462 = ~_2322;
        int _2464 = _2462 + 1;
        _2396 = _2464;
    }
    int _2466 = _2396;
    float _2468 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1604);
    int _2470 = abs(_2074);
    float _2472 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1692);
    int _2474 = abs(_2466);
    float _2476 = -_2468;
    float _2478 = _2476 + 1.0;
    float _2480 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1452);
    int _2482 = abs(_2124);
    float _2484 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1464);
    int _2486 = ~_2470;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    out.m_70.x = _2236;
    out.m_70.y = _2268;
    out.m_70.z = _2270;
    int _2492 = ~_2474;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    int _2498 = abs(_2364);
    int _2500 = _2490 * as_type<int>(_2226);
    int _2502 = ~_2482;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _2496 * as_type<int>(_2320);
    int _2510 = abs(_2134);
    bool _2512 = _2016 != 3;
    int _2514 = _2506 * as_type<int>(_2218);
    int _2516 = _2514 + _2500;
    int _2518 = ~_2498;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    int _2524 = ~_2510;
    int _2526 = _2524 + 1;
    int _2528 = _2526 + 1;
    bool _2530 = !_2512;
    int _2532 = _2530 ? 0 : (-1);
    int _2534 = _2522 * as_type<int>(_2312);
    int _2536 = _2534 + _2508;
    bool _2538 = _2294 != 3;
    int _2540 = _2528 * as_type<int>(_2252);
    int _2542 = _2540 + _2516;
    if (_2406)
    {
        int _2544 = ~_2356;
        int _2546 = _2544 + 1;
        _2412 = _2546;
    }
    int _2548 = _2412;
    bool _2550 = !_1128;
    int _2552 = _2550 ? 0 : 1;
    bool _2554 = !_2538;
    int _2556 = _2554 ? 0 : (-1);
    int _2558 = abs(_2548);
    int _2560 = abs(_2532);
    int _2562 = abs(_2552);
    int _2564 = abs(_2556);
    int _2566 = ~_2558;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    int _2572 = _2570 * as_type<int>(_2346);
    int _2574 = _2572 + _2536;
    bool _2576 = !_1164;
    int _2578 = _2576 ? 0 : 1;
    int _2580 = ~_2564;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    int _2586 = abs(_2578);
    int _2588 = ~_2560;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    int _2594 = _2584 * as_type<int>(_2354);
    int _2596 = _2594 + _2574;
    int _2598 = ~_2586;
    int _2600 = _2598 + 1;
    int _2602 = _2600 + 1;
    bool _2604 = !_1744;
    int _2606 = _2604 ? _2368 : (-1);
    int _2608 = _2592 * as_type<int>(_2260);
    int _2610 = _2608 + _2542;
    float _2612 = fma(_2180, _2180, 1.0);
    int _2614 = _2596 * _2602;
    float _2616 = -_2472;
    float _2618 = _2616 + 1.0;
    int _2620 = ~_2562;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = rsqrt(_2612);
    int _2628 = _2606 * _2586;
    int _2630 = _2628 + _2614;
    float _2632 = -_2478;
    float _2634 = fma(_733, _2632, _1392);
    float _2636 = -_2300;
    float _2638 = _2636 + _2450;
    float _2640 = fma(_827, _2618, _1764);
    float _2642 = -_2168;
    float _2644 = _2642 + _2452;
    bool _2646 = !_1558;
    int _2648 = _2646 ? _2360 : (-1);
    float _2650 = _2638 * _2638;
    int _2652 = _2610 * _2624;
    float _2654 = -_2116;
    float _2656 = _2654 + _2454;
    float _2658 = -_2480;
    float _2660 = _2658 + 1.0;
    float _2662 = fma(_2644, _2644, _2650);
    int _2664 = _2648 * _2562;
    int _2666 = _2664 + _2652;
    float _2668 = -_2484;
    float _2670 = _2668 + 1.0;
    float _2672 = -_2660;
    float _2674 = fma(_851, _2672, _1576);
    float _2676 = fma(_2656, _2656, _2662);
    float _2678 = _2180 * _2626;
    float _2680 = fma(_1512, _2670, _1582);
    float _2682 = _2112 + _2286;
    float _2684 = sqrt(_2676);
    float _2686 = -_2112;
    float _2688 = _2678 * _2686;
    float _2690 = -_2136;
    float _2692 = _2678 * _2690;
    float _2694 = -_2162;
    float _2696 = _2678 * _2694;
    float _2698 = _2136 + _2292;
    float _2700 = fma(_2626, _2002, _2688);
    float _2702 = fma(_2626, _2014, _2692);
    float _2704 = fma(_2626, _2020, _2696);
    float _2706 = float(_2666);
    float _2708 = _2162 + _2298;
    float _2710 = float(_2630);
    out.m_72.x = _2634;
    out.m_72.y = _2640;
    out.m_72.z = _2674;
    out.m_72.w = _2680;
    out.m_74.x = _2700;
    out.m_74.y = _2702;
    out.m_74.z = _2704;
    bool _2712 = _2684 > 0.0;
    out.m_76.x = _2706;
    out.m_76.y = _2710;
    out.m_78.x = _2682;
    out.m_78.y = _2698;
    out.m_78.z = _2708;
    bool _2714 = !_2712;
    if (!_2714)
    {
        bool _2716 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2718 = _2236;
        if (_2716)
        {
            float _2720 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2718 = _2720;
        }
        float _2722 = _2718;
        float _2724 = _2722;
        if (_2716)
        {
            float _2726 = _655 * _2722;
            _2372 = _2726;
        }
        float _2728 = _2372;
        float _2730 = _2728;
        if (_2716)
        {
            float _2732 = _657 * _2722;
            _2374 = _2732;
        }
        float _2734 = _2374;
        float _2736 = _2734;
        if (_2716)
        {
            float _2738 = _659 * _2722;
            _2724 = _2738;
        }
        float _2740 = _2724;
        float _2742 = _2740;
        float _2744 = _2740;
        if (!_2716)
        {
            bool _2746 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan(1.0);
            bool _2754 = _2750 || _2752;
            float _2756 = _117 + 1.0;
            float _2758 = _2756;
            if (!_2754)
            {
                float _2760 = _2756 * _2756;
                float _2762 = _2760 * 0.5;
                _2742 = _2762;
            }
            float _2764 = _2742;
            float _2766 = _2764;
            if (!_2754)
            {
                float _2768 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2766 = _2768;
            }
            float _2770 = _2766;
            bool _2772 = !_2754;
            float _2774 = _2770;
            if (!_2772)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = _2778 * _2756;
                float _2788 = 1.0 / _2782;
                float _2790 = _2784 * 0.693147182464599609375;
                float _2792 = exp2(_2786);
                float _2794 = 1.0 / _2790;
                float _2796 = _2792 + (-1.0);
                float _2798 = -_2796;
                float _2800 = fma(_2798, _2794, _2756);
                float _2802 = _2800 * _2788;
                float _2804 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2804;
            }
            float _2806 = _2774;
            float _2808 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2810 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2812 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2814 = _2808 * _383;
            float _2816 = _2808 * _331;
            float _2818 = _2808 * _409;
            float _2820 = fma(_2810, _375, _2814);
            float _2822 = fma(_2810, _327, _2816);
            float _2824 = fma(_2812, _387, _2820);
            bool _2826 = !_2754;
            if (!_2826)
            {
                float _2828 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2830 = log2(_2828);
                float _2832 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2834 = 1.0 + _2832;
                float _2836 = 1.0 / _2834;
                float _2838 = _2830 * _2756;
                float _2840 = exp2(_2838);
                float _2842 = -_2840;
                float _2844 = _2842 + 1.0;
                float _2846 = _2844 * _2836;
                _2758 = _2846;
            }
            float _2848 = _2758;
            float _2850 = fma(_2812, _345, _2822);
            float _2852 = fma(_2810, _405, _2818);
            float _2854 = fma(_2848, _259, _2824);
            float _2856 = fma(_2848, _257, _2850);
            float _2858 = fma(_2812, _413, _2852);
            float _2860 = -_615;
            float _2862 = _2860 + _2854;
            float _2864 = -_621;
            float _2866 = _2864 + _2856;
            float _2868 = fma(_2848, _261, _2858);
            float _2870 = _2862 * _175;
            float _2872 = _2862 * _169;
            float _2874 = _2862 * _181;
            float _2876 = -_627;
            float _2878 = _2876 + _2868;
            float _2880 = fma(_2866, _173, _2870);
            float _2882 = fma(_2866, _167, _2872);
            float _2884 = fma(_2866, _179, _2874);
            float _2886 = fma(_2878, _177, _2880);
            float _2888 = fma(_2878, _171, _2882);
            float _2890 = fma(_2878, _183, _2884);
            _665 = _2888;
            _667 = _2886;
            _669 = _2890;
            _2730 = _2886;
            _2736 = _2888;
            _2744 = _2890;
            _417 = _2868;
        }
        float _2892 = _665;
        float _2894 = _667;
        float _2896 = _669;
        float _2898 = _2730;
        float _2900 = _2736;
        float _2902 = _2744;
        float _2904 = _417;
        float _2906 = _2892 * _2892;
        float _2908 = rsqrt(_2676);
        float _2910 = fma(_2894, _2894, _2906);
        float _2912 = fma(_2896, _2896, _2910);
        float _2914 = sqrt(_2912);
        float _2916 = _2644 * _2908;
        float _2918 = _2638 * _2908;
        float _2920 = _2656 * _2908;
        bool _2922 = _2914 > 0.0;
        bool _2924 = !_2922;
        _421 = _2914;
        _423 = _2904;
        _2376 = _2900;
        if (!_2924)
        {
            float _2926 = rsqrt(_2912);
            float _2928 = _2926 * _2892;
            float _2930 = _2926 * _2894;
            float _2932 = _2926 * _2896;
            float _2934 = _2918 * _2928;
            float _2936 = fma(_2916, _2930, _2934);
            float _2938 = fma(_2920, _2932, _2936);
            float _2940 = _2938 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2942 = fma(_2898, _2940, _2452);
            float _2944 = fma(_2900, _2940, _2450);
            float _2946 = fma(_2902, _2940, _2454);
            _2456 = _2942;
            _2458 = _2944;
            _2460 = _2946;
            _419 = _2936;
            _421 = _2940;
            _423 = _2934;
        }
    }
    float _2948 = _2456;
    float _2950 = _2458;
    float _2952 = _2460;
    float _2954 = _419;
    float _2956 = _421;
    float _2958 = _423;
    float _2960 = _2376;
    bool _2962 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2964 = isnan(0.5);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2970 = _2966 || _2968;
    float _2972 = _2956;
    float _2974 = _2954;
    float _2976 = _2958;
    float _2978 = _2960;
    if (_2970)
    {
        _2972 = _2948;
    }
    float _2980 = _2972;
    float _2982 = _2980;
    if (_2970)
    {
        _2974 = _2950;
    }
    float _2984 = _2974;
    float _2986 = _2984;
    if (_2970)
    {
        _2976 = _2952;
    }
    float _2988 = _2976;
    float _2990 = _2988;
    if (!_2970)
    {
        float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2994 = _2300 + _2992;
        float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2998 = _2168 + _2996;
        float _3000 = -_2168;
        float _3002 = _3000 + _2948;
        float _3004 = -_2300;
        float _3006 = _3004 + _2950;
        float _3008 = _2994 * _2994;
        float _3010 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3012 = _2116 + _3010;
        float _3014 = -_2116;
        float _3016 = _3014 + _2952;
        float _3018 = fma(_2998, _2998, _3008);
        float _3020 = fma(_3012, _3012, _3018);
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3024 = sqrt(_3020);
        float _3026 = precise::min(_3024, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3028 = _3026 * _3022;
        float _3030 = fma(_3002, _3028, _2168);
        float _3032 = fma(_3006, _3028, _2300);
        float _3034 = fma(_3016, _3028, _2116);
        _2986 = _3032;
        _2982 = _3030;
        _2990 = _3034;
    }
    float _3036 = _2986;
    float _3038 = _2982;
    float _3040 = _2990;
    float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3044 = _3036 + _3042;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3048 = _3038 + _3046;
    float _3050 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3052 = _3040 + _3050;
    float _3054 = _3044 * _3044;
    float _3056 = fma(_3048, _3048, _3054);
    float _3058 = fma(_3052, _3052, _3056);
    float _3060 = rsqrt(_3058);
    float _3062 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3064 = _3048 * _3062;
    float _3066 = _3052 * _3062;
    float _3068 = _3064 * _3064;
    float _3070 = _3066 * _3066;
    float _3072 = _3068 + _3070;
    float _3074 = sqrt(_3072);
    bool _3076 = _3074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3080 = _3074 + _3078;
    float _3082 = _3060;
    float _3084 = _3080;
    float _3086 = _3044;
    float _3088 = _3062;
    if (_3076)
    {
        float _3090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3082 = _3090;
    }
    float _3092 = _3082;
    float _3094 = _3092;
    if (_3076)
    {
        float _3096 = _3080 * _3092;
        _3084 = _3096;
    }
    float _3098 = _3084;
    if (_3076)
    {
        float _3100 = rsqrt(_3072);
        _3094 = _3100;
    }
    float _3102 = _3094;
    float _3104 = _3102;
    if (_3076)
    {
        float _3106 = _3098 * 0.15915493667125701904296875;
        _225 = _3106;
    }
    float _3108 = _225;
    float _3110 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3112 = _3052;
    float _3114 = _3108;
    if (_3076)
    {
        float _3116 = _3108 * 6.283185482025146484375;
        float _3118 = sin(_3116);
        _3112 = _3118;
    }
    float _3120 = _3112;
    float _3122 = precise::max(0.0, _3110);
    float _3124 = _615;
    if (_3076)
    {
        float _3126 = _3108 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        _3124 = _3128;
    }
    float _3130 = _3124;
    float _3132 = -_3062;
    float _3134 = -_3122;
    float _3136 = fma(_3044, _3132, _3134);
    if (_3076)
    {
        float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3086 = _3138;
    }
    float _3140 = _3086;
    float _3142 = sqrt(_3058);
    float _3144 = _3120;
    float _3146 = _3140;
    if (_3076)
    {
        float _3148 = fma(_3120, _3140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3144 = _3148;
    }
    float _3150 = _3144;
    float _3152 = _3150;
    if (!_3076)
    {
        _3114 = _3068;
    }
    float _3154 = _3114;
    float _3156 = _3154;
    if (_3076)
    {
        float _3158 = _3102 * _3150;
        _2978 = _3158;
    }
    float _3160 = _2978;
    if (!_3076)
    {
        _3104 = _3064;
    }
    float _3162 = _3104;
    float _3164 = _3162;
    float _3166 = _3130;
    if (_3076)
    {
        float _3168 = _3130 + (-1.0);
        _3146 = _3168;
    }
    float _3170 = _3146;
    float _3172 = _3170;
    if (_3076)
    {
        float _3174 = _3064 * _3160;
        _3164 = _3174;
    }
    float _3176 = _3164;
    if (!_3076)
    {
        _3152 = _3136;
    }
    float _3178 = _3152;
    float _3180 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3182 = _3178;
    if (_3076)
    {
        float _3184 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3088 = _3184;
    }
    float _3186 = _3088;
    if (!_3076)
    {
        _3172 = _3066;
    }
    float _3188 = _3172;
    float _3190 = _3188;
    if (_3076)
    {
        float _3192 = _3066 * _3160;
        _3190 = _3192;
    }
    float _3194 = _3190;
    if (_3076)
    {
        float _3196 = _3176 * _3176;
        _3156 = _3196;
    }
    float _3198 = _3156;
    if (_3076)
    {
        float _3200 = fma(_3136, _3130, _3186);
        _3182 = _3200;
    }
    float _3202 = _3182;
    if (!_3076)
    {
        _3166 = _3070;
    }
    float _3204 = _3166;
    float _3206 = _3204;
    if (_3076)
    {
        float _3208 = _3194 * _3194;
        _3206 = _3208;
    }
    float _3210 = _3206;
    float _3212 = fma(_3202, _3202, _3198);
    float _3214 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3216 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3218 = _3212 + _3210;
    float _3220 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3180);
    float _3222 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3226 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3224);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = rsqrt(_3218);
    float _3232 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3220);
    float _3234 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3236 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3222);
    float _3238 = -_3228;
    float _3240 = _3238 + 1.0;
    float _3242 = _3232 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3244 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3234);
    float _3246 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3236);
    float _3248 = abs(_3240);
    float _3250 = log2(_3248);
    float _3252 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3254 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3244);
    float _3256 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3258 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3216);
    float _3260 = -_3252;
    float _3262 = fma(_3260, _3214, 1.0);
    float _3264 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3268 = _3230 * _3176;
    float _3270 = _3230 * _3202;
    float _3272 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3258);
    float _3274 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3266);
    float _3276 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3278 = _3230 * _3194;
    float _3280 = _3272 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3282 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3274);
    float _3284 = -_3276;
    float _3286 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3284);
    float _3288 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3290 = log2(_3262);
    float _3292 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3282);
    float _3294 = -_3278;
    float _3296 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3286);
    float _3298 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3300 = fma(_3296, -0.5, 0.5);
    float _3302 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3298);
    float _3304 = exp2(_3288);
    float _3306 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3308 = fma(_3296, 0.5, 0.5);
    float _3310 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3302);
    float _3312 = _3270 + 1.0;
    float _3314 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3306);
    float _3316 = fma(_3308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3318 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3310);
    float _3320 = 1.0 / _3292;
    float _3322 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3314);
    float _3324 = fma(_3308, _3316, -0.212114393711090087890625);
    float _3326 = _3290 * 0.693147182464599609375;
    float _3328 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3322);
    float _3330 = fma(_3308, _3324, 1.570728778839111328125);
    float _3332 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3334 = sqrt(_3300);
    float _3336 = -_3270;
    float _3338 = fma(_3304, _3312, _3336);
    float _3340 = fma(_3338, 0.5, 0.5);
    float _3342 = _3318 * _3320;
    float _3344 = _3328 * _3320;
    float _3346 = fma(_3342, 0.5, 0.5);
    float _3348 = fma(_3344, -0.5, 0.5);
    float _3350 = _3334 * 0.636619746685028076171875;
    float3 _8630 = float3(_3346, _3348, _3332);
    float _3352 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8630, float3(0.0), isnan(_8630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8630, float3(0.0), isnan(_8630)), level(0.0)).x;
    float3 _8641 = float3(_3346, _3348, _3332);
    float4 _3355 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).xyzw;
    float _3357 = _3355.x;
    float _3359 = _3355.y;
    float _3361 = _3355.z;
    float _3363 = _3355.w;
    float _3365 = -_3330;
    float _3367 = fma(_3350, _3365, 1.0);
    float2 _8663 = float2(_3367, _3340);
    float3 _3371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8663, float2(0.0), isnan(_8663)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8663, float2(0.0), isnan(_8663)), level(0.0)).xyz;
    float _3373 = _3371.x;
    float _3375 = _3371.y;
    float _3377 = _3371.z;
    float _3379 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3381 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3383 = _3292 * 0.5;
    out.m_80.x = _2168;
    out.m_80.y = _2300;
    out.m_80.z = _2116;
    bool _3385 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3387 = isnan(_3142);
    bool _3389 = _3385 || _3387;
    bool _3391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3393 = _3389 || _3391;
    float _3395 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3381);
    float _3397 = exp2(_3379);
    out.m_82.x = _3038;
    out.m_82.y = _3036;
    out.m_82.z = _3040;
    float _3399 = _3318 + _3292;
    float _3401 = fma(_3242, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3395);
    float _3403 = fma(_3328, -0.5, _3383);
    float _3405 = _3399 * 0.5;
    float _3407 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3401);
    float _3409 = _3407 + _3292;
    out.gl_Position.x = _3318;
    out.gl_Position.y = _3328;
    out.gl_Position.z = _3407;
    out.gl_Position.w = _3292;
    float _3411 = _3409 * 0.5;
    float _3413 = -_3397;
    float _3415 = _3413 + 1.0;
    float _3417 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3405;
    out.m_84.y = _3403;
    out.m_84.z = _3411;
    out.m_84.w = _3292;
    float _3419 = -_3417;
    float _3421 = _3419 + 1.0;
    float _3423 = _3292;
    float _3425 = _3407;
    float _3427 = _3328;
    float _3429 = _3318;
    float _3431 = _3403;
    float _3433 = _3405;
    if (!_3393)
    {
        _3423 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3435 = _3423;
    float _3437 = _3435;
    float _3439 = _3435;
    if (!_3393)
    {
        _3425 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3441 = _3425;
    float _3443 = _3441;
    float _3445 = _3441;
    if (!_3393)
    {
        _3427 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3447 = _3427;
    float _3449 = _3447;
    float _3451 = _3447;
    if (!_3393)
    {
        _3429 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3453 = _3429;
    float _3455 = _3453;
    float _3457 = _3453;
    if (!_3393)
    {
        _3431 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3459 = _3431;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3393)
    {
        _3433 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3465 = _3433;
    float _3467 = _3417 * _3352;
    float _3469 = _3363 * _3467;
    float _3471 = _3377 * _3467;
    float _3473 = fma(_3373, _3469, _3357);
    float _3475 = fma(_3375, _3469, _3359);
    float _3477 = _3363 * _3421;
    float _3479 = fma(_3363, _3471, _3361);
    out.m_86.x = _3473;
    out.m_86.y = _3475;
    out.m_86.z = _3479;
    out.m_86.w = _3477;
    bool _3481 = !_3393;
    float _3483 = _3465;
    float _3485 = _3465;
    if (!_3481)
    {
        bool _3487 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3489 = isnan(_3142);
        bool _3491 = _3487 || _3489;
        bool _3493 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3495 = _3491 || _3493;
        if (!_3495)
        {
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3499 = _3142 + _3497;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3503 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3501;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3509 = 1.0 / _3503;
            float _3511 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3513 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3517 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3521 = _3519 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3527 = _3499 * _3509;
            float _3529 = precise::clamp(_3527, 0.0, 1.0);
            float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3535 = fma(_3529, _3507, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3537 = fma(_3529, _3533, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3539 = fma(_3529, _3513, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3541 = fma(_3529, _3517, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3543 = fma(_3529, _3521, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3545 = fma(_3529, _3525, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3485 = _3539;
            _3451 = _3543;
            _3463 = _3535;
            _3445 = _3541;
            _3439 = _3537;
            _3457 = _3545;
            _3547 = true;
        }
        else
        {
            bool _3549 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3551 = isnan(_3142);
            bool _3553 = _3549 || _3551;
            bool _3555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3557 = _3553 || _3555;
            if (!_3557)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3559 = _3461;
            _3463 = _3559;
            if (!_3557)
            {
                _3483 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3561 = _3483;
            _3485 = _3561;
            if (!_3557)
            {
                _3437 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3563 = _3437;
            _3439 = _3563;
            if (!_3557)
            {
                _3443 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3565 = _3443;
            _3445 = _3565;
            if (!_3557)
            {
                _3449 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3567 = _3449;
            _3451 = _3567;
            if (!_3557)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3569 = _3455;
            bool _3571 = !_3557;
            _3457 = _3569;
            if (!_3571)
            {
                bool _3573 = _3142 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3575 = isnan(_3142);
                bool _3577 = _3573 || _3575;
                bool _3579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3581 = _3577 || _3579;
                if (!_3581)
                {
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3585 = _3142 + _3583;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3589 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3587;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3595 = 1.0 / _3589;
                    float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3613 = _3585 * _3595;
                    float _3615 = precise::clamp(_3613, 0.0, 1.0);
                    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3621 = fma(_3615, _3593, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3623 = fma(_3615, _3619, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3625 = fma(_3615, _3599, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3627 = fma(_3615, _3603, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3629 = fma(_3615, _3607, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3631 = fma(_3615, _3611, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3485 = _3625;
                    _3451 = _3629;
                    _3463 = _3621;
                    _3445 = _3627;
                    _3439 = _3623;
                    _3457 = _3631;
                    _3547 = true;
                }
                else
                {
                    _3485 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3451 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3445 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3439 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3547 = false;
    float _3633 = _3485;
    float _3635 = _3451;
    float _3637 = _3463;
    float _3639 = _3445;
    float _3641 = _3439;
    float _3643 = _3457;
    float _3645 = fma(_2698, -0.5, 0.5);
    float _3647 = precise::clamp(_3645, 0.0, 1.0);
    float _3649 = -_3633;
    float _3651 = _3649 + _3635;
    float _3653 = -_3637;
    float _3655 = _3653 + _3639;
    float _3657 = -_3641;
    float _3659 = _3657 + _3643;
    bool _3661 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3663 = fma(_3647, _3651, _3633);
    float _3665 = fma(_3647, _3655, _3637);
    float _3667 = fma(_3647, _3659, _3641);
    float _3669 = _3663 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3671 = fma(_3665, 0.298911988735198974609375, _3669);
    float _3673 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3675 = fma(_3667, 0.114477999508380889892578125, _3671);
    out.m_88.w = _3673;
    float _3677 = -_3675;
    float _3679 = _3665 + _3677;
    float _3681 = -_3675;
    float _3683 = _3663 + _3681;
    float _3685 = -_3675;
    float _3687 = _3667 + _3685;
    out.m_90.x = 0.0;
    float _3689 = fma(_3679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    float _3691 = fma(_3683, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    float _3693 = fma(_3687, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3675);
    out.m_92.x = _3689;
    out.m_92.y = _3691;
    out.m_92.z = _3693;
    if (!_3661)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3695 = -_3036;
    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3699 = -_3038;
    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3703 = -_3040;
    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3707 = _3697 * _3697;
    float _3709 = fma(_3701, _3701, _3707);
    float _3711 = fma(_3705, _3705, _3709);
    float _3713 = sqrt(_3711);
    float _3715 = rsqrt(_3711);
    float _3717 = -_3713;
    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3721 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3701 * _3715;
    float _3727 = _3697 * _3715;
    float _3729 = abs(_3723);
    float _3731 = log2(_3729);
    float _3733 = _3705 * _3715;
    float _3735 = _3725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3737 = _2698 * _3727;
    float _3739 = -_3727;
    float _3741 = -_3735;
    float _3743 = fma(_3739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3741);
    float _3745 = fma(_2682, _3725, _3737);
    float _3747 = -_3733;
    float _3749 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3743);
    float _3751 = fma(_2708, _3733, _3745);
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3757 = _3749 + _3755;
    float _3759 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3761 = _3757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3763 = precise::clamp(_3761, 0.0, 1.0);
    float _3765 = exp2(_3759);
    float _3767 = _3765 * _3763;
    float _3769 = _3753 * _3767;
    float _3771 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3773 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3775 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3771;
    out.m_90.y = _3773;
    out.m_90.z = _3775;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

