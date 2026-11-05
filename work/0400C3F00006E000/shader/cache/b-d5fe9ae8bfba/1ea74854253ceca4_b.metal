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
    float4 m_56 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1458 = as_type<float>(_99);
        out.gl_Position.z = _1458;
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
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1527 = as_type<float>(_135);
        out.gl_Position.z = _1527;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = _141 * _139;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _159 * 6.283185482025146484375;
    float _169 = floor(_159);
    float _171 = _167 * 0.15915493667125701904296875;
    float _173 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = 0.0;
    float _177 = _173;
    if (!_151)
    {
        float _179 = _173 * _173;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = _183;
    if (!_151)
    {
        float _191 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    float _195 = -_169;
    float _197 = _159 + _195;
    bool _199 = !_151;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _173 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _173);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_151;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _173 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _177 = _255;
    }
    float _257 = _177;
    float _259 = in.m_51.w;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _263 = _261 != 0;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _267 = _265 != 0;
    float _269 = fma(_187, 0.5, 0.5);
    bool _271 = _197 < 0.5;
    float _273 = float(_271);
    float _275 = in.m_42.x;
    float _277 = in.m_42.y;
    float _279 = in.m_42.z;
    bool _281 = !_263;
    int _283 = _281 ? 0 : 1;
    float _285 = -_197;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _289 = !_155;
    int _291 = _289 ? 0 : 1;
    float _293 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _295 = abs(_283);
    float _297 = -_273;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_269;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_257, _161, _293);
    int _307 = abs(_291);
    float _309 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_267;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_257, _163, _309);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _319 = abs(_313);
    float _321 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = float(_295);
    float _325 = float(_307);
    float _327 = fma(_257, _165, _321);
    float _329 = abs(_287);
    float _331 = _323 * _329;
    float _333 = fma(_305, _259, _275);
    float _335 = fma(_315, _259, _277);
    float _337 = float(_319);
    float _339 = fma(_325, _303, _331);
    float _341 = fma(_327, _259, _279);
    float _343 = abs(_299);
    float _345 = fma(_337, _343, _339);
    bool _347 = !_317;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_83);
        float _369 = 1.0 / _367;
        float _371 = _117 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _373 + _375;
    float _379 = as_type<float>(int(gl_VertexIndex));
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    bool _385 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _387 = isnan(_373);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _399 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_373);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = 1.0 / _383;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _413;
    float _417 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _419 = _377 * _411;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = in.m_51.x;
    float _427 = in.m_51.y;
    float _429 = -_395;
    float _431 = _429 + 1.0;
    float _433 = fma(_415, _419, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_423, _419, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _437 = as_type<int>(_379) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>(_379) & 2;
    bool _443 = _441 != 0;
    float _445 = _409 * _431;
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = _433 * _445;
    float _453 = _435 * _445;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _457 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _461 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _467 = -_457;
    float _469 = _467 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _471 = -_461;
    float _473 = _471 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _475 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].x, _463);
    float _477 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].y, _465);
    float _479 = _469 * _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _483 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _481;
    bool _485 = !_439;
    float _487 = _485 ? (-0.5) : 0.5;
    float _489 = fma(_473, _473, _479);
    float _491 = _477 * _427;
    float _493 = -_483;
    float _495 = _493 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _497 = _475 * _425;
    bool _499 = !_443;
    float _501 = _499 ? (-0.5) : 0.5;
    float _503 = _345 * _491;
    float _505 = fma(_495, _495, _489);
    float _507 = _345 * _497;
    float _509 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _501);
    float _513 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _515 = sqrt(_505);
    float _517 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _487);
    float _521 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = _513 * _511;
    float _525 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].x, _509);
    float _527 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
    float _529 = _521 * _519;
    float _531 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _533 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _535 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
    float _537 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
    float _539 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _541 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
    float _545 = _537 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _547 = fma(_515, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _549 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
    float _553 = _531 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _555 = _535 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].z, _549);
    float _559 = _551 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _561 = precise::max(_547, 0.3499999940395355224609375);
    float _563 = _553 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _567 = _545 + _559;
    float _569 = precise::min(_561, 1.0);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _563);
    float _573 = _555 + _565;
    float _575 = -_483;
    float _577 = _567 + _575;
    float _579 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _581 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _571);
    float _583 = -_461;
    float _585 = _573 + _583;
    float _587 = fma(_577, _569, _483);
    float _589 = _553 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = _581 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _593 = fma(_585, _569, _461);
    float _595 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _597 = _587 + _595;
    float _599 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _601 = 1.0 / _591;
    float _603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _605 = _593 + _603;
    float _607 = _597 * _597;
    float _609 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _599);
    float _611 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _579);
    float _613 = fma(_605, _605, _607);
    float _615 = _609 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _617 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _619 = sqrt(_613);
    float _621 = _615 + _591;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _625 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _627 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    float _635 = _621 * _601;
    float _637 = _635 * 0.5;
    float _639 = _553 + _623;
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _643 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[30].w, _641);
    float _645 = -_457;
    float _647 = _639 + _645;
    float _649 = 1.0 / _643;
    float _651 = fma(_647, _569, _457);
    bool _653 = _619 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _655 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _657 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _667 = _457;
    float _669 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _671 = _643;
    float _673 = _591;
    float _675 = _651;
    float _677 = _587;
    if (!_653)
    {
        _665 = _593;
    }
    float _679 = _665;
    float _681 = _679;
    if (!_653)
    {
        _667 = _587;
    }
    float _683 = _667;
    float _685 = _683;
    if (!_653)
    {
        _669 = _651;
    }
    float _687 = _669;
    bool _689 = !_653;
    float _691 = _687;
    if (!_689)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _695 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _697 = _619 + _695;
        float _699 = rsqrt(_613);
        float _701 = _697 * _693;
        float _703 = _651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = _701 * 0.15915493667125701904296875;
        float _707 = _705 * 6.283185482025146484375;
        float _709 = cos(_707);
        float _711 = _705 * 6.283185482025146484375;
        float _713 = sin(_711);
        float _715 = _709 + (-1.0);
        float _717 = fma(_713, _703, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = _715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _721 = _699 * _717;
        float _723 = fma(_651, _709, _719);
        float _725 = fma(_605, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _727 = fma(_597, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _681 = _725;
        _685 = _727;
        _691 = _723;
        _671 = _717;
    }
    float _729 = _681;
    float _731 = _685;
    float _733 = _691;
    float _735 = _671;
    float _737 = _735;
    float _739 = _733;
    float _741 = _729;
    float _743 = _731;
    if (_663)
    {
        _673 = 1.0;
    }
    float _745 = _673;
    float _747 = _745;
    if (!_633)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _751 = _553 + _749;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _755 = _555 + _753;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _759 = -_555;
        float _761 = _759 + _729;
        float _763 = _751 * _751;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _767 = _545 + _765;
        float _769 = -_545;
        float _771 = _769 + _731;
        float _773 = fma(_755, _755, _763);
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _777 = fma(_767, _767, _773);
        float _779 = sqrt(_777);
        float _781 = _757 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _783 = precise::min(_779, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _785 = _783 * _775;
        float _787 = _781 * _785;
        float _789 = -_553;
        float _791 = _789 + _733;
        float _793 = fma(_761, _787, _555);
        float _795 = fma(_791, _787, _553);
        float _797 = fma(_771, _787, _545);
        _737 = _791;
        _739 = _795;
        _741 = _793;
        _743 = _797;
    }
    float _799 = _737;
    float _801 = _739;
    float _803 = _741;
    float _805 = _743;
    float _807 = _799;
    if (_663)
    {
        _675 = 1.0;
    }
    float _809 = _675;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _813 = _649 * _811;
    float _815 = _809;
    if (!_663)
    {
        float _817 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _819 = _817 * 0.15915493667125701904296875;
        float _821 = _819 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _827 = _825 * 0.15915493667125701904296875;
        float _829 = _819 * 6.283185482025146484375;
        float _831 = sin(_829);
        float _833 = 1.0 / _823;
        float _835 = _827 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = _831 * _833;
        float _841 = _827 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _837 * _839;
        float _847 = 1.0 / _845;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _851 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _849;
        float _853 = 1.0 / _851;
        float _855 = _843 * _847;
        float _857 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _859 = fma(_813, _855, _857);
        float _861 = _859 * _853;
        float _863 = precise::clamp(_861, 0.0, 1.0);
        _807 = _827;
        _747 = _863;
    }
    float _865 = _807;
    float _867 = _747;
    float _869 = _865;
    if (!_663)
    {
        float _871 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _873 * 6.283185482025146484375;
        float _885 = sin(_883);
        float _887 = 1.0 / _877;
        float _889 = _881 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _885 * _887;
        float _895 = _881 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _891 * _893;
        float _901 = 1.0 / _899;
        float _903 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _905 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _903;
        float _907 = 1.0 / _905;
        float _909 = _897 * _901;
        float _911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _913 = fma(_813, _909, _911);
        float _915 = _913 * _907;
        float _917 = precise::clamp(_915, 0.0, 1.0);
        float _919 = -_917;
        float _921 = _919 + 1.0;
        _869 = _887;
        _815 = _921;
    }
    float _923 = _869;
    float _925 = _815;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _801 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _803 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _805 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _945 = fma(_937, _937, _941);
    float _947 = rsqrt(_945);
    float _949 = sqrt(_945);
    float _951 = _947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _953 = _933 * _951;
    float _955 = _937 * _951;
    float _957 = _953 * _953;
    float _959 = _955 * _955;
    float _961 = _957 + _959;
    float _963 = sqrt(_961);
    bool _965 = _963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _963 + _967;
    float _971 = _941;
    float _973 = _961;
    float _975 = _969;
    float _977 = _923;
    float _979 = _929;
    if (_965)
    {
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _971 = _981;
    }
    float _983 = _971;
    if (_965)
    {
        float _985 = rsqrt(_961);
        _973 = _985;
    }
    float _987 = _973;
    float _989 = _987;
    if (_965)
    {
        float _991 = _969 * _983;
        _975 = _991;
    }
    float _993 = _975;
    if (_965)
    {
        float _995 = _993 * 0.15915493667125701904296875;
        _977 = _995;
    }
    float _997 = _977;
    float _999 = _937;
    float _1001 = _997;
    if (_965)
    {
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _983;
    float _1015 = _1011;
    if (_965)
    {
        float _1017 = _997 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        _1013 = _1019;
    }
    float _1021 = _1013;
    float _1023 = -_951;
    float _1025 = -_1011;
    float _1027 = fma(_929, _1023, _1025);
    if (_965)
    {
        float _1029 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1029;
    }
    float _1031 = _979;
    float _1033 = _1031;
    float _1035 = _1007;
    if (_965)
    {
        float _1037 = fma(_1007, _1031, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = _1039;
    if (!_965)
    {
        _1035 = _953;
    }
    float _1043 = _1035;
    float _1045 = _1043;
    float _1047 = _1021;
    if (_965)
    {
        float _1049 = _1021 + (-1.0);
        _1015 = _1049;
    }
    float _1051 = _1015;
    float _1053 = _1051;
    if (_965)
    {
        float _1055 = _987 * _1039;
        _677 = _1055;
    }
    float _1057 = _677;
    if (!_965)
    {
        _1041 = _1027;
    }
    float _1059 = _1041;
    float _1061 = _1059;
    if (_965)
    {
        float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1063;
    }
    float _1065 = _1001;
    if (_965)
    {
        float _1067 = _953 * _1057;
        _1045 = _1067;
    }
    float _1069 = _1045;
    if (!_965)
    {
        _1053 = _955;
    }
    float _1071 = _1053;
    float _1073 = _1071;
    if (_965)
    {
        float _1075 = _955 * _1057;
        _1073 = _1075;
    }
    float _1077 = _1073;
    if (!_965)
    {
        _989 = _957;
    }
    float _1079 = _989;
    float _1081 = _1079;
    if (_965)
    {
        float _1083 = fma(_1027, _1021, _1065);
        _1061 = _1083;
    }
    float _1085 = _1061;
    if (_965)
    {
        float _1087 = _1069 * _1069;
        _1081 = _1087;
    }
    float _1089 = _1081;
    if (!_965)
    {
        _1047 = _959;
    }
    float _1091 = _1047;
    float _1093 = _1091;
    if (_965)
    {
        float _1095 = _1077 * _1077;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = fma(_1085, _1085, _1089);
    float _1101 = _801 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1103 = _1099 + _1097;
    float _1105 = _801 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1109 = fma(_949, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1107);
    float _1111 = precise::clamp(_1109, 0.0, 1.0);
    float _1113 = _801 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1115 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1101);
    float _1117 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1119 = rsqrt(_1103);
    float _1121 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1113);
    float _1123 = -_1111;
    float _1125 = _1123 + 1.0;
    float _1127 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1117);
    float _1129 = _801 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1121);
    float _1133 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1115);
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1137 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1139 = abs(_1125);
    float _1141 = log2(_1139);
    float _1143 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1147 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1137);
    float _1149 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1151 = -_1145;
    float _1153 = fma(_1151, _943, 1.0);
    float _1155 = _1119 * _1069;
    float _1157 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1159 = _1119 * _1085;
    float _1161 = _1119 * _1077;
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1149);
    float _1167 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1169 = log2(_1153);
    float _1171 = -_1163;
    float _1173 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1171);
    float _1175 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1177 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1179 = -_1161;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1175);
    float _1185 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1187 = exp2(_1177);
    float _1189 = fma(_1181, -0.5, 0.5);
    float _1191 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1185);
    float _1195 = fma(_1181, 0.5, 0.5);
    float _1197 = _1159 + 1.0;
    float _1199 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1201 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1203 = 1.0 / _1183;
    float _1205 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1207 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1199);
    float _1209 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1211 = fma(_1195, _1205, -0.212114393711090087890625);
    float _1213 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1215 = sqrt(_1189);
    float _1217 = -_1159;
    float _1219 = fma(_1187, _1197, _1217);
    float _1221 = _1169 * 0.693147182464599609375;
    float _1223 = fma(_1195, _1211, 1.570728778839111328125);
    float _1225 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1227 = _1209 * _1203;
    float _1229 = _1213 * _1203;
    float _1231 = fma(_1219, 0.5, 0.5);
    float _1233 = fma(_1227, 0.5, 0.5);
    float _1235 = fma(_1229, -0.5, 0.5);
    float _1237 = _1215 * 0.636619746685028076171875;
    float3 _3247 = float3(_1233, _1235, _1225);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).x;
    float _1241 = -_1223;
    float _1243 = fma(_1237, _1241, 1.0);
    float3 _3263 = float3(_1233, _1235, _1225);
    float4 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3263, float3(0.0), isnan(_3263)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3263, float3(0.0), isnan(_3263)), level(0.0)).xyzw;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1246.w;
    float2 _3280 = float2(_1243, _1231);
    float3 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3280, float2(0.0), isnan(_3280)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3280, float2(0.0), isnan(_3280)), level(0.0)).xyz;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1268 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1270 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1272 = _1266 * _137;
    float _1274 = exp2(_1268);
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1282 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1270);
    float _1284 = -_501;
    float _1286 = _1284 + 0.5;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = trunc(_1272);
    int _1292 = int(_1290);
    float _1294 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1282);
    bool _1302 = _867 > 0.0;
    bool _1304 = isnan(_867);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = _487 + 0.5;
    float _1314 = -_1274;
    float _1316 = _1314 + 1.0;
    out.m_56.x = _1294;
    out.m_56.y = _1296;
    out.m_56.z = _1298;
    out.m_56.w = _1288;
    bool _1318 = _925 <= 0.0;
    bool _1320 = !_1310;
    bool _1322 = _1318 || _1320;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _1312;
    out.m_58.y = _1286;
    int _1328 = _1292 << 4;
    int _1330 = _1328 + 1968;
    float _1332 = _867 * _925;
    uint _1335 = uint(int(uint(_1330) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[int(_1345)][_1347];
    float _1351 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1353 = _1351 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _1355 = _1330 + 8;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    out.m_45.x = _1353;
    float _1365 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1300);
    float _1367 = _1365 + _1183;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1365;
    out.gl_Position.w = _1183;
    float _1369 = _1367 * 0.5;
    out.m_60.z = _1369;
    out.m_60.w = _1183;
    float _1371 = _1341 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1373 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1375 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1381 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1375;
    out.m_62.y = _1377;
    out.m_62.z = _1381;
    out.m_62.w = _1326;
    float _1383 = _1324 * _1239;
    float _1385 = -_1324;
    float _1387 = _1385 + 1.0;
    float _1389 = _1254 * _1383;
    float _1391 = _1254 * _1387;
    float _1393 = _1264 * _1383;
    float _1395 = fma(_1260, _1389, _1248);
    float _1397 = fma(_1262, _1389, _1250);
    float _1399 = fma(_1254, _1393, _1252);
    out.m_64.x = _1395;
    out.m_64.y = _1397;
    out.m_64.z = _1399;
    out.m_64.w = _1391;
    if (!_1322)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1401;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1458 = as_type<float>(_99);
        out.gl_Position.z = _1458;
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
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1527 = as_type<float>(_135);
        out.gl_Position.z = _1527;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = _141 * _139;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _159 * 6.283185482025146484375;
    float _169 = floor(_159);
    float _171 = _167 * 0.15915493667125701904296875;
    float _173 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = 0.0;
    float _177 = _173;
    if (!_151)
    {
        float _179 = _173 * _173;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = _183;
    if (!_151)
    {
        float _191 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    float _195 = -_169;
    float _197 = _159 + _195;
    bool _199 = !_151;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _173 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _173);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_151;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _173 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _177 = _255;
    }
    float _257 = _177;
    float _259 = in.m_51.w;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _263 = _261 != 0;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _267 = _265 != 0;
    float _269 = fma(_187, 0.5, 0.5);
    bool _271 = _197 < 0.5;
    float _273 = float(_271);
    float _275 = in.m_42.x;
    float _277 = in.m_42.y;
    float _279 = in.m_42.z;
    bool _281 = !_263;
    int _283 = _281 ? 0 : 1;
    float _285 = -_197;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _289 = !_155;
    int _291 = _289 ? 0 : 1;
    float _293 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _295 = abs(_283);
    float _297 = -_273;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_269;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_257, _161, _293);
    int _307 = abs(_291);
    float _309 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_267;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_257, _163, _309);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _319 = abs(_313);
    float _321 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = float(_295);
    float _325 = float(_307);
    float _327 = fma(_257, _165, _321);
    float _329 = abs(_287);
    float _331 = _323 * _329;
    float _333 = fma(_305, _259, _275);
    float _335 = fma(_315, _259, _277);
    float _337 = float(_319);
    float _339 = fma(_325, _303, _331);
    float _341 = fma(_327, _259, _279);
    float _343 = abs(_299);
    float _345 = fma(_337, _343, _339);
    bool _347 = !_317;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_83);
        float _369 = 1.0 / _367;
        float _371 = _117 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _373 + _375;
    float _379 = as_type<float>(int(gl_VertexIndex));
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    bool _385 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _387 = isnan(_373);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _399 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_373);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = 1.0 / _383;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _413;
    float _417 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _419 = _377 * _411;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = in.m_51.x;
    float _427 = in.m_51.y;
    float _429 = -_395;
    float _431 = _429 + 1.0;
    float _433 = fma(_415, _419, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_423, _419, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _437 = as_type<int>(_379) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>(_379) & 2;
    bool _443 = _441 != 0;
    float _445 = _409 * _431;
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = _433 * _445;
    float _453 = _435 * _445;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _457 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _461 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _467 = -_457;
    float _469 = _467 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _471 = -_461;
    float _473 = _471 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _475 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].x, _463);
    float _477 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].y, _465);
    float _479 = _469 * _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _483 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _481;
    bool _485 = !_439;
    float _487 = _485 ? (-0.5) : 0.5;
    float _489 = fma(_473, _473, _479);
    float _491 = _477 * _427;
    float _493 = -_483;
    float _495 = _493 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _497 = _475 * _425;
    bool _499 = !_443;
    float _501 = _499 ? (-0.5) : 0.5;
    float _503 = _345 * _491;
    float _505 = fma(_495, _495, _489);
    float _507 = _345 * _497;
    float _509 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _501);
    float _513 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _515 = sqrt(_505);
    float _517 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _487);
    float _521 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = _513 * _511;
    float _525 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].x, _509);
    float _527 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
    float _529 = _521 * _519;
    float _531 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _533 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _535 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
    float _537 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
    float _539 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _541 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
    float _545 = _537 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _547 = fma(_515, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _549 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
    float _553 = _531 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _555 = _535 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].z, _549);
    float _559 = _551 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _561 = precise::max(_547, 0.3499999940395355224609375);
    float _563 = _553 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _567 = _545 + _559;
    float _569 = precise::min(_561, 1.0);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _563);
    float _573 = _555 + _565;
    float _575 = -_483;
    float _577 = _567 + _575;
    float _579 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _581 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _571);
    float _583 = -_461;
    float _585 = _573 + _583;
    float _587 = fma(_577, _569, _483);
    float _589 = _553 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = _581 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _593 = fma(_585, _569, _461);
    float _595 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _597 = _587 + _595;
    float _599 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _601 = 1.0 / _591;
    float _603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _605 = _593 + _603;
    float _607 = _597 * _597;
    float _609 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _599);
    float _611 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _579);
    float _613 = fma(_605, _605, _607);
    float _615 = _609 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _617 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _619 = sqrt(_613);
    float _621 = _615 + _591;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _625 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _627 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    float _635 = _621 * _601;
    float _637 = _635 * 0.5;
    float _639 = _553 + _623;
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _643 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[30].w, _641);
    float _645 = -_457;
    float _647 = _639 + _645;
    float _649 = 1.0 / _643;
    float _651 = fma(_647, _569, _457);
    bool _653 = _619 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _655 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _657 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _667 = _457;
    float _669 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _671 = _643;
    float _673 = _591;
    float _675 = _651;
    float _677 = _587;
    if (!_653)
    {
        _665 = _593;
    }
    float _679 = _665;
    float _681 = _679;
    if (!_653)
    {
        _667 = _587;
    }
    float _683 = _667;
    float _685 = _683;
    if (!_653)
    {
        _669 = _651;
    }
    float _687 = _669;
    bool _689 = !_653;
    float _691 = _687;
    if (!_689)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _695 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _697 = _619 + _695;
        float _699 = rsqrt(_613);
        float _701 = _697 * _693;
        float _703 = _651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = _701 * 0.15915493667125701904296875;
        float _707 = _705 * 6.283185482025146484375;
        float _709 = cos(_707);
        float _711 = _705 * 6.283185482025146484375;
        float _713 = sin(_711);
        float _715 = _709 + (-1.0);
        float _717 = fma(_713, _703, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = _715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _721 = _699 * _717;
        float _723 = fma(_651, _709, _719);
        float _725 = fma(_605, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _727 = fma(_597, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _681 = _725;
        _685 = _727;
        _691 = _723;
        _671 = _717;
    }
    float _729 = _681;
    float _731 = _685;
    float _733 = _691;
    float _735 = _671;
    float _737 = _735;
    float _739 = _733;
    float _741 = _729;
    float _743 = _731;
    if (_663)
    {
        _673 = 1.0;
    }
    float _745 = _673;
    float _747 = _745;
    if (!_633)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _751 = _553 + _749;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _755 = _555 + _753;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _759 = -_555;
        float _761 = _759 + _729;
        float _763 = _751 * _751;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _767 = _545 + _765;
        float _769 = -_545;
        float _771 = _769 + _731;
        float _773 = fma(_755, _755, _763);
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _777 = fma(_767, _767, _773);
        float _779 = sqrt(_777);
        float _781 = _757 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _783 = precise::min(_779, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _785 = _783 * _775;
        float _787 = _781 * _785;
        float _789 = -_553;
        float _791 = _789 + _733;
        float _793 = fma(_761, _787, _555);
        float _795 = fma(_791, _787, _553);
        float _797 = fma(_771, _787, _545);
        _737 = _791;
        _739 = _795;
        _741 = _793;
        _743 = _797;
    }
    float _799 = _737;
    float _801 = _739;
    float _803 = _741;
    float _805 = _743;
    float _807 = _799;
    if (_663)
    {
        _675 = 1.0;
    }
    float _809 = _675;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _813 = _649 * _811;
    float _815 = _809;
    if (!_663)
    {
        float _817 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _819 = _817 * 0.15915493667125701904296875;
        float _821 = _819 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _827 = _825 * 0.15915493667125701904296875;
        float _829 = _819 * 6.283185482025146484375;
        float _831 = sin(_829);
        float _833 = 1.0 / _823;
        float _835 = _827 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = _831 * _833;
        float _841 = _827 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _837 * _839;
        float _847 = 1.0 / _845;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _851 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _849;
        float _853 = 1.0 / _851;
        float _855 = _843 * _847;
        float _857 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _859 = fma(_813, _855, _857);
        float _861 = _859 * _853;
        float _863 = precise::clamp(_861, 0.0, 1.0);
        _807 = _827;
        _747 = _863;
    }
    float _865 = _807;
    float _867 = _747;
    float _869 = _865;
    if (!_663)
    {
        float _871 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _873 * 6.283185482025146484375;
        float _885 = sin(_883);
        float _887 = 1.0 / _877;
        float _889 = _881 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _885 * _887;
        float _895 = _881 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _891 * _893;
        float _901 = 1.0 / _899;
        float _903 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _905 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _903;
        float _907 = 1.0 / _905;
        float _909 = _897 * _901;
        float _911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _913 = fma(_813, _909, _911);
        float _915 = _913 * _907;
        float _917 = precise::clamp(_915, 0.0, 1.0);
        float _919 = -_917;
        float _921 = _919 + 1.0;
        _869 = _887;
        _815 = _921;
    }
    float _923 = _869;
    float _925 = _815;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _801 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _803 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _805 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _945 = fma(_937, _937, _941);
    float _947 = rsqrt(_945);
    float _949 = sqrt(_945);
    float _951 = _947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _953 = _933 * _951;
    float _955 = _937 * _951;
    float _957 = _953 * _953;
    float _959 = _955 * _955;
    float _961 = _957 + _959;
    float _963 = sqrt(_961);
    bool _965 = _963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _963 + _967;
    float _971 = _941;
    float _973 = _961;
    float _975 = _969;
    float _977 = _923;
    float _979 = _929;
    if (_965)
    {
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _971 = _981;
    }
    float _983 = _971;
    if (_965)
    {
        float _985 = rsqrt(_961);
        _973 = _985;
    }
    float _987 = _973;
    float _989 = _987;
    if (_965)
    {
        float _991 = _969 * _983;
        _975 = _991;
    }
    float _993 = _975;
    if (_965)
    {
        float _995 = _993 * 0.15915493667125701904296875;
        _977 = _995;
    }
    float _997 = _977;
    float _999 = _937;
    float _1001 = _997;
    if (_965)
    {
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _983;
    float _1015 = _1011;
    if (_965)
    {
        float _1017 = _997 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        _1013 = _1019;
    }
    float _1021 = _1013;
    float _1023 = -_951;
    float _1025 = -_1011;
    float _1027 = fma(_929, _1023, _1025);
    if (_965)
    {
        float _1029 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1029;
    }
    float _1031 = _979;
    float _1033 = _1031;
    float _1035 = _1007;
    if (_965)
    {
        float _1037 = fma(_1007, _1031, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = _1039;
    if (!_965)
    {
        _1035 = _953;
    }
    float _1043 = _1035;
    float _1045 = _1043;
    float _1047 = _1021;
    if (_965)
    {
        float _1049 = _1021 + (-1.0);
        _1015 = _1049;
    }
    float _1051 = _1015;
    float _1053 = _1051;
    if (_965)
    {
        float _1055 = _987 * _1039;
        _677 = _1055;
    }
    float _1057 = _677;
    if (!_965)
    {
        _1041 = _1027;
    }
    float _1059 = _1041;
    float _1061 = _1059;
    if (_965)
    {
        float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1063;
    }
    float _1065 = _1001;
    if (_965)
    {
        float _1067 = _953 * _1057;
        _1045 = _1067;
    }
    float _1069 = _1045;
    if (!_965)
    {
        _1053 = _955;
    }
    float _1071 = _1053;
    float _1073 = _1071;
    if (_965)
    {
        float _1075 = _955 * _1057;
        _1073 = _1075;
    }
    float _1077 = _1073;
    if (!_965)
    {
        _989 = _957;
    }
    float _1079 = _989;
    float _1081 = _1079;
    if (_965)
    {
        float _1083 = fma(_1027, _1021, _1065);
        _1061 = _1083;
    }
    float _1085 = _1061;
    if (_965)
    {
        float _1087 = _1069 * _1069;
        _1081 = _1087;
    }
    float _1089 = _1081;
    if (!_965)
    {
        _1047 = _959;
    }
    float _1091 = _1047;
    float _1093 = _1091;
    if (_965)
    {
        float _1095 = _1077 * _1077;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = fma(_1085, _1085, _1089);
    float _1101 = _801 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1103 = _1099 + _1097;
    float _1105 = _801 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1109 = fma(_949, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1107);
    float _1111 = precise::clamp(_1109, 0.0, 1.0);
    float _1113 = _801 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1115 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1101);
    float _1117 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1119 = rsqrt(_1103);
    float _1121 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1113);
    float _1123 = -_1111;
    float _1125 = _1123 + 1.0;
    float _1127 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1117);
    float _1129 = _801 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1121);
    float _1133 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1115);
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1137 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1139 = abs(_1125);
    float _1141 = log2(_1139);
    float _1143 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1147 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1137);
    float _1149 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1151 = -_1145;
    float _1153 = fma(_1151, _943, 1.0);
    float _1155 = _1119 * _1069;
    float _1157 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1159 = _1119 * _1085;
    float _1161 = _1119 * _1077;
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1149);
    float _1167 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1169 = log2(_1153);
    float _1171 = -_1163;
    float _1173 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1171);
    float _1175 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1177 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1179 = -_1161;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1175);
    float _1185 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1187 = exp2(_1177);
    float _1189 = fma(_1181, -0.5, 0.5);
    float _1191 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1185);
    float _1195 = fma(_1181, 0.5, 0.5);
    float _1197 = _1159 + 1.0;
    float _1199 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1201 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1203 = 1.0 / _1183;
    float _1205 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1207 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1199);
    float _1209 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1211 = fma(_1195, _1205, -0.212114393711090087890625);
    float _1213 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1215 = sqrt(_1189);
    float _1217 = -_1159;
    float _1219 = fma(_1187, _1197, _1217);
    float _1221 = _1169 * 0.693147182464599609375;
    float _1223 = fma(_1195, _1211, 1.570728778839111328125);
    float _1225 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1227 = _1209 * _1203;
    float _1229 = _1213 * _1203;
    float _1231 = fma(_1219, 0.5, 0.5);
    float _1233 = fma(_1227, 0.5, 0.5);
    float _1235 = fma(_1229, -0.5, 0.5);
    float _1237 = _1215 * 0.636619746685028076171875;
    float3 _3247 = float3(_1233, _1235, _1225);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).x;
    float _1241 = -_1223;
    float _1243 = fma(_1237, _1241, 1.0);
    float3 _3263 = float3(_1233, _1235, _1225);
    float4 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3263, float3(0.0), isnan(_3263)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3263, float3(0.0), isnan(_3263)), level(0.0)).xyzw;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1246.w;
    float2 _3280 = float2(_1243, _1231);
    float3 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3280, float2(0.0), isnan(_3280)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3280, float2(0.0), isnan(_3280)), level(0.0)).xyz;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1268 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1270 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1272 = _1266 * _137;
    float _1274 = exp2(_1268);
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1282 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1270);
    float _1284 = -_501;
    float _1286 = _1284 + 0.5;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = trunc(_1272);
    int _1292 = int(_1290);
    float _1294 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1282);
    bool _1302 = _867 > 0.0;
    bool _1304 = isnan(_867);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = _487 + 0.5;
    float _1314 = -_1274;
    float _1316 = _1314 + 1.0;
    out.m_56.x = _1294;
    out.m_56.y = _1296;
    out.m_56.z = _1298;
    out.m_56.w = _1288;
    bool _1318 = _925 <= 0.0;
    bool _1320 = !_1310;
    bool _1322 = _1318 || _1320;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _1312;
    out.m_58.y = _1286;
    int _1328 = _1292 << 4;
    int _1330 = _1328 + 1968;
    float _1332 = _867 * _925;
    uint _1335 = uint(int(uint(_1330) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[int(_1345)][_1347];
    float _1351 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1353 = _1351 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _1355 = _1330 + 8;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    out.m_45.x = _1353;
    float _1365 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1300);
    float _1367 = _1365 + _1183;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1365;
    out.gl_Position.w = _1183;
    float _1369 = _1367 * 0.5;
    out.m_60.z = _1369;
    out.m_60.w = _1183;
    float _1371 = _1341 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1373 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1375 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1381 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1375;
    out.m_62.y = _1377;
    out.m_62.z = _1381;
    out.m_62.w = _1326;
    float _1383 = _1324 * _1239;
    float _1385 = -_1324;
    float _1387 = _1385 + 1.0;
    float _1389 = _1254 * _1383;
    float _1391 = _1254 * _1387;
    float _1393 = _1264 * _1383;
    float _1395 = fma(_1260, _1389, _1248);
    float _1397 = fma(_1262, _1389, _1250);
    float _1399 = fma(_1254, _1393, _1252);
    out.m_64.x = _1395;
    out.m_64.y = _1397;
    out.m_64.z = _1399;
    out.m_64.w = _1391;
    if (!_1322)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1401;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1458 = as_type<float>(_99);
        out.gl_Position.z = _1458;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1527 = as_type<float>(_135);
        out.gl_Position.z = _1527;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = _141 * _139;
    float _159 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _159 * 6.283185482025146484375;
    float _169 = floor(_159);
    float _171 = _167 * 0.15915493667125701904296875;
    float _173 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = 0.0;
    float _177 = _173;
    if (!_151)
    {
        float _179 = _173 * _173;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = _183;
    if (!_151)
    {
        float _191 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    float _195 = -_169;
    float _197 = _159 + _195;
    bool _199 = !_151;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _173 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _173);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_151;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _173 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _177 = _255;
    }
    float _257 = _177;
    float _259 = in.m_51.w;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _263 = _261 != 0;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _267 = _265 != 0;
    float _269 = fma(_187, 0.5, 0.5);
    bool _271 = _197 < 0.5;
    float _273 = float(_271);
    float _275 = in.m_42.x;
    float _277 = in.m_42.y;
    float _279 = in.m_42.z;
    bool _281 = !_263;
    int _283 = _281 ? 0 : 1;
    float _285 = -_197;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _289 = !_155;
    int _291 = _289 ? 0 : 1;
    float _293 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _295 = abs(_283);
    float _297 = -_273;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_269;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_257, _161, _293);
    int _307 = abs(_291);
    float _309 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_267;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_257, _163, _309);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _319 = abs(_313);
    float _321 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = float(_295);
    float _325 = float(_307);
    float _327 = fma(_257, _165, _321);
    float _329 = abs(_287);
    float _331 = _323 * _329;
    float _333 = fma(_305, _259, _275);
    float _335 = fma(_315, _259, _277);
    float _337 = float(_319);
    float _339 = fma(_325, _303, _331);
    float _341 = fma(_327, _259, _279);
    float _343 = abs(_299);
    float _345 = fma(_337, _343, _339);
    bool _347 = !_317;
    float _363;
    if (!_347)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_83);
        float _369 = 1.0 / _367;
        float _371 = _117 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _373 + _375;
    float _379 = as_type<float>(int(gl_VertexIndex));
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    bool _385 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _387 = isnan(_373);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _399 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_373);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = 1.0 / _383;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _413;
    float _417 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _419 = _377 * _411;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = in.m_51.x;
    float _427 = in.m_51.y;
    float _429 = -_395;
    float _431 = _429 + 1.0;
    float _433 = fma(_415, _419, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_423, _419, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _437 = as_type<int>(_379) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>(_379) & 2;
    bool _443 = _441 != 0;
    float _445 = _409 * _431;
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = _433 * _445;
    float _453 = _435 * _445;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _457 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _461 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _467 = -_457;
    float _469 = _467 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _471 = -_461;
    float _473 = _471 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _475 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].x, _463);
    float _477 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[144].y, _465);
    float _479 = _469 * _469;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _483 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _481;
    bool _485 = !_439;
    float _487 = _485 ? (-0.5) : 0.5;
    float _489 = fma(_473, _473, _479);
    float _491 = _477 * _427;
    float _493 = -_483;
    float _495 = _493 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _497 = _475 * _425;
    bool _499 = !_443;
    float _501 = _499 ? (-0.5) : 0.5;
    float _503 = _345 * _491;
    float _505 = fma(_495, _495, _489);
    float _507 = _345 * _497;
    float _509 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _511 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _501);
    float _513 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _515 = sqrt(_505);
    float _517 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _487);
    float _521 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = _513 * _511;
    float _525 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].x, _509);
    float _527 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
    float _529 = _521 * _519;
    float _531 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _533 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _535 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
    float _537 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
    float _539 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _541 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
    float _545 = _537 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _547 = fma(_515, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _549 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
    float _553 = _531 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _555 = _535 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _557 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].z, _549);
    float _559 = _551 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _561 = precise::max(_547, 0.3499999940395355224609375);
    float _563 = _553 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _565 = _557 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _567 = _545 + _559;
    float _569 = precise::min(_561, 1.0);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[11].x, _563);
    float _573 = _555 + _565;
    float _575 = -_483;
    float _577 = _567 + _575;
    float _579 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _581 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[11].z, _571);
    float _583 = -_461;
    float _585 = _573 + _583;
    float _587 = fma(_577, _569, _483);
    float _589 = _553 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = _581 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _593 = fma(_585, _569, _461);
    float _595 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _597 = _587 + _595;
    float _599 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    float _601 = 1.0 / _591;
    float _603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _605 = _593 + _603;
    float _607 = _597 * _597;
    float _609 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[10].z, _599);
    float _611 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _579);
    float _613 = fma(_605, _605, _607);
    float _615 = _609 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _617 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _619 = sqrt(_613);
    float _621 = _615 + _591;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _625 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _627 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    float _635 = _621 * _601;
    float _637 = _635 * 0.5;
    float _639 = _553 + _623;
    float _641 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _643 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[30].w, _641);
    float _645 = -_457;
    float _647 = _639 + _645;
    float _649 = 1.0 / _643;
    float _651 = fma(_647, _569, _457);
    bool _653 = _619 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _655 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _657 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _659 = _655 || _657;
    bool _661 = isnan(0.5);
    bool _663 = _659 || _661;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _667 = _457;
    float _669 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _671 = _643;
    float _673 = _591;
    float _675 = _651;
    float _677 = _587;
    if (!_653)
    {
        _665 = _593;
    }
    float _679 = _665;
    float _681 = _679;
    if (!_653)
    {
        _667 = _587;
    }
    float _683 = _667;
    float _685 = _683;
    if (!_653)
    {
        _669 = _651;
    }
    float _687 = _669;
    bool _689 = !_653;
    float _691 = _687;
    if (!_689)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _695 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _697 = _619 + _695;
        float _699 = rsqrt(_613);
        float _701 = _697 * _693;
        float _703 = _651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = _701 * 0.15915493667125701904296875;
        float _707 = _705 * 6.283185482025146484375;
        float _709 = cos(_707);
        float _711 = _705 * 6.283185482025146484375;
        float _713 = sin(_711);
        float _715 = _709 + (-1.0);
        float _717 = fma(_713, _703, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = _715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _721 = _699 * _717;
        float _723 = fma(_651, _709, _719);
        float _725 = fma(_605, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _727 = fma(_597, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _681 = _725;
        _685 = _727;
        _691 = _723;
        _671 = _717;
    }
    float _729 = _681;
    float _731 = _685;
    float _733 = _691;
    float _735 = _671;
    float _737 = _735;
    float _739 = _733;
    float _741 = _729;
    float _743 = _731;
    if (_663)
    {
        _673 = 1.0;
    }
    float _745 = _673;
    float _747 = _745;
    if (!_633)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _751 = _553 + _749;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _755 = _555 + _753;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _759 = -_555;
        float _761 = _759 + _729;
        float _763 = _751 * _751;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _767 = _545 + _765;
        float _769 = -_545;
        float _771 = _769 + _731;
        float _773 = fma(_755, _755, _763);
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _777 = fma(_767, _767, _773);
        float _779 = sqrt(_777);
        float _781 = _757 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _783 = precise::min(_779, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _785 = _783 * _775;
        float _787 = _781 * _785;
        float _789 = -_553;
        float _791 = _789 + _733;
        float _793 = fma(_761, _787, _555);
        float _795 = fma(_791, _787, _553);
        float _797 = fma(_771, _787, _545);
        _737 = _791;
        _739 = _795;
        _741 = _793;
        _743 = _797;
    }
    float _799 = _737;
    float _801 = _739;
    float _803 = _741;
    float _805 = _743;
    float _807 = _799;
    if (_663)
    {
        _675 = 1.0;
    }
    float _809 = _675;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _813 = _649 * _811;
    float _815 = _809;
    if (!_663)
    {
        float _817 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _819 = _817 * 0.15915493667125701904296875;
        float _821 = _819 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _827 = _825 * 0.15915493667125701904296875;
        float _829 = _819 * 6.283185482025146484375;
        float _831 = sin(_829);
        float _833 = 1.0 / _823;
        float _835 = _827 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = _831 * _833;
        float _841 = _827 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _837 * _839;
        float _847 = 1.0 / _845;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _851 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _849;
        float _853 = 1.0 / _851;
        float _855 = _843 * _847;
        float _857 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _859 = fma(_813, _855, _857);
        float _861 = _859 * _853;
        float _863 = precise::clamp(_861, 0.0, 1.0);
        _807 = _827;
        _747 = _863;
    }
    float _865 = _807;
    float _867 = _747;
    float _869 = _865;
    if (!_663)
    {
        float _871 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _873 * 6.283185482025146484375;
        float _885 = sin(_883);
        float _887 = 1.0 / _877;
        float _889 = _881 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _885 * _887;
        float _895 = _881 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _891 * _893;
        float _901 = 1.0 / _899;
        float _903 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _905 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _903;
        float _907 = 1.0 / _905;
        float _909 = _897 * _901;
        float _911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _913 = fma(_813, _909, _911);
        float _915 = _913 * _907;
        float _917 = precise::clamp(_915, 0.0, 1.0);
        float _919 = -_917;
        float _921 = _919 + 1.0;
        _869 = _887;
        _815 = _921;
    }
    float _923 = _869;
    float _925 = _815;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _801 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _803 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _805 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _945 = fma(_937, _937, _941);
    float _947 = rsqrt(_945);
    float _949 = sqrt(_945);
    float _951 = _947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _953 = _933 * _951;
    float _955 = _937 * _951;
    float _957 = _953 * _953;
    float _959 = _955 * _955;
    float _961 = _957 + _959;
    float _963 = sqrt(_961);
    bool _965 = _963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _963 + _967;
    float _971 = _941;
    float _973 = _961;
    float _975 = _969;
    float _977 = _923;
    float _979 = _929;
    if (_965)
    {
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _971 = _981;
    }
    float _983 = _971;
    if (_965)
    {
        float _985 = rsqrt(_961);
        _973 = _985;
    }
    float _987 = _973;
    float _989 = _987;
    if (_965)
    {
        float _991 = _969 * _983;
        _975 = _991;
    }
    float _993 = _975;
    if (_965)
    {
        float _995 = _993 * 0.15915493667125701904296875;
        _977 = _995;
    }
    float _997 = _977;
    float _999 = _937;
    float _1001 = _997;
    if (_965)
    {
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _983;
    float _1015 = _1011;
    if (_965)
    {
        float _1017 = _997 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        _1013 = _1019;
    }
    float _1021 = _1013;
    float _1023 = -_951;
    float _1025 = -_1011;
    float _1027 = fma(_929, _1023, _1025);
    if (_965)
    {
        float _1029 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1029;
    }
    float _1031 = _979;
    float _1033 = _1031;
    float _1035 = _1007;
    if (_965)
    {
        float _1037 = fma(_1007, _1031, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = _1039;
    if (!_965)
    {
        _1035 = _953;
    }
    float _1043 = _1035;
    float _1045 = _1043;
    float _1047 = _1021;
    if (_965)
    {
        float _1049 = _1021 + (-1.0);
        _1015 = _1049;
    }
    float _1051 = _1015;
    float _1053 = _1051;
    if (_965)
    {
        float _1055 = _987 * _1039;
        _677 = _1055;
    }
    float _1057 = _677;
    if (!_965)
    {
        _1041 = _1027;
    }
    float _1059 = _1041;
    float _1061 = _1059;
    if (_965)
    {
        float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1063;
    }
    float _1065 = _1001;
    if (_965)
    {
        float _1067 = _953 * _1057;
        _1045 = _1067;
    }
    float _1069 = _1045;
    if (!_965)
    {
        _1053 = _955;
    }
    float _1071 = _1053;
    float _1073 = _1071;
    if (_965)
    {
        float _1075 = _955 * _1057;
        _1073 = _1075;
    }
    float _1077 = _1073;
    if (!_965)
    {
        _989 = _957;
    }
    float _1079 = _989;
    float _1081 = _1079;
    if (_965)
    {
        float _1083 = fma(_1027, _1021, _1065);
        _1061 = _1083;
    }
    float _1085 = _1061;
    if (_965)
    {
        float _1087 = _1069 * _1069;
        _1081 = _1087;
    }
    float _1089 = _1081;
    if (!_965)
    {
        _1047 = _959;
    }
    float _1091 = _1047;
    float _1093 = _1091;
    if (_965)
    {
        float _1095 = _1077 * _1077;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = fma(_1085, _1085, _1089);
    float _1101 = _801 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1103 = _1099 + _1097;
    float _1105 = _801 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1109 = fma(_949, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1107);
    float _1111 = precise::clamp(_1109, 0.0, 1.0);
    float _1113 = _801 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1115 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1101);
    float _1117 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1119 = rsqrt(_1103);
    float _1121 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1113);
    float _1123 = -_1111;
    float _1125 = _1123 + 1.0;
    float _1127 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1117);
    float _1129 = _801 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1121);
    float _1133 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1115);
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1137 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1139 = abs(_1125);
    float _1141 = log2(_1139);
    float _1143 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1147 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1137);
    float _1149 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1151 = -_1145;
    float _1153 = fma(_1151, _943, 1.0);
    float _1155 = _1119 * _1069;
    float _1157 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1159 = _1119 * _1085;
    float _1161 = _1119 * _1077;
    float _1163 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1149);
    float _1167 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1169 = log2(_1153);
    float _1171 = -_1163;
    float _1173 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1171);
    float _1175 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1177 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1179 = -_1161;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1175);
    float _1185 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1187 = exp2(_1177);
    float _1189 = fma(_1181, -0.5, 0.5);
    float _1191 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1185);
    float _1195 = fma(_1181, 0.5, 0.5);
    float _1197 = _1159 + 1.0;
    float _1199 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1201 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1203 = 1.0 / _1183;
    float _1205 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1207 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1199);
    float _1209 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1201);
    float _1211 = fma(_1195, _1205, -0.212114393711090087890625);
    float _1213 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1215 = sqrt(_1189);
    float _1217 = -_1159;
    float _1219 = fma(_1187, _1197, _1217);
    float _1221 = _1169 * 0.693147182464599609375;
    float _1223 = fma(_1195, _1211, 1.570728778839111328125);
    float _1225 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1227 = _1209 * _1203;
    float _1229 = _1213 * _1203;
    float _1231 = fma(_1219, 0.5, 0.5);
    float _1233 = fma(_1227, 0.5, 0.5);
    float _1235 = fma(_1229, -0.5, 0.5);
    float _1237 = _1215 * 0.636619746685028076171875;
    float3 _3247 = float3(_1233, _1235, _1225);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).x;
    float _1241 = -_1223;
    float _1243 = fma(_1237, _1241, 1.0);
    float3 _3263 = float3(_1233, _1235, _1225);
    float4 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3263, float3(0.0), isnan(_3263)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3263, float3(0.0), isnan(_3263)), level(0.0)).xyzw;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1246.w;
    float2 _3280 = float2(_1243, _1231);
    float3 _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3280, float2(0.0), isnan(_3280)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3280, float2(0.0), isnan(_3280)), level(0.0)).xyz;
    float _1260 = _1258.x;
    float _1262 = _1258.y;
    float _1264 = _1258.z;
    float _1266 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1268 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1270 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1272 = _1266 * _137;
    float _1274 = exp2(_1268);
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1282 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1270);
    float _1284 = -_501;
    float _1286 = _1284 + 0.5;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = trunc(_1272);
    int _1292 = int(_1290);
    float _1294 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1282);
    bool _1302 = _867 > 0.0;
    bool _1304 = isnan(_867);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = _487 + 0.5;
    float _1314 = -_1274;
    float _1316 = _1314 + 1.0;
    out.m_56.x = _1294;
    out.m_56.y = _1296;
    out.m_56.z = _1298;
    out.m_56.w = _1288;
    bool _1318 = _925 <= 0.0;
    bool _1320 = !_1310;
    bool _1322 = _1318 || _1320;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _1312;
    out.m_58.y = _1286;
    int _1328 = _1292 << 4;
    int _1330 = _1328 + 1968;
    float _1332 = _867 * _925;
    uint _1335 = uint(int(uint(_1330) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[int(_1345)][_1347];
    float _1351 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1353 = _1351 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _1355 = _1330 + 8;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    out.m_45.x = _1353;
    float _1365 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1300);
    float _1367 = _1365 + _1183;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1365;
    out.gl_Position.w = _1183;
    float _1369 = _1367 * 0.5;
    out.m_60.z = _1369;
    out.m_60.w = _1183;
    float _1371 = _1341 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1373 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1375 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1381 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _1375;
    out.m_62.y = _1377;
    out.m_62.z = _1381;
    out.m_62.w = _1326;
    float _1383 = _1324 * _1239;
    float _1385 = -_1324;
    float _1387 = _1385 + 1.0;
    float _1389 = _1254 * _1383;
    float _1391 = _1254 * _1387;
    float _1393 = _1264 * _1383;
    float _1395 = fma(_1260, _1389, _1248);
    float _1397 = fma(_1262, _1389, _1250);
    float _1399 = fma(_1254, _1393, _1252);
    out.m_64.x = _1395;
    out.m_64.y = _1397;
    out.m_64.z = _1399;
    out.m_64.w = _1391;
    if (!_1322)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1401;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

