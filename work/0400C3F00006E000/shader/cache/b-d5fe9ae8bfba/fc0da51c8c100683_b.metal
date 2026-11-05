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
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _451 = false;
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
        float _1631 = as_type<float>(_99);
        out.gl_Position.z = _1631;
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
        float _1700 = as_type<float>(_135);
        out.gl_Position.z = _1700;
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
    float _183 = 0.0;
    if (!_179)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _139 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _139);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _213;
        _183 = _191;
    }
    float _215 = _181;
    float _217 = _183;
    float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _221 = !_149;
    float _223 = _217;
    float _225 = _215;
    if (!_221)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _139 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _223 = _235;
        _165 = _245;
    }
    float _247 = _223;
    float _249 = _165;
    float _251 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _253 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _255 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _259 = _247;
    float _261 = _249;
    if (!_149)
    {
        float _263 = _117 * _117;
        float _265 = _263 * 0.5;
        _259 = _265;
    }
    float _267 = _259;
    float _269 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].x, _251);
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].y, _253);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].z, _257);
    float _275 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_149)
    {
        float _277 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _277;
    }
    float _279 = _225;
    bool _281 = !_149;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _117 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _117);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].x, _269);
    float _321 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].y, _271);
    float _323 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _327 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _329 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _331 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].z, _273);
    float _333 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].x, _325);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].y, _327);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].z, _329);
    float _339 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_249, _151, _319);
    float _343 = fma(_249, _153, _321);
    float _345 = fma(_249, _155, _331);
    float _347 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _333);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].y, _335);
    float _351 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].z, _337);
    if (!_149)
    {
        _261 = _117;
    }
    float _353 = _261;
    bool _355 = !_149;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = 1.0 / _365;
        float _369 = _117 * _361;
        float _371 = exp2(_369);
        float _373 = -_371;
        float _375 = _373 + 1.0;
        float _377 = _375 * _367;
        _357 = _377;
    }
    float _379 = _357;
    float _381 = fma(_379, _153, _349);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_343, _137, _159);
    float _387 = fma(_379, _151, _347);
    float _389 = -_381;
    float _391 = _343 + _389;
    float _393 = fma(_379, _155, _351);
    float _395 = fma(_341, _137, _157);
    float _397 = -_387;
    float _399 = _341 + _397;
    float _401 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _403 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = -_393;
    float _409 = _345 + _407;
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _417 = fma(_345, _137, _161);
    float _419 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _411);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _413);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    bool _425 = !_383;
    float _427 = _421;
    float _429 = _419;
    float _431 = _423;
    float _449;
    if (!_425)
    {
        float _433 = in.m_51.x;
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _437 = _433 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_83);
        float _455 = 1.0 / _453;
        float _457 = _117 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = as_type<float>(int(gl_VertexIndex));
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _465 = _459 + _463;
    bool _467 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _469 = isnan(_459);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _481;
    float _485 = -_477;
    float _487 = _485 + 1.0;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _501;
    float _505 = 1.0 / _483;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _507;
    float _511 = _499 * _487;
    float _513 = -_499;
    float _515 = _513 + 1.0;
    int _517 = as_type<int>(_461) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_461) & 2;
    bool _523 = _521 != 0;
    float _525 = _465 * _505;
    float _527 = in.m_49.x;
    float _529 = in.m_49.y;
    float _531 = fma(_503, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _533 = fma(_509, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _535 = _531 * _511;
    float _537 = _533 * _511;
    float _539 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].y, _535);
    float _541 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].x, _537);
    bool _543 = !_523;
    float _545 = _543 ? (-0.5) : 0.5;
    float _547 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _549 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[144].y, _539);
    float _551 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[144].x, _541);
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _555 = _553 != 0;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _545);
    float _559 = _549 * _529;
    bool _561 = !_519;
    float _563 = _561 ? (-0.5) : 0.5;
    float _565 = _551 * _527;
    float _567 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _563);
    float _571 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _573 = _567 * _557;
    float _575 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _577 = _571 * _569;
    float _579 = _573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _581 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _575);
    float _585 = _573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _579);
    float _589 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _585);
    float _595 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[26].z, _587);
    float _597 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = _591 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _601 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[24].z, _593);
    float _603 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = in.m_51.x;
    float _609 = in.m_51.y;
    float _611 = _601 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _613 = _599 + _603;
    float _615 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _617 = _573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _619 = _605 + _611;
    float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _623 = _613 + _621;
    float _625 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _615);
    float _627 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _619 + _629;
    float _633 = _623 * _623;
    float _635 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _625);
    float _637 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[25].z, _627);
    float _639 = fma(_631, _631, _633);
    float _641 = _635 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _643 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _645 = sqrt(_639);
    float _647 = _641 + _643;
    bool _649 = _607 > 0.5;
    float _651 = -_563;
    int _653 = _649 ? as_type<int>(_651) : as_type<int>(_563);
    bool _655 = _609 > 0.5;
    bool _657 = !_555;
    float _659 = _657 ? _563 : as_type<float>(_653);
    bool _661 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _665 = _663 != 0;
    float _667 = _659 + 0.5;
    float _669 = -_545;
    int _671 = _655 ? as_type<int>(_669) : as_type<int>(_545);
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _675 = !_665;
    float _677 = _675 ? _545 : as_type<float>(_671);
    float _679 = _673 * _479;
    float _681 = _607;
    float _683 = _479;
    float _685 = _643;
    float _687 = _641;
    if (!_661)
    {
        _681 = _619;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_661)
    {
        _683 = _613;
    }
    float _693 = _683;
    float _695 = _693;
    if (!_661)
    {
        _685 = _647;
    }
    float _697 = _685;
    bool _699 = !_661;
    float _701 = _697;
    if (!_699)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _707 = _645 + _705;
        float _709 = rsqrt(_639);
        float _711 = _707 * _703;
        float _713 = _647 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _715 = _711 * 0.15915493667125701904296875;
        float _717 = _715 * 6.283185482025146484375;
        float _719 = cos(_717);
        float _721 = _715 * 6.283185482025146484375;
        float _723 = sin(_721);
        float _725 = _719 + (-1.0);
        float _727 = fma(_723, _713, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _729 = _725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _731 = _709 * _727;
        float _733 = fma(_647, _719, _729);
        float _735 = fma(_631, _731, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _737 = fma(_623, _731, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _701 = _733;
        _691 = _735;
        _695 = _737;
    }
    float _739 = _701;
    float _741 = _691;
    float _743 = _695;
    float _745 = -_641;
    float _747 = _745 + _739;
    float _749 = -_605;
    float _751 = _749 + _741;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _755 = -_599;
    float _757 = _755 + _743;
    float _759 = _747 * _747;
    float _761 = -_677;
    float _763 = _761 + 0.5;
    float _765 = fma(_751, _751, _759);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = fma(_757, _757, _765);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _773 = sqrt(_769);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _785 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _787 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _785 * _753;
    out.m_56.x = _789;
    out.m_56.y = _791;
    out.m_56.z = _793;
    out.m_56.w = _777;
    bool _801 = _773 > 0.0;
    out.m_58.x = _795;
    out.m_58.y = _797;
    out.m_58.z = _787;
    out.m_60.x = _679;
    out.m_60.y = _799;
    bool _803 = !_801;
    float _805 = _777;
    float _807 = _791;
    float _809 = _739;
    float _811 = _741;
    float _813 = _743;
    float _815 = _777;
    if (!_803)
    {
        bool _817 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _819 = _789;
        if (_817)
        {
            float _821 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _819 = _821;
        }
        float _823 = _819;
        float _825 = _823;
        if (_817)
        {
            float _827 = _419 * _823;
            _805 = _827;
        }
        float _829 = _805;
        float _831 = _829;
        if (_817)
        {
            float _833 = _421 * _823;
            _807 = _833;
        }
        float _835 = _807;
        float _837 = _835;
        if (_817)
        {
            float _839 = _423 * _823;
            _825 = _839;
        }
        float _841 = _825;
        float _843 = _841;
        float _845 = _841;
        if (!_817)
        {
            float _847 = _117 + 1.0;
            float _849 = _847;
            if (!_149)
            {
                float _851 = _847 * _847;
                float _853 = _851 * 0.5;
                _843 = _853;
            }
            float _855 = _843;
            float _857 = _855;
            if (!_149)
            {
                float _859 = _855 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _857 = _859;
            }
            float _861 = _857;
            bool _863 = !_149;
            float _865 = _861;
            if (!_863)
            {
                float _867 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _869 = log2(_867);
                float _871 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _873 = _871 + 1.0;
                float _875 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _877 = _869 * _847;
                float _879 = 1.0 / _873;
                float _881 = _875 * 0.693147182464599609375;
                float _883 = exp2(_877);
                float _885 = 1.0 / _881;
                float _887 = _883 + (-1.0);
                float _889 = -_887;
                float _891 = fma(_889, _885, _847);
                float _893 = _891 * _879;
                float _895 = _893 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _865 = _895;
            }
            float _897 = _865;
            float _899 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _901 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _905 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _907 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _909 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _911 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].y, _905);
            float _913 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].x, _907);
            float _915 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].y, _911);
            bool _917 = !_149;
            if (!_917)
            {
                float _919 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _921 = log2(_919);
                float _923 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _925 = _923 + 1.0;
                float _927 = 1.0 / _925;
                float _929 = _921 * _847;
                float _931 = exp2(_929);
                float _933 = -_931;
                float _935 = _933 + 1.0;
                float _937 = _935 * _927;
                _849 = _937;
            }
            float _939 = _849;
            float _941 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].z, _909);
            float _943 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].x, _913);
            float _945 = fma(_939, _153, _915);
            float _947 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].z, _941);
            float _949 = fma(_939, _151, _943);
            float _951 = -_381;
            float _953 = _951 + _945;
            float _955 = fma(_939, _155, _947);
            float _957 = -_387;
            float _959 = _957 + _949;
            float _961 = _953 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _963 = _953 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _965 = _953 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _967 = -_393;
            float _969 = _967 + _955;
            float _971 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[4].x, _961);
            float _973 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[5].x, _963);
            float _975 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[6].x, _965);
            float _977 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _971);
            float _979 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _973);
            float _981 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
            _427 = _979;
            _429 = _977;
            _431 = _981;
            _831 = _977;
            _837 = _979;
            _845 = _981;
        }
        float _983 = _427;
        float _985 = _429;
        float _987 = _431;
        float _989 = _831;
        float _991 = _837;
        float _993 = _845;
        float _995 = _983 * _983;
        float _997 = rsqrt(_769);
        float _999 = fma(_985, _985, _995);
        float _1001 = fma(_987, _987, _999);
        float _1003 = sqrt(_1001);
        float _1005 = _751 * _997;
        float _1007 = _747 * _997;
        float _1009 = _757 * _997;
        bool _1011 = _1003 > 0.0;
        bool _1013 = !_1011;
        _815 = _989;
        if (!_1013)
        {
            float _1015 = rsqrt(_1001);
            float _1017 = _1015 * _983;
            float _1019 = _1015 * _985;
            float _1021 = _1015 * _987;
            float _1023 = _1007 * _1017;
            float _1025 = fma(_1005, _1019, _1023);
            float _1027 = fma(_1009, _1021, _1025);
            float _1029 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1031 = fma(_989, _1029, _741);
            float _1033 = fma(_991, _1029, _739);
            float _1035 = fma(_993, _1029, _743);
            _809 = _1033;
            _811 = _1031;
            _813 = _1035;
        }
    }
    float _1037 = _809;
    float _1039 = _811;
    float _1041 = _813;
    float _1043 = _815;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = _1037 + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1039 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = _1041 + _1053;
    float _1057 = _1047 * _1047;
    float _1059 = fma(_1051, _1051, _1057);
    float _1061 = fma(_1055, _1055, _1059);
    float _1063 = rsqrt(_1061);
    float _1065 = sqrt(_1061);
    float _1067 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1069 = _1051 * _1067;
    float _1071 = _1055 * _1067;
    float _1073 = _1069 * _1069;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    bool _1081 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1079 + _1083;
    float _1087 = _1059;
    float _1089 = _1085;
    float _1091 = _1043;
    float _1093 = _1047;
    float _1095 = _1067;
    if (_1081)
    {
        float _1097 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1087 = _1097;
    }
    float _1099 = _1087;
    float _1101 = _1099;
    if (_1081)
    {
        float _1103 = _1085 * _1099;
        _1089 = _1103;
    }
    float _1105 = _1089;
    if (_1081)
    {
        float _1107 = rsqrt(_1077);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = _1109;
    if (_1081)
    {
        float _1113 = _1105 * 0.15915493667125701904296875;
        _1091 = _1113;
    }
    float _1115 = _1091;
    float _1117 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1119 = _1055;
    float _1121 = _1115;
    if (_1081)
    {
        float _1123 = _1115 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        _1119 = _1125;
    }
    float _1127 = _1119;
    float _1129 = precise::max(0.0, _1117);
    float _1131 = _1063;
    float _1133 = _1129;
    if (_1081)
    {
        float _1135 = _1115 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        _1131 = _1137;
    }
    float _1139 = _1131;
    float _1141 = -_1067;
    float _1143 = -_1129;
    float _1145 = fma(_1047, _1141, _1143);
    if (_1081)
    {
        float _1147 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1093 = _1147;
    }
    float _1149 = _1093;
    float _1151 = _1127;
    float _1153 = _1149;
    if (_1081)
    {
        float _1155 = fma(_1127, _1149, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1151 = _1155;
    }
    float _1157 = _1151;
    float _1159 = _1157;
    if (!_1081)
    {
        _1153 = _1145;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (_1081)
    {
        float _1165 = _1109 * _1157;
        _1095 = _1165;
    }
    float _1167 = _1095;
    if (!_1081)
    {
        _1111 = _1069;
    }
    float _1169 = _1111;
    float _1171 = _1169;
    float _1173 = _1139;
    if (_1081)
    {
        float _1175 = _1139 + (-1.0);
        _1133 = _1175;
    }
    float _1177 = _1133;
    float _1179 = _1177;
    if (_1081)
    {
        float _1181 = _1069 * _1167;
        _1171 = _1181;
    }
    float _1183 = _1171;
    if (!_1081)
    {
        _1159 = _1073;
    }
    float _1185 = _1159;
    float _1187 = _1185;
    if (_1081)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1189;
    }
    float _1191 = _1121;
    if (!_1081)
    {
        _1179 = _1071;
    }
    float _1193 = _1179;
    float _1195 = _1193;
    if (_1081)
    {
        float _1197 = _1071 * _1167;
        _1195 = _1197;
    }
    float _1199 = _1195;
    if (_1081)
    {
        float _1201 = _1183 * _1183;
        _1187 = _1201;
    }
    float _1203 = _1187;
    if (_1081)
    {
        float _1205 = fma(_1145, _1139, _1191);
        _1163 = _1205;
    }
    float _1207 = _1163;
    if (!_1081)
    {
        _1173 = _1075;
    }
    float _1209 = _1173;
    float _1211 = _1209;
    if (_1081)
    {
        float _1213 = _1199 * _1199;
        _1211 = _1213;
    }
    float _1215 = _1211;
    float _1217 = fma(_1207, _1207, _1203);
    float _1219 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1221 = _1217 + _1215;
    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1225 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1223);
    float _1227 = precise::clamp(_1225, 0.0, 1.0);
    float _1229 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1219);
    float _1231 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1233 = rsqrt(_1221);
    float _1235 = -_1227;
    float _1237 = _1235 + 1.0;
    float _1239 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1229);
    float _1241 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1243 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1231);
    float _1245 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1247 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1249 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1241);
    float _1251 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1243);
    float _1253 = abs(_1237);
    float _1255 = log2(_1253);
    float _1257 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1259 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1261 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1249);
    float _1263 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1265 = -_1257;
    float _1267 = fma(_1265, _1245, 1.0);
    float _1269 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1259);
    float _1271 = _1233 * _1183;
    float _1273 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1275 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1277 = _1233 * _1207;
    float _1279 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1281 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1269);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1275);
    float _1285 = _1233 * _1199;
    float _1287 = -_1279;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1287);
    float _1291 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1293 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1283);
    float _1295 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1297 = -_1285;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1289);
    float _1301 = log2(_1267);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1293);
    float _1305 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1307 = fma(_1299, -0.5, 0.5);
    float _1309 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1311 = fma(_1299, 0.5, 0.5);
    float _1313 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1305);
    float _1315 = _1277 + 1.0;
    float _1317 = exp2(_1295);
    float _1319 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1309);
    float _1321 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1313);
    float _1323 = fma(_1311, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1325 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1327 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1321);
    float _1329 = fma(_1311, _1323, -0.212114393711090087890625);
    float _1331 = 1.0 / _1303;
    float _1333 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1325);
    float _1335 = _1301 * 0.693147182464599609375;
    float _1337 = fma(_1311, _1329, 1.570728778839111328125);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1341 = sqrt(_1307);
    float _1343 = -_1277;
    float _1345 = fma(_1317, _1315, _1343);
    float _1347 = fma(_1345, 0.5, 0.5);
    float _1349 = _1327 * _1331;
    float _1351 = _1333 * _1331;
    float _1353 = fma(_1349, 0.5, 0.5);
    float _1355 = fma(_1351, -0.5, 0.5);
    float _1357 = _1341 * 0.636619746685028076171875;
    float3 _3716 = float3(_1353, _1355, _1339);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3716, float3(0.0), isnan(_3716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3716, float3(0.0), isnan(_3716)), level(0.0)).x;
    float3 _3727 = float3(_1353, _1355, _1339);
    float4 _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3727, float3(0.0), isnan(_3727)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3727, float3(0.0), isnan(_3727)), level(0.0)).xyzw;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = _1362.w;
    float _1372 = -_1337;
    float _1374 = fma(_1357, _1372, 1.0);
    float2 _3749 = float2(_1374, _1347);
    float3 _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3749, float2(0.0), isnan(_3749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3749, float2(0.0), isnan(_3749)), level(0.0)).xyz;
    float _1380 = _1378.x;
    float _1382 = _1378.y;
    float _1384 = _1378.z;
    float _1386 = _641 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1396 = _1392 || _1394;
    float _1398 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1400 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1386);
    float _1402 = _641 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1404 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1400);
    float _1406 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1402);
    float _1408 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1410 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1406);
    float _1412 = 1.0 / _1408;
    float _1414 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1416 = _1353;
    float _1418 = _1339;
    float _1420 = _1263;
    float _1422 = _1404;
    float _1424 = _1398;
    float _1426 = _1273;
    float _1428 = _1255;
    if (!_1396)
    {
        _1416 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1430 = _1416;
    if (!_1396)
    {
        _1418 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1432 = _1418;
    float _1434 = _1414 + _1408;
    if (_1396)
    {
        _1420 = 1.0;
    }
    float _1436 = _1420;
    float _1438 = _1436;
    if (!_1396)
    {
        float _1440 = -_1430;
        float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1422 = _1442;
    }
    float _1444 = _1422;
    float _1446 = _1444;
    if (!_1396)
    {
        float _1448 = -_1432;
        float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _687 = _1450;
    }
    float _1452 = _687;
    float _1454 = _1452;
    if (!_1396)
    {
        float _1456 = 1.0 / _1444;
        _1446 = _1456;
    }
    float _1458 = _1446;
    float _1460 = _1434 * _1412;
    float _1462 = _1460 * 0.5;
    float _1464 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1468 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
    if (!_1396)
    {
        float _1470 = 1.0 / _1452;
        _1454 = _1470;
    }
    float _1472 = _1454;
    float _1474 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1398);
    if (_1396)
    {
        _1424 = 1.0;
    }
    float _1476 = _1424;
    float _1478 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1480 = 1.0 / _1468;
    float _1482 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1478);
    float _1484 = _1482 + _1303;
    float _1486 = exp2(_1464);
    float _1488 = _1476;
    if (!_1396)
    {
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1492 = -_1430;
        float _1494 = fma(_1480, _1490, _1492);
        _1426 = _1494;
    }
    float _1496 = _1426;
    float _1498 = _1496;
    if (!_1396)
    {
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1502 = -_1432;
        float _1504 = fma(_1480, _1500, _1502);
        _1428 = _1504;
    }
    float _1506 = _1428;
    float _1508 = _1484 * 0.5;
    if (!_1396)
    {
        float _1510 = _1496 * _1458;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1498 = _1512;
    }
    float _1514 = _1498;
    if (!_1396)
    {
        float _1516 = _1506 * _1472;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1438 = _1518;
    }
    float _1520 = _1438;
    float _1522 = -_1486;
    float _1524 = _1522 + 1.0;
    if (!_1396)
    {
        float _1526 = -_1514;
        float _1528 = _1526 + 1.0;
        _1488 = _1528;
    }
    float _1530 = _1488;
    bool _1532 = _1520 > 0.0;
    bool _1534 = isnan(_1520);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan(0.0);
    bool _1540 = _1536 || _1538;
    out.m_62.z = _1508;
    out.m_62.w = _1303;
    float _1542 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1544 = _1520 * _1530;
    bool _1546 = _1530 <= 0.0;
    bool _1548 = !_1540;
    bool _1550 = _1546 || _1548;
    float _1552 = -_1542;
    float _1554 = _1552 + 1.0;
    float _1556 = _1544 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1558 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1327;
    out.gl_Position.y = _1333;
    out.gl_Position.z = _1482;
    out.gl_Position.w = _1303;
    out.m_45.x = _1558;
    float _1560 = _1542 * _1359;
    float _1562 = _1370 * _1554;
    float _1564 = _1370 * _1560;
    float _1566 = _1384 * _1560;
    float _1568 = fma(_1380, _1564, _1364);
    float _1570 = fma(_1382, _1564, _1366);
    float _1572 = fma(_1370, _1566, _1368);
    out.m_64.x = _1568;
    out.m_64.y = _1570;
    out.m_64.z = _1572;
    out.m_64.w = _1562;
    if (!_1550)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1574 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1574;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _451 = false;
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
        float _1631 = as_type<float>(_99);
        out.gl_Position.z = _1631;
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
        float _1700 = as_type<float>(_135);
        out.gl_Position.z = _1700;
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
    float _183 = 0.0;
    if (!_179)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _139 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _139);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _213;
        _183 = _191;
    }
    float _215 = _181;
    float _217 = _183;
    float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _221 = !_149;
    float _223 = _217;
    float _225 = _215;
    if (!_221)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _139 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _223 = _235;
        _165 = _245;
    }
    float _247 = _223;
    float _249 = _165;
    float _251 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _253 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _255 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _259 = _247;
    float _261 = _249;
    if (!_149)
    {
        float _263 = _117 * _117;
        float _265 = _263 * 0.5;
        _259 = _265;
    }
    float _267 = _259;
    float _269 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].x, _251);
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].y, _253);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].z, _257);
    float _275 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_149)
    {
        float _277 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _277;
    }
    float _279 = _225;
    bool _281 = !_149;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _117 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _117);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].x, _269);
    float _321 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].y, _271);
    float _323 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _327 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _329 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _331 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].z, _273);
    float _333 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].x, _325);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].y, _327);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].z, _329);
    float _339 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_249, _151, _319);
    float _343 = fma(_249, _153, _321);
    float _345 = fma(_249, _155, _331);
    float _347 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _333);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].y, _335);
    float _351 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].z, _337);
    if (!_149)
    {
        _261 = _117;
    }
    float _353 = _261;
    bool _355 = !_149;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = 1.0 / _365;
        float _369 = _117 * _361;
        float _371 = exp2(_369);
        float _373 = -_371;
        float _375 = _373 + 1.0;
        float _377 = _375 * _367;
        _357 = _377;
    }
    float _379 = _357;
    float _381 = fma(_379, _153, _349);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_343, _137, _159);
    float _387 = fma(_379, _151, _347);
    float _389 = -_381;
    float _391 = _343 + _389;
    float _393 = fma(_379, _155, _351);
    float _395 = fma(_341, _137, _157);
    float _397 = -_387;
    float _399 = _341 + _397;
    float _401 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _403 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = -_393;
    float _409 = _345 + _407;
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _417 = fma(_345, _137, _161);
    float _419 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _411);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _413);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    bool _425 = !_383;
    float _427 = _421;
    float _429 = _419;
    float _431 = _423;
    float _449;
    if (!_425)
    {
        float _433 = in.m_51.x;
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _437 = _433 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_83);
        float _455 = 1.0 / _453;
        float _457 = _117 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = as_type<float>(int(gl_VertexIndex));
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _465 = _459 + _463;
    bool _467 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _469 = isnan(_459);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _481;
    float _485 = -_477;
    float _487 = _485 + 1.0;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _501;
    float _505 = 1.0 / _483;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _507;
    float _511 = _499 * _487;
    float _513 = -_499;
    float _515 = _513 + 1.0;
    int _517 = as_type<int>(_461) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_461) & 2;
    bool _523 = _521 != 0;
    float _525 = _465 * _505;
    float _527 = in.m_49.x;
    float _529 = in.m_49.y;
    float _531 = fma(_503, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _533 = fma(_509, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _535 = _531 * _511;
    float _537 = _533 * _511;
    float _539 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].y, _535);
    float _541 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].x, _537);
    bool _543 = !_523;
    float _545 = _543 ? (-0.5) : 0.5;
    float _547 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _549 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[144].y, _539);
    float _551 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[144].x, _541);
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _555 = _553 != 0;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _545);
    float _559 = _549 * _529;
    bool _561 = !_519;
    float _563 = _561 ? (-0.5) : 0.5;
    float _565 = _551 * _527;
    float _567 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _563);
    float _571 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _573 = _567 * _557;
    float _575 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _577 = _571 * _569;
    float _579 = _573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _581 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _575);
    float _585 = _573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _579);
    float _589 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _585);
    float _595 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[26].z, _587);
    float _597 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = _591 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _601 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[24].z, _593);
    float _603 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = in.m_51.x;
    float _609 = in.m_51.y;
    float _611 = _601 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _613 = _599 + _603;
    float _615 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _617 = _573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _619 = _605 + _611;
    float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _623 = _613 + _621;
    float _625 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _615);
    float _627 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _619 + _629;
    float _633 = _623 * _623;
    float _635 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _625);
    float _637 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[25].z, _627);
    float _639 = fma(_631, _631, _633);
    float _641 = _635 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _643 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _645 = sqrt(_639);
    float _647 = _641 + _643;
    bool _649 = _607 > 0.5;
    float _651 = -_563;
    int _653 = _649 ? as_type<int>(_651) : as_type<int>(_563);
    bool _655 = _609 > 0.5;
    bool _657 = !_555;
    float _659 = _657 ? _563 : as_type<float>(_653);
    bool _661 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _665 = _663 != 0;
    float _667 = _659 + 0.5;
    float _669 = -_545;
    int _671 = _655 ? as_type<int>(_669) : as_type<int>(_545);
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _675 = !_665;
    float _677 = _675 ? _545 : as_type<float>(_671);
    float _679 = _673 * _479;
    float _681 = _607;
    float _683 = _479;
    float _685 = _643;
    float _687 = _641;
    if (!_661)
    {
        _681 = _619;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_661)
    {
        _683 = _613;
    }
    float _693 = _683;
    float _695 = _693;
    if (!_661)
    {
        _685 = _647;
    }
    float _697 = _685;
    bool _699 = !_661;
    float _701 = _697;
    if (!_699)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _707 = _645 + _705;
        float _709 = rsqrt(_639);
        float _711 = _707 * _703;
        float _713 = _647 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _715 = _711 * 0.15915493667125701904296875;
        float _717 = _715 * 6.283185482025146484375;
        float _719 = cos(_717);
        float _721 = _715 * 6.283185482025146484375;
        float _723 = sin(_721);
        float _725 = _719 + (-1.0);
        float _727 = fma(_723, _713, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _729 = _725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _731 = _709 * _727;
        float _733 = fma(_647, _719, _729);
        float _735 = fma(_631, _731, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _737 = fma(_623, _731, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _701 = _733;
        _691 = _735;
        _695 = _737;
    }
    float _739 = _701;
    float _741 = _691;
    float _743 = _695;
    float _745 = -_641;
    float _747 = _745 + _739;
    float _749 = -_605;
    float _751 = _749 + _741;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _755 = -_599;
    float _757 = _755 + _743;
    float _759 = _747 * _747;
    float _761 = -_677;
    float _763 = _761 + 0.5;
    float _765 = fma(_751, _751, _759);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = fma(_757, _757, _765);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _773 = sqrt(_769);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _785 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _787 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _785 * _753;
    out.m_56.x = _789;
    out.m_56.y = _791;
    out.m_56.z = _793;
    out.m_56.w = _777;
    bool _801 = _773 > 0.0;
    out.m_58.x = _795;
    out.m_58.y = _797;
    out.m_58.z = _787;
    out.m_60.x = _679;
    out.m_60.y = _799;
    bool _803 = !_801;
    float _805 = _777;
    float _807 = _791;
    float _809 = _739;
    float _811 = _741;
    float _813 = _743;
    float _815 = _777;
    if (!_803)
    {
        bool _817 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _819 = _789;
        if (_817)
        {
            float _821 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _819 = _821;
        }
        float _823 = _819;
        float _825 = _823;
        if (_817)
        {
            float _827 = _419 * _823;
            _805 = _827;
        }
        float _829 = _805;
        float _831 = _829;
        if (_817)
        {
            float _833 = _421 * _823;
            _807 = _833;
        }
        float _835 = _807;
        float _837 = _835;
        if (_817)
        {
            float _839 = _423 * _823;
            _825 = _839;
        }
        float _841 = _825;
        float _843 = _841;
        float _845 = _841;
        if (!_817)
        {
            float _847 = _117 + 1.0;
            float _849 = _847;
            if (!_149)
            {
                float _851 = _847 * _847;
                float _853 = _851 * 0.5;
                _843 = _853;
            }
            float _855 = _843;
            float _857 = _855;
            if (!_149)
            {
                float _859 = _855 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _857 = _859;
            }
            float _861 = _857;
            bool _863 = !_149;
            float _865 = _861;
            if (!_863)
            {
                float _867 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _869 = log2(_867);
                float _871 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _873 = _871 + 1.0;
                float _875 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _877 = _869 * _847;
                float _879 = 1.0 / _873;
                float _881 = _875 * 0.693147182464599609375;
                float _883 = exp2(_877);
                float _885 = 1.0 / _881;
                float _887 = _883 + (-1.0);
                float _889 = -_887;
                float _891 = fma(_889, _885, _847);
                float _893 = _891 * _879;
                float _895 = _893 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _865 = _895;
            }
            float _897 = _865;
            float _899 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _901 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _905 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _907 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _909 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _911 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].y, _905);
            float _913 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].x, _907);
            float _915 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].y, _911);
            bool _917 = !_149;
            if (!_917)
            {
                float _919 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _921 = log2(_919);
                float _923 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _925 = _923 + 1.0;
                float _927 = 1.0 / _925;
                float _929 = _921 * _847;
                float _931 = exp2(_929);
                float _933 = -_931;
                float _935 = _933 + 1.0;
                float _937 = _935 * _927;
                _849 = _937;
            }
            float _939 = _849;
            float _941 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].z, _909);
            float _943 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].x, _913);
            float _945 = fma(_939, _153, _915);
            float _947 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].z, _941);
            float _949 = fma(_939, _151, _943);
            float _951 = -_381;
            float _953 = _951 + _945;
            float _955 = fma(_939, _155, _947);
            float _957 = -_387;
            float _959 = _957 + _949;
            float _961 = _953 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _963 = _953 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _965 = _953 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _967 = -_393;
            float _969 = _967 + _955;
            float _971 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[4].x, _961);
            float _973 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[5].x, _963);
            float _975 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[6].x, _965);
            float _977 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _971);
            float _979 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _973);
            float _981 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
            _427 = _979;
            _429 = _977;
            _431 = _981;
            _831 = _977;
            _837 = _979;
            _845 = _981;
        }
        float _983 = _427;
        float _985 = _429;
        float _987 = _431;
        float _989 = _831;
        float _991 = _837;
        float _993 = _845;
        float _995 = _983 * _983;
        float _997 = rsqrt(_769);
        float _999 = fma(_985, _985, _995);
        float _1001 = fma(_987, _987, _999);
        float _1003 = sqrt(_1001);
        float _1005 = _751 * _997;
        float _1007 = _747 * _997;
        float _1009 = _757 * _997;
        bool _1011 = _1003 > 0.0;
        bool _1013 = !_1011;
        _815 = _989;
        if (!_1013)
        {
            float _1015 = rsqrt(_1001);
            float _1017 = _1015 * _983;
            float _1019 = _1015 * _985;
            float _1021 = _1015 * _987;
            float _1023 = _1007 * _1017;
            float _1025 = fma(_1005, _1019, _1023);
            float _1027 = fma(_1009, _1021, _1025);
            float _1029 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1031 = fma(_989, _1029, _741);
            float _1033 = fma(_991, _1029, _739);
            float _1035 = fma(_993, _1029, _743);
            _809 = _1033;
            _811 = _1031;
            _813 = _1035;
        }
    }
    float _1037 = _809;
    float _1039 = _811;
    float _1041 = _813;
    float _1043 = _815;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = _1037 + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1039 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = _1041 + _1053;
    float _1057 = _1047 * _1047;
    float _1059 = fma(_1051, _1051, _1057);
    float _1061 = fma(_1055, _1055, _1059);
    float _1063 = rsqrt(_1061);
    float _1065 = sqrt(_1061);
    float _1067 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1069 = _1051 * _1067;
    float _1071 = _1055 * _1067;
    float _1073 = _1069 * _1069;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    bool _1081 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1079 + _1083;
    float _1087 = _1059;
    float _1089 = _1085;
    float _1091 = _1043;
    float _1093 = _1047;
    float _1095 = _1067;
    if (_1081)
    {
        float _1097 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1087 = _1097;
    }
    float _1099 = _1087;
    float _1101 = _1099;
    if (_1081)
    {
        float _1103 = _1085 * _1099;
        _1089 = _1103;
    }
    float _1105 = _1089;
    if (_1081)
    {
        float _1107 = rsqrt(_1077);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = _1109;
    if (_1081)
    {
        float _1113 = _1105 * 0.15915493667125701904296875;
        _1091 = _1113;
    }
    float _1115 = _1091;
    float _1117 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1119 = _1055;
    float _1121 = _1115;
    if (_1081)
    {
        float _1123 = _1115 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        _1119 = _1125;
    }
    float _1127 = _1119;
    float _1129 = precise::max(0.0, _1117);
    float _1131 = _1063;
    float _1133 = _1129;
    if (_1081)
    {
        float _1135 = _1115 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        _1131 = _1137;
    }
    float _1139 = _1131;
    float _1141 = -_1067;
    float _1143 = -_1129;
    float _1145 = fma(_1047, _1141, _1143);
    if (_1081)
    {
        float _1147 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1093 = _1147;
    }
    float _1149 = _1093;
    float _1151 = _1127;
    float _1153 = _1149;
    if (_1081)
    {
        float _1155 = fma(_1127, _1149, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1151 = _1155;
    }
    float _1157 = _1151;
    float _1159 = _1157;
    if (!_1081)
    {
        _1153 = _1145;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (_1081)
    {
        float _1165 = _1109 * _1157;
        _1095 = _1165;
    }
    float _1167 = _1095;
    if (!_1081)
    {
        _1111 = _1069;
    }
    float _1169 = _1111;
    float _1171 = _1169;
    float _1173 = _1139;
    if (_1081)
    {
        float _1175 = _1139 + (-1.0);
        _1133 = _1175;
    }
    float _1177 = _1133;
    float _1179 = _1177;
    if (_1081)
    {
        float _1181 = _1069 * _1167;
        _1171 = _1181;
    }
    float _1183 = _1171;
    if (!_1081)
    {
        _1159 = _1073;
    }
    float _1185 = _1159;
    float _1187 = _1185;
    if (_1081)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1189;
    }
    float _1191 = _1121;
    if (!_1081)
    {
        _1179 = _1071;
    }
    float _1193 = _1179;
    float _1195 = _1193;
    if (_1081)
    {
        float _1197 = _1071 * _1167;
        _1195 = _1197;
    }
    float _1199 = _1195;
    if (_1081)
    {
        float _1201 = _1183 * _1183;
        _1187 = _1201;
    }
    float _1203 = _1187;
    if (_1081)
    {
        float _1205 = fma(_1145, _1139, _1191);
        _1163 = _1205;
    }
    float _1207 = _1163;
    if (!_1081)
    {
        _1173 = _1075;
    }
    float _1209 = _1173;
    float _1211 = _1209;
    if (_1081)
    {
        float _1213 = _1199 * _1199;
        _1211 = _1213;
    }
    float _1215 = _1211;
    float _1217 = fma(_1207, _1207, _1203);
    float _1219 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1221 = _1217 + _1215;
    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1225 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1223);
    float _1227 = precise::clamp(_1225, 0.0, 1.0);
    float _1229 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1219);
    float _1231 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1233 = rsqrt(_1221);
    float _1235 = -_1227;
    float _1237 = _1235 + 1.0;
    float _1239 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1229);
    float _1241 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1243 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1231);
    float _1245 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1247 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1249 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1241);
    float _1251 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1243);
    float _1253 = abs(_1237);
    float _1255 = log2(_1253);
    float _1257 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1259 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1261 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1249);
    float _1263 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1265 = -_1257;
    float _1267 = fma(_1265, _1245, 1.0);
    float _1269 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1259);
    float _1271 = _1233 * _1183;
    float _1273 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1275 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1277 = _1233 * _1207;
    float _1279 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1281 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1269);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1275);
    float _1285 = _1233 * _1199;
    float _1287 = -_1279;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1287);
    float _1291 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1293 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1283);
    float _1295 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1297 = -_1285;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1289);
    float _1301 = log2(_1267);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1293);
    float _1305 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1307 = fma(_1299, -0.5, 0.5);
    float _1309 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1311 = fma(_1299, 0.5, 0.5);
    float _1313 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1305);
    float _1315 = _1277 + 1.0;
    float _1317 = exp2(_1295);
    float _1319 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1309);
    float _1321 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1313);
    float _1323 = fma(_1311, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1325 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1327 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1321);
    float _1329 = fma(_1311, _1323, -0.212114393711090087890625);
    float _1331 = 1.0 / _1303;
    float _1333 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1325);
    float _1335 = _1301 * 0.693147182464599609375;
    float _1337 = fma(_1311, _1329, 1.570728778839111328125);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1341 = sqrt(_1307);
    float _1343 = -_1277;
    float _1345 = fma(_1317, _1315, _1343);
    float _1347 = fma(_1345, 0.5, 0.5);
    float _1349 = _1327 * _1331;
    float _1351 = _1333 * _1331;
    float _1353 = fma(_1349, 0.5, 0.5);
    float _1355 = fma(_1351, -0.5, 0.5);
    float _1357 = _1341 * 0.636619746685028076171875;
    float3 _3716 = float3(_1353, _1355, _1339);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3716, float3(0.0), isnan(_3716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3716, float3(0.0), isnan(_3716)), level(0.0)).x;
    float3 _3727 = float3(_1353, _1355, _1339);
    float4 _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3727, float3(0.0), isnan(_3727)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3727, float3(0.0), isnan(_3727)), level(0.0)).xyzw;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = _1362.w;
    float _1372 = -_1337;
    float _1374 = fma(_1357, _1372, 1.0);
    float2 _3749 = float2(_1374, _1347);
    float3 _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3749, float2(0.0), isnan(_3749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3749, float2(0.0), isnan(_3749)), level(0.0)).xyz;
    float _1380 = _1378.x;
    float _1382 = _1378.y;
    float _1384 = _1378.z;
    float _1386 = _641 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1396 = _1392 || _1394;
    float _1398 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1400 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1386);
    float _1402 = _641 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1404 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1400);
    float _1406 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1402);
    float _1408 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1410 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1406);
    float _1412 = 1.0 / _1408;
    float _1414 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1416 = _1353;
    float _1418 = _1339;
    float _1420 = _1263;
    float _1422 = _1404;
    float _1424 = _1398;
    float _1426 = _1273;
    float _1428 = _1255;
    if (!_1396)
    {
        _1416 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1430 = _1416;
    if (!_1396)
    {
        _1418 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1432 = _1418;
    float _1434 = _1414 + _1408;
    if (_1396)
    {
        _1420 = 1.0;
    }
    float _1436 = _1420;
    float _1438 = _1436;
    if (!_1396)
    {
        float _1440 = -_1430;
        float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1422 = _1442;
    }
    float _1444 = _1422;
    float _1446 = _1444;
    if (!_1396)
    {
        float _1448 = -_1432;
        float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _687 = _1450;
    }
    float _1452 = _687;
    float _1454 = _1452;
    if (!_1396)
    {
        float _1456 = 1.0 / _1444;
        _1446 = _1456;
    }
    float _1458 = _1446;
    float _1460 = _1434 * _1412;
    float _1462 = _1460 * 0.5;
    float _1464 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1468 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
    if (!_1396)
    {
        float _1470 = 1.0 / _1452;
        _1454 = _1470;
    }
    float _1472 = _1454;
    float _1474 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1398);
    if (_1396)
    {
        _1424 = 1.0;
    }
    float _1476 = _1424;
    float _1478 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1480 = 1.0 / _1468;
    float _1482 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1478);
    float _1484 = _1482 + _1303;
    float _1486 = exp2(_1464);
    float _1488 = _1476;
    if (!_1396)
    {
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1492 = -_1430;
        float _1494 = fma(_1480, _1490, _1492);
        _1426 = _1494;
    }
    float _1496 = _1426;
    float _1498 = _1496;
    if (!_1396)
    {
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1502 = -_1432;
        float _1504 = fma(_1480, _1500, _1502);
        _1428 = _1504;
    }
    float _1506 = _1428;
    float _1508 = _1484 * 0.5;
    if (!_1396)
    {
        float _1510 = _1496 * _1458;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1498 = _1512;
    }
    float _1514 = _1498;
    if (!_1396)
    {
        float _1516 = _1506 * _1472;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1438 = _1518;
    }
    float _1520 = _1438;
    float _1522 = -_1486;
    float _1524 = _1522 + 1.0;
    if (!_1396)
    {
        float _1526 = -_1514;
        float _1528 = _1526 + 1.0;
        _1488 = _1528;
    }
    float _1530 = _1488;
    bool _1532 = _1520 > 0.0;
    bool _1534 = isnan(_1520);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan(0.0);
    bool _1540 = _1536 || _1538;
    out.m_62.z = _1508;
    out.m_62.w = _1303;
    float _1542 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1544 = _1520 * _1530;
    bool _1546 = _1530 <= 0.0;
    bool _1548 = !_1540;
    bool _1550 = _1546 || _1548;
    float _1552 = -_1542;
    float _1554 = _1552 + 1.0;
    float _1556 = _1544 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1558 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1327;
    out.gl_Position.y = _1333;
    out.gl_Position.z = _1482;
    out.gl_Position.w = _1303;
    out.m_45.x = _1558;
    float _1560 = _1542 * _1359;
    float _1562 = _1370 * _1554;
    float _1564 = _1370 * _1560;
    float _1566 = _1384 * _1560;
    float _1568 = fma(_1380, _1564, _1364);
    float _1570 = fma(_1382, _1564, _1366);
    float _1572 = fma(_1370, _1566, _1368);
    out.m_64.x = _1568;
    out.m_64.y = _1570;
    out.m_64.z = _1572;
    out.m_64.w = _1562;
    if (!_1550)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1574 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1574;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _451 = false;
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
        float _1631 = as_type<float>(_99);
        out.gl_Position.z = _1631;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1700 = as_type<float>(_135);
        out.gl_Position.z = _1700;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _183 = 0.0;
    if (!_179)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _139 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _139);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _213;
        _183 = _191;
    }
    float _215 = _181;
    float _217 = _183;
    float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _221 = !_149;
    float _223 = _217;
    float _225 = _215;
    if (!_221)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _139 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _223 = _235;
        _165 = _245;
    }
    float _247 = _223;
    float _249 = _165;
    float _251 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _253 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _255 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _259 = _247;
    float _261 = _249;
    if (!_149)
    {
        float _263 = _117 * _117;
        float _265 = _263 * 0.5;
        _259 = _265;
    }
    float _267 = _259;
    float _269 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].x, _251);
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].y, _253);
    float _273 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[8].z, _257);
    float _275 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_149)
    {
        float _277 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _277;
    }
    float _279 = _225;
    bool _281 = !_149;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _117 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _117);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].x, _269);
    float _321 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].y, _271);
    float _323 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _327 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _329 = _317 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _331 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[10].z, _273);
    float _333 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].x, _325);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].y, _327);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[8].z, _329);
    float _339 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_249, _151, _319);
    float _343 = fma(_249, _153, _321);
    float _345 = fma(_249, _155, _331);
    float _347 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _333);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].y, _335);
    float _351 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].z, _337);
    if (!_149)
    {
        _261 = _117;
    }
    float _353 = _261;
    bool _355 = !_149;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = 1.0 / _365;
        float _369 = _117 * _361;
        float _371 = exp2(_369);
        float _373 = -_371;
        float _375 = _373 + 1.0;
        float _377 = _375 * _367;
        _357 = _377;
    }
    float _379 = _357;
    float _381 = fma(_379, _153, _349);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_343, _137, _159);
    float _387 = fma(_379, _151, _347);
    float _389 = -_381;
    float _391 = _343 + _389;
    float _393 = fma(_379, _155, _351);
    float _395 = fma(_341, _137, _157);
    float _397 = -_387;
    float _399 = _341 + _397;
    float _401 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _403 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = -_393;
    float _409 = _345 + _407;
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _417 = fma(_345, _137, _161);
    float _419 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _411);
    float _421 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _413);
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    bool _425 = !_383;
    float _427 = _421;
    float _429 = _419;
    float _431 = _423;
    float _449;
    if (!_425)
    {
        float _433 = in.m_51.x;
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _437 = _433 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_83);
        float _455 = 1.0 / _453;
        float _457 = _117 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = as_type<float>(int(gl_VertexIndex));
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _465 = _459 + _463;
    bool _467 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _469 = isnan(_459);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _481;
    float _485 = -_477;
    float _487 = _485 + 1.0;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _501;
    float _505 = 1.0 / _483;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _507;
    float _511 = _499 * _487;
    float _513 = -_499;
    float _515 = _513 + 1.0;
    int _517 = as_type<int>(_461) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_461) & 2;
    bool _523 = _521 != 0;
    float _525 = _465 * _505;
    float _527 = in.m_49.x;
    float _529 = in.m_49.y;
    float _531 = fma(_503, _525, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _533 = fma(_509, _525, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _535 = _531 * _511;
    float _537 = _533 * _511;
    float _539 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].y, _535);
    float _541 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[143].x, _537);
    bool _543 = !_523;
    float _545 = _543 ? (-0.5) : 0.5;
    float _547 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _549 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[144].y, _539);
    float _551 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[144].x, _541);
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _555 = _553 != 0;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _545);
    float _559 = _549 * _529;
    bool _561 = !_519;
    float _563 = _561 ? (-0.5) : 0.5;
    float _565 = _551 * _527;
    float _567 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _563);
    float _571 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _573 = _567 * _557;
    float _575 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _577 = _571 * _569;
    float _579 = _573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _581 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _575);
    float _585 = _573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _587 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _579);
    float _589 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _585);
    float _595 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[26].z, _587);
    float _597 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = _591 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _601 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[24].z, _593);
    float _603 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = in.m_51.x;
    float _609 = in.m_51.y;
    float _611 = _601 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _613 = _599 + _603;
    float _615 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _617 = _573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _619 = _605 + _611;
    float _621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _623 = _613 + _621;
    float _625 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _615);
    float _627 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _619 + _629;
    float _633 = _623 * _623;
    float _635 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _625);
    float _637 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[25].z, _627);
    float _639 = fma(_631, _631, _633);
    float _641 = _635 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _643 = _637 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _645 = sqrt(_639);
    float _647 = _641 + _643;
    bool _649 = _607 > 0.5;
    float _651 = -_563;
    int _653 = _649 ? as_type<int>(_651) : as_type<int>(_563);
    bool _655 = _609 > 0.5;
    bool _657 = !_555;
    float _659 = _657 ? _563 : as_type<float>(_653);
    bool _661 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _665 = _663 != 0;
    float _667 = _659 + 0.5;
    float _669 = -_545;
    int _671 = _655 ? as_type<int>(_669) : as_type<int>(_545);
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _675 = !_665;
    float _677 = _675 ? _545 : as_type<float>(_671);
    float _679 = _673 * _479;
    float _681 = _607;
    float _683 = _479;
    float _685 = _643;
    float _687 = _641;
    if (!_661)
    {
        _681 = _619;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_661)
    {
        _683 = _613;
    }
    float _693 = _683;
    float _695 = _693;
    if (!_661)
    {
        _685 = _647;
    }
    float _697 = _685;
    bool _699 = !_661;
    float _701 = _697;
    if (!_699)
    {
        float _703 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _707 = _645 + _705;
        float _709 = rsqrt(_639);
        float _711 = _707 * _703;
        float _713 = _647 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _715 = _711 * 0.15915493667125701904296875;
        float _717 = _715 * 6.283185482025146484375;
        float _719 = cos(_717);
        float _721 = _715 * 6.283185482025146484375;
        float _723 = sin(_721);
        float _725 = _719 + (-1.0);
        float _727 = fma(_723, _713, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _729 = _725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _731 = _709 * _727;
        float _733 = fma(_647, _719, _729);
        float _735 = fma(_631, _731, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _737 = fma(_623, _731, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _701 = _733;
        _691 = _735;
        _695 = _737;
    }
    float _739 = _701;
    float _741 = _691;
    float _743 = _695;
    float _745 = -_641;
    float _747 = _745 + _739;
    float _749 = -_605;
    float _751 = _749 + _741;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _755 = -_599;
    float _757 = _755 + _743;
    float _759 = _747 * _747;
    float _761 = -_677;
    float _763 = _761 + 0.5;
    float _765 = fma(_751, _751, _759);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = fma(_757, _757, _765);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _773 = sqrt(_769);
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _785 = _763 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _787 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _791 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _785 * _753;
    out.m_56.x = _789;
    out.m_56.y = _791;
    out.m_56.z = _793;
    out.m_56.w = _777;
    bool _801 = _773 > 0.0;
    out.m_58.x = _795;
    out.m_58.y = _797;
    out.m_58.z = _787;
    out.m_60.x = _679;
    out.m_60.y = _799;
    bool _803 = !_801;
    float _805 = _777;
    float _807 = _791;
    float _809 = _739;
    float _811 = _741;
    float _813 = _743;
    float _815 = _777;
    if (!_803)
    {
        bool _817 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _819 = _789;
        if (_817)
        {
            float _821 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _819 = _821;
        }
        float _823 = _819;
        float _825 = _823;
        if (_817)
        {
            float _827 = _419 * _823;
            _805 = _827;
        }
        float _829 = _805;
        float _831 = _829;
        if (_817)
        {
            float _833 = _421 * _823;
            _807 = _833;
        }
        float _835 = _807;
        float _837 = _835;
        if (_817)
        {
            float _839 = _423 * _823;
            _825 = _839;
        }
        float _841 = _825;
        float _843 = _841;
        float _845 = _841;
        if (!_817)
        {
            float _847 = _117 + 1.0;
            float _849 = _847;
            if (!_149)
            {
                float _851 = _847 * _847;
                float _853 = _851 * 0.5;
                _843 = _853;
            }
            float _855 = _843;
            float _857 = _855;
            if (!_149)
            {
                float _859 = _855 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _857 = _859;
            }
            float _861 = _857;
            bool _863 = !_149;
            float _865 = _861;
            if (!_863)
            {
                float _867 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _869 = log2(_867);
                float _871 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _873 = _871 + 1.0;
                float _875 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _877 = _869 * _847;
                float _879 = 1.0 / _873;
                float _881 = _875 * 0.693147182464599609375;
                float _883 = exp2(_877);
                float _885 = 1.0 / _881;
                float _887 = _883 + (-1.0);
                float _889 = -_887;
                float _891 = fma(_889, _885, _847);
                float _893 = _891 * _879;
                float _895 = _893 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _865 = _895;
            }
            float _897 = _865;
            float _899 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _901 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _905 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _907 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _909 = _899 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _911 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].y, _905);
            float _913 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].x, _907);
            float _915 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].y, _911);
            bool _917 = !_149;
            if (!_917)
            {
                float _919 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _921 = log2(_919);
                float _923 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _925 = _923 + 1.0;
                float _927 = 1.0 / _925;
                float _929 = _921 * _847;
                float _931 = exp2(_929);
                float _933 = -_931;
                float _935 = _933 + 1.0;
                float _937 = _935 * _927;
                _849 = _937;
            }
            float _939 = _849;
            float _941 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[8].z, _909);
            float _943 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].x, _913);
            float _945 = fma(_939, _153, _915);
            float _947 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[10].z, _941);
            float _949 = fma(_939, _151, _943);
            float _951 = -_381;
            float _953 = _951 + _945;
            float _955 = fma(_939, _155, _947);
            float _957 = -_387;
            float _959 = _957 + _949;
            float _961 = _953 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _963 = _953 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _965 = _953 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _967 = -_393;
            float _969 = _967 + _955;
            float _971 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[4].x, _961);
            float _973 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[5].x, _963);
            float _975 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[6].x, _965);
            float _977 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _971);
            float _979 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _973);
            float _981 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
            _427 = _979;
            _429 = _977;
            _431 = _981;
            _831 = _977;
            _837 = _979;
            _845 = _981;
        }
        float _983 = _427;
        float _985 = _429;
        float _987 = _431;
        float _989 = _831;
        float _991 = _837;
        float _993 = _845;
        float _995 = _983 * _983;
        float _997 = rsqrt(_769);
        float _999 = fma(_985, _985, _995);
        float _1001 = fma(_987, _987, _999);
        float _1003 = sqrt(_1001);
        float _1005 = _751 * _997;
        float _1007 = _747 * _997;
        float _1009 = _757 * _997;
        bool _1011 = _1003 > 0.0;
        bool _1013 = !_1011;
        _815 = _989;
        if (!_1013)
        {
            float _1015 = rsqrt(_1001);
            float _1017 = _1015 * _983;
            float _1019 = _1015 * _985;
            float _1021 = _1015 * _987;
            float _1023 = _1007 * _1017;
            float _1025 = fma(_1005, _1019, _1023);
            float _1027 = fma(_1009, _1021, _1025);
            float _1029 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1031 = fma(_989, _1029, _741);
            float _1033 = fma(_991, _1029, _739);
            float _1035 = fma(_993, _1029, _743);
            _809 = _1033;
            _811 = _1031;
            _813 = _1035;
        }
    }
    float _1037 = _809;
    float _1039 = _811;
    float _1041 = _813;
    float _1043 = _815;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = _1037 + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1039 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = _1041 + _1053;
    float _1057 = _1047 * _1047;
    float _1059 = fma(_1051, _1051, _1057);
    float _1061 = fma(_1055, _1055, _1059);
    float _1063 = rsqrt(_1061);
    float _1065 = sqrt(_1061);
    float _1067 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1069 = _1051 * _1067;
    float _1071 = _1055 * _1067;
    float _1073 = _1069 * _1069;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    bool _1081 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1079 + _1083;
    float _1087 = _1059;
    float _1089 = _1085;
    float _1091 = _1043;
    float _1093 = _1047;
    float _1095 = _1067;
    if (_1081)
    {
        float _1097 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1087 = _1097;
    }
    float _1099 = _1087;
    float _1101 = _1099;
    if (_1081)
    {
        float _1103 = _1085 * _1099;
        _1089 = _1103;
    }
    float _1105 = _1089;
    if (_1081)
    {
        float _1107 = rsqrt(_1077);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = _1109;
    if (_1081)
    {
        float _1113 = _1105 * 0.15915493667125701904296875;
        _1091 = _1113;
    }
    float _1115 = _1091;
    float _1117 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1119 = _1055;
    float _1121 = _1115;
    if (_1081)
    {
        float _1123 = _1115 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        _1119 = _1125;
    }
    float _1127 = _1119;
    float _1129 = precise::max(0.0, _1117);
    float _1131 = _1063;
    float _1133 = _1129;
    if (_1081)
    {
        float _1135 = _1115 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        _1131 = _1137;
    }
    float _1139 = _1131;
    float _1141 = -_1067;
    float _1143 = -_1129;
    float _1145 = fma(_1047, _1141, _1143);
    if (_1081)
    {
        float _1147 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1093 = _1147;
    }
    float _1149 = _1093;
    float _1151 = _1127;
    float _1153 = _1149;
    if (_1081)
    {
        float _1155 = fma(_1127, _1149, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1151 = _1155;
    }
    float _1157 = _1151;
    float _1159 = _1157;
    if (!_1081)
    {
        _1153 = _1145;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (_1081)
    {
        float _1165 = _1109 * _1157;
        _1095 = _1165;
    }
    float _1167 = _1095;
    if (!_1081)
    {
        _1111 = _1069;
    }
    float _1169 = _1111;
    float _1171 = _1169;
    float _1173 = _1139;
    if (_1081)
    {
        float _1175 = _1139 + (-1.0);
        _1133 = _1175;
    }
    float _1177 = _1133;
    float _1179 = _1177;
    if (_1081)
    {
        float _1181 = _1069 * _1167;
        _1171 = _1181;
    }
    float _1183 = _1171;
    if (!_1081)
    {
        _1159 = _1073;
    }
    float _1185 = _1159;
    float _1187 = _1185;
    if (_1081)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1189;
    }
    float _1191 = _1121;
    if (!_1081)
    {
        _1179 = _1071;
    }
    float _1193 = _1179;
    float _1195 = _1193;
    if (_1081)
    {
        float _1197 = _1071 * _1167;
        _1195 = _1197;
    }
    float _1199 = _1195;
    if (_1081)
    {
        float _1201 = _1183 * _1183;
        _1187 = _1201;
    }
    float _1203 = _1187;
    if (_1081)
    {
        float _1205 = fma(_1145, _1139, _1191);
        _1163 = _1205;
    }
    float _1207 = _1163;
    if (!_1081)
    {
        _1173 = _1075;
    }
    float _1209 = _1173;
    float _1211 = _1209;
    if (_1081)
    {
        float _1213 = _1199 * _1199;
        _1211 = _1213;
    }
    float _1215 = _1211;
    float _1217 = fma(_1207, _1207, _1203);
    float _1219 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1221 = _1217 + _1215;
    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1225 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1223);
    float _1227 = precise::clamp(_1225, 0.0, 1.0);
    float _1229 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1219);
    float _1231 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1233 = rsqrt(_1221);
    float _1235 = -_1227;
    float _1237 = _1235 + 1.0;
    float _1239 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1229);
    float _1241 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1243 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1231);
    float _1245 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1247 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1249 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1241);
    float _1251 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1243);
    float _1253 = abs(_1237);
    float _1255 = log2(_1253);
    float _1257 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1259 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1261 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1249);
    float _1263 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1265 = -_1257;
    float _1267 = fma(_1265, _1245, 1.0);
    float _1269 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1259);
    float _1271 = _1233 * _1183;
    float _1273 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1275 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1277 = _1233 * _1207;
    float _1279 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1281 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1269);
    float _1283 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1275);
    float _1285 = _1233 * _1199;
    float _1287 = -_1279;
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1287);
    float _1291 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1293 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1283);
    float _1295 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1297 = -_1285;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1289);
    float _1301 = log2(_1267);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1293);
    float _1305 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1307 = fma(_1299, -0.5, 0.5);
    float _1309 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1311 = fma(_1299, 0.5, 0.5);
    float _1313 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1305);
    float _1315 = _1277 + 1.0;
    float _1317 = exp2(_1295);
    float _1319 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1309);
    float _1321 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1313);
    float _1323 = fma(_1311, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1325 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1327 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1321);
    float _1329 = fma(_1311, _1323, -0.212114393711090087890625);
    float _1331 = 1.0 / _1303;
    float _1333 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1325);
    float _1335 = _1301 * 0.693147182464599609375;
    float _1337 = fma(_1311, _1329, 1.570728778839111328125);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1341 = sqrt(_1307);
    float _1343 = -_1277;
    float _1345 = fma(_1317, _1315, _1343);
    float _1347 = fma(_1345, 0.5, 0.5);
    float _1349 = _1327 * _1331;
    float _1351 = _1333 * _1331;
    float _1353 = fma(_1349, 0.5, 0.5);
    float _1355 = fma(_1351, -0.5, 0.5);
    float _1357 = _1341 * 0.636619746685028076171875;
    float3 _3716 = float3(_1353, _1355, _1339);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3716, float3(0.0), isnan(_3716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3716, float3(0.0), isnan(_3716)), level(0.0)).x;
    float3 _3727 = float3(_1353, _1355, _1339);
    float4 _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3727, float3(0.0), isnan(_3727)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3727, float3(0.0), isnan(_3727)), level(0.0)).xyzw;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = _1362.w;
    float _1372 = -_1337;
    float _1374 = fma(_1357, _1372, 1.0);
    float2 _3749 = float2(_1374, _1347);
    float3 _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3749, float2(0.0), isnan(_3749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3749, float2(0.0), isnan(_3749)), level(0.0)).xyz;
    float _1380 = _1378.x;
    float _1382 = _1378.y;
    float _1384 = _1378.z;
    float _1386 = _641 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1396 = _1392 || _1394;
    float _1398 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1400 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1386);
    float _1402 = _641 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1404 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1400);
    float _1406 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1402);
    float _1408 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1410 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1406);
    float _1412 = 1.0 / _1408;
    float _1414 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1416 = _1353;
    float _1418 = _1339;
    float _1420 = _1263;
    float _1422 = _1404;
    float _1424 = _1398;
    float _1426 = _1273;
    float _1428 = _1255;
    if (!_1396)
    {
        _1416 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1430 = _1416;
    if (!_1396)
    {
        _1418 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1432 = _1418;
    float _1434 = _1414 + _1408;
    if (_1396)
    {
        _1420 = 1.0;
    }
    float _1436 = _1420;
    float _1438 = _1436;
    if (!_1396)
    {
        float _1440 = -_1430;
        float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1422 = _1442;
    }
    float _1444 = _1422;
    float _1446 = _1444;
    if (!_1396)
    {
        float _1448 = -_1432;
        float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _687 = _1450;
    }
    float _1452 = _687;
    float _1454 = _1452;
    if (!_1396)
    {
        float _1456 = 1.0 / _1444;
        _1446 = _1456;
    }
    float _1458 = _1446;
    float _1460 = _1434 * _1412;
    float _1462 = _1460 * 0.5;
    float _1464 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1468 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
    if (!_1396)
    {
        float _1470 = 1.0 / _1452;
        _1454 = _1470;
    }
    float _1472 = _1454;
    float _1474 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1398);
    if (_1396)
    {
        _1424 = 1.0;
    }
    float _1476 = _1424;
    float _1478 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1480 = 1.0 / _1468;
    float _1482 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1478);
    float _1484 = _1482 + _1303;
    float _1486 = exp2(_1464);
    float _1488 = _1476;
    if (!_1396)
    {
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1492 = -_1430;
        float _1494 = fma(_1480, _1490, _1492);
        _1426 = _1494;
    }
    float _1496 = _1426;
    float _1498 = _1496;
    if (!_1396)
    {
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1502 = -_1432;
        float _1504 = fma(_1480, _1500, _1502);
        _1428 = _1504;
    }
    float _1506 = _1428;
    float _1508 = _1484 * 0.5;
    if (!_1396)
    {
        float _1510 = _1496 * _1458;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1498 = _1512;
    }
    float _1514 = _1498;
    if (!_1396)
    {
        float _1516 = _1506 * _1472;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1438 = _1518;
    }
    float _1520 = _1438;
    float _1522 = -_1486;
    float _1524 = _1522 + 1.0;
    if (!_1396)
    {
        float _1526 = -_1514;
        float _1528 = _1526 + 1.0;
        _1488 = _1528;
    }
    float _1530 = _1488;
    bool _1532 = _1520 > 0.0;
    bool _1534 = isnan(_1520);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan(0.0);
    bool _1540 = _1536 || _1538;
    out.m_62.z = _1508;
    out.m_62.w = _1303;
    float _1542 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1544 = _1520 * _1530;
    bool _1546 = _1530 <= 0.0;
    bool _1548 = !_1540;
    bool _1550 = _1546 || _1548;
    float _1552 = -_1542;
    float _1554 = _1552 + 1.0;
    float _1556 = _1544 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1558 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1327;
    out.gl_Position.y = _1333;
    out.gl_Position.z = _1482;
    out.gl_Position.w = _1303;
    out.m_45.x = _1558;
    float _1560 = _1542 * _1359;
    float _1562 = _1370 * _1554;
    float _1564 = _1370 * _1560;
    float _1566 = _1384 * _1560;
    float _1568 = fma(_1380, _1564, _1364);
    float _1570 = fma(_1382, _1564, _1366);
    float _1572 = fma(_1370, _1566, _1368);
    out.m_64.x = _1568;
    out.m_64.y = _1570;
    out.m_64.z = _1572;
    out.m_64.w = _1562;
    if (!_1550)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1574 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1574;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

