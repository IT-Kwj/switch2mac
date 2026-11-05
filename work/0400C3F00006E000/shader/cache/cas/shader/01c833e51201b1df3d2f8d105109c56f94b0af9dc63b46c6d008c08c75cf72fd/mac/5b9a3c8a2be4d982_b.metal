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
    float4 m_68 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1892 = false;
    bool _1239 = false;
    bool _419 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_48.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (!_105)
    {
        out.m_51.x = 0.0;
    }
    int _111 = 0;
    if (!_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2176 = as_type<float>(_115);
        out.gl_Position.z = _2176;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_53.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_101);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    float _149 = 0.0;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_155);
        out.gl_Position.z = _2245;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _159 = !_157;
    float _177;
    if (!_159)
    {
        float _161 = in.m_55.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_101);
        float _183 = 1.0 / _181;
        float _185 = _133 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _187 + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _187 + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _199 = _187 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _217 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _219 = isnan(_187);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = 1.0 / _203;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = 1.0 / _207;
    float _235 = 1.0 / _211;
    float _237 = _195 * _229;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _187 + _239;
    float _243 = 1.0 / _215;
    float _245 = _191 * _233;
    bool _247 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _249 = isnan(_187);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    bool _259 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_187);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = _199 * _235;
    float _273 = -_227;
    float _275 = _273 + 1.0;
    float _277 = -_257;
    float _279 = _277 + 1.0;
    float _281 = _257 * _275;
    bool _283 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_187);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = _269 * _279;
    float _297 = _241 * _243;
    float _299 = -_269;
    float _301 = _299 + 1.0;
    bool _303 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_187);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _293 * _301;
    float _333 = -_293;
    float _335 = _333 + 1.0;
    float _337 = fma(_325, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = fma(_317, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = -_313;
    float _343 = _341 + 1.0;
    float _345 = _313 * _335;
    float _347 = fma(_329, _245, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_321, _245, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = _337 * _345;
    float _357 = _339 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _359;
    float _363 = fma(_351, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _373 = fma(_361, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_347, _331, _365);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _381 = fma(_353, _331, _367);
    float _383 = fma(_371, _297, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _385 = fma(_363, _295, _375);
    float _387 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _389 = fma(_373, _295, _381);
    float _391 = fma(_383, _281, _385);
    float _393 = fma(_387, _281, _389);
    float _395 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[147].x, _391);
    float _397 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[147].y, _393);
    bool _399 = !_231;
    float _417;
    if (!_399)
    {
        float _401 = in.m_55.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_101);
        float _423 = 1.0 / _421;
        float _425 = _133 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = in.m_55.z;
    float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _433 = log2(_431);
    float _435 = in.m_55.x;
    float _437 = in.m_55.y;
    bool _439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _451 = 1.0 + _449;
    float _453 = as_type<float>(int(gl_VertexIndex));
    bool _455 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(1.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = 1.0 / _451;
    float _467 = _433 * _133;
    float _469 = exp2(_467);
    float _471 = _429 * 2.0;
    float _473 = _435 * 2.0;
    float _475 = _437 * 2.0;
    float _477 = floor(_471);
    float _479 = floor(_473);
    float _481 = -_469;
    float _483 = _481 + 1.0;
    bool _485 = _477 > 0.0;
    float _487 = floor(_475);
    bool _489 = _477 >= 0.0;
    bool _491 = isnan(_477);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = _497 ? 0 : 1;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _511 = _509 != 0;
    float _513 = _447 ? _483 : 0.0;
    float _515 = in.m_60.x;
    float _517 = in.m_60.y;
    bool _519 = _479 > 0.0;
    if (_463)
    {
        float _521 = _513 * _465;
        _137 = _521;
    }
    float _523 = _137;
    bool _525 = !_503;
    int _527 = _525 ? 0 : 1;
    bool _529 = _479 >= 0.0;
    bool _531 = isnan(_479);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    int _539 = ~_499;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = _543;
    if (!_485)
    {
        int _547 = ~_499;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = in.m_62.x;
    float _555 = in.m_62.y;
    float _557 = in.m_62.z;
    int _559 = abs(_527);
    int _561 = as_type<int>(_453) & 1;
    bool _563 = _561 != 0;
    int _565 = as_type<int>(_453) & 2;
    bool _567 = _565 != 0;
    int _569 = _537 ? 0 : 1;
    bool _571 = _487 > 0.0;
    bool _573 = _487 >= 0.0;
    bool _575 = isnan(_487);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = _437 + _435;
    int _585 = ~_569;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    float _591 = _395 * _515;
    int _593 = _589;
    if (!_519)
    {
        int _595 = ~_569;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    float _601 = _583 + (-1.0);
    float _603 = float(_559);
    float _605 = _397 * _517;
    float _607 = float(_551);
    float _609 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _611 = _605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _613 = _581 ? 0 : 1;
    float _615 = _603 * _607;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _619 = _617 != 0;
    float _621 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _623 = !_511;
    int _625 = _623 ? 0 : 1;
    float _627 = _615 * (-2.0);
    bool _629 = !_507;
    int _631 = _629 ? 0 : 1;
    int _633 = ~_613;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = fma(_621, _627, _621);
    int _641 = _637;
    if (!_571)
    {
        int _643 = ~_613;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = _437 + _429;
    int _651 = abs(_631);
    float _653 = fma(_627, _553, _553);
    int _655 = abs(_625);
    float _657 = _435 + (-0.5);
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _661 = _659 != 0;
    float _663 = _649 + (-1.0);
    float _665 = float(_651);
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _653);
    float _669 = float(_655);
    float _671 = float(_599);
    float _673 = fma(_639, _523, _667);
    float _675 = float(_647);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _679 = _665 * _671;
    bool _681 = _435 > 0.5;
    float _683 = _669 * _675;
    bool _685 = _437 > 0.5;
    float _687 = _429 + _435;
    float _689 = _437 + (-0.5);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = in.m_48.x;
    float _697 = in.m_48.y;
    float _699 = in.m_48.z;
    float _701 = _679 * (-2.0);
    float _703 = _687 + (-1.0);
    float _705 = _683 * (-2.0);
    float _707 = 1.0 / _693;
    float _709 = fma(_701, _555, _555);
    float _711 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _713 = fma(_705, _557, _557);
    float _715 = _429 + (-0.5);
    float _717 = fma(_677, _701, _677);
    float _719 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _709);
    float _721 = fma(_711, _705, _711);
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].z, _713);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _725;
    float _729 = fma(_717, _523, _719);
    float _731 = _673 * 0.15915493667125701904296875;
    float _733 = fma(_721, _523, _723);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _737 = _427 + _735;
    float _739 = _729 * 0.15915493667125701904296875;
    bool _741 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _743 = isnan(_427);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _733 * 0.15915493667125701904296875;
    float _755 = _727 * _707;
    float _757 = _731 * 6.283185482025146484375;
    float _759 = sin(_757);
    bool _761 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _763 = isnan(_427);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _697 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _775 = _697 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _777 = fma(_755, _737, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _779 = _697 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _781 = -_751;
    float _783 = _781 + 1.0;
    float _785 = _739 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[4].x, _773);
    float _791 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[6].x, _779);
    float _793 = _771 * _783;
    float _795 = -_771;
    float _797 = _795 + 1.0;
    bool _799 = !_567;
    float _801 = _799 ? (-0.5) : 0.5;
    float _803 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[5].x, _775);
    bool _805 = !_563;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _739 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = _777 * _793;
    float _815 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[4].z, _789);
    float _817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _801);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _821 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[5].z, _803);
    float _823 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[115].x, _813);
    float _825 = _611 * _817;
    float _827 = _753 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _609 * _819;
    float _833 = _759 * _787;
    float _835 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[6].z, _791);
    float _837 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[116].x, _823);
    float _839 = _731 * 6.283185482025146484375;
    float _841 = cos(_839);
    float _843 = _753 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _759 * _811;
    float _849 = _759 * _829;
    float _851 = _811 * _829;
    float _853 = _787 * _829;
    float _855 = _841 * _811;
    float _857 = _841 * _829;
    float _859 = _841 * _787;
    float _861 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _863 = _849 * _825;
    float _865 = _857 * _825;
    float _867 = fma(_845, _855, _833);
    float _869 = fma(_845, _833, _855);
    float _871 = -_859;
    float _873 = fma(_845, _847, _871);
    float _875 = -_847;
    float _877 = fma(_845, _859, _875);
    float _879 = -_825;
    float _881 = _845 * _879;
    float _883 = fma(_867, _831, _865);
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = fma(_851, _831, _881);
    float _889 = fma(_877, _861, _883);
    float _891 = fma(_873, _831, _863);
    float _893 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _895 = fma(_853, _861, _887);
    float _897 = _889 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _899 = _889 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _901 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _903 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _905 = fma(_869, _861, _891);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].x, _897);
    float _909 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].x, _899);
    float _911 = -_845;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _893);
    float _915 = -_845;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _901);
    float _919 = -_845;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].x, _903);
    float _923 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _907);
    float _925 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _909);
    float _927 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _931 = _923 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _913);
    float _937 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _917);
    float _939 = _929 + _931;
    float _941 = _927 + _933;
    float _943 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _921);
    float _945 = -_801;
    int _947 = _685 ? as_type<int>(_945) : as_type<int>(_801);
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _951 = _939 + _949;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _955 = _941 + _953;
    float _957 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _961 = _951 * _951;
    float _963 = _955 * _955;
    float _965 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _967 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _969 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _959);
    float _971 = _961 + _963;
    float _973 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _965);
    bool _975 = !_661;
    float _977 = _975 ? _801 : as_type<float>(_947);
    float _979 = _801 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _981 = sqrt(_971);
    float _983 = _889 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _985 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _987 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _989 = _979 * _937;
    float _991 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].x, _983);
    float _993 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _995 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[25].x, _985);
    float _997 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[26].x, _987);
    float _999 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].z, _973);
    float _1001 = _979 * _935;
    float _1003 = _979 * _943;
    float _1005 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _991);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1009 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].z, _967);
    float _1011 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].z, _969);
    bool _1013 = _981 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1015 = _821 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1017 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1019 = -_807;
    float _1021 = _681 ? _1019 : _807;
    float _1023 = _807 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1027 = _1015 + _1017;
    bool _1029 = !_619;
    float _1031 = _1029 ? _807 : _1021;
    float _1033 = fma(_1023, _1009, _1001);
    float _1035 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _993);
    float _1037 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _995);
    float _1039 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _997);
    float _1041 = _1009;
    float _1043 = _1021;
    float _1045 = _963;
    float _1047 = _961;
    float _1049 = _941;
    if (!_1013)
    {
        _1041 = _963;
    }
    float _1051 = _1041;
    float _1053 = _1051;
    if (!_1013)
    {
        _1043 = _939;
    }
    float _1055 = _1043;
    float _1057 = _1055;
    if (!_1013)
    {
        _1045 = _1027;
    }
    float _1059 = _1045;
    bool _1061 = !_1013;
    float _1063 = _1059;
    if (!_1061)
    {
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1069 = _981 + _1067;
        float _1071 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = rsqrt(_971);
        float _1075 = _1069 * _1065;
        float _1077 = _1075 * 0.15915493667125701904296875;
        float _1079 = _1077 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = fma(_1081, _1071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1089 = _1073 * _1087;
        float _1091 = fma(_951, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1093 = _1085 + (-1.0);
        float _1095 = fma(_955, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1099 = _1091 + _1097;
        float _1101 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1105 = _1095 + _1103;
        float _1107 = _1099 * _1099;
        float _1109 = fma(_1027, _1085, _1101);
        float _1111 = _1105 * _1105;
        _1063 = _1109;
        _1047 = _1107;
        _1053 = _1111;
        _1057 = _1091;
        _1049 = _1095;
    }
    float _1113 = _1063;
    float _1115 = _1047;
    float _1117 = _1053;
    float _1119 = _1057;
    float _1121 = _1049;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1125 = _1113 + _1123;
    float _1127 = -_977;
    float _1129 = _1127 + 0.5;
    float _1131 = _1031 + 0.5;
    float _1133 = fma(_1023, _999, _1003);
    float _1135 = fma(_1125, _1125, _1115);
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = _1135 + _1117;
    float _1143 = _1137 * _1025;
    float _1145 = _1139 * _1007;
    float _1147 = fma(_1023, _1011, _989);
    float _1149 = sqrt(_1141);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1163 = _1035 + _1033;
    float _1165 = _1037 + _1147;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _837 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1183 = _1039 + _1133;
    out.m_64.x = _1145;
    out.m_64.y = _1143;
    bool _1185 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1187 = isnan(_1149);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1193 = _1189 || _1191;
    out.m_66.x = _1173;
    out.m_66.y = _1175;
    out.m_66.z = _1177;
    out.m_66.w = _1167;
    out.m_68.x = _1169;
    out.m_68.y = _1171;
    out.m_68.z = _1179;
    out.m_68.w = _1181;
    out.m_70.x = _1163;
    out.m_70.y = _1165;
    out.m_70.z = _1183;
    float _1195 = _1133;
    float _1197 = _1167;
    float _1199 = _1179;
    float _1201 = _1169;
    float _1203 = _1131;
    if (!_1193)
    {
        _1195 = 1.0;
    }
    float _1205 = _1195;
    bool _1207 = !_1193;
    float _1209 = _1205;
    if (!_1207)
    {
        bool _1211 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1213 = isnan(_1149);
        bool _1215 = _1211 || _1213;
        bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1219 = _1215 || _1217;
        if (!_1219)
        {
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = _1149 + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1227 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1225;
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1233 = 1.0 / _1227;
            float _1235 = _1223 * _1233;
            float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1209 = _1237;
            _1239 = true;
        }
        else
        {
            bool _1241 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1243 = isnan(_1149);
            bool _1245 = _1241 || _1243;
            bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1249 = _1245 || _1247;
            if (!_1249)
            {
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1149 + _1251;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1263 = 1.0 / _1257;
                float _1265 = _1253 * _1263;
                float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1209 = _1267;
                _1239 = true;
            }
            else
            {
                _1209 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1239 = false;
    float _1269 = _1209;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1273 = _1113 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1277 = _1119 + _1275;
    float _1279 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1283 = _1121 + _1281;
    float _1285 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1279 + _1287;
    float _1291 = fma(_1283, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1295 = _1285 + _1293;
    float _1297 = _1289 * _1289;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1291 + _1299;
    float _1303 = fma(_1295, _1295, _1297);
    float _1305 = fma(_1301, _1301, _1303);
    float _1307 = rsqrt(_1305);
    float _1309 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1311 = _1295 * _1309;
    float _1313 = _1301 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 * _1313;
    float _1319 = _1315 + _1317;
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1321 + _1325;
    float _1329 = _1301;
    float _1331 = _1327;
    float _1333 = _1289;
    if (_1323)
    {
        float _1335 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1335;
    }
    float _1337 = _1329;
    if (_1323)
    {
        float _1339 = rsqrt(_1319);
        _1197 = _1339;
    }
    float _1341 = _1197;
    float _1343 = _1341;
    if (_1323)
    {
        float _1345 = _1327 * _1337;
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (_1323)
    {
        float _1349 = _1347 * 0.15915493667125701904296875;
        _1199 = _1349;
    }
    float _1351 = _1199;
    float _1353 = _1297;
    if (_1323)
    {
        float _1355 = _1351 * 6.283185482025146484375;
        float _1357 = sin(_1355);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1363 = precise::max(0.0, _1361);
    float _1365 = _1307;
    float _1367 = _1361;
    float _1369 = _1363;
    if (_1323)
    {
        float _1371 = _1351 * 6.283185482025146484375;
        float _1373 = cos(_1371);
        _1365 = _1373;
    }
    float _1375 = _1365;
    float _1377 = -_1309;
    float _1379 = -_1363;
    float _1381 = fma(_1289, _1377, _1379);
    if (_1323)
    {
        float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1367 = _1383;
    }
    float _1385 = _1367;
    float _1387 = _1359;
    if (_1323)
    {
        float _1389 = fma(_1359, _1385, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1201 = _1389;
    }
    float _1391 = _1201;
    float _1393 = _1391;
    if (!_1323)
    {
        _1387 = _1381;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    float _1399 = _1375;
    if (_1323)
    {
        float _1401 = _1375 + (-1.0);
        _1333 = _1401;
    }
    float _1403 = _1333;
    float _1405 = _1403;
    if (_1323)
    {
        float _1407 = _1341 * _1391;
        _1203 = _1407;
    }
    float _1409 = _1203;
    if (!_1323)
    {
        _1343 = _1311;
    }
    float _1411 = _1343;
    float _1413 = _1411;
    if (_1323)
    {
        float _1415 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1415;
    }
    float _1417 = _1369;
    if (_1323)
    {
        float _1419 = _1311 * _1409;
        _1413 = _1419;
    }
    float _1421 = _1413;
    if (!_1323)
    {
        _1405 = _1313;
    }
    float _1423 = _1405;
    float _1425 = _1423;
    if (_1323)
    {
        float _1427 = _1313 * _1409;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1323)
    {
        float _1431 = fma(_1381, _1375, _1417);
        _1397 = _1431;
    }
    float _1433 = _1397;
    if (!_1323)
    {
        _1399 = _1315;
    }
    float _1435 = _1399;
    float _1437 = sqrt(_1305);
    float _1439 = _1435;
    if (_1323)
    {
        float _1441 = _1421 * _1421;
        _1439 = _1441;
    }
    float _1443 = _1439;
    if (!_1323)
    {
        _1393 = _1317;
    }
    float _1445 = _1393;
    float _1447 = _1445;
    if (_1323)
    {
        float _1449 = _1429 * _1429;
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = fma(_1433, _1433, _1443);
    float _1455 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1457 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1459 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1461 = _1453 + _1451;
    float _1463 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1455);
    float _1465 = fma(_927, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1467 = rsqrt(_1461);
    float _1469 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1473 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1471);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1479 = -_1475;
    float _1481 = _1479 + 1.0;
    float _1483 = floor(_1457);
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1487 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1491 = -_1487;
    float _1493 = fma(_1491, _1485, 1.0);
    float _1495 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1497 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1499 = _1467 * _1433;
    float _1501 = _1467 * _1421;
    float _1503 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1505 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1497);
    float _1507 = abs(_1481);
    float _1509 = log2(_1507);
    float _1511 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1513 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1515 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1517 = _1467 * _1429;
    float _1519 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1459);
    float _1521 = -_1511;
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1521);
    float _1525 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1529 = floor(_1465);
    float _1531 = -_1517;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1523);
    float _1535 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1519);
    float _1537 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1527);
    float _1539 = -_1483;
    float _1541 = _1457 + _1539;
    float _1543 = fma(_1533, -0.5, 0.5);
    float _1545 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1537);
    float _1547 = log2(_1493);
    float _1549 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1551 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = exp2(_1549);
    float _1555 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1557 = fma(_1533, 0.5, 0.5);
    float _1559 = -_1529;
    float _1561 = _1465 + _1559;
    float _1563 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1545);
    float _1565 = fma(_1557, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1567 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1569 = sqrt(_1543);
    float _1571 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1573 = _1499 + 1.0;
    float _1575 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1577 = fma(_1557, _1565, -0.212114393711090087890625);
    float _1579 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1571);
    float _1581 = 1.0 / _1563;
    float _1583 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1585 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
    float _1587 = -_1499;
    float _1589 = fma(_1553, _1573, _1587);
    float _1591 = _1547 * 0.693147182464599609375;
    float _1593 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1583);
    float2 _4596 = float2(_1541, _1561);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4596, float2(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4596, float2(0.0), isnan(_4596)), level(0.0)).x;
    float _1597 = fma(_1557, _1577, 1.570728778839111328125);
    float _1599 = _1569 * 0.636619746685028076171875;
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1603 = fma(_1589, 0.5, 0.5);
    float _1605 = -_1597;
    float _1607 = fma(_1599, _1605, 1.0);
    float _1609 = _1585 * _1581;
    float _1611 = _1593 * _1581;
    float _1613 = fma(_1609, 0.5, 0.5);
    float _1615 = fma(_1611, -0.5, 0.5);
    float3 _4635 = float3(_1613, _1615, _1601);
    float _1617 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4635, float3(0.0), isnan(_4635)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4635, float3(0.0), isnan(_4635)), level(0.0)).x;
    float3 _4646 = float3(_1613, _1615, _1601);
    float4 _1620 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4646, float3(0.0), isnan(_4646)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4646, float3(0.0), isnan(_4646)), level(0.0)).xyzw;
    float _1622 = _1620.x;
    float _1624 = _1620.y;
    float _1626 = _1620.z;
    float _1628 = _1620.w;
    float2 _4662 = float2(_1607, _1603);
    float3 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4662, float2(0.0), isnan(_4662)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4662, float2(0.0), isnan(_4662)), level(0.0)).xyz;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1642 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1644 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1646 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1648 = isnan(_1437);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1654 = _1650 || _1652;
    float _1656 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1640);
    float _1658 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1660 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1642);
    float _1662 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1656);
    float _1664 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1658);
    float _1666 = exp2(_1644);
    float _1668 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1660);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1672 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1664);
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1676 = 1.0 / _1670;
    float _1678 = _1674 + _1670;
    float _1680 = -_1666;
    float _1682 = _1680 + 1.0;
    float _1684 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1686 = _1678 * _1676;
    float _1688 = _1686 * 0.5;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1692 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1690);
    float _1694 = 1.0 / _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1698 = _1694 * _1696;
    float _1700 = abs(_1698);
    float _1702 = log2(_1700);
    bool _1704 = _1698 <= 8000.0;
    bool _1706 = isnan(_1698);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(8000.0);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1718 = exp2(_1716);
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1722 = precise::clamp(_1720, 0.0, 1.0);
    float _1724 = fma(_1722, -2.0, 3.0);
    float _1726 = _1722 * _1722;
    float _1728 = _1726 * _1724;
    float _1730 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1668);
    float _1732 = in.m_72.x;
    float _1734 = -_1728;
    float _1736 = _1734 + 1.0;
    float _1738 = _1730 + _1563;
    float _1740 = fma(_1736, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1728);
    float _1742 = _1738 * 0.5;
    float _1744 = _1738;
    float _1746 = _1563;
    float _1748 = _1730;
    float _1750 = _1593;
    if (!_1654)
    {
        _1744 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1752 = _1744;
    float _1754 = _1714 * _1740;
    out.gl_Position.x = _1585;
    out.gl_Position.y = _1593;
    out.gl_Position.z = _1730;
    out.gl_Position.w = _1563;
    float _1756 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_74.z = _1742;
    out.m_74.w = _1563;
    float _1758 = -_1684;
    float _1760 = _1758 + 1.0;
    float _1762 = _1760;
    float _1764 = _1752;
    float _1766 = _1752;
    if (!_1654)
    {
        _1746 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1768 = _1746;
    float _1770 = _1768;
    float _1772 = _1768;
    if (!_1654)
    {
        _1748 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1774 = _1748;
    float _1776 = _1774;
    float _1778 = _1774;
    if (!_1654)
    {
        _1750 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1780 = _1750;
    float _1782 = -_1595;
    float _1784 = _1782 + 1.0;
    float _1786 = _1784 * _1756;
    float _1788 = precise::clamp(_1786, 0.0, 1.0);
    float _1790 = -_1788;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1794 = _1792 * _1732;
    float _1796 = _1794 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1798 = _1684 * _1617;
    float _1800 = _1628 * _1760;
    out.m_76.x = _1796;
    float _1802 = _1622;
    float _1804 = _1780;
    float _1806 = _1780;
    if (!_1654)
    {
        _1762 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1808 = _1762;
    float _1810 = _1628 * _1798;
    float _1812 = _1638 * _1798;
    float _1814 = fma(_1634, _1810, _1622);
    float _1816 = fma(_1636, _1810, _1624);
    float _1818 = fma(_1628, _1812, _1626);
    float _1820 = _1808;
    float _1822 = _1808;
    if (!_1654)
    {
        _1802 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1824 = _1802;
    out.m_78.x = _1814;
    out.m_78.y = _1816;
    out.m_78.z = _1818;
    out.m_78.w = _1800;
    bool _1826 = !_1654;
    float _1828 = _1824;
    float _1830 = _1824;
    if (!_1826)
    {
        bool _1832 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1834 = isnan(_1437);
        bool _1836 = _1832 || _1834;
        bool _1838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1840 = _1836 || _1838;
        if (!_1840)
        {
            float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1844 = _1437 + _1842;
            float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1846;
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1854 = 1.0 / _1848;
            float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1858 = _1856 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1872 = _1844 * _1854;
            float _1874 = precise::clamp(_1872, 0.0, 1.0);
            float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1880 = fma(_1874, _1852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1882 = fma(_1874, _1878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1884 = fma(_1874, _1858, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1886 = fma(_1874, _1862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1888 = fma(_1874, _1866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1890 = fma(_1874, _1870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1772 = _1884;
            _1822 = _1888;
            _1830 = _1880;
            _1806 = _1886;
            _1778 = _1882;
            _1766 = _1890;
            _1892 = true;
        }
        else
        {
            bool _1894 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1896 = isnan(_1437);
            bool _1898 = _1894 || _1896;
            bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1902 = _1898 || _1900;
            if (!_1902)
            {
                _1828 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1904 = _1828;
            _1830 = _1904;
            if (!_1902)
            {
                _1770 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1906 = _1770;
            _1772 = _1906;
            if (!_1902)
            {
                _1776 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1908 = _1776;
            _1778 = _1908;
            if (!_1902)
            {
                _1804 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1910 = _1804;
            _1806 = _1910;
            if (!_1902)
            {
                _1820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1912 = _1820;
            _1822 = _1912;
            if (!_1902)
            {
                _1764 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1914 = _1764;
            bool _1916 = !_1902;
            _1766 = _1914;
            if (!_1916)
            {
                bool _1918 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1920 = isnan(_1437);
                bool _1922 = _1918 || _1920;
                bool _1924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1926 = _1922 || _1924;
                if (!_1926)
                {
                    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1930 = _1437 + _1928;
                    float _1932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1932;
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1940 = 1.0 / _1934;
                    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1944 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1958 = _1930 * _1940;
                    float _1960 = precise::clamp(_1958, 0.0, 1.0);
                    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1964 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1966 = fma(_1960, _1938, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1968 = fma(_1960, _1964, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1970 = fma(_1960, _1944, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1972 = fma(_1960, _1948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1974 = fma(_1960, _1952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1976 = fma(_1960, _1956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1772 = _1970;
                    _1822 = _1974;
                    _1830 = _1966;
                    _1806 = _1972;
                    _1778 = _1968;
                    _1766 = _1976;
                    _1892 = true;
                }
                else
                {
                    _1772 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1830 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1806 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1778 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1766 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1892 = false;
    float _1978 = _1772;
    float _1980 = _1822;
    float _1982 = _1830;
    float _1984 = _1806;
    float _1986 = _1778;
    float _1988 = _1766;
    float _1990 = fma(_1165, -0.5, 0.5);
    float _1992 = precise::clamp(_1990, 0.0, 1.0);
    float _1994 = -_1978;
    float _1996 = _1994 + _1980;
    float _1998 = -_1982;
    float _2000 = _1998 + _1984;
    float _2002 = -_1986;
    float _2004 = _2002 + _1988;
    bool _2006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2008 = fma(_1992, _1996, _1978);
    float _2010 = fma(_1992, _2000, _1982);
    float _2012 = fma(_1992, _2004, _1986);
    float _2014 = _2008 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _2016 = fma(_2010, 0.298911988735198974609375, _2014);
    float _2018 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2020 = fma(_2012, 0.114477999508380889892578125, _2016);
    out.m_51.x = _2018;
    float _2022 = -_2020;
    float _2024 = _2010 + _2022;
    float _2026 = -_2020;
    float _2028 = _2008 + _2026;
    float _2030 = -_2020;
    float _2032 = _2012 + _2030;
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    float _2036 = fma(_2028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    float _2038 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    out.m_82.x = _2034;
    out.m_82.y = _2036;
    out.m_82.z = _2038;
    if (!_2006)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2040 = -_1279;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2044 = -_1285;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2048 = -_1291;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = sqrt(_2056);
    float _2060 = rsqrt(_2056);
    float _2062 = -_2058;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2066 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2068 = precise::clamp(_2066, 0.0, 1.0);
    float _2070 = _2046 * _2060;
    float _2072 = _2042 * _2060;
    float _2074 = abs(_2068);
    float _2076 = log2(_2074);
    float _2078 = _2050 * _2060;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2082 = _1165 * _2072;
    float _2084 = -_2072;
    float _2086 = -_2080;
    float _2088 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2086);
    float _2090 = fma(_1163, _2070, _2082);
    float _2092 = -_2078;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2088);
    float _2096 = fma(_1183, _2078, _2090);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2102 = _2094 + _2100;
    float _2104 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2106 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = exp2(_2104);
    float _2112 = _2110 * _2108;
    float _2114 = _2098 * _2112;
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2118 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2116;
    out.m_80.y = _2118;
    out.m_80.z = _2120;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1892 = false;
    bool _1239 = false;
    bool _419 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_48.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (!_105)
    {
        out.m_51.x = 0.0;
    }
    int _111 = 0;
    if (!_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2176 = as_type<float>(_115);
        out.gl_Position.z = _2176;
    }
    if (!_105)
    {
        return out;
    }
    float _119 = in.m_53.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_101);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    float _149 = 0.0;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_155);
        out.gl_Position.z = _2245;
    }
    if (_147)
    {
        return out;
    }
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _159 = !_157;
    float _177;
    if (!_159)
    {
        float _161 = in.m_55.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_101);
        float _183 = 1.0 / _181;
        float _185 = _133 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _187 + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _187 + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _199 = _187 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _217 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _219 = isnan(_187);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = 1.0 / _203;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = 1.0 / _207;
    float _235 = 1.0 / _211;
    float _237 = _195 * _229;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _187 + _239;
    float _243 = 1.0 / _215;
    float _245 = _191 * _233;
    bool _247 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _249 = isnan(_187);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    bool _259 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_187);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = _199 * _235;
    float _273 = -_227;
    float _275 = _273 + 1.0;
    float _277 = -_257;
    float _279 = _277 + 1.0;
    float _281 = _257 * _275;
    bool _283 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_187);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = _269 * _279;
    float _297 = _241 * _243;
    float _299 = -_269;
    float _301 = _299 + 1.0;
    bool _303 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_187);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _293 * _301;
    float _333 = -_293;
    float _335 = _333 + 1.0;
    float _337 = fma(_325, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = fma(_317, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = -_313;
    float _343 = _341 + 1.0;
    float _345 = _313 * _335;
    float _347 = fma(_329, _245, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_321, _245, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = _337 * _345;
    float _357 = _339 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _359;
    float _363 = fma(_351, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _373 = fma(_361, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_347, _331, _365);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _381 = fma(_353, _331, _367);
    float _383 = fma(_371, _297, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _385 = fma(_363, _295, _375);
    float _387 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _389 = fma(_373, _295, _381);
    float _391 = fma(_383, _281, _385);
    float _393 = fma(_387, _281, _389);
    float _395 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[147].x, _391);
    float _397 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[147].y, _393);
    bool _399 = !_231;
    float _417;
    if (!_399)
    {
        float _401 = in.m_55.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_101);
        float _423 = 1.0 / _421;
        float _425 = _133 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = in.m_55.z;
    float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _433 = log2(_431);
    float _435 = in.m_55.x;
    float _437 = in.m_55.y;
    bool _439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _451 = 1.0 + _449;
    float _453 = as_type<float>(int(gl_VertexIndex));
    bool _455 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(1.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = 1.0 / _451;
    float _467 = _433 * _133;
    float _469 = exp2(_467);
    float _471 = _429 * 2.0;
    float _473 = _435 * 2.0;
    float _475 = _437 * 2.0;
    float _477 = floor(_471);
    float _479 = floor(_473);
    float _481 = -_469;
    float _483 = _481 + 1.0;
    bool _485 = _477 > 0.0;
    float _487 = floor(_475);
    bool _489 = _477 >= 0.0;
    bool _491 = isnan(_477);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = _497 ? 0 : 1;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _511 = _509 != 0;
    float _513 = _447 ? _483 : 0.0;
    float _515 = in.m_60.x;
    float _517 = in.m_60.y;
    bool _519 = _479 > 0.0;
    if (_463)
    {
        float _521 = _513 * _465;
        _137 = _521;
    }
    float _523 = _137;
    bool _525 = !_503;
    int _527 = _525 ? 0 : 1;
    bool _529 = _479 >= 0.0;
    bool _531 = isnan(_479);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    int _539 = ~_499;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = _543;
    if (!_485)
    {
        int _547 = ~_499;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = in.m_62.x;
    float _555 = in.m_62.y;
    float _557 = in.m_62.z;
    int _559 = abs(_527);
    int _561 = as_type<int>(_453) & 1;
    bool _563 = _561 != 0;
    int _565 = as_type<int>(_453) & 2;
    bool _567 = _565 != 0;
    int _569 = _537 ? 0 : 1;
    bool _571 = _487 > 0.0;
    bool _573 = _487 >= 0.0;
    bool _575 = isnan(_487);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = _437 + _435;
    int _585 = ~_569;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    float _591 = _395 * _515;
    int _593 = _589;
    if (!_519)
    {
        int _595 = ~_569;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    float _601 = _583 + (-1.0);
    float _603 = float(_559);
    float _605 = _397 * _517;
    float _607 = float(_551);
    float _609 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _611 = _605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _613 = _581 ? 0 : 1;
    float _615 = _603 * _607;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _619 = _617 != 0;
    float _621 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _623 = !_511;
    int _625 = _623 ? 0 : 1;
    float _627 = _615 * (-2.0);
    bool _629 = !_507;
    int _631 = _629 ? 0 : 1;
    int _633 = ~_613;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = fma(_621, _627, _621);
    int _641 = _637;
    if (!_571)
    {
        int _643 = ~_613;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = _437 + _429;
    int _651 = abs(_631);
    float _653 = fma(_627, _553, _553);
    int _655 = abs(_625);
    float _657 = _435 + (-0.5);
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _661 = _659 != 0;
    float _663 = _649 + (-1.0);
    float _665 = float(_651);
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _653);
    float _669 = float(_655);
    float _671 = float(_599);
    float _673 = fma(_639, _523, _667);
    float _675 = float(_647);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _679 = _665 * _671;
    bool _681 = _435 > 0.5;
    float _683 = _669 * _675;
    bool _685 = _437 > 0.5;
    float _687 = _429 + _435;
    float _689 = _437 + (-0.5);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = in.m_48.x;
    float _697 = in.m_48.y;
    float _699 = in.m_48.z;
    float _701 = _679 * (-2.0);
    float _703 = _687 + (-1.0);
    float _705 = _683 * (-2.0);
    float _707 = 1.0 / _693;
    float _709 = fma(_701, _555, _555);
    float _711 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _713 = fma(_705, _557, _557);
    float _715 = _429 + (-0.5);
    float _717 = fma(_677, _701, _677);
    float _719 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _709);
    float _721 = fma(_711, _705, _711);
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].z, _713);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _725;
    float _729 = fma(_717, _523, _719);
    float _731 = _673 * 0.15915493667125701904296875;
    float _733 = fma(_721, _523, _723);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _737 = _427 + _735;
    float _739 = _729 * 0.15915493667125701904296875;
    bool _741 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _743 = isnan(_427);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _733 * 0.15915493667125701904296875;
    float _755 = _727 * _707;
    float _757 = _731 * 6.283185482025146484375;
    float _759 = sin(_757);
    bool _761 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _763 = isnan(_427);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _697 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _775 = _697 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _777 = fma(_755, _737, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _779 = _697 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _781 = -_751;
    float _783 = _781 + 1.0;
    float _785 = _739 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[4].x, _773);
    float _791 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[6].x, _779);
    float _793 = _771 * _783;
    float _795 = -_771;
    float _797 = _795 + 1.0;
    bool _799 = !_567;
    float _801 = _799 ? (-0.5) : 0.5;
    float _803 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[5].x, _775);
    bool _805 = !_563;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _739 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = _777 * _793;
    float _815 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[4].z, _789);
    float _817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _801);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _821 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[5].z, _803);
    float _823 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[115].x, _813);
    float _825 = _611 * _817;
    float _827 = _753 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _609 * _819;
    float _833 = _759 * _787;
    float _835 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[6].z, _791);
    float _837 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[116].x, _823);
    float _839 = _731 * 6.283185482025146484375;
    float _841 = cos(_839);
    float _843 = _753 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _759 * _811;
    float _849 = _759 * _829;
    float _851 = _811 * _829;
    float _853 = _787 * _829;
    float _855 = _841 * _811;
    float _857 = _841 * _829;
    float _859 = _841 * _787;
    float _861 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _863 = _849 * _825;
    float _865 = _857 * _825;
    float _867 = fma(_845, _855, _833);
    float _869 = fma(_845, _833, _855);
    float _871 = -_859;
    float _873 = fma(_845, _847, _871);
    float _875 = -_847;
    float _877 = fma(_845, _859, _875);
    float _879 = -_825;
    float _881 = _845 * _879;
    float _883 = fma(_867, _831, _865);
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = fma(_851, _831, _881);
    float _889 = fma(_877, _861, _883);
    float _891 = fma(_873, _831, _863);
    float _893 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _895 = fma(_853, _861, _887);
    float _897 = _889 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _899 = _889 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _901 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _903 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _905 = fma(_869, _861, _891);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].x, _897);
    float _909 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].x, _899);
    float _911 = -_845;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _893);
    float _915 = -_845;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _901);
    float _919 = -_845;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].x, _903);
    float _923 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _907);
    float _925 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _909);
    float _927 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _931 = _923 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _913);
    float _937 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _917);
    float _939 = _929 + _931;
    float _941 = _927 + _933;
    float _943 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _921);
    float _945 = -_801;
    int _947 = _685 ? as_type<int>(_945) : as_type<int>(_801);
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _951 = _939 + _949;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _955 = _941 + _953;
    float _957 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _961 = _951 * _951;
    float _963 = _955 * _955;
    float _965 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _967 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _969 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _959);
    float _971 = _961 + _963;
    float _973 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _965);
    bool _975 = !_661;
    float _977 = _975 ? _801 : as_type<float>(_947);
    float _979 = _801 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _981 = sqrt(_971);
    float _983 = _889 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _985 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _987 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _989 = _979 * _937;
    float _991 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].x, _983);
    float _993 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _995 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[25].x, _985);
    float _997 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[26].x, _987);
    float _999 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].z, _973);
    float _1001 = _979 * _935;
    float _1003 = _979 * _943;
    float _1005 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _991);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1009 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].z, _967);
    float _1011 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].z, _969);
    bool _1013 = _981 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1015 = _821 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1017 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1019 = -_807;
    float _1021 = _681 ? _1019 : _807;
    float _1023 = _807 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1027 = _1015 + _1017;
    bool _1029 = !_619;
    float _1031 = _1029 ? _807 : _1021;
    float _1033 = fma(_1023, _1009, _1001);
    float _1035 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _993);
    float _1037 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _995);
    float _1039 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _997);
    float _1041 = _1009;
    float _1043 = _1021;
    float _1045 = _963;
    float _1047 = _961;
    float _1049 = _941;
    if (!_1013)
    {
        _1041 = _963;
    }
    float _1051 = _1041;
    float _1053 = _1051;
    if (!_1013)
    {
        _1043 = _939;
    }
    float _1055 = _1043;
    float _1057 = _1055;
    if (!_1013)
    {
        _1045 = _1027;
    }
    float _1059 = _1045;
    bool _1061 = !_1013;
    float _1063 = _1059;
    if (!_1061)
    {
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1069 = _981 + _1067;
        float _1071 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = rsqrt(_971);
        float _1075 = _1069 * _1065;
        float _1077 = _1075 * 0.15915493667125701904296875;
        float _1079 = _1077 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = fma(_1081, _1071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1089 = _1073 * _1087;
        float _1091 = fma(_951, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1093 = _1085 + (-1.0);
        float _1095 = fma(_955, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1099 = _1091 + _1097;
        float _1101 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1105 = _1095 + _1103;
        float _1107 = _1099 * _1099;
        float _1109 = fma(_1027, _1085, _1101);
        float _1111 = _1105 * _1105;
        _1063 = _1109;
        _1047 = _1107;
        _1053 = _1111;
        _1057 = _1091;
        _1049 = _1095;
    }
    float _1113 = _1063;
    float _1115 = _1047;
    float _1117 = _1053;
    float _1119 = _1057;
    float _1121 = _1049;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1125 = _1113 + _1123;
    float _1127 = -_977;
    float _1129 = _1127 + 0.5;
    float _1131 = _1031 + 0.5;
    float _1133 = fma(_1023, _999, _1003);
    float _1135 = fma(_1125, _1125, _1115);
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = _1135 + _1117;
    float _1143 = _1137 * _1025;
    float _1145 = _1139 * _1007;
    float _1147 = fma(_1023, _1011, _989);
    float _1149 = sqrt(_1141);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1163 = _1035 + _1033;
    float _1165 = _1037 + _1147;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _837 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1183 = _1039 + _1133;
    out.m_64.x = _1145;
    out.m_64.y = _1143;
    bool _1185 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1187 = isnan(_1149);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1193 = _1189 || _1191;
    out.m_66.x = _1173;
    out.m_66.y = _1175;
    out.m_66.z = _1177;
    out.m_66.w = _1167;
    out.m_68.x = _1169;
    out.m_68.y = _1171;
    out.m_68.z = _1179;
    out.m_68.w = _1181;
    out.m_70.x = _1163;
    out.m_70.y = _1165;
    out.m_70.z = _1183;
    float _1195 = _1133;
    float _1197 = _1167;
    float _1199 = _1179;
    float _1201 = _1169;
    float _1203 = _1131;
    if (!_1193)
    {
        _1195 = 1.0;
    }
    float _1205 = _1195;
    bool _1207 = !_1193;
    float _1209 = _1205;
    if (!_1207)
    {
        bool _1211 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1213 = isnan(_1149);
        bool _1215 = _1211 || _1213;
        bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1219 = _1215 || _1217;
        if (!_1219)
        {
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = _1149 + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1227 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1225;
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1233 = 1.0 / _1227;
            float _1235 = _1223 * _1233;
            float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1209 = _1237;
            _1239 = true;
        }
        else
        {
            bool _1241 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1243 = isnan(_1149);
            bool _1245 = _1241 || _1243;
            bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1249 = _1245 || _1247;
            if (!_1249)
            {
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1149 + _1251;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1263 = 1.0 / _1257;
                float _1265 = _1253 * _1263;
                float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1209 = _1267;
                _1239 = true;
            }
            else
            {
                _1209 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1239 = false;
    float _1269 = _1209;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1273 = _1113 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1277 = _1119 + _1275;
    float _1279 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1283 = _1121 + _1281;
    float _1285 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1279 + _1287;
    float _1291 = fma(_1283, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1295 = _1285 + _1293;
    float _1297 = _1289 * _1289;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1291 + _1299;
    float _1303 = fma(_1295, _1295, _1297);
    float _1305 = fma(_1301, _1301, _1303);
    float _1307 = rsqrt(_1305);
    float _1309 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1311 = _1295 * _1309;
    float _1313 = _1301 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 * _1313;
    float _1319 = _1315 + _1317;
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1321 + _1325;
    float _1329 = _1301;
    float _1331 = _1327;
    float _1333 = _1289;
    if (_1323)
    {
        float _1335 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1335;
    }
    float _1337 = _1329;
    if (_1323)
    {
        float _1339 = rsqrt(_1319);
        _1197 = _1339;
    }
    float _1341 = _1197;
    float _1343 = _1341;
    if (_1323)
    {
        float _1345 = _1327 * _1337;
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (_1323)
    {
        float _1349 = _1347 * 0.15915493667125701904296875;
        _1199 = _1349;
    }
    float _1351 = _1199;
    float _1353 = _1297;
    if (_1323)
    {
        float _1355 = _1351 * 6.283185482025146484375;
        float _1357 = sin(_1355);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1363 = precise::max(0.0, _1361);
    float _1365 = _1307;
    float _1367 = _1361;
    float _1369 = _1363;
    if (_1323)
    {
        float _1371 = _1351 * 6.283185482025146484375;
        float _1373 = cos(_1371);
        _1365 = _1373;
    }
    float _1375 = _1365;
    float _1377 = -_1309;
    float _1379 = -_1363;
    float _1381 = fma(_1289, _1377, _1379);
    if (_1323)
    {
        float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1367 = _1383;
    }
    float _1385 = _1367;
    float _1387 = _1359;
    if (_1323)
    {
        float _1389 = fma(_1359, _1385, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1201 = _1389;
    }
    float _1391 = _1201;
    float _1393 = _1391;
    if (!_1323)
    {
        _1387 = _1381;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    float _1399 = _1375;
    if (_1323)
    {
        float _1401 = _1375 + (-1.0);
        _1333 = _1401;
    }
    float _1403 = _1333;
    float _1405 = _1403;
    if (_1323)
    {
        float _1407 = _1341 * _1391;
        _1203 = _1407;
    }
    float _1409 = _1203;
    if (!_1323)
    {
        _1343 = _1311;
    }
    float _1411 = _1343;
    float _1413 = _1411;
    if (_1323)
    {
        float _1415 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1415;
    }
    float _1417 = _1369;
    if (_1323)
    {
        float _1419 = _1311 * _1409;
        _1413 = _1419;
    }
    float _1421 = _1413;
    if (!_1323)
    {
        _1405 = _1313;
    }
    float _1423 = _1405;
    float _1425 = _1423;
    if (_1323)
    {
        float _1427 = _1313 * _1409;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1323)
    {
        float _1431 = fma(_1381, _1375, _1417);
        _1397 = _1431;
    }
    float _1433 = _1397;
    if (!_1323)
    {
        _1399 = _1315;
    }
    float _1435 = _1399;
    float _1437 = sqrt(_1305);
    float _1439 = _1435;
    if (_1323)
    {
        float _1441 = _1421 * _1421;
        _1439 = _1441;
    }
    float _1443 = _1439;
    if (!_1323)
    {
        _1393 = _1317;
    }
    float _1445 = _1393;
    float _1447 = _1445;
    if (_1323)
    {
        float _1449 = _1429 * _1429;
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = fma(_1433, _1433, _1443);
    float _1455 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1457 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1459 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1461 = _1453 + _1451;
    float _1463 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1455);
    float _1465 = fma(_927, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1467 = rsqrt(_1461);
    float _1469 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1473 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1471);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1479 = -_1475;
    float _1481 = _1479 + 1.0;
    float _1483 = floor(_1457);
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1487 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1491 = -_1487;
    float _1493 = fma(_1491, _1485, 1.0);
    float _1495 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1497 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1499 = _1467 * _1433;
    float _1501 = _1467 * _1421;
    float _1503 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1505 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1497);
    float _1507 = abs(_1481);
    float _1509 = log2(_1507);
    float _1511 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1513 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1515 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1517 = _1467 * _1429;
    float _1519 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1459);
    float _1521 = -_1511;
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1521);
    float _1525 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1529 = floor(_1465);
    float _1531 = -_1517;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1523);
    float _1535 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1519);
    float _1537 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1527);
    float _1539 = -_1483;
    float _1541 = _1457 + _1539;
    float _1543 = fma(_1533, -0.5, 0.5);
    float _1545 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1537);
    float _1547 = log2(_1493);
    float _1549 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1551 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = exp2(_1549);
    float _1555 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1557 = fma(_1533, 0.5, 0.5);
    float _1559 = -_1529;
    float _1561 = _1465 + _1559;
    float _1563 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1545);
    float _1565 = fma(_1557, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1567 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1569 = sqrt(_1543);
    float _1571 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1573 = _1499 + 1.0;
    float _1575 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1577 = fma(_1557, _1565, -0.212114393711090087890625);
    float _1579 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1571);
    float _1581 = 1.0 / _1563;
    float _1583 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1585 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
    float _1587 = -_1499;
    float _1589 = fma(_1553, _1573, _1587);
    float _1591 = _1547 * 0.693147182464599609375;
    float _1593 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1583);
    float2 _4596 = float2(_1541, _1561);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4596, float2(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4596, float2(0.0), isnan(_4596)), level(0.0)).x;
    float _1597 = fma(_1557, _1577, 1.570728778839111328125);
    float _1599 = _1569 * 0.636619746685028076171875;
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1603 = fma(_1589, 0.5, 0.5);
    float _1605 = -_1597;
    float _1607 = fma(_1599, _1605, 1.0);
    float _1609 = _1585 * _1581;
    float _1611 = _1593 * _1581;
    float _1613 = fma(_1609, 0.5, 0.5);
    float _1615 = fma(_1611, -0.5, 0.5);
    float3 _4635 = float3(_1613, _1615, _1601);
    float _1617 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4635, float3(0.0), isnan(_4635)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4635, float3(0.0), isnan(_4635)), level(0.0)).x;
    float3 _4646 = float3(_1613, _1615, _1601);
    float4 _1620 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4646, float3(0.0), isnan(_4646)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4646, float3(0.0), isnan(_4646)), level(0.0)).xyzw;
    float _1622 = _1620.x;
    float _1624 = _1620.y;
    float _1626 = _1620.z;
    float _1628 = _1620.w;
    float2 _4662 = float2(_1607, _1603);
    float3 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4662, float2(0.0), isnan(_4662)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4662, float2(0.0), isnan(_4662)), level(0.0)).xyz;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1642 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1644 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1646 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1648 = isnan(_1437);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1654 = _1650 || _1652;
    float _1656 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1640);
    float _1658 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1660 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1642);
    float _1662 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1656);
    float _1664 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1658);
    float _1666 = exp2(_1644);
    float _1668 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1660);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1672 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1664);
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1676 = 1.0 / _1670;
    float _1678 = _1674 + _1670;
    float _1680 = -_1666;
    float _1682 = _1680 + 1.0;
    float _1684 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1686 = _1678 * _1676;
    float _1688 = _1686 * 0.5;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1692 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1690);
    float _1694 = 1.0 / _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1698 = _1694 * _1696;
    float _1700 = abs(_1698);
    float _1702 = log2(_1700);
    bool _1704 = _1698 <= 8000.0;
    bool _1706 = isnan(_1698);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(8000.0);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1718 = exp2(_1716);
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1722 = precise::clamp(_1720, 0.0, 1.0);
    float _1724 = fma(_1722, -2.0, 3.0);
    float _1726 = _1722 * _1722;
    float _1728 = _1726 * _1724;
    float _1730 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1668);
    float _1732 = in.m_72.x;
    float _1734 = -_1728;
    float _1736 = _1734 + 1.0;
    float _1738 = _1730 + _1563;
    float _1740 = fma(_1736, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1728);
    float _1742 = _1738 * 0.5;
    float _1744 = _1738;
    float _1746 = _1563;
    float _1748 = _1730;
    float _1750 = _1593;
    if (!_1654)
    {
        _1744 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1752 = _1744;
    float _1754 = _1714 * _1740;
    out.gl_Position.x = _1585;
    out.gl_Position.y = _1593;
    out.gl_Position.z = _1730;
    out.gl_Position.w = _1563;
    float _1756 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_74.z = _1742;
    out.m_74.w = _1563;
    float _1758 = -_1684;
    float _1760 = _1758 + 1.0;
    float _1762 = _1760;
    float _1764 = _1752;
    float _1766 = _1752;
    if (!_1654)
    {
        _1746 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1768 = _1746;
    float _1770 = _1768;
    float _1772 = _1768;
    if (!_1654)
    {
        _1748 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1774 = _1748;
    float _1776 = _1774;
    float _1778 = _1774;
    if (!_1654)
    {
        _1750 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1780 = _1750;
    float _1782 = -_1595;
    float _1784 = _1782 + 1.0;
    float _1786 = _1784 * _1756;
    float _1788 = precise::clamp(_1786, 0.0, 1.0);
    float _1790 = -_1788;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1794 = _1792 * _1732;
    float _1796 = _1794 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1798 = _1684 * _1617;
    float _1800 = _1628 * _1760;
    out.m_76.x = _1796;
    float _1802 = _1622;
    float _1804 = _1780;
    float _1806 = _1780;
    if (!_1654)
    {
        _1762 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1808 = _1762;
    float _1810 = _1628 * _1798;
    float _1812 = _1638 * _1798;
    float _1814 = fma(_1634, _1810, _1622);
    float _1816 = fma(_1636, _1810, _1624);
    float _1818 = fma(_1628, _1812, _1626);
    float _1820 = _1808;
    float _1822 = _1808;
    if (!_1654)
    {
        _1802 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1824 = _1802;
    out.m_78.x = _1814;
    out.m_78.y = _1816;
    out.m_78.z = _1818;
    out.m_78.w = _1800;
    bool _1826 = !_1654;
    float _1828 = _1824;
    float _1830 = _1824;
    if (!_1826)
    {
        bool _1832 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1834 = isnan(_1437);
        bool _1836 = _1832 || _1834;
        bool _1838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1840 = _1836 || _1838;
        if (!_1840)
        {
            float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1844 = _1437 + _1842;
            float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1846;
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1854 = 1.0 / _1848;
            float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1858 = _1856 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1872 = _1844 * _1854;
            float _1874 = precise::clamp(_1872, 0.0, 1.0);
            float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1880 = fma(_1874, _1852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1882 = fma(_1874, _1878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1884 = fma(_1874, _1858, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1886 = fma(_1874, _1862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1888 = fma(_1874, _1866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1890 = fma(_1874, _1870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1772 = _1884;
            _1822 = _1888;
            _1830 = _1880;
            _1806 = _1886;
            _1778 = _1882;
            _1766 = _1890;
            _1892 = true;
        }
        else
        {
            bool _1894 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1896 = isnan(_1437);
            bool _1898 = _1894 || _1896;
            bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1902 = _1898 || _1900;
            if (!_1902)
            {
                _1828 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1904 = _1828;
            _1830 = _1904;
            if (!_1902)
            {
                _1770 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1906 = _1770;
            _1772 = _1906;
            if (!_1902)
            {
                _1776 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1908 = _1776;
            _1778 = _1908;
            if (!_1902)
            {
                _1804 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1910 = _1804;
            _1806 = _1910;
            if (!_1902)
            {
                _1820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1912 = _1820;
            _1822 = _1912;
            if (!_1902)
            {
                _1764 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1914 = _1764;
            bool _1916 = !_1902;
            _1766 = _1914;
            if (!_1916)
            {
                bool _1918 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1920 = isnan(_1437);
                bool _1922 = _1918 || _1920;
                bool _1924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1926 = _1922 || _1924;
                if (!_1926)
                {
                    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1930 = _1437 + _1928;
                    float _1932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1932;
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1940 = 1.0 / _1934;
                    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1944 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1958 = _1930 * _1940;
                    float _1960 = precise::clamp(_1958, 0.0, 1.0);
                    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1964 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1966 = fma(_1960, _1938, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1968 = fma(_1960, _1964, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1970 = fma(_1960, _1944, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1972 = fma(_1960, _1948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1974 = fma(_1960, _1952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1976 = fma(_1960, _1956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1772 = _1970;
                    _1822 = _1974;
                    _1830 = _1966;
                    _1806 = _1972;
                    _1778 = _1968;
                    _1766 = _1976;
                    _1892 = true;
                }
                else
                {
                    _1772 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1830 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1806 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1778 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1766 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1892 = false;
    float _1978 = _1772;
    float _1980 = _1822;
    float _1982 = _1830;
    float _1984 = _1806;
    float _1986 = _1778;
    float _1988 = _1766;
    float _1990 = fma(_1165, -0.5, 0.5);
    float _1992 = precise::clamp(_1990, 0.0, 1.0);
    float _1994 = -_1978;
    float _1996 = _1994 + _1980;
    float _1998 = -_1982;
    float _2000 = _1998 + _1984;
    float _2002 = -_1986;
    float _2004 = _2002 + _1988;
    bool _2006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2008 = fma(_1992, _1996, _1978);
    float _2010 = fma(_1992, _2000, _1982);
    float _2012 = fma(_1992, _2004, _1986);
    float _2014 = _2008 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _2016 = fma(_2010, 0.298911988735198974609375, _2014);
    float _2018 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2020 = fma(_2012, 0.114477999508380889892578125, _2016);
    out.m_51.x = _2018;
    float _2022 = -_2020;
    float _2024 = _2010 + _2022;
    float _2026 = -_2020;
    float _2028 = _2008 + _2026;
    float _2030 = -_2020;
    float _2032 = _2012 + _2030;
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    float _2036 = fma(_2028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    float _2038 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    out.m_82.x = _2034;
    out.m_82.y = _2036;
    out.m_82.z = _2038;
    if (!_2006)
    {
        return out;
    }
    float _2040 = -_1279;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2044 = -_1285;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2048 = -_1291;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = sqrt(_2056);
    float _2060 = rsqrt(_2056);
    float _2062 = -_2058;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2066 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2068 = precise::clamp(_2066, 0.0, 1.0);
    float _2070 = _2046 * _2060;
    float _2072 = _2042 * _2060;
    float _2074 = abs(_2068);
    float _2076 = log2(_2074);
    float _2078 = _2050 * _2060;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2082 = _1165 * _2072;
    float _2084 = -_2072;
    float _2086 = -_2080;
    float _2088 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2086);
    float _2090 = fma(_1163, _2070, _2082);
    float _2092 = -_2078;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2088);
    float _2096 = fma(_1183, _2078, _2090);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2102 = _2094 + _2100;
    float _2104 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2106 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = exp2(_2104);
    float _2112 = _2110 * _2108;
    float _2114 = _2098 * _2112;
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2118 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2116;
    out.m_80.y = _2118;
    out.m_80.z = _2120;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1892 = false;
    bool _1239 = false;
    bool _419 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_48.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (!_105)
    {
        out.m_51.x = 0.0;
    }
    int _111 = 0;
    if (!_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2176 = as_type<float>(_115);
        out.gl_Position.z = _2176;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_53.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_101);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    float _149 = 0.0;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _149;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_155);
        out.gl_Position.z = _2245;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _159 = !_157;
    float _177;
    if (!_159)
    {
        float _161 = in.m_55.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_101);
        float _183 = 1.0 / _181;
        float _185 = _133 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _187 + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _187 + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _199 = _187 + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _215 = _213 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _217 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _219 = isnan(_187);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = 1.0 / _203;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = 1.0 / _207;
    float _235 = 1.0 / _211;
    float _237 = _195 * _229;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _187 + _239;
    float _243 = 1.0 / _215;
    float _245 = _191 * _233;
    bool _247 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _249 = isnan(_187);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    bool _259 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_187);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = _199 * _235;
    float _273 = -_227;
    float _275 = _273 + 1.0;
    float _277 = -_257;
    float _279 = _277 + 1.0;
    float _281 = _257 * _275;
    bool _283 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_187);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = _269 * _279;
    float _297 = _241 * _243;
    float _299 = -_269;
    float _301 = _299 + 1.0;
    bool _303 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_187);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _293 * _301;
    float _333 = -_293;
    float _335 = _333 + 1.0;
    float _337 = fma(_325, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = fma(_317, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = -_313;
    float _343 = _341 + 1.0;
    float _345 = _313 * _335;
    float _347 = fma(_329, _245, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_321, _245, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = _337 * _345;
    float _357 = _339 * _345;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _359;
    float _363 = fma(_351, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _357);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _373 = fma(_361, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_347, _331, _365);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _381 = fma(_353, _331, _367);
    float _383 = fma(_371, _297, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _385 = fma(_363, _295, _375);
    float _387 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _389 = fma(_373, _295, _381);
    float _391 = fma(_383, _281, _385);
    float _393 = fma(_387, _281, _389);
    float _395 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[147].x, _391);
    float _397 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[147].y, _393);
    bool _399 = !_231;
    float _417;
    if (!_399)
    {
        float _401 = in.m_55.x;
        float _403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _407 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _409 = _407 * _403;
        float _411 = floor(_409);
        float _413 = -_411;
        float _415 = _409 + _413;
        _417 = _415;
        _419 = true;
    }
    else
    {
        float _421 = float(_101);
        float _423 = 1.0 / _421;
        float _425 = _133 * _423;
        _417 = _425;
    }
    _419 = false;
    float _427 = _417;
    float _429 = in.m_55.z;
    float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _433 = log2(_431);
    float _435 = in.m_55.x;
    float _437 = in.m_55.y;
    bool _439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _451 = 1.0 + _449;
    float _453 = as_type<float>(int(gl_VertexIndex));
    bool _455 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(1.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = 1.0 / _451;
    float _467 = _433 * _133;
    float _469 = exp2(_467);
    float _471 = _429 * 2.0;
    float _473 = _435 * 2.0;
    float _475 = _437 * 2.0;
    float _477 = floor(_471);
    float _479 = floor(_473);
    float _481 = -_469;
    float _483 = _481 + 1.0;
    bool _485 = _477 > 0.0;
    float _487 = floor(_475);
    bool _489 = _477 >= 0.0;
    bool _491 = isnan(_477);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = _497 ? 0 : 1;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _511 = _509 != 0;
    float _513 = _447 ? _483 : 0.0;
    float _515 = in.m_60.x;
    float _517 = in.m_60.y;
    bool _519 = _479 > 0.0;
    if (_463)
    {
        float _521 = _513 * _465;
        _137 = _521;
    }
    float _523 = _137;
    bool _525 = !_503;
    int _527 = _525 ? 0 : 1;
    bool _529 = _479 >= 0.0;
    bool _531 = isnan(_479);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    int _539 = ~_499;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = _543;
    if (!_485)
    {
        int _547 = ~_499;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = in.m_62.x;
    float _555 = in.m_62.y;
    float _557 = in.m_62.z;
    int _559 = abs(_527);
    int _561 = as_type<int>(_453) & 1;
    bool _563 = _561 != 0;
    int _565 = as_type<int>(_453) & 2;
    bool _567 = _565 != 0;
    int _569 = _537 ? 0 : 1;
    bool _571 = _487 > 0.0;
    bool _573 = _487 >= 0.0;
    bool _575 = isnan(_487);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = _437 + _435;
    int _585 = ~_569;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    float _591 = _395 * _515;
    int _593 = _589;
    if (!_519)
    {
        int _595 = ~_569;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    float _601 = _583 + (-1.0);
    float _603 = float(_559);
    float _605 = _397 * _517;
    float _607 = float(_551);
    float _609 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _611 = _605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _613 = _581 ? 0 : 1;
    float _615 = _603 * _607;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _619 = _617 != 0;
    float _621 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _623 = !_511;
    int _625 = _623 ? 0 : 1;
    float _627 = _615 * (-2.0);
    bool _629 = !_507;
    int _631 = _629 ? 0 : 1;
    int _633 = ~_613;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = fma(_621, _627, _621);
    int _641 = _637;
    if (!_571)
    {
        int _643 = ~_613;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = _437 + _429;
    int _651 = abs(_631);
    float _653 = fma(_627, _553, _553);
    int _655 = abs(_625);
    float _657 = _435 + (-0.5);
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _661 = _659 != 0;
    float _663 = _649 + (-1.0);
    float _665 = float(_651);
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _653);
    float _669 = float(_655);
    float _671 = float(_599);
    float _673 = fma(_639, _523, _667);
    float _675 = float(_647);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _679 = _665 * _671;
    bool _681 = _435 > 0.5;
    float _683 = _669 * _675;
    bool _685 = _437 > 0.5;
    float _687 = _429 + _435;
    float _689 = _437 + (-0.5);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = in.m_48.x;
    float _697 = in.m_48.y;
    float _699 = in.m_48.z;
    float _701 = _679 * (-2.0);
    float _703 = _687 + (-1.0);
    float _705 = _683 * (-2.0);
    float _707 = 1.0 / _693;
    float _709 = fma(_701, _555, _555);
    float _711 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _713 = fma(_705, _557, _557);
    float _715 = _429 + (-0.5);
    float _717 = fma(_677, _701, _677);
    float _719 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _709);
    float _721 = fma(_711, _705, _711);
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].z, _713);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _725;
    float _729 = fma(_717, _523, _719);
    float _731 = _673 * 0.15915493667125701904296875;
    float _733 = fma(_721, _523, _723);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _737 = _427 + _735;
    float _739 = _729 * 0.15915493667125701904296875;
    bool _741 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _743 = isnan(_427);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _733 * 0.15915493667125701904296875;
    float _755 = _727 * _707;
    float _757 = _731 * 6.283185482025146484375;
    float _759 = sin(_757);
    bool _761 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _763 = isnan(_427);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _697 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _775 = _697 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _777 = fma(_755, _737, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _779 = _697 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _781 = -_751;
    float _783 = _781 + 1.0;
    float _785 = _739 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[4].x, _773);
    float _791 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[6].x, _779);
    float _793 = _771 * _783;
    float _795 = -_771;
    float _797 = _795 + 1.0;
    bool _799 = !_567;
    float _801 = _799 ? (-0.5) : 0.5;
    float _803 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[5].x, _775);
    bool _805 = !_563;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _739 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = _777 * _793;
    float _815 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[4].z, _789);
    float _817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _801);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _821 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[5].z, _803);
    float _823 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[115].x, _813);
    float _825 = _611 * _817;
    float _827 = _753 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _609 * _819;
    float _833 = _759 * _787;
    float _835 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[6].z, _791);
    float _837 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[116].x, _823);
    float _839 = _731 * 6.283185482025146484375;
    float _841 = cos(_839);
    float _843 = _753 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _759 * _811;
    float _849 = _759 * _829;
    float _851 = _811 * _829;
    float _853 = _787 * _829;
    float _855 = _841 * _811;
    float _857 = _841 * _829;
    float _859 = _841 * _787;
    float _861 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _863 = _849 * _825;
    float _865 = _857 * _825;
    float _867 = fma(_845, _855, _833);
    float _869 = fma(_845, _833, _855);
    float _871 = -_859;
    float _873 = fma(_845, _847, _871);
    float _875 = -_847;
    float _877 = fma(_845, _859, _875);
    float _879 = -_825;
    float _881 = _845 * _879;
    float _883 = fma(_867, _831, _865);
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = fma(_851, _831, _881);
    float _889 = fma(_877, _861, _883);
    float _891 = fma(_873, _831, _863);
    float _893 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _895 = fma(_853, _861, _887);
    float _897 = _889 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _899 = _889 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _901 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _903 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _905 = fma(_869, _861, _891);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].x, _897);
    float _909 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].x, _899);
    float _911 = -_845;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _893);
    float _915 = -_845;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _901);
    float _919 = -_845;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].x, _903);
    float _923 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _907);
    float _925 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _909);
    float _927 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _931 = _923 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _913);
    float _937 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _917);
    float _939 = _929 + _931;
    float _941 = _927 + _933;
    float _943 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _921);
    float _945 = -_801;
    int _947 = _685 ? as_type<int>(_945) : as_type<int>(_801);
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _951 = _939 + _949;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _955 = _941 + _953;
    float _957 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _961 = _951 * _951;
    float _963 = _955 * _955;
    float _965 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _967 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _969 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _959);
    float _971 = _961 + _963;
    float _973 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _965);
    bool _975 = !_661;
    float _977 = _975 ? _801 : as_type<float>(_947);
    float _979 = _801 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _981 = sqrt(_971);
    float _983 = _889 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _985 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _987 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _989 = _979 * _937;
    float _991 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].x, _983);
    float _993 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _995 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[25].x, _985);
    float _997 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[26].x, _987);
    float _999 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].z, _973);
    float _1001 = _979 * _935;
    float _1003 = _979 * _943;
    float _1005 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _991);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1009 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].z, _967);
    float _1011 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].z, _969);
    bool _1013 = _981 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1015 = _821 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1017 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1019 = -_807;
    float _1021 = _681 ? _1019 : _807;
    float _1023 = _807 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1027 = _1015 + _1017;
    bool _1029 = !_619;
    float _1031 = _1029 ? _807 : _1021;
    float _1033 = fma(_1023, _1009, _1001);
    float _1035 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _993);
    float _1037 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _995);
    float _1039 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _997);
    float _1041 = _1009;
    float _1043 = _1021;
    float _1045 = _963;
    float _1047 = _961;
    float _1049 = _941;
    if (!_1013)
    {
        _1041 = _963;
    }
    float _1051 = _1041;
    float _1053 = _1051;
    if (!_1013)
    {
        _1043 = _939;
    }
    float _1055 = _1043;
    float _1057 = _1055;
    if (!_1013)
    {
        _1045 = _1027;
    }
    float _1059 = _1045;
    bool _1061 = !_1013;
    float _1063 = _1059;
    if (!_1061)
    {
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1069 = _981 + _1067;
        float _1071 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = rsqrt(_971);
        float _1075 = _1069 * _1065;
        float _1077 = _1075 * 0.15915493667125701904296875;
        float _1079 = _1077 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = fma(_1081, _1071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1089 = _1073 * _1087;
        float _1091 = fma(_951, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1093 = _1085 + (-1.0);
        float _1095 = fma(_955, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1099 = _1091 + _1097;
        float _1101 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1105 = _1095 + _1103;
        float _1107 = _1099 * _1099;
        float _1109 = fma(_1027, _1085, _1101);
        float _1111 = _1105 * _1105;
        _1063 = _1109;
        _1047 = _1107;
        _1053 = _1111;
        _1057 = _1091;
        _1049 = _1095;
    }
    float _1113 = _1063;
    float _1115 = _1047;
    float _1117 = _1053;
    float _1119 = _1057;
    float _1121 = _1049;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1125 = _1113 + _1123;
    float _1127 = -_977;
    float _1129 = _1127 + 0.5;
    float _1131 = _1031 + 0.5;
    float _1133 = fma(_1023, _999, _1003);
    float _1135 = fma(_1125, _1125, _1115);
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = _1135 + _1117;
    float _1143 = _1137 * _1025;
    float _1145 = _1139 * _1007;
    float _1147 = fma(_1023, _1011, _989);
    float _1149 = sqrt(_1141);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1163 = _1035 + _1033;
    float _1165 = _1037 + _1147;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _837 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1183 = _1039 + _1133;
    out.m_64.x = _1145;
    out.m_64.y = _1143;
    bool _1185 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1187 = isnan(_1149);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1193 = _1189 || _1191;
    out.m_66.x = _1173;
    out.m_66.y = _1175;
    out.m_66.z = _1177;
    out.m_66.w = _1167;
    out.m_68.x = _1169;
    out.m_68.y = _1171;
    out.m_68.z = _1179;
    out.m_68.w = _1181;
    out.m_70.x = _1163;
    out.m_70.y = _1165;
    out.m_70.z = _1183;
    float _1195 = _1133;
    float _1197 = _1167;
    float _1199 = _1179;
    float _1201 = _1169;
    float _1203 = _1131;
    if (!_1193)
    {
        _1195 = 1.0;
    }
    float _1205 = _1195;
    bool _1207 = !_1193;
    float _1209 = _1205;
    if (!_1207)
    {
        bool _1211 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1213 = isnan(_1149);
        bool _1215 = _1211 || _1213;
        bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1219 = _1215 || _1217;
        if (!_1219)
        {
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = _1149 + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1227 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1225;
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1233 = 1.0 / _1227;
            float _1235 = _1223 * _1233;
            float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1209 = _1237;
            _1239 = true;
        }
        else
        {
            bool _1241 = _1149 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1243 = isnan(_1149);
            bool _1245 = _1241 || _1243;
            bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1249 = _1245 || _1247;
            if (!_1249)
            {
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1149 + _1251;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1263 = 1.0 / _1257;
                float _1265 = _1253 * _1263;
                float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1209 = _1267;
                _1239 = true;
            }
            else
            {
                _1209 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1239 = false;
    float _1269 = _1209;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1273 = _1113 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1277 = _1119 + _1275;
    float _1279 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1283 = _1121 + _1281;
    float _1285 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1279 + _1287;
    float _1291 = fma(_1283, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1295 = _1285 + _1293;
    float _1297 = _1289 * _1289;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1291 + _1299;
    float _1303 = fma(_1295, _1295, _1297);
    float _1305 = fma(_1301, _1301, _1303);
    float _1307 = rsqrt(_1305);
    float _1309 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1311 = _1295 * _1309;
    float _1313 = _1301 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 * _1313;
    float _1319 = _1315 + _1317;
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1321 + _1325;
    float _1329 = _1301;
    float _1331 = _1327;
    float _1333 = _1289;
    if (_1323)
    {
        float _1335 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1335;
    }
    float _1337 = _1329;
    if (_1323)
    {
        float _1339 = rsqrt(_1319);
        _1197 = _1339;
    }
    float _1341 = _1197;
    float _1343 = _1341;
    if (_1323)
    {
        float _1345 = _1327 * _1337;
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (_1323)
    {
        float _1349 = _1347 * 0.15915493667125701904296875;
        _1199 = _1349;
    }
    float _1351 = _1199;
    float _1353 = _1297;
    if (_1323)
    {
        float _1355 = _1351 * 6.283185482025146484375;
        float _1357 = sin(_1355);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1363 = precise::max(0.0, _1361);
    float _1365 = _1307;
    float _1367 = _1361;
    float _1369 = _1363;
    if (_1323)
    {
        float _1371 = _1351 * 6.283185482025146484375;
        float _1373 = cos(_1371);
        _1365 = _1373;
    }
    float _1375 = _1365;
    float _1377 = -_1309;
    float _1379 = -_1363;
    float _1381 = fma(_1289, _1377, _1379);
    if (_1323)
    {
        float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1367 = _1383;
    }
    float _1385 = _1367;
    float _1387 = _1359;
    if (_1323)
    {
        float _1389 = fma(_1359, _1385, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1201 = _1389;
    }
    float _1391 = _1201;
    float _1393 = _1391;
    if (!_1323)
    {
        _1387 = _1381;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    float _1399 = _1375;
    if (_1323)
    {
        float _1401 = _1375 + (-1.0);
        _1333 = _1401;
    }
    float _1403 = _1333;
    float _1405 = _1403;
    if (_1323)
    {
        float _1407 = _1341 * _1391;
        _1203 = _1407;
    }
    float _1409 = _1203;
    if (!_1323)
    {
        _1343 = _1311;
    }
    float _1411 = _1343;
    float _1413 = _1411;
    if (_1323)
    {
        float _1415 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1415;
    }
    float _1417 = _1369;
    if (_1323)
    {
        float _1419 = _1311 * _1409;
        _1413 = _1419;
    }
    float _1421 = _1413;
    if (!_1323)
    {
        _1405 = _1313;
    }
    float _1423 = _1405;
    float _1425 = _1423;
    if (_1323)
    {
        float _1427 = _1313 * _1409;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1323)
    {
        float _1431 = fma(_1381, _1375, _1417);
        _1397 = _1431;
    }
    float _1433 = _1397;
    if (!_1323)
    {
        _1399 = _1315;
    }
    float _1435 = _1399;
    float _1437 = sqrt(_1305);
    float _1439 = _1435;
    if (_1323)
    {
        float _1441 = _1421 * _1421;
        _1439 = _1441;
    }
    float _1443 = _1439;
    if (!_1323)
    {
        _1393 = _1317;
    }
    float _1445 = _1393;
    float _1447 = _1445;
    if (_1323)
    {
        float _1449 = _1429 * _1429;
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = fma(_1433, _1433, _1443);
    float _1455 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1457 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1459 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1461 = _1453 + _1451;
    float _1463 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1455);
    float _1465 = fma(_927, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1467 = rsqrt(_1461);
    float _1469 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1473 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1471);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1479 = -_1475;
    float _1481 = _1479 + 1.0;
    float _1483 = floor(_1457);
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1487 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1491 = -_1487;
    float _1493 = fma(_1491, _1485, 1.0);
    float _1495 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1497 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1499 = _1467 * _1433;
    float _1501 = _1467 * _1421;
    float _1503 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1505 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1497);
    float _1507 = abs(_1481);
    float _1509 = log2(_1507);
    float _1511 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1513 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1515 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1517 = _1467 * _1429;
    float _1519 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1459);
    float _1521 = -_1511;
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1521);
    float _1525 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1529 = floor(_1465);
    float _1531 = -_1517;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1523);
    float _1535 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1519);
    float _1537 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1527);
    float _1539 = -_1483;
    float _1541 = _1457 + _1539;
    float _1543 = fma(_1533, -0.5, 0.5);
    float _1545 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1537);
    float _1547 = log2(_1493);
    float _1549 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1551 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = exp2(_1549);
    float _1555 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1557 = fma(_1533, 0.5, 0.5);
    float _1559 = -_1529;
    float _1561 = _1465 + _1559;
    float _1563 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1545);
    float _1565 = fma(_1557, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1567 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1569 = sqrt(_1543);
    float _1571 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1573 = _1499 + 1.0;
    float _1575 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1577 = fma(_1557, _1565, -0.212114393711090087890625);
    float _1579 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1571);
    float _1581 = 1.0 / _1563;
    float _1583 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1585 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
    float _1587 = -_1499;
    float _1589 = fma(_1553, _1573, _1587);
    float _1591 = _1547 * 0.693147182464599609375;
    float _1593 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1583);
    float2 _4596 = float2(_1541, _1561);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4596, float2(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4596, float2(0.0), isnan(_4596)), level(0.0)).x;
    float _1597 = fma(_1557, _1577, 1.570728778839111328125);
    float _1599 = _1569 * 0.636619746685028076171875;
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1603 = fma(_1589, 0.5, 0.5);
    float _1605 = -_1597;
    float _1607 = fma(_1599, _1605, 1.0);
    float _1609 = _1585 * _1581;
    float _1611 = _1593 * _1581;
    float _1613 = fma(_1609, 0.5, 0.5);
    float _1615 = fma(_1611, -0.5, 0.5);
    float3 _4635 = float3(_1613, _1615, _1601);
    float _1617 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4635, float3(0.0), isnan(_4635)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4635, float3(0.0), isnan(_4635)), level(0.0)).x;
    float3 _4646 = float3(_1613, _1615, _1601);
    float4 _1620 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4646, float3(0.0), isnan(_4646)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4646, float3(0.0), isnan(_4646)), level(0.0)).xyzw;
    float _1622 = _1620.x;
    float _1624 = _1620.y;
    float _1626 = _1620.z;
    float _1628 = _1620.w;
    float2 _4662 = float2(_1607, _1603);
    float3 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4662, float2(0.0), isnan(_4662)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4662, float2(0.0), isnan(_4662)), level(0.0)).xyz;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1642 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1644 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1646 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1648 = isnan(_1437);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1654 = _1650 || _1652;
    float _1656 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1640);
    float _1658 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1660 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1642);
    float _1662 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1656);
    float _1664 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1658);
    float _1666 = exp2(_1644);
    float _1668 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1660);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1672 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1664);
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1676 = 1.0 / _1670;
    float _1678 = _1674 + _1670;
    float _1680 = -_1666;
    float _1682 = _1680 + 1.0;
    float _1684 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1686 = _1678 * _1676;
    float _1688 = _1686 * 0.5;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1692 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1690);
    float _1694 = 1.0 / _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1698 = _1694 * _1696;
    float _1700 = abs(_1698);
    float _1702 = log2(_1700);
    bool _1704 = _1698 <= 8000.0;
    bool _1706 = isnan(_1698);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(8000.0);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1718 = exp2(_1716);
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1722 = precise::clamp(_1720, 0.0, 1.0);
    float _1724 = fma(_1722, -2.0, 3.0);
    float _1726 = _1722 * _1722;
    float _1728 = _1726 * _1724;
    float _1730 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1668);
    float _1732 = in.m_72.x;
    float _1734 = -_1728;
    float _1736 = _1734 + 1.0;
    float _1738 = _1730 + _1563;
    float _1740 = fma(_1736, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1728);
    float _1742 = _1738 * 0.5;
    float _1744 = _1738;
    float _1746 = _1563;
    float _1748 = _1730;
    float _1750 = _1593;
    if (!_1654)
    {
        _1744 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1752 = _1744;
    float _1754 = _1714 * _1740;
    out.gl_Position.x = _1585;
    out.gl_Position.y = _1593;
    out.gl_Position.z = _1730;
    out.gl_Position.w = _1563;
    float _1756 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_74.z = _1742;
    out.m_74.w = _1563;
    float _1758 = -_1684;
    float _1760 = _1758 + 1.0;
    float _1762 = _1760;
    float _1764 = _1752;
    float _1766 = _1752;
    if (!_1654)
    {
        _1746 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1768 = _1746;
    float _1770 = _1768;
    float _1772 = _1768;
    if (!_1654)
    {
        _1748 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1774 = _1748;
    float _1776 = _1774;
    float _1778 = _1774;
    if (!_1654)
    {
        _1750 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1780 = _1750;
    float _1782 = -_1595;
    float _1784 = _1782 + 1.0;
    float _1786 = _1784 * _1756;
    float _1788 = precise::clamp(_1786, 0.0, 1.0);
    float _1790 = -_1788;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1794 = _1792 * _1732;
    float _1796 = _1794 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1798 = _1684 * _1617;
    float _1800 = _1628 * _1760;
    out.m_76.x = _1796;
    float _1802 = _1622;
    float _1804 = _1780;
    float _1806 = _1780;
    if (!_1654)
    {
        _1762 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1808 = _1762;
    float _1810 = _1628 * _1798;
    float _1812 = _1638 * _1798;
    float _1814 = fma(_1634, _1810, _1622);
    float _1816 = fma(_1636, _1810, _1624);
    float _1818 = fma(_1628, _1812, _1626);
    float _1820 = _1808;
    float _1822 = _1808;
    if (!_1654)
    {
        _1802 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1824 = _1802;
    out.m_78.x = _1814;
    out.m_78.y = _1816;
    out.m_78.z = _1818;
    out.m_78.w = _1800;
    bool _1826 = !_1654;
    float _1828 = _1824;
    float _1830 = _1824;
    if (!_1826)
    {
        bool _1832 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1834 = isnan(_1437);
        bool _1836 = _1832 || _1834;
        bool _1838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1840 = _1836 || _1838;
        if (!_1840)
        {
            float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1844 = _1437 + _1842;
            float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1846;
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1854 = 1.0 / _1848;
            float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1858 = _1856 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1872 = _1844 * _1854;
            float _1874 = precise::clamp(_1872, 0.0, 1.0);
            float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1880 = fma(_1874, _1852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1882 = fma(_1874, _1878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1884 = fma(_1874, _1858, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1886 = fma(_1874, _1862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1888 = fma(_1874, _1866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1890 = fma(_1874, _1870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1772 = _1884;
            _1822 = _1888;
            _1830 = _1880;
            _1806 = _1886;
            _1778 = _1882;
            _1766 = _1890;
            _1892 = true;
        }
        else
        {
            bool _1894 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1896 = isnan(_1437);
            bool _1898 = _1894 || _1896;
            bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1902 = _1898 || _1900;
            if (!_1902)
            {
                _1828 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1904 = _1828;
            _1830 = _1904;
            if (!_1902)
            {
                _1770 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1906 = _1770;
            _1772 = _1906;
            if (!_1902)
            {
                _1776 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1908 = _1776;
            _1778 = _1908;
            if (!_1902)
            {
                _1804 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1910 = _1804;
            _1806 = _1910;
            if (!_1902)
            {
                _1820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1912 = _1820;
            _1822 = _1912;
            if (!_1902)
            {
                _1764 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1914 = _1764;
            bool _1916 = !_1902;
            _1766 = _1914;
            if (!_1916)
            {
                bool _1918 = _1437 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1920 = isnan(_1437);
                bool _1922 = _1918 || _1920;
                bool _1924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1926 = _1922 || _1924;
                if (!_1926)
                {
                    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1930 = _1437 + _1928;
                    float _1932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1932;
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1940 = 1.0 / _1934;
                    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1944 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1958 = _1930 * _1940;
                    float _1960 = precise::clamp(_1958, 0.0, 1.0);
                    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1964 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1966 = fma(_1960, _1938, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1968 = fma(_1960, _1964, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1970 = fma(_1960, _1944, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1972 = fma(_1960, _1948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1974 = fma(_1960, _1952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1976 = fma(_1960, _1956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1772 = _1970;
                    _1822 = _1974;
                    _1830 = _1966;
                    _1806 = _1972;
                    _1778 = _1968;
                    _1766 = _1976;
                    _1892 = true;
                }
                else
                {
                    _1772 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1830 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1806 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1778 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1766 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1892 = false;
    float _1978 = _1772;
    float _1980 = _1822;
    float _1982 = _1830;
    float _1984 = _1806;
    float _1986 = _1778;
    float _1988 = _1766;
    float _1990 = fma(_1165, -0.5, 0.5);
    float _1992 = precise::clamp(_1990, 0.0, 1.0);
    float _1994 = -_1978;
    float _1996 = _1994 + _1980;
    float _1998 = -_1982;
    float _2000 = _1998 + _1984;
    float _2002 = -_1986;
    float _2004 = _2002 + _1988;
    bool _2006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2008 = fma(_1992, _1996, _1978);
    float _2010 = fma(_1992, _2000, _1982);
    float _2012 = fma(_1992, _2004, _1986);
    float _2014 = _2008 * 0.586610972881317138671875;
    out.m_80.x = 0.0;
    float _2016 = fma(_2010, 0.298911988735198974609375, _2014);
    float _2018 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2020 = fma(_2012, 0.114477999508380889892578125, _2016);
    out.m_51.x = _2018;
    float _2022 = -_2020;
    float _2024 = _2010 + _2022;
    float _2026 = -_2020;
    float _2028 = _2008 + _2026;
    float _2030 = -_2020;
    float _2032 = _2012 + _2030;
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    float _2036 = fma(_2028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    float _2038 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2020);
    out.m_82.x = _2034;
    out.m_82.y = _2036;
    out.m_82.z = _2038;
    if (!_2006)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2040 = -_1279;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2044 = -_1285;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2048 = -_1291;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = sqrt(_2056);
    float _2060 = rsqrt(_2056);
    float _2062 = -_2058;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2066 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2068 = precise::clamp(_2066, 0.0, 1.0);
    float _2070 = _2046 * _2060;
    float _2072 = _2042 * _2060;
    float _2074 = abs(_2068);
    float _2076 = log2(_2074);
    float _2078 = _2050 * _2060;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2082 = _1165 * _2072;
    float _2084 = -_2072;
    float _2086 = -_2080;
    float _2088 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2086);
    float _2090 = fma(_1163, _2070, _2082);
    float _2092 = -_2078;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2088);
    float _2096 = fma(_1183, _2078, _2090);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2102 = _2094 + _2100;
    float _2104 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2106 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = exp2(_2104);
    float _2112 = _2110 * _2108;
    float _2114 = _2098 * _2112;
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2118 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_80.x = _2116;
    out.m_80.y = _2118;
    out.m_80.z = _2120;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

