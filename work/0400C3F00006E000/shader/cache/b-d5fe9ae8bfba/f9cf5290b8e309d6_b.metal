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
    float4 m_51 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_66 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _441 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2200 = as_type<float>(_101);
        out.gl_Position.z = _2200;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    float _105 = in.m_49.x;
    bool _107 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_103);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_103;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _105;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2273 = as_type<float>(_141);
        out.gl_Position.z = _2273;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _145 * _143;
    float _171 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = _173 * 6.283185482025146484375;
    float _179 = floor(_173);
    int _181 = as_type<int>(_147) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_147) & 2;
    bool _187 = _185 != 0;
    float _189 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    float _191 = _177 * 0.15915493667125701904296875;
    float _193 = _147;
    float _195 = _189;
    if (!_165)
    {
        float _197 = _149 * _149;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _189 * 6.283185482025146484375;
    float _205 = floor(_189);
    float _207 = _201;
    if (!_165)
    {
        float _209 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = _203 * 0.15915493667125701904296875;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _191 * 6.283185482025146484375;
    float _221 = cos(_219);
    float _223 = -_179;
    float _225 = _173 + _223;
    bool _227 = !_183;
    int _229 = _227 ? (-1090519040) : 1056964608;
    bool _231 = !_187;
    int _233 = _231 ? (-1090519040) : 1056964608;
    float _235 = _213 * 6.283185482025146484375;
    float _237 = cos(_235);
    float _239 = -_205;
    float _241 = _189 + _239;
    float _243 = _211;
    if (!_165)
    {
        _195 = _149;
    }
    float _245 = _195;
    bool _247 = !_165;
    float _249 = _245;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _149 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _149);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _279;
    }
    float _281 = _243;
    bool _283 = !_165;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _149 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _249 = _303;
    }
    float _305 = _249;
    float _307 = in.m_56.w;
    bool _309 = _225 < 0.5;
    float _311 = float(_309);
    float _313 = fma(_221, 0.5, 0.5);
    float _315 = in.m_42.x;
    float _317 = in.m_42.y;
    float _319 = in.m_42.z;
    float _321 = -_225;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_311;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _329 = _241 < 0.5;
    float _331 = float(_329);
    float _333 = -_313;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_237, 0.5, 0.5);
    float _339 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _347 = _345 != 0;
    float _349 = -_241;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = -_331;
    float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _357 = -_337;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _361 = fma(_305, _151, _339);
    float _363 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _365 = !_217;
    int _367 = _365 ? 0 : 1;
    out.m_58.x = as_type<float>(_229);
    out.m_58.y = as_type<float>(_233);
    bool _369 = !_343;
    int _371 = _369 ? 0 : 1;
    float _373 = fma(_305, _153, _363);
    int _375 = abs(_367);
    float _377 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _379 = !_347;
    int _381 = _379 ? 0 : 1;
    int _383 = abs(_371);
    float _385 = fma(_305, _155, _377);
    float _387 = fma(_361, _307, _315);
    int _389 = abs(_381);
    float _391 = fma(_373, _307, _317);
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _395 = fma(_385, _307, _319);
    float _397 = float(_383);
    float _399 = float(_375);
    float _401 = abs(_323);
    float _403 = _397 * _401;
    float _405 = abs(_351);
    float _407 = _397 * _405;
    float _409 = float(_389);
    float _411 = fma(_399, _335, _403);
    float _413 = fma(_399, _359, _407);
    float _415 = abs(_327);
    float _417 = fma(_409, _415, _411);
    float _419 = abs(_355);
    float _421 = fma(_409, _419, _413);
    bool _423 = !_393;
    float _439;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _427 = _105 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_85);
        float _445 = 1.0 / _443;
        float _447 = _119 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_49.z;
    float _453 = _105 * 2.0;
    float _455 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = in.m_49.y;
    float _459 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = _105 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _467 = floor(_453);
    float _469 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _471 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _473 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _475 = -_465;
    float _477 = fma(_463, 2.0, _475);
    float _479 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
    float _481 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _471);
    float _483 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    float _485 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _501 = _499 != 0;
    float _503 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _485);
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _507 = _505 != 0;
    float _509 = _451 * 2.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _511;
    bool _515 = _467 > 0.0;
    float _517 = 1.0 / _489;
    bool _519 = _467 >= 0.0;
    bool _521 = isnan(_467);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = _457 * 2.0;
    float _531 = _457 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _535 = _449 + _533;
    int _537 = _527 ? 0 : 1;
    float _539 = _479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _541 = floor(_509);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _545 = _105 + _451;
    float _547 = _483 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _549 = fma(_531, -2.0, _543);
    float _551 = _105 + _457;
    float _553 = 1.0 / _513;
    float _555 = _535 * _517;
    float _557 = _551 + (-1.0);
    float _559 = _545 + (-1.0);
    float _561 = _509;
    float _563 = _559;
    if (!_507)
    {
        _561 = _451;
    }
    float _565 = _561;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _539 + _567;
    float _571 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _573 = floor(_529);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _577 = _449 + _575;
    bool _579 = _541 >= 0.0;
    bool _581 = isnan(_541);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    float _589 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _591 = -_547;
    float _593 = _591 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _595 = _587 ? 0 : 1;
    float _597 = _481 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _599 = _577 * _553;
    float _601 = _457 + _451;
    float _603 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _503);
    float _605 = _565;
    float _607 = _593;
    float _609 = _597;
    if (!_507)
    {
        _563 = _457;
    }
    float _611 = _563;
    float _613 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _615 = log2(_613);
    float _617 = _601 + (-1.0);
    bool _619 = _573 > 0.0;
    float _621 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _623 = _573 >= 0.0;
    bool _625 = isnan(_573);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = rsqrt(_603);
    float _635 = _617;
    float _637 = _611;
    if (!_507)
    {
        _635 = _451;
    }
    float _639 = _635;
    float _641 = _639;
    if (_507)
    {
        _637 = _105;
    }
    float _643 = _637;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    if (_507)
    {
        _605 = _457;
    }
    float _649 = _605;
    if (_507)
    {
        _641 = _457;
    }
    float _651 = _641;
    float _653 = fma(_647, _599, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _655 = _541 > 0.0;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _659 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].z, _657);
    float _661 = _643 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _665 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _667 = isnan(_449);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _679 = ~_537;
    int _681 = _679 + 1;
    int _683 = _681 + 1;
    float _685 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[83].w, _663);
    bool _687 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _689 = isnan(_449);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_677;
    float _701 = fma(_661, 2.0, _699);
    float _703 = abs(_569);
    float _705 = abs(_593);
    float _707 = precise::max(_703, _705);
    float _709 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _711 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _713 = isnan(_449);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_675;
    float _725 = _723 + 1.0;
    float _727 = -_697;
    float _729 = _727 + 1.0;
    int _731 = _683;
    if (!_515)
    {
        int _733 = ~_537;
        int _735 = _733 + 1;
        _731 = _735;
    }
    int _737 = _731;
    float _739 = _633 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _741 = _707 >= 16.0;
    float _743 = _615 * _119;
    float _745 = _697 * _725;
    float _747 = _721 * _729;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _753 = -_721;
    float _755 = _753 + 1.0;
    float _757 = exp2(_743);
    float _759 = _653 * _747;
    float _761 = fma(_751, _555, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _763 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[143].x, _759);
    int _765 = _631 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _767;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _773 = ~_765;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = fma(_761, _745, _763);
    int _781 = _777;
    if (!_619)
    {
        int _783 = ~_765;
        int _785 = _783 + 1;
        _781 = _785;
    }
    int _787 = _781;
    float _789 = fma(_769, _599, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _791 = fma(_709, -2.0, _771);
    float _793 = in.m_56.x;
    float _795 = in.m_56.y;
    int _797 = ~_595;
    int _799 = _797 + 1;
    int _801 = _799 + 1;
    float _803 = -_757;
    float _805 = _803 + 1.0;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _809 = _801;
    if (!_655)
    {
        int _811 = ~_595;
        int _813 = _811 + 1;
        _809 = _813;
    }
    int _815 = _809;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _819 = 1.0 + _817;
    bool _821 = !_501;
    int _823 = _821 ? 0 : 1;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _827 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _835 = _831 || _833;
    float _837 = 1.0 / _819;
    bool _839 = !_493;
    int _841 = _839 ? 0 : 1;
    float _843 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[78].z, _807);
    int _845 = abs(_823);
    float _847 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[78].w, _825);
    bool _849 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(1.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _843);
    int _861 = abs(_841);
    float _863 = -_119;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[76].x, _477);
    float _867 = _835 ? _805 : 0.0;
    float _869 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _685);
    float _871 = -_119;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[81].x, _701);
    float _875 = float(_845);
    float _877 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _659);
    float _879 = float(_787);
    float _881 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[145].x, _779);
    float _883 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    float _885 = float(_815);
    float _887 = _875 * _879;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _597 + _889;
    float _893 = float(_861);
    float _895 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _897 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _899 = _891 * _891;
    bool _901 = _857;
    if (_857)
    {
        float _903 = _867 * _837;
        _123 = _903;
    }
    float _905 = _123;
    float _907 = _893 * _885;
    float _909 = _881 * _793;
    bool _911 = !_497;
    int _913 = _911 ? 0 : 1;
    float _915 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _917 = _547 + _915;
    float _919 = fma(_569, _569, _899);
    float _921 = _907 * (-2.0);
    float _923 = _105 + (-0.5);
    int _925 = abs(_913);
    float _927 = fma(_917, _917, _919);
    float _929 = fma(_571, _921, _571);
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _933 = _887 * (-2.0);
    float _935 = _417 * _909;
    float _937 = fma(_929, _905, _931);
    float _939 = rsqrt(_927);
    float _941 = _451 + (-0.5);
    float _943 = fma(_589, _933, _589);
    float _945 = _569 * 0.0625;
    float _947 = float(_737);
    float _949 = _941 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _951 = float(_925);
    float _953 = _935 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _955 = as_type<int>(_917);
    int _957 = as_type<int>(_905);
    if (_741)
    {
        float _959 = _593 * 0.0625;
        _607 = _959;
    }
    float _961 = _607;
    float _963 = fma(_943, _905, _949);
    float _965 = _741 ? _945 : _569;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _969 = _951 * _947;
    float _971 = _937 * 0.15915493667125701904296875;
    float _973 = abs(_965);
    bool _975 = _973 != 0.0;
    bool _977 = isnan(_973);
    bool _979 = _975 || _977;
    bool _981 = isnan(0.0);
    bool _983 = _979 || _981;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _989 = _967 * _939;
    float _991 = _969 * (-2.0);
    float _993 = abs(_961);
    bool _995 = _993 == 0.0;
    bool _997 = !_983;
    bool _999 = _995 && _997;
    float _1001 = _739 * (-0.15915493667125701904296875);
    float _1003 = _891 * _989;
    float _1005 = fma(_621, _991, _621);
    float _1007 = _569 * _989;
    float _1009 = _963 * 0.15915493667125701904296875;
    float _1011 = fma(_987, _555, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1013 = -_1003;
    float _1015 = _891 + _1013;
    float _1017 = abs(_961);
    bool _1019 = _1017 == 0.0;
    float _1021 = -_1007;
    float _1023 = _569 + _1021;
    float _1025 = _1001 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _1015 * _1015;
    float _1031 = _457 + (-0.5);
    float _1033 = _917 * _989;
    float _1035 = _1003;
    float _1037 = _1033;
    if (_999)
    {
        bool _1039 = as_type<int>(_961) >= 0;
        _901 = _1039;
    }
    bool _1041 = _901;
    float _1043 = _789 * _747;
    float _1045 = _1009 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1009 * 6.283185482025146484375;
    float _1051 = cos(_1049);
    float _1053 = _971 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _971 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = fma(_1023, _1023, _1029);
    float _1063 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1065 = -_1033;
    float _1067 = _917 + _1065;
    int _1069 = _1041 ? (-1) : 0;
    if (_999)
    {
        int _1071 = _1041 ? 0 : 1078530011;
        _955 = _1071;
    }
    int _1073 = _955;
    float _1075 = fma(_1005, _905, _1063);
    float _1077 = fma(_1067, _1067, _1061);
    if (_999)
    {
        int _1079 = int(0x80000000) & as_type<int>(_965);
        int _1081 = _1073 | _1079;
        _957 = _1081;
    }
    int _1083 = _957;
    bool _1085 = !_983;
    bool _1087 = _1085 && _1019;
    int _1089 = _1083;
    float _1091 = as_type<float>(_1083);
    float _1093 = _1059;
    float _1095 = _1047;
    if (!_1087)
    {
        float _1097 = abs(_965);
        bool _1099 = _1097 != as_type<float>(0x7f800000u /* inf */);
        bool _1101 = isnan(_1097);
        bool _1103 = _1099 || _1101;
        bool _1105 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1107 = _1103 || _1105;
        float _1109 = abs(_961);
        bool _1111 = _1109 == as_type<float>(0x7f800000u /* inf */);
        float _1113 = abs(_961);
        bool _1115 = _1113 == as_type<float>(0x7f800000u /* inf */);
        bool _1117 = !_1107;
        bool _1119 = _1115 && _1117;
        if (_1119)
        {
            bool _1121 = as_type<int>(_961) >= 0;
            _1069 = _1121 ? (-1) : 0;
        }
        int _1123 = _1069;
        if (_1119)
        {
            _1089 = 1075235812;
        }
        int _1125 = _1089;
        int _1127 = _1125;
        if (_1119)
        {
            int _1129 = ~_1123;
            int _1131 = (_1129 != 0) ? _1125 : 1061752795;
            _1127 = _1131;
        }
        int _1133 = _1127;
        float _1135 = as_type<float>(_1133);
        if (_1119)
        {
            int _1137 = int(0x80000000) & as_type<int>(_965);
            int _1139 = _1133 | _1137;
            _1135 = as_type<float>(_1139);
        }
        float _1141 = _1135;
        bool _1143 = !_1107;
        bool _1145 = _1143 && _1111;
        _1091 = _1141;
        if (!_1145)
        {
            float _1147 = abs(_965);
            float _1149 = abs(_961);
            float _1151 = precise::max(_1147, _1149);
            float _1153 = abs(_965);
            float _1155 = abs(_961);
            float _1157 = precise::min(_1153, _1155);
            float _1159 = 1.0 / _1151;
            float _1161 = abs(_965);
            float _1163 = abs(_961);
            bool _1165 = _1161 > _1163;
            bool _1167 = as_type<int>(_961) >= 0;
            float _1169 = _1157 * _1159;
            float _1171 = abs(_965);
            float _1173 = abs(_961);
            float _1175 = _1171 + _1173;
            int _1177 = as_type<int>(_965) & int(0x80000000);
            float _1179 = _1169 * _1169;
            bool _1181 = _1175 > as_type<float>(0x7f800000u /* inf */);
            bool _1183 = isnan(_1175);
            bool _1185 = _1181 || _1183;
            bool _1187 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1189 = _1185 || _1187;
            float _1191 = _1179 + 11.33538818359375;
            float _1193 = fma(_1179, _1191, 28.84246826171875);
            float _1195 = fma(_1179, _1193, 19.6966705322265625);
            float _1197 = fma(_1179, -0.82336294651031494140625, -5.674867153167724609375);
            float _1199 = fma(_1179, _1197, -6.565555095672607421875);
            float _1201 = 1.0 / _1195;
            float _1203 = _1179 * _1199;
            float _1205 = _1169 * _1203;
            float _1207 = fma(_1205, _1201, _1169);
            float _1209 = _1207;
            _1091 = _1175;
            if (_1165)
            {
                float _1211 = -_1207;
                float _1213 = _1211 + 1.57079637050628662109375;
                _1209 = _1213;
            }
            float _1215 = _1209;
            int _1217 = as_type<int>(_1215);
            if (!_1167)
            {
                float _1219 = -_1215;
                float _1221 = _1219 + 3.1415927410125732421875;
                _1217 = as_type<int>(_1221);
            }
            int _1223 = _1217;
            if (!_1189)
            {
                int _1225 = _1177 | _1223;
                _1091 = as_type<float>(_1225);
            }
        }
    }
    float _1227 = _1091;
    float _1229 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1043);
    float _1231 = sqrt(_1077);
    float _1233 = -_1227;
    float _1235 = _1075 + _1233;
    float _1237 = as_type<float>(_233) * _1027;
    float _1239 = fma(_1011, _745, _1229);
    float _1241 = _1235 * 0.15915493667125701904296875;
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1237);
    float _1245 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1239);
    float _1247 = _1001 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    bool _1251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1253 = isnan(0.5);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1259 = _1255 || _1257;
    float _1261 = _1245 * _795;
    bool _1263 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1265 = isnan(0.5);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1271 = _1267 || _1269;
    float _1273 = _421 * _1261;
    float _1275 = _1241 * 6.283185482025146484375;
    float _1277 = sin(_1275);
    float _1279 = _939 * _1231;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1283 = _1279 * _1281;
    float _1285 = _1241 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = as_type<float>(_233) * _1249;
    float _1291 = _1283 * _1243;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_229));
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1289);
    float _1297 = _1059 * _1277;
    float _1299 = _953 * _1279;
    float _1301 = _1051 * _1291;
    float _1303 = _1055 * _1277;
    float _1305 = -_1291;
    float _1307 = _1047 * _1305;
    float _1309 = _1299 * _1293;
    float _1311 = _1055 * _1301;
    float _1313 = _1279 * _1295;
    float _1315 = _1055 * _1287;
    float _1317 = _1059 * _1287;
    float _1319 = _1277 * _1051;
    float _1321 = -_1297;
    float _1323 = fma(_1047, _1315, _1321);
    float _1325 = fma(_1047, _1303, _1317);
    float _1327 = fma(_1047, _1317, _1303);
    float _1329 = -_1033;
    float _1331 = _547 + _1329;
    float _1333 = fma(_1323, _1309, _1311);
    float _1335 = _1287 * _1051;
    float _1337 = -_1315;
    float _1339 = fma(_1047, _1297, _1337);
    float _1341 = fma(_1325, _1313, _1333);
    float _1343 = fma(_1335, _1309, _1307);
    float _1345 = _547 + _1341;
    float _1347 = fma(_1319, _1313, _1343);
    float _1349 = -_1007;
    float _1351 = _539 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1355 = _1345 + _1353;
    float _1357 = _539 + _1347;
    float _1359 = _1355 * _1355;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1363 = _1357 + _1361;
    float _1365 = fma(_1363, _1363, _1359);
    float _1367 = -_1003;
    float _1369 = _597 + _1367;
    float _1371 = sqrt(_1365);
    float _1373 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1375 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1373);
    float _1379 = _1059 * _1301;
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1383 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1377);
    float _1385 = fma(_1327, _1309, _1379);
    float _1387 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1389 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1391 = fma(_1339, _1313, _1385);
    float _1393 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1395 = _1371 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1397 = 1.0 / _1389;
    float _1399 = _597 + _1391;
    float _1401 = _1393 + _1389;
    float _1403 = _1357;
    float _1405 = _1339;
    if (!_1395)
    {
        _1093 = _1345;
    }
    float _1407 = _1093;
    float _1409 = _1407;
    if (!_1395)
    {
        _1095 = _1399;
    }
    float _1411 = _1095;
    bool _1413 = !_1395;
    float _1415 = _1411;
    if (!_1413)
    {
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1421 = _1371 + _1419;
        float _1423 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1425 = rsqrt(_1365);
        float _1427 = _1421 * _1417;
        float _1429 = _1427 * 0.15915493667125701904296875;
        float _1431 = _1429 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1429 * 6.283185482025146484375;
        float _1437 = sin(_1435);
        float _1439 = _1433 + (-1.0);
        float _1441 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = fma(_1437, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1445 = fma(_1399, _1433, _1441);
        float _1447 = _1425 * _1443;
        float _1449 = fma(_1363, _1447, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1451 = fma(_1355, _1447, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1403 = _1449;
        _1415 = _1445;
        _1409 = _1451;
        _1405 = _1447;
    }
    float _1453 = _1403;
    float _1455 = _1415;
    float _1457 = _1409;
    float _1459 = _1405;
    float _1461 = -_1007;
    float _1463 = _1461 + _1453;
    float _1465 = -_1003;
    float _1467 = _1465 + _1455;
    float _1469 = -_1033;
    float _1471 = _1469 + _1457;
    float _1473 = _1401 * _1397;
    float _1475 = _1473 * 0.5;
    float _1477 = _1459;
    float _1479 = _1467;
    float _1481 = _1471;
    if (_1271)
    {
        _1477 = 1.0;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (_1259)
    {
        _1035 = _1463;
    }
    float _1487 = _1035;
    float _1489 = _1487;
    if (!_1259)
    {
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1493 = _1369 + _1491;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1497 = _1351 + _1495;
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1501 = -_547;
        float _1503 = _1501 + _1457;
        float _1505 = _1493 * _1493;
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1509 = _1331 + _1507;
        float _1511 = -_539;
        float _1513 = _1511 + _1453;
        float _1515 = fma(_1497, _1497, _1505);
        float _1517 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1519 = fma(_1509, _1509, _1515);
        float _1521 = sqrt(_1519);
        float _1523 = 1.0 / _1279;
        float _1525 = _1517 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1527 = precise::min(_1521, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1529 = _1527 * _1499;
        float _1531 = -_597;
        float _1533 = _1531 + _1455;
        float _1535 = _1529 * _1523;
        float _1537 = _1525 * _1535;
        float _1539 = _1503 * _1535;
        float _1541 = fma(_1513, _1537, _1351);
        float _1543 = fma(_1533, _1537, _1369);
        float _1545 = fma(_1525, _1539, _1331);
        _1479 = _1543;
        _1489 = _1541;
        _1481 = _1545;
    }
    float _1547 = _1479;
    float _1549 = _1489;
    float _1551 = _1481;
    if (!_1271)
    {
        float _1553 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1555 = _1553 * 0.15915493667125701904296875;
        float _1557 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1561 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
        float _1563 = _1555 * 6.283185482025146484375;
        float _1565 = cos(_1563);
        float _1567 = _1557 * 0.15915493667125701904296875;
        float _1569 = _1555 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1565;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = _1567 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = 1.0 / _1561;
        float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1591 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1589;
        float _1593 = 1.0 / _1585;
        float _1595 = 1.0 / _1591;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1599 = _1587 * _1597;
        float _1601 = _1583 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1605 = fma(_1601, _1599, _1603);
        float _1607 = _1605 * _1595;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        _609 = _1555;
        _1485 = _1609;
    }
    float _1611 = _609;
    float _1613 = _1485;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1617 = _1547 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1621 = _1549 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1625 = _1551 + _1623;
    float _1627 = _1617 * _1617;
    float _1629 = fma(_1621, _1621, _1627);
    float _1631 = fma(_1625, _1625, _1629);
    float _1633 = rsqrt(_1631);
    float _1635 = sqrt(_1631);
    float _1637 = _1633 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1639 = _1621 * _1637;
    float _1641 = _1625 * _1637;
    float _1643 = _1639 * _1639;
    float _1645 = _1641 * _1641;
    float _1647 = _1643 + _1645;
    float _1649 = sqrt(_1647);
    bool _1651 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1655 = _1649 + _1653;
    float _1657 = _1629;
    float _1659 = _1647;
    float _1661 = _1655;
    float _1663 = _1611;
    float _1665 = _1617;
    if (_1651)
    {
        float _1667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1667;
    }
    float _1669 = _1657;
    if (_1651)
    {
        float _1671 = rsqrt(_1647);
        _1659 = _1671;
    }
    float _1673 = _1659;
    float _1675 = _1673;
    if (_1651)
    {
        float _1677 = _1655 * _1669;
        _1661 = _1677;
    }
    float _1679 = _1661;
    if (_1651)
    {
        float _1681 = _1679 * 0.15915493667125701904296875;
        _1663 = _1681;
    }
    float _1683 = _1663;
    float _1685 = _1625;
    float _1687 = _1683;
    if (_1651)
    {
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1685 = _1691;
    }
    float _1693 = _1685;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1669;
    float _1701 = _1697;
    if (_1651)
    {
        float _1703 = _1683 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        _1699 = _1705;
    }
    float _1707 = _1699;
    float _1709 = -_1637;
    float _1711 = -_1697;
    float _1713 = fma(_1617, _1709, _1711);
    if (_1651)
    {
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1715;
    }
    float _1717 = _1665;
    float _1719 = _1717;
    float _1721 = _1693;
    if (_1651)
    {
        float _1723 = fma(_1693, _1717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1719 = _1723;
    }
    float _1725 = _1719;
    float _1727 = _1725;
    if (!_1651)
    {
        _1721 = _1639;
    }
    float _1729 = _1721;
    float _1731 = _1729;
    float _1733 = _1707;
    if (_1651)
    {
        float _1735 = _1707 + (-1.0);
        _1701 = _1735;
    }
    float _1737 = _1701;
    float _1739 = _1737;
    if (_1651)
    {
        float _1741 = _1673 * _1725;
        _1037 = _1741;
    }
    float _1743 = _1037;
    if (!_1651)
    {
        _1727 = _1713;
    }
    float _1745 = _1727;
    float _1747 = _1745;
    if (_1651)
    {
        float _1749 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1749;
    }
    float _1751 = _1687;
    if (_1651)
    {
        float _1753 = _1639 * _1743;
        _1731 = _1753;
    }
    float _1755 = _1731;
    if (!_1651)
    {
        _1739 = _1641;
    }
    float _1757 = _1739;
    float _1759 = _1757;
    if (_1651)
    {
        float _1761 = _1641 * _1743;
        _1759 = _1761;
    }
    float _1763 = _1759;
    if (!_1651)
    {
        _1675 = _1643;
    }
    float _1765 = _1675;
    float _1767 = _1765;
    if (_1651)
    {
        float _1769 = fma(_1713, _1707, _1751);
        _1747 = _1769;
    }
    float _1771 = _1747;
    if (_1651)
    {
        float _1773 = _1755 * _1755;
        _1767 = _1773;
    }
    float _1775 = _1767;
    if (!_1651)
    {
        _1733 = _1645;
    }
    float _1777 = _1733;
    float _1779 = _1777;
    if (_1651)
    {
        float _1781 = _1763 * _1763;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1771, _1771, _1775);
    float _1787 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1789 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1791 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1793 = _1785 + _1783;
    float _1795 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1799 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1797);
    float _1801 = precise::clamp(_1799, 0.0, 1.0);
    float _1803 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1805 = rsqrt(_1793);
    float _1807 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1795);
    float _1809 = -_1801;
    float _1811 = _1809 + 1.0;
    float _1813 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1791);
    float _1815 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1819 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1803);
    float _1821 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1813);
    float _1823 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1825 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1827 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1833 = abs(_1811);
    float _1835 = log2(_1833);
    float _1837 = -_1825;
    float _1839 = fma(_1837, _1789, 1.0);
    float _1841 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1845 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1847 = _1805 * _1755;
    float _1849 = _1805 * _1763;
    float _1851 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1843);
    float _1853 = _1805 * _1771;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1857 = log2(_1839);
    float _1859 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1861 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1863 = -_1855;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1863);
    float _1867 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1869 = -_1849;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1865);
    float _1873 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1859);
    float _1877 = exp2(_1867);
    float _1879 = fma(_1871, -0.5, 0.5);
    float _1881 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1883 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1861);
    float _1885 = fma(_1871, 0.5, 0.5);
    float _1887 = _1853 + 1.0;
    float _1889 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1881);
    float _1891 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1883);
    float _1893 = 1.0 / _1875;
    float _1895 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1889);
    float _1899 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1891);
    float _1901 = _1857 * 0.693147182464599609375;
    float _1903 = fma(_1885, _1895, -0.212114393711090087890625);
    float _1905 = sqrt(_1879);
    float _1907 = -_1853;
    float _1909 = fma(_1877, _1887, _1907);
    float _1911 = fma(_1885, _1903, 1.570728778839111328125);
    float _1913 = fma(_1909, 0.5, 0.5);
    float _1915 = _1897 * _1893;
    float _1917 = _1899 * _1893;
    float _1919 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = fma(_1915, 0.5, 0.5);
    float _1923 = fma(_1917, -0.5, 0.5);
    float _1925 = _1905 * 0.636619746685028076171875;
    float3 _5006 = float3(_1921, _1923, _1919);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5006, float3(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5006, float3(0.0), isnan(_5006)), level(0.0)).x;
    float3 _5017 = float3(_1921, _1923, _1919);
    float4 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5017, float3(0.0), isnan(_5017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5017, float3(0.0), isnan(_5017)), level(0.0)).xyzw;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1930.w;
    float _1940 = -_1911;
    float _1942 = fma(_1925, _1940, 1.0);
    float2 _5039 = float2(_1942, _1913);
    float3 _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5039, float2(0.0), isnan(_5039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5039, float2(0.0), isnan(_5039)), level(0.0)).xyz;
    float _1948 = _1946.x;
    float _1950 = _1946.y;
    float _1952 = _1946.z;
    float _1954 = in.m_49.w;
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1958 = _105 > 0.5;
    float _1960 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1962 = -_859;
    float _1964 = _1962 + 1.0;
    bool _1966 = _457 > 0.5;
    float _1968 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1972 = _1970 != 0;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1976 = -as_type<float>(_229);
    int _1978 = _1958 ? as_type<int>(_1976) : _229;
    float _1980 = -_895;
    float _1982 = _1980 + 1.0;
    bool _1984 = _451 > 0.5;
    float _1986 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1968);
    float _1988 = -_869;
    float _1990 = _1988 + 1.0;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1994 = _1992 != 0;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1998 = -as_type<float>(_233);
    int _2000 = _1966 ? as_type<int>(_1998) : _233;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2006 = _2004 != 0;
    float _2008 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2012 = _2010 != 0;
    float _2014 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1986);
    bool _2016 = _1954 > 0.5;
    float _2018 = exp2(_1960);
    bool _2020 = !_1972;
    float _2022 = _2020 ? as_type<float>(_229) : as_type<float>(_1978);
    out.m_60.w = _2002;
    float _2024 = -as_type<float>(_229);
    int _2026 = _1984 ? as_type<int>(_2024) : _229;
    bool _2028 = !_1994;
    float _2030 = _2028 ? as_type<float>(_233) : as_type<float>(_2000);
    float _2032 = _2022 + 0.5;
    float _2034 = -as_type<float>(_233);
    int _2036 = _2016 ? as_type<int>(_2034) : _233;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2040 = !_2006;
    float _2042 = _2040 ? as_type<float>(_229) : as_type<float>(_2026);
    float _2044 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2046 = !_2012;
    float _2048 = _2046 ? as_type<float>(_233) : as_type<float>(_2036);
    float _2050 = fma(_2008, _2032, _865);
    float _2052 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2054 = _2042 + 0.5;
    float _2056 = _2030 + (-0.5);
    float _2058 = -_1964;
    float _2060 = fma(_2022, _2058, _2050);
    float _2062 = -_877;
    float _2064 = _2062 + 1.0;
    float _2066 = fma(_2044, _2054, _873);
    float _2068 = -_2052;
    float _2070 = -_883;
    float _2072 = fma(_2068, _2056, _2070);
    float _2074 = -_2018;
    float _2076 = _2074 + 1.0;
    float _2078 = _2048 + (-0.5);
    float _2080 = -_2064;
    float _2082 = fma(_2042, _2080, _2066);
    float _2084 = _1875 * 0.5;
    float _2086 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2088 = fma(_2030, _1982, _2072);
    float _2090 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2014);
    float _2092 = fma(_1899, -0.5, _2084);
    float _2094 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2096 = -_2086;
    float _2098 = -_897;
    float _2100 = fma(_2096, _2078, _2098);
    bool _2102 = _1613 > 0.0;
    bool _2104 = isnan(_1613);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan(0.0);
    bool _2110 = _2106 || _2108;
    float _2112 = _2090 + _1875;
    float _2114 = fma(_2048, _1990, _2100);
    float _2116 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2118 = _1897 + _1875;
    float _2120 = _2112 * 0.5;
    out.gl_Position.x = _1897;
    out.gl_Position.y = _1899;
    out.gl_Position.z = _2090;
    out.gl_Position.w = _1875;
    float _2122 = _2116 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2124 = _2118 * 0.5;
    out.m_62.x = _2060;
    out.m_62.y = _2088;
    out.m_62.z = _2082;
    out.m_62.w = _2114;
    out.m_64.x = _2124;
    out.m_64.y = _2092;
    out.m_64.z = _2120;
    out.m_64.w = _1875;
    out.m_45.x = _2122;
    float _2126 = _2094 * _1927;
    float _2128 = -_2094;
    float _2130 = _2128 + 1.0;
    float _2132 = _1938 * _2126;
    float _2134 = _1938 * _2130;
    float _2136 = _1952 * _2126;
    float _2138 = fma(_1948, _2132, _1932);
    float _2140 = fma(_1950, _2132, _1934);
    float _2142 = fma(_1938, _2136, _1936);
    out.m_66.x = _2138;
    out.m_66.y = _2140;
    out.m_66.z = _2142;
    out.m_66.w = _2134;
    if (_2110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2144 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2144;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _441 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2200 = as_type<float>(_101);
        out.gl_Position.z = _2200;
    }
    if (!_89)
    {
        return out;
    }
    float _103 = in.m_47.w;
    float _105 = in.m_49.x;
    bool _107 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_103);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_103;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _105;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2273 = as_type<float>(_141);
        out.gl_Position.z = _2273;
    }
    if (_133)
    {
        return out;
    }
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _145 * _143;
    float _171 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = _173 * 6.283185482025146484375;
    float _179 = floor(_173);
    int _181 = as_type<int>(_147) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_147) & 2;
    bool _187 = _185 != 0;
    float _189 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    float _191 = _177 * 0.15915493667125701904296875;
    float _193 = _147;
    float _195 = _189;
    if (!_165)
    {
        float _197 = _149 * _149;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _189 * 6.283185482025146484375;
    float _205 = floor(_189);
    float _207 = _201;
    if (!_165)
    {
        float _209 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = _203 * 0.15915493667125701904296875;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _191 * 6.283185482025146484375;
    float _221 = cos(_219);
    float _223 = -_179;
    float _225 = _173 + _223;
    bool _227 = !_183;
    int _229 = _227 ? (-1090519040) : 1056964608;
    bool _231 = !_187;
    int _233 = _231 ? (-1090519040) : 1056964608;
    float _235 = _213 * 6.283185482025146484375;
    float _237 = cos(_235);
    float _239 = -_205;
    float _241 = _189 + _239;
    float _243 = _211;
    if (!_165)
    {
        _195 = _149;
    }
    float _245 = _195;
    bool _247 = !_165;
    float _249 = _245;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _149 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _149);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _279;
    }
    float _281 = _243;
    bool _283 = !_165;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _149 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _249 = _303;
    }
    float _305 = _249;
    float _307 = in.m_56.w;
    bool _309 = _225 < 0.5;
    float _311 = float(_309);
    float _313 = fma(_221, 0.5, 0.5);
    float _315 = in.m_42.x;
    float _317 = in.m_42.y;
    float _319 = in.m_42.z;
    float _321 = -_225;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_311;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _329 = _241 < 0.5;
    float _331 = float(_329);
    float _333 = -_313;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_237, 0.5, 0.5);
    float _339 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _347 = _345 != 0;
    float _349 = -_241;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = -_331;
    float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _357 = -_337;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _361 = fma(_305, _151, _339);
    float _363 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _365 = !_217;
    int _367 = _365 ? 0 : 1;
    out.m_58.x = as_type<float>(_229);
    out.m_58.y = as_type<float>(_233);
    bool _369 = !_343;
    int _371 = _369 ? 0 : 1;
    float _373 = fma(_305, _153, _363);
    int _375 = abs(_367);
    float _377 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _379 = !_347;
    int _381 = _379 ? 0 : 1;
    int _383 = abs(_371);
    float _385 = fma(_305, _155, _377);
    float _387 = fma(_361, _307, _315);
    int _389 = abs(_381);
    float _391 = fma(_373, _307, _317);
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _395 = fma(_385, _307, _319);
    float _397 = float(_383);
    float _399 = float(_375);
    float _401 = abs(_323);
    float _403 = _397 * _401;
    float _405 = abs(_351);
    float _407 = _397 * _405;
    float _409 = float(_389);
    float _411 = fma(_399, _335, _403);
    float _413 = fma(_399, _359, _407);
    float _415 = abs(_327);
    float _417 = fma(_409, _415, _411);
    float _419 = abs(_355);
    float _421 = fma(_409, _419, _413);
    bool _423 = !_393;
    float _439;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _427 = _105 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_85);
        float _445 = 1.0 / _443;
        float _447 = _119 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_49.z;
    float _453 = _105 * 2.0;
    float _455 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = in.m_49.y;
    float _459 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = _105 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _467 = floor(_453);
    float _469 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _471 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _473 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _475 = -_465;
    float _477 = fma(_463, 2.0, _475);
    float _479 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
    float _481 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _471);
    float _483 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    float _485 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _501 = _499 != 0;
    float _503 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _485);
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _507 = _505 != 0;
    float _509 = _451 * 2.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _511;
    bool _515 = _467 > 0.0;
    float _517 = 1.0 / _489;
    bool _519 = _467 >= 0.0;
    bool _521 = isnan(_467);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = _457 * 2.0;
    float _531 = _457 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _535 = _449 + _533;
    int _537 = _527 ? 0 : 1;
    float _539 = _479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _541 = floor(_509);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _545 = _105 + _451;
    float _547 = _483 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _549 = fma(_531, -2.0, _543);
    float _551 = _105 + _457;
    float _553 = 1.0 / _513;
    float _555 = _535 * _517;
    float _557 = _551 + (-1.0);
    float _559 = _545 + (-1.0);
    float _561 = _509;
    float _563 = _559;
    if (!_507)
    {
        _561 = _451;
    }
    float _565 = _561;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _539 + _567;
    float _571 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _573 = floor(_529);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _577 = _449 + _575;
    bool _579 = _541 >= 0.0;
    bool _581 = isnan(_541);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    float _589 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _591 = -_547;
    float _593 = _591 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _595 = _587 ? 0 : 1;
    float _597 = _481 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _599 = _577 * _553;
    float _601 = _457 + _451;
    float _603 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _503);
    float _605 = _565;
    float _607 = _593;
    float _609 = _597;
    if (!_507)
    {
        _563 = _457;
    }
    float _611 = _563;
    float _613 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _615 = log2(_613);
    float _617 = _601 + (-1.0);
    bool _619 = _573 > 0.0;
    float _621 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _623 = _573 >= 0.0;
    bool _625 = isnan(_573);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = rsqrt(_603);
    float _635 = _617;
    float _637 = _611;
    if (!_507)
    {
        _635 = _451;
    }
    float _639 = _635;
    float _641 = _639;
    if (_507)
    {
        _637 = _105;
    }
    float _643 = _637;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    if (_507)
    {
        _605 = _457;
    }
    float _649 = _605;
    if (_507)
    {
        _641 = _457;
    }
    float _651 = _641;
    float _653 = fma(_647, _599, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _655 = _541 > 0.0;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _659 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].z, _657);
    float _661 = _643 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _665 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _667 = isnan(_449);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _679 = ~_537;
    int _681 = _679 + 1;
    int _683 = _681 + 1;
    float _685 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[83].w, _663);
    bool _687 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _689 = isnan(_449);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_677;
    float _701 = fma(_661, 2.0, _699);
    float _703 = abs(_569);
    float _705 = abs(_593);
    float _707 = precise::max(_703, _705);
    float _709 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _711 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _713 = isnan(_449);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_675;
    float _725 = _723 + 1.0;
    float _727 = -_697;
    float _729 = _727 + 1.0;
    int _731 = _683;
    if (!_515)
    {
        int _733 = ~_537;
        int _735 = _733 + 1;
        _731 = _735;
    }
    int _737 = _731;
    float _739 = _633 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _741 = _707 >= 16.0;
    float _743 = _615 * _119;
    float _745 = _697 * _725;
    float _747 = _721 * _729;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _753 = -_721;
    float _755 = _753 + 1.0;
    float _757 = exp2(_743);
    float _759 = _653 * _747;
    float _761 = fma(_751, _555, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _763 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[143].x, _759);
    int _765 = _631 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _767;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _773 = ~_765;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = fma(_761, _745, _763);
    int _781 = _777;
    if (!_619)
    {
        int _783 = ~_765;
        int _785 = _783 + 1;
        _781 = _785;
    }
    int _787 = _781;
    float _789 = fma(_769, _599, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _791 = fma(_709, -2.0, _771);
    float _793 = in.m_56.x;
    float _795 = in.m_56.y;
    int _797 = ~_595;
    int _799 = _797 + 1;
    int _801 = _799 + 1;
    float _803 = -_757;
    float _805 = _803 + 1.0;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _809 = _801;
    if (!_655)
    {
        int _811 = ~_595;
        int _813 = _811 + 1;
        _809 = _813;
    }
    int _815 = _809;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _819 = 1.0 + _817;
    bool _821 = !_501;
    int _823 = _821 ? 0 : 1;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _827 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _835 = _831 || _833;
    float _837 = 1.0 / _819;
    bool _839 = !_493;
    int _841 = _839 ? 0 : 1;
    float _843 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[78].z, _807);
    int _845 = abs(_823);
    float _847 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[78].w, _825);
    bool _849 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(1.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _843);
    int _861 = abs(_841);
    float _863 = -_119;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[76].x, _477);
    float _867 = _835 ? _805 : 0.0;
    float _869 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _685);
    float _871 = -_119;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[81].x, _701);
    float _875 = float(_845);
    float _877 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _659);
    float _879 = float(_787);
    float _881 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[145].x, _779);
    float _883 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    float _885 = float(_815);
    float _887 = _875 * _879;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _597 + _889;
    float _893 = float(_861);
    float _895 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _897 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _899 = _891 * _891;
    bool _901 = _857;
    if (_857)
    {
        float _903 = _867 * _837;
        _123 = _903;
    }
    float _905 = _123;
    float _907 = _893 * _885;
    float _909 = _881 * _793;
    bool _911 = !_497;
    int _913 = _911 ? 0 : 1;
    float _915 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _917 = _547 + _915;
    float _919 = fma(_569, _569, _899);
    float _921 = _907 * (-2.0);
    float _923 = _105 + (-0.5);
    int _925 = abs(_913);
    float _927 = fma(_917, _917, _919);
    float _929 = fma(_571, _921, _571);
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _933 = _887 * (-2.0);
    float _935 = _417 * _909;
    float _937 = fma(_929, _905, _931);
    float _939 = rsqrt(_927);
    float _941 = _451 + (-0.5);
    float _943 = fma(_589, _933, _589);
    float _945 = _569 * 0.0625;
    float _947 = float(_737);
    float _949 = _941 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _951 = float(_925);
    float _953 = _935 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _955 = as_type<int>(_917);
    int _957 = as_type<int>(_905);
    if (_741)
    {
        float _959 = _593 * 0.0625;
        _607 = _959;
    }
    float _961 = _607;
    float _963 = fma(_943, _905, _949);
    float _965 = _741 ? _945 : _569;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _969 = _951 * _947;
    float _971 = _937 * 0.15915493667125701904296875;
    float _973 = abs(_965);
    bool _975 = _973 != 0.0;
    bool _977 = isnan(_973);
    bool _979 = _975 || _977;
    bool _981 = isnan(0.0);
    bool _983 = _979 || _981;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _989 = _967 * _939;
    float _991 = _969 * (-2.0);
    float _993 = abs(_961);
    bool _995 = _993 == 0.0;
    bool _997 = !_983;
    bool _999 = _995 && _997;
    float _1001 = _739 * (-0.15915493667125701904296875);
    float _1003 = _891 * _989;
    float _1005 = fma(_621, _991, _621);
    float _1007 = _569 * _989;
    float _1009 = _963 * 0.15915493667125701904296875;
    float _1011 = fma(_987, _555, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1013 = -_1003;
    float _1015 = _891 + _1013;
    float _1017 = abs(_961);
    bool _1019 = _1017 == 0.0;
    float _1021 = -_1007;
    float _1023 = _569 + _1021;
    float _1025 = _1001 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _1015 * _1015;
    float _1031 = _457 + (-0.5);
    float _1033 = _917 * _989;
    float _1035 = _1003;
    float _1037 = _1033;
    if (_999)
    {
        bool _1039 = as_type<int>(_961) >= 0;
        _901 = _1039;
    }
    bool _1041 = _901;
    float _1043 = _789 * _747;
    float _1045 = _1009 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1009 * 6.283185482025146484375;
    float _1051 = cos(_1049);
    float _1053 = _971 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _971 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = fma(_1023, _1023, _1029);
    float _1063 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1065 = -_1033;
    float _1067 = _917 + _1065;
    int _1069 = _1041 ? (-1) : 0;
    if (_999)
    {
        int _1071 = _1041 ? 0 : 1078530011;
        _955 = _1071;
    }
    int _1073 = _955;
    float _1075 = fma(_1005, _905, _1063);
    float _1077 = fma(_1067, _1067, _1061);
    if (_999)
    {
        int _1079 = int(0x80000000) & as_type<int>(_965);
        int _1081 = _1073 | _1079;
        _957 = _1081;
    }
    int _1083 = _957;
    bool _1085 = !_983;
    bool _1087 = _1085 && _1019;
    int _1089 = _1083;
    float _1091 = as_type<float>(_1083);
    float _1093 = _1059;
    float _1095 = _1047;
    if (!_1087)
    {
        float _1097 = abs(_965);
        bool _1099 = _1097 != as_type<float>(0x7f800000u /* inf */);
        bool _1101 = isnan(_1097);
        bool _1103 = _1099 || _1101;
        bool _1105 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1107 = _1103 || _1105;
        float _1109 = abs(_961);
        bool _1111 = _1109 == as_type<float>(0x7f800000u /* inf */);
        float _1113 = abs(_961);
        bool _1115 = _1113 == as_type<float>(0x7f800000u /* inf */);
        bool _1117 = !_1107;
        bool _1119 = _1115 && _1117;
        if (_1119)
        {
            bool _1121 = as_type<int>(_961) >= 0;
            _1069 = _1121 ? (-1) : 0;
        }
        int _1123 = _1069;
        if (_1119)
        {
            _1089 = 1075235812;
        }
        int _1125 = _1089;
        int _1127 = _1125;
        if (_1119)
        {
            int _1129 = ~_1123;
            int _1131 = (_1129 != 0) ? _1125 : 1061752795;
            _1127 = _1131;
        }
        int _1133 = _1127;
        float _1135 = as_type<float>(_1133);
        if (_1119)
        {
            int _1137 = int(0x80000000) & as_type<int>(_965);
            int _1139 = _1133 | _1137;
            _1135 = as_type<float>(_1139);
        }
        float _1141 = _1135;
        bool _1143 = !_1107;
        bool _1145 = _1143 && _1111;
        _1091 = _1141;
        if (!_1145)
        {
            float _1147 = abs(_965);
            float _1149 = abs(_961);
            float _1151 = precise::max(_1147, _1149);
            float _1153 = abs(_965);
            float _1155 = abs(_961);
            float _1157 = precise::min(_1153, _1155);
            float _1159 = 1.0 / _1151;
            float _1161 = abs(_965);
            float _1163 = abs(_961);
            bool _1165 = _1161 > _1163;
            bool _1167 = as_type<int>(_961) >= 0;
            float _1169 = _1157 * _1159;
            float _1171 = abs(_965);
            float _1173 = abs(_961);
            float _1175 = _1171 + _1173;
            int _1177 = as_type<int>(_965) & int(0x80000000);
            float _1179 = _1169 * _1169;
            bool _1181 = _1175 > as_type<float>(0x7f800000u /* inf */);
            bool _1183 = isnan(_1175);
            bool _1185 = _1181 || _1183;
            bool _1187 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1189 = _1185 || _1187;
            float _1191 = _1179 + 11.33538818359375;
            float _1193 = fma(_1179, _1191, 28.84246826171875);
            float _1195 = fma(_1179, _1193, 19.6966705322265625);
            float _1197 = fma(_1179, -0.82336294651031494140625, -5.674867153167724609375);
            float _1199 = fma(_1179, _1197, -6.565555095672607421875);
            float _1201 = 1.0 / _1195;
            float _1203 = _1179 * _1199;
            float _1205 = _1169 * _1203;
            float _1207 = fma(_1205, _1201, _1169);
            float _1209 = _1207;
            _1091 = _1175;
            if (_1165)
            {
                float _1211 = -_1207;
                float _1213 = _1211 + 1.57079637050628662109375;
                _1209 = _1213;
            }
            float _1215 = _1209;
            int _1217 = as_type<int>(_1215);
            if (!_1167)
            {
                float _1219 = -_1215;
                float _1221 = _1219 + 3.1415927410125732421875;
                _1217 = as_type<int>(_1221);
            }
            int _1223 = _1217;
            if (!_1189)
            {
                int _1225 = _1177 | _1223;
                _1091 = as_type<float>(_1225);
            }
        }
    }
    float _1227 = _1091;
    float _1229 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1043);
    float _1231 = sqrt(_1077);
    float _1233 = -_1227;
    float _1235 = _1075 + _1233;
    float _1237 = as_type<float>(_233) * _1027;
    float _1239 = fma(_1011, _745, _1229);
    float _1241 = _1235 * 0.15915493667125701904296875;
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1237);
    float _1245 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1239);
    float _1247 = _1001 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    bool _1251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1253 = isnan(0.5);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1259 = _1255 || _1257;
    float _1261 = _1245 * _795;
    bool _1263 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1265 = isnan(0.5);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1271 = _1267 || _1269;
    float _1273 = _421 * _1261;
    float _1275 = _1241 * 6.283185482025146484375;
    float _1277 = sin(_1275);
    float _1279 = _939 * _1231;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1283 = _1279 * _1281;
    float _1285 = _1241 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = as_type<float>(_233) * _1249;
    float _1291 = _1283 * _1243;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_229));
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1289);
    float _1297 = _1059 * _1277;
    float _1299 = _953 * _1279;
    float _1301 = _1051 * _1291;
    float _1303 = _1055 * _1277;
    float _1305 = -_1291;
    float _1307 = _1047 * _1305;
    float _1309 = _1299 * _1293;
    float _1311 = _1055 * _1301;
    float _1313 = _1279 * _1295;
    float _1315 = _1055 * _1287;
    float _1317 = _1059 * _1287;
    float _1319 = _1277 * _1051;
    float _1321 = -_1297;
    float _1323 = fma(_1047, _1315, _1321);
    float _1325 = fma(_1047, _1303, _1317);
    float _1327 = fma(_1047, _1317, _1303);
    float _1329 = -_1033;
    float _1331 = _547 + _1329;
    float _1333 = fma(_1323, _1309, _1311);
    float _1335 = _1287 * _1051;
    float _1337 = -_1315;
    float _1339 = fma(_1047, _1297, _1337);
    float _1341 = fma(_1325, _1313, _1333);
    float _1343 = fma(_1335, _1309, _1307);
    float _1345 = _547 + _1341;
    float _1347 = fma(_1319, _1313, _1343);
    float _1349 = -_1007;
    float _1351 = _539 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1355 = _1345 + _1353;
    float _1357 = _539 + _1347;
    float _1359 = _1355 * _1355;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1363 = _1357 + _1361;
    float _1365 = fma(_1363, _1363, _1359);
    float _1367 = -_1003;
    float _1369 = _597 + _1367;
    float _1371 = sqrt(_1365);
    float _1373 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1375 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1373);
    float _1379 = _1059 * _1301;
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1383 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1377);
    float _1385 = fma(_1327, _1309, _1379);
    float _1387 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1389 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1391 = fma(_1339, _1313, _1385);
    float _1393 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1395 = _1371 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1397 = 1.0 / _1389;
    float _1399 = _597 + _1391;
    float _1401 = _1393 + _1389;
    float _1403 = _1357;
    float _1405 = _1339;
    if (!_1395)
    {
        _1093 = _1345;
    }
    float _1407 = _1093;
    float _1409 = _1407;
    if (!_1395)
    {
        _1095 = _1399;
    }
    float _1411 = _1095;
    bool _1413 = !_1395;
    float _1415 = _1411;
    if (!_1413)
    {
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1421 = _1371 + _1419;
        float _1423 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1425 = rsqrt(_1365);
        float _1427 = _1421 * _1417;
        float _1429 = _1427 * 0.15915493667125701904296875;
        float _1431 = _1429 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1429 * 6.283185482025146484375;
        float _1437 = sin(_1435);
        float _1439 = _1433 + (-1.0);
        float _1441 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = fma(_1437, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1445 = fma(_1399, _1433, _1441);
        float _1447 = _1425 * _1443;
        float _1449 = fma(_1363, _1447, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1451 = fma(_1355, _1447, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1403 = _1449;
        _1415 = _1445;
        _1409 = _1451;
        _1405 = _1447;
    }
    float _1453 = _1403;
    float _1455 = _1415;
    float _1457 = _1409;
    float _1459 = _1405;
    float _1461 = -_1007;
    float _1463 = _1461 + _1453;
    float _1465 = -_1003;
    float _1467 = _1465 + _1455;
    float _1469 = -_1033;
    float _1471 = _1469 + _1457;
    float _1473 = _1401 * _1397;
    float _1475 = _1473 * 0.5;
    float _1477 = _1459;
    float _1479 = _1467;
    float _1481 = _1471;
    if (_1271)
    {
        _1477 = 1.0;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (_1259)
    {
        _1035 = _1463;
    }
    float _1487 = _1035;
    float _1489 = _1487;
    if (!_1259)
    {
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1493 = _1369 + _1491;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1497 = _1351 + _1495;
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1501 = -_547;
        float _1503 = _1501 + _1457;
        float _1505 = _1493 * _1493;
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1509 = _1331 + _1507;
        float _1511 = -_539;
        float _1513 = _1511 + _1453;
        float _1515 = fma(_1497, _1497, _1505);
        float _1517 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1519 = fma(_1509, _1509, _1515);
        float _1521 = sqrt(_1519);
        float _1523 = 1.0 / _1279;
        float _1525 = _1517 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1527 = precise::min(_1521, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1529 = _1527 * _1499;
        float _1531 = -_597;
        float _1533 = _1531 + _1455;
        float _1535 = _1529 * _1523;
        float _1537 = _1525 * _1535;
        float _1539 = _1503 * _1535;
        float _1541 = fma(_1513, _1537, _1351);
        float _1543 = fma(_1533, _1537, _1369);
        float _1545 = fma(_1525, _1539, _1331);
        _1479 = _1543;
        _1489 = _1541;
        _1481 = _1545;
    }
    float _1547 = _1479;
    float _1549 = _1489;
    float _1551 = _1481;
    if (!_1271)
    {
        float _1553 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1555 = _1553 * 0.15915493667125701904296875;
        float _1557 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1561 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
        float _1563 = _1555 * 6.283185482025146484375;
        float _1565 = cos(_1563);
        float _1567 = _1557 * 0.15915493667125701904296875;
        float _1569 = _1555 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1565;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = _1567 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = 1.0 / _1561;
        float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1591 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1589;
        float _1593 = 1.0 / _1585;
        float _1595 = 1.0 / _1591;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1599 = _1587 * _1597;
        float _1601 = _1583 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1605 = fma(_1601, _1599, _1603);
        float _1607 = _1605 * _1595;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        _609 = _1555;
        _1485 = _1609;
    }
    float _1611 = _609;
    float _1613 = _1485;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1617 = _1547 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1621 = _1549 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1625 = _1551 + _1623;
    float _1627 = _1617 * _1617;
    float _1629 = fma(_1621, _1621, _1627);
    float _1631 = fma(_1625, _1625, _1629);
    float _1633 = rsqrt(_1631);
    float _1635 = sqrt(_1631);
    float _1637 = _1633 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1639 = _1621 * _1637;
    float _1641 = _1625 * _1637;
    float _1643 = _1639 * _1639;
    float _1645 = _1641 * _1641;
    float _1647 = _1643 + _1645;
    float _1649 = sqrt(_1647);
    bool _1651 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1655 = _1649 + _1653;
    float _1657 = _1629;
    float _1659 = _1647;
    float _1661 = _1655;
    float _1663 = _1611;
    float _1665 = _1617;
    if (_1651)
    {
        float _1667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1667;
    }
    float _1669 = _1657;
    if (_1651)
    {
        float _1671 = rsqrt(_1647);
        _1659 = _1671;
    }
    float _1673 = _1659;
    float _1675 = _1673;
    if (_1651)
    {
        float _1677 = _1655 * _1669;
        _1661 = _1677;
    }
    float _1679 = _1661;
    if (_1651)
    {
        float _1681 = _1679 * 0.15915493667125701904296875;
        _1663 = _1681;
    }
    float _1683 = _1663;
    float _1685 = _1625;
    float _1687 = _1683;
    if (_1651)
    {
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1685 = _1691;
    }
    float _1693 = _1685;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1669;
    float _1701 = _1697;
    if (_1651)
    {
        float _1703 = _1683 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        _1699 = _1705;
    }
    float _1707 = _1699;
    float _1709 = -_1637;
    float _1711 = -_1697;
    float _1713 = fma(_1617, _1709, _1711);
    if (_1651)
    {
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1715;
    }
    float _1717 = _1665;
    float _1719 = _1717;
    float _1721 = _1693;
    if (_1651)
    {
        float _1723 = fma(_1693, _1717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1719 = _1723;
    }
    float _1725 = _1719;
    float _1727 = _1725;
    if (!_1651)
    {
        _1721 = _1639;
    }
    float _1729 = _1721;
    float _1731 = _1729;
    float _1733 = _1707;
    if (_1651)
    {
        float _1735 = _1707 + (-1.0);
        _1701 = _1735;
    }
    float _1737 = _1701;
    float _1739 = _1737;
    if (_1651)
    {
        float _1741 = _1673 * _1725;
        _1037 = _1741;
    }
    float _1743 = _1037;
    if (!_1651)
    {
        _1727 = _1713;
    }
    float _1745 = _1727;
    float _1747 = _1745;
    if (_1651)
    {
        float _1749 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1749;
    }
    float _1751 = _1687;
    if (_1651)
    {
        float _1753 = _1639 * _1743;
        _1731 = _1753;
    }
    float _1755 = _1731;
    if (!_1651)
    {
        _1739 = _1641;
    }
    float _1757 = _1739;
    float _1759 = _1757;
    if (_1651)
    {
        float _1761 = _1641 * _1743;
        _1759 = _1761;
    }
    float _1763 = _1759;
    if (!_1651)
    {
        _1675 = _1643;
    }
    float _1765 = _1675;
    float _1767 = _1765;
    if (_1651)
    {
        float _1769 = fma(_1713, _1707, _1751);
        _1747 = _1769;
    }
    float _1771 = _1747;
    if (_1651)
    {
        float _1773 = _1755 * _1755;
        _1767 = _1773;
    }
    float _1775 = _1767;
    if (!_1651)
    {
        _1733 = _1645;
    }
    float _1777 = _1733;
    float _1779 = _1777;
    if (_1651)
    {
        float _1781 = _1763 * _1763;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1771, _1771, _1775);
    float _1787 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1789 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1791 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1793 = _1785 + _1783;
    float _1795 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1799 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1797);
    float _1801 = precise::clamp(_1799, 0.0, 1.0);
    float _1803 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1805 = rsqrt(_1793);
    float _1807 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1795);
    float _1809 = -_1801;
    float _1811 = _1809 + 1.0;
    float _1813 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1791);
    float _1815 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1819 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1803);
    float _1821 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1813);
    float _1823 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1825 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1827 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1833 = abs(_1811);
    float _1835 = log2(_1833);
    float _1837 = -_1825;
    float _1839 = fma(_1837, _1789, 1.0);
    float _1841 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1845 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1847 = _1805 * _1755;
    float _1849 = _1805 * _1763;
    float _1851 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1843);
    float _1853 = _1805 * _1771;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1857 = log2(_1839);
    float _1859 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1861 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1863 = -_1855;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1863);
    float _1867 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1869 = -_1849;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1865);
    float _1873 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1859);
    float _1877 = exp2(_1867);
    float _1879 = fma(_1871, -0.5, 0.5);
    float _1881 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1883 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1861);
    float _1885 = fma(_1871, 0.5, 0.5);
    float _1887 = _1853 + 1.0;
    float _1889 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1881);
    float _1891 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1883);
    float _1893 = 1.0 / _1875;
    float _1895 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1889);
    float _1899 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1891);
    float _1901 = _1857 * 0.693147182464599609375;
    float _1903 = fma(_1885, _1895, -0.212114393711090087890625);
    float _1905 = sqrt(_1879);
    float _1907 = -_1853;
    float _1909 = fma(_1877, _1887, _1907);
    float _1911 = fma(_1885, _1903, 1.570728778839111328125);
    float _1913 = fma(_1909, 0.5, 0.5);
    float _1915 = _1897 * _1893;
    float _1917 = _1899 * _1893;
    float _1919 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = fma(_1915, 0.5, 0.5);
    float _1923 = fma(_1917, -0.5, 0.5);
    float _1925 = _1905 * 0.636619746685028076171875;
    float3 _5006 = float3(_1921, _1923, _1919);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5006, float3(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5006, float3(0.0), isnan(_5006)), level(0.0)).x;
    float3 _5017 = float3(_1921, _1923, _1919);
    float4 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5017, float3(0.0), isnan(_5017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5017, float3(0.0), isnan(_5017)), level(0.0)).xyzw;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1930.w;
    float _1940 = -_1911;
    float _1942 = fma(_1925, _1940, 1.0);
    float2 _5039 = float2(_1942, _1913);
    float3 _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5039, float2(0.0), isnan(_5039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5039, float2(0.0), isnan(_5039)), level(0.0)).xyz;
    float _1948 = _1946.x;
    float _1950 = _1946.y;
    float _1952 = _1946.z;
    float _1954 = in.m_49.w;
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1958 = _105 > 0.5;
    float _1960 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1962 = -_859;
    float _1964 = _1962 + 1.0;
    bool _1966 = _457 > 0.5;
    float _1968 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1972 = _1970 != 0;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1976 = -as_type<float>(_229);
    int _1978 = _1958 ? as_type<int>(_1976) : _229;
    float _1980 = -_895;
    float _1982 = _1980 + 1.0;
    bool _1984 = _451 > 0.5;
    float _1986 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1968);
    float _1988 = -_869;
    float _1990 = _1988 + 1.0;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1994 = _1992 != 0;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1998 = -as_type<float>(_233);
    int _2000 = _1966 ? as_type<int>(_1998) : _233;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2006 = _2004 != 0;
    float _2008 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2012 = _2010 != 0;
    float _2014 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1986);
    bool _2016 = _1954 > 0.5;
    float _2018 = exp2(_1960);
    bool _2020 = !_1972;
    float _2022 = _2020 ? as_type<float>(_229) : as_type<float>(_1978);
    out.m_60.w = _2002;
    float _2024 = -as_type<float>(_229);
    int _2026 = _1984 ? as_type<int>(_2024) : _229;
    bool _2028 = !_1994;
    float _2030 = _2028 ? as_type<float>(_233) : as_type<float>(_2000);
    float _2032 = _2022 + 0.5;
    float _2034 = -as_type<float>(_233);
    int _2036 = _2016 ? as_type<int>(_2034) : _233;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2040 = !_2006;
    float _2042 = _2040 ? as_type<float>(_229) : as_type<float>(_2026);
    float _2044 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2046 = !_2012;
    float _2048 = _2046 ? as_type<float>(_233) : as_type<float>(_2036);
    float _2050 = fma(_2008, _2032, _865);
    float _2052 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2054 = _2042 + 0.5;
    float _2056 = _2030 + (-0.5);
    float _2058 = -_1964;
    float _2060 = fma(_2022, _2058, _2050);
    float _2062 = -_877;
    float _2064 = _2062 + 1.0;
    float _2066 = fma(_2044, _2054, _873);
    float _2068 = -_2052;
    float _2070 = -_883;
    float _2072 = fma(_2068, _2056, _2070);
    float _2074 = -_2018;
    float _2076 = _2074 + 1.0;
    float _2078 = _2048 + (-0.5);
    float _2080 = -_2064;
    float _2082 = fma(_2042, _2080, _2066);
    float _2084 = _1875 * 0.5;
    float _2086 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2088 = fma(_2030, _1982, _2072);
    float _2090 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2014);
    float _2092 = fma(_1899, -0.5, _2084);
    float _2094 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2096 = -_2086;
    float _2098 = -_897;
    float _2100 = fma(_2096, _2078, _2098);
    bool _2102 = _1613 > 0.0;
    bool _2104 = isnan(_1613);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan(0.0);
    bool _2110 = _2106 || _2108;
    float _2112 = _2090 + _1875;
    float _2114 = fma(_2048, _1990, _2100);
    float _2116 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2118 = _1897 + _1875;
    float _2120 = _2112 * 0.5;
    out.gl_Position.x = _1897;
    out.gl_Position.y = _1899;
    out.gl_Position.z = _2090;
    out.gl_Position.w = _1875;
    float _2122 = _2116 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2124 = _2118 * 0.5;
    out.m_62.x = _2060;
    out.m_62.y = _2088;
    out.m_62.z = _2082;
    out.m_62.w = _2114;
    out.m_64.x = _2124;
    out.m_64.y = _2092;
    out.m_64.z = _2120;
    out.m_64.w = _1875;
    out.m_45.x = _2122;
    float _2126 = _2094 * _1927;
    float _2128 = -_2094;
    float _2130 = _2128 + 1.0;
    float _2132 = _1938 * _2126;
    float _2134 = _1938 * _2130;
    float _2136 = _1952 * _2126;
    float _2138 = fma(_1948, _2132, _1932);
    float _2140 = fma(_1950, _2132, _1934);
    float _2142 = fma(_1938, _2136, _1936);
    out.m_66.x = _2138;
    out.m_66.y = _2140;
    out.m_66.z = _2142;
    out.m_66.w = _2134;
    if (_2110)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2144 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2144;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _441 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2200 = as_type<float>(_101);
        out.gl_Position.z = _2200;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    float _105 = in.m_49.x;
    bool _107 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_103);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_103;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _105;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2273 = as_type<float>(_141);
        out.gl_Position.z = _2273;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _145 * _143;
    float _171 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = _173 * 6.283185482025146484375;
    float _179 = floor(_173);
    int _181 = as_type<int>(_147) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_147) & 2;
    bool _187 = _185 != 0;
    float _189 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    float _191 = _177 * 0.15915493667125701904296875;
    float _193 = _147;
    float _195 = _189;
    if (!_165)
    {
        float _197 = _149 * _149;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _189 * 6.283185482025146484375;
    float _205 = floor(_189);
    float _207 = _201;
    if (!_165)
    {
        float _209 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = _203 * 0.15915493667125701904296875;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _191 * 6.283185482025146484375;
    float _221 = cos(_219);
    float _223 = -_179;
    float _225 = _173 + _223;
    bool _227 = !_183;
    int _229 = _227 ? (-1090519040) : 1056964608;
    bool _231 = !_187;
    int _233 = _231 ? (-1090519040) : 1056964608;
    float _235 = _213 * 6.283185482025146484375;
    float _237 = cos(_235);
    float _239 = -_205;
    float _241 = _189 + _239;
    float _243 = _211;
    if (!_165)
    {
        _195 = _149;
    }
    float _245 = _195;
    bool _247 = !_165;
    float _249 = _245;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _149 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _149);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _279;
    }
    float _281 = _243;
    bool _283 = !_165;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _149 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _249 = _303;
    }
    float _305 = _249;
    float _307 = in.m_56.w;
    bool _309 = _225 < 0.5;
    float _311 = float(_309);
    float _313 = fma(_221, 0.5, 0.5);
    float _315 = in.m_42.x;
    float _317 = in.m_42.y;
    float _319 = in.m_42.z;
    float _321 = -_225;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_311;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _329 = _241 < 0.5;
    float _331 = float(_329);
    float _333 = -_313;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_237, 0.5, 0.5);
    float _339 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _347 = _345 != 0;
    float _349 = -_241;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = -_331;
    float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _357 = -_337;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _361 = fma(_305, _151, _339);
    float _363 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _365 = !_217;
    int _367 = _365 ? 0 : 1;
    out.m_58.x = as_type<float>(_229);
    out.m_58.y = as_type<float>(_233);
    bool _369 = !_343;
    int _371 = _369 ? 0 : 1;
    float _373 = fma(_305, _153, _363);
    int _375 = abs(_367);
    float _377 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _379 = !_347;
    int _381 = _379 ? 0 : 1;
    int _383 = abs(_371);
    float _385 = fma(_305, _155, _377);
    float _387 = fma(_361, _307, _315);
    int _389 = abs(_381);
    float _391 = fma(_373, _307, _317);
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _395 = fma(_385, _307, _319);
    float _397 = float(_383);
    float _399 = float(_375);
    float _401 = abs(_323);
    float _403 = _397 * _401;
    float _405 = abs(_351);
    float _407 = _397 * _405;
    float _409 = float(_389);
    float _411 = fma(_399, _335, _403);
    float _413 = fma(_399, _359, _407);
    float _415 = abs(_327);
    float _417 = fma(_409, _415, _411);
    float _419 = abs(_355);
    float _421 = fma(_409, _419, _413);
    bool _423 = !_393;
    float _439;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _427 = _105 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_85);
        float _445 = 1.0 / _443;
        float _447 = _119 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_49.z;
    float _453 = _105 * 2.0;
    float _455 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = in.m_49.y;
    float _459 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = _105 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _467 = floor(_453);
    float _469 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _471 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _473 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _475 = -_465;
    float _477 = fma(_463, 2.0, _475);
    float _479 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
    float _481 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _471);
    float _483 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
    float _485 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _501 = _499 != 0;
    float _503 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _485);
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _507 = _505 != 0;
    float _509 = _451 * 2.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _511;
    bool _515 = _467 > 0.0;
    float _517 = 1.0 / _489;
    bool _519 = _467 >= 0.0;
    bool _521 = isnan(_467);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = _457 * 2.0;
    float _531 = _457 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _535 = _449 + _533;
    int _537 = _527 ? 0 : 1;
    float _539 = _479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _541 = floor(_509);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _545 = _105 + _451;
    float _547 = _483 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _549 = fma(_531, -2.0, _543);
    float _551 = _105 + _457;
    float _553 = 1.0 / _513;
    float _555 = _535 * _517;
    float _557 = _551 + (-1.0);
    float _559 = _545 + (-1.0);
    float _561 = _509;
    float _563 = _559;
    if (!_507)
    {
        _561 = _451;
    }
    float _565 = _561;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _539 + _567;
    float _571 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _573 = floor(_529);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _577 = _449 + _575;
    bool _579 = _541 >= 0.0;
    bool _581 = isnan(_541);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    float _589 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _591 = -_547;
    float _593 = _591 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _595 = _587 ? 0 : 1;
    float _597 = _481 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _599 = _577 * _553;
    float _601 = _457 + _451;
    float _603 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _503);
    float _605 = _565;
    float _607 = _593;
    float _609 = _597;
    if (!_507)
    {
        _563 = _457;
    }
    float _611 = _563;
    float _613 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _615 = log2(_613);
    float _617 = _601 + (-1.0);
    bool _619 = _573 > 0.0;
    float _621 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _623 = _573 >= 0.0;
    bool _625 = isnan(_573);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = rsqrt(_603);
    float _635 = _617;
    float _637 = _611;
    if (!_507)
    {
        _635 = _451;
    }
    float _639 = _635;
    float _641 = _639;
    if (_507)
    {
        _637 = _105;
    }
    float _643 = _637;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    if (_507)
    {
        _605 = _457;
    }
    float _649 = _605;
    if (_507)
    {
        _641 = _457;
    }
    float _651 = _641;
    float _653 = fma(_647, _599, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _655 = _541 > 0.0;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _659 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[83].z, _657);
    float _661 = _643 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _665 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _667 = isnan(_449);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _679 = ~_537;
    int _681 = _679 + 1;
    int _683 = _681 + 1;
    float _685 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[83].w, _663);
    bool _687 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _689 = isnan(_449);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_677;
    float _701 = fma(_661, 2.0, _699);
    float _703 = abs(_569);
    float _705 = abs(_593);
    float _707 = precise::max(_703, _705);
    float _709 = _649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _711 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _713 = isnan(_449);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_675;
    float _725 = _723 + 1.0;
    float _727 = -_697;
    float _729 = _727 + 1.0;
    int _731 = _683;
    if (!_515)
    {
        int _733 = ~_537;
        int _735 = _733 + 1;
        _731 = _735;
    }
    int _737 = _731;
    float _739 = _633 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _741 = _707 >= 16.0;
    float _743 = _615 * _119;
    float _745 = _697 * _725;
    float _747 = _721 * _729;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _753 = -_721;
    float _755 = _753 + 1.0;
    float _757 = exp2(_743);
    float _759 = _653 * _747;
    float _761 = fma(_751, _555, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _763 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[143].x, _759);
    int _765 = _631 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _767;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _773 = ~_765;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = fma(_761, _745, _763);
    int _781 = _777;
    if (!_619)
    {
        int _783 = ~_765;
        int _785 = _783 + 1;
        _781 = _785;
    }
    int _787 = _781;
    float _789 = fma(_769, _599, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _791 = fma(_709, -2.0, _771);
    float _793 = in.m_56.x;
    float _795 = in.m_56.y;
    int _797 = ~_595;
    int _799 = _797 + 1;
    int _801 = _799 + 1;
    float _803 = -_757;
    float _805 = _803 + 1.0;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _809 = _801;
    if (!_655)
    {
        int _811 = ~_595;
        int _813 = _811 + 1;
        _809 = _813;
    }
    int _815 = _809;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _819 = 1.0 + _817;
    bool _821 = !_501;
    int _823 = _821 ? 0 : 1;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _827 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _835 = _831 || _833;
    float _837 = 1.0 / _819;
    bool _839 = !_493;
    int _841 = _839 ? 0 : 1;
    float _843 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[78].z, _807);
    int _845 = abs(_823);
    float _847 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[78].w, _825);
    bool _849 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(1.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _843);
    int _861 = abs(_841);
    float _863 = -_119;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[76].x, _477);
    float _867 = _835 ? _805 : 0.0;
    float _869 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _685);
    float _871 = -_119;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[81].x, _701);
    float _875 = float(_845);
    float _877 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _659);
    float _879 = float(_787);
    float _881 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[145].x, _779);
    float _883 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    float _885 = float(_815);
    float _887 = _875 * _879;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _597 + _889;
    float _893 = float(_861);
    float _895 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _897 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _791);
    float _899 = _891 * _891;
    bool _901 = _857;
    if (_857)
    {
        float _903 = _867 * _837;
        _123 = _903;
    }
    float _905 = _123;
    float _907 = _893 * _885;
    float _909 = _881 * _793;
    bool _911 = !_497;
    int _913 = _911 ? 0 : 1;
    float _915 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _917 = _547 + _915;
    float _919 = fma(_569, _569, _899);
    float _921 = _907 * (-2.0);
    float _923 = _105 + (-0.5);
    int _925 = abs(_913);
    float _927 = fma(_917, _917, _919);
    float _929 = fma(_571, _921, _571);
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _933 = _887 * (-2.0);
    float _935 = _417 * _909;
    float _937 = fma(_929, _905, _931);
    float _939 = rsqrt(_927);
    float _941 = _451 + (-0.5);
    float _943 = fma(_589, _933, _589);
    float _945 = _569 * 0.0625;
    float _947 = float(_737);
    float _949 = _941 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _951 = float(_925);
    float _953 = _935 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _955 = as_type<int>(_917);
    int _957 = as_type<int>(_905);
    if (_741)
    {
        float _959 = _593 * 0.0625;
        _607 = _959;
    }
    float _961 = _607;
    float _963 = fma(_943, _905, _949);
    float _965 = _741 ? _945 : _569;
    float _967 = _953 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _969 = _951 * _947;
    float _971 = _937 * 0.15915493667125701904296875;
    float _973 = abs(_965);
    bool _975 = _973 != 0.0;
    bool _977 = isnan(_973);
    bool _979 = _975 || _977;
    bool _981 = isnan(0.0);
    bool _983 = _979 || _981;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _989 = _967 * _939;
    float _991 = _969 * (-2.0);
    float _993 = abs(_961);
    bool _995 = _993 == 0.0;
    bool _997 = !_983;
    bool _999 = _995 && _997;
    float _1001 = _739 * (-0.15915493667125701904296875);
    float _1003 = _891 * _989;
    float _1005 = fma(_621, _991, _621);
    float _1007 = _569 * _989;
    float _1009 = _963 * 0.15915493667125701904296875;
    float _1011 = fma(_987, _555, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1013 = -_1003;
    float _1015 = _891 + _1013;
    float _1017 = abs(_961);
    bool _1019 = _1017 == 0.0;
    float _1021 = -_1007;
    float _1023 = _569 + _1021;
    float _1025 = _1001 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _1015 * _1015;
    float _1031 = _457 + (-0.5);
    float _1033 = _917 * _989;
    float _1035 = _1003;
    float _1037 = _1033;
    if (_999)
    {
        bool _1039 = as_type<int>(_961) >= 0;
        _901 = _1039;
    }
    bool _1041 = _901;
    float _1043 = _789 * _747;
    float _1045 = _1009 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = _1009 * 6.283185482025146484375;
    float _1051 = cos(_1049);
    float _1053 = _971 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _971 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = fma(_1023, _1023, _1029);
    float _1063 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1065 = -_1033;
    float _1067 = _917 + _1065;
    int _1069 = _1041 ? (-1) : 0;
    if (_999)
    {
        int _1071 = _1041 ? 0 : 1078530011;
        _955 = _1071;
    }
    int _1073 = _955;
    float _1075 = fma(_1005, _905, _1063);
    float _1077 = fma(_1067, _1067, _1061);
    if (_999)
    {
        int _1079 = int(0x80000000) & as_type<int>(_965);
        int _1081 = _1073 | _1079;
        _957 = _1081;
    }
    int _1083 = _957;
    bool _1085 = !_983;
    bool _1087 = _1085 && _1019;
    int _1089 = _1083;
    float _1091 = as_type<float>(_1083);
    float _1093 = _1059;
    float _1095 = _1047;
    if (!_1087)
    {
        float _1097 = abs(_965);
        bool _1099 = _1097 != as_type<float>(0x7f800000u /* inf */);
        bool _1101 = isnan(_1097);
        bool _1103 = _1099 || _1101;
        bool _1105 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1107 = _1103 || _1105;
        float _1109 = abs(_961);
        bool _1111 = _1109 == as_type<float>(0x7f800000u /* inf */);
        float _1113 = abs(_961);
        bool _1115 = _1113 == as_type<float>(0x7f800000u /* inf */);
        bool _1117 = !_1107;
        bool _1119 = _1115 && _1117;
        if (_1119)
        {
            bool _1121 = as_type<int>(_961) >= 0;
            _1069 = _1121 ? (-1) : 0;
        }
        int _1123 = _1069;
        if (_1119)
        {
            _1089 = 1075235812;
        }
        int _1125 = _1089;
        int _1127 = _1125;
        if (_1119)
        {
            int _1129 = ~_1123;
            int _1131 = (_1129 != 0) ? _1125 : 1061752795;
            _1127 = _1131;
        }
        int _1133 = _1127;
        float _1135 = as_type<float>(_1133);
        if (_1119)
        {
            int _1137 = int(0x80000000) & as_type<int>(_965);
            int _1139 = _1133 | _1137;
            _1135 = as_type<float>(_1139);
        }
        float _1141 = _1135;
        bool _1143 = !_1107;
        bool _1145 = _1143 && _1111;
        _1091 = _1141;
        if (!_1145)
        {
            float _1147 = abs(_965);
            float _1149 = abs(_961);
            float _1151 = precise::max(_1147, _1149);
            float _1153 = abs(_965);
            float _1155 = abs(_961);
            float _1157 = precise::min(_1153, _1155);
            float _1159 = 1.0 / _1151;
            float _1161 = abs(_965);
            float _1163 = abs(_961);
            bool _1165 = _1161 > _1163;
            bool _1167 = as_type<int>(_961) >= 0;
            float _1169 = _1157 * _1159;
            float _1171 = abs(_965);
            float _1173 = abs(_961);
            float _1175 = _1171 + _1173;
            int _1177 = as_type<int>(_965) & int(0x80000000);
            float _1179 = _1169 * _1169;
            bool _1181 = _1175 > as_type<float>(0x7f800000u /* inf */);
            bool _1183 = isnan(_1175);
            bool _1185 = _1181 || _1183;
            bool _1187 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1189 = _1185 || _1187;
            float _1191 = _1179 + 11.33538818359375;
            float _1193 = fma(_1179, _1191, 28.84246826171875);
            float _1195 = fma(_1179, _1193, 19.6966705322265625);
            float _1197 = fma(_1179, -0.82336294651031494140625, -5.674867153167724609375);
            float _1199 = fma(_1179, _1197, -6.565555095672607421875);
            float _1201 = 1.0 / _1195;
            float _1203 = _1179 * _1199;
            float _1205 = _1169 * _1203;
            float _1207 = fma(_1205, _1201, _1169);
            float _1209 = _1207;
            _1091 = _1175;
            if (_1165)
            {
                float _1211 = -_1207;
                float _1213 = _1211 + 1.57079637050628662109375;
                _1209 = _1213;
            }
            float _1215 = _1209;
            int _1217 = as_type<int>(_1215);
            if (!_1167)
            {
                float _1219 = -_1215;
                float _1221 = _1219 + 3.1415927410125732421875;
                _1217 = as_type<int>(_1221);
            }
            int _1223 = _1217;
            if (!_1189)
            {
                int _1225 = _1177 | _1223;
                _1091 = as_type<float>(_1225);
            }
        }
    }
    float _1227 = _1091;
    float _1229 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1043);
    float _1231 = sqrt(_1077);
    float _1233 = -_1227;
    float _1235 = _1075 + _1233;
    float _1237 = as_type<float>(_233) * _1027;
    float _1239 = fma(_1011, _745, _1229);
    float _1241 = _1235 * 0.15915493667125701904296875;
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1237);
    float _1245 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1239);
    float _1247 = _1001 * 6.283185482025146484375;
    float _1249 = sin(_1247);
    bool _1251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1253 = isnan(0.5);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1259 = _1255 || _1257;
    float _1261 = _1245 * _795;
    bool _1263 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1265 = isnan(0.5);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1271 = _1267 || _1269;
    float _1273 = _421 * _1261;
    float _1275 = _1241 * 6.283185482025146484375;
    float _1277 = sin(_1275);
    float _1279 = _939 * _1231;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1283 = _1279 * _1281;
    float _1285 = _1241 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = as_type<float>(_233) * _1249;
    float _1291 = _1283 * _1243;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_229));
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1289);
    float _1297 = _1059 * _1277;
    float _1299 = _953 * _1279;
    float _1301 = _1051 * _1291;
    float _1303 = _1055 * _1277;
    float _1305 = -_1291;
    float _1307 = _1047 * _1305;
    float _1309 = _1299 * _1293;
    float _1311 = _1055 * _1301;
    float _1313 = _1279 * _1295;
    float _1315 = _1055 * _1287;
    float _1317 = _1059 * _1287;
    float _1319 = _1277 * _1051;
    float _1321 = -_1297;
    float _1323 = fma(_1047, _1315, _1321);
    float _1325 = fma(_1047, _1303, _1317);
    float _1327 = fma(_1047, _1317, _1303);
    float _1329 = -_1033;
    float _1331 = _547 + _1329;
    float _1333 = fma(_1323, _1309, _1311);
    float _1335 = _1287 * _1051;
    float _1337 = -_1315;
    float _1339 = fma(_1047, _1297, _1337);
    float _1341 = fma(_1325, _1313, _1333);
    float _1343 = fma(_1335, _1309, _1307);
    float _1345 = _547 + _1341;
    float _1347 = fma(_1319, _1313, _1343);
    float _1349 = -_1007;
    float _1351 = _539 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1355 = _1345 + _1353;
    float _1357 = _539 + _1347;
    float _1359 = _1355 * _1355;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1363 = _1357 + _1361;
    float _1365 = fma(_1363, _1363, _1359);
    float _1367 = -_1003;
    float _1369 = _597 + _1367;
    float _1371 = sqrt(_1365);
    float _1373 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1375 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1373);
    float _1379 = _1059 * _1301;
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1383 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1377);
    float _1385 = fma(_1327, _1309, _1379);
    float _1387 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1389 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1391 = fma(_1339, _1313, _1385);
    float _1393 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1395 = _1371 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1397 = 1.0 / _1389;
    float _1399 = _597 + _1391;
    float _1401 = _1393 + _1389;
    float _1403 = _1357;
    float _1405 = _1339;
    if (!_1395)
    {
        _1093 = _1345;
    }
    float _1407 = _1093;
    float _1409 = _1407;
    if (!_1395)
    {
        _1095 = _1399;
    }
    float _1411 = _1095;
    bool _1413 = !_1395;
    float _1415 = _1411;
    if (!_1413)
    {
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1421 = _1371 + _1419;
        float _1423 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1425 = rsqrt(_1365);
        float _1427 = _1421 * _1417;
        float _1429 = _1427 * 0.15915493667125701904296875;
        float _1431 = _1429 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1429 * 6.283185482025146484375;
        float _1437 = sin(_1435);
        float _1439 = _1433 + (-1.0);
        float _1441 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = fma(_1437, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1445 = fma(_1399, _1433, _1441);
        float _1447 = _1425 * _1443;
        float _1449 = fma(_1363, _1447, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1451 = fma(_1355, _1447, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1403 = _1449;
        _1415 = _1445;
        _1409 = _1451;
        _1405 = _1447;
    }
    float _1453 = _1403;
    float _1455 = _1415;
    float _1457 = _1409;
    float _1459 = _1405;
    float _1461 = -_1007;
    float _1463 = _1461 + _1453;
    float _1465 = -_1003;
    float _1467 = _1465 + _1455;
    float _1469 = -_1033;
    float _1471 = _1469 + _1457;
    float _1473 = _1401 * _1397;
    float _1475 = _1473 * 0.5;
    float _1477 = _1459;
    float _1479 = _1467;
    float _1481 = _1471;
    if (_1271)
    {
        _1477 = 1.0;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (_1259)
    {
        _1035 = _1463;
    }
    float _1487 = _1035;
    float _1489 = _1487;
    if (!_1259)
    {
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1493 = _1369 + _1491;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1497 = _1351 + _1495;
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1501 = -_547;
        float _1503 = _1501 + _1457;
        float _1505 = _1493 * _1493;
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1509 = _1331 + _1507;
        float _1511 = -_539;
        float _1513 = _1511 + _1453;
        float _1515 = fma(_1497, _1497, _1505);
        float _1517 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1519 = fma(_1509, _1509, _1515);
        float _1521 = sqrt(_1519);
        float _1523 = 1.0 / _1279;
        float _1525 = _1517 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1527 = precise::min(_1521, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1529 = _1527 * _1499;
        float _1531 = -_597;
        float _1533 = _1531 + _1455;
        float _1535 = _1529 * _1523;
        float _1537 = _1525 * _1535;
        float _1539 = _1503 * _1535;
        float _1541 = fma(_1513, _1537, _1351);
        float _1543 = fma(_1533, _1537, _1369);
        float _1545 = fma(_1525, _1539, _1331);
        _1479 = _1543;
        _1489 = _1541;
        _1481 = _1545;
    }
    float _1547 = _1479;
    float _1549 = _1489;
    float _1551 = _1481;
    if (!_1271)
    {
        float _1553 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1555 = _1553 * 0.15915493667125701904296875;
        float _1557 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1561 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
        float _1563 = _1555 * 6.283185482025146484375;
        float _1565 = cos(_1563);
        float _1567 = _1557 * 0.15915493667125701904296875;
        float _1569 = _1555 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1565;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = _1567 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = 1.0 / _1561;
        float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1591 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1589;
        float _1593 = 1.0 / _1585;
        float _1595 = 1.0 / _1591;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1599 = _1587 * _1597;
        float _1601 = _1583 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1605 = fma(_1601, _1599, _1603);
        float _1607 = _1605 * _1595;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        _609 = _1555;
        _1485 = _1609;
    }
    float _1611 = _609;
    float _1613 = _1485;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1617 = _1547 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1621 = _1549 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1625 = _1551 + _1623;
    float _1627 = _1617 * _1617;
    float _1629 = fma(_1621, _1621, _1627);
    float _1631 = fma(_1625, _1625, _1629);
    float _1633 = rsqrt(_1631);
    float _1635 = sqrt(_1631);
    float _1637 = _1633 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1639 = _1621 * _1637;
    float _1641 = _1625 * _1637;
    float _1643 = _1639 * _1639;
    float _1645 = _1641 * _1641;
    float _1647 = _1643 + _1645;
    float _1649 = sqrt(_1647);
    bool _1651 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1655 = _1649 + _1653;
    float _1657 = _1629;
    float _1659 = _1647;
    float _1661 = _1655;
    float _1663 = _1611;
    float _1665 = _1617;
    if (_1651)
    {
        float _1667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1667;
    }
    float _1669 = _1657;
    if (_1651)
    {
        float _1671 = rsqrt(_1647);
        _1659 = _1671;
    }
    float _1673 = _1659;
    float _1675 = _1673;
    if (_1651)
    {
        float _1677 = _1655 * _1669;
        _1661 = _1677;
    }
    float _1679 = _1661;
    if (_1651)
    {
        float _1681 = _1679 * 0.15915493667125701904296875;
        _1663 = _1681;
    }
    float _1683 = _1663;
    float _1685 = _1625;
    float _1687 = _1683;
    if (_1651)
    {
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        _1685 = _1691;
    }
    float _1693 = _1685;
    float _1695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1697 = precise::max(0.0, _1695);
    float _1699 = _1669;
    float _1701 = _1697;
    if (_1651)
    {
        float _1703 = _1683 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        _1699 = _1705;
    }
    float _1707 = _1699;
    float _1709 = -_1637;
    float _1711 = -_1697;
    float _1713 = fma(_1617, _1709, _1711);
    if (_1651)
    {
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1715;
    }
    float _1717 = _1665;
    float _1719 = _1717;
    float _1721 = _1693;
    if (_1651)
    {
        float _1723 = fma(_1693, _1717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1719 = _1723;
    }
    float _1725 = _1719;
    float _1727 = _1725;
    if (!_1651)
    {
        _1721 = _1639;
    }
    float _1729 = _1721;
    float _1731 = _1729;
    float _1733 = _1707;
    if (_1651)
    {
        float _1735 = _1707 + (-1.0);
        _1701 = _1735;
    }
    float _1737 = _1701;
    float _1739 = _1737;
    if (_1651)
    {
        float _1741 = _1673 * _1725;
        _1037 = _1741;
    }
    float _1743 = _1037;
    if (!_1651)
    {
        _1727 = _1713;
    }
    float _1745 = _1727;
    float _1747 = _1745;
    if (_1651)
    {
        float _1749 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1749;
    }
    float _1751 = _1687;
    if (_1651)
    {
        float _1753 = _1639 * _1743;
        _1731 = _1753;
    }
    float _1755 = _1731;
    if (!_1651)
    {
        _1739 = _1641;
    }
    float _1757 = _1739;
    float _1759 = _1757;
    if (_1651)
    {
        float _1761 = _1641 * _1743;
        _1759 = _1761;
    }
    float _1763 = _1759;
    if (!_1651)
    {
        _1675 = _1643;
    }
    float _1765 = _1675;
    float _1767 = _1765;
    if (_1651)
    {
        float _1769 = fma(_1713, _1707, _1751);
        _1747 = _1769;
    }
    float _1771 = _1747;
    if (_1651)
    {
        float _1773 = _1755 * _1755;
        _1767 = _1773;
    }
    float _1775 = _1767;
    if (!_1651)
    {
        _1733 = _1645;
    }
    float _1777 = _1733;
    float _1779 = _1777;
    if (_1651)
    {
        float _1781 = _1763 * _1763;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1771, _1771, _1775);
    float _1787 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1789 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1791 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1793 = _1785 + _1783;
    float _1795 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1799 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1797);
    float _1801 = precise::clamp(_1799, 0.0, 1.0);
    float _1803 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1805 = rsqrt(_1793);
    float _1807 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1795);
    float _1809 = -_1801;
    float _1811 = _1809 + 1.0;
    float _1813 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1791);
    float _1815 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1819 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1803);
    float _1821 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1813);
    float _1823 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1825 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1827 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1833 = abs(_1811);
    float _1835 = log2(_1833);
    float _1837 = -_1825;
    float _1839 = fma(_1837, _1789, 1.0);
    float _1841 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1845 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1847 = _1805 * _1755;
    float _1849 = _1805 * _1763;
    float _1851 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1843);
    float _1853 = _1805 * _1771;
    float _1855 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1857 = log2(_1839);
    float _1859 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1861 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1863 = -_1855;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1863);
    float _1867 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1869 = -_1849;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1865);
    float _1873 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1859);
    float _1877 = exp2(_1867);
    float _1879 = fma(_1871, -0.5, 0.5);
    float _1881 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1883 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1861);
    float _1885 = fma(_1871, 0.5, 0.5);
    float _1887 = _1853 + 1.0;
    float _1889 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1881);
    float _1891 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1883);
    float _1893 = 1.0 / _1875;
    float _1895 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1889);
    float _1899 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1891);
    float _1901 = _1857 * 0.693147182464599609375;
    float _1903 = fma(_1885, _1895, -0.212114393711090087890625);
    float _1905 = sqrt(_1879);
    float _1907 = -_1853;
    float _1909 = fma(_1877, _1887, _1907);
    float _1911 = fma(_1885, _1903, 1.570728778839111328125);
    float _1913 = fma(_1909, 0.5, 0.5);
    float _1915 = _1897 * _1893;
    float _1917 = _1899 * _1893;
    float _1919 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1921 = fma(_1915, 0.5, 0.5);
    float _1923 = fma(_1917, -0.5, 0.5);
    float _1925 = _1905 * 0.636619746685028076171875;
    float3 _5006 = float3(_1921, _1923, _1919);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5006, float3(0.0), isnan(_5006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5006, float3(0.0), isnan(_5006)), level(0.0)).x;
    float3 _5017 = float3(_1921, _1923, _1919);
    float4 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5017, float3(0.0), isnan(_5017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5017, float3(0.0), isnan(_5017)), level(0.0)).xyzw;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1930.w;
    float _1940 = -_1911;
    float _1942 = fma(_1925, _1940, 1.0);
    float2 _5039 = float2(_1942, _1913);
    float3 _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5039, float2(0.0), isnan(_5039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5039, float2(0.0), isnan(_5039)), level(0.0)).xyz;
    float _1948 = _1946.x;
    float _1950 = _1946.y;
    float _1952 = _1946.z;
    float _1954 = in.m_49.w;
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1958 = _105 > 0.5;
    float _1960 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1962 = -_859;
    float _1964 = _1962 + 1.0;
    bool _1966 = _457 > 0.5;
    float _1968 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1972 = _1970 != 0;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1976 = -as_type<float>(_229);
    int _1978 = _1958 ? as_type<int>(_1976) : _229;
    float _1980 = -_895;
    float _1982 = _1980 + 1.0;
    bool _1984 = _451 > 0.5;
    float _1986 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1968);
    float _1988 = -_869;
    float _1990 = _1988 + 1.0;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1994 = _1992 != 0;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1998 = -as_type<float>(_233);
    int _2000 = _1966 ? as_type<int>(_1998) : _233;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2006 = _2004 != 0;
    float _2008 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2012 = _2010 != 0;
    float _2014 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1986);
    bool _2016 = _1954 > 0.5;
    float _2018 = exp2(_1960);
    bool _2020 = !_1972;
    float _2022 = _2020 ? as_type<float>(_229) : as_type<float>(_1978);
    out.m_60.w = _2002;
    float _2024 = -as_type<float>(_229);
    int _2026 = _1984 ? as_type<int>(_2024) : _229;
    bool _2028 = !_1994;
    float _2030 = _2028 ? as_type<float>(_233) : as_type<float>(_2000);
    float _2032 = _2022 + 0.5;
    float _2034 = -as_type<float>(_233);
    int _2036 = _2016 ? as_type<int>(_2034) : _233;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2040 = !_2006;
    float _2042 = _2040 ? as_type<float>(_229) : as_type<float>(_2026);
    float _2044 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2046 = !_2012;
    float _2048 = _2046 ? as_type<float>(_233) : as_type<float>(_2036);
    float _2050 = fma(_2008, _2032, _865);
    float _2052 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2054 = _2042 + 0.5;
    float _2056 = _2030 + (-0.5);
    float _2058 = -_1964;
    float _2060 = fma(_2022, _2058, _2050);
    float _2062 = -_877;
    float _2064 = _2062 + 1.0;
    float _2066 = fma(_2044, _2054, _873);
    float _2068 = -_2052;
    float _2070 = -_883;
    float _2072 = fma(_2068, _2056, _2070);
    float _2074 = -_2018;
    float _2076 = _2074 + 1.0;
    float _2078 = _2048 + (-0.5);
    float _2080 = -_2064;
    float _2082 = fma(_2042, _2080, _2066);
    float _2084 = _1875 * 0.5;
    float _2086 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2088 = fma(_2030, _1982, _2072);
    float _2090 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2014);
    float _2092 = fma(_1899, -0.5, _2084);
    float _2094 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2096 = -_2086;
    float _2098 = -_897;
    float _2100 = fma(_2096, _2078, _2098);
    bool _2102 = _1613 > 0.0;
    bool _2104 = isnan(_1613);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan(0.0);
    bool _2110 = _2106 || _2108;
    float _2112 = _2090 + _1875;
    float _2114 = fma(_2048, _1990, _2100);
    float _2116 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2118 = _1897 + _1875;
    float _2120 = _2112 * 0.5;
    out.gl_Position.x = _1897;
    out.gl_Position.y = _1899;
    out.gl_Position.z = _2090;
    out.gl_Position.w = _1875;
    float _2122 = _2116 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2124 = _2118 * 0.5;
    out.m_62.x = _2060;
    out.m_62.y = _2088;
    out.m_62.z = _2082;
    out.m_62.w = _2114;
    out.m_64.x = _2124;
    out.m_64.y = _2092;
    out.m_64.z = _2120;
    out.m_64.w = _1875;
    out.m_45.x = _2122;
    float _2126 = _2094 * _1927;
    float _2128 = -_2094;
    float _2130 = _2128 + 1.0;
    float _2132 = _1938 * _2126;
    float _2134 = _1938 * _2130;
    float _2136 = _1952 * _2126;
    float _2138 = fma(_1948, _2132, _1932);
    float _2140 = fma(_1950, _2132, _1934);
    float _2142 = fma(_1938, _2136, _1936);
    out.m_66.x = _2138;
    out.m_66.y = _2140;
    out.m_66.z = _2142;
    out.m_66.w = _2134;
    if (_2110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2144 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2144;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

