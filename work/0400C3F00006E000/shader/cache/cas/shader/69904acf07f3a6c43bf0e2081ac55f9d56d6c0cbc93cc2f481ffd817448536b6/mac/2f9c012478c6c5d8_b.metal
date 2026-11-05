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
    float4 m_74 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_64 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2130 = false;
    bool _307 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _2429 = as_type<float>(_123);
        out.gl_Position.z = _2429;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_161);
        out.gl_Position.z = _2499;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_56.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    float _287 = _275;
    float _305;
    if (!_285)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_107);
        float _311 = 1.0 / _309;
        float _313 = _141 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = in.m_56.z;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _321 = _319 != 0;
    float _323 = in.m_56.x;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _327 = _325 != 0;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _335 = _333 != 0;
    float _337 = in.m_46.x;
    float _339 = in.m_46.y;
    float _341 = in.m_46.z;
    float _343 = in.m_58.x;
    float _345 = in.m_58.y;
    float _347 = in.m_58.z;
    float _349 = in.m_58.w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (!_321)
    {
        float _355 = in.m_56.y;
        _353 = _355;
    }
    float _357 = _353;
    float _359 = in.m_60.x;
    float _361 = in.m_60.y;
    float _363 = in.m_60.z;
    float _365 = in.m_60.w;
    float _367 = _317 * 2.0;
    float _369 = in.m_62.x;
    float _371 = in.m_62.y;
    float _373 = in.m_62.z;
    float _375 = in.m_62.w;
    float _377 = _323 * 2.0;
    float _379 = floor(_367);
    float _381 = _339 * _345;
    float _383 = floor(_377);
    float _385 = _323 + _317;
    if (!_321)
    {
        _287 = _357;
    }
    float _387 = _287;
    float _389 = fma(_337, _343, _381);
    float _391 = _385 + (-1.0);
    float _393 = _339 * _361;
    bool _395 = _379 >= 0.0;
    bool _397 = isnan(_379);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = _387;
    float _407 = _357;
    float _409 = _391;
    float _411 = _363;
    if (_321)
    {
        float _413 = in.m_56.x;
        float _415 = in.m_56.y;
        _405 = _413;
        _407 = _415;
    }
    float _417 = _405;
    float _419 = _407;
    float _421 = fma(_341, _347, _389);
    float _423 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _425 = _403 ? 0 : 1;
    float _427 = _339 * _371;
    float _429 = fma(_337, _359, _393);
    bool _431 = _383 > 0.0;
    float _433 = fma(_337, _369, _427);
    bool _435 = _383 >= 0.0;
    bool _437 = isnan(_383);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _447 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _449 = log2(_447);
    if (!_321)
    {
        _409 = _317;
    }
    float _451 = _409;
    float _453 = fma(_341, _363, _429);
    bool _455 = _379 > 0.0;
    float _457 = fma(_341, _373, _433);
    float _459 = _421 + _349;
    int _461 = ~_425;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    float _467 = _457 + _375;
    float _469 = _453 + _365;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _473 = -_467;
    float _475 = _473 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _477 = _451;
    int _479 = _465;
    if (_321)
    {
        _477 = _419;
    }
    float _481 = _477;
    float _483 = _417 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _485 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[83].z, _351);
    float _487 = _449 * _141;
    float _489 = _317 + _419;
    float _491 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[83].w, _445);
    float _493 = _481;
    if (!_321)
    {
        _493 = _317;
    }
    float _495 = _493;
    float _497 = -_471;
    float _499 = fma(_483, 2.0, _497);
    float _501 = _495;
    if (_321)
    {
        _501 = _419;
    }
    float _503 = _501;
    float _505 = exp2(_487);
    float _507 = _419 * 2.0;
    float _509 = _503 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _511 = _489 + (-1.0);
    if (!_455)
    {
        int _513 = ~_425;
        int _515 = _513 + 1;
        _479 = _515;
    }
    int _517 = _479;
    float _519 = _323 + _419;
    int _521 = _443 ? 0 : 1;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _527 = _519 + (-1.0);
    int _529 = ~_521;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    float _535 = fma(_509, -2.0, _525);
    int _537 = _533;
    if (!_431)
    {
        int _539 = ~_521;
        int _541 = _539 + 1;
        _537 = _541;
    }
    int _543 = _537;
    float _545 = floor(_507);
    bool _547 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _549 = isnan(1.0);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _555 = _551 || _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _559 = 1.0 + _557;
    bool _561 = !_327;
    int _563 = _561 ? 0 : 1;
    float _565 = -_505;
    float _567 = _565 + 1.0;
    float _569 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _485);
    int _571 = abs(_563);
    float _573 = 1.0 / _559;
    bool _575 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _583 = _579 || _581;
    float _585 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _587 = float(_571);
    float _589 = in.m_64.x;
    float _591 = in.m_64.y;
    float _593 = in.m_64.z;
    float _595 = float(_517);
    float _597 = -_141;
    float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[81].x, _499);
    bool _601 = !_331;
    int _603 = _601 ? 0 : 1;
    bool _605 = _545 > 0.0;
    float _607 = _587 * _595;
    float _609 = _583 ? _567 : 0.0;
    float _611 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _491);
    bool _613 = _545 >= 0.0;
    bool _615 = isnan(_545);
    bool _617 = _613 || _615;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    float _623 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _535);
    int _625 = abs(_603);
    if (_555)
    {
        float _627 = _609 * _573;
        _143 = _627;
    }
    float _629 = _143;
    float _631 = -_469;
    float _633 = _631 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _635 = _475 * _475;
    float _637 = -_459;
    float _639 = _637 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _641 = _607 * (-2.0);
    float _643 = fma(_633, _633, _635);
    float _645 = float(_543);
    float _647 = _323 + (-0.5);
    float _649 = float(_625);
    float _651 = fma(_639, _639, _643);
    int _653 = _621 ? 0 : 1;
    float _655 = fma(_641, _589, _589);
    float _657 = fma(_585, _641, _585);
    float _659 = _649 * _645;
    float _661 = rsqrt(_651);
    float _663 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[196].x, _655);
    bool _665 = !_335;
    int _667 = _665 ? 0 : 1;
    float _669 = _659 * (-2.0);
    int _671 = ~_653;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_657, _629, _663);
    int _679 = abs(_667);
    float _681 = _419 + (-0.5);
    int _683 = _675;
    if (!_605)
    {
        int _685 = ~_653;
        int _687 = _685 + 1;
        _683 = _687;
    }
    int _689 = _683;
    float _691 = _677 * 0.15915493667125701904296875;
    float _693 = fma(_669, _591, _591);
    float _695 = float(_689);
    float _697 = fma(_523, _669, _523);
    float _699 = float(_679);
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _703 = _633 * _661;
    float _705 = _475 * _661;
    float _707 = _639 * _661;
    float _709 = _699 * _695;
    float _711 = fma(_697, _629, _701);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _715 = _703 * _713;
    float _717 = in.m_66.x;
    float _719 = in.m_66.y;
    float _721 = _709 * (-2.0);
    float _723 = _711 * 0.15915493667125701904296875;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _727 = _707 * _725;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _731 = -_715;
    float _733 = fma(_707, _729, _731);
    float _735 = fma(_423, _721, _423);
    float _737 = fma(_721, _593, _593);
    float _739 = _317 + (-0.5);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _743 = -_727;
    float _745 = fma(_705, _741, _743);
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _749 = _705 * _747;
    float _751 = _733 * _733;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[196].z, _737);
    float _755 = _691 * 6.283185482025146484375;
    float _757 = cos(_755);
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _761 = -_749;
    float _763 = fma(_703, _759, _761);
    float _765 = fma(_745, _745, _751);
    float _767 = fma(_735, _629, _753);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _777 = _773 || _775;
    float _779 = fma(_763, _763, _765);
    float _781 = _767 * 0.15915493667125701904296875;
    float _783 = _723 * 6.283185482025146484375;
    float _785 = sin(_783);
    float _787 = _281 * _717;
    float _789 = _283 * _719;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _795 = _723 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _801 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _799 * _791;
    float _805 = _801 * _793;
    float _807 = _691 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _757 * _785;
    float _813 = _781 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _757 * _797;
    float _819 = rsqrt(_779);
    float _821 = _809 * _785;
    float _823 = _809 * _797;
    float _825 = _781 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = _757 * _815;
    float _831 = _809 * _815;
    float _833 = _797 * _815;
    float _835 = _785 * _815;
    float _837 = _829 * _803;
    float _839 = _745 * _819;
    float _841 = _733 * _819;
    float _843 = _763 * _819;
    float _845 = _705 * _839;
    float _847 = _707 * _841;
    float _849 = fma(_827, _817, _821);
    float _851 = -_811;
    float _853 = fma(_827, _823, _851);
    float _855 = -_823;
    float _857 = fma(_827, _811, _855);
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = -_803;
    float _863 = _827 * _861;
    float _865 = fma(_849, _805, _837);
    float _867 = _831 * _803;
    float _869 = -_845;
    float _871 = fma(_703, _841, _869);
    float _873 = fma(_833, _805, _863);
    float _875 = fma(_857, _859, _865);
    float _877 = fma(_827, _821, _817);
    float _879 = fma(_853, _805, _867);
    float _881 = -_847;
    float _883 = fma(_705, _843, _881);
    float _885 = fma(_835, _859, _873);
    float _887 = _871 * _875;
    float _889 = fma(_877, _859, _879);
    float _891 = _883 * _875;
    float _893 = fma(_843, _885, _887);
    float _895 = fma(_839, _885, _891);
    float _897 = fma(_707, _889, _893);
    float _899 = fma(_703, _889, _895);
    float _901 = _459 + _897;
    float _903 = _469 + _899;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _907 = _901 + _905;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _911 = _903 + _909;
    float _913 = _907 * _907;
    float _915 = fma(_911, _911, _913);
    float _917 = _703 * _843;
    float _919 = sqrt(_915);
    float _921 = -_917;
    float _923 = fma(_707, _839, _921);
    float _925 = _923 * _875;
    float _927 = fma(_841, _885, _925);
    float _929 = fma(_705, _889, _927);
    bool _931 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = _467 + _929;
    float _935 = _691;
    float _937 = _901;
    float _939 = _903;
    float _941 = _919;
    float _943 = _889;
    float _945 = _915;
    if (!_931)
    {
        _935 = _933;
    }
    float _947 = _935;
    bool _949 = !_931;
    float _951 = _947;
    if (!_949)
    {
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _957 = _919 + _955;
        float _959 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _961 = rsqrt(_915);
        float _963 = _957 * _953;
        float _965 = _963 * 0.15915493667125701904296875;
        float _967 = _965 * 6.283185482025146484375;
        float _969 = cos(_967);
        float _971 = _965 * 6.283185482025146484375;
        float _973 = sin(_971);
        float _975 = _969 + (-1.0);
        float _977 = fma(_973, _959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = _961 * _977;
        float _983 = fma(_933, _969, _979);
        float _985 = fma(_911, _981, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _987 = fma(_907, _981, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _937 = _987;
        _939 = _985;
        _951 = _983;
        _941 = _965;
        _943 = _975;
    }
    float _989 = _937;
    float _991 = _939;
    float _993 = _951;
    float _995 = _941;
    float _997 = _943;
    float _999 = _993;
    float _1001 = _991;
    float _1003 = _989;
    float _1005 = _997;
    if (!_777)
    {
        float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1009 = _467 + _1007;
        float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1013 = _469 + _1011;
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1017 = -_459;
        float _1019 = _1017 + _989;
        float _1021 = _1009 * _1009;
        float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1025 = _459 + _1023;
        float _1027 = fma(_1013, _1013, _1021);
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1031 = fma(_1025, _1025, _1027);
        float _1033 = sqrt(_1031);
        float _1035 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1037 = precise::min(_1033, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1039 = _1037 * _1029;
        float _1041 = -_469;
        float _1043 = _1041 + _991;
        float _1045 = _1035 * _1039;
        float _1047 = -_467;
        float _1049 = _1047 + _993;
        float _1051 = fma(_1043, _1045, _469);
        float _1053 = fma(_1049, _1045, _467);
        float _1055 = fma(_1019, _1045, _459);
        _999 = _1053;
        _1001 = _1051;
        _1003 = _1055;
        _1005 = _1045;
    }
    float _1057 = _999;
    float _1059 = _1001;
    float _1061 = _1003;
    float _1063 = _1005;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1067 = _1057 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1071 = _1059 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1075 = _1061 + _1073;
    float _1077 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1079 = _1067 * _1067;
    float _1081 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1077);
    float _1083 = fma(_1071, _1071, _1079);
    float _1085 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1081);
    float _1087 = fma(_1075, _1075, _1083);
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1091 = rsqrt(_1087);
    float _1093 = sqrt(_1087);
    float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1097 = _1071 * _1095;
    float _1099 = _1075 * _1095;
    float _1101 = _1097 * _1097;
    float _1103 = _1099 * _1099;
    float _1105 = _1101 + _1103;
    float _1107 = sqrt(_1105);
    bool _1109 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1113 = _1107 + _1111;
    float _1115 = _995;
    float _1117 = _1105;
    float _1119 = _1113;
    if (_1109)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1115 = _1121;
    }
    float _1123 = _1115;
    if (_1109)
    {
        float _1125 = rsqrt(_1105);
        _1117 = _1125;
    }
    float _1127 = _1117;
    float _1129 = _1127;
    if (_1109)
    {
        float _1131 = _1113 * _1123;
        _1119 = _1131;
    }
    float _1133 = _1119;
    if (_1109)
    {
        float _1135 = _1133 * 0.15915493667125701904296875;
        _945 = _1135;
    }
    float _1137 = _945;
    float _1139 = _1063;
    float _1141 = _1137;
    if (_1109)
    {
        float _1143 = _1137 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        _1139 = _1145;
    }
    float _1147 = _1139;
    float _1149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1151 = precise::max(0.0, _1149);
    float _1153 = _733;
    float _1155 = _1151;
    if (_1109)
    {
        float _1157 = _1137 * 6.283185482025146484375;
        float _1159 = cos(_1157);
        _1153 = _1159;
    }
    float _1161 = _1153;
    float _1163 = -_1095;
    float _1165 = -_1151;
    float _1167 = fma(_1067, _1163, _1165);
    float _1169 = fma(_469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1109)
    {
        float _1173 = _1167 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1155 = _1173;
    }
    float _1175 = _1155;
    float _1177 = _1175;
    if (!_1109)
    {
        _1141 = _1167;
    }
    float _1179 = _1141;
    float _1181 = floor(_1169);
    float _1183 = _1147;
    float _1185 = _1179;
    if (_1109)
    {
        float _1187 = fma(_1147, _1175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1177 = _1187;
    }
    float _1189 = _1177;
    float _1191 = _1189;
    if (!_1109)
    {
        _1183 = _1097;
    }
    float _1193 = _1183;
    float _1195 = _1193;
    float _1197 = _1161;
    if (_1109)
    {
        float _1199 = _1161 + (-1.0);
        _1171 = _1199;
    }
    float _1201 = _1171;
    float _1203 = _1201;
    if (_1109)
    {
        float _1205 = _1127 * _1189;
        _411 = _1205;
    }
    float _1207 = _411;
    if (!_1109)
    {
        _1129 = _1101;
    }
    float _1209 = _1129;
    float _1211 = _1209;
    if (_1109)
    {
        float _1213 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1213;
    }
    float _1215 = _1191;
    if (_1109)
    {
        float _1217 = _1097 * _1207;
        _1195 = _1217;
    }
    float _1219 = _1195;
    if (!_1109)
    {
        _1203 = _1099;
    }
    float _1221 = _1203;
    float _1223 = _1221;
    if (_1109)
    {
        float _1225 = _1099 * _1207;
        _1223 = _1225;
    }
    float _1227 = _1223;
    if (_1109)
    {
        float _1229 = fma(_1167, _1161, _1215);
        _1185 = _1229;
    }
    float _1231 = _1185;
    if (_1109)
    {
        float _1233 = _1219 * _1219;
        _1211 = _1233;
    }
    float _1235 = _1211;
    if (!_1109)
    {
        _1197 = _1103;
    }
    float _1237 = _1197;
    float _1239 = _1237;
    if (_1109)
    {
        float _1241 = _1227 * _1227;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = fma(_1231, _1231, _1235);
    float _1249 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1251 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1245);
    float _1253 = _1247 + _1243;
    float _1255 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1257 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1249);
    float _1259 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1263 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1261);
    float _1265 = precise::clamp(_1263, 0.0, 1.0);
    float _1267 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1255);
    float _1269 = rsqrt(_1253);
    float _1271 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1257);
    float _1273 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1275 = -_1265;
    float _1277 = _1275 + 1.0;
    float _1279 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1267);
    float _1281 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1287 = abs(_1277);
    float _1289 = log2(_1287);
    float _1291 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1283);
    float _1293 = fma(_459, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1297 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1291);
    float _1299 = _1269 * _1219;
    float _1301 = _1269 * _1227;
    float _1303 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1297);
    float _1305 = _1269 * _1231;
    float _1307 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1309 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1311 = 1.0 / _1303;
    float _1313 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1315 = -_1307;
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1315);
    float _1319 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = -_1295;
    float _1323 = fma(_1321, _1309, 1.0);
    float _1325 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1313);
    float _1327 = -_1301;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1317);
    float _1331 = -_1181;
    float _1333 = _1169 + _1331;
    float _1335 = floor(_1293);
    float _1337 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1339 = fma(_1329, -0.5, 0.5);
    float _1341 = fma(_1329, 0.5, 0.5);
    float _1343 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1337);
    float _1345 = exp2(_1319);
    float _1347 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1343);
    float _1349 = log2(_1323);
    float _1351 = -_1335;
    float _1353 = _1293 + _1351;
    float _1355 = _1305 + 1.0;
    float _1357 = fma(_1341, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1359 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1325);
    float _1361 = fma(_1341, _1357, -0.212114393711090087890625);
    float _1363 = sqrt(_1339);
    float _1365 = -_1305;
    float _1367 = fma(_1345, _1355, _1365);
    float _1369 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1371 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1359);
    float _1373 = fma(_1341, _1361, 1.570728778839111328125);
    float _1375 = fma(_1367, 0.5, 0.5);
    float _1377 = _1369 * _1311;
    float _1379 = _1349 * 0.693147182464599609375;
    float _1381 = _1371 * _1311;
    float _1383 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = fma(_1377, 0.5, 0.5);
    float _1387 = _1363 * 0.636619746685028076171875;
    float _1389 = fma(_1381, -0.5, 0.5);
    float _1391 = -_1373;
    float _1393 = fma(_1387, _1391, 1.0);
    float2 _4378 = float2(_1333, _1353);
    float _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4378, float2(0.0), isnan(_4378)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4378, float2(0.0), isnan(_4378)), level(0.0)).x;
    float3 _4389 = float3(_1385, _1389, _1383);
    float _1397 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4389, float3(0.0), isnan(_4389)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4389, float3(0.0), isnan(_4389)), level(0.0)).x;
    float3 _4400 = float3(_1385, _1389, _1383);
    float4 _1400 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4400, float3(0.0), isnan(_4400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4400, float3(0.0), isnan(_4400)), level(0.0)).xyzw;
    float _1402 = _1400.x;
    float _1404 = _1400.y;
    float _1406 = _1400.z;
    float _1408 = _1400.w;
    float2 _4416 = float2(_1393, _1375);
    float3 _1412 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4416, float2(0.0), isnan(_4416)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4416, float2(0.0), isnan(_4416)), level(0.0)).xyz;
    float _1414 = _1412.x;
    float _1416 = _1412.y;
    float _1418 = _1412.z;
    float _1420 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1422 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1426 = _315 + _1424;
    float _1428 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1420);
    float _1430 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1422);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1436 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1428);
    float _1438 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1430);
    float _1440 = in.m_56.w;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1448 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1450 = 1.0 / _1434;
    float _1452 = -_569;
    float _1454 = _1452 + 1.0;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1458 = _1456 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1460 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1462 = isnan(_315);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = -_611;
    float _1474 = _1472 + 1.0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    float _1480 = 1.0 / _1446;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1484 = _1482 != 0;
    float _1486 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1490 = _1488 != 0;
    float _1492 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1496 = _1494 != 0;
    float _1498 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    bool _1500 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1502 = isnan(_315);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = 1.0 / _1444;
    float _1514 = _1448 + _1446;
    float _1516 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1498);
    bool _1518 = _1440 > 0.5;
    out.m_68.x = _1071;
    out.m_68.y = _1067;
    out.m_68.z = _1075;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1520;
    float _1524 = _1514 * _1480;
    float _1526 = _1524 * 0.5;
    float _1528 = 1.0 / _1458;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1534 = _323 > 0.5;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1536);
    float _1540 = -_1510;
    float _1542 = _1540 + 1.0;
    bool _1544 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1546 = isnan(_315);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = _1522 * _1450;
    float _1558 = _1532 * _1512;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1560;
    float _1564 = 1.0 / _1538;
    float _1566 = _1470 * _1542;
    float _1568 = -_1554;
    float _1570 = _1568 + 1.0;
    bool _1572 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1574 = isnan(_315);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = fma(_1558, _1426, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1586 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1588 = isnan(_315);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1594 = _1590 || _1592;
    float _1596 = float(_1594);
    float _1598 = _1562 * _1528;
    float _1600 = -_1470;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1606 = _315 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1612 = _317 > 0.5;
    float _1614 = _1554 * _1602;
    float _1616 = fma(_1556, _1606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1618 = _1582 * _1570;
    float _1620 = -_1582;
    float _1622 = _1620 + 1.0;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1626 = _1564 * _1624;
    float _1628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1632 = _315 + _1630;
    float _1634 = _1596 * _1622;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1642 = _315 + _1640;
    float _1644 = fma(_1598, _1632, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1646 = _1616 * _1634;
    float _1648 = -_1596;
    float _1650 = _1648 + 1.0;
    float _1652 = abs(_1626);
    float _1654 = log2(_1652);
    float _1656 = -_177;
    int _1658 = _1612 ? as_type<int>(_1656) : as_type<int>(_177);
    float _1660 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1646);
    float _1662 = -_181;
    int _1664 = _1518 ? as_type<int>(_1662) : as_type<int>(_181);
    bool _1666 = !_1478;
    float _1668 = _1666 ? _177 : as_type<float>(_1658);
    float _1670 = fma(_1584, _1618, _1660);
    float _1672 = 1.0 / _1610;
    bool _1674 = _419 > 0.5;
    float _1676 = _1668 + 0.5;
    float _1678 = fma(_1644, _1614, _1670);
    float _1680 = -_177;
    int _1682 = _1534 ? as_type<int>(_1680) : as_type<int>(_177);
    bool _1684 = !_1484;
    float _1686 = _1684 ? _181 : as_type<float>(_1664);
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1690 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1692 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1694 = -_181;
    int _1696 = _1674 ? as_type<int>(_1694) : as_type<int>(_181);
    float _1698 = _1686 + (-0.5);
    bool _1700 = !_1490;
    float _1702 = _1700 ? _177 : as_type<float>(_1682);
    float _1704 = fma(_1692, _1676, _599);
    bool _1706 = !_1496;
    float _1708 = _1706 ? _181 : as_type<float>(_1696);
    float _1710 = exp2(_1690);
    float _1712 = _1638 * _1672;
    float _1714 = _1702 + 0.5;
    float _1716 = -_1454;
    float _1718 = fma(_1668, _1716, _1704);
    float _1720 = -_1708;
    float _1722 = _1720 + 0.5;
    float _1724 = fma(_1712, _1642, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1726 = _857 * _883;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1730 = fma(_1724, _1566, _1678);
    float _1732 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1730);
    float _1738 = -_1732;
    float _1740 = -_623;
    float _1742 = fma(_1738, _1698, _1740);
    float _1744 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1748 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1750 = precise::clamp(_1748, 0.0, 1.0);
    float _1752 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1754 = fma(_1686, _1474, _1742);
    float _1756 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1760 = _1744 * _1728;
    float _1762 = fma(_1750, -2.0, 3.0);
    float _1764 = _1750 * _1750;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1768 = _829 * _871;
    float _1770 = _1764 * _1762;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1774 = _1752 * _1746;
    float _1776 = _829 * _883;
    float _1778 = _829 * _923;
    float _1780 = _849 * _923;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1784 = _849 * _883;
    out.m_70.x = _1760;
    out.m_70.y = _1774;
    out.m_70.z = _1718;
    out.m_70.w = _1754;
    float _1786 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _849 * _871;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_72.x = _1786;
    out.m_72.y = _1772;
    out.m_72.z = _1756;
    float _1796 = fma(_833, _843, _1788);
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _857 * _923;
    float _1806 = -_827;
    float _1808 = fma(_1806, _841, _1778);
    bool _1810 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1812 = isnan(0.5);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1818 = _1814 || _1816;
    float _1820 = fma(_833, _841, _1780);
    float _1822 = -_827;
    float _1824 = fma(_1822, _843, _1768);
    float _1826 = fma(_833, _839, _1784);
    float _1828 = -_1770;
    float _1830 = _1828 + 1.0;
    float _1832 = _857 * _871;
    float _1834 = -_827;
    float _1836 = fma(_1834, _839, _1776);
    out.m_74.x = _1798;
    out.m_74.y = _1800;
    out.m_74.z = _1802;
    out.m_74.w = _1758;
    float _1838 = fma(_835, _839, _1726);
    float _1840 = fma(_835, _843, _1832);
    float _1842 = fma(_853, _705, _1820);
    float _1844 = fma(_835, _841, _1804);
    float _1846 = in.m_76.x;
    float _1848 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1850 = exp2(_1492);
    float _1852 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1770);
    float _1854 = fma(_831, _705, _1808);
    float _1856 = fma(_877, _703, _1838);
    float _1858 = fma(_877, _705, _1844);
    float _1860 = fma(_831, _707, _1824);
    float _1862 = fma(_853, _703, _1826);
    float _1864 = fma(_831, _703, _1836);
    float _1866 = fma(_853, _707, _1796);
    float _1868 = fma(_877, _707, _1840);
    float _1870 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1872 = _1848 * _1864;
    float _1874 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1516);
    bool _1876 = _1626 <= 8000.0;
    bool _1878 = isnan(_1626);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(8000.0);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = _1848 * _1854;
    float _1890 = fma(_1870, _1862, _1872);
    float _1892 = _1848 * _1860;
    float _1894 = _1874 + _1303;
    float _1896 = _1886 * _1852;
    float _1898 = fma(_1870, _1842, _1888);
    float _1900 = fma(_1870, _1866, _1892);
    float _1902 = _1894 * 0.5;
    float _1904 = _1852;
    float _1906 = _1902;
    float _1908 = _1303;
    float _1910 = _1874;
    float _1912 = _1371;
    float _1914 = _1369;
    if (_1818)
    {
        _1904 = 1.0;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (!_1818)
    {
        float _1920 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1926 = _1922 * 6.283185482025146484375;
        float _1928 = cos(_1926);
        float _1930 = _1924 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1928;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1948;
        float _1952 = _1940 * _1942;
        float _1954 = 1.0 / _1950;
        float _1956 = 1.0 / _1952;
        float _1958 = _1946 * _1956;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1626, _1958, _1960);
        float _1964 = _1962 * _1954;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1918 = _1966;
    }
    float _1968 = _1918;
    float _1970 = _1856 + _1890;
    float _1972 = -_1850;
    float _1974 = _1972 + 1.0;
    float _1976 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1978 = -_1395;
    float _1980 = _1978 + 1.0;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.z = _1902;
    out.m_78.w = _1303;
    float _1984 = _1980 * _1976;
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = _1858 + _1898;
    float _1990 = _1982 * _1397;
    float _1992 = -_1982;
    float _1994 = _1992 + 1.0;
    float _1996 = -_1986;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2000 = _1868 + _1900;
    float _2002 = _1408 * _1990;
    float _2004 = _1418 * _1990;
    float _2006 = _1998 * _1846;
    float _2008 = _1408 * _1994;
    float _2010 = fma(_1414, _2002, _1402);
    float _2012 = fma(_1416, _2002, _1404);
    float _2014 = _2006 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2016 = fma(_1408, _2004, _1406);
    out.m_80.x = _1970;
    out.m_80.y = _1988;
    out.m_80.z = _2000;
    bool _2018 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2020 = isnan(_1093);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2026 = _2022 || _2024;
    float _2028 = _1968 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2014;
    out.m_84.x = _2010;
    out.m_84.y = _2012;
    out.m_84.z = _2016;
    out.m_84.w = _2008;
    out.gl_Position.x = _1369;
    out.gl_Position.y = _1371;
    out.gl_Position.z = _1874;
    out.gl_Position.w = _1303;
    float _2030 = _2006;
    if (!_2026)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2032 = _2030;
    float _2034 = _2032;
    float _2036 = _2032;
    if (!_2026)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2038 = _1906;
    float _2040 = _2038;
    float _2042 = _2038;
    if (!_2026)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2044 = _1908;
    float _2046 = _2044;
    float _2048 = _2044;
    if (!_2026)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2050 = _1910;
    float _2052 = _2050;
    float _2054 = _2050;
    if (!_2026)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2056 = _1912;
    float _2058 = _2056;
    float _2060 = _2056;
    if (!_2026)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2062 = _1914;
    bool _2064 = !_2026;
    float _2066 = _2062;
    float _2068 = _2062;
    if (!_2064)
    {
        bool _2070 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2072 = isnan(_1093);
        bool _2074 = _2070 || _2072;
        bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2078 = _2074 || _2076;
        if (!_2078)
        {
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = _1093 + _2080;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2086 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2084;
            float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2092 = 1.0 / _2086;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2110 = _2082 * _2092;
            float _2112 = precise::clamp(_2110, 0.0, 1.0);
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2118 = fma(_2112, _2090, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2120 = fma(_2112, _2116, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2122 = fma(_2112, _2096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2124 = fma(_2112, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2126 = fma(_2112, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2128 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2042 = _2122;
            _2060 = _2126;
            _2036 = _2118;
            _2054 = _2124;
            _2048 = _2120;
            _2068 = _2128;
            _2130 = true;
        }
        else
        {
            bool _2132 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2134 = isnan(_1093);
            bool _2136 = _2132 || _2134;
            bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2140 = _2136 || _2138;
            if (!_2140)
            {
                _2034 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2142 = _2034;
            _2036 = _2142;
            if (!_2140)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2144 = _2040;
            _2042 = _2144;
            if (!_2140)
            {
                _2046 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2146 = _2046;
            _2048 = _2146;
            if (!_2140)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2148 = _2052;
            _2054 = _2148;
            if (!_2140)
            {
                _2058 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2150 = _2058;
            _2060 = _2150;
            if (!_2140)
            {
                _2066 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2152 = _2066;
            bool _2154 = !_2140;
            _2068 = _2152;
            if (!_2154)
            {
                bool _2156 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2158 = isnan(_1093);
                bool _2160 = _2156 || _2158;
                bool _2162 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2164 = _2160 || _2162;
                if (!_2164)
                {
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = _1093 + _2166;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2172 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2170;
                    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2178 = 1.0 / _2172;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2196 = _2168 * _2178;
                    float _2198 = precise::clamp(_2196, 0.0, 1.0);
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2204 = fma(_2198, _2176, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2206 = fma(_2198, _2202, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2208 = fma(_2198, _2182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2210 = fma(_2198, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2212 = fma(_2198, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2214 = fma(_2198, _2194, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2042 = _2208;
                    _2060 = _2212;
                    _2036 = _2204;
                    _2054 = _2210;
                    _2048 = _2206;
                    _2068 = _2214;
                    _2130 = true;
                }
                else
                {
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2060 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2036 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2048 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2068 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2130 = false;
    float _2216 = _2042;
    float _2218 = _2060;
    float _2220 = _2036;
    float _2222 = _2054;
    float _2224 = _2048;
    float _2226 = _2068;
    float _2228 = fma(_1988, -0.5, 0.5);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    float _2236 = _2028 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = -_2220;
    float _2240 = _2238 + _2222;
    float _2242 = fma(_2230, _2234, _2216);
    out.m_86.x = 0.0;
    float _2244 = -_2224;
    float _2246 = _2244 + _2226;
    float _2248 = fma(_2230, _2240, _2220);
    float _2250 = _2242 * 0.586610972881317138671875;
    out.m_49.x = _2236;
    bool _2252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2254 = fma(_2230, _2246, _2224);
    float _2256 = fma(_2248, 0.298911988735198974609375, _2250);
    bool _2258 = _1968 > 0.0;
    bool _2260 = isnan(_1968);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan(0.0);
    bool _2266 = _2262 || _2264;
    float _2268 = fma(_2254, 0.114477999508380889892578125, _2256);
    float _2270 = -_2268;
    float _2272 = _2248 + _2270;
    float _2274 = -_2268;
    float _2276 = _2242 + _2274;
    float _2278 = -_2268;
    float _2280 = _2254 + _2278;
    float _2282 = fma(_2272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    float _2284 = fma(_2276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    float _2286 = fma(_2280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    bool _2288 = !_2252;
    if (!_2288)
    {
        float _2290 = -_1057;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2294 = -_1059;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2298 = -_1061;
        float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2302 = _2292 * _2292;
        float _2304 = fma(_2296, _2296, _2302);
        float _2306 = fma(_2300, _2300, _2304);
        float _2308 = sqrt(_2306);
        float _2310 = rsqrt(_2306);
        float _2312 = -_2308;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2318 = precise::clamp(_2316, 0.0, 1.0);
        float _2320 = _2296 * _2310;
        float _2322 = _2292 * _2310;
        float _2324 = abs(_2318);
        float _2326 = log2(_2324);
        float _2328 = _2300 * _2310;
        float _2330 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2332 = _1988 * _2322;
        float _2334 = -_2322;
        float _2336 = -_2330;
        float _2338 = fma(_2334, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2336);
        float _2340 = fma(_1970, _2320, _2332);
        float _2342 = -_2328;
        float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2338);
        float _2346 = fma(_2000, _2328, _2340);
        float _2348 = precise::clamp(_2346, 0.0, 1.0);
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2352 = _2344 + _2350;
        float _2354 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = exp2(_2354);
        float _2362 = _2360 * _2358;
        float _2364 = _2348 * _2362;
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2368 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2370 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2366;
        out.m_86.y = _2368;
        out.m_86.z = _2370;
    }
    out.m_88.x = _2282;
    out.m_88.y = _2284;
    out.m_88.z = _2286;
    if (_2266)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2372 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2372;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2130 = false;
    bool _307 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _2429 = as_type<float>(_123);
        out.gl_Position.z = _2429;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_161);
        out.gl_Position.z = _2499;
    }
    if (_153)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_56.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    float _287 = _275;
    float _305;
    if (!_285)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_107);
        float _311 = 1.0 / _309;
        float _313 = _141 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = in.m_56.z;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _321 = _319 != 0;
    float _323 = in.m_56.x;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _327 = _325 != 0;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _335 = _333 != 0;
    float _337 = in.m_46.x;
    float _339 = in.m_46.y;
    float _341 = in.m_46.z;
    float _343 = in.m_58.x;
    float _345 = in.m_58.y;
    float _347 = in.m_58.z;
    float _349 = in.m_58.w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (!_321)
    {
        float _355 = in.m_56.y;
        _353 = _355;
    }
    float _357 = _353;
    float _359 = in.m_60.x;
    float _361 = in.m_60.y;
    float _363 = in.m_60.z;
    float _365 = in.m_60.w;
    float _367 = _317 * 2.0;
    float _369 = in.m_62.x;
    float _371 = in.m_62.y;
    float _373 = in.m_62.z;
    float _375 = in.m_62.w;
    float _377 = _323 * 2.0;
    float _379 = floor(_367);
    float _381 = _339 * _345;
    float _383 = floor(_377);
    float _385 = _323 + _317;
    if (!_321)
    {
        _287 = _357;
    }
    float _387 = _287;
    float _389 = fma(_337, _343, _381);
    float _391 = _385 + (-1.0);
    float _393 = _339 * _361;
    bool _395 = _379 >= 0.0;
    bool _397 = isnan(_379);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = _387;
    float _407 = _357;
    float _409 = _391;
    float _411 = _363;
    if (_321)
    {
        float _413 = in.m_56.x;
        float _415 = in.m_56.y;
        _405 = _413;
        _407 = _415;
    }
    float _417 = _405;
    float _419 = _407;
    float _421 = fma(_341, _347, _389);
    float _423 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _425 = _403 ? 0 : 1;
    float _427 = _339 * _371;
    float _429 = fma(_337, _359, _393);
    bool _431 = _383 > 0.0;
    float _433 = fma(_337, _369, _427);
    bool _435 = _383 >= 0.0;
    bool _437 = isnan(_383);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _447 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _449 = log2(_447);
    if (!_321)
    {
        _409 = _317;
    }
    float _451 = _409;
    float _453 = fma(_341, _363, _429);
    bool _455 = _379 > 0.0;
    float _457 = fma(_341, _373, _433);
    float _459 = _421 + _349;
    int _461 = ~_425;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    float _467 = _457 + _375;
    float _469 = _453 + _365;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _473 = -_467;
    float _475 = _473 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _477 = _451;
    int _479 = _465;
    if (_321)
    {
        _477 = _419;
    }
    float _481 = _477;
    float _483 = _417 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _485 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[83].z, _351);
    float _487 = _449 * _141;
    float _489 = _317 + _419;
    float _491 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[83].w, _445);
    float _493 = _481;
    if (!_321)
    {
        _493 = _317;
    }
    float _495 = _493;
    float _497 = -_471;
    float _499 = fma(_483, 2.0, _497);
    float _501 = _495;
    if (_321)
    {
        _501 = _419;
    }
    float _503 = _501;
    float _505 = exp2(_487);
    float _507 = _419 * 2.0;
    float _509 = _503 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _511 = _489 + (-1.0);
    if (!_455)
    {
        int _513 = ~_425;
        int _515 = _513 + 1;
        _479 = _515;
    }
    int _517 = _479;
    float _519 = _323 + _419;
    int _521 = _443 ? 0 : 1;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _527 = _519 + (-1.0);
    int _529 = ~_521;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    float _535 = fma(_509, -2.0, _525);
    int _537 = _533;
    if (!_431)
    {
        int _539 = ~_521;
        int _541 = _539 + 1;
        _537 = _541;
    }
    int _543 = _537;
    float _545 = floor(_507);
    bool _547 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _549 = isnan(1.0);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _555 = _551 || _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _559 = 1.0 + _557;
    bool _561 = !_327;
    int _563 = _561 ? 0 : 1;
    float _565 = -_505;
    float _567 = _565 + 1.0;
    float _569 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _485);
    int _571 = abs(_563);
    float _573 = 1.0 / _559;
    bool _575 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _583 = _579 || _581;
    float _585 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _587 = float(_571);
    float _589 = in.m_64.x;
    float _591 = in.m_64.y;
    float _593 = in.m_64.z;
    float _595 = float(_517);
    float _597 = -_141;
    float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[81].x, _499);
    bool _601 = !_331;
    int _603 = _601 ? 0 : 1;
    bool _605 = _545 > 0.0;
    float _607 = _587 * _595;
    float _609 = _583 ? _567 : 0.0;
    float _611 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _491);
    bool _613 = _545 >= 0.0;
    bool _615 = isnan(_545);
    bool _617 = _613 || _615;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    float _623 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _535);
    int _625 = abs(_603);
    if (_555)
    {
        float _627 = _609 * _573;
        _143 = _627;
    }
    float _629 = _143;
    float _631 = -_469;
    float _633 = _631 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _635 = _475 * _475;
    float _637 = -_459;
    float _639 = _637 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _641 = _607 * (-2.0);
    float _643 = fma(_633, _633, _635);
    float _645 = float(_543);
    float _647 = _323 + (-0.5);
    float _649 = float(_625);
    float _651 = fma(_639, _639, _643);
    int _653 = _621 ? 0 : 1;
    float _655 = fma(_641, _589, _589);
    float _657 = fma(_585, _641, _585);
    float _659 = _649 * _645;
    float _661 = rsqrt(_651);
    float _663 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[196].x, _655);
    bool _665 = !_335;
    int _667 = _665 ? 0 : 1;
    float _669 = _659 * (-2.0);
    int _671 = ~_653;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_657, _629, _663);
    int _679 = abs(_667);
    float _681 = _419 + (-0.5);
    int _683 = _675;
    if (!_605)
    {
        int _685 = ~_653;
        int _687 = _685 + 1;
        _683 = _687;
    }
    int _689 = _683;
    float _691 = _677 * 0.15915493667125701904296875;
    float _693 = fma(_669, _591, _591);
    float _695 = float(_689);
    float _697 = fma(_523, _669, _523);
    float _699 = float(_679);
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _703 = _633 * _661;
    float _705 = _475 * _661;
    float _707 = _639 * _661;
    float _709 = _699 * _695;
    float _711 = fma(_697, _629, _701);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _715 = _703 * _713;
    float _717 = in.m_66.x;
    float _719 = in.m_66.y;
    float _721 = _709 * (-2.0);
    float _723 = _711 * 0.15915493667125701904296875;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _727 = _707 * _725;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _731 = -_715;
    float _733 = fma(_707, _729, _731);
    float _735 = fma(_423, _721, _423);
    float _737 = fma(_721, _593, _593);
    float _739 = _317 + (-0.5);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _743 = -_727;
    float _745 = fma(_705, _741, _743);
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _749 = _705 * _747;
    float _751 = _733 * _733;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[196].z, _737);
    float _755 = _691 * 6.283185482025146484375;
    float _757 = cos(_755);
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _761 = -_749;
    float _763 = fma(_703, _759, _761);
    float _765 = fma(_745, _745, _751);
    float _767 = fma(_735, _629, _753);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _777 = _773 || _775;
    float _779 = fma(_763, _763, _765);
    float _781 = _767 * 0.15915493667125701904296875;
    float _783 = _723 * 6.283185482025146484375;
    float _785 = sin(_783);
    float _787 = _281 * _717;
    float _789 = _283 * _719;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _795 = _723 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _801 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _799 * _791;
    float _805 = _801 * _793;
    float _807 = _691 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _757 * _785;
    float _813 = _781 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _757 * _797;
    float _819 = rsqrt(_779);
    float _821 = _809 * _785;
    float _823 = _809 * _797;
    float _825 = _781 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = _757 * _815;
    float _831 = _809 * _815;
    float _833 = _797 * _815;
    float _835 = _785 * _815;
    float _837 = _829 * _803;
    float _839 = _745 * _819;
    float _841 = _733 * _819;
    float _843 = _763 * _819;
    float _845 = _705 * _839;
    float _847 = _707 * _841;
    float _849 = fma(_827, _817, _821);
    float _851 = -_811;
    float _853 = fma(_827, _823, _851);
    float _855 = -_823;
    float _857 = fma(_827, _811, _855);
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = -_803;
    float _863 = _827 * _861;
    float _865 = fma(_849, _805, _837);
    float _867 = _831 * _803;
    float _869 = -_845;
    float _871 = fma(_703, _841, _869);
    float _873 = fma(_833, _805, _863);
    float _875 = fma(_857, _859, _865);
    float _877 = fma(_827, _821, _817);
    float _879 = fma(_853, _805, _867);
    float _881 = -_847;
    float _883 = fma(_705, _843, _881);
    float _885 = fma(_835, _859, _873);
    float _887 = _871 * _875;
    float _889 = fma(_877, _859, _879);
    float _891 = _883 * _875;
    float _893 = fma(_843, _885, _887);
    float _895 = fma(_839, _885, _891);
    float _897 = fma(_707, _889, _893);
    float _899 = fma(_703, _889, _895);
    float _901 = _459 + _897;
    float _903 = _469 + _899;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _907 = _901 + _905;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _911 = _903 + _909;
    float _913 = _907 * _907;
    float _915 = fma(_911, _911, _913);
    float _917 = _703 * _843;
    float _919 = sqrt(_915);
    float _921 = -_917;
    float _923 = fma(_707, _839, _921);
    float _925 = _923 * _875;
    float _927 = fma(_841, _885, _925);
    float _929 = fma(_705, _889, _927);
    bool _931 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = _467 + _929;
    float _935 = _691;
    float _937 = _901;
    float _939 = _903;
    float _941 = _919;
    float _943 = _889;
    float _945 = _915;
    if (!_931)
    {
        _935 = _933;
    }
    float _947 = _935;
    bool _949 = !_931;
    float _951 = _947;
    if (!_949)
    {
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _957 = _919 + _955;
        float _959 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _961 = rsqrt(_915);
        float _963 = _957 * _953;
        float _965 = _963 * 0.15915493667125701904296875;
        float _967 = _965 * 6.283185482025146484375;
        float _969 = cos(_967);
        float _971 = _965 * 6.283185482025146484375;
        float _973 = sin(_971);
        float _975 = _969 + (-1.0);
        float _977 = fma(_973, _959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = _961 * _977;
        float _983 = fma(_933, _969, _979);
        float _985 = fma(_911, _981, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _987 = fma(_907, _981, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _937 = _987;
        _939 = _985;
        _951 = _983;
        _941 = _965;
        _943 = _975;
    }
    float _989 = _937;
    float _991 = _939;
    float _993 = _951;
    float _995 = _941;
    float _997 = _943;
    float _999 = _993;
    float _1001 = _991;
    float _1003 = _989;
    float _1005 = _997;
    if (!_777)
    {
        float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1009 = _467 + _1007;
        float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1013 = _469 + _1011;
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1017 = -_459;
        float _1019 = _1017 + _989;
        float _1021 = _1009 * _1009;
        float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1025 = _459 + _1023;
        float _1027 = fma(_1013, _1013, _1021);
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1031 = fma(_1025, _1025, _1027);
        float _1033 = sqrt(_1031);
        float _1035 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1037 = precise::min(_1033, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1039 = _1037 * _1029;
        float _1041 = -_469;
        float _1043 = _1041 + _991;
        float _1045 = _1035 * _1039;
        float _1047 = -_467;
        float _1049 = _1047 + _993;
        float _1051 = fma(_1043, _1045, _469);
        float _1053 = fma(_1049, _1045, _467);
        float _1055 = fma(_1019, _1045, _459);
        _999 = _1053;
        _1001 = _1051;
        _1003 = _1055;
        _1005 = _1045;
    }
    float _1057 = _999;
    float _1059 = _1001;
    float _1061 = _1003;
    float _1063 = _1005;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1067 = _1057 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1071 = _1059 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1075 = _1061 + _1073;
    float _1077 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1079 = _1067 * _1067;
    float _1081 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1077);
    float _1083 = fma(_1071, _1071, _1079);
    float _1085 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1081);
    float _1087 = fma(_1075, _1075, _1083);
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1091 = rsqrt(_1087);
    float _1093 = sqrt(_1087);
    float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1097 = _1071 * _1095;
    float _1099 = _1075 * _1095;
    float _1101 = _1097 * _1097;
    float _1103 = _1099 * _1099;
    float _1105 = _1101 + _1103;
    float _1107 = sqrt(_1105);
    bool _1109 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1113 = _1107 + _1111;
    float _1115 = _995;
    float _1117 = _1105;
    float _1119 = _1113;
    if (_1109)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1115 = _1121;
    }
    float _1123 = _1115;
    if (_1109)
    {
        float _1125 = rsqrt(_1105);
        _1117 = _1125;
    }
    float _1127 = _1117;
    float _1129 = _1127;
    if (_1109)
    {
        float _1131 = _1113 * _1123;
        _1119 = _1131;
    }
    float _1133 = _1119;
    if (_1109)
    {
        float _1135 = _1133 * 0.15915493667125701904296875;
        _945 = _1135;
    }
    float _1137 = _945;
    float _1139 = _1063;
    float _1141 = _1137;
    if (_1109)
    {
        float _1143 = _1137 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        _1139 = _1145;
    }
    float _1147 = _1139;
    float _1149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1151 = precise::max(0.0, _1149);
    float _1153 = _733;
    float _1155 = _1151;
    if (_1109)
    {
        float _1157 = _1137 * 6.283185482025146484375;
        float _1159 = cos(_1157);
        _1153 = _1159;
    }
    float _1161 = _1153;
    float _1163 = -_1095;
    float _1165 = -_1151;
    float _1167 = fma(_1067, _1163, _1165);
    float _1169 = fma(_469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1109)
    {
        float _1173 = _1167 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1155 = _1173;
    }
    float _1175 = _1155;
    float _1177 = _1175;
    if (!_1109)
    {
        _1141 = _1167;
    }
    float _1179 = _1141;
    float _1181 = floor(_1169);
    float _1183 = _1147;
    float _1185 = _1179;
    if (_1109)
    {
        float _1187 = fma(_1147, _1175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1177 = _1187;
    }
    float _1189 = _1177;
    float _1191 = _1189;
    if (!_1109)
    {
        _1183 = _1097;
    }
    float _1193 = _1183;
    float _1195 = _1193;
    float _1197 = _1161;
    if (_1109)
    {
        float _1199 = _1161 + (-1.0);
        _1171 = _1199;
    }
    float _1201 = _1171;
    float _1203 = _1201;
    if (_1109)
    {
        float _1205 = _1127 * _1189;
        _411 = _1205;
    }
    float _1207 = _411;
    if (!_1109)
    {
        _1129 = _1101;
    }
    float _1209 = _1129;
    float _1211 = _1209;
    if (_1109)
    {
        float _1213 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1213;
    }
    float _1215 = _1191;
    if (_1109)
    {
        float _1217 = _1097 * _1207;
        _1195 = _1217;
    }
    float _1219 = _1195;
    if (!_1109)
    {
        _1203 = _1099;
    }
    float _1221 = _1203;
    float _1223 = _1221;
    if (_1109)
    {
        float _1225 = _1099 * _1207;
        _1223 = _1225;
    }
    float _1227 = _1223;
    if (_1109)
    {
        float _1229 = fma(_1167, _1161, _1215);
        _1185 = _1229;
    }
    float _1231 = _1185;
    if (_1109)
    {
        float _1233 = _1219 * _1219;
        _1211 = _1233;
    }
    float _1235 = _1211;
    if (!_1109)
    {
        _1197 = _1103;
    }
    float _1237 = _1197;
    float _1239 = _1237;
    if (_1109)
    {
        float _1241 = _1227 * _1227;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = fma(_1231, _1231, _1235);
    float _1249 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1251 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1245);
    float _1253 = _1247 + _1243;
    float _1255 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1257 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1249);
    float _1259 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1263 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1261);
    float _1265 = precise::clamp(_1263, 0.0, 1.0);
    float _1267 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1255);
    float _1269 = rsqrt(_1253);
    float _1271 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1257);
    float _1273 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1275 = -_1265;
    float _1277 = _1275 + 1.0;
    float _1279 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1267);
    float _1281 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1287 = abs(_1277);
    float _1289 = log2(_1287);
    float _1291 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1283);
    float _1293 = fma(_459, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1297 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1291);
    float _1299 = _1269 * _1219;
    float _1301 = _1269 * _1227;
    float _1303 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1297);
    float _1305 = _1269 * _1231;
    float _1307 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1309 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1311 = 1.0 / _1303;
    float _1313 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1315 = -_1307;
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1315);
    float _1319 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = -_1295;
    float _1323 = fma(_1321, _1309, 1.0);
    float _1325 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1313);
    float _1327 = -_1301;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1317);
    float _1331 = -_1181;
    float _1333 = _1169 + _1331;
    float _1335 = floor(_1293);
    float _1337 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1339 = fma(_1329, -0.5, 0.5);
    float _1341 = fma(_1329, 0.5, 0.5);
    float _1343 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1337);
    float _1345 = exp2(_1319);
    float _1347 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1343);
    float _1349 = log2(_1323);
    float _1351 = -_1335;
    float _1353 = _1293 + _1351;
    float _1355 = _1305 + 1.0;
    float _1357 = fma(_1341, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1359 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1325);
    float _1361 = fma(_1341, _1357, -0.212114393711090087890625);
    float _1363 = sqrt(_1339);
    float _1365 = -_1305;
    float _1367 = fma(_1345, _1355, _1365);
    float _1369 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1371 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1359);
    float _1373 = fma(_1341, _1361, 1.570728778839111328125);
    float _1375 = fma(_1367, 0.5, 0.5);
    float _1377 = _1369 * _1311;
    float _1379 = _1349 * 0.693147182464599609375;
    float _1381 = _1371 * _1311;
    float _1383 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = fma(_1377, 0.5, 0.5);
    float _1387 = _1363 * 0.636619746685028076171875;
    float _1389 = fma(_1381, -0.5, 0.5);
    float _1391 = -_1373;
    float _1393 = fma(_1387, _1391, 1.0);
    float2 _4378 = float2(_1333, _1353);
    float _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4378, float2(0.0), isnan(_4378)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4378, float2(0.0), isnan(_4378)), level(0.0)).x;
    float3 _4389 = float3(_1385, _1389, _1383);
    float _1397 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4389, float3(0.0), isnan(_4389)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4389, float3(0.0), isnan(_4389)), level(0.0)).x;
    float3 _4400 = float3(_1385, _1389, _1383);
    float4 _1400 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4400, float3(0.0), isnan(_4400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4400, float3(0.0), isnan(_4400)), level(0.0)).xyzw;
    float _1402 = _1400.x;
    float _1404 = _1400.y;
    float _1406 = _1400.z;
    float _1408 = _1400.w;
    float2 _4416 = float2(_1393, _1375);
    float3 _1412 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4416, float2(0.0), isnan(_4416)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4416, float2(0.0), isnan(_4416)), level(0.0)).xyz;
    float _1414 = _1412.x;
    float _1416 = _1412.y;
    float _1418 = _1412.z;
    float _1420 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1422 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1426 = _315 + _1424;
    float _1428 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1420);
    float _1430 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1422);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1436 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1428);
    float _1438 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1430);
    float _1440 = in.m_56.w;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1448 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1450 = 1.0 / _1434;
    float _1452 = -_569;
    float _1454 = _1452 + 1.0;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1458 = _1456 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1460 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1462 = isnan(_315);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = -_611;
    float _1474 = _1472 + 1.0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    float _1480 = 1.0 / _1446;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1484 = _1482 != 0;
    float _1486 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1490 = _1488 != 0;
    float _1492 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1496 = _1494 != 0;
    float _1498 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    bool _1500 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1502 = isnan(_315);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = 1.0 / _1444;
    float _1514 = _1448 + _1446;
    float _1516 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1498);
    bool _1518 = _1440 > 0.5;
    out.m_68.x = _1071;
    out.m_68.y = _1067;
    out.m_68.z = _1075;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1520;
    float _1524 = _1514 * _1480;
    float _1526 = _1524 * 0.5;
    float _1528 = 1.0 / _1458;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1534 = _323 > 0.5;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1536);
    float _1540 = -_1510;
    float _1542 = _1540 + 1.0;
    bool _1544 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1546 = isnan(_315);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = _1522 * _1450;
    float _1558 = _1532 * _1512;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1560;
    float _1564 = 1.0 / _1538;
    float _1566 = _1470 * _1542;
    float _1568 = -_1554;
    float _1570 = _1568 + 1.0;
    bool _1572 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1574 = isnan(_315);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = fma(_1558, _1426, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1586 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1588 = isnan(_315);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1594 = _1590 || _1592;
    float _1596 = float(_1594);
    float _1598 = _1562 * _1528;
    float _1600 = -_1470;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1606 = _315 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1612 = _317 > 0.5;
    float _1614 = _1554 * _1602;
    float _1616 = fma(_1556, _1606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1618 = _1582 * _1570;
    float _1620 = -_1582;
    float _1622 = _1620 + 1.0;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1626 = _1564 * _1624;
    float _1628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1632 = _315 + _1630;
    float _1634 = _1596 * _1622;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1642 = _315 + _1640;
    float _1644 = fma(_1598, _1632, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1646 = _1616 * _1634;
    float _1648 = -_1596;
    float _1650 = _1648 + 1.0;
    float _1652 = abs(_1626);
    float _1654 = log2(_1652);
    float _1656 = -_177;
    int _1658 = _1612 ? as_type<int>(_1656) : as_type<int>(_177);
    float _1660 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1646);
    float _1662 = -_181;
    int _1664 = _1518 ? as_type<int>(_1662) : as_type<int>(_181);
    bool _1666 = !_1478;
    float _1668 = _1666 ? _177 : as_type<float>(_1658);
    float _1670 = fma(_1584, _1618, _1660);
    float _1672 = 1.0 / _1610;
    bool _1674 = _419 > 0.5;
    float _1676 = _1668 + 0.5;
    float _1678 = fma(_1644, _1614, _1670);
    float _1680 = -_177;
    int _1682 = _1534 ? as_type<int>(_1680) : as_type<int>(_177);
    bool _1684 = !_1484;
    float _1686 = _1684 ? _181 : as_type<float>(_1664);
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1690 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1692 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1694 = -_181;
    int _1696 = _1674 ? as_type<int>(_1694) : as_type<int>(_181);
    float _1698 = _1686 + (-0.5);
    bool _1700 = !_1490;
    float _1702 = _1700 ? _177 : as_type<float>(_1682);
    float _1704 = fma(_1692, _1676, _599);
    bool _1706 = !_1496;
    float _1708 = _1706 ? _181 : as_type<float>(_1696);
    float _1710 = exp2(_1690);
    float _1712 = _1638 * _1672;
    float _1714 = _1702 + 0.5;
    float _1716 = -_1454;
    float _1718 = fma(_1668, _1716, _1704);
    float _1720 = -_1708;
    float _1722 = _1720 + 0.5;
    float _1724 = fma(_1712, _1642, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1726 = _857 * _883;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1730 = fma(_1724, _1566, _1678);
    float _1732 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1730);
    float _1738 = -_1732;
    float _1740 = -_623;
    float _1742 = fma(_1738, _1698, _1740);
    float _1744 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1748 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1750 = precise::clamp(_1748, 0.0, 1.0);
    float _1752 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1754 = fma(_1686, _1474, _1742);
    float _1756 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1760 = _1744 * _1728;
    float _1762 = fma(_1750, -2.0, 3.0);
    float _1764 = _1750 * _1750;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1768 = _829 * _871;
    float _1770 = _1764 * _1762;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1774 = _1752 * _1746;
    float _1776 = _829 * _883;
    float _1778 = _829 * _923;
    float _1780 = _849 * _923;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1784 = _849 * _883;
    out.m_70.x = _1760;
    out.m_70.y = _1774;
    out.m_70.z = _1718;
    out.m_70.w = _1754;
    float _1786 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _849 * _871;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_72.x = _1786;
    out.m_72.y = _1772;
    out.m_72.z = _1756;
    float _1796 = fma(_833, _843, _1788);
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _857 * _923;
    float _1806 = -_827;
    float _1808 = fma(_1806, _841, _1778);
    bool _1810 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1812 = isnan(0.5);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1818 = _1814 || _1816;
    float _1820 = fma(_833, _841, _1780);
    float _1822 = -_827;
    float _1824 = fma(_1822, _843, _1768);
    float _1826 = fma(_833, _839, _1784);
    float _1828 = -_1770;
    float _1830 = _1828 + 1.0;
    float _1832 = _857 * _871;
    float _1834 = -_827;
    float _1836 = fma(_1834, _839, _1776);
    out.m_74.x = _1798;
    out.m_74.y = _1800;
    out.m_74.z = _1802;
    out.m_74.w = _1758;
    float _1838 = fma(_835, _839, _1726);
    float _1840 = fma(_835, _843, _1832);
    float _1842 = fma(_853, _705, _1820);
    float _1844 = fma(_835, _841, _1804);
    float _1846 = in.m_76.x;
    float _1848 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1850 = exp2(_1492);
    float _1852 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1770);
    float _1854 = fma(_831, _705, _1808);
    float _1856 = fma(_877, _703, _1838);
    float _1858 = fma(_877, _705, _1844);
    float _1860 = fma(_831, _707, _1824);
    float _1862 = fma(_853, _703, _1826);
    float _1864 = fma(_831, _703, _1836);
    float _1866 = fma(_853, _707, _1796);
    float _1868 = fma(_877, _707, _1840);
    float _1870 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1872 = _1848 * _1864;
    float _1874 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1516);
    bool _1876 = _1626 <= 8000.0;
    bool _1878 = isnan(_1626);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(8000.0);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = _1848 * _1854;
    float _1890 = fma(_1870, _1862, _1872);
    float _1892 = _1848 * _1860;
    float _1894 = _1874 + _1303;
    float _1896 = _1886 * _1852;
    float _1898 = fma(_1870, _1842, _1888);
    float _1900 = fma(_1870, _1866, _1892);
    float _1902 = _1894 * 0.5;
    float _1904 = _1852;
    float _1906 = _1902;
    float _1908 = _1303;
    float _1910 = _1874;
    float _1912 = _1371;
    float _1914 = _1369;
    if (_1818)
    {
        _1904 = 1.0;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (!_1818)
    {
        float _1920 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1926 = _1922 * 6.283185482025146484375;
        float _1928 = cos(_1926);
        float _1930 = _1924 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1928;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1948;
        float _1952 = _1940 * _1942;
        float _1954 = 1.0 / _1950;
        float _1956 = 1.0 / _1952;
        float _1958 = _1946 * _1956;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1626, _1958, _1960);
        float _1964 = _1962 * _1954;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1918 = _1966;
    }
    float _1968 = _1918;
    float _1970 = _1856 + _1890;
    float _1972 = -_1850;
    float _1974 = _1972 + 1.0;
    float _1976 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1978 = -_1395;
    float _1980 = _1978 + 1.0;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.z = _1902;
    out.m_78.w = _1303;
    float _1984 = _1980 * _1976;
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = _1858 + _1898;
    float _1990 = _1982 * _1397;
    float _1992 = -_1982;
    float _1994 = _1992 + 1.0;
    float _1996 = -_1986;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2000 = _1868 + _1900;
    float _2002 = _1408 * _1990;
    float _2004 = _1418 * _1990;
    float _2006 = _1998 * _1846;
    float _2008 = _1408 * _1994;
    float _2010 = fma(_1414, _2002, _1402);
    float _2012 = fma(_1416, _2002, _1404);
    float _2014 = _2006 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2016 = fma(_1408, _2004, _1406);
    out.m_80.x = _1970;
    out.m_80.y = _1988;
    out.m_80.z = _2000;
    bool _2018 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2020 = isnan(_1093);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2026 = _2022 || _2024;
    float _2028 = _1968 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2014;
    out.m_84.x = _2010;
    out.m_84.y = _2012;
    out.m_84.z = _2016;
    out.m_84.w = _2008;
    out.gl_Position.x = _1369;
    out.gl_Position.y = _1371;
    out.gl_Position.z = _1874;
    out.gl_Position.w = _1303;
    float _2030 = _2006;
    if (!_2026)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2032 = _2030;
    float _2034 = _2032;
    float _2036 = _2032;
    if (!_2026)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2038 = _1906;
    float _2040 = _2038;
    float _2042 = _2038;
    if (!_2026)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2044 = _1908;
    float _2046 = _2044;
    float _2048 = _2044;
    if (!_2026)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2050 = _1910;
    float _2052 = _2050;
    float _2054 = _2050;
    if (!_2026)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2056 = _1912;
    float _2058 = _2056;
    float _2060 = _2056;
    if (!_2026)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2062 = _1914;
    bool _2064 = !_2026;
    float _2066 = _2062;
    float _2068 = _2062;
    if (!_2064)
    {
        bool _2070 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2072 = isnan(_1093);
        bool _2074 = _2070 || _2072;
        bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2078 = _2074 || _2076;
        if (!_2078)
        {
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = _1093 + _2080;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2086 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2084;
            float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2092 = 1.0 / _2086;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2110 = _2082 * _2092;
            float _2112 = precise::clamp(_2110, 0.0, 1.0);
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2118 = fma(_2112, _2090, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2120 = fma(_2112, _2116, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2122 = fma(_2112, _2096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2124 = fma(_2112, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2126 = fma(_2112, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2128 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2042 = _2122;
            _2060 = _2126;
            _2036 = _2118;
            _2054 = _2124;
            _2048 = _2120;
            _2068 = _2128;
            _2130 = true;
        }
        else
        {
            bool _2132 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2134 = isnan(_1093);
            bool _2136 = _2132 || _2134;
            bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2140 = _2136 || _2138;
            if (!_2140)
            {
                _2034 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2142 = _2034;
            _2036 = _2142;
            if (!_2140)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2144 = _2040;
            _2042 = _2144;
            if (!_2140)
            {
                _2046 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2146 = _2046;
            _2048 = _2146;
            if (!_2140)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2148 = _2052;
            _2054 = _2148;
            if (!_2140)
            {
                _2058 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2150 = _2058;
            _2060 = _2150;
            if (!_2140)
            {
                _2066 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2152 = _2066;
            bool _2154 = !_2140;
            _2068 = _2152;
            if (!_2154)
            {
                bool _2156 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2158 = isnan(_1093);
                bool _2160 = _2156 || _2158;
                bool _2162 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2164 = _2160 || _2162;
                if (!_2164)
                {
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = _1093 + _2166;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2172 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2170;
                    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2178 = 1.0 / _2172;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2196 = _2168 * _2178;
                    float _2198 = precise::clamp(_2196, 0.0, 1.0);
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2204 = fma(_2198, _2176, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2206 = fma(_2198, _2202, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2208 = fma(_2198, _2182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2210 = fma(_2198, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2212 = fma(_2198, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2214 = fma(_2198, _2194, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2042 = _2208;
                    _2060 = _2212;
                    _2036 = _2204;
                    _2054 = _2210;
                    _2048 = _2206;
                    _2068 = _2214;
                    _2130 = true;
                }
                else
                {
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2060 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2036 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2048 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2068 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2130 = false;
    float _2216 = _2042;
    float _2218 = _2060;
    float _2220 = _2036;
    float _2222 = _2054;
    float _2224 = _2048;
    float _2226 = _2068;
    float _2228 = fma(_1988, -0.5, 0.5);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    float _2236 = _2028 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = -_2220;
    float _2240 = _2238 + _2222;
    float _2242 = fma(_2230, _2234, _2216);
    out.m_86.x = 0.0;
    float _2244 = -_2224;
    float _2246 = _2244 + _2226;
    float _2248 = fma(_2230, _2240, _2220);
    float _2250 = _2242 * 0.586610972881317138671875;
    out.m_49.x = _2236;
    bool _2252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2254 = fma(_2230, _2246, _2224);
    float _2256 = fma(_2248, 0.298911988735198974609375, _2250);
    bool _2258 = _1968 > 0.0;
    bool _2260 = isnan(_1968);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan(0.0);
    bool _2266 = _2262 || _2264;
    float _2268 = fma(_2254, 0.114477999508380889892578125, _2256);
    float _2270 = -_2268;
    float _2272 = _2248 + _2270;
    float _2274 = -_2268;
    float _2276 = _2242 + _2274;
    float _2278 = -_2268;
    float _2280 = _2254 + _2278;
    float _2282 = fma(_2272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    float _2284 = fma(_2276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    float _2286 = fma(_2280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    bool _2288 = !_2252;
    if (!_2288)
    {
        float _2290 = -_1057;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2294 = -_1059;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2298 = -_1061;
        float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2302 = _2292 * _2292;
        float _2304 = fma(_2296, _2296, _2302);
        float _2306 = fma(_2300, _2300, _2304);
        float _2308 = sqrt(_2306);
        float _2310 = rsqrt(_2306);
        float _2312 = -_2308;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2318 = precise::clamp(_2316, 0.0, 1.0);
        float _2320 = _2296 * _2310;
        float _2322 = _2292 * _2310;
        float _2324 = abs(_2318);
        float _2326 = log2(_2324);
        float _2328 = _2300 * _2310;
        float _2330 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2332 = _1988 * _2322;
        float _2334 = -_2322;
        float _2336 = -_2330;
        float _2338 = fma(_2334, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2336);
        float _2340 = fma(_1970, _2320, _2332);
        float _2342 = -_2328;
        float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2338);
        float _2346 = fma(_2000, _2328, _2340);
        float _2348 = precise::clamp(_2346, 0.0, 1.0);
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2352 = _2344 + _2350;
        float _2354 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = exp2(_2354);
        float _2362 = _2360 * _2358;
        float _2364 = _2348 * _2362;
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2368 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2370 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2366;
        out.m_86.y = _2368;
        out.m_86.z = _2370;
    }
    out.m_88.x = _2282;
    out.m_88.y = _2284;
    out.m_88.z = _2286;
    if (_2266)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2372 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2372;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2130 = false;
    bool _307 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _2429 = as_type<float>(_123);
        out.gl_Position.z = _2429;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_161);
        out.gl_Position.z = _2499;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_56.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    float _287 = _275;
    float _305;
    if (!_285)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_107);
        float _311 = 1.0 / _309;
        float _313 = _141 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = in.m_56.z;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _321 = _319 != 0;
    float _323 = in.m_56.x;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _327 = _325 != 0;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _335 = _333 != 0;
    float _337 = in.m_46.x;
    float _339 = in.m_46.y;
    float _341 = in.m_46.z;
    float _343 = in.m_58.x;
    float _345 = in.m_58.y;
    float _347 = in.m_58.z;
    float _349 = in.m_58.w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (!_321)
    {
        float _355 = in.m_56.y;
        _353 = _355;
    }
    float _357 = _353;
    float _359 = in.m_60.x;
    float _361 = in.m_60.y;
    float _363 = in.m_60.z;
    float _365 = in.m_60.w;
    float _367 = _317 * 2.0;
    float _369 = in.m_62.x;
    float _371 = in.m_62.y;
    float _373 = in.m_62.z;
    float _375 = in.m_62.w;
    float _377 = _323 * 2.0;
    float _379 = floor(_367);
    float _381 = _339 * _345;
    float _383 = floor(_377);
    float _385 = _323 + _317;
    if (!_321)
    {
        _287 = _357;
    }
    float _387 = _287;
    float _389 = fma(_337, _343, _381);
    float _391 = _385 + (-1.0);
    float _393 = _339 * _361;
    bool _395 = _379 >= 0.0;
    bool _397 = isnan(_379);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = _387;
    float _407 = _357;
    float _409 = _391;
    float _411 = _363;
    if (_321)
    {
        float _413 = in.m_56.x;
        float _415 = in.m_56.y;
        _405 = _413;
        _407 = _415;
    }
    float _417 = _405;
    float _419 = _407;
    float _421 = fma(_341, _347, _389);
    float _423 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _425 = _403 ? 0 : 1;
    float _427 = _339 * _371;
    float _429 = fma(_337, _359, _393);
    bool _431 = _383 > 0.0;
    float _433 = fma(_337, _369, _427);
    bool _435 = _383 >= 0.0;
    bool _437 = isnan(_383);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _447 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _449 = log2(_447);
    if (!_321)
    {
        _409 = _317;
    }
    float _451 = _409;
    float _453 = fma(_341, _363, _429);
    bool _455 = _379 > 0.0;
    float _457 = fma(_341, _373, _433);
    float _459 = _421 + _349;
    int _461 = ~_425;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    float _467 = _457 + _375;
    float _469 = _453 + _365;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _473 = -_467;
    float _475 = _473 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _477 = _451;
    int _479 = _465;
    if (_321)
    {
        _477 = _419;
    }
    float _481 = _477;
    float _483 = _417 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _485 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[83].z, _351);
    float _487 = _449 * _141;
    float _489 = _317 + _419;
    float _491 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[83].w, _445);
    float _493 = _481;
    if (!_321)
    {
        _493 = _317;
    }
    float _495 = _493;
    float _497 = -_471;
    float _499 = fma(_483, 2.0, _497);
    float _501 = _495;
    if (_321)
    {
        _501 = _419;
    }
    float _503 = _501;
    float _505 = exp2(_487);
    float _507 = _419 * 2.0;
    float _509 = _503 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _511 = _489 + (-1.0);
    if (!_455)
    {
        int _513 = ~_425;
        int _515 = _513 + 1;
        _479 = _515;
    }
    int _517 = _479;
    float _519 = _323 + _419;
    int _521 = _443 ? 0 : 1;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _527 = _519 + (-1.0);
    int _529 = ~_521;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    float _535 = fma(_509, -2.0, _525);
    int _537 = _533;
    if (!_431)
    {
        int _539 = ~_521;
        int _541 = _539 + 1;
        _537 = _541;
    }
    int _543 = _537;
    float _545 = floor(_507);
    bool _547 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _549 = isnan(1.0);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _555 = _551 || _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _559 = 1.0 + _557;
    bool _561 = !_327;
    int _563 = _561 ? 0 : 1;
    float _565 = -_505;
    float _567 = _565 + 1.0;
    float _569 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _485);
    int _571 = abs(_563);
    float _573 = 1.0 / _559;
    bool _575 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _583 = _579 || _581;
    float _585 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _587 = float(_571);
    float _589 = in.m_64.x;
    float _591 = in.m_64.y;
    float _593 = in.m_64.z;
    float _595 = float(_517);
    float _597 = -_141;
    float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[81].x, _499);
    bool _601 = !_331;
    int _603 = _601 ? 0 : 1;
    bool _605 = _545 > 0.0;
    float _607 = _587 * _595;
    float _609 = _583 ? _567 : 0.0;
    float _611 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _491);
    bool _613 = _545 >= 0.0;
    bool _615 = isnan(_545);
    bool _617 = _613 || _615;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    float _623 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _535);
    int _625 = abs(_603);
    if (_555)
    {
        float _627 = _609 * _573;
        _143 = _627;
    }
    float _629 = _143;
    float _631 = -_469;
    float _633 = _631 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _635 = _475 * _475;
    float _637 = -_459;
    float _639 = _637 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _641 = _607 * (-2.0);
    float _643 = fma(_633, _633, _635);
    float _645 = float(_543);
    float _647 = _323 + (-0.5);
    float _649 = float(_625);
    float _651 = fma(_639, _639, _643);
    int _653 = _621 ? 0 : 1;
    float _655 = fma(_641, _589, _589);
    float _657 = fma(_585, _641, _585);
    float _659 = _649 * _645;
    float _661 = rsqrt(_651);
    float _663 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[196].x, _655);
    bool _665 = !_335;
    int _667 = _665 ? 0 : 1;
    float _669 = _659 * (-2.0);
    int _671 = ~_653;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_657, _629, _663);
    int _679 = abs(_667);
    float _681 = _419 + (-0.5);
    int _683 = _675;
    if (!_605)
    {
        int _685 = ~_653;
        int _687 = _685 + 1;
        _683 = _687;
    }
    int _689 = _683;
    float _691 = _677 * 0.15915493667125701904296875;
    float _693 = fma(_669, _591, _591);
    float _695 = float(_689);
    float _697 = fma(_523, _669, _523);
    float _699 = float(_679);
    float _701 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _703 = _633 * _661;
    float _705 = _475 * _661;
    float _707 = _639 * _661;
    float _709 = _699 * _695;
    float _711 = fma(_697, _629, _701);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _715 = _703 * _713;
    float _717 = in.m_66.x;
    float _719 = in.m_66.y;
    float _721 = _709 * (-2.0);
    float _723 = _711 * 0.15915493667125701904296875;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _727 = _707 * _725;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _731 = -_715;
    float _733 = fma(_707, _729, _731);
    float _735 = fma(_423, _721, _423);
    float _737 = fma(_721, _593, _593);
    float _739 = _317 + (-0.5);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _743 = -_727;
    float _745 = fma(_705, _741, _743);
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _749 = _705 * _747;
    float _751 = _733 * _733;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[196].z, _737);
    float _755 = _691 * 6.283185482025146484375;
    float _757 = cos(_755);
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _761 = -_749;
    float _763 = fma(_703, _759, _761);
    float _765 = fma(_745, _745, _751);
    float _767 = fma(_735, _629, _753);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _777 = _773 || _775;
    float _779 = fma(_763, _763, _765);
    float _781 = _767 * 0.15915493667125701904296875;
    float _783 = _723 * 6.283185482025146484375;
    float _785 = sin(_783);
    float _787 = _281 * _717;
    float _789 = _283 * _719;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _795 = _723 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _801 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _799 * _791;
    float _805 = _801 * _793;
    float _807 = _691 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _757 * _785;
    float _813 = _781 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _757 * _797;
    float _819 = rsqrt(_779);
    float _821 = _809 * _785;
    float _823 = _809 * _797;
    float _825 = _781 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = _757 * _815;
    float _831 = _809 * _815;
    float _833 = _797 * _815;
    float _835 = _785 * _815;
    float _837 = _829 * _803;
    float _839 = _745 * _819;
    float _841 = _733 * _819;
    float _843 = _763 * _819;
    float _845 = _705 * _839;
    float _847 = _707 * _841;
    float _849 = fma(_827, _817, _821);
    float _851 = -_811;
    float _853 = fma(_827, _823, _851);
    float _855 = -_823;
    float _857 = fma(_827, _811, _855);
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = -_803;
    float _863 = _827 * _861;
    float _865 = fma(_849, _805, _837);
    float _867 = _831 * _803;
    float _869 = -_845;
    float _871 = fma(_703, _841, _869);
    float _873 = fma(_833, _805, _863);
    float _875 = fma(_857, _859, _865);
    float _877 = fma(_827, _821, _817);
    float _879 = fma(_853, _805, _867);
    float _881 = -_847;
    float _883 = fma(_705, _843, _881);
    float _885 = fma(_835, _859, _873);
    float _887 = _871 * _875;
    float _889 = fma(_877, _859, _879);
    float _891 = _883 * _875;
    float _893 = fma(_843, _885, _887);
    float _895 = fma(_839, _885, _891);
    float _897 = fma(_707, _889, _893);
    float _899 = fma(_703, _889, _895);
    float _901 = _459 + _897;
    float _903 = _469 + _899;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _907 = _901 + _905;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _911 = _903 + _909;
    float _913 = _907 * _907;
    float _915 = fma(_911, _911, _913);
    float _917 = _703 * _843;
    float _919 = sqrt(_915);
    float _921 = -_917;
    float _923 = fma(_707, _839, _921);
    float _925 = _923 * _875;
    float _927 = fma(_841, _885, _925);
    float _929 = fma(_705, _889, _927);
    bool _931 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = _467 + _929;
    float _935 = _691;
    float _937 = _901;
    float _939 = _903;
    float _941 = _919;
    float _943 = _889;
    float _945 = _915;
    if (!_931)
    {
        _935 = _933;
    }
    float _947 = _935;
    bool _949 = !_931;
    float _951 = _947;
    if (!_949)
    {
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _957 = _919 + _955;
        float _959 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _961 = rsqrt(_915);
        float _963 = _957 * _953;
        float _965 = _963 * 0.15915493667125701904296875;
        float _967 = _965 * 6.283185482025146484375;
        float _969 = cos(_967);
        float _971 = _965 * 6.283185482025146484375;
        float _973 = sin(_971);
        float _975 = _969 + (-1.0);
        float _977 = fma(_973, _959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = _961 * _977;
        float _983 = fma(_933, _969, _979);
        float _985 = fma(_911, _981, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _987 = fma(_907, _981, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _937 = _987;
        _939 = _985;
        _951 = _983;
        _941 = _965;
        _943 = _975;
    }
    float _989 = _937;
    float _991 = _939;
    float _993 = _951;
    float _995 = _941;
    float _997 = _943;
    float _999 = _993;
    float _1001 = _991;
    float _1003 = _989;
    float _1005 = _997;
    if (!_777)
    {
        float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1009 = _467 + _1007;
        float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1013 = _469 + _1011;
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1017 = -_459;
        float _1019 = _1017 + _989;
        float _1021 = _1009 * _1009;
        float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1025 = _459 + _1023;
        float _1027 = fma(_1013, _1013, _1021);
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1031 = fma(_1025, _1025, _1027);
        float _1033 = sqrt(_1031);
        float _1035 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1037 = precise::min(_1033, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1039 = _1037 * _1029;
        float _1041 = -_469;
        float _1043 = _1041 + _991;
        float _1045 = _1035 * _1039;
        float _1047 = -_467;
        float _1049 = _1047 + _993;
        float _1051 = fma(_1043, _1045, _469);
        float _1053 = fma(_1049, _1045, _467);
        float _1055 = fma(_1019, _1045, _459);
        _999 = _1053;
        _1001 = _1051;
        _1003 = _1055;
        _1005 = _1045;
    }
    float _1057 = _999;
    float _1059 = _1001;
    float _1061 = _1003;
    float _1063 = _1005;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1067 = _1057 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1071 = _1059 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1075 = _1061 + _1073;
    float _1077 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1079 = _1067 * _1067;
    float _1081 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1077);
    float _1083 = fma(_1071, _1071, _1079);
    float _1085 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1081);
    float _1087 = fma(_1075, _1075, _1083);
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1091 = rsqrt(_1087);
    float _1093 = sqrt(_1087);
    float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1097 = _1071 * _1095;
    float _1099 = _1075 * _1095;
    float _1101 = _1097 * _1097;
    float _1103 = _1099 * _1099;
    float _1105 = _1101 + _1103;
    float _1107 = sqrt(_1105);
    bool _1109 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1113 = _1107 + _1111;
    float _1115 = _995;
    float _1117 = _1105;
    float _1119 = _1113;
    if (_1109)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1115 = _1121;
    }
    float _1123 = _1115;
    if (_1109)
    {
        float _1125 = rsqrt(_1105);
        _1117 = _1125;
    }
    float _1127 = _1117;
    float _1129 = _1127;
    if (_1109)
    {
        float _1131 = _1113 * _1123;
        _1119 = _1131;
    }
    float _1133 = _1119;
    if (_1109)
    {
        float _1135 = _1133 * 0.15915493667125701904296875;
        _945 = _1135;
    }
    float _1137 = _945;
    float _1139 = _1063;
    float _1141 = _1137;
    if (_1109)
    {
        float _1143 = _1137 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        _1139 = _1145;
    }
    float _1147 = _1139;
    float _1149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1151 = precise::max(0.0, _1149);
    float _1153 = _733;
    float _1155 = _1151;
    if (_1109)
    {
        float _1157 = _1137 * 6.283185482025146484375;
        float _1159 = cos(_1157);
        _1153 = _1159;
    }
    float _1161 = _1153;
    float _1163 = -_1095;
    float _1165 = -_1151;
    float _1167 = fma(_1067, _1163, _1165);
    float _1169 = fma(_469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1109)
    {
        float _1173 = _1167 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1155 = _1173;
    }
    float _1175 = _1155;
    float _1177 = _1175;
    if (!_1109)
    {
        _1141 = _1167;
    }
    float _1179 = _1141;
    float _1181 = floor(_1169);
    float _1183 = _1147;
    float _1185 = _1179;
    if (_1109)
    {
        float _1187 = fma(_1147, _1175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1177 = _1187;
    }
    float _1189 = _1177;
    float _1191 = _1189;
    if (!_1109)
    {
        _1183 = _1097;
    }
    float _1193 = _1183;
    float _1195 = _1193;
    float _1197 = _1161;
    if (_1109)
    {
        float _1199 = _1161 + (-1.0);
        _1171 = _1199;
    }
    float _1201 = _1171;
    float _1203 = _1201;
    if (_1109)
    {
        float _1205 = _1127 * _1189;
        _411 = _1205;
    }
    float _1207 = _411;
    if (!_1109)
    {
        _1129 = _1101;
    }
    float _1209 = _1129;
    float _1211 = _1209;
    if (_1109)
    {
        float _1213 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1213;
    }
    float _1215 = _1191;
    if (_1109)
    {
        float _1217 = _1097 * _1207;
        _1195 = _1217;
    }
    float _1219 = _1195;
    if (!_1109)
    {
        _1203 = _1099;
    }
    float _1221 = _1203;
    float _1223 = _1221;
    if (_1109)
    {
        float _1225 = _1099 * _1207;
        _1223 = _1225;
    }
    float _1227 = _1223;
    if (_1109)
    {
        float _1229 = fma(_1167, _1161, _1215);
        _1185 = _1229;
    }
    float _1231 = _1185;
    if (_1109)
    {
        float _1233 = _1219 * _1219;
        _1211 = _1233;
    }
    float _1235 = _1211;
    if (!_1109)
    {
        _1197 = _1103;
    }
    float _1237 = _1197;
    float _1239 = _1237;
    if (_1109)
    {
        float _1241 = _1227 * _1227;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = fma(_1231, _1231, _1235);
    float _1249 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1251 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1245);
    float _1253 = _1247 + _1243;
    float _1255 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1257 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1249);
    float _1259 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1263 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1261);
    float _1265 = precise::clamp(_1263, 0.0, 1.0);
    float _1267 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1255);
    float _1269 = rsqrt(_1253);
    float _1271 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1257);
    float _1273 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1275 = -_1265;
    float _1277 = _1275 + 1.0;
    float _1279 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1267);
    float _1281 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1287 = abs(_1277);
    float _1289 = log2(_1287);
    float _1291 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1283);
    float _1293 = fma(_459, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1297 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1291);
    float _1299 = _1269 * _1219;
    float _1301 = _1269 * _1227;
    float _1303 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1297);
    float _1305 = _1269 * _1231;
    float _1307 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1309 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1311 = 1.0 / _1303;
    float _1313 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1315 = -_1307;
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1315);
    float _1319 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = -_1295;
    float _1323 = fma(_1321, _1309, 1.0);
    float _1325 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1313);
    float _1327 = -_1301;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1317);
    float _1331 = -_1181;
    float _1333 = _1169 + _1331;
    float _1335 = floor(_1293);
    float _1337 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1339 = fma(_1329, -0.5, 0.5);
    float _1341 = fma(_1329, 0.5, 0.5);
    float _1343 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1337);
    float _1345 = exp2(_1319);
    float _1347 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1343);
    float _1349 = log2(_1323);
    float _1351 = -_1335;
    float _1353 = _1293 + _1351;
    float _1355 = _1305 + 1.0;
    float _1357 = fma(_1341, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1359 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1325);
    float _1361 = fma(_1341, _1357, -0.212114393711090087890625);
    float _1363 = sqrt(_1339);
    float _1365 = -_1305;
    float _1367 = fma(_1345, _1355, _1365);
    float _1369 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1347);
    float _1371 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1359);
    float _1373 = fma(_1341, _1361, 1.570728778839111328125);
    float _1375 = fma(_1367, 0.5, 0.5);
    float _1377 = _1369 * _1311;
    float _1379 = _1349 * 0.693147182464599609375;
    float _1381 = _1371 * _1311;
    float _1383 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = fma(_1377, 0.5, 0.5);
    float _1387 = _1363 * 0.636619746685028076171875;
    float _1389 = fma(_1381, -0.5, 0.5);
    float _1391 = -_1373;
    float _1393 = fma(_1387, _1391, 1.0);
    float2 _4378 = float2(_1333, _1353);
    float _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4378, float2(0.0), isnan(_4378)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4378, float2(0.0), isnan(_4378)), level(0.0)).x;
    float3 _4389 = float3(_1385, _1389, _1383);
    float _1397 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4389, float3(0.0), isnan(_4389)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4389, float3(0.0), isnan(_4389)), level(0.0)).x;
    float3 _4400 = float3(_1385, _1389, _1383);
    float4 _1400 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4400, float3(0.0), isnan(_4400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4400, float3(0.0), isnan(_4400)), level(0.0)).xyzw;
    float _1402 = _1400.x;
    float _1404 = _1400.y;
    float _1406 = _1400.z;
    float _1408 = _1400.w;
    float2 _4416 = float2(_1393, _1375);
    float3 _1412 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4416, float2(0.0), isnan(_4416)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4416, float2(0.0), isnan(_4416)), level(0.0)).xyz;
    float _1414 = _1412.x;
    float _1416 = _1412.y;
    float _1418 = _1412.z;
    float _1420 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1422 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1426 = _315 + _1424;
    float _1428 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1420);
    float _1430 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1422);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1436 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1428);
    float _1438 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1430);
    float _1440 = in.m_56.w;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1448 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1450 = 1.0 / _1434;
    float _1452 = -_569;
    float _1454 = _1452 + 1.0;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1458 = _1456 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1460 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1462 = isnan(_315);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = -_611;
    float _1474 = _1472 + 1.0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    float _1480 = 1.0 / _1446;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1484 = _1482 != 0;
    float _1486 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1490 = _1488 != 0;
    float _1492 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1496 = _1494 != 0;
    float _1498 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    bool _1500 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1502 = isnan(_315);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = 1.0 / _1444;
    float _1514 = _1448 + _1446;
    float _1516 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1498);
    bool _1518 = _1440 > 0.5;
    out.m_68.x = _1071;
    out.m_68.y = _1067;
    out.m_68.z = _1075;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1520;
    float _1524 = _1514 * _1480;
    float _1526 = _1524 * 0.5;
    float _1528 = 1.0 / _1458;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1534 = _323 > 0.5;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1536);
    float _1540 = -_1510;
    float _1542 = _1540 + 1.0;
    bool _1544 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1546 = isnan(_315);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = _1522 * _1450;
    float _1558 = _1532 * _1512;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1560;
    float _1564 = 1.0 / _1538;
    float _1566 = _1470 * _1542;
    float _1568 = -_1554;
    float _1570 = _1568 + 1.0;
    bool _1572 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1574 = isnan(_315);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = fma(_1558, _1426, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1586 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1588 = isnan(_315);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1594 = _1590 || _1592;
    float _1596 = float(_1594);
    float _1598 = _1562 * _1528;
    float _1600 = -_1470;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1606 = _315 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1612 = _317 > 0.5;
    float _1614 = _1554 * _1602;
    float _1616 = fma(_1556, _1606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1618 = _1582 * _1570;
    float _1620 = -_1582;
    float _1622 = _1620 + 1.0;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1626 = _1564 * _1624;
    float _1628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1632 = _315 + _1630;
    float _1634 = _1596 * _1622;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1642 = _315 + _1640;
    float _1644 = fma(_1598, _1632, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1646 = _1616 * _1634;
    float _1648 = -_1596;
    float _1650 = _1648 + 1.0;
    float _1652 = abs(_1626);
    float _1654 = log2(_1652);
    float _1656 = -_177;
    int _1658 = _1612 ? as_type<int>(_1656) : as_type<int>(_177);
    float _1660 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1646);
    float _1662 = -_181;
    int _1664 = _1518 ? as_type<int>(_1662) : as_type<int>(_181);
    bool _1666 = !_1478;
    float _1668 = _1666 ? _177 : as_type<float>(_1658);
    float _1670 = fma(_1584, _1618, _1660);
    float _1672 = 1.0 / _1610;
    bool _1674 = _419 > 0.5;
    float _1676 = _1668 + 0.5;
    float _1678 = fma(_1644, _1614, _1670);
    float _1680 = -_177;
    int _1682 = _1534 ? as_type<int>(_1680) : as_type<int>(_177);
    bool _1684 = !_1484;
    float _1686 = _1684 ? _181 : as_type<float>(_1664);
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1690 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1692 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1694 = -_181;
    int _1696 = _1674 ? as_type<int>(_1694) : as_type<int>(_181);
    float _1698 = _1686 + (-0.5);
    bool _1700 = !_1490;
    float _1702 = _1700 ? _177 : as_type<float>(_1682);
    float _1704 = fma(_1692, _1676, _599);
    bool _1706 = !_1496;
    float _1708 = _1706 ? _181 : as_type<float>(_1696);
    float _1710 = exp2(_1690);
    float _1712 = _1638 * _1672;
    float _1714 = _1702 + 0.5;
    float _1716 = -_1454;
    float _1718 = fma(_1668, _1716, _1704);
    float _1720 = -_1708;
    float _1722 = _1720 + 0.5;
    float _1724 = fma(_1712, _1642, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1726 = _857 * _883;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1730 = fma(_1724, _1566, _1678);
    float _1732 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1730);
    float _1738 = -_1732;
    float _1740 = -_623;
    float _1742 = fma(_1738, _1698, _1740);
    float _1744 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1748 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1750 = precise::clamp(_1748, 0.0, 1.0);
    float _1752 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1754 = fma(_1686, _1474, _1742);
    float _1756 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1760 = _1744 * _1728;
    float _1762 = fma(_1750, -2.0, 3.0);
    float _1764 = _1750 * _1750;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1768 = _829 * _871;
    float _1770 = _1764 * _1762;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1774 = _1752 * _1746;
    float _1776 = _829 * _883;
    float _1778 = _829 * _923;
    float _1780 = _849 * _923;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1784 = _849 * _883;
    out.m_70.x = _1760;
    out.m_70.y = _1774;
    out.m_70.z = _1718;
    out.m_70.w = _1754;
    float _1786 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _849 * _871;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_72.x = _1786;
    out.m_72.y = _1772;
    out.m_72.z = _1756;
    float _1796 = fma(_833, _843, _1788);
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _857 * _923;
    float _1806 = -_827;
    float _1808 = fma(_1806, _841, _1778);
    bool _1810 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1812 = isnan(0.5);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1818 = _1814 || _1816;
    float _1820 = fma(_833, _841, _1780);
    float _1822 = -_827;
    float _1824 = fma(_1822, _843, _1768);
    float _1826 = fma(_833, _839, _1784);
    float _1828 = -_1770;
    float _1830 = _1828 + 1.0;
    float _1832 = _857 * _871;
    float _1834 = -_827;
    float _1836 = fma(_1834, _839, _1776);
    out.m_74.x = _1798;
    out.m_74.y = _1800;
    out.m_74.z = _1802;
    out.m_74.w = _1758;
    float _1838 = fma(_835, _839, _1726);
    float _1840 = fma(_835, _843, _1832);
    float _1842 = fma(_853, _705, _1820);
    float _1844 = fma(_835, _841, _1804);
    float _1846 = in.m_76.x;
    float _1848 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1850 = exp2(_1492);
    float _1852 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1770);
    float _1854 = fma(_831, _705, _1808);
    float _1856 = fma(_877, _703, _1838);
    float _1858 = fma(_877, _705, _1844);
    float _1860 = fma(_831, _707, _1824);
    float _1862 = fma(_853, _703, _1826);
    float _1864 = fma(_831, _703, _1836);
    float _1866 = fma(_853, _707, _1796);
    float _1868 = fma(_877, _707, _1840);
    float _1870 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1872 = _1848 * _1864;
    float _1874 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1516);
    bool _1876 = _1626 <= 8000.0;
    bool _1878 = isnan(_1626);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(8000.0);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = _1848 * _1854;
    float _1890 = fma(_1870, _1862, _1872);
    float _1892 = _1848 * _1860;
    float _1894 = _1874 + _1303;
    float _1896 = _1886 * _1852;
    float _1898 = fma(_1870, _1842, _1888);
    float _1900 = fma(_1870, _1866, _1892);
    float _1902 = _1894 * 0.5;
    float _1904 = _1852;
    float _1906 = _1902;
    float _1908 = _1303;
    float _1910 = _1874;
    float _1912 = _1371;
    float _1914 = _1369;
    if (_1818)
    {
        _1904 = 1.0;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (!_1818)
    {
        float _1920 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1926 = _1922 * 6.283185482025146484375;
        float _1928 = cos(_1926);
        float _1930 = _1924 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1928;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1948;
        float _1952 = _1940 * _1942;
        float _1954 = 1.0 / _1950;
        float _1956 = 1.0 / _1952;
        float _1958 = _1946 * _1956;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1626, _1958, _1960);
        float _1964 = _1962 * _1954;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1918 = _1966;
    }
    float _1968 = _1918;
    float _1970 = _1856 + _1890;
    float _1972 = -_1850;
    float _1974 = _1972 + 1.0;
    float _1976 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1978 = -_1395;
    float _1980 = _1978 + 1.0;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.z = _1902;
    out.m_78.w = _1303;
    float _1984 = _1980 * _1976;
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = _1858 + _1898;
    float _1990 = _1982 * _1397;
    float _1992 = -_1982;
    float _1994 = _1992 + 1.0;
    float _1996 = -_1986;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2000 = _1868 + _1900;
    float _2002 = _1408 * _1990;
    float _2004 = _1418 * _1990;
    float _2006 = _1998 * _1846;
    float _2008 = _1408 * _1994;
    float _2010 = fma(_1414, _2002, _1402);
    float _2012 = fma(_1416, _2002, _1404);
    float _2014 = _2006 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2016 = fma(_1408, _2004, _1406);
    out.m_80.x = _1970;
    out.m_80.y = _1988;
    out.m_80.z = _2000;
    bool _2018 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2020 = isnan(_1093);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2026 = _2022 || _2024;
    float _2028 = _1968 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2014;
    out.m_84.x = _2010;
    out.m_84.y = _2012;
    out.m_84.z = _2016;
    out.m_84.w = _2008;
    out.gl_Position.x = _1369;
    out.gl_Position.y = _1371;
    out.gl_Position.z = _1874;
    out.gl_Position.w = _1303;
    float _2030 = _2006;
    if (!_2026)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2032 = _2030;
    float _2034 = _2032;
    float _2036 = _2032;
    if (!_2026)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2038 = _1906;
    float _2040 = _2038;
    float _2042 = _2038;
    if (!_2026)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2044 = _1908;
    float _2046 = _2044;
    float _2048 = _2044;
    if (!_2026)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2050 = _1910;
    float _2052 = _2050;
    float _2054 = _2050;
    if (!_2026)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2056 = _1912;
    float _2058 = _2056;
    float _2060 = _2056;
    if (!_2026)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2062 = _1914;
    bool _2064 = !_2026;
    float _2066 = _2062;
    float _2068 = _2062;
    if (!_2064)
    {
        bool _2070 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2072 = isnan(_1093);
        bool _2074 = _2070 || _2072;
        bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2078 = _2074 || _2076;
        if (!_2078)
        {
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = _1093 + _2080;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2086 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2084;
            float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2092 = 1.0 / _2086;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2110 = _2082 * _2092;
            float _2112 = precise::clamp(_2110, 0.0, 1.0);
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2118 = fma(_2112, _2090, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2120 = fma(_2112, _2116, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2122 = fma(_2112, _2096, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2124 = fma(_2112, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2126 = fma(_2112, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2128 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2042 = _2122;
            _2060 = _2126;
            _2036 = _2118;
            _2054 = _2124;
            _2048 = _2120;
            _2068 = _2128;
            _2130 = true;
        }
        else
        {
            bool _2132 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2134 = isnan(_1093);
            bool _2136 = _2132 || _2134;
            bool _2138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2140 = _2136 || _2138;
            if (!_2140)
            {
                _2034 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2142 = _2034;
            _2036 = _2142;
            if (!_2140)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2144 = _2040;
            _2042 = _2144;
            if (!_2140)
            {
                _2046 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2146 = _2046;
            _2048 = _2146;
            if (!_2140)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2148 = _2052;
            _2054 = _2148;
            if (!_2140)
            {
                _2058 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2150 = _2058;
            _2060 = _2150;
            if (!_2140)
            {
                _2066 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2152 = _2066;
            bool _2154 = !_2140;
            _2068 = _2152;
            if (!_2154)
            {
                bool _2156 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2158 = isnan(_1093);
                bool _2160 = _2156 || _2158;
                bool _2162 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2164 = _2160 || _2162;
                if (!_2164)
                {
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = _1093 + _2166;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2172 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2170;
                    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2178 = 1.0 / _2172;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2196 = _2168 * _2178;
                    float _2198 = precise::clamp(_2196, 0.0, 1.0);
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2204 = fma(_2198, _2176, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2206 = fma(_2198, _2202, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2208 = fma(_2198, _2182, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2210 = fma(_2198, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2212 = fma(_2198, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2214 = fma(_2198, _2194, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2042 = _2208;
                    _2060 = _2212;
                    _2036 = _2204;
                    _2054 = _2210;
                    _2048 = _2206;
                    _2068 = _2214;
                    _2130 = true;
                }
                else
                {
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2060 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2036 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2048 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2068 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2130 = false;
    float _2216 = _2042;
    float _2218 = _2060;
    float _2220 = _2036;
    float _2222 = _2054;
    float _2224 = _2048;
    float _2226 = _2068;
    float _2228 = fma(_1988, -0.5, 0.5);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    float _2236 = _2028 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = -_2220;
    float _2240 = _2238 + _2222;
    float _2242 = fma(_2230, _2234, _2216);
    out.m_86.x = 0.0;
    float _2244 = -_2224;
    float _2246 = _2244 + _2226;
    float _2248 = fma(_2230, _2240, _2220);
    float _2250 = _2242 * 0.586610972881317138671875;
    out.m_49.x = _2236;
    bool _2252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2254 = fma(_2230, _2246, _2224);
    float _2256 = fma(_2248, 0.298911988735198974609375, _2250);
    bool _2258 = _1968 > 0.0;
    bool _2260 = isnan(_1968);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan(0.0);
    bool _2266 = _2262 || _2264;
    float _2268 = fma(_2254, 0.114477999508380889892578125, _2256);
    float _2270 = -_2268;
    float _2272 = _2248 + _2270;
    float _2274 = -_2268;
    float _2276 = _2242 + _2274;
    float _2278 = -_2268;
    float _2280 = _2254 + _2278;
    float _2282 = fma(_2272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    float _2284 = fma(_2276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    float _2286 = fma(_2280, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2268);
    bool _2288 = !_2252;
    if (!_2288)
    {
        float _2290 = -_1057;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2294 = -_1059;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2298 = -_1061;
        float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2302 = _2292 * _2292;
        float _2304 = fma(_2296, _2296, _2302);
        float _2306 = fma(_2300, _2300, _2304);
        float _2308 = sqrt(_2306);
        float _2310 = rsqrt(_2306);
        float _2312 = -_2308;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2318 = precise::clamp(_2316, 0.0, 1.0);
        float _2320 = _2296 * _2310;
        float _2322 = _2292 * _2310;
        float _2324 = abs(_2318);
        float _2326 = log2(_2324);
        float _2328 = _2300 * _2310;
        float _2330 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2332 = _1988 * _2322;
        float _2334 = -_2322;
        float _2336 = -_2330;
        float _2338 = fma(_2334, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2336);
        float _2340 = fma(_1970, _2320, _2332);
        float _2342 = -_2328;
        float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2338);
        float _2346 = fma(_2000, _2328, _2340);
        float _2348 = precise::clamp(_2346, 0.0, 1.0);
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2352 = _2344 + _2350;
        float _2354 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = exp2(_2354);
        float _2362 = _2360 * _2358;
        float _2364 = _2348 * _2362;
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2368 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2370 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2366;
        out.m_86.y = _2368;
        out.m_86.z = _2370;
    }
    out.m_88.x = _2282;
    out.m_88.y = _2284;
    out.m_88.z = _2286;
    if (_2266)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2372 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2372;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

