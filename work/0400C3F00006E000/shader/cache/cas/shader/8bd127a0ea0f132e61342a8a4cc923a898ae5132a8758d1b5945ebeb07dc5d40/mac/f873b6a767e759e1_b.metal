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
    float4 m_58 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1735 = false;
    bool _1067 = false;
    bool _927 = false;
    bool _545 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2393 = as_type<float>(_107);
        out.gl_Position.z = _2393;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
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
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2462 = as_type<float>(_143);
        out.gl_Position.z = _2462;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _209 = _203 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
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
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_211, 0.5, 0.5);
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = -_219;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _317 = !_207;
    int _319 = _317 ? 0 : 1;
    float _321 = -_299;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_295;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _185, _315);
    int _333 = abs(_319);
    float _335 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _337 = !_293;
    int _339 = _337 ? 0 : 1;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _187, _335);
    int _347 = abs(_339);
    float _349 = fma(_283, _189, _341);
    float _351 = float(_329);
    float _353 = float(_333);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = float(_347);
    float _361 = fma(_353, _327, _357);
    float _363 = fma(_331, _285, _305);
    float _365 = fma(_345, _285, _307);
    float _367 = fma(_349, _285, _309);
    float _369 = abs(_323);
    float _371 = fma(_359, _369, _361);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_91);
        float _395 = 1.0 / _393;
        float _397 = _125 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _419 = _399 + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = -_415;
    float _443 = _441 + 1.0;
    float _445 = 1.0 / _439;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _431 * _443;
    float _461 = -_431;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _471 = _457 * _463;
    float _473 = 1.0 / _435;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _419 * _445;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = fma(_467, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = fma(_487, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = _403 * _473;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = in.m_56.x;
    float _501 = in.m_56.y;
    float _503 = fma(_477, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = _505 * _471;
    float _509 = _503 * _471;
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _513 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _515 = fma(_491, _459, _511);
    float _517 = fma(_489, _459, _513);
    float _519 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].x, _515);
    float _521 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].y, _517);
    float _523 = _519 * _499;
    float _525 = _521 * _501;
    bool _527 = !_469;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _531 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_91);
        float _549 = 1.0 / _547;
        float _551 = _125 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _571 = 1.0 / _557;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _581 = 1.0 / _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = _553 + _583;
    bool _587 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _589 = isnan(_553);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _601 = isnan(_553);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _561;
    float _613 = _585 * _571;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _617 = _553 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _621 = _553 + _619;
    float _623 = 1.0 / _575;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _627 = _553 + _625;
    float _629 = _617 * _581;
    bool _631 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _633 = isnan(_553);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _643;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _649 = 1.0 / _579;
    float _651 = _627 * _611;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _655 = _553 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _659 = _553 + _657;
    float _661 = -_641;
    float _663 = _661 + 1.0;
    float _665 = 1.0 / _569;
    float _667 = _621 * _623;
    bool _669 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _671 = isnan(_553);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _681;
    float _685 = fma(_645, _667, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _687 = -_679;
    float _689 = _687 + 1.0;
    float _691 = _655 * _649;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _697;
    float _701 = _679 * _663;
    float _703 = fma(_683, _613, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _705 = _597 * _689;
    float _707 = fma(_699, _613, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _713 = _659 * _665;
    float _715 = fma(_695, _613, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _717 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _719 = isnan(_553);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_597;
    float _731 = _729 + 1.0;
    bool _733 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _735 = isnan(_553);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _753 = _727 * _731;
    float _755 = -_727;
    float _757 = _755 + 1.0;
    bool _759 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _761 = isnan(_553);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_743;
    float _773 = _771 + 1.0;
    float _775 = fma(_747, _651, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _777 = _609 * _757;
    float _779 = -_609;
    float _781 = _779 + 1.0;
    float _783 = _769 * _773;
    float _785 = -_769;
    float _787 = _785 + 1.0;
    float _789 = fma(_711, _651, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _791 = fma(_751, _651, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _793 = _703 * _783;
    float _795 = _715 * _783;
    float _797 = _707 * _783;
    float _799 = _743 * _781;
    float _801 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].y, _795);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _809;
    float _813 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].z, _797);
    float _815 = fma(_775, _799, _801);
    float _817 = fma(_807, _667, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _819 = fma(_811, _667, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _821 = fma(_789, _799, _803);
    float _823 = fma(_791, _799, _813);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _837 = fma(_827, _691, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _839 = fma(_831, _691, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _841 = fma(_835, _691, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _843 = fma(_817, _777, _815);
    float _845 = fma(_819, _777, _821);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _851;
    float _855 = fma(_685, _777, _823);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _857;
    float _861 = fma(_837, _753, _843);
    float _863 = fma(_839, _753, _845);
    float _865 = fma(_849, _629, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _867 = fma(_853, _629, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _869 = fma(_841, _753, _855);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _879 = fma(_859, _629, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _885 = fma(_873, _713, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _887 = fma(_877, _713, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _889 = fma(_865, _705, _861);
    float _891 = fma(_883, _713, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _893 = fma(_867, _705, _863);
    float _895 = fma(_879, _705, _869);
    float _897 = fma(_885, _701, _889);
    float _899 = fma(_887, _701, _893);
    float _901 = fma(_891, _701, _895);
    float _903 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].x, _897);
    float _905 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].y, _899);
    float _907 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].z, _901);
    bool _909 = !_647;
    float _925;
    if (!_909)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _913 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _917 = _915 * _911;
        float _919 = floor(_917);
        float _921 = -_919;
        float _923 = _917 + _921;
        _925 = _923;
        _927 = true;
    }
    else
    {
        float _929 = float(_91);
        float _931 = 1.0 / _929;
        float _933 = _125 * _931;
        _925 = _933;
    }
    _927 = false;
    float _935 = _925;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _935 + _937;
    float _941 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _947 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_935);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_935);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    bool _979 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = isnan(_935);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = 1.0 / _945;
    float _993 = -_957;
    float _995 = _993 + 1.0;
    float _997 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _999 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1001 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = 1.0 / _961;
    float _1011 = _977 * _991;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = fma(_1011, _939, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1019 = _973 * _995;
    float _1021 = -_989;
    float _1023 = _1021 + 1.0;
    float _1025 = -_973;
    float _1027 = _1025 + 1.0;
    float _1029 = _1015 * _1009;
    float _1031 = _1017 * _1019;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1035 = _935 + _1033;
    float _1037 = _957 * _1023;
    float _1039 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1031);
    float _1041 = fma(_1029, _1035, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1043 = fma(_1041, _1037, _1039);
    float _1045 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1043);
    float _1047 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1001;
    out.m_58.y = _1005;
    out.m_58.z = _1007;
    out.m_58.w = _1047;
    bool _1049 = !_1003;
    float _1065;
    if (!_1049)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1053 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        float _1069 = float(_91);
        float _1071 = 1.0 / _1069;
        float _1073 = _125 * _1071;
        _1065 = _1073;
    }
    _1067 = false;
    float _1075 = _1065;
    float _1077 = in.m_51.y;
    float _1079 = _371 * _523;
    float _1081 = in.m_60.x;
    float _1083 = in.m_60.y;
    float _1085 = in.m_60.z;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _371 * _525;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1095 = _1093 != 0;
    float _1097 = in.m_62.x;
    float _1099 = in.m_62.y;
    float _1101 = in.m_62.z;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1111 = in.m_64.x;
    float _1113 = in.m_64.y;
    float _1115 = in.m_64.z;
    float _1117 = 1.0 / _1105;
    bool _1119 = _145 > 0.5;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1121;
    float _1125 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = 1.0 / _1123;
    float _1131 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1133;
    bool _1137 = _1077 > 0.5;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1143 = _365 * _1083;
    float _1145 = 1.0 / _1109;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    bool _1149 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1151 = isnan(_1075);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_363, _1081, _1143);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1163;
    float _1167 = _365 * _1099;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1173 = _365 * _1113;
    bool _1175 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1177 = isnan(_1075);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = 1.0 / _1165;
    float _1189 = fma(_363, _1097, _1167);
    float _1191 = fma(_363, _1111, _1173);
    float _1193 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1199 = fma(_367, _1101, _1189);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1203 = _1075 + _1201;
    float _1205 = _1193 * _1147;
    float _1207 = 1.0 / _1171;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1211 = _1075 + _1209;
    float _1213 = -_215;
    int _1215 = _1119 ? as_type<int>(_1213) : as_type<int>(_215);
    float _1217 = fma(_367, _1085, _1161);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1221 = _1075 + _1219;
    float _1223 = _1211 * _1117;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1227 = _1075 + _1225;
    float _1229 = _1203 * _1187;
    float _1231 = fma(_367, _1115, _1191);
    float _1233 = 1.0 / _1197;
    float _1235 = _1227 * _1129;
    bool _1237 = !_1089;
    float _1239 = _1237 ? _215 : as_type<float>(_1215);
    float _1241 = _1125 * _1131;
    float _1243 = _1221 * _1207;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1259 = _1075 + _1257;
    float _1261 = fma(_1247, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1263 = fma(_1251, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1265 = fma(_1255, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1267 = _1259 * _1145;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1271 = _1075 + _1269;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1273;
    float _1277 = -_223;
    int _1279 = _1137 ? as_type<int>(_1277) : as_type<int>(_223);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1301 = _1271 * _1233;
    bool _1303 = !_1095;
    float _1305 = _1303 ? _223 : as_type<float>(_1279);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1319 = fma(_1287, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1321 = fma(_1295, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1323 = fma(_1299, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1325 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1327 = isnan(_1075);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1339 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1341 = isnan(_1075);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1353 = fma(_1313, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1355 = fma(_1309, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1357 = fma(_1317, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1359 = fma(_1275, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1361 = fma(_1283, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1363 = fma(_1291, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1369;
    float _1373 = -_1335;
    float _1375 = _1373 + 1.0;
    float _1377 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1337);
    float _1379 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1351);
    float _1381 = -_1349;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_1135, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1387 = fma(_1367, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1389 = fma(_1371, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1391 = _1349 * _1375;
    float _1393 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1377);
    float _1395 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1379);
    bool _1397 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1399 = isnan(_1075);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = _1159 * _1383;
    float _1411 = -_1159;
    float _1413 = _1411 + 1.0;
    float _1415 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1417 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1419 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1421 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1423 = _1407 * _1413;
    float _1425 = -_1407;
    float _1427 = _1425 + 1.0;
    float _1429 = _1415 + _1419;
    float _1431 = _1417 + _1421;
    float _1433 = -_1185;
    float _1435 = _1433 + 1.0;
    float _1437 = _1185 * _1427;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1441 = _1429 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1445 = _1431 + _1443;
    bool _1447 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1449 = isnan(_1075);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1463 = _1441 * _1441;
    float _1465 = _1445 * _1445;
    bool _1467 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1469 = isnan(_1075);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1475 = _1471 || _1473;
    float _1477 = float(_1475);
    float _1479 = -_1457;
    float _1481 = _1479 + 1.0;
    float _1483 = _1457 * _1435;
    float _1485 = _1463 + _1465;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1491 = _1477 * _1481;
    float _1493 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = sqrt(_1485);
    float _1497 = -_1477;
    float _1499 = _1497 + 1.0;
    float _1501 = _1261 * _1491;
    float _1503 = _1263 * _1491;
    float _1505 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1507 = _1265 * _1491;
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1501);
    float _1511 = fma(_1141, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1513 = fma(_1489, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1515 = fma(_1461, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1517 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1503);
    float _1519 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1505);
    float _1521 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1507);
    float _1523 = fma(_1353, _1483, _1509);
    float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1527 = _1199 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1529 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1533 = fma(_1355, _1483, _1517);
    float _1535 = fma(_1357, _1483, _1521);
    float _1537 = fma(_1359, _1437, _1523);
    float _1539 = _1527 + _1531;
    float _1541 = fma(_1361, _1437, _1533);
    float _1543 = fma(_1363, _1437, _1535);
    float _1545 = fma(_1319, _1423, _1537);
    float _1547 = fma(_1321, _1423, _1541);
    float _1549 = fma(_1323, _1423, _1543);
    float _1551 = fma(_1385, _1409, _1545);
    float _1553 = _1531;
    float _1555 = _1463;
    float _1557 = _1465;
    float _1559 = _1429;
    float _1561 = _1431;
    float _1563 = _1357;
    float _1565 = _1527;
    if (!_1529)
    {
        _1553 = _1539;
    }
    float _1567 = _1553;
    bool _1569 = !_1529;
    float _1571 = _1567;
    float _1573 = _1525;
    if (!_1569)
    {
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1579 = _1495 + _1577;
        float _1581 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = rsqrt(_1485);
        float _1585 = _1579 * _1575;
        float _1587 = _1585 * 0.15915493667125701904296875;
        float _1589 = _1587 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = _1587 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = fma(_1591, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1599 = _1583 * _1597;
        float _1601 = fma(_1441, _1599, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1603 = _1595 + (-1.0);
        float _1605 = fma(_1445, _1599, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1609 = _1601 + _1607;
        float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1615 = _1605 + _1613;
        float _1617 = _1609 * _1609;
        float _1619 = fma(_1539, _1595, _1611);
        float _1621 = _1615 * _1615;
        _1571 = _1619;
        _1555 = _1617;
        _1557 = _1621;
        _1559 = _1601;
        _1561 = _1605;
    }
    float _1623 = _1571;
    float _1625 = _1555;
    float _1627 = _1557;
    float _1629 = _1559;
    float _1631 = _1561;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1635 = _1623 + _1633;
    float _1637 = fma(_1387, _1409, _1547);
    float _1639 = fma(_1389, _1409, _1549);
    float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1643 = fma(_1635, _1635, _1625);
    float _1645 = _1239 + 0.5;
    float _1647 = fma(_1511, _1391, _1551);
    float _1649 = fma(_1513, _1391, _1637);
    float _1651 = fma(_1515, _1391, _1639);
    float _1653 = _1643 + _1627;
    float _1655 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1657 = -_1305;
    float _1659 = _1657 + 0.5;
    float _1661 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1647);
    float _1663 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1649);
    float _1665 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1651);
    float _1667 = sqrt(_1653);
    float _1669 = _1655 * _1525;
    float _1671 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1673 = _1661 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1679 = _1671 * _1641;
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1669;
    out.m_66.y = _1679;
    out.m_68.x = _1681;
    out.m_68.y = _1683;
    out.m_68.z = _1685;
    bool _1687 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1689 = isnan(_1667);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1695 = _1691 || _1693;
    float _1697 = _1645;
    float _1699 = _1683;
    if (!_1695)
    {
        _1573 = 1.0;
    }
    float _1701 = _1573;
    bool _1703 = !_1695;
    float _1705 = _1701;
    if (!_1703)
    {
        bool _1707 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1709 = isnan(_1667);
        bool _1711 = _1707 || _1709;
        bool _1713 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1715 = _1711 || _1713;
        if (!_1715)
        {
            float _1717 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1719 = _1667 + _1717;
            float _1721 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1723 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1721;
            float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1729 = 1.0 / _1723;
            float _1731 = _1719 * _1729;
            float _1733 = fma(_1731, _1727, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1705 = _1733;
            _1735 = true;
        }
        else
        {
            bool _1737 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1739 = isnan(_1667);
            bool _1741 = _1737 || _1739;
            bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1745 = _1741 || _1743;
            if (!_1745)
            {
                float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1749 = _1667 + _1747;
                float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1753 = _1751 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1757 = _1755 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1759 = 1.0 / _1753;
                float _1761 = _1749 * _1759;
                float _1763 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1705 = _1763;
                _1735 = true;
            }
            else
            {
                _1705 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1735 = false;
    float _1765 = _1705;
    float _1767 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1769 = _1623 + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1773 = _1629 + _1771;
    float _1775 = fma(_1769, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1779 = _1631 + _1777;
    float _1781 = fma(_1773, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1785 = _1775 + _1783;
    float _1787 = fma(_1779, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1791 = _1781 + _1789;
    float _1793 = _1785 * _1785;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1797 = _1787 + _1795;
    float _1799 = fma(_1791, _1791, _1793);
    float _1801 = fma(_1797, _1797, _1799);
    float _1803 = rsqrt(_1801);
    float _1805 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1807 = _1791 * _1805;
    float _1809 = _1797 * _1805;
    float _1811 = _1807 * _1807;
    float _1813 = _1809 * _1809;
    float _1815 = _1811 + _1813;
    float _1817 = sqrt(_1815);
    bool _1819 = _1817 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1823 = _1817 + _1821;
    float _1825 = _1797;
    float _1827 = _1815;
    float _1829 = _1823;
    float _1831 = _1807;
    if (_1819)
    {
        float _1833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1825 = _1833;
    }
    float _1835 = _1825;
    if (_1819)
    {
        float _1837 = rsqrt(_1815);
        _1827 = _1837;
    }
    float _1839 = _1827;
    float _1841 = _1839;
    if (_1819)
    {
        float _1843 = _1823 * _1835;
        _1829 = _1843;
    }
    float _1845 = _1829;
    if (_1819)
    {
        float _1847 = _1845 * 0.15915493667125701904296875;
        _1697 = _1847;
    }
    float _1849 = _1697;
    float _1851 = _1803;
    if (_1819)
    {
        float _1853 = _1849 * 6.283185482025146484375;
        float _1855 = sin(_1853);
        _1851 = _1855;
    }
    float _1857 = _1851;
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1861 = precise::max(0.0, _1859);
    float _1863 = _1659;
    float _1865 = _1861;
    float _1867 = _1859;
    if (_1819)
    {
        float _1869 = _1849 * 6.283185482025146484375;
        float _1871 = cos(_1869);
        _1863 = _1871;
    }
    float _1873 = _1863;
    float _1875 = -_1805;
    float _1877 = -_1861;
    float _1879 = fma(_1785, _1875, _1877);
    if (_1819)
    {
        float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1881;
    }
    float _1883 = _1865;
    float _1885 = sqrt(_1801);
    float _1887 = _1857;
    float _1889 = _1883;
    if (_1819)
    {
        float _1891 = fma(_1857, _1883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = _1893;
    if (!_1819)
    {
        _1889 = _1809;
    }
    float _1897 = _1889;
    float _1899 = _1897;
    if (_1819)
    {
        float _1901 = _1873 + (-1.0);
        _1867 = _1901;
    }
    float _1903 = _1867;
    float _1905 = _1903;
    if (_1819)
    {
        float _1907 = _1839 * _1893;
        _1699 = _1907;
    }
    float _1909 = _1699;
    if (!_1819)
    {
        _1895 = _1879;
    }
    float _1911 = _1895;
    float _1913 = _1911;
    if (_1819)
    {
        float _1915 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1915;
    }
    float _1917 = _1563;
    if (_1819)
    {
        float _1919 = _1807 * _1909;
        _1831 = _1919;
    }
    float _1921 = _1831;
    if (!_1819)
    {
        _1841 = _1811;
    }
    float _1923 = _1841;
    float _1925 = _1923;
    if (_1819)
    {
        float _1927 = _1809 * _1909;
        _1899 = _1927;
    }
    float _1929 = _1899;
    if (_1819)
    {
        float _1931 = fma(_1879, _1873, _1917);
        _1913 = _1931;
    }
    float _1933 = _1913;
    if (_1819)
    {
        float _1935 = _1921 * _1921;
        _1925 = _1935;
    }
    float _1937 = _1925;
    if (!_1819)
    {
        _1905 = _1813;
    }
    float _1939 = _1905;
    float _1941 = _1939;
    if (_1819)
    {
        float _1943 = _1929 * _1929;
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = fma(_1933, _1933, _1937);
    float _1949 = _1947 + _1945;
    float _1951 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1955 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1953);
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1961 = rsqrt(_1949);
    float _1963 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1951);
    float _1965 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = -_1957;
    float _1969 = _1967 + 1.0;
    float _1971 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1973 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1963);
    float _1975 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1977 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1979 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1971);
    float _1981 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1983 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1975);
    float _1985 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1977);
    float _1987 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1979);
    float _1989 = abs(_1969);
    float _1991 = log2(_1989);
    float _1993 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1995 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1985);
    float _1997 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1999 = _1961 * _1921;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2003 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2005 = _1961 * _1929;
    float _2007 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2009 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2011 = _1961 * _1933;
    float _2013 = -_2003;
    float _2015 = fma(_2013, _1959, 1.0);
    float _2017 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2019 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2009);
    float _2021 = -_2007;
    float _2023 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2021);
    float _2025 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2019);
    float _2029 = -_2005;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2023);
    float _2033 = log2(_2015);
    float _2035 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2037 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2039 = fma(_2031, -0.5, 0.5);
    float _2041 = fma(_2031, 0.5, 0.5);
    float _2043 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2035);
    float _2045 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2037);
    float _2047 = _2011 + 1.0;
    float _2049 = exp2(_2025);
    float _2051 = fma(_2041, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2053 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2043);
    float _2055 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2045);
    float _2057 = fma(_2041, _2051, -0.212114393711090087890625);
    float _2059 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2053);
    float _2061 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2055);
    float _2063 = 1.0 / _2027;
    float _2065 = _2033 * 0.693147182464599609375;
    float _2067 = fma(_2041, _2057, 1.570728778839111328125);
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2071 = sqrt(_2039);
    float _2073 = -_2011;
    float _2075 = fma(_2049, _2047, _2073);
    float _2077 = fma(_2075, 0.5, 0.5);
    float _2079 = _2059 * _2063;
    float _2081 = _2061 * _2063;
    float _2083 = fma(_2079, 0.5, 0.5);
    float _2085 = fma(_2081, -0.5, 0.5);
    float _2087 = _2071 * 0.636619746685028076171875;
    float _2089 = -_2067;
    float _2091 = fma(_2087, _2089, 1.0);
    float3 _5631 = float3(_2083, _2085, _2069);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5631, float3(0.0), isnan(_5631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5631, float3(0.0), isnan(_5631)), level(0.0)).x;
    float3 _5642 = float3(_2083, _2085, _2069);
    float4 _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5642, float3(0.0), isnan(_5642)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5642, float3(0.0), isnan(_5642)), level(0.0)).xyzw;
    float _2098 = _2096.x;
    float _2100 = _2096.y;
    float _2102 = _2096.z;
    float _2104 = _2096.w;
    float2 _5659 = float2(_2091, _2077);
    float3 _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5659, float2(0.0), isnan(_5659)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5659, float2(0.0), isnan(_5659)), level(0.0)).xyz;
    float _2110 = _2108.x;
    float _2112 = _2108.y;
    float _2114 = _2108.z;
    float _2116 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2118 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2120 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2116);
    float _2122 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2124 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2118);
    float _2126 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2120);
    float _2128 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2122);
    float _2130 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2132 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2128);
    float _2134 = 1.0 / _2130;
    float _2136 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2138 = _2136 + _2130;
    float _2140 = _2138 * _2134;
    float _2142 = _2140 * 0.5;
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2146 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2144);
    bool _2148 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan(0.5);
    bool _2156 = _2152 || _2154;
    float _2158 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2160 = 1.0 / _2146;
    float _2162 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2124);
    float _2164 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2162);
    float _2166 = exp2(_2158);
    float _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2156)
    {
        _1565 = 1.0;
    }
    float _2170 = _1565;
    float _2172 = _2170;
    if (_2156)
    {
        _2168 = 1.0;
    }
    float _2174 = _2168;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2178 = _2160 * _2176;
    float _2180 = _2174;
    if (!_2156)
    {
        float _2182 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2184 = _2182 * 0.15915493667125701904296875;
        float _2186 = _2184 * 6.283185482025146484375;
        float _2188 = cos(_2186);
        float _2190 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = _2184 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = 1.0 / _2188;
        float _2200 = _2192 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = _2196 * _2198;
        float _2206 = _2192 * 6.283185482025146484375;
        float _2208 = sin(_2206);
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2210;
        float _2214 = _2202 * _2204;
        float _2216 = 1.0 / _2212;
        float _2218 = 1.0 / _2214;
        float _2220 = _2208 * _2218;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2224 = fma(_2178, _2220, _2222);
        float _2226 = _2224 * _2216;
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        _2172 = _2228;
    }
    float _2230 = _2172;
    if (!_2156)
    {
        float _2232 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2234 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        float _2240 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2242 = _2240 * 0.15915493667125701904296875;
        float _2244 = _2234 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = 1.0 / _2238;
        float _2250 = _2242 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        float _2254 = _2246 * _2248;
        float _2256 = _2242 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        float _2260 = _2252 * _2254;
        float _2262 = 1.0 / _2260;
        float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2266 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2264;
        float _2268 = 1.0 / _2266;
        float _2270 = _2258 * _2262;
        float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2274 = fma(_2178, _2270, _2272);
        float _2276 = _2274 * _2268;
        float _2278 = precise::clamp(_2276, 0.0, 1.0);
        float _2280 = -_2278;
        float _2282 = _2280 + 1.0;
        _2180 = _2282;
    }
    float _2284 = _2180;
    float _2286 = -_2166;
    float _2288 = _2286 + 1.0;
    bool _2290 = _2230 > 0.0;
    bool _2292 = isnan(_2230);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(0.0);
    bool _2298 = _2294 || _2296;
    float _2300 = _2164 + _2027;
    float _2302 = _2230 * _2284;
    float _2304 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2306 = _2284 <= 0.0;
    bool _2308 = !_2298;
    bool _2310 = _2306 || _2308;
    float _2312 = _2300 * 0.5;
    float _2314 = _2304 * _2093;
    float _2316 = _2302 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2318 = -_2304;
    float _2320 = _2318 + 1.0;
    float _2322 = _2104 * _2314;
    float _2324 = _2114 * _2314;
    out.m_70.z = _2312;
    out.m_70.w = _2027;
    float _2326 = _2316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2328 = fma(_2110, _2322, _2098);
    float _2330 = fma(_2112, _2322, _2100);
    out.gl_Position.x = _2059;
    out.gl_Position.y = _2061;
    out.gl_Position.z = _2164;
    out.gl_Position.w = _2027;
    out.m_47.x = _2326;
    float _2332 = _2104 * _2320;
    float _2334 = fma(_2104, _2324, _2102);
    out.m_72.x = _2328;
    out.m_72.y = _2330;
    out.m_72.z = _2334;
    out.m_72.w = _2332;
    if (!_2310)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2336;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1735 = false;
    bool _1067 = false;
    bool _927 = false;
    bool _545 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2393 = as_type<float>(_107);
        out.gl_Position.z = _2393;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
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
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2462 = as_type<float>(_143);
        out.gl_Position.z = _2462;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _209 = _203 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
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
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_211, 0.5, 0.5);
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = -_219;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _317 = !_207;
    int _319 = _317 ? 0 : 1;
    float _321 = -_299;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_295;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _185, _315);
    int _333 = abs(_319);
    float _335 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _337 = !_293;
    int _339 = _337 ? 0 : 1;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _187, _335);
    int _347 = abs(_339);
    float _349 = fma(_283, _189, _341);
    float _351 = float(_329);
    float _353 = float(_333);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = float(_347);
    float _361 = fma(_353, _327, _357);
    float _363 = fma(_331, _285, _305);
    float _365 = fma(_345, _285, _307);
    float _367 = fma(_349, _285, _309);
    float _369 = abs(_323);
    float _371 = fma(_359, _369, _361);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_91);
        float _395 = 1.0 / _393;
        float _397 = _125 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _419 = _399 + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = -_415;
    float _443 = _441 + 1.0;
    float _445 = 1.0 / _439;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _431 * _443;
    float _461 = -_431;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _471 = _457 * _463;
    float _473 = 1.0 / _435;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _419 * _445;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = fma(_467, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = fma(_487, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = _403 * _473;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = in.m_56.x;
    float _501 = in.m_56.y;
    float _503 = fma(_477, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = _505 * _471;
    float _509 = _503 * _471;
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _513 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _515 = fma(_491, _459, _511);
    float _517 = fma(_489, _459, _513);
    float _519 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].x, _515);
    float _521 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].y, _517);
    float _523 = _519 * _499;
    float _525 = _521 * _501;
    bool _527 = !_469;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _531 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_91);
        float _549 = 1.0 / _547;
        float _551 = _125 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _571 = 1.0 / _557;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _581 = 1.0 / _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = _553 + _583;
    bool _587 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _589 = isnan(_553);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _601 = isnan(_553);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _561;
    float _613 = _585 * _571;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _617 = _553 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _621 = _553 + _619;
    float _623 = 1.0 / _575;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _627 = _553 + _625;
    float _629 = _617 * _581;
    bool _631 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _633 = isnan(_553);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _643;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _649 = 1.0 / _579;
    float _651 = _627 * _611;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _655 = _553 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _659 = _553 + _657;
    float _661 = -_641;
    float _663 = _661 + 1.0;
    float _665 = 1.0 / _569;
    float _667 = _621 * _623;
    bool _669 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _671 = isnan(_553);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _681;
    float _685 = fma(_645, _667, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _687 = -_679;
    float _689 = _687 + 1.0;
    float _691 = _655 * _649;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _697;
    float _701 = _679 * _663;
    float _703 = fma(_683, _613, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _705 = _597 * _689;
    float _707 = fma(_699, _613, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _713 = _659 * _665;
    float _715 = fma(_695, _613, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _717 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _719 = isnan(_553);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_597;
    float _731 = _729 + 1.0;
    bool _733 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _735 = isnan(_553);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _753 = _727 * _731;
    float _755 = -_727;
    float _757 = _755 + 1.0;
    bool _759 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _761 = isnan(_553);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_743;
    float _773 = _771 + 1.0;
    float _775 = fma(_747, _651, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _777 = _609 * _757;
    float _779 = -_609;
    float _781 = _779 + 1.0;
    float _783 = _769 * _773;
    float _785 = -_769;
    float _787 = _785 + 1.0;
    float _789 = fma(_711, _651, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _791 = fma(_751, _651, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _793 = _703 * _783;
    float _795 = _715 * _783;
    float _797 = _707 * _783;
    float _799 = _743 * _781;
    float _801 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].y, _795);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _809;
    float _813 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].z, _797);
    float _815 = fma(_775, _799, _801);
    float _817 = fma(_807, _667, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _819 = fma(_811, _667, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _821 = fma(_789, _799, _803);
    float _823 = fma(_791, _799, _813);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _837 = fma(_827, _691, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _839 = fma(_831, _691, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _841 = fma(_835, _691, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _843 = fma(_817, _777, _815);
    float _845 = fma(_819, _777, _821);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _851;
    float _855 = fma(_685, _777, _823);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _857;
    float _861 = fma(_837, _753, _843);
    float _863 = fma(_839, _753, _845);
    float _865 = fma(_849, _629, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _867 = fma(_853, _629, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _869 = fma(_841, _753, _855);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _879 = fma(_859, _629, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _885 = fma(_873, _713, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _887 = fma(_877, _713, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _889 = fma(_865, _705, _861);
    float _891 = fma(_883, _713, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _893 = fma(_867, _705, _863);
    float _895 = fma(_879, _705, _869);
    float _897 = fma(_885, _701, _889);
    float _899 = fma(_887, _701, _893);
    float _901 = fma(_891, _701, _895);
    float _903 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].x, _897);
    float _905 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].y, _899);
    float _907 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].z, _901);
    bool _909 = !_647;
    float _925;
    if (!_909)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _913 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _917 = _915 * _911;
        float _919 = floor(_917);
        float _921 = -_919;
        float _923 = _917 + _921;
        _925 = _923;
        _927 = true;
    }
    else
    {
        float _929 = float(_91);
        float _931 = 1.0 / _929;
        float _933 = _125 * _931;
        _925 = _933;
    }
    _927 = false;
    float _935 = _925;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _935 + _937;
    float _941 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _947 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_935);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_935);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    bool _979 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = isnan(_935);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = 1.0 / _945;
    float _993 = -_957;
    float _995 = _993 + 1.0;
    float _997 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _999 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1001 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = 1.0 / _961;
    float _1011 = _977 * _991;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = fma(_1011, _939, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1019 = _973 * _995;
    float _1021 = -_989;
    float _1023 = _1021 + 1.0;
    float _1025 = -_973;
    float _1027 = _1025 + 1.0;
    float _1029 = _1015 * _1009;
    float _1031 = _1017 * _1019;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1035 = _935 + _1033;
    float _1037 = _957 * _1023;
    float _1039 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1031);
    float _1041 = fma(_1029, _1035, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1043 = fma(_1041, _1037, _1039);
    float _1045 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1043);
    float _1047 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1001;
    out.m_58.y = _1005;
    out.m_58.z = _1007;
    out.m_58.w = _1047;
    bool _1049 = !_1003;
    float _1065;
    if (!_1049)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1053 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        float _1069 = float(_91);
        float _1071 = 1.0 / _1069;
        float _1073 = _125 * _1071;
        _1065 = _1073;
    }
    _1067 = false;
    float _1075 = _1065;
    float _1077 = in.m_51.y;
    float _1079 = _371 * _523;
    float _1081 = in.m_60.x;
    float _1083 = in.m_60.y;
    float _1085 = in.m_60.z;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _371 * _525;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1095 = _1093 != 0;
    float _1097 = in.m_62.x;
    float _1099 = in.m_62.y;
    float _1101 = in.m_62.z;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1111 = in.m_64.x;
    float _1113 = in.m_64.y;
    float _1115 = in.m_64.z;
    float _1117 = 1.0 / _1105;
    bool _1119 = _145 > 0.5;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1121;
    float _1125 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = 1.0 / _1123;
    float _1131 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1133;
    bool _1137 = _1077 > 0.5;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1143 = _365 * _1083;
    float _1145 = 1.0 / _1109;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    bool _1149 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1151 = isnan(_1075);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_363, _1081, _1143);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1163;
    float _1167 = _365 * _1099;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1173 = _365 * _1113;
    bool _1175 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1177 = isnan(_1075);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = 1.0 / _1165;
    float _1189 = fma(_363, _1097, _1167);
    float _1191 = fma(_363, _1111, _1173);
    float _1193 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1199 = fma(_367, _1101, _1189);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1203 = _1075 + _1201;
    float _1205 = _1193 * _1147;
    float _1207 = 1.0 / _1171;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1211 = _1075 + _1209;
    float _1213 = -_215;
    int _1215 = _1119 ? as_type<int>(_1213) : as_type<int>(_215);
    float _1217 = fma(_367, _1085, _1161);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1221 = _1075 + _1219;
    float _1223 = _1211 * _1117;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1227 = _1075 + _1225;
    float _1229 = _1203 * _1187;
    float _1231 = fma(_367, _1115, _1191);
    float _1233 = 1.0 / _1197;
    float _1235 = _1227 * _1129;
    bool _1237 = !_1089;
    float _1239 = _1237 ? _215 : as_type<float>(_1215);
    float _1241 = _1125 * _1131;
    float _1243 = _1221 * _1207;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1259 = _1075 + _1257;
    float _1261 = fma(_1247, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1263 = fma(_1251, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1265 = fma(_1255, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1267 = _1259 * _1145;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1271 = _1075 + _1269;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1273;
    float _1277 = -_223;
    int _1279 = _1137 ? as_type<int>(_1277) : as_type<int>(_223);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1301 = _1271 * _1233;
    bool _1303 = !_1095;
    float _1305 = _1303 ? _223 : as_type<float>(_1279);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1319 = fma(_1287, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1321 = fma(_1295, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1323 = fma(_1299, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1325 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1327 = isnan(_1075);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1339 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1341 = isnan(_1075);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1353 = fma(_1313, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1355 = fma(_1309, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1357 = fma(_1317, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1359 = fma(_1275, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1361 = fma(_1283, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1363 = fma(_1291, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1369;
    float _1373 = -_1335;
    float _1375 = _1373 + 1.0;
    float _1377 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1337);
    float _1379 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1351);
    float _1381 = -_1349;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_1135, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1387 = fma(_1367, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1389 = fma(_1371, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1391 = _1349 * _1375;
    float _1393 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1377);
    float _1395 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1379);
    bool _1397 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1399 = isnan(_1075);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = _1159 * _1383;
    float _1411 = -_1159;
    float _1413 = _1411 + 1.0;
    float _1415 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1417 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1419 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1421 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1423 = _1407 * _1413;
    float _1425 = -_1407;
    float _1427 = _1425 + 1.0;
    float _1429 = _1415 + _1419;
    float _1431 = _1417 + _1421;
    float _1433 = -_1185;
    float _1435 = _1433 + 1.0;
    float _1437 = _1185 * _1427;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1441 = _1429 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1445 = _1431 + _1443;
    bool _1447 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1449 = isnan(_1075);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1463 = _1441 * _1441;
    float _1465 = _1445 * _1445;
    bool _1467 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1469 = isnan(_1075);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1475 = _1471 || _1473;
    float _1477 = float(_1475);
    float _1479 = -_1457;
    float _1481 = _1479 + 1.0;
    float _1483 = _1457 * _1435;
    float _1485 = _1463 + _1465;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1491 = _1477 * _1481;
    float _1493 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = sqrt(_1485);
    float _1497 = -_1477;
    float _1499 = _1497 + 1.0;
    float _1501 = _1261 * _1491;
    float _1503 = _1263 * _1491;
    float _1505 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1507 = _1265 * _1491;
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1501);
    float _1511 = fma(_1141, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1513 = fma(_1489, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1515 = fma(_1461, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1517 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1503);
    float _1519 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1505);
    float _1521 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1507);
    float _1523 = fma(_1353, _1483, _1509);
    float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1527 = _1199 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1529 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1533 = fma(_1355, _1483, _1517);
    float _1535 = fma(_1357, _1483, _1521);
    float _1537 = fma(_1359, _1437, _1523);
    float _1539 = _1527 + _1531;
    float _1541 = fma(_1361, _1437, _1533);
    float _1543 = fma(_1363, _1437, _1535);
    float _1545 = fma(_1319, _1423, _1537);
    float _1547 = fma(_1321, _1423, _1541);
    float _1549 = fma(_1323, _1423, _1543);
    float _1551 = fma(_1385, _1409, _1545);
    float _1553 = _1531;
    float _1555 = _1463;
    float _1557 = _1465;
    float _1559 = _1429;
    float _1561 = _1431;
    float _1563 = _1357;
    float _1565 = _1527;
    if (!_1529)
    {
        _1553 = _1539;
    }
    float _1567 = _1553;
    bool _1569 = !_1529;
    float _1571 = _1567;
    float _1573 = _1525;
    if (!_1569)
    {
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1579 = _1495 + _1577;
        float _1581 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = rsqrt(_1485);
        float _1585 = _1579 * _1575;
        float _1587 = _1585 * 0.15915493667125701904296875;
        float _1589 = _1587 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = _1587 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = fma(_1591, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1599 = _1583 * _1597;
        float _1601 = fma(_1441, _1599, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1603 = _1595 + (-1.0);
        float _1605 = fma(_1445, _1599, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1609 = _1601 + _1607;
        float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1615 = _1605 + _1613;
        float _1617 = _1609 * _1609;
        float _1619 = fma(_1539, _1595, _1611);
        float _1621 = _1615 * _1615;
        _1571 = _1619;
        _1555 = _1617;
        _1557 = _1621;
        _1559 = _1601;
        _1561 = _1605;
    }
    float _1623 = _1571;
    float _1625 = _1555;
    float _1627 = _1557;
    float _1629 = _1559;
    float _1631 = _1561;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1635 = _1623 + _1633;
    float _1637 = fma(_1387, _1409, _1547);
    float _1639 = fma(_1389, _1409, _1549);
    float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1643 = fma(_1635, _1635, _1625);
    float _1645 = _1239 + 0.5;
    float _1647 = fma(_1511, _1391, _1551);
    float _1649 = fma(_1513, _1391, _1637);
    float _1651 = fma(_1515, _1391, _1639);
    float _1653 = _1643 + _1627;
    float _1655 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1657 = -_1305;
    float _1659 = _1657 + 0.5;
    float _1661 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1647);
    float _1663 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1649);
    float _1665 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1651);
    float _1667 = sqrt(_1653);
    float _1669 = _1655 * _1525;
    float _1671 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1673 = _1661 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1679 = _1671 * _1641;
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1669;
    out.m_66.y = _1679;
    out.m_68.x = _1681;
    out.m_68.y = _1683;
    out.m_68.z = _1685;
    bool _1687 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1689 = isnan(_1667);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1695 = _1691 || _1693;
    float _1697 = _1645;
    float _1699 = _1683;
    if (!_1695)
    {
        _1573 = 1.0;
    }
    float _1701 = _1573;
    bool _1703 = !_1695;
    float _1705 = _1701;
    if (!_1703)
    {
        bool _1707 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1709 = isnan(_1667);
        bool _1711 = _1707 || _1709;
        bool _1713 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1715 = _1711 || _1713;
        if (!_1715)
        {
            float _1717 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1719 = _1667 + _1717;
            float _1721 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1723 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1721;
            float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1729 = 1.0 / _1723;
            float _1731 = _1719 * _1729;
            float _1733 = fma(_1731, _1727, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1705 = _1733;
            _1735 = true;
        }
        else
        {
            bool _1737 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1739 = isnan(_1667);
            bool _1741 = _1737 || _1739;
            bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1745 = _1741 || _1743;
            if (!_1745)
            {
                float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1749 = _1667 + _1747;
                float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1753 = _1751 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1757 = _1755 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1759 = 1.0 / _1753;
                float _1761 = _1749 * _1759;
                float _1763 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1705 = _1763;
                _1735 = true;
            }
            else
            {
                _1705 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1735 = false;
    float _1765 = _1705;
    float _1767 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1769 = _1623 + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1773 = _1629 + _1771;
    float _1775 = fma(_1769, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1779 = _1631 + _1777;
    float _1781 = fma(_1773, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1785 = _1775 + _1783;
    float _1787 = fma(_1779, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1791 = _1781 + _1789;
    float _1793 = _1785 * _1785;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1797 = _1787 + _1795;
    float _1799 = fma(_1791, _1791, _1793);
    float _1801 = fma(_1797, _1797, _1799);
    float _1803 = rsqrt(_1801);
    float _1805 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1807 = _1791 * _1805;
    float _1809 = _1797 * _1805;
    float _1811 = _1807 * _1807;
    float _1813 = _1809 * _1809;
    float _1815 = _1811 + _1813;
    float _1817 = sqrt(_1815);
    bool _1819 = _1817 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1823 = _1817 + _1821;
    float _1825 = _1797;
    float _1827 = _1815;
    float _1829 = _1823;
    float _1831 = _1807;
    if (_1819)
    {
        float _1833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1825 = _1833;
    }
    float _1835 = _1825;
    if (_1819)
    {
        float _1837 = rsqrt(_1815);
        _1827 = _1837;
    }
    float _1839 = _1827;
    float _1841 = _1839;
    if (_1819)
    {
        float _1843 = _1823 * _1835;
        _1829 = _1843;
    }
    float _1845 = _1829;
    if (_1819)
    {
        float _1847 = _1845 * 0.15915493667125701904296875;
        _1697 = _1847;
    }
    float _1849 = _1697;
    float _1851 = _1803;
    if (_1819)
    {
        float _1853 = _1849 * 6.283185482025146484375;
        float _1855 = sin(_1853);
        _1851 = _1855;
    }
    float _1857 = _1851;
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1861 = precise::max(0.0, _1859);
    float _1863 = _1659;
    float _1865 = _1861;
    float _1867 = _1859;
    if (_1819)
    {
        float _1869 = _1849 * 6.283185482025146484375;
        float _1871 = cos(_1869);
        _1863 = _1871;
    }
    float _1873 = _1863;
    float _1875 = -_1805;
    float _1877 = -_1861;
    float _1879 = fma(_1785, _1875, _1877);
    if (_1819)
    {
        float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1881;
    }
    float _1883 = _1865;
    float _1885 = sqrt(_1801);
    float _1887 = _1857;
    float _1889 = _1883;
    if (_1819)
    {
        float _1891 = fma(_1857, _1883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = _1893;
    if (!_1819)
    {
        _1889 = _1809;
    }
    float _1897 = _1889;
    float _1899 = _1897;
    if (_1819)
    {
        float _1901 = _1873 + (-1.0);
        _1867 = _1901;
    }
    float _1903 = _1867;
    float _1905 = _1903;
    if (_1819)
    {
        float _1907 = _1839 * _1893;
        _1699 = _1907;
    }
    float _1909 = _1699;
    if (!_1819)
    {
        _1895 = _1879;
    }
    float _1911 = _1895;
    float _1913 = _1911;
    if (_1819)
    {
        float _1915 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1915;
    }
    float _1917 = _1563;
    if (_1819)
    {
        float _1919 = _1807 * _1909;
        _1831 = _1919;
    }
    float _1921 = _1831;
    if (!_1819)
    {
        _1841 = _1811;
    }
    float _1923 = _1841;
    float _1925 = _1923;
    if (_1819)
    {
        float _1927 = _1809 * _1909;
        _1899 = _1927;
    }
    float _1929 = _1899;
    if (_1819)
    {
        float _1931 = fma(_1879, _1873, _1917);
        _1913 = _1931;
    }
    float _1933 = _1913;
    if (_1819)
    {
        float _1935 = _1921 * _1921;
        _1925 = _1935;
    }
    float _1937 = _1925;
    if (!_1819)
    {
        _1905 = _1813;
    }
    float _1939 = _1905;
    float _1941 = _1939;
    if (_1819)
    {
        float _1943 = _1929 * _1929;
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = fma(_1933, _1933, _1937);
    float _1949 = _1947 + _1945;
    float _1951 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1955 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1953);
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1961 = rsqrt(_1949);
    float _1963 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1951);
    float _1965 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = -_1957;
    float _1969 = _1967 + 1.0;
    float _1971 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1973 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1963);
    float _1975 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1977 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1979 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1971);
    float _1981 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1983 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1975);
    float _1985 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1977);
    float _1987 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1979);
    float _1989 = abs(_1969);
    float _1991 = log2(_1989);
    float _1993 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1995 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1985);
    float _1997 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1999 = _1961 * _1921;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2003 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2005 = _1961 * _1929;
    float _2007 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2009 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2011 = _1961 * _1933;
    float _2013 = -_2003;
    float _2015 = fma(_2013, _1959, 1.0);
    float _2017 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2019 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2009);
    float _2021 = -_2007;
    float _2023 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2021);
    float _2025 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2019);
    float _2029 = -_2005;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2023);
    float _2033 = log2(_2015);
    float _2035 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2037 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2039 = fma(_2031, -0.5, 0.5);
    float _2041 = fma(_2031, 0.5, 0.5);
    float _2043 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2035);
    float _2045 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2037);
    float _2047 = _2011 + 1.0;
    float _2049 = exp2(_2025);
    float _2051 = fma(_2041, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2053 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2043);
    float _2055 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2045);
    float _2057 = fma(_2041, _2051, -0.212114393711090087890625);
    float _2059 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2053);
    float _2061 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2055);
    float _2063 = 1.0 / _2027;
    float _2065 = _2033 * 0.693147182464599609375;
    float _2067 = fma(_2041, _2057, 1.570728778839111328125);
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2071 = sqrt(_2039);
    float _2073 = -_2011;
    float _2075 = fma(_2049, _2047, _2073);
    float _2077 = fma(_2075, 0.5, 0.5);
    float _2079 = _2059 * _2063;
    float _2081 = _2061 * _2063;
    float _2083 = fma(_2079, 0.5, 0.5);
    float _2085 = fma(_2081, -0.5, 0.5);
    float _2087 = _2071 * 0.636619746685028076171875;
    float _2089 = -_2067;
    float _2091 = fma(_2087, _2089, 1.0);
    float3 _5631 = float3(_2083, _2085, _2069);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5631, float3(0.0), isnan(_5631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5631, float3(0.0), isnan(_5631)), level(0.0)).x;
    float3 _5642 = float3(_2083, _2085, _2069);
    float4 _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5642, float3(0.0), isnan(_5642)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5642, float3(0.0), isnan(_5642)), level(0.0)).xyzw;
    float _2098 = _2096.x;
    float _2100 = _2096.y;
    float _2102 = _2096.z;
    float _2104 = _2096.w;
    float2 _5659 = float2(_2091, _2077);
    float3 _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5659, float2(0.0), isnan(_5659)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5659, float2(0.0), isnan(_5659)), level(0.0)).xyz;
    float _2110 = _2108.x;
    float _2112 = _2108.y;
    float _2114 = _2108.z;
    float _2116 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2118 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2120 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2116);
    float _2122 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2124 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2118);
    float _2126 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2120);
    float _2128 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2122);
    float _2130 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2132 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2128);
    float _2134 = 1.0 / _2130;
    float _2136 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2138 = _2136 + _2130;
    float _2140 = _2138 * _2134;
    float _2142 = _2140 * 0.5;
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2146 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2144);
    bool _2148 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan(0.5);
    bool _2156 = _2152 || _2154;
    float _2158 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2160 = 1.0 / _2146;
    float _2162 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2124);
    float _2164 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2162);
    float _2166 = exp2(_2158);
    float _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2156)
    {
        _1565 = 1.0;
    }
    float _2170 = _1565;
    float _2172 = _2170;
    if (_2156)
    {
        _2168 = 1.0;
    }
    float _2174 = _2168;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2178 = _2160 * _2176;
    float _2180 = _2174;
    if (!_2156)
    {
        float _2182 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2184 = _2182 * 0.15915493667125701904296875;
        float _2186 = _2184 * 6.283185482025146484375;
        float _2188 = cos(_2186);
        float _2190 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = _2184 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = 1.0 / _2188;
        float _2200 = _2192 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = _2196 * _2198;
        float _2206 = _2192 * 6.283185482025146484375;
        float _2208 = sin(_2206);
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2210;
        float _2214 = _2202 * _2204;
        float _2216 = 1.0 / _2212;
        float _2218 = 1.0 / _2214;
        float _2220 = _2208 * _2218;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2224 = fma(_2178, _2220, _2222);
        float _2226 = _2224 * _2216;
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        _2172 = _2228;
    }
    float _2230 = _2172;
    if (!_2156)
    {
        float _2232 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2234 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        float _2240 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2242 = _2240 * 0.15915493667125701904296875;
        float _2244 = _2234 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = 1.0 / _2238;
        float _2250 = _2242 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        float _2254 = _2246 * _2248;
        float _2256 = _2242 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        float _2260 = _2252 * _2254;
        float _2262 = 1.0 / _2260;
        float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2266 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2264;
        float _2268 = 1.0 / _2266;
        float _2270 = _2258 * _2262;
        float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2274 = fma(_2178, _2270, _2272);
        float _2276 = _2274 * _2268;
        float _2278 = precise::clamp(_2276, 0.0, 1.0);
        float _2280 = -_2278;
        float _2282 = _2280 + 1.0;
        _2180 = _2282;
    }
    float _2284 = _2180;
    float _2286 = -_2166;
    float _2288 = _2286 + 1.0;
    bool _2290 = _2230 > 0.0;
    bool _2292 = isnan(_2230);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(0.0);
    bool _2298 = _2294 || _2296;
    float _2300 = _2164 + _2027;
    float _2302 = _2230 * _2284;
    float _2304 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2306 = _2284 <= 0.0;
    bool _2308 = !_2298;
    bool _2310 = _2306 || _2308;
    float _2312 = _2300 * 0.5;
    float _2314 = _2304 * _2093;
    float _2316 = _2302 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2318 = -_2304;
    float _2320 = _2318 + 1.0;
    float _2322 = _2104 * _2314;
    float _2324 = _2114 * _2314;
    out.m_70.z = _2312;
    out.m_70.w = _2027;
    float _2326 = _2316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2328 = fma(_2110, _2322, _2098);
    float _2330 = fma(_2112, _2322, _2100);
    out.gl_Position.x = _2059;
    out.gl_Position.y = _2061;
    out.gl_Position.z = _2164;
    out.gl_Position.w = _2027;
    out.m_47.x = _2326;
    float _2332 = _2104 * _2320;
    float _2334 = fma(_2104, _2324, _2102);
    out.m_72.x = _2328;
    out.m_72.y = _2330;
    out.m_72.z = _2334;
    out.m_72.w = _2332;
    if (!_2310)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2336;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1735 = false;
    bool _1067 = false;
    bool _927 = false;
    bool _545 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2393 = as_type<float>(_107);
        out.gl_Position.z = _2393;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
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
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2462 = as_type<float>(_143);
        out.gl_Position.z = _2462;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _209 = _203 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
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
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_211, 0.5, 0.5);
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = -_219;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _317 = !_207;
    int _319 = _317 ? 0 : 1;
    float _321 = -_299;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_295;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _185, _315);
    int _333 = abs(_319);
    float _335 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _337 = !_293;
    int _339 = _337 ? 0 : 1;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _345 = fma(_283, _187, _335);
    int _347 = abs(_339);
    float _349 = fma(_283, _189, _341);
    float _351 = float(_329);
    float _353 = float(_333);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = float(_347);
    float _361 = fma(_353, _327, _357);
    float _363 = fma(_331, _285, _305);
    float _365 = fma(_345, _285, _307);
    float _367 = fma(_349, _285, _309);
    float _369 = abs(_323);
    float _371 = fma(_359, _369, _361);
    bool _373 = !_343;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_91);
        float _395 = 1.0 / _393;
        float _397 = _125 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _419 = _399 + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = -_415;
    float _443 = _441 + 1.0;
    float _445 = 1.0 / _439;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _431 * _443;
    float _461 = -_431;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _471 = _457 * _463;
    float _473 = 1.0 / _435;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _419 * _445;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = fma(_467, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = fma(_487, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = _403 * _473;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = in.m_56.x;
    float _501 = in.m_56.y;
    float _503 = fma(_477, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = _505 * _471;
    float _509 = _503 * _471;
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _513 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _515 = fma(_491, _459, _511);
    float _517 = fma(_489, _459, _513);
    float _519 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].x, _515);
    float _521 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].y, _517);
    float _523 = _519 * _499;
    float _525 = _521 * _501;
    bool _527 = !_469;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _531 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_91);
        float _549 = 1.0 / _547;
        float _551 = _125 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _571 = 1.0 / _557;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _581 = 1.0 / _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = _553 + _583;
    bool _587 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _589 = isnan(_553);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _601 = isnan(_553);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _561;
    float _613 = _585 * _571;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _617 = _553 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _621 = _553 + _619;
    float _623 = 1.0 / _575;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _627 = _553 + _625;
    float _629 = _617 * _581;
    bool _631 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _633 = isnan(_553);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _643;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _649 = 1.0 / _579;
    float _651 = _627 * _611;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _655 = _553 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _659 = _553 + _657;
    float _661 = -_641;
    float _663 = _661 + 1.0;
    float _665 = 1.0 / _569;
    float _667 = _621 * _623;
    bool _669 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _671 = isnan(_553);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _681;
    float _685 = fma(_645, _667, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _687 = -_679;
    float _689 = _687 + 1.0;
    float _691 = _655 * _649;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _697;
    float _701 = _679 * _663;
    float _703 = fma(_683, _613, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _705 = _597 * _689;
    float _707 = fma(_699, _613, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _713 = _659 * _665;
    float _715 = fma(_695, _613, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _717 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _719 = isnan(_553);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -_597;
    float _731 = _729 + 1.0;
    bool _733 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _735 = isnan(_553);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _753 = _727 * _731;
    float _755 = -_727;
    float _757 = _755 + 1.0;
    bool _759 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _761 = isnan(_553);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_743;
    float _773 = _771 + 1.0;
    float _775 = fma(_747, _651, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _777 = _609 * _757;
    float _779 = -_609;
    float _781 = _779 + 1.0;
    float _783 = _769 * _773;
    float _785 = -_769;
    float _787 = _785 + 1.0;
    float _789 = fma(_711, _651, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _791 = fma(_751, _651, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _793 = _703 * _783;
    float _795 = _715 * _783;
    float _797 = _707 * _783;
    float _799 = _743 * _781;
    float _801 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].y, _795);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _809;
    float _813 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[107].z, _797);
    float _815 = fma(_775, _799, _801);
    float _817 = fma(_807, _667, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _819 = fma(_811, _667, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _821 = fma(_789, _799, _803);
    float _823 = fma(_791, _799, _813);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _837 = fma(_827, _691, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _839 = fma(_831, _691, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _841 = fma(_835, _691, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _843 = fma(_817, _777, _815);
    float _845 = fma(_819, _777, _821);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _851;
    float _855 = fma(_685, _777, _823);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _857;
    float _861 = fma(_837, _753, _843);
    float _863 = fma(_839, _753, _845);
    float _865 = fma(_849, _629, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _867 = fma(_853, _629, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _869 = fma(_841, _753, _855);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _879 = fma(_859, _629, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _885 = fma(_873, _713, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _887 = fma(_877, _713, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _889 = fma(_865, _705, _861);
    float _891 = fma(_883, _713, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _893 = fma(_867, _705, _863);
    float _895 = fma(_879, _705, _869);
    float _897 = fma(_885, _701, _889);
    float _899 = fma(_887, _701, _893);
    float _901 = fma(_891, _701, _895);
    float _903 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].x, _897);
    float _905 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].y, _899);
    float _907 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[113].z, _901);
    bool _909 = !_647;
    float _925;
    if (!_909)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _913 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _917 = _915 * _911;
        float _919 = floor(_917);
        float _921 = -_919;
        float _923 = _917 + _921;
        _925 = _923;
        _927 = true;
    }
    else
    {
        float _929 = float(_91);
        float _931 = 1.0 / _929;
        float _933 = _125 * _931;
        _925 = _933;
    }
    _927 = false;
    float _935 = _925;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _935 + _937;
    float _941 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _947 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_935);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_935);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    bool _979 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = isnan(_935);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = 1.0 / _945;
    float _993 = -_957;
    float _995 = _993 + 1.0;
    float _997 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _999 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1001 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = 1.0 / _961;
    float _1011 = _977 * _991;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = fma(_1011, _939, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1019 = _973 * _995;
    float _1021 = -_989;
    float _1023 = _1021 + 1.0;
    float _1025 = -_973;
    float _1027 = _1025 + 1.0;
    float _1029 = _1015 * _1009;
    float _1031 = _1017 * _1019;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1035 = _935 + _1033;
    float _1037 = _957 * _1023;
    float _1039 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1031);
    float _1041 = fma(_1029, _1035, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1043 = fma(_1041, _1037, _1039);
    float _1045 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1043);
    float _1047 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1001;
    out.m_58.y = _1005;
    out.m_58.z = _1007;
    out.m_58.w = _1047;
    bool _1049 = !_1003;
    float _1065;
    if (!_1049)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1053 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        float _1069 = float(_91);
        float _1071 = 1.0 / _1069;
        float _1073 = _125 * _1071;
        _1065 = _1073;
    }
    _1067 = false;
    float _1075 = _1065;
    float _1077 = in.m_51.y;
    float _1079 = _371 * _523;
    float _1081 = in.m_60.x;
    float _1083 = in.m_60.y;
    float _1085 = in.m_60.z;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _371 * _525;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1095 = _1093 != 0;
    float _1097 = in.m_62.x;
    float _1099 = in.m_62.y;
    float _1101 = in.m_62.z;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1111 = in.m_64.x;
    float _1113 = in.m_64.y;
    float _1115 = in.m_64.z;
    float _1117 = 1.0 / _1105;
    bool _1119 = _145 > 0.5;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1121;
    float _1125 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = 1.0 / _1123;
    float _1131 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1133;
    bool _1137 = _1077 > 0.5;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1143 = _365 * _1083;
    float _1145 = 1.0 / _1109;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    bool _1149 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1151 = isnan(_1075);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_363, _1081, _1143);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1163;
    float _1167 = _365 * _1099;
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1173 = _365 * _1113;
    bool _1175 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1177 = isnan(_1075);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = 1.0 / _1165;
    float _1189 = fma(_363, _1097, _1167);
    float _1191 = fma(_363, _1111, _1173);
    float _1193 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1199 = fma(_367, _1101, _1189);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1203 = _1075 + _1201;
    float _1205 = _1193 * _1147;
    float _1207 = 1.0 / _1171;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1211 = _1075 + _1209;
    float _1213 = -_215;
    int _1215 = _1119 ? as_type<int>(_1213) : as_type<int>(_215);
    float _1217 = fma(_367, _1085, _1161);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1221 = _1075 + _1219;
    float _1223 = _1211 * _1117;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1227 = _1075 + _1225;
    float _1229 = _1203 * _1187;
    float _1231 = fma(_367, _1115, _1191);
    float _1233 = 1.0 / _1197;
    float _1235 = _1227 * _1129;
    bool _1237 = !_1089;
    float _1239 = _1237 ? _215 : as_type<float>(_1215);
    float _1241 = _1125 * _1131;
    float _1243 = _1221 * _1207;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1259 = _1075 + _1257;
    float _1261 = fma(_1247, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1263 = fma(_1251, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1265 = fma(_1255, _1223, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1267 = _1259 * _1145;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1271 = _1075 + _1269;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1273;
    float _1277 = -_223;
    int _1279 = _1137 ? as_type<int>(_1277) : as_type<int>(_223);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1301 = _1271 * _1233;
    bool _1303 = !_1095;
    float _1305 = _1303 ? _223 : as_type<float>(_1279);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1319 = fma(_1287, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1321 = fma(_1295, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1323 = fma(_1299, _1243, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1325 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1327 = isnan(_1075);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1339 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1341 = isnan(_1075);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1353 = fma(_1313, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1355 = fma(_1309, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1357 = fma(_1317, _1267, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1359 = fma(_1275, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1361 = fma(_1283, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1363 = fma(_1291, _1235, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1369;
    float _1373 = -_1335;
    float _1375 = _1373 + 1.0;
    float _1377 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1337);
    float _1379 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1351);
    float _1381 = -_1349;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_1135, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1387 = fma(_1367, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1389 = fma(_1371, _1229, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1391 = _1349 * _1375;
    float _1393 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1377);
    float _1395 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1379);
    bool _1397 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1399 = isnan(_1075);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = _1159 * _1383;
    float _1411 = -_1159;
    float _1413 = _1411 + 1.0;
    float _1415 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1417 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1419 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1421 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1423 = _1407 * _1413;
    float _1425 = -_1407;
    float _1427 = _1425 + 1.0;
    float _1429 = _1415 + _1419;
    float _1431 = _1417 + _1421;
    float _1433 = -_1185;
    float _1435 = _1433 + 1.0;
    float _1437 = _1185 * _1427;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1441 = _1429 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1445 = _1431 + _1443;
    bool _1447 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1449 = isnan(_1075);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1463 = _1441 * _1441;
    float _1465 = _1445 * _1445;
    bool _1467 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1469 = isnan(_1075);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1475 = _1471 || _1473;
    float _1477 = float(_1475);
    float _1479 = -_1457;
    float _1481 = _1479 + 1.0;
    float _1483 = _1457 * _1435;
    float _1485 = _1463 + _1465;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1491 = _1477 * _1481;
    float _1493 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1495 = sqrt(_1485);
    float _1497 = -_1477;
    float _1499 = _1497 + 1.0;
    float _1501 = _1261 * _1491;
    float _1503 = _1263 * _1491;
    float _1505 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1493);
    float _1507 = _1265 * _1491;
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1501);
    float _1511 = fma(_1141, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1513 = fma(_1489, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1515 = fma(_1461, _1301, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1517 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1503);
    float _1519 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1505);
    float _1521 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1507);
    float _1523 = fma(_1353, _1483, _1509);
    float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1527 = _1199 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1529 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1533 = fma(_1355, _1483, _1517);
    float _1535 = fma(_1357, _1483, _1521);
    float _1537 = fma(_1359, _1437, _1523);
    float _1539 = _1527 + _1531;
    float _1541 = fma(_1361, _1437, _1533);
    float _1543 = fma(_1363, _1437, _1535);
    float _1545 = fma(_1319, _1423, _1537);
    float _1547 = fma(_1321, _1423, _1541);
    float _1549 = fma(_1323, _1423, _1543);
    float _1551 = fma(_1385, _1409, _1545);
    float _1553 = _1531;
    float _1555 = _1463;
    float _1557 = _1465;
    float _1559 = _1429;
    float _1561 = _1431;
    float _1563 = _1357;
    float _1565 = _1527;
    if (!_1529)
    {
        _1553 = _1539;
    }
    float _1567 = _1553;
    bool _1569 = !_1529;
    float _1571 = _1567;
    float _1573 = _1525;
    if (!_1569)
    {
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1579 = _1495 + _1577;
        float _1581 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = rsqrt(_1485);
        float _1585 = _1579 * _1575;
        float _1587 = _1585 * 0.15915493667125701904296875;
        float _1589 = _1587 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = _1587 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = fma(_1591, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1599 = _1583 * _1597;
        float _1601 = fma(_1441, _1599, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1603 = _1595 + (-1.0);
        float _1605 = fma(_1445, _1599, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1609 = _1601 + _1607;
        float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1615 = _1605 + _1613;
        float _1617 = _1609 * _1609;
        float _1619 = fma(_1539, _1595, _1611);
        float _1621 = _1615 * _1615;
        _1571 = _1619;
        _1555 = _1617;
        _1557 = _1621;
        _1559 = _1601;
        _1561 = _1605;
    }
    float _1623 = _1571;
    float _1625 = _1555;
    float _1627 = _1557;
    float _1629 = _1559;
    float _1631 = _1561;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1635 = _1623 + _1633;
    float _1637 = fma(_1387, _1409, _1547);
    float _1639 = fma(_1389, _1409, _1549);
    float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1643 = fma(_1635, _1635, _1625);
    float _1645 = _1239 + 0.5;
    float _1647 = fma(_1511, _1391, _1551);
    float _1649 = fma(_1513, _1391, _1637);
    float _1651 = fma(_1515, _1391, _1639);
    float _1653 = _1643 + _1627;
    float _1655 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1657 = -_1305;
    float _1659 = _1657 + 0.5;
    float _1661 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1647);
    float _1663 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1649);
    float _1665 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1651);
    float _1667 = sqrt(_1653);
    float _1669 = _1655 * _1525;
    float _1671 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1673 = _1661 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1679 = _1671 * _1641;
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1669;
    out.m_66.y = _1679;
    out.m_68.x = _1681;
    out.m_68.y = _1683;
    out.m_68.z = _1685;
    bool _1687 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1689 = isnan(_1667);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1695 = _1691 || _1693;
    float _1697 = _1645;
    float _1699 = _1683;
    if (!_1695)
    {
        _1573 = 1.0;
    }
    float _1701 = _1573;
    bool _1703 = !_1695;
    float _1705 = _1701;
    if (!_1703)
    {
        bool _1707 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1709 = isnan(_1667);
        bool _1711 = _1707 || _1709;
        bool _1713 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1715 = _1711 || _1713;
        if (!_1715)
        {
            float _1717 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1719 = _1667 + _1717;
            float _1721 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1723 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1721;
            float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1729 = 1.0 / _1723;
            float _1731 = _1719 * _1729;
            float _1733 = fma(_1731, _1727, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1705 = _1733;
            _1735 = true;
        }
        else
        {
            bool _1737 = _1667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1739 = isnan(_1667);
            bool _1741 = _1737 || _1739;
            bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1745 = _1741 || _1743;
            if (!_1745)
            {
                float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1749 = _1667 + _1747;
                float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1753 = _1751 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1757 = _1755 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1759 = 1.0 / _1753;
                float _1761 = _1749 * _1759;
                float _1763 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1705 = _1763;
                _1735 = true;
            }
            else
            {
                _1705 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1735 = false;
    float _1765 = _1705;
    float _1767 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1769 = _1623 + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1773 = _1629 + _1771;
    float _1775 = fma(_1769, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1779 = _1631 + _1777;
    float _1781 = fma(_1773, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1785 = _1775 + _1783;
    float _1787 = fma(_1779, _1765, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1791 = _1781 + _1789;
    float _1793 = _1785 * _1785;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1797 = _1787 + _1795;
    float _1799 = fma(_1791, _1791, _1793);
    float _1801 = fma(_1797, _1797, _1799);
    float _1803 = rsqrt(_1801);
    float _1805 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1807 = _1791 * _1805;
    float _1809 = _1797 * _1805;
    float _1811 = _1807 * _1807;
    float _1813 = _1809 * _1809;
    float _1815 = _1811 + _1813;
    float _1817 = sqrt(_1815);
    bool _1819 = _1817 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1823 = _1817 + _1821;
    float _1825 = _1797;
    float _1827 = _1815;
    float _1829 = _1823;
    float _1831 = _1807;
    if (_1819)
    {
        float _1833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1825 = _1833;
    }
    float _1835 = _1825;
    if (_1819)
    {
        float _1837 = rsqrt(_1815);
        _1827 = _1837;
    }
    float _1839 = _1827;
    float _1841 = _1839;
    if (_1819)
    {
        float _1843 = _1823 * _1835;
        _1829 = _1843;
    }
    float _1845 = _1829;
    if (_1819)
    {
        float _1847 = _1845 * 0.15915493667125701904296875;
        _1697 = _1847;
    }
    float _1849 = _1697;
    float _1851 = _1803;
    if (_1819)
    {
        float _1853 = _1849 * 6.283185482025146484375;
        float _1855 = sin(_1853);
        _1851 = _1855;
    }
    float _1857 = _1851;
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1861 = precise::max(0.0, _1859);
    float _1863 = _1659;
    float _1865 = _1861;
    float _1867 = _1859;
    if (_1819)
    {
        float _1869 = _1849 * 6.283185482025146484375;
        float _1871 = cos(_1869);
        _1863 = _1871;
    }
    float _1873 = _1863;
    float _1875 = -_1805;
    float _1877 = -_1861;
    float _1879 = fma(_1785, _1875, _1877);
    if (_1819)
    {
        float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1881;
    }
    float _1883 = _1865;
    float _1885 = sqrt(_1801);
    float _1887 = _1857;
    float _1889 = _1883;
    if (_1819)
    {
        float _1891 = fma(_1857, _1883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = _1893;
    if (!_1819)
    {
        _1889 = _1809;
    }
    float _1897 = _1889;
    float _1899 = _1897;
    if (_1819)
    {
        float _1901 = _1873 + (-1.0);
        _1867 = _1901;
    }
    float _1903 = _1867;
    float _1905 = _1903;
    if (_1819)
    {
        float _1907 = _1839 * _1893;
        _1699 = _1907;
    }
    float _1909 = _1699;
    if (!_1819)
    {
        _1895 = _1879;
    }
    float _1911 = _1895;
    float _1913 = _1911;
    if (_1819)
    {
        float _1915 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1915;
    }
    float _1917 = _1563;
    if (_1819)
    {
        float _1919 = _1807 * _1909;
        _1831 = _1919;
    }
    float _1921 = _1831;
    if (!_1819)
    {
        _1841 = _1811;
    }
    float _1923 = _1841;
    float _1925 = _1923;
    if (_1819)
    {
        float _1927 = _1809 * _1909;
        _1899 = _1927;
    }
    float _1929 = _1899;
    if (_1819)
    {
        float _1931 = fma(_1879, _1873, _1917);
        _1913 = _1931;
    }
    float _1933 = _1913;
    if (_1819)
    {
        float _1935 = _1921 * _1921;
        _1925 = _1935;
    }
    float _1937 = _1925;
    if (!_1819)
    {
        _1905 = _1813;
    }
    float _1939 = _1905;
    float _1941 = _1939;
    if (_1819)
    {
        float _1943 = _1929 * _1929;
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = fma(_1933, _1933, _1937);
    float _1949 = _1947 + _1945;
    float _1951 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1955 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1953);
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1961 = rsqrt(_1949);
    float _1963 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1951);
    float _1965 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = -_1957;
    float _1969 = _1967 + 1.0;
    float _1971 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1973 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1963);
    float _1975 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1977 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1979 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1971);
    float _1981 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1983 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1975);
    float _1985 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1977);
    float _1987 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1979);
    float _1989 = abs(_1969);
    float _1991 = log2(_1989);
    float _1993 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1995 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1985);
    float _1997 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1999 = _1961 * _1921;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2003 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2005 = _1961 * _1929;
    float _2007 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2009 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2011 = _1961 * _1933;
    float _2013 = -_2003;
    float _2015 = fma(_2013, _1959, 1.0);
    float _2017 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2019 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2009);
    float _2021 = -_2007;
    float _2023 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2021);
    float _2025 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2019);
    float _2029 = -_2005;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2023);
    float _2033 = log2(_2015);
    float _2035 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2037 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2039 = fma(_2031, -0.5, 0.5);
    float _2041 = fma(_2031, 0.5, 0.5);
    float _2043 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2035);
    float _2045 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2037);
    float _2047 = _2011 + 1.0;
    float _2049 = exp2(_2025);
    float _2051 = fma(_2041, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2053 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2043);
    float _2055 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2045);
    float _2057 = fma(_2041, _2051, -0.212114393711090087890625);
    float _2059 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2053);
    float _2061 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2055);
    float _2063 = 1.0 / _2027;
    float _2065 = _2033 * 0.693147182464599609375;
    float _2067 = fma(_2041, _2057, 1.570728778839111328125);
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2071 = sqrt(_2039);
    float _2073 = -_2011;
    float _2075 = fma(_2049, _2047, _2073);
    float _2077 = fma(_2075, 0.5, 0.5);
    float _2079 = _2059 * _2063;
    float _2081 = _2061 * _2063;
    float _2083 = fma(_2079, 0.5, 0.5);
    float _2085 = fma(_2081, -0.5, 0.5);
    float _2087 = _2071 * 0.636619746685028076171875;
    float _2089 = -_2067;
    float _2091 = fma(_2087, _2089, 1.0);
    float3 _5631 = float3(_2083, _2085, _2069);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5631, float3(0.0), isnan(_5631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5631, float3(0.0), isnan(_5631)), level(0.0)).x;
    float3 _5642 = float3(_2083, _2085, _2069);
    float4 _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5642, float3(0.0), isnan(_5642)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5642, float3(0.0), isnan(_5642)), level(0.0)).xyzw;
    float _2098 = _2096.x;
    float _2100 = _2096.y;
    float _2102 = _2096.z;
    float _2104 = _2096.w;
    float2 _5659 = float2(_2091, _2077);
    float3 _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5659, float2(0.0), isnan(_5659)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5659, float2(0.0), isnan(_5659)), level(0.0)).xyz;
    float _2110 = _2108.x;
    float _2112 = _2108.y;
    float _2114 = _2108.z;
    float _2116 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2118 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2120 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2116);
    float _2122 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2124 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2118);
    float _2126 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2120);
    float _2128 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2122);
    float _2130 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2132 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2128);
    float _2134 = 1.0 / _2130;
    float _2136 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2138 = _2136 + _2130;
    float _2140 = _2138 * _2134;
    float _2142 = _2140 * 0.5;
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2146 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2144);
    bool _2148 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan(0.5);
    bool _2156 = _2152 || _2154;
    float _2158 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2160 = 1.0 / _2146;
    float _2162 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2124);
    float _2164 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2162);
    float _2166 = exp2(_2158);
    float _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2156)
    {
        _1565 = 1.0;
    }
    float _2170 = _1565;
    float _2172 = _2170;
    if (_2156)
    {
        _2168 = 1.0;
    }
    float _2174 = _2168;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2178 = _2160 * _2176;
    float _2180 = _2174;
    if (!_2156)
    {
        float _2182 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2184 = _2182 * 0.15915493667125701904296875;
        float _2186 = _2184 * 6.283185482025146484375;
        float _2188 = cos(_2186);
        float _2190 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = _2184 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = 1.0 / _2188;
        float _2200 = _2192 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = _2196 * _2198;
        float _2206 = _2192 * 6.283185482025146484375;
        float _2208 = sin(_2206);
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2210;
        float _2214 = _2202 * _2204;
        float _2216 = 1.0 / _2212;
        float _2218 = 1.0 / _2214;
        float _2220 = _2208 * _2218;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2224 = fma(_2178, _2220, _2222);
        float _2226 = _2224 * _2216;
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        _2172 = _2228;
    }
    float _2230 = _2172;
    if (!_2156)
    {
        float _2232 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2234 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        float _2240 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2242 = _2240 * 0.15915493667125701904296875;
        float _2244 = _2234 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = 1.0 / _2238;
        float _2250 = _2242 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        float _2254 = _2246 * _2248;
        float _2256 = _2242 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        float _2260 = _2252 * _2254;
        float _2262 = 1.0 / _2260;
        float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2266 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2264;
        float _2268 = 1.0 / _2266;
        float _2270 = _2258 * _2262;
        float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2274 = fma(_2178, _2270, _2272);
        float _2276 = _2274 * _2268;
        float _2278 = precise::clamp(_2276, 0.0, 1.0);
        float _2280 = -_2278;
        float _2282 = _2280 + 1.0;
        _2180 = _2282;
    }
    float _2284 = _2180;
    float _2286 = -_2166;
    float _2288 = _2286 + 1.0;
    bool _2290 = _2230 > 0.0;
    bool _2292 = isnan(_2230);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(0.0);
    bool _2298 = _2294 || _2296;
    float _2300 = _2164 + _2027;
    float _2302 = _2230 * _2284;
    float _2304 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2306 = _2284 <= 0.0;
    bool _2308 = !_2298;
    bool _2310 = _2306 || _2308;
    float _2312 = _2300 * 0.5;
    float _2314 = _2304 * _2093;
    float _2316 = _2302 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2318 = -_2304;
    float _2320 = _2318 + 1.0;
    float _2322 = _2104 * _2314;
    float _2324 = _2114 * _2314;
    out.m_70.z = _2312;
    out.m_70.w = _2027;
    float _2326 = _2316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2328 = fma(_2110, _2322, _2098);
    float _2330 = fma(_2112, _2322, _2100);
    out.gl_Position.x = _2059;
    out.gl_Position.y = _2061;
    out.gl_Position.z = _2164;
    out.gl_Position.w = _2027;
    out.m_47.x = _2326;
    float _2332 = _2104 * _2320;
    float _2334 = fma(_2104, _2324, _2102);
    out.m_72.x = _2328;
    out.m_72.y = _2330;
    out.m_72.z = _2334;
    out.m_72.w = _2332;
    if (!_2310)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2336;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

