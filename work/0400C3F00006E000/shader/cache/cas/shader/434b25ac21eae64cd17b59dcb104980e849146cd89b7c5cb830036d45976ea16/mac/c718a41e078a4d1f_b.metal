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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_99);
        out.gl_Position.z = _2011;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = _117;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_137);
        out.gl_Position.z = _2080;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.w;
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = _143 * _141;
    float _167 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    float _179 = _175 * 0.15915493667125701904296875;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _179 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = 1.4012984643248170709237295832899e-45;
    float _191 = _147;
    if (!_157)
    {
        float _193 = _147 * _147;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_157)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    float _205 = -_177;
    float _207 = _167 + _205;
    bool _209 = !_157;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _147 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _147);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _243;
    }
    float _245 = _211;
    bool _247 = !_157;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _147 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _191 = _267;
    }
    float _269 = _191;
    float _271 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_269, _169, _271);
    bool _279 = _207 < 0.5;
    float _281 = float(_279);
    float _283 = fma(_269, _171, _273);
    float _285 = fma(_269, _173, _275);
    float _287 = fma(_187, 0.5, 0.5);
    float _289 = _275;
    if (!_157)
    {
        float _291 = _117 * _117;
        float _293 = _291 * 0.5;
        _289 = _293;
    }
    float _295 = _289;
    float _297 = -_207;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_287;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = fma(_277, _145, _159);
    float _311 = fma(_283, _145, _161);
    float _313 = fma(_285, _145, _163);
    float _315 = _295;
    if (!_157)
    {
        float _317 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _317;
    }
    float _319 = _315;
    float _321 = _319;
    if (!_157)
    {
        _213 = _117;
    }
    float _323 = _213;
    bool _325 = !_183;
    int _327 = _325 ? 0 : 1;
    bool _329 = !_157;
    float _331 = _323;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _117 * _335;
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _337 * 0.693147182464599609375;
        float _349 = exp2(_339);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _117);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _361;
    }
    float _363 = _321;
    bool _365 = !_157;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _117 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _331 = _385;
    }
    float _387 = _331;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _393 = _391 != 0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _397 = _395 != 0;
    float _399 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _401 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _403 = fma(_387, _169, _389);
    int _405 = abs(_327);
    float _407 = fma(_387, _171, _399);
    bool _409 = !_393;
    int _411 = _409 ? 0 : 1;
    float _413 = fma(_387, _173, _401);
    bool _415 = !_397;
    int _417 = _415 ? 0 : 1;
    float _419 = -_403;
    float _421 = _277 + _419;
    int _423 = abs(_411);
    float _425 = -_407;
    float _427 = _283 + _425;
    int _429 = abs(_417);
    float _431 = -_413;
    float _433 = _285 + _431;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _437 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = float(_423);
    float _445 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    float _451 = float(_405);
    float _453 = abs(_299);
    float _455 = _443 * _453;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _461 = fma(_451, _307, _455);
    float _463 = float(_429);
    float _465 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _467 = abs(_303);
    float _469 = fma(_463, _467, _461);
    bool _471 = !_435;
    float _473 = _465;
    float _475 = _457;
    float _477 = _459;
    float _493;
    if (!_471)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_83);
        float _499 = 1.0 / _497;
        float _501 = _117 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _503 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _503 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = 1.0 / _523;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _537 = 1.0 / _519;
    bool _539 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_503);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _527;
    float _553 = 1.0 / _531;
    float _555 = _507 * _537;
    bool _557 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _559 = isnan(_503);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_503);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    bool _581 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _583 = isnan(_503);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _511 * _551;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _503 + _595;
    float _599 = -_567;
    float _601 = _599 + 1.0;
    float _603 = _597 * _533;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _515 * _553;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _567 * _607;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _627 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_503);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _549 * _613;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _641;
    float _645 = -_549;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _653 = fma(_619, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = fma(_643, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = _637 * _647;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = fma(_625, _615, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _667 = _655 * _657;
    float _669 = _653 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _681 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _683 = fma(_673, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_677, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _695 = fma(_663, _639, _679);
    float _697 = fma(_665, _639, _681);
    float _699 = fma(_689, _603, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _701 = fma(_693, _603, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _703 = fma(_683, _609, _695);
    float _705 = fma(_685, _609, _697);
    float _707 = fma(_699, _621, _703);
    float _709 = fma(_701, _621, _705);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].x, _707);
    float _713 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].y, _709);
    bool _715 = !_535;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _719 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_83);
        float _737 = 1.0 / _735;
        float _739 = _117 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = in.m_51.x;
    float _749 = in.m_51.y;
    float _751 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    bool _753 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _755 = isnan(_741);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = in.m_49.y;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _773 = as_type<int>(_743) & 1;
    bool _775 = _773 != 0;
    int _777 = as_type<int>(_743) & 2;
    bool _779 = _777 != 0;
    float _781 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = _711 * _747;
    float _795 = _713 * _749;
    float _797 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _799 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _783);
    float _801 = _469 * _795;
    bool _803 = !_779;
    float _805 = _803 ? (-0.5) : 0.5;
    float _807 = _469 * _793;
    bool _809 = !_775;
    float _811 = _809 ? (-0.5) : 0.5;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _813;
    float _817 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _805);
    float _821 = 1.0 / _815;
    float _823 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _811);
    float _827 = _817 * _819;
    float _829 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _833 = _823 * _825;
    float _835 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _837 = -_767;
    float _839 = fma(_829, 2.0, _837);
    float _841 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _847 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _835);
    bool _849 = _139 > 0.5;
    float _851 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _831);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _855 = _741 + _853;
    float _857 = fma(_841, -2.0, _769);
    float _859 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _861 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].z, _799);
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _847);
    float _865 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    float _867 = _855 * _821;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _869;
    float _873 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].z, _751);
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _877 = _861 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = fma(_871, _867, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _885 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _889 = _877 + _879;
    bool _891 = _765 > 0.5;
    float _893 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _895;
    bool _899 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _901 = isnan(_741);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = _885 + _887;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _915 = _889 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _917;
    float _921 = fma(_897, _867, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _923 = -_909;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _929 = _911 + _927;
    float _931 = _915 * _915;
    float _933 = -_811;
    int _935 = _849 ? as_type<int>(_933) : as_type<int>(_811);
    float _937 = fma(_919, _867, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _939 = _763 * _925;
    float _941 = fma(_929, _929, _931);
    bool _943 = !_787;
    float _945 = _943 ? _811 : as_type<float>(_935);
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _949 = _883 * _939;
    float _951 = -_805;
    int _953 = _891 ? as_type<int>(_951) : as_type<int>(_805);
    float _955 = -_117;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _959 = _921 * _939;
    float _961 = _945 + 0.5;
    bool _963 = !_791;
    float _965 = _963 ? _805 : as_type<float>(_953);
    float _967 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = sqrt(_941);
    float _971 = -_763;
    float _973 = _971 + 1.0;
    float _975 = _937 * _939;
    float _977 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _979 = _873 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _981 = _771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _983 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    float _985 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _977);
    float _987 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _989 = _965 + (-0.5);
    float _991 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].y, _959);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _995 = fma(_987, _961, _957);
    float _997 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].x, _949);
    float _999 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].z, _975);
    float _1001 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    bool _1003 = _969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = _979 + _993;
    float _1007 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _851);
    float _1009 = -_981;
    float _1011 = -_983;
    float _1013 = fma(_1009, _989, _1011);
    float _1015 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].y, _991);
    float _1017 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].x, _997);
    float _1019 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].z, _999);
    float _1021 = -_1001;
    float _1023 = _1021 + 1.0;
    float _1025 = -_1007;
    float _1027 = _1025 + 1.0;
    float _1029 = _909;
    float _1031 = _1001;
    float _1033 = _993;
    float _1035 = _885;
    if (!_1003)
    {
        _1029 = _911;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1003)
    {
        _1031 = _889;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (!_1003)
    {
        _1033 = _1005;
    }
    float _1045 = _1033;
    bool _1047 = !_1003;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _969 + _1053;
        float _1057 = _1005 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_941);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = cos(_1069);
        float _1073 = fma(_1067, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = _1059 * _1073;
        float _1077 = _1071 + (-1.0);
        float _1079 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = fma(_929, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1083 = fma(_915, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1085 = fma(_1005, _1071, _1079);
        _1049 = _1085;
        _1039 = _1081;
        _1043 = _1083;
    }
    float _1087 = _1049;
    float _1089 = _1039;
    float _1091 = _1043;
    float _1093 = -_979;
    float _1095 = _1093 + _1087;
    float _1097 = -_1027;
    float _1099 = fma(_945, _1097, _995);
    float _1101 = fma(_965, _1023, _1013);
    float _1103 = -_885;
    float _1105 = _1103 + _1089;
    float _1107 = _1095 * _1095;
    float _1109 = -_877;
    float _1111 = _1109 + _1091;
    float _1113 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1115 = fma(_1105, _1105, _1107);
    out.m_56.x = _1099;
    out.m_56.y = _1101;
    float _1117 = fma(_1111, _1111, _1115);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1123 = sqrt(_1117);
    float _1125 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1129 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1133 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1135 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1135;
    out.m_58.y = _1133;
    out.m_58.z = _1137;
    out.m_60.x = _1139;
    out.m_60.y = _1141;
    out.m_60.z = _1143;
    out.m_60.w = _1131;
    bool _1145 = _1123 > 0.0;
    bool _1147 = !_1145;
    float _1149 = _1141;
    float _1151 = _1133;
    float _1153 = _1135;
    float _1155 = _1089;
    float _1157 = _1087;
    float _1159 = _1091;
    float _1161 = _1133;
    float _1163 = _1131;
    if (!_1147)
    {
        bool _1165 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1167 = _1131;
        if (_1165)
        {
            float _1169 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1167 = _1169;
        }
        float _1171 = _1167;
        _1163 = _1171;
        if (_1165)
        {
            float _1173 = _457 * _1171;
            _1149 = _1173;
        }
        float _1175 = _1149;
        float _1177 = _1175;
        if (_1165)
        {
            float _1179 = _465 * _1171;
            _1151 = _1179;
        }
        float _1181 = _1151;
        float _1183 = _1181;
        if (_1165)
        {
            float _1185 = _459 * _1171;
            _1153 = _1185;
        }
        float _1187 = _1153;
        float _1189 = _1187;
        float _1191 = _1187;
        if (!_1165)
        {
            float _1193 = _117 + 1.0;
            float _1195 = _1193;
            if (!_157)
            {
                float _1197 = _1193 * _1193;
                float _1199 = _1197 * 0.5;
                _1189 = _1199;
            }
            float _1201 = _1189;
            float _1203 = _1201;
            if (!_157)
            {
                float _1205 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1203 = _1205;
            }
            float _1207 = _1203;
            bool _1209 = !_157;
            float _1211 = _1207;
            if (!_1209)
            {
                float _1213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1215 = log2(_1213);
                float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1219 = _1217 + 1.0;
                float _1221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1223 = _1215 * _1193;
                float _1225 = 1.0 / _1219;
                float _1227 = _1221 * 0.693147182464599609375;
                float _1229 = exp2(_1223);
                float _1231 = 1.0 / _1227;
                float _1233 = _1229 + (-1.0);
                float _1235 = -_1233;
                float _1237 = fma(_1235, _1231, _1193);
                float _1239 = _1237 * _1225;
                float _1241 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1211 = _1241;
            }
            float _1243 = _1211;
            float _1245 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1247 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1249 = !_157;
            if (!_1249)
            {
                float _1251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1253 = log2(_1251);
                float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1257 = _1255 + 1.0;
                float _1259 = 1.0 / _1257;
                float _1261 = _1253 * _1193;
                float _1263 = exp2(_1261);
                float _1265 = -_1263;
                float _1267 = _1265 + 1.0;
                float _1269 = _1267 * _1259;
                _1195 = _1269;
            }
            float _1271 = _1195;
            float _1273 = fma(_1271, _171, _1247);
            float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1277 = fma(_1271, _169, _1245);
            float _1279 = -_407;
            float _1281 = _1279 + _1273;
            float _1283 = fma(_1271, _173, _1275);
            float _1285 = -_403;
            float _1287 = _1285 + _1277;
            float _1289 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1291 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1293 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1295 = -_413;
            float _1297 = _1295 + _1283;
            float _1299 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1289);
            float _1301 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1291);
            float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1293);
            float _1305 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1299);
            float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1301);
            float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1303);
            _473 = _1307;
            _475 = _1305;
            _477 = _1309;
            _1177 = _1305;
            _1183 = _1307;
            _1191 = _1309;
        }
        float _1311 = _473;
        float _1313 = _475;
        float _1315 = _477;
        float _1317 = _1177;
        float _1319 = _1183;
        float _1321 = _1191;
        float _1323 = _1311 * _1311;
        float _1325 = rsqrt(_1117);
        float _1327 = fma(_1313, _1313, _1323);
        float _1329 = fma(_1315, _1315, _1327);
        float _1331 = sqrt(_1329);
        float _1333 = _1105 * _1325;
        float _1335 = _1095 * _1325;
        float _1337 = _1111 * _1325;
        bool _1339 = _1331 > 0.0;
        bool _1341 = !_1339;
        _1161 = _1319;
        if (!_1341)
        {
            float _1343 = rsqrt(_1329);
            float _1345 = _1343 * _1311;
            float _1347 = _1343 * _1313;
            float _1349 = _1343 * _1315;
            float _1351 = _1335 * _1345;
            float _1353 = fma(_1333, _1347, _1351);
            float _1355 = fma(_1337, _1349, _1353);
            float _1357 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1359 = fma(_1317, _1357, _1089);
            float _1361 = fma(_1319, _1357, _1087);
            float _1363 = fma(_1321, _1357, _1091);
            _1155 = _1359;
            _1157 = _1361;
            _1159 = _1363;
        }
    }
    float _1365 = _1155;
    float _1367 = _1157;
    float _1369 = _1159;
    float _1371 = _1161;
    float _1373 = _1163;
    float _1375 = _979 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1377 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1379 = isnan(0.5);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1385 = _1381 || _1383;
    bool _1387 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1389 = isnan(0.5);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1395 = _1391 || _1393;
    float _1397 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1375);
    float _1399 = _979 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1397);
    float _1403 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1405 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1407 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1403);
    float _1409 = _1401;
    float _1411 = _1371;
    float _1413 = _1405;
    float _1415 = _1373;
    if (_1385)
    {
        _1409 = _1365;
    }
    float _1417 = _1409;
    float _1419 = 1.0 / _1405;
    float _1421 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1423 = _1421;
    float _1425 = _1417;
    if (_1385)
    {
        _1411 = _1367;
    }
    float _1427 = _1411;
    float _1429 = _1421 + _1405;
    float _1431 = _1427;
    if (_1385)
    {
        _1423 = _1369;
    }
    float _1433 = _1423;
    float _1435 = _1433;
    if (!_1385)
    {
        float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1439 = _979 + _1437;
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1443 = _885 + _1441;
        float _1445 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1447 = -_979;
        float _1449 = _1447 + _1367;
        float _1451 = _1439 * _1439;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1455 = _877 + _1453;
        float _1457 = fma(_1443, _1443, _1451);
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1461 = fma(_1455, _1455, _1457);
        float _1463 = sqrt(_1461);
        float _1465 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1467 = precise::min(_1463, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1469 = _1467 * _1459;
        float _1471 = -_885;
        float _1473 = _1471 + _1365;
        float _1475 = _1465 * _1469;
        float _1477 = -_877;
        float _1479 = _1477 + _1369;
        float _1481 = fma(_1473, _1475, _885);
        float _1483 = fma(_1449, _1475, _979);
        float _1485 = fma(_1479, _1475, _877);
        _1431 = _1483;
        _1425 = _1481;
        _1435 = _1485;
        _1413 = _1463;
    }
    float _1487 = _1431;
    float _1489 = _1425;
    float _1491 = _1435;
    float _1493 = _1413;
    float _1495 = _1493;
    if (_1395)
    {
        _1495 = 1.0;
    }
    float _1497 = _1495;
    float _1499 = _1429 * _1419;
    float _1501 = _1499 * 0.5;
    float _1503 = _1497;
    if (!_1395)
    {
        float _1505 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1511);
        float _1515 = _1507 * 6.283185482025146484375;
        float _1517 = cos(_1515);
        float _1519 = _1509 * 0.15915493667125701904296875;
        float _1521 = _1507 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = 1.0 / _1517;
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        float _1531 = _1523 * _1525;
        float _1533 = _1519 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1539 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1537;
        float _1541 = _1529 * _1531;
        float _1543 = 1.0 / _1513;
        float _1545 = 1.0 / _1541;
        float _1547 = 1.0 / _1539;
        float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1551 = _1543 * _1549;
        float _1553 = _1535 * _1545;
        float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1557 = fma(_1553, _1551, _1555);
        float _1559 = _1557 * _1547;
        float _1561 = precise::clamp(_1559, 0.0, 1.0);
        _1415 = _1547;
        _1503 = _1561;
    }
    float _1563 = _1415;
    float _1565 = _1503;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1569 = _1487 + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1573 = _1489 + _1571;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1577 = _1491 + _1575;
    float _1579 = _1569 * _1569;
    float _1581 = fma(_1573, _1573, _1579);
    float _1583 = fma(_1577, _1577, _1581);
    float _1585 = rsqrt(_1583);
    float _1587 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1589 = _1573 * _1587;
    float _1591 = _1577 * _1587;
    float _1593 = _1589 * _1589;
    float _1595 = _1591 * _1591;
    float _1597 = _1593 + _1595;
    float _1599 = sqrt(_1597);
    bool _1601 = _1599 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1605 = _1599 + _1603;
    float _1607 = _1577;
    float _1609 = _1563;
    float _1611 = _1605;
    float _1613 = _1569;
    float _1615 = _1589;
    if (_1601)
    {
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1607 = _1617;
    }
    float _1619 = _1607;
    if (_1601)
    {
        float _1621 = rsqrt(_1597);
        _1609 = _1621;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (_1601)
    {
        float _1627 = _1605 * _1619;
        _1611 = _1627;
    }
    float _1629 = _1611;
    if (_1601)
    {
        float _1631 = _1629 * 0.15915493667125701904296875;
        _121 = _1631;
    }
    float _1633 = _121;
    float _1635 = _1579;
    if (_1601)
    {
        float _1637 = _1633 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        _1635 = _1639;
    }
    float _1641 = _1635;
    float _1643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1645 = precise::max(0.0, _1643);
    float _1647 = _1585;
    float _1649 = _1645;
    float _1651 = _1643;
    if (_1601)
    {
        float _1653 = _1633 * 6.283185482025146484375;
        float _1655 = cos(_1653);
        _1647 = _1655;
    }
    float _1657 = _1647;
    float _1659 = -_1587;
    float _1661 = -_1645;
    float _1663 = fma(_1569, _1659, _1661);
    if (!_1601)
    {
        _1649 = _1591;
    }
    float _1665 = _1649;
    float _1667 = _1665;
    if (_1601)
    {
        float _1669 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1669;
    }
    float _1671 = _1651;
    float _1673 = sqrt(_1583);
    float _1675 = _1641;
    float _1677 = _1671;
    if (_1601)
    {
        float _1679 = fma(_1641, _1671, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1613 = _1679;
    }
    float _1681 = _1613;
    float _1683 = _1681;
    if (!_1601)
    {
        _1675 = _1663;
    }
    float _1685 = _1675;
    float _1687 = _1685;
    if (_1601)
    {
        float _1689 = _1657 + (-1.0);
        _1677 = _1689;
    }
    float _1691 = _1677;
    float _1693 = _1691;
    if (_1601)
    {
        float _1695 = _1623 * _1681;
        _1035 = _1695;
    }
    float _1697 = _1035;
    if (!_1601)
    {
        _1683 = _1595;
    }
    float _1699 = _1683;
    float _1701 = _1699;
    if (_1601)
    {
        float _1703 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1625 = _1703;
    }
    float _1705 = _1625;
    if (_1601)
    {
        float _1707 = _1589 * _1697;
        _1615 = _1707;
    }
    float _1709 = _1615;
    if (!_1601)
    {
        _1693 = _1593;
    }
    float _1711 = _1693;
    float _1713 = _1711;
    if (_1601)
    {
        float _1715 = _1591 * _1697;
        _1667 = _1715;
    }
    float _1717 = _1667;
    if (_1601)
    {
        float _1719 = fma(_1663, _1657, _1705);
        _1687 = _1719;
    }
    float _1721 = _1687;
    if (_1601)
    {
        float _1723 = _1709 * _1709;
        _1713 = _1723;
    }
    float _1725 = _1713;
    if (_1601)
    {
        float _1727 = _1717 * _1717;
        _1701 = _1727;
    }
    float _1729 = _1701;
    float _1731 = fma(_1721, _1721, _1725);
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1735 = fma(_1673, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1733);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1741 = _1731 + _1729;
    float _1743 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1745 = -_1737;
    float _1747 = _1745 + 1.0;
    float _1749 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1739);
    float _1751 = rsqrt(_1741);
    float _1753 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1743);
    float _1755 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1757 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1759 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1749);
    float _1761 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1763 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1755);
    float _1765 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1767 = abs(_1747);
    float _1769 = log2(_1767);
    float _1771 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1757);
    float _1773 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1763);
    float _1775 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1777 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1779 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1771);
    float _1781 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1785 = _1751 * _1709;
    float _1787 = _1751 * _1721;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1783);
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1795 = _1751 * _1717;
    float _1797 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1799 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1791);
    float _1801 = -_1793;
    float _1803 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1801);
    float _1805 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1807 = -_1789;
    float _1809 = fma(_1807, _1765, 1.0);
    float _1811 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1799);
    float _1813 = -_1795;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1803);
    float _1817 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1819 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = exp2(_1805);
    float _1823 = fma(_1815, -0.5, 0.5);
    float _1825 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1817);
    float _1827 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1829 = fma(_1815, 0.5, 0.5);
    float _1831 = _1787 + 1.0;
    float _1833 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1825);
    float _1835 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1827);
    float _1837 = log2(_1809);
    float _1839 = fma(_1829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1841 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1833);
    float _1843 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1835);
    float _1845 = fma(_1829, _1839, -0.212114393711090087890625);
    float _1847 = 1.0 / _1811;
    float _1849 = -_1787;
    float _1851 = fma(_1821, _1831, _1849);
    float _1853 = fma(_1829, _1845, 1.570728778839111328125);
    float _1855 = fma(_1851, 0.5, 0.5);
    float _1857 = sqrt(_1823);
    float _1859 = _1837 * 0.693147182464599609375;
    float _1861 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1863 = _1841 * _1847;
    float _1865 = _1843 * _1847;
    float _1867 = fma(_1863, 0.5, 0.5);
    float _1869 = fma(_1865, -0.5, 0.5);
    float _1871 = _1857 * 0.636619746685028076171875;
    float3 _4852 = float3(_1867, _1869, _1861);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4852, float3(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4852, float3(0.0), isnan(_4852)), level(0.0)).x;
    float3 _4863 = float3(_1867, _1869, _1861);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = -_1853;
    float _1888 = fma(_1871, _1886, 1.0);
    float2 _4885 = float2(_1888, _1855);
    float3 _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4885, float2(0.0), isnan(_4885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4885, float2(0.0), isnan(_4885)), level(0.0)).xyz;
    float _1894 = _1892.x;
    float _1896 = _1892.y;
    float _1898 = _1892.z;
    float _1900 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1902 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1904 = _1565 > 0.0;
    bool _1906 = isnan(_1565);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = _1565 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1916 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1902);
    float _1918 = exp2(_1900);
    float _1920 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1916);
    float _1922 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _1924 = _1922 + _1811;
    out.gl_Position.x = _1841;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _1922;
    out.gl_Position.w = _1811;
    float _1926 = _1924 * 0.5;
    float _1928 = -_1918;
    float _1930 = _1928 + 1.0;
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1926;
    out.m_62.w = _1811;
    out.m_45.x = _1932;
    float _1936 = _1934 * _1873;
    float _1938 = -_1934;
    float _1940 = _1938 + 1.0;
    float _1942 = _1884 * _1936;
    float _1944 = _1898 * _1936;
    float _1946 = fma(_1894, _1942, _1878);
    float _1948 = fma(_1896, _1942, _1880);
    float _1950 = _1884 * _1940;
    float _1952 = fma(_1884, _1944, _1882);
    out.m_64.x = _1946;
    out.m_64.y = _1948;
    out.m_64.z = _1952;
    out.m_64.w = _1950;
    if (_1912)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1954;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_99);
        out.gl_Position.z = _2011;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = _117;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_137);
        out.gl_Position.z = _2080;
    }
    if (_131)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.w;
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = _143 * _141;
    float _167 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    float _179 = _175 * 0.15915493667125701904296875;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _179 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = 1.4012984643248170709237295832899e-45;
    float _191 = _147;
    if (!_157)
    {
        float _193 = _147 * _147;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_157)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    float _205 = -_177;
    float _207 = _167 + _205;
    bool _209 = !_157;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _147 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _147);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _243;
    }
    float _245 = _211;
    bool _247 = !_157;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _147 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _191 = _267;
    }
    float _269 = _191;
    float _271 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_269, _169, _271);
    bool _279 = _207 < 0.5;
    float _281 = float(_279);
    float _283 = fma(_269, _171, _273);
    float _285 = fma(_269, _173, _275);
    float _287 = fma(_187, 0.5, 0.5);
    float _289 = _275;
    if (!_157)
    {
        float _291 = _117 * _117;
        float _293 = _291 * 0.5;
        _289 = _293;
    }
    float _295 = _289;
    float _297 = -_207;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_287;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = fma(_277, _145, _159);
    float _311 = fma(_283, _145, _161);
    float _313 = fma(_285, _145, _163);
    float _315 = _295;
    if (!_157)
    {
        float _317 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _317;
    }
    float _319 = _315;
    float _321 = _319;
    if (!_157)
    {
        _213 = _117;
    }
    float _323 = _213;
    bool _325 = !_183;
    int _327 = _325 ? 0 : 1;
    bool _329 = !_157;
    float _331 = _323;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _117 * _335;
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _337 * 0.693147182464599609375;
        float _349 = exp2(_339);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _117);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _361;
    }
    float _363 = _321;
    bool _365 = !_157;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _117 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _331 = _385;
    }
    float _387 = _331;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _393 = _391 != 0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _397 = _395 != 0;
    float _399 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _401 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _403 = fma(_387, _169, _389);
    int _405 = abs(_327);
    float _407 = fma(_387, _171, _399);
    bool _409 = !_393;
    int _411 = _409 ? 0 : 1;
    float _413 = fma(_387, _173, _401);
    bool _415 = !_397;
    int _417 = _415 ? 0 : 1;
    float _419 = -_403;
    float _421 = _277 + _419;
    int _423 = abs(_411);
    float _425 = -_407;
    float _427 = _283 + _425;
    int _429 = abs(_417);
    float _431 = -_413;
    float _433 = _285 + _431;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _437 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = float(_423);
    float _445 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    float _451 = float(_405);
    float _453 = abs(_299);
    float _455 = _443 * _453;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _461 = fma(_451, _307, _455);
    float _463 = float(_429);
    float _465 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _467 = abs(_303);
    float _469 = fma(_463, _467, _461);
    bool _471 = !_435;
    float _473 = _465;
    float _475 = _457;
    float _477 = _459;
    float _493;
    if (!_471)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_83);
        float _499 = 1.0 / _497;
        float _501 = _117 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _503 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _503 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = 1.0 / _523;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _537 = 1.0 / _519;
    bool _539 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_503);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _527;
    float _553 = 1.0 / _531;
    float _555 = _507 * _537;
    bool _557 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _559 = isnan(_503);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_503);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    bool _581 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _583 = isnan(_503);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _511 * _551;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _503 + _595;
    float _599 = -_567;
    float _601 = _599 + 1.0;
    float _603 = _597 * _533;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _515 * _553;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _567 * _607;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _627 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_503);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _549 * _613;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _641;
    float _645 = -_549;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _653 = fma(_619, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = fma(_643, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = _637 * _647;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = fma(_625, _615, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _667 = _655 * _657;
    float _669 = _653 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _681 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _683 = fma(_673, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_677, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _695 = fma(_663, _639, _679);
    float _697 = fma(_665, _639, _681);
    float _699 = fma(_689, _603, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _701 = fma(_693, _603, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _703 = fma(_683, _609, _695);
    float _705 = fma(_685, _609, _697);
    float _707 = fma(_699, _621, _703);
    float _709 = fma(_701, _621, _705);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].x, _707);
    float _713 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].y, _709);
    bool _715 = !_535;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _719 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_83);
        float _737 = 1.0 / _735;
        float _739 = _117 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = in.m_51.x;
    float _749 = in.m_51.y;
    float _751 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    bool _753 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _755 = isnan(_741);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = in.m_49.y;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _773 = as_type<int>(_743) & 1;
    bool _775 = _773 != 0;
    int _777 = as_type<int>(_743) & 2;
    bool _779 = _777 != 0;
    float _781 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = _711 * _747;
    float _795 = _713 * _749;
    float _797 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _799 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _783);
    float _801 = _469 * _795;
    bool _803 = !_779;
    float _805 = _803 ? (-0.5) : 0.5;
    float _807 = _469 * _793;
    bool _809 = !_775;
    float _811 = _809 ? (-0.5) : 0.5;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _813;
    float _817 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _805);
    float _821 = 1.0 / _815;
    float _823 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _811);
    float _827 = _817 * _819;
    float _829 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _833 = _823 * _825;
    float _835 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _837 = -_767;
    float _839 = fma(_829, 2.0, _837);
    float _841 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _847 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _835);
    bool _849 = _139 > 0.5;
    float _851 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _831);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _855 = _741 + _853;
    float _857 = fma(_841, -2.0, _769);
    float _859 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _861 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].z, _799);
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _847);
    float _865 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    float _867 = _855 * _821;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _869;
    float _873 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].z, _751);
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _877 = _861 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = fma(_871, _867, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _885 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _889 = _877 + _879;
    bool _891 = _765 > 0.5;
    float _893 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _895;
    bool _899 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _901 = isnan(_741);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = _885 + _887;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _915 = _889 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _917;
    float _921 = fma(_897, _867, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _923 = -_909;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _929 = _911 + _927;
    float _931 = _915 * _915;
    float _933 = -_811;
    int _935 = _849 ? as_type<int>(_933) : as_type<int>(_811);
    float _937 = fma(_919, _867, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _939 = _763 * _925;
    float _941 = fma(_929, _929, _931);
    bool _943 = !_787;
    float _945 = _943 ? _811 : as_type<float>(_935);
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _949 = _883 * _939;
    float _951 = -_805;
    int _953 = _891 ? as_type<int>(_951) : as_type<int>(_805);
    float _955 = -_117;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _959 = _921 * _939;
    float _961 = _945 + 0.5;
    bool _963 = !_791;
    float _965 = _963 ? _805 : as_type<float>(_953);
    float _967 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = sqrt(_941);
    float _971 = -_763;
    float _973 = _971 + 1.0;
    float _975 = _937 * _939;
    float _977 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _979 = _873 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _981 = _771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _983 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    float _985 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _977);
    float _987 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _989 = _965 + (-0.5);
    float _991 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].y, _959);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _995 = fma(_987, _961, _957);
    float _997 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].x, _949);
    float _999 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].z, _975);
    float _1001 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    bool _1003 = _969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = _979 + _993;
    float _1007 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _851);
    float _1009 = -_981;
    float _1011 = -_983;
    float _1013 = fma(_1009, _989, _1011);
    float _1015 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].y, _991);
    float _1017 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].x, _997);
    float _1019 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].z, _999);
    float _1021 = -_1001;
    float _1023 = _1021 + 1.0;
    float _1025 = -_1007;
    float _1027 = _1025 + 1.0;
    float _1029 = _909;
    float _1031 = _1001;
    float _1033 = _993;
    float _1035 = _885;
    if (!_1003)
    {
        _1029 = _911;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1003)
    {
        _1031 = _889;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (!_1003)
    {
        _1033 = _1005;
    }
    float _1045 = _1033;
    bool _1047 = !_1003;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _969 + _1053;
        float _1057 = _1005 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_941);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = cos(_1069);
        float _1073 = fma(_1067, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = _1059 * _1073;
        float _1077 = _1071 + (-1.0);
        float _1079 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = fma(_929, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1083 = fma(_915, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1085 = fma(_1005, _1071, _1079);
        _1049 = _1085;
        _1039 = _1081;
        _1043 = _1083;
    }
    float _1087 = _1049;
    float _1089 = _1039;
    float _1091 = _1043;
    float _1093 = -_979;
    float _1095 = _1093 + _1087;
    float _1097 = -_1027;
    float _1099 = fma(_945, _1097, _995);
    float _1101 = fma(_965, _1023, _1013);
    float _1103 = -_885;
    float _1105 = _1103 + _1089;
    float _1107 = _1095 * _1095;
    float _1109 = -_877;
    float _1111 = _1109 + _1091;
    float _1113 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1115 = fma(_1105, _1105, _1107);
    out.m_56.x = _1099;
    out.m_56.y = _1101;
    float _1117 = fma(_1111, _1111, _1115);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1123 = sqrt(_1117);
    float _1125 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1129 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1133 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1135 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1135;
    out.m_58.y = _1133;
    out.m_58.z = _1137;
    out.m_60.x = _1139;
    out.m_60.y = _1141;
    out.m_60.z = _1143;
    out.m_60.w = _1131;
    bool _1145 = _1123 > 0.0;
    bool _1147 = !_1145;
    float _1149 = _1141;
    float _1151 = _1133;
    float _1153 = _1135;
    float _1155 = _1089;
    float _1157 = _1087;
    float _1159 = _1091;
    float _1161 = _1133;
    float _1163 = _1131;
    if (!_1147)
    {
        bool _1165 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1167 = _1131;
        if (_1165)
        {
            float _1169 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1167 = _1169;
        }
        float _1171 = _1167;
        _1163 = _1171;
        if (_1165)
        {
            float _1173 = _457 * _1171;
            _1149 = _1173;
        }
        float _1175 = _1149;
        float _1177 = _1175;
        if (_1165)
        {
            float _1179 = _465 * _1171;
            _1151 = _1179;
        }
        float _1181 = _1151;
        float _1183 = _1181;
        if (_1165)
        {
            float _1185 = _459 * _1171;
            _1153 = _1185;
        }
        float _1187 = _1153;
        float _1189 = _1187;
        float _1191 = _1187;
        if (!_1165)
        {
            float _1193 = _117 + 1.0;
            float _1195 = _1193;
            if (!_157)
            {
                float _1197 = _1193 * _1193;
                float _1199 = _1197 * 0.5;
                _1189 = _1199;
            }
            float _1201 = _1189;
            float _1203 = _1201;
            if (!_157)
            {
                float _1205 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1203 = _1205;
            }
            float _1207 = _1203;
            bool _1209 = !_157;
            float _1211 = _1207;
            if (!_1209)
            {
                float _1213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1215 = log2(_1213);
                float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1219 = _1217 + 1.0;
                float _1221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1223 = _1215 * _1193;
                float _1225 = 1.0 / _1219;
                float _1227 = _1221 * 0.693147182464599609375;
                float _1229 = exp2(_1223);
                float _1231 = 1.0 / _1227;
                float _1233 = _1229 + (-1.0);
                float _1235 = -_1233;
                float _1237 = fma(_1235, _1231, _1193);
                float _1239 = _1237 * _1225;
                float _1241 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1211 = _1241;
            }
            float _1243 = _1211;
            float _1245 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1247 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1249 = !_157;
            if (!_1249)
            {
                float _1251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1253 = log2(_1251);
                float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1257 = _1255 + 1.0;
                float _1259 = 1.0 / _1257;
                float _1261 = _1253 * _1193;
                float _1263 = exp2(_1261);
                float _1265 = -_1263;
                float _1267 = _1265 + 1.0;
                float _1269 = _1267 * _1259;
                _1195 = _1269;
            }
            float _1271 = _1195;
            float _1273 = fma(_1271, _171, _1247);
            float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1277 = fma(_1271, _169, _1245);
            float _1279 = -_407;
            float _1281 = _1279 + _1273;
            float _1283 = fma(_1271, _173, _1275);
            float _1285 = -_403;
            float _1287 = _1285 + _1277;
            float _1289 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1291 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1293 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1295 = -_413;
            float _1297 = _1295 + _1283;
            float _1299 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1289);
            float _1301 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1291);
            float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1293);
            float _1305 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1299);
            float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1301);
            float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1303);
            _473 = _1307;
            _475 = _1305;
            _477 = _1309;
            _1177 = _1305;
            _1183 = _1307;
            _1191 = _1309;
        }
        float _1311 = _473;
        float _1313 = _475;
        float _1315 = _477;
        float _1317 = _1177;
        float _1319 = _1183;
        float _1321 = _1191;
        float _1323 = _1311 * _1311;
        float _1325 = rsqrt(_1117);
        float _1327 = fma(_1313, _1313, _1323);
        float _1329 = fma(_1315, _1315, _1327);
        float _1331 = sqrt(_1329);
        float _1333 = _1105 * _1325;
        float _1335 = _1095 * _1325;
        float _1337 = _1111 * _1325;
        bool _1339 = _1331 > 0.0;
        bool _1341 = !_1339;
        _1161 = _1319;
        if (!_1341)
        {
            float _1343 = rsqrt(_1329);
            float _1345 = _1343 * _1311;
            float _1347 = _1343 * _1313;
            float _1349 = _1343 * _1315;
            float _1351 = _1335 * _1345;
            float _1353 = fma(_1333, _1347, _1351);
            float _1355 = fma(_1337, _1349, _1353);
            float _1357 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1359 = fma(_1317, _1357, _1089);
            float _1361 = fma(_1319, _1357, _1087);
            float _1363 = fma(_1321, _1357, _1091);
            _1155 = _1359;
            _1157 = _1361;
            _1159 = _1363;
        }
    }
    float _1365 = _1155;
    float _1367 = _1157;
    float _1369 = _1159;
    float _1371 = _1161;
    float _1373 = _1163;
    float _1375 = _979 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1377 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1379 = isnan(0.5);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1385 = _1381 || _1383;
    bool _1387 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1389 = isnan(0.5);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1395 = _1391 || _1393;
    float _1397 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1375);
    float _1399 = _979 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1397);
    float _1403 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1405 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1407 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1403);
    float _1409 = _1401;
    float _1411 = _1371;
    float _1413 = _1405;
    float _1415 = _1373;
    if (_1385)
    {
        _1409 = _1365;
    }
    float _1417 = _1409;
    float _1419 = 1.0 / _1405;
    float _1421 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1423 = _1421;
    float _1425 = _1417;
    if (_1385)
    {
        _1411 = _1367;
    }
    float _1427 = _1411;
    float _1429 = _1421 + _1405;
    float _1431 = _1427;
    if (_1385)
    {
        _1423 = _1369;
    }
    float _1433 = _1423;
    float _1435 = _1433;
    if (!_1385)
    {
        float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1439 = _979 + _1437;
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1443 = _885 + _1441;
        float _1445 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1447 = -_979;
        float _1449 = _1447 + _1367;
        float _1451 = _1439 * _1439;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1455 = _877 + _1453;
        float _1457 = fma(_1443, _1443, _1451);
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1461 = fma(_1455, _1455, _1457);
        float _1463 = sqrt(_1461);
        float _1465 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1467 = precise::min(_1463, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1469 = _1467 * _1459;
        float _1471 = -_885;
        float _1473 = _1471 + _1365;
        float _1475 = _1465 * _1469;
        float _1477 = -_877;
        float _1479 = _1477 + _1369;
        float _1481 = fma(_1473, _1475, _885);
        float _1483 = fma(_1449, _1475, _979);
        float _1485 = fma(_1479, _1475, _877);
        _1431 = _1483;
        _1425 = _1481;
        _1435 = _1485;
        _1413 = _1463;
    }
    float _1487 = _1431;
    float _1489 = _1425;
    float _1491 = _1435;
    float _1493 = _1413;
    float _1495 = _1493;
    if (_1395)
    {
        _1495 = 1.0;
    }
    float _1497 = _1495;
    float _1499 = _1429 * _1419;
    float _1501 = _1499 * 0.5;
    float _1503 = _1497;
    if (!_1395)
    {
        float _1505 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1511);
        float _1515 = _1507 * 6.283185482025146484375;
        float _1517 = cos(_1515);
        float _1519 = _1509 * 0.15915493667125701904296875;
        float _1521 = _1507 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = 1.0 / _1517;
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        float _1531 = _1523 * _1525;
        float _1533 = _1519 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1539 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1537;
        float _1541 = _1529 * _1531;
        float _1543 = 1.0 / _1513;
        float _1545 = 1.0 / _1541;
        float _1547 = 1.0 / _1539;
        float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1551 = _1543 * _1549;
        float _1553 = _1535 * _1545;
        float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1557 = fma(_1553, _1551, _1555);
        float _1559 = _1557 * _1547;
        float _1561 = precise::clamp(_1559, 0.0, 1.0);
        _1415 = _1547;
        _1503 = _1561;
    }
    float _1563 = _1415;
    float _1565 = _1503;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1569 = _1487 + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1573 = _1489 + _1571;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1577 = _1491 + _1575;
    float _1579 = _1569 * _1569;
    float _1581 = fma(_1573, _1573, _1579);
    float _1583 = fma(_1577, _1577, _1581);
    float _1585 = rsqrt(_1583);
    float _1587 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1589 = _1573 * _1587;
    float _1591 = _1577 * _1587;
    float _1593 = _1589 * _1589;
    float _1595 = _1591 * _1591;
    float _1597 = _1593 + _1595;
    float _1599 = sqrt(_1597);
    bool _1601 = _1599 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1605 = _1599 + _1603;
    float _1607 = _1577;
    float _1609 = _1563;
    float _1611 = _1605;
    float _1613 = _1569;
    float _1615 = _1589;
    if (_1601)
    {
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1607 = _1617;
    }
    float _1619 = _1607;
    if (_1601)
    {
        float _1621 = rsqrt(_1597);
        _1609 = _1621;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (_1601)
    {
        float _1627 = _1605 * _1619;
        _1611 = _1627;
    }
    float _1629 = _1611;
    if (_1601)
    {
        float _1631 = _1629 * 0.15915493667125701904296875;
        _121 = _1631;
    }
    float _1633 = _121;
    float _1635 = _1579;
    if (_1601)
    {
        float _1637 = _1633 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        _1635 = _1639;
    }
    float _1641 = _1635;
    float _1643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1645 = precise::max(0.0, _1643);
    float _1647 = _1585;
    float _1649 = _1645;
    float _1651 = _1643;
    if (_1601)
    {
        float _1653 = _1633 * 6.283185482025146484375;
        float _1655 = cos(_1653);
        _1647 = _1655;
    }
    float _1657 = _1647;
    float _1659 = -_1587;
    float _1661 = -_1645;
    float _1663 = fma(_1569, _1659, _1661);
    if (!_1601)
    {
        _1649 = _1591;
    }
    float _1665 = _1649;
    float _1667 = _1665;
    if (_1601)
    {
        float _1669 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1669;
    }
    float _1671 = _1651;
    float _1673 = sqrt(_1583);
    float _1675 = _1641;
    float _1677 = _1671;
    if (_1601)
    {
        float _1679 = fma(_1641, _1671, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1613 = _1679;
    }
    float _1681 = _1613;
    float _1683 = _1681;
    if (!_1601)
    {
        _1675 = _1663;
    }
    float _1685 = _1675;
    float _1687 = _1685;
    if (_1601)
    {
        float _1689 = _1657 + (-1.0);
        _1677 = _1689;
    }
    float _1691 = _1677;
    float _1693 = _1691;
    if (_1601)
    {
        float _1695 = _1623 * _1681;
        _1035 = _1695;
    }
    float _1697 = _1035;
    if (!_1601)
    {
        _1683 = _1595;
    }
    float _1699 = _1683;
    float _1701 = _1699;
    if (_1601)
    {
        float _1703 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1625 = _1703;
    }
    float _1705 = _1625;
    if (_1601)
    {
        float _1707 = _1589 * _1697;
        _1615 = _1707;
    }
    float _1709 = _1615;
    if (!_1601)
    {
        _1693 = _1593;
    }
    float _1711 = _1693;
    float _1713 = _1711;
    if (_1601)
    {
        float _1715 = _1591 * _1697;
        _1667 = _1715;
    }
    float _1717 = _1667;
    if (_1601)
    {
        float _1719 = fma(_1663, _1657, _1705);
        _1687 = _1719;
    }
    float _1721 = _1687;
    if (_1601)
    {
        float _1723 = _1709 * _1709;
        _1713 = _1723;
    }
    float _1725 = _1713;
    if (_1601)
    {
        float _1727 = _1717 * _1717;
        _1701 = _1727;
    }
    float _1729 = _1701;
    float _1731 = fma(_1721, _1721, _1725);
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1735 = fma(_1673, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1733);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1741 = _1731 + _1729;
    float _1743 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1745 = -_1737;
    float _1747 = _1745 + 1.0;
    float _1749 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1739);
    float _1751 = rsqrt(_1741);
    float _1753 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1743);
    float _1755 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1757 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1759 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1749);
    float _1761 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1763 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1755);
    float _1765 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1767 = abs(_1747);
    float _1769 = log2(_1767);
    float _1771 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1757);
    float _1773 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1763);
    float _1775 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1777 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1779 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1771);
    float _1781 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1785 = _1751 * _1709;
    float _1787 = _1751 * _1721;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1783);
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1795 = _1751 * _1717;
    float _1797 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1799 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1791);
    float _1801 = -_1793;
    float _1803 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1801);
    float _1805 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1807 = -_1789;
    float _1809 = fma(_1807, _1765, 1.0);
    float _1811 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1799);
    float _1813 = -_1795;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1803);
    float _1817 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1819 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = exp2(_1805);
    float _1823 = fma(_1815, -0.5, 0.5);
    float _1825 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1817);
    float _1827 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1829 = fma(_1815, 0.5, 0.5);
    float _1831 = _1787 + 1.0;
    float _1833 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1825);
    float _1835 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1827);
    float _1837 = log2(_1809);
    float _1839 = fma(_1829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1841 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1833);
    float _1843 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1835);
    float _1845 = fma(_1829, _1839, -0.212114393711090087890625);
    float _1847 = 1.0 / _1811;
    float _1849 = -_1787;
    float _1851 = fma(_1821, _1831, _1849);
    float _1853 = fma(_1829, _1845, 1.570728778839111328125);
    float _1855 = fma(_1851, 0.5, 0.5);
    float _1857 = sqrt(_1823);
    float _1859 = _1837 * 0.693147182464599609375;
    float _1861 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1863 = _1841 * _1847;
    float _1865 = _1843 * _1847;
    float _1867 = fma(_1863, 0.5, 0.5);
    float _1869 = fma(_1865, -0.5, 0.5);
    float _1871 = _1857 * 0.636619746685028076171875;
    float3 _4852 = float3(_1867, _1869, _1861);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4852, float3(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4852, float3(0.0), isnan(_4852)), level(0.0)).x;
    float3 _4863 = float3(_1867, _1869, _1861);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = -_1853;
    float _1888 = fma(_1871, _1886, 1.0);
    float2 _4885 = float2(_1888, _1855);
    float3 _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4885, float2(0.0), isnan(_4885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4885, float2(0.0), isnan(_4885)), level(0.0)).xyz;
    float _1894 = _1892.x;
    float _1896 = _1892.y;
    float _1898 = _1892.z;
    float _1900 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1902 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1904 = _1565 > 0.0;
    bool _1906 = isnan(_1565);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = _1565 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1916 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1902);
    float _1918 = exp2(_1900);
    float _1920 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1916);
    float _1922 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _1924 = _1922 + _1811;
    out.gl_Position.x = _1841;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _1922;
    out.gl_Position.w = _1811;
    float _1926 = _1924 * 0.5;
    float _1928 = -_1918;
    float _1930 = _1928 + 1.0;
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1926;
    out.m_62.w = _1811;
    out.m_45.x = _1932;
    float _1936 = _1934 * _1873;
    float _1938 = -_1934;
    float _1940 = _1938 + 1.0;
    float _1942 = _1884 * _1936;
    float _1944 = _1898 * _1936;
    float _1946 = fma(_1894, _1942, _1878);
    float _1948 = fma(_1896, _1942, _1880);
    float _1950 = _1884 * _1940;
    float _1952 = fma(_1884, _1944, _1882);
    out.m_64.x = _1946;
    out.m_64.y = _1948;
    out.m_64.z = _1952;
    out.m_64.w = _1950;
    if (_1912)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1954;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_99);
        out.gl_Position.z = _2011;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = _117;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_137);
        out.gl_Position.z = _2080;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.w;
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = _143 * _141;
    float _167 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    float _179 = _175 * 0.15915493667125701904296875;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _179 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = 1.4012984643248170709237295832899e-45;
    float _191 = _147;
    if (!_157)
    {
        float _193 = _147 * _147;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_157)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    float _205 = -_177;
    float _207 = _167 + _205;
    bool _209 = !_157;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _147 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _147);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _243;
    }
    float _245 = _211;
    bool _247 = !_157;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _147 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _191 = _267;
    }
    float _269 = _191;
    float _271 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_269, _169, _271);
    bool _279 = _207 < 0.5;
    float _281 = float(_279);
    float _283 = fma(_269, _171, _273);
    float _285 = fma(_269, _173, _275);
    float _287 = fma(_187, 0.5, 0.5);
    float _289 = _275;
    if (!_157)
    {
        float _291 = _117 * _117;
        float _293 = _291 * 0.5;
        _289 = _293;
    }
    float _295 = _289;
    float _297 = -_207;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_287;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = fma(_277, _145, _159);
    float _311 = fma(_283, _145, _161);
    float _313 = fma(_285, _145, _163);
    float _315 = _295;
    if (!_157)
    {
        float _317 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _317;
    }
    float _319 = _315;
    float _321 = _319;
    if (!_157)
    {
        _213 = _117;
    }
    float _323 = _213;
    bool _325 = !_183;
    int _327 = _325 ? 0 : 1;
    bool _329 = !_157;
    float _331 = _323;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _117 * _335;
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _337 * 0.693147182464599609375;
        float _349 = exp2(_339);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _117);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _361;
    }
    float _363 = _321;
    bool _365 = !_157;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _117 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _331 = _385;
    }
    float _387 = _331;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _393 = _391 != 0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _397 = _395 != 0;
    float _399 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _401 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _403 = fma(_387, _169, _389);
    int _405 = abs(_327);
    float _407 = fma(_387, _171, _399);
    bool _409 = !_393;
    int _411 = _409 ? 0 : 1;
    float _413 = fma(_387, _173, _401);
    bool _415 = !_397;
    int _417 = _415 ? 0 : 1;
    float _419 = -_403;
    float _421 = _277 + _419;
    int _423 = abs(_411);
    float _425 = -_407;
    float _427 = _283 + _425;
    int _429 = abs(_417);
    float _431 = -_413;
    float _433 = _285 + _431;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _437 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _439 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = float(_423);
    float _445 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
    float _447 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    float _451 = float(_405);
    float _453 = abs(_299);
    float _455 = _443 * _453;
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _461 = fma(_451, _307, _455);
    float _463 = float(_429);
    float _465 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _467 = abs(_303);
    float _469 = fma(_463, _467, _461);
    bool _471 = !_435;
    float _473 = _465;
    float _475 = _457;
    float _477 = _459;
    float _493;
    if (!_471)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_83);
        float _499 = 1.0 / _497;
        float _501 = _117 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _503 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _503 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = 1.0 / _523;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _537 = 1.0 / _519;
    bool _539 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_503);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _527;
    float _553 = 1.0 / _531;
    float _555 = _507 * _537;
    bool _557 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _559 = isnan(_503);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_503);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    bool _581 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _583 = isnan(_503);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _511 * _551;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _503 + _595;
    float _599 = -_567;
    float _601 = _599 + 1.0;
    float _603 = _597 * _533;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _515 * _553;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _567 * _607;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _627 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_503);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _549 * _613;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _641;
    float _645 = -_549;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _653 = fma(_619, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = fma(_643, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = _637 * _647;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = fma(_625, _615, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _667 = _655 * _657;
    float _669 = _653 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _681 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _683 = fma(_673, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_677, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _695 = fma(_663, _639, _679);
    float _697 = fma(_665, _639, _681);
    float _699 = fma(_689, _603, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _701 = fma(_693, _603, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _703 = fma(_683, _609, _695);
    float _705 = fma(_685, _609, _697);
    float _707 = fma(_699, _621, _703);
    float _709 = fma(_701, _621, _705);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].x, _707);
    float _713 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].y, _709);
    bool _715 = !_535;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _719 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_83);
        float _737 = 1.0 / _735;
        float _739 = _117 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = in.m_51.x;
    float _749 = in.m_51.y;
    float _751 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    bool _753 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _755 = isnan(_741);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = in.m_49.y;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _773 = as_type<int>(_743) & 1;
    bool _775 = _773 != 0;
    int _777 = as_type<int>(_743) & 2;
    bool _779 = _777 != 0;
    float _781 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = _711 * _747;
    float _795 = _713 * _749;
    float _797 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _799 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _783);
    float _801 = _469 * _795;
    bool _803 = !_779;
    float _805 = _803 ? (-0.5) : 0.5;
    float _807 = _469 * _793;
    bool _809 = !_775;
    float _811 = _809 ? (-0.5) : 0.5;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _813;
    float _817 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _805);
    float _821 = 1.0 / _815;
    float _823 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _811);
    float _827 = _817 * _819;
    float _829 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _833 = _823 * _825;
    float _835 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _837 = -_767;
    float _839 = fma(_829, 2.0, _837);
    float _841 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _845 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _847 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _835);
    bool _849 = _139 > 0.5;
    float _851 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _831);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _855 = _741 + _853;
    float _857 = fma(_841, -2.0, _769);
    float _859 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _843);
    float _861 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].z, _799);
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _847);
    float _865 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    float _867 = _855 * _821;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _869;
    float _873 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].z, _751);
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _877 = _861 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _883 = fma(_871, _867, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _885 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _889 = _877 + _879;
    bool _891 = _765 > 0.5;
    float _893 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _881);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _895;
    bool _899 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _901 = isnan(_741);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = _885 + _887;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _915 = _889 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _917;
    float _921 = fma(_897, _867, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _923 = -_909;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _929 = _911 + _927;
    float _931 = _915 * _915;
    float _933 = -_811;
    int _935 = _849 ? as_type<int>(_933) : as_type<int>(_811);
    float _937 = fma(_919, _867, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _939 = _763 * _925;
    float _941 = fma(_929, _929, _931);
    bool _943 = !_787;
    float _945 = _943 ? _811 : as_type<float>(_935);
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _949 = _883 * _939;
    float _951 = -_805;
    int _953 = _891 ? as_type<int>(_951) : as_type<int>(_805);
    float _955 = -_117;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _959 = _921 * _939;
    float _961 = _945 + 0.5;
    bool _963 = !_791;
    float _965 = _963 ? _805 : as_type<float>(_953);
    float _967 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = sqrt(_941);
    float _971 = -_763;
    float _973 = _971 + 1.0;
    float _975 = _937 * _939;
    float _977 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _979 = _873 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _981 = _771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _983 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    float _985 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _977);
    float _987 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _989 = _965 + (-0.5);
    float _991 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].y, _959);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _995 = fma(_987, _961, _957);
    float _997 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].x, _949);
    float _999 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].z, _975);
    float _1001 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    bool _1003 = _969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = _979 + _993;
    float _1007 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _851);
    float _1009 = -_981;
    float _1011 = -_983;
    float _1013 = fma(_1009, _989, _1011);
    float _1015 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].y, _991);
    float _1017 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].x, _997);
    float _1019 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[108].z, _999);
    float _1021 = -_1001;
    float _1023 = _1021 + 1.0;
    float _1025 = -_1007;
    float _1027 = _1025 + 1.0;
    float _1029 = _909;
    float _1031 = _1001;
    float _1033 = _993;
    float _1035 = _885;
    if (!_1003)
    {
        _1029 = _911;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1003)
    {
        _1031 = _889;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (!_1003)
    {
        _1033 = _1005;
    }
    float _1045 = _1033;
    bool _1047 = !_1003;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _969 + _1053;
        float _1057 = _1005 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_941);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = cos(_1069);
        float _1073 = fma(_1067, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = _1059 * _1073;
        float _1077 = _1071 + (-1.0);
        float _1079 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = fma(_929, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1083 = fma(_915, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1085 = fma(_1005, _1071, _1079);
        _1049 = _1085;
        _1039 = _1081;
        _1043 = _1083;
    }
    float _1087 = _1049;
    float _1089 = _1039;
    float _1091 = _1043;
    float _1093 = -_979;
    float _1095 = _1093 + _1087;
    float _1097 = -_1027;
    float _1099 = fma(_945, _1097, _995);
    float _1101 = fma(_965, _1023, _1013);
    float _1103 = -_885;
    float _1105 = _1103 + _1089;
    float _1107 = _1095 * _1095;
    float _1109 = -_877;
    float _1111 = _1109 + _1091;
    float _1113 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1115 = fma(_1105, _1105, _1107);
    out.m_56.x = _1099;
    out.m_56.y = _1101;
    float _1117 = fma(_1111, _1111, _1115);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1123 = sqrt(_1117);
    float _1125 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1129 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1133 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1135 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1135;
    out.m_58.y = _1133;
    out.m_58.z = _1137;
    out.m_60.x = _1139;
    out.m_60.y = _1141;
    out.m_60.z = _1143;
    out.m_60.w = _1131;
    bool _1145 = _1123 > 0.0;
    bool _1147 = !_1145;
    float _1149 = _1141;
    float _1151 = _1133;
    float _1153 = _1135;
    float _1155 = _1089;
    float _1157 = _1087;
    float _1159 = _1091;
    float _1161 = _1133;
    float _1163 = _1131;
    if (!_1147)
    {
        bool _1165 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1167 = _1131;
        if (_1165)
        {
            float _1169 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1167 = _1169;
        }
        float _1171 = _1167;
        _1163 = _1171;
        if (_1165)
        {
            float _1173 = _457 * _1171;
            _1149 = _1173;
        }
        float _1175 = _1149;
        float _1177 = _1175;
        if (_1165)
        {
            float _1179 = _465 * _1171;
            _1151 = _1179;
        }
        float _1181 = _1151;
        float _1183 = _1181;
        if (_1165)
        {
            float _1185 = _459 * _1171;
            _1153 = _1185;
        }
        float _1187 = _1153;
        float _1189 = _1187;
        float _1191 = _1187;
        if (!_1165)
        {
            float _1193 = _117 + 1.0;
            float _1195 = _1193;
            if (!_157)
            {
                float _1197 = _1193 * _1193;
                float _1199 = _1197 * 0.5;
                _1189 = _1199;
            }
            float _1201 = _1189;
            float _1203 = _1201;
            if (!_157)
            {
                float _1205 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1203 = _1205;
            }
            float _1207 = _1203;
            bool _1209 = !_157;
            float _1211 = _1207;
            if (!_1209)
            {
                float _1213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1215 = log2(_1213);
                float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1219 = _1217 + 1.0;
                float _1221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1223 = _1215 * _1193;
                float _1225 = 1.0 / _1219;
                float _1227 = _1221 * 0.693147182464599609375;
                float _1229 = exp2(_1223);
                float _1231 = 1.0 / _1227;
                float _1233 = _1229 + (-1.0);
                float _1235 = -_1233;
                float _1237 = fma(_1235, _1231, _1193);
                float _1239 = _1237 * _1225;
                float _1241 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1211 = _1241;
            }
            float _1243 = _1211;
            float _1245 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1247 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1249 = !_157;
            if (!_1249)
            {
                float _1251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1253 = log2(_1251);
                float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1257 = _1255 + 1.0;
                float _1259 = 1.0 / _1257;
                float _1261 = _1253 * _1193;
                float _1263 = exp2(_1261);
                float _1265 = -_1263;
                float _1267 = _1265 + 1.0;
                float _1269 = _1267 * _1259;
                _1195 = _1269;
            }
            float _1271 = _1195;
            float _1273 = fma(_1271, _171, _1247);
            float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1277 = fma(_1271, _169, _1245);
            float _1279 = -_407;
            float _1281 = _1279 + _1273;
            float _1283 = fma(_1271, _173, _1275);
            float _1285 = -_403;
            float _1287 = _1285 + _1277;
            float _1289 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1291 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1293 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1295 = -_413;
            float _1297 = _1295 + _1283;
            float _1299 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1289);
            float _1301 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1291);
            float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1293);
            float _1305 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1299);
            float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1301);
            float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1303);
            _473 = _1307;
            _475 = _1305;
            _477 = _1309;
            _1177 = _1305;
            _1183 = _1307;
            _1191 = _1309;
        }
        float _1311 = _473;
        float _1313 = _475;
        float _1315 = _477;
        float _1317 = _1177;
        float _1319 = _1183;
        float _1321 = _1191;
        float _1323 = _1311 * _1311;
        float _1325 = rsqrt(_1117);
        float _1327 = fma(_1313, _1313, _1323);
        float _1329 = fma(_1315, _1315, _1327);
        float _1331 = sqrt(_1329);
        float _1333 = _1105 * _1325;
        float _1335 = _1095 * _1325;
        float _1337 = _1111 * _1325;
        bool _1339 = _1331 > 0.0;
        bool _1341 = !_1339;
        _1161 = _1319;
        if (!_1341)
        {
            float _1343 = rsqrt(_1329);
            float _1345 = _1343 * _1311;
            float _1347 = _1343 * _1313;
            float _1349 = _1343 * _1315;
            float _1351 = _1335 * _1345;
            float _1353 = fma(_1333, _1347, _1351);
            float _1355 = fma(_1337, _1349, _1353);
            float _1357 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1359 = fma(_1317, _1357, _1089);
            float _1361 = fma(_1319, _1357, _1087);
            float _1363 = fma(_1321, _1357, _1091);
            _1155 = _1359;
            _1157 = _1361;
            _1159 = _1363;
        }
    }
    float _1365 = _1155;
    float _1367 = _1157;
    float _1369 = _1159;
    float _1371 = _1161;
    float _1373 = _1163;
    float _1375 = _979 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1377 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1379 = isnan(0.5);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1385 = _1381 || _1383;
    bool _1387 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1389 = isnan(0.5);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1395 = _1391 || _1393;
    float _1397 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1375);
    float _1399 = _979 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1397);
    float _1403 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1405 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1407 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1403);
    float _1409 = _1401;
    float _1411 = _1371;
    float _1413 = _1405;
    float _1415 = _1373;
    if (_1385)
    {
        _1409 = _1365;
    }
    float _1417 = _1409;
    float _1419 = 1.0 / _1405;
    float _1421 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1423 = _1421;
    float _1425 = _1417;
    if (_1385)
    {
        _1411 = _1367;
    }
    float _1427 = _1411;
    float _1429 = _1421 + _1405;
    float _1431 = _1427;
    if (_1385)
    {
        _1423 = _1369;
    }
    float _1433 = _1423;
    float _1435 = _1433;
    if (!_1385)
    {
        float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1439 = _979 + _1437;
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1443 = _885 + _1441;
        float _1445 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1447 = -_979;
        float _1449 = _1447 + _1367;
        float _1451 = _1439 * _1439;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1455 = _877 + _1453;
        float _1457 = fma(_1443, _1443, _1451);
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1461 = fma(_1455, _1455, _1457);
        float _1463 = sqrt(_1461);
        float _1465 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1467 = precise::min(_1463, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1469 = _1467 * _1459;
        float _1471 = -_885;
        float _1473 = _1471 + _1365;
        float _1475 = _1465 * _1469;
        float _1477 = -_877;
        float _1479 = _1477 + _1369;
        float _1481 = fma(_1473, _1475, _885);
        float _1483 = fma(_1449, _1475, _979);
        float _1485 = fma(_1479, _1475, _877);
        _1431 = _1483;
        _1425 = _1481;
        _1435 = _1485;
        _1413 = _1463;
    }
    float _1487 = _1431;
    float _1489 = _1425;
    float _1491 = _1435;
    float _1493 = _1413;
    float _1495 = _1493;
    if (_1395)
    {
        _1495 = 1.0;
    }
    float _1497 = _1495;
    float _1499 = _1429 * _1419;
    float _1501 = _1499 * 0.5;
    float _1503 = _1497;
    if (!_1395)
    {
        float _1505 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1511);
        float _1515 = _1507 * 6.283185482025146484375;
        float _1517 = cos(_1515);
        float _1519 = _1509 * 0.15915493667125701904296875;
        float _1521 = _1507 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = 1.0 / _1517;
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        float _1531 = _1523 * _1525;
        float _1533 = _1519 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1539 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1537;
        float _1541 = _1529 * _1531;
        float _1543 = 1.0 / _1513;
        float _1545 = 1.0 / _1541;
        float _1547 = 1.0 / _1539;
        float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1551 = _1543 * _1549;
        float _1553 = _1535 * _1545;
        float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1557 = fma(_1553, _1551, _1555);
        float _1559 = _1557 * _1547;
        float _1561 = precise::clamp(_1559, 0.0, 1.0);
        _1415 = _1547;
        _1503 = _1561;
    }
    float _1563 = _1415;
    float _1565 = _1503;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1569 = _1487 + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1573 = _1489 + _1571;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1577 = _1491 + _1575;
    float _1579 = _1569 * _1569;
    float _1581 = fma(_1573, _1573, _1579);
    float _1583 = fma(_1577, _1577, _1581);
    float _1585 = rsqrt(_1583);
    float _1587 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1589 = _1573 * _1587;
    float _1591 = _1577 * _1587;
    float _1593 = _1589 * _1589;
    float _1595 = _1591 * _1591;
    float _1597 = _1593 + _1595;
    float _1599 = sqrt(_1597);
    bool _1601 = _1599 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1605 = _1599 + _1603;
    float _1607 = _1577;
    float _1609 = _1563;
    float _1611 = _1605;
    float _1613 = _1569;
    float _1615 = _1589;
    if (_1601)
    {
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1607 = _1617;
    }
    float _1619 = _1607;
    if (_1601)
    {
        float _1621 = rsqrt(_1597);
        _1609 = _1621;
    }
    float _1623 = _1609;
    float _1625 = _1623;
    if (_1601)
    {
        float _1627 = _1605 * _1619;
        _1611 = _1627;
    }
    float _1629 = _1611;
    if (_1601)
    {
        float _1631 = _1629 * 0.15915493667125701904296875;
        _121 = _1631;
    }
    float _1633 = _121;
    float _1635 = _1579;
    if (_1601)
    {
        float _1637 = _1633 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        _1635 = _1639;
    }
    float _1641 = _1635;
    float _1643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1645 = precise::max(0.0, _1643);
    float _1647 = _1585;
    float _1649 = _1645;
    float _1651 = _1643;
    if (_1601)
    {
        float _1653 = _1633 * 6.283185482025146484375;
        float _1655 = cos(_1653);
        _1647 = _1655;
    }
    float _1657 = _1647;
    float _1659 = -_1587;
    float _1661 = -_1645;
    float _1663 = fma(_1569, _1659, _1661);
    if (!_1601)
    {
        _1649 = _1591;
    }
    float _1665 = _1649;
    float _1667 = _1665;
    if (_1601)
    {
        float _1669 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1669;
    }
    float _1671 = _1651;
    float _1673 = sqrt(_1583);
    float _1675 = _1641;
    float _1677 = _1671;
    if (_1601)
    {
        float _1679 = fma(_1641, _1671, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1613 = _1679;
    }
    float _1681 = _1613;
    float _1683 = _1681;
    if (!_1601)
    {
        _1675 = _1663;
    }
    float _1685 = _1675;
    float _1687 = _1685;
    if (_1601)
    {
        float _1689 = _1657 + (-1.0);
        _1677 = _1689;
    }
    float _1691 = _1677;
    float _1693 = _1691;
    if (_1601)
    {
        float _1695 = _1623 * _1681;
        _1035 = _1695;
    }
    float _1697 = _1035;
    if (!_1601)
    {
        _1683 = _1595;
    }
    float _1699 = _1683;
    float _1701 = _1699;
    if (_1601)
    {
        float _1703 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1625 = _1703;
    }
    float _1705 = _1625;
    if (_1601)
    {
        float _1707 = _1589 * _1697;
        _1615 = _1707;
    }
    float _1709 = _1615;
    if (!_1601)
    {
        _1693 = _1593;
    }
    float _1711 = _1693;
    float _1713 = _1711;
    if (_1601)
    {
        float _1715 = _1591 * _1697;
        _1667 = _1715;
    }
    float _1717 = _1667;
    if (_1601)
    {
        float _1719 = fma(_1663, _1657, _1705);
        _1687 = _1719;
    }
    float _1721 = _1687;
    if (_1601)
    {
        float _1723 = _1709 * _1709;
        _1713 = _1723;
    }
    float _1725 = _1713;
    if (_1601)
    {
        float _1727 = _1717 * _1717;
        _1701 = _1727;
    }
    float _1729 = _1701;
    float _1731 = fma(_1721, _1721, _1725);
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1735 = fma(_1673, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1733);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1741 = _1731 + _1729;
    float _1743 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1745 = -_1737;
    float _1747 = _1745 + 1.0;
    float _1749 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1739);
    float _1751 = rsqrt(_1741);
    float _1753 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1743);
    float _1755 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1757 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1759 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1749);
    float _1761 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1763 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1755);
    float _1765 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1767 = abs(_1747);
    float _1769 = log2(_1767);
    float _1771 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1757);
    float _1773 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1763);
    float _1775 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1777 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1779 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1771);
    float _1781 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1785 = _1751 * _1709;
    float _1787 = _1751 * _1721;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1783);
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1795 = _1751 * _1717;
    float _1797 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1799 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1791);
    float _1801 = -_1793;
    float _1803 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1801);
    float _1805 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1807 = -_1789;
    float _1809 = fma(_1807, _1765, 1.0);
    float _1811 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1799);
    float _1813 = -_1795;
    float _1815 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1803);
    float _1817 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1819 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = exp2(_1805);
    float _1823 = fma(_1815, -0.5, 0.5);
    float _1825 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1817);
    float _1827 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1829 = fma(_1815, 0.5, 0.5);
    float _1831 = _1787 + 1.0;
    float _1833 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1825);
    float _1835 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1827);
    float _1837 = log2(_1809);
    float _1839 = fma(_1829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1841 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1833);
    float _1843 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1835);
    float _1845 = fma(_1829, _1839, -0.212114393711090087890625);
    float _1847 = 1.0 / _1811;
    float _1849 = -_1787;
    float _1851 = fma(_1821, _1831, _1849);
    float _1853 = fma(_1829, _1845, 1.570728778839111328125);
    float _1855 = fma(_1851, 0.5, 0.5);
    float _1857 = sqrt(_1823);
    float _1859 = _1837 * 0.693147182464599609375;
    float _1861 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1863 = _1841 * _1847;
    float _1865 = _1843 * _1847;
    float _1867 = fma(_1863, 0.5, 0.5);
    float _1869 = fma(_1865, -0.5, 0.5);
    float _1871 = _1857 * 0.636619746685028076171875;
    float3 _4852 = float3(_1867, _1869, _1861);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4852, float3(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4852, float3(0.0), isnan(_4852)), level(0.0)).x;
    float3 _4863 = float3(_1867, _1869, _1861);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = -_1853;
    float _1888 = fma(_1871, _1886, 1.0);
    float2 _4885 = float2(_1888, _1855);
    float3 _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4885, float2(0.0), isnan(_4885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4885, float2(0.0), isnan(_4885)), level(0.0)).xyz;
    float _1894 = _1892.x;
    float _1896 = _1892.y;
    float _1898 = _1892.z;
    float _1900 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1902 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1904 = _1565 > 0.0;
    bool _1906 = isnan(_1565);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = _1565 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1916 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1902);
    float _1918 = exp2(_1900);
    float _1920 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1916);
    float _1922 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1920);
    float _1924 = _1922 + _1811;
    out.gl_Position.x = _1841;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _1922;
    out.gl_Position.w = _1811;
    float _1926 = _1924 * 0.5;
    float _1928 = -_1918;
    float _1930 = _1928 + 1.0;
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1926;
    out.m_62.w = _1811;
    out.m_45.x = _1932;
    float _1936 = _1934 * _1873;
    float _1938 = -_1934;
    float _1940 = _1938 + 1.0;
    float _1942 = _1884 * _1936;
    float _1944 = _1898 * _1936;
    float _1946 = fma(_1894, _1942, _1878);
    float _1948 = fma(_1896, _1942, _1880);
    float _1950 = _1884 * _1940;
    float _1952 = fma(_1884, _1944, _1882);
    out.m_64.x = _1946;
    out.m_64.y = _1948;
    out.m_64.z = _1952;
    out.m_64.w = _1950;
    if (_1912)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1954;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

