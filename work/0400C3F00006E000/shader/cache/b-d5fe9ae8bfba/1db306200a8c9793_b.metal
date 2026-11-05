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
    float4 m_66 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_70 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2152 = false;
    bool _641 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2644 = as_type<float>(_105);
        out.gl_Position.z = _2644;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2714 = as_type<float>(_143);
        out.gl_Position.z = _2714;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = 0.0;
    float _169 = _153;
    if (!_163)
    {
        float _171 = _153 * _153;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _177 * 6.283185482025146484375;
    float _193 = floor(_177);
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    bool _209 = !_197;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = -_193;
    float _219 = _177 + _217;
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_163;
    float _227 = _183;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _153 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _153);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_163;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _153 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _169 = _281;
    }
    float _283 = _169;
    float _285 = fma(_215, 0.5, 0.5);
    float _287 = in.m_56.w;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = in.m_44.x;
    float _303 = in.m_44.y;
    float _305 = in.m_44.z;
    float _307 = -_219;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _311 = !_291;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_207;
    int _323 = _321 ? 0 : 1;
    float _325 = -_285;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _185, _315);
    bool _333 = !_295;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _343 = abs(_335);
    float _345 = fma(_283, _187, _337);
    int _347 = abs(_323);
    float _349 = fma(_283, _189, _341);
    float _351 = float(_329);
    float _353 = float(_347);
    float _355 = abs(_309);
    float _357 = _351 * _355;
    float _359 = fma(_331, _287, _301);
    float _361 = float(_343);
    float _363 = fma(_353, _327, _357);
    float _365 = fma(_345, _287, _303);
    float _367 = fma(_349, _287, _305);
    float _369 = abs(_319);
    float _371 = fma(_361, _369, _363);
    bool _373 = !_339;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = 1.0 / _411;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _429 = 1.0 / _415;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = _399 + _431;
    float _435 = 1.0 / _419;
    float _437 = _403 * _425;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _441 = _399 + _439;
    float _443 = 1.0 / _423;
    float _445 = _407 * _429;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    bool _451 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _453 = isnan(_399);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_449, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = _433 * _435;
    bool _467 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _469 = isnan(_399);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_461;
    float _481 = _479 + 1.0;
    bool _483 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _485 = isnan(_399);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -_477;
    float _497 = _495 + 1.0;
    float _499 = _441 * _443;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _501;
    float _505 = _461 * _497;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = fma(_503, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _517 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _519 = isnan(_399);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = fma(_513, _445, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _533 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _535 = isnan(_399);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    float _549 = _527 * _481;
    float _551 = -_527;
    float _553 = _551 + 1.0;
    float _555 = _493 * _553;
    float _557 = -_493;
    float _559 = _557 + 1.0;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = _543 * _559;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _571;
    float _575 = _515 * _565;
    float _577 = _463 * _565;
    float _579 = fma(_569, _465, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _581 = fma(_573, _465, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _583 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _585 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _595 = fma(_529, _555, _583);
    float _597 = fma(_531, _555, _585);
    float _599 = fma(_589, _499, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_593, _499, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = fma(_579, _549, _595);
    float _605 = fma(_581, _549, _597);
    float _607 = fma(_599, _505, _603);
    float _609 = fma(_601, _505, _605);
    float _611 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].x, _607);
    float _613 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].y, _609);
    float _615 = _611 * _545;
    float _617 = _613 * _547;
    bool _619 = !_427;
    float _637;
    float _639;
    if (!_619)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _623 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _625 = float(_89);
        float _627 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _629 = _627 * _621;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = _625;
        _641 = true;
    }
    else
    {
        float _643 = float(_89);
        float _645 = 1.0 / _643;
        float _647 = _123 * _645;
        _637 = _647;
        _639 = _643;
    }
    _641 = false;
    float _649 = _637;
    float _651 = _639;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _655 = int(_653);
    float _657 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _659 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _657);
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _663 = int(_661);
    bool _665 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _667 = isnan(_649);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _651;
    float _679 = float(_655);
    float _681 = 1.0 / _679;
    float _683 = float(uint(_663));
    int _685 = ~_663;
    int _687 = _685 + 1;
    float _689 = 1.0 / _683;
    float _691 = _681 * _123;
    int _693 = ~_663;
    int _695 = _693 + 1;
    float _697 = trunc(_691);
    int _699 = int(_697);
    int _701 = as_type<int>(_689) + (-2);
    float _703 = float(uint(_699));
    float _705 = as_type<float>(_701) * _703;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _712 = uint(_709);
    int _714 = ~_663;
    int _716 = _714 + 1;
    int _718 = _695 * int(_712);
    int _720 = _718 + _699;
    float _722 = float(uint(_720));
    float _724 = as_type<float>(_701) * _722;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _728 = _726 != 0;
    float _730 = trunc(_724);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    bool _736 = !_728;
    float _738 = _736 ? 7.345489978790283203125 : 1.0;
    float _740 = _738 * _145;
    float _742 = floor(_740);
    int _744 = int(_712) + int(_734);
    float _746 = float(_663);
    float _748 = float(_699);
    int _750 = _716 * _744;
    int _752 = _750 + _699;
    bool _754 = _748 >= _746;
    bool _756 = isnan(_748);
    bool _758 = _754 || _756;
    bool _760 = isnan(_746);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    bool _766 = uint(_752) >= uint(_663);
    float _768 = -_742;
    float _770 = _740 + _768;
    float _772 = trunc(_764);
    int _774 = int(_772);
    bool _776 = !_766;
    int _778 = _776 ? 0 : (-1);
    bool _780 = _663 == 0;
    int _782 = ~_744;
    int _784 = _782 + _778;
    int _786 = _784 + 1;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _798 = _796 != 0;
    int _800 = _663 * _786;
    int _802 = _800 + _699;
    bool _804 = !_790;
    int _806 = _804 ? 0 : 1;
    bool _808 = !_780;
    int _810 = _808 ? _802 : (-1);
    float _812 = _770 * _746;
    int _814 = ~_774;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = _746 * _123;
    int _822 = _810 * _818;
    float _824 = _820 * _677;
    int _826 = _663 + (-1);
    float _828 = trunc(_812);
    int _830 = int(_828);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _834 = _832 != 0;
    int _836 = abs(_806);
    int _838 = _774 * _826;
    int _840 = _838 + _822;
    bool _842 = !_794;
    int _844 = _842 ? 0 : 1;
    bool _846 = !_834;
    int _848 = _846 ? 0 : 1;
    float _850 = trunc(_824);
    int _852 = int(_850);
    int _854 = abs(_844);
    bool _856 = !_798;
    int _858 = _856 ? 0 : 1;
    int _860 = abs(_848);
    int _862 = _840 * _854;
    int _864 = abs(_858);
    float _866 = _145 * 2.0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _870 = _868 != 0;
    int _872 = _830 * _860;
    int _874 = _872 + _699;
    float _876 = floor(_866);
    bool _878 = !_870;
    int _880 = _878 ? 0 : 1;
    int _882 = _852 * _836;
    int _884 = _882 + _862;
    int _886 = abs(_880);
    int _888 = ~_663;
    int _890 = _888 + 1;
    int _892 = _874 * _864;
    int _894 = _892 + _884;
    int _896 = ~_663;
    int _898 = _896 + 1;
    float _900 = in.m_51.z;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _904 = _902 != 0;
    int _906 = _830 * _886;
    int _908 = _906 + _894;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _912 = _910 != 0;
    float _914 = in.m_51.y;
    float _916 = float(uint(_908));
    float _918 = as_type<float>(_701) * _916;
    float _920 = trunc(_918);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    int _926 = _890 * int(_924);
    int _928 = _926 + _908;
    float _930 = float(uint(_928));
    float _932 = as_type<float>(_701) * _930;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _936 = trunc(_932);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = int(_924) + int(_940);
    float _944 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _946 = _898 * _942;
    int _948 = _946 + _908;
    float _950 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _944);
    bool _952 = uint(_948) >= uint(_663);
    float _954 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _956 = !_952;
    int _958 = _956 ? 0 : (-1);
    float _960 = fma(_954, -2.0, _934);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _964 = _962 != 0;
    int _966 = ~_942;
    int _968 = _966 + _958;
    int _970 = _968 + 1;
    float _972 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _974 = log2(_972);
    int _976 = _663 * _970;
    int _978 = _976 + _908;
    float _980 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _982 = !_780;
    int _984 = _982 ? _978 : (-1);
    float _986 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _980);
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _990 = _984 & 3;
    bool _992 = _990 != 0;
    int _994 = _984 & 3;
    bool _996 = _994 != 0;
    float _998 = _974 * _123;
    bool _1000 = uint(_990) > 1u;
    float _1002 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1004 = _996 ? 0 : 1;
    bool _1006 = _145 > 0.5;
    float _1008 = exp2(_998);
    float _1010 = -_988;
    float _1012 = fma(_1002, 2.0, _1010);
    int _1014 = ~_1004;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    float _1020 = -_211;
    int _1022 = _1006 ? as_type<int>(_1020) : as_type<int>(_211);
    bool _1024 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1026 = isnan(1.0);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1032 = _1028 || _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1036 = 1.0 + _1034;
    int _1038 = _1018;
    if (!_1000)
    {
        int _1040 = ~_1004;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1046;
    bool _1050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1052 = isnan(0.0);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1058 = _1054 || _1056;
    float _1060 = 1.0 / _1036;
    bool _1062 = !_904;
    float _1064 = _1062 ? _211 : as_type<float>(_1022);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1070 = -_1008;
    float _1072 = _1070 + 1.0;
    bool _1074 = _876 > 0.0;
    float _1076 = 1.0 / _1048;
    float _1078 = _1058 ? _1072 : 0.0;
    bool _1080 = _876 >= 0.0;
    bool _1082 = isnan(_876);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = _914 * 2.0;
    float _1092 = 1.0 / _1068;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1106 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1108 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1110 = -_123;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1012);
    float _1114 = floor(_1090);
    float _1116 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1106);
    float _1118 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _960);
    float _1120 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1108);
    if (_1032)
    {
        float _1122 = _1078 * _1060;
        _125 = _1122;
    }
    float _1124 = _125;
    float _1126 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _986);
    int _1128 = _1088 ? 0 : 1;
    float _1130 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _950);
    float _1132 = _900 * 2.0;
    bool _1134 = _914 > 0.5;
    float _1136 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _659);
    int _1138 = ~_1128;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1146 = _649 + _1144;
    int _1148 = _1142;
    if (!_1074)
    {
        int _1150 = ~_1128;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = _914 + _900;
    float _1158 = floor(_1132);
    bool _1160 = _1114 > 0.0;
    float _1162 = _1146 * _1076;
    float _1164 = -_223;
    int _1166 = _1134 ? as_type<int>(_1164) : as_type<int>(_223);
    float _1168 = _145 + _914;
    bool _1170 = _1114 >= 0.0;
    bool _1172 = isnan(_1114);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1182 = _649 + _1180;
    bool _1184 = !_912;
    float _1186 = _1184 ? _223 : as_type<float>(_1166);
    float _1188 = _1168 + (-1.0);
    int _1190 = _1178 ? 0 : 1;
    float _1192 = _1182 * _1092;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = _1156 + (-1.0);
    int _1208 = ~_1190;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _1216 = _1212;
    if (!_1160)
    {
        int _1218 = ~_1190;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = -_1120;
    float _1226 = _1224 + 1.0;
    bool _1228 = _1158 >= 0.0;
    bool _1230 = isnan(_1158);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan(0.0);
    bool _1236 = _1232 || _1234;
    float _1238 = -_1116;
    float _1240 = _1238 + 1.0;
    int _1242 = _984 >> 31;
    float _1244 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1246 = _1236 ? 0 : 1;
    float _1248 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1250 = _1158 > 0.0;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1252;
    float _1256 = float(uint(_874));
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1258;
    int _1262 = _1242 & 3;
    float _1264 = fma(_1254, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1266 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1268 = isnan(_649);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = fma(_1260, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1280 = _984 + _1262;
    float _1282 = as_type<float>(_701) * _1256;
    bool _1284 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1286 = isnan(_649);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1276;
    float _1298 = _1296 + 1.0;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1304 = trunc(_1282);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1314 = _1294 * _1298;
    int _1316 = _1280 >> 2;
    float _1318 = -_1294;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1302, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1324 = float(_1154);
    int _1326 = _1316 << 4;
    int _1328 = _1326 + 368;
    float _1330 = _675 * _1320;
    float _1332 = _1064 + 0.5;
    float _1334 = -_675;
    float _1336 = _1334 + 1.0;
    uint _1338 = uint(int(uint(_1328) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[int(_1348)][_1350];
    float _1354 = _1278 * _1330;
    float _1356 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1112);
    float _1358 = _1186 + (-0.5);
    int _1360 = _687 * int(_1308);
    int _1362 = _1360 + _874;
    float _1364 = _1264 * _1330;
    float _1366 = _1214 * _1330;
    float _1368 = -_1358;
    float _1370 = -_1118;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1370);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1354);
    float _1376 = float(uint(_1362));
    int _1378 = _1328 + 8;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    uint _1382 = uint(int(uint(int(_1380)) >> uint(2)));
    int _1384 = int(_1380) & 3;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[int(_1382)][_1384];
    int _1388 = int(_1380) + 1;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    int _1392 = _1388 & 3;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[int(_1390)][_1392];
    float _1396 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1364);
    float _1398 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1366);
    bool _1400 = !_992;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = as_type<float>(_701) * _1376;
    bool _1406 = uint(_990) >= 2u;
    float _1408 = fma(_1322, _1314, _1396);
    float _1410 = fma(_1312, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1412 = fma(_1104, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    int _1414 = _1406 ? 0 : 1;
    float _1416 = trunc(_1404);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    bool _1422 = _990 != 3;
    float _1424 = fma(_1410, _1314, _1374);
    float _1426 = fma(_1412, _1314, _1398);
    int _1428 = ~_663;
    int _1430 = _1428 + 1;
    float _1432 = fma(_1186, _1226, _1372);
    float _1434 = -_1240;
    float _1436 = fma(_1064, _1434, _1356);
    int _1438 = ~_1414;
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    float _1444 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1408);
    float _1446 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1424);
    int _1448 = ~_1246;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    out.m_58.x = _1436;
    out.m_58.y = _1432;
    int _1454 = _1452;
    int _1456 = _1442;
    if (!_1250)
    {
        int _1458 = ~_1246;
        int _1460 = _1458 + 1;
        _1454 = _1460;
    }
    int _1462 = _1454;
    float _1464 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1466 = as_type<float>(_1462);
    if (_1422)
    {
        int _1468 = ~_1414;
        int _1470 = _1468 + 1;
        _1456 = _1470;
    }
    int _1472 = _1456;
    int _1474 = int(_1308) + int(_1420);
    int _1476 = abs(_1044);
    bool _1478 = _990 != 3;
    int _1480 = _1430 * _1474;
    int _1482 = _1480 + _874;
    int _1484 = ~_1476;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1492 = abs(_1472);
    int _1494 = abs(_1402);
    int _1496 = _1488 * as_type<int>(_1352);
    bool _1498 = !_1478;
    int _1500 = _1498 ? 0 : (-1);
    bool _1502 = uint(_1482) >= uint(_663);
    int _1504 = abs(_1500);
    int _1506 = ~_1494;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    bool _1512 = !_1502;
    int _1514 = _1512 ? 0 : (-1);
    bool _1516 = !_1200;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = _1510 * as_type<int>(_1344);
    int _1522 = _1520 + _1496;
    int _1524 = ~_1492;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    int _1530 = ~_1474;
    int _1532 = _1530 + _1514;
    int _1534 = _1532 + 1;
    int _1536 = abs(_1518);
    int _1538 = _1528 * as_type<int>(_1386);
    int _1540 = _1538 + _1522;
    int _1542 = ~_1504;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _663 * _1534;
    int _1550 = _1548 + _874;
    float _1552 = _1130 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1554 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1426);
    bool _1556 = !_964;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = _1546 * as_type<int>(_1394);
    int _1562 = _1560 + _1540;
    float _1564 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1552 + _1566;
    float _1570 = float(_1536);
    int _1572 = abs(_1558);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1576 = _1564 + _1574;
    bool _1578 = !_1196;
    int _1580 = _1578 ? 0 : 1;
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1584 = _1570 * _1324;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1588 = _1490 + _1586;
    int _1590 = abs(_1580);
    float _1592 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1582);
    float _1594 = _1568 * _1568;
    float _1596 = float(_1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1592);
    float _1600 = float(_1462);
    float _1602 = fma(_1576, _1576, _1594);
    int _1604 = ~_1572;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    float _1610 = _1584 * (-2.0);
    bool _1612 = !_780;
    int _1614 = _1612 ? _1550 : (-1);
    float _1616 = _1596 * _1600;
    bool _1618 = _1598 >= 0.0;
    float _1620 = in.m_60.x;
    float _1622 = in.m_60.y;
    float _1624 = in.m_60.z;
    int _1626 = _1562 * _1608;
    float _1628 = fma(_1588, _1588, _1602);
    float _1630 = fma(_1248, _1610, _1248);
    int _1632 = _1614 * _1572;
    int _1634 = _1632 + _1626;
    float _1636 = _1444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1638 = rsqrt(_1628);
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1618)
    {
        _1466 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1642 = _1466;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1646 = float(_1634);
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1650 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1652 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1658 = as_type<int>(_1642);
    if (_1618)
    {
        float _1660 = _1642 * 5.0;
        _1658 = as_type<int>(_1660);
    }
    int _1662 = _1658;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1666 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1616 * (-2.0);
    if (_1618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4979 = as_type<float>(_1662);
        out.gl_Position.z = _4979;
    }
    float _1674 = fma(_1610, _1622, _1622);
    bool _1676 = !_1204;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = fma(_1244, _1672, _1244);
    out.m_62.x = _1646;
    out.m_64.x = _1652;
    out.m_64.y = _1654;
    out.m_64.z = _1656;
    float _1682 = _1624;
    if (_1618)
    {
        out.m_47.x = 0.0;
    }
    float _1684 = _1568 * _1638;
    float _1686 = _1576 * _1638;
    out.m_66.x = _1666;
    out.m_66.y = _1668;
    out.m_66.z = _1670;
    out.m_66.w = _1664;
    if (_1618)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1688 = -_1684;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1552);
    float _1692 = -_1686;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1696 = fma(_1672, _1620, _1620);
    float _1698 = _145 + (-0.5);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1706 = _1694 + _1704;
    int _1708 = abs(_1678);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1696);
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1714 = -_1684;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _1718 = -_1686;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1722 = _145 + _900;
    float _1724 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1712);
    float _1726 = _1588 * _1638;
    float _1728 = _1716 * _1716;
    float _1730 = _1722 + (-1.0);
    float _1732 = _914 + (-0.5);
    float _1734 = -_1726;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _1738 = fma(_1720, _1720, _1728);
    float _1740 = -_1726;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1588);
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1736 + _1744;
    float _1748 = float(_1708);
    float _1750 = fma(_1742, _1742, _1738);
    float _1752 = float(_1222);
    float _1754 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1724);
    float _1756 = _900 + (-0.5);
    float _1758 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1674);
    float _1760 = fma(_1680, _1124, _1710);
    float _1762 = _1748 * _1752;
    bool _1764 = _1754 >= 0.0;
    float _1766 = fma(_1630, _1124, _1758);
    float _1768 = _1760 * 0.15915493667125701904296875;
    float _1770 = _1762 * (-2.0);
    float _1772 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1774 = _1766 * 0.15915493667125701904296875;
    float _1776 = sqrt(_1750);
    float _1778 = fma(_1770, _1624, _1624);
    float _1780 = fma(_1772, _1770, _1772);
    float _1782 = _371 * _615;
    float _1784 = _371 * _617;
    float _1786 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1778);
    if (_1764)
    {
        _1682 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1788 = _1682;
    float _1790 = _1774 * 6.283185482025146484375;
    float _1792 = sin(_1790);
    float _1794 = fma(_1780, _1124, _1786);
    int _1796 = as_type<int>(_1788);
    if (_1764)
    {
        out.m_47.x = 0.0;
    }
    if (_1764)
    {
        float _1798 = _1788 * 5.0;
        _1796 = as_type<int>(_1798);
    }
    int _1800 = _1796;
    float _1802 = _1794 * 0.15915493667125701904296875;
    float _1804 = _1774 * 6.283185482025146484375;
    float _1806 = cos(_1804);
    if (_1764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5230 = as_type<float>(_1800);
        out.gl_Position.z = _5230;
    }
    float _1808 = _1768 * 6.283185482025146484375;
    float _1810 = sin(_1808);
    float _1812 = _1768 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = _1802 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    if (_1764)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1820 = _1802 * 6.283185482025146484375;
    float _1822 = cos(_1820);
    float _1824 = _1638 * _1776;
    float _1826 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1828 = _1784 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1834 = _1824 * _1826;
    float _1836 = _1824 * _1828;
    float _1838 = _1810 * _1792;
    float _1840 = _1830 * _1834;
    float _1842 = _1832 * _1836;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1846 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1844;
    float _1848 = _1814 * _1806;
    float _1850 = _1822 * _1842;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1854 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1852;
    float _1856 = _1846 * _1846;
    float _1858 = fma(_1818, _1848, _1838);
    float _1860 = _1814 * _1850;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1862;
    float _1866 = fma(_1854, _1854, _1856);
    float _1868 = fma(_1858, _1840, _1860);
    float _1870 = _1814 * _1792;
    float _1872 = _1792 * _1822;
    float _1874 = _1806 * _1822;
    float _1876 = _1810 * _1806;
    float _1878 = fma(_1864, _1864, _1866);
    float _1880 = -_1842;
    float _1882 = _1818 * _1880;
    float _1884 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1886 = _1884 * 0.5;
    float _1888 = -_1876;
    float _1890 = fma(_1818, _1870, _1888);
    float _1892 = sqrt(_1878);
    float _1894 = -_1870;
    float _1896 = fma(_1818, _1876, _1894);
    float _1898 = fma(_1874, _1840, _1882);
    float _1900 = _1810 * _1850;
    float _1902 = fma(_1890, _1886, _1868);
    float _1904 = fma(_1818, _1838, _1848);
    float _1906 = fma(_1872, _1886, _1898);
    float _1908 = fma(_1896, _1840, _1900);
    float _1910 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1914 = rsqrt(_1878);
    float _1916 = fma(_1904, _1886, _1908);
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    float _1920 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1912);
    float _1922 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1918);
    float _1924 = precise::max(_1892, 10.0);
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1920);
    float _1928 = _1892 * 0.039999999105930328369140625;
    float _1930 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1932 = precise::min(_1924, 50.0);
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1936 = precise::max(_1928, 1.0);
    float _1938 = _1564 + _1930;
    float _1940 = _1490 + _1934;
    float _1942 = fma(_1932, 0.25, -2.5);
    float _1944 = precise::min(_1936, 2.0);
    float _1946 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1948 = _1938 + _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1952 = _1940 + _1950;
    float _1954 = _1914 * _1942;
    float _1956 = fma(_1948, _1944, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1958 = fma(_1952, _1944, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1960 = -_1954;
    float _1962 = fma(_1854, _1960, _1956);
    float _1964 = -_1954;
    float _1966 = fma(_1864, _1964, _1958);
    float _1968 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1972 = _1962 + _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1976 = _1966 + _1974;
    float _1978 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1968);
    float _1980 = _1972 * _1972;
    float _1982 = _1976 * _1976;
    float _1984 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1978);
    float _1986 = _1980 + _1982;
    float _1988 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1990 = sqrt(_1986);
    float _1992 = _1552 + _1988;
    float _1994 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1996 = _1992 + _1994;
    float _1998 = fma(_1996, _1944, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2000 = -_1954;
    float _2002 = fma(_1846, _2000, _1998);
    bool _2004 = _1990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _1846;
    float _2008 = _1902;
    float _2010 = _1998;
    float _2012 = _1984;
    float _2014 = _1982;
    float _2016 = _1906;
    if (!_2004)
    {
        _2006 = _1980;
    }
    float _2018 = _2006;
    float _2020 = _2018;
    if (!_2004)
    {
        _2008 = _1962;
    }
    float _2022 = _2008;
    float _2024 = _2022;
    if (!_2004)
    {
        _2010 = _1966;
    }
    float _2026 = _2010;
    float _2028 = _2026;
    if (!_2004)
    {
        _2012 = _2002;
    }
    float _2030 = _2012;
    bool _2032 = !_2004;
    float _2034 = _2030;
    if (!_2032)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2040 = _1990 + _2038;
        float _2042 = rsqrt(_1986);
        float _2044 = _2040 * _2036;
        float _2046 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2048 = _2044 * 0.15915493667125701904296875;
        float _2050 = _2048 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = _2048 * 6.283185482025146484375;
        float _2056 = cos(_2054);
        float _2058 = fma(_2052, _2046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2060 = _2042 * _2058;
        float _2062 = _2056 + (-1.0);
        float _2064 = fma(_1972, _2060, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2066 = fma(_1976, _2060, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2072 = _2064 + _2070;
        float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2076 = _2066 + _2074;
        float _2078 = fma(_2002, _2056, _2068);
        float _2080 = _2072 * _2072;
        float _2082 = _2076 * _2076;
        _2034 = _2078;
        _2020 = _2080;
        _2014 = _2082;
        _2024 = _2064;
        _2028 = _2066;
    }
    float _2084 = _2034;
    float _2086 = _2020;
    float _2088 = _2014;
    float _2090 = _2024;
    float _2092 = _2028;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2096 = _2084 + _2094;
    out.m_66.x = _1666;
    out.m_66.y = _1668;
    out.m_66.z = _1670;
    out.m_66.w = _1664;
    float _2098 = fma(_2096, _2096, _2086);
    out.m_64.x = _1652;
    out.m_64.y = _1654;
    out.m_64.z = _1656;
    float _2100 = _2098 + _2088;
    float _2102 = sqrt(_2100);
    bool _2104 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2106 = isnan(_2102);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2112 = _2108 || _2110;
    float _2114 = _2086;
    float _2116 = _2084;
    if (!_2112)
    {
        _2114 = 1.0;
    }
    float _2118 = _2114;
    bool _2120 = !_2112;
    float _2122 = _2118;
    if (!_2120)
    {
        bool _2124 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2126 = isnan(_2102);
        bool _2128 = _2124 || _2126;
        bool _2130 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2132 = _2128 || _2130;
        if (!_2132)
        {
            float _2134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2136 = _2102 + _2134;
            float _2138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2140 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2138;
            float _2142 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2146 = 1.0 / _2140;
            float _2148 = _2136 * _2146;
            float _2150 = fma(_2148, _2144, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2122 = _2150;
            _2152 = true;
        }
        else
        {
            bool _2154 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2156 = isnan(_2102);
            bool _2158 = _2154 || _2156;
            bool _2160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2162 = _2158 || _2160;
            if (!_2162)
            {
                float _2164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2166 = _2102 + _2164;
                float _2168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2170 = _2168 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2172 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2174 = _2172 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2176 = 1.0 / _2170;
                float _2178 = _2166 * _2176;
                float _2180 = fma(_2178, _2174, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2122 = _2180;
                _2152 = true;
            }
            else
            {
                _2122 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2152 = false;
    float _2182 = _2122;
    float _2184 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2186 = _2084 + _2184;
    float _2188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2190 = _2090 + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2194 = _2092 + _2192;
    float _2196 = fma(_2186, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2198 = fma(_2190, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2200 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2202 = -_1684;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2196);
    float _2206 = -_1686;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2198);
    float _2210 = -_1726;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2200);
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2216 = _2204 + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2220 = _2208 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2224 = _2212 + _2222;
    float _2226 = _2216 * _2216;
    float _2228 = fma(_2220, _2220, _2226);
    float _2230 = fma(_2224, _2224, _2228);
    float _2232 = rsqrt(_2230);
    float _2234 = sqrt(_2230);
    float _2236 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2238 = _2220 * _2236;
    float _2240 = _2224 * _2236;
    float _2242 = _2238 * _2238;
    float _2244 = _2240 * _2240;
    float _2246 = _2242 + _2244;
    float _2248 = sqrt(_2246);
    bool _2250 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2254 = _2248 + _2252;
    float _2256 = _2232;
    float _2258 = _2246;
    float _2260 = _2254;
    float _2262 = _2216;
    float _2264 = _2238;
    if (_2250)
    {
        float _2266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2256 = _2266;
    }
    float _2268 = _2256;
    if (_2250)
    {
        float _2270 = rsqrt(_2246);
        _2258 = _2270;
    }
    float _2272 = _2258;
    if (_2250)
    {
        float _2274 = _2254 * _2268;
        _2260 = _2274;
    }
    float _2276 = _2260;
    if (_2250)
    {
        float _2278 = _2276 * 0.15915493667125701904296875;
        _2116 = _2278;
    }
    float _2280 = _2116;
    float _2282 = _2268;
    float _2284 = _2280;
    if (_2250)
    {
        float _2286 = _2280 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        _2282 = _2288;
    }
    float _2290 = _2282;
    float _2292 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2294 = precise::max(0.0, _2292);
    float _2296 = _2224;
    float _2298 = _2294;
    if (_2250)
    {
        float _2300 = _2280 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        _2296 = _2302;
    }
    float _2304 = _2296;
    float _2306 = -_2236;
    float _2308 = -_2294;
    float _2310 = fma(_2216, _2306, _2308);
    if (!_2250)
    {
        _2262 = _2240;
    }
    float _2312 = _2262;
    float _2314 = _2312;
    if (_2250)
    {
        float _2316 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2316;
    }
    float _2318 = _2298;
    float _2320 = _2290;
    float _2322 = _2318;
    if (_2250)
    {
        float _2324 = fma(_2290, _2318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2320 = _2324;
    }
    float _2326 = _2320;
    float _2328 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2330 = _2326;
    float _2332 = _2304;
    if (_2250)
    {
        float _2334 = _2304 + (-1.0);
        _2322 = _2334;
    }
    float _2336 = _2322;
    float _2338 = _2336;
    if (_2250)
    {
        float _2340 = _2272 * _2326;
        _2016 = _2340;
    }
    float _2342 = _2016;
    if (!_2250)
    {
        _2330 = _2310;
    }
    float _2344 = _2330;
    float _2346 = _2344;
    if (_2250)
    {
        float _2348 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2284 = _2348;
    }
    float _2350 = _2284;
    if (_2250)
    {
        float _2352 = _2238 * _2342;
        _2264 = _2352;
    }
    float _2354 = _2264;
    if (!_2250)
    {
        _2338 = _2242;
    }
    float _2356 = _2338;
    float _2358 = _2356;
    if (_2250)
    {
        float _2360 = _2240 * _2342;
        _2314 = _2360;
    }
    float _2362 = _2314;
    if (_2250)
    {
        float _2364 = fma(_2310, _2304, _2350);
        _2346 = _2364;
    }
    float _2366 = _2346;
    if (_2250)
    {
        float _2368 = _2354 * _2354;
        _2358 = _2368;
    }
    float _2370 = _2358;
    if (!_2250)
    {
        _2332 = _2244;
    }
    float _2372 = _2332;
    float _2374 = _2372;
    if (_2250)
    {
        float _2376 = _2362 * _2362;
        _2374 = _2376;
    }
    float _2378 = _2374;
    float _2380 = fma(_2366, _2366, _2370);
    float _2382 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2384 = _2380 + _2378;
    float _2386 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2390 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2388);
    float _2392 = precise::clamp(_2390, 0.0, 1.0);
    float _2394 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2396 = rsqrt(_2384);
    float _2398 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2386);
    float _2400 = -_2392;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2394);
    float _2406 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2382);
    float _2408 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2398);
    float _2410 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2412 = abs(_2402);
    float _2414 = log2(_2412);
    float _2416 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2418 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2410);
    float _2420 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2404);
    float _2422 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2406);
    float _2424 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2426 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2418);
    float _2428 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2430 = _2396 * _2354;
    float _2432 = -_2424;
    float _2434 = fma(_2432, _2328, 1.0);
    float _2436 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2438 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2440 = _2396 * _2366;
    float _2442 = _2396 * _2362;
    float _2444 = _2422 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2446 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2438);
    float _2448 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2450 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2452 = log2(_2434);
    float _2454 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2446);
    float _2456 = -_2448;
    float _2458 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2456);
    float _2460 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2462 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2454);
    float _2464 = -_2442;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2458);
    float _2468 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2470 = exp2(_2450);
    float _2472 = fma(_2466, -0.5, 0.5);
    float _2474 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2468);
    float _2476 = fma(_2466, 0.5, 0.5);
    float _2478 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2460);
    float _2480 = _2440 + 1.0;
    float _2482 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2474);
    float _2484 = 1.0 / _2462;
    float _2486 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2478);
    float _2488 = fma(_2476, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2490 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2482);
    float _2492 = _2452 * 0.693147182464599609375;
    float _2494 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2486);
    float _2496 = fma(_2476, _2488, -0.212114393711090087890625);
    float _2498 = sqrt(_2472);
    float _2500 = -_2440;
    float _2502 = fma(_2470, _2480, _2500);
    float _2504 = fma(_2476, _2496, 1.570728778839111328125);
    float _2506 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2508 = fma(_2502, 0.5, 0.5);
    float _2510 = _2490 * _2484;
    float _2512 = _2494 * _2484;
    float _2514 = fma(_2510, 0.5, 0.5);
    float _2516 = fma(_2512, -0.5, 0.5);
    float _2518 = _2498 * 0.636619746685028076171875;
    float3 _6417 = float3(_2514, _2516, _2506);
    float _2520 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6417, float3(0.0), isnan(_6417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6417, float3(0.0), isnan(_6417)), level(0.0)).x;
    float _2522 = -_2504;
    float _2524 = fma(_2518, _2522, 1.0);
    float3 _6433 = float3(_2514, _2516, _2506);
    float4 _2527 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6433, float3(0.0), isnan(_6433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6433, float3(0.0), isnan(_6433)), level(0.0)).xyzw;
    float _2529 = _2527.x;
    float _2531 = _2527.y;
    float _2533 = _2527.z;
    float _2535 = _2527.w;
    float2 _6450 = float2(_2524, _2508);
    float3 _2539 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6450, float2(0.0), isnan(_6450)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6450, float2(0.0), isnan(_6450)), level(0.0)).xyz;
    float _2541 = _2539.x;
    float _2543 = _2539.y;
    float _2545 = _2539.z;
    float _2547 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2549 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2551 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2549);
    float _2553 = exp2(_2547);
    float _2555 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2551);
    float _2557 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2555);
    float _2559 = _2557 + _2462;
    float _2561 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2490;
    out.gl_Position.y = _2494;
    out.gl_Position.z = _2557;
    out.gl_Position.w = _2462;
    float _2563 = _2559 * 0.5;
    float _2565 = -_2553;
    float _2567 = _2565 + 1.0;
    out.m_47.x = _2561;
    float _2569 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2563;
    out.m_68.w = _2462;
    float _2571 = _2569 * _2520;
    float _2573 = -_2569;
    float _2575 = _2573 + 1.0;
    float _2577 = _2535 * _2571;
    float _2579 = _2545 * _2571;
    float _2581 = fma(_2541, _2577, _2529);
    float _2583 = fma(_2543, _2577, _2531);
    float _2585 = _2535 * _2575;
    float _2587 = fma(_2535, _2579, _2533);
    out.m_70.x = _2581;
    out.m_70.y = _2583;
    out.m_70.z = _2587;
    out.m_70.w = _2585;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2152 = false;
    bool _641 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2644 = as_type<float>(_105);
        out.gl_Position.z = _2644;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2714 = as_type<float>(_143);
        out.gl_Position.z = _2714;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = 0.0;
    float _169 = _153;
    if (!_163)
    {
        float _171 = _153 * _153;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _177 * 6.283185482025146484375;
    float _193 = floor(_177);
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    bool _209 = !_197;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = -_193;
    float _219 = _177 + _217;
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_163;
    float _227 = _183;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _153 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _153);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_163;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _153 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _169 = _281;
    }
    float _283 = _169;
    float _285 = fma(_215, 0.5, 0.5);
    float _287 = in.m_56.w;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = in.m_44.x;
    float _303 = in.m_44.y;
    float _305 = in.m_44.z;
    float _307 = -_219;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _311 = !_291;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_207;
    int _323 = _321 ? 0 : 1;
    float _325 = -_285;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _185, _315);
    bool _333 = !_295;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _343 = abs(_335);
    float _345 = fma(_283, _187, _337);
    int _347 = abs(_323);
    float _349 = fma(_283, _189, _341);
    float _351 = float(_329);
    float _353 = float(_347);
    float _355 = abs(_309);
    float _357 = _351 * _355;
    float _359 = fma(_331, _287, _301);
    float _361 = float(_343);
    float _363 = fma(_353, _327, _357);
    float _365 = fma(_345, _287, _303);
    float _367 = fma(_349, _287, _305);
    float _369 = abs(_319);
    float _371 = fma(_361, _369, _363);
    bool _373 = !_339;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = 1.0 / _411;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _429 = 1.0 / _415;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = _399 + _431;
    float _435 = 1.0 / _419;
    float _437 = _403 * _425;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _441 = _399 + _439;
    float _443 = 1.0 / _423;
    float _445 = _407 * _429;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    bool _451 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _453 = isnan(_399);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_449, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = _433 * _435;
    bool _467 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _469 = isnan(_399);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_461;
    float _481 = _479 + 1.0;
    bool _483 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _485 = isnan(_399);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -_477;
    float _497 = _495 + 1.0;
    float _499 = _441 * _443;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _501;
    float _505 = _461 * _497;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = fma(_503, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _517 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _519 = isnan(_399);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = fma(_513, _445, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _533 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _535 = isnan(_399);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    float _549 = _527 * _481;
    float _551 = -_527;
    float _553 = _551 + 1.0;
    float _555 = _493 * _553;
    float _557 = -_493;
    float _559 = _557 + 1.0;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = _543 * _559;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _571;
    float _575 = _515 * _565;
    float _577 = _463 * _565;
    float _579 = fma(_569, _465, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _581 = fma(_573, _465, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _583 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _585 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _595 = fma(_529, _555, _583);
    float _597 = fma(_531, _555, _585);
    float _599 = fma(_589, _499, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_593, _499, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = fma(_579, _549, _595);
    float _605 = fma(_581, _549, _597);
    float _607 = fma(_599, _505, _603);
    float _609 = fma(_601, _505, _605);
    float _611 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].x, _607);
    float _613 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].y, _609);
    float _615 = _611 * _545;
    float _617 = _613 * _547;
    bool _619 = !_427;
    float _637;
    float _639;
    if (!_619)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _623 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _625 = float(_89);
        float _627 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _629 = _627 * _621;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = _625;
        _641 = true;
    }
    else
    {
        float _643 = float(_89);
        float _645 = 1.0 / _643;
        float _647 = _123 * _645;
        _637 = _647;
        _639 = _643;
    }
    _641 = false;
    float _649 = _637;
    float _651 = _639;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _655 = int(_653);
    float _657 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _659 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _657);
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _663 = int(_661);
    bool _665 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _667 = isnan(_649);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _651;
    float _679 = float(_655);
    float _681 = 1.0 / _679;
    float _683 = float(uint(_663));
    int _685 = ~_663;
    int _687 = _685 + 1;
    float _689 = 1.0 / _683;
    float _691 = _681 * _123;
    int _693 = ~_663;
    int _695 = _693 + 1;
    float _697 = trunc(_691);
    int _699 = int(_697);
    int _701 = as_type<int>(_689) + (-2);
    float _703 = float(uint(_699));
    float _705 = as_type<float>(_701) * _703;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _712 = uint(_709);
    int _714 = ~_663;
    int _716 = _714 + 1;
    int _718 = _695 * int(_712);
    int _720 = _718 + _699;
    float _722 = float(uint(_720));
    float _724 = as_type<float>(_701) * _722;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _728 = _726 != 0;
    float _730 = trunc(_724);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    bool _736 = !_728;
    float _738 = _736 ? 7.345489978790283203125 : 1.0;
    float _740 = _738 * _145;
    float _742 = floor(_740);
    int _744 = int(_712) + int(_734);
    float _746 = float(_663);
    float _748 = float(_699);
    int _750 = _716 * _744;
    int _752 = _750 + _699;
    bool _754 = _748 >= _746;
    bool _756 = isnan(_748);
    bool _758 = _754 || _756;
    bool _760 = isnan(_746);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    bool _766 = uint(_752) >= uint(_663);
    float _768 = -_742;
    float _770 = _740 + _768;
    float _772 = trunc(_764);
    int _774 = int(_772);
    bool _776 = !_766;
    int _778 = _776 ? 0 : (-1);
    bool _780 = _663 == 0;
    int _782 = ~_744;
    int _784 = _782 + _778;
    int _786 = _784 + 1;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _798 = _796 != 0;
    int _800 = _663 * _786;
    int _802 = _800 + _699;
    bool _804 = !_790;
    int _806 = _804 ? 0 : 1;
    bool _808 = !_780;
    int _810 = _808 ? _802 : (-1);
    float _812 = _770 * _746;
    int _814 = ~_774;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = _746 * _123;
    int _822 = _810 * _818;
    float _824 = _820 * _677;
    int _826 = _663 + (-1);
    float _828 = trunc(_812);
    int _830 = int(_828);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _834 = _832 != 0;
    int _836 = abs(_806);
    int _838 = _774 * _826;
    int _840 = _838 + _822;
    bool _842 = !_794;
    int _844 = _842 ? 0 : 1;
    bool _846 = !_834;
    int _848 = _846 ? 0 : 1;
    float _850 = trunc(_824);
    int _852 = int(_850);
    int _854 = abs(_844);
    bool _856 = !_798;
    int _858 = _856 ? 0 : 1;
    int _860 = abs(_848);
    int _862 = _840 * _854;
    int _864 = abs(_858);
    float _866 = _145 * 2.0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _870 = _868 != 0;
    int _872 = _830 * _860;
    int _874 = _872 + _699;
    float _876 = floor(_866);
    bool _878 = !_870;
    int _880 = _878 ? 0 : 1;
    int _882 = _852 * _836;
    int _884 = _882 + _862;
    int _886 = abs(_880);
    int _888 = ~_663;
    int _890 = _888 + 1;
    int _892 = _874 * _864;
    int _894 = _892 + _884;
    int _896 = ~_663;
    int _898 = _896 + 1;
    float _900 = in.m_51.z;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _904 = _902 != 0;
    int _906 = _830 * _886;
    int _908 = _906 + _894;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _912 = _910 != 0;
    float _914 = in.m_51.y;
    float _916 = float(uint(_908));
    float _918 = as_type<float>(_701) * _916;
    float _920 = trunc(_918);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    int _926 = _890 * int(_924);
    int _928 = _926 + _908;
    float _930 = float(uint(_928));
    float _932 = as_type<float>(_701) * _930;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _936 = trunc(_932);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = int(_924) + int(_940);
    float _944 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _946 = _898 * _942;
    int _948 = _946 + _908;
    float _950 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _944);
    bool _952 = uint(_948) >= uint(_663);
    float _954 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _956 = !_952;
    int _958 = _956 ? 0 : (-1);
    float _960 = fma(_954, -2.0, _934);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _964 = _962 != 0;
    int _966 = ~_942;
    int _968 = _966 + _958;
    int _970 = _968 + 1;
    float _972 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _974 = log2(_972);
    int _976 = _663 * _970;
    int _978 = _976 + _908;
    float _980 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _982 = !_780;
    int _984 = _982 ? _978 : (-1);
    float _986 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _980);
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _990 = _984 & 3;
    bool _992 = _990 != 0;
    int _994 = _984 & 3;
    bool _996 = _994 != 0;
    float _998 = _974 * _123;
    bool _1000 = uint(_990) > 1u;
    float _1002 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1004 = _996 ? 0 : 1;
    bool _1006 = _145 > 0.5;
    float _1008 = exp2(_998);
    float _1010 = -_988;
    float _1012 = fma(_1002, 2.0, _1010);
    int _1014 = ~_1004;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    float _1020 = -_211;
    int _1022 = _1006 ? as_type<int>(_1020) : as_type<int>(_211);
    bool _1024 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1026 = isnan(1.0);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1032 = _1028 || _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1036 = 1.0 + _1034;
    int _1038 = _1018;
    if (!_1000)
    {
        int _1040 = ~_1004;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1046;
    bool _1050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1052 = isnan(0.0);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1058 = _1054 || _1056;
    float _1060 = 1.0 / _1036;
    bool _1062 = !_904;
    float _1064 = _1062 ? _211 : as_type<float>(_1022);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1070 = -_1008;
    float _1072 = _1070 + 1.0;
    bool _1074 = _876 > 0.0;
    float _1076 = 1.0 / _1048;
    float _1078 = _1058 ? _1072 : 0.0;
    bool _1080 = _876 >= 0.0;
    bool _1082 = isnan(_876);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = _914 * 2.0;
    float _1092 = 1.0 / _1068;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1106 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1108 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1110 = -_123;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1012);
    float _1114 = floor(_1090);
    float _1116 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1106);
    float _1118 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _960);
    float _1120 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1108);
    if (_1032)
    {
        float _1122 = _1078 * _1060;
        _125 = _1122;
    }
    float _1124 = _125;
    float _1126 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _986);
    int _1128 = _1088 ? 0 : 1;
    float _1130 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _950);
    float _1132 = _900 * 2.0;
    bool _1134 = _914 > 0.5;
    float _1136 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _659);
    int _1138 = ~_1128;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1146 = _649 + _1144;
    int _1148 = _1142;
    if (!_1074)
    {
        int _1150 = ~_1128;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = _914 + _900;
    float _1158 = floor(_1132);
    bool _1160 = _1114 > 0.0;
    float _1162 = _1146 * _1076;
    float _1164 = -_223;
    int _1166 = _1134 ? as_type<int>(_1164) : as_type<int>(_223);
    float _1168 = _145 + _914;
    bool _1170 = _1114 >= 0.0;
    bool _1172 = isnan(_1114);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1182 = _649 + _1180;
    bool _1184 = !_912;
    float _1186 = _1184 ? _223 : as_type<float>(_1166);
    float _1188 = _1168 + (-1.0);
    int _1190 = _1178 ? 0 : 1;
    float _1192 = _1182 * _1092;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = _1156 + (-1.0);
    int _1208 = ~_1190;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _1216 = _1212;
    if (!_1160)
    {
        int _1218 = ~_1190;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = -_1120;
    float _1226 = _1224 + 1.0;
    bool _1228 = _1158 >= 0.0;
    bool _1230 = isnan(_1158);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan(0.0);
    bool _1236 = _1232 || _1234;
    float _1238 = -_1116;
    float _1240 = _1238 + 1.0;
    int _1242 = _984 >> 31;
    float _1244 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1246 = _1236 ? 0 : 1;
    float _1248 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1250 = _1158 > 0.0;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1252;
    float _1256 = float(uint(_874));
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1258;
    int _1262 = _1242 & 3;
    float _1264 = fma(_1254, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1266 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1268 = isnan(_649);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = fma(_1260, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1280 = _984 + _1262;
    float _1282 = as_type<float>(_701) * _1256;
    bool _1284 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1286 = isnan(_649);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1276;
    float _1298 = _1296 + 1.0;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1304 = trunc(_1282);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1314 = _1294 * _1298;
    int _1316 = _1280 >> 2;
    float _1318 = -_1294;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1302, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1324 = float(_1154);
    int _1326 = _1316 << 4;
    int _1328 = _1326 + 368;
    float _1330 = _675 * _1320;
    float _1332 = _1064 + 0.5;
    float _1334 = -_675;
    float _1336 = _1334 + 1.0;
    uint _1338 = uint(int(uint(_1328) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[int(_1348)][_1350];
    float _1354 = _1278 * _1330;
    float _1356 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1112);
    float _1358 = _1186 + (-0.5);
    int _1360 = _687 * int(_1308);
    int _1362 = _1360 + _874;
    float _1364 = _1264 * _1330;
    float _1366 = _1214 * _1330;
    float _1368 = -_1358;
    float _1370 = -_1118;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1370);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1354);
    float _1376 = float(uint(_1362));
    int _1378 = _1328 + 8;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    uint _1382 = uint(int(uint(int(_1380)) >> uint(2)));
    int _1384 = int(_1380) & 3;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[int(_1382)][_1384];
    int _1388 = int(_1380) + 1;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    int _1392 = _1388 & 3;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[int(_1390)][_1392];
    float _1396 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1364);
    float _1398 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1366);
    bool _1400 = !_992;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = as_type<float>(_701) * _1376;
    bool _1406 = uint(_990) >= 2u;
    float _1408 = fma(_1322, _1314, _1396);
    float _1410 = fma(_1312, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1412 = fma(_1104, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    int _1414 = _1406 ? 0 : 1;
    float _1416 = trunc(_1404);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    bool _1422 = _990 != 3;
    float _1424 = fma(_1410, _1314, _1374);
    float _1426 = fma(_1412, _1314, _1398);
    int _1428 = ~_663;
    int _1430 = _1428 + 1;
    float _1432 = fma(_1186, _1226, _1372);
    float _1434 = -_1240;
    float _1436 = fma(_1064, _1434, _1356);
    int _1438 = ~_1414;
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    float _1444 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1408);
    float _1446 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1424);
    int _1448 = ~_1246;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    out.m_58.x = _1436;
    out.m_58.y = _1432;
    int _1454 = _1452;
    int _1456 = _1442;
    if (!_1250)
    {
        int _1458 = ~_1246;
        int _1460 = _1458 + 1;
        _1454 = _1460;
    }
    int _1462 = _1454;
    float _1464 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1466 = as_type<float>(_1462);
    if (_1422)
    {
        int _1468 = ~_1414;
        int _1470 = _1468 + 1;
        _1456 = _1470;
    }
    int _1472 = _1456;
    int _1474 = int(_1308) + int(_1420);
    int _1476 = abs(_1044);
    bool _1478 = _990 != 3;
    int _1480 = _1430 * _1474;
    int _1482 = _1480 + _874;
    int _1484 = ~_1476;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1492 = abs(_1472);
    int _1494 = abs(_1402);
    int _1496 = _1488 * as_type<int>(_1352);
    bool _1498 = !_1478;
    int _1500 = _1498 ? 0 : (-1);
    bool _1502 = uint(_1482) >= uint(_663);
    int _1504 = abs(_1500);
    int _1506 = ~_1494;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    bool _1512 = !_1502;
    int _1514 = _1512 ? 0 : (-1);
    bool _1516 = !_1200;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = _1510 * as_type<int>(_1344);
    int _1522 = _1520 + _1496;
    int _1524 = ~_1492;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    int _1530 = ~_1474;
    int _1532 = _1530 + _1514;
    int _1534 = _1532 + 1;
    int _1536 = abs(_1518);
    int _1538 = _1528 * as_type<int>(_1386);
    int _1540 = _1538 + _1522;
    int _1542 = ~_1504;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _663 * _1534;
    int _1550 = _1548 + _874;
    float _1552 = _1130 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1554 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1426);
    bool _1556 = !_964;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = _1546 * as_type<int>(_1394);
    int _1562 = _1560 + _1540;
    float _1564 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1552 + _1566;
    float _1570 = float(_1536);
    int _1572 = abs(_1558);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1576 = _1564 + _1574;
    bool _1578 = !_1196;
    int _1580 = _1578 ? 0 : 1;
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1584 = _1570 * _1324;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1588 = _1490 + _1586;
    int _1590 = abs(_1580);
    float _1592 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1582);
    float _1594 = _1568 * _1568;
    float _1596 = float(_1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1592);
    float _1600 = float(_1462);
    float _1602 = fma(_1576, _1576, _1594);
    int _1604 = ~_1572;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    float _1610 = _1584 * (-2.0);
    bool _1612 = !_780;
    int _1614 = _1612 ? _1550 : (-1);
    float _1616 = _1596 * _1600;
    bool _1618 = _1598 >= 0.0;
    float _1620 = in.m_60.x;
    float _1622 = in.m_60.y;
    float _1624 = in.m_60.z;
    int _1626 = _1562 * _1608;
    float _1628 = fma(_1588, _1588, _1602);
    float _1630 = fma(_1248, _1610, _1248);
    int _1632 = _1614 * _1572;
    int _1634 = _1632 + _1626;
    float _1636 = _1444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1638 = rsqrt(_1628);
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1618)
    {
        _1466 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1642 = _1466;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1646 = float(_1634);
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1650 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1652 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1658 = as_type<int>(_1642);
    if (_1618)
    {
        float _1660 = _1642 * 5.0;
        _1658 = as_type<int>(_1660);
    }
    int _1662 = _1658;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1666 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1616 * (-2.0);
    if (_1618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4979 = as_type<float>(_1662);
        out.gl_Position.z = _4979;
    }
    float _1674 = fma(_1610, _1622, _1622);
    bool _1676 = !_1204;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = fma(_1244, _1672, _1244);
    out.m_62.x = _1646;
    out.m_64.x = _1652;
    out.m_64.y = _1654;
    out.m_64.z = _1656;
    float _1682 = _1624;
    if (_1618)
    {
        out.m_47.x = 0.0;
    }
    float _1684 = _1568 * _1638;
    float _1686 = _1576 * _1638;
    out.m_66.x = _1666;
    out.m_66.y = _1668;
    out.m_66.z = _1670;
    out.m_66.w = _1664;
    if (_1618)
    {
        return out;
    }
    float _1688 = -_1684;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1552);
    float _1692 = -_1686;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1696 = fma(_1672, _1620, _1620);
    float _1698 = _145 + (-0.5);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1706 = _1694 + _1704;
    int _1708 = abs(_1678);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1696);
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1714 = -_1684;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _1718 = -_1686;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1722 = _145 + _900;
    float _1724 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1712);
    float _1726 = _1588 * _1638;
    float _1728 = _1716 * _1716;
    float _1730 = _1722 + (-1.0);
    float _1732 = _914 + (-0.5);
    float _1734 = -_1726;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _1738 = fma(_1720, _1720, _1728);
    float _1740 = -_1726;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1588);
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1736 + _1744;
    float _1748 = float(_1708);
    float _1750 = fma(_1742, _1742, _1738);
    float _1752 = float(_1222);
    float _1754 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1724);
    float _1756 = _900 + (-0.5);
    float _1758 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1674);
    float _1760 = fma(_1680, _1124, _1710);
    float _1762 = _1748 * _1752;
    bool _1764 = _1754 >= 0.0;
    float _1766 = fma(_1630, _1124, _1758);
    float _1768 = _1760 * 0.15915493667125701904296875;
    float _1770 = _1762 * (-2.0);
    float _1772 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1774 = _1766 * 0.15915493667125701904296875;
    float _1776 = sqrt(_1750);
    float _1778 = fma(_1770, _1624, _1624);
    float _1780 = fma(_1772, _1770, _1772);
    float _1782 = _371 * _615;
    float _1784 = _371 * _617;
    float _1786 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1778);
    if (_1764)
    {
        _1682 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1788 = _1682;
    float _1790 = _1774 * 6.283185482025146484375;
    float _1792 = sin(_1790);
    float _1794 = fma(_1780, _1124, _1786);
    int _1796 = as_type<int>(_1788);
    if (_1764)
    {
        out.m_47.x = 0.0;
    }
    if (_1764)
    {
        float _1798 = _1788 * 5.0;
        _1796 = as_type<int>(_1798);
    }
    int _1800 = _1796;
    float _1802 = _1794 * 0.15915493667125701904296875;
    float _1804 = _1774 * 6.283185482025146484375;
    float _1806 = cos(_1804);
    if (_1764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5230 = as_type<float>(_1800);
        out.gl_Position.z = _5230;
    }
    float _1808 = _1768 * 6.283185482025146484375;
    float _1810 = sin(_1808);
    float _1812 = _1768 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = _1802 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    if (_1764)
    {
        return out;
    }
    float _1820 = _1802 * 6.283185482025146484375;
    float _1822 = cos(_1820);
    float _1824 = _1638 * _1776;
    float _1826 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1828 = _1784 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1834 = _1824 * _1826;
    float _1836 = _1824 * _1828;
    float _1838 = _1810 * _1792;
    float _1840 = _1830 * _1834;
    float _1842 = _1832 * _1836;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1846 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1844;
    float _1848 = _1814 * _1806;
    float _1850 = _1822 * _1842;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1854 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1852;
    float _1856 = _1846 * _1846;
    float _1858 = fma(_1818, _1848, _1838);
    float _1860 = _1814 * _1850;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1862;
    float _1866 = fma(_1854, _1854, _1856);
    float _1868 = fma(_1858, _1840, _1860);
    float _1870 = _1814 * _1792;
    float _1872 = _1792 * _1822;
    float _1874 = _1806 * _1822;
    float _1876 = _1810 * _1806;
    float _1878 = fma(_1864, _1864, _1866);
    float _1880 = -_1842;
    float _1882 = _1818 * _1880;
    float _1884 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1886 = _1884 * 0.5;
    float _1888 = -_1876;
    float _1890 = fma(_1818, _1870, _1888);
    float _1892 = sqrt(_1878);
    float _1894 = -_1870;
    float _1896 = fma(_1818, _1876, _1894);
    float _1898 = fma(_1874, _1840, _1882);
    float _1900 = _1810 * _1850;
    float _1902 = fma(_1890, _1886, _1868);
    float _1904 = fma(_1818, _1838, _1848);
    float _1906 = fma(_1872, _1886, _1898);
    float _1908 = fma(_1896, _1840, _1900);
    float _1910 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1914 = rsqrt(_1878);
    float _1916 = fma(_1904, _1886, _1908);
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    float _1920 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1912);
    float _1922 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1918);
    float _1924 = precise::max(_1892, 10.0);
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1920);
    float _1928 = _1892 * 0.039999999105930328369140625;
    float _1930 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1932 = precise::min(_1924, 50.0);
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1936 = precise::max(_1928, 1.0);
    float _1938 = _1564 + _1930;
    float _1940 = _1490 + _1934;
    float _1942 = fma(_1932, 0.25, -2.5);
    float _1944 = precise::min(_1936, 2.0);
    float _1946 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1948 = _1938 + _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1952 = _1940 + _1950;
    float _1954 = _1914 * _1942;
    float _1956 = fma(_1948, _1944, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1958 = fma(_1952, _1944, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1960 = -_1954;
    float _1962 = fma(_1854, _1960, _1956);
    float _1964 = -_1954;
    float _1966 = fma(_1864, _1964, _1958);
    float _1968 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1972 = _1962 + _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1976 = _1966 + _1974;
    float _1978 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1968);
    float _1980 = _1972 * _1972;
    float _1982 = _1976 * _1976;
    float _1984 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1978);
    float _1986 = _1980 + _1982;
    float _1988 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1990 = sqrt(_1986);
    float _1992 = _1552 + _1988;
    float _1994 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1996 = _1992 + _1994;
    float _1998 = fma(_1996, _1944, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2000 = -_1954;
    float _2002 = fma(_1846, _2000, _1998);
    bool _2004 = _1990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _1846;
    float _2008 = _1902;
    float _2010 = _1998;
    float _2012 = _1984;
    float _2014 = _1982;
    float _2016 = _1906;
    if (!_2004)
    {
        _2006 = _1980;
    }
    float _2018 = _2006;
    float _2020 = _2018;
    if (!_2004)
    {
        _2008 = _1962;
    }
    float _2022 = _2008;
    float _2024 = _2022;
    if (!_2004)
    {
        _2010 = _1966;
    }
    float _2026 = _2010;
    float _2028 = _2026;
    if (!_2004)
    {
        _2012 = _2002;
    }
    float _2030 = _2012;
    bool _2032 = !_2004;
    float _2034 = _2030;
    if (!_2032)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2040 = _1990 + _2038;
        float _2042 = rsqrt(_1986);
        float _2044 = _2040 * _2036;
        float _2046 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2048 = _2044 * 0.15915493667125701904296875;
        float _2050 = _2048 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = _2048 * 6.283185482025146484375;
        float _2056 = cos(_2054);
        float _2058 = fma(_2052, _2046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2060 = _2042 * _2058;
        float _2062 = _2056 + (-1.0);
        float _2064 = fma(_1972, _2060, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2066 = fma(_1976, _2060, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2072 = _2064 + _2070;
        float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2076 = _2066 + _2074;
        float _2078 = fma(_2002, _2056, _2068);
        float _2080 = _2072 * _2072;
        float _2082 = _2076 * _2076;
        _2034 = _2078;
        _2020 = _2080;
        _2014 = _2082;
        _2024 = _2064;
        _2028 = _2066;
    }
    float _2084 = _2034;
    float _2086 = _2020;
    float _2088 = _2014;
    float _2090 = _2024;
    float _2092 = _2028;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2096 = _2084 + _2094;
    out.m_66.x = _1666;
    out.m_66.y = _1668;
    out.m_66.z = _1670;
    out.m_66.w = _1664;
    float _2098 = fma(_2096, _2096, _2086);
    out.m_64.x = _1652;
    out.m_64.y = _1654;
    out.m_64.z = _1656;
    float _2100 = _2098 + _2088;
    float _2102 = sqrt(_2100);
    bool _2104 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2106 = isnan(_2102);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2112 = _2108 || _2110;
    float _2114 = _2086;
    float _2116 = _2084;
    if (!_2112)
    {
        _2114 = 1.0;
    }
    float _2118 = _2114;
    bool _2120 = !_2112;
    float _2122 = _2118;
    if (!_2120)
    {
        bool _2124 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2126 = isnan(_2102);
        bool _2128 = _2124 || _2126;
        bool _2130 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2132 = _2128 || _2130;
        if (!_2132)
        {
            float _2134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2136 = _2102 + _2134;
            float _2138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2140 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2138;
            float _2142 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2146 = 1.0 / _2140;
            float _2148 = _2136 * _2146;
            float _2150 = fma(_2148, _2144, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2122 = _2150;
            _2152 = true;
        }
        else
        {
            bool _2154 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2156 = isnan(_2102);
            bool _2158 = _2154 || _2156;
            bool _2160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2162 = _2158 || _2160;
            if (!_2162)
            {
                float _2164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2166 = _2102 + _2164;
                float _2168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2170 = _2168 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2172 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2174 = _2172 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2176 = 1.0 / _2170;
                float _2178 = _2166 * _2176;
                float _2180 = fma(_2178, _2174, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2122 = _2180;
                _2152 = true;
            }
            else
            {
                _2122 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2152 = false;
    float _2182 = _2122;
    float _2184 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2186 = _2084 + _2184;
    float _2188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2190 = _2090 + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2194 = _2092 + _2192;
    float _2196 = fma(_2186, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2198 = fma(_2190, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2200 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2202 = -_1684;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2196);
    float _2206 = -_1686;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2198);
    float _2210 = -_1726;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2200);
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2216 = _2204 + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2220 = _2208 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2224 = _2212 + _2222;
    float _2226 = _2216 * _2216;
    float _2228 = fma(_2220, _2220, _2226);
    float _2230 = fma(_2224, _2224, _2228);
    float _2232 = rsqrt(_2230);
    float _2234 = sqrt(_2230);
    float _2236 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2238 = _2220 * _2236;
    float _2240 = _2224 * _2236;
    float _2242 = _2238 * _2238;
    float _2244 = _2240 * _2240;
    float _2246 = _2242 + _2244;
    float _2248 = sqrt(_2246);
    bool _2250 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2254 = _2248 + _2252;
    float _2256 = _2232;
    float _2258 = _2246;
    float _2260 = _2254;
    float _2262 = _2216;
    float _2264 = _2238;
    if (_2250)
    {
        float _2266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2256 = _2266;
    }
    float _2268 = _2256;
    if (_2250)
    {
        float _2270 = rsqrt(_2246);
        _2258 = _2270;
    }
    float _2272 = _2258;
    if (_2250)
    {
        float _2274 = _2254 * _2268;
        _2260 = _2274;
    }
    float _2276 = _2260;
    if (_2250)
    {
        float _2278 = _2276 * 0.15915493667125701904296875;
        _2116 = _2278;
    }
    float _2280 = _2116;
    float _2282 = _2268;
    float _2284 = _2280;
    if (_2250)
    {
        float _2286 = _2280 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        _2282 = _2288;
    }
    float _2290 = _2282;
    float _2292 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2294 = precise::max(0.0, _2292);
    float _2296 = _2224;
    float _2298 = _2294;
    if (_2250)
    {
        float _2300 = _2280 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        _2296 = _2302;
    }
    float _2304 = _2296;
    float _2306 = -_2236;
    float _2308 = -_2294;
    float _2310 = fma(_2216, _2306, _2308);
    if (!_2250)
    {
        _2262 = _2240;
    }
    float _2312 = _2262;
    float _2314 = _2312;
    if (_2250)
    {
        float _2316 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2316;
    }
    float _2318 = _2298;
    float _2320 = _2290;
    float _2322 = _2318;
    if (_2250)
    {
        float _2324 = fma(_2290, _2318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2320 = _2324;
    }
    float _2326 = _2320;
    float _2328 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2330 = _2326;
    float _2332 = _2304;
    if (_2250)
    {
        float _2334 = _2304 + (-1.0);
        _2322 = _2334;
    }
    float _2336 = _2322;
    float _2338 = _2336;
    if (_2250)
    {
        float _2340 = _2272 * _2326;
        _2016 = _2340;
    }
    float _2342 = _2016;
    if (!_2250)
    {
        _2330 = _2310;
    }
    float _2344 = _2330;
    float _2346 = _2344;
    if (_2250)
    {
        float _2348 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2284 = _2348;
    }
    float _2350 = _2284;
    if (_2250)
    {
        float _2352 = _2238 * _2342;
        _2264 = _2352;
    }
    float _2354 = _2264;
    if (!_2250)
    {
        _2338 = _2242;
    }
    float _2356 = _2338;
    float _2358 = _2356;
    if (_2250)
    {
        float _2360 = _2240 * _2342;
        _2314 = _2360;
    }
    float _2362 = _2314;
    if (_2250)
    {
        float _2364 = fma(_2310, _2304, _2350);
        _2346 = _2364;
    }
    float _2366 = _2346;
    if (_2250)
    {
        float _2368 = _2354 * _2354;
        _2358 = _2368;
    }
    float _2370 = _2358;
    if (!_2250)
    {
        _2332 = _2244;
    }
    float _2372 = _2332;
    float _2374 = _2372;
    if (_2250)
    {
        float _2376 = _2362 * _2362;
        _2374 = _2376;
    }
    float _2378 = _2374;
    float _2380 = fma(_2366, _2366, _2370);
    float _2382 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2384 = _2380 + _2378;
    float _2386 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2390 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2388);
    float _2392 = precise::clamp(_2390, 0.0, 1.0);
    float _2394 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2396 = rsqrt(_2384);
    float _2398 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2386);
    float _2400 = -_2392;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2394);
    float _2406 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2382);
    float _2408 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2398);
    float _2410 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2412 = abs(_2402);
    float _2414 = log2(_2412);
    float _2416 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2418 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2410);
    float _2420 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2404);
    float _2422 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2406);
    float _2424 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2426 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2418);
    float _2428 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2430 = _2396 * _2354;
    float _2432 = -_2424;
    float _2434 = fma(_2432, _2328, 1.0);
    float _2436 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2438 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2440 = _2396 * _2366;
    float _2442 = _2396 * _2362;
    float _2444 = _2422 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2446 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2438);
    float _2448 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2450 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2452 = log2(_2434);
    float _2454 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2446);
    float _2456 = -_2448;
    float _2458 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2456);
    float _2460 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2462 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2454);
    float _2464 = -_2442;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2458);
    float _2468 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2470 = exp2(_2450);
    float _2472 = fma(_2466, -0.5, 0.5);
    float _2474 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2468);
    float _2476 = fma(_2466, 0.5, 0.5);
    float _2478 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2460);
    float _2480 = _2440 + 1.0;
    float _2482 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2474);
    float _2484 = 1.0 / _2462;
    float _2486 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2478);
    float _2488 = fma(_2476, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2490 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2482);
    float _2492 = _2452 * 0.693147182464599609375;
    float _2494 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2486);
    float _2496 = fma(_2476, _2488, -0.212114393711090087890625);
    float _2498 = sqrt(_2472);
    float _2500 = -_2440;
    float _2502 = fma(_2470, _2480, _2500);
    float _2504 = fma(_2476, _2496, 1.570728778839111328125);
    float _2506 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2508 = fma(_2502, 0.5, 0.5);
    float _2510 = _2490 * _2484;
    float _2512 = _2494 * _2484;
    float _2514 = fma(_2510, 0.5, 0.5);
    float _2516 = fma(_2512, -0.5, 0.5);
    float _2518 = _2498 * 0.636619746685028076171875;
    float3 _6417 = float3(_2514, _2516, _2506);
    float _2520 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6417, float3(0.0), isnan(_6417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6417, float3(0.0), isnan(_6417)), level(0.0)).x;
    float _2522 = -_2504;
    float _2524 = fma(_2518, _2522, 1.0);
    float3 _6433 = float3(_2514, _2516, _2506);
    float4 _2527 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6433, float3(0.0), isnan(_6433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6433, float3(0.0), isnan(_6433)), level(0.0)).xyzw;
    float _2529 = _2527.x;
    float _2531 = _2527.y;
    float _2533 = _2527.z;
    float _2535 = _2527.w;
    float2 _6450 = float2(_2524, _2508);
    float3 _2539 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6450, float2(0.0), isnan(_6450)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6450, float2(0.0), isnan(_6450)), level(0.0)).xyz;
    float _2541 = _2539.x;
    float _2543 = _2539.y;
    float _2545 = _2539.z;
    float _2547 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2549 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2551 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2549);
    float _2553 = exp2(_2547);
    float _2555 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2551);
    float _2557 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2555);
    float _2559 = _2557 + _2462;
    float _2561 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2490;
    out.gl_Position.y = _2494;
    out.gl_Position.z = _2557;
    out.gl_Position.w = _2462;
    float _2563 = _2559 * 0.5;
    float _2565 = -_2553;
    float _2567 = _2565 + 1.0;
    out.m_47.x = _2561;
    float _2569 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2563;
    out.m_68.w = _2462;
    float _2571 = _2569 * _2520;
    float _2573 = -_2569;
    float _2575 = _2573 + 1.0;
    float _2577 = _2535 * _2571;
    float _2579 = _2545 * _2571;
    float _2581 = fma(_2541, _2577, _2529);
    float _2583 = fma(_2543, _2577, _2531);
    float _2585 = _2535 * _2575;
    float _2587 = fma(_2535, _2579, _2533);
    out.m_70.x = _2581;
    out.m_70.y = _2583;
    out.m_70.z = _2587;
    out.m_70.w = _2585;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2152 = false;
    bool _641 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2644 = as_type<float>(_105);
        out.gl_Position.z = _2644;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2714 = as_type<float>(_143);
        out.gl_Position.z = _2714;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = 0.0;
    float _169 = _153;
    if (!_163)
    {
        float _171 = _153 * _153;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _177 * 6.283185482025146484375;
    float _193 = floor(_177);
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    bool _209 = !_197;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = -_193;
    float _219 = _177 + _217;
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_163;
    float _227 = _183;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _153 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _153);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_163;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _153 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _169 = _281;
    }
    float _283 = _169;
    float _285 = fma(_215, 0.5, 0.5);
    float _287 = in.m_56.w;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _295 = _293 != 0;
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = in.m_44.x;
    float _303 = in.m_44.y;
    float _305 = in.m_44.z;
    float _307 = -_219;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _311 = !_291;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_207;
    int _323 = _321 ? 0 : 1;
    float _325 = -_285;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _185, _315);
    bool _333 = !_295;
    int _335 = _333 ? 0 : 1;
    float _337 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _343 = abs(_335);
    float _345 = fma(_283, _187, _337);
    int _347 = abs(_323);
    float _349 = fma(_283, _189, _341);
    float _351 = float(_329);
    float _353 = float(_347);
    float _355 = abs(_309);
    float _357 = _351 * _355;
    float _359 = fma(_331, _287, _301);
    float _361 = float(_343);
    float _363 = fma(_353, _327, _357);
    float _365 = fma(_345, _287, _303);
    float _367 = fma(_349, _287, _305);
    float _369 = abs(_319);
    float _371 = fma(_361, _369, _363);
    bool _373 = !_339;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = 1.0 / _411;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _429 = 1.0 / _415;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = _399 + _431;
    float _435 = 1.0 / _419;
    float _437 = _403 * _425;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _441 = _399 + _439;
    float _443 = 1.0 / _423;
    float _445 = _407 * _429;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    bool _451 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _453 = isnan(_399);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_449, _437, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = _433 * _435;
    bool _467 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _469 = isnan(_399);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_461;
    float _481 = _479 + 1.0;
    bool _483 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _485 = isnan(_399);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -_477;
    float _497 = _495 + 1.0;
    float _499 = _441 * _443;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _501;
    float _505 = _461 * _497;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = fma(_503, _437, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _517 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _519 = isnan(_399);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = fma(_513, _445, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _533 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _535 = isnan(_399);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    float _549 = _527 * _481;
    float _551 = -_527;
    float _553 = _551 + 1.0;
    float _555 = _493 * _553;
    float _557 = -_493;
    float _559 = _557 + 1.0;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = _543 * _559;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _571;
    float _575 = _515 * _565;
    float _577 = _463 * _565;
    float _579 = fma(_569, _465, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _581 = fma(_573, _465, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _583 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _585 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _595 = fma(_529, _555, _583);
    float _597 = fma(_531, _555, _585);
    float _599 = fma(_589, _499, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_593, _499, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = fma(_579, _549, _595);
    float _605 = fma(_581, _549, _597);
    float _607 = fma(_599, _505, _603);
    float _609 = fma(_601, _505, _605);
    float _611 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].x, _607);
    float _613 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[147].y, _609);
    float _615 = _611 * _545;
    float _617 = _613 * _547;
    bool _619 = !_427;
    float _637;
    float _639;
    if (!_619)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _623 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _625 = float(_89);
        float _627 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _629 = _627 * _621;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _637 = _635;
        _639 = _625;
        _641 = true;
    }
    else
    {
        float _643 = float(_89);
        float _645 = 1.0 / _643;
        float _647 = _123 * _645;
        _637 = _647;
        _639 = _643;
    }
    _641 = false;
    float _649 = _637;
    float _651 = _639;
    float _653 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _655 = int(_653);
    float _657 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _659 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _657);
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _663 = int(_661);
    bool _665 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _667 = isnan(_649);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _651;
    float _679 = float(_655);
    float _681 = 1.0 / _679;
    float _683 = float(uint(_663));
    int _685 = ~_663;
    int _687 = _685 + 1;
    float _689 = 1.0 / _683;
    float _691 = _681 * _123;
    int _693 = ~_663;
    int _695 = _693 + 1;
    float _697 = trunc(_691);
    int _699 = int(_697);
    int _701 = as_type<int>(_689) + (-2);
    float _703 = float(uint(_699));
    float _705 = as_type<float>(_701) * _703;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _712 = uint(_709);
    int _714 = ~_663;
    int _716 = _714 + 1;
    int _718 = _695 * int(_712);
    int _720 = _718 + _699;
    float _722 = float(uint(_720));
    float _724 = as_type<float>(_701) * _722;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _728 = _726 != 0;
    float _730 = trunc(_724);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    bool _736 = !_728;
    float _738 = _736 ? 7.345489978790283203125 : 1.0;
    float _740 = _738 * _145;
    float _742 = floor(_740);
    int _744 = int(_712) + int(_734);
    float _746 = float(_663);
    float _748 = float(_699);
    int _750 = _716 * _744;
    int _752 = _750 + _699;
    bool _754 = _748 >= _746;
    bool _756 = isnan(_748);
    bool _758 = _754 || _756;
    bool _760 = isnan(_746);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    bool _766 = uint(_752) >= uint(_663);
    float _768 = -_742;
    float _770 = _740 + _768;
    float _772 = trunc(_764);
    int _774 = int(_772);
    bool _776 = !_766;
    int _778 = _776 ? 0 : (-1);
    bool _780 = _663 == 0;
    int _782 = ~_744;
    int _784 = _782 + _778;
    int _786 = _784 + 1;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _798 = _796 != 0;
    int _800 = _663 * _786;
    int _802 = _800 + _699;
    bool _804 = !_790;
    int _806 = _804 ? 0 : 1;
    bool _808 = !_780;
    int _810 = _808 ? _802 : (-1);
    float _812 = _770 * _746;
    int _814 = ~_774;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = _746 * _123;
    int _822 = _810 * _818;
    float _824 = _820 * _677;
    int _826 = _663 + (-1);
    float _828 = trunc(_812);
    int _830 = int(_828);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _834 = _832 != 0;
    int _836 = abs(_806);
    int _838 = _774 * _826;
    int _840 = _838 + _822;
    bool _842 = !_794;
    int _844 = _842 ? 0 : 1;
    bool _846 = !_834;
    int _848 = _846 ? 0 : 1;
    float _850 = trunc(_824);
    int _852 = int(_850);
    int _854 = abs(_844);
    bool _856 = !_798;
    int _858 = _856 ? 0 : 1;
    int _860 = abs(_848);
    int _862 = _840 * _854;
    int _864 = abs(_858);
    float _866 = _145 * 2.0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _870 = _868 != 0;
    int _872 = _830 * _860;
    int _874 = _872 + _699;
    float _876 = floor(_866);
    bool _878 = !_870;
    int _880 = _878 ? 0 : 1;
    int _882 = _852 * _836;
    int _884 = _882 + _862;
    int _886 = abs(_880);
    int _888 = ~_663;
    int _890 = _888 + 1;
    int _892 = _874 * _864;
    int _894 = _892 + _884;
    int _896 = ~_663;
    int _898 = _896 + 1;
    float _900 = in.m_51.z;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _904 = _902 != 0;
    int _906 = _830 * _886;
    int _908 = _906 + _894;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _912 = _910 != 0;
    float _914 = in.m_51.y;
    float _916 = float(uint(_908));
    float _918 = as_type<float>(_701) * _916;
    float _920 = trunc(_918);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    int _926 = _890 * int(_924);
    int _928 = _926 + _908;
    float _930 = float(uint(_928));
    float _932 = as_type<float>(_701) * _930;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _936 = trunc(_932);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = int(_924) + int(_940);
    float _944 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _946 = _898 * _942;
    int _948 = _946 + _908;
    float _950 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _944);
    bool _952 = uint(_948) >= uint(_663);
    float _954 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _956 = !_952;
    int _958 = _956 ? 0 : (-1);
    float _960 = fma(_954, -2.0, _934);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _964 = _962 != 0;
    int _966 = ~_942;
    int _968 = _966 + _958;
    int _970 = _968 + 1;
    float _972 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _974 = log2(_972);
    int _976 = _663 * _970;
    int _978 = _976 + _908;
    float _980 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _982 = !_780;
    int _984 = _982 ? _978 : (-1);
    float _986 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _980);
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _990 = _984 & 3;
    bool _992 = _990 != 0;
    int _994 = _984 & 3;
    bool _996 = _994 != 0;
    float _998 = _974 * _123;
    bool _1000 = uint(_990) > 1u;
    float _1002 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1004 = _996 ? 0 : 1;
    bool _1006 = _145 > 0.5;
    float _1008 = exp2(_998);
    float _1010 = -_988;
    float _1012 = fma(_1002, 2.0, _1010);
    int _1014 = ~_1004;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    float _1020 = -_211;
    int _1022 = _1006 ? as_type<int>(_1020) : as_type<int>(_211);
    bool _1024 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1026 = isnan(1.0);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1032 = _1028 || _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1036 = 1.0 + _1034;
    int _1038 = _1018;
    if (!_1000)
    {
        int _1040 = ~_1004;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1046;
    bool _1050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1052 = isnan(0.0);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1058 = _1054 || _1056;
    float _1060 = 1.0 / _1036;
    bool _1062 = !_904;
    float _1064 = _1062 ? _211 : as_type<float>(_1022);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1070 = -_1008;
    float _1072 = _1070 + 1.0;
    bool _1074 = _876 > 0.0;
    float _1076 = 1.0 / _1048;
    float _1078 = _1058 ? _1072 : 0.0;
    bool _1080 = _876 >= 0.0;
    bool _1082 = isnan(_876);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = _914 * 2.0;
    float _1092 = 1.0 / _1068;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1106 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1108 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1110 = -_123;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1012);
    float _1114 = floor(_1090);
    float _1116 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1106);
    float _1118 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _960);
    float _1120 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1108);
    if (_1032)
    {
        float _1122 = _1078 * _1060;
        _125 = _1122;
    }
    float _1124 = _125;
    float _1126 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _986);
    int _1128 = _1088 ? 0 : 1;
    float _1130 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _950);
    float _1132 = _900 * 2.0;
    bool _1134 = _914 > 0.5;
    float _1136 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _659);
    int _1138 = ~_1128;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1146 = _649 + _1144;
    int _1148 = _1142;
    if (!_1074)
    {
        int _1150 = ~_1128;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = _914 + _900;
    float _1158 = floor(_1132);
    bool _1160 = _1114 > 0.0;
    float _1162 = _1146 * _1076;
    float _1164 = -_223;
    int _1166 = _1134 ? as_type<int>(_1164) : as_type<int>(_223);
    float _1168 = _145 + _914;
    bool _1170 = _1114 >= 0.0;
    bool _1172 = isnan(_1114);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1182 = _649 + _1180;
    bool _1184 = !_912;
    float _1186 = _1184 ? _223 : as_type<float>(_1166);
    float _1188 = _1168 + (-1.0);
    int _1190 = _1178 ? 0 : 1;
    float _1192 = _1182 * _1092;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = _1156 + (-1.0);
    int _1208 = ~_1190;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _1216 = _1212;
    if (!_1160)
    {
        int _1218 = ~_1190;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = -_1120;
    float _1226 = _1224 + 1.0;
    bool _1228 = _1158 >= 0.0;
    bool _1230 = isnan(_1158);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan(0.0);
    bool _1236 = _1232 || _1234;
    float _1238 = -_1116;
    float _1240 = _1238 + 1.0;
    int _1242 = _984 >> 31;
    float _1244 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1246 = _1236 ? 0 : 1;
    float _1248 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1250 = _1158 > 0.0;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1252;
    float _1256 = float(uint(_874));
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1258;
    int _1262 = _1242 & 3;
    float _1264 = fma(_1254, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1266 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1268 = isnan(_649);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = fma(_1260, _1162, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1280 = _984 + _1262;
    float _1282 = as_type<float>(_701) * _1256;
    bool _1284 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1286 = isnan(_649);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1276;
    float _1298 = _1296 + 1.0;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1304 = trunc(_1282);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1314 = _1294 * _1298;
    int _1316 = _1280 >> 2;
    float _1318 = -_1294;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1302, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1324 = float(_1154);
    int _1326 = _1316 << 4;
    int _1328 = _1326 + 368;
    float _1330 = _675 * _1320;
    float _1332 = _1064 + 0.5;
    float _1334 = -_675;
    float _1336 = _1334 + 1.0;
    uint _1338 = uint(int(uint(_1328) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[int(_1348)][_1350];
    float _1354 = _1278 * _1330;
    float _1356 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1112);
    float _1358 = _1186 + (-0.5);
    int _1360 = _687 * int(_1308);
    int _1362 = _1360 + _874;
    float _1364 = _1264 * _1330;
    float _1366 = _1214 * _1330;
    float _1368 = -_1358;
    float _1370 = -_1118;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1370);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1354);
    float _1376 = float(uint(_1362));
    int _1378 = _1328 + 8;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    uint _1382 = uint(int(uint(int(_1380)) >> uint(2)));
    int _1384 = int(_1380) & 3;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[int(_1382)][_1384];
    int _1388 = int(_1380) + 1;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    int _1392 = _1388 & 3;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[int(_1390)][_1392];
    float _1396 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1364);
    float _1398 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1366);
    bool _1400 = !_992;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = as_type<float>(_701) * _1376;
    bool _1406 = uint(_990) >= 2u;
    float _1408 = fma(_1322, _1314, _1396);
    float _1410 = fma(_1312, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1412 = fma(_1104, _1192, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    int _1414 = _1406 ? 0 : 1;
    float _1416 = trunc(_1404);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    bool _1422 = _990 != 3;
    float _1424 = fma(_1410, _1314, _1374);
    float _1426 = fma(_1412, _1314, _1398);
    int _1428 = ~_663;
    int _1430 = _1428 + 1;
    float _1432 = fma(_1186, _1226, _1372);
    float _1434 = -_1240;
    float _1436 = fma(_1064, _1434, _1356);
    int _1438 = ~_1414;
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    float _1444 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1408);
    float _1446 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1424);
    int _1448 = ~_1246;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    out.m_58.x = _1436;
    out.m_58.y = _1432;
    int _1454 = _1452;
    int _1456 = _1442;
    if (!_1250)
    {
        int _1458 = ~_1246;
        int _1460 = _1458 + 1;
        _1454 = _1460;
    }
    int _1462 = _1454;
    float _1464 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1466 = as_type<float>(_1462);
    if (_1422)
    {
        int _1468 = ~_1414;
        int _1470 = _1468 + 1;
        _1456 = _1470;
    }
    int _1472 = _1456;
    int _1474 = int(_1308) + int(_1420);
    int _1476 = abs(_1044);
    bool _1478 = _990 != 3;
    int _1480 = _1430 * _1474;
    int _1482 = _1480 + _874;
    int _1484 = ~_1476;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1492 = abs(_1472);
    int _1494 = abs(_1402);
    int _1496 = _1488 * as_type<int>(_1352);
    bool _1498 = !_1478;
    int _1500 = _1498 ? 0 : (-1);
    bool _1502 = uint(_1482) >= uint(_663);
    int _1504 = abs(_1500);
    int _1506 = ~_1494;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    bool _1512 = !_1502;
    int _1514 = _1512 ? 0 : (-1);
    bool _1516 = !_1200;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = _1510 * as_type<int>(_1344);
    int _1522 = _1520 + _1496;
    int _1524 = ~_1492;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    int _1530 = ~_1474;
    int _1532 = _1530 + _1514;
    int _1534 = _1532 + 1;
    int _1536 = abs(_1518);
    int _1538 = _1528 * as_type<int>(_1386);
    int _1540 = _1538 + _1522;
    int _1542 = ~_1504;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _663 * _1534;
    int _1550 = _1548 + _874;
    float _1552 = _1130 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1554 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1426);
    bool _1556 = !_964;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = _1546 * as_type<int>(_1394);
    int _1562 = _1560 + _1540;
    float _1564 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1552 + _1566;
    float _1570 = float(_1536);
    int _1572 = abs(_1558);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1576 = _1564 + _1574;
    bool _1578 = !_1196;
    int _1580 = _1578 ? 0 : 1;
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1584 = _1570 * _1324;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1588 = _1490 + _1586;
    int _1590 = abs(_1580);
    float _1592 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1582);
    float _1594 = _1568 * _1568;
    float _1596 = float(_1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1592);
    float _1600 = float(_1462);
    float _1602 = fma(_1576, _1576, _1594);
    int _1604 = ~_1572;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    float _1610 = _1584 * (-2.0);
    bool _1612 = !_780;
    int _1614 = _1612 ? _1550 : (-1);
    float _1616 = _1596 * _1600;
    bool _1618 = _1598 >= 0.0;
    float _1620 = in.m_60.x;
    float _1622 = in.m_60.y;
    float _1624 = in.m_60.z;
    int _1626 = _1562 * _1608;
    float _1628 = fma(_1588, _1588, _1602);
    float _1630 = fma(_1248, _1610, _1248);
    int _1632 = _1614 * _1572;
    int _1634 = _1632 + _1626;
    float _1636 = _1444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1638 = rsqrt(_1628);
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1618)
    {
        _1466 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1642 = _1466;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1646 = float(_1634);
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1650 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1652 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1658 = as_type<int>(_1642);
    if (_1618)
    {
        float _1660 = _1642 * 5.0;
        _1658 = as_type<int>(_1660);
    }
    int _1662 = _1658;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1666 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1616 * (-2.0);
    if (_1618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4979 = as_type<float>(_1662);
        out.gl_Position.z = _4979;
    }
    float _1674 = fma(_1610, _1622, _1622);
    bool _1676 = !_1204;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = fma(_1244, _1672, _1244);
    out.m_62.x = _1646;
    out.m_64.x = _1652;
    out.m_64.y = _1654;
    out.m_64.z = _1656;
    float _1682 = _1624;
    if (_1618)
    {
        out.m_47.x = 0.0;
    }
    float _1684 = _1568 * _1638;
    float _1686 = _1576 * _1638;
    out.m_66.x = _1666;
    out.m_66.y = _1668;
    out.m_66.z = _1670;
    out.m_66.w = _1664;
    if (_1618)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1688 = -_1684;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1552);
    float _1692 = -_1686;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1564);
    float _1696 = fma(_1672, _1620, _1620);
    float _1698 = _145 + (-0.5);
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1706 = _1694 + _1704;
    int _1708 = abs(_1678);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1696);
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1714 = -_1684;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _1718 = -_1686;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1722 = _145 + _900;
    float _1724 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1712);
    float _1726 = _1588 * _1638;
    float _1728 = _1716 * _1716;
    float _1730 = _1722 + (-1.0);
    float _1732 = _914 + (-0.5);
    float _1734 = -_1726;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _1738 = fma(_1720, _1720, _1728);
    float _1740 = -_1726;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1588);
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1736 + _1744;
    float _1748 = float(_1708);
    float _1750 = fma(_1742, _1742, _1738);
    float _1752 = float(_1222);
    float _1754 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1724);
    float _1756 = _900 + (-0.5);
    float _1758 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1674);
    float _1760 = fma(_1680, _1124, _1710);
    float _1762 = _1748 * _1752;
    bool _1764 = _1754 >= 0.0;
    float _1766 = fma(_1630, _1124, _1758);
    float _1768 = _1760 * 0.15915493667125701904296875;
    float _1770 = _1762 * (-2.0);
    float _1772 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1774 = _1766 * 0.15915493667125701904296875;
    float _1776 = sqrt(_1750);
    float _1778 = fma(_1770, _1624, _1624);
    float _1780 = fma(_1772, _1770, _1772);
    float _1782 = _371 * _615;
    float _1784 = _371 * _617;
    float _1786 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1778);
    if (_1764)
    {
        _1682 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1788 = _1682;
    float _1790 = _1774 * 6.283185482025146484375;
    float _1792 = sin(_1790);
    float _1794 = fma(_1780, _1124, _1786);
    int _1796 = as_type<int>(_1788);
    if (_1764)
    {
        out.m_47.x = 0.0;
    }
    if (_1764)
    {
        float _1798 = _1788 * 5.0;
        _1796 = as_type<int>(_1798);
    }
    int _1800 = _1796;
    float _1802 = _1794 * 0.15915493667125701904296875;
    float _1804 = _1774 * 6.283185482025146484375;
    float _1806 = cos(_1804);
    if (_1764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5230 = as_type<float>(_1800);
        out.gl_Position.z = _5230;
    }
    float _1808 = _1768 * 6.283185482025146484375;
    float _1810 = sin(_1808);
    float _1812 = _1768 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = _1802 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    if (_1764)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1820 = _1802 * 6.283185482025146484375;
    float _1822 = cos(_1820);
    float _1824 = _1638 * _1776;
    float _1826 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1828 = _1784 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1834 = _1824 * _1826;
    float _1836 = _1824 * _1828;
    float _1838 = _1810 * _1792;
    float _1840 = _1830 * _1834;
    float _1842 = _1832 * _1836;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1846 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1844;
    float _1848 = _1814 * _1806;
    float _1850 = _1822 * _1842;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1854 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1852;
    float _1856 = _1846 * _1846;
    float _1858 = fma(_1818, _1848, _1838);
    float _1860 = _1814 * _1850;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1862;
    float _1866 = fma(_1854, _1854, _1856);
    float _1868 = fma(_1858, _1840, _1860);
    float _1870 = _1814 * _1792;
    float _1872 = _1792 * _1822;
    float _1874 = _1806 * _1822;
    float _1876 = _1810 * _1806;
    float _1878 = fma(_1864, _1864, _1866);
    float _1880 = -_1842;
    float _1882 = _1818 * _1880;
    float _1884 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1886 = _1884 * 0.5;
    float _1888 = -_1876;
    float _1890 = fma(_1818, _1870, _1888);
    float _1892 = sqrt(_1878);
    float _1894 = -_1870;
    float _1896 = fma(_1818, _1876, _1894);
    float _1898 = fma(_1874, _1840, _1882);
    float _1900 = _1810 * _1850;
    float _1902 = fma(_1890, _1886, _1868);
    float _1904 = fma(_1818, _1838, _1848);
    float _1906 = fma(_1872, _1886, _1898);
    float _1908 = fma(_1896, _1840, _1900);
    float _1910 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1914 = rsqrt(_1878);
    float _1916 = fma(_1904, _1886, _1908);
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    float _1920 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1912);
    float _1922 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1918);
    float _1924 = precise::max(_1892, 10.0);
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1920);
    float _1928 = _1892 * 0.039999999105930328369140625;
    float _1930 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1932 = precise::min(_1924, 50.0);
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1936 = precise::max(_1928, 1.0);
    float _1938 = _1564 + _1930;
    float _1940 = _1490 + _1934;
    float _1942 = fma(_1932, 0.25, -2.5);
    float _1944 = precise::min(_1936, 2.0);
    float _1946 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1948 = _1938 + _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1952 = _1940 + _1950;
    float _1954 = _1914 * _1942;
    float _1956 = fma(_1948, _1944, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1958 = fma(_1952, _1944, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1960 = -_1954;
    float _1962 = fma(_1854, _1960, _1956);
    float _1964 = -_1954;
    float _1966 = fma(_1864, _1964, _1958);
    float _1968 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1972 = _1962 + _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1976 = _1966 + _1974;
    float _1978 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1968);
    float _1980 = _1972 * _1972;
    float _1982 = _1976 * _1976;
    float _1984 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1978);
    float _1986 = _1980 + _1982;
    float _1988 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1990 = sqrt(_1986);
    float _1992 = _1552 + _1988;
    float _1994 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1996 = _1992 + _1994;
    float _1998 = fma(_1996, _1944, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _2000 = -_1954;
    float _2002 = fma(_1846, _2000, _1998);
    bool _2004 = _1990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _1846;
    float _2008 = _1902;
    float _2010 = _1998;
    float _2012 = _1984;
    float _2014 = _1982;
    float _2016 = _1906;
    if (!_2004)
    {
        _2006 = _1980;
    }
    float _2018 = _2006;
    float _2020 = _2018;
    if (!_2004)
    {
        _2008 = _1962;
    }
    float _2022 = _2008;
    float _2024 = _2022;
    if (!_2004)
    {
        _2010 = _1966;
    }
    float _2026 = _2010;
    float _2028 = _2026;
    if (!_2004)
    {
        _2012 = _2002;
    }
    float _2030 = _2012;
    bool _2032 = !_2004;
    float _2034 = _2030;
    if (!_2032)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2040 = _1990 + _2038;
        float _2042 = rsqrt(_1986);
        float _2044 = _2040 * _2036;
        float _2046 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2048 = _2044 * 0.15915493667125701904296875;
        float _2050 = _2048 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = _2048 * 6.283185482025146484375;
        float _2056 = cos(_2054);
        float _2058 = fma(_2052, _2046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2060 = _2042 * _2058;
        float _2062 = _2056 + (-1.0);
        float _2064 = fma(_1972, _2060, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2066 = fma(_1976, _2060, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2072 = _2064 + _2070;
        float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2076 = _2066 + _2074;
        float _2078 = fma(_2002, _2056, _2068);
        float _2080 = _2072 * _2072;
        float _2082 = _2076 * _2076;
        _2034 = _2078;
        _2020 = _2080;
        _2014 = _2082;
        _2024 = _2064;
        _2028 = _2066;
    }
    float _2084 = _2034;
    float _2086 = _2020;
    float _2088 = _2014;
    float _2090 = _2024;
    float _2092 = _2028;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2096 = _2084 + _2094;
    out.m_66.x = _1666;
    out.m_66.y = _1668;
    out.m_66.z = _1670;
    out.m_66.w = _1664;
    float _2098 = fma(_2096, _2096, _2086);
    out.m_64.x = _1652;
    out.m_64.y = _1654;
    out.m_64.z = _1656;
    float _2100 = _2098 + _2088;
    float _2102 = sqrt(_2100);
    bool _2104 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2106 = isnan(_2102);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2112 = _2108 || _2110;
    float _2114 = _2086;
    float _2116 = _2084;
    if (!_2112)
    {
        _2114 = 1.0;
    }
    float _2118 = _2114;
    bool _2120 = !_2112;
    float _2122 = _2118;
    if (!_2120)
    {
        bool _2124 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2126 = isnan(_2102);
        bool _2128 = _2124 || _2126;
        bool _2130 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2132 = _2128 || _2130;
        if (!_2132)
        {
            float _2134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2136 = _2102 + _2134;
            float _2138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2140 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2138;
            float _2142 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2146 = 1.0 / _2140;
            float _2148 = _2136 * _2146;
            float _2150 = fma(_2148, _2144, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2122 = _2150;
            _2152 = true;
        }
        else
        {
            bool _2154 = _2102 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2156 = isnan(_2102);
            bool _2158 = _2154 || _2156;
            bool _2160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2162 = _2158 || _2160;
            if (!_2162)
            {
                float _2164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2166 = _2102 + _2164;
                float _2168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2170 = _2168 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2172 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2174 = _2172 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2176 = 1.0 / _2170;
                float _2178 = _2166 * _2176;
                float _2180 = fma(_2178, _2174, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2122 = _2180;
                _2152 = true;
            }
            else
            {
                _2122 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2152 = false;
    float _2182 = _2122;
    float _2184 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2186 = _2084 + _2184;
    float _2188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2190 = _2090 + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2194 = _2092 + _2192;
    float _2196 = fma(_2186, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2198 = fma(_2190, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2200 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2202 = -_1684;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2196);
    float _2206 = -_1686;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2198);
    float _2210 = -_1726;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2200);
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2216 = _2204 + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2220 = _2208 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2224 = _2212 + _2222;
    float _2226 = _2216 * _2216;
    float _2228 = fma(_2220, _2220, _2226);
    float _2230 = fma(_2224, _2224, _2228);
    float _2232 = rsqrt(_2230);
    float _2234 = sqrt(_2230);
    float _2236 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2238 = _2220 * _2236;
    float _2240 = _2224 * _2236;
    float _2242 = _2238 * _2238;
    float _2244 = _2240 * _2240;
    float _2246 = _2242 + _2244;
    float _2248 = sqrt(_2246);
    bool _2250 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2254 = _2248 + _2252;
    float _2256 = _2232;
    float _2258 = _2246;
    float _2260 = _2254;
    float _2262 = _2216;
    float _2264 = _2238;
    if (_2250)
    {
        float _2266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2256 = _2266;
    }
    float _2268 = _2256;
    if (_2250)
    {
        float _2270 = rsqrt(_2246);
        _2258 = _2270;
    }
    float _2272 = _2258;
    if (_2250)
    {
        float _2274 = _2254 * _2268;
        _2260 = _2274;
    }
    float _2276 = _2260;
    if (_2250)
    {
        float _2278 = _2276 * 0.15915493667125701904296875;
        _2116 = _2278;
    }
    float _2280 = _2116;
    float _2282 = _2268;
    float _2284 = _2280;
    if (_2250)
    {
        float _2286 = _2280 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        _2282 = _2288;
    }
    float _2290 = _2282;
    float _2292 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2294 = precise::max(0.0, _2292);
    float _2296 = _2224;
    float _2298 = _2294;
    if (_2250)
    {
        float _2300 = _2280 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        _2296 = _2302;
    }
    float _2304 = _2296;
    float _2306 = -_2236;
    float _2308 = -_2294;
    float _2310 = fma(_2216, _2306, _2308);
    if (!_2250)
    {
        _2262 = _2240;
    }
    float _2312 = _2262;
    float _2314 = _2312;
    if (_2250)
    {
        float _2316 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2316;
    }
    float _2318 = _2298;
    float _2320 = _2290;
    float _2322 = _2318;
    if (_2250)
    {
        float _2324 = fma(_2290, _2318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2320 = _2324;
    }
    float _2326 = _2320;
    float _2328 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2330 = _2326;
    float _2332 = _2304;
    if (_2250)
    {
        float _2334 = _2304 + (-1.0);
        _2322 = _2334;
    }
    float _2336 = _2322;
    float _2338 = _2336;
    if (_2250)
    {
        float _2340 = _2272 * _2326;
        _2016 = _2340;
    }
    float _2342 = _2016;
    if (!_2250)
    {
        _2330 = _2310;
    }
    float _2344 = _2330;
    float _2346 = _2344;
    if (_2250)
    {
        float _2348 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2284 = _2348;
    }
    float _2350 = _2284;
    if (_2250)
    {
        float _2352 = _2238 * _2342;
        _2264 = _2352;
    }
    float _2354 = _2264;
    if (!_2250)
    {
        _2338 = _2242;
    }
    float _2356 = _2338;
    float _2358 = _2356;
    if (_2250)
    {
        float _2360 = _2240 * _2342;
        _2314 = _2360;
    }
    float _2362 = _2314;
    if (_2250)
    {
        float _2364 = fma(_2310, _2304, _2350);
        _2346 = _2364;
    }
    float _2366 = _2346;
    if (_2250)
    {
        float _2368 = _2354 * _2354;
        _2358 = _2368;
    }
    float _2370 = _2358;
    if (!_2250)
    {
        _2332 = _2244;
    }
    float _2372 = _2332;
    float _2374 = _2372;
    if (_2250)
    {
        float _2376 = _2362 * _2362;
        _2374 = _2376;
    }
    float _2378 = _2374;
    float _2380 = fma(_2366, _2366, _2370);
    float _2382 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2384 = _2380 + _2378;
    float _2386 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2390 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2388);
    float _2392 = precise::clamp(_2390, 0.0, 1.0);
    float _2394 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2396 = rsqrt(_2384);
    float _2398 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2386);
    float _2400 = -_2392;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2394);
    float _2406 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2382);
    float _2408 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2398);
    float _2410 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2412 = abs(_2402);
    float _2414 = log2(_2412);
    float _2416 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2418 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2410);
    float _2420 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2404);
    float _2422 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2406);
    float _2424 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2426 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2418);
    float _2428 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2430 = _2396 * _2354;
    float _2432 = -_2424;
    float _2434 = fma(_2432, _2328, 1.0);
    float _2436 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2438 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2440 = _2396 * _2366;
    float _2442 = _2396 * _2362;
    float _2444 = _2422 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2446 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2438);
    float _2448 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2450 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2452 = log2(_2434);
    float _2454 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2446);
    float _2456 = -_2448;
    float _2458 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2456);
    float _2460 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2462 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2454);
    float _2464 = -_2442;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2458);
    float _2468 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2470 = exp2(_2450);
    float _2472 = fma(_2466, -0.5, 0.5);
    float _2474 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2468);
    float _2476 = fma(_2466, 0.5, 0.5);
    float _2478 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2460);
    float _2480 = _2440 + 1.0;
    float _2482 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2474);
    float _2484 = 1.0 / _2462;
    float _2486 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2478);
    float _2488 = fma(_2476, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2490 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2482);
    float _2492 = _2452 * 0.693147182464599609375;
    float _2494 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2486);
    float _2496 = fma(_2476, _2488, -0.212114393711090087890625);
    float _2498 = sqrt(_2472);
    float _2500 = -_2440;
    float _2502 = fma(_2470, _2480, _2500);
    float _2504 = fma(_2476, _2496, 1.570728778839111328125);
    float _2506 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2508 = fma(_2502, 0.5, 0.5);
    float _2510 = _2490 * _2484;
    float _2512 = _2494 * _2484;
    float _2514 = fma(_2510, 0.5, 0.5);
    float _2516 = fma(_2512, -0.5, 0.5);
    float _2518 = _2498 * 0.636619746685028076171875;
    float3 _6417 = float3(_2514, _2516, _2506);
    float _2520 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6417, float3(0.0), isnan(_6417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6417, float3(0.0), isnan(_6417)), level(0.0)).x;
    float _2522 = -_2504;
    float _2524 = fma(_2518, _2522, 1.0);
    float3 _6433 = float3(_2514, _2516, _2506);
    float4 _2527 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6433, float3(0.0), isnan(_6433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6433, float3(0.0), isnan(_6433)), level(0.0)).xyzw;
    float _2529 = _2527.x;
    float _2531 = _2527.y;
    float _2533 = _2527.z;
    float _2535 = _2527.w;
    float2 _6450 = float2(_2524, _2508);
    float3 _2539 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6450, float2(0.0), isnan(_6450)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6450, float2(0.0), isnan(_6450)), level(0.0)).xyz;
    float _2541 = _2539.x;
    float _2543 = _2539.y;
    float _2545 = _2539.z;
    float _2547 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2549 = _2428 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2551 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2549);
    float _2553 = exp2(_2547);
    float _2555 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2551);
    float _2557 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2555);
    float _2559 = _2557 + _2462;
    float _2561 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2490;
    out.gl_Position.y = _2494;
    out.gl_Position.z = _2557;
    out.gl_Position.w = _2462;
    float _2563 = _2559 * 0.5;
    float _2565 = -_2553;
    float _2567 = _2565 + 1.0;
    out.m_47.x = _2561;
    float _2569 = _2567 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2563;
    out.m_68.w = _2462;
    float _2571 = _2569 * _2520;
    float _2573 = -_2569;
    float _2575 = _2573 + 1.0;
    float _2577 = _2535 * _2571;
    float _2579 = _2545 * _2571;
    float _2581 = fma(_2541, _2577, _2529);
    float _2583 = fma(_2543, _2577, _2531);
    float _2585 = _2535 * _2575;
    float _2587 = fma(_2535, _2579, _2533);
    out.m_70.x = _2581;
    out.m_70.y = _2583;
    out.m_70.z = _2587;
    out.m_70.w = _2585;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

