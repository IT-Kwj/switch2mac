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
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
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
    bool _453 = false;
    bool _297 = false;
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
        float _1353 = as_type<float>(_99);
        out.gl_Position.z = _1353;
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
        float _1422 = as_type<float>(_135);
        out.gl_Position.z = _1422;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_47.x;
    float _155 = in.m_47.y;
    float _157 = in.m_47.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = 0.0;
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_54.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    bool _311 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_305);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _305 + _323;
    bool _327 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_305);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    float _351 = 1.0 / _345;
    bool _353 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_305);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _337 * _349;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = _363 * _369;
    float _375 = 1.0 / _341;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -_363;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = _325 * _351;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _395 = fma(_387, _389, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = _309 * _375;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _401;
    float _405 = in.m_52.x;
    float _407 = in.m_52.y;
    float _409 = fma(_379, _399, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = fma(_403, _399, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _413 = _409 * _373;
    float _415 = _411 * _373;
    float _417 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _415);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _421 = fma(_397, _365, _417);
    float _423 = fma(_395, _365, _419);
    float _425 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[145].x, _421);
    float _427 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[145].y, _423);
    float _429 = _425 * _405;
    float _431 = _427 * _407;
    bool _433 = !_371;
    float _451;
    if (!_433)
    {
        float _435 = in.m_54.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_83);
        float _457 = 1.0 / _455;
        float _459 = _117 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = in.m_54.x;
    float _465 = in.m_54.y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _461 + _467;
    float _471 = _273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    float _487 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _491 = _489 != 0;
    bool _493 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_461);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _487);
    float _507 = 1.0 / _475;
    float _509 = _505 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _515 = _509 + _513;
    bool _517 = _465 > 0.5;
    float _519 = _273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _521 = _463 > 0.5;
    float _523 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = -_195;
    int _527 = _517 ? as_type<int>(_525) : as_type<int>(_195);
    float _529 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _519);
    float _531 = _481 * _507;
    bool _533 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _535 = isnan(_461);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = _273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _547 = !_491;
    float _549 = _547 ? _195 : as_type<float>(_527);
    float _551 = fma(_531, _469, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _553 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
    float _555 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _545);
    float _557 = -_543;
    float _559 = _557 + 1.0;
    float _561 = -_549;
    float _563 = _561 + 0.5;
    float _565 = _553 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _567 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _569 = _503 * _559;
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _575 = _565 + _573;
    float _577 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _579 = _551 * _569;
    float _581 = -_191;
    int _583 = _521 ? as_type<int>(_581) : as_type<int>(_191);
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _589 = _577 + _587;
    float _591 = _563 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _593 = !_485;
    float _595 = _593 ? _191 : as_type<float>(_583);
    float _597 = -_503;
    float _599 = _597 + 1.0;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = _595 + 0.5;
    float _607 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[28].z, _601);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _579);
    float _611 = _591 * _571;
    float _613 = _575 * _575;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _617 = _607 >= 0.0;
    float _619 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[116].x, _609);
    float _621 = fma(_589, _589, _613);
    float _623 = _615 * _477;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _627 = fma(_515, _515, _621);
    float _629 = rsqrt(_627);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _635 = _621;
    if (_617)
    {
        _635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _641 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _619 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _653 = as_type<int>(_637);
    if (_617)
    {
        float _655 = _637 * 5.0;
        _653 = as_type<int>(_655);
    }
    int _657 = _653;
    out.m_56.x = _623;
    out.m_56.y = _611;
    out.m_58.x = _645;
    out.m_58.y = _647;
    out.m_58.z = _649;
    float _659 = _575 * _629;
    float _661 = _589 * _629;
    out.m_60.x = _641;
    out.m_60.y = _643;
    out.m_60.z = _523;
    out.m_60.w = _651;
    float _663 = as_type<float>(_657);
    if (_617)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2299 = as_type<float>(_657);
        out.gl_Position.z = _2299;
    }
    if (_617)
    {
        out.m_45.x = 0.0;
    }
    if (_617)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _665 = -_659;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _669 = _515 * _629;
    float _671 = -_661;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _675 = -_659;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _681 = _667 + _679;
    float _683 = -_669;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _689 = _673 + _687;
    float _691 = -_661;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _695 = _681 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _699 = _685 + _697;
    float _701 = -_669;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _515);
    float _705 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[28].x, _695);
    float _707 = _677 * _677;
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    float _711 = fma(_693, _693, _707);
    bool _713 = _709 >= 0.0;
    float _715 = fma(_703, _703, _711);
    float _717 = sqrt(_715);
    if (_713)
    {
        _663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _719 = _663;
    int _721 = as_type<int>(_719);
    if (_713)
    {
        out.m_45.x = 0.0;
    }
    if (_713)
    {
        float _723 = _719 * 5.0;
        _721 = as_type<int>(_723);
    }
    int _725 = _721;
    float _727 = _629 * _717;
    if (_713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2430 = as_type<float>(_725);
        out.gl_Position.z = _2430;
    }
    if (_713)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _729 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _731 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _737 = _727 * _729;
    float _739 = _727 * _731;
    float _741 = _727 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _741 * 0.5;
    float _745 = _733 * _737;
    float _747 = _735 * _739;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _761 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _763 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
    float _769 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _763);
    float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
    float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _775 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].z, _769);
    float _777 = _771 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _779 = _773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = _509 + _777;
    float _785 = _577 + _779;
    float _787 = _565 + _781;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _791 = _783 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _795 = _785 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    bool _803 = _801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _775;
    float _807 = _773;
    float _809 = _785;
    float _811 = _791;
    if (!_803)
    {
        _805 = _783;
    }
    float _813 = _805;
    float _815 = _813;
    if (!_803)
    {
        _807 = _787;
    }
    float _817 = _807;
    bool _819 = !_803;
    float _821 = _817;
    if (!_819)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _827 = _801 + _825;
        float _829 = rsqrt(_799);
        float _831 = _827 * _823;
        float _833 = _787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = _831 * 0.15915493667125701904296875;
        float _837 = _835 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = _835 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = fma(_839, _833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _847 = _829 * _845;
        float _849 = _843 + (-1.0);
        float _851 = fma(_795, _847, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _853 = fma(_791, _847, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _855 = _849 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = fma(_787, _843, _855);
        _809 = _851;
        _821 = _857;
        _815 = _853;
    }
    float _859 = _809;
    float _861 = _821;
    float _863 = _815;
    float _865 = -_661;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _869 = -_659;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _873 = -_669;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _877 = _871;
    float _879 = _867;
    float _881 = _875;
    float _883 = _861;
    if (!_757)
    {
        float _885 = _681 * _681;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _889 = -_577;
        float _891 = _889 + _859;
        float _893 = -_565;
        float _895 = _893 + _861;
        float _897 = fma(_689, _689, _885);
        float _899 = -_509;
        float _901 = _899 + _863;
        float _903 = fma(_699, _699, _897);
        float _905 = 1.0 / _727;
        float _907 = sqrt(_903);
        float _909 = precise::min(_907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _911 = _909 * _887;
        float _913 = _911 * _905;
        float _915 = fma(_891, _913, _673);
        float _917 = fma(_895, _913, _667);
        float _919 = fma(_901, _913, _685);
        _877 = _917;
        _879 = _915;
        _881 = _919;
    }
    float _921 = _877;
    float _923 = _879;
    float _925 = _881;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _921 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _923 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _925 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _945 = fma(_937, _937, _941);
    float _947 = rsqrt(_945);
    float _949 = _947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _951 = _933 * _949;
    float _953 = _937 * _949;
    float _955 = _951 * _951;
    float _957 = _953 * _953;
    float _959 = _955 + _957;
    float _961 = sqrt(_959);
    bool _963 = _961 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = _961 + _965;
    float _969 = _947;
    float _971 = _959;
    float _973 = _967;
    float _975 = _929;
    float _977 = _951;
    if (_963)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _969 = _979;
    }
    float _981 = _969;
    if (_963)
    {
        float _983 = rsqrt(_959);
        _971 = _983;
    }
    float _985 = _971;
    if (_963)
    {
        float _987 = _967 * _981;
        _973 = _987;
    }
    float _989 = _973;
    if (_963)
    {
        float _991 = _989 * 0.15915493667125701904296875;
        _883 = _991;
    }
    float _993 = _883;
    float _995 = _981;
    if (_963)
    {
        float _997 = _993 * 6.283185482025146484375;
        float _999 = sin(_997);
        _995 = _999;
    }
    float _1001 = _995;
    float _1003 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1005 = precise::max(0.0, _1003);
    float _1007 = _937;
    float _1009 = _1005;
    if (_963)
    {
        float _1011 = _993 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        _1007 = _1013;
    }
    float _1015 = _1007;
    float _1017 = -_949;
    float _1019 = -_1005;
    float _1021 = fma(_929, _1017, _1019);
    float _1023 = _1021;
    if (_963)
    {
        float _1025 = _1021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1025;
    }
    float _1027 = _1009;
    float _1029 = _1001;
    float _1031 = _1027;
    if (_963)
    {
        float _1033 = fma(_1001, _1027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1029 = _1033;
    }
    float _1035 = _1029;
    float _1037 = _1035;
    if (_963)
    {
        float _1039 = _1015 + (-1.0);
        _1031 = _1039;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (_963)
    {
        float _1045 = _985 * _1035;
        _811 = _1045;
    }
    float _1047 = _811;
    if (!_963)
    {
        _1037 = _953;
    }
    float _1049 = _1037;
    float _1051 = sqrt(_945);
    float _1053 = _1049;
    if (_963)
    {
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _975 = _1055;
    }
    float _1057 = _975;
    float _1059 = _1057;
    if (_963)
    {
        float _1061 = _951 * _1047;
        _977 = _1061;
    }
    float _1063 = _977;
    if (!_963)
    {
        _1043 = _955;
    }
    float _1065 = _1043;
    float _1067 = _1065;
    if (_963)
    {
        float _1069 = _953 * _1047;
        _1053 = _1069;
    }
    float _1071 = _1053;
    if (_963)
    {
        float _1073 = fma(_1021, _1015, _1057);
        _1023 = _1073;
    }
    float _1075 = _1023;
    if (_963)
    {
        float _1077 = _1063 * _1063;
        _1067 = _1077;
    }
    float _1079 = _1067;
    if (!_963)
    {
        _1059 = _957;
    }
    float _1081 = _1059;
    float _1083 = _1081;
    if (_963)
    {
        float _1085 = _1071 * _1071;
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _921 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1091 = fma(_1075, _1075, _1079);
    float _1093 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1089);
    float _1095 = _1091 + _1087;
    float _1097 = _921 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1101 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1099);
    float _1103 = precise::clamp(_1101, 0.0, 1.0);
    float _1105 = rsqrt(_1095);
    float _1107 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1097);
    float _1109 = _921 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1111 = -_1103;
    float _1113 = _1111 + 1.0;
    float _1115 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1107);
    float _1117 = _921 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1109);
    float _1121 = abs(_1113);
    float _1123 = log2(_1121);
    float _1125 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1127 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1129 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1119);
    float _1131 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1133 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1135 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1137 = _1105 * _1063;
    float _1139 = -_1131;
    float _1141 = fma(_1139, _943, 1.0);
    float _1143 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1093);
    float _1145 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1149 = _1105 * _1075;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1147);
    float _1157 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1159 = _1105 * _1071;
    float _1161 = -_1151;
    float _1163 = fma(_1149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1161);
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    float _1167 = log2(_1141);
    float _1169 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = -_1159;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1163);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1165);
    float _1177 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1179 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1181 = fma(_1173, -0.5, 0.5);
    float _1183 = fma(_1173, 0.5, 0.5);
    float _1185 = exp2(_1157);
    float _1187 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1177);
    float _1189 = _1149 + 1.0;
    float _1191 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1179);
    float _1193 = fma(_1183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1195 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1187);
    float _1197 = 1.0 / _1175;
    float _1199 = fma(_1183, _1193, -0.212114393711090087890625);
    float _1201 = _1167 * 0.693147182464599609375;
    float _1203 = fma(_1183, _1199, 1.570728778839111328125);
    float _1205 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1207 = sqrt(_1181);
    float _1209 = -_1149;
    float _1211 = fma(_1185, _1189, _1209);
    float _1213 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1195);
    float _1215 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1191);
    float _1217 = fma(_1211, 0.5, 0.5);
    float _1219 = _1213 * _1197;
    float _1221 = _1215 * _1197;
    float _1223 = fma(_1219, 0.5, 0.5);
    float _1225 = fma(_1221, -0.5, 0.5);
    float _1227 = _1207 * 0.636619746685028076171875;
    float3 _3258 = float3(_1223, _1225, _1205);
    float _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3258, float3(0.0), isnan(_3258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3258, float3(0.0), isnan(_3258)), level(0.0)).x;
    float3 _3269 = float3(_1223, _1225, _1205);
    float4 _1232 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3269, float3(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3269, float3(0.0), isnan(_3269)), level(0.0)).xyzw;
    float _1234 = _1232.x;
    float _1236 = _1232.y;
    float _1238 = _1232.z;
    float _1240 = _1232.w;
    float _1242 = -_1203;
    float _1244 = fma(_1227, _1242, 1.0);
    float2 _3291 = float2(_1244, _1217);
    float3 _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3291, float2(0.0), isnan(_3291)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3291, float2(0.0), isnan(_3291)), level(0.0)).xyz;
    float _1250 = _1248.x;
    float _1252 = _1248.y;
    float _1254 = _1248.z;
    float _1256 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1258 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1260 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1258);
    float _1262 = exp2(_1256);
    float _1264 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1260);
    float _1266 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1268 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    out.m_45.x = _1266;
    float _1270 = _1268 + _1175;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1215;
    out.gl_Position.z = _1268;
    out.gl_Position.w = _1175;
    float _1272 = _1270 * 0.5;
    float _1274 = -_1262;
    float _1276 = _1274 + 1.0;
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1272;
    out.m_62.w = _1175;
    float _1280 = _1278 * _1229;
    float _1282 = -_1278;
    float _1284 = _1282 + 1.0;
    float _1286 = _1240 * _1280;
    float _1288 = _1254 * _1280;
    float _1290 = fma(_1250, _1286, _1234);
    float _1292 = fma(_1252, _1286, _1236);
    float _1294 = _1240 * _1284;
    float _1296 = fma(_1240, _1288, _1238);
    out.m_64.x = _1290;
    out.m_64.y = _1292;
    out.m_64.z = _1296;
    out.m_64.w = _1294;
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
    bool _453 = false;
    bool _297 = false;
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
        float _1353 = as_type<float>(_99);
        out.gl_Position.z = _1353;
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
        float _1422 = as_type<float>(_135);
        out.gl_Position.z = _1422;
    }
    if (_127)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_47.x;
    float _155 = in.m_47.y;
    float _157 = in.m_47.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = 0.0;
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_54.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    bool _311 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_305);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _305 + _323;
    bool _327 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_305);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    float _351 = 1.0 / _345;
    bool _353 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_305);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _337 * _349;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = _363 * _369;
    float _375 = 1.0 / _341;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -_363;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = _325 * _351;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _395 = fma(_387, _389, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = _309 * _375;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _401;
    float _405 = in.m_52.x;
    float _407 = in.m_52.y;
    float _409 = fma(_379, _399, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = fma(_403, _399, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _413 = _409 * _373;
    float _415 = _411 * _373;
    float _417 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _415);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _421 = fma(_397, _365, _417);
    float _423 = fma(_395, _365, _419);
    float _425 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[145].x, _421);
    float _427 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[145].y, _423);
    float _429 = _425 * _405;
    float _431 = _427 * _407;
    bool _433 = !_371;
    float _451;
    if (!_433)
    {
        float _435 = in.m_54.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_83);
        float _457 = 1.0 / _455;
        float _459 = _117 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = in.m_54.x;
    float _465 = in.m_54.y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _461 + _467;
    float _471 = _273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    float _487 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _491 = _489 != 0;
    bool _493 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_461);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _487);
    float _507 = 1.0 / _475;
    float _509 = _505 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _515 = _509 + _513;
    bool _517 = _465 > 0.5;
    float _519 = _273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _521 = _463 > 0.5;
    float _523 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = -_195;
    int _527 = _517 ? as_type<int>(_525) : as_type<int>(_195);
    float _529 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _519);
    float _531 = _481 * _507;
    bool _533 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _535 = isnan(_461);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = _273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _547 = !_491;
    float _549 = _547 ? _195 : as_type<float>(_527);
    float _551 = fma(_531, _469, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _553 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
    float _555 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _545);
    float _557 = -_543;
    float _559 = _557 + 1.0;
    float _561 = -_549;
    float _563 = _561 + 0.5;
    float _565 = _553 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _567 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _569 = _503 * _559;
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _575 = _565 + _573;
    float _577 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _579 = _551 * _569;
    float _581 = -_191;
    int _583 = _521 ? as_type<int>(_581) : as_type<int>(_191);
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _589 = _577 + _587;
    float _591 = _563 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _593 = !_485;
    float _595 = _593 ? _191 : as_type<float>(_583);
    float _597 = -_503;
    float _599 = _597 + 1.0;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = _595 + 0.5;
    float _607 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[28].z, _601);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _579);
    float _611 = _591 * _571;
    float _613 = _575 * _575;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _617 = _607 >= 0.0;
    float _619 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[116].x, _609);
    float _621 = fma(_589, _589, _613);
    float _623 = _615 * _477;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _627 = fma(_515, _515, _621);
    float _629 = rsqrt(_627);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _635 = _621;
    if (_617)
    {
        _635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _641 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _619 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _653 = as_type<int>(_637);
    if (_617)
    {
        float _655 = _637 * 5.0;
        _653 = as_type<int>(_655);
    }
    int _657 = _653;
    out.m_56.x = _623;
    out.m_56.y = _611;
    out.m_58.x = _645;
    out.m_58.y = _647;
    out.m_58.z = _649;
    float _659 = _575 * _629;
    float _661 = _589 * _629;
    out.m_60.x = _641;
    out.m_60.y = _643;
    out.m_60.z = _523;
    out.m_60.w = _651;
    float _663 = as_type<float>(_657);
    if (_617)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2299 = as_type<float>(_657);
        out.gl_Position.z = _2299;
    }
    if (_617)
    {
        out.m_45.x = 0.0;
    }
    if (_617)
    {
        return out;
    }
    float _665 = -_659;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _669 = _515 * _629;
    float _671 = -_661;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _675 = -_659;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _681 = _667 + _679;
    float _683 = -_669;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _689 = _673 + _687;
    float _691 = -_661;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _695 = _681 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _699 = _685 + _697;
    float _701 = -_669;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _515);
    float _705 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[28].x, _695);
    float _707 = _677 * _677;
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    float _711 = fma(_693, _693, _707);
    bool _713 = _709 >= 0.0;
    float _715 = fma(_703, _703, _711);
    float _717 = sqrt(_715);
    if (_713)
    {
        _663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _719 = _663;
    int _721 = as_type<int>(_719);
    if (_713)
    {
        out.m_45.x = 0.0;
    }
    if (_713)
    {
        float _723 = _719 * 5.0;
        _721 = as_type<int>(_723);
    }
    int _725 = _721;
    float _727 = _629 * _717;
    if (_713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2430 = as_type<float>(_725);
        out.gl_Position.z = _2430;
    }
    if (_713)
    {
        return out;
    }
    float _729 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _731 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _737 = _727 * _729;
    float _739 = _727 * _731;
    float _741 = _727 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _741 * 0.5;
    float _745 = _733 * _737;
    float _747 = _735 * _739;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _761 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _763 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
    float _769 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _763);
    float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
    float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _775 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].z, _769);
    float _777 = _771 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _779 = _773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = _509 + _777;
    float _785 = _577 + _779;
    float _787 = _565 + _781;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _791 = _783 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _795 = _785 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    bool _803 = _801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _775;
    float _807 = _773;
    float _809 = _785;
    float _811 = _791;
    if (!_803)
    {
        _805 = _783;
    }
    float _813 = _805;
    float _815 = _813;
    if (!_803)
    {
        _807 = _787;
    }
    float _817 = _807;
    bool _819 = !_803;
    float _821 = _817;
    if (!_819)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _827 = _801 + _825;
        float _829 = rsqrt(_799);
        float _831 = _827 * _823;
        float _833 = _787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = _831 * 0.15915493667125701904296875;
        float _837 = _835 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = _835 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = fma(_839, _833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _847 = _829 * _845;
        float _849 = _843 + (-1.0);
        float _851 = fma(_795, _847, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _853 = fma(_791, _847, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _855 = _849 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = fma(_787, _843, _855);
        _809 = _851;
        _821 = _857;
        _815 = _853;
    }
    float _859 = _809;
    float _861 = _821;
    float _863 = _815;
    float _865 = -_661;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _869 = -_659;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _873 = -_669;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _877 = _871;
    float _879 = _867;
    float _881 = _875;
    float _883 = _861;
    if (!_757)
    {
        float _885 = _681 * _681;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _889 = -_577;
        float _891 = _889 + _859;
        float _893 = -_565;
        float _895 = _893 + _861;
        float _897 = fma(_689, _689, _885);
        float _899 = -_509;
        float _901 = _899 + _863;
        float _903 = fma(_699, _699, _897);
        float _905 = 1.0 / _727;
        float _907 = sqrt(_903);
        float _909 = precise::min(_907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _911 = _909 * _887;
        float _913 = _911 * _905;
        float _915 = fma(_891, _913, _673);
        float _917 = fma(_895, _913, _667);
        float _919 = fma(_901, _913, _685);
        _877 = _917;
        _879 = _915;
        _881 = _919;
    }
    float _921 = _877;
    float _923 = _879;
    float _925 = _881;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _921 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _923 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _925 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _945 = fma(_937, _937, _941);
    float _947 = rsqrt(_945);
    float _949 = _947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _951 = _933 * _949;
    float _953 = _937 * _949;
    float _955 = _951 * _951;
    float _957 = _953 * _953;
    float _959 = _955 + _957;
    float _961 = sqrt(_959);
    bool _963 = _961 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = _961 + _965;
    float _969 = _947;
    float _971 = _959;
    float _973 = _967;
    float _975 = _929;
    float _977 = _951;
    if (_963)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _969 = _979;
    }
    float _981 = _969;
    if (_963)
    {
        float _983 = rsqrt(_959);
        _971 = _983;
    }
    float _985 = _971;
    if (_963)
    {
        float _987 = _967 * _981;
        _973 = _987;
    }
    float _989 = _973;
    if (_963)
    {
        float _991 = _989 * 0.15915493667125701904296875;
        _883 = _991;
    }
    float _993 = _883;
    float _995 = _981;
    if (_963)
    {
        float _997 = _993 * 6.283185482025146484375;
        float _999 = sin(_997);
        _995 = _999;
    }
    float _1001 = _995;
    float _1003 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1005 = precise::max(0.0, _1003);
    float _1007 = _937;
    float _1009 = _1005;
    if (_963)
    {
        float _1011 = _993 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        _1007 = _1013;
    }
    float _1015 = _1007;
    float _1017 = -_949;
    float _1019 = -_1005;
    float _1021 = fma(_929, _1017, _1019);
    float _1023 = _1021;
    if (_963)
    {
        float _1025 = _1021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1025;
    }
    float _1027 = _1009;
    float _1029 = _1001;
    float _1031 = _1027;
    if (_963)
    {
        float _1033 = fma(_1001, _1027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1029 = _1033;
    }
    float _1035 = _1029;
    float _1037 = _1035;
    if (_963)
    {
        float _1039 = _1015 + (-1.0);
        _1031 = _1039;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (_963)
    {
        float _1045 = _985 * _1035;
        _811 = _1045;
    }
    float _1047 = _811;
    if (!_963)
    {
        _1037 = _953;
    }
    float _1049 = _1037;
    float _1051 = sqrt(_945);
    float _1053 = _1049;
    if (_963)
    {
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _975 = _1055;
    }
    float _1057 = _975;
    float _1059 = _1057;
    if (_963)
    {
        float _1061 = _951 * _1047;
        _977 = _1061;
    }
    float _1063 = _977;
    if (!_963)
    {
        _1043 = _955;
    }
    float _1065 = _1043;
    float _1067 = _1065;
    if (_963)
    {
        float _1069 = _953 * _1047;
        _1053 = _1069;
    }
    float _1071 = _1053;
    if (_963)
    {
        float _1073 = fma(_1021, _1015, _1057);
        _1023 = _1073;
    }
    float _1075 = _1023;
    if (_963)
    {
        float _1077 = _1063 * _1063;
        _1067 = _1077;
    }
    float _1079 = _1067;
    if (!_963)
    {
        _1059 = _957;
    }
    float _1081 = _1059;
    float _1083 = _1081;
    if (_963)
    {
        float _1085 = _1071 * _1071;
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _921 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1091 = fma(_1075, _1075, _1079);
    float _1093 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1089);
    float _1095 = _1091 + _1087;
    float _1097 = _921 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1101 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1099);
    float _1103 = precise::clamp(_1101, 0.0, 1.0);
    float _1105 = rsqrt(_1095);
    float _1107 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1097);
    float _1109 = _921 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1111 = -_1103;
    float _1113 = _1111 + 1.0;
    float _1115 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1107);
    float _1117 = _921 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1109);
    float _1121 = abs(_1113);
    float _1123 = log2(_1121);
    float _1125 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1127 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1129 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1119);
    float _1131 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1133 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1135 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1137 = _1105 * _1063;
    float _1139 = -_1131;
    float _1141 = fma(_1139, _943, 1.0);
    float _1143 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1093);
    float _1145 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1149 = _1105 * _1075;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1147);
    float _1157 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1159 = _1105 * _1071;
    float _1161 = -_1151;
    float _1163 = fma(_1149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1161);
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    float _1167 = log2(_1141);
    float _1169 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = -_1159;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1163);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1165);
    float _1177 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1179 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1181 = fma(_1173, -0.5, 0.5);
    float _1183 = fma(_1173, 0.5, 0.5);
    float _1185 = exp2(_1157);
    float _1187 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1177);
    float _1189 = _1149 + 1.0;
    float _1191 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1179);
    float _1193 = fma(_1183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1195 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1187);
    float _1197 = 1.0 / _1175;
    float _1199 = fma(_1183, _1193, -0.212114393711090087890625);
    float _1201 = _1167 * 0.693147182464599609375;
    float _1203 = fma(_1183, _1199, 1.570728778839111328125);
    float _1205 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1207 = sqrt(_1181);
    float _1209 = -_1149;
    float _1211 = fma(_1185, _1189, _1209);
    float _1213 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1195);
    float _1215 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1191);
    float _1217 = fma(_1211, 0.5, 0.5);
    float _1219 = _1213 * _1197;
    float _1221 = _1215 * _1197;
    float _1223 = fma(_1219, 0.5, 0.5);
    float _1225 = fma(_1221, -0.5, 0.5);
    float _1227 = _1207 * 0.636619746685028076171875;
    float3 _3258 = float3(_1223, _1225, _1205);
    float _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3258, float3(0.0), isnan(_3258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3258, float3(0.0), isnan(_3258)), level(0.0)).x;
    float3 _3269 = float3(_1223, _1225, _1205);
    float4 _1232 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3269, float3(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3269, float3(0.0), isnan(_3269)), level(0.0)).xyzw;
    float _1234 = _1232.x;
    float _1236 = _1232.y;
    float _1238 = _1232.z;
    float _1240 = _1232.w;
    float _1242 = -_1203;
    float _1244 = fma(_1227, _1242, 1.0);
    float2 _3291 = float2(_1244, _1217);
    float3 _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3291, float2(0.0), isnan(_3291)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3291, float2(0.0), isnan(_3291)), level(0.0)).xyz;
    float _1250 = _1248.x;
    float _1252 = _1248.y;
    float _1254 = _1248.z;
    float _1256 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1258 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1260 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1258);
    float _1262 = exp2(_1256);
    float _1264 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1260);
    float _1266 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1268 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    out.m_45.x = _1266;
    float _1270 = _1268 + _1175;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1215;
    out.gl_Position.z = _1268;
    out.gl_Position.w = _1175;
    float _1272 = _1270 * 0.5;
    float _1274 = -_1262;
    float _1276 = _1274 + 1.0;
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1272;
    out.m_62.w = _1175;
    float _1280 = _1278 * _1229;
    float _1282 = -_1278;
    float _1284 = _1282 + 1.0;
    float _1286 = _1240 * _1280;
    float _1288 = _1254 * _1280;
    float _1290 = fma(_1250, _1286, _1234);
    float _1292 = fma(_1252, _1286, _1236);
    float _1294 = _1240 * _1284;
    float _1296 = fma(_1240, _1288, _1238);
    out.m_64.x = _1290;
    out.m_64.y = _1292;
    out.m_64.z = _1296;
    out.m_64.w = _1294;
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
    bool _453 = false;
    bool _297 = false;
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
        float _1353 = as_type<float>(_99);
        out.gl_Position.z = _1353;
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
        float _1422 = as_type<float>(_135);
        out.gl_Position.z = _1422;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_47.x;
    float _155 = in.m_47.y;
    float _157 = in.m_47.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = 0.0;
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_54.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    bool _311 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_305);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _305 + _323;
    bool _327 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_305);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    float _351 = 1.0 / _345;
    bool _353 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_305);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _337 * _349;
    float _367 = -_337;
    float _369 = _367 + 1.0;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = _363 * _369;
    float _375 = 1.0 / _341;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -_363;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = _325 * _351;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _395 = fma(_387, _389, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = _309 * _375;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _401;
    float _405 = in.m_52.x;
    float _407 = in.m_52.y;
    float _409 = fma(_379, _399, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = fma(_403, _399, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _413 = _409 * _373;
    float _415 = _411 * _373;
    float _417 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _415);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _421 = fma(_397, _365, _417);
    float _423 = fma(_395, _365, _419);
    float _425 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[145].x, _421);
    float _427 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[145].y, _423);
    float _429 = _425 * _405;
    float _431 = _427 * _407;
    bool _433 = !_371;
    float _451;
    if (!_433)
    {
        float _435 = in.m_54.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_83);
        float _457 = 1.0 / _455;
        float _459 = _117 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = in.m_54.x;
    float _465 = in.m_54.y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _461 + _467;
    float _471 = _273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    float _487 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _491 = _489 != 0;
    bool _493 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_461);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _487);
    float _507 = 1.0 / _475;
    float _509 = _505 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _515 = _509 + _513;
    bool _517 = _465 > 0.5;
    float _519 = _273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _521 = _463 > 0.5;
    float _523 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = -_195;
    int _527 = _517 ? as_type<int>(_525) : as_type<int>(_195);
    float _529 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _519);
    float _531 = _481 * _507;
    bool _533 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _535 = isnan(_461);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = _273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _547 = !_491;
    float _549 = _547 ? _195 : as_type<float>(_527);
    float _551 = fma(_531, _469, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _553 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
    float _555 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _545);
    float _557 = -_543;
    float _559 = _557 + 1.0;
    float _561 = -_549;
    float _563 = _561 + 0.5;
    float _565 = _553 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _567 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _569 = _503 * _559;
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _575 = _565 + _573;
    float _577 = _567 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _579 = _551 * _569;
    float _581 = -_191;
    int _583 = _521 ? as_type<int>(_581) : as_type<int>(_191);
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _589 = _577 + _587;
    float _591 = _563 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _593 = !_485;
    float _595 = _593 ? _191 : as_type<float>(_583);
    float _597 = -_503;
    float _599 = _597 + 1.0;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = _595 + 0.5;
    float _607 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[28].z, _601);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _579);
    float _611 = _591 * _571;
    float _613 = _575 * _575;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _617 = _607 >= 0.0;
    float _619 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[116].x, _609);
    float _621 = fma(_589, _589, _613);
    float _623 = _615 * _477;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _627 = fma(_515, _515, _621);
    float _629 = rsqrt(_627);
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _635 = _621;
    if (_617)
    {
        _635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _641 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _619 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _653 = as_type<int>(_637);
    if (_617)
    {
        float _655 = _637 * 5.0;
        _653 = as_type<int>(_655);
    }
    int _657 = _653;
    out.m_56.x = _623;
    out.m_56.y = _611;
    out.m_58.x = _645;
    out.m_58.y = _647;
    out.m_58.z = _649;
    float _659 = _575 * _629;
    float _661 = _589 * _629;
    out.m_60.x = _641;
    out.m_60.y = _643;
    out.m_60.z = _523;
    out.m_60.w = _651;
    float _663 = as_type<float>(_657);
    if (_617)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2299 = as_type<float>(_657);
        out.gl_Position.z = _2299;
    }
    if (_617)
    {
        out.m_45.x = 0.0;
    }
    if (_617)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _665 = -_659;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _669 = _515 * _629;
    float _671 = -_661;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _675 = -_659;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _681 = _667 + _679;
    float _683 = -_669;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _689 = _673 + _687;
    float _691 = -_661;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _695 = _681 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _699 = _685 + _697;
    float _701 = -_669;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _515);
    float _705 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[28].x, _695);
    float _707 = _677 * _677;
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    float _711 = fma(_693, _693, _707);
    bool _713 = _709 >= 0.0;
    float _715 = fma(_703, _703, _711);
    float _717 = sqrt(_715);
    if (_713)
    {
        _663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _719 = _663;
    int _721 = as_type<int>(_719);
    if (_713)
    {
        out.m_45.x = 0.0;
    }
    if (_713)
    {
        float _723 = _719 * 5.0;
        _721 = as_type<int>(_723);
    }
    int _725 = _721;
    float _727 = _629 * _717;
    if (_713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2430 = as_type<float>(_725);
        out.gl_Position.z = _2430;
    }
    if (_713)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _729 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _731 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _737 = _727 * _729;
    float _739 = _727 * _731;
    float _741 = _727 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _741 * 0.5;
    float _745 = _733 * _737;
    float _747 = _735 * _739;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _761 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _763 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
    float _769 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _763);
    float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
    float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _775 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].z, _769);
    float _777 = _771 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _779 = _773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = _509 + _777;
    float _785 = _577 + _779;
    float _787 = _565 + _781;
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _791 = _783 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _795 = _785 + _793;
    float _797 = _791 * _791;
    float _799 = fma(_795, _795, _797);
    float _801 = sqrt(_799);
    bool _803 = _801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _775;
    float _807 = _773;
    float _809 = _785;
    float _811 = _791;
    if (!_803)
    {
        _805 = _783;
    }
    float _813 = _805;
    float _815 = _813;
    if (!_803)
    {
        _807 = _787;
    }
    float _817 = _807;
    bool _819 = !_803;
    float _821 = _817;
    if (!_819)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _827 = _801 + _825;
        float _829 = rsqrt(_799);
        float _831 = _827 * _823;
        float _833 = _787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = _831 * 0.15915493667125701904296875;
        float _837 = _835 * 6.283185482025146484375;
        float _839 = sin(_837);
        float _841 = _835 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = fma(_839, _833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _847 = _829 * _845;
        float _849 = _843 + (-1.0);
        float _851 = fma(_795, _847, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _853 = fma(_791, _847, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _855 = _849 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = fma(_787, _843, _855);
        _809 = _851;
        _821 = _857;
        _815 = _853;
    }
    float _859 = _809;
    float _861 = _821;
    float _863 = _815;
    float _865 = -_661;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _869 = -_659;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _873 = -_669;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _877 = _871;
    float _879 = _867;
    float _881 = _875;
    float _883 = _861;
    if (!_757)
    {
        float _885 = _681 * _681;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _889 = -_577;
        float _891 = _889 + _859;
        float _893 = -_565;
        float _895 = _893 + _861;
        float _897 = fma(_689, _689, _885);
        float _899 = -_509;
        float _901 = _899 + _863;
        float _903 = fma(_699, _699, _897);
        float _905 = 1.0 / _727;
        float _907 = sqrt(_903);
        float _909 = precise::min(_907, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _911 = _909 * _887;
        float _913 = _911 * _905;
        float _915 = fma(_891, _913, _673);
        float _917 = fma(_895, _913, _667);
        float _919 = fma(_901, _913, _685);
        _877 = _917;
        _879 = _915;
        _881 = _919;
    }
    float _921 = _877;
    float _923 = _879;
    float _925 = _881;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _921 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _923 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _937 = _925 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _945 = fma(_937, _937, _941);
    float _947 = rsqrt(_945);
    float _949 = _947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _951 = _933 * _949;
    float _953 = _937 * _949;
    float _955 = _951 * _951;
    float _957 = _953 * _953;
    float _959 = _955 + _957;
    float _961 = sqrt(_959);
    bool _963 = _961 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _967 = _961 + _965;
    float _969 = _947;
    float _971 = _959;
    float _973 = _967;
    float _975 = _929;
    float _977 = _951;
    if (_963)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _969 = _979;
    }
    float _981 = _969;
    if (_963)
    {
        float _983 = rsqrt(_959);
        _971 = _983;
    }
    float _985 = _971;
    if (_963)
    {
        float _987 = _967 * _981;
        _973 = _987;
    }
    float _989 = _973;
    if (_963)
    {
        float _991 = _989 * 0.15915493667125701904296875;
        _883 = _991;
    }
    float _993 = _883;
    float _995 = _981;
    if (_963)
    {
        float _997 = _993 * 6.283185482025146484375;
        float _999 = sin(_997);
        _995 = _999;
    }
    float _1001 = _995;
    float _1003 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1005 = precise::max(0.0, _1003);
    float _1007 = _937;
    float _1009 = _1005;
    if (_963)
    {
        float _1011 = _993 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        _1007 = _1013;
    }
    float _1015 = _1007;
    float _1017 = -_949;
    float _1019 = -_1005;
    float _1021 = fma(_929, _1017, _1019);
    float _1023 = _1021;
    if (_963)
    {
        float _1025 = _1021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1025;
    }
    float _1027 = _1009;
    float _1029 = _1001;
    float _1031 = _1027;
    if (_963)
    {
        float _1033 = fma(_1001, _1027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1029 = _1033;
    }
    float _1035 = _1029;
    float _1037 = _1035;
    if (_963)
    {
        float _1039 = _1015 + (-1.0);
        _1031 = _1039;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (_963)
    {
        float _1045 = _985 * _1035;
        _811 = _1045;
    }
    float _1047 = _811;
    if (!_963)
    {
        _1037 = _953;
    }
    float _1049 = _1037;
    float _1051 = sqrt(_945);
    float _1053 = _1049;
    if (_963)
    {
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _975 = _1055;
    }
    float _1057 = _975;
    float _1059 = _1057;
    if (_963)
    {
        float _1061 = _951 * _1047;
        _977 = _1061;
    }
    float _1063 = _977;
    if (!_963)
    {
        _1043 = _955;
    }
    float _1065 = _1043;
    float _1067 = _1065;
    if (_963)
    {
        float _1069 = _953 * _1047;
        _1053 = _1069;
    }
    float _1071 = _1053;
    if (_963)
    {
        float _1073 = fma(_1021, _1015, _1057);
        _1023 = _1073;
    }
    float _1075 = _1023;
    if (_963)
    {
        float _1077 = _1063 * _1063;
        _1067 = _1077;
    }
    float _1079 = _1067;
    if (!_963)
    {
        _1059 = _957;
    }
    float _1081 = _1059;
    float _1083 = _1081;
    if (_963)
    {
        float _1085 = _1071 * _1071;
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _921 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1091 = fma(_1075, _1075, _1079);
    float _1093 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1089);
    float _1095 = _1091 + _1087;
    float _1097 = _921 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1101 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1099);
    float _1103 = precise::clamp(_1101, 0.0, 1.0);
    float _1105 = rsqrt(_1095);
    float _1107 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1097);
    float _1109 = _921 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1111 = -_1103;
    float _1113 = _1111 + 1.0;
    float _1115 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1107);
    float _1117 = _921 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1109);
    float _1121 = abs(_1113);
    float _1123 = log2(_1121);
    float _1125 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1127 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1129 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1119);
    float _1131 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1133 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1127);
    float _1135 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1137 = _1105 * _1063;
    float _1139 = -_1131;
    float _1141 = fma(_1139, _943, 1.0);
    float _1143 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1093);
    float _1145 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1149 = _1105 * _1075;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1155 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1147);
    float _1157 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1159 = _1105 * _1071;
    float _1161 = -_1151;
    float _1163 = fma(_1149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1161);
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    float _1167 = log2(_1141);
    float _1169 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = -_1159;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1163);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1165);
    float _1177 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1179 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1181 = fma(_1173, -0.5, 0.5);
    float _1183 = fma(_1173, 0.5, 0.5);
    float _1185 = exp2(_1157);
    float _1187 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1177);
    float _1189 = _1149 + 1.0;
    float _1191 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1179);
    float _1193 = fma(_1183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1195 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1187);
    float _1197 = 1.0 / _1175;
    float _1199 = fma(_1183, _1193, -0.212114393711090087890625);
    float _1201 = _1167 * 0.693147182464599609375;
    float _1203 = fma(_1183, _1199, 1.570728778839111328125);
    float _1205 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1207 = sqrt(_1181);
    float _1209 = -_1149;
    float _1211 = fma(_1185, _1189, _1209);
    float _1213 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1195);
    float _1215 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1191);
    float _1217 = fma(_1211, 0.5, 0.5);
    float _1219 = _1213 * _1197;
    float _1221 = _1215 * _1197;
    float _1223 = fma(_1219, 0.5, 0.5);
    float _1225 = fma(_1221, -0.5, 0.5);
    float _1227 = _1207 * 0.636619746685028076171875;
    float3 _3258 = float3(_1223, _1225, _1205);
    float _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3258, float3(0.0), isnan(_3258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3258, float3(0.0), isnan(_3258)), level(0.0)).x;
    float3 _3269 = float3(_1223, _1225, _1205);
    float4 _1232 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3269, float3(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3269, float3(0.0), isnan(_3269)), level(0.0)).xyzw;
    float _1234 = _1232.x;
    float _1236 = _1232.y;
    float _1238 = _1232.z;
    float _1240 = _1232.w;
    float _1242 = -_1203;
    float _1244 = fma(_1227, _1242, 1.0);
    float2 _3291 = float2(_1244, _1217);
    float3 _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3291, float2(0.0), isnan(_3291)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3291, float2(0.0), isnan(_3291)), level(0.0)).xyz;
    float _1250 = _1248.x;
    float _1252 = _1248.y;
    float _1254 = _1248.z;
    float _1256 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1258 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1260 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1258);
    float _1262 = exp2(_1256);
    float _1264 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1260);
    float _1266 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1268 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    out.m_45.x = _1266;
    float _1270 = _1268 + _1175;
    out.gl_Position.x = _1213;
    out.gl_Position.y = _1215;
    out.gl_Position.z = _1268;
    out.gl_Position.w = _1175;
    float _1272 = _1270 * 0.5;
    float _1274 = -_1262;
    float _1276 = _1274 + 1.0;
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1272;
    out.m_62.w = _1175;
    float _1280 = _1278 * _1229;
    float _1282 = -_1278;
    float _1284 = _1282 + 1.0;
    float _1286 = _1240 * _1280;
    float _1288 = _1254 * _1280;
    float _1290 = fma(_1250, _1286, _1234);
    float _1292 = fma(_1252, _1286, _1236);
    float _1294 = _1240 * _1284;
    float _1296 = fma(_1240, _1288, _1238);
    out.m_64.x = _1290;
    out.m_64.y = _1292;
    out.m_64.z = _1296;
    out.m_64.w = _1294;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

