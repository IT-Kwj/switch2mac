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
    float4 m_53 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _569 = false;
    bool _279 = false;
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
        float _1487 = as_type<float>(_99);
        out.gl_Position.z = _1487;
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
        float _1556 = as_type<float>(_135);
        out.gl_Position.z = _1556;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _277;
    if (!_259)
    {
        float _261 = in.m_51.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_83);
        float _283 = 1.0 / _281;
        float _285 = _117 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _305;
    float _309 = 1.0 / _291;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _315 = 1.0 / _295;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _287 + _317;
    out.m_53.w = _311;
    float _321 = 1.0 / _303;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _287 + _323;
    float _327 = _319 * _309;
    bool _329 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _331 = isnan(_287);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _343 = isnan(_287);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = 1.0 / _299;
    float _355 = _325 * _315;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _287 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _363 = _287 + _361;
    float _365 = -_351;
    float _367 = _365 + 1.0;
    float _369 = 1.0 / _307;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _287 + _371;
    float _375 = _373 * _321;
    bool _377 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _379 = isnan(_287);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _359 * _353;
    float _391 = -_339;
    float _393 = _391 + 1.0;
    float _395 = -_387;
    float _397 = _395 + 1.0;
    float _399 = _387 * _393;
    float _401 = _351 * _397;
    float _403 = _363 * _369;
    bool _405 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_287);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    bool _425 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _427 = isnan(_287);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _415 * _367;
    float _439 = -_415;
    float _441 = _439 + 1.0;
    float _443 = fma(_419, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _445 = fma(_423, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _447 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_287);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _435 * _441;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = _457 * _463;
    float _479 = fma(_467, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = fma(_471, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _483;
    float _487 = _443 * _477;
    float _489 = _445 * _477;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _487);
    float _501 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _507 = fma(_485, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_493, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_479, _459, _499);
    float _513 = fma(_481, _459, _501);
    float _515 = fma(_505, _375, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _517 = fma(_497, _375, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _523;
    float _527 = fma(_507, _437, _511);
    float _529 = fma(_509, _437, _513);
    float _531 = fma(_521, _403, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _533 = fma(_525, _403, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _535 = fma(_515, _401, _527);
    float _537 = fma(_517, _401, _529);
    float _539 = fma(_531, _399, _535);
    float _541 = fma(_533, _399, _537);
    float _543 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[148].x, _539);
    float _545 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[148].y, _541);
    bool _547 = !_313;
    float _549 = _389;
    float _567;
    if (!_547)
    {
        float _551 = in.m_51.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _567 = _565;
        _569 = true;
    }
    else
    {
        float _571 = float(_83);
        float _573 = 1.0 / _571;
        float _575 = _117 * _573;
        _567 = _575;
    }
    _569 = false;
    float _577 = _567;
    float _579 = as_type<float>(int(gl_VertexIndex));
    float _581 = in.m_49.x;
    float _583 = in.m_49.y;
    int _585 = as_type<int>(_579) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_579) & 2;
    bool _591 = _589 != 0;
    float _593 = _545 * _583;
    bool _595 = !_591;
    float _597 = _595 ? (-0.5) : 0.5;
    float _599 = _543 * _581;
    bool _601 = !_587;
    float _603 = _601 ? (-0.5) : 0.5;
    float _605 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _607 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _609 = isnan(0.5);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _615 = _611 || _613;
    float _617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _597);
    float _619 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _623 = _605 * _617;
    float _625 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = _619 * _621;
    float _629 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _631 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _639 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _641 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _643 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _633);
    float _645 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _637);
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[26].z, _639);
    float _649 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _641);
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[24].z, _645);
    float _655 = _647 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _657 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _659 = _649 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _663 = _651 + _655;
    float _665 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _657);
    float _667 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = _659 + _661;
    float _671 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _673 = _663 + _671;
    float _675 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _665);
    float _677 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _679 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _681 = _669 + _679;
    float _683 = _673 * _673;
    float _685 = _675 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _687 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[25].z, _677);
    float _689 = fma(_681, _681, _683);
    float _691 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _693 = _687 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _695 = sqrt(_689);
    float _697 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _691);
    float _699 = _685 + _693;
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[11].z, _697);
    float _703 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = _701 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _709 = 1.0 / _705;
    float _711 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[10].z, _707);
    bool _713 = _695 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _715 = _711 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _717 = _715 + _705;
    float _719 = _717 * _709;
    float _721 = _719 * 0.5;
    float _723 = _709;
    float _725 = _705;
    float _727 = _717;
    float _729 = _649;
    float _731 = _667;
    float _733 = _685;
    if (_615)
    {
        _723 = 1.0;
    }
    float _735 = _723;
    float _737 = _735;
    if (!_713)
    {
        _725 = _669;
    }
    float _739 = _725;
    float _741 = _739;
    if (!_713)
    {
        _727 = _663;
    }
    float _743 = _727;
    float _745 = _743;
    if (!_713)
    {
        _729 = _699;
    }
    float _747 = _729;
    bool _749 = !_713;
    float _751 = _747;
    if (!_749)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _757 = _695 + _755;
        float _759 = rsqrt(_689);
        float _761 = _757 * _753;
        float _763 = _699 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _765 * 6.283185482025146484375;
        float _769 = cos(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _769 + (-1.0);
        float _777 = _775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _779 = fma(_773, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _781 = fma(_699, _769, _777);
        float _783 = _759 * _779;
        float _785 = fma(_681, _783, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _787 = fma(_673, _783, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _751 = _781;
        _741 = _785;
        _745 = _787;
    }
    float _789 = _751;
    float _791 = _741;
    float _793 = _745;
    if (!_615)
    {
        float _795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _797 = _795 * 0.15915493667125701904296875;
        float _799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _801 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _803 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[30].w, _801);
        float _805 = _797 * 6.283185482025146484375;
        float _807 = cos(_805);
        float _809 = _799 * 0.15915493667125701904296875;
        float _811 = _797 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = 1.0 / _807;
        float _817 = _809 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = _813 * _815;
        float _823 = _809 * 6.283185482025146484375;
        float _825 = sin(_823);
        float _827 = _819 * _821;
        float _829 = 1.0 / _803;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _833 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _831;
        float _835 = 1.0 / _827;
        float _837 = 1.0 / _833;
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _841 = _829 * _839;
        float _843 = _825 * _835;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _847 = fma(_843, _841, _845);
        float _849 = _847 * _837;
        float _851 = precise::clamp(_849, 0.0, 1.0);
        _731 = _829;
        _737 = _851;
    }
    float _853 = _731;
    float _855 = _737;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _859 = _789 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _791 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _867 = _793 + _865;
    float _869 = _859 * _859;
    float _871 = fma(_863, _863, _869);
    float _873 = fma(_867, _867, _871);
    float _875 = rsqrt(_873);
    float _877 = _875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _879 = _863 * _877;
    float _881 = _867 * _877;
    float _883 = _879 * _879;
    float _885 = _881 * _881;
    float _887 = _883 + _885;
    float _889 = sqrt(_887);
    bool _891 = _889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _893 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _895 = _889 + _893;
    float _897 = _663;
    float _899 = _887;
    float _901 = _895;
    float _903 = _859;
    float _905 = _879;
    if (_891)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _897 = _907;
    }
    float _909 = _897;
    if (_891)
    {
        float _911 = rsqrt(_887);
        _899 = _911;
    }
    float _913 = _899;
    float _915 = _909;
    float _917 = _913;
    if (_891)
    {
        float _919 = _895 * _909;
        _901 = _919;
    }
    float _921 = _901;
    if (_891)
    {
        float _923 = _921 * 0.15915493667125701904296875;
        _733 = _923;
    }
    float _925 = _733;
    float _927 = _867;
    if (_891)
    {
        float _929 = _925 * 6.283185482025146484375;
        float _931 = sin(_929);
        _927 = _931;
    }
    float _933 = _927;
    float _935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _937 = precise::max(0.0, _935);
    float _939 = _853;
    float _941 = _937;
    if (_891)
    {
        float _943 = _925 * 6.283185482025146484375;
        float _945 = cos(_943);
        _939 = _945;
    }
    float _947 = _939;
    float _949 = -_877;
    float _951 = -_937;
    float _953 = fma(_859, _949, _951);
    if (_891)
    {
        float _955 = _953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _955;
    }
    float _957 = _903;
    float _959 = sqrt(_873);
    float _961 = _933;
    float _963 = _957;
    if (_891)
    {
        float _965 = fma(_933, _957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _961 = _965;
    }
    float _967 = _961;
    float _969 = _967;
    if (!_891)
    {
        _963 = _881;
    }
    float _971 = _963;
    float _973 = _971;
    if (_891)
    {
        float _975 = _947 + (-1.0);
        _941 = _975;
    }
    float _977 = _941;
    float _979 = _977;
    if (_891)
    {
        float _981 = _913 * _967;
        _549 = _981;
    }
    float _983 = _549;
    if (!_891)
    {
        _969 = _953;
    }
    float _985 = _969;
    float _987 = _985;
    if (_891)
    {
        float _989 = _977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _989;
    }
    float _991 = _915;
    if (_891)
    {
        float _993 = _879 * _983;
        _905 = _993;
    }
    float _995 = _905;
    if (!_891)
    {
        _917 = _883;
    }
    float _997 = _917;
    float _999 = _997;
    if (_891)
    {
        float _1001 = _881 * _983;
        _973 = _1001;
    }
    float _1003 = _973;
    if (_891)
    {
        float _1005 = fma(_953, _947, _991);
        _987 = _1005;
    }
    float _1007 = _987;
    if (_891)
    {
        float _1009 = _995 * _995;
        _999 = _1009;
    }
    float _1011 = _999;
    if (!_891)
    {
        _979 = _885;
    }
    float _1013 = _979;
    float _1015 = _1013;
    if (_891)
    {
        float _1017 = _1003 * _1003;
        _1015 = _1017;
    }
    float _1019 = _1015;
    float _1021 = fma(_1007, _1007, _1011);
    float _1023 = _1021 + _1019;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1035 = rsqrt(_1023);
    float _1037 = -_1029;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1043 = _789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1045 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    float _1047 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1049 = _789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1051 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1043);
    float _1053 = abs(_1039);
    float _1055 = log2(_1053);
    float _1057 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1045);
    float _1059 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1041);
    float _1061 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1051);
    float _1063 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1049);
    float _1065 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1071 = _1035 * _995;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1075 = _1035 * _1007;
    float _1077 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1063);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1073);
    float _1083 = _1035 * _1003;
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1087 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1089 = -_1079;
    float _1091 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1089);
    float _1093 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1081);
    float _1097 = -_1085;
    float _1099 = fma(_1097, _1047, 1.0);
    float _1101 = -_1083;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1091);
    float _1105 = exp2(_1087);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1095);
    float _1109 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1111 = fma(_1103, -0.5, 0.5);
    float _1113 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1115 = fma(_1103, 0.5, 0.5);
    float _1117 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1109);
    float _1119 = _1075 + 1.0;
    float _1121 = log2(_1099);
    float _1123 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1113);
    float _1125 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1127 = fma(_1115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1129 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1123);
    float _1131 = fma(_1115, _1127, -0.212114393711090087890625);
    float _1133 = 1.0 / _1107;
    float _1135 = -_1075;
    float _1137 = fma(_1105, _1119, _1135);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1125);
    float _1141 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1129);
    float _1143 = fma(_1115, _1131, 1.570728778839111328125);
    float _1145 = fma(_1137, 0.5, 0.5);
    float _1147 = sqrt(_1111);
    float _1149 = _1121 * 0.693147182464599609375;
    float _1151 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = _1139 * _1133;
    float _1155 = _1141 * _1133;
    float _1157 = fma(_1153, 0.5, 0.5);
    float _1159 = fma(_1155, -0.5, 0.5);
    float _1161 = _1147 * 0.636619746685028076171875;
    float _1163 = -_1143;
    float _1165 = fma(_1161, _1163, 1.0);
    float3 _3225 = float3(_1157, _1159, _1151);
    float _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3225, float3(0.0), isnan(_3225)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3225, float3(0.0), isnan(_3225)), level(0.0)).x;
    float3 _3236 = float3(_1157, _1159, _1151);
    float4 _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).xyzw;
    float _1172 = _1170.x;
    float _1174 = _1170.y;
    float _1176 = _1170.z;
    float _1178 = _1170.w;
    float2 _3253 = float2(_1165, _1145);
    float3 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3253, float2(0.0), isnan(_3253)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3253, float2(0.0), isnan(_3253)), level(0.0)).xyz;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = in.m_51.x;
    float _1192 = in.m_51.y;
    float _1194 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1212 = _1210 != 0;
    float _1214 = 1.0 / _1198;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1216;
    bool _1220 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1222 = isnan(_577);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1208);
    bool _1234 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1236 = isnan(_577);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    bool _1246 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1248 = isnan(_577);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1230;
    float _1260 = _1258 + 1.0;
    float _1262 = 1.0 / _1202;
    float _1264 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1232);
    float _1266 = _1244 * _1260;
    float _1268 = -_1244;
    float _1270 = _1268 + 1.0;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1276 = _1192 > 0.5;
    float _1278 = _1218 * _1214;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1282 = _577 + _1280;
    bool _1284 = _1190 > 0.5;
    float _1286 = -_1256;
    float _1288 = _1286 + 1.0;
    float _1290 = 1.0 / _1274;
    float _1292 = fma(_1278, _1282, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1298 = _1230 * _1288;
    bool _1300 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1302 = isnan(_577);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1292 * _1266;
    float _1314 = _1296 * _1262;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1318 = _577 + _1316;
    float _1320 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1312);
    float _1322 = -_597;
    int _1324 = _1276 ? as_type<int>(_1322) : as_type<int>(_597);
    float _1326 = fma(_1314, _1318, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1330 = _577 + _1328;
    float _1332 = -_603;
    int _1334 = _1284 ? as_type<int>(_1332) : as_type<int>(_603);
    float _1336 = -_1310;
    float _1338 = _1336 + 1.0;
    bool _1340 = !_1212;
    float _1342 = _1340 ? _597 : as_type<float>(_1324);
    float _1344 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1346 = !_1206;
    float _1348 = _1346 ? _603 : as_type<float>(_1334);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1350;
    float _1354 = _1256 * _1338;
    float _1356 = exp2(_1344);
    float _1358 = fma(_1326, _1298, _1320);
    float _1360 = _1352 * _1290;
    float _1362 = _1348 + 0.5;
    float _1364 = -_1342;
    float _1366 = _1364 + 0.5;
    bool _1368 = _855 > 0.0;
    bool _1370 = isnan(_855);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = fma(_1360, _1330, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1380 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1384 = _1264 + _1107;
    float _1386 = fma(_1378, _1354, _1358);
    float _1388 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1390 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1392 = _1384 * 0.5;
    float _1394 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1386);
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1141;
    out.gl_Position.z = _1264;
    out.gl_Position.w = _1107;
    float _1396 = -_1356;
    float _1398 = _1396 + 1.0;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1406 = _1388 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.w = _1402;
    float _1408 = -_1404;
    float _1410 = _1408 + 1.0;
    float _1412 = _1380 * _1382;
    out.m_60.z = _1392;
    out.m_60.w = _1107;
    out.m_45.x = _1406;
    float _1414 = _1390 * _1400;
    out.m_62.x = _1412;
    out.m_62.y = _1414;
    float _1416 = _1404 * _1167;
    float _1418 = _1178 * _1416;
    float _1420 = _1188 * _1416;
    float _1422 = fma(_1184, _1418, _1172);
    float _1424 = fma(_1186, _1418, _1174);
    float _1426 = _1178 * _1410;
    float _1428 = fma(_1178, _1420, _1176);
    out.m_64.x = _1422;
    out.m_64.y = _1424;
    out.m_64.z = _1428;
    out.m_64.w = _1426;
    if (_1376)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1430 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1430;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _569 = false;
    bool _279 = false;
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
        float _1487 = as_type<float>(_99);
        out.gl_Position.z = _1487;
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
        float _1556 = as_type<float>(_135);
        out.gl_Position.z = _1556;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _277;
    if (!_259)
    {
        float _261 = in.m_51.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_83);
        float _283 = 1.0 / _281;
        float _285 = _117 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _305;
    float _309 = 1.0 / _291;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _315 = 1.0 / _295;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _287 + _317;
    out.m_53.w = _311;
    float _321 = 1.0 / _303;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _287 + _323;
    float _327 = _319 * _309;
    bool _329 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _331 = isnan(_287);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _343 = isnan(_287);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = 1.0 / _299;
    float _355 = _325 * _315;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _287 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _363 = _287 + _361;
    float _365 = -_351;
    float _367 = _365 + 1.0;
    float _369 = 1.0 / _307;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _287 + _371;
    float _375 = _373 * _321;
    bool _377 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _379 = isnan(_287);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _359 * _353;
    float _391 = -_339;
    float _393 = _391 + 1.0;
    float _395 = -_387;
    float _397 = _395 + 1.0;
    float _399 = _387 * _393;
    float _401 = _351 * _397;
    float _403 = _363 * _369;
    bool _405 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_287);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    bool _425 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _427 = isnan(_287);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _415 * _367;
    float _439 = -_415;
    float _441 = _439 + 1.0;
    float _443 = fma(_419, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _445 = fma(_423, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _447 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_287);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _435 * _441;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = _457 * _463;
    float _479 = fma(_467, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = fma(_471, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _483;
    float _487 = _443 * _477;
    float _489 = _445 * _477;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _487);
    float _501 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _507 = fma(_485, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_493, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_479, _459, _499);
    float _513 = fma(_481, _459, _501);
    float _515 = fma(_505, _375, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _517 = fma(_497, _375, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _523;
    float _527 = fma(_507, _437, _511);
    float _529 = fma(_509, _437, _513);
    float _531 = fma(_521, _403, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _533 = fma(_525, _403, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _535 = fma(_515, _401, _527);
    float _537 = fma(_517, _401, _529);
    float _539 = fma(_531, _399, _535);
    float _541 = fma(_533, _399, _537);
    float _543 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[148].x, _539);
    float _545 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[148].y, _541);
    bool _547 = !_313;
    float _549 = _389;
    float _567;
    if (!_547)
    {
        float _551 = in.m_51.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _567 = _565;
        _569 = true;
    }
    else
    {
        float _571 = float(_83);
        float _573 = 1.0 / _571;
        float _575 = _117 * _573;
        _567 = _575;
    }
    _569 = false;
    float _577 = _567;
    float _579 = as_type<float>(int(gl_VertexIndex));
    float _581 = in.m_49.x;
    float _583 = in.m_49.y;
    int _585 = as_type<int>(_579) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_579) & 2;
    bool _591 = _589 != 0;
    float _593 = _545 * _583;
    bool _595 = !_591;
    float _597 = _595 ? (-0.5) : 0.5;
    float _599 = _543 * _581;
    bool _601 = !_587;
    float _603 = _601 ? (-0.5) : 0.5;
    float _605 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _607 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _609 = isnan(0.5);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _615 = _611 || _613;
    float _617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _597);
    float _619 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _623 = _605 * _617;
    float _625 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = _619 * _621;
    float _629 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _631 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _639 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _641 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _643 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _633);
    float _645 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _637);
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[26].z, _639);
    float _649 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _641);
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[24].z, _645);
    float _655 = _647 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _657 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _659 = _649 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _663 = _651 + _655;
    float _665 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _657);
    float _667 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = _659 + _661;
    float _671 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _673 = _663 + _671;
    float _675 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _665);
    float _677 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _679 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _681 = _669 + _679;
    float _683 = _673 * _673;
    float _685 = _675 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _687 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[25].z, _677);
    float _689 = fma(_681, _681, _683);
    float _691 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _693 = _687 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _695 = sqrt(_689);
    float _697 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _691);
    float _699 = _685 + _693;
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[11].z, _697);
    float _703 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = _701 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _709 = 1.0 / _705;
    float _711 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[10].z, _707);
    bool _713 = _695 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _715 = _711 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _717 = _715 + _705;
    float _719 = _717 * _709;
    float _721 = _719 * 0.5;
    float _723 = _709;
    float _725 = _705;
    float _727 = _717;
    float _729 = _649;
    float _731 = _667;
    float _733 = _685;
    if (_615)
    {
        _723 = 1.0;
    }
    float _735 = _723;
    float _737 = _735;
    if (!_713)
    {
        _725 = _669;
    }
    float _739 = _725;
    float _741 = _739;
    if (!_713)
    {
        _727 = _663;
    }
    float _743 = _727;
    float _745 = _743;
    if (!_713)
    {
        _729 = _699;
    }
    float _747 = _729;
    bool _749 = !_713;
    float _751 = _747;
    if (!_749)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _757 = _695 + _755;
        float _759 = rsqrt(_689);
        float _761 = _757 * _753;
        float _763 = _699 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _765 * 6.283185482025146484375;
        float _769 = cos(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _769 + (-1.0);
        float _777 = _775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _779 = fma(_773, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _781 = fma(_699, _769, _777);
        float _783 = _759 * _779;
        float _785 = fma(_681, _783, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _787 = fma(_673, _783, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _751 = _781;
        _741 = _785;
        _745 = _787;
    }
    float _789 = _751;
    float _791 = _741;
    float _793 = _745;
    if (!_615)
    {
        float _795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _797 = _795 * 0.15915493667125701904296875;
        float _799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _801 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _803 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[30].w, _801);
        float _805 = _797 * 6.283185482025146484375;
        float _807 = cos(_805);
        float _809 = _799 * 0.15915493667125701904296875;
        float _811 = _797 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = 1.0 / _807;
        float _817 = _809 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = _813 * _815;
        float _823 = _809 * 6.283185482025146484375;
        float _825 = sin(_823);
        float _827 = _819 * _821;
        float _829 = 1.0 / _803;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _833 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _831;
        float _835 = 1.0 / _827;
        float _837 = 1.0 / _833;
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _841 = _829 * _839;
        float _843 = _825 * _835;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _847 = fma(_843, _841, _845);
        float _849 = _847 * _837;
        float _851 = precise::clamp(_849, 0.0, 1.0);
        _731 = _829;
        _737 = _851;
    }
    float _853 = _731;
    float _855 = _737;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _859 = _789 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _791 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _867 = _793 + _865;
    float _869 = _859 * _859;
    float _871 = fma(_863, _863, _869);
    float _873 = fma(_867, _867, _871);
    float _875 = rsqrt(_873);
    float _877 = _875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _879 = _863 * _877;
    float _881 = _867 * _877;
    float _883 = _879 * _879;
    float _885 = _881 * _881;
    float _887 = _883 + _885;
    float _889 = sqrt(_887);
    bool _891 = _889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _893 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _895 = _889 + _893;
    float _897 = _663;
    float _899 = _887;
    float _901 = _895;
    float _903 = _859;
    float _905 = _879;
    if (_891)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _897 = _907;
    }
    float _909 = _897;
    if (_891)
    {
        float _911 = rsqrt(_887);
        _899 = _911;
    }
    float _913 = _899;
    float _915 = _909;
    float _917 = _913;
    if (_891)
    {
        float _919 = _895 * _909;
        _901 = _919;
    }
    float _921 = _901;
    if (_891)
    {
        float _923 = _921 * 0.15915493667125701904296875;
        _733 = _923;
    }
    float _925 = _733;
    float _927 = _867;
    if (_891)
    {
        float _929 = _925 * 6.283185482025146484375;
        float _931 = sin(_929);
        _927 = _931;
    }
    float _933 = _927;
    float _935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _937 = precise::max(0.0, _935);
    float _939 = _853;
    float _941 = _937;
    if (_891)
    {
        float _943 = _925 * 6.283185482025146484375;
        float _945 = cos(_943);
        _939 = _945;
    }
    float _947 = _939;
    float _949 = -_877;
    float _951 = -_937;
    float _953 = fma(_859, _949, _951);
    if (_891)
    {
        float _955 = _953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _955;
    }
    float _957 = _903;
    float _959 = sqrt(_873);
    float _961 = _933;
    float _963 = _957;
    if (_891)
    {
        float _965 = fma(_933, _957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _961 = _965;
    }
    float _967 = _961;
    float _969 = _967;
    if (!_891)
    {
        _963 = _881;
    }
    float _971 = _963;
    float _973 = _971;
    if (_891)
    {
        float _975 = _947 + (-1.0);
        _941 = _975;
    }
    float _977 = _941;
    float _979 = _977;
    if (_891)
    {
        float _981 = _913 * _967;
        _549 = _981;
    }
    float _983 = _549;
    if (!_891)
    {
        _969 = _953;
    }
    float _985 = _969;
    float _987 = _985;
    if (_891)
    {
        float _989 = _977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _989;
    }
    float _991 = _915;
    if (_891)
    {
        float _993 = _879 * _983;
        _905 = _993;
    }
    float _995 = _905;
    if (!_891)
    {
        _917 = _883;
    }
    float _997 = _917;
    float _999 = _997;
    if (_891)
    {
        float _1001 = _881 * _983;
        _973 = _1001;
    }
    float _1003 = _973;
    if (_891)
    {
        float _1005 = fma(_953, _947, _991);
        _987 = _1005;
    }
    float _1007 = _987;
    if (_891)
    {
        float _1009 = _995 * _995;
        _999 = _1009;
    }
    float _1011 = _999;
    if (!_891)
    {
        _979 = _885;
    }
    float _1013 = _979;
    float _1015 = _1013;
    if (_891)
    {
        float _1017 = _1003 * _1003;
        _1015 = _1017;
    }
    float _1019 = _1015;
    float _1021 = fma(_1007, _1007, _1011);
    float _1023 = _1021 + _1019;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1035 = rsqrt(_1023);
    float _1037 = -_1029;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1043 = _789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1045 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    float _1047 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1049 = _789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1051 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1043);
    float _1053 = abs(_1039);
    float _1055 = log2(_1053);
    float _1057 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1045);
    float _1059 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1041);
    float _1061 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1051);
    float _1063 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1049);
    float _1065 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1071 = _1035 * _995;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1075 = _1035 * _1007;
    float _1077 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1063);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1073);
    float _1083 = _1035 * _1003;
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1087 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1089 = -_1079;
    float _1091 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1089);
    float _1093 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1081);
    float _1097 = -_1085;
    float _1099 = fma(_1097, _1047, 1.0);
    float _1101 = -_1083;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1091);
    float _1105 = exp2(_1087);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1095);
    float _1109 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1111 = fma(_1103, -0.5, 0.5);
    float _1113 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1115 = fma(_1103, 0.5, 0.5);
    float _1117 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1109);
    float _1119 = _1075 + 1.0;
    float _1121 = log2(_1099);
    float _1123 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1113);
    float _1125 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1127 = fma(_1115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1129 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1123);
    float _1131 = fma(_1115, _1127, -0.212114393711090087890625);
    float _1133 = 1.0 / _1107;
    float _1135 = -_1075;
    float _1137 = fma(_1105, _1119, _1135);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1125);
    float _1141 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1129);
    float _1143 = fma(_1115, _1131, 1.570728778839111328125);
    float _1145 = fma(_1137, 0.5, 0.5);
    float _1147 = sqrt(_1111);
    float _1149 = _1121 * 0.693147182464599609375;
    float _1151 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = _1139 * _1133;
    float _1155 = _1141 * _1133;
    float _1157 = fma(_1153, 0.5, 0.5);
    float _1159 = fma(_1155, -0.5, 0.5);
    float _1161 = _1147 * 0.636619746685028076171875;
    float _1163 = -_1143;
    float _1165 = fma(_1161, _1163, 1.0);
    float3 _3225 = float3(_1157, _1159, _1151);
    float _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3225, float3(0.0), isnan(_3225)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3225, float3(0.0), isnan(_3225)), level(0.0)).x;
    float3 _3236 = float3(_1157, _1159, _1151);
    float4 _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).xyzw;
    float _1172 = _1170.x;
    float _1174 = _1170.y;
    float _1176 = _1170.z;
    float _1178 = _1170.w;
    float2 _3253 = float2(_1165, _1145);
    float3 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3253, float2(0.0), isnan(_3253)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3253, float2(0.0), isnan(_3253)), level(0.0)).xyz;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = in.m_51.x;
    float _1192 = in.m_51.y;
    float _1194 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1212 = _1210 != 0;
    float _1214 = 1.0 / _1198;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1216;
    bool _1220 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1222 = isnan(_577);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1208);
    bool _1234 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1236 = isnan(_577);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    bool _1246 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1248 = isnan(_577);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1230;
    float _1260 = _1258 + 1.0;
    float _1262 = 1.0 / _1202;
    float _1264 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1232);
    float _1266 = _1244 * _1260;
    float _1268 = -_1244;
    float _1270 = _1268 + 1.0;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1276 = _1192 > 0.5;
    float _1278 = _1218 * _1214;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1282 = _577 + _1280;
    bool _1284 = _1190 > 0.5;
    float _1286 = -_1256;
    float _1288 = _1286 + 1.0;
    float _1290 = 1.0 / _1274;
    float _1292 = fma(_1278, _1282, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1298 = _1230 * _1288;
    bool _1300 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1302 = isnan(_577);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1292 * _1266;
    float _1314 = _1296 * _1262;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1318 = _577 + _1316;
    float _1320 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1312);
    float _1322 = -_597;
    int _1324 = _1276 ? as_type<int>(_1322) : as_type<int>(_597);
    float _1326 = fma(_1314, _1318, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1330 = _577 + _1328;
    float _1332 = -_603;
    int _1334 = _1284 ? as_type<int>(_1332) : as_type<int>(_603);
    float _1336 = -_1310;
    float _1338 = _1336 + 1.0;
    bool _1340 = !_1212;
    float _1342 = _1340 ? _597 : as_type<float>(_1324);
    float _1344 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1346 = !_1206;
    float _1348 = _1346 ? _603 : as_type<float>(_1334);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1350;
    float _1354 = _1256 * _1338;
    float _1356 = exp2(_1344);
    float _1358 = fma(_1326, _1298, _1320);
    float _1360 = _1352 * _1290;
    float _1362 = _1348 + 0.5;
    float _1364 = -_1342;
    float _1366 = _1364 + 0.5;
    bool _1368 = _855 > 0.0;
    bool _1370 = isnan(_855);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = fma(_1360, _1330, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1380 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1384 = _1264 + _1107;
    float _1386 = fma(_1378, _1354, _1358);
    float _1388 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1390 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1392 = _1384 * 0.5;
    float _1394 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1386);
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1141;
    out.gl_Position.z = _1264;
    out.gl_Position.w = _1107;
    float _1396 = -_1356;
    float _1398 = _1396 + 1.0;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1406 = _1388 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.w = _1402;
    float _1408 = -_1404;
    float _1410 = _1408 + 1.0;
    float _1412 = _1380 * _1382;
    out.m_60.z = _1392;
    out.m_60.w = _1107;
    out.m_45.x = _1406;
    float _1414 = _1390 * _1400;
    out.m_62.x = _1412;
    out.m_62.y = _1414;
    float _1416 = _1404 * _1167;
    float _1418 = _1178 * _1416;
    float _1420 = _1188 * _1416;
    float _1422 = fma(_1184, _1418, _1172);
    float _1424 = fma(_1186, _1418, _1174);
    float _1426 = _1178 * _1410;
    float _1428 = fma(_1178, _1420, _1176);
    out.m_64.x = _1422;
    out.m_64.y = _1424;
    out.m_64.z = _1428;
    out.m_64.w = _1426;
    if (_1376)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1430 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1430;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _569 = false;
    bool _279 = false;
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
        float _1487 = as_type<float>(_99);
        out.gl_Position.z = _1487;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1556 = as_type<float>(_135);
        out.gl_Position.z = _1556;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _277;
    if (!_259)
    {
        float _261 = in.m_51.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_83);
        float _283 = 1.0 / _281;
        float _285 = _117 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _305;
    float _309 = 1.0 / _291;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _315 = 1.0 / _295;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _287 + _317;
    out.m_53.w = _311;
    float _321 = 1.0 / _303;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _287 + _323;
    float _327 = _319 * _309;
    bool _329 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _331 = isnan(_287);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _343 = isnan(_287);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = 1.0 / _299;
    float _355 = _325 * _315;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _287 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _363 = _287 + _361;
    float _365 = -_351;
    float _367 = _365 + 1.0;
    float _369 = 1.0 / _307;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _287 + _371;
    float _375 = _373 * _321;
    bool _377 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _379 = isnan(_287);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _359 * _353;
    float _391 = -_339;
    float _393 = _391 + 1.0;
    float _395 = -_387;
    float _397 = _395 + 1.0;
    float _399 = _387 * _393;
    float _401 = _351 * _397;
    float _403 = _363 * _369;
    bool _405 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_287);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    bool _425 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _427 = isnan(_287);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _415 * _367;
    float _439 = -_415;
    float _441 = _439 + 1.0;
    float _443 = fma(_419, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _445 = fma(_423, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _447 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_287);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _435 * _441;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = _457 * _463;
    float _479 = fma(_467, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = fma(_471, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _483;
    float _487 = _443 * _477;
    float _489 = _445 * _477;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _487);
    float _501 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _507 = fma(_485, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_493, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_479, _459, _499);
    float _513 = fma(_481, _459, _501);
    float _515 = fma(_505, _375, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _517 = fma(_497, _375, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _523;
    float _527 = fma(_507, _437, _511);
    float _529 = fma(_509, _437, _513);
    float _531 = fma(_521, _403, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _533 = fma(_525, _403, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _535 = fma(_515, _401, _527);
    float _537 = fma(_517, _401, _529);
    float _539 = fma(_531, _399, _535);
    float _541 = fma(_533, _399, _537);
    float _543 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[148].x, _539);
    float _545 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[148].y, _541);
    bool _547 = !_313;
    float _549 = _389;
    float _567;
    if (!_547)
    {
        float _551 = in.m_51.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _567 = _565;
        _569 = true;
    }
    else
    {
        float _571 = float(_83);
        float _573 = 1.0 / _571;
        float _575 = _117 * _573;
        _567 = _575;
    }
    _569 = false;
    float _577 = _567;
    float _579 = as_type<float>(int(gl_VertexIndex));
    float _581 = in.m_49.x;
    float _583 = in.m_49.y;
    int _585 = as_type<int>(_579) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_579) & 2;
    bool _591 = _589 != 0;
    float _593 = _545 * _583;
    bool _595 = !_591;
    float _597 = _595 ? (-0.5) : 0.5;
    float _599 = _543 * _581;
    bool _601 = !_587;
    float _603 = _601 ? (-0.5) : 0.5;
    float _605 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _607 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _609 = isnan(0.5);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _615 = _611 || _613;
    float _617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _597);
    float _619 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _623 = _605 * _617;
    float _625 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = _619 * _621;
    float _629 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _631 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _639 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _641 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _643 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _633);
    float _645 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _637);
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[26].z, _639);
    float _649 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _641);
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[24].z, _645);
    float _655 = _647 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _657 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _659 = _649 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _663 = _651 + _655;
    float _665 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _657);
    float _667 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = _659 + _661;
    float _671 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _673 = _663 + _671;
    float _675 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _665);
    float _677 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _679 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _681 = _669 + _679;
    float _683 = _673 * _673;
    float _685 = _675 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _687 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[25].z, _677);
    float _689 = fma(_681, _681, _683);
    float _691 = _685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _693 = _687 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _695 = sqrt(_689);
    float _697 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _691);
    float _699 = _685 + _693;
    float _701 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[11].z, _697);
    float _703 = _685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = _701 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _709 = 1.0 / _705;
    float _711 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[10].z, _707);
    bool _713 = _695 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _715 = _711 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _717 = _715 + _705;
    float _719 = _717 * _709;
    float _721 = _719 * 0.5;
    float _723 = _709;
    float _725 = _705;
    float _727 = _717;
    float _729 = _649;
    float _731 = _667;
    float _733 = _685;
    if (_615)
    {
        _723 = 1.0;
    }
    float _735 = _723;
    float _737 = _735;
    if (!_713)
    {
        _725 = _669;
    }
    float _739 = _725;
    float _741 = _739;
    if (!_713)
    {
        _727 = _663;
    }
    float _743 = _727;
    float _745 = _743;
    if (!_713)
    {
        _729 = _699;
    }
    float _747 = _729;
    bool _749 = !_713;
    float _751 = _747;
    if (!_749)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _757 = _695 + _755;
        float _759 = rsqrt(_689);
        float _761 = _757 * _753;
        float _763 = _699 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = _761 * 0.15915493667125701904296875;
        float _767 = _765 * 6.283185482025146484375;
        float _769 = cos(_767);
        float _771 = _765 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _769 + (-1.0);
        float _777 = _775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _779 = fma(_773, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _781 = fma(_699, _769, _777);
        float _783 = _759 * _779;
        float _785 = fma(_681, _783, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _787 = fma(_673, _783, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _751 = _781;
        _741 = _785;
        _745 = _787;
    }
    float _789 = _751;
    float _791 = _741;
    float _793 = _745;
    if (!_615)
    {
        float _795 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _797 = _795 * 0.15915493667125701904296875;
        float _799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _801 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _803 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[30].w, _801);
        float _805 = _797 * 6.283185482025146484375;
        float _807 = cos(_805);
        float _809 = _799 * 0.15915493667125701904296875;
        float _811 = _797 * 6.283185482025146484375;
        float _813 = sin(_811);
        float _815 = 1.0 / _807;
        float _817 = _809 * 6.283185482025146484375;
        float _819 = cos(_817);
        float _821 = _813 * _815;
        float _823 = _809 * 6.283185482025146484375;
        float _825 = sin(_823);
        float _827 = _819 * _821;
        float _829 = 1.0 / _803;
        float _831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _833 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _831;
        float _835 = 1.0 / _827;
        float _837 = 1.0 / _833;
        float _839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _841 = _829 * _839;
        float _843 = _825 * _835;
        float _845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _847 = fma(_843, _841, _845);
        float _849 = _847 * _837;
        float _851 = precise::clamp(_849, 0.0, 1.0);
        _731 = _829;
        _737 = _851;
    }
    float _853 = _731;
    float _855 = _737;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _859 = _789 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _791 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _867 = _793 + _865;
    float _869 = _859 * _859;
    float _871 = fma(_863, _863, _869);
    float _873 = fma(_867, _867, _871);
    float _875 = rsqrt(_873);
    float _877 = _875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _879 = _863 * _877;
    float _881 = _867 * _877;
    float _883 = _879 * _879;
    float _885 = _881 * _881;
    float _887 = _883 + _885;
    float _889 = sqrt(_887);
    bool _891 = _889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _893 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _895 = _889 + _893;
    float _897 = _663;
    float _899 = _887;
    float _901 = _895;
    float _903 = _859;
    float _905 = _879;
    if (_891)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _897 = _907;
    }
    float _909 = _897;
    if (_891)
    {
        float _911 = rsqrt(_887);
        _899 = _911;
    }
    float _913 = _899;
    float _915 = _909;
    float _917 = _913;
    if (_891)
    {
        float _919 = _895 * _909;
        _901 = _919;
    }
    float _921 = _901;
    if (_891)
    {
        float _923 = _921 * 0.15915493667125701904296875;
        _733 = _923;
    }
    float _925 = _733;
    float _927 = _867;
    if (_891)
    {
        float _929 = _925 * 6.283185482025146484375;
        float _931 = sin(_929);
        _927 = _931;
    }
    float _933 = _927;
    float _935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _937 = precise::max(0.0, _935);
    float _939 = _853;
    float _941 = _937;
    if (_891)
    {
        float _943 = _925 * 6.283185482025146484375;
        float _945 = cos(_943);
        _939 = _945;
    }
    float _947 = _939;
    float _949 = -_877;
    float _951 = -_937;
    float _953 = fma(_859, _949, _951);
    if (_891)
    {
        float _955 = _953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _903 = _955;
    }
    float _957 = _903;
    float _959 = sqrt(_873);
    float _961 = _933;
    float _963 = _957;
    if (_891)
    {
        float _965 = fma(_933, _957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _961 = _965;
    }
    float _967 = _961;
    float _969 = _967;
    if (!_891)
    {
        _963 = _881;
    }
    float _971 = _963;
    float _973 = _971;
    if (_891)
    {
        float _975 = _947 + (-1.0);
        _941 = _975;
    }
    float _977 = _941;
    float _979 = _977;
    if (_891)
    {
        float _981 = _913 * _967;
        _549 = _981;
    }
    float _983 = _549;
    if (!_891)
    {
        _969 = _953;
    }
    float _985 = _969;
    float _987 = _985;
    if (_891)
    {
        float _989 = _977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _989;
    }
    float _991 = _915;
    if (_891)
    {
        float _993 = _879 * _983;
        _905 = _993;
    }
    float _995 = _905;
    if (!_891)
    {
        _917 = _883;
    }
    float _997 = _917;
    float _999 = _997;
    if (_891)
    {
        float _1001 = _881 * _983;
        _973 = _1001;
    }
    float _1003 = _973;
    if (_891)
    {
        float _1005 = fma(_953, _947, _991);
        _987 = _1005;
    }
    float _1007 = _987;
    if (_891)
    {
        float _1009 = _995 * _995;
        _999 = _1009;
    }
    float _1011 = _999;
    if (!_891)
    {
        _979 = _885;
    }
    float _1013 = _979;
    float _1015 = _1013;
    if (_891)
    {
        float _1017 = _1003 * _1003;
        _1015 = _1017;
    }
    float _1019 = _1015;
    float _1021 = fma(_1007, _1007, _1011);
    float _1023 = _1021 + _1019;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1035 = rsqrt(_1023);
    float _1037 = -_1029;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1043 = _789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1045 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    float _1047 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1049 = _789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1051 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1043);
    float _1053 = abs(_1039);
    float _1055 = log2(_1053);
    float _1057 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1045);
    float _1059 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1041);
    float _1061 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1051);
    float _1063 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1049);
    float _1065 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1071 = _1035 * _995;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1075 = _1035 * _1007;
    float _1077 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1063);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1073);
    float _1083 = _1035 * _1003;
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1087 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1089 = -_1079;
    float _1091 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1089);
    float _1093 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1081);
    float _1097 = -_1085;
    float _1099 = fma(_1097, _1047, 1.0);
    float _1101 = -_1083;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1091);
    float _1105 = exp2(_1087);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1095);
    float _1109 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1111 = fma(_1103, -0.5, 0.5);
    float _1113 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1115 = fma(_1103, 0.5, 0.5);
    float _1117 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1109);
    float _1119 = _1075 + 1.0;
    float _1121 = log2(_1099);
    float _1123 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1113);
    float _1125 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1127 = fma(_1115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1129 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1123);
    float _1131 = fma(_1115, _1127, -0.212114393711090087890625);
    float _1133 = 1.0 / _1107;
    float _1135 = -_1075;
    float _1137 = fma(_1105, _1119, _1135);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1125);
    float _1141 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1129);
    float _1143 = fma(_1115, _1131, 1.570728778839111328125);
    float _1145 = fma(_1137, 0.5, 0.5);
    float _1147 = sqrt(_1111);
    float _1149 = _1121 * 0.693147182464599609375;
    float _1151 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1153 = _1139 * _1133;
    float _1155 = _1141 * _1133;
    float _1157 = fma(_1153, 0.5, 0.5);
    float _1159 = fma(_1155, -0.5, 0.5);
    float _1161 = _1147 * 0.636619746685028076171875;
    float _1163 = -_1143;
    float _1165 = fma(_1161, _1163, 1.0);
    float3 _3225 = float3(_1157, _1159, _1151);
    float _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3225, float3(0.0), isnan(_3225)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3225, float3(0.0), isnan(_3225)), level(0.0)).x;
    float3 _3236 = float3(_1157, _1159, _1151);
    float4 _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).xyzw;
    float _1172 = _1170.x;
    float _1174 = _1170.y;
    float _1176 = _1170.z;
    float _1178 = _1170.w;
    float2 _3253 = float2(_1165, _1145);
    float3 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3253, float2(0.0), isnan(_3253)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3253, float2(0.0), isnan(_3253)), level(0.0)).xyz;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = in.m_51.x;
    float _1192 = in.m_51.y;
    float _1194 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1212 = _1210 != 0;
    float _1214 = 1.0 / _1198;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1216;
    bool _1220 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1222 = isnan(_577);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1208);
    bool _1234 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1236 = isnan(_577);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    bool _1246 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1248 = isnan(_577);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -_1230;
    float _1260 = _1258 + 1.0;
    float _1262 = 1.0 / _1202;
    float _1264 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1232);
    float _1266 = _1244 * _1260;
    float _1268 = -_1244;
    float _1270 = _1268 + 1.0;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1276 = _1192 > 0.5;
    float _1278 = _1218 * _1214;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1282 = _577 + _1280;
    bool _1284 = _1190 > 0.5;
    float _1286 = -_1256;
    float _1288 = _1286 + 1.0;
    float _1290 = 1.0 / _1274;
    float _1292 = fma(_1278, _1282, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1298 = _1230 * _1288;
    bool _1300 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1302 = isnan(_577);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1292 * _1266;
    float _1314 = _1296 * _1262;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1318 = _577 + _1316;
    float _1320 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1312);
    float _1322 = -_597;
    int _1324 = _1276 ? as_type<int>(_1322) : as_type<int>(_597);
    float _1326 = fma(_1314, _1318, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1330 = _577 + _1328;
    float _1332 = -_603;
    int _1334 = _1284 ? as_type<int>(_1332) : as_type<int>(_603);
    float _1336 = -_1310;
    float _1338 = _1336 + 1.0;
    bool _1340 = !_1212;
    float _1342 = _1340 ? _597 : as_type<float>(_1324);
    float _1344 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1346 = !_1206;
    float _1348 = _1346 ? _603 : as_type<float>(_1334);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1350;
    float _1354 = _1256 * _1338;
    float _1356 = exp2(_1344);
    float _1358 = fma(_1326, _1298, _1320);
    float _1360 = _1352 * _1290;
    float _1362 = _1348 + 0.5;
    float _1364 = -_1342;
    float _1366 = _1364 + 0.5;
    bool _1368 = _855 > 0.0;
    bool _1370 = isnan(_855);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = fma(_1360, _1330, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1380 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1384 = _1264 + _1107;
    float _1386 = fma(_1378, _1354, _1358);
    float _1388 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1390 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1392 = _1384 * 0.5;
    float _1394 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1386);
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1141;
    out.gl_Position.z = _1264;
    out.gl_Position.w = _1107;
    float _1396 = -_1356;
    float _1398 = _1396 + 1.0;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1406 = _1388 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.w = _1402;
    float _1408 = -_1404;
    float _1410 = _1408 + 1.0;
    float _1412 = _1380 * _1382;
    out.m_60.z = _1392;
    out.m_60.w = _1107;
    out.m_45.x = _1406;
    float _1414 = _1390 * _1400;
    out.m_62.x = _1412;
    out.m_62.y = _1414;
    float _1416 = _1404 * _1167;
    float _1418 = _1178 * _1416;
    float _1420 = _1188 * _1416;
    float _1422 = fma(_1184, _1418, _1172);
    float _1424 = fma(_1186, _1418, _1174);
    float _1426 = _1178 * _1410;
    float _1428 = fma(_1178, _1420, _1176);
    out.m_64.x = _1422;
    out.m_64.y = _1424;
    out.m_64.z = _1428;
    out.m_64.w = _1426;
    if (_1376)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1430 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1430;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

