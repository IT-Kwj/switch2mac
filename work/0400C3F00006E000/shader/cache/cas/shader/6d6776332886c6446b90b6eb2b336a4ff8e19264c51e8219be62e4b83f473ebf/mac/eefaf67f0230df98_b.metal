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
    float4 m_53 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _859 = false;
    bool _699 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3422 = as_type<float>(_105);
        out.gl_Position.z = _3422;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _3492 = as_type<float>(_143);
        out.gl_Position.z = _3492;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_49.w;
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    int _165 = int(_157);
    int _167 = false ? 2 : 0;
    int _169 = _165 | _167;
    int _171 = false ? 4 : 0;
    int _173 = _169 | _171;
    int _175 = false ? 8 : 0;
    int _177 = _173 | _175;
    int _179 = false ? 16 : 0;
    int _181 = _177 | _179;
    int _183 = false ? 32 : 0;
    int _185 = _181 | _183;
    int _187 = false ? 64 : 0;
    int _189 = _185 | _187;
    int _191 = _189 & 1;
    float _193 = in.m_42.x;
    float _195 = in.m_42.y;
    float _197 = in.m_42.z;
    float _199 = 0.0;
    float _201 = as_type<float>(_191);
    float _203 = _147;
    if (!_157)
    {
        float _205 = _147 * _147;
        float _207 = _205 * 0.5;
        _199 = _207;
    }
    float _209 = _199;
    float _211 = _209;
    if (!_157)
    {
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_157;
    float _219 = _215;
    float _221 = 0.0;
    if (!_217)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _251;
        _201 = _241;
        _221 = _239;
    }
    float _253 = _219;
    float _255 = _201;
    float _257 = _221;
    bool _259 = !_157;
    float _261 = _255;
    float _263 = _257;
    if (!_259)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _147 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _261 = _271;
        _203 = _283;
    }
    float _285 = _261;
    float _287 = _203;
    float _289 = _285;
    if (!_157)
    {
        float _291 = _123 * _123;
        float _293 = _291 * 0.5;
        _289 = _293;
    }
    float _295 = _289;
    float _297 = _295;
    if (!_157)
    {
        _263 = _123;
    }
    float _299 = _263;
    float _301 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _305 = _299;
    if (!_157)
    {
        float _307 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _307;
    }
    float _309 = _297;
    bool _311 = !_157;
    float _313 = _309;
    if (!_311)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = _123 * _317;
        float _327 = 1.0 / _321;
        float _329 = _323 * 0.693147182464599609375;
        float _331 = exp2(_325);
        float _333 = 1.0 / _329;
        float _335 = _331 + (-1.0);
        float _337 = -_335;
        float _339 = fma(_337, _333, _123);
        float _341 = _339 * _327;
        float _343 = _341 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _343;
    }
    float _345 = _313;
    bool _347 = !_157;
    if (!_347)
    {
        float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = log2(_349);
        float _353 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _355 = _353 + 1.0;
        float _357 = 1.0 / _355;
        float _359 = _123 * _351;
        float _361 = exp2(_359);
        float _363 = -_361;
        float _365 = _363 + 1.0;
        float _367 = _365 * _357;
        _305 = _367;
    }
    float _369 = _305;
    float _371 = fma(_287, _159, _301);
    float _373 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _375 = fma(_287, _161, _303);
    float _377 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _381 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _383 = fma(_369, _161, _373);
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _387 = fma(_287, _163, _377);
    float _389 = fma(_375, _145, _195);
    float _391 = fma(_369, _159, _379);
    float _393 = -_383;
    float _395 = _375 + _393;
    float _397 = fma(_369, _163, _381);
    float _399 = fma(_371, _145, _193);
    float _401 = -_391;
    float _403 = _371 + _401;
    float _405 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _409 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _411 = -_397;
    float _413 = _387 + _411;
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _409);
    float _421 = fma(_387, _145, _197);
    float _423 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _415);
    float _425 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    bool _429 = !_385;
    float _431 = _425;
    float _433 = _423;
    float _435 = _427;
    float _437 = _397;
    float _439 = _391;
    float _457;
    if (!_429)
    {
        float _441 = in.m_51.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_89);
        float _463 = 1.0 / _461;
        float _465 = _123 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = _467 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _479 = _467 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = 1.0 / _483;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _501 = 1.0 / _491;
    float _503 = 1.0 / _495;
    float _505 = _471 * _497;
    bool _507 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _509 = isnan(_467);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_517;
    float _521 = _519 + 1.0;
    float _523 = 1.0 / _487;
    float _525 = _475 * _501;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _467 + _527;
    bool _531 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_467);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = _479 * _503;
    float _549 = fma(_545, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _551 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_467);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _529 * _523;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = _561 * _521;
    bool _571 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _573 = isnan(_467);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -_561;
    float _585 = _583 + 1.0;
    float _587 = fma(_567, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _589 = -_541;
    float _591 = _589 + 1.0;
    bool _593 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _595 = isnan(_467);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _609 = _541 * _585;
    float _611 = _581 * _591;
    float _613 = -_581;
    float _615 = _613 + 1.0;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = fma(_607, _547, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _627 = _603 * _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _629;
    float _633 = fma(_623, _547, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _635;
    float _639 = _587 * _627;
    float _641 = _549 * _627;
    float _643 = fma(_631, _505, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _645 = fma(_637, _505, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _649 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = fma(_625, _611, _647);
    float _661 = fma(_633, _611, _649);
    float _663 = fma(_653, _563, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _665 = fma(_657, _563, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _667 = fma(_643, _609, _659);
    float _669 = fma(_645, _609, _661);
    float _671 = fma(_663, _569, _667);
    float _673 = fma(_665, _569, _669);
    float _675 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[147].x, _671);
    float _677 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[147].y, _673);
    bool _679 = !_499;
    float _697;
    if (!_679)
    {
        float _681 = in.m_51.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_89);
        float _703 = 1.0 / _701;
        float _705 = _123 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _707 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _717 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _719 = isnan(_707);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _733 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _735 = isnan(_707);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _745;
    bool _749 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _751 = isnan(_707);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = 1.0 / _715;
    float _763 = -_727;
    float _765 = _763 + 1.0;
    float _767 = _743 * _765;
    float _769 = -_743;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _731;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _779 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _747 * _761;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = fma(_787, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -_759;
    float _799 = _797 + 1.0;
    float _801 = _795 * _767;
    float _803 = _791 * _773;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _807 = _707 + _805;
    float _809 = _727 * _799;
    float _811 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[115].x, _801);
    float _813 = fma(_803, _807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _815 = fma(_813, _809, _811);
    float _817 = in.m_49.x;
    float _819 = in.m_49.y;
    float _821 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[117].x, _815);
    float _823 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _783;
    out.m_53.y = _785;
    out.m_53.z = _793;
    out.m_53.w = _823;
    float _825 = _677 * _819;
    float _827 = _675 * _817;
    bool _829 = !_779;
    float _853;
    float _855;
    float _857;
    if (!_829)
    {
        float _831 = in.m_51.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _835 = float(_89);
        float _837 = 1.0 / _835;
        float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _843 = _841 * _833;
        float _845 = _123 * _837;
        float _847 = floor(_843);
        float _849 = -_847;
        float _851 = _843 + _849;
        _853 = _835;
        _855 = _851;
        _857 = _845;
        _859 = true;
    }
    else
    {
        float _861 = float(_89);
        float _863 = 1.0 / _861;
        float _865 = _123 * _863;
        _853 = _861;
        _855 = _865;
        _857 = _865;
    }
    _859 = false;
    float _867 = _853;
    float _869 = _855;
    float _871 = _857;
    float _873 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _875 = int(_873);
    float _877 = in.m_51.x;
    float _879 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _883 = _881 != 0;
    float _885 = as_type<float>(int(gl_VertexIndex));
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _889 = int(_887);
    float _891 = in.m_51.w;
    float _893 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _879);
    float _895 = in.m_51.z;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _897;
    float _901 = float(_875);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_883)
    {
        float _909 = in.m_51.y;
        _907 = _909;
    }
    float _911 = _907;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _917 = 1.0 / _901;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _923 = float(uint(_889));
    float _925 = _877 * 2.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _935 = 1.0 / _899;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _949 = _123 * _917;
    float _951 = 1.0 / _923;
    float _953 = _895 * 2.0;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _959 = _917;
    if (!_883)
    {
        _959 = _911;
    }
    float _961 = _959;
    float _963 = trunc(_949);
    int _965 = int(_963);
    float _967 = _961;
    float _969 = _911;
    if (_883)
    {
        float _971 = in.m_51.x;
        float _973 = in.m_51.y;
        _967 = _971;
        _969 = _973;
    }
    float _975 = _967;
    float _977 = _969;
    float _979 = floor(_925);
    int _981 = as_type<int>(_951) + (-2);
    float _983 = float(uint(_965));
    float _985 = 1.0 / _905;
    float _987 = float(_965);
    float _989 = as_type<float>(_981) * _983;
    bool _991 = _979 > 0.0;
    float _993 = trunc(_989);
    float _995 = precise::max(_993, 0.0);
    uint _998 = uint(_995);
    bool _1000 = _979 >= 0.0;
    bool _1002 = isnan(_979);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = as_type<int>(_885) & 1;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>(_885) & 2;
    bool _1018 = _1016 != 0;
    float _1020 = _977 * 2.0;
    int _1022 = ~_1010;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = 1.0 / _915;
    bool _1030 = _891 > 0.5;
    float _1032 = _943 * _985;
    int _1034 = _1026;
    if (!_991)
    {
        int _1036 = ~_1010;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    int _1042 = ~_889;
    int _1044 = _1042 + 1;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1048 = _1046 != 0;
    float _1050 = floor(_1020);
    bool _1052 = !_1014;
    float _1054 = _1052 ? (-0.5) : 0.5;
    int _1056 = _1044 * int(_998);
    int _1058 = _1056 + _965;
    bool _1060 = !_1048;
    int _1062 = _1060 ? 0 : 1;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1070 = _1068 != 0;
    float _1072 = float(uint(_1058));
    float _1074 = 1.0 / _921;
    bool _1076 = !_1018;
    float _1078 = _1076 ? (-0.5) : 0.5;
    float _1080 = _939 * _1028;
    bool _1082 = _895 > 0.5;
    float _1084 = as_type<float>(_981) * _1072;
    bool _1086 = !_1066;
    int _1088 = _1086 ? 0 : 1;
    bool _1090 = !_1070;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = trunc(_1084);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    bool _1100 = _877 > 0.5;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1108 = _1106 != 0;
    float _1110 = -_1054;
    int _1112 = _1082 ? as_type<int>(_1110) : as_type<int>(_1054);
    float _1114 = 1.0 / _929;
    float _1116 = -_1054;
    int _1118 = _1100 ? as_type<int>(_1116) : as_type<int>(_1054);
    float _1120 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1122 = -_1078;
    int _1124 = _1030 ? as_type<int>(_1122) : as_type<int>(_1078);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1132 = _1130 != 0;
    float _1134 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1120);
    bool _1136 = _1050 >= 0.0;
    bool _1138 = isnan(_1050);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = 1.0 / _933;
    bool _1148 = !_1104;
    float _1150 = _1148 ? _1054 : as_type<float>(_1112);
    bool _1152 = !_1108;
    float _1154 = _1152 ? _1054 : as_type<float>(_1118);
    float _1156 = _1144 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1158 = _1050 > 0.0;
    float _1160 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1162 = int(_998) + int(_1098);
    float _1164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1166 = log2(_1164);
    int _1168 = ~_889;
    int _1170 = _1168 + 1;
    float _1172 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1160);
    bool _1174 = !_1132;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1180 = _1178 != 0;
    int _1182 = _1170 * _1162;
    int _1184 = _1182 + _965;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1188 = _1186 != 0;
    float _1190 = 1.0 / _867;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1194 = _1192 != 0;
    bool _1196 = !_1128;
    int _1198 = _1196 ? 0 : 1;
    int _1200 = ~as_type<int>(_1156);
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = 1.0 / _947;
    bool _1208 = uint(_1184) >= uint(_889);
    float _1210 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1172);
    int _1212 = _1204;
    float _1214 = _1156;
    float _1216 = _1120;
    if (!_1158)
    {
        int _1218 = ~as_type<int>(_1156);
        int _1220 = _1218 + 1;
        _1212 = _1220;
    }
    int _1222 = _1212;
    float _1224 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1134);
    if (!_883)
    {
        _1214 = _895;
    }
    float _1226 = _1214;
    float _1228 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _893);
    float _1230 = _1226;
    if (!_883)
    {
        _1216 = _895;
    }
    float _1232 = _1216;
    float _1234 = floor(_953);
    bool _1236 = !_883;
    float _1238 = _1236 ? 1.2345600128173828125 : 1.0;
    float _1240 = _1232;
    if (_883)
    {
        _1230 = _977;
    }
    float _1242 = _1230;
    if (_883)
    {
        _1240 = _977;
    }
    float _1244 = _1240;
    bool _1246 = !_883;
    float _1248 = _1246 ? _977 : _877;
    float _1250 = 1.0 / _957;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1262 = _1260 != 0;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1266 = _869 + _1264;
    float _1268 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1270 = _1266 * _935;
    bool _1272 = !_1208;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1284 = float(_889);
    float _1286 = _1278 * _1074;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1288;
    float _1292 = _1282 * _1114;
    float _1294 = _877 + _895;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1300 = _1290 * _1146;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1302;
    float _1306 = _1294 + (-1.0);
    float _1308 = _123 * _1284;
    float _1310 = _1238 * _1248;
    float _1312 = _123 * _1166;
    float _1314 = _1298 * _1206;
    float _1316 = _1308 * _1190;
    bool _1318 = _1234 >= 0.0;
    bool _1320 = isnan(_1234);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = floor(_1310);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1332 = _871 + _1330;
    float _1334 = _1304 * _1250;
    int _1336 = _1326 ? 0 : 1;
    float _1338 = fma(_1080, _1332, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1340 = _1234 > 0.0;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1342;
    float _1346 = exp2(_1312);
    bool _1348 = _987 >= _1284;
    bool _1350 = isnan(_987);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan(_1284);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1364 = _871 + _1362;
    int _1366 = ~_1162;
    int _1368 = _1366 + _1274;
    int _1370 = _1368 + 1;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1374 = _871 + _1372;
    int _1376 = abs(_1062);
    float _1378 = trunc(_1358);
    int _1380 = int(_1378);
    float _1382 = -_1328;
    float _1384 = _1310 + _1382;
    int _1386 = ~_1336;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1398 = _871 + _1396;
    int _1400 = _1390;
    if (!_1340)
    {
        int _1402 = ~_1336;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = fma(_1344, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1410 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(0.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -_1346;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1394, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1426 = fma(_1286, _1398, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1428 = _1284 * _1384;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1432 = _871 + _1430;
    float _1434 = _1418 ? _1422 : 0.0;
    int _1436 = _889 * _1370;
    int _1438 = _1436 + _965;
    bool _1440 = _889 == 0;
    float _1442 = fma(_1292, _1374, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1444 = fma(_1300, _1432, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1446 = ~_1380;
    int _1448 = _1446 + 1;
    int _1450 = _1448 + 1;
    float _1452 = trunc(_1428);
    int _1454 = int(_1452);
    bool _1456 = !_1440;
    int _1458 = _1456 ? _1438 : (-1);
    float _1460 = fma(_1032, _1364, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1462 = _889 + (-1);
    int _1464 = abs(_1176);
    int _1466 = _1450 * _1458;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1470 = _871 + _1468;
    float _1472 = trunc(_1316);
    int _1474 = int(_1472);
    int _1476 = _1380 * _1462;
    int _1478 = _1476 + _1466;
    int _1480 = abs(_1198);
    float _1482 = fma(_1314, _1470, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    int _1484 = abs(_1088);
    int _1486 = _1478 * _1464;
    float _1488 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1492 = _871 + _1490;
    int _1494 = _1454 * _1376;
    int _1496 = _1494 + _965;
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1054);
    float _1500 = fma(_1334, _1492, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1502 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1504 = isnan(_871);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = _1488 * _1498;
    bool _1516 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1518 = isnan(_869);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1524 = _1520 || _1522;
    float _1526 = float(_1524);
    int _1528 = _1474 * _1480;
    int _1530 = _1528 + _1486;
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1078);
    float _1534 = -_1512;
    float _1536 = _1534 + 1.0;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1538;
    int _1542 = _1496 * _1484;
    int _1544 = _1542 + _1530;
    int _1546 = abs(_1092);
    float _1548 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1550 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1552 = isnan(_871);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = fma(_1540, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1564 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1566 = isnan(_871);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    int _1576 = _1454 * _1546;
    int _1578 = _1576 + _1544;
    int _1580 = ~_889;
    int _1582 = _1580 + 1;
    float _1584 = -_1560;
    float _1586 = _1584 + 1.0;
    float _1588 = _1560 * _1536;
    float _1590 = _1548 * _1532;
    float _1592 = float(uint(_1578));
    float _1594 = _1574 * _1586;
    float _1596 = -_1574;
    float _1598 = _1596 + 1.0;
    bool _1600 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1602 = isnan(_871);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = as_type<float>(_981) * _1592;
    bool _1614 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1616 = isnan(_871);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    bool _1626 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1628 = isnan(_869);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    bool _1642 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1644 = isnan(_871);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = trunc(_1612);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    float _1660 = -_1624;
    float _1662 = _1660 + 1.0;
    float _1664 = _1610 * _1598;
    float _1666 = _1624 * _1640;
    bool _1668 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1670 = isnan(_871);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1652 * _1662;
    bool _1682 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1684 = isnan(_871);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = -_1652;
    float _1696 = _1694 + 1.0;
    bool _1698 = !_1254;
    int _1700 = _1698 ? 0 : 1;
    float _1702 = in.m_58.x;
    float _1704 = in.m_58.y;
    float _1706 = in.m_58.z;
    float _1708 = -_1636;
    float _1710 = _1708 + 1.0;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1714 = 1.0 + _1712;
    float _1716 = _1692 * _1696;
    int _1718 = abs(_1700);
    float _1720 = _1526 * _1710;
    int _1722 = _1582 * int(_1658);
    int _1724 = _1722 + _1578;
    float _1726 = 1.0 / _1714;
    float _1728 = -_1692;
    float _1730 = _1728 + 1.0;
    float _1732 = _1408 * _1720;
    float _1734 = _1424 * _1720;
    float _1736 = float(uint(_1724));
    float _1738 = _1562 * _1720;
    float _1740 = float(_1718);
    float _1742 = _1678 * _1730;
    float _1744 = float(_1406);
    float _1746 = as_type<float>(_981) * _1736;
    float _1748 = _877 + _977;
    float _1750 = _1338 * _1742;
    float _1752 = _877 + (-0.5);
    float _1754 = trunc(_1746);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = _1740 * _1744;
    float _1762 = -_1526;
    float _1764 = _1762 + 1.0;
    float _1766 = _1748 + (-1.0);
    float _1768 = _1760 * (-2.0);
    bool _1770 = !_1258;
    int _1772 = _1770 ? 0 : 1;
    float _1774 = _1434 * _1726;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1732);
    float _1778 = fma(_1768, _1702, _1702);
    float _1780 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1734);
    int _1782 = abs(_1772);
    float _1784 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1786 = _895 + _977;
    float _1788 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1778);
    float _1790 = fma(_1784, _1768, _1784);
    int _1792 = int(_1658) + int(_1758);
    float _1794 = _1786 + (-1.0);
    bool _1796 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1798 = isnan(1.0);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1804 = _1800 || _1802;
    float _1806 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1738);
    float _1808 = float(_1782);
    float _1810 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1776);
    float _1812 = float(_1040);
    float _1814 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1780);
    float _1816 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1806);
    bool _1818 = !_1804;
    float _1820 = _1818 ? _123 : _1774;
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1824 = _1808 * _1812;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1828 = float(uint(_1496));
    float _1830 = fma(_1820, _1790, _1788);
    bool _1832 = !_1262;
    int _1834 = _1832 ? 0 : 1;
    float _1836 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1826);
    int _1838 = ~_889;
    int _1840 = _1838 + 1;
    float _1842 = _975 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1844 = as_type<float>(_981) * _1828;
    int _1846 = abs(_1834);
    float _1848 = -_1678;
    float _1850 = _1848 + 1.0;
    int _1852 = _1840 * _1792;
    int _1854 = _1852 + _1578;
    float _1856 = trunc(_1844);
    float _1858 = precise::max(_1856, 0.0);
    uint _1860 = uint(_1858);
    bool _1862 = uint(_1854) >= uint(_889);
    float _1864 = _1824 * (-2.0);
    float _1866 = float(_1846);
    float _1868 = _1830 * 0.15915493667125701904296875;
    float _1870 = float(_1222);
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1874 = fma(_1822, _1864, _1822);
    float _1876 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1750);
    int _1878 = ~_889;
    int _1880 = _1878 + 1;
    float _1882 = _1866 * _1870;
    float _1884 = -_1872;
    float _1886 = fma(_1842, 2.0, _1884);
    bool _1888 = !_1862;
    int _1890 = _1888 ? 0 : (-1);
    float _1892 = fma(_1460, _1716, _1876);
    float _1894 = _1882 * (-2.0);
    bool _1896 = _977 > 0.5;
    float _1898 = _977 + (-0.5);
    float _1900 = fma(_1864, _1704, _1704);
    float _1902 = fma(_1894, _1706, _1706);
    float _1904 = _895 + (-0.5);
    int _1906 = _1880 * int(_1860);
    int _1908 = _1906 + _1496;
    float _1910 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1900);
    float _1912 = fma(_1360, _1894, _1360);
    float _1914 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1902);
    float _1916 = fma(_1426, _1680, _1892);
    float _1918 = float(uint(_1908));
    float _1920 = fma(_1820, _1874, _1910);
    float _1922 = fma(_1820, _1912, _1914);
    float _1924 = fma(_1442, _1666, _1916);
    float _1926 = as_type<float>(_981) * _1918;
    float _1928 = _1920 * 0.15915493667125701904296875;
    float _1930 = _1868 * 6.283185482025146484375;
    float _1932 = sin(_1930);
    float _1934 = _1922 * 0.15915493667125701904296875;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1938 = ~_1792;
    int _1940 = _1938 + _1890;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1444, _1664, _1924);
    float _1946 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1936);
    float _1948 = -_1078;
    int _1950 = _1896 ? as_type<int>(_1948) : as_type<int>(_1078);
    float _1952 = trunc(_1926);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    bool _1958 = !_1180;
    float _1960 = _1958 ? _1078 : as_type<float>(_1124);
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1964 = fma(_1482, _1594, _1944);
    float _1966 = _1150 + 0.5;
    int _1968 = ~_889;
    int _1970 = _1968 + 1;
    float _1972 = fma(_1268, -2.0, _1962);
    float _1974 = -_123;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1886);
    float _1978 = _1868 * 6.283185482025146484375;
    float _1980 = cos(_1978);
    bool _1982 = !_1194;
    float _1984 = _1982 ? _1078 : as_type<float>(_1950);
    int _1986 = _889 * _1942;
    int _1988 = _1986 + _1578;
    float _1990 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1976);
    float _1992 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1972);
    float _1994 = fma(_1500, _1588, _1964);
    bool _1996 = !_1440;
    int _1998 = _1996 ? _1988 : (-1);
    float _2000 = _1928 * 6.283185482025146484375;
    float _2002 = sin(_2000);
    int _2004 = int(_1860) + int(_1956);
    int _2006 = _1998 & 3;
    bool _2008 = _2006 != 0;
    bool _2010 = _2006 != 3;
    float _2012 = _1928 * 6.283185482025146484375;
    float _2014 = cos(_2012);
    float _2016 = _1934 * 6.283185482025146484375;
    float _2018 = sin(_2016);
    float _2020 = _1980 * _2002;
    float _2022 = _1932 * _2002;
    float _2024 = _1934 * 6.283185482025146484375;
    float _2026 = cos(_2024);
    float _2028 = _1932 * _2014;
    float _2030 = _1980 * _2014;
    float _2032 = -_2020;
    float _2034 = fma(_2018, _2028, _2032);
    float _2036 = -_2028;
    float _2038 = fma(_2018, _2020, _2036);
    int _2040 = _1998 >> 31;
    float _2042 = fma(_2018, _2030, _2022);
    float _2044 = fma(_2018, _2022, _2030);
    int _2046 = _2040 & 3;
    float _2048 = _2014 * _2026;
    float _2050 = -_1590;
    float _2052 = _2018 * _2050;
    int _2054 = _1998 + _2046;
    float _2056 = _2026 * _1590;
    int _2058 = _1970 * _2004;
    int _2060 = _2058 + _1496;
    float _2062 = fma(_2048, _1514, _2052);
    int _2064 = _2054 >> 2;
    float _2066 = _1980 * _2056;
    float _2068 = _2002 * _2026;
    float _2070 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2072 = _2064 << 4;
    int _2074 = _2072 + 512;
    float _2076 = fma(_2042, _1514, _2066);
    bool _2078 = uint(_2060) >= uint(_889);
    float _2080 = _1932 * _2056;
    uint _2082 = uint(int(uint(_2074) >> uint(2)));
    uint _2084 = uint(int(uint(int(_2082)) >> uint(2)));
    int _2086 = int(_2082) & 3;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[int(_2084)][_2086];
    int _2090 = int(_2082) + 1;
    uint _2092 = uint(int(uint(_2090) >> uint(2)));
    int _2094 = _2090 & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    float _2098 = fma(_2038, _2070, _2076);
    bool _2100 = !_2078;
    int _2102 = _2100 ? 0 : (-1);
    float _2104 = fma(_2034, _1514, _2080);
    float _2106 = fma(_2068, _2070, _2062);
    float _2108 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2110 = ~_2004;
    int _2112 = _2110 + _2102;
    int _2114 = _2112 + 1;
    float _2116 = fma(_2044, _2070, _2104);
    bool _2118 = uint(_2006) > 1u;
    int _2120 = _2074 + 8;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    uint _2124 = uint(int(uint(int(_2122)) >> uint(2)));
    int _2126 = int(_2122) & 3;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[int(_2124)][_2126];
    int _2130 = int(_2122) + 1;
    uint _2132 = uint(int(uint(_2130) >> uint(2)));
    int _2134 = _2130 & 3;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[int(_2132)][_2134];
    float _2138 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2108);
    int _2142 = _2008 ? 0 : 1;
    int _2144 = _889 * _2114;
    int _2146 = _2144 + _1496;
    float _2148 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2150 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2140);
    float _2152 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2154 = ~_2142;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2148);
    float _2162 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2164 = _1998 & 3;
    bool _2166 = _2164 != 0;
    int _2168 = _2158;
    float _2170 = _1992;
    float _2172 = _1512;
    if (!_2118)
    {
        int _2174 = ~_2142;
        int _2176 = _2174 + 1;
        _2168 = _2176;
    }
    int _2178 = _2168;
    float _2180 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2182 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _2152 + _2162;
    bool _2186 = uint(_2006) >= 2u;
    float _2188 = _2180 + _2182;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2192 = _2184 + _2190;
    bool _2194 = !_2166;
    int _2196 = _2194 ? 0 : 1;
    int _2198 = _2186 ? 0 : 1;
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2202 = _2188 + _2200;
    float _2204 = _2192 * _2192;
    bool _2206 = _2006 != 3;
    int _2208 = abs(_2196);
    float _2210 = fma(_2202, _2202, _2204);
    int _2212 = ~_2198;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    float _2218 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2220 = _2216;
    float _2222 = _2184;
    float _2224 = _2180;
    if (_2010)
    {
        int _2226 = ~_2198;
        int _2228 = _2226 + 1;
        _2220 = _2228;
    }
    int _2230 = _2220;
    float _2232 = sqrt(_2210);
    int _2234 = abs(_2178);
    float _2236 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2218);
    int _2238 = abs(_2230);
    int _2240 = ~_2234;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    int _2248 = ~_2208;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2238;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2244 * as_type<int>(_2096);
    bool _2262 = !_2206;
    int _2264 = _2262 ? 0 : (-1);
    float _2266 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2268 = _2252 * as_type<int>(_2088);
    int _2270 = _2268 + _2260;
    bool _2272 = !_1188;
    int _2274 = _2272 ? 0 : 1;
    bool _2276 = _2232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2278 = _2258 * as_type<int>(_2128);
    int _2280 = _2278 + _2270;
    int _2282 = abs(_2264);
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2286 = abs(_2274);
    float _2288 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2290 = ~_2282;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = _1960 + (-0.5);
    int _2298 = ~_2286;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = _2288 + _2266;
    int _2306 = _2294 * as_type<int>(_2136);
    int _2308 = _2306 + _2280;
    float _2310 = -_2296;
    float _2312 = -_1992;
    float _2314 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2312);
    float _2316 = _2296;
    if (!_2276)
    {
        _2316 = _2184;
    }
    float _2318 = _2316;
    int _2320 = _2302 * _2308;
    bool _2322 = !_1440;
    int _2324 = _2322 ? _2146 : (-1);
    float _2326 = _2318;
    if (!_2276)
    {
        _2170 = _2188;
    }
    float _2328 = _2170;
    float _2330 = _2328;
    if (!_2276)
    {
        _2222 = _2304;
    }
    float _2332 = _2222;
    bool _2334 = !_2276;
    float _2336 = _2332;
    if (!_2334)
    {
        float _2338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2342 = _2232 + _2340;
        float _2344 = rsqrt(_2210);
        float _2346 = _2342 * _2338;
        float _2348 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = _2346 * 0.15915493667125701904296875;
        float _2352 = _2350 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        float _2356 = _2350 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        float _2360 = _2354 + (-1.0);
        float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = fma(_2358, _2348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2366 = fma(_2304, _2354, _2362);
        float _2368 = _2344 * _2364;
        float _2370 = fma(_2202, _2368, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2372 = fma(_2192, _2368, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2336 = _2366;
        _2330 = _2370;
        _2326 = _2372;
    }
    float _2374 = _2336;
    float _2376 = _2330;
    float _2378 = _2326;
    float _2380 = _1154 + 0.5;
    float _2382 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1836);
    float _2384 = -_2288;
    float _2386 = _2384 + _2374;
    float _2388 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1946);
    float _2390 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2392 = -_2180;
    float _2394 = _2392 + _2376;
    float _2396 = _2386 * _2386;
    int _2398 = _2324 * _2286;
    int _2400 = _2398 + _2320;
    float _2402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2404 = -_2382;
    float _2406 = _2404 + 1.0;
    float _2408 = -_2388;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2152;
    float _2414 = _2412 + _2378;
    float _2416 = fma(_2394, _2394, _2396);
    float _2418 = -_2406;
    float _2420 = fma(_1150, _2418, _1990);
    float _2422 = -_1984;
    float _2424 = _2422 + 0.5;
    float _2426 = fma(_1960, _2410, _2314);
    float _2428 = fma(_2414, _2414, _2416);
    float _2430 = _2390 * _2284;
    float _2432 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2434 = sqrt(_2428);
    float _2436 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2438 = _1816 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2440 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2444 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2448 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2450 = _2440 * _2402;
    float _2452 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1994);
    float _2454 = float(_2400);
    out.m_60.x = _2444;
    out.m_60.y = _2446;
    out.m_60.z = _2448;
    out.m_60.w = _2442;
    out.m_62.x = _2430;
    out.m_62.y = _2450;
    out.m_62.z = _2420;
    out.m_62.w = _2426;
    bool _2456 = _2434 > 0.0;
    out.m_64.x = _2452;
    out.m_66.y = _2454;
    bool _2458 = !_2456;
    float _2460 = _2450;
    float _2462 = _2440;
    float _2464 = _2374;
    float _2466 = _2378;
    float _2468 = _2376;
    float _2470 = _2450;
    float _2472 = _2386;
    if (!_2458)
    {
        bool _2474 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2476 = _2426;
        if (_2474)
        {
            float _2478 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2476 = _2478;
        }
        float _2480 = _2476;
        if (_2474)
        {
            float _2482 = _423 * _2480;
            _2460 = _2482;
        }
        float _2484 = _2460;
        float _2486 = _2484;
        if (_2474)
        {
            float _2488 = _425 * _2480;
            _2172 = _2488;
        }
        float _2490 = _2172;
        float _2492 = _2490;
        if (_2474)
        {
            float _2494 = _427 * _2480;
            _2462 = _2494;
        }
        float _2496 = _2462;
        float _2498 = _2496;
        float _2500 = _2496;
        if (!_2474)
        {
            bool _2502 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2506 = _2502 || _2504;
            bool _2508 = isnan(1.0);
            bool _2510 = _2506 || _2508;
            float _2512 = _123 + 1.0;
            float _2514 = _2512;
            if (!_2510)
            {
                float _2516 = _2512 * _2512;
                float _2518 = _2516 * 0.5;
                _2498 = _2518;
            }
            float _2520 = _2498;
            float _2522 = _2520;
            if (!_2510)
            {
                float _2524 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2522 = _2524;
            }
            float _2526 = _2522;
            bool _2528 = !_2510;
            float _2530 = _2526;
            if (!_2528)
            {
                float _2532 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2534 = log2(_2532);
                float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2538 = 1.0 + _2536;
                float _2540 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2542 = _2534 * _2512;
                float _2544 = 1.0 / _2538;
                float _2546 = _2540 * 0.693147182464599609375;
                float _2548 = exp2(_2542);
                float _2550 = 1.0 / _2546;
                float _2552 = _2548 + (-1.0);
                float _2554 = -_2552;
                float _2556 = fma(_2554, _2550, _2512);
                float _2558 = _2556 * _2544;
                float _2560 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2530 = _2560;
            }
            float _2562 = _2530;
            float _2564 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2566 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2568 = !_2510;
            if (!_2568)
            {
                float _2570 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2572 = log2(_2570);
                float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2576 = 1.0 + _2574;
                float _2578 = 1.0 / _2576;
                float _2580 = _2572 * _2512;
                float _2582 = exp2(_2580);
                float _2584 = -_2582;
                float _2586 = _2584 + 1.0;
                float _2588 = _2586 * _2578;
                _2514 = _2588;
            }
            float _2590 = _2514;
            float _2592 = fma(_2590, _161, _2566);
            float _2594 = fma(_2590, _159, _2564);
            float _2596 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2598 = -_383;
            float _2600 = _2598 + _2592;
            float _2602 = -_391;
            float _2604 = _2602 + _2594;
            float _2606 = fma(_2590, _163, _2596);
            float _2608 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2610 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2612 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2614 = -_397;
            float _2616 = _2614 + _2606;
            float _2618 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2608);
            float _2620 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2610);
            float _2622 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2612);
            float _2624 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2618);
            float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2620);
            float _2628 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2622);
            _431 = _2626;
            _433 = _2624;
            _435 = _2628;
            _2486 = _2624;
            _2492 = _2626;
            _2500 = _2628;
        }
        float _2630 = _431;
        float _2632 = _433;
        float _2634 = _435;
        float _2636 = _2486;
        float _2638 = _2492;
        float _2640 = _2500;
        float _2642 = _2630 * _2630;
        float _2644 = fma(_2632, _2632, _2642);
        float _2646 = fma(_2634, _2634, _2644);
        float _2648 = rsqrt(_2428);
        float _2650 = sqrt(_2646);
        float _2652 = _2394 * _2648;
        float _2654 = _2386 * _2648;
        float _2656 = _2414 * _2648;
        bool _2658 = _2650 > 0.0;
        bool _2660 = !_2658;
        _437 = _2646;
        _125 = _2654;
        _439 = _2652;
        _2470 = _2636;
        if (!_2660)
        {
            float _2662 = rsqrt(_2646);
            float _2664 = _2662 * _2630;
            float _2666 = _2662 * _2632;
            float _2668 = _2662 * _2634;
            float _2670 = _2654 * _2664;
            float _2672 = fma(_2652, _2666, _2670);
            float _2674 = fma(_2656, _2668, _2672);
            float _2676 = _2674 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2678 = fma(_2636, _2676, _2376);
            float _2680 = fma(_2638, _2676, _2374);
            float _2682 = fma(_2640, _2676, _2378);
            _2464 = _2680;
            _2466 = _2682;
            _2468 = _2678;
            _125 = _2670;
        }
    }
    float _2684 = _2464;
    float _2686 = _2466;
    float _2688 = _2468;
    float _2690 = _437;
    float _2692 = _125;
    float _2694 = _439;
    float _2696 = _2470;
    float _2698 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2708 = _2704 || _2706;
    float _2710 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2698);
    float _2712 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2714 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2716 = isnan(0.5);
    bool _2718 = _2714 || _2716;
    bool _2720 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2722 = _2718 || _2720;
    float _2724 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2710);
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2728 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2712);
    float _2730 = 1.0 / _2726;
    float _2732 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2728);
    float _2734 = _2692;
    float _2736 = _2690;
    float _2738 = _2694;
    float _2740 = _2696;
    if (_2708)
    {
        _2734 = _2684;
    }
    float _2742 = _2734;
    float _2744 = _2742;
    if (_2722)
    {
        _2472 = 1.0;
    }
    float _2746 = _2472;
    float _2748 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2750 = _2748 + _2726;
    float _2752 = _2750 * _2730;
    float _2754 = _2752 * 0.5;
    float _2756 = _2730;
    float _2758 = _2754;
    float _2760 = _2746;
    if (_2708)
    {
        _2756 = _2686;
    }
    float _2762 = _2756;
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2766 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2764);
    float _2768 = _2762;
    if (_2708)
    {
        _2758 = _2688;
    }
    float _2770 = _2758;
    float _2772 = 1.0 / _2766;
    float _2774 = _2770;
    if (!_2708)
    {
        float _2776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2778 = _2288 + _2776;
        float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2782 = _2180 + _2780;
        float _2784 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2786 = -_2180;
        float _2788 = _2786 + _2688;
        float _2790 = _2778 * _2778;
        float _2792 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2794 = _2152 + _2792;
        float _2796 = -_2152;
        float _2798 = _2796 + _2686;
        float _2800 = fma(_2782, _2782, _2790);
        float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2804 = fma(_2794, _2794, _2800);
        float _2806 = sqrt(_2804);
        float _2808 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2810 = precise::min(_2806, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2812 = _2810 * _2802;
        float _2814 = -_2288;
        float _2816 = _2814 + _2684;
        float _2818 = _2808 * _2812;
        float _2820 = fma(_2788, _2818, _2180);
        float _2822 = fma(_2816, _2818, _2288);
        float _2824 = fma(_2798, _2818, _2152);
        _2744 = _2822;
        _2774 = _2820;
        _2768 = _2824;
    }
    float _2826 = _2744;
    float _2828 = _2774;
    float _2830 = _2768;
    if (_2722)
    {
        _2224 = 1.0;
    }
    float _2832 = _2224;
    float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2836 = _2772 * _2834;
    float _2838 = _2832;
    if (!_2722)
    {
        float _2840 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2842 = _2840 * 0.15915493667125701904296875;
        float _2844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2846 = _2842 * 6.283185482025146484375;
        float _2848 = cos(_2846);
        float _2850 = _2844 * 0.15915493667125701904296875;
        float _2852 = _2842 * 6.283185482025146484375;
        float _2854 = sin(_2852);
        float _2856 = 1.0 / _2848;
        float _2858 = _2850 * 6.283185482025146484375;
        float _2860 = cos(_2858);
        float _2862 = _2854 * _2856;
        float _2864 = _2850 * 6.283185482025146484375;
        float _2866 = sin(_2864);
        float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2870 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2868;
        float _2872 = _2860 * _2862;
        float _2874 = 1.0 / _2870;
        float _2876 = 1.0 / _2872;
        float _2878 = _2866 * _2876;
        float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2882 = fma(_2836, _2878, _2880);
        float _2884 = _2882 * _2874;
        float _2886 = precise::clamp(_2884, 0.0, 1.0);
        _2736 = _2874;
        _2738 = _2842;
        _2760 = _2886;
    }
    float _2888 = _2736;
    float _2890 = _2738;
    float _2892 = _2760;
    float _2894 = _2888;
    float _2896 = _2890;
    if (!_2722)
    {
        float _2898 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2900 = _2898 * 0.15915493667125701904296875;
        float _2902 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2904 = _2900 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = _2902 * 0.15915493667125701904296875;
        float _2910 = _2900 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        float _2914 = 1.0 / _2906;
        float _2916 = _2908 * 6.283185482025146484375;
        float _2918 = cos(_2916);
        float _2920 = _2912 * _2914;
        float _2922 = _2908 * 6.283185482025146484375;
        float _2924 = sin(_2922);
        float _2926 = _2918 * _2920;
        float _2928 = 1.0 / _2926;
        float _2930 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2932 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2930;
        float _2934 = 1.0 / _2932;
        float _2936 = _2924 * _2928;
        float _2938 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2940 = fma(_2836, _2936, _2938);
        float _2942 = _2940 * _2934;
        float _2944 = precise::clamp(_2942, 0.0, 1.0);
        float _2946 = -_2944;
        float _2948 = _2946 + 1.0;
        _2894 = _2928;
        _2896 = _2926;
        _2838 = _2948;
    }
    float _2950 = _2894;
    float _2952 = _2896;
    float _2954 = _2838;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2958 = _2826 + _2956;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2962 = _2828 + _2960;
    float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2966 = _2830 + _2964;
    float _2968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2970 = _2958 * _2958;
    float _2972 = fma(_2962, _2962, _2970);
    float _2974 = fma(_2966, _2966, _2972);
    float _2976 = rsqrt(_2974);
    float _2978 = sqrt(_2974);
    float _2980 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2982 = _2962 * _2980;
    float _2984 = _2966 * _2980;
    float _2986 = _2982 * _2982;
    float _2988 = _2984 * _2984;
    float _2990 = _2986 + _2988;
    float _2992 = sqrt(_2990);
    bool _2994 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2998 = _2992 + _2996;
    float _3000 = _2966;
    float _3002 = _2970;
    float _3004 = _2998;
    float _3006 = _2950;
    float _3008 = _2980;
    if (_2994)
    {
        float _3010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3000 = _3010;
    }
    float _3012 = _3000;
    if (_2994)
    {
        float _3014 = rsqrt(_2990);
        _3002 = _3014;
    }
    float _3016 = _3002;
    float _3018 = _3016;
    if (_2994)
    {
        float _3020 = _2998 * _3012;
        _3004 = _3020;
    }
    float _3022 = _3004;
    if (_2994)
    {
        float _3024 = _3022 * 0.15915493667125701904296875;
        _3006 = _3024;
    }
    float _3026 = _3006;
    float _3028 = _2976;
    float _3030 = _3026;
    if (_2994)
    {
        float _3032 = _3026 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        _3028 = _3034;
    }
    float _3036 = _3028;
    float _3038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3040 = precise::max(0.0, _3038);
    float _3042 = _2952;
    float _3044 = _3040;
    float _3046 = _3038;
    if (_2994)
    {
        float _3048 = _3026 * 6.283185482025146484375;
        float _3050 = cos(_3048);
        _3042 = _3050;
    }
    float _3052 = _3042;
    float _3054 = -_2980;
    float _3056 = -_3040;
    float _3058 = fma(_2958, _3054, _3056);
    if (_2994)
    {
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3044 = _3060;
    }
    float _3062 = _3044;
    float _3064 = _3062;
    if (!_2994)
    {
        _3030 = _2986;
    }
    float _3066 = _3030;
    float _3068 = _3036;
    float _3070 = _3066;
    if (_2994)
    {
        float _3072 = fma(_3036, _3062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3068 = _3072;
    }
    float _3074 = _3068;
    float _3076 = _3074;
    if (!_2994)
    {
        _3064 = _2984;
    }
    float _3078 = _3064;
    float _3080 = _3078;
    if (_2994)
    {
        float _3082 = _3052 + (-1.0);
        _3046 = _3082;
    }
    float _3084 = _3046;
    float _3086 = _3084;
    if (_2994)
    {
        float _3088 = _3016 * _3074;
        _2740 = _3088;
    }
    float _3090 = _2740;
    if (!_2994)
    {
        _3018 = _2982;
    }
    float _3092 = _3018;
    float _3094 = _3092;
    if (_2994)
    {
        float _3096 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3008 = _3096;
    }
    float _3098 = _3008;
    if (_2994)
    {
        float _3100 = _2982 * _3090;
        _3094 = _3100;
    }
    float _3102 = _3094;
    if (!_2994)
    {
        _3076 = _3058;
    }
    float _3104 = _3076;
    float _3106 = _3104;
    if (_2994)
    {
        float _3108 = _2984 * _3090;
        _3080 = _3108;
    }
    float _3110 = _3080;
    if (_2994)
    {
        float _3112 = fma(_3058, _3052, _3098);
        _3106 = _3112;
    }
    float _3114 = _3106;
    if (_2994)
    {
        float _3116 = _3102 * _3102;
        _3070 = _3116;
    }
    float _3118 = _3070;
    if (!_2994)
    {
        _3086 = _2988;
    }
    float _3120 = _3086;
    float _3122 = _3120;
    if (_2994)
    {
        float _3124 = _3110 * _3110;
        _3122 = _3124;
    }
    float _3126 = _3122;
    float _3128 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3130 = fma(_3114, _3114, _3118);
    float _3132 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3134 = _3130 + _3126;
    float _3136 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3128);
    float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3140 = fma(_2978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3138);
    float _3142 = precise::clamp(_3140, 0.0, 1.0);
    float _3144 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3146 = rsqrt(_3134);
    float _3148 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3136);
    float _3150 = -_3142;
    float _3152 = _3150 + 1.0;
    float _3154 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3144);
    float _3156 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3158 = _3148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3160 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3132);
    float _3162 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3154);
    float _3164 = abs(_3152);
    float _3166 = log2(_3164);
    float _3168 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3170 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3160);
    float _3172 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3174 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3156);
    float _3176 = -_3168;
    float _3178 = fma(_3176, _2968, 1.0);
    float _3180 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3182 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3184 = _3146 * _3102;
    float _3186 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3174);
    float _3188 = _3146 * _3114;
    float _3190 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3182);
    float _3192 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3194 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3196 = _3146 * _3110;
    float _3198 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3190);
    float _3200 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3202 = -_3192;
    float _3204 = fma(_3188, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3202);
    float _3206 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3208 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3198);
    float _3210 = log2(_3178);
    float _3212 = -_3196;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3204);
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3218 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3206);
    float _3220 = fma(_3214, -0.5, 0.5);
    float _3222 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3216);
    float _3224 = fma(_3214, 0.5, 0.5);
    float _3226 = exp2(_3200);
    float _3228 = _3188 + 1.0;
    float _3230 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3218);
    float _3232 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3222);
    float _3234 = fma(_3224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3236 = 1.0 / _3208;
    float _3238 = fma(_3224, _3234, -0.212114393711090087890625);
    float _3240 = _3210 * 0.693147182464599609375;
    float _3242 = fma(_3224, _3238, 1.570728778839111328125);
    float _3244 = sqrt(_3220);
    float _3246 = -_3188;
    float _3248 = fma(_3226, _3228, _3246);
    float _3250 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3230);
    float _3252 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3232);
    float _3254 = fma(_3248, 0.5, 0.5);
    float _3256 = _3250 * _3236;
    float _3258 = _3252 * _3236;
    float _3260 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3262 = fma(_3256, 0.5, 0.5);
    float _3264 = fma(_3258, -0.5, 0.5);
    float _3266 = _3244 * 0.636619746685028076171875;
    float3 _8194 = float3(_3262, _3264, _3260);
    float _3268 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8194, float3(0.0), isnan(_8194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8194, float3(0.0), isnan(_8194)), level(0.0)).x;
    float _3270 = -_3242;
    float _3272 = fma(_3266, _3270, 1.0);
    float3 _8210 = float3(_3262, _3264, _3260);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8210, float3(0.0), isnan(_8210)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8210, float3(0.0), isnan(_8210)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    float2 _8227 = float2(_3272, _3254);
    float3 _3287 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8227, float2(0.0), isnan(_8227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8227, float2(0.0), isnan(_8227)), level(0.0)).xyz;
    float _3289 = _3287.x;
    float _3291 = _3287.y;
    float _3293 = _3287.z;
    float _3295 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3297 = _2892 * _2954;
    bool _3299 = _2892 > 0.0;
    bool _3301 = isnan(_2892);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan(0.0);
    bool _3307 = _3303 || _3305;
    float _3309 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3295);
    float _3311 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3313 = _2954 <= 0.0;
    bool _3315 = !_3307;
    bool _3317 = _3313 || _3315;
    float _3319 = _3208 * 0.5;
    float _3321 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3309);
    float _3323 = exp2(_3311);
    float _3325 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3321);
    float _3327 = _3297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3329 = _3250 + _3208;
    float _3331 = _3325 + _3208;
    float _3333 = fma(_3252, -0.5, _3319);
    out.gl_Position.x = _3250;
    out.gl_Position.y = _3252;
    out.gl_Position.z = _3325;
    out.gl_Position.w = _3208;
    float _3335 = _3329 * 0.5;
    float _3337 = _3331 * 0.5;
    float _3339 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _3335;
    out.m_68.y = _3333;
    out.m_68.z = _3337;
    out.m_68.w = _3208;
    float _3341 = -_3323;
    float _3343 = _3341 + 1.0;
    out.m_45.x = _3339;
    float _3345 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3347 = -_3345;
    float _3349 = _3347 + 1.0;
    float _3351 = _3345 * _3268;
    float _3353 = _3283 * _3351;
    float _3355 = _3283 * _3349;
    float _3357 = _3293 * _3351;
    float _3359 = fma(_3289, _3353, _3277);
    float _3361 = fma(_3291, _3353, _3279);
    float _3363 = fma(_3283, _3357, _3281);
    out.m_70.x = _3359;
    out.m_70.y = _3361;
    out.m_70.z = _3363;
    out.m_70.w = _3355;
    if (!_3317)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3365 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3365;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _859 = false;
    bool _699 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3422 = as_type<float>(_105);
        out.gl_Position.z = _3422;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _3492 = as_type<float>(_143);
        out.gl_Position.z = _3492;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_49.w;
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    int _165 = int(_157);
    int _167 = false ? 2 : 0;
    int _169 = _165 | _167;
    int _171 = false ? 4 : 0;
    int _173 = _169 | _171;
    int _175 = false ? 8 : 0;
    int _177 = _173 | _175;
    int _179 = false ? 16 : 0;
    int _181 = _177 | _179;
    int _183 = false ? 32 : 0;
    int _185 = _181 | _183;
    int _187 = false ? 64 : 0;
    int _189 = _185 | _187;
    int _191 = _189 & 1;
    float _193 = in.m_42.x;
    float _195 = in.m_42.y;
    float _197 = in.m_42.z;
    float _199 = 0.0;
    float _201 = as_type<float>(_191);
    float _203 = _147;
    if (!_157)
    {
        float _205 = _147 * _147;
        float _207 = _205 * 0.5;
        _199 = _207;
    }
    float _209 = _199;
    float _211 = _209;
    if (!_157)
    {
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_157;
    float _219 = _215;
    float _221 = 0.0;
    if (!_217)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _251;
        _201 = _241;
        _221 = _239;
    }
    float _253 = _219;
    float _255 = _201;
    float _257 = _221;
    bool _259 = !_157;
    float _261 = _255;
    float _263 = _257;
    if (!_259)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _147 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _261 = _271;
        _203 = _283;
    }
    float _285 = _261;
    float _287 = _203;
    float _289 = _285;
    if (!_157)
    {
        float _291 = _123 * _123;
        float _293 = _291 * 0.5;
        _289 = _293;
    }
    float _295 = _289;
    float _297 = _295;
    if (!_157)
    {
        _263 = _123;
    }
    float _299 = _263;
    float _301 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _305 = _299;
    if (!_157)
    {
        float _307 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _307;
    }
    float _309 = _297;
    bool _311 = !_157;
    float _313 = _309;
    if (!_311)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = _123 * _317;
        float _327 = 1.0 / _321;
        float _329 = _323 * 0.693147182464599609375;
        float _331 = exp2(_325);
        float _333 = 1.0 / _329;
        float _335 = _331 + (-1.0);
        float _337 = -_335;
        float _339 = fma(_337, _333, _123);
        float _341 = _339 * _327;
        float _343 = _341 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _343;
    }
    float _345 = _313;
    bool _347 = !_157;
    if (!_347)
    {
        float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = log2(_349);
        float _353 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _355 = _353 + 1.0;
        float _357 = 1.0 / _355;
        float _359 = _123 * _351;
        float _361 = exp2(_359);
        float _363 = -_361;
        float _365 = _363 + 1.0;
        float _367 = _365 * _357;
        _305 = _367;
    }
    float _369 = _305;
    float _371 = fma(_287, _159, _301);
    float _373 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _375 = fma(_287, _161, _303);
    float _377 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _381 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _383 = fma(_369, _161, _373);
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _387 = fma(_287, _163, _377);
    float _389 = fma(_375, _145, _195);
    float _391 = fma(_369, _159, _379);
    float _393 = -_383;
    float _395 = _375 + _393;
    float _397 = fma(_369, _163, _381);
    float _399 = fma(_371, _145, _193);
    float _401 = -_391;
    float _403 = _371 + _401;
    float _405 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _409 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _411 = -_397;
    float _413 = _387 + _411;
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _409);
    float _421 = fma(_387, _145, _197);
    float _423 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _415);
    float _425 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    bool _429 = !_385;
    float _431 = _425;
    float _433 = _423;
    float _435 = _427;
    float _437 = _397;
    float _439 = _391;
    float _457;
    if (!_429)
    {
        float _441 = in.m_51.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_89);
        float _463 = 1.0 / _461;
        float _465 = _123 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = _467 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _479 = _467 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = 1.0 / _483;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _501 = 1.0 / _491;
    float _503 = 1.0 / _495;
    float _505 = _471 * _497;
    bool _507 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _509 = isnan(_467);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_517;
    float _521 = _519 + 1.0;
    float _523 = 1.0 / _487;
    float _525 = _475 * _501;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _467 + _527;
    bool _531 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_467);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = _479 * _503;
    float _549 = fma(_545, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _551 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_467);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _529 * _523;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = _561 * _521;
    bool _571 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _573 = isnan(_467);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -_561;
    float _585 = _583 + 1.0;
    float _587 = fma(_567, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _589 = -_541;
    float _591 = _589 + 1.0;
    bool _593 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _595 = isnan(_467);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _609 = _541 * _585;
    float _611 = _581 * _591;
    float _613 = -_581;
    float _615 = _613 + 1.0;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = fma(_607, _547, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _627 = _603 * _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _629;
    float _633 = fma(_623, _547, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _635;
    float _639 = _587 * _627;
    float _641 = _549 * _627;
    float _643 = fma(_631, _505, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _645 = fma(_637, _505, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _649 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = fma(_625, _611, _647);
    float _661 = fma(_633, _611, _649);
    float _663 = fma(_653, _563, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _665 = fma(_657, _563, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _667 = fma(_643, _609, _659);
    float _669 = fma(_645, _609, _661);
    float _671 = fma(_663, _569, _667);
    float _673 = fma(_665, _569, _669);
    float _675 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[147].x, _671);
    float _677 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[147].y, _673);
    bool _679 = !_499;
    float _697;
    if (!_679)
    {
        float _681 = in.m_51.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_89);
        float _703 = 1.0 / _701;
        float _705 = _123 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _707 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _717 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _719 = isnan(_707);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _733 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _735 = isnan(_707);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _745;
    bool _749 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _751 = isnan(_707);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = 1.0 / _715;
    float _763 = -_727;
    float _765 = _763 + 1.0;
    float _767 = _743 * _765;
    float _769 = -_743;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _731;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _779 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _747 * _761;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = fma(_787, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -_759;
    float _799 = _797 + 1.0;
    float _801 = _795 * _767;
    float _803 = _791 * _773;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _807 = _707 + _805;
    float _809 = _727 * _799;
    float _811 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[115].x, _801);
    float _813 = fma(_803, _807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _815 = fma(_813, _809, _811);
    float _817 = in.m_49.x;
    float _819 = in.m_49.y;
    float _821 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[117].x, _815);
    float _823 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _783;
    out.m_53.y = _785;
    out.m_53.z = _793;
    out.m_53.w = _823;
    float _825 = _677 * _819;
    float _827 = _675 * _817;
    bool _829 = !_779;
    float _853;
    float _855;
    float _857;
    if (!_829)
    {
        float _831 = in.m_51.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _835 = float(_89);
        float _837 = 1.0 / _835;
        float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _843 = _841 * _833;
        float _845 = _123 * _837;
        float _847 = floor(_843);
        float _849 = -_847;
        float _851 = _843 + _849;
        _853 = _835;
        _855 = _851;
        _857 = _845;
        _859 = true;
    }
    else
    {
        float _861 = float(_89);
        float _863 = 1.0 / _861;
        float _865 = _123 * _863;
        _853 = _861;
        _855 = _865;
        _857 = _865;
    }
    _859 = false;
    float _867 = _853;
    float _869 = _855;
    float _871 = _857;
    float _873 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _875 = int(_873);
    float _877 = in.m_51.x;
    float _879 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _883 = _881 != 0;
    float _885 = as_type<float>(int(gl_VertexIndex));
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _889 = int(_887);
    float _891 = in.m_51.w;
    float _893 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _879);
    float _895 = in.m_51.z;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _897;
    float _901 = float(_875);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_883)
    {
        float _909 = in.m_51.y;
        _907 = _909;
    }
    float _911 = _907;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _917 = 1.0 / _901;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _923 = float(uint(_889));
    float _925 = _877 * 2.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _935 = 1.0 / _899;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _949 = _123 * _917;
    float _951 = 1.0 / _923;
    float _953 = _895 * 2.0;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _959 = _917;
    if (!_883)
    {
        _959 = _911;
    }
    float _961 = _959;
    float _963 = trunc(_949);
    int _965 = int(_963);
    float _967 = _961;
    float _969 = _911;
    if (_883)
    {
        float _971 = in.m_51.x;
        float _973 = in.m_51.y;
        _967 = _971;
        _969 = _973;
    }
    float _975 = _967;
    float _977 = _969;
    float _979 = floor(_925);
    int _981 = as_type<int>(_951) + (-2);
    float _983 = float(uint(_965));
    float _985 = 1.0 / _905;
    float _987 = float(_965);
    float _989 = as_type<float>(_981) * _983;
    bool _991 = _979 > 0.0;
    float _993 = trunc(_989);
    float _995 = precise::max(_993, 0.0);
    uint _998 = uint(_995);
    bool _1000 = _979 >= 0.0;
    bool _1002 = isnan(_979);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = as_type<int>(_885) & 1;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>(_885) & 2;
    bool _1018 = _1016 != 0;
    float _1020 = _977 * 2.0;
    int _1022 = ~_1010;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = 1.0 / _915;
    bool _1030 = _891 > 0.5;
    float _1032 = _943 * _985;
    int _1034 = _1026;
    if (!_991)
    {
        int _1036 = ~_1010;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    int _1042 = ~_889;
    int _1044 = _1042 + 1;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1048 = _1046 != 0;
    float _1050 = floor(_1020);
    bool _1052 = !_1014;
    float _1054 = _1052 ? (-0.5) : 0.5;
    int _1056 = _1044 * int(_998);
    int _1058 = _1056 + _965;
    bool _1060 = !_1048;
    int _1062 = _1060 ? 0 : 1;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1070 = _1068 != 0;
    float _1072 = float(uint(_1058));
    float _1074 = 1.0 / _921;
    bool _1076 = !_1018;
    float _1078 = _1076 ? (-0.5) : 0.5;
    float _1080 = _939 * _1028;
    bool _1082 = _895 > 0.5;
    float _1084 = as_type<float>(_981) * _1072;
    bool _1086 = !_1066;
    int _1088 = _1086 ? 0 : 1;
    bool _1090 = !_1070;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = trunc(_1084);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    bool _1100 = _877 > 0.5;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1108 = _1106 != 0;
    float _1110 = -_1054;
    int _1112 = _1082 ? as_type<int>(_1110) : as_type<int>(_1054);
    float _1114 = 1.0 / _929;
    float _1116 = -_1054;
    int _1118 = _1100 ? as_type<int>(_1116) : as_type<int>(_1054);
    float _1120 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1122 = -_1078;
    int _1124 = _1030 ? as_type<int>(_1122) : as_type<int>(_1078);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1132 = _1130 != 0;
    float _1134 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1120);
    bool _1136 = _1050 >= 0.0;
    bool _1138 = isnan(_1050);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = 1.0 / _933;
    bool _1148 = !_1104;
    float _1150 = _1148 ? _1054 : as_type<float>(_1112);
    bool _1152 = !_1108;
    float _1154 = _1152 ? _1054 : as_type<float>(_1118);
    float _1156 = _1144 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1158 = _1050 > 0.0;
    float _1160 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1162 = int(_998) + int(_1098);
    float _1164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1166 = log2(_1164);
    int _1168 = ~_889;
    int _1170 = _1168 + 1;
    float _1172 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1160);
    bool _1174 = !_1132;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1180 = _1178 != 0;
    int _1182 = _1170 * _1162;
    int _1184 = _1182 + _965;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1188 = _1186 != 0;
    float _1190 = 1.0 / _867;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1194 = _1192 != 0;
    bool _1196 = !_1128;
    int _1198 = _1196 ? 0 : 1;
    int _1200 = ~as_type<int>(_1156);
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = 1.0 / _947;
    bool _1208 = uint(_1184) >= uint(_889);
    float _1210 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1172);
    int _1212 = _1204;
    float _1214 = _1156;
    float _1216 = _1120;
    if (!_1158)
    {
        int _1218 = ~as_type<int>(_1156);
        int _1220 = _1218 + 1;
        _1212 = _1220;
    }
    int _1222 = _1212;
    float _1224 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1134);
    if (!_883)
    {
        _1214 = _895;
    }
    float _1226 = _1214;
    float _1228 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _893);
    float _1230 = _1226;
    if (!_883)
    {
        _1216 = _895;
    }
    float _1232 = _1216;
    float _1234 = floor(_953);
    bool _1236 = !_883;
    float _1238 = _1236 ? 1.2345600128173828125 : 1.0;
    float _1240 = _1232;
    if (_883)
    {
        _1230 = _977;
    }
    float _1242 = _1230;
    if (_883)
    {
        _1240 = _977;
    }
    float _1244 = _1240;
    bool _1246 = !_883;
    float _1248 = _1246 ? _977 : _877;
    float _1250 = 1.0 / _957;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1262 = _1260 != 0;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1266 = _869 + _1264;
    float _1268 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1270 = _1266 * _935;
    bool _1272 = !_1208;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1284 = float(_889);
    float _1286 = _1278 * _1074;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1288;
    float _1292 = _1282 * _1114;
    float _1294 = _877 + _895;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1300 = _1290 * _1146;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1302;
    float _1306 = _1294 + (-1.0);
    float _1308 = _123 * _1284;
    float _1310 = _1238 * _1248;
    float _1312 = _123 * _1166;
    float _1314 = _1298 * _1206;
    float _1316 = _1308 * _1190;
    bool _1318 = _1234 >= 0.0;
    bool _1320 = isnan(_1234);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = floor(_1310);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1332 = _871 + _1330;
    float _1334 = _1304 * _1250;
    int _1336 = _1326 ? 0 : 1;
    float _1338 = fma(_1080, _1332, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1340 = _1234 > 0.0;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1342;
    float _1346 = exp2(_1312);
    bool _1348 = _987 >= _1284;
    bool _1350 = isnan(_987);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan(_1284);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1364 = _871 + _1362;
    int _1366 = ~_1162;
    int _1368 = _1366 + _1274;
    int _1370 = _1368 + 1;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1374 = _871 + _1372;
    int _1376 = abs(_1062);
    float _1378 = trunc(_1358);
    int _1380 = int(_1378);
    float _1382 = -_1328;
    float _1384 = _1310 + _1382;
    int _1386 = ~_1336;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1398 = _871 + _1396;
    int _1400 = _1390;
    if (!_1340)
    {
        int _1402 = ~_1336;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = fma(_1344, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1410 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(0.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -_1346;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1394, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1426 = fma(_1286, _1398, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1428 = _1284 * _1384;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1432 = _871 + _1430;
    float _1434 = _1418 ? _1422 : 0.0;
    int _1436 = _889 * _1370;
    int _1438 = _1436 + _965;
    bool _1440 = _889 == 0;
    float _1442 = fma(_1292, _1374, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1444 = fma(_1300, _1432, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1446 = ~_1380;
    int _1448 = _1446 + 1;
    int _1450 = _1448 + 1;
    float _1452 = trunc(_1428);
    int _1454 = int(_1452);
    bool _1456 = !_1440;
    int _1458 = _1456 ? _1438 : (-1);
    float _1460 = fma(_1032, _1364, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1462 = _889 + (-1);
    int _1464 = abs(_1176);
    int _1466 = _1450 * _1458;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1470 = _871 + _1468;
    float _1472 = trunc(_1316);
    int _1474 = int(_1472);
    int _1476 = _1380 * _1462;
    int _1478 = _1476 + _1466;
    int _1480 = abs(_1198);
    float _1482 = fma(_1314, _1470, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    int _1484 = abs(_1088);
    int _1486 = _1478 * _1464;
    float _1488 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1492 = _871 + _1490;
    int _1494 = _1454 * _1376;
    int _1496 = _1494 + _965;
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1054);
    float _1500 = fma(_1334, _1492, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1502 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1504 = isnan(_871);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = _1488 * _1498;
    bool _1516 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1518 = isnan(_869);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1524 = _1520 || _1522;
    float _1526 = float(_1524);
    int _1528 = _1474 * _1480;
    int _1530 = _1528 + _1486;
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1078);
    float _1534 = -_1512;
    float _1536 = _1534 + 1.0;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1538;
    int _1542 = _1496 * _1484;
    int _1544 = _1542 + _1530;
    int _1546 = abs(_1092);
    float _1548 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1550 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1552 = isnan(_871);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = fma(_1540, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1564 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1566 = isnan(_871);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    int _1576 = _1454 * _1546;
    int _1578 = _1576 + _1544;
    int _1580 = ~_889;
    int _1582 = _1580 + 1;
    float _1584 = -_1560;
    float _1586 = _1584 + 1.0;
    float _1588 = _1560 * _1536;
    float _1590 = _1548 * _1532;
    float _1592 = float(uint(_1578));
    float _1594 = _1574 * _1586;
    float _1596 = -_1574;
    float _1598 = _1596 + 1.0;
    bool _1600 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1602 = isnan(_871);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = as_type<float>(_981) * _1592;
    bool _1614 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1616 = isnan(_871);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    bool _1626 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1628 = isnan(_869);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    bool _1642 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1644 = isnan(_871);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = trunc(_1612);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    float _1660 = -_1624;
    float _1662 = _1660 + 1.0;
    float _1664 = _1610 * _1598;
    float _1666 = _1624 * _1640;
    bool _1668 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1670 = isnan(_871);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1652 * _1662;
    bool _1682 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1684 = isnan(_871);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = -_1652;
    float _1696 = _1694 + 1.0;
    bool _1698 = !_1254;
    int _1700 = _1698 ? 0 : 1;
    float _1702 = in.m_58.x;
    float _1704 = in.m_58.y;
    float _1706 = in.m_58.z;
    float _1708 = -_1636;
    float _1710 = _1708 + 1.0;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1714 = 1.0 + _1712;
    float _1716 = _1692 * _1696;
    int _1718 = abs(_1700);
    float _1720 = _1526 * _1710;
    int _1722 = _1582 * int(_1658);
    int _1724 = _1722 + _1578;
    float _1726 = 1.0 / _1714;
    float _1728 = -_1692;
    float _1730 = _1728 + 1.0;
    float _1732 = _1408 * _1720;
    float _1734 = _1424 * _1720;
    float _1736 = float(uint(_1724));
    float _1738 = _1562 * _1720;
    float _1740 = float(_1718);
    float _1742 = _1678 * _1730;
    float _1744 = float(_1406);
    float _1746 = as_type<float>(_981) * _1736;
    float _1748 = _877 + _977;
    float _1750 = _1338 * _1742;
    float _1752 = _877 + (-0.5);
    float _1754 = trunc(_1746);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = _1740 * _1744;
    float _1762 = -_1526;
    float _1764 = _1762 + 1.0;
    float _1766 = _1748 + (-1.0);
    float _1768 = _1760 * (-2.0);
    bool _1770 = !_1258;
    int _1772 = _1770 ? 0 : 1;
    float _1774 = _1434 * _1726;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1732);
    float _1778 = fma(_1768, _1702, _1702);
    float _1780 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1734);
    int _1782 = abs(_1772);
    float _1784 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1786 = _895 + _977;
    float _1788 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1778);
    float _1790 = fma(_1784, _1768, _1784);
    int _1792 = int(_1658) + int(_1758);
    float _1794 = _1786 + (-1.0);
    bool _1796 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1798 = isnan(1.0);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1804 = _1800 || _1802;
    float _1806 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1738);
    float _1808 = float(_1782);
    float _1810 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1776);
    float _1812 = float(_1040);
    float _1814 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1780);
    float _1816 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1806);
    bool _1818 = !_1804;
    float _1820 = _1818 ? _123 : _1774;
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1824 = _1808 * _1812;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1828 = float(uint(_1496));
    float _1830 = fma(_1820, _1790, _1788);
    bool _1832 = !_1262;
    int _1834 = _1832 ? 0 : 1;
    float _1836 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1826);
    int _1838 = ~_889;
    int _1840 = _1838 + 1;
    float _1842 = _975 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1844 = as_type<float>(_981) * _1828;
    int _1846 = abs(_1834);
    float _1848 = -_1678;
    float _1850 = _1848 + 1.0;
    int _1852 = _1840 * _1792;
    int _1854 = _1852 + _1578;
    float _1856 = trunc(_1844);
    float _1858 = precise::max(_1856, 0.0);
    uint _1860 = uint(_1858);
    bool _1862 = uint(_1854) >= uint(_889);
    float _1864 = _1824 * (-2.0);
    float _1866 = float(_1846);
    float _1868 = _1830 * 0.15915493667125701904296875;
    float _1870 = float(_1222);
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1874 = fma(_1822, _1864, _1822);
    float _1876 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1750);
    int _1878 = ~_889;
    int _1880 = _1878 + 1;
    float _1882 = _1866 * _1870;
    float _1884 = -_1872;
    float _1886 = fma(_1842, 2.0, _1884);
    bool _1888 = !_1862;
    int _1890 = _1888 ? 0 : (-1);
    float _1892 = fma(_1460, _1716, _1876);
    float _1894 = _1882 * (-2.0);
    bool _1896 = _977 > 0.5;
    float _1898 = _977 + (-0.5);
    float _1900 = fma(_1864, _1704, _1704);
    float _1902 = fma(_1894, _1706, _1706);
    float _1904 = _895 + (-0.5);
    int _1906 = _1880 * int(_1860);
    int _1908 = _1906 + _1496;
    float _1910 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1900);
    float _1912 = fma(_1360, _1894, _1360);
    float _1914 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1902);
    float _1916 = fma(_1426, _1680, _1892);
    float _1918 = float(uint(_1908));
    float _1920 = fma(_1820, _1874, _1910);
    float _1922 = fma(_1820, _1912, _1914);
    float _1924 = fma(_1442, _1666, _1916);
    float _1926 = as_type<float>(_981) * _1918;
    float _1928 = _1920 * 0.15915493667125701904296875;
    float _1930 = _1868 * 6.283185482025146484375;
    float _1932 = sin(_1930);
    float _1934 = _1922 * 0.15915493667125701904296875;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1938 = ~_1792;
    int _1940 = _1938 + _1890;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1444, _1664, _1924);
    float _1946 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1936);
    float _1948 = -_1078;
    int _1950 = _1896 ? as_type<int>(_1948) : as_type<int>(_1078);
    float _1952 = trunc(_1926);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    bool _1958 = !_1180;
    float _1960 = _1958 ? _1078 : as_type<float>(_1124);
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1964 = fma(_1482, _1594, _1944);
    float _1966 = _1150 + 0.5;
    int _1968 = ~_889;
    int _1970 = _1968 + 1;
    float _1972 = fma(_1268, -2.0, _1962);
    float _1974 = -_123;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1886);
    float _1978 = _1868 * 6.283185482025146484375;
    float _1980 = cos(_1978);
    bool _1982 = !_1194;
    float _1984 = _1982 ? _1078 : as_type<float>(_1950);
    int _1986 = _889 * _1942;
    int _1988 = _1986 + _1578;
    float _1990 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1976);
    float _1992 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1972);
    float _1994 = fma(_1500, _1588, _1964);
    bool _1996 = !_1440;
    int _1998 = _1996 ? _1988 : (-1);
    float _2000 = _1928 * 6.283185482025146484375;
    float _2002 = sin(_2000);
    int _2004 = int(_1860) + int(_1956);
    int _2006 = _1998 & 3;
    bool _2008 = _2006 != 0;
    bool _2010 = _2006 != 3;
    float _2012 = _1928 * 6.283185482025146484375;
    float _2014 = cos(_2012);
    float _2016 = _1934 * 6.283185482025146484375;
    float _2018 = sin(_2016);
    float _2020 = _1980 * _2002;
    float _2022 = _1932 * _2002;
    float _2024 = _1934 * 6.283185482025146484375;
    float _2026 = cos(_2024);
    float _2028 = _1932 * _2014;
    float _2030 = _1980 * _2014;
    float _2032 = -_2020;
    float _2034 = fma(_2018, _2028, _2032);
    float _2036 = -_2028;
    float _2038 = fma(_2018, _2020, _2036);
    int _2040 = _1998 >> 31;
    float _2042 = fma(_2018, _2030, _2022);
    float _2044 = fma(_2018, _2022, _2030);
    int _2046 = _2040 & 3;
    float _2048 = _2014 * _2026;
    float _2050 = -_1590;
    float _2052 = _2018 * _2050;
    int _2054 = _1998 + _2046;
    float _2056 = _2026 * _1590;
    int _2058 = _1970 * _2004;
    int _2060 = _2058 + _1496;
    float _2062 = fma(_2048, _1514, _2052);
    int _2064 = _2054 >> 2;
    float _2066 = _1980 * _2056;
    float _2068 = _2002 * _2026;
    float _2070 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2072 = _2064 << 4;
    int _2074 = _2072 + 512;
    float _2076 = fma(_2042, _1514, _2066);
    bool _2078 = uint(_2060) >= uint(_889);
    float _2080 = _1932 * _2056;
    uint _2082 = uint(int(uint(_2074) >> uint(2)));
    uint _2084 = uint(int(uint(int(_2082)) >> uint(2)));
    int _2086 = int(_2082) & 3;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[int(_2084)][_2086];
    int _2090 = int(_2082) + 1;
    uint _2092 = uint(int(uint(_2090) >> uint(2)));
    int _2094 = _2090 & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    float _2098 = fma(_2038, _2070, _2076);
    bool _2100 = !_2078;
    int _2102 = _2100 ? 0 : (-1);
    float _2104 = fma(_2034, _1514, _2080);
    float _2106 = fma(_2068, _2070, _2062);
    float _2108 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2110 = ~_2004;
    int _2112 = _2110 + _2102;
    int _2114 = _2112 + 1;
    float _2116 = fma(_2044, _2070, _2104);
    bool _2118 = uint(_2006) > 1u;
    int _2120 = _2074 + 8;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    uint _2124 = uint(int(uint(int(_2122)) >> uint(2)));
    int _2126 = int(_2122) & 3;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[int(_2124)][_2126];
    int _2130 = int(_2122) + 1;
    uint _2132 = uint(int(uint(_2130) >> uint(2)));
    int _2134 = _2130 & 3;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[int(_2132)][_2134];
    float _2138 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2108);
    int _2142 = _2008 ? 0 : 1;
    int _2144 = _889 * _2114;
    int _2146 = _2144 + _1496;
    float _2148 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2150 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2140);
    float _2152 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2154 = ~_2142;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2148);
    float _2162 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2164 = _1998 & 3;
    bool _2166 = _2164 != 0;
    int _2168 = _2158;
    float _2170 = _1992;
    float _2172 = _1512;
    if (!_2118)
    {
        int _2174 = ~_2142;
        int _2176 = _2174 + 1;
        _2168 = _2176;
    }
    int _2178 = _2168;
    float _2180 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2182 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _2152 + _2162;
    bool _2186 = uint(_2006) >= 2u;
    float _2188 = _2180 + _2182;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2192 = _2184 + _2190;
    bool _2194 = !_2166;
    int _2196 = _2194 ? 0 : 1;
    int _2198 = _2186 ? 0 : 1;
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2202 = _2188 + _2200;
    float _2204 = _2192 * _2192;
    bool _2206 = _2006 != 3;
    int _2208 = abs(_2196);
    float _2210 = fma(_2202, _2202, _2204);
    int _2212 = ~_2198;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    float _2218 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2220 = _2216;
    float _2222 = _2184;
    float _2224 = _2180;
    if (_2010)
    {
        int _2226 = ~_2198;
        int _2228 = _2226 + 1;
        _2220 = _2228;
    }
    int _2230 = _2220;
    float _2232 = sqrt(_2210);
    int _2234 = abs(_2178);
    float _2236 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2218);
    int _2238 = abs(_2230);
    int _2240 = ~_2234;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    int _2248 = ~_2208;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2238;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2244 * as_type<int>(_2096);
    bool _2262 = !_2206;
    int _2264 = _2262 ? 0 : (-1);
    float _2266 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2268 = _2252 * as_type<int>(_2088);
    int _2270 = _2268 + _2260;
    bool _2272 = !_1188;
    int _2274 = _2272 ? 0 : 1;
    bool _2276 = _2232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2278 = _2258 * as_type<int>(_2128);
    int _2280 = _2278 + _2270;
    int _2282 = abs(_2264);
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2286 = abs(_2274);
    float _2288 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2290 = ~_2282;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = _1960 + (-0.5);
    int _2298 = ~_2286;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = _2288 + _2266;
    int _2306 = _2294 * as_type<int>(_2136);
    int _2308 = _2306 + _2280;
    float _2310 = -_2296;
    float _2312 = -_1992;
    float _2314 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2312);
    float _2316 = _2296;
    if (!_2276)
    {
        _2316 = _2184;
    }
    float _2318 = _2316;
    int _2320 = _2302 * _2308;
    bool _2322 = !_1440;
    int _2324 = _2322 ? _2146 : (-1);
    float _2326 = _2318;
    if (!_2276)
    {
        _2170 = _2188;
    }
    float _2328 = _2170;
    float _2330 = _2328;
    if (!_2276)
    {
        _2222 = _2304;
    }
    float _2332 = _2222;
    bool _2334 = !_2276;
    float _2336 = _2332;
    if (!_2334)
    {
        float _2338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2342 = _2232 + _2340;
        float _2344 = rsqrt(_2210);
        float _2346 = _2342 * _2338;
        float _2348 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = _2346 * 0.15915493667125701904296875;
        float _2352 = _2350 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        float _2356 = _2350 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        float _2360 = _2354 + (-1.0);
        float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = fma(_2358, _2348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2366 = fma(_2304, _2354, _2362);
        float _2368 = _2344 * _2364;
        float _2370 = fma(_2202, _2368, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2372 = fma(_2192, _2368, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2336 = _2366;
        _2330 = _2370;
        _2326 = _2372;
    }
    float _2374 = _2336;
    float _2376 = _2330;
    float _2378 = _2326;
    float _2380 = _1154 + 0.5;
    float _2382 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1836);
    float _2384 = -_2288;
    float _2386 = _2384 + _2374;
    float _2388 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1946);
    float _2390 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2392 = -_2180;
    float _2394 = _2392 + _2376;
    float _2396 = _2386 * _2386;
    int _2398 = _2324 * _2286;
    int _2400 = _2398 + _2320;
    float _2402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2404 = -_2382;
    float _2406 = _2404 + 1.0;
    float _2408 = -_2388;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2152;
    float _2414 = _2412 + _2378;
    float _2416 = fma(_2394, _2394, _2396);
    float _2418 = -_2406;
    float _2420 = fma(_1150, _2418, _1990);
    float _2422 = -_1984;
    float _2424 = _2422 + 0.5;
    float _2426 = fma(_1960, _2410, _2314);
    float _2428 = fma(_2414, _2414, _2416);
    float _2430 = _2390 * _2284;
    float _2432 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2434 = sqrt(_2428);
    float _2436 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2438 = _1816 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2440 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2444 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2448 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2450 = _2440 * _2402;
    float _2452 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1994);
    float _2454 = float(_2400);
    out.m_60.x = _2444;
    out.m_60.y = _2446;
    out.m_60.z = _2448;
    out.m_60.w = _2442;
    out.m_62.x = _2430;
    out.m_62.y = _2450;
    out.m_62.z = _2420;
    out.m_62.w = _2426;
    bool _2456 = _2434 > 0.0;
    out.m_64.x = _2452;
    out.m_66.y = _2454;
    bool _2458 = !_2456;
    float _2460 = _2450;
    float _2462 = _2440;
    float _2464 = _2374;
    float _2466 = _2378;
    float _2468 = _2376;
    float _2470 = _2450;
    float _2472 = _2386;
    if (!_2458)
    {
        bool _2474 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2476 = _2426;
        if (_2474)
        {
            float _2478 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2476 = _2478;
        }
        float _2480 = _2476;
        if (_2474)
        {
            float _2482 = _423 * _2480;
            _2460 = _2482;
        }
        float _2484 = _2460;
        float _2486 = _2484;
        if (_2474)
        {
            float _2488 = _425 * _2480;
            _2172 = _2488;
        }
        float _2490 = _2172;
        float _2492 = _2490;
        if (_2474)
        {
            float _2494 = _427 * _2480;
            _2462 = _2494;
        }
        float _2496 = _2462;
        float _2498 = _2496;
        float _2500 = _2496;
        if (!_2474)
        {
            bool _2502 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2506 = _2502 || _2504;
            bool _2508 = isnan(1.0);
            bool _2510 = _2506 || _2508;
            float _2512 = _123 + 1.0;
            float _2514 = _2512;
            if (!_2510)
            {
                float _2516 = _2512 * _2512;
                float _2518 = _2516 * 0.5;
                _2498 = _2518;
            }
            float _2520 = _2498;
            float _2522 = _2520;
            if (!_2510)
            {
                float _2524 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2522 = _2524;
            }
            float _2526 = _2522;
            bool _2528 = !_2510;
            float _2530 = _2526;
            if (!_2528)
            {
                float _2532 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2534 = log2(_2532);
                float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2538 = 1.0 + _2536;
                float _2540 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2542 = _2534 * _2512;
                float _2544 = 1.0 / _2538;
                float _2546 = _2540 * 0.693147182464599609375;
                float _2548 = exp2(_2542);
                float _2550 = 1.0 / _2546;
                float _2552 = _2548 + (-1.0);
                float _2554 = -_2552;
                float _2556 = fma(_2554, _2550, _2512);
                float _2558 = _2556 * _2544;
                float _2560 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2530 = _2560;
            }
            float _2562 = _2530;
            float _2564 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2566 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2568 = !_2510;
            if (!_2568)
            {
                float _2570 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2572 = log2(_2570);
                float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2576 = 1.0 + _2574;
                float _2578 = 1.0 / _2576;
                float _2580 = _2572 * _2512;
                float _2582 = exp2(_2580);
                float _2584 = -_2582;
                float _2586 = _2584 + 1.0;
                float _2588 = _2586 * _2578;
                _2514 = _2588;
            }
            float _2590 = _2514;
            float _2592 = fma(_2590, _161, _2566);
            float _2594 = fma(_2590, _159, _2564);
            float _2596 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2598 = -_383;
            float _2600 = _2598 + _2592;
            float _2602 = -_391;
            float _2604 = _2602 + _2594;
            float _2606 = fma(_2590, _163, _2596);
            float _2608 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2610 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2612 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2614 = -_397;
            float _2616 = _2614 + _2606;
            float _2618 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2608);
            float _2620 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2610);
            float _2622 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2612);
            float _2624 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2618);
            float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2620);
            float _2628 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2622);
            _431 = _2626;
            _433 = _2624;
            _435 = _2628;
            _2486 = _2624;
            _2492 = _2626;
            _2500 = _2628;
        }
        float _2630 = _431;
        float _2632 = _433;
        float _2634 = _435;
        float _2636 = _2486;
        float _2638 = _2492;
        float _2640 = _2500;
        float _2642 = _2630 * _2630;
        float _2644 = fma(_2632, _2632, _2642);
        float _2646 = fma(_2634, _2634, _2644);
        float _2648 = rsqrt(_2428);
        float _2650 = sqrt(_2646);
        float _2652 = _2394 * _2648;
        float _2654 = _2386 * _2648;
        float _2656 = _2414 * _2648;
        bool _2658 = _2650 > 0.0;
        bool _2660 = !_2658;
        _437 = _2646;
        _125 = _2654;
        _439 = _2652;
        _2470 = _2636;
        if (!_2660)
        {
            float _2662 = rsqrt(_2646);
            float _2664 = _2662 * _2630;
            float _2666 = _2662 * _2632;
            float _2668 = _2662 * _2634;
            float _2670 = _2654 * _2664;
            float _2672 = fma(_2652, _2666, _2670);
            float _2674 = fma(_2656, _2668, _2672);
            float _2676 = _2674 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2678 = fma(_2636, _2676, _2376);
            float _2680 = fma(_2638, _2676, _2374);
            float _2682 = fma(_2640, _2676, _2378);
            _2464 = _2680;
            _2466 = _2682;
            _2468 = _2678;
            _125 = _2670;
        }
    }
    float _2684 = _2464;
    float _2686 = _2466;
    float _2688 = _2468;
    float _2690 = _437;
    float _2692 = _125;
    float _2694 = _439;
    float _2696 = _2470;
    float _2698 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2708 = _2704 || _2706;
    float _2710 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2698);
    float _2712 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2714 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2716 = isnan(0.5);
    bool _2718 = _2714 || _2716;
    bool _2720 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2722 = _2718 || _2720;
    float _2724 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2710);
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2728 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2712);
    float _2730 = 1.0 / _2726;
    float _2732 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2728);
    float _2734 = _2692;
    float _2736 = _2690;
    float _2738 = _2694;
    float _2740 = _2696;
    if (_2708)
    {
        _2734 = _2684;
    }
    float _2742 = _2734;
    float _2744 = _2742;
    if (_2722)
    {
        _2472 = 1.0;
    }
    float _2746 = _2472;
    float _2748 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2750 = _2748 + _2726;
    float _2752 = _2750 * _2730;
    float _2754 = _2752 * 0.5;
    float _2756 = _2730;
    float _2758 = _2754;
    float _2760 = _2746;
    if (_2708)
    {
        _2756 = _2686;
    }
    float _2762 = _2756;
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2766 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2764);
    float _2768 = _2762;
    if (_2708)
    {
        _2758 = _2688;
    }
    float _2770 = _2758;
    float _2772 = 1.0 / _2766;
    float _2774 = _2770;
    if (!_2708)
    {
        float _2776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2778 = _2288 + _2776;
        float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2782 = _2180 + _2780;
        float _2784 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2786 = -_2180;
        float _2788 = _2786 + _2688;
        float _2790 = _2778 * _2778;
        float _2792 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2794 = _2152 + _2792;
        float _2796 = -_2152;
        float _2798 = _2796 + _2686;
        float _2800 = fma(_2782, _2782, _2790);
        float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2804 = fma(_2794, _2794, _2800);
        float _2806 = sqrt(_2804);
        float _2808 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2810 = precise::min(_2806, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2812 = _2810 * _2802;
        float _2814 = -_2288;
        float _2816 = _2814 + _2684;
        float _2818 = _2808 * _2812;
        float _2820 = fma(_2788, _2818, _2180);
        float _2822 = fma(_2816, _2818, _2288);
        float _2824 = fma(_2798, _2818, _2152);
        _2744 = _2822;
        _2774 = _2820;
        _2768 = _2824;
    }
    float _2826 = _2744;
    float _2828 = _2774;
    float _2830 = _2768;
    if (_2722)
    {
        _2224 = 1.0;
    }
    float _2832 = _2224;
    float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2836 = _2772 * _2834;
    float _2838 = _2832;
    if (!_2722)
    {
        float _2840 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2842 = _2840 * 0.15915493667125701904296875;
        float _2844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2846 = _2842 * 6.283185482025146484375;
        float _2848 = cos(_2846);
        float _2850 = _2844 * 0.15915493667125701904296875;
        float _2852 = _2842 * 6.283185482025146484375;
        float _2854 = sin(_2852);
        float _2856 = 1.0 / _2848;
        float _2858 = _2850 * 6.283185482025146484375;
        float _2860 = cos(_2858);
        float _2862 = _2854 * _2856;
        float _2864 = _2850 * 6.283185482025146484375;
        float _2866 = sin(_2864);
        float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2870 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2868;
        float _2872 = _2860 * _2862;
        float _2874 = 1.0 / _2870;
        float _2876 = 1.0 / _2872;
        float _2878 = _2866 * _2876;
        float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2882 = fma(_2836, _2878, _2880);
        float _2884 = _2882 * _2874;
        float _2886 = precise::clamp(_2884, 0.0, 1.0);
        _2736 = _2874;
        _2738 = _2842;
        _2760 = _2886;
    }
    float _2888 = _2736;
    float _2890 = _2738;
    float _2892 = _2760;
    float _2894 = _2888;
    float _2896 = _2890;
    if (!_2722)
    {
        float _2898 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2900 = _2898 * 0.15915493667125701904296875;
        float _2902 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2904 = _2900 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = _2902 * 0.15915493667125701904296875;
        float _2910 = _2900 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        float _2914 = 1.0 / _2906;
        float _2916 = _2908 * 6.283185482025146484375;
        float _2918 = cos(_2916);
        float _2920 = _2912 * _2914;
        float _2922 = _2908 * 6.283185482025146484375;
        float _2924 = sin(_2922);
        float _2926 = _2918 * _2920;
        float _2928 = 1.0 / _2926;
        float _2930 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2932 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2930;
        float _2934 = 1.0 / _2932;
        float _2936 = _2924 * _2928;
        float _2938 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2940 = fma(_2836, _2936, _2938);
        float _2942 = _2940 * _2934;
        float _2944 = precise::clamp(_2942, 0.0, 1.0);
        float _2946 = -_2944;
        float _2948 = _2946 + 1.0;
        _2894 = _2928;
        _2896 = _2926;
        _2838 = _2948;
    }
    float _2950 = _2894;
    float _2952 = _2896;
    float _2954 = _2838;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2958 = _2826 + _2956;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2962 = _2828 + _2960;
    float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2966 = _2830 + _2964;
    float _2968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2970 = _2958 * _2958;
    float _2972 = fma(_2962, _2962, _2970);
    float _2974 = fma(_2966, _2966, _2972);
    float _2976 = rsqrt(_2974);
    float _2978 = sqrt(_2974);
    float _2980 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2982 = _2962 * _2980;
    float _2984 = _2966 * _2980;
    float _2986 = _2982 * _2982;
    float _2988 = _2984 * _2984;
    float _2990 = _2986 + _2988;
    float _2992 = sqrt(_2990);
    bool _2994 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2998 = _2992 + _2996;
    float _3000 = _2966;
    float _3002 = _2970;
    float _3004 = _2998;
    float _3006 = _2950;
    float _3008 = _2980;
    if (_2994)
    {
        float _3010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3000 = _3010;
    }
    float _3012 = _3000;
    if (_2994)
    {
        float _3014 = rsqrt(_2990);
        _3002 = _3014;
    }
    float _3016 = _3002;
    float _3018 = _3016;
    if (_2994)
    {
        float _3020 = _2998 * _3012;
        _3004 = _3020;
    }
    float _3022 = _3004;
    if (_2994)
    {
        float _3024 = _3022 * 0.15915493667125701904296875;
        _3006 = _3024;
    }
    float _3026 = _3006;
    float _3028 = _2976;
    float _3030 = _3026;
    if (_2994)
    {
        float _3032 = _3026 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        _3028 = _3034;
    }
    float _3036 = _3028;
    float _3038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3040 = precise::max(0.0, _3038);
    float _3042 = _2952;
    float _3044 = _3040;
    float _3046 = _3038;
    if (_2994)
    {
        float _3048 = _3026 * 6.283185482025146484375;
        float _3050 = cos(_3048);
        _3042 = _3050;
    }
    float _3052 = _3042;
    float _3054 = -_2980;
    float _3056 = -_3040;
    float _3058 = fma(_2958, _3054, _3056);
    if (_2994)
    {
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3044 = _3060;
    }
    float _3062 = _3044;
    float _3064 = _3062;
    if (!_2994)
    {
        _3030 = _2986;
    }
    float _3066 = _3030;
    float _3068 = _3036;
    float _3070 = _3066;
    if (_2994)
    {
        float _3072 = fma(_3036, _3062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3068 = _3072;
    }
    float _3074 = _3068;
    float _3076 = _3074;
    if (!_2994)
    {
        _3064 = _2984;
    }
    float _3078 = _3064;
    float _3080 = _3078;
    if (_2994)
    {
        float _3082 = _3052 + (-1.0);
        _3046 = _3082;
    }
    float _3084 = _3046;
    float _3086 = _3084;
    if (_2994)
    {
        float _3088 = _3016 * _3074;
        _2740 = _3088;
    }
    float _3090 = _2740;
    if (!_2994)
    {
        _3018 = _2982;
    }
    float _3092 = _3018;
    float _3094 = _3092;
    if (_2994)
    {
        float _3096 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3008 = _3096;
    }
    float _3098 = _3008;
    if (_2994)
    {
        float _3100 = _2982 * _3090;
        _3094 = _3100;
    }
    float _3102 = _3094;
    if (!_2994)
    {
        _3076 = _3058;
    }
    float _3104 = _3076;
    float _3106 = _3104;
    if (_2994)
    {
        float _3108 = _2984 * _3090;
        _3080 = _3108;
    }
    float _3110 = _3080;
    if (_2994)
    {
        float _3112 = fma(_3058, _3052, _3098);
        _3106 = _3112;
    }
    float _3114 = _3106;
    if (_2994)
    {
        float _3116 = _3102 * _3102;
        _3070 = _3116;
    }
    float _3118 = _3070;
    if (!_2994)
    {
        _3086 = _2988;
    }
    float _3120 = _3086;
    float _3122 = _3120;
    if (_2994)
    {
        float _3124 = _3110 * _3110;
        _3122 = _3124;
    }
    float _3126 = _3122;
    float _3128 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3130 = fma(_3114, _3114, _3118);
    float _3132 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3134 = _3130 + _3126;
    float _3136 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3128);
    float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3140 = fma(_2978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3138);
    float _3142 = precise::clamp(_3140, 0.0, 1.0);
    float _3144 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3146 = rsqrt(_3134);
    float _3148 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3136);
    float _3150 = -_3142;
    float _3152 = _3150 + 1.0;
    float _3154 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3144);
    float _3156 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3158 = _3148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3160 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3132);
    float _3162 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3154);
    float _3164 = abs(_3152);
    float _3166 = log2(_3164);
    float _3168 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3170 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3160);
    float _3172 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3174 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3156);
    float _3176 = -_3168;
    float _3178 = fma(_3176, _2968, 1.0);
    float _3180 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3182 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3184 = _3146 * _3102;
    float _3186 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3174);
    float _3188 = _3146 * _3114;
    float _3190 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3182);
    float _3192 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3194 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3196 = _3146 * _3110;
    float _3198 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3190);
    float _3200 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3202 = -_3192;
    float _3204 = fma(_3188, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3202);
    float _3206 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3208 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3198);
    float _3210 = log2(_3178);
    float _3212 = -_3196;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3204);
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3218 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3206);
    float _3220 = fma(_3214, -0.5, 0.5);
    float _3222 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3216);
    float _3224 = fma(_3214, 0.5, 0.5);
    float _3226 = exp2(_3200);
    float _3228 = _3188 + 1.0;
    float _3230 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3218);
    float _3232 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3222);
    float _3234 = fma(_3224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3236 = 1.0 / _3208;
    float _3238 = fma(_3224, _3234, -0.212114393711090087890625);
    float _3240 = _3210 * 0.693147182464599609375;
    float _3242 = fma(_3224, _3238, 1.570728778839111328125);
    float _3244 = sqrt(_3220);
    float _3246 = -_3188;
    float _3248 = fma(_3226, _3228, _3246);
    float _3250 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3230);
    float _3252 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3232);
    float _3254 = fma(_3248, 0.5, 0.5);
    float _3256 = _3250 * _3236;
    float _3258 = _3252 * _3236;
    float _3260 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3262 = fma(_3256, 0.5, 0.5);
    float _3264 = fma(_3258, -0.5, 0.5);
    float _3266 = _3244 * 0.636619746685028076171875;
    float3 _8194 = float3(_3262, _3264, _3260);
    float _3268 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8194, float3(0.0), isnan(_8194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8194, float3(0.0), isnan(_8194)), level(0.0)).x;
    float _3270 = -_3242;
    float _3272 = fma(_3266, _3270, 1.0);
    float3 _8210 = float3(_3262, _3264, _3260);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8210, float3(0.0), isnan(_8210)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8210, float3(0.0), isnan(_8210)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    float2 _8227 = float2(_3272, _3254);
    float3 _3287 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8227, float2(0.0), isnan(_8227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8227, float2(0.0), isnan(_8227)), level(0.0)).xyz;
    float _3289 = _3287.x;
    float _3291 = _3287.y;
    float _3293 = _3287.z;
    float _3295 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3297 = _2892 * _2954;
    bool _3299 = _2892 > 0.0;
    bool _3301 = isnan(_2892);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan(0.0);
    bool _3307 = _3303 || _3305;
    float _3309 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3295);
    float _3311 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3313 = _2954 <= 0.0;
    bool _3315 = !_3307;
    bool _3317 = _3313 || _3315;
    float _3319 = _3208 * 0.5;
    float _3321 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3309);
    float _3323 = exp2(_3311);
    float _3325 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3321);
    float _3327 = _3297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3329 = _3250 + _3208;
    float _3331 = _3325 + _3208;
    float _3333 = fma(_3252, -0.5, _3319);
    out.gl_Position.x = _3250;
    out.gl_Position.y = _3252;
    out.gl_Position.z = _3325;
    out.gl_Position.w = _3208;
    float _3335 = _3329 * 0.5;
    float _3337 = _3331 * 0.5;
    float _3339 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _3335;
    out.m_68.y = _3333;
    out.m_68.z = _3337;
    out.m_68.w = _3208;
    float _3341 = -_3323;
    float _3343 = _3341 + 1.0;
    out.m_45.x = _3339;
    float _3345 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3347 = -_3345;
    float _3349 = _3347 + 1.0;
    float _3351 = _3345 * _3268;
    float _3353 = _3283 * _3351;
    float _3355 = _3283 * _3349;
    float _3357 = _3293 * _3351;
    float _3359 = fma(_3289, _3353, _3277);
    float _3361 = fma(_3291, _3353, _3279);
    float _3363 = fma(_3283, _3357, _3281);
    out.m_70.x = _3359;
    out.m_70.y = _3361;
    out.m_70.z = _3363;
    out.m_70.w = _3355;
    if (!_3317)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3365 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3365;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _859 = false;
    bool _699 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3422 = as_type<float>(_105);
        out.gl_Position.z = _3422;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _3492 = as_type<float>(_143);
        out.gl_Position.z = _3492;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_49.w;
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    int _165 = int(_157);
    int _167 = false ? 2 : 0;
    int _169 = _165 | _167;
    int _171 = false ? 4 : 0;
    int _173 = _169 | _171;
    int _175 = false ? 8 : 0;
    int _177 = _173 | _175;
    int _179 = false ? 16 : 0;
    int _181 = _177 | _179;
    int _183 = false ? 32 : 0;
    int _185 = _181 | _183;
    int _187 = false ? 64 : 0;
    int _189 = _185 | _187;
    int _191 = _189 & 1;
    float _193 = in.m_42.x;
    float _195 = in.m_42.y;
    float _197 = in.m_42.z;
    float _199 = 0.0;
    float _201 = as_type<float>(_191);
    float _203 = _147;
    if (!_157)
    {
        float _205 = _147 * _147;
        float _207 = _205 * 0.5;
        _199 = _207;
    }
    float _209 = _199;
    float _211 = _209;
    if (!_157)
    {
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_157;
    float _219 = _215;
    float _221 = 0.0;
    if (!_217)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _251;
        _201 = _241;
        _221 = _239;
    }
    float _253 = _219;
    float _255 = _201;
    float _257 = _221;
    bool _259 = !_157;
    float _261 = _255;
    float _263 = _257;
    if (!_259)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _147 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _261 = _271;
        _203 = _283;
    }
    float _285 = _261;
    float _287 = _203;
    float _289 = _285;
    if (!_157)
    {
        float _291 = _123 * _123;
        float _293 = _291 * 0.5;
        _289 = _293;
    }
    float _295 = _289;
    float _297 = _295;
    if (!_157)
    {
        _263 = _123;
    }
    float _299 = _263;
    float _301 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _305 = _299;
    if (!_157)
    {
        float _307 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _307;
    }
    float _309 = _297;
    bool _311 = !_157;
    float _313 = _309;
    if (!_311)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = _123 * _317;
        float _327 = 1.0 / _321;
        float _329 = _323 * 0.693147182464599609375;
        float _331 = exp2(_325);
        float _333 = 1.0 / _329;
        float _335 = _331 + (-1.0);
        float _337 = -_335;
        float _339 = fma(_337, _333, _123);
        float _341 = _339 * _327;
        float _343 = _341 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _343;
    }
    float _345 = _313;
    bool _347 = !_157;
    if (!_347)
    {
        float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = log2(_349);
        float _353 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _355 = _353 + 1.0;
        float _357 = 1.0 / _355;
        float _359 = _123 * _351;
        float _361 = exp2(_359);
        float _363 = -_361;
        float _365 = _363 + 1.0;
        float _367 = _365 * _357;
        _305 = _367;
    }
    float _369 = _305;
    float _371 = fma(_287, _159, _301);
    float _373 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _375 = fma(_287, _161, _303);
    float _377 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _381 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _383 = fma(_369, _161, _373);
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _387 = fma(_287, _163, _377);
    float _389 = fma(_375, _145, _195);
    float _391 = fma(_369, _159, _379);
    float _393 = -_383;
    float _395 = _375 + _393;
    float _397 = fma(_369, _163, _381);
    float _399 = fma(_371, _145, _193);
    float _401 = -_391;
    float _403 = _371 + _401;
    float _405 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _409 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _411 = -_397;
    float _413 = _387 + _411;
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _409);
    float _421 = fma(_387, _145, _197);
    float _423 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _415);
    float _425 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    bool _429 = !_385;
    float _431 = _425;
    float _433 = _423;
    float _435 = _427;
    float _437 = _397;
    float _439 = _391;
    float _457;
    if (!_429)
    {
        float _441 = in.m_51.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_89);
        float _463 = 1.0 / _461;
        float _465 = _123 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = _467 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _479 = _467 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _497 = 1.0 / _483;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _501 = 1.0 / _491;
    float _503 = 1.0 / _495;
    float _505 = _471 * _497;
    bool _507 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _509 = isnan(_467);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_517;
    float _521 = _519 + 1.0;
    float _523 = 1.0 / _487;
    float _525 = _475 * _501;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _467 + _527;
    bool _531 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_467);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = _479 * _503;
    float _549 = fma(_545, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _551 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_467);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _529 * _523;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = _561 * _521;
    bool _571 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _573 = isnan(_467);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -_561;
    float _585 = _583 + 1.0;
    float _587 = fma(_567, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _589 = -_541;
    float _591 = _589 + 1.0;
    bool _593 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _595 = isnan(_467);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _609 = _541 * _585;
    float _611 = _581 * _591;
    float _613 = -_581;
    float _615 = _613 + 1.0;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _625 = fma(_607, _547, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _627 = _603 * _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _629;
    float _633 = fma(_623, _547, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _635;
    float _639 = _587 * _627;
    float _641 = _549 * _627;
    float _643 = fma(_631, _505, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _645 = fma(_637, _505, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _649 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = fma(_625, _611, _647);
    float _661 = fma(_633, _611, _649);
    float _663 = fma(_653, _563, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _665 = fma(_657, _563, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _667 = fma(_643, _609, _659);
    float _669 = fma(_645, _609, _661);
    float _671 = fma(_663, _569, _667);
    float _673 = fma(_665, _569, _669);
    float _675 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[147].x, _671);
    float _677 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[147].y, _673);
    bool _679 = !_499;
    float _697;
    if (!_679)
    {
        float _681 = in.m_51.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_89);
        float _703 = 1.0 / _701;
        float _705 = _123 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _707 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _717 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _719 = isnan(_707);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _733 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _735 = isnan(_707);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _745;
    bool _749 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _751 = isnan(_707);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = 1.0 / _715;
    float _763 = -_727;
    float _765 = _763 + 1.0;
    float _767 = _743 * _765;
    float _769 = -_743;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _731;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _779 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _747 * _761;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = fma(_787, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -_759;
    float _799 = _797 + 1.0;
    float _801 = _795 * _767;
    float _803 = _791 * _773;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _807 = _707 + _805;
    float _809 = _727 * _799;
    float _811 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[115].x, _801);
    float _813 = fma(_803, _807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _815 = fma(_813, _809, _811);
    float _817 = in.m_49.x;
    float _819 = in.m_49.y;
    float _821 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[117].x, _815);
    float _823 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _783;
    out.m_53.y = _785;
    out.m_53.z = _793;
    out.m_53.w = _823;
    float _825 = _677 * _819;
    float _827 = _675 * _817;
    bool _829 = !_779;
    float _853;
    float _855;
    float _857;
    if (!_829)
    {
        float _831 = in.m_51.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _835 = float(_89);
        float _837 = 1.0 / _835;
        float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _843 = _841 * _833;
        float _845 = _123 * _837;
        float _847 = floor(_843);
        float _849 = -_847;
        float _851 = _843 + _849;
        _853 = _835;
        _855 = _851;
        _857 = _845;
        _859 = true;
    }
    else
    {
        float _861 = float(_89);
        float _863 = 1.0 / _861;
        float _865 = _123 * _863;
        _853 = _861;
        _855 = _865;
        _857 = _865;
    }
    _859 = false;
    float _867 = _853;
    float _869 = _855;
    float _871 = _857;
    float _873 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _875 = int(_873);
    float _877 = in.m_51.x;
    float _879 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _883 = _881 != 0;
    float _885 = as_type<float>(int(gl_VertexIndex));
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _889 = int(_887);
    float _891 = in.m_51.w;
    float _893 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _879);
    float _895 = in.m_51.z;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _897;
    float _901 = float(_875);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_883)
    {
        float _909 = in.m_51.y;
        _907 = _909;
    }
    float _911 = _907;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _917 = 1.0 / _901;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _923 = float(uint(_889));
    float _925 = _877 * 2.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _935 = 1.0 / _899;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _949 = _123 * _917;
    float _951 = 1.0 / _923;
    float _953 = _895 * 2.0;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _959 = _917;
    if (!_883)
    {
        _959 = _911;
    }
    float _961 = _959;
    float _963 = trunc(_949);
    int _965 = int(_963);
    float _967 = _961;
    float _969 = _911;
    if (_883)
    {
        float _971 = in.m_51.x;
        float _973 = in.m_51.y;
        _967 = _971;
        _969 = _973;
    }
    float _975 = _967;
    float _977 = _969;
    float _979 = floor(_925);
    int _981 = as_type<int>(_951) + (-2);
    float _983 = float(uint(_965));
    float _985 = 1.0 / _905;
    float _987 = float(_965);
    float _989 = as_type<float>(_981) * _983;
    bool _991 = _979 > 0.0;
    float _993 = trunc(_989);
    float _995 = precise::max(_993, 0.0);
    uint _998 = uint(_995);
    bool _1000 = _979 >= 0.0;
    bool _1002 = isnan(_979);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = as_type<int>(_885) & 1;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>(_885) & 2;
    bool _1018 = _1016 != 0;
    float _1020 = _977 * 2.0;
    int _1022 = ~_1010;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = 1.0 / _915;
    bool _1030 = _891 > 0.5;
    float _1032 = _943 * _985;
    int _1034 = _1026;
    if (!_991)
    {
        int _1036 = ~_1010;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    int _1042 = ~_889;
    int _1044 = _1042 + 1;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1048 = _1046 != 0;
    float _1050 = floor(_1020);
    bool _1052 = !_1014;
    float _1054 = _1052 ? (-0.5) : 0.5;
    int _1056 = _1044 * int(_998);
    int _1058 = _1056 + _965;
    bool _1060 = !_1048;
    int _1062 = _1060 ? 0 : 1;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1070 = _1068 != 0;
    float _1072 = float(uint(_1058));
    float _1074 = 1.0 / _921;
    bool _1076 = !_1018;
    float _1078 = _1076 ? (-0.5) : 0.5;
    float _1080 = _939 * _1028;
    bool _1082 = _895 > 0.5;
    float _1084 = as_type<float>(_981) * _1072;
    bool _1086 = !_1066;
    int _1088 = _1086 ? 0 : 1;
    bool _1090 = !_1070;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = trunc(_1084);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    bool _1100 = _877 > 0.5;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1108 = _1106 != 0;
    float _1110 = -_1054;
    int _1112 = _1082 ? as_type<int>(_1110) : as_type<int>(_1054);
    float _1114 = 1.0 / _929;
    float _1116 = -_1054;
    int _1118 = _1100 ? as_type<int>(_1116) : as_type<int>(_1054);
    float _1120 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1122 = -_1078;
    int _1124 = _1030 ? as_type<int>(_1122) : as_type<int>(_1078);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1132 = _1130 != 0;
    float _1134 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1120);
    bool _1136 = _1050 >= 0.0;
    bool _1138 = isnan(_1050);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = 1.0 / _933;
    bool _1148 = !_1104;
    float _1150 = _1148 ? _1054 : as_type<float>(_1112);
    bool _1152 = !_1108;
    float _1154 = _1152 ? _1054 : as_type<float>(_1118);
    float _1156 = _1144 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1158 = _1050 > 0.0;
    float _1160 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1162 = int(_998) + int(_1098);
    float _1164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1166 = log2(_1164);
    int _1168 = ~_889;
    int _1170 = _1168 + 1;
    float _1172 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1160);
    bool _1174 = !_1132;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1180 = _1178 != 0;
    int _1182 = _1170 * _1162;
    int _1184 = _1182 + _965;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1188 = _1186 != 0;
    float _1190 = 1.0 / _867;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1194 = _1192 != 0;
    bool _1196 = !_1128;
    int _1198 = _1196 ? 0 : 1;
    int _1200 = ~as_type<int>(_1156);
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = 1.0 / _947;
    bool _1208 = uint(_1184) >= uint(_889);
    float _1210 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1172);
    int _1212 = _1204;
    float _1214 = _1156;
    float _1216 = _1120;
    if (!_1158)
    {
        int _1218 = ~as_type<int>(_1156);
        int _1220 = _1218 + 1;
        _1212 = _1220;
    }
    int _1222 = _1212;
    float _1224 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1134);
    if (!_883)
    {
        _1214 = _895;
    }
    float _1226 = _1214;
    float _1228 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _893);
    float _1230 = _1226;
    if (!_883)
    {
        _1216 = _895;
    }
    float _1232 = _1216;
    float _1234 = floor(_953);
    bool _1236 = !_883;
    float _1238 = _1236 ? 1.2345600128173828125 : 1.0;
    float _1240 = _1232;
    if (_883)
    {
        _1230 = _977;
    }
    float _1242 = _1230;
    if (_883)
    {
        _1240 = _977;
    }
    float _1244 = _1240;
    bool _1246 = !_883;
    float _1248 = _1246 ? _977 : _877;
    float _1250 = 1.0 / _957;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1262 = _1260 != 0;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1266 = _869 + _1264;
    float _1268 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1270 = _1266 * _935;
    bool _1272 = !_1208;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1284 = float(_889);
    float _1286 = _1278 * _1074;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1288;
    float _1292 = _1282 * _1114;
    float _1294 = _877 + _895;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1300 = _1290 * _1146;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1302;
    float _1306 = _1294 + (-1.0);
    float _1308 = _123 * _1284;
    float _1310 = _1238 * _1248;
    float _1312 = _123 * _1166;
    float _1314 = _1298 * _1206;
    float _1316 = _1308 * _1190;
    bool _1318 = _1234 >= 0.0;
    bool _1320 = isnan(_1234);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = floor(_1310);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1332 = _871 + _1330;
    float _1334 = _1304 * _1250;
    int _1336 = _1326 ? 0 : 1;
    float _1338 = fma(_1080, _1332, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1340 = _1234 > 0.0;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1342;
    float _1346 = exp2(_1312);
    bool _1348 = _987 >= _1284;
    bool _1350 = isnan(_987);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan(_1284);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1364 = _871 + _1362;
    int _1366 = ~_1162;
    int _1368 = _1366 + _1274;
    int _1370 = _1368 + 1;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1374 = _871 + _1372;
    int _1376 = abs(_1062);
    float _1378 = trunc(_1358);
    int _1380 = int(_1378);
    float _1382 = -_1328;
    float _1384 = _1310 + _1382;
    int _1386 = ~_1336;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1398 = _871 + _1396;
    int _1400 = _1390;
    if (!_1340)
    {
        int _1402 = ~_1336;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = fma(_1344, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1410 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(0.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -_1346;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1394, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1426 = fma(_1286, _1398, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1428 = _1284 * _1384;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1432 = _871 + _1430;
    float _1434 = _1418 ? _1422 : 0.0;
    int _1436 = _889 * _1370;
    int _1438 = _1436 + _965;
    bool _1440 = _889 == 0;
    float _1442 = fma(_1292, _1374, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1444 = fma(_1300, _1432, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1446 = ~_1380;
    int _1448 = _1446 + 1;
    int _1450 = _1448 + 1;
    float _1452 = trunc(_1428);
    int _1454 = int(_1452);
    bool _1456 = !_1440;
    int _1458 = _1456 ? _1438 : (-1);
    float _1460 = fma(_1032, _1364, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1462 = _889 + (-1);
    int _1464 = abs(_1176);
    int _1466 = _1450 * _1458;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1470 = _871 + _1468;
    float _1472 = trunc(_1316);
    int _1474 = int(_1472);
    int _1476 = _1380 * _1462;
    int _1478 = _1476 + _1466;
    int _1480 = abs(_1198);
    float _1482 = fma(_1314, _1470, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    int _1484 = abs(_1088);
    int _1486 = _1478 * _1464;
    float _1488 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1492 = _871 + _1490;
    int _1494 = _1454 * _1376;
    int _1496 = _1494 + _965;
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1054);
    float _1500 = fma(_1334, _1492, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1502 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1504 = isnan(_871);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = _1488 * _1498;
    bool _1516 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1518 = isnan(_869);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1524 = _1520 || _1522;
    float _1526 = float(_1524);
    int _1528 = _1474 * _1480;
    int _1530 = _1528 + _1486;
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1078);
    float _1534 = -_1512;
    float _1536 = _1534 + 1.0;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1538;
    int _1542 = _1496 * _1484;
    int _1544 = _1542 + _1530;
    int _1546 = abs(_1092);
    float _1548 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1550 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1552 = isnan(_871);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = fma(_1540, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1564 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1566 = isnan(_871);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    int _1576 = _1454 * _1546;
    int _1578 = _1576 + _1544;
    int _1580 = ~_889;
    int _1582 = _1580 + 1;
    float _1584 = -_1560;
    float _1586 = _1584 + 1.0;
    float _1588 = _1560 * _1536;
    float _1590 = _1548 * _1532;
    float _1592 = float(uint(_1578));
    float _1594 = _1574 * _1586;
    float _1596 = -_1574;
    float _1598 = _1596 + 1.0;
    bool _1600 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1602 = isnan(_871);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = as_type<float>(_981) * _1592;
    bool _1614 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1616 = isnan(_871);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    bool _1626 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1628 = isnan(_869);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = -_1610;
    float _1640 = _1638 + 1.0;
    bool _1642 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1644 = isnan(_871);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = trunc(_1612);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    float _1660 = -_1624;
    float _1662 = _1660 + 1.0;
    float _1664 = _1610 * _1598;
    float _1666 = _1624 * _1640;
    bool _1668 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1670 = isnan(_871);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1652 * _1662;
    bool _1682 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1684 = isnan(_871);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = -_1652;
    float _1696 = _1694 + 1.0;
    bool _1698 = !_1254;
    int _1700 = _1698 ? 0 : 1;
    float _1702 = in.m_58.x;
    float _1704 = in.m_58.y;
    float _1706 = in.m_58.z;
    float _1708 = -_1636;
    float _1710 = _1708 + 1.0;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1714 = 1.0 + _1712;
    float _1716 = _1692 * _1696;
    int _1718 = abs(_1700);
    float _1720 = _1526 * _1710;
    int _1722 = _1582 * int(_1658);
    int _1724 = _1722 + _1578;
    float _1726 = 1.0 / _1714;
    float _1728 = -_1692;
    float _1730 = _1728 + 1.0;
    float _1732 = _1408 * _1720;
    float _1734 = _1424 * _1720;
    float _1736 = float(uint(_1724));
    float _1738 = _1562 * _1720;
    float _1740 = float(_1718);
    float _1742 = _1678 * _1730;
    float _1744 = float(_1406);
    float _1746 = as_type<float>(_981) * _1736;
    float _1748 = _877 + _977;
    float _1750 = _1338 * _1742;
    float _1752 = _877 + (-0.5);
    float _1754 = trunc(_1746);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = _1740 * _1744;
    float _1762 = -_1526;
    float _1764 = _1762 + 1.0;
    float _1766 = _1748 + (-1.0);
    float _1768 = _1760 * (-2.0);
    bool _1770 = !_1258;
    int _1772 = _1770 ? 0 : 1;
    float _1774 = _1434 * _1726;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1732);
    float _1778 = fma(_1768, _1702, _1702);
    float _1780 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1734);
    int _1782 = abs(_1772);
    float _1784 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1786 = _895 + _977;
    float _1788 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1778);
    float _1790 = fma(_1784, _1768, _1784);
    int _1792 = int(_1658) + int(_1758);
    float _1794 = _1786 + (-1.0);
    bool _1796 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1798 = isnan(1.0);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1804 = _1800 || _1802;
    float _1806 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1738);
    float _1808 = float(_1782);
    float _1810 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1776);
    float _1812 = float(_1040);
    float _1814 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1780);
    float _1816 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1806);
    bool _1818 = !_1804;
    float _1820 = _1818 ? _123 : _1774;
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1824 = _1808 * _1812;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1828 = float(uint(_1496));
    float _1830 = fma(_1820, _1790, _1788);
    bool _1832 = !_1262;
    int _1834 = _1832 ? 0 : 1;
    float _1836 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1826);
    int _1838 = ~_889;
    int _1840 = _1838 + 1;
    float _1842 = _975 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1844 = as_type<float>(_981) * _1828;
    int _1846 = abs(_1834);
    float _1848 = -_1678;
    float _1850 = _1848 + 1.0;
    int _1852 = _1840 * _1792;
    int _1854 = _1852 + _1578;
    float _1856 = trunc(_1844);
    float _1858 = precise::max(_1856, 0.0);
    uint _1860 = uint(_1858);
    bool _1862 = uint(_1854) >= uint(_889);
    float _1864 = _1824 * (-2.0);
    float _1866 = float(_1846);
    float _1868 = _1830 * 0.15915493667125701904296875;
    float _1870 = float(_1222);
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1874 = fma(_1822, _1864, _1822);
    float _1876 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1750);
    int _1878 = ~_889;
    int _1880 = _1878 + 1;
    float _1882 = _1866 * _1870;
    float _1884 = -_1872;
    float _1886 = fma(_1842, 2.0, _1884);
    bool _1888 = !_1862;
    int _1890 = _1888 ? 0 : (-1);
    float _1892 = fma(_1460, _1716, _1876);
    float _1894 = _1882 * (-2.0);
    bool _1896 = _977 > 0.5;
    float _1898 = _977 + (-0.5);
    float _1900 = fma(_1864, _1704, _1704);
    float _1902 = fma(_1894, _1706, _1706);
    float _1904 = _895 + (-0.5);
    int _1906 = _1880 * int(_1860);
    int _1908 = _1906 + _1496;
    float _1910 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1900);
    float _1912 = fma(_1360, _1894, _1360);
    float _1914 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1902);
    float _1916 = fma(_1426, _1680, _1892);
    float _1918 = float(uint(_1908));
    float _1920 = fma(_1820, _1874, _1910);
    float _1922 = fma(_1820, _1912, _1914);
    float _1924 = fma(_1442, _1666, _1916);
    float _1926 = as_type<float>(_981) * _1918;
    float _1928 = _1920 * 0.15915493667125701904296875;
    float _1930 = _1868 * 6.283185482025146484375;
    float _1932 = sin(_1930);
    float _1934 = _1922 * 0.15915493667125701904296875;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1938 = ~_1792;
    int _1940 = _1938 + _1890;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1444, _1664, _1924);
    float _1946 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1936);
    float _1948 = -_1078;
    int _1950 = _1896 ? as_type<int>(_1948) : as_type<int>(_1078);
    float _1952 = trunc(_1926);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    bool _1958 = !_1180;
    float _1960 = _1958 ? _1078 : as_type<float>(_1124);
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1964 = fma(_1482, _1594, _1944);
    float _1966 = _1150 + 0.5;
    int _1968 = ~_889;
    int _1970 = _1968 + 1;
    float _1972 = fma(_1268, -2.0, _1962);
    float _1974 = -_123;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1886);
    float _1978 = _1868 * 6.283185482025146484375;
    float _1980 = cos(_1978);
    bool _1982 = !_1194;
    float _1984 = _1982 ? _1078 : as_type<float>(_1950);
    int _1986 = _889 * _1942;
    int _1988 = _1986 + _1578;
    float _1990 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1976);
    float _1992 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1972);
    float _1994 = fma(_1500, _1588, _1964);
    bool _1996 = !_1440;
    int _1998 = _1996 ? _1988 : (-1);
    float _2000 = _1928 * 6.283185482025146484375;
    float _2002 = sin(_2000);
    int _2004 = int(_1860) + int(_1956);
    int _2006 = _1998 & 3;
    bool _2008 = _2006 != 0;
    bool _2010 = _2006 != 3;
    float _2012 = _1928 * 6.283185482025146484375;
    float _2014 = cos(_2012);
    float _2016 = _1934 * 6.283185482025146484375;
    float _2018 = sin(_2016);
    float _2020 = _1980 * _2002;
    float _2022 = _1932 * _2002;
    float _2024 = _1934 * 6.283185482025146484375;
    float _2026 = cos(_2024);
    float _2028 = _1932 * _2014;
    float _2030 = _1980 * _2014;
    float _2032 = -_2020;
    float _2034 = fma(_2018, _2028, _2032);
    float _2036 = -_2028;
    float _2038 = fma(_2018, _2020, _2036);
    int _2040 = _1998 >> 31;
    float _2042 = fma(_2018, _2030, _2022);
    float _2044 = fma(_2018, _2022, _2030);
    int _2046 = _2040 & 3;
    float _2048 = _2014 * _2026;
    float _2050 = -_1590;
    float _2052 = _2018 * _2050;
    int _2054 = _1998 + _2046;
    float _2056 = _2026 * _1590;
    int _2058 = _1970 * _2004;
    int _2060 = _2058 + _1496;
    float _2062 = fma(_2048, _1514, _2052);
    int _2064 = _2054 >> 2;
    float _2066 = _1980 * _2056;
    float _2068 = _2002 * _2026;
    float _2070 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2072 = _2064 << 4;
    int _2074 = _2072 + 512;
    float _2076 = fma(_2042, _1514, _2066);
    bool _2078 = uint(_2060) >= uint(_889);
    float _2080 = _1932 * _2056;
    uint _2082 = uint(int(uint(_2074) >> uint(2)));
    uint _2084 = uint(int(uint(int(_2082)) >> uint(2)));
    int _2086 = int(_2082) & 3;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[int(_2084)][_2086];
    int _2090 = int(_2082) + 1;
    uint _2092 = uint(int(uint(_2090) >> uint(2)));
    int _2094 = _2090 & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    float _2098 = fma(_2038, _2070, _2076);
    bool _2100 = !_2078;
    int _2102 = _2100 ? 0 : (-1);
    float _2104 = fma(_2034, _1514, _2080);
    float _2106 = fma(_2068, _2070, _2062);
    float _2108 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2110 = ~_2004;
    int _2112 = _2110 + _2102;
    int _2114 = _2112 + 1;
    float _2116 = fma(_2044, _2070, _2104);
    bool _2118 = uint(_2006) > 1u;
    int _2120 = _2074 + 8;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    uint _2124 = uint(int(uint(int(_2122)) >> uint(2)));
    int _2126 = int(_2122) & 3;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[int(_2124)][_2126];
    int _2130 = int(_2122) + 1;
    uint _2132 = uint(int(uint(_2130) >> uint(2)));
    int _2134 = _2130 & 3;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[int(_2132)][_2134];
    float _2138 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2108);
    int _2142 = _2008 ? 0 : 1;
    int _2144 = _889 * _2114;
    int _2146 = _2144 + _1496;
    float _2148 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2150 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2140);
    float _2152 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2154 = ~_2142;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2148);
    float _2162 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2164 = _1998 & 3;
    bool _2166 = _2164 != 0;
    int _2168 = _2158;
    float _2170 = _1992;
    float _2172 = _1512;
    if (!_2118)
    {
        int _2174 = ~_2142;
        int _2176 = _2174 + 1;
        _2168 = _2176;
    }
    int _2178 = _2168;
    float _2180 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2182 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _2152 + _2162;
    bool _2186 = uint(_2006) >= 2u;
    float _2188 = _2180 + _2182;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2192 = _2184 + _2190;
    bool _2194 = !_2166;
    int _2196 = _2194 ? 0 : 1;
    int _2198 = _2186 ? 0 : 1;
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2202 = _2188 + _2200;
    float _2204 = _2192 * _2192;
    bool _2206 = _2006 != 3;
    int _2208 = abs(_2196);
    float _2210 = fma(_2202, _2202, _2204);
    int _2212 = ~_2198;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    float _2218 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2220 = _2216;
    float _2222 = _2184;
    float _2224 = _2180;
    if (_2010)
    {
        int _2226 = ~_2198;
        int _2228 = _2226 + 1;
        _2220 = _2228;
    }
    int _2230 = _2220;
    float _2232 = sqrt(_2210);
    int _2234 = abs(_2178);
    float _2236 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2218);
    int _2238 = abs(_2230);
    int _2240 = ~_2234;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    int _2248 = ~_2208;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2238;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2244 * as_type<int>(_2096);
    bool _2262 = !_2206;
    int _2264 = _2262 ? 0 : (-1);
    float _2266 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2268 = _2252 * as_type<int>(_2088);
    int _2270 = _2268 + _2260;
    bool _2272 = !_1188;
    int _2274 = _2272 ? 0 : 1;
    bool _2276 = _2232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2278 = _2258 * as_type<int>(_2128);
    int _2280 = _2278 + _2270;
    int _2282 = abs(_2264);
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2286 = abs(_2274);
    float _2288 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2290 = ~_2282;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = _1960 + (-0.5);
    int _2298 = ~_2286;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = _2288 + _2266;
    int _2306 = _2294 * as_type<int>(_2136);
    int _2308 = _2306 + _2280;
    float _2310 = -_2296;
    float _2312 = -_1992;
    float _2314 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2312);
    float _2316 = _2296;
    if (!_2276)
    {
        _2316 = _2184;
    }
    float _2318 = _2316;
    int _2320 = _2302 * _2308;
    bool _2322 = !_1440;
    int _2324 = _2322 ? _2146 : (-1);
    float _2326 = _2318;
    if (!_2276)
    {
        _2170 = _2188;
    }
    float _2328 = _2170;
    float _2330 = _2328;
    if (!_2276)
    {
        _2222 = _2304;
    }
    float _2332 = _2222;
    bool _2334 = !_2276;
    float _2336 = _2332;
    if (!_2334)
    {
        float _2338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2342 = _2232 + _2340;
        float _2344 = rsqrt(_2210);
        float _2346 = _2342 * _2338;
        float _2348 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = _2346 * 0.15915493667125701904296875;
        float _2352 = _2350 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        float _2356 = _2350 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        float _2360 = _2354 + (-1.0);
        float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = fma(_2358, _2348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2366 = fma(_2304, _2354, _2362);
        float _2368 = _2344 * _2364;
        float _2370 = fma(_2202, _2368, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2372 = fma(_2192, _2368, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2336 = _2366;
        _2330 = _2370;
        _2326 = _2372;
    }
    float _2374 = _2336;
    float _2376 = _2330;
    float _2378 = _2326;
    float _2380 = _1154 + 0.5;
    float _2382 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1836);
    float _2384 = -_2288;
    float _2386 = _2384 + _2374;
    float _2388 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1946);
    float _2390 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2392 = -_2180;
    float _2394 = _2392 + _2376;
    float _2396 = _2386 * _2386;
    int _2398 = _2324 * _2286;
    int _2400 = _2398 + _2320;
    float _2402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2404 = -_2382;
    float _2406 = _2404 + 1.0;
    float _2408 = -_2388;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2152;
    float _2414 = _2412 + _2378;
    float _2416 = fma(_2394, _2394, _2396);
    float _2418 = -_2406;
    float _2420 = fma(_1150, _2418, _1990);
    float _2422 = -_1984;
    float _2424 = _2422 + 0.5;
    float _2426 = fma(_1960, _2410, _2314);
    float _2428 = fma(_2414, _2414, _2416);
    float _2430 = _2390 * _2284;
    float _2432 = _1810 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2434 = sqrt(_2428);
    float _2436 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2438 = _1816 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2440 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2444 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2448 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2450 = _2440 * _2402;
    float _2452 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1994);
    float _2454 = float(_2400);
    out.m_60.x = _2444;
    out.m_60.y = _2446;
    out.m_60.z = _2448;
    out.m_60.w = _2442;
    out.m_62.x = _2430;
    out.m_62.y = _2450;
    out.m_62.z = _2420;
    out.m_62.w = _2426;
    bool _2456 = _2434 > 0.0;
    out.m_64.x = _2452;
    out.m_66.y = _2454;
    bool _2458 = !_2456;
    float _2460 = _2450;
    float _2462 = _2440;
    float _2464 = _2374;
    float _2466 = _2378;
    float _2468 = _2376;
    float _2470 = _2450;
    float _2472 = _2386;
    if (!_2458)
    {
        bool _2474 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2476 = _2426;
        if (_2474)
        {
            float _2478 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2476 = _2478;
        }
        float _2480 = _2476;
        if (_2474)
        {
            float _2482 = _423 * _2480;
            _2460 = _2482;
        }
        float _2484 = _2460;
        float _2486 = _2484;
        if (_2474)
        {
            float _2488 = _425 * _2480;
            _2172 = _2488;
        }
        float _2490 = _2172;
        float _2492 = _2490;
        if (_2474)
        {
            float _2494 = _427 * _2480;
            _2462 = _2494;
        }
        float _2496 = _2462;
        float _2498 = _2496;
        float _2500 = _2496;
        if (!_2474)
        {
            bool _2502 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2506 = _2502 || _2504;
            bool _2508 = isnan(1.0);
            bool _2510 = _2506 || _2508;
            float _2512 = _123 + 1.0;
            float _2514 = _2512;
            if (!_2510)
            {
                float _2516 = _2512 * _2512;
                float _2518 = _2516 * 0.5;
                _2498 = _2518;
            }
            float _2520 = _2498;
            float _2522 = _2520;
            if (!_2510)
            {
                float _2524 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2522 = _2524;
            }
            float _2526 = _2522;
            bool _2528 = !_2510;
            float _2530 = _2526;
            if (!_2528)
            {
                float _2532 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2534 = log2(_2532);
                float _2536 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2538 = 1.0 + _2536;
                float _2540 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2542 = _2534 * _2512;
                float _2544 = 1.0 / _2538;
                float _2546 = _2540 * 0.693147182464599609375;
                float _2548 = exp2(_2542);
                float _2550 = 1.0 / _2546;
                float _2552 = _2548 + (-1.0);
                float _2554 = -_2552;
                float _2556 = fma(_2554, _2550, _2512);
                float _2558 = _2556 * _2544;
                float _2560 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2530 = _2560;
            }
            float _2562 = _2530;
            float _2564 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2566 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2568 = !_2510;
            if (!_2568)
            {
                float _2570 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2572 = log2(_2570);
                float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2576 = 1.0 + _2574;
                float _2578 = 1.0 / _2576;
                float _2580 = _2572 * _2512;
                float _2582 = exp2(_2580);
                float _2584 = -_2582;
                float _2586 = _2584 + 1.0;
                float _2588 = _2586 * _2578;
                _2514 = _2588;
            }
            float _2590 = _2514;
            float _2592 = fma(_2590, _161, _2566);
            float _2594 = fma(_2590, _159, _2564);
            float _2596 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2598 = -_383;
            float _2600 = _2598 + _2592;
            float _2602 = -_391;
            float _2604 = _2602 + _2594;
            float _2606 = fma(_2590, _163, _2596);
            float _2608 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2610 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2612 = _2600 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2614 = -_397;
            float _2616 = _2614 + _2606;
            float _2618 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2608);
            float _2620 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2610);
            float _2622 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2612);
            float _2624 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2618);
            float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2620);
            float _2628 = fma(_2616, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2622);
            _431 = _2626;
            _433 = _2624;
            _435 = _2628;
            _2486 = _2624;
            _2492 = _2626;
            _2500 = _2628;
        }
        float _2630 = _431;
        float _2632 = _433;
        float _2634 = _435;
        float _2636 = _2486;
        float _2638 = _2492;
        float _2640 = _2500;
        float _2642 = _2630 * _2630;
        float _2644 = fma(_2632, _2632, _2642);
        float _2646 = fma(_2634, _2634, _2644);
        float _2648 = rsqrt(_2428);
        float _2650 = sqrt(_2646);
        float _2652 = _2394 * _2648;
        float _2654 = _2386 * _2648;
        float _2656 = _2414 * _2648;
        bool _2658 = _2650 > 0.0;
        bool _2660 = !_2658;
        _437 = _2646;
        _125 = _2654;
        _439 = _2652;
        _2470 = _2636;
        if (!_2660)
        {
            float _2662 = rsqrt(_2646);
            float _2664 = _2662 * _2630;
            float _2666 = _2662 * _2632;
            float _2668 = _2662 * _2634;
            float _2670 = _2654 * _2664;
            float _2672 = fma(_2652, _2666, _2670);
            float _2674 = fma(_2656, _2668, _2672);
            float _2676 = _2674 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2678 = fma(_2636, _2676, _2376);
            float _2680 = fma(_2638, _2676, _2374);
            float _2682 = fma(_2640, _2676, _2378);
            _2464 = _2680;
            _2466 = _2682;
            _2468 = _2678;
            _125 = _2670;
        }
    }
    float _2684 = _2464;
    float _2686 = _2466;
    float _2688 = _2468;
    float _2690 = _437;
    float _2692 = _125;
    float _2694 = _439;
    float _2696 = _2470;
    float _2698 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2708 = _2704 || _2706;
    float _2710 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2698);
    float _2712 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2714 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2716 = isnan(0.5);
    bool _2718 = _2714 || _2716;
    bool _2720 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2722 = _2718 || _2720;
    float _2724 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2710);
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2728 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2712);
    float _2730 = 1.0 / _2726;
    float _2732 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2728);
    float _2734 = _2692;
    float _2736 = _2690;
    float _2738 = _2694;
    float _2740 = _2696;
    if (_2708)
    {
        _2734 = _2684;
    }
    float _2742 = _2734;
    float _2744 = _2742;
    if (_2722)
    {
        _2472 = 1.0;
    }
    float _2746 = _2472;
    float _2748 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2750 = _2748 + _2726;
    float _2752 = _2750 * _2730;
    float _2754 = _2752 * 0.5;
    float _2756 = _2730;
    float _2758 = _2754;
    float _2760 = _2746;
    if (_2708)
    {
        _2756 = _2686;
    }
    float _2762 = _2756;
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2766 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2764);
    float _2768 = _2762;
    if (_2708)
    {
        _2758 = _2688;
    }
    float _2770 = _2758;
    float _2772 = 1.0 / _2766;
    float _2774 = _2770;
    if (!_2708)
    {
        float _2776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2778 = _2288 + _2776;
        float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2782 = _2180 + _2780;
        float _2784 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2786 = -_2180;
        float _2788 = _2786 + _2688;
        float _2790 = _2778 * _2778;
        float _2792 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2794 = _2152 + _2792;
        float _2796 = -_2152;
        float _2798 = _2796 + _2686;
        float _2800 = fma(_2782, _2782, _2790);
        float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2804 = fma(_2794, _2794, _2800);
        float _2806 = sqrt(_2804);
        float _2808 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2810 = precise::min(_2806, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2812 = _2810 * _2802;
        float _2814 = -_2288;
        float _2816 = _2814 + _2684;
        float _2818 = _2808 * _2812;
        float _2820 = fma(_2788, _2818, _2180);
        float _2822 = fma(_2816, _2818, _2288);
        float _2824 = fma(_2798, _2818, _2152);
        _2744 = _2822;
        _2774 = _2820;
        _2768 = _2824;
    }
    float _2826 = _2744;
    float _2828 = _2774;
    float _2830 = _2768;
    if (_2722)
    {
        _2224 = 1.0;
    }
    float _2832 = _2224;
    float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2836 = _2772 * _2834;
    float _2838 = _2832;
    if (!_2722)
    {
        float _2840 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2842 = _2840 * 0.15915493667125701904296875;
        float _2844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2846 = _2842 * 6.283185482025146484375;
        float _2848 = cos(_2846);
        float _2850 = _2844 * 0.15915493667125701904296875;
        float _2852 = _2842 * 6.283185482025146484375;
        float _2854 = sin(_2852);
        float _2856 = 1.0 / _2848;
        float _2858 = _2850 * 6.283185482025146484375;
        float _2860 = cos(_2858);
        float _2862 = _2854 * _2856;
        float _2864 = _2850 * 6.283185482025146484375;
        float _2866 = sin(_2864);
        float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2870 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2868;
        float _2872 = _2860 * _2862;
        float _2874 = 1.0 / _2870;
        float _2876 = 1.0 / _2872;
        float _2878 = _2866 * _2876;
        float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2882 = fma(_2836, _2878, _2880);
        float _2884 = _2882 * _2874;
        float _2886 = precise::clamp(_2884, 0.0, 1.0);
        _2736 = _2874;
        _2738 = _2842;
        _2760 = _2886;
    }
    float _2888 = _2736;
    float _2890 = _2738;
    float _2892 = _2760;
    float _2894 = _2888;
    float _2896 = _2890;
    if (!_2722)
    {
        float _2898 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2900 = _2898 * 0.15915493667125701904296875;
        float _2902 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2904 = _2900 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = _2902 * 0.15915493667125701904296875;
        float _2910 = _2900 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        float _2914 = 1.0 / _2906;
        float _2916 = _2908 * 6.283185482025146484375;
        float _2918 = cos(_2916);
        float _2920 = _2912 * _2914;
        float _2922 = _2908 * 6.283185482025146484375;
        float _2924 = sin(_2922);
        float _2926 = _2918 * _2920;
        float _2928 = 1.0 / _2926;
        float _2930 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2932 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2930;
        float _2934 = 1.0 / _2932;
        float _2936 = _2924 * _2928;
        float _2938 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2940 = fma(_2836, _2936, _2938);
        float _2942 = _2940 * _2934;
        float _2944 = precise::clamp(_2942, 0.0, 1.0);
        float _2946 = -_2944;
        float _2948 = _2946 + 1.0;
        _2894 = _2928;
        _2896 = _2926;
        _2838 = _2948;
    }
    float _2950 = _2894;
    float _2952 = _2896;
    float _2954 = _2838;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2958 = _2826 + _2956;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2962 = _2828 + _2960;
    float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2966 = _2830 + _2964;
    float _2968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2970 = _2958 * _2958;
    float _2972 = fma(_2962, _2962, _2970);
    float _2974 = fma(_2966, _2966, _2972);
    float _2976 = rsqrt(_2974);
    float _2978 = sqrt(_2974);
    float _2980 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2982 = _2962 * _2980;
    float _2984 = _2966 * _2980;
    float _2986 = _2982 * _2982;
    float _2988 = _2984 * _2984;
    float _2990 = _2986 + _2988;
    float _2992 = sqrt(_2990);
    bool _2994 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2998 = _2992 + _2996;
    float _3000 = _2966;
    float _3002 = _2970;
    float _3004 = _2998;
    float _3006 = _2950;
    float _3008 = _2980;
    if (_2994)
    {
        float _3010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3000 = _3010;
    }
    float _3012 = _3000;
    if (_2994)
    {
        float _3014 = rsqrt(_2990);
        _3002 = _3014;
    }
    float _3016 = _3002;
    float _3018 = _3016;
    if (_2994)
    {
        float _3020 = _2998 * _3012;
        _3004 = _3020;
    }
    float _3022 = _3004;
    if (_2994)
    {
        float _3024 = _3022 * 0.15915493667125701904296875;
        _3006 = _3024;
    }
    float _3026 = _3006;
    float _3028 = _2976;
    float _3030 = _3026;
    if (_2994)
    {
        float _3032 = _3026 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        _3028 = _3034;
    }
    float _3036 = _3028;
    float _3038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3040 = precise::max(0.0, _3038);
    float _3042 = _2952;
    float _3044 = _3040;
    float _3046 = _3038;
    if (_2994)
    {
        float _3048 = _3026 * 6.283185482025146484375;
        float _3050 = cos(_3048);
        _3042 = _3050;
    }
    float _3052 = _3042;
    float _3054 = -_2980;
    float _3056 = -_3040;
    float _3058 = fma(_2958, _3054, _3056);
    if (_2994)
    {
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3044 = _3060;
    }
    float _3062 = _3044;
    float _3064 = _3062;
    if (!_2994)
    {
        _3030 = _2986;
    }
    float _3066 = _3030;
    float _3068 = _3036;
    float _3070 = _3066;
    if (_2994)
    {
        float _3072 = fma(_3036, _3062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3068 = _3072;
    }
    float _3074 = _3068;
    float _3076 = _3074;
    if (!_2994)
    {
        _3064 = _2984;
    }
    float _3078 = _3064;
    float _3080 = _3078;
    if (_2994)
    {
        float _3082 = _3052 + (-1.0);
        _3046 = _3082;
    }
    float _3084 = _3046;
    float _3086 = _3084;
    if (_2994)
    {
        float _3088 = _3016 * _3074;
        _2740 = _3088;
    }
    float _3090 = _2740;
    if (!_2994)
    {
        _3018 = _2982;
    }
    float _3092 = _3018;
    float _3094 = _3092;
    if (_2994)
    {
        float _3096 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3008 = _3096;
    }
    float _3098 = _3008;
    if (_2994)
    {
        float _3100 = _2982 * _3090;
        _3094 = _3100;
    }
    float _3102 = _3094;
    if (!_2994)
    {
        _3076 = _3058;
    }
    float _3104 = _3076;
    float _3106 = _3104;
    if (_2994)
    {
        float _3108 = _2984 * _3090;
        _3080 = _3108;
    }
    float _3110 = _3080;
    if (_2994)
    {
        float _3112 = fma(_3058, _3052, _3098);
        _3106 = _3112;
    }
    float _3114 = _3106;
    if (_2994)
    {
        float _3116 = _3102 * _3102;
        _3070 = _3116;
    }
    float _3118 = _3070;
    if (!_2994)
    {
        _3086 = _2988;
    }
    float _3120 = _3086;
    float _3122 = _3120;
    if (_2994)
    {
        float _3124 = _3110 * _3110;
        _3122 = _3124;
    }
    float _3126 = _3122;
    float _3128 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3130 = fma(_3114, _3114, _3118);
    float _3132 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3134 = _3130 + _3126;
    float _3136 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3128);
    float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3140 = fma(_2978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3138);
    float _3142 = precise::clamp(_3140, 0.0, 1.0);
    float _3144 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3146 = rsqrt(_3134);
    float _3148 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3136);
    float _3150 = -_3142;
    float _3152 = _3150 + 1.0;
    float _3154 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3144);
    float _3156 = _2826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3158 = _3148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3160 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3132);
    float _3162 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3154);
    float _3164 = abs(_3152);
    float _3166 = log2(_3164);
    float _3168 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3170 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3160);
    float _3172 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3174 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3156);
    float _3176 = -_3168;
    float _3178 = fma(_3176, _2968, 1.0);
    float _3180 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3182 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3184 = _3146 * _3102;
    float _3186 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3174);
    float _3188 = _3146 * _3114;
    float _3190 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3182);
    float _3192 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3194 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3196 = _3146 * _3110;
    float _3198 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3190);
    float _3200 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3202 = -_3192;
    float _3204 = fma(_3188, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3202);
    float _3206 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3208 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3198);
    float _3210 = log2(_3178);
    float _3212 = -_3196;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3204);
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3218 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3206);
    float _3220 = fma(_3214, -0.5, 0.5);
    float _3222 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3216);
    float _3224 = fma(_3214, 0.5, 0.5);
    float _3226 = exp2(_3200);
    float _3228 = _3188 + 1.0;
    float _3230 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3218);
    float _3232 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3222);
    float _3234 = fma(_3224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3236 = 1.0 / _3208;
    float _3238 = fma(_3224, _3234, -0.212114393711090087890625);
    float _3240 = _3210 * 0.693147182464599609375;
    float _3242 = fma(_3224, _3238, 1.570728778839111328125);
    float _3244 = sqrt(_3220);
    float _3246 = -_3188;
    float _3248 = fma(_3226, _3228, _3246);
    float _3250 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3230);
    float _3252 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3232);
    float _3254 = fma(_3248, 0.5, 0.5);
    float _3256 = _3250 * _3236;
    float _3258 = _3252 * _3236;
    float _3260 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3262 = fma(_3256, 0.5, 0.5);
    float _3264 = fma(_3258, -0.5, 0.5);
    float _3266 = _3244 * 0.636619746685028076171875;
    float3 _8194 = float3(_3262, _3264, _3260);
    float _3268 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8194, float3(0.0), isnan(_8194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8194, float3(0.0), isnan(_8194)), level(0.0)).x;
    float _3270 = -_3242;
    float _3272 = fma(_3266, _3270, 1.0);
    float3 _8210 = float3(_3262, _3264, _3260);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8210, float3(0.0), isnan(_8210)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8210, float3(0.0), isnan(_8210)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    float2 _8227 = float2(_3272, _3254);
    float3 _3287 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8227, float2(0.0), isnan(_8227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8227, float2(0.0), isnan(_8227)), level(0.0)).xyz;
    float _3289 = _3287.x;
    float _3291 = _3287.y;
    float _3293 = _3287.z;
    float _3295 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3297 = _2892 * _2954;
    bool _3299 = _2892 > 0.0;
    bool _3301 = isnan(_2892);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan(0.0);
    bool _3307 = _3303 || _3305;
    float _3309 = fma(_3180, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3295);
    float _3311 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3313 = _2954 <= 0.0;
    bool _3315 = !_3307;
    bool _3317 = _3313 || _3315;
    float _3319 = _3208 * 0.5;
    float _3321 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3309);
    float _3323 = exp2(_3311);
    float _3325 = fma(_3194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3321);
    float _3327 = _3297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3329 = _3250 + _3208;
    float _3331 = _3325 + _3208;
    float _3333 = fma(_3252, -0.5, _3319);
    out.gl_Position.x = _3250;
    out.gl_Position.y = _3252;
    out.gl_Position.z = _3325;
    out.gl_Position.w = _3208;
    float _3335 = _3329 * 0.5;
    float _3337 = _3331 * 0.5;
    float _3339 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _3335;
    out.m_68.y = _3333;
    out.m_68.z = _3337;
    out.m_68.w = _3208;
    float _3341 = -_3323;
    float _3343 = _3341 + 1.0;
    out.m_45.x = _3339;
    float _3345 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3347 = -_3345;
    float _3349 = _3347 + 1.0;
    float _3351 = _3345 * _3268;
    float _3353 = _3283 * _3351;
    float _3355 = _3283 * _3349;
    float _3357 = _3293 * _3351;
    float _3359 = fma(_3289, _3353, _3277);
    float _3361 = fma(_3291, _3353, _3279);
    float _3363 = fma(_3283, _3357, _3281);
    out.m_70.x = _3359;
    out.m_70.y = _3361;
    out.m_70.z = _3363;
    out.m_70.w = _3355;
    if (!_3317)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3365 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3365;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

