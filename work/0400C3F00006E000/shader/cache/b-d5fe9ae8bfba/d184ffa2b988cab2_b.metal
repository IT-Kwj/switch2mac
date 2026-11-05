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
    float4 m_55 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1499 = false;
    bool _1035 = false;
    bool _761 = false;
    bool _651 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_101);
        out.gl_Position.z = _2175;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2243 = as_type<float>(_137);
        out.gl_Position.z = _2243;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _143 * _141;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _169 = _167 * 6.283185482025146484375;
    float _171 = floor(_167);
    float _173 = _169 * 0.15915493667125701904296875;
    float _175 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = 0.0;
    float _179 = _175;
    if (!_153)
    {
        float _181 = _175 * _175;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = _185;
    if (!_153)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = -_171;
    float _199 = _167 + _197;
    bool _201 = !_153;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _175 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _175);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _175 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = fma(_189, 0.5, 0.5);
    float _273 = in.m_44.x;
    float _275 = in.m_44.y;
    float _277 = in.m_44.z;
    bool _279 = _199 < 0.5;
    float _281 = float(_279);
    bool _283 = !_265;
    int _285 = _283 ? 0 : 1;
    float _287 = -_199;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _291 = !_157;
    int _293 = _291 ? 0 : 1;
    float _295 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _297 = abs(_285);
    float _299 = -_281;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_271;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_259, _161, _295);
    int _309 = abs(_293);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = fma(_259, _163, _311);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = float(_297);
    float _327 = float(_309);
    float _329 = fma(_259, _165, _323);
    float _331 = abs(_289);
    float _333 = _325 * _331;
    float _335 = fma(_317, _261, _275);
    float _337 = fma(_307, _261, _273);
    float _339 = float(_321);
    float _341 = fma(_327, _305, _333);
    float _343 = fma(_329, _261, _277);
    float _345 = abs(_301);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_319;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_85);
        float _371 = 1.0 / _369;
        float _373 = _119 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _375 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _397;
    float _401 = 1.0 / _383;
    float _403 = 1.0 / _387;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _375 + _405;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = 1.0 / _395;
    float _413 = _407 * _401;
    bool _415 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _417 = isnan(_375);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _429 = isnan(_375);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _399;
    float _441 = _379 * _403;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _445 = _375 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = _375 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = 1.0 / _391;
    float _457 = _445 * _411;
    float _459 = -_437;
    float _461 = _459 + 1.0;
    float _463 = fma(_453, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _467 = _375 + _465;
    float _469 = _467 * _439;
    bool _471 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_375);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    float _487 = _449 * _455;
    float _489 = -_425;
    float _491 = _489 + 1.0;
    bool _493 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _495 = isnan(_375);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _507 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _509 = isnan(_375);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _481 * _491;
    float _521 = -_481;
    float _523 = _521 + 1.0;
    float _525 = _503 * _461;
    float _527 = -_503;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = _437 * _523;
    bool _537 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _539 = isnan(_375);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = _517 * _529;
    float _551 = -_517;
    float _553 = _551 + 1.0;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _559 = fma(_533, _441, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _561 = -_547;
    float _563 = _561 + 1.0;
    float _565 = _547 * _553;
    float _567 = fma(_557, _441, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _573;
    float _577 = _463 * _565;
    float _579 = _505 * _565;
    float _581 = fma(_571, _487, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _583 = fma(_575, _487, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].x, _577);
    float _587 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].y, _579);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _593 = fma(_567, _549, _585);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _599 = fma(_559, _549, _587);
    float _601 = fma(_591, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _603;
    float _607 = fma(_581, _525, _593);
    float _609 = fma(_597, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _611;
    float _615 = fma(_583, _525, _599);
    float _617 = fma(_605, _469, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _619 = fma(_601, _535, _607);
    float _621 = fma(_613, _469, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _623 = fma(_609, _535, _615);
    float _625 = fma(_617, _519, _619);
    float _627 = fma(_621, _519, _623);
    float _629 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[148].x, _625);
    float _631 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[148].y, _627);
    bool _633 = !_409;
    float _649;
    if (!_633)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _637 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_85);
        float _655 = 1.0 / _653;
        float _657 = _119 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = in.m_53.x;
    float _663 = in.m_53.y;
    bool _665 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_659);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _683 = isnan(_659);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _659 + _697;
    float _701 = -_675;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _707 = 1.0 / _679;
    float _709 = _691 * _703;
    float _711 = -_691;
    float _713 = _711 + 1.0;
    float _715 = _695 * _707;
    float _717 = fma(_715, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _721 = _717 * _709;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _721);
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[116].x, _725);
    float _735 = _629 * _661;
    float _737 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _631 * _663;
    float _741 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _737;
    out.m_55.y = _731;
    out.m_55.z = _727;
    out.m_55.w = _741;
    bool _743 = !_705;
    float _759;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _747 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _759 = _757;
        _761 = true;
    }
    else
    {
        float _763 = float(_85);
        float _765 = 1.0 / _763;
        float _767 = _119 * _765;
        _759 = _767;
    }
    _761 = false;
    float _769 = _759;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _773 = _769 + _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _777 = _769 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _781 = _769 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _799 = 1.0 / _793;
    bool _801 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _803 = isnan(_769);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = 1.0 / _789;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _817 = _769 + _815;
    bool _819 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _821 = 1.0 / _797;
    float _823 = _773 * _799;
    bool _825 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _827 = isnan(_769);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = 1.0 / _785;
    float _839 = _817 * _813;
    bool _841 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _843 = isnan(_769);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    bool _853 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _855 = isnan(_769);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_851;
    float _867 = _865 + 1.0;
    float _869 = _777 * _821;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _871;
    bool _875 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _877 = isnan(_769);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _835 * _867;
    float _889 = -_835;
    float _891 = _889 + 1.0;
    float _893 = fma(_873, _823, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _899 = _781 * _837;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _901;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _905;
    float _909 = _863 * _891;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _915 = fma(_903, _823, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _917 = fma(_907, _823, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _919 = -_863;
    float _921 = _919 + 1.0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _927 = fma(_897, _869, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_913, _869, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _931 = _811 * _921;
    float _933 = -_811;
    float _935 = _933 + 1.0;
    float _937 = fma(_925, _869, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _939 = _885 * _935;
    float _941 = -_885;
    float _943 = _941 + 1.0;
    float _945 = _893 * _939;
    float _947 = _915 * _939;
    float _949 = _917 * _939;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _951;
    float _955 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _957 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _959;
    float _963 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _965;
    float _969 = fma(_953, _899, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _971 = fma(_927, _931, _955);
    float _973 = fma(_937, _931, _957);
    float _975 = fma(_961, _899, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _977 = fma(_929, _931, _963);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _987 = fma(_967, _899, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _993 = fma(_969, _909, _971);
    float _995 = fma(_981, _839, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _997 = fma(_985, _839, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _999 = fma(_975, _909, _973);
    float _1001 = fma(_991, _839, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1003 = fma(_987, _909, _977);
    float _1005 = fma(_995, _887, _993);
    float _1007 = fma(_997, _887, _999);
    float _1009 = fma(_1001, _887, _1003);
    float _1011 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1005);
    float _1013 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1007);
    float _1015 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1009);
    bool _1017 = !_819;
    float _1033;
    if (!_1017)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1021 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1025 = _1023 * _1019;
        float _1027 = floor(_1025);
        float _1029 = -_1027;
        float _1031 = _1025 + _1029;
        _1033 = _1031;
        _1035 = true;
    }
    else
    {
        float _1037 = float(_85);
        float _1039 = 1.0 / _1037;
        float _1041 = _119 * _1039;
        _1033 = _1041;
    }
    _1035 = false;
    float _1043 = _1033;
    float _1045 = as_type<float>(int(gl_VertexIndex));
    bool _1047 = _139 > 0.5;
    float _1049 = _347 * _735;
    float _1051 = _347 * _739;
    float _1053 = in.m_51.y;
    float _1055 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1057 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1059 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1061 = _1049 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1055);
    float _1065 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1057);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1069 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1059);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1075 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1069);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1081 = 1.0 / _1073;
    bool _1083 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1085 = isnan(_1043);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    int _1095 = as_type<int>(_1045) & 1;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>(_1045) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1065);
    float _1105 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1063);
    bool _1107 = _1053 > 0.5;
    float _1109 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1111 = !_1101;
    float _1113 = _1111 ? (-0.5) : 0.5;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1119 = !_1097;
    float _1121 = _1119 ? (-0.5) : 0.5;
    float _1123 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1127 = _1125 != 0;
    float _1129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1113);
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1133 = _1131 != 0;
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1121);
    float _1137 = 1.0 / _1117;
    float _1139 = _1067 * _1129;
    float _1141 = _1061 * _1135;
    bool _1143 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1145 = isnan(_1043);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1157 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1159;
    float _1163 = 1.0 / _1079;
    float _1165 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1155);
    float _1167 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1157);
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1171 = _1043 + _1169;
    bool _1173 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1175 = isnan(_1043);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1165);
    float _1187 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1167);
    float _1189 = _1103 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1191 = _1075 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1195 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1201 = _1161 * _1081;
    float _1203 = _1189 + _1193;
    float _1205 = _1191 + _1195;
    bool _1207 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1209 = isnan(_1043);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = _1199 * _1163;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1223 = _1203 + _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1227 = _1205 + _1225;
    float _1229 = -_1217;
    float _1231 = _1229 + 1.0;
    float _1233 = _1223 * _1223;
    float _1235 = _1227 * _1227;
    float _1237 = -_1153;
    float _1239 = _1237 + 1.0;
    float _1241 = _1093 * _1231;
    float _1243 = -_1093;
    float _1245 = _1243 + 1.0;
    float _1247 = _1233 + _1235;
    float _1249 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1251 = fma(_1201, _1171, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1253 = _1153 * _1245;
    float _1255 = sqrt(_1247);
    float _1257 = _1183 * _1239;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1259;
    float _1263 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1249);
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1267 = _1043 + _1265;
    float _1269 = _1251 * _1257;
    float _1271 = -_1183;
    float _1273 = _1271 + 1.0;
    float _1275 = _1261 * _1137;
    float _1277 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1263);
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1281 = fma(_1219, _1267, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1269);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1289 = _1043 + _1287;
    float _1291 = -_1121;
    float _1293 = _1047 ? _1291 : _1121;
    float _1295 = fma(_1281, _1253, _1283);
    bool _1297 = _1255 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1123 + _1285;
    float _1301 = -_1113;
    float _1303 = _1107 ? _1301 : _1113;
    float _1305 = fma(_1275, _1289, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1307 = !_1127;
    float _1309 = _1307 ? _1121 : _1293;
    bool _1311 = !_1133;
    float _1313 = _1311 ? _1113 : _1303;
    float _1315 = _1303;
    float _1317 = _1293;
    float _1319 = _1121;
    float _1321 = _1113;
    float _1323 = _1043;
    float _1325 = _1217;
    float _1327 = _1191;
    if (!_1297)
    {
        _1315 = _1235;
    }
    float _1329 = _1315;
    float _1331 = _1329;
    if (!_1297)
    {
        _1317 = _1233;
    }
    float _1333 = _1317;
    float _1335 = _1333;
    if (!_1297)
    {
        _1319 = _1203;
    }
    float _1337 = _1319;
    float _1339 = _1337;
    if (!_1297)
    {
        _1321 = _1205;
    }
    float _1341 = _1321;
    float _1343 = _1341;
    if (!_1297)
    {
        _1323 = _1299;
    }
    float _1345 = _1323;
    bool _1347 = !_1297;
    float _1349 = _1345;
    if (!_1347)
    {
        float _1351 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1355 = _1255 + _1353;
        float _1357 = _1299 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = rsqrt(_1247);
        float _1361 = _1355 * _1351;
        float _1363 = _1361 * 0.15915493667125701904296875;
        float _1365 = _1363 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1363 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = fma(_1367, _1357, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1375 = _1359 * _1373;
        float _1377 = _1371 + (-1.0);
        float _1379 = fma(_1223, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1381 = fma(_1227, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1383 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1387 = _1379 + _1385;
        float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1391 = _1381 + _1389;
        float _1393 = fma(_1299, _1371, _1383);
        float _1395 = _1387 * _1387;
        float _1397 = _1391 * _1391;
        _1349 = _1393;
        _1335 = _1395;
        _1331 = _1397;
        _1339 = _1379;
        _1343 = _1381;
    }
    float _1399 = _1349;
    float _1401 = _1335;
    float _1403 = _1331;
    float _1405 = _1339;
    float _1407 = _1343;
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1411 = _1399 + _1409;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1415 = _1309 + 0.5;
    float _1417 = fma(_1305, _1241, _1295);
    float _1419 = fma(_1411, _1411, _1401);
    float _1421 = -_1313;
    float _1423 = _1421 + 0.5;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1427 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1417);
    float _1429 = _1419 + _1403;
    float _1431 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1435 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1437 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1439 = _1425 * _1279;
    float _1441 = sqrt(_1429);
    float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1433 * _1413;
    float _1449 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.x = _1439;
    out.m_60.y = _1447;
    out.m_62.x = _1443;
    out.m_62.y = _1445;
    out.m_62.z = _1449;
    out.m_62.w = _1451;
    bool _1453 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1455 = isnan(_1441);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1461 = _1457 || _1459;
    float _1463 = _1445;
    if (!_1461)
    {
        _1325 = 1.0;
    }
    float _1465 = _1325;
    bool _1467 = !_1461;
    float _1469 = _1465;
    if (!_1467)
    {
        bool _1471 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1473 = isnan(_1441);
        bool _1475 = _1471 || _1473;
        bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1479 = _1475 || _1477;
        if (!_1479)
        {
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = _1441 + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1487 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1485;
            float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1493 = 1.0 / _1487;
            float _1495 = _1483 * _1493;
            float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1469 = _1497;
            _1499 = true;
        }
        else
        {
            bool _1501 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1503 = isnan(_1441);
            bool _1505 = _1501 || _1503;
            bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1509 = _1505 || _1507;
            if (!_1509)
            {
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1441 + _1511;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1523 = 1.0 / _1517;
                float _1525 = _1513 * _1523;
                float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1469 = _1527;
                _1499 = true;
            }
            else
            {
                _1469 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1499 = false;
    float _1529 = _1469;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1533 = _1405 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1537 = _1399 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1541 = _1407 + _1539;
    bool _1543 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    float _1553 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1555 = fma(_1537, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1557 = fma(_1541, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1559 = _1541;
    float _1561 = _1533;
    float _1563 = _1529;
    float _1565 = _1555;
    float _1567 = _1537;
    if (_1551)
    {
        _1559 = _1553;
    }
    float _1569 = _1559;
    float _1571 = _1569;
    if (_1551)
    {
        _1561 = _1555;
    }
    float _1573 = _1561;
    float _1575 = _1573;
    if (_1551)
    {
        _1563 = _1557;
    }
    float _1577 = _1563;
    float _1579 = _1577;
    if (!_1551)
    {
        float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1583 = _1123 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1587 = _1189 + _1585;
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1591 = -_1191;
        float _1593 = _1591 + _1557;
        float _1595 = _1583 * _1583;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1599 = _1191 + _1597;
        float _1601 = fma(_1587, _1587, _1595);
        float _1603 = fma(_1599, _1599, _1601);
        float _1605 = -_1189;
        float _1607 = _1605 + _1553;
        float _1609 = -_1123;
        float _1611 = _1609 + _1555;
        float _1613 = sqrt(_1603);
        float _1615 = precise::min(_1613, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1617 = _1615 * _1589;
        float _1619 = fma(_1607, _1617, _1189);
        float _1621 = fma(_1611, _1617, _1123);
        float _1623 = fma(_1593, _1617, _1191);
        _1575 = _1621;
        _1571 = _1619;
        _1579 = _1623;
    }
    float _1625 = _1575;
    float _1627 = _1571;
    float _1629 = _1579;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1633 = _1625 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1637 = _1627 + _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1641 = _1629 + _1639;
    float _1643 = _1633 * _1633;
    float _1645 = fma(_1637, _1637, _1643);
    float _1647 = fma(_1641, _1641, _1645);
    float _1649 = rsqrt(_1647);
    float _1651 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1653 = _1637 * _1651;
    float _1655 = _1641 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 * _1655;
    float _1661 = _1657 + _1659;
    float _1663 = sqrt(_1661);
    bool _1665 = _1663 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1669 = _1663 + _1667;
    float _1671 = _1641;
    float _1673 = _1669;
    float _1675 = _1633;
    if (_1665)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1677;
    }
    float _1679 = _1671;
    if (_1665)
    {
        float _1681 = rsqrt(_1661);
        _1565 = _1681;
    }
    float _1683 = _1565;
    float _1685 = _1683;
    if (_1665)
    {
        float _1687 = _1669 * _1679;
        _1673 = _1687;
    }
    float _1689 = _1673;
    if (_1665)
    {
        float _1691 = _1689 * 0.15915493667125701904296875;
        _1567 = _1691;
    }
    float _1693 = _1567;
    float _1695 = _1649;
    if (_1665)
    {
        float _1697 = _1693 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1643;
    float _1709 = _1705;
    float _1711 = _1703;
    if (_1665)
    {
        float _1713 = _1693 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = -_1651;
    float _1721 = -_1705;
    float _1723 = fma(_1633, _1719, _1721);
    if (!_1665)
    {
        _1675 = _1655;
    }
    float _1725 = _1675;
    float _1727 = _1725;
    if (_1665)
    {
        float _1729 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1729;
    }
    float _1731 = _1709;
    float _1733 = sqrt(_1647);
    float _1735 = _1731;
    float _1737 = _1701;
    if (_1665)
    {
        float _1739 = fma(_1701, _1731, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1739;
    }
    float _1741 = _1735;
    float _1743 = _1741;
    if (!_1665)
    {
        _1737 = _1653;
    }
    float _1745 = _1737;
    float _1747 = _1745;
    float _1749 = _1717;
    if (_1665)
    {
        float _1751 = _1717 + (-1.0);
        _1711 = _1751;
    }
    float _1753 = _1711;
    float _1755 = _1753;
    if (_1665)
    {
        float _1757 = _1683 * _1741;
        _1463 = _1757;
    }
    float _1759 = _1463;
    if (!_1665)
    {
        _1743 = _1723;
    }
    float _1761 = _1743;
    float _1763 = _1761;
    if (_1665)
    {
        float _1765 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1685 = _1765;
    }
    float _1767 = _1685;
    if (_1665)
    {
        float _1769 = _1653 * _1759;
        _1747 = _1769;
    }
    float _1771 = _1747;
    if (!_1665)
    {
        _1755 = _1657;
    }
    float _1773 = _1755;
    float _1775 = _1773;
    if (_1665)
    {
        float _1777 = _1655 * _1759;
        _1727 = _1777;
    }
    float _1779 = _1727;
    if (_1665)
    {
        float _1781 = fma(_1723, _1717, _1767);
        _1763 = _1781;
    }
    float _1783 = _1763;
    if (_1665)
    {
        float _1785 = _1771 * _1771;
        _1775 = _1785;
    }
    float _1787 = _1775;
    if (!_1665)
    {
        _1749 = _1659;
    }
    float _1789 = _1749;
    float _1791 = _1789;
    if (_1665)
    {
        float _1793 = _1779 * _1779;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1783, _1783, _1787);
    float _1799 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1797 + _1795;
    float _1803 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1813 = rsqrt(_1801);
    float _1815 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1803);
    float _1817 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1819 = -_1809;
    float _1821 = _1819 + 1.0;
    float _1823 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1825 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1815);
    float _1827 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1817);
    float _1829 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1823);
    float _1831 = abs(_1821);
    float _1833 = log2(_1831);
    float _1835 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1827);
    float _1839 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1841 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1829);
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1845 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1847 = _1813 * _1771;
    float _1849 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1851 = -_1843;
    float _1853 = fma(_1851, _1811, 1.0);
    float _1855 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1857 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1859 = _1813 * _1783;
    float _1861 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1863 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1865 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1857);
    float _1867 = _1813 * _1779;
    float _1869 = -_1861;
    float _1871 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1869);
    float _1873 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1875 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1865);
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1879 = -_1867;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1871);
    float _1883 = exp2(_1873);
    float _1885 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1875);
    float _1887 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1889 = fma(_1881, -0.5, 0.5);
    float _1891 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1877);
    float _1893 = fma(_1881, 0.5, 0.5);
    float _1895 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1887);
    float _1897 = _1859 + 1.0;
    float _1899 = log2(_1853);
    float _1901 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1891);
    float _1903 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1895);
    float _1905 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1907 = fma(_1893, _1905, -0.212114393711090087890625);
    float _1909 = 1.0 / _1885;
    float _1911 = -_1859;
    float _1913 = fma(_1883, _1897, _1911);
    float _1915 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1901);
    float _1917 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1903);
    float _1919 = fma(_1893, _1907, 1.570728778839111328125);
    float _1921 = fma(_1913, 0.5, 0.5);
    float _1923 = sqrt(_1889);
    float _1925 = _1899 * 0.693147182464599609375;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1929 = _1915 * _1909;
    float _1931 = _1917 * _1909;
    float _1933 = fma(_1929, 0.5, 0.5);
    float _1935 = fma(_1931, -0.5, 0.5);
    float _1937 = _1923 * 0.636619746685028076171875;
    float3 _5148 = float3(_1933, _1935, _1927);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5148, float3(0.0), isnan(_5148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5148, float3(0.0), isnan(_5148)), level(0.0)).x;
    float _1941 = -_1919;
    float _1943 = fma(_1937, _1941, 1.0);
    float3 _5164 = float3(_1933, _1935, _1927);
    float4 _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5164, float3(0.0), isnan(_5164)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5164, float3(0.0), isnan(_5164)), level(0.0)).xyzw;
    float _1948 = _1946.x;
    float _1950 = _1946.y;
    float _1952 = _1946.z;
    float _1954 = _1946.w;
    float2 _5181 = float2(_1943, _1921);
    float3 _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5181, float2(0.0), isnan(_5181)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5181, float2(0.0), isnan(_5181)), level(0.0)).xyz;
    float _1960 = _1958.x;
    float _1962 = _1958.y;
    float _1964 = _1958.z;
    float _1966 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1968 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1966);
    float _1970 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1972 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1968);
    float _1974 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1970);
    bool _1976 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.5);
    bool _1984 = _1980 || _1982;
    float _1986 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1988 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1974);
    float _1990 = 1.0 / _1986;
    float _1992 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1994 = _1992 + _1986;
    float _1996 = _1933;
    float _1998 = _1833;
    if (!_1984)
    {
        _1327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2000 = _1327;
    float _2002 = _2000;
    if (!_1984)
    {
        _1996 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2004 = _1996;
    float _2006 = _1994 * _1990;
    float _2008 = _2006 * 0.5;
    float _2010 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2014 = _2008;
    float _2016 = _2010;
    if (_1984)
    {
        _1998 = 1.0;
    }
    float _2018 = _1998;
    float _2020 = _2018;
    if (!_1984)
    {
        float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2024 = fma(_2008, _2000, _2022);
        _2014 = _2024;
    }
    float _2026 = _2014;
    if (!_1984)
    {
        float _2028 = -_2004;
        float _2030 = _2028 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2002 = _2030;
    }
    float _2032 = _2002;
    float _2034 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2036 = exp2(_2012);
    float _2038 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2034);
    float _2040 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2038);
    float _2042 = _1885 * 0.5;
    float _2044 = _2026;
    if (!_1984)
    {
        float _2046 = 1.0 / _2026;
        _2044 = _2046;
    }
    float _2048 = _2044;
    out.gl_Position.x = _1915;
    out.gl_Position.y = _1917;
    out.gl_Position.z = _2040;
    out.gl_Position.w = _1885;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1984)
    {
        float _2052 = 1.0 / _2032;
        _2050 = _2052;
    }
    float _2054 = _2050;
    float _2056 = -_2036;
    float _2058 = _2056 + 1.0;
    float _2060 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1984)
    {
        float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2064 = -_2004;
        float _2066 = fma(_2048, _2062, _2064);
        _2016 = _2066;
    }
    float _2068 = _2016;
    float _2070 = fma(_1917, -0.5, _2042);
    float _2072 = _2040 + _1885;
    float _2074 = _2072 * 0.5;
    if (!_1984)
    {
        float _2076 = _2068 * _2054;
        float _2078 = precise::clamp(_2076, 0.0, 1.0);
        _2020 = _2078;
    }
    float _2080 = _2020;
    float _2082 = _1915 + _1885;
    float _2084 = _2080 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2086 = _2080 > 0.0;
    bool _2088 = isnan(_2080);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.0);
    bool _2094 = _2090 || _2092;
    float _2096 = -_2060;
    float _2098 = _2096 + 1.0;
    float _2100 = _2082 * 0.5;
    float _2102 = _2084 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2100;
    out.m_64.y = _2070;
    out.m_64.z = _2074;
    out.m_64.w = _1885;
    out.m_47.x = _2102;
    float _2104 = _2060 * _1939;
    float _2106 = _1954 * _2104;
    float _2108 = _1954 * _2098;
    float _2110 = _1964 * _2104;
    float _2112 = fma(_1960, _2106, _1948);
    float _2114 = fma(_1962, _2106, _1950);
    float _2116 = fma(_1954, _2110, _1952);
    out.m_66.x = _2112;
    out.m_66.y = _2114;
    out.m_66.z = _2116;
    out.m_66.w = _2108;
    if (_2094)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1499 = false;
    bool _1035 = false;
    bool _761 = false;
    bool _651 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_101);
        out.gl_Position.z = _2175;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2243 = as_type<float>(_137);
        out.gl_Position.z = _2243;
    }
    if (_131)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _143 * _141;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _169 = _167 * 6.283185482025146484375;
    float _171 = floor(_167);
    float _173 = _169 * 0.15915493667125701904296875;
    float _175 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = 0.0;
    float _179 = _175;
    if (!_153)
    {
        float _181 = _175 * _175;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = _185;
    if (!_153)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = -_171;
    float _199 = _167 + _197;
    bool _201 = !_153;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _175 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _175);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _175 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = fma(_189, 0.5, 0.5);
    float _273 = in.m_44.x;
    float _275 = in.m_44.y;
    float _277 = in.m_44.z;
    bool _279 = _199 < 0.5;
    float _281 = float(_279);
    bool _283 = !_265;
    int _285 = _283 ? 0 : 1;
    float _287 = -_199;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _291 = !_157;
    int _293 = _291 ? 0 : 1;
    float _295 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _297 = abs(_285);
    float _299 = -_281;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_271;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_259, _161, _295);
    int _309 = abs(_293);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = fma(_259, _163, _311);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = float(_297);
    float _327 = float(_309);
    float _329 = fma(_259, _165, _323);
    float _331 = abs(_289);
    float _333 = _325 * _331;
    float _335 = fma(_317, _261, _275);
    float _337 = fma(_307, _261, _273);
    float _339 = float(_321);
    float _341 = fma(_327, _305, _333);
    float _343 = fma(_329, _261, _277);
    float _345 = abs(_301);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_319;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_85);
        float _371 = 1.0 / _369;
        float _373 = _119 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _375 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _397;
    float _401 = 1.0 / _383;
    float _403 = 1.0 / _387;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _375 + _405;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = 1.0 / _395;
    float _413 = _407 * _401;
    bool _415 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _417 = isnan(_375);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _429 = isnan(_375);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _399;
    float _441 = _379 * _403;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _445 = _375 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = _375 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = 1.0 / _391;
    float _457 = _445 * _411;
    float _459 = -_437;
    float _461 = _459 + 1.0;
    float _463 = fma(_453, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _467 = _375 + _465;
    float _469 = _467 * _439;
    bool _471 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_375);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    float _487 = _449 * _455;
    float _489 = -_425;
    float _491 = _489 + 1.0;
    bool _493 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _495 = isnan(_375);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _507 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _509 = isnan(_375);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _481 * _491;
    float _521 = -_481;
    float _523 = _521 + 1.0;
    float _525 = _503 * _461;
    float _527 = -_503;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = _437 * _523;
    bool _537 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _539 = isnan(_375);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = _517 * _529;
    float _551 = -_517;
    float _553 = _551 + 1.0;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _559 = fma(_533, _441, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _561 = -_547;
    float _563 = _561 + 1.0;
    float _565 = _547 * _553;
    float _567 = fma(_557, _441, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _573;
    float _577 = _463 * _565;
    float _579 = _505 * _565;
    float _581 = fma(_571, _487, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _583 = fma(_575, _487, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].x, _577);
    float _587 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].y, _579);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _593 = fma(_567, _549, _585);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _599 = fma(_559, _549, _587);
    float _601 = fma(_591, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _603;
    float _607 = fma(_581, _525, _593);
    float _609 = fma(_597, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _611;
    float _615 = fma(_583, _525, _599);
    float _617 = fma(_605, _469, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _619 = fma(_601, _535, _607);
    float _621 = fma(_613, _469, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _623 = fma(_609, _535, _615);
    float _625 = fma(_617, _519, _619);
    float _627 = fma(_621, _519, _623);
    float _629 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[148].x, _625);
    float _631 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[148].y, _627);
    bool _633 = !_409;
    float _649;
    if (!_633)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _637 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_85);
        float _655 = 1.0 / _653;
        float _657 = _119 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = in.m_53.x;
    float _663 = in.m_53.y;
    bool _665 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_659);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _683 = isnan(_659);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _659 + _697;
    float _701 = -_675;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _707 = 1.0 / _679;
    float _709 = _691 * _703;
    float _711 = -_691;
    float _713 = _711 + 1.0;
    float _715 = _695 * _707;
    float _717 = fma(_715, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _721 = _717 * _709;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _721);
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[116].x, _725);
    float _735 = _629 * _661;
    float _737 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _631 * _663;
    float _741 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _737;
    out.m_55.y = _731;
    out.m_55.z = _727;
    out.m_55.w = _741;
    bool _743 = !_705;
    float _759;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _747 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _759 = _757;
        _761 = true;
    }
    else
    {
        float _763 = float(_85);
        float _765 = 1.0 / _763;
        float _767 = _119 * _765;
        _759 = _767;
    }
    _761 = false;
    float _769 = _759;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _773 = _769 + _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _777 = _769 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _781 = _769 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _799 = 1.0 / _793;
    bool _801 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _803 = isnan(_769);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = 1.0 / _789;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _817 = _769 + _815;
    bool _819 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _821 = 1.0 / _797;
    float _823 = _773 * _799;
    bool _825 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _827 = isnan(_769);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = 1.0 / _785;
    float _839 = _817 * _813;
    bool _841 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _843 = isnan(_769);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    bool _853 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _855 = isnan(_769);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_851;
    float _867 = _865 + 1.0;
    float _869 = _777 * _821;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _871;
    bool _875 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _877 = isnan(_769);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _835 * _867;
    float _889 = -_835;
    float _891 = _889 + 1.0;
    float _893 = fma(_873, _823, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _899 = _781 * _837;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _901;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _905;
    float _909 = _863 * _891;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _915 = fma(_903, _823, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _917 = fma(_907, _823, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _919 = -_863;
    float _921 = _919 + 1.0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _927 = fma(_897, _869, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_913, _869, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _931 = _811 * _921;
    float _933 = -_811;
    float _935 = _933 + 1.0;
    float _937 = fma(_925, _869, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _939 = _885 * _935;
    float _941 = -_885;
    float _943 = _941 + 1.0;
    float _945 = _893 * _939;
    float _947 = _915 * _939;
    float _949 = _917 * _939;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _951;
    float _955 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _957 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _959;
    float _963 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _965;
    float _969 = fma(_953, _899, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _971 = fma(_927, _931, _955);
    float _973 = fma(_937, _931, _957);
    float _975 = fma(_961, _899, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _977 = fma(_929, _931, _963);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _987 = fma(_967, _899, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _993 = fma(_969, _909, _971);
    float _995 = fma(_981, _839, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _997 = fma(_985, _839, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _999 = fma(_975, _909, _973);
    float _1001 = fma(_991, _839, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1003 = fma(_987, _909, _977);
    float _1005 = fma(_995, _887, _993);
    float _1007 = fma(_997, _887, _999);
    float _1009 = fma(_1001, _887, _1003);
    float _1011 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1005);
    float _1013 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1007);
    float _1015 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1009);
    bool _1017 = !_819;
    float _1033;
    if (!_1017)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1021 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1025 = _1023 * _1019;
        float _1027 = floor(_1025);
        float _1029 = -_1027;
        float _1031 = _1025 + _1029;
        _1033 = _1031;
        _1035 = true;
    }
    else
    {
        float _1037 = float(_85);
        float _1039 = 1.0 / _1037;
        float _1041 = _119 * _1039;
        _1033 = _1041;
    }
    _1035 = false;
    float _1043 = _1033;
    float _1045 = as_type<float>(int(gl_VertexIndex));
    bool _1047 = _139 > 0.5;
    float _1049 = _347 * _735;
    float _1051 = _347 * _739;
    float _1053 = in.m_51.y;
    float _1055 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1057 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1059 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1061 = _1049 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1055);
    float _1065 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1057);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1069 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1059);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1075 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1069);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1081 = 1.0 / _1073;
    bool _1083 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1085 = isnan(_1043);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    int _1095 = as_type<int>(_1045) & 1;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>(_1045) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1065);
    float _1105 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1063);
    bool _1107 = _1053 > 0.5;
    float _1109 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1111 = !_1101;
    float _1113 = _1111 ? (-0.5) : 0.5;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1119 = !_1097;
    float _1121 = _1119 ? (-0.5) : 0.5;
    float _1123 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1127 = _1125 != 0;
    float _1129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1113);
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1133 = _1131 != 0;
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1121);
    float _1137 = 1.0 / _1117;
    float _1139 = _1067 * _1129;
    float _1141 = _1061 * _1135;
    bool _1143 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1145 = isnan(_1043);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1157 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1159;
    float _1163 = 1.0 / _1079;
    float _1165 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1155);
    float _1167 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1157);
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1171 = _1043 + _1169;
    bool _1173 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1175 = isnan(_1043);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1165);
    float _1187 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1167);
    float _1189 = _1103 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1191 = _1075 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1195 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1201 = _1161 * _1081;
    float _1203 = _1189 + _1193;
    float _1205 = _1191 + _1195;
    bool _1207 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1209 = isnan(_1043);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = _1199 * _1163;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1223 = _1203 + _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1227 = _1205 + _1225;
    float _1229 = -_1217;
    float _1231 = _1229 + 1.0;
    float _1233 = _1223 * _1223;
    float _1235 = _1227 * _1227;
    float _1237 = -_1153;
    float _1239 = _1237 + 1.0;
    float _1241 = _1093 * _1231;
    float _1243 = -_1093;
    float _1245 = _1243 + 1.0;
    float _1247 = _1233 + _1235;
    float _1249 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1251 = fma(_1201, _1171, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1253 = _1153 * _1245;
    float _1255 = sqrt(_1247);
    float _1257 = _1183 * _1239;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1259;
    float _1263 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1249);
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1267 = _1043 + _1265;
    float _1269 = _1251 * _1257;
    float _1271 = -_1183;
    float _1273 = _1271 + 1.0;
    float _1275 = _1261 * _1137;
    float _1277 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1263);
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1281 = fma(_1219, _1267, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1269);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1289 = _1043 + _1287;
    float _1291 = -_1121;
    float _1293 = _1047 ? _1291 : _1121;
    float _1295 = fma(_1281, _1253, _1283);
    bool _1297 = _1255 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1123 + _1285;
    float _1301 = -_1113;
    float _1303 = _1107 ? _1301 : _1113;
    float _1305 = fma(_1275, _1289, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1307 = !_1127;
    float _1309 = _1307 ? _1121 : _1293;
    bool _1311 = !_1133;
    float _1313 = _1311 ? _1113 : _1303;
    float _1315 = _1303;
    float _1317 = _1293;
    float _1319 = _1121;
    float _1321 = _1113;
    float _1323 = _1043;
    float _1325 = _1217;
    float _1327 = _1191;
    if (!_1297)
    {
        _1315 = _1235;
    }
    float _1329 = _1315;
    float _1331 = _1329;
    if (!_1297)
    {
        _1317 = _1233;
    }
    float _1333 = _1317;
    float _1335 = _1333;
    if (!_1297)
    {
        _1319 = _1203;
    }
    float _1337 = _1319;
    float _1339 = _1337;
    if (!_1297)
    {
        _1321 = _1205;
    }
    float _1341 = _1321;
    float _1343 = _1341;
    if (!_1297)
    {
        _1323 = _1299;
    }
    float _1345 = _1323;
    bool _1347 = !_1297;
    float _1349 = _1345;
    if (!_1347)
    {
        float _1351 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1355 = _1255 + _1353;
        float _1357 = _1299 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = rsqrt(_1247);
        float _1361 = _1355 * _1351;
        float _1363 = _1361 * 0.15915493667125701904296875;
        float _1365 = _1363 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1363 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = fma(_1367, _1357, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1375 = _1359 * _1373;
        float _1377 = _1371 + (-1.0);
        float _1379 = fma(_1223, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1381 = fma(_1227, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1383 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1387 = _1379 + _1385;
        float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1391 = _1381 + _1389;
        float _1393 = fma(_1299, _1371, _1383);
        float _1395 = _1387 * _1387;
        float _1397 = _1391 * _1391;
        _1349 = _1393;
        _1335 = _1395;
        _1331 = _1397;
        _1339 = _1379;
        _1343 = _1381;
    }
    float _1399 = _1349;
    float _1401 = _1335;
    float _1403 = _1331;
    float _1405 = _1339;
    float _1407 = _1343;
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1411 = _1399 + _1409;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1415 = _1309 + 0.5;
    float _1417 = fma(_1305, _1241, _1295);
    float _1419 = fma(_1411, _1411, _1401);
    float _1421 = -_1313;
    float _1423 = _1421 + 0.5;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1427 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1417);
    float _1429 = _1419 + _1403;
    float _1431 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1435 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1437 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1439 = _1425 * _1279;
    float _1441 = sqrt(_1429);
    float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1433 * _1413;
    float _1449 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.x = _1439;
    out.m_60.y = _1447;
    out.m_62.x = _1443;
    out.m_62.y = _1445;
    out.m_62.z = _1449;
    out.m_62.w = _1451;
    bool _1453 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1455 = isnan(_1441);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1461 = _1457 || _1459;
    float _1463 = _1445;
    if (!_1461)
    {
        _1325 = 1.0;
    }
    float _1465 = _1325;
    bool _1467 = !_1461;
    float _1469 = _1465;
    if (!_1467)
    {
        bool _1471 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1473 = isnan(_1441);
        bool _1475 = _1471 || _1473;
        bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1479 = _1475 || _1477;
        if (!_1479)
        {
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = _1441 + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1487 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1485;
            float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1493 = 1.0 / _1487;
            float _1495 = _1483 * _1493;
            float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1469 = _1497;
            _1499 = true;
        }
        else
        {
            bool _1501 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1503 = isnan(_1441);
            bool _1505 = _1501 || _1503;
            bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1509 = _1505 || _1507;
            if (!_1509)
            {
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1441 + _1511;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1523 = 1.0 / _1517;
                float _1525 = _1513 * _1523;
                float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1469 = _1527;
                _1499 = true;
            }
            else
            {
                _1469 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1499 = false;
    float _1529 = _1469;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1533 = _1405 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1537 = _1399 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1541 = _1407 + _1539;
    bool _1543 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    float _1553 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1555 = fma(_1537, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1557 = fma(_1541, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1559 = _1541;
    float _1561 = _1533;
    float _1563 = _1529;
    float _1565 = _1555;
    float _1567 = _1537;
    if (_1551)
    {
        _1559 = _1553;
    }
    float _1569 = _1559;
    float _1571 = _1569;
    if (_1551)
    {
        _1561 = _1555;
    }
    float _1573 = _1561;
    float _1575 = _1573;
    if (_1551)
    {
        _1563 = _1557;
    }
    float _1577 = _1563;
    float _1579 = _1577;
    if (!_1551)
    {
        float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1583 = _1123 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1587 = _1189 + _1585;
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1591 = -_1191;
        float _1593 = _1591 + _1557;
        float _1595 = _1583 * _1583;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1599 = _1191 + _1597;
        float _1601 = fma(_1587, _1587, _1595);
        float _1603 = fma(_1599, _1599, _1601);
        float _1605 = -_1189;
        float _1607 = _1605 + _1553;
        float _1609 = -_1123;
        float _1611 = _1609 + _1555;
        float _1613 = sqrt(_1603);
        float _1615 = precise::min(_1613, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1617 = _1615 * _1589;
        float _1619 = fma(_1607, _1617, _1189);
        float _1621 = fma(_1611, _1617, _1123);
        float _1623 = fma(_1593, _1617, _1191);
        _1575 = _1621;
        _1571 = _1619;
        _1579 = _1623;
    }
    float _1625 = _1575;
    float _1627 = _1571;
    float _1629 = _1579;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1633 = _1625 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1637 = _1627 + _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1641 = _1629 + _1639;
    float _1643 = _1633 * _1633;
    float _1645 = fma(_1637, _1637, _1643);
    float _1647 = fma(_1641, _1641, _1645);
    float _1649 = rsqrt(_1647);
    float _1651 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1653 = _1637 * _1651;
    float _1655 = _1641 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 * _1655;
    float _1661 = _1657 + _1659;
    float _1663 = sqrt(_1661);
    bool _1665 = _1663 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1669 = _1663 + _1667;
    float _1671 = _1641;
    float _1673 = _1669;
    float _1675 = _1633;
    if (_1665)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1677;
    }
    float _1679 = _1671;
    if (_1665)
    {
        float _1681 = rsqrt(_1661);
        _1565 = _1681;
    }
    float _1683 = _1565;
    float _1685 = _1683;
    if (_1665)
    {
        float _1687 = _1669 * _1679;
        _1673 = _1687;
    }
    float _1689 = _1673;
    if (_1665)
    {
        float _1691 = _1689 * 0.15915493667125701904296875;
        _1567 = _1691;
    }
    float _1693 = _1567;
    float _1695 = _1649;
    if (_1665)
    {
        float _1697 = _1693 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1643;
    float _1709 = _1705;
    float _1711 = _1703;
    if (_1665)
    {
        float _1713 = _1693 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = -_1651;
    float _1721 = -_1705;
    float _1723 = fma(_1633, _1719, _1721);
    if (!_1665)
    {
        _1675 = _1655;
    }
    float _1725 = _1675;
    float _1727 = _1725;
    if (_1665)
    {
        float _1729 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1729;
    }
    float _1731 = _1709;
    float _1733 = sqrt(_1647);
    float _1735 = _1731;
    float _1737 = _1701;
    if (_1665)
    {
        float _1739 = fma(_1701, _1731, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1739;
    }
    float _1741 = _1735;
    float _1743 = _1741;
    if (!_1665)
    {
        _1737 = _1653;
    }
    float _1745 = _1737;
    float _1747 = _1745;
    float _1749 = _1717;
    if (_1665)
    {
        float _1751 = _1717 + (-1.0);
        _1711 = _1751;
    }
    float _1753 = _1711;
    float _1755 = _1753;
    if (_1665)
    {
        float _1757 = _1683 * _1741;
        _1463 = _1757;
    }
    float _1759 = _1463;
    if (!_1665)
    {
        _1743 = _1723;
    }
    float _1761 = _1743;
    float _1763 = _1761;
    if (_1665)
    {
        float _1765 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1685 = _1765;
    }
    float _1767 = _1685;
    if (_1665)
    {
        float _1769 = _1653 * _1759;
        _1747 = _1769;
    }
    float _1771 = _1747;
    if (!_1665)
    {
        _1755 = _1657;
    }
    float _1773 = _1755;
    float _1775 = _1773;
    if (_1665)
    {
        float _1777 = _1655 * _1759;
        _1727 = _1777;
    }
    float _1779 = _1727;
    if (_1665)
    {
        float _1781 = fma(_1723, _1717, _1767);
        _1763 = _1781;
    }
    float _1783 = _1763;
    if (_1665)
    {
        float _1785 = _1771 * _1771;
        _1775 = _1785;
    }
    float _1787 = _1775;
    if (!_1665)
    {
        _1749 = _1659;
    }
    float _1789 = _1749;
    float _1791 = _1789;
    if (_1665)
    {
        float _1793 = _1779 * _1779;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1783, _1783, _1787);
    float _1799 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1797 + _1795;
    float _1803 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1813 = rsqrt(_1801);
    float _1815 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1803);
    float _1817 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1819 = -_1809;
    float _1821 = _1819 + 1.0;
    float _1823 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1825 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1815);
    float _1827 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1817);
    float _1829 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1823);
    float _1831 = abs(_1821);
    float _1833 = log2(_1831);
    float _1835 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1827);
    float _1839 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1841 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1829);
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1845 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1847 = _1813 * _1771;
    float _1849 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1851 = -_1843;
    float _1853 = fma(_1851, _1811, 1.0);
    float _1855 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1857 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1859 = _1813 * _1783;
    float _1861 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1863 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1865 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1857);
    float _1867 = _1813 * _1779;
    float _1869 = -_1861;
    float _1871 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1869);
    float _1873 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1875 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1865);
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1879 = -_1867;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1871);
    float _1883 = exp2(_1873);
    float _1885 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1875);
    float _1887 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1889 = fma(_1881, -0.5, 0.5);
    float _1891 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1877);
    float _1893 = fma(_1881, 0.5, 0.5);
    float _1895 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1887);
    float _1897 = _1859 + 1.0;
    float _1899 = log2(_1853);
    float _1901 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1891);
    float _1903 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1895);
    float _1905 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1907 = fma(_1893, _1905, -0.212114393711090087890625);
    float _1909 = 1.0 / _1885;
    float _1911 = -_1859;
    float _1913 = fma(_1883, _1897, _1911);
    float _1915 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1901);
    float _1917 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1903);
    float _1919 = fma(_1893, _1907, 1.570728778839111328125);
    float _1921 = fma(_1913, 0.5, 0.5);
    float _1923 = sqrt(_1889);
    float _1925 = _1899 * 0.693147182464599609375;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1929 = _1915 * _1909;
    float _1931 = _1917 * _1909;
    float _1933 = fma(_1929, 0.5, 0.5);
    float _1935 = fma(_1931, -0.5, 0.5);
    float _1937 = _1923 * 0.636619746685028076171875;
    float3 _5148 = float3(_1933, _1935, _1927);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5148, float3(0.0), isnan(_5148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5148, float3(0.0), isnan(_5148)), level(0.0)).x;
    float _1941 = -_1919;
    float _1943 = fma(_1937, _1941, 1.0);
    float3 _5164 = float3(_1933, _1935, _1927);
    float4 _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5164, float3(0.0), isnan(_5164)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5164, float3(0.0), isnan(_5164)), level(0.0)).xyzw;
    float _1948 = _1946.x;
    float _1950 = _1946.y;
    float _1952 = _1946.z;
    float _1954 = _1946.w;
    float2 _5181 = float2(_1943, _1921);
    float3 _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5181, float2(0.0), isnan(_5181)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5181, float2(0.0), isnan(_5181)), level(0.0)).xyz;
    float _1960 = _1958.x;
    float _1962 = _1958.y;
    float _1964 = _1958.z;
    float _1966 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1968 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1966);
    float _1970 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1972 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1968);
    float _1974 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1970);
    bool _1976 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.5);
    bool _1984 = _1980 || _1982;
    float _1986 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1988 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1974);
    float _1990 = 1.0 / _1986;
    float _1992 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1994 = _1992 + _1986;
    float _1996 = _1933;
    float _1998 = _1833;
    if (!_1984)
    {
        _1327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2000 = _1327;
    float _2002 = _2000;
    if (!_1984)
    {
        _1996 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2004 = _1996;
    float _2006 = _1994 * _1990;
    float _2008 = _2006 * 0.5;
    float _2010 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2014 = _2008;
    float _2016 = _2010;
    if (_1984)
    {
        _1998 = 1.0;
    }
    float _2018 = _1998;
    float _2020 = _2018;
    if (!_1984)
    {
        float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2024 = fma(_2008, _2000, _2022);
        _2014 = _2024;
    }
    float _2026 = _2014;
    if (!_1984)
    {
        float _2028 = -_2004;
        float _2030 = _2028 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2002 = _2030;
    }
    float _2032 = _2002;
    float _2034 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2036 = exp2(_2012);
    float _2038 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2034);
    float _2040 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2038);
    float _2042 = _1885 * 0.5;
    float _2044 = _2026;
    if (!_1984)
    {
        float _2046 = 1.0 / _2026;
        _2044 = _2046;
    }
    float _2048 = _2044;
    out.gl_Position.x = _1915;
    out.gl_Position.y = _1917;
    out.gl_Position.z = _2040;
    out.gl_Position.w = _1885;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1984)
    {
        float _2052 = 1.0 / _2032;
        _2050 = _2052;
    }
    float _2054 = _2050;
    float _2056 = -_2036;
    float _2058 = _2056 + 1.0;
    float _2060 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1984)
    {
        float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2064 = -_2004;
        float _2066 = fma(_2048, _2062, _2064);
        _2016 = _2066;
    }
    float _2068 = _2016;
    float _2070 = fma(_1917, -0.5, _2042);
    float _2072 = _2040 + _1885;
    float _2074 = _2072 * 0.5;
    if (!_1984)
    {
        float _2076 = _2068 * _2054;
        float _2078 = precise::clamp(_2076, 0.0, 1.0);
        _2020 = _2078;
    }
    float _2080 = _2020;
    float _2082 = _1915 + _1885;
    float _2084 = _2080 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2086 = _2080 > 0.0;
    bool _2088 = isnan(_2080);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.0);
    bool _2094 = _2090 || _2092;
    float _2096 = -_2060;
    float _2098 = _2096 + 1.0;
    float _2100 = _2082 * 0.5;
    float _2102 = _2084 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2100;
    out.m_64.y = _2070;
    out.m_64.z = _2074;
    out.m_64.w = _1885;
    out.m_47.x = _2102;
    float _2104 = _2060 * _1939;
    float _2106 = _1954 * _2104;
    float _2108 = _1954 * _2098;
    float _2110 = _1964 * _2104;
    float _2112 = fma(_1960, _2106, _1948);
    float _2114 = fma(_1962, _2106, _1950);
    float _2116 = fma(_1954, _2110, _1952);
    out.m_66.x = _2112;
    out.m_66.y = _2114;
    out.m_66.z = _2116;
    out.m_66.w = _2108;
    if (_2094)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1499 = false;
    bool _1035 = false;
    bool _761 = false;
    bool _651 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_101);
        out.gl_Position.z = _2175;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2243 = as_type<float>(_137);
        out.gl_Position.z = _2243;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _143 * _141;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _169 = _167 * 6.283185482025146484375;
    float _171 = floor(_167);
    float _173 = _169 * 0.15915493667125701904296875;
    float _175 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = 0.0;
    float _179 = _175;
    if (!_153)
    {
        float _181 = _175 * _175;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = _185;
    if (!_153)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = -_171;
    float _199 = _167 + _197;
    bool _201 = !_153;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _175 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _175);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _175 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = fma(_189, 0.5, 0.5);
    float _273 = in.m_44.x;
    float _275 = in.m_44.y;
    float _277 = in.m_44.z;
    bool _279 = _199 < 0.5;
    float _281 = float(_279);
    bool _283 = !_265;
    int _285 = _283 ? 0 : 1;
    float _287 = -_199;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _291 = !_157;
    int _293 = _291 ? 0 : 1;
    float _295 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _297 = abs(_285);
    float _299 = -_281;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_271;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_259, _161, _295);
    int _309 = abs(_293);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = fma(_259, _163, _311);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = float(_297);
    float _327 = float(_309);
    float _329 = fma(_259, _165, _323);
    float _331 = abs(_289);
    float _333 = _325 * _331;
    float _335 = fma(_317, _261, _275);
    float _337 = fma(_307, _261, _273);
    float _339 = float(_321);
    float _341 = fma(_327, _305, _333);
    float _343 = fma(_329, _261, _277);
    float _345 = abs(_301);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_319;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_85);
        float _371 = 1.0 / _369;
        float _373 = _119 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _375 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _397;
    float _401 = 1.0 / _383;
    float _403 = 1.0 / _387;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _375 + _405;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = 1.0 / _395;
    float _413 = _407 * _401;
    bool _415 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _417 = isnan(_375);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _429 = isnan(_375);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _399;
    float _441 = _379 * _403;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _445 = _375 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _449 = _375 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = 1.0 / _391;
    float _457 = _445 * _411;
    float _459 = -_437;
    float _461 = _459 + 1.0;
    float _463 = fma(_453, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _467 = _375 + _465;
    float _469 = _467 * _439;
    bool _471 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_375);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    float _487 = _449 * _455;
    float _489 = -_425;
    float _491 = _489 + 1.0;
    bool _493 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _495 = isnan(_375);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _507 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _509 = isnan(_375);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _481 * _491;
    float _521 = -_481;
    float _523 = _521 + 1.0;
    float _525 = _503 * _461;
    float _527 = -_503;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = _437 * _523;
    bool _537 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _539 = isnan(_375);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = _517 * _529;
    float _551 = -_517;
    float _553 = _551 + 1.0;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _559 = fma(_533, _441, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _561 = -_547;
    float _563 = _561 + 1.0;
    float _565 = _547 * _553;
    float _567 = fma(_557, _441, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _573;
    float _577 = _463 * _565;
    float _579 = _505 * _565;
    float _581 = fma(_571, _487, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _583 = fma(_575, _487, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].x, _577);
    float _587 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[143].y, _579);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _593 = fma(_567, _549, _585);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _599 = fma(_559, _549, _587);
    float _601 = fma(_591, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _603;
    float _607 = fma(_581, _525, _593);
    float _609 = fma(_597, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _611;
    float _615 = fma(_583, _525, _599);
    float _617 = fma(_605, _469, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _619 = fma(_601, _535, _607);
    float _621 = fma(_613, _469, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _623 = fma(_609, _535, _615);
    float _625 = fma(_617, _519, _619);
    float _627 = fma(_621, _519, _623);
    float _629 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[148].x, _625);
    float _631 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[148].y, _627);
    bool _633 = !_409;
    float _649;
    if (!_633)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _637 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_85);
        float _655 = 1.0 / _653;
        float _657 = _119 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = in.m_53.x;
    float _663 = in.m_53.y;
    bool _665 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_659);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _683 = isnan(_659);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _659 + _697;
    float _701 = -_675;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _707 = 1.0 / _679;
    float _709 = _691 * _703;
    float _711 = -_691;
    float _713 = _711 + 1.0;
    float _715 = _695 * _707;
    float _717 = fma(_715, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _721 = _717 * _709;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _721);
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[116].x, _725);
    float _735 = _629 * _661;
    float _737 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _631 * _663;
    float _741 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _737;
    out.m_55.y = _731;
    out.m_55.z = _727;
    out.m_55.w = _741;
    bool _743 = !_705;
    float _759;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _747 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _759 = _757;
        _761 = true;
    }
    else
    {
        float _763 = float(_85);
        float _765 = 1.0 / _763;
        float _767 = _119 * _765;
        _759 = _767;
    }
    _761 = false;
    float _769 = _759;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _773 = _769 + _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _777 = _769 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _781 = _769 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _799 = 1.0 / _793;
    bool _801 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _803 = isnan(_769);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = 1.0 / _789;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _817 = _769 + _815;
    bool _819 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _821 = 1.0 / _797;
    float _823 = _773 * _799;
    bool _825 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _827 = isnan(_769);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = 1.0 / _785;
    float _839 = _817 * _813;
    bool _841 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _843 = isnan(_769);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    bool _853 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _855 = isnan(_769);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_851;
    float _867 = _865 + 1.0;
    float _869 = _777 * _821;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _871;
    bool _875 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _877 = isnan(_769);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = _835 * _867;
    float _889 = -_835;
    float _891 = _889 + 1.0;
    float _893 = fma(_873, _823, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _899 = _781 * _837;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _901;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _905;
    float _909 = _863 * _891;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _915 = fma(_903, _823, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _917 = fma(_907, _823, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _919 = -_863;
    float _921 = _919 + 1.0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _927 = fma(_897, _869, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_913, _869, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _931 = _811 * _921;
    float _933 = -_811;
    float _935 = _933 + 1.0;
    float _937 = fma(_925, _869, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _939 = _885 * _935;
    float _941 = -_885;
    float _943 = _941 + 1.0;
    float _945 = _893 * _939;
    float _947 = _915 * _939;
    float _949 = _917 * _939;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _951;
    float _955 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].x, _945);
    float _957 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].y, _947);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _959;
    float _963 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[123].z, _949);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _965;
    float _969 = fma(_953, _899, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _971 = fma(_927, _931, _955);
    float _973 = fma(_937, _931, _957);
    float _975 = fma(_961, _899, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _977 = fma(_929, _931, _963);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _987 = fma(_967, _899, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _993 = fma(_969, _909, _971);
    float _995 = fma(_981, _839, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _997 = fma(_985, _839, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _999 = fma(_975, _909, _973);
    float _1001 = fma(_991, _839, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1003 = fma(_987, _909, _977);
    float _1005 = fma(_995, _887, _993);
    float _1007 = fma(_997, _887, _999);
    float _1009 = fma(_1001, _887, _1003);
    float _1011 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1005);
    float _1013 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1007);
    float _1015 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1009);
    bool _1017 = !_819;
    float _1033;
    if (!_1017)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1021 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1025 = _1023 * _1019;
        float _1027 = floor(_1025);
        float _1029 = -_1027;
        float _1031 = _1025 + _1029;
        _1033 = _1031;
        _1035 = true;
    }
    else
    {
        float _1037 = float(_85);
        float _1039 = 1.0 / _1037;
        float _1041 = _119 * _1039;
        _1033 = _1041;
    }
    _1035 = false;
    float _1043 = _1033;
    float _1045 = as_type<float>(int(gl_VertexIndex));
    bool _1047 = _139 > 0.5;
    float _1049 = _347 * _735;
    float _1051 = _347 * _739;
    float _1053 = in.m_51.y;
    float _1055 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1057 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1059 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1061 = _1049 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1055);
    float _1065 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1057);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1069 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1059);
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1073 = _1071 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1075 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1069);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1081 = 1.0 / _1073;
    bool _1083 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1085 = isnan(_1043);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    int _1095 = as_type<int>(_1045) & 1;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>(_1045) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1065);
    float _1105 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1063);
    bool _1107 = _1053 > 0.5;
    float _1109 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1111 = !_1101;
    float _1113 = _1111 ? (-0.5) : 0.5;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1119 = !_1097;
    float _1121 = _1119 ? (-0.5) : 0.5;
    float _1123 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1127 = _1125 != 0;
    float _1129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1113);
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1133 = _1131 != 0;
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1121);
    float _1137 = 1.0 / _1117;
    float _1139 = _1067 * _1129;
    float _1141 = _1061 * _1135;
    bool _1143 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1145 = isnan(_1043);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1157 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1159;
    float _1163 = 1.0 / _1079;
    float _1165 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1155);
    float _1167 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1157);
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1171 = _1043 + _1169;
    bool _1173 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1175 = isnan(_1043);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1165);
    float _1187 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1167);
    float _1189 = _1103 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1191 = _1075 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1193 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1195 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1201 = _1161 * _1081;
    float _1203 = _1189 + _1193;
    float _1205 = _1191 + _1195;
    bool _1207 = _1043 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1209 = isnan(_1043);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = _1199 * _1163;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1223 = _1203 + _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1227 = _1205 + _1225;
    float _1229 = -_1217;
    float _1231 = _1229 + 1.0;
    float _1233 = _1223 * _1223;
    float _1235 = _1227 * _1227;
    float _1237 = -_1153;
    float _1239 = _1237 + 1.0;
    float _1241 = _1093 * _1231;
    float _1243 = -_1093;
    float _1245 = _1243 + 1.0;
    float _1247 = _1233 + _1235;
    float _1249 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1251 = fma(_1201, _1171, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1253 = _1153 * _1245;
    float _1255 = sqrt(_1247);
    float _1257 = _1183 * _1239;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1259;
    float _1263 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1249);
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1267 = _1043 + _1265;
    float _1269 = _1251 * _1257;
    float _1271 = -_1183;
    float _1273 = _1271 + 1.0;
    float _1275 = _1261 * _1137;
    float _1277 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1263);
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1281 = fma(_1219, _1267, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1269);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1289 = _1043 + _1287;
    float _1291 = -_1121;
    float _1293 = _1047 ? _1291 : _1121;
    float _1295 = fma(_1281, _1253, _1283);
    bool _1297 = _1255 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1123 + _1285;
    float _1301 = -_1113;
    float _1303 = _1107 ? _1301 : _1113;
    float _1305 = fma(_1275, _1289, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1307 = !_1127;
    float _1309 = _1307 ? _1121 : _1293;
    bool _1311 = !_1133;
    float _1313 = _1311 ? _1113 : _1303;
    float _1315 = _1303;
    float _1317 = _1293;
    float _1319 = _1121;
    float _1321 = _1113;
    float _1323 = _1043;
    float _1325 = _1217;
    float _1327 = _1191;
    if (!_1297)
    {
        _1315 = _1235;
    }
    float _1329 = _1315;
    float _1331 = _1329;
    if (!_1297)
    {
        _1317 = _1233;
    }
    float _1333 = _1317;
    float _1335 = _1333;
    if (!_1297)
    {
        _1319 = _1203;
    }
    float _1337 = _1319;
    float _1339 = _1337;
    if (!_1297)
    {
        _1321 = _1205;
    }
    float _1341 = _1321;
    float _1343 = _1341;
    if (!_1297)
    {
        _1323 = _1299;
    }
    float _1345 = _1323;
    bool _1347 = !_1297;
    float _1349 = _1345;
    if (!_1347)
    {
        float _1351 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1355 = _1255 + _1353;
        float _1357 = _1299 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = rsqrt(_1247);
        float _1361 = _1355 * _1351;
        float _1363 = _1361 * 0.15915493667125701904296875;
        float _1365 = _1363 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1363 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = fma(_1367, _1357, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1375 = _1359 * _1373;
        float _1377 = _1371 + (-1.0);
        float _1379 = fma(_1223, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1381 = fma(_1227, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1383 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1387 = _1379 + _1385;
        float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1391 = _1381 + _1389;
        float _1393 = fma(_1299, _1371, _1383);
        float _1395 = _1387 * _1387;
        float _1397 = _1391 * _1391;
        _1349 = _1393;
        _1335 = _1395;
        _1331 = _1397;
        _1339 = _1379;
        _1343 = _1381;
    }
    float _1399 = _1349;
    float _1401 = _1335;
    float _1403 = _1331;
    float _1405 = _1339;
    float _1407 = _1343;
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1411 = _1399 + _1409;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1415 = _1309 + 0.5;
    float _1417 = fma(_1305, _1241, _1295);
    float _1419 = fma(_1411, _1411, _1401);
    float _1421 = -_1313;
    float _1423 = _1421 + 0.5;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1427 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1417);
    float _1429 = _1419 + _1403;
    float _1431 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1435 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1437 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1439 = _1425 * _1279;
    float _1441 = sqrt(_1429);
    float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1433 * _1413;
    float _1449 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.x = _1439;
    out.m_60.y = _1447;
    out.m_62.x = _1443;
    out.m_62.y = _1445;
    out.m_62.z = _1449;
    out.m_62.w = _1451;
    bool _1453 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1455 = isnan(_1441);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1461 = _1457 || _1459;
    float _1463 = _1445;
    if (!_1461)
    {
        _1325 = 1.0;
    }
    float _1465 = _1325;
    bool _1467 = !_1461;
    float _1469 = _1465;
    if (!_1467)
    {
        bool _1471 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1473 = isnan(_1441);
        bool _1475 = _1471 || _1473;
        bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1479 = _1475 || _1477;
        if (!_1479)
        {
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = _1441 + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1487 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1485;
            float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1493 = 1.0 / _1487;
            float _1495 = _1483 * _1493;
            float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1469 = _1497;
            _1499 = true;
        }
        else
        {
            bool _1501 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1503 = isnan(_1441);
            bool _1505 = _1501 || _1503;
            bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1509 = _1505 || _1507;
            if (!_1509)
            {
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1441 + _1511;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1523 = 1.0 / _1517;
                float _1525 = _1513 * _1523;
                float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1469 = _1527;
                _1499 = true;
            }
            else
            {
                _1469 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1499 = false;
    float _1529 = _1469;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1533 = _1405 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1537 = _1399 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1541 = _1407 + _1539;
    bool _1543 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    float _1553 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1555 = fma(_1537, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1557 = fma(_1541, _1529, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1559 = _1541;
    float _1561 = _1533;
    float _1563 = _1529;
    float _1565 = _1555;
    float _1567 = _1537;
    if (_1551)
    {
        _1559 = _1553;
    }
    float _1569 = _1559;
    float _1571 = _1569;
    if (_1551)
    {
        _1561 = _1555;
    }
    float _1573 = _1561;
    float _1575 = _1573;
    if (_1551)
    {
        _1563 = _1557;
    }
    float _1577 = _1563;
    float _1579 = _1577;
    if (!_1551)
    {
        float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1583 = _1123 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1587 = _1189 + _1585;
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1591 = -_1191;
        float _1593 = _1591 + _1557;
        float _1595 = _1583 * _1583;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1599 = _1191 + _1597;
        float _1601 = fma(_1587, _1587, _1595);
        float _1603 = fma(_1599, _1599, _1601);
        float _1605 = -_1189;
        float _1607 = _1605 + _1553;
        float _1609 = -_1123;
        float _1611 = _1609 + _1555;
        float _1613 = sqrt(_1603);
        float _1615 = precise::min(_1613, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1617 = _1615 * _1589;
        float _1619 = fma(_1607, _1617, _1189);
        float _1621 = fma(_1611, _1617, _1123);
        float _1623 = fma(_1593, _1617, _1191);
        _1575 = _1621;
        _1571 = _1619;
        _1579 = _1623;
    }
    float _1625 = _1575;
    float _1627 = _1571;
    float _1629 = _1579;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1633 = _1625 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1637 = _1627 + _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1641 = _1629 + _1639;
    float _1643 = _1633 * _1633;
    float _1645 = fma(_1637, _1637, _1643);
    float _1647 = fma(_1641, _1641, _1645);
    float _1649 = rsqrt(_1647);
    float _1651 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1653 = _1637 * _1651;
    float _1655 = _1641 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 * _1655;
    float _1661 = _1657 + _1659;
    float _1663 = sqrt(_1661);
    bool _1665 = _1663 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1669 = _1663 + _1667;
    float _1671 = _1641;
    float _1673 = _1669;
    float _1675 = _1633;
    if (_1665)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1677;
    }
    float _1679 = _1671;
    if (_1665)
    {
        float _1681 = rsqrt(_1661);
        _1565 = _1681;
    }
    float _1683 = _1565;
    float _1685 = _1683;
    if (_1665)
    {
        float _1687 = _1669 * _1679;
        _1673 = _1687;
    }
    float _1689 = _1673;
    if (_1665)
    {
        float _1691 = _1689 * 0.15915493667125701904296875;
        _1567 = _1691;
    }
    float _1693 = _1567;
    float _1695 = _1649;
    if (_1665)
    {
        float _1697 = _1693 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1643;
    float _1709 = _1705;
    float _1711 = _1703;
    if (_1665)
    {
        float _1713 = _1693 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = -_1651;
    float _1721 = -_1705;
    float _1723 = fma(_1633, _1719, _1721);
    if (!_1665)
    {
        _1675 = _1655;
    }
    float _1725 = _1675;
    float _1727 = _1725;
    if (_1665)
    {
        float _1729 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1729;
    }
    float _1731 = _1709;
    float _1733 = sqrt(_1647);
    float _1735 = _1731;
    float _1737 = _1701;
    if (_1665)
    {
        float _1739 = fma(_1701, _1731, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1739;
    }
    float _1741 = _1735;
    float _1743 = _1741;
    if (!_1665)
    {
        _1737 = _1653;
    }
    float _1745 = _1737;
    float _1747 = _1745;
    float _1749 = _1717;
    if (_1665)
    {
        float _1751 = _1717 + (-1.0);
        _1711 = _1751;
    }
    float _1753 = _1711;
    float _1755 = _1753;
    if (_1665)
    {
        float _1757 = _1683 * _1741;
        _1463 = _1757;
    }
    float _1759 = _1463;
    if (!_1665)
    {
        _1743 = _1723;
    }
    float _1761 = _1743;
    float _1763 = _1761;
    if (_1665)
    {
        float _1765 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1685 = _1765;
    }
    float _1767 = _1685;
    if (_1665)
    {
        float _1769 = _1653 * _1759;
        _1747 = _1769;
    }
    float _1771 = _1747;
    if (!_1665)
    {
        _1755 = _1657;
    }
    float _1773 = _1755;
    float _1775 = _1773;
    if (_1665)
    {
        float _1777 = _1655 * _1759;
        _1727 = _1777;
    }
    float _1779 = _1727;
    if (_1665)
    {
        float _1781 = fma(_1723, _1717, _1767);
        _1763 = _1781;
    }
    float _1783 = _1763;
    if (_1665)
    {
        float _1785 = _1771 * _1771;
        _1775 = _1785;
    }
    float _1787 = _1775;
    if (!_1665)
    {
        _1749 = _1659;
    }
    float _1789 = _1749;
    float _1791 = _1789;
    if (_1665)
    {
        float _1793 = _1779 * _1779;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1783, _1783, _1787);
    float _1799 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1797 + _1795;
    float _1803 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1813 = rsqrt(_1801);
    float _1815 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1803);
    float _1817 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1819 = -_1809;
    float _1821 = _1819 + 1.0;
    float _1823 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1825 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1815);
    float _1827 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1817);
    float _1829 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1823);
    float _1831 = abs(_1821);
    float _1833 = log2(_1831);
    float _1835 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1827);
    float _1839 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1841 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1829);
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1845 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1847 = _1813 * _1771;
    float _1849 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1851 = -_1843;
    float _1853 = fma(_1851, _1811, 1.0);
    float _1855 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1857 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1859 = _1813 * _1783;
    float _1861 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1863 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1865 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1857);
    float _1867 = _1813 * _1779;
    float _1869 = -_1861;
    float _1871 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1869);
    float _1873 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1875 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1865);
    float _1877 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1879 = -_1867;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1871);
    float _1883 = exp2(_1873);
    float _1885 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1875);
    float _1887 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1889 = fma(_1881, -0.5, 0.5);
    float _1891 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1877);
    float _1893 = fma(_1881, 0.5, 0.5);
    float _1895 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1887);
    float _1897 = _1859 + 1.0;
    float _1899 = log2(_1853);
    float _1901 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1891);
    float _1903 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1895);
    float _1905 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1907 = fma(_1893, _1905, -0.212114393711090087890625);
    float _1909 = 1.0 / _1885;
    float _1911 = -_1859;
    float _1913 = fma(_1883, _1897, _1911);
    float _1915 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1901);
    float _1917 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1903);
    float _1919 = fma(_1893, _1907, 1.570728778839111328125);
    float _1921 = fma(_1913, 0.5, 0.5);
    float _1923 = sqrt(_1889);
    float _1925 = _1899 * 0.693147182464599609375;
    float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1929 = _1915 * _1909;
    float _1931 = _1917 * _1909;
    float _1933 = fma(_1929, 0.5, 0.5);
    float _1935 = fma(_1931, -0.5, 0.5);
    float _1937 = _1923 * 0.636619746685028076171875;
    float3 _5148 = float3(_1933, _1935, _1927);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5148, float3(0.0), isnan(_5148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5148, float3(0.0), isnan(_5148)), level(0.0)).x;
    float _1941 = -_1919;
    float _1943 = fma(_1937, _1941, 1.0);
    float3 _5164 = float3(_1933, _1935, _1927);
    float4 _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5164, float3(0.0), isnan(_5164)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5164, float3(0.0), isnan(_5164)), level(0.0)).xyzw;
    float _1948 = _1946.x;
    float _1950 = _1946.y;
    float _1952 = _1946.z;
    float _1954 = _1946.w;
    float2 _5181 = float2(_1943, _1921);
    float3 _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5181, float2(0.0), isnan(_5181)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5181, float2(0.0), isnan(_5181)), level(0.0)).xyz;
    float _1960 = _1958.x;
    float _1962 = _1958.y;
    float _1964 = _1958.z;
    float _1966 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1968 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1966);
    float _1970 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1972 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1968);
    float _1974 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1970);
    bool _1976 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.5);
    bool _1984 = _1980 || _1982;
    float _1986 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1988 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1974);
    float _1990 = 1.0 / _1986;
    float _1992 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1994 = _1992 + _1986;
    float _1996 = _1933;
    float _1998 = _1833;
    if (!_1984)
    {
        _1327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2000 = _1327;
    float _2002 = _2000;
    if (!_1984)
    {
        _1996 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2004 = _1996;
    float _2006 = _1994 * _1990;
    float _2008 = _2006 * 0.5;
    float _2010 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2014 = _2008;
    float _2016 = _2010;
    if (_1984)
    {
        _1998 = 1.0;
    }
    float _2018 = _1998;
    float _2020 = _2018;
    if (!_1984)
    {
        float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2024 = fma(_2008, _2000, _2022);
        _2014 = _2024;
    }
    float _2026 = _2014;
    if (!_1984)
    {
        float _2028 = -_2004;
        float _2030 = _2028 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2002 = _2030;
    }
    float _2032 = _2002;
    float _2034 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2036 = exp2(_2012);
    float _2038 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2034);
    float _2040 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2038);
    float _2042 = _1885 * 0.5;
    float _2044 = _2026;
    if (!_1984)
    {
        float _2046 = 1.0 / _2026;
        _2044 = _2046;
    }
    float _2048 = _2044;
    out.gl_Position.x = _1915;
    out.gl_Position.y = _1917;
    out.gl_Position.z = _2040;
    out.gl_Position.w = _1885;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1984)
    {
        float _2052 = 1.0 / _2032;
        _2050 = _2052;
    }
    float _2054 = _2050;
    float _2056 = -_2036;
    float _2058 = _2056 + 1.0;
    float _2060 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1984)
    {
        float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2064 = -_2004;
        float _2066 = fma(_2048, _2062, _2064);
        _2016 = _2066;
    }
    float _2068 = _2016;
    float _2070 = fma(_1917, -0.5, _2042);
    float _2072 = _2040 + _1885;
    float _2074 = _2072 * 0.5;
    if (!_1984)
    {
        float _2076 = _2068 * _2054;
        float _2078 = precise::clamp(_2076, 0.0, 1.0);
        _2020 = _2078;
    }
    float _2080 = _2020;
    float _2082 = _1915 + _1885;
    float _2084 = _2080 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2086 = _2080 > 0.0;
    bool _2088 = isnan(_2080);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.0);
    bool _2094 = _2090 || _2092;
    float _2096 = -_2060;
    float _2098 = _2096 + 1.0;
    float _2100 = _2082 * 0.5;
    float _2102 = _2084 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2100;
    out.m_64.y = _2070;
    out.m_64.z = _2074;
    out.m_64.w = _1885;
    out.m_47.x = _2102;
    float _2104 = _2060 * _1939;
    float _2106 = _1954 * _2104;
    float _2108 = _1954 * _2098;
    float _2110 = _1964 * _2104;
    float _2112 = fma(_1960, _2106, _1948);
    float _2114 = fma(_1962, _2106, _1950);
    float _2116 = fma(_1954, _2110, _1952);
    out.m_66.x = _2112;
    out.m_66.y = _2114;
    out.m_66.z = _2116;
    out.m_66.w = _2108;
    if (_2094)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

