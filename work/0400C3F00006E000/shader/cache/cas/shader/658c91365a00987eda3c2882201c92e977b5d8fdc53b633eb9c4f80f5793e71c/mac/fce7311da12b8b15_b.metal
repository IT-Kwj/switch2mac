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
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1101 = false;
    bool _645 = false;
    bool _385 = false;
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
        float _1583 = as_type<float>(_101);
        out.gl_Position.z = _1583;
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
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1652 = as_type<float>(_137);
        out.gl_Position.z = _1652;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = 0.0;
    float _163 = _147;
    if (!_157)
    {
        float _165 = _147 * _147;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_157)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _171 + _211;
    bool _215 = !_195;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_157;
    float _221 = _177;
    if (!_219)
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
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_157;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = fma(_205, 0.5, 0.5);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _287 = _285 != 0;
    float _289 = in.m_56.w;
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = -_213;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_201;
    int _301 = _299 ? 0 : 1;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_283;
    int _311 = _309 ? 0 : 1;
    float _313 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_279;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = fma(_277, _179, _313);
    int _327 = abs(_301);
    float _329 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = !_287;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_277, _181, _329);
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _339 = abs(_333);
    float _341 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_323);
    float _345 = float(_327);
    float _347 = fma(_277, _183, _341);
    float _349 = abs(_297);
    float _351 = _343 * _349;
    float _353 = fma(_335, _289, _305);
    float _355 = float(_339);
    float _357 = fma(_345, _321, _351);
    float _359 = fma(_325, _289, _303);
    float _361 = fma(_347, _289, _307);
    float _363 = abs(_317);
    float _365 = fma(_355, _363, _357);
    bool _367 = !_337;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = 1.0 / _397;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = 1.0 / _401;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _393 + _423;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _429 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _431 = _421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _433 = 1.0 / _405;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _393 + _435;
    float _439 = _425 * _411;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _393 + _441;
    out.m_58.x = _417;
    out.m_58.y = _429;
    out.m_58.z = _431;
    out.m_58.w = _427;
    float _445 = 1.0 / _409;
    float _447 = _437 * _419;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _393 + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _459 = fma(_455, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _461 = _443 * _433;
    bool _463 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _465 = isnan(_393);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _477 = isnan(_393);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    bool _487 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _489 = isnan(_393);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -_473;
    float _501 = _499 + 1.0;
    float _503 = -_485;
    float _505 = _503 + 1.0;
    float _507 = _451 * _445;
    bool _509 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _511 = isnan(_393);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _521;
    bool _525 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _527 = isnan(_393);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _497 * _505;
    float _539 = -_497;
    float _541 = _539 + 1.0;
    float _543 = _519 * _501;
    float _545 = -_519;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = fma(_523, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _559 = _535 * _541;
    float _561 = _485 * _547;
    float _563 = fma(_551, _447, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_555, _447, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = _557 * _559;
    float _569 = in.m_56.x;
    float _571 = in.m_56.y;
    float _573 = -_535;
    float _575 = _573 + 1.0;
    float _577 = _459 * _559;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _583;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _589 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _591 = fma(_581, _461, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _593 = fma(_585, _461, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _603 = fma(_563, _537, _587);
    float _605 = fma(_565, _537, _589);
    float _607 = fma(_597, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = fma(_601, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = fma(_591, _561, _603);
    float _613 = fma(_593, _561, _605);
    float _615 = fma(_607, _543, _611);
    float _617 = fma(_609, _543, _613);
    float _619 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[147].x, _615);
    float _621 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[147].y, _617);
    float _623 = _619 * _569;
    float _625 = _621 * _571;
    bool _627 = !_457;
    float _643;
    if (!_627)
    {
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _631 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        float _647 = float(_85);
        float _649 = 1.0 / _647;
        float _651 = _119 * _649;
        _643 = _651;
    }
    _645 = false;
    float _653 = _643;
    float _655 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _659 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _661 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _663 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _659);
    float _665 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _661);
    float _667 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _663);
    float _669 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _671 = sqrt(_667);
    float _673 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].x, _655);
    float _675 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _669);
    float _677 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _665);
    float _679 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _681 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].x, _673);
    float _683 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _675);
    float _685 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _689 = sqrt(_677);
    float _691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _693 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].z, _679);
    float _695 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].y, _687);
    float _697 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _699 = _685 * _691;
    float _701 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _703 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].y, _695);
    float _705 = sqrt(_683);
    float _707 = _681 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _709 = _701 * _657;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _713 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].z, _693);
    float _715 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].w, _697);
    float _717 = _671 * _707;
    float _719 = _709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _721 = _689 * _711;
    float _723 = _713 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _725 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].w, _715);
    float _727 = _709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _731 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _737 = _705 * _723;
    float _739 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _729);
    float _741 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _743 = _725 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _745 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _719);
    float _747 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _739);
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _741);
    float _751 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _755 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _747);
    float _757 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _749);
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _761 = _753 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _765 = _757 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _767 = in.m_51.y;
    float _769 = _763 + _761;
    float _771 = _765 + _759;
    bool _773 = _139 > 0.5;
    float _775 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _777 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _779 = _769 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _783 = _771 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = _779 * _779;
    float _791 = _783 * _783;
    float _793 = 1.0 / _787;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _797 = _795 != 0;
    float _799 = _709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _801 = _789 + _791;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _805 = _803 != 0;
    float _807 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _775);
    float _809 = -_209;
    int _811 = _773 ? as_type<int>(_809) : as_type<int>(_209);
    float _813 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _799);
    float _815 = sqrt(_801);
    float _817 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    bool _819 = !_797;
    float _821 = _819 ? _209 : as_type<float>(_811);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = _653 + _823;
    bool _827 = _767 > 0.5;
    float _829 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _813);
    float _831 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _817);
    bool _833 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _835 = isnan(_653);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _825 * _793;
    float _847 = -_217;
    int _849 = _827 ? as_type<int>(_847) : as_type<int>(_217);
    float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _853 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _855 = !_805;
    float _857 = _855 ? _217 : as_type<float>(_849);
    float _859 = _831 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _861;
    bool _865 = _815 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _867 = _859 + _853;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _869;
    bool _873 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _875 = isnan(_653);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_863, _845, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _887;
    float _891 = fma(_871, _845, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _893 = -_883;
    float _895 = _893 + 1.0;
    float _897 = fma(_889, _845, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _899 = _843 * _895;
    float _901 = _895;
    float _903 = _859;
    float _905 = _871;
    float _907 = _863;
    float _909 = _889;
    if (!_865)
    {
        _901 = _791;
    }
    float _911 = _901;
    float _913 = _911;
    if (!_865)
    {
        _903 = _789;
    }
    float _915 = _903;
    float _917 = _915;
    if (!_865)
    {
        _905 = _769;
    }
    float _919 = _905;
    float _921 = _919;
    if (!_865)
    {
        _907 = _771;
    }
    float _923 = _907;
    float _925 = _923;
    if (!_865)
    {
        _909 = _867;
    }
    float _927 = _909;
    bool _929 = !_865;
    float _931 = _927;
    if (!_929)
    {
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _937 = _815 + _935;
        float _939 = rsqrt(_801);
        float _941 = _937 * _933;
        float _943 = _867 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _945 = _941 * 0.15915493667125701904296875;
        float _947 = _945 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 * 6.283185482025146484375;
        float _953 = cos(_951);
        float _955 = fma(_949, _943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _957 = _939 * _955;
        float _959 = _953 + (-1.0);
        float _961 = fma(_779, _957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_783, _957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _965 = _959 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _969 = _961 + _967;
        float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _973 = _963 + _971;
        float _975 = fma(_867, _953, _965);
        float _977 = _969 * _969;
        float _979 = _973 * _973;
        _931 = _975;
        _917 = _977;
        _913 = _979;
        _921 = _961;
        _925 = _963;
    }
    float _981 = _931;
    float _983 = _917;
    float _985 = _913;
    float _987 = _921;
    float _989 = _925;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _993 = _981 + _991;
    float _995 = _885 * _899;
    float _997 = _891 * _899;
    float _999 = _897 * _899;
    float _1001 = -_843;
    float _1003 = _1001 + 1.0;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1007 = _821 + 0.5;
    float _1009 = fma(_993, _993, _983);
    float _1011 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].x, _995);
    float _1013 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].y, _997);
    float _1015 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].z, _999);
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = _1009 + _985;
    float _1021 = -_857;
    float _1023 = _1021 + 0.5;
    float _1025 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1011);
    float _1027 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1013);
    float _1029 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1015);
    float _1031 = _1017 * _851;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1035 = sqrt(_1019);
    float _1037 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1039 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1041 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1043 = _1033 * _1005;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1049 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1031;
    out.m_60.y = _1043;
    out.m_62.x = _1045;
    out.m_62.y = _1047;
    out.m_62.z = _1049;
    bool _1051 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1053 = isnan(_1035);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1059 = _1055 || _1057;
    float _1061 = _1017;
    float _1063 = _1045;
    float _1065 = _993;
    if (!_1059)
    {
        _1061 = 1.0;
    }
    float _1067 = _1061;
    bool _1069 = !_1059;
    float _1071 = _1067;
    if (!_1069)
    {
        bool _1073 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1075 = isnan(_1035);
        bool _1077 = _1073 || _1075;
        bool _1079 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1081 = _1077 || _1079;
        if (!_1081)
        {
            float _1083 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1085 = _1035 + _1083;
            float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1089 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1087;
            float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1093 = _1091 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1095 = 1.0 / _1089;
            float _1097 = _1085 * _1095;
            float _1099 = fma(_1097, _1093, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1071 = _1099;
            _1101 = true;
        }
        else
        {
            bool _1103 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1105 = isnan(_1035);
            bool _1107 = _1103 || _1105;
            bool _1109 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1111 = _1107 || _1109;
            if (!_1111)
            {
                float _1113 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1115 = _1035 + _1113;
                float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1119 = _1117 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1121 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1123 = _1121 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1125 = 1.0 / _1119;
                float _1127 = _1115 * _1125;
                float _1129 = fma(_1127, _1123, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1071 = _1129;
                _1101 = true;
            }
            else
            {
                _1071 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1101 = false;
    float _1131 = _1071;
    float _1133 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1135 = _981 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1139 = _987 + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1143 = _989 + _1141;
    float _1145 = fma(_1135, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1147 = fma(_1139, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1149 = fma(_1143, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1153 = _1145 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1157 = _1147 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1161 = _1149 + _1159;
    float _1163 = _1153 * _1153;
    float _1165 = fma(_1157, _1157, _1163);
    float _1167 = fma(_1161, _1161, _1165);
    float _1169 = rsqrt(_1167);
    float _1171 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1173 = _1157 * _1171;
    float _1175 = _1161 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 * _1175;
    float _1181 = _1177 + _1179;
    float _1183 = sqrt(_1181);
    bool _1185 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1189 = _1183 + _1187;
    float _1191 = _1161;
    float _1193 = _1181;
    float _1195 = _1189;
    float _1197 = _1153;
    float _1199 = _1173;
    if (_1185)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1201;
    }
    float _1203 = _1191;
    if (_1185)
    {
        float _1205 = rsqrt(_1181);
        _1193 = _1205;
    }
    float _1207 = _1193;
    if (_1185)
    {
        float _1209 = _1189 * _1203;
        _1195 = _1209;
    }
    float _1211 = _1195;
    if (_1185)
    {
        float _1213 = _1211 * 0.15915493667125701904296875;
        _1063 = _1213;
    }
    float _1215 = _1063;
    float _1217 = _1165;
    if (_1185)
    {
        float _1219 = _1215 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        _1217 = _1221;
    }
    float _1223 = _1217;
    float _1225 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1227 = precise::max(0.0, _1225);
    float _1229 = _1169;
    float _1231 = _1227;
    float _1233 = _1225;
    if (_1185)
    {
        float _1235 = _1215 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1229 = _1237;
    }
    float _1239 = _1229;
    float _1241 = -_1171;
    float _1243 = -_1227;
    float _1245 = fma(_1153, _1241, _1243);
    if (!_1185)
    {
        _1197 = _1175;
    }
    float _1247 = _1197;
    float _1249 = _1247;
    if (_1185)
    {
        float _1251 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1251;
    }
    float _1253 = _1231;
    float _1255 = _1253;
    float _1257 = _1223;
    if (_1185)
    {
        float _1259 = fma(_1223, _1253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1261;
    if (!_1185)
    {
        _1257 = _1245;
    }
    float _1265 = _1257;
    float _1267 = _1265;
    if (_1185)
    {
        float _1269 = _1239 + (-1.0);
        _1233 = _1269;
    }
    float _1271 = _1233;
    float _1273 = _1271;
    if (_1185)
    {
        float _1275 = _1207 * _1261;
        _1065 = _1275;
    }
    float _1277 = _1065;
    if (!_1185)
    {
        _1263 = _1177;
    }
    float _1279 = _1263;
    float _1281 = sqrt(_1167);
    float _1283 = _1279;
    if (_1185)
    {
        float _1285 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1273 = _1285;
    }
    float _1287 = _1273;
    float _1289 = _1287;
    if (_1185)
    {
        float _1291 = _1173 * _1277;
        _1199 = _1291;
    }
    float _1293 = _1199;
    if (_1185)
    {
        float _1295 = _1175 * _1277;
        _1249 = _1295;
    }
    float _1297 = _1249;
    if (_1185)
    {
        float _1299 = fma(_1245, _1239, _1287);
        _1267 = _1299;
    }
    float _1301 = _1267;
    if (_1185)
    {
        float _1303 = _1293 * _1293;
        _1283 = _1303;
    }
    float _1305 = _1283;
    if (!_1185)
    {
        _1289 = _1179;
    }
    float _1307 = _1289;
    float _1309 = _1307;
    if (_1185)
    {
        float _1311 = _1297 * _1297;
        _1309 = _1311;
    }
    float _1313 = _1309;
    float _1315 = fma(_1301, _1301, _1305);
    float _1317 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1321 = _1315 + _1313;
    float _1323 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1327 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1325);
    float _1329 = precise::clamp(_1327, 0.0, 1.0);
    float _1331 = rsqrt(_1321);
    float _1333 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1323);
    float _1335 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1337 = -_1329;
    float _1339 = _1337 + 1.0;
    float _1341 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1343 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1333);
    float _1345 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1335);
    float _1347 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1341);
    float _1349 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1351 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1345);
    float _1353 = abs(_1339);
    float _1355 = log2(_1353);
    float _1357 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1317);
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1361 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1347);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1365 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1357);
    float _1367 = _1331 * _1293;
    float _1369 = -_1359;
    float _1371 = fma(_1369, _1319, 1.0);
    float _1373 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1377 = _1331 * _1301;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1331 * _1297;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1375);
    float _1385 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1387 = -_1379;
    float _1389 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1393 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1383);
    float _1395 = log2(_1371);
    float _1397 = -_1381;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1403 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1393);
    float _1405 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1407 = fma(_1399, -0.5, 0.5);
    float _1409 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1401);
    float _1411 = _1377 + 1.0;
    float _1413 = exp2(_1391);
    float _1415 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1405);
    float _1417 = fma(_1399, 0.5, 0.5);
    float _1419 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1409);
    float _1421 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1415);
    float _1423 = fma(_1417, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1425 = 1.0 / _1403;
    float _1427 = _1395 * 0.693147182464599609375;
    float _1429 = fma(_1417, _1423, -0.212114393711090087890625);
    float _1431 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1433 = fma(_1417, _1429, 1.570728778839111328125);
    float _1435 = sqrt(_1407);
    float _1437 = -_1377;
    float _1439 = fma(_1413, _1411, _1437);
    float _1441 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1421);
    float _1443 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1419);
    float _1445 = fma(_1439, 0.5, 0.5);
    float _1447 = _1441 * _1425;
    float _1449 = _1443 * _1425;
    float _1451 = fma(_1447, 0.5, 0.5);
    float _1453 = fma(_1449, -0.5, 0.5);
    float _1455 = _1435 * 0.636619746685028076171875;
    float3 _3855 = float3(_1451, _1453, _1431);
    float _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3855, float3(0.0), isnan(_3855)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3855, float3(0.0), isnan(_3855)), level(0.0)).x;
    float3 _3866 = float3(_1451, _1453, _1431);
    float4 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3866, float3(0.0), isnan(_3866)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3866, float3(0.0), isnan(_3866)), level(0.0)).xyzw;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = _1460.w;
    float _1470 = -_1433;
    float _1472 = fma(_1455, _1470, 1.0);
    float2 _3888 = float2(_1472, _1445);
    float3 _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3888, float2(0.0), isnan(_3888)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3888, float2(0.0), isnan(_3888)), level(0.0)).xyz;
    float _1478 = _1476.x;
    float _1480 = _1476.y;
    float _1482 = _1476.z;
    float _1484 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1486 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1488 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1490 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    float _1492 = exp2(_1484);
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1496 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1490);
    float _1498 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1496);
    out.m_47.x = _1494;
    float _1500 = _1498 + _1403;
    out.gl_Position.x = _1441;
    out.gl_Position.y = _1443;
    out.gl_Position.z = _1498;
    out.gl_Position.w = _1403;
    float _1502 = _1500 * 0.5;
    float _1504 = -_1492;
    float _1506 = _1504 + 1.0;
    float _1508 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1502;
    out.m_64.w = _1403;
    float _1510 = _1508 * _1457;
    float _1512 = -_1508;
    float _1514 = _1512 + 1.0;
    float _1516 = _1468 * _1510;
    float _1518 = _1482 * _1510;
    float _1520 = fma(_1478, _1516, _1462);
    float _1522 = fma(_1480, _1516, _1464);
    float _1524 = _1468 * _1514;
    float _1526 = fma(_1468, _1518, _1466);
    out.m_66.x = _1520;
    out.m_66.y = _1522;
    out.m_66.z = _1526;
    out.m_66.w = _1524;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1101 = false;
    bool _645 = false;
    bool _385 = false;
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
        float _1583 = as_type<float>(_101);
        out.gl_Position.z = _1583;
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
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1652 = as_type<float>(_137);
        out.gl_Position.z = _1652;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = 0.0;
    float _163 = _147;
    if (!_157)
    {
        float _165 = _147 * _147;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_157)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _171 + _211;
    bool _215 = !_195;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_157;
    float _221 = _177;
    if (!_219)
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
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_157;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = fma(_205, 0.5, 0.5);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _287 = _285 != 0;
    float _289 = in.m_56.w;
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = -_213;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_201;
    int _301 = _299 ? 0 : 1;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_283;
    int _311 = _309 ? 0 : 1;
    float _313 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_279;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = fma(_277, _179, _313);
    int _327 = abs(_301);
    float _329 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = !_287;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_277, _181, _329);
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _339 = abs(_333);
    float _341 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_323);
    float _345 = float(_327);
    float _347 = fma(_277, _183, _341);
    float _349 = abs(_297);
    float _351 = _343 * _349;
    float _353 = fma(_335, _289, _305);
    float _355 = float(_339);
    float _357 = fma(_345, _321, _351);
    float _359 = fma(_325, _289, _303);
    float _361 = fma(_347, _289, _307);
    float _363 = abs(_317);
    float _365 = fma(_355, _363, _357);
    bool _367 = !_337;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = 1.0 / _397;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = 1.0 / _401;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _393 + _423;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _429 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _431 = _421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _433 = 1.0 / _405;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _393 + _435;
    float _439 = _425 * _411;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _393 + _441;
    out.m_58.x = _417;
    out.m_58.y = _429;
    out.m_58.z = _431;
    out.m_58.w = _427;
    float _445 = 1.0 / _409;
    float _447 = _437 * _419;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _393 + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _459 = fma(_455, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _461 = _443 * _433;
    bool _463 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _465 = isnan(_393);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _477 = isnan(_393);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    bool _487 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _489 = isnan(_393);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -_473;
    float _501 = _499 + 1.0;
    float _503 = -_485;
    float _505 = _503 + 1.0;
    float _507 = _451 * _445;
    bool _509 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _511 = isnan(_393);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _521;
    bool _525 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _527 = isnan(_393);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _497 * _505;
    float _539 = -_497;
    float _541 = _539 + 1.0;
    float _543 = _519 * _501;
    float _545 = -_519;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = fma(_523, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _559 = _535 * _541;
    float _561 = _485 * _547;
    float _563 = fma(_551, _447, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_555, _447, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = _557 * _559;
    float _569 = in.m_56.x;
    float _571 = in.m_56.y;
    float _573 = -_535;
    float _575 = _573 + 1.0;
    float _577 = _459 * _559;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _583;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _589 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _591 = fma(_581, _461, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _593 = fma(_585, _461, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _603 = fma(_563, _537, _587);
    float _605 = fma(_565, _537, _589);
    float _607 = fma(_597, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = fma(_601, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = fma(_591, _561, _603);
    float _613 = fma(_593, _561, _605);
    float _615 = fma(_607, _543, _611);
    float _617 = fma(_609, _543, _613);
    float _619 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[147].x, _615);
    float _621 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[147].y, _617);
    float _623 = _619 * _569;
    float _625 = _621 * _571;
    bool _627 = !_457;
    float _643;
    if (!_627)
    {
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _631 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        float _647 = float(_85);
        float _649 = 1.0 / _647;
        float _651 = _119 * _649;
        _643 = _651;
    }
    _645 = false;
    float _653 = _643;
    float _655 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _659 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _661 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _663 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _659);
    float _665 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _661);
    float _667 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _663);
    float _669 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _671 = sqrt(_667);
    float _673 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].x, _655);
    float _675 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _669);
    float _677 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _665);
    float _679 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _681 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].x, _673);
    float _683 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _675);
    float _685 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _689 = sqrt(_677);
    float _691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _693 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].z, _679);
    float _695 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].y, _687);
    float _697 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _699 = _685 * _691;
    float _701 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _703 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].y, _695);
    float _705 = sqrt(_683);
    float _707 = _681 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _709 = _701 * _657;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _713 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].z, _693);
    float _715 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].w, _697);
    float _717 = _671 * _707;
    float _719 = _709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _721 = _689 * _711;
    float _723 = _713 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _725 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].w, _715);
    float _727 = _709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _731 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _737 = _705 * _723;
    float _739 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _729);
    float _741 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _743 = _725 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _745 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _719);
    float _747 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _739);
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _741);
    float _751 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _755 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _747);
    float _757 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _749);
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _761 = _753 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _765 = _757 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _767 = in.m_51.y;
    float _769 = _763 + _761;
    float _771 = _765 + _759;
    bool _773 = _139 > 0.5;
    float _775 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _777 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _779 = _769 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _783 = _771 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = _779 * _779;
    float _791 = _783 * _783;
    float _793 = 1.0 / _787;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _797 = _795 != 0;
    float _799 = _709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _801 = _789 + _791;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _805 = _803 != 0;
    float _807 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _775);
    float _809 = -_209;
    int _811 = _773 ? as_type<int>(_809) : as_type<int>(_209);
    float _813 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _799);
    float _815 = sqrt(_801);
    float _817 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    bool _819 = !_797;
    float _821 = _819 ? _209 : as_type<float>(_811);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = _653 + _823;
    bool _827 = _767 > 0.5;
    float _829 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _813);
    float _831 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _817);
    bool _833 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _835 = isnan(_653);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _825 * _793;
    float _847 = -_217;
    int _849 = _827 ? as_type<int>(_847) : as_type<int>(_217);
    float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _853 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _855 = !_805;
    float _857 = _855 ? _217 : as_type<float>(_849);
    float _859 = _831 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _861;
    bool _865 = _815 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _867 = _859 + _853;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _869;
    bool _873 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _875 = isnan(_653);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_863, _845, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _887;
    float _891 = fma(_871, _845, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _893 = -_883;
    float _895 = _893 + 1.0;
    float _897 = fma(_889, _845, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _899 = _843 * _895;
    float _901 = _895;
    float _903 = _859;
    float _905 = _871;
    float _907 = _863;
    float _909 = _889;
    if (!_865)
    {
        _901 = _791;
    }
    float _911 = _901;
    float _913 = _911;
    if (!_865)
    {
        _903 = _789;
    }
    float _915 = _903;
    float _917 = _915;
    if (!_865)
    {
        _905 = _769;
    }
    float _919 = _905;
    float _921 = _919;
    if (!_865)
    {
        _907 = _771;
    }
    float _923 = _907;
    float _925 = _923;
    if (!_865)
    {
        _909 = _867;
    }
    float _927 = _909;
    bool _929 = !_865;
    float _931 = _927;
    if (!_929)
    {
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _937 = _815 + _935;
        float _939 = rsqrt(_801);
        float _941 = _937 * _933;
        float _943 = _867 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _945 = _941 * 0.15915493667125701904296875;
        float _947 = _945 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 * 6.283185482025146484375;
        float _953 = cos(_951);
        float _955 = fma(_949, _943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _957 = _939 * _955;
        float _959 = _953 + (-1.0);
        float _961 = fma(_779, _957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_783, _957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _965 = _959 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _969 = _961 + _967;
        float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _973 = _963 + _971;
        float _975 = fma(_867, _953, _965);
        float _977 = _969 * _969;
        float _979 = _973 * _973;
        _931 = _975;
        _917 = _977;
        _913 = _979;
        _921 = _961;
        _925 = _963;
    }
    float _981 = _931;
    float _983 = _917;
    float _985 = _913;
    float _987 = _921;
    float _989 = _925;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _993 = _981 + _991;
    float _995 = _885 * _899;
    float _997 = _891 * _899;
    float _999 = _897 * _899;
    float _1001 = -_843;
    float _1003 = _1001 + 1.0;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1007 = _821 + 0.5;
    float _1009 = fma(_993, _993, _983);
    float _1011 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].x, _995);
    float _1013 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].y, _997);
    float _1015 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].z, _999);
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = _1009 + _985;
    float _1021 = -_857;
    float _1023 = _1021 + 0.5;
    float _1025 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1011);
    float _1027 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1013);
    float _1029 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1015);
    float _1031 = _1017 * _851;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1035 = sqrt(_1019);
    float _1037 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1039 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1041 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1043 = _1033 * _1005;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1049 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1031;
    out.m_60.y = _1043;
    out.m_62.x = _1045;
    out.m_62.y = _1047;
    out.m_62.z = _1049;
    bool _1051 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1053 = isnan(_1035);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1059 = _1055 || _1057;
    float _1061 = _1017;
    float _1063 = _1045;
    float _1065 = _993;
    if (!_1059)
    {
        _1061 = 1.0;
    }
    float _1067 = _1061;
    bool _1069 = !_1059;
    float _1071 = _1067;
    if (!_1069)
    {
        bool _1073 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1075 = isnan(_1035);
        bool _1077 = _1073 || _1075;
        bool _1079 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1081 = _1077 || _1079;
        if (!_1081)
        {
            float _1083 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1085 = _1035 + _1083;
            float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1089 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1087;
            float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1093 = _1091 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1095 = 1.0 / _1089;
            float _1097 = _1085 * _1095;
            float _1099 = fma(_1097, _1093, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1071 = _1099;
            _1101 = true;
        }
        else
        {
            bool _1103 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1105 = isnan(_1035);
            bool _1107 = _1103 || _1105;
            bool _1109 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1111 = _1107 || _1109;
            if (!_1111)
            {
                float _1113 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1115 = _1035 + _1113;
                float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1119 = _1117 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1121 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1123 = _1121 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1125 = 1.0 / _1119;
                float _1127 = _1115 * _1125;
                float _1129 = fma(_1127, _1123, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1071 = _1129;
                _1101 = true;
            }
            else
            {
                _1071 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1101 = false;
    float _1131 = _1071;
    float _1133 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1135 = _981 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1139 = _987 + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1143 = _989 + _1141;
    float _1145 = fma(_1135, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1147 = fma(_1139, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1149 = fma(_1143, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1153 = _1145 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1157 = _1147 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1161 = _1149 + _1159;
    float _1163 = _1153 * _1153;
    float _1165 = fma(_1157, _1157, _1163);
    float _1167 = fma(_1161, _1161, _1165);
    float _1169 = rsqrt(_1167);
    float _1171 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1173 = _1157 * _1171;
    float _1175 = _1161 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 * _1175;
    float _1181 = _1177 + _1179;
    float _1183 = sqrt(_1181);
    bool _1185 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1189 = _1183 + _1187;
    float _1191 = _1161;
    float _1193 = _1181;
    float _1195 = _1189;
    float _1197 = _1153;
    float _1199 = _1173;
    if (_1185)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1201;
    }
    float _1203 = _1191;
    if (_1185)
    {
        float _1205 = rsqrt(_1181);
        _1193 = _1205;
    }
    float _1207 = _1193;
    if (_1185)
    {
        float _1209 = _1189 * _1203;
        _1195 = _1209;
    }
    float _1211 = _1195;
    if (_1185)
    {
        float _1213 = _1211 * 0.15915493667125701904296875;
        _1063 = _1213;
    }
    float _1215 = _1063;
    float _1217 = _1165;
    if (_1185)
    {
        float _1219 = _1215 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        _1217 = _1221;
    }
    float _1223 = _1217;
    float _1225 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1227 = precise::max(0.0, _1225);
    float _1229 = _1169;
    float _1231 = _1227;
    float _1233 = _1225;
    if (_1185)
    {
        float _1235 = _1215 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1229 = _1237;
    }
    float _1239 = _1229;
    float _1241 = -_1171;
    float _1243 = -_1227;
    float _1245 = fma(_1153, _1241, _1243);
    if (!_1185)
    {
        _1197 = _1175;
    }
    float _1247 = _1197;
    float _1249 = _1247;
    if (_1185)
    {
        float _1251 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1251;
    }
    float _1253 = _1231;
    float _1255 = _1253;
    float _1257 = _1223;
    if (_1185)
    {
        float _1259 = fma(_1223, _1253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1261;
    if (!_1185)
    {
        _1257 = _1245;
    }
    float _1265 = _1257;
    float _1267 = _1265;
    if (_1185)
    {
        float _1269 = _1239 + (-1.0);
        _1233 = _1269;
    }
    float _1271 = _1233;
    float _1273 = _1271;
    if (_1185)
    {
        float _1275 = _1207 * _1261;
        _1065 = _1275;
    }
    float _1277 = _1065;
    if (!_1185)
    {
        _1263 = _1177;
    }
    float _1279 = _1263;
    float _1281 = sqrt(_1167);
    float _1283 = _1279;
    if (_1185)
    {
        float _1285 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1273 = _1285;
    }
    float _1287 = _1273;
    float _1289 = _1287;
    if (_1185)
    {
        float _1291 = _1173 * _1277;
        _1199 = _1291;
    }
    float _1293 = _1199;
    if (_1185)
    {
        float _1295 = _1175 * _1277;
        _1249 = _1295;
    }
    float _1297 = _1249;
    if (_1185)
    {
        float _1299 = fma(_1245, _1239, _1287);
        _1267 = _1299;
    }
    float _1301 = _1267;
    if (_1185)
    {
        float _1303 = _1293 * _1293;
        _1283 = _1303;
    }
    float _1305 = _1283;
    if (!_1185)
    {
        _1289 = _1179;
    }
    float _1307 = _1289;
    float _1309 = _1307;
    if (_1185)
    {
        float _1311 = _1297 * _1297;
        _1309 = _1311;
    }
    float _1313 = _1309;
    float _1315 = fma(_1301, _1301, _1305);
    float _1317 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1321 = _1315 + _1313;
    float _1323 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1327 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1325);
    float _1329 = precise::clamp(_1327, 0.0, 1.0);
    float _1331 = rsqrt(_1321);
    float _1333 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1323);
    float _1335 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1337 = -_1329;
    float _1339 = _1337 + 1.0;
    float _1341 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1343 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1333);
    float _1345 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1335);
    float _1347 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1341);
    float _1349 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1351 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1345);
    float _1353 = abs(_1339);
    float _1355 = log2(_1353);
    float _1357 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1317);
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1361 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1347);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1365 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1357);
    float _1367 = _1331 * _1293;
    float _1369 = -_1359;
    float _1371 = fma(_1369, _1319, 1.0);
    float _1373 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1377 = _1331 * _1301;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1331 * _1297;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1375);
    float _1385 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1387 = -_1379;
    float _1389 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1393 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1383);
    float _1395 = log2(_1371);
    float _1397 = -_1381;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1403 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1393);
    float _1405 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1407 = fma(_1399, -0.5, 0.5);
    float _1409 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1401);
    float _1411 = _1377 + 1.0;
    float _1413 = exp2(_1391);
    float _1415 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1405);
    float _1417 = fma(_1399, 0.5, 0.5);
    float _1419 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1409);
    float _1421 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1415);
    float _1423 = fma(_1417, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1425 = 1.0 / _1403;
    float _1427 = _1395 * 0.693147182464599609375;
    float _1429 = fma(_1417, _1423, -0.212114393711090087890625);
    float _1431 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1433 = fma(_1417, _1429, 1.570728778839111328125);
    float _1435 = sqrt(_1407);
    float _1437 = -_1377;
    float _1439 = fma(_1413, _1411, _1437);
    float _1441 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1421);
    float _1443 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1419);
    float _1445 = fma(_1439, 0.5, 0.5);
    float _1447 = _1441 * _1425;
    float _1449 = _1443 * _1425;
    float _1451 = fma(_1447, 0.5, 0.5);
    float _1453 = fma(_1449, -0.5, 0.5);
    float _1455 = _1435 * 0.636619746685028076171875;
    float3 _3855 = float3(_1451, _1453, _1431);
    float _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3855, float3(0.0), isnan(_3855)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3855, float3(0.0), isnan(_3855)), level(0.0)).x;
    float3 _3866 = float3(_1451, _1453, _1431);
    float4 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3866, float3(0.0), isnan(_3866)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3866, float3(0.0), isnan(_3866)), level(0.0)).xyzw;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = _1460.w;
    float _1470 = -_1433;
    float _1472 = fma(_1455, _1470, 1.0);
    float2 _3888 = float2(_1472, _1445);
    float3 _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3888, float2(0.0), isnan(_3888)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3888, float2(0.0), isnan(_3888)), level(0.0)).xyz;
    float _1478 = _1476.x;
    float _1480 = _1476.y;
    float _1482 = _1476.z;
    float _1484 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1486 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1488 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1490 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    float _1492 = exp2(_1484);
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1496 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1490);
    float _1498 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1496);
    out.m_47.x = _1494;
    float _1500 = _1498 + _1403;
    out.gl_Position.x = _1441;
    out.gl_Position.y = _1443;
    out.gl_Position.z = _1498;
    out.gl_Position.w = _1403;
    float _1502 = _1500 * 0.5;
    float _1504 = -_1492;
    float _1506 = _1504 + 1.0;
    float _1508 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1502;
    out.m_64.w = _1403;
    float _1510 = _1508 * _1457;
    float _1512 = -_1508;
    float _1514 = _1512 + 1.0;
    float _1516 = _1468 * _1510;
    float _1518 = _1482 * _1510;
    float _1520 = fma(_1478, _1516, _1462);
    float _1522 = fma(_1480, _1516, _1464);
    float _1524 = _1468 * _1514;
    float _1526 = fma(_1468, _1518, _1466);
    out.m_66.x = _1520;
    out.m_66.y = _1522;
    out.m_66.z = _1526;
    out.m_66.w = _1524;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1101 = false;
    bool _645 = false;
    bool _385 = false;
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
        float _1583 = as_type<float>(_101);
        out.gl_Position.z = _1583;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1652 = as_type<float>(_137);
        out.gl_Position.z = _1652;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = 0.0;
    float _163 = _147;
    if (!_157)
    {
        float _165 = _147 * _147;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_157)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _171 + _211;
    bool _215 = !_195;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_157;
    float _221 = _177;
    if (!_219)
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
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_157;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = fma(_205, 0.5, 0.5);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _287 = _285 != 0;
    float _289 = in.m_56.w;
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = -_213;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_201;
    int _301 = _299 ? 0 : 1;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_283;
    int _311 = _309 ? 0 : 1;
    float _313 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_279;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = fma(_277, _179, _313);
    int _327 = abs(_301);
    float _329 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = !_287;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_277, _181, _329);
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _339 = abs(_333);
    float _341 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_323);
    float _345 = float(_327);
    float _347 = fma(_277, _183, _341);
    float _349 = abs(_297);
    float _351 = _343 * _349;
    float _353 = fma(_335, _289, _305);
    float _355 = float(_339);
    float _357 = fma(_345, _321, _351);
    float _359 = fma(_325, _289, _303);
    float _361 = fma(_347, _289, _307);
    float _363 = abs(_317);
    float _365 = fma(_355, _363, _357);
    bool _367 = !_337;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = 1.0 / _397;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = 1.0 / _401;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _393 + _423;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _429 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _431 = _421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _433 = 1.0 / _405;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _437 = _393 + _435;
    float _439 = _425 * _411;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _393 + _441;
    out.m_58.x = _417;
    out.m_58.y = _429;
    out.m_58.z = _431;
    out.m_58.w = _427;
    float _445 = 1.0 / _409;
    float _447 = _437 * _419;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _393 + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _459 = fma(_455, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _461 = _443 * _433;
    bool _463 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _465 = isnan(_393);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _477 = isnan(_393);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    bool _487 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _489 = isnan(_393);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -_473;
    float _501 = _499 + 1.0;
    float _503 = -_485;
    float _505 = _503 + 1.0;
    float _507 = _451 * _445;
    bool _509 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _511 = isnan(_393);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _521;
    bool _525 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _527 = isnan(_393);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _497 * _505;
    float _539 = -_497;
    float _541 = _539 + 1.0;
    float _543 = _519 * _501;
    float _545 = -_519;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = fma(_523, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _559 = _535 * _541;
    float _561 = _485 * _547;
    float _563 = fma(_551, _447, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _565 = fma(_555, _447, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _567 = _557 * _559;
    float _569 = in.m_56.x;
    float _571 = in.m_56.y;
    float _573 = -_535;
    float _575 = _573 + 1.0;
    float _577 = _459 * _559;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _583;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].x, _567);
    float _589 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _591 = fma(_581, _461, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _593 = fma(_585, _461, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _603 = fma(_563, _537, _587);
    float _605 = fma(_565, _537, _589);
    float _607 = fma(_597, _507, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = fma(_601, _507, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = fma(_591, _561, _603);
    float _613 = fma(_593, _561, _605);
    float _615 = fma(_607, _543, _611);
    float _617 = fma(_609, _543, _613);
    float _619 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[147].x, _615);
    float _621 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[147].y, _617);
    float _623 = _619 * _569;
    float _625 = _621 * _571;
    bool _627 = !_457;
    float _643;
    if (!_627)
    {
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _631 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        float _647 = float(_85);
        float _649 = 1.0 / _647;
        float _651 = _119 * _649;
        _643 = _651;
    }
    _645 = false;
    float _653 = _643;
    float _655 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _659 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _661 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _663 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _659);
    float _665 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _661);
    float _667 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _663);
    float _669 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _671 = sqrt(_667);
    float _673 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].x, _655);
    float _675 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _669);
    float _677 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _665);
    float _679 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _681 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].x, _673);
    float _683 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _675);
    float _685 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _689 = sqrt(_677);
    float _691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _693 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].z, _679);
    float _695 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].y, _687);
    float _697 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _699 = _685 * _691;
    float _701 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _703 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].y, _695);
    float _705 = sqrt(_683);
    float _707 = _681 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _709 = _701 * _657;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _713 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].z, _693);
    float _715 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].w, _697);
    float _717 = _671 * _707;
    float _719 = _709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _721 = _689 * _711;
    float _723 = _713 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _725 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].w, _715);
    float _727 = _709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _731 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _737 = _705 * _723;
    float _739 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _729);
    float _741 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _743 = _725 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _745 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _719);
    float _747 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _739);
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _741);
    float _751 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _755 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _747);
    float _757 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _749);
    float _759 = _751 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _761 = _753 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _765 = _757 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _767 = in.m_51.y;
    float _769 = _763 + _761;
    float _771 = _765 + _759;
    bool _773 = _139 > 0.5;
    float _775 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _777 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _779 = _769 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _783 = _771 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = _779 * _779;
    float _791 = _783 * _783;
    float _793 = 1.0 / _787;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _797 = _795 != 0;
    float _799 = _709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _801 = _789 + _791;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _805 = _803 != 0;
    float _807 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _775);
    float _809 = -_209;
    int _811 = _773 ? as_type<int>(_809) : as_type<int>(_209);
    float _813 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _799);
    float _815 = sqrt(_801);
    float _817 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _807);
    bool _819 = !_797;
    float _821 = _819 ? _209 : as_type<float>(_811);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _825 = _653 + _823;
    bool _827 = _767 > 0.5;
    float _829 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _813);
    float _831 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _817);
    bool _833 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _835 = isnan(_653);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _825 * _793;
    float _847 = -_217;
    int _849 = _827 ? as_type<int>(_847) : as_type<int>(_217);
    float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _853 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _855 = !_805;
    float _857 = _855 ? _217 : as_type<float>(_849);
    float _859 = _831 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _861;
    bool _865 = _815 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _867 = _859 + _853;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _869;
    bool _873 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _875 = isnan(_653);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_863, _845, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _887;
    float _891 = fma(_871, _845, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _893 = -_883;
    float _895 = _893 + 1.0;
    float _897 = fma(_889, _845, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _899 = _843 * _895;
    float _901 = _895;
    float _903 = _859;
    float _905 = _871;
    float _907 = _863;
    float _909 = _889;
    if (!_865)
    {
        _901 = _791;
    }
    float _911 = _901;
    float _913 = _911;
    if (!_865)
    {
        _903 = _789;
    }
    float _915 = _903;
    float _917 = _915;
    if (!_865)
    {
        _905 = _769;
    }
    float _919 = _905;
    float _921 = _919;
    if (!_865)
    {
        _907 = _771;
    }
    float _923 = _907;
    float _925 = _923;
    if (!_865)
    {
        _909 = _867;
    }
    float _927 = _909;
    bool _929 = !_865;
    float _931 = _927;
    if (!_929)
    {
        float _933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _937 = _815 + _935;
        float _939 = rsqrt(_801);
        float _941 = _937 * _933;
        float _943 = _867 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _945 = _941 * 0.15915493667125701904296875;
        float _947 = _945 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 * 6.283185482025146484375;
        float _953 = cos(_951);
        float _955 = fma(_949, _943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _957 = _939 * _955;
        float _959 = _953 + (-1.0);
        float _961 = fma(_779, _957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_783, _957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _965 = _959 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _969 = _961 + _967;
        float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _973 = _963 + _971;
        float _975 = fma(_867, _953, _965);
        float _977 = _969 * _969;
        float _979 = _973 * _973;
        _931 = _975;
        _917 = _977;
        _913 = _979;
        _921 = _961;
        _925 = _963;
    }
    float _981 = _931;
    float _983 = _917;
    float _985 = _913;
    float _987 = _921;
    float _989 = _925;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _993 = _981 + _991;
    float _995 = _885 * _899;
    float _997 = _891 * _899;
    float _999 = _897 * _899;
    float _1001 = -_843;
    float _1003 = _1001 + 1.0;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1007 = _821 + 0.5;
    float _1009 = fma(_993, _993, _983);
    float _1011 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].x, _995);
    float _1013 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].y, _997);
    float _1015 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[123].z, _999);
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1019 = _1009 + _985;
    float _1021 = -_857;
    float _1023 = _1021 + 0.5;
    float _1025 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1011);
    float _1027 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1013);
    float _1029 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1015);
    float _1031 = _1017 * _851;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1035 = sqrt(_1019);
    float _1037 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1039 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1041 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1043 = _1033 * _1005;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1049 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1031;
    out.m_60.y = _1043;
    out.m_62.x = _1045;
    out.m_62.y = _1047;
    out.m_62.z = _1049;
    bool _1051 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1053 = isnan(_1035);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1059 = _1055 || _1057;
    float _1061 = _1017;
    float _1063 = _1045;
    float _1065 = _993;
    if (!_1059)
    {
        _1061 = 1.0;
    }
    float _1067 = _1061;
    bool _1069 = !_1059;
    float _1071 = _1067;
    if (!_1069)
    {
        bool _1073 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1075 = isnan(_1035);
        bool _1077 = _1073 || _1075;
        bool _1079 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1081 = _1077 || _1079;
        if (!_1081)
        {
            float _1083 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1085 = _1035 + _1083;
            float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1089 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1087;
            float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1093 = _1091 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1095 = 1.0 / _1089;
            float _1097 = _1085 * _1095;
            float _1099 = fma(_1097, _1093, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1071 = _1099;
            _1101 = true;
        }
        else
        {
            bool _1103 = _1035 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1105 = isnan(_1035);
            bool _1107 = _1103 || _1105;
            bool _1109 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1111 = _1107 || _1109;
            if (!_1111)
            {
                float _1113 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1115 = _1035 + _1113;
                float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1119 = _1117 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1121 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1123 = _1121 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1125 = 1.0 / _1119;
                float _1127 = _1115 * _1125;
                float _1129 = fma(_1127, _1123, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1071 = _1129;
                _1101 = true;
            }
            else
            {
                _1071 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1101 = false;
    float _1131 = _1071;
    float _1133 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1135 = _981 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1139 = _987 + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1143 = _989 + _1141;
    float _1145 = fma(_1135, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1147 = fma(_1139, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1149 = fma(_1143, _1131, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1153 = _1145 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1157 = _1147 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1161 = _1149 + _1159;
    float _1163 = _1153 * _1153;
    float _1165 = fma(_1157, _1157, _1163);
    float _1167 = fma(_1161, _1161, _1165);
    float _1169 = rsqrt(_1167);
    float _1171 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1173 = _1157 * _1171;
    float _1175 = _1161 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 * _1175;
    float _1181 = _1177 + _1179;
    float _1183 = sqrt(_1181);
    bool _1185 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1189 = _1183 + _1187;
    float _1191 = _1161;
    float _1193 = _1181;
    float _1195 = _1189;
    float _1197 = _1153;
    float _1199 = _1173;
    if (_1185)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1201;
    }
    float _1203 = _1191;
    if (_1185)
    {
        float _1205 = rsqrt(_1181);
        _1193 = _1205;
    }
    float _1207 = _1193;
    if (_1185)
    {
        float _1209 = _1189 * _1203;
        _1195 = _1209;
    }
    float _1211 = _1195;
    if (_1185)
    {
        float _1213 = _1211 * 0.15915493667125701904296875;
        _1063 = _1213;
    }
    float _1215 = _1063;
    float _1217 = _1165;
    if (_1185)
    {
        float _1219 = _1215 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        _1217 = _1221;
    }
    float _1223 = _1217;
    float _1225 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1227 = precise::max(0.0, _1225);
    float _1229 = _1169;
    float _1231 = _1227;
    float _1233 = _1225;
    if (_1185)
    {
        float _1235 = _1215 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1229 = _1237;
    }
    float _1239 = _1229;
    float _1241 = -_1171;
    float _1243 = -_1227;
    float _1245 = fma(_1153, _1241, _1243);
    if (!_1185)
    {
        _1197 = _1175;
    }
    float _1247 = _1197;
    float _1249 = _1247;
    if (_1185)
    {
        float _1251 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1251;
    }
    float _1253 = _1231;
    float _1255 = _1253;
    float _1257 = _1223;
    if (_1185)
    {
        float _1259 = fma(_1223, _1253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1261;
    if (!_1185)
    {
        _1257 = _1245;
    }
    float _1265 = _1257;
    float _1267 = _1265;
    if (_1185)
    {
        float _1269 = _1239 + (-1.0);
        _1233 = _1269;
    }
    float _1271 = _1233;
    float _1273 = _1271;
    if (_1185)
    {
        float _1275 = _1207 * _1261;
        _1065 = _1275;
    }
    float _1277 = _1065;
    if (!_1185)
    {
        _1263 = _1177;
    }
    float _1279 = _1263;
    float _1281 = sqrt(_1167);
    float _1283 = _1279;
    if (_1185)
    {
        float _1285 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1273 = _1285;
    }
    float _1287 = _1273;
    float _1289 = _1287;
    if (_1185)
    {
        float _1291 = _1173 * _1277;
        _1199 = _1291;
    }
    float _1293 = _1199;
    if (_1185)
    {
        float _1295 = _1175 * _1277;
        _1249 = _1295;
    }
    float _1297 = _1249;
    if (_1185)
    {
        float _1299 = fma(_1245, _1239, _1287);
        _1267 = _1299;
    }
    float _1301 = _1267;
    if (_1185)
    {
        float _1303 = _1293 * _1293;
        _1283 = _1303;
    }
    float _1305 = _1283;
    if (!_1185)
    {
        _1289 = _1179;
    }
    float _1307 = _1289;
    float _1309 = _1307;
    if (_1185)
    {
        float _1311 = _1297 * _1297;
        _1309 = _1311;
    }
    float _1313 = _1309;
    float _1315 = fma(_1301, _1301, _1305);
    float _1317 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1321 = _1315 + _1313;
    float _1323 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1327 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1325);
    float _1329 = precise::clamp(_1327, 0.0, 1.0);
    float _1331 = rsqrt(_1321);
    float _1333 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1323);
    float _1335 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1337 = -_1329;
    float _1339 = _1337 + 1.0;
    float _1341 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1343 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1333);
    float _1345 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1335);
    float _1347 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1341);
    float _1349 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1351 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1345);
    float _1353 = abs(_1339);
    float _1355 = log2(_1353);
    float _1357 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1317);
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1361 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1347);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1365 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1357);
    float _1367 = _1331 * _1293;
    float _1369 = -_1359;
    float _1371 = fma(_1369, _1319, 1.0);
    float _1373 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1377 = _1331 * _1301;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1331 * _1297;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1375);
    float _1385 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1387 = -_1379;
    float _1389 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1393 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1383);
    float _1395 = log2(_1371);
    float _1397 = -_1381;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1403 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1393);
    float _1405 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1407 = fma(_1399, -0.5, 0.5);
    float _1409 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1401);
    float _1411 = _1377 + 1.0;
    float _1413 = exp2(_1391);
    float _1415 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1405);
    float _1417 = fma(_1399, 0.5, 0.5);
    float _1419 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1409);
    float _1421 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1415);
    float _1423 = fma(_1417, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1425 = 1.0 / _1403;
    float _1427 = _1395 * 0.693147182464599609375;
    float _1429 = fma(_1417, _1423, -0.212114393711090087890625);
    float _1431 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1433 = fma(_1417, _1429, 1.570728778839111328125);
    float _1435 = sqrt(_1407);
    float _1437 = -_1377;
    float _1439 = fma(_1413, _1411, _1437);
    float _1441 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1421);
    float _1443 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1419);
    float _1445 = fma(_1439, 0.5, 0.5);
    float _1447 = _1441 * _1425;
    float _1449 = _1443 * _1425;
    float _1451 = fma(_1447, 0.5, 0.5);
    float _1453 = fma(_1449, -0.5, 0.5);
    float _1455 = _1435 * 0.636619746685028076171875;
    float3 _3855 = float3(_1451, _1453, _1431);
    float _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3855, float3(0.0), isnan(_3855)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3855, float3(0.0), isnan(_3855)), level(0.0)).x;
    float3 _3866 = float3(_1451, _1453, _1431);
    float4 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3866, float3(0.0), isnan(_3866)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3866, float3(0.0), isnan(_3866)), level(0.0)).xyzw;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = _1460.w;
    float _1470 = -_1433;
    float _1472 = fma(_1455, _1470, 1.0);
    float2 _3888 = float2(_1472, _1445);
    float3 _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3888, float2(0.0), isnan(_3888)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3888, float2(0.0), isnan(_3888)), level(0.0)).xyz;
    float _1478 = _1476.x;
    float _1480 = _1476.y;
    float _1482 = _1476.z;
    float _1484 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1486 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1488 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1490 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    float _1492 = exp2(_1484);
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1496 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1490);
    float _1498 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1496);
    out.m_47.x = _1494;
    float _1500 = _1498 + _1403;
    out.gl_Position.x = _1441;
    out.gl_Position.y = _1443;
    out.gl_Position.z = _1498;
    out.gl_Position.w = _1403;
    float _1502 = _1500 * 0.5;
    float _1504 = -_1492;
    float _1506 = _1504 + 1.0;
    float _1508 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1502;
    out.m_64.w = _1403;
    float _1510 = _1508 * _1457;
    float _1512 = -_1508;
    float _1514 = _1512 + 1.0;
    float _1516 = _1468 * _1510;
    float _1518 = _1482 * _1510;
    float _1520 = fma(_1478, _1516, _1462);
    float _1522 = fma(_1480, _1516, _1464);
    float _1524 = _1468 * _1514;
    float _1526 = fma(_1468, _1518, _1466);
    out.m_66.x = _1520;
    out.m_66.y = _1522;
    out.m_66.z = _1526;
    out.m_66.w = _1524;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

