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
    float4 m_56 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_60 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _365 = false;
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1704 = as_type<float>(_99);
        out.gl_Position.z = _1704;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    float _105 = float(_83);
    float _107 = -_103;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_103);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    bool _121 = _109 >= _105;
    bool _123 = !_119;
    bool _125 = _121 || _123;
    if (_125)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _91;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _101 = as_type<int>(_129);
    }
    int _131 = _101;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1767 = as_type<float>(_131);
        out.gl_Position.z = _1767;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_49.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = _137 * _135;
    float _157 = 0.0;
    float _159 = _139;
    if (!_149)
    {
        float _161 = _139 * _139;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _169 = _165;
    if (!_149)
    {
        float _171 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    float _175 = in.m_47.x;
    float _177 = in.m_47.y;
    float _179 = in.m_47.z;
    float _181 = _167 * 6.283185482025146484375;
    float _183 = floor(_167);
    float _185 = _181 * 0.15915493667125701904296875;
    float _187 = _185 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = -_183;
    float _193 = _167 + _191;
    bool _195 = !_149;
    float _197 = _173;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_149;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _139 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _159 = _251;
    }
    float _253 = _159;
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _257 = _255 != 0;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _261 = _259 != 0;
    float _263 = in.m_51.w;
    float _265 = 1.0 / _105;
    float _267 = in.m_42.x;
    float _269 = in.m_42.y;
    float _271 = in.m_42.z;
    bool _273 = _193 < 0.5;
    float _275 = float(_273);
    float _277 = -_193;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _281 = !_257;
    int _283 = _281 ? 0 : 1;
    float _285 = fma(_189, 0.5, 0.5);
    float _287 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = -_275;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _293 = !_153;
    int _295 = _293 ? 0 : 1;
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_253, _175, _287);
    bool _303 = !_261;
    int _305 = _303 ? 0 : 1;
    float _307 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _309 = abs(_283);
    float _311 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _315 = fma(_253, _177, _307);
    int _317 = abs(_295);
    float _319 = fma(_253, _179, _311);
    int _321 = abs(_305);
    float _323 = _109 * _265;
    float _325 = float(_309);
    float _327 = float(_317);
    float _329 = abs(_279);
    float _331 = _325 * _329;
    float _333 = fma(_319, _263, _271);
    float _335 = fma(_301, _263, _267);
    float _337 = float(_321);
    float _339 = fma(_327, _299, _331);
    float _341 = fma(_315, _263, _269);
    float _343 = abs(_291);
    float _345 = fma(_337, _343, _339);
    bool _347 = !_313;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        _363 = _323;
    }
    _365 = false;
    float _367 = _363;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _367 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _397 = 1.0 / _375;
    float _399 = 1.0 / _383;
    float _401 = 1.0 / _387;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = _367 + _403;
    float _407 = _371 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = _367 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _415 = _367 + _413;
    float _417 = 1.0 / _391;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _367 + _419;
    float _423 = _405 * _399;
    bool _425 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _427 = isnan(_367);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _439 = isnan(_367);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = 1.0 / _395;
    float _451 = _421 * _401;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _455 = _367 + _453;
    bool _457 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _459 = isnan(_367);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = 1.0 / _379;
    float _471 = _411 * _417;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = -_467;
    float _479 = _477 + 1.0;
    float _481 = _415 * _449;
    bool _483 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _485 = isnan(_367);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    bool _499 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _501 = isnan(_367);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = fma(_497, _423, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _513 = _455 * _469;
    float _515 = -_435;
    float _517 = _515 + 1.0;
    float _519 = _493 * _517;
    float _521 = -_493;
    float _523 = _521 + 1.0;
    bool _525 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _527 = isnan(_367);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _467 * _523;
    float _539 = fma(_475, _423, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _541 = _535 * _479;
    float _543 = -_535;
    float _545 = _543 + 1.0;
    bool _547 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _549 = isnan(_367);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = -_447;
    float _565 = _563 + 1.0;
    float _567 = _447 * _545;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = _557 * _565;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _579;
    float _583 = fma(_561, _451, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _585 = _509 * _575;
    float _587 = -_509;
    float _589 = _587 + 1.0;
    float _591 = fma(_571, _451, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _597 = _511 * _585;
    float _599 = as_type<float>(int(gl_VertexIndex));
    float _601 = _539 * _585;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _603;
    float _607 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _597);
    float _609 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _615 = fma(_605, _407, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _617 = fma(_581, _407, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _619 = fma(_583, _577, _607);
    float _621 = fma(_591, _577, _609);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = fma(_613, _513, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _629 = fma(_595, _513, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _631 = fma(_615, _567, _619);
    float _633 = fma(_617, _567, _621);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _635;
    float _639 = in.m_51.x;
    float _641 = in.m_51.y;
    float _643 = fma(_625, _471, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _645 = fma(_627, _541, _631);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _651 = fma(_629, _541, _633);
    float _653 = fma(_637, _471, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _659 = fma(_649, _481, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _661 = fma(_643, _537, _645);
    float _663 = fma(_653, _537, _651);
    float _665 = fma(_657, _481, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _667 = as_type<int>(_599) & 1;
    bool _669 = _667 != 0;
    int _671 = as_type<int>(_599) & 2;
    bool _673 = _671 != 0;
    float _675 = fma(_659, _519, _661);
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _679 = fma(_665, _519, _663);
    float _681 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[149].x, _675);
    float _683 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[149].y, _679);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _687 = !_673;
    float _689 = _687 ? (-0.5) : 0.5;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = _681 * _639;
    float _697 = _683 * _641;
    bool _699 = !_669;
    float _701 = _699 ? (-0.5) : 0.5;
    float _703 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _709 = !_677;
    float _725;
    if (!_709)
    {
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _713 = _133 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[14].x, _109);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        _725 = _323;
    }
    _727 = false;
    float _729 = _725;
    float _731 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _733 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _739 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _745 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _731);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _751 = 1.0 / _737;
    float _753 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _733);
    float _755 = _345 * _697;
    float _757 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _753);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _763 = 1.0 / _743;
    float _765 = _345 * _695;
    float _767 = fma(_323, -0.20000000298023223876953125, 1.0);
    bool _769 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _771 = isnan(_729);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _787 = 1.0 / _749;
    float _789 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _739);
    float _791 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _745);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _793;
    float _797 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _789);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _803 = _795 * _751;
    float _805 = 1.0 / _785;
    float _807 = _801 * _763;
    bool _809 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _811 = isnan(_729);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = _791 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _823 = _797 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _829 = 1.0 / _761;
    bool _831 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _833 = isnan(_729);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _767 * _767;
    float _845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _701);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _855 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _857 = isnan(_729);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _843 * 0.0599999986588954925537109375;
    float _869 = 1.0 / _827;
    float _871 = _849 * _787;
    float _873 = -_841;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _885 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _887 = _879 * _805;
    float _889 = _853 * _829;
    float _891 = _865 * _875;
    float _893 = -_865;
    float _895 = _893 + 1.0;
    bool _897 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _899 = isnan(_729);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _885 * _845;
    float _911 = _779 * _895;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _915 = _729 + _913;
    float _917 = _883 * _869;
    float _919 = -_779;
    float _921 = _919 + 1.0;
    float _923 = -_907;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _931 = _819 * _921;
    float _933 = -_819;
    float _935 = _933 + 1.0;
    float _937 = fma(_803, _915, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _939 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _941 = isnan(_729);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _757 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = _907 * _935;
    bool _955 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _957 = isnan(_729);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _929;
    float _969 = -_949;
    float _971 = _969 + 1.0;
    float _973 = -_951;
    float _975 = _973 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _977 = _949 * _925;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _979;
    float _983 = _965 * _971;
    float _985 = _975 * _975;
    float _987 = -_965;
    float _989 = _987 + 1.0;
    float _991 = -_823;
    float _993 = _991 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _995 = -_821;
    float _997 = _995 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _999 = _937 * _983;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1003 = _729 + _1001;
    float _1005 = fma(_997, _997, _985);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1009 = _729 + _1007;
    float _1011 = fma(_807, _1003, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1013 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[159].x, _999);
    float _1015 = fma(_993, _993, _1005);
    float _1017 = fma(_871, _1009, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1021 = _729 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1025 = _729 + _1023;
    float _1027 = fma(_1011, _977, _1013);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1031 = _729 + _1029;
    float _1033 = sqrt(_1015);
    float _1035 = fma(_889, _1021, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1037 = fma(_887, _1025, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1039 = fma(_1017, _953, _1027);
    float _1041 = fma(_917, _1031, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1043 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1045 = isnan(_729);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_1035, _931, _1039);
    float _1057 = _981 * _967;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (-4.0);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1063 = _729 + _1061;
    float _1065 = -_1053;
    float _1067 = _1065 + 1.0;
    float _1069 = fma(_1037, _911, _1055);
    float _1071 = fma(_1057, _1063, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1073 = _841 * _1067;
    float _1075 = fma(_1041, _891, _1069);
    float _1077 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[2].x, _1033);
    float _1079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _689);
    float _1081 = precise::max(0.0, _1033);
    float _1083 = fma(_1071, _1073, _1075);
    float _1085 = _1077 * _867;
    float _1087 = _781 * _1079;
    float _1089 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1083);
    float _1091 = _1085 * 0.15915493667125701904296875;
    float _1093 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1095 = _1089 * 400.0;
    float _1097 = _1091 * 6.283185482025146484375;
    float _1099 = sin(_1097);
    float _1101 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1103 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1093);
    float _1105 = precise::min(_1095, _1081);
    float _1107 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1103);
    float _1109 = 1.0 / _1095;
    float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1115 = fma(_1099, -0.3499999940395355224609375, 0.64999997615814208984375);
    float _1117 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1111);
    float _1119 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1117);
    float _1121 = -_1105;
    float _1123 = fma(_1121, _1109, 1.0);
    float _1125 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1127 = _1123 * _1115;
    float _1129 = fma(_1113, _1127, _823);
    float _1131 = fma(_1125, _1127, _821);
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1129 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1139 = _1131 + _1137;
    float _1141 = _1135 * _1135;
    float _1143 = fma(_1139, _1139, _1141);
    float _1145 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1147 = sqrt(_1143);
    float _1149 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1145);
    float _1151 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1155 = fma(_1153, _1127, _951);
    bool _1157 = _1147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = _1087;
    float _1161 = _1151;
    float _1163 = _1131;
    float _1165 = _1143;
    if (!_1157)
    {
        _1159 = _1131;
    }
    float _1167 = _1159;
    float _1169 = _1167;
    if (!_1157)
    {
        _1161 = _1129;
    }
    float _1171 = _1161;
    float _1173 = _1171;
    if (!_1157)
    {
        _1163 = _1155;
    }
    float _1175 = _1163;
    bool _1177 = !_1157;
    float _1179 = _1175;
    if (!_1177)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1185 = _1147 + _1183;
        float _1187 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = rsqrt(_1143);
        float _1191 = _1185 * _1181;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1193 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1193 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = _1197 + (-1.0);
        float _1205 = _1203 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = fma(_1201, _1187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1209 = fma(_1155, _1197, _1205);
        float _1211 = _1189 * _1207;
        float _1213 = fma(_1139, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1215 = fma(_1135, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1179 = _1209;
        _1169 = _1213;
        _1173 = _1215;
    }
    float _1217 = _1179;
    float _1219 = _1169;
    float _1221 = _1173;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1225 = _1217 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1229 = _1219 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1233 = _1221 + _1231;
    float _1235 = _1225 * _1225;
    float _1237 = fma(_1229, _1229, _1235);
    float _1239 = fma(_1233, _1233, _1237);
    float _1241 = rsqrt(_1239);
    float _1243 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1245 = _1229 * _1243;
    float _1247 = _1233 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 + _1251;
    float _1255 = sqrt(_1253);
    bool _1257 = _1255 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = _1255 + _1259;
    float _1263 = _1233;
    float _1265 = _1235;
    float _1267 = _1261;
    float _1269 = _1225;
    float _1271 = _1245;
    if (_1257)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1273;
    }
    float _1275 = _1263;
    if (_1257)
    {
        float _1277 = rsqrt(_1253);
        _1265 = _1277;
    }
    float _1279 = _1265;
    float _1281 = _1279;
    if (_1257)
    {
        float _1283 = _1261 * _1275;
        _1267 = _1283;
    }
    float _1285 = _1267;
    if (_1257)
    {
        float _1287 = _1285 * 0.15915493667125701904296875;
        _1165 = _1287;
    }
    float _1289 = _1165;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1293 = _1241;
    if (_1257)
    {
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1139;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1257)
    {
        float _1311 = _1289 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1243;
    float _1319 = -_1303;
    float _1321 = fma(_1225, _1317, _1319);
    if (_1257)
    {
        float _1323 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1239);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1257)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1329 = _1333;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    if (_1257)
    {
        float _1339 = _1315 + (-1.0);
        _1309 = _1339;
    }
    float _1341 = _1309;
    float _1343 = _1341;
    if (_1257)
    {
        float _1345 = _1279 * _1335;
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (!_1257)
    {
        _1281 = _1321;
    }
    float _1349 = _1281;
    float _1351 = _1349;
    if (_1257)
    {
        float _1353 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1353;
    }
    float _1355 = _1269;
    float _1357 = _1355;
    if (_1257)
    {
        float _1359 = _1245 * _1347;
        _1271 = _1359;
    }
    float _1361 = _1271;
    if (!_1257)
    {
        _1337 = _1247;
    }
    float _1363 = _1337;
    float _1365 = _1363;
    if (_1257)
    {
        float _1367 = _1247 * _1347;
        _1365 = _1367;
    }
    float _1369 = _1365;
    if (!_1257)
    {
        _1343 = _1249;
    }
    float _1371 = _1343;
    float _1373 = _1371;
    if (_1257)
    {
        float _1375 = fma(_1321, _1315, _1355);
        _1351 = _1375;
    }
    float _1377 = _1351;
    if (_1257)
    {
        float _1379 = _1361 * _1361;
        _1373 = _1379;
    }
    float _1381 = _1373;
    if (!_1257)
    {
        _1357 = _1251;
    }
    float _1383 = _1357;
    float _1385 = _1383;
    if (_1257)
    {
        float _1387 = _1369 * _1369;
        _1385 = _1387;
    }
    float _1389 = _1385;
    float _1391 = fma(_1377, _1377, _1381);
    float _1393 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1395 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = _1391 + _1389;
    float _1399 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1393);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1409 = rsqrt(_1397);
    float _1411 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1399);
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1407);
    float _1421 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1423 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    float _1425 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1427 = abs(_1415);
    float _1429 = log2(_1427);
    float _1431 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1437 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1439 = -_1433;
    float _1441 = fma(_1439, _1291, 1.0);
    float _1443 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1423);
    float _1445 = _1435 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = _1409 * _1361;
    float _1451 = _1409 * _1377;
    float _1453 = _1409 * _1369;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1461 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1463 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1455);
    float _1465 = -_1457;
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1465);
    float _1469 = log2(_1441);
    float _1471 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1473 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1463);
    float _1475 = -_1453;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1467);
    float _1479 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1471);
    float _1483 = _1451 + 1.0;
    float _1485 = fma(_1477, -0.5, 0.5);
    float _1487 = 1.0 / _1473;
    float _1489 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1491 = fma(_1477, 0.5, 0.5);
    float _1493 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1481);
    float _1495 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1497 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = exp2(_1461);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1495);
    float _1503 = fma(_1491, _1497, -0.212114393711090087890625);
    float _1505 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1493);
    float _1507 = _1469 * 0.693147182464599609375;
    float _1509 = fma(_1491, _1503, 1.570728778839111328125);
    float _1511 = sqrt(_1485);
    float _1513 = _1501 * _1487;
    float _1515 = _1505 * _1487;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1519 = fma(_1513, 0.5, 0.5);
    float _1521 = fma(_1515, -0.5, 0.5);
    float _1523 = -_1451;
    float _1525 = fma(_1499, _1483, _1523);
    float3 _4006 = float3(_1519, _1521, _1517);
    float _1527 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).x;
    float3 _4017 = float3(_1519, _1521, _1517);
    float4 _1530 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4017, float3(0.0), isnan(_4017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4017, float3(0.0), isnan(_4017)), level(0.0)).xyzw;
    float _1532 = _1530.x;
    float _1534 = _1530.y;
    float _1536 = _1530.z;
    float _1538 = _1530.w;
    float _1540 = fma(_1525, 0.5, 0.5);
    float _1542 = _1511 * 0.636619746685028076171875;
    float _1544 = -_1509;
    float _1546 = fma(_1542, _1544, 1.0);
    float2 _4044 = float2(_1546, _1540);
    float3 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4044, float2(0.0), isnan(_4044)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4044, float2(0.0), isnan(_4044)), level(0.0)).xyz;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = in.m_49.y;
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1562 = _133 > 0.5;
    float _1564 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1568 = _1566 != 0;
    out.m_56.x = _703;
    out.m_56.y = _705;
    out.m_56.z = _707;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1572 = _1570 != 0;
    float _1574 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1576 = -_701;
    int _1578 = _1562 ? as_type<int>(_1576) : as_type<int>(_701);
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1582 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1564);
    out.m_58.x = _821;
    out.m_58.y = _951;
    out.m_58.z = _823;
    bool _1584 = !_1568;
    float _1586 = _1584 ? _701 : as_type<float>(_1578);
    float _1588 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1582);
    float _1590 = exp2(_1574);
    float _1592 = _1586 + 0.5;
    float _1594 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1588);
    float _1596 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1598 = _1558 > 0.5;
    out.gl_Position.x = _1501;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _1594;
    out.gl_Position.w = _1473;
    float _1600 = _1596 * _1560;
    float _1602 = -_689;
    int _1604 = _1598 ? as_type<int>(_1602) : as_type<int>(_689);
    float _1606 = _1594 + _1473;
    float _1608 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1610 = !_1572;
    float _1612 = _1610 ? _689 : as_type<float>(_1604);
    float _1614 = _1606 * 0.5;
    float _1616 = -_1590;
    float _1618 = _1616 + 1.0;
    out.m_45.x = _1608;
    float _1620 = -_1612;
    float _1622 = _1620 + 0.5;
    float _1624 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.z = _1614;
    out.m_60.w = _1473;
    float _1626 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1628 = -_1624;
    float _1630 = _1628 + 1.0;
    float _1632 = _1626 * _1580;
    out.m_62.x = _1600;
    out.m_62.y = _1632;
    float _1634 = _1624 * _1527;
    float _1636 = _1538 * _1634;
    float _1638 = _1538 * _1630;
    float _1640 = _1556 * _1634;
    float _1642 = fma(_1552, _1636, _1532);
    float _1644 = fma(_1554, _1636, _1534);
    float _1646 = fma(_1538, _1640, _1536);
    out.m_64.x = _1642;
    out.m_64.y = _1644;
    out.m_64.z = _1646;
    out.m_64.w = _1638;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _365 = false;
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1704 = as_type<float>(_99);
        out.gl_Position.z = _1704;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    float _105 = float(_83);
    float _107 = -_103;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_103);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    bool _121 = _109 >= _105;
    bool _123 = !_119;
    bool _125 = _121 || _123;
    if (_125)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _91;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _101 = as_type<int>(_129);
    }
    int _131 = _101;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1767 = as_type<float>(_131);
        out.gl_Position.z = _1767;
    }
    if (_125)
    {
        return out;
    }
    float _133 = in.m_49.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = _137 * _135;
    float _157 = 0.0;
    float _159 = _139;
    if (!_149)
    {
        float _161 = _139 * _139;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _169 = _165;
    if (!_149)
    {
        float _171 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    float _175 = in.m_47.x;
    float _177 = in.m_47.y;
    float _179 = in.m_47.z;
    float _181 = _167 * 6.283185482025146484375;
    float _183 = floor(_167);
    float _185 = _181 * 0.15915493667125701904296875;
    float _187 = _185 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = -_183;
    float _193 = _167 + _191;
    bool _195 = !_149;
    float _197 = _173;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_149;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _139 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _159 = _251;
    }
    float _253 = _159;
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _257 = _255 != 0;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _261 = _259 != 0;
    float _263 = in.m_51.w;
    float _265 = 1.0 / _105;
    float _267 = in.m_42.x;
    float _269 = in.m_42.y;
    float _271 = in.m_42.z;
    bool _273 = _193 < 0.5;
    float _275 = float(_273);
    float _277 = -_193;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _281 = !_257;
    int _283 = _281 ? 0 : 1;
    float _285 = fma(_189, 0.5, 0.5);
    float _287 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = -_275;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _293 = !_153;
    int _295 = _293 ? 0 : 1;
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_253, _175, _287);
    bool _303 = !_261;
    int _305 = _303 ? 0 : 1;
    float _307 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _309 = abs(_283);
    float _311 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _315 = fma(_253, _177, _307);
    int _317 = abs(_295);
    float _319 = fma(_253, _179, _311);
    int _321 = abs(_305);
    float _323 = _109 * _265;
    float _325 = float(_309);
    float _327 = float(_317);
    float _329 = abs(_279);
    float _331 = _325 * _329;
    float _333 = fma(_319, _263, _271);
    float _335 = fma(_301, _263, _267);
    float _337 = float(_321);
    float _339 = fma(_327, _299, _331);
    float _341 = fma(_315, _263, _269);
    float _343 = abs(_291);
    float _345 = fma(_337, _343, _339);
    bool _347 = !_313;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        _363 = _323;
    }
    _365 = false;
    float _367 = _363;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _367 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _397 = 1.0 / _375;
    float _399 = 1.0 / _383;
    float _401 = 1.0 / _387;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = _367 + _403;
    float _407 = _371 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = _367 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _415 = _367 + _413;
    float _417 = 1.0 / _391;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _367 + _419;
    float _423 = _405 * _399;
    bool _425 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _427 = isnan(_367);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _439 = isnan(_367);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = 1.0 / _395;
    float _451 = _421 * _401;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _455 = _367 + _453;
    bool _457 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _459 = isnan(_367);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = 1.0 / _379;
    float _471 = _411 * _417;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = -_467;
    float _479 = _477 + 1.0;
    float _481 = _415 * _449;
    bool _483 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _485 = isnan(_367);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    bool _499 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _501 = isnan(_367);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = fma(_497, _423, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _513 = _455 * _469;
    float _515 = -_435;
    float _517 = _515 + 1.0;
    float _519 = _493 * _517;
    float _521 = -_493;
    float _523 = _521 + 1.0;
    bool _525 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _527 = isnan(_367);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _467 * _523;
    float _539 = fma(_475, _423, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _541 = _535 * _479;
    float _543 = -_535;
    float _545 = _543 + 1.0;
    bool _547 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _549 = isnan(_367);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = -_447;
    float _565 = _563 + 1.0;
    float _567 = _447 * _545;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = _557 * _565;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _579;
    float _583 = fma(_561, _451, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _585 = _509 * _575;
    float _587 = -_509;
    float _589 = _587 + 1.0;
    float _591 = fma(_571, _451, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _597 = _511 * _585;
    float _599 = as_type<float>(int(gl_VertexIndex));
    float _601 = _539 * _585;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _603;
    float _607 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _597);
    float _609 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _615 = fma(_605, _407, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _617 = fma(_581, _407, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _619 = fma(_583, _577, _607);
    float _621 = fma(_591, _577, _609);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = fma(_613, _513, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _629 = fma(_595, _513, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _631 = fma(_615, _567, _619);
    float _633 = fma(_617, _567, _621);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _635;
    float _639 = in.m_51.x;
    float _641 = in.m_51.y;
    float _643 = fma(_625, _471, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _645 = fma(_627, _541, _631);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _651 = fma(_629, _541, _633);
    float _653 = fma(_637, _471, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _659 = fma(_649, _481, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _661 = fma(_643, _537, _645);
    float _663 = fma(_653, _537, _651);
    float _665 = fma(_657, _481, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _667 = as_type<int>(_599) & 1;
    bool _669 = _667 != 0;
    int _671 = as_type<int>(_599) & 2;
    bool _673 = _671 != 0;
    float _675 = fma(_659, _519, _661);
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _679 = fma(_665, _519, _663);
    float _681 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[149].x, _675);
    float _683 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[149].y, _679);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _687 = !_673;
    float _689 = _687 ? (-0.5) : 0.5;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = _681 * _639;
    float _697 = _683 * _641;
    bool _699 = !_669;
    float _701 = _699 ? (-0.5) : 0.5;
    float _703 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _709 = !_677;
    float _725;
    if (!_709)
    {
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _713 = _133 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[14].x, _109);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        _725 = _323;
    }
    _727 = false;
    float _729 = _725;
    float _731 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _733 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _739 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _745 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _731);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _751 = 1.0 / _737;
    float _753 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _733);
    float _755 = _345 * _697;
    float _757 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _753);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _763 = 1.0 / _743;
    float _765 = _345 * _695;
    float _767 = fma(_323, -0.20000000298023223876953125, 1.0);
    bool _769 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _771 = isnan(_729);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _787 = 1.0 / _749;
    float _789 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _739);
    float _791 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _745);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _793;
    float _797 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _789);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _803 = _795 * _751;
    float _805 = 1.0 / _785;
    float _807 = _801 * _763;
    bool _809 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _811 = isnan(_729);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = _791 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _823 = _797 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _829 = 1.0 / _761;
    bool _831 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _833 = isnan(_729);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _767 * _767;
    float _845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _701);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _855 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _857 = isnan(_729);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _843 * 0.0599999986588954925537109375;
    float _869 = 1.0 / _827;
    float _871 = _849 * _787;
    float _873 = -_841;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _885 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _887 = _879 * _805;
    float _889 = _853 * _829;
    float _891 = _865 * _875;
    float _893 = -_865;
    float _895 = _893 + 1.0;
    bool _897 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _899 = isnan(_729);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _885 * _845;
    float _911 = _779 * _895;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _915 = _729 + _913;
    float _917 = _883 * _869;
    float _919 = -_779;
    float _921 = _919 + 1.0;
    float _923 = -_907;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _931 = _819 * _921;
    float _933 = -_819;
    float _935 = _933 + 1.0;
    float _937 = fma(_803, _915, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _939 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _941 = isnan(_729);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _757 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = _907 * _935;
    bool _955 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _957 = isnan(_729);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _929;
    float _969 = -_949;
    float _971 = _969 + 1.0;
    float _973 = -_951;
    float _975 = _973 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _977 = _949 * _925;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _979;
    float _983 = _965 * _971;
    float _985 = _975 * _975;
    float _987 = -_965;
    float _989 = _987 + 1.0;
    float _991 = -_823;
    float _993 = _991 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _995 = -_821;
    float _997 = _995 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _999 = _937 * _983;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1003 = _729 + _1001;
    float _1005 = fma(_997, _997, _985);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1009 = _729 + _1007;
    float _1011 = fma(_807, _1003, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1013 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[159].x, _999);
    float _1015 = fma(_993, _993, _1005);
    float _1017 = fma(_871, _1009, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1021 = _729 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1025 = _729 + _1023;
    float _1027 = fma(_1011, _977, _1013);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1031 = _729 + _1029;
    float _1033 = sqrt(_1015);
    float _1035 = fma(_889, _1021, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1037 = fma(_887, _1025, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1039 = fma(_1017, _953, _1027);
    float _1041 = fma(_917, _1031, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1043 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1045 = isnan(_729);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_1035, _931, _1039);
    float _1057 = _981 * _967;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (-4.0);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1063 = _729 + _1061;
    float _1065 = -_1053;
    float _1067 = _1065 + 1.0;
    float _1069 = fma(_1037, _911, _1055);
    float _1071 = fma(_1057, _1063, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1073 = _841 * _1067;
    float _1075 = fma(_1041, _891, _1069);
    float _1077 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[2].x, _1033);
    float _1079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _689);
    float _1081 = precise::max(0.0, _1033);
    float _1083 = fma(_1071, _1073, _1075);
    float _1085 = _1077 * _867;
    float _1087 = _781 * _1079;
    float _1089 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1083);
    float _1091 = _1085 * 0.15915493667125701904296875;
    float _1093 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1095 = _1089 * 400.0;
    float _1097 = _1091 * 6.283185482025146484375;
    float _1099 = sin(_1097);
    float _1101 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1103 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1093);
    float _1105 = precise::min(_1095, _1081);
    float _1107 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1103);
    float _1109 = 1.0 / _1095;
    float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1115 = fma(_1099, -0.3499999940395355224609375, 0.64999997615814208984375);
    float _1117 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1111);
    float _1119 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1117);
    float _1121 = -_1105;
    float _1123 = fma(_1121, _1109, 1.0);
    float _1125 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1127 = _1123 * _1115;
    float _1129 = fma(_1113, _1127, _823);
    float _1131 = fma(_1125, _1127, _821);
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1129 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1139 = _1131 + _1137;
    float _1141 = _1135 * _1135;
    float _1143 = fma(_1139, _1139, _1141);
    float _1145 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1147 = sqrt(_1143);
    float _1149 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1145);
    float _1151 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1155 = fma(_1153, _1127, _951);
    bool _1157 = _1147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = _1087;
    float _1161 = _1151;
    float _1163 = _1131;
    float _1165 = _1143;
    if (!_1157)
    {
        _1159 = _1131;
    }
    float _1167 = _1159;
    float _1169 = _1167;
    if (!_1157)
    {
        _1161 = _1129;
    }
    float _1171 = _1161;
    float _1173 = _1171;
    if (!_1157)
    {
        _1163 = _1155;
    }
    float _1175 = _1163;
    bool _1177 = !_1157;
    float _1179 = _1175;
    if (!_1177)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1185 = _1147 + _1183;
        float _1187 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = rsqrt(_1143);
        float _1191 = _1185 * _1181;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1193 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1193 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = _1197 + (-1.0);
        float _1205 = _1203 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = fma(_1201, _1187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1209 = fma(_1155, _1197, _1205);
        float _1211 = _1189 * _1207;
        float _1213 = fma(_1139, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1215 = fma(_1135, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1179 = _1209;
        _1169 = _1213;
        _1173 = _1215;
    }
    float _1217 = _1179;
    float _1219 = _1169;
    float _1221 = _1173;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1225 = _1217 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1229 = _1219 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1233 = _1221 + _1231;
    float _1235 = _1225 * _1225;
    float _1237 = fma(_1229, _1229, _1235);
    float _1239 = fma(_1233, _1233, _1237);
    float _1241 = rsqrt(_1239);
    float _1243 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1245 = _1229 * _1243;
    float _1247 = _1233 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 + _1251;
    float _1255 = sqrt(_1253);
    bool _1257 = _1255 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = _1255 + _1259;
    float _1263 = _1233;
    float _1265 = _1235;
    float _1267 = _1261;
    float _1269 = _1225;
    float _1271 = _1245;
    if (_1257)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1273;
    }
    float _1275 = _1263;
    if (_1257)
    {
        float _1277 = rsqrt(_1253);
        _1265 = _1277;
    }
    float _1279 = _1265;
    float _1281 = _1279;
    if (_1257)
    {
        float _1283 = _1261 * _1275;
        _1267 = _1283;
    }
    float _1285 = _1267;
    if (_1257)
    {
        float _1287 = _1285 * 0.15915493667125701904296875;
        _1165 = _1287;
    }
    float _1289 = _1165;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1293 = _1241;
    if (_1257)
    {
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1139;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1257)
    {
        float _1311 = _1289 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1243;
    float _1319 = -_1303;
    float _1321 = fma(_1225, _1317, _1319);
    if (_1257)
    {
        float _1323 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1239);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1257)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1329 = _1333;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    if (_1257)
    {
        float _1339 = _1315 + (-1.0);
        _1309 = _1339;
    }
    float _1341 = _1309;
    float _1343 = _1341;
    if (_1257)
    {
        float _1345 = _1279 * _1335;
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (!_1257)
    {
        _1281 = _1321;
    }
    float _1349 = _1281;
    float _1351 = _1349;
    if (_1257)
    {
        float _1353 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1353;
    }
    float _1355 = _1269;
    float _1357 = _1355;
    if (_1257)
    {
        float _1359 = _1245 * _1347;
        _1271 = _1359;
    }
    float _1361 = _1271;
    if (!_1257)
    {
        _1337 = _1247;
    }
    float _1363 = _1337;
    float _1365 = _1363;
    if (_1257)
    {
        float _1367 = _1247 * _1347;
        _1365 = _1367;
    }
    float _1369 = _1365;
    if (!_1257)
    {
        _1343 = _1249;
    }
    float _1371 = _1343;
    float _1373 = _1371;
    if (_1257)
    {
        float _1375 = fma(_1321, _1315, _1355);
        _1351 = _1375;
    }
    float _1377 = _1351;
    if (_1257)
    {
        float _1379 = _1361 * _1361;
        _1373 = _1379;
    }
    float _1381 = _1373;
    if (!_1257)
    {
        _1357 = _1251;
    }
    float _1383 = _1357;
    float _1385 = _1383;
    if (_1257)
    {
        float _1387 = _1369 * _1369;
        _1385 = _1387;
    }
    float _1389 = _1385;
    float _1391 = fma(_1377, _1377, _1381);
    float _1393 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1395 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = _1391 + _1389;
    float _1399 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1393);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1409 = rsqrt(_1397);
    float _1411 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1399);
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1407);
    float _1421 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1423 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    float _1425 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1427 = abs(_1415);
    float _1429 = log2(_1427);
    float _1431 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1437 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1439 = -_1433;
    float _1441 = fma(_1439, _1291, 1.0);
    float _1443 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1423);
    float _1445 = _1435 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = _1409 * _1361;
    float _1451 = _1409 * _1377;
    float _1453 = _1409 * _1369;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1461 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1463 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1455);
    float _1465 = -_1457;
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1465);
    float _1469 = log2(_1441);
    float _1471 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1473 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1463);
    float _1475 = -_1453;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1467);
    float _1479 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1471);
    float _1483 = _1451 + 1.0;
    float _1485 = fma(_1477, -0.5, 0.5);
    float _1487 = 1.0 / _1473;
    float _1489 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1491 = fma(_1477, 0.5, 0.5);
    float _1493 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1481);
    float _1495 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1497 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = exp2(_1461);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1495);
    float _1503 = fma(_1491, _1497, -0.212114393711090087890625);
    float _1505 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1493);
    float _1507 = _1469 * 0.693147182464599609375;
    float _1509 = fma(_1491, _1503, 1.570728778839111328125);
    float _1511 = sqrt(_1485);
    float _1513 = _1501 * _1487;
    float _1515 = _1505 * _1487;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1519 = fma(_1513, 0.5, 0.5);
    float _1521 = fma(_1515, -0.5, 0.5);
    float _1523 = -_1451;
    float _1525 = fma(_1499, _1483, _1523);
    float3 _4006 = float3(_1519, _1521, _1517);
    float _1527 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).x;
    float3 _4017 = float3(_1519, _1521, _1517);
    float4 _1530 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4017, float3(0.0), isnan(_4017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4017, float3(0.0), isnan(_4017)), level(0.0)).xyzw;
    float _1532 = _1530.x;
    float _1534 = _1530.y;
    float _1536 = _1530.z;
    float _1538 = _1530.w;
    float _1540 = fma(_1525, 0.5, 0.5);
    float _1542 = _1511 * 0.636619746685028076171875;
    float _1544 = -_1509;
    float _1546 = fma(_1542, _1544, 1.0);
    float2 _4044 = float2(_1546, _1540);
    float3 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4044, float2(0.0), isnan(_4044)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4044, float2(0.0), isnan(_4044)), level(0.0)).xyz;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = in.m_49.y;
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1562 = _133 > 0.5;
    float _1564 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1568 = _1566 != 0;
    out.m_56.x = _703;
    out.m_56.y = _705;
    out.m_56.z = _707;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1572 = _1570 != 0;
    float _1574 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1576 = -_701;
    int _1578 = _1562 ? as_type<int>(_1576) : as_type<int>(_701);
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1582 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1564);
    out.m_58.x = _821;
    out.m_58.y = _951;
    out.m_58.z = _823;
    bool _1584 = !_1568;
    float _1586 = _1584 ? _701 : as_type<float>(_1578);
    float _1588 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1582);
    float _1590 = exp2(_1574);
    float _1592 = _1586 + 0.5;
    float _1594 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1588);
    float _1596 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1598 = _1558 > 0.5;
    out.gl_Position.x = _1501;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _1594;
    out.gl_Position.w = _1473;
    float _1600 = _1596 * _1560;
    float _1602 = -_689;
    int _1604 = _1598 ? as_type<int>(_1602) : as_type<int>(_689);
    float _1606 = _1594 + _1473;
    float _1608 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1610 = !_1572;
    float _1612 = _1610 ? _689 : as_type<float>(_1604);
    float _1614 = _1606 * 0.5;
    float _1616 = -_1590;
    float _1618 = _1616 + 1.0;
    out.m_45.x = _1608;
    float _1620 = -_1612;
    float _1622 = _1620 + 0.5;
    float _1624 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.z = _1614;
    out.m_60.w = _1473;
    float _1626 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1628 = -_1624;
    float _1630 = _1628 + 1.0;
    float _1632 = _1626 * _1580;
    out.m_62.x = _1600;
    out.m_62.y = _1632;
    float _1634 = _1624 * _1527;
    float _1636 = _1538 * _1634;
    float _1638 = _1538 * _1630;
    float _1640 = _1556 * _1634;
    float _1642 = fma(_1552, _1636, _1532);
    float _1644 = fma(_1554, _1636, _1534);
    float _1646 = fma(_1538, _1640, _1536);
    out.m_64.x = _1642;
    out.m_64.y = _1644;
    out.m_64.z = _1646;
    out.m_64.w = _1638;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _365 = false;
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
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1704 = as_type<float>(_99);
        out.gl_Position.z = _1704;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    float _105 = float(_83);
    float _107 = -_103;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_103);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    bool _121 = _109 >= _105;
    bool _123 = !_119;
    bool _125 = _121 || _123;
    if (_125)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _91;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _101 = as_type<int>(_129);
    }
    int _131 = _101;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1767 = as_type<float>(_131);
        out.gl_Position.z = _1767;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_49.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    int _151 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _153 = _151 != 0;
    float _155 = _137 * _135;
    float _157 = 0.0;
    float _159 = _139;
    if (!_149)
    {
        float _161 = _139 * _139;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _169 = _165;
    if (!_149)
    {
        float _171 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    float _175 = in.m_47.x;
    float _177 = in.m_47.y;
    float _179 = in.m_47.z;
    float _181 = _167 * 6.283185482025146484375;
    float _183 = floor(_167);
    float _185 = _181 * 0.15915493667125701904296875;
    float _187 = _185 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = -_183;
    float _193 = _167 + _191;
    bool _195 = !_149;
    float _197 = _173;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_149;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _139 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _159 = _251;
    }
    float _253 = _159;
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _257 = _255 != 0;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _261 = _259 != 0;
    float _263 = in.m_51.w;
    float _265 = 1.0 / _105;
    float _267 = in.m_42.x;
    float _269 = in.m_42.y;
    float _271 = in.m_42.z;
    bool _273 = _193 < 0.5;
    float _275 = float(_273);
    float _277 = -_193;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _281 = !_257;
    int _283 = _281 ? 0 : 1;
    float _285 = fma(_189, 0.5, 0.5);
    float _287 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = -_275;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _293 = !_153;
    int _295 = _293 ? 0 : 1;
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_253, _175, _287);
    bool _303 = !_261;
    int _305 = _303 ? 0 : 1;
    float _307 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _309 = abs(_283);
    float _311 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _315 = fma(_253, _177, _307);
    int _317 = abs(_295);
    float _319 = fma(_253, _179, _311);
    int _321 = abs(_305);
    float _323 = _109 * _265;
    float _325 = float(_309);
    float _327 = float(_317);
    float _329 = abs(_279);
    float _331 = _325 * _329;
    float _333 = fma(_319, _263, _271);
    float _335 = fma(_301, _263, _267);
    float _337 = float(_321);
    float _339 = fma(_327, _299, _331);
    float _341 = fma(_315, _263, _269);
    float _343 = abs(_291);
    float _345 = fma(_337, _343, _339);
    bool _347 = !_313;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        _363 = _323;
    }
    _365 = false;
    float _367 = _363;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _367 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _397 = 1.0 / _375;
    float _399 = 1.0 / _383;
    float _401 = 1.0 / _387;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = _367 + _403;
    float _407 = _371 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = _367 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _415 = _367 + _413;
    float _417 = 1.0 / _391;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _367 + _419;
    float _423 = _405 * _399;
    bool _425 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _427 = isnan(_367);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _439 = isnan(_367);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = 1.0 / _395;
    float _451 = _421 * _401;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _455 = _367 + _453;
    bool _457 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _459 = isnan(_367);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = 1.0 / _379;
    float _471 = _411 * _417;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = -_467;
    float _479 = _477 + 1.0;
    float _481 = _415 * _449;
    bool _483 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _485 = isnan(_367);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    bool _499 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _501 = isnan(_367);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = fma(_497, _423, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _513 = _455 * _469;
    float _515 = -_435;
    float _517 = _515 + 1.0;
    float _519 = _493 * _517;
    float _521 = -_493;
    float _523 = _521 + 1.0;
    bool _525 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _527 = isnan(_367);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _467 * _523;
    float _539 = fma(_475, _423, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _541 = _535 * _479;
    float _543 = -_535;
    float _545 = _543 + 1.0;
    bool _547 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _549 = isnan(_367);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = -_447;
    float _565 = _563 + 1.0;
    float _567 = _447 * _545;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = _557 * _565;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _579;
    float _583 = fma(_561, _451, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _585 = _509 * _575;
    float _587 = -_509;
    float _589 = _587 + 1.0;
    float _591 = fma(_571, _451, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _597 = _511 * _585;
    float _599 = as_type<float>(int(gl_VertexIndex));
    float _601 = _539 * _585;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _603;
    float _607 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _597);
    float _609 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _601);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _615 = fma(_605, _407, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _617 = fma(_581, _407, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _619 = fma(_583, _577, _607);
    float _621 = fma(_591, _577, _609);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _623;
    float _627 = fma(_613, _513, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _629 = fma(_595, _513, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _631 = fma(_615, _567, _619);
    float _633 = fma(_617, _567, _621);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _635;
    float _639 = in.m_51.x;
    float _641 = in.m_51.y;
    float _643 = fma(_625, _471, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _645 = fma(_627, _541, _631);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _651 = fma(_629, _541, _633);
    float _653 = fma(_637, _471, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _659 = fma(_649, _481, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _661 = fma(_643, _537, _645);
    float _663 = fma(_653, _537, _651);
    float _665 = fma(_657, _481, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _667 = as_type<int>(_599) & 1;
    bool _669 = _667 != 0;
    int _671 = as_type<int>(_599) & 2;
    bool _673 = _671 != 0;
    float _675 = fma(_659, _519, _661);
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _679 = fma(_665, _519, _663);
    float _681 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[149].x, _675);
    float _683 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[149].y, _679);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _687 = !_673;
    float _689 = _687 ? (-0.5) : 0.5;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _695 = _681 * _639;
    float _697 = _683 * _641;
    bool _699 = !_669;
    float _701 = _699 ? (-0.5) : 0.5;
    float _703 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _709 = !_677;
    float _725;
    if (!_709)
    {
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _713 = _133 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[14].x, _109);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        _725 = _323;
    }
    _727 = false;
    float _729 = _725;
    float _731 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _733 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _739 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _745 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _731);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _751 = 1.0 / _737;
    float _753 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _733);
    float _755 = _345 * _697;
    float _757 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _753);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _763 = 1.0 / _743;
    float _765 = _345 * _695;
    float _767 = fma(_323, -0.20000000298023223876953125, 1.0);
    bool _769 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _771 = isnan(_729);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _787 = 1.0 / _749;
    float _789 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _739);
    float _791 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _745);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _793;
    float _797 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _789);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _803 = _795 * _751;
    float _805 = 1.0 / _785;
    float _807 = _801 * _763;
    bool _809 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _811 = isnan(_729);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = _791 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _823 = _797 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _829 = 1.0 / _761;
    bool _831 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _833 = isnan(_729);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _767 * _767;
    float _845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _701);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _855 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _857 = isnan(_729);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _843 * 0.0599999986588954925537109375;
    float _869 = 1.0 / _827;
    float _871 = _849 * _787;
    float _873 = -_841;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _885 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _887 = _879 * _805;
    float _889 = _853 * _829;
    float _891 = _865 * _875;
    float _893 = -_865;
    float _895 = _893 + 1.0;
    bool _897 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _899 = isnan(_729);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = _885 * _845;
    float _911 = _779 * _895;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _915 = _729 + _913;
    float _917 = _883 * _869;
    float _919 = -_779;
    float _921 = _919 + 1.0;
    float _923 = -_907;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _931 = _819 * _921;
    float _933 = -_819;
    float _935 = _933 + 1.0;
    float _937 = fma(_803, _915, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _939 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _941 = isnan(_729);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _757 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _953 = _907 * _935;
    bool _955 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _957 = isnan(_729);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _929;
    float _969 = -_949;
    float _971 = _969 + 1.0;
    float _973 = -_951;
    float _975 = _973 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _977 = _949 * _925;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _979;
    float _983 = _965 * _971;
    float _985 = _975 * _975;
    float _987 = -_965;
    float _989 = _987 + 1.0;
    float _991 = -_823;
    float _993 = _991 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _995 = -_821;
    float _997 = _995 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _999 = _937 * _983;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1003 = _729 + _1001;
    float _1005 = fma(_997, _997, _985);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1009 = _729 + _1007;
    float _1011 = fma(_807, _1003, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1013 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[159].x, _999);
    float _1015 = fma(_993, _993, _1005);
    float _1017 = fma(_871, _1009, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1021 = _729 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1025 = _729 + _1023;
    float _1027 = fma(_1011, _977, _1013);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1031 = _729 + _1029;
    float _1033 = sqrt(_1015);
    float _1035 = fma(_889, _1021, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1037 = fma(_887, _1025, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1039 = fma(_1017, _953, _1027);
    float _1041 = fma(_917, _1031, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1043 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1045 = isnan(_729);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_1035, _931, _1039);
    float _1057 = _981 * _967;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (-4.0);
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1063 = _729 + _1061;
    float _1065 = -_1053;
    float _1067 = _1065 + 1.0;
    float _1069 = fma(_1037, _911, _1055);
    float _1071 = fma(_1057, _1063, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1073 = _841 * _1067;
    float _1075 = fma(_1041, _891, _1069);
    float _1077 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[2].x, _1033);
    float _1079 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _689);
    float _1081 = precise::max(0.0, _1033);
    float _1083 = fma(_1071, _1073, _1075);
    float _1085 = _1077 * _867;
    float _1087 = _781 * _1079;
    float _1089 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1083);
    float _1091 = _1085 * 0.15915493667125701904296875;
    float _1093 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1095 = _1089 * 400.0;
    float _1097 = _1091 * 6.283185482025146484375;
    float _1099 = sin(_1097);
    float _1101 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1103 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1093);
    float _1105 = precise::min(_1095, _1081);
    float _1107 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1103);
    float _1109 = 1.0 / _1095;
    float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1115 = fma(_1099, -0.3499999940395355224609375, 0.64999997615814208984375);
    float _1117 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1111);
    float _1119 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1117);
    float _1121 = -_1105;
    float _1123 = fma(_1121, _1109, 1.0);
    float _1125 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1127 = _1123 * _1115;
    float _1129 = fma(_1113, _1127, _823);
    float _1131 = fma(_1125, _1127, _821);
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1129 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1139 = _1131 + _1137;
    float _1141 = _1135 * _1135;
    float _1143 = fma(_1139, _1139, _1141);
    float _1145 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1147 = sqrt(_1143);
    float _1149 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1145);
    float _1151 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1155 = fma(_1153, _1127, _951);
    bool _1157 = _1147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = _1087;
    float _1161 = _1151;
    float _1163 = _1131;
    float _1165 = _1143;
    if (!_1157)
    {
        _1159 = _1131;
    }
    float _1167 = _1159;
    float _1169 = _1167;
    if (!_1157)
    {
        _1161 = _1129;
    }
    float _1171 = _1161;
    float _1173 = _1171;
    if (!_1157)
    {
        _1163 = _1155;
    }
    float _1175 = _1163;
    bool _1177 = !_1157;
    float _1179 = _1175;
    if (!_1177)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1185 = _1147 + _1183;
        float _1187 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = rsqrt(_1143);
        float _1191 = _1185 * _1181;
        float _1193 = _1191 * 0.15915493667125701904296875;
        float _1195 = _1193 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1193 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = _1197 + (-1.0);
        float _1205 = _1203 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = fma(_1201, _1187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1209 = fma(_1155, _1197, _1205);
        float _1211 = _1189 * _1207;
        float _1213 = fma(_1139, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1215 = fma(_1135, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1179 = _1209;
        _1169 = _1213;
        _1173 = _1215;
    }
    float _1217 = _1179;
    float _1219 = _1169;
    float _1221 = _1173;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1225 = _1217 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1229 = _1219 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1233 = _1221 + _1231;
    float _1235 = _1225 * _1225;
    float _1237 = fma(_1229, _1229, _1235);
    float _1239 = fma(_1233, _1233, _1237);
    float _1241 = rsqrt(_1239);
    float _1243 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1245 = _1229 * _1243;
    float _1247 = _1233 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 + _1251;
    float _1255 = sqrt(_1253);
    bool _1257 = _1255 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = _1255 + _1259;
    float _1263 = _1233;
    float _1265 = _1235;
    float _1267 = _1261;
    float _1269 = _1225;
    float _1271 = _1245;
    if (_1257)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1273;
    }
    float _1275 = _1263;
    if (_1257)
    {
        float _1277 = rsqrt(_1253);
        _1265 = _1277;
    }
    float _1279 = _1265;
    float _1281 = _1279;
    if (_1257)
    {
        float _1283 = _1261 * _1275;
        _1267 = _1283;
    }
    float _1285 = _1267;
    if (_1257)
    {
        float _1287 = _1285 * 0.15915493667125701904296875;
        _1165 = _1287;
    }
    float _1289 = _1165;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1293 = _1241;
    if (_1257)
    {
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1139;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1257)
    {
        float _1311 = _1289 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1243;
    float _1319 = -_1303;
    float _1321 = fma(_1225, _1317, _1319);
    if (_1257)
    {
        float _1323 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1239);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1257)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1329 = _1333;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    if (_1257)
    {
        float _1339 = _1315 + (-1.0);
        _1309 = _1339;
    }
    float _1341 = _1309;
    float _1343 = _1341;
    if (_1257)
    {
        float _1345 = _1279 * _1335;
        _1331 = _1345;
    }
    float _1347 = _1331;
    if (!_1257)
    {
        _1281 = _1321;
    }
    float _1349 = _1281;
    float _1351 = _1349;
    if (_1257)
    {
        float _1353 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1353;
    }
    float _1355 = _1269;
    float _1357 = _1355;
    if (_1257)
    {
        float _1359 = _1245 * _1347;
        _1271 = _1359;
    }
    float _1361 = _1271;
    if (!_1257)
    {
        _1337 = _1247;
    }
    float _1363 = _1337;
    float _1365 = _1363;
    if (_1257)
    {
        float _1367 = _1247 * _1347;
        _1365 = _1367;
    }
    float _1369 = _1365;
    if (!_1257)
    {
        _1343 = _1249;
    }
    float _1371 = _1343;
    float _1373 = _1371;
    if (_1257)
    {
        float _1375 = fma(_1321, _1315, _1355);
        _1351 = _1375;
    }
    float _1377 = _1351;
    if (_1257)
    {
        float _1379 = _1361 * _1361;
        _1373 = _1379;
    }
    float _1381 = _1373;
    if (!_1257)
    {
        _1357 = _1251;
    }
    float _1383 = _1357;
    float _1385 = _1383;
    if (_1257)
    {
        float _1387 = _1369 * _1369;
        _1385 = _1387;
    }
    float _1389 = _1385;
    float _1391 = fma(_1377, _1377, _1381);
    float _1393 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1395 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = _1391 + _1389;
    float _1399 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1393);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1409 = rsqrt(_1397);
    float _1411 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1399);
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1407);
    float _1421 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1423 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    float _1425 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1427 = abs(_1415);
    float _1429 = log2(_1427);
    float _1431 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1437 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1439 = -_1433;
    float _1441 = fma(_1439, _1291, 1.0);
    float _1443 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1423);
    float _1445 = _1435 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = _1409 * _1361;
    float _1451 = _1409 * _1377;
    float _1453 = _1409 * _1369;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1461 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1463 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1455);
    float _1465 = -_1457;
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1465);
    float _1469 = log2(_1441);
    float _1471 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1473 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1463);
    float _1475 = -_1453;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1467);
    float _1479 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1471);
    float _1483 = _1451 + 1.0;
    float _1485 = fma(_1477, -0.5, 0.5);
    float _1487 = 1.0 / _1473;
    float _1489 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1491 = fma(_1477, 0.5, 0.5);
    float _1493 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1481);
    float _1495 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1497 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = exp2(_1461);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1495);
    float _1503 = fma(_1491, _1497, -0.212114393711090087890625);
    float _1505 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1493);
    float _1507 = _1469 * 0.693147182464599609375;
    float _1509 = fma(_1491, _1503, 1.570728778839111328125);
    float _1511 = sqrt(_1485);
    float _1513 = _1501 * _1487;
    float _1515 = _1505 * _1487;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1519 = fma(_1513, 0.5, 0.5);
    float _1521 = fma(_1515, -0.5, 0.5);
    float _1523 = -_1451;
    float _1525 = fma(_1499, _1483, _1523);
    float3 _4006 = float3(_1519, _1521, _1517);
    float _1527 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).x;
    float3 _4017 = float3(_1519, _1521, _1517);
    float4 _1530 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4017, float3(0.0), isnan(_4017)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4017, float3(0.0), isnan(_4017)), level(0.0)).xyzw;
    float _1532 = _1530.x;
    float _1534 = _1530.y;
    float _1536 = _1530.z;
    float _1538 = _1530.w;
    float _1540 = fma(_1525, 0.5, 0.5);
    float _1542 = _1511 * 0.636619746685028076171875;
    float _1544 = -_1509;
    float _1546 = fma(_1542, _1544, 1.0);
    float2 _4044 = float2(_1546, _1540);
    float3 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4044, float2(0.0), isnan(_4044)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4044, float2(0.0), isnan(_4044)), level(0.0)).xyz;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = in.m_49.y;
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1562 = _133 > 0.5;
    float _1564 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1568 = _1566 != 0;
    out.m_56.x = _703;
    out.m_56.y = _705;
    out.m_56.z = _707;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1572 = _1570 != 0;
    float _1574 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1576 = -_701;
    int _1578 = _1562 ? as_type<int>(_1576) : as_type<int>(_701);
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1582 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1564);
    out.m_58.x = _821;
    out.m_58.y = _951;
    out.m_58.z = _823;
    bool _1584 = !_1568;
    float _1586 = _1584 ? _701 : as_type<float>(_1578);
    float _1588 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1582);
    float _1590 = exp2(_1574);
    float _1592 = _1586 + 0.5;
    float _1594 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1588);
    float _1596 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1598 = _1558 > 0.5;
    out.gl_Position.x = _1501;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _1594;
    out.gl_Position.w = _1473;
    float _1600 = _1596 * _1560;
    float _1602 = -_689;
    int _1604 = _1598 ? as_type<int>(_1602) : as_type<int>(_689);
    float _1606 = _1594 + _1473;
    float _1608 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1610 = !_1572;
    float _1612 = _1610 ? _689 : as_type<float>(_1604);
    float _1614 = _1606 * 0.5;
    float _1616 = -_1590;
    float _1618 = _1616 + 1.0;
    out.m_45.x = _1608;
    float _1620 = -_1612;
    float _1622 = _1620 + 0.5;
    float _1624 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.z = _1614;
    out.m_60.w = _1473;
    float _1626 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1628 = -_1624;
    float _1630 = _1628 + 1.0;
    float _1632 = _1626 * _1580;
    out.m_62.x = _1600;
    out.m_62.y = _1632;
    float _1634 = _1624 * _1527;
    float _1636 = _1538 * _1634;
    float _1638 = _1538 * _1630;
    float _1640 = _1556 * _1634;
    float _1642 = fma(_1552, _1636, _1532);
    float _1644 = fma(_1554, _1636, _1534);
    float _1646 = fma(_1538, _1640, _1536);
    out.m_64.x = _1642;
    out.m_64.y = _1644;
    out.m_64.z = _1646;
    out.m_64.w = _1638;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

