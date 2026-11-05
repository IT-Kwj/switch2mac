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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_10 [[id(6)]];
    sampler vp_t_tcb_10Smplr [[id(7)]];
    sampler vp_t_tcb_10Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_54 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_52 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_58 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_46 [[attribute(7)]];
    float4 m_48 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1721 = false;
    bool _499 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_37.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_40.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3342 = as_type<float>(_97);
        out.gl_Position.z = _3342;
    }
    if (!_85)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_42.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_40.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3412 = as_type<float>(_135);
        out.gl_Position.z = _3412;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_44.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = 0.0;
    if (!_153)
    {
        float _159 = _143 * _143;
        float _161 = _159 * 0.5;
        _157 = _161;
    }
    float _163 = _157;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _167 = _163;
    if (!_153)
    {
        float _169 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    float _173 = in.m_42.x;
    float _175 = in.m_42.y;
    float _177 = in.m_42.z;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = 1.4012984643248170709237295832899e-45;
    float _195 = _171;
    if (!_153)
    {
        _193 = _143;
    }
    float _197 = _193;
    float _199 = -_181;
    float _201 = _165 + _199;
    bool _203 = !_153;
    float _205 = _197;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _143 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _143);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _235;
    }
    float _237 = _195;
    bool _239 = !_153;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _143 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _205 = _259;
    }
    float _261 = _205;
    float _263 = in.m_46.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = in.m_37.x;
    float _275 = in.m_37.y;
    float _277 = in.m_37.z;
    float _279 = -_201;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _283 = _201 < 0.5;
    float _285 = float(_283);
    bool _287 = !_267;
    int _289 = _287 ? 0 : 1;
    float _291 = fma(_191, 0.5, 0.5);
    bool _293 = !_187;
    int _295 = _293 ? 0 : 1;
    float _297 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _299 = abs(_289);
    float _301 = -_285;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_291;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = fma(_261, _173, _297);
    int _311 = abs(_295);
    float _313 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _315 = !_271;
    int _317 = _315 ? 0 : 1;
    float _319 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _323 = abs(_317);
    float _325 = fma(_261, _175, _313);
    float _327 = float(_299);
    float _329 = fma(_261, _177, _319);
    float _331 = float(_311);
    float _333 = abs(_281);
    float _335 = _327 * _333;
    float _337 = fma(_329, _263, _277);
    float _339 = float(_323);
    float _341 = fma(_331, _307, _335);
    float _343 = fma(_309, _263, _273);
    float _345 = fma(_325, _263, _275);
    float _347 = abs(_303);
    float _349 = fma(_339, _347, _341);
    bool _351 = !_321;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_81);
        float _373 = 1.0 / _371;
        float _375 = _115 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _377 + _379;
    float _383 = in.m_46.x;
    float _385 = in.m_46.y;
    float _387 = in.m_46.z;
    bool _389 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_377);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    bool _405 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_377);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -_399;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = 1.0 / _403;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _429 = _415 * _419;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = _381 * _425;
    float _437 = fma(_423, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _443;
    float _447 = fma(_441, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = fma(_445, _435, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _451 = _437 * _429;
    float _453 = _447 * _429;
    float _455 = _449 * _429;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _463 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].x, _457);
    float _465 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].y, _459);
    float _467 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].z, _461);
    float _469 = _463 * _383;
    float _471 = _465 * _385;
    float _473 = _467 * _387;
    bool _475 = !_427;
    bool _477 = _427;
    float _479 = _465;
    int _495;
    float _497;
    if (!_475)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _483 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = as_type<int>(_487);
        _497 = _493;
        _499 = true;
    }
    else
    {
        float _501 = float(_81);
        float _503 = 1.0 / _501;
        float _505 = _115 * _503;
        _495 = as_type<int>(_503);
        _497 = _505;
    }
    _499 = false;
    int _507 = _495;
    float _509 = _497;
    float _511 = in.m_48.x;
    float _513 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = in.m_44.z;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _519 = _517 != 0;
    float _521 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _525 = _523 != 0;
    float _527 = in.m_44.w;
    float _529 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _531 = in.m_44.y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _535 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
    float _537 = in.m_48.y;
    float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _541 = _507;
    if (_519)
    {
        bool _543 = _137 > 0.5;
        _477 = _543;
    }
    bool _545 = _477;
    float _547 = _511;
    if (_519)
    {
        float _549 = -_511;
        float _551 = _549 + 1.0;
        _541 = as_type<int>(_551);
    }
    int _553 = _541;
    int _555 = _553;
    if (!_519)
    {
        _479 = _511;
    }
    float _557 = _479;
    float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _561 = log2(_559);
    float _563 = _557;
    if (_519)
    {
        float _565 = _545 ? as_type<float>(_553) : _511;
        _563 = _565;
    }
    float _567 = _563;
    if (_525)
    {
        float _569 = -_511;
        float _571 = _569 + 1.0;
        _555 = as_type<int>(_571);
    }
    int _573 = _555;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _585 = _583 != 0;
    bool _587 = false;
    if (_525)
    {
        bool _589 = _515 > 0.5;
        _587 = _589;
    }
    bool _591 = _587;
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _601 = _599 != 0;
    float _603 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_525)
    {
        float _605 = _591 ? as_type<float>(_573) : _511;
        _547 = _605;
    }
    float _607 = _547;
    float _609 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _613 = _611 != 0;
    float _615 = _137 * 2.0;
    float _617 = -_533;
    float _619 = fma(_609, 2.0, _617);
    bool _621 = _527 > 0.5;
    float _623 = _531 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _627 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _603);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _629;
    float _633 = fma(_623, -2.0, _625);
    float _635 = floor(_615);
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _639 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _627);
    float _641 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
    float _643 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _645 = _531 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _651 = -_537;
    float _653 = _651 + 1.0;
    float _655 = 1.0 / _631;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _661 = _137 + _531;
    int _663 = _621 ? as_type<int>(_653) : as_type<int>(_537);
    float _665 = _561 * _115;
    float _667 = _661 + (-1.0);
    float _669 = 1.0 / _649;
    float _671 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _677 = _635 > 0.0;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _681 = _509 + _679;
    float _683 = _597 ? as_type<float>(_663) : _537;
    float _685 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_50.x = _671;
    out.m_50.y = _673;
    out.m_50.z = _675;
    float _687 = floor(_645);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _691 = _509 + _689;
    bool _693 = _635 >= 0.0;
    bool _695 = isnan(_635);
    bool _697 = _693 || _695;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _703;
    float _707 = _691 * _655;
    float _709 = _531 + _515;
    float _711 = _681 * _669;
    float _713 = _635;
    float _715 = _537;
    float _717 = _681;
    float _719 = _653;
    if (!_613)
    {
        _713 = _531;
    }
    float _721 = _713;
    float _723 = _709 + (-1.0);
    float _725 = _515 * 2.0;
    int _727 = _701 ? 0 : 1;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _733 = _531 > 0.5;
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _737 = ~_727;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = floor(_725);
    float _745 = _723;
    int _747 = _741;
    float _749 = _721;
    if (_601)
    {
        float _751 = _733 ? _653 : _537;
        _715 = _751;
    }
    float _753 = _715;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _757 = _687 > 0.0;
    float _759 = _593 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _761 = _687 >= 0.0;
    bool _763 = isnan(_687);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    float _771 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _773 = _687;
    if (!_613)
    {
        _745 = _137;
    }
    float _775 = _745;
    float _777 = exp2(_665);
    float _779 = _775;
    if (!_613)
    {
        _717 = _531;
    }
    float _781 = _717;
    float _783 = fma(_759, _753, -0.5);
    float _785 = _781;
    if (!_613)
    {
        _773 = _515;
    }
    float _787 = _773;
    float _789 = _787;
    if (!_613)
    {
        _719 = _515;
    }
    float _791 = _719;
    float _793 = _791;
    if (!_677)
    {
        int _795 = ~_727;
        int _797 = _795 + 1;
        _747 = _797;
    }
    int _799 = _747;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _801;
    if (_613)
    {
        _779 = _515;
    }
    float _805 = _779;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    if (_613)
    {
        _749 = _137;
    }
    float _811 = _749;
    float _813 = fma(_803, _707, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    if (_613)
    {
        _785 = _137;
    }
    float _815 = _785;
    float _817 = fma(_809, _711, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    if (_613)
    {
        _789 = _531;
    }
    float _819 = _789;
    float _821 = -_777;
    float _823 = _821 + 1.0;
    if (_613)
    {
        _793 = _531;
    }
    float _825 = _793;
    bool _827 = _743 > 0.0;
    float _829 = _819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _831 = _743 >= 0.0;
    bool _833 = isnan(_743);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _849 = fma(_843, _707, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _851 = fma(_705, _707, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _853 = fma(_731, _711, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _855 = _539 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _857 = fma(_847, _711, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _859 = fma(_683, _855, -0.5);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _863 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _865 = isnan(_509);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _879 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[84].z, _861);
    bool _881 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _883 = isnan(_509);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = -_873;
    float _895 = _893 + 1.0;
    float _897 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[83].z, _875);
    bool _899 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_509);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].w, _877);
    float _913 = _891 * _895;
    float _915 = -_891;
    float _917 = _915 + 1.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _921 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _897);
    float _923 = _909 * _917;
    float _925 = -_909;
    float _927 = _925 + 1.0;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _931 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _933 = _813 * _923;
    float _935 = _849 * _923;
    float _937 = _851 * _923;
    float _939 = -_929;
    float _941 = fma(_931, 2.0, _939);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].y, _933);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].x, _935);
    int _947 = _839 ? 0 : 1;
    float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _951 = fma(_829, -2.0, _755);
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _955 = ~_947;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = fma(_857, _913, _945);
    int _963 = _959;
    if (!_827)
    {
        int _965 = ~_947;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[79].z, _953);
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _975 = _769 ? 0 : 1;
    float _977 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].z, _937);
    bool _979 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _981 = isnan(1.0);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _987 = _983 || _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _991 = 1.0 + _989;
    float _993 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[79].x, _971);
    int _995 = ~_975;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    float _1001 = fma(_853, _913, _977);
    float _1003 = _993 * (-0.15915493667125701904296875);
    int _1005 = _999;
    if (!_757)
    {
        int _1007 = ~_975;
        int _1009 = _1007 + 1;
        _1005 = _1009;
    }
    int _1011 = _1005;
    float _1013 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _633);
    float _1015 = 1.0 / _991;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1019 = _949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1021 = fma(_817, _913, _943);
    float _1023 = -_115;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _941);
    bool _1027 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1035 = _1031 || _1033;
    float _1037 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1017);
    float _1039 = _973 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1041 = _1003 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    float _1045 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[78].w, _919);
    float _1047 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[84].x, _879);
    float _1049 = fma(_1019, _567, -0.5);
    float _1051 = _641 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1053 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1037);
    float _1055 = -_115;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _619);
    float _1059 = _1035 ? _823 : 0.0;
    float _1061 = _1003 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    float _1067 = fma(_1039, _607, -0.5);
    float _1069 = _1047 * (-0.15915493667125701904296875);
    float _1071 = _639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1051 + _1073;
    float _1077 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _911);
    float _1079 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _951);
    if (_987)
    {
        float _1081 = _1059 * _1015;
        _117 = _1081;
    }
    float _1083 = _117;
    bool _1085 = !_581;
    int _1087 = _1085 ? 0 : 1;
    float _1089 = _1069 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = _1071 + _1093;
    float _1097 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1099 = abs(_1087);
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _771 + _1101;
    float _1105 = _1043 * _783;
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1097);
    float _1109 = _1063 * _783;
    float _1111 = _1069 * 6.283185482025146484375;
    float _1113 = cos(_1111);
    float _1115 = -_1105;
    float _1117 = fma(_1063, _1049, _1115);
    float _1119 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1107);
    float _1121 = _1075 * _1075;
    float _1123 = float(_1099);
    float _1125 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].x, _961);
    float _1127 = float(_799);
    float _1129 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1021);
    float _1131 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1001);
    bool _1133 = _1119 >= 0.0;
    float _1135 = fma(_1095, _1095, _1121);
    float _1137 = fma(_1043, _1049, _1109);
    float _1139 = _1123 * _1127;
    float _1141 = _1091 * _859;
    float _1143 = fma(_1053, _1117, _1057);
    float _1145 = fma(_1103, _1103, _1135);
    float _1147 = _1113 * _859;
    float _1149 = -_1013;
    float _1151 = fma(_1065, _1137, _1149);
    float _1153 = -_1141;
    float _1155 = fma(_1113, _1067, _1153);
    float _1157 = in.m_52.x;
    float _1159 = in.m_52.y;
    float _1161 = in.m_52.z;
    float _1163 = fma(_1091, _1067, _1147);
    float _1165 = rsqrt(_1145);
    float _1167 = fma(_921, _1155, _1025);
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1171 = -_1079;
    float _1173 = fma(_1077, _1163, _1171);
    float _1175 = _1129 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1177 = _1163;
    if (_1133)
    {
        _1177 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1179 = _1177;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1183 = !_577;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1189 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1195 = _1143 + 0.5;
    int _1197 = as_type<int>(_1179);
    if (_1133)
    {
        float _1199 = _1179 * 5.0;
        _1197 = as_type<int>(_1199);
    }
    int _1201 = _1197;
    float _1203 = _1151 + 0.5;
    float _1205 = _1167 + 0.5;
    float _1207 = _1173 + 0.5;
    int _1209 = abs(_1185);
    out.m_54.x = _1189;
    out.m_54.y = _1191;
    out.m_54.z = _1193;
    out.m_54.w = _1187;
    float _1211 = _531 + (-0.5);
    bool _1213 = !_585;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = _1095 * _1165;
    if (_1133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5144 = as_type<float>(_1201);
        out.gl_Position.z = _5144;
    }
    float _1219 = _1075 * _1165;
    out.m_56.x = _1195;
    out.m_56.y = _1203;
    out.m_56.z = _1205;
    out.m_56.w = _1207;
    if (_1133)
    {
        out.m_40.x = 0.0;
    }
    if (_1133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1221 = _1139 * (-2.0);
    float _1223 = -_1219;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1051);
    float _1227 = float(_1209);
    float _1229 = _1103 * _1165;
    float _1231 = fma(_1221, _1159, _1159);
    float _1233 = -_1217;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1071);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1225 + _1237;
    float _1241 = float(_969);
    float _1243 = fma(_735, _1221, _735);
    float _1245 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1231);
    float _1247 = -_1229;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1253 = _1235 + _1251;
    float _1255 = _1239 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1257 = fma(_1243, _1083, _1245);
    float _1259 = _1227 * _1241;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _1249 + _1261;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    float _1267 = _1257 * 0.15915493667125701904296875;
    float _1269 = _1259 * (-2.0);
    float _1271 = -_1219;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1075);
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1265);
    float _1277 = _137 + (-0.5);
    float _1279 = fma(_1269, _1157, _1157);
    int _1281 = abs(_1215);
    float _1283 = -_1217;
    float _1285 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    bool _1287 = _1275 >= 0.0;
    float _1289 = _1273 * _1273;
    float _1291 = fma(_685, _1269, _685);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1279);
    float _1295 = fma(_1285, _1285, _1289);
    float _1297 = -_1229;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1301 = fma(_1291, _1083, _1293);
    float _1303 = float(_1281);
    float _1305 = _137 + _515;
    float _1307 = float(_1011);
    float _1309 = fma(_1299, _1299, _1295);
    float _1311 = _1301 * 0.15915493667125701904296875;
    float _1313 = _1275;
    float _1315 = _1229;
    if (_1287)
    {
        _1313 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1317 = _1313;
    float _1319 = _1303 * _1307;
    float _1321 = _1305 + (-1.0);
    float _1323 = sqrt(_1309);
    int _1325 = as_type<int>(_1317);
    if (_1287)
    {
        float _1327 = _1317 * 5.0;
        _1325 = as_type<int>(_1327);
    }
    int _1329 = _1325;
    if (_1287)
    {
        out.m_40.x = 0.0;
    }
    float _1331 = _1319 * (-2.0);
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5353 = as_type<float>(_1329);
        out.gl_Position.z = _5353;
    }
    float _1333 = _1311 * 6.283185482025146484375;
    float _1335 = sin(_1333);
    float _1337 = _1267 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = _1267 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    if (_1287)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1345 = -_1051;
    float _1347 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = -_1071;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1355 = -_771;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1359 = _1347 * _1347;
    float _1361 = fma(_1331, _1161, _1161);
    float _1363 = _515 + (-0.5);
    float _1365 = fma(_1353, _1331, _1353);
    float _1367 = fma(_1351, _1351, _1359);
    float _1369 = _1311 * 6.283185482025146484375;
    float _1371 = cos(_1369);
    float _1373 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1361);
    float _1375 = fma(_1357, _1357, _1367);
    float _1377 = in.m_58.x;
    float _1379 = in.m_58.y;
    float _1381 = in.m_58.z;
    float _1383 = fma(_1365, _1083, _1373);
    float _1385 = _1335 * _1339;
    float _1387 = rsqrt(_1375);
    float _1389 = _1383 * 0.15915493667125701904296875;
    float _1391 = _1165 * _1323;
    float _1393 = _1389 * 6.283185482025146484375;
    float _1395 = sin(_1393);
    float _1397 = _1371 * _1343;
    float _1399 = _1351 * _1387;
    float _1401 = _1357 * _1387;
    float _1403 = _1347 * _1387;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1407 = _1399 * _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1411 = _1401 * _1409;
    float _1413 = _1389 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1419 = -_1407;
    float _1421 = fma(_1401, _1417, _1419);
    float _1423 = fma(_1395, _1397, _1385);
    float _1425 = fma(_1395, _1385, _1397);
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1429 = _1403 * _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1433 = -_1411;
    float _1435 = fma(_1403, _1431, _1433);
    float _1437 = _1421 * _1421;
    float _1439 = _471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1443 = -_1429;
    float _1445 = fma(_1399, _1441, _1443);
    float _1447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1379);
    float _1449 = fma(_1435, _1435, _1437);
    float _1451 = _469 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1453 = _1391 * _1439;
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1377);
    float _1457 = fma(_1445, _1445, _1449);
    float _1459 = _1391 * _1451;
    float _1461 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1463 = _1447 * _1453;
    float _1465 = rsqrt(_1457);
    float _1467 = _1371 * _1339;
    float _1469 = _1335 * _1343;
    float _1471 = _1455 * _1459;
    float _1473 = _1391 * _1461;
    float _1475 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1381);
    float _1477 = _1415 * _1463;
    float _1479 = -_1467;
    float _1481 = fma(_1395, _1469, _1479);
    float _1483 = -_1469;
    float _1485 = fma(_1395, _1467, _1483);
    float _1487 = -_1463;
    float _1489 = _1395 * _1487;
    float _1491 = _1343 * _1415;
    float _1493 = _1371 * _1477;
    float _1495 = _1475 * _1473;
    float _1497 = _1335 * _1477;
    float _1499 = fma(_1491, _1471, _1489);
    float _1501 = fma(_1423, _1471, _1493);
    float _1503 = _1421 * _1465;
    float _1505 = _1435 * _1465;
    float _1507 = _1445 * _1465;
    float _1509 = _1339 * _1415;
    float _1511 = _1401 * _1503;
    float _1513 = _1403 * _1505;
    float _1515 = fma(_1485, _1495, _1501);
    float _1517 = fma(_1481, _1471, _1497);
    float _1519 = -_1511;
    float _1521 = fma(_1403, _1507, _1519);
    float _1523 = -_1513;
    float _1525 = fma(_1399, _1503, _1523);
    float _1527 = fma(_1509, _1495, _1499);
    float _1529 = fma(_1425, _1495, _1517);
    float _1531 = _1521 * _1515;
    float _1533 = _1525 * _1515;
    float _1535 = fma(_1505, _1527, _1531);
    float _1537 = fma(_1507, _1527, _1533);
    float _1539 = fma(_1399, _1529, _1535);
    float _1541 = fma(_1401, _1529, _1537);
    float _1543 = _1399 * _1507;
    float _1545 = _1071 + _1539;
    float _1547 = _771 + _1541;
    float _1549 = -_1543;
    float _1551 = fma(_1401, _1505, _1549);
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1555 = _1545 + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1547 + _1557;
    float _1561 = _1551 * _1515;
    float _1563 = _1555 * _1555;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1503, _1527, _1561);
    float _1569 = _1563 + _1565;
    float _1571 = fma(_1403, _1529, _1567);
    float _1573 = sqrt(_1569);
    float _1575 = _1051 + _1571;
    bool _1577 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1579 = _1527;
    float _1581 = _1529;
    float _1583 = _1507;
    float _1585 = _1401;
    float _1587 = _1565;
    float _1589 = _1561;
    if (!_1577)
    {
        _1579 = _1563;
    }
    float _1591 = _1579;
    float _1593 = _1591;
    if (!_1577)
    {
        _1581 = _1545;
    }
    float _1595 = _1581;
    float _1597 = _1595;
    if (!_1577)
    {
        _1583 = _1547;
    }
    float _1599 = _1583;
    float _1601 = _1599;
    if (!_1577)
    {
        _1585 = _1575;
    }
    float _1603 = _1585;
    bool _1605 = !_1577;
    float _1607 = _1603;
    if (!_1605)
    {
        float _1609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1613 = _1573 + _1611;
        float _1615 = rsqrt(_1569);
        float _1617 = _1613 * _1609;
        float _1619 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1621 = _1617 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1621 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = fma(_1625, _1619, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1633 = _1615 * _1631;
        float _1635 = _1629 + (-1.0);
        float _1637 = fma(_1555, _1633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1639 = fma(_1559, _1633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1641 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1645 = _1637 + _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1649 = _1639 + _1647;
        float _1651 = fma(_1575, _1629, _1641);
        float _1653 = _1645 * _1645;
        float _1655 = _1649 * _1649;
        _1607 = _1651;
        _1593 = _1653;
        _1587 = _1655;
        _1597 = _1637;
        _1601 = _1639;
    }
    float _1657 = _1607;
    float _1659 = _1593;
    float _1661 = _1587;
    float _1663 = _1597;
    float _1665 = _1601;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1669 = _1657 + _1667;
    float _1671 = fma(_1669, _1669, _1659);
    float _1673 = _1671 + _1661;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1679 = isnan(_1675);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1685 = _1681 || _1683;
    if (!_1685)
    {
        _1589 = 1.0;
    }
    float _1687 = _1589;
    bool _1689 = !_1685;
    float _1691 = _1687;
    if (!_1689)
    {
        bool _1693 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1695 = isnan(_1675);
        bool _1697 = _1693 || _1695;
        bool _1699 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1701 = _1697 || _1699;
        if (!_1701)
        {
            float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1705 = _1675 + _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1709 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1707;
            float _1711 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1715 = 1.0 / _1709;
            float _1717 = _1705 * _1715;
            float _1719 = fma(_1717, _1713, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1691 = _1719;
            _1721 = true;
        }
        else
        {
            bool _1723 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1725 = isnan(_1675);
            bool _1727 = _1723 || _1725;
            bool _1729 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1731 = _1727 || _1729;
            if (!_1731)
            {
                float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1735 = _1675 + _1733;
                float _1737 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1739 = _1737 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1743 = _1741 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1745 = 1.0 / _1739;
                float _1747 = _1735 * _1745;
                float _1749 = fma(_1747, _1743, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1691 = _1749;
                _1721 = true;
            }
            else
            {
                _1691 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1721 = false;
    float _1751 = _1691;
    float _1753 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1755 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1757 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1759 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1753);
    float _1761 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1755);
    float _1763 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1757);
    float _1765 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1759);
    float _1767 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1761);
    float _1769 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1763);
    float _1771 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1773 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1775 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1777 = 1.0 / _1771;
    float _1779 = _1773 + _1771;
    float _1781 = _1771 * 0.5;
    float _1783 = _1779 * 0.5;
    float _1785 = fma(_1775, -0.5, _1781);
    float _1787 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1783);
    float _1789 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1785);
    float _1791 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1785);
    float _1793 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1785);
    float _1795 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1783);
    float _1797 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1783);
    float _1799 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1783);
    float _1801 = _1787 * _1777;
    float _1803 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1785);
    float _1805 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1785);
    float _1807 = _1789 * _1777;
    float _1809 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1785);
    float _1811 = _1785 * _1777;
    float _1813 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1785);
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1817 = _1785 + _1815;
    float _1819 = _1785 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1821 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1785);
    float _1823 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1785);
    float _1825 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1785);
    float _1827 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1785);
    float _1829 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1785);
    float _1831 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1785);
    float _1833 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1785);
    float _1835 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1785);
    float _1837 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1785);
    float _1839 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1785);
    float _1841 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1785);
    float _1843 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1785);
    float _1845 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1785);
    float _1847 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1785);
    float _1849 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1785);
    float _1851 = _1791 * _1777;
    float _1853 = _1793 * _1777;
    float _1855 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1783);
    float _1857 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1783);
    float _1859 = _1795 * _1777;
    float _1861 = _1797 * _1777;
    float _1863 = _1799 * _1777;
    float _1865 = _1803 * _1777;
    float _1867 = _1805 * _1777;
    float _1869 = _1825 * _1777;
    float _1871 = _1831 * _1777;
    float2 _6262 = float2(_1801, _1851);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6262, float2(0.0), isnan(_6262)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6262, float2(0.0), isnan(_6262)), level(0.0)).x;
    float2 _6272 = float2(_1859, _1807);
    float _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6272, float2(0.0), isnan(_6272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6272, float2(0.0), isnan(_6272)), level(0.0)).x;
    float2 _6280 = float2(_1859, _1853);
    float _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6280, float2(0.0), isnan(_6280)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6280, float2(0.0), isnan(_6280)), level(0.0)).x;
    float2 _6288 = float2(_1861, _1865);
    float _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6288, float2(0.0), isnan(_6288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6288, float2(0.0), isnan(_6288)), level(0.0)).x;
    float2 _6296 = float2(_1863, _1869);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6296, float2(0.0), isnan(_6296)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6296, float2(0.0), isnan(_6296)), level(0.0)).x;
    float _1883 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1783);
    float _1885 = _1855 * _1777;
    float _1887 = _1857 * _1777;
    float _1889 = _1809 * _1777;
    float _1891 = _1817 * _1777;
    float _1893 = _1783 * _1777;
    float _1895 = _1819 * _1777;
    float _1897 = _1883 * _1777;
    float2 _6329 = float2(_1887, _1867);
    float _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6329, float2(0.0), isnan(_6329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6329, float2(0.0), isnan(_6329)), level(0.0)).x;
    float2 _6337 = float2(_1887, _1871);
    float _1901 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).x;
    float2 _6345 = float2(_1885, _1889);
    float _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6345, float2(0.0), isnan(_6345)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6345, float2(0.0), isnan(_6345)), level(0.0)).x;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1907 = _1783 + _1905;
    float _1909 = _1823 * _1777;
    float _1911 = _1827 * _1777;
    float _1913 = _1845 * _1777;
    float _1915 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1783);
    float _1917 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1783);
    float _1919 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1783);
    float _1921 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1783);
    float _1923 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1783);
    float _1925 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1783);
    float _1927 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1783);
    float _1929 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1783);
    float _1931 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1783);
    float _1933 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1783);
    float _1935 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1783);
    float _1937 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1783);
    float _1939 = _1829 * _1777;
    float2 _6419 = float2(_1893, _1889);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6419, float2(0.0), isnan(_6419)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6419, float2(0.0), isnan(_6419)), level(0.0)).x;
    float2 _6427 = float2(_1893, _1891);
    float _1943 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6427, float2(0.0), isnan(_6427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6427, float2(0.0), isnan(_6427)), level(0.0)).x;
    float2 _6435 = float2(_1893, _1895);
    float _1945 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6435, float2(0.0), isnan(_6435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6435, float2(0.0), isnan(_6435)), level(0.0)).x;
    float2 _6443 = float2(_1897, _1909);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6443, float2(0.0), isnan(_6443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6443, float2(0.0), isnan(_6443)), level(0.0)).x;
    float _1949 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1783);
    float _1951 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1953 = _1907 * _1777;
    float _1955 = _1813 * _1777;
    float _1957 = _1843 * _1777;
    float _1959 = _1821 * _1777;
    float2 _6471 = float2(_1893, _1909);
    float _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6471, float2(0.0), isnan(_6471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6471, float2(0.0), isnan(_6471)), level(0.0)).x;
    float2 _6479 = float2(_1893, _1911);
    float _1963 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6479, float2(0.0), isnan(_6479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6479, float2(0.0), isnan(_6479)), level(0.0)).x;
    float2 _6487 = float2(_1893, _1939);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6487, float2(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6487, float2(0.0), isnan(_6487)), level(0.0)).x;
    float2 _6495 = float2(_1893, _1811);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6495, float2(0.0), isnan(_6495)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6495, float2(0.0), isnan(_6495)), level(0.0)).x;
    float2 _6503 = float2(_1953, _1811);
    float _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6503, float2(0.0), isnan(_6503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6503, float2(0.0), isnan(_6503)), level(0.0)).x;
    float _1971 = _1915 * _1777;
    float _1973 = _1951 * _1777;
    float _1975 = _1917 * _1777;
    float _1977 = _1919 * _1777;
    float _1979 = _1921 * _1777;
    float2 _6526 = float2(_1971, _1955);
    float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).x;
    float2 _6534 = float2(_1971, _1959);
    float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).x;
    float2 _6542 = float2(_1971, _1811);
    float _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6542, float2(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6542, float2(0.0), isnan(_6542)), level(0.0)).x;
    float2 _6550 = float2(_1973, _1811);
    float _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6550, float2(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6550, float2(0.0), isnan(_6550)), level(0.0)).x;
    float2 _6558 = float2(_1975, _1811);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6558, float2(0.0), isnan(_6558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6558, float2(0.0), isnan(_6558)), level(0.0)).x;
    float2 _6566 = float2(_1977, _1811);
    float _1991 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6566, float2(0.0), isnan(_6566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6566, float2(0.0), isnan(_6566)), level(0.0)).x;
    float2 _6574 = float2(_1979, _1811);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6574, float2(0.0), isnan(_6574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6574, float2(0.0), isnan(_6574)), level(0.0)).x;
    float _1995 = _1923 * _1777;
    float _1997 = _1925 * _1777;
    float _1999 = _1833 * _1777;
    float _2001 = _1927 * _1777;
    float _2003 = _1835 * _1777;
    float _2005 = _1929 * _1777;
    float _2007 = _1837 * _1777;
    float _2009 = _1841 * _1777;
    float _2011 = _1839 * _1777;
    float _2013 = _1933 * _1777;
    float _2015 = _1931 * _1777;
    float _2017 = _1935 * _1777;
    float2 _6618 = float2(_1995, _1999);
    float _2019 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6618, float2(0.0), isnan(_6618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6618, float2(0.0), isnan(_6618)), level(0.0)).x;
    float2 _6626 = float2(_1997, _2003);
    float _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6626, float2(0.0), isnan(_6626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6626, float2(0.0), isnan(_6626)), level(0.0)).x;
    float2 _6634 = float2(_2001, _2007);
    float _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6634, float2(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6634, float2(0.0), isnan(_6634)), level(0.0)).x;
    float2 _6642 = float2(_2005, _2011);
    float _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6642, float2(0.0), isnan(_6642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6642, float2(0.0), isnan(_6642)), level(0.0)).x;
    float2 _6650 = float2(_2015, _2009);
    float _2027 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6650, float2(0.0), isnan(_6650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6650, float2(0.0), isnan(_6650)), level(0.0)).x;
    float2 _6658 = float2(_2013, _1957);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6658, float2(0.0), isnan(_6658)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6658, float2(0.0), isnan(_6658)), level(0.0)).x;
    float2 _6666 = float2(_2017, _1913);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6666, float2(0.0), isnan(_6666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6666, float2(0.0), isnan(_6666)), level(0.0)).x;
    float _2033 = _1847 * _1777;
    float _2035 = _1849 * _1777;
    float _2037 = _1937 * _1777;
    float _2039 = _1949 * _1777;
    float2 _6686 = float2(_2037, _2033);
    float _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6686, float2(0.0), isnan(_6686)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6686, float2(0.0), isnan(_6686)), level(0.0)).x;
    float2 _6694 = float2(_2039, _2035);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6694, float2(0.0), isnan(_6694)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6694, float2(0.0), isnan(_6694)), level(0.0)).x;
    float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2047 = _1663 + _2045;
    float _2049 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2051 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2053 = _1665 + _2051;
    bool _2055 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(0.5);
    bool _2063 = _2059 || _2061;
    float _2065 = fma(_2047, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2069 = _1657 + _2067;
    float _2071 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2049);
    float _2073 = fma(_2053, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -_1217;
    float _2077 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2065);
    float _2079 = fma(_2069, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2081 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2071);
    float _2083 = -_1229;
    float _2085 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2073);
    float _2087 = -_1219;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2079);
    float _2091 = _2089;
    float _2093 = _2085;
    if (_2063)
    {
        _1315 = _2077;
    }
    float _2095 = _1315;
    float _2097 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2099 = _2095;
    if (!_2063)
    {
        float _2101 = _1239 * _1239;
        float _2103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _2105 = -_1071;
        float _2107 = _2105 + _2065;
        float _2109 = -_1051;
        float _2111 = _2109 + _2079;
        float _2113 = fma(_1253, _1253, _2101);
        float _2115 = -_771;
        float _2117 = _2115 + _2073;
        float _2119 = fma(_1263, _1263, _2113);
        float _2121 = 1.0 / _1391;
        float _2123 = sqrt(_2119);
        float _2125 = precise::max(_2123, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _2127 = _2125 * _2103;
        float _2129 = _2127 * _2121;
        float _2131 = fma(_2107, _2129, _1235);
        float _2133 = fma(_2111, _2129, _1225);
        float _2135 = fma(_2117, _2129, _1249);
        _2091 = _2133;
        _2099 = _2131;
        _2093 = _2135;
    }
    float _2137 = _2091;
    float _2139 = _2099;
    float _2141 = _2093;
    float _2143 = _2097 + _1771;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2149 = _2143 * _1777;
    float _2151 = _2149 * 0.5;
    float _2153 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2155 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2145);
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2159 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2157);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2163 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2161);
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2167 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2165);
    float _2169 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2147);
    float _2171 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2155);
    float _2173 = 1.0 / _2163;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2177 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2175);
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2181 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2153);
    float _2183 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2169);
    float _2185 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2179);
    float _2189 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2191 = 1.0 / _2159;
    float _2193 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2201 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2199);
    float _2203 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2187);
    float _2205 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2207 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2209 = 1.0 / _2167;
    out.m_60.x = _1235;
    out.m_60.y = _1225;
    out.m_60.z = _1249;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2213 = _2173 * _2211;
    float _2215 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2197);
    float _2217 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2219 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2207);
    float _2221 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2225 = 1.0 / _2177;
    float _2227 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2229 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2221);
    float _2231 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2223);
    float _2233 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2215);
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2237 = -_2213;
    float _2239 = fma(_2191, _2235, _2237);
    float _2241 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2229);
    float _2243 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2231);
    float _2245 = 1.0 / _2201;
    float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2249 = -_2213;
    float _2251 = fma(_2209, _2247, _2249);
    bool _2253 = _2239 >= 0.0;
    bool _2255 = isnan(_2239);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2265 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2263);
    float _2267 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2241);
    float _2269 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2233);
    bool _2271 = _2251 >= 0.0;
    bool _2273 = isnan(_2251);
    bool _2275 = _2271 || _2273;
    bool _2277 = isnan(0.0);
    bool _2279 = _2275 || _2277;
    float _2281 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2243);
    float _2283 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2285 = -_2213;
    float _2287 = fma(_2225, _2283, _2285);
    float _2289 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2291 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2289);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2295 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2293);
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2299 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2297);
    out.gl_Position.x = _2267;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _2227;
    out.gl_Position.w = _2269;
    bool _2301 = _2287 >= 0.0;
    bool _2303 = isnan(_2287);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2315 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2313);
    bool _2317 = !_2279;
    float _2319 = _2317 ? 0.0 : 2.0;
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2323 = -_2213;
    float _2325 = fma(_2245, _2321, _2323);
    float _2327 = 1.0 / _2299;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2335 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2333);
    float _2337 = _2319 + _2311;
    bool _2339 = _2325 >= 0.0;
    bool _2341 = isnan(_2325);
    bool _2343 = _2339 || _2341;
    bool _2345 = isnan(0.0);
    bool _2347 = _2343 || _2345;
    float _2349 = float(_2347);
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2353 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2351);
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2357 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2355);
    float _2359 = _2227 + _2269;
    float _2361 = 1.0 / _2265;
    bool _2363 = !_2261;
    float _2365 = _2363 ? 0.0 : 2.0;
    float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2369 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2367);
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2373 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2371);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2377 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2375);
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2381 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2379);
    float _2383 = _2337 + _2365;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2387 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2385);
    float _2389 = 1.0 / _2315;
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2393 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2391);
    float _2395 = _2383 + _2349;
    float _2397 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2399 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2397);
    float _2401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2403 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2401);
    float _2405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2407 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2405);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2411 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2409);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2415 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2413);
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2419 = -_2213;
    float _2421 = fma(_2361, _2417, _2419);
    float _2423 = 1.0 / _2353;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2427 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2425);
    float _2429 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2431 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2429);
    float _2433 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2435 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2433);
    bool _2437 = _2421 >= 0.0;
    bool _2439 = isnan(_2421);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan(0.0);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2451 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2449);
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2459 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2457);
    float _2461 = 1.0 / _2291;
    float _2463 = _2395 + _2447;
    float _2465 = _2359 * 0.5;
    float _2467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2469 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2467);
    float _2471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2473 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2471);
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2477 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2475);
    float _2479 = 1.0 / _2357;
    out.m_62.z = _2465;
    out.m_62.w = _2269;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2483 = -_2213;
    float _2485 = fma(_2461, _2481, _2483);
    float _2487 = 1.0 / _2377;
    bool _2489 = _2485 >= 0.0;
    bool _2491 = isnan(_2485);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan(0.0);
    bool _2497 = _2493 || _2495;
    float _2499 = 1.0 / _2295;
    bool _2501 = !_2497;
    float _2503 = _2501 ? 0.0 : 2.0;
    float _2505 = _2463 + _2503;
    float _2507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2509 = -_2213;
    float _2511 = fma(_2327, _2507, _2509);
    float _2513 = 1.0 / _2381;
    bool _2515 = _2511 >= 0.0;
    bool _2517 = isnan(_2511);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan(0.0);
    bool _2523 = _2519 || _2521;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2527 = -_2213;
    float _2529 = fma(_2389, _2525, _2527);
    float _2531 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2533 = -_2213;
    float _2535 = fma(_2499, _2531, _2533);
    float _2537 = 1.0 / _2411;
    bool _2539 = _2529 >= 0.0;
    bool _2541 = isnan(_2529);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan(0.0);
    bool _2547 = _2543 || _2545;
    bool _2549 = !_2523;
    float _2551 = _2549 ? 0.0 : 2.0;
    bool _2553 = _2535 >= 0.0;
    bool _2555 = isnan(_2535);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = float(_2561);
    float _2565 = 1.0 / _2331;
    float _2567 = _2505 + _2563;
    bool _2569 = !_2547;
    float _2571 = _2569 ? 0.0 : 2.0;
    float _2573 = _2567 + _2551;
    float _2575 = 1.0 / _2415;
    float _2577 = _2573 + _2571;
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2581 = -_2213;
    float _2583 = fma(_2565, _2579, _2581);
    float _2585 = 1.0 / _2427;
    bool _2587 = _2583 >= 0.0;
    bool _2589 = isnan(_2583);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = 1.0 / _2335;
    float _2601 = _2577 + _2597;
    float _2603 = 1.0 / _2431;
    float _2605 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2607 = -_2213;
    float _2609 = fma(_2599, _2605, _2607);
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2613 = -_2213;
    float _2615 = fma(_2423, _2611, _2613);
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2619 = -_2213;
    float _2621 = fma(_2479, _2617, _2619);
    float _2623 = 1.0 / _2469;
    bool _2625 = _2609 >= 0.0;
    bool _2627 = isnan(_2609);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan(0.0);
    bool _2633 = _2629 || _2631;
    bool _2635 = _2615 >= 0.0;
    bool _2637 = isnan(_2615);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(0.0);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    bool _2647 = !_2633;
    float _2649 = _2647 ? 0.0 : 2.0;
    float _2651 = 1.0 / _2369;
    float _2653 = _2601 + _2649;
    bool _2655 = _2621 >= 0.0;
    bool _2657 = isnan(_2621);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan(0.0);
    bool _2663 = _2659 || _2661;
    float _2665 = float(_2663);
    float _2667 = _2653 + _2645;
    float _2669 = 1.0 / _2373;
    float _2671 = _2667 + _2665;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2675 = -_2213;
    float _2677 = fma(_2651, _2673, _2675);
    float _2679 = 1.0 / _2459;
    bool _2681 = _2677 >= 0.0;
    bool _2683 = isnan(_2677);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.0);
    bool _2689 = _2685 || _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2693 = -_2213;
    float _2695 = fma(_2669, _2691, _2693);
    bool _2697 = !_2689;
    float _2699 = _2697 ? 0.0 : 2.0;
    float _2701 = 1.0 / _2435;
    bool _2703 = _2695 >= 0.0;
    bool _2705 = isnan(_2695);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.0);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = _2671 + _2699;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2719 = -_2213;
    float _2721 = fma(_2487, _2717, _2719);
    float _2723 = 1.0 / _2387;
    float _2725 = _2715 + _2713;
    bool _2727 = _2721 >= 0.0;
    bool _2729 = isnan(_2721);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2739 = -_2213;
    float _2741 = fma(_2513, _2737, _2739);
    bool _2743 = _2741 >= 0.0;
    bool _2745 = isnan(_2741);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan(0.0);
    bool _2751 = _2747 || _2749;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2755 = -_2213;
    float _2757 = fma(_2701, _2753, _2755);
    bool _2759 = !_2735;
    float _2761 = _2759 ? 0.0 : 2.0;
    float _2763 = 1.0 / _2473;
    bool _2765 = !_2751;
    float _2767 = _2765 ? 0.0 : 2.0;
    float _2769 = _2725 + _2761;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2773 = -_2213;
    float _2775 = fma(_2723, _2771, _2773);
    float _2777 = _2769 + _2767;
    float _2779 = 1.0 / _2477;
    bool _2781 = _2775 >= 0.0;
    bool _2783 = isnan(_2775);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan(0.0);
    bool _2789 = _2785 || _2787;
    float _2791 = float(_2789);
    float _2793 = _2777 + _2791;
    float _2795 = 1.0 / _2393;
    float _2797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2799 = -_2213;
    float _2801 = fma(_2795, _2797, _2799);
    float _2803 = 1.0 / _2399;
    bool _2805 = _2801 >= 0.0;
    bool _2807 = isnan(_2801);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(0.0);
    bool _2813 = _2809 || _2811;
    bool _2815 = !_2813;
    float _2817 = _2815 ? 0.0 : 2.0;
    float _2819 = _2793 + _2817;
    float _2821 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2823 = -_2213;
    float _2825 = fma(_2803, _2821, _2823);
    bool _2827 = _2825 >= 0.0;
    bool _2829 = isnan(_2825);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan(0.0);
    bool _2835 = _2831 || _2833;
    float _2837 = float(_2835);
    float _2839 = 1.0 / _2403;
    float _2841 = _2819 + _2837;
    float _2843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2845 = -_2213;
    float _2847 = fma(_2839, _2843, _2845);
    float _2849 = 1.0 / _2407;
    bool _2851 = _2847 >= 0.0;
    bool _2853 = isnan(_2847);
    bool _2855 = _2851 || _2853;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    float _2861 = float(_2859);
    float _2863 = _2841 + _2861;
    float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2867 = -_2213;
    float _2869 = fma(_2849, _2865, _2867);
    float _2871 = 1.0 / _2451;
    bool _2873 = _2869 >= 0.0;
    bool _2875 = isnan(_2869);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(0.0);
    bool _2881 = _2877 || _2879;
    bool _2883 = !_2881;
    float _2885 = _2883 ? 0.0 : 2.0;
    float _2887 = _2863 + _2885;
    float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2891 = -_2213;
    float _2893 = fma(_2537, _2889, _2891);
    float _2895 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2897 = -_2213;
    float _2899 = fma(_2871, _2895, _2897);
    bool _2901 = _2893 >= 0.0;
    bool _2903 = isnan(_2893);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan(0.0);
    bool _2909 = _2905 || _2907;
    float _2911 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2913 = -_2213;
    float _2915 = fma(_2575, _2911, _2913);
    bool _2917 = _2899 >= 0.0;
    bool _2919 = isnan(_2899);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan(0.0);
    bool _2925 = _2921 || _2923;
    float _2927 = float(_2925);
    bool _2929 = _2915 >= 0.0;
    bool _2931 = isnan(_2915);
    bool _2933 = _2929 || _2931;
    bool _2935 = isnan(0.0);
    bool _2937 = _2933 || _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2941 = -_2213;
    float _2943 = fma(_2585, _2939, _2941);
    float _2945 = _2887 + _2927;
    bool _2947 = _2943 >= 0.0;
    bool _2949 = isnan(_2943);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    float _2957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2959 = -_2213;
    float _2961 = fma(_2603, _2957, _2959);
    bool _2963 = !_2955;
    float _2965 = _2963 ? 0.0 : 3.0;
    bool _2967 = _2961 >= 0.0;
    bool _2969 = isnan(_2961);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    bool _2977 = !_2937;
    float _2979 = _2977 ? 0.0 : 3.0;
    bool _2981 = _2757 >= 0.0;
    bool _2983 = isnan(_2757);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.0);
    bool _2989 = _2985 || _2987;
    float _2991 = 1.0 / _2455;
    float _2993 = _2979 + _2965;
    bool _2995 = !_2909;
    float _2997 = _2995 ? 0.0 : 2.0;
    bool _2999 = !_2975;
    float _3001 = _2999 ? 0.0 : 3.0;
    bool _3003 = !_2989;
    float _3005 = _3003 ? 0.0 : 3.0;
    float _3007 = _2945 + _2997;
    float _3009 = _2993 + _3001;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3013 = -_2213;
    float _3015 = fma(_2623, _3011, _3013);
    float _3017 = _3007 * 0.02857142873108386993408203125;
    float _3019 = precise::clamp(_3017, 0.0, 1.0);
    float _3021 = _3009 + _3005;
    bool _3023 = _3015 >= 0.0;
    bool _3025 = isnan(_3015);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan(0.0);
    bool _3031 = _3027 || _3029;
    float _3033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3035 = -_2213;
    float _3037 = fma(_2991, _3033, _3035);
    float _3039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3041 = -_2213;
    float _3043 = fma(_2679, _3039, _3041);
    float _3045 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3047 = -_2213;
    float _3049 = fma(_2779, _3045, _3047);
    bool _3051 = _3037 >= 0.0;
    bool _3053 = isnan(_3037);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    bool _3061 = !_3059;
    float _3063 = _3061 ? 0.0 : 3.0;
    bool _3065 = _3043 >= 0.0;
    bool _3067 = isnan(_3043);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan(0.0);
    bool _3073 = _3069 || _3071;
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3077 = -_2213;
    float _3079 = fma(_2763, _3075, _3077);
    float _3081 = _3021 + _3063;
    bool _3083 = !_3073;
    float _3085 = _3083 ? 0.0 : 3.0;
    bool _3087 = _3079 >= 0.0;
    bool _3089 = isnan(_3079);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan(0.0);
    bool _3095 = _3091 || _3093;
    bool _3097 = !_3031;
    float _3099 = _3097 ? 0.0 : 3.0;
    float _3101 = _3081 + _3085;
    bool _3103 = _3049 >= 0.0;
    bool _3105 = isnan(_3049);
    bool _3107 = _3103 || _3105;
    bool _3109 = isnan(0.0);
    bool _3111 = _3107 || _3109;
    float _3113 = _3101 + _3099;
    bool _3115 = !_3095;
    float _3117 = _3115 ? 0.0 : 3.0;
    bool _3119 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3121 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3123 = _3119 || _3121;
    bool _3125 = isnan(0.5);
    bool _3127 = _3123 || _3125;
    bool _3129 = !_3111;
    float _3131 = _3129 ? 0.0 : 5.0;
    float _3133 = _3113 + _3117;
    float _3135 = _3133 + _3131;
    float _3137 = _3135 * 0.14285714924335479736328125;
    float _3139 = precise::clamp(_3137, 0.0, 1.0);
    float _3141 = _3019 * _3139;
    float _3143 = _3019;
    float _3145 = _3139;
    if (_3127)
    {
        _3143 = 1.0;
    }
    float _3147 = _3143;
    float _3149 = _3147;
    if (_3127)
    {
        _3145 = 1.0;
    }
    float _3151 = _3145;
    float _3153 = _3151;
    if (!_3127)
    {
        float _3155 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3159 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3157;
        float _3161 = _3155 * 0.15915493667125701904296875;
        float _3163 = _3161 * 6.283185482025146484375;
        float _3165 = cos(_3163);
        float _3167 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3169 = _3167 * 0.15915493667125701904296875;
        float _3171 = _3161 * 6.283185482025146484375;
        float _3173 = sin(_3171);
        float _3175 = 1.0 / _3165;
        float _3177 = _3169 * 6.283185482025146484375;
        float _3179 = cos(_3177);
        float _3181 = _3173 * _3175;
        float _3183 = _3169 * 6.283185482025146484375;
        float _3185 = sin(_3183);
        float _3187 = _3179 * _3181;
        float _3189 = 1.0 / _3159;
        float _3191 = 1.0 / _3187;
        float _3193 = _3185 * _3191;
        float _3195 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3197 = fma(_2213, _3193, _3195);
        float _3199 = _3197 * _3189;
        float _3201 = precise::clamp(_3199, 0.0, 1.0);
        _3153 = _3201;
    }
    float _3203 = _3153;
    if (!_3127)
    {
        float _3205 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3207 = _3205 * 0.15915493667125701904296875;
        float _3209 = _3207 * 6.283185482025146484375;
        float _3211 = cos(_3209);
        float _3213 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3215 = _3213 * 0.15915493667125701904296875;
        float _3217 = _3207 * 6.283185482025146484375;
        float _3219 = sin(_3217);
        float _3221 = 1.0 / _3211;
        float _3223 = _3215 * 6.283185482025146484375;
        float _3225 = cos(_3223);
        float _3227 = _3219 * _3221;
        float _3229 = _3215 * 6.283185482025146484375;
        float _3231 = sin(_3229);
        float _3233 = _3225 * _3227;
        float _3235 = 1.0 / _3233;
        float _3237 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3239 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3237;
        float _3241 = 1.0 / _3239;
        float _3243 = _3231 * _3235;
        float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3247 = fma(_2213, _3243, _3245);
        float _3249 = _3247 * _3241;
        float _3251 = precise::clamp(_3249, 0.0, 1.0);
        float _3253 = -_3251;
        float _3255 = _3253 + 1.0;
        _3149 = _3255;
    }
    float _3257 = _3149;
    float _3259 = _3141 * _3203;
    bool _3261 = _3203 > 0.0;
    bool _3263 = isnan(_3203);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(0.0);
    bool _3269 = _3265 || _3267;
    float _3271 = _3259 * _3257;
    bool _3273 = _3257 <= 0.0;
    bool _3275 = !_3269;
    bool _3277 = _3273 || _3275;
    float _3279 = _3271 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3281 = _349 * _3279;
    float _3283 = _3281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = _3283;
    if (!_3277)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_40.x = 0.0;
    float _3285 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3285;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1721 = false;
    bool _499 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_37.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_40.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3342 = as_type<float>(_97);
        out.gl_Position.z = _3342;
    }
    if (!_85)
    {
        return out;
    }
    float _101 = in.m_42.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_40.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3412 = as_type<float>(_135);
        out.gl_Position.z = _3412;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_44.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = 0.0;
    if (!_153)
    {
        float _159 = _143 * _143;
        float _161 = _159 * 0.5;
        _157 = _161;
    }
    float _163 = _157;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _167 = _163;
    if (!_153)
    {
        float _169 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    float _173 = in.m_42.x;
    float _175 = in.m_42.y;
    float _177 = in.m_42.z;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = 1.4012984643248170709237295832899e-45;
    float _195 = _171;
    if (!_153)
    {
        _193 = _143;
    }
    float _197 = _193;
    float _199 = -_181;
    float _201 = _165 + _199;
    bool _203 = !_153;
    float _205 = _197;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _143 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _143);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _235;
    }
    float _237 = _195;
    bool _239 = !_153;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _143 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _205 = _259;
    }
    float _261 = _205;
    float _263 = in.m_46.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = in.m_37.x;
    float _275 = in.m_37.y;
    float _277 = in.m_37.z;
    float _279 = -_201;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _283 = _201 < 0.5;
    float _285 = float(_283);
    bool _287 = !_267;
    int _289 = _287 ? 0 : 1;
    float _291 = fma(_191, 0.5, 0.5);
    bool _293 = !_187;
    int _295 = _293 ? 0 : 1;
    float _297 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _299 = abs(_289);
    float _301 = -_285;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_291;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = fma(_261, _173, _297);
    int _311 = abs(_295);
    float _313 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _315 = !_271;
    int _317 = _315 ? 0 : 1;
    float _319 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _323 = abs(_317);
    float _325 = fma(_261, _175, _313);
    float _327 = float(_299);
    float _329 = fma(_261, _177, _319);
    float _331 = float(_311);
    float _333 = abs(_281);
    float _335 = _327 * _333;
    float _337 = fma(_329, _263, _277);
    float _339 = float(_323);
    float _341 = fma(_331, _307, _335);
    float _343 = fma(_309, _263, _273);
    float _345 = fma(_325, _263, _275);
    float _347 = abs(_303);
    float _349 = fma(_339, _347, _341);
    bool _351 = !_321;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_81);
        float _373 = 1.0 / _371;
        float _375 = _115 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _377 + _379;
    float _383 = in.m_46.x;
    float _385 = in.m_46.y;
    float _387 = in.m_46.z;
    bool _389 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_377);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    bool _405 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_377);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -_399;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = 1.0 / _403;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _429 = _415 * _419;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = _381 * _425;
    float _437 = fma(_423, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _443;
    float _447 = fma(_441, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = fma(_445, _435, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _451 = _437 * _429;
    float _453 = _447 * _429;
    float _455 = _449 * _429;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _463 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].x, _457);
    float _465 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].y, _459);
    float _467 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].z, _461);
    float _469 = _463 * _383;
    float _471 = _465 * _385;
    float _473 = _467 * _387;
    bool _475 = !_427;
    bool _477 = _427;
    float _479 = _465;
    int _495;
    float _497;
    if (!_475)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _483 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = as_type<int>(_487);
        _497 = _493;
        _499 = true;
    }
    else
    {
        float _501 = float(_81);
        float _503 = 1.0 / _501;
        float _505 = _115 * _503;
        _495 = as_type<int>(_503);
        _497 = _505;
    }
    _499 = false;
    int _507 = _495;
    float _509 = _497;
    float _511 = in.m_48.x;
    float _513 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = in.m_44.z;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _519 = _517 != 0;
    float _521 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _525 = _523 != 0;
    float _527 = in.m_44.w;
    float _529 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _531 = in.m_44.y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _535 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
    float _537 = in.m_48.y;
    float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _541 = _507;
    if (_519)
    {
        bool _543 = _137 > 0.5;
        _477 = _543;
    }
    bool _545 = _477;
    float _547 = _511;
    if (_519)
    {
        float _549 = -_511;
        float _551 = _549 + 1.0;
        _541 = as_type<int>(_551);
    }
    int _553 = _541;
    int _555 = _553;
    if (!_519)
    {
        _479 = _511;
    }
    float _557 = _479;
    float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _561 = log2(_559);
    float _563 = _557;
    if (_519)
    {
        float _565 = _545 ? as_type<float>(_553) : _511;
        _563 = _565;
    }
    float _567 = _563;
    if (_525)
    {
        float _569 = -_511;
        float _571 = _569 + 1.0;
        _555 = as_type<int>(_571);
    }
    int _573 = _555;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _585 = _583 != 0;
    bool _587 = false;
    if (_525)
    {
        bool _589 = _515 > 0.5;
        _587 = _589;
    }
    bool _591 = _587;
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _601 = _599 != 0;
    float _603 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_525)
    {
        float _605 = _591 ? as_type<float>(_573) : _511;
        _547 = _605;
    }
    float _607 = _547;
    float _609 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _613 = _611 != 0;
    float _615 = _137 * 2.0;
    float _617 = -_533;
    float _619 = fma(_609, 2.0, _617);
    bool _621 = _527 > 0.5;
    float _623 = _531 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _627 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _603);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _629;
    float _633 = fma(_623, -2.0, _625);
    float _635 = floor(_615);
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _639 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _627);
    float _641 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
    float _643 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _645 = _531 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _651 = -_537;
    float _653 = _651 + 1.0;
    float _655 = 1.0 / _631;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _661 = _137 + _531;
    int _663 = _621 ? as_type<int>(_653) : as_type<int>(_537);
    float _665 = _561 * _115;
    float _667 = _661 + (-1.0);
    float _669 = 1.0 / _649;
    float _671 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _677 = _635 > 0.0;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _681 = _509 + _679;
    float _683 = _597 ? as_type<float>(_663) : _537;
    float _685 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_50.x = _671;
    out.m_50.y = _673;
    out.m_50.z = _675;
    float _687 = floor(_645);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _691 = _509 + _689;
    bool _693 = _635 >= 0.0;
    bool _695 = isnan(_635);
    bool _697 = _693 || _695;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _703;
    float _707 = _691 * _655;
    float _709 = _531 + _515;
    float _711 = _681 * _669;
    float _713 = _635;
    float _715 = _537;
    float _717 = _681;
    float _719 = _653;
    if (!_613)
    {
        _713 = _531;
    }
    float _721 = _713;
    float _723 = _709 + (-1.0);
    float _725 = _515 * 2.0;
    int _727 = _701 ? 0 : 1;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _733 = _531 > 0.5;
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _737 = ~_727;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = floor(_725);
    float _745 = _723;
    int _747 = _741;
    float _749 = _721;
    if (_601)
    {
        float _751 = _733 ? _653 : _537;
        _715 = _751;
    }
    float _753 = _715;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _757 = _687 > 0.0;
    float _759 = _593 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _761 = _687 >= 0.0;
    bool _763 = isnan(_687);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    float _771 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _773 = _687;
    if (!_613)
    {
        _745 = _137;
    }
    float _775 = _745;
    float _777 = exp2(_665);
    float _779 = _775;
    if (!_613)
    {
        _717 = _531;
    }
    float _781 = _717;
    float _783 = fma(_759, _753, -0.5);
    float _785 = _781;
    if (!_613)
    {
        _773 = _515;
    }
    float _787 = _773;
    float _789 = _787;
    if (!_613)
    {
        _719 = _515;
    }
    float _791 = _719;
    float _793 = _791;
    if (!_677)
    {
        int _795 = ~_727;
        int _797 = _795 + 1;
        _747 = _797;
    }
    int _799 = _747;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _801;
    if (_613)
    {
        _779 = _515;
    }
    float _805 = _779;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    if (_613)
    {
        _749 = _137;
    }
    float _811 = _749;
    float _813 = fma(_803, _707, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    if (_613)
    {
        _785 = _137;
    }
    float _815 = _785;
    float _817 = fma(_809, _711, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    if (_613)
    {
        _789 = _531;
    }
    float _819 = _789;
    float _821 = -_777;
    float _823 = _821 + 1.0;
    if (_613)
    {
        _793 = _531;
    }
    float _825 = _793;
    bool _827 = _743 > 0.0;
    float _829 = _819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _831 = _743 >= 0.0;
    bool _833 = isnan(_743);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _849 = fma(_843, _707, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _851 = fma(_705, _707, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _853 = fma(_731, _711, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _855 = _539 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _857 = fma(_847, _711, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _859 = fma(_683, _855, -0.5);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _863 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _865 = isnan(_509);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _879 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[84].z, _861);
    bool _881 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _883 = isnan(_509);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = -_873;
    float _895 = _893 + 1.0;
    float _897 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[83].z, _875);
    bool _899 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_509);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].w, _877);
    float _913 = _891 * _895;
    float _915 = -_891;
    float _917 = _915 + 1.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _921 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _897);
    float _923 = _909 * _917;
    float _925 = -_909;
    float _927 = _925 + 1.0;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _931 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _933 = _813 * _923;
    float _935 = _849 * _923;
    float _937 = _851 * _923;
    float _939 = -_929;
    float _941 = fma(_931, 2.0, _939);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].y, _933);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].x, _935);
    int _947 = _839 ? 0 : 1;
    float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _951 = fma(_829, -2.0, _755);
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _955 = ~_947;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = fma(_857, _913, _945);
    int _963 = _959;
    if (!_827)
    {
        int _965 = ~_947;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[79].z, _953);
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _975 = _769 ? 0 : 1;
    float _977 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].z, _937);
    bool _979 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _981 = isnan(1.0);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _987 = _983 || _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _991 = 1.0 + _989;
    float _993 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[79].x, _971);
    int _995 = ~_975;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    float _1001 = fma(_853, _913, _977);
    float _1003 = _993 * (-0.15915493667125701904296875);
    int _1005 = _999;
    if (!_757)
    {
        int _1007 = ~_975;
        int _1009 = _1007 + 1;
        _1005 = _1009;
    }
    int _1011 = _1005;
    float _1013 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _633);
    float _1015 = 1.0 / _991;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1019 = _949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1021 = fma(_817, _913, _943);
    float _1023 = -_115;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _941);
    bool _1027 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1035 = _1031 || _1033;
    float _1037 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1017);
    float _1039 = _973 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1041 = _1003 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    float _1045 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[78].w, _919);
    float _1047 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[84].x, _879);
    float _1049 = fma(_1019, _567, -0.5);
    float _1051 = _641 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1053 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1037);
    float _1055 = -_115;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _619);
    float _1059 = _1035 ? _823 : 0.0;
    float _1061 = _1003 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    float _1067 = fma(_1039, _607, -0.5);
    float _1069 = _1047 * (-0.15915493667125701904296875);
    float _1071 = _639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1051 + _1073;
    float _1077 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _911);
    float _1079 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _951);
    if (_987)
    {
        float _1081 = _1059 * _1015;
        _117 = _1081;
    }
    float _1083 = _117;
    bool _1085 = !_581;
    int _1087 = _1085 ? 0 : 1;
    float _1089 = _1069 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = _1071 + _1093;
    float _1097 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1099 = abs(_1087);
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _771 + _1101;
    float _1105 = _1043 * _783;
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1097);
    float _1109 = _1063 * _783;
    float _1111 = _1069 * 6.283185482025146484375;
    float _1113 = cos(_1111);
    float _1115 = -_1105;
    float _1117 = fma(_1063, _1049, _1115);
    float _1119 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1107);
    float _1121 = _1075 * _1075;
    float _1123 = float(_1099);
    float _1125 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].x, _961);
    float _1127 = float(_799);
    float _1129 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1021);
    float _1131 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1001);
    bool _1133 = _1119 >= 0.0;
    float _1135 = fma(_1095, _1095, _1121);
    float _1137 = fma(_1043, _1049, _1109);
    float _1139 = _1123 * _1127;
    float _1141 = _1091 * _859;
    float _1143 = fma(_1053, _1117, _1057);
    float _1145 = fma(_1103, _1103, _1135);
    float _1147 = _1113 * _859;
    float _1149 = -_1013;
    float _1151 = fma(_1065, _1137, _1149);
    float _1153 = -_1141;
    float _1155 = fma(_1113, _1067, _1153);
    float _1157 = in.m_52.x;
    float _1159 = in.m_52.y;
    float _1161 = in.m_52.z;
    float _1163 = fma(_1091, _1067, _1147);
    float _1165 = rsqrt(_1145);
    float _1167 = fma(_921, _1155, _1025);
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1171 = -_1079;
    float _1173 = fma(_1077, _1163, _1171);
    float _1175 = _1129 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1177 = _1163;
    if (_1133)
    {
        _1177 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1179 = _1177;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1183 = !_577;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1189 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1195 = _1143 + 0.5;
    int _1197 = as_type<int>(_1179);
    if (_1133)
    {
        float _1199 = _1179 * 5.0;
        _1197 = as_type<int>(_1199);
    }
    int _1201 = _1197;
    float _1203 = _1151 + 0.5;
    float _1205 = _1167 + 0.5;
    float _1207 = _1173 + 0.5;
    int _1209 = abs(_1185);
    out.m_54.x = _1189;
    out.m_54.y = _1191;
    out.m_54.z = _1193;
    out.m_54.w = _1187;
    float _1211 = _531 + (-0.5);
    bool _1213 = !_585;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = _1095 * _1165;
    if (_1133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5144 = as_type<float>(_1201);
        out.gl_Position.z = _5144;
    }
    float _1219 = _1075 * _1165;
    out.m_56.x = _1195;
    out.m_56.y = _1203;
    out.m_56.z = _1205;
    out.m_56.w = _1207;
    if (_1133)
    {
        out.m_40.x = 0.0;
    }
    if (_1133)
    {
        return out;
    }
    float _1221 = _1139 * (-2.0);
    float _1223 = -_1219;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1051);
    float _1227 = float(_1209);
    float _1229 = _1103 * _1165;
    float _1231 = fma(_1221, _1159, _1159);
    float _1233 = -_1217;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1071);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1225 + _1237;
    float _1241 = float(_969);
    float _1243 = fma(_735, _1221, _735);
    float _1245 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1231);
    float _1247 = -_1229;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1253 = _1235 + _1251;
    float _1255 = _1239 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1257 = fma(_1243, _1083, _1245);
    float _1259 = _1227 * _1241;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _1249 + _1261;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    float _1267 = _1257 * 0.15915493667125701904296875;
    float _1269 = _1259 * (-2.0);
    float _1271 = -_1219;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1075);
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1265);
    float _1277 = _137 + (-0.5);
    float _1279 = fma(_1269, _1157, _1157);
    int _1281 = abs(_1215);
    float _1283 = -_1217;
    float _1285 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    bool _1287 = _1275 >= 0.0;
    float _1289 = _1273 * _1273;
    float _1291 = fma(_685, _1269, _685);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1279);
    float _1295 = fma(_1285, _1285, _1289);
    float _1297 = -_1229;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1301 = fma(_1291, _1083, _1293);
    float _1303 = float(_1281);
    float _1305 = _137 + _515;
    float _1307 = float(_1011);
    float _1309 = fma(_1299, _1299, _1295);
    float _1311 = _1301 * 0.15915493667125701904296875;
    float _1313 = _1275;
    float _1315 = _1229;
    if (_1287)
    {
        _1313 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1317 = _1313;
    float _1319 = _1303 * _1307;
    float _1321 = _1305 + (-1.0);
    float _1323 = sqrt(_1309);
    int _1325 = as_type<int>(_1317);
    if (_1287)
    {
        float _1327 = _1317 * 5.0;
        _1325 = as_type<int>(_1327);
    }
    int _1329 = _1325;
    if (_1287)
    {
        out.m_40.x = 0.0;
    }
    float _1331 = _1319 * (-2.0);
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5353 = as_type<float>(_1329);
        out.gl_Position.z = _5353;
    }
    float _1333 = _1311 * 6.283185482025146484375;
    float _1335 = sin(_1333);
    float _1337 = _1267 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = _1267 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    if (_1287)
    {
        return out;
    }
    float _1345 = -_1051;
    float _1347 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = -_1071;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1355 = -_771;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1359 = _1347 * _1347;
    float _1361 = fma(_1331, _1161, _1161);
    float _1363 = _515 + (-0.5);
    float _1365 = fma(_1353, _1331, _1353);
    float _1367 = fma(_1351, _1351, _1359);
    float _1369 = _1311 * 6.283185482025146484375;
    float _1371 = cos(_1369);
    float _1373 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1361);
    float _1375 = fma(_1357, _1357, _1367);
    float _1377 = in.m_58.x;
    float _1379 = in.m_58.y;
    float _1381 = in.m_58.z;
    float _1383 = fma(_1365, _1083, _1373);
    float _1385 = _1335 * _1339;
    float _1387 = rsqrt(_1375);
    float _1389 = _1383 * 0.15915493667125701904296875;
    float _1391 = _1165 * _1323;
    float _1393 = _1389 * 6.283185482025146484375;
    float _1395 = sin(_1393);
    float _1397 = _1371 * _1343;
    float _1399 = _1351 * _1387;
    float _1401 = _1357 * _1387;
    float _1403 = _1347 * _1387;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1407 = _1399 * _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1411 = _1401 * _1409;
    float _1413 = _1389 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1419 = -_1407;
    float _1421 = fma(_1401, _1417, _1419);
    float _1423 = fma(_1395, _1397, _1385);
    float _1425 = fma(_1395, _1385, _1397);
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1429 = _1403 * _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1433 = -_1411;
    float _1435 = fma(_1403, _1431, _1433);
    float _1437 = _1421 * _1421;
    float _1439 = _471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1443 = -_1429;
    float _1445 = fma(_1399, _1441, _1443);
    float _1447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1379);
    float _1449 = fma(_1435, _1435, _1437);
    float _1451 = _469 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1453 = _1391 * _1439;
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1377);
    float _1457 = fma(_1445, _1445, _1449);
    float _1459 = _1391 * _1451;
    float _1461 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1463 = _1447 * _1453;
    float _1465 = rsqrt(_1457);
    float _1467 = _1371 * _1339;
    float _1469 = _1335 * _1343;
    float _1471 = _1455 * _1459;
    float _1473 = _1391 * _1461;
    float _1475 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1381);
    float _1477 = _1415 * _1463;
    float _1479 = -_1467;
    float _1481 = fma(_1395, _1469, _1479);
    float _1483 = -_1469;
    float _1485 = fma(_1395, _1467, _1483);
    float _1487 = -_1463;
    float _1489 = _1395 * _1487;
    float _1491 = _1343 * _1415;
    float _1493 = _1371 * _1477;
    float _1495 = _1475 * _1473;
    float _1497 = _1335 * _1477;
    float _1499 = fma(_1491, _1471, _1489);
    float _1501 = fma(_1423, _1471, _1493);
    float _1503 = _1421 * _1465;
    float _1505 = _1435 * _1465;
    float _1507 = _1445 * _1465;
    float _1509 = _1339 * _1415;
    float _1511 = _1401 * _1503;
    float _1513 = _1403 * _1505;
    float _1515 = fma(_1485, _1495, _1501);
    float _1517 = fma(_1481, _1471, _1497);
    float _1519 = -_1511;
    float _1521 = fma(_1403, _1507, _1519);
    float _1523 = -_1513;
    float _1525 = fma(_1399, _1503, _1523);
    float _1527 = fma(_1509, _1495, _1499);
    float _1529 = fma(_1425, _1495, _1517);
    float _1531 = _1521 * _1515;
    float _1533 = _1525 * _1515;
    float _1535 = fma(_1505, _1527, _1531);
    float _1537 = fma(_1507, _1527, _1533);
    float _1539 = fma(_1399, _1529, _1535);
    float _1541 = fma(_1401, _1529, _1537);
    float _1543 = _1399 * _1507;
    float _1545 = _1071 + _1539;
    float _1547 = _771 + _1541;
    float _1549 = -_1543;
    float _1551 = fma(_1401, _1505, _1549);
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1555 = _1545 + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1547 + _1557;
    float _1561 = _1551 * _1515;
    float _1563 = _1555 * _1555;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1503, _1527, _1561);
    float _1569 = _1563 + _1565;
    float _1571 = fma(_1403, _1529, _1567);
    float _1573 = sqrt(_1569);
    float _1575 = _1051 + _1571;
    bool _1577 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1579 = _1527;
    float _1581 = _1529;
    float _1583 = _1507;
    float _1585 = _1401;
    float _1587 = _1565;
    float _1589 = _1561;
    if (!_1577)
    {
        _1579 = _1563;
    }
    float _1591 = _1579;
    float _1593 = _1591;
    if (!_1577)
    {
        _1581 = _1545;
    }
    float _1595 = _1581;
    float _1597 = _1595;
    if (!_1577)
    {
        _1583 = _1547;
    }
    float _1599 = _1583;
    float _1601 = _1599;
    if (!_1577)
    {
        _1585 = _1575;
    }
    float _1603 = _1585;
    bool _1605 = !_1577;
    float _1607 = _1603;
    if (!_1605)
    {
        float _1609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1613 = _1573 + _1611;
        float _1615 = rsqrt(_1569);
        float _1617 = _1613 * _1609;
        float _1619 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1621 = _1617 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1621 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = fma(_1625, _1619, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1633 = _1615 * _1631;
        float _1635 = _1629 + (-1.0);
        float _1637 = fma(_1555, _1633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1639 = fma(_1559, _1633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1641 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1645 = _1637 + _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1649 = _1639 + _1647;
        float _1651 = fma(_1575, _1629, _1641);
        float _1653 = _1645 * _1645;
        float _1655 = _1649 * _1649;
        _1607 = _1651;
        _1593 = _1653;
        _1587 = _1655;
        _1597 = _1637;
        _1601 = _1639;
    }
    float _1657 = _1607;
    float _1659 = _1593;
    float _1661 = _1587;
    float _1663 = _1597;
    float _1665 = _1601;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1669 = _1657 + _1667;
    float _1671 = fma(_1669, _1669, _1659);
    float _1673 = _1671 + _1661;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1679 = isnan(_1675);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1685 = _1681 || _1683;
    if (!_1685)
    {
        _1589 = 1.0;
    }
    float _1687 = _1589;
    bool _1689 = !_1685;
    float _1691 = _1687;
    if (!_1689)
    {
        bool _1693 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1695 = isnan(_1675);
        bool _1697 = _1693 || _1695;
        bool _1699 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1701 = _1697 || _1699;
        if (!_1701)
        {
            float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1705 = _1675 + _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1709 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1707;
            float _1711 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1715 = 1.0 / _1709;
            float _1717 = _1705 * _1715;
            float _1719 = fma(_1717, _1713, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1691 = _1719;
            _1721 = true;
        }
        else
        {
            bool _1723 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1725 = isnan(_1675);
            bool _1727 = _1723 || _1725;
            bool _1729 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1731 = _1727 || _1729;
            if (!_1731)
            {
                float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1735 = _1675 + _1733;
                float _1737 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1739 = _1737 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1743 = _1741 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1745 = 1.0 / _1739;
                float _1747 = _1735 * _1745;
                float _1749 = fma(_1747, _1743, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1691 = _1749;
                _1721 = true;
            }
            else
            {
                _1691 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1721 = false;
    float _1751 = _1691;
    float _1753 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1755 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1757 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1759 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1753);
    float _1761 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1755);
    float _1763 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1757);
    float _1765 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1759);
    float _1767 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1761);
    float _1769 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1763);
    float _1771 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1773 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1775 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1777 = 1.0 / _1771;
    float _1779 = _1773 + _1771;
    float _1781 = _1771 * 0.5;
    float _1783 = _1779 * 0.5;
    float _1785 = fma(_1775, -0.5, _1781);
    float _1787 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1783);
    float _1789 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1785);
    float _1791 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1785);
    float _1793 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1785);
    float _1795 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1783);
    float _1797 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1783);
    float _1799 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1783);
    float _1801 = _1787 * _1777;
    float _1803 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1785);
    float _1805 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1785);
    float _1807 = _1789 * _1777;
    float _1809 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1785);
    float _1811 = _1785 * _1777;
    float _1813 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1785);
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1817 = _1785 + _1815;
    float _1819 = _1785 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1821 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1785);
    float _1823 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1785);
    float _1825 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1785);
    float _1827 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1785);
    float _1829 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1785);
    float _1831 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1785);
    float _1833 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1785);
    float _1835 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1785);
    float _1837 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1785);
    float _1839 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1785);
    float _1841 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1785);
    float _1843 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1785);
    float _1845 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1785);
    float _1847 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1785);
    float _1849 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1785);
    float _1851 = _1791 * _1777;
    float _1853 = _1793 * _1777;
    float _1855 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1783);
    float _1857 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1783);
    float _1859 = _1795 * _1777;
    float _1861 = _1797 * _1777;
    float _1863 = _1799 * _1777;
    float _1865 = _1803 * _1777;
    float _1867 = _1805 * _1777;
    float _1869 = _1825 * _1777;
    float _1871 = _1831 * _1777;
    float2 _6262 = float2(_1801, _1851);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6262, float2(0.0), isnan(_6262)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6262, float2(0.0), isnan(_6262)), level(0.0)).x;
    float2 _6272 = float2(_1859, _1807);
    float _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6272, float2(0.0), isnan(_6272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6272, float2(0.0), isnan(_6272)), level(0.0)).x;
    float2 _6280 = float2(_1859, _1853);
    float _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6280, float2(0.0), isnan(_6280)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6280, float2(0.0), isnan(_6280)), level(0.0)).x;
    float2 _6288 = float2(_1861, _1865);
    float _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6288, float2(0.0), isnan(_6288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6288, float2(0.0), isnan(_6288)), level(0.0)).x;
    float2 _6296 = float2(_1863, _1869);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6296, float2(0.0), isnan(_6296)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6296, float2(0.0), isnan(_6296)), level(0.0)).x;
    float _1883 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1783);
    float _1885 = _1855 * _1777;
    float _1887 = _1857 * _1777;
    float _1889 = _1809 * _1777;
    float _1891 = _1817 * _1777;
    float _1893 = _1783 * _1777;
    float _1895 = _1819 * _1777;
    float _1897 = _1883 * _1777;
    float2 _6329 = float2(_1887, _1867);
    float _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6329, float2(0.0), isnan(_6329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6329, float2(0.0), isnan(_6329)), level(0.0)).x;
    float2 _6337 = float2(_1887, _1871);
    float _1901 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).x;
    float2 _6345 = float2(_1885, _1889);
    float _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6345, float2(0.0), isnan(_6345)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6345, float2(0.0), isnan(_6345)), level(0.0)).x;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1907 = _1783 + _1905;
    float _1909 = _1823 * _1777;
    float _1911 = _1827 * _1777;
    float _1913 = _1845 * _1777;
    float _1915 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1783);
    float _1917 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1783);
    float _1919 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1783);
    float _1921 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1783);
    float _1923 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1783);
    float _1925 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1783);
    float _1927 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1783);
    float _1929 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1783);
    float _1931 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1783);
    float _1933 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1783);
    float _1935 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1783);
    float _1937 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1783);
    float _1939 = _1829 * _1777;
    float2 _6419 = float2(_1893, _1889);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6419, float2(0.0), isnan(_6419)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6419, float2(0.0), isnan(_6419)), level(0.0)).x;
    float2 _6427 = float2(_1893, _1891);
    float _1943 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6427, float2(0.0), isnan(_6427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6427, float2(0.0), isnan(_6427)), level(0.0)).x;
    float2 _6435 = float2(_1893, _1895);
    float _1945 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6435, float2(0.0), isnan(_6435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6435, float2(0.0), isnan(_6435)), level(0.0)).x;
    float2 _6443 = float2(_1897, _1909);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6443, float2(0.0), isnan(_6443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6443, float2(0.0), isnan(_6443)), level(0.0)).x;
    float _1949 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1783);
    float _1951 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1953 = _1907 * _1777;
    float _1955 = _1813 * _1777;
    float _1957 = _1843 * _1777;
    float _1959 = _1821 * _1777;
    float2 _6471 = float2(_1893, _1909);
    float _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6471, float2(0.0), isnan(_6471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6471, float2(0.0), isnan(_6471)), level(0.0)).x;
    float2 _6479 = float2(_1893, _1911);
    float _1963 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6479, float2(0.0), isnan(_6479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6479, float2(0.0), isnan(_6479)), level(0.0)).x;
    float2 _6487 = float2(_1893, _1939);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6487, float2(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6487, float2(0.0), isnan(_6487)), level(0.0)).x;
    float2 _6495 = float2(_1893, _1811);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6495, float2(0.0), isnan(_6495)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6495, float2(0.0), isnan(_6495)), level(0.0)).x;
    float2 _6503 = float2(_1953, _1811);
    float _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6503, float2(0.0), isnan(_6503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6503, float2(0.0), isnan(_6503)), level(0.0)).x;
    float _1971 = _1915 * _1777;
    float _1973 = _1951 * _1777;
    float _1975 = _1917 * _1777;
    float _1977 = _1919 * _1777;
    float _1979 = _1921 * _1777;
    float2 _6526 = float2(_1971, _1955);
    float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).x;
    float2 _6534 = float2(_1971, _1959);
    float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).x;
    float2 _6542 = float2(_1971, _1811);
    float _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6542, float2(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6542, float2(0.0), isnan(_6542)), level(0.0)).x;
    float2 _6550 = float2(_1973, _1811);
    float _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6550, float2(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6550, float2(0.0), isnan(_6550)), level(0.0)).x;
    float2 _6558 = float2(_1975, _1811);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6558, float2(0.0), isnan(_6558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6558, float2(0.0), isnan(_6558)), level(0.0)).x;
    float2 _6566 = float2(_1977, _1811);
    float _1991 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6566, float2(0.0), isnan(_6566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6566, float2(0.0), isnan(_6566)), level(0.0)).x;
    float2 _6574 = float2(_1979, _1811);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6574, float2(0.0), isnan(_6574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6574, float2(0.0), isnan(_6574)), level(0.0)).x;
    float _1995 = _1923 * _1777;
    float _1997 = _1925 * _1777;
    float _1999 = _1833 * _1777;
    float _2001 = _1927 * _1777;
    float _2003 = _1835 * _1777;
    float _2005 = _1929 * _1777;
    float _2007 = _1837 * _1777;
    float _2009 = _1841 * _1777;
    float _2011 = _1839 * _1777;
    float _2013 = _1933 * _1777;
    float _2015 = _1931 * _1777;
    float _2017 = _1935 * _1777;
    float2 _6618 = float2(_1995, _1999);
    float _2019 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6618, float2(0.0), isnan(_6618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6618, float2(0.0), isnan(_6618)), level(0.0)).x;
    float2 _6626 = float2(_1997, _2003);
    float _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6626, float2(0.0), isnan(_6626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6626, float2(0.0), isnan(_6626)), level(0.0)).x;
    float2 _6634 = float2(_2001, _2007);
    float _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6634, float2(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6634, float2(0.0), isnan(_6634)), level(0.0)).x;
    float2 _6642 = float2(_2005, _2011);
    float _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6642, float2(0.0), isnan(_6642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6642, float2(0.0), isnan(_6642)), level(0.0)).x;
    float2 _6650 = float2(_2015, _2009);
    float _2027 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6650, float2(0.0), isnan(_6650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6650, float2(0.0), isnan(_6650)), level(0.0)).x;
    float2 _6658 = float2(_2013, _1957);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6658, float2(0.0), isnan(_6658)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6658, float2(0.0), isnan(_6658)), level(0.0)).x;
    float2 _6666 = float2(_2017, _1913);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6666, float2(0.0), isnan(_6666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6666, float2(0.0), isnan(_6666)), level(0.0)).x;
    float _2033 = _1847 * _1777;
    float _2035 = _1849 * _1777;
    float _2037 = _1937 * _1777;
    float _2039 = _1949 * _1777;
    float2 _6686 = float2(_2037, _2033);
    float _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6686, float2(0.0), isnan(_6686)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6686, float2(0.0), isnan(_6686)), level(0.0)).x;
    float2 _6694 = float2(_2039, _2035);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6694, float2(0.0), isnan(_6694)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6694, float2(0.0), isnan(_6694)), level(0.0)).x;
    float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2047 = _1663 + _2045;
    float _2049 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2051 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2053 = _1665 + _2051;
    bool _2055 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(0.5);
    bool _2063 = _2059 || _2061;
    float _2065 = fma(_2047, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2069 = _1657 + _2067;
    float _2071 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2049);
    float _2073 = fma(_2053, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -_1217;
    float _2077 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2065);
    float _2079 = fma(_2069, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2081 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2071);
    float _2083 = -_1229;
    float _2085 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2073);
    float _2087 = -_1219;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2079);
    float _2091 = _2089;
    float _2093 = _2085;
    if (_2063)
    {
        _1315 = _2077;
    }
    float _2095 = _1315;
    float _2097 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2099 = _2095;
    if (!_2063)
    {
        float _2101 = _1239 * _1239;
        float _2103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _2105 = -_1071;
        float _2107 = _2105 + _2065;
        float _2109 = -_1051;
        float _2111 = _2109 + _2079;
        float _2113 = fma(_1253, _1253, _2101);
        float _2115 = -_771;
        float _2117 = _2115 + _2073;
        float _2119 = fma(_1263, _1263, _2113);
        float _2121 = 1.0 / _1391;
        float _2123 = sqrt(_2119);
        float _2125 = precise::max(_2123, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _2127 = _2125 * _2103;
        float _2129 = _2127 * _2121;
        float _2131 = fma(_2107, _2129, _1235);
        float _2133 = fma(_2111, _2129, _1225);
        float _2135 = fma(_2117, _2129, _1249);
        _2091 = _2133;
        _2099 = _2131;
        _2093 = _2135;
    }
    float _2137 = _2091;
    float _2139 = _2099;
    float _2141 = _2093;
    float _2143 = _2097 + _1771;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2149 = _2143 * _1777;
    float _2151 = _2149 * 0.5;
    float _2153 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2155 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2145);
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2159 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2157);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2163 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2161);
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2167 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2165);
    float _2169 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2147);
    float _2171 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2155);
    float _2173 = 1.0 / _2163;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2177 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2175);
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2181 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2153);
    float _2183 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2169);
    float _2185 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2179);
    float _2189 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2191 = 1.0 / _2159;
    float _2193 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2201 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2199);
    float _2203 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2187);
    float _2205 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2207 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2209 = 1.0 / _2167;
    out.m_60.x = _1235;
    out.m_60.y = _1225;
    out.m_60.z = _1249;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2213 = _2173 * _2211;
    float _2215 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2197);
    float _2217 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2219 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2207);
    float _2221 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2225 = 1.0 / _2177;
    float _2227 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2229 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2221);
    float _2231 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2223);
    float _2233 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2215);
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2237 = -_2213;
    float _2239 = fma(_2191, _2235, _2237);
    float _2241 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2229);
    float _2243 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2231);
    float _2245 = 1.0 / _2201;
    float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2249 = -_2213;
    float _2251 = fma(_2209, _2247, _2249);
    bool _2253 = _2239 >= 0.0;
    bool _2255 = isnan(_2239);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2265 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2263);
    float _2267 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2241);
    float _2269 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2233);
    bool _2271 = _2251 >= 0.0;
    bool _2273 = isnan(_2251);
    bool _2275 = _2271 || _2273;
    bool _2277 = isnan(0.0);
    bool _2279 = _2275 || _2277;
    float _2281 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2243);
    float _2283 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2285 = -_2213;
    float _2287 = fma(_2225, _2283, _2285);
    float _2289 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2291 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2289);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2295 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2293);
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2299 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2297);
    out.gl_Position.x = _2267;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _2227;
    out.gl_Position.w = _2269;
    bool _2301 = _2287 >= 0.0;
    bool _2303 = isnan(_2287);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2315 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2313);
    bool _2317 = !_2279;
    float _2319 = _2317 ? 0.0 : 2.0;
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2323 = -_2213;
    float _2325 = fma(_2245, _2321, _2323);
    float _2327 = 1.0 / _2299;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2335 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2333);
    float _2337 = _2319 + _2311;
    bool _2339 = _2325 >= 0.0;
    bool _2341 = isnan(_2325);
    bool _2343 = _2339 || _2341;
    bool _2345 = isnan(0.0);
    bool _2347 = _2343 || _2345;
    float _2349 = float(_2347);
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2353 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2351);
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2357 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2355);
    float _2359 = _2227 + _2269;
    float _2361 = 1.0 / _2265;
    bool _2363 = !_2261;
    float _2365 = _2363 ? 0.0 : 2.0;
    float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2369 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2367);
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2373 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2371);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2377 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2375);
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2381 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2379);
    float _2383 = _2337 + _2365;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2387 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2385);
    float _2389 = 1.0 / _2315;
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2393 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2391);
    float _2395 = _2383 + _2349;
    float _2397 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2399 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2397);
    float _2401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2403 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2401);
    float _2405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2407 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2405);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2411 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2409);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2415 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2413);
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2419 = -_2213;
    float _2421 = fma(_2361, _2417, _2419);
    float _2423 = 1.0 / _2353;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2427 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2425);
    float _2429 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2431 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2429);
    float _2433 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2435 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2433);
    bool _2437 = _2421 >= 0.0;
    bool _2439 = isnan(_2421);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan(0.0);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2451 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2449);
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2459 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2457);
    float _2461 = 1.0 / _2291;
    float _2463 = _2395 + _2447;
    float _2465 = _2359 * 0.5;
    float _2467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2469 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2467);
    float _2471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2473 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2471);
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2477 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2475);
    float _2479 = 1.0 / _2357;
    out.m_62.z = _2465;
    out.m_62.w = _2269;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2483 = -_2213;
    float _2485 = fma(_2461, _2481, _2483);
    float _2487 = 1.0 / _2377;
    bool _2489 = _2485 >= 0.0;
    bool _2491 = isnan(_2485);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan(0.0);
    bool _2497 = _2493 || _2495;
    float _2499 = 1.0 / _2295;
    bool _2501 = !_2497;
    float _2503 = _2501 ? 0.0 : 2.0;
    float _2505 = _2463 + _2503;
    float _2507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2509 = -_2213;
    float _2511 = fma(_2327, _2507, _2509);
    float _2513 = 1.0 / _2381;
    bool _2515 = _2511 >= 0.0;
    bool _2517 = isnan(_2511);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan(0.0);
    bool _2523 = _2519 || _2521;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2527 = -_2213;
    float _2529 = fma(_2389, _2525, _2527);
    float _2531 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2533 = -_2213;
    float _2535 = fma(_2499, _2531, _2533);
    float _2537 = 1.0 / _2411;
    bool _2539 = _2529 >= 0.0;
    bool _2541 = isnan(_2529);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan(0.0);
    bool _2547 = _2543 || _2545;
    bool _2549 = !_2523;
    float _2551 = _2549 ? 0.0 : 2.0;
    bool _2553 = _2535 >= 0.0;
    bool _2555 = isnan(_2535);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = float(_2561);
    float _2565 = 1.0 / _2331;
    float _2567 = _2505 + _2563;
    bool _2569 = !_2547;
    float _2571 = _2569 ? 0.0 : 2.0;
    float _2573 = _2567 + _2551;
    float _2575 = 1.0 / _2415;
    float _2577 = _2573 + _2571;
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2581 = -_2213;
    float _2583 = fma(_2565, _2579, _2581);
    float _2585 = 1.0 / _2427;
    bool _2587 = _2583 >= 0.0;
    bool _2589 = isnan(_2583);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = 1.0 / _2335;
    float _2601 = _2577 + _2597;
    float _2603 = 1.0 / _2431;
    float _2605 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2607 = -_2213;
    float _2609 = fma(_2599, _2605, _2607);
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2613 = -_2213;
    float _2615 = fma(_2423, _2611, _2613);
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2619 = -_2213;
    float _2621 = fma(_2479, _2617, _2619);
    float _2623 = 1.0 / _2469;
    bool _2625 = _2609 >= 0.0;
    bool _2627 = isnan(_2609);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan(0.0);
    bool _2633 = _2629 || _2631;
    bool _2635 = _2615 >= 0.0;
    bool _2637 = isnan(_2615);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(0.0);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    bool _2647 = !_2633;
    float _2649 = _2647 ? 0.0 : 2.0;
    float _2651 = 1.0 / _2369;
    float _2653 = _2601 + _2649;
    bool _2655 = _2621 >= 0.0;
    bool _2657 = isnan(_2621);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan(0.0);
    bool _2663 = _2659 || _2661;
    float _2665 = float(_2663);
    float _2667 = _2653 + _2645;
    float _2669 = 1.0 / _2373;
    float _2671 = _2667 + _2665;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2675 = -_2213;
    float _2677 = fma(_2651, _2673, _2675);
    float _2679 = 1.0 / _2459;
    bool _2681 = _2677 >= 0.0;
    bool _2683 = isnan(_2677);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.0);
    bool _2689 = _2685 || _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2693 = -_2213;
    float _2695 = fma(_2669, _2691, _2693);
    bool _2697 = !_2689;
    float _2699 = _2697 ? 0.0 : 2.0;
    float _2701 = 1.0 / _2435;
    bool _2703 = _2695 >= 0.0;
    bool _2705 = isnan(_2695);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.0);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = _2671 + _2699;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2719 = -_2213;
    float _2721 = fma(_2487, _2717, _2719);
    float _2723 = 1.0 / _2387;
    float _2725 = _2715 + _2713;
    bool _2727 = _2721 >= 0.0;
    bool _2729 = isnan(_2721);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2739 = -_2213;
    float _2741 = fma(_2513, _2737, _2739);
    bool _2743 = _2741 >= 0.0;
    bool _2745 = isnan(_2741);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan(0.0);
    bool _2751 = _2747 || _2749;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2755 = -_2213;
    float _2757 = fma(_2701, _2753, _2755);
    bool _2759 = !_2735;
    float _2761 = _2759 ? 0.0 : 2.0;
    float _2763 = 1.0 / _2473;
    bool _2765 = !_2751;
    float _2767 = _2765 ? 0.0 : 2.0;
    float _2769 = _2725 + _2761;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2773 = -_2213;
    float _2775 = fma(_2723, _2771, _2773);
    float _2777 = _2769 + _2767;
    float _2779 = 1.0 / _2477;
    bool _2781 = _2775 >= 0.0;
    bool _2783 = isnan(_2775);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan(0.0);
    bool _2789 = _2785 || _2787;
    float _2791 = float(_2789);
    float _2793 = _2777 + _2791;
    float _2795 = 1.0 / _2393;
    float _2797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2799 = -_2213;
    float _2801 = fma(_2795, _2797, _2799);
    float _2803 = 1.0 / _2399;
    bool _2805 = _2801 >= 0.0;
    bool _2807 = isnan(_2801);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(0.0);
    bool _2813 = _2809 || _2811;
    bool _2815 = !_2813;
    float _2817 = _2815 ? 0.0 : 2.0;
    float _2819 = _2793 + _2817;
    float _2821 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2823 = -_2213;
    float _2825 = fma(_2803, _2821, _2823);
    bool _2827 = _2825 >= 0.0;
    bool _2829 = isnan(_2825);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan(0.0);
    bool _2835 = _2831 || _2833;
    float _2837 = float(_2835);
    float _2839 = 1.0 / _2403;
    float _2841 = _2819 + _2837;
    float _2843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2845 = -_2213;
    float _2847 = fma(_2839, _2843, _2845);
    float _2849 = 1.0 / _2407;
    bool _2851 = _2847 >= 0.0;
    bool _2853 = isnan(_2847);
    bool _2855 = _2851 || _2853;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    float _2861 = float(_2859);
    float _2863 = _2841 + _2861;
    float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2867 = -_2213;
    float _2869 = fma(_2849, _2865, _2867);
    float _2871 = 1.0 / _2451;
    bool _2873 = _2869 >= 0.0;
    bool _2875 = isnan(_2869);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(0.0);
    bool _2881 = _2877 || _2879;
    bool _2883 = !_2881;
    float _2885 = _2883 ? 0.0 : 2.0;
    float _2887 = _2863 + _2885;
    float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2891 = -_2213;
    float _2893 = fma(_2537, _2889, _2891);
    float _2895 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2897 = -_2213;
    float _2899 = fma(_2871, _2895, _2897);
    bool _2901 = _2893 >= 0.0;
    bool _2903 = isnan(_2893);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan(0.0);
    bool _2909 = _2905 || _2907;
    float _2911 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2913 = -_2213;
    float _2915 = fma(_2575, _2911, _2913);
    bool _2917 = _2899 >= 0.0;
    bool _2919 = isnan(_2899);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan(0.0);
    bool _2925 = _2921 || _2923;
    float _2927 = float(_2925);
    bool _2929 = _2915 >= 0.0;
    bool _2931 = isnan(_2915);
    bool _2933 = _2929 || _2931;
    bool _2935 = isnan(0.0);
    bool _2937 = _2933 || _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2941 = -_2213;
    float _2943 = fma(_2585, _2939, _2941);
    float _2945 = _2887 + _2927;
    bool _2947 = _2943 >= 0.0;
    bool _2949 = isnan(_2943);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    float _2957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2959 = -_2213;
    float _2961 = fma(_2603, _2957, _2959);
    bool _2963 = !_2955;
    float _2965 = _2963 ? 0.0 : 3.0;
    bool _2967 = _2961 >= 0.0;
    bool _2969 = isnan(_2961);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    bool _2977 = !_2937;
    float _2979 = _2977 ? 0.0 : 3.0;
    bool _2981 = _2757 >= 0.0;
    bool _2983 = isnan(_2757);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.0);
    bool _2989 = _2985 || _2987;
    float _2991 = 1.0 / _2455;
    float _2993 = _2979 + _2965;
    bool _2995 = !_2909;
    float _2997 = _2995 ? 0.0 : 2.0;
    bool _2999 = !_2975;
    float _3001 = _2999 ? 0.0 : 3.0;
    bool _3003 = !_2989;
    float _3005 = _3003 ? 0.0 : 3.0;
    float _3007 = _2945 + _2997;
    float _3009 = _2993 + _3001;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3013 = -_2213;
    float _3015 = fma(_2623, _3011, _3013);
    float _3017 = _3007 * 0.02857142873108386993408203125;
    float _3019 = precise::clamp(_3017, 0.0, 1.0);
    float _3021 = _3009 + _3005;
    bool _3023 = _3015 >= 0.0;
    bool _3025 = isnan(_3015);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan(0.0);
    bool _3031 = _3027 || _3029;
    float _3033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3035 = -_2213;
    float _3037 = fma(_2991, _3033, _3035);
    float _3039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3041 = -_2213;
    float _3043 = fma(_2679, _3039, _3041);
    float _3045 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3047 = -_2213;
    float _3049 = fma(_2779, _3045, _3047);
    bool _3051 = _3037 >= 0.0;
    bool _3053 = isnan(_3037);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    bool _3061 = !_3059;
    float _3063 = _3061 ? 0.0 : 3.0;
    bool _3065 = _3043 >= 0.0;
    bool _3067 = isnan(_3043);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan(0.0);
    bool _3073 = _3069 || _3071;
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3077 = -_2213;
    float _3079 = fma(_2763, _3075, _3077);
    float _3081 = _3021 + _3063;
    bool _3083 = !_3073;
    float _3085 = _3083 ? 0.0 : 3.0;
    bool _3087 = _3079 >= 0.0;
    bool _3089 = isnan(_3079);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan(0.0);
    bool _3095 = _3091 || _3093;
    bool _3097 = !_3031;
    float _3099 = _3097 ? 0.0 : 3.0;
    float _3101 = _3081 + _3085;
    bool _3103 = _3049 >= 0.0;
    bool _3105 = isnan(_3049);
    bool _3107 = _3103 || _3105;
    bool _3109 = isnan(0.0);
    bool _3111 = _3107 || _3109;
    float _3113 = _3101 + _3099;
    bool _3115 = !_3095;
    float _3117 = _3115 ? 0.0 : 3.0;
    bool _3119 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3121 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3123 = _3119 || _3121;
    bool _3125 = isnan(0.5);
    bool _3127 = _3123 || _3125;
    bool _3129 = !_3111;
    float _3131 = _3129 ? 0.0 : 5.0;
    float _3133 = _3113 + _3117;
    float _3135 = _3133 + _3131;
    float _3137 = _3135 * 0.14285714924335479736328125;
    float _3139 = precise::clamp(_3137, 0.0, 1.0);
    float _3141 = _3019 * _3139;
    float _3143 = _3019;
    float _3145 = _3139;
    if (_3127)
    {
        _3143 = 1.0;
    }
    float _3147 = _3143;
    float _3149 = _3147;
    if (_3127)
    {
        _3145 = 1.0;
    }
    float _3151 = _3145;
    float _3153 = _3151;
    if (!_3127)
    {
        float _3155 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3159 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3157;
        float _3161 = _3155 * 0.15915493667125701904296875;
        float _3163 = _3161 * 6.283185482025146484375;
        float _3165 = cos(_3163);
        float _3167 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3169 = _3167 * 0.15915493667125701904296875;
        float _3171 = _3161 * 6.283185482025146484375;
        float _3173 = sin(_3171);
        float _3175 = 1.0 / _3165;
        float _3177 = _3169 * 6.283185482025146484375;
        float _3179 = cos(_3177);
        float _3181 = _3173 * _3175;
        float _3183 = _3169 * 6.283185482025146484375;
        float _3185 = sin(_3183);
        float _3187 = _3179 * _3181;
        float _3189 = 1.0 / _3159;
        float _3191 = 1.0 / _3187;
        float _3193 = _3185 * _3191;
        float _3195 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3197 = fma(_2213, _3193, _3195);
        float _3199 = _3197 * _3189;
        float _3201 = precise::clamp(_3199, 0.0, 1.0);
        _3153 = _3201;
    }
    float _3203 = _3153;
    if (!_3127)
    {
        float _3205 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3207 = _3205 * 0.15915493667125701904296875;
        float _3209 = _3207 * 6.283185482025146484375;
        float _3211 = cos(_3209);
        float _3213 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3215 = _3213 * 0.15915493667125701904296875;
        float _3217 = _3207 * 6.283185482025146484375;
        float _3219 = sin(_3217);
        float _3221 = 1.0 / _3211;
        float _3223 = _3215 * 6.283185482025146484375;
        float _3225 = cos(_3223);
        float _3227 = _3219 * _3221;
        float _3229 = _3215 * 6.283185482025146484375;
        float _3231 = sin(_3229);
        float _3233 = _3225 * _3227;
        float _3235 = 1.0 / _3233;
        float _3237 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3239 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3237;
        float _3241 = 1.0 / _3239;
        float _3243 = _3231 * _3235;
        float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3247 = fma(_2213, _3243, _3245);
        float _3249 = _3247 * _3241;
        float _3251 = precise::clamp(_3249, 0.0, 1.0);
        float _3253 = -_3251;
        float _3255 = _3253 + 1.0;
        _3149 = _3255;
    }
    float _3257 = _3149;
    float _3259 = _3141 * _3203;
    bool _3261 = _3203 > 0.0;
    bool _3263 = isnan(_3203);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(0.0);
    bool _3269 = _3265 || _3267;
    float _3271 = _3259 * _3257;
    bool _3273 = _3257 <= 0.0;
    bool _3275 = !_3269;
    bool _3277 = _3273 || _3275;
    float _3279 = _3271 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3281 = _349 * _3279;
    float _3283 = _3281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = _3283;
    if (!_3277)
    {
        return out;
    }
    out.m_40.x = 0.0;
    float _3285 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3285;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1721 = false;
    bool _499 = false;
    bool _369 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_37.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_40.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3342 = as_type<float>(_97);
        out.gl_Position.z = _3342;
    }
    if (!_85)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_42.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = _115;
    if (_111)
    {
        float _119 = float(_81);
        _91 = _119;
    }
    float _121 = _91;
    bool _123 = _115 >= _121;
    bool _125 = !_111;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_40.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _99 = as_type<int>(_133);
    }
    int _135 = _99;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3412 = as_type<float>(_135);
        out.gl_Position.z = _3412;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_44.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = 0.0;
    if (!_153)
    {
        float _159 = _143 * _143;
        float _161 = _159 * 0.5;
        _157 = _161;
    }
    float _163 = _157;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _167 = _163;
    if (!_153)
    {
        float _169 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    float _173 = in.m_42.x;
    float _175 = in.m_42.y;
    float _177 = in.m_42.z;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = 1.4012984643248170709237295832899e-45;
    float _195 = _171;
    if (!_153)
    {
        _193 = _143;
    }
    float _197 = _193;
    float _199 = -_181;
    float _201 = _165 + _199;
    bool _203 = !_153;
    float _205 = _197;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _143 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _143);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _235;
    }
    float _237 = _195;
    bool _239 = !_153;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _143 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _205 = _259;
    }
    float _261 = _205;
    float _263 = in.m_46.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = in.m_37.x;
    float _275 = in.m_37.y;
    float _277 = in.m_37.z;
    float _279 = -_201;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _283 = _201 < 0.5;
    float _285 = float(_283);
    bool _287 = !_267;
    int _289 = _287 ? 0 : 1;
    float _291 = fma(_191, 0.5, 0.5);
    bool _293 = !_187;
    int _295 = _293 ? 0 : 1;
    float _297 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _299 = abs(_289);
    float _301 = -_285;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_291;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = fma(_261, _173, _297);
    int _311 = abs(_295);
    float _313 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _315 = !_271;
    int _317 = _315 ? 0 : 1;
    float _319 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _323 = abs(_317);
    float _325 = fma(_261, _175, _313);
    float _327 = float(_299);
    float _329 = fma(_261, _177, _319);
    float _331 = float(_311);
    float _333 = abs(_281);
    float _335 = _327 * _333;
    float _337 = fma(_329, _263, _277);
    float _339 = float(_323);
    float _341 = fma(_331, _307, _335);
    float _343 = fma(_309, _263, _273);
    float _345 = fma(_325, _263, _275);
    float _347 = abs(_303);
    float _349 = fma(_339, _347, _341);
    bool _351 = !_321;
    float _367;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_81);
        float _373 = 1.0 / _371;
        float _375 = _115 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _377 + _379;
    float _383 = in.m_46.x;
    float _385 = in.m_46.y;
    float _387 = in.m_46.z;
    bool _389 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_377);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    bool _405 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_377);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -_399;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = 1.0 / _403;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _429 = _415 * _419;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = _381 * _425;
    float _437 = fma(_423, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _443;
    float _447 = fma(_441, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = fma(_445, _435, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _451 = _437 * _429;
    float _453 = _447 * _429;
    float _455 = _449 * _429;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _463 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].x, _457);
    float _465 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].y, _459);
    float _467 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[144].z, _461);
    float _469 = _463 * _383;
    float _471 = _465 * _385;
    float _473 = _467 * _387;
    bool _475 = !_427;
    bool _477 = _427;
    float _479 = _465;
    int _495;
    float _497;
    if (!_475)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _483 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = as_type<int>(_487);
        _497 = _493;
        _499 = true;
    }
    else
    {
        float _501 = float(_81);
        float _503 = 1.0 / _501;
        float _505 = _115 * _503;
        _495 = as_type<int>(_503);
        _497 = _505;
    }
    _499 = false;
    int _507 = _495;
    float _509 = _497;
    float _511 = in.m_48.x;
    float _513 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = in.m_44.z;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _519 = _517 != 0;
    float _521 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _525 = _523 != 0;
    float _527 = in.m_44.w;
    float _529 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _531 = in.m_44.y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _535 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
    float _537 = in.m_48.y;
    float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _541 = _507;
    if (_519)
    {
        bool _543 = _137 > 0.5;
        _477 = _543;
    }
    bool _545 = _477;
    float _547 = _511;
    if (_519)
    {
        float _549 = -_511;
        float _551 = _549 + 1.0;
        _541 = as_type<int>(_551);
    }
    int _553 = _541;
    int _555 = _553;
    if (!_519)
    {
        _479 = _511;
    }
    float _557 = _479;
    float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _561 = log2(_559);
    float _563 = _557;
    if (_519)
    {
        float _565 = _545 ? as_type<float>(_553) : _511;
        _563 = _565;
    }
    float _567 = _563;
    if (_525)
    {
        float _569 = -_511;
        float _571 = _569 + 1.0;
        _555 = as_type<int>(_571);
    }
    int _573 = _555;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _585 = _583 != 0;
    bool _587 = false;
    if (_525)
    {
        bool _589 = _515 > 0.5;
        _587 = _589;
    }
    bool _591 = _587;
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _601 = _599 != 0;
    float _603 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_525)
    {
        float _605 = _591 ? as_type<float>(_573) : _511;
        _547 = _605;
    }
    float _607 = _547;
    float _609 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _613 = _611 != 0;
    float _615 = _137 * 2.0;
    float _617 = -_533;
    float _619 = fma(_609, 2.0, _617);
    bool _621 = _527 > 0.5;
    float _623 = _531 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _627 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _603);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _629;
    float _633 = fma(_623, -2.0, _625);
    float _635 = floor(_615);
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _639 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _627);
    float _641 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
    float _643 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _645 = _531 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _651 = -_537;
    float _653 = _651 + 1.0;
    float _655 = 1.0 / _631;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _661 = _137 + _531;
    int _663 = _621 ? as_type<int>(_653) : as_type<int>(_537);
    float _665 = _561 * _115;
    float _667 = _661 + (-1.0);
    float _669 = 1.0 / _649;
    float _671 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _677 = _635 > 0.0;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _681 = _509 + _679;
    float _683 = _597 ? as_type<float>(_663) : _537;
    float _685 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_50.x = _671;
    out.m_50.y = _673;
    out.m_50.z = _675;
    float _687 = floor(_645);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _691 = _509 + _689;
    bool _693 = _635 >= 0.0;
    bool _695 = isnan(_635);
    bool _697 = _693 || _695;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _703;
    float _707 = _691 * _655;
    float _709 = _531 + _515;
    float _711 = _681 * _669;
    float _713 = _635;
    float _715 = _537;
    float _717 = _681;
    float _719 = _653;
    if (!_613)
    {
        _713 = _531;
    }
    float _721 = _713;
    float _723 = _709 + (-1.0);
    float _725 = _515 * 2.0;
    int _727 = _701 ? 0 : 1;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _733 = _531 > 0.5;
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _737 = ~_727;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = floor(_725);
    float _745 = _723;
    int _747 = _741;
    float _749 = _721;
    if (_601)
    {
        float _751 = _733 ? _653 : _537;
        _715 = _751;
    }
    float _753 = _715;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _757 = _687 > 0.0;
    float _759 = _593 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _761 = _687 >= 0.0;
    bool _763 = isnan(_687);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    float _771 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _773 = _687;
    if (!_613)
    {
        _745 = _137;
    }
    float _775 = _745;
    float _777 = exp2(_665);
    float _779 = _775;
    if (!_613)
    {
        _717 = _531;
    }
    float _781 = _717;
    float _783 = fma(_759, _753, -0.5);
    float _785 = _781;
    if (!_613)
    {
        _773 = _515;
    }
    float _787 = _773;
    float _789 = _787;
    if (!_613)
    {
        _719 = _515;
    }
    float _791 = _719;
    float _793 = _791;
    if (!_677)
    {
        int _795 = ~_727;
        int _797 = _795 + 1;
        _747 = _797;
    }
    int _799 = _747;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _801;
    if (_613)
    {
        _779 = _515;
    }
    float _805 = _779;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    if (_613)
    {
        _749 = _137;
    }
    float _811 = _749;
    float _813 = fma(_803, _707, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    if (_613)
    {
        _785 = _137;
    }
    float _815 = _785;
    float _817 = fma(_809, _711, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    if (_613)
    {
        _789 = _531;
    }
    float _819 = _789;
    float _821 = -_777;
    float _823 = _821 + 1.0;
    if (_613)
    {
        _793 = _531;
    }
    float _825 = _793;
    bool _827 = _743 > 0.0;
    float _829 = _819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _831 = _743 >= 0.0;
    bool _833 = isnan(_743);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _849 = fma(_843, _707, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _851 = fma(_705, _707, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _853 = fma(_731, _711, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _855 = _539 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _857 = fma(_847, _711, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _859 = fma(_683, _855, -0.5);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _863 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _865 = isnan(_509);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _879 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[84].z, _861);
    bool _881 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _883 = isnan(_509);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = -_873;
    float _895 = _893 + 1.0;
    float _897 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[83].z, _875);
    bool _899 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_509);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].w, _877);
    float _913 = _891 * _895;
    float _915 = -_891;
    float _917 = _915 + 1.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _921 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _897);
    float _923 = _909 * _917;
    float _925 = -_909;
    float _927 = _925 + 1.0;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _931 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _933 = _813 * _923;
    float _935 = _849 * _923;
    float _937 = _851 * _923;
    float _939 = -_929;
    float _941 = fma(_931, 2.0, _939);
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].y, _933);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].x, _935);
    int _947 = _839 ? 0 : 1;
    float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _951 = fma(_829, -2.0, _755);
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _955 = ~_947;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = fma(_857, _913, _945);
    int _963 = _959;
    if (!_827)
    {
        int _965 = ~_947;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[79].z, _953);
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _975 = _769 ? 0 : 1;
    float _977 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[107].z, _937);
    bool _979 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _981 = isnan(1.0);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _987 = _983 || _985;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _991 = 1.0 + _989;
    float _993 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[79].x, _971);
    int _995 = ~_975;
    int _997 = _995 + 1;
    int _999 = _997 + 1;
    float _1001 = fma(_853, _913, _977);
    float _1003 = _993 * (-0.15915493667125701904296875);
    int _1005 = _999;
    if (!_757)
    {
        int _1007 = ~_975;
        int _1009 = _1007 + 1;
        _1005 = _1009;
    }
    int _1011 = _1005;
    float _1013 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _633);
    float _1015 = 1.0 / _991;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1019 = _949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1021 = fma(_817, _913, _943);
    float _1023 = -_115;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _941);
    bool _1027 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1035 = _1031 || _1033;
    float _1037 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1017);
    float _1039 = _973 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1041 = _1003 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    float _1045 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[78].w, _919);
    float _1047 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[84].x, _879);
    float _1049 = fma(_1019, _567, -0.5);
    float _1051 = _641 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1053 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1037);
    float _1055 = -_115;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _619);
    float _1059 = _1035 ? _823 : 0.0;
    float _1061 = _1003 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    float _1067 = fma(_1039, _607, -0.5);
    float _1069 = _1047 * (-0.15915493667125701904296875);
    float _1071 = _639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1051 + _1073;
    float _1077 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _911);
    float _1079 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _951);
    if (_987)
    {
        float _1081 = _1059 * _1015;
        _117 = _1081;
    }
    float _1083 = _117;
    bool _1085 = !_581;
    int _1087 = _1085 ? 0 : 1;
    float _1089 = _1069 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = _1071 + _1093;
    float _1097 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1099 = abs(_1087);
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _771 + _1101;
    float _1105 = _1043 * _783;
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1097);
    float _1109 = _1063 * _783;
    float _1111 = _1069 * 6.283185482025146484375;
    float _1113 = cos(_1111);
    float _1115 = -_1105;
    float _1117 = fma(_1063, _1049, _1115);
    float _1119 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1107);
    float _1121 = _1075 * _1075;
    float _1123 = float(_1099);
    float _1125 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].x, _961);
    float _1127 = float(_799);
    float _1129 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1021);
    float _1131 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1001);
    bool _1133 = _1119 >= 0.0;
    float _1135 = fma(_1095, _1095, _1121);
    float _1137 = fma(_1043, _1049, _1109);
    float _1139 = _1123 * _1127;
    float _1141 = _1091 * _859;
    float _1143 = fma(_1053, _1117, _1057);
    float _1145 = fma(_1103, _1103, _1135);
    float _1147 = _1113 * _859;
    float _1149 = -_1013;
    float _1151 = fma(_1065, _1137, _1149);
    float _1153 = -_1141;
    float _1155 = fma(_1113, _1067, _1153);
    float _1157 = in.m_52.x;
    float _1159 = in.m_52.y;
    float _1161 = in.m_52.z;
    float _1163 = fma(_1091, _1067, _1147);
    float _1165 = rsqrt(_1145);
    float _1167 = fma(_921, _1155, _1025);
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1171 = -_1079;
    float _1173 = fma(_1077, _1163, _1171);
    float _1175 = _1129 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1177 = _1163;
    if (_1133)
    {
        _1177 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1179 = _1177;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1183 = !_577;
    int _1185 = _1183 ? 0 : 1;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1189 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1195 = _1143 + 0.5;
    int _1197 = as_type<int>(_1179);
    if (_1133)
    {
        float _1199 = _1179 * 5.0;
        _1197 = as_type<int>(_1199);
    }
    int _1201 = _1197;
    float _1203 = _1151 + 0.5;
    float _1205 = _1167 + 0.5;
    float _1207 = _1173 + 0.5;
    int _1209 = abs(_1185);
    out.m_54.x = _1189;
    out.m_54.y = _1191;
    out.m_54.z = _1193;
    out.m_54.w = _1187;
    float _1211 = _531 + (-0.5);
    bool _1213 = !_585;
    int _1215 = _1213 ? 0 : 1;
    float _1217 = _1095 * _1165;
    if (_1133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5144 = as_type<float>(_1201);
        out.gl_Position.z = _5144;
    }
    float _1219 = _1075 * _1165;
    out.m_56.x = _1195;
    out.m_56.y = _1203;
    out.m_56.z = _1205;
    out.m_56.w = _1207;
    if (_1133)
    {
        out.m_40.x = 0.0;
    }
    if (_1133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1221 = _1139 * (-2.0);
    float _1223 = -_1219;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1051);
    float _1227 = float(_1209);
    float _1229 = _1103 * _1165;
    float _1231 = fma(_1221, _1159, _1159);
    float _1233 = -_1217;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1071);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1225 + _1237;
    float _1241 = float(_969);
    float _1243 = fma(_735, _1221, _735);
    float _1245 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1231);
    float _1247 = -_1229;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1253 = _1235 + _1251;
    float _1255 = _1239 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1257 = fma(_1243, _1083, _1245);
    float _1259 = _1227 * _1241;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _1249 + _1261;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    float _1267 = _1257 * 0.15915493667125701904296875;
    float _1269 = _1259 * (-2.0);
    float _1271 = -_1219;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1075);
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1265);
    float _1277 = _137 + (-0.5);
    float _1279 = fma(_1269, _1157, _1157);
    int _1281 = abs(_1215);
    float _1283 = -_1217;
    float _1285 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    bool _1287 = _1275 >= 0.0;
    float _1289 = _1273 * _1273;
    float _1291 = fma(_685, _1269, _685);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1279);
    float _1295 = fma(_1285, _1285, _1289);
    float _1297 = -_1229;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1301 = fma(_1291, _1083, _1293);
    float _1303 = float(_1281);
    float _1305 = _137 + _515;
    float _1307 = float(_1011);
    float _1309 = fma(_1299, _1299, _1295);
    float _1311 = _1301 * 0.15915493667125701904296875;
    float _1313 = _1275;
    float _1315 = _1229;
    if (_1287)
    {
        _1313 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1317 = _1313;
    float _1319 = _1303 * _1307;
    float _1321 = _1305 + (-1.0);
    float _1323 = sqrt(_1309);
    int _1325 = as_type<int>(_1317);
    if (_1287)
    {
        float _1327 = _1317 * 5.0;
        _1325 = as_type<int>(_1327);
    }
    int _1329 = _1325;
    if (_1287)
    {
        out.m_40.x = 0.0;
    }
    float _1331 = _1319 * (-2.0);
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5353 = as_type<float>(_1329);
        out.gl_Position.z = _5353;
    }
    float _1333 = _1311 * 6.283185482025146484375;
    float _1335 = sin(_1333);
    float _1337 = _1267 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = _1267 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    if (_1287)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1345 = -_1051;
    float _1347 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = -_1071;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1355 = -_771;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1359 = _1347 * _1347;
    float _1361 = fma(_1331, _1161, _1161);
    float _1363 = _515 + (-0.5);
    float _1365 = fma(_1353, _1331, _1353);
    float _1367 = fma(_1351, _1351, _1359);
    float _1369 = _1311 * 6.283185482025146484375;
    float _1371 = cos(_1369);
    float _1373 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1361);
    float _1375 = fma(_1357, _1357, _1367);
    float _1377 = in.m_58.x;
    float _1379 = in.m_58.y;
    float _1381 = in.m_58.z;
    float _1383 = fma(_1365, _1083, _1373);
    float _1385 = _1335 * _1339;
    float _1387 = rsqrt(_1375);
    float _1389 = _1383 * 0.15915493667125701904296875;
    float _1391 = _1165 * _1323;
    float _1393 = _1389 * 6.283185482025146484375;
    float _1395 = sin(_1393);
    float _1397 = _1371 * _1343;
    float _1399 = _1351 * _1387;
    float _1401 = _1357 * _1387;
    float _1403 = _1347 * _1387;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1407 = _1399 * _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1411 = _1401 * _1409;
    float _1413 = _1389 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1419 = -_1407;
    float _1421 = fma(_1401, _1417, _1419);
    float _1423 = fma(_1395, _1397, _1385);
    float _1425 = fma(_1395, _1385, _1397);
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1429 = _1403 * _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1433 = -_1411;
    float _1435 = fma(_1403, _1431, _1433);
    float _1437 = _1421 * _1421;
    float _1439 = _471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1443 = -_1429;
    float _1445 = fma(_1399, _1441, _1443);
    float _1447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1379);
    float _1449 = fma(_1435, _1435, _1437);
    float _1451 = _469 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1453 = _1391 * _1439;
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1377);
    float _1457 = fma(_1445, _1445, _1449);
    float _1459 = _1391 * _1451;
    float _1461 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1463 = _1447 * _1453;
    float _1465 = rsqrt(_1457);
    float _1467 = _1371 * _1339;
    float _1469 = _1335 * _1343;
    float _1471 = _1455 * _1459;
    float _1473 = _1391 * _1461;
    float _1475 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1381);
    float _1477 = _1415 * _1463;
    float _1479 = -_1467;
    float _1481 = fma(_1395, _1469, _1479);
    float _1483 = -_1469;
    float _1485 = fma(_1395, _1467, _1483);
    float _1487 = -_1463;
    float _1489 = _1395 * _1487;
    float _1491 = _1343 * _1415;
    float _1493 = _1371 * _1477;
    float _1495 = _1475 * _1473;
    float _1497 = _1335 * _1477;
    float _1499 = fma(_1491, _1471, _1489);
    float _1501 = fma(_1423, _1471, _1493);
    float _1503 = _1421 * _1465;
    float _1505 = _1435 * _1465;
    float _1507 = _1445 * _1465;
    float _1509 = _1339 * _1415;
    float _1511 = _1401 * _1503;
    float _1513 = _1403 * _1505;
    float _1515 = fma(_1485, _1495, _1501);
    float _1517 = fma(_1481, _1471, _1497);
    float _1519 = -_1511;
    float _1521 = fma(_1403, _1507, _1519);
    float _1523 = -_1513;
    float _1525 = fma(_1399, _1503, _1523);
    float _1527 = fma(_1509, _1495, _1499);
    float _1529 = fma(_1425, _1495, _1517);
    float _1531 = _1521 * _1515;
    float _1533 = _1525 * _1515;
    float _1535 = fma(_1505, _1527, _1531);
    float _1537 = fma(_1507, _1527, _1533);
    float _1539 = fma(_1399, _1529, _1535);
    float _1541 = fma(_1401, _1529, _1537);
    float _1543 = _1399 * _1507;
    float _1545 = _1071 + _1539;
    float _1547 = _771 + _1541;
    float _1549 = -_1543;
    float _1551 = fma(_1401, _1505, _1549);
    float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1555 = _1545 + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1547 + _1557;
    float _1561 = _1551 * _1515;
    float _1563 = _1555 * _1555;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1503, _1527, _1561);
    float _1569 = _1563 + _1565;
    float _1571 = fma(_1403, _1529, _1567);
    float _1573 = sqrt(_1569);
    float _1575 = _1051 + _1571;
    bool _1577 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1579 = _1527;
    float _1581 = _1529;
    float _1583 = _1507;
    float _1585 = _1401;
    float _1587 = _1565;
    float _1589 = _1561;
    if (!_1577)
    {
        _1579 = _1563;
    }
    float _1591 = _1579;
    float _1593 = _1591;
    if (!_1577)
    {
        _1581 = _1545;
    }
    float _1595 = _1581;
    float _1597 = _1595;
    if (!_1577)
    {
        _1583 = _1547;
    }
    float _1599 = _1583;
    float _1601 = _1599;
    if (!_1577)
    {
        _1585 = _1575;
    }
    float _1603 = _1585;
    bool _1605 = !_1577;
    float _1607 = _1603;
    if (!_1605)
    {
        float _1609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1613 = _1573 + _1611;
        float _1615 = rsqrt(_1569);
        float _1617 = _1613 * _1609;
        float _1619 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1621 = _1617 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1621 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = fma(_1625, _1619, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1633 = _1615 * _1631;
        float _1635 = _1629 + (-1.0);
        float _1637 = fma(_1555, _1633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1639 = fma(_1559, _1633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1641 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1645 = _1637 + _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1649 = _1639 + _1647;
        float _1651 = fma(_1575, _1629, _1641);
        float _1653 = _1645 * _1645;
        float _1655 = _1649 * _1649;
        _1607 = _1651;
        _1593 = _1653;
        _1587 = _1655;
        _1597 = _1637;
        _1601 = _1639;
    }
    float _1657 = _1607;
    float _1659 = _1593;
    float _1661 = _1587;
    float _1663 = _1597;
    float _1665 = _1601;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1669 = _1657 + _1667;
    float _1671 = fma(_1669, _1669, _1659);
    float _1673 = _1671 + _1661;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1679 = isnan(_1675);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1685 = _1681 || _1683;
    if (!_1685)
    {
        _1589 = 1.0;
    }
    float _1687 = _1589;
    bool _1689 = !_1685;
    float _1691 = _1687;
    if (!_1689)
    {
        bool _1693 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1695 = isnan(_1675);
        bool _1697 = _1693 || _1695;
        bool _1699 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1701 = _1697 || _1699;
        if (!_1701)
        {
            float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1705 = _1675 + _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1709 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1707;
            float _1711 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1715 = 1.0 / _1709;
            float _1717 = _1705 * _1715;
            float _1719 = fma(_1717, _1713, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1691 = _1719;
            _1721 = true;
        }
        else
        {
            bool _1723 = _1675 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1725 = isnan(_1675);
            bool _1727 = _1723 || _1725;
            bool _1729 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1731 = _1727 || _1729;
            if (!_1731)
            {
                float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1735 = _1675 + _1733;
                float _1737 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1739 = _1737 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1741 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1743 = _1741 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1745 = 1.0 / _1739;
                float _1747 = _1735 * _1745;
                float _1749 = fma(_1747, _1743, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1691 = _1749;
                _1721 = true;
            }
            else
            {
                _1691 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1721 = false;
    float _1751 = _1691;
    float _1753 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1755 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1757 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1759 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1753);
    float _1761 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1755);
    float _1763 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1757);
    float _1765 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1759);
    float _1767 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1761);
    float _1769 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1763);
    float _1771 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1773 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1775 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1777 = 1.0 / _1771;
    float _1779 = _1773 + _1771;
    float _1781 = _1771 * 0.5;
    float _1783 = _1779 * 0.5;
    float _1785 = fma(_1775, -0.5, _1781);
    float _1787 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1783);
    float _1789 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1785);
    float _1791 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1785);
    float _1793 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1785);
    float _1795 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1783);
    float _1797 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1783);
    float _1799 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1783);
    float _1801 = _1787 * _1777;
    float _1803 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1785);
    float _1805 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1785);
    float _1807 = _1789 * _1777;
    float _1809 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1785);
    float _1811 = _1785 * _1777;
    float _1813 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1785);
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1817 = _1785 + _1815;
    float _1819 = _1785 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1821 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1785);
    float _1823 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1785);
    float _1825 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1785);
    float _1827 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1785);
    float _1829 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1785);
    float _1831 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1785);
    float _1833 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1785);
    float _1835 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1785);
    float _1837 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1785);
    float _1839 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1785);
    float _1841 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1785);
    float _1843 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1785);
    float _1845 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1785);
    float _1847 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1785);
    float _1849 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1785);
    float _1851 = _1791 * _1777;
    float _1853 = _1793 * _1777;
    float _1855 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1783);
    float _1857 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1783);
    float _1859 = _1795 * _1777;
    float _1861 = _1797 * _1777;
    float _1863 = _1799 * _1777;
    float _1865 = _1803 * _1777;
    float _1867 = _1805 * _1777;
    float _1869 = _1825 * _1777;
    float _1871 = _1831 * _1777;
    float2 _6262 = float2(_1801, _1851);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6262, float2(0.0), isnan(_6262)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6262, float2(0.0), isnan(_6262)), level(0.0)).x;
    float2 _6272 = float2(_1859, _1807);
    float _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6272, float2(0.0), isnan(_6272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6272, float2(0.0), isnan(_6272)), level(0.0)).x;
    float2 _6280 = float2(_1859, _1853);
    float _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6280, float2(0.0), isnan(_6280)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6280, float2(0.0), isnan(_6280)), level(0.0)).x;
    float2 _6288 = float2(_1861, _1865);
    float _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6288, float2(0.0), isnan(_6288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6288, float2(0.0), isnan(_6288)), level(0.0)).x;
    float2 _6296 = float2(_1863, _1869);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6296, float2(0.0), isnan(_6296)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6296, float2(0.0), isnan(_6296)), level(0.0)).x;
    float _1883 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1783);
    float _1885 = _1855 * _1777;
    float _1887 = _1857 * _1777;
    float _1889 = _1809 * _1777;
    float _1891 = _1817 * _1777;
    float _1893 = _1783 * _1777;
    float _1895 = _1819 * _1777;
    float _1897 = _1883 * _1777;
    float2 _6329 = float2(_1887, _1867);
    float _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6329, float2(0.0), isnan(_6329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6329, float2(0.0), isnan(_6329)), level(0.0)).x;
    float2 _6337 = float2(_1887, _1871);
    float _1901 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).x;
    float2 _6345 = float2(_1885, _1889);
    float _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6345, float2(0.0), isnan(_6345)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6345, float2(0.0), isnan(_6345)), level(0.0)).x;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1907 = _1783 + _1905;
    float _1909 = _1823 * _1777;
    float _1911 = _1827 * _1777;
    float _1913 = _1845 * _1777;
    float _1915 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1783);
    float _1917 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1783);
    float _1919 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1783);
    float _1921 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1783);
    float _1923 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1783);
    float _1925 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1783);
    float _1927 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1783);
    float _1929 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1783);
    float _1931 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1783);
    float _1933 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1783);
    float _1935 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1783);
    float _1937 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1783);
    float _1939 = _1829 * _1777;
    float2 _6419 = float2(_1893, _1889);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6419, float2(0.0), isnan(_6419)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6419, float2(0.0), isnan(_6419)), level(0.0)).x;
    float2 _6427 = float2(_1893, _1891);
    float _1943 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6427, float2(0.0), isnan(_6427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6427, float2(0.0), isnan(_6427)), level(0.0)).x;
    float2 _6435 = float2(_1893, _1895);
    float _1945 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6435, float2(0.0), isnan(_6435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6435, float2(0.0), isnan(_6435)), level(0.0)).x;
    float2 _6443 = float2(_1897, _1909);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6443, float2(0.0), isnan(_6443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6443, float2(0.0), isnan(_6443)), level(0.0)).x;
    float _1949 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1783);
    float _1951 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1953 = _1907 * _1777;
    float _1955 = _1813 * _1777;
    float _1957 = _1843 * _1777;
    float _1959 = _1821 * _1777;
    float2 _6471 = float2(_1893, _1909);
    float _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6471, float2(0.0), isnan(_6471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6471, float2(0.0), isnan(_6471)), level(0.0)).x;
    float2 _6479 = float2(_1893, _1911);
    float _1963 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6479, float2(0.0), isnan(_6479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6479, float2(0.0), isnan(_6479)), level(0.0)).x;
    float2 _6487 = float2(_1893, _1939);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6487, float2(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6487, float2(0.0), isnan(_6487)), level(0.0)).x;
    float2 _6495 = float2(_1893, _1811);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6495, float2(0.0), isnan(_6495)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6495, float2(0.0), isnan(_6495)), level(0.0)).x;
    float2 _6503 = float2(_1953, _1811);
    float _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6503, float2(0.0), isnan(_6503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6503, float2(0.0), isnan(_6503)), level(0.0)).x;
    float _1971 = _1915 * _1777;
    float _1973 = _1951 * _1777;
    float _1975 = _1917 * _1777;
    float _1977 = _1919 * _1777;
    float _1979 = _1921 * _1777;
    float2 _6526 = float2(_1971, _1955);
    float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).x;
    float2 _6534 = float2(_1971, _1959);
    float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).x;
    float2 _6542 = float2(_1971, _1811);
    float _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6542, float2(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6542, float2(0.0), isnan(_6542)), level(0.0)).x;
    float2 _6550 = float2(_1973, _1811);
    float _1987 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6550, float2(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6550, float2(0.0), isnan(_6550)), level(0.0)).x;
    float2 _6558 = float2(_1975, _1811);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6558, float2(0.0), isnan(_6558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6558, float2(0.0), isnan(_6558)), level(0.0)).x;
    float2 _6566 = float2(_1977, _1811);
    float _1991 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6566, float2(0.0), isnan(_6566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6566, float2(0.0), isnan(_6566)), level(0.0)).x;
    float2 _6574 = float2(_1979, _1811);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6574, float2(0.0), isnan(_6574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6574, float2(0.0), isnan(_6574)), level(0.0)).x;
    float _1995 = _1923 * _1777;
    float _1997 = _1925 * _1777;
    float _1999 = _1833 * _1777;
    float _2001 = _1927 * _1777;
    float _2003 = _1835 * _1777;
    float _2005 = _1929 * _1777;
    float _2007 = _1837 * _1777;
    float _2009 = _1841 * _1777;
    float _2011 = _1839 * _1777;
    float _2013 = _1933 * _1777;
    float _2015 = _1931 * _1777;
    float _2017 = _1935 * _1777;
    float2 _6618 = float2(_1995, _1999);
    float _2019 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6618, float2(0.0), isnan(_6618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6618, float2(0.0), isnan(_6618)), level(0.0)).x;
    float2 _6626 = float2(_1997, _2003);
    float _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6626, float2(0.0), isnan(_6626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6626, float2(0.0), isnan(_6626)), level(0.0)).x;
    float2 _6634 = float2(_2001, _2007);
    float _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6634, float2(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6634, float2(0.0), isnan(_6634)), level(0.0)).x;
    float2 _6642 = float2(_2005, _2011);
    float _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6642, float2(0.0), isnan(_6642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6642, float2(0.0), isnan(_6642)), level(0.0)).x;
    float2 _6650 = float2(_2015, _2009);
    float _2027 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6650, float2(0.0), isnan(_6650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6650, float2(0.0), isnan(_6650)), level(0.0)).x;
    float2 _6658 = float2(_2013, _1957);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6658, float2(0.0), isnan(_6658)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6658, float2(0.0), isnan(_6658)), level(0.0)).x;
    float2 _6666 = float2(_2017, _1913);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6666, float2(0.0), isnan(_6666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6666, float2(0.0), isnan(_6666)), level(0.0)).x;
    float _2033 = _1847 * _1777;
    float _2035 = _1849 * _1777;
    float _2037 = _1937 * _1777;
    float _2039 = _1949 * _1777;
    float2 _6686 = float2(_2037, _2033);
    float _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6686, float2(0.0), isnan(_6686)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6686, float2(0.0), isnan(_6686)), level(0.0)).x;
    float2 _6694 = float2(_2039, _2035);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6694, float2(0.0), isnan(_6694)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6694, float2(0.0), isnan(_6694)), level(0.0)).x;
    float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2047 = _1663 + _2045;
    float _2049 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2051 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2053 = _1665 + _2051;
    bool _2055 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(0.5);
    bool _2063 = _2059 || _2061;
    float _2065 = fma(_2047, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2069 = _1657 + _2067;
    float _2071 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2049);
    float _2073 = fma(_2053, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -_1217;
    float _2077 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2065);
    float _2079 = fma(_2069, _1751, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2081 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2071);
    float _2083 = -_1229;
    float _2085 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2073);
    float _2087 = -_1219;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2079);
    float _2091 = _2089;
    float _2093 = _2085;
    if (_2063)
    {
        _1315 = _2077;
    }
    float _2095 = _1315;
    float _2097 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2099 = _2095;
    if (!_2063)
    {
        float _2101 = _1239 * _1239;
        float _2103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _2105 = -_1071;
        float _2107 = _2105 + _2065;
        float _2109 = -_1051;
        float _2111 = _2109 + _2079;
        float _2113 = fma(_1253, _1253, _2101);
        float _2115 = -_771;
        float _2117 = _2115 + _2073;
        float _2119 = fma(_1263, _1263, _2113);
        float _2121 = 1.0 / _1391;
        float _2123 = sqrt(_2119);
        float _2125 = precise::max(_2123, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _2127 = _2125 * _2103;
        float _2129 = _2127 * _2121;
        float _2131 = fma(_2107, _2129, _1235);
        float _2133 = fma(_2111, _2129, _1225);
        float _2135 = fma(_2117, _2129, _1249);
        _2091 = _2133;
        _2099 = _2131;
        _2093 = _2135;
    }
    float _2137 = _2091;
    float _2139 = _2099;
    float _2141 = _2093;
    float _2143 = _2097 + _1771;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2149 = _2143 * _1777;
    float _2151 = _2149 * 0.5;
    float _2153 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2155 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2145);
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2159 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2157);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2163 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2161);
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2167 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2165);
    float _2169 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2147);
    float _2171 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2155);
    float _2173 = 1.0 / _2163;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2177 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2175);
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2181 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2153);
    float _2183 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2169);
    float _2185 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2179);
    float _2189 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2181);
    float _2191 = 1.0 / _2159;
    float _2193 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2201 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2199);
    float _2203 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2187);
    float _2205 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2207 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2209 = 1.0 / _2167;
    out.m_60.x = _1235;
    out.m_60.y = _1225;
    out.m_60.z = _1249;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2213 = _2173 * _2211;
    float _2215 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2197);
    float _2217 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2219 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2207);
    float _2221 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2225 = 1.0 / _2177;
    float _2227 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2229 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2221);
    float _2231 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2223);
    float _2233 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2215);
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2237 = -_2213;
    float _2239 = fma(_2191, _2235, _2237);
    float _2241 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2229);
    float _2243 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2231);
    float _2245 = 1.0 / _2201;
    float _2247 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2249 = -_2213;
    float _2251 = fma(_2209, _2247, _2249);
    bool _2253 = _2239 >= 0.0;
    bool _2255 = isnan(_2239);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2265 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2263);
    float _2267 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2241);
    float _2269 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2233);
    bool _2271 = _2251 >= 0.0;
    bool _2273 = isnan(_2251);
    bool _2275 = _2271 || _2273;
    bool _2277 = isnan(0.0);
    bool _2279 = _2275 || _2277;
    float _2281 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2243);
    float _2283 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2285 = -_2213;
    float _2287 = fma(_2225, _2283, _2285);
    float _2289 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2291 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2289);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2295 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2293);
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2299 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2297);
    out.gl_Position.x = _2267;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _2227;
    out.gl_Position.w = _2269;
    bool _2301 = _2287 >= 0.0;
    bool _2303 = isnan(_2287);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2315 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2313);
    bool _2317 = !_2279;
    float _2319 = _2317 ? 0.0 : 2.0;
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2323 = -_2213;
    float _2325 = fma(_2245, _2321, _2323);
    float _2327 = 1.0 / _2299;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2335 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2333);
    float _2337 = _2319 + _2311;
    bool _2339 = _2325 >= 0.0;
    bool _2341 = isnan(_2325);
    bool _2343 = _2339 || _2341;
    bool _2345 = isnan(0.0);
    bool _2347 = _2343 || _2345;
    float _2349 = float(_2347);
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2353 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2351);
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2357 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2355);
    float _2359 = _2227 + _2269;
    float _2361 = 1.0 / _2265;
    bool _2363 = !_2261;
    float _2365 = _2363 ? 0.0 : 2.0;
    float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2369 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2367);
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2373 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2371);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2377 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2375);
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2381 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2379);
    float _2383 = _2337 + _2365;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2387 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2385);
    float _2389 = 1.0 / _2315;
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2393 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2391);
    float _2395 = _2383 + _2349;
    float _2397 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2399 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2397);
    float _2401 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2403 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2401);
    float _2405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2407 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2405);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2411 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2409);
    float _2413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2415 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2413);
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2419 = -_2213;
    float _2421 = fma(_2361, _2417, _2419);
    float _2423 = 1.0 / _2353;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2427 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2425);
    float _2429 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2431 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2429);
    float _2433 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2435 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2433);
    bool _2437 = _2421 >= 0.0;
    bool _2439 = isnan(_2421);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan(0.0);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2451 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2449);
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2459 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2457);
    float _2461 = 1.0 / _2291;
    float _2463 = _2395 + _2447;
    float _2465 = _2359 * 0.5;
    float _2467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2469 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2467);
    float _2471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2473 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2471);
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2477 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2475);
    float _2479 = 1.0 / _2357;
    out.m_62.z = _2465;
    out.m_62.w = _2269;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2483 = -_2213;
    float _2485 = fma(_2461, _2481, _2483);
    float _2487 = 1.0 / _2377;
    bool _2489 = _2485 >= 0.0;
    bool _2491 = isnan(_2485);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan(0.0);
    bool _2497 = _2493 || _2495;
    float _2499 = 1.0 / _2295;
    bool _2501 = !_2497;
    float _2503 = _2501 ? 0.0 : 2.0;
    float _2505 = _2463 + _2503;
    float _2507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2509 = -_2213;
    float _2511 = fma(_2327, _2507, _2509);
    float _2513 = 1.0 / _2381;
    bool _2515 = _2511 >= 0.0;
    bool _2517 = isnan(_2511);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan(0.0);
    bool _2523 = _2519 || _2521;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2527 = -_2213;
    float _2529 = fma(_2389, _2525, _2527);
    float _2531 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2533 = -_2213;
    float _2535 = fma(_2499, _2531, _2533);
    float _2537 = 1.0 / _2411;
    bool _2539 = _2529 >= 0.0;
    bool _2541 = isnan(_2529);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan(0.0);
    bool _2547 = _2543 || _2545;
    bool _2549 = !_2523;
    float _2551 = _2549 ? 0.0 : 2.0;
    bool _2553 = _2535 >= 0.0;
    bool _2555 = isnan(_2535);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = float(_2561);
    float _2565 = 1.0 / _2331;
    float _2567 = _2505 + _2563;
    bool _2569 = !_2547;
    float _2571 = _2569 ? 0.0 : 2.0;
    float _2573 = _2567 + _2551;
    float _2575 = 1.0 / _2415;
    float _2577 = _2573 + _2571;
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2581 = -_2213;
    float _2583 = fma(_2565, _2579, _2581);
    float _2585 = 1.0 / _2427;
    bool _2587 = _2583 >= 0.0;
    bool _2589 = isnan(_2583);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = 1.0 / _2335;
    float _2601 = _2577 + _2597;
    float _2603 = 1.0 / _2431;
    float _2605 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2607 = -_2213;
    float _2609 = fma(_2599, _2605, _2607);
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2613 = -_2213;
    float _2615 = fma(_2423, _2611, _2613);
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2619 = -_2213;
    float _2621 = fma(_2479, _2617, _2619);
    float _2623 = 1.0 / _2469;
    bool _2625 = _2609 >= 0.0;
    bool _2627 = isnan(_2609);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan(0.0);
    bool _2633 = _2629 || _2631;
    bool _2635 = _2615 >= 0.0;
    bool _2637 = isnan(_2615);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(0.0);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    bool _2647 = !_2633;
    float _2649 = _2647 ? 0.0 : 2.0;
    float _2651 = 1.0 / _2369;
    float _2653 = _2601 + _2649;
    bool _2655 = _2621 >= 0.0;
    bool _2657 = isnan(_2621);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan(0.0);
    bool _2663 = _2659 || _2661;
    float _2665 = float(_2663);
    float _2667 = _2653 + _2645;
    float _2669 = 1.0 / _2373;
    float _2671 = _2667 + _2665;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2675 = -_2213;
    float _2677 = fma(_2651, _2673, _2675);
    float _2679 = 1.0 / _2459;
    bool _2681 = _2677 >= 0.0;
    bool _2683 = isnan(_2677);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.0);
    bool _2689 = _2685 || _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2693 = -_2213;
    float _2695 = fma(_2669, _2691, _2693);
    bool _2697 = !_2689;
    float _2699 = _2697 ? 0.0 : 2.0;
    float _2701 = 1.0 / _2435;
    bool _2703 = _2695 >= 0.0;
    bool _2705 = isnan(_2695);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.0);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = _2671 + _2699;
    float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2719 = -_2213;
    float _2721 = fma(_2487, _2717, _2719);
    float _2723 = 1.0 / _2387;
    float _2725 = _2715 + _2713;
    bool _2727 = _2721 >= 0.0;
    bool _2729 = isnan(_2721);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2739 = -_2213;
    float _2741 = fma(_2513, _2737, _2739);
    bool _2743 = _2741 >= 0.0;
    bool _2745 = isnan(_2741);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan(0.0);
    bool _2751 = _2747 || _2749;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2755 = -_2213;
    float _2757 = fma(_2701, _2753, _2755);
    bool _2759 = !_2735;
    float _2761 = _2759 ? 0.0 : 2.0;
    float _2763 = 1.0 / _2473;
    bool _2765 = !_2751;
    float _2767 = _2765 ? 0.0 : 2.0;
    float _2769 = _2725 + _2761;
    float _2771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2773 = -_2213;
    float _2775 = fma(_2723, _2771, _2773);
    float _2777 = _2769 + _2767;
    float _2779 = 1.0 / _2477;
    bool _2781 = _2775 >= 0.0;
    bool _2783 = isnan(_2775);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan(0.0);
    bool _2789 = _2785 || _2787;
    float _2791 = float(_2789);
    float _2793 = _2777 + _2791;
    float _2795 = 1.0 / _2393;
    float _2797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2799 = -_2213;
    float _2801 = fma(_2795, _2797, _2799);
    float _2803 = 1.0 / _2399;
    bool _2805 = _2801 >= 0.0;
    bool _2807 = isnan(_2801);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(0.0);
    bool _2813 = _2809 || _2811;
    bool _2815 = !_2813;
    float _2817 = _2815 ? 0.0 : 2.0;
    float _2819 = _2793 + _2817;
    float _2821 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2823 = -_2213;
    float _2825 = fma(_2803, _2821, _2823);
    bool _2827 = _2825 >= 0.0;
    bool _2829 = isnan(_2825);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan(0.0);
    bool _2835 = _2831 || _2833;
    float _2837 = float(_2835);
    float _2839 = 1.0 / _2403;
    float _2841 = _2819 + _2837;
    float _2843 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2845 = -_2213;
    float _2847 = fma(_2839, _2843, _2845);
    float _2849 = 1.0 / _2407;
    bool _2851 = _2847 >= 0.0;
    bool _2853 = isnan(_2847);
    bool _2855 = _2851 || _2853;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    float _2861 = float(_2859);
    float _2863 = _2841 + _2861;
    float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2867 = -_2213;
    float _2869 = fma(_2849, _2865, _2867);
    float _2871 = 1.0 / _2451;
    bool _2873 = _2869 >= 0.0;
    bool _2875 = isnan(_2869);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(0.0);
    bool _2881 = _2877 || _2879;
    bool _2883 = !_2881;
    float _2885 = _2883 ? 0.0 : 2.0;
    float _2887 = _2863 + _2885;
    float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2891 = -_2213;
    float _2893 = fma(_2537, _2889, _2891);
    float _2895 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2897 = -_2213;
    float _2899 = fma(_2871, _2895, _2897);
    bool _2901 = _2893 >= 0.0;
    bool _2903 = isnan(_2893);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan(0.0);
    bool _2909 = _2905 || _2907;
    float _2911 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2913 = -_2213;
    float _2915 = fma(_2575, _2911, _2913);
    bool _2917 = _2899 >= 0.0;
    bool _2919 = isnan(_2899);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan(0.0);
    bool _2925 = _2921 || _2923;
    float _2927 = float(_2925);
    bool _2929 = _2915 >= 0.0;
    bool _2931 = isnan(_2915);
    bool _2933 = _2929 || _2931;
    bool _2935 = isnan(0.0);
    bool _2937 = _2933 || _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2941 = -_2213;
    float _2943 = fma(_2585, _2939, _2941);
    float _2945 = _2887 + _2927;
    bool _2947 = _2943 >= 0.0;
    bool _2949 = isnan(_2943);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    float _2957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2959 = -_2213;
    float _2961 = fma(_2603, _2957, _2959);
    bool _2963 = !_2955;
    float _2965 = _2963 ? 0.0 : 3.0;
    bool _2967 = _2961 >= 0.0;
    bool _2969 = isnan(_2961);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    bool _2977 = !_2937;
    float _2979 = _2977 ? 0.0 : 3.0;
    bool _2981 = _2757 >= 0.0;
    bool _2983 = isnan(_2757);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.0);
    bool _2989 = _2985 || _2987;
    float _2991 = 1.0 / _2455;
    float _2993 = _2979 + _2965;
    bool _2995 = !_2909;
    float _2997 = _2995 ? 0.0 : 2.0;
    bool _2999 = !_2975;
    float _3001 = _2999 ? 0.0 : 3.0;
    bool _3003 = !_2989;
    float _3005 = _3003 ? 0.0 : 3.0;
    float _3007 = _2945 + _2997;
    float _3009 = _2993 + _3001;
    float _3011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3013 = -_2213;
    float _3015 = fma(_2623, _3011, _3013);
    float _3017 = _3007 * 0.02857142873108386993408203125;
    float _3019 = precise::clamp(_3017, 0.0, 1.0);
    float _3021 = _3009 + _3005;
    bool _3023 = _3015 >= 0.0;
    bool _3025 = isnan(_3015);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan(0.0);
    bool _3031 = _3027 || _3029;
    float _3033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3035 = -_2213;
    float _3037 = fma(_2991, _3033, _3035);
    float _3039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3041 = -_2213;
    float _3043 = fma(_2679, _3039, _3041);
    float _3045 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3047 = -_2213;
    float _3049 = fma(_2779, _3045, _3047);
    bool _3051 = _3037 >= 0.0;
    bool _3053 = isnan(_3037);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    bool _3061 = !_3059;
    float _3063 = _3061 ? 0.0 : 3.0;
    bool _3065 = _3043 >= 0.0;
    bool _3067 = isnan(_3043);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan(0.0);
    bool _3073 = _3069 || _3071;
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3077 = -_2213;
    float _3079 = fma(_2763, _3075, _3077);
    float _3081 = _3021 + _3063;
    bool _3083 = !_3073;
    float _3085 = _3083 ? 0.0 : 3.0;
    bool _3087 = _3079 >= 0.0;
    bool _3089 = isnan(_3079);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan(0.0);
    bool _3095 = _3091 || _3093;
    bool _3097 = !_3031;
    float _3099 = _3097 ? 0.0 : 3.0;
    float _3101 = _3081 + _3085;
    bool _3103 = _3049 >= 0.0;
    bool _3105 = isnan(_3049);
    bool _3107 = _3103 || _3105;
    bool _3109 = isnan(0.0);
    bool _3111 = _3107 || _3109;
    float _3113 = _3101 + _3099;
    bool _3115 = !_3095;
    float _3117 = _3115 ? 0.0 : 3.0;
    bool _3119 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3121 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3123 = _3119 || _3121;
    bool _3125 = isnan(0.5);
    bool _3127 = _3123 || _3125;
    bool _3129 = !_3111;
    float _3131 = _3129 ? 0.0 : 5.0;
    float _3133 = _3113 + _3117;
    float _3135 = _3133 + _3131;
    float _3137 = _3135 * 0.14285714924335479736328125;
    float _3139 = precise::clamp(_3137, 0.0, 1.0);
    float _3141 = _3019 * _3139;
    float _3143 = _3019;
    float _3145 = _3139;
    if (_3127)
    {
        _3143 = 1.0;
    }
    float _3147 = _3143;
    float _3149 = _3147;
    if (_3127)
    {
        _3145 = 1.0;
    }
    float _3151 = _3145;
    float _3153 = _3151;
    if (!_3127)
    {
        float _3155 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3159 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3157;
        float _3161 = _3155 * 0.15915493667125701904296875;
        float _3163 = _3161 * 6.283185482025146484375;
        float _3165 = cos(_3163);
        float _3167 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3169 = _3167 * 0.15915493667125701904296875;
        float _3171 = _3161 * 6.283185482025146484375;
        float _3173 = sin(_3171);
        float _3175 = 1.0 / _3165;
        float _3177 = _3169 * 6.283185482025146484375;
        float _3179 = cos(_3177);
        float _3181 = _3173 * _3175;
        float _3183 = _3169 * 6.283185482025146484375;
        float _3185 = sin(_3183);
        float _3187 = _3179 * _3181;
        float _3189 = 1.0 / _3159;
        float _3191 = 1.0 / _3187;
        float _3193 = _3185 * _3191;
        float _3195 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3197 = fma(_2213, _3193, _3195);
        float _3199 = _3197 * _3189;
        float _3201 = precise::clamp(_3199, 0.0, 1.0);
        _3153 = _3201;
    }
    float _3203 = _3153;
    if (!_3127)
    {
        float _3205 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3207 = _3205 * 0.15915493667125701904296875;
        float _3209 = _3207 * 6.283185482025146484375;
        float _3211 = cos(_3209);
        float _3213 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3215 = _3213 * 0.15915493667125701904296875;
        float _3217 = _3207 * 6.283185482025146484375;
        float _3219 = sin(_3217);
        float _3221 = 1.0 / _3211;
        float _3223 = _3215 * 6.283185482025146484375;
        float _3225 = cos(_3223);
        float _3227 = _3219 * _3221;
        float _3229 = _3215 * 6.283185482025146484375;
        float _3231 = sin(_3229);
        float _3233 = _3225 * _3227;
        float _3235 = 1.0 / _3233;
        float _3237 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3239 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3237;
        float _3241 = 1.0 / _3239;
        float _3243 = _3231 * _3235;
        float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3247 = fma(_2213, _3243, _3245);
        float _3249 = _3247 * _3241;
        float _3251 = precise::clamp(_3249, 0.0, 1.0);
        float _3253 = -_3251;
        float _3255 = _3253 + 1.0;
        _3149 = _3255;
    }
    float _3257 = _3149;
    float _3259 = _3141 * _3203;
    bool _3261 = _3203 > 0.0;
    bool _3263 = isnan(_3203);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(0.0);
    bool _3269 = _3265 || _3267;
    float _3271 = _3259 * _3257;
    bool _3273 = _3257 <= 0.0;
    bool _3275 = !_3269;
    bool _3277 = _3273 || _3275;
    float _3279 = _3271 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3281 = _349 * _3279;
    float _3283 = _3281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = _3283;
    if (!_3277)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_40.x = 0.0;
    float _3285 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3285;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

