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
    float4 m_56 [[user(locn5)]];
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
    bool _455 = false;
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
        float _1417 = as_type<float>(_99);
        out.gl_Position.z = _1417;
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
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1485 = as_type<float>(_135);
        out.gl_Position.z = _1485;
    }
    if (_129)
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
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
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
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453;
    if (!_433)
    {
        float _437 = in.m_54.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_83);
        float _459 = 1.0 / _457;
        float _461 = _117 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _469 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _471 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _473 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _469);
    float _475 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _471);
    float _477 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _473);
    float _479 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _481 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].z, _465);
    float _483 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _479);
    float _485 = sqrt(_477);
    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _475);
    float _489 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _483);
    float _493 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _495 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _497 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].x, _489);
    float _499 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _501 = sqrt(_487);
    float _503 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].y, _493);
    float _505 = _495 * _467;
    float _507 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _511 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
    float _513 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].z, _481);
    float _515 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].x, _497);
    float _517 = sqrt(_491);
    float _519 = _511 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _521 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].w, _499);
    float _523 = _507 * _509;
    float _525 = _513 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _527 = _515 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _529 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
    float _531 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _533 = _501 * _519;
    float _535 = _485 * _527;
    float _537 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _539 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].x, _531);
    float _541 = _533 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _545 = _529 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _547 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _549 = _517 * _525;
    float _551 = _533 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _553 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _555 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].x, _543);
    float _557 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].x, _547);
    float _559 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[26].x, _551);
    float _561 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].z, _555);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].z, _557);
    float _565 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[26].z, _559);
    float _567 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    float _571 = _561 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _573 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[26].w, _565);
    float _575 = _567 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _577 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[24].w, _569);
    float _579 = _573 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _581 = _577 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _583 = _579 + _575;
    float _585 = _581 + _571;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _583 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _593 = _585 + _591;
    float _595 = _589 * _589;
    float _597 = fma(_593, _593, _595);
    float _599 = _533 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _601 = sqrt(_597);
    float _603 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[25].x, _599);
    float _605 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[25].z, _603);
    float _607 = _563 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _609 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[25].w, _605);
    float _611 = _609 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _613 = _601 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _615 = _611 + _607;
    float _617 = _535;
    float _619 = _585;
    float _621 = _607;
    float _623 = _615;
    float _625 = _589;
    float _627 = _563;
    if (!_613)
    {
        _617 = _585;
    }
    float _629 = _617;
    float _631 = _629;
    if (!_613)
    {
        _619 = _583;
    }
    float _633 = _619;
    float _635 = _633;
    if (!_613)
    {
        _621 = _615;
    }
    float _637 = _621;
    bool _639 = !_613;
    float _641 = _637;
    if (!_639)
    {
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _647 = _601 + _645;
        float _649 = _615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _651 = rsqrt(_597);
        float _653 = _647 * _643;
        float _655 = _653 * 0.15915493667125701904296875;
        float _657 = _655 * 6.283185482025146484375;
        float _659 = cos(_657);
        float _661 = _655 * 6.283185482025146484375;
        float _663 = sin(_661);
        float _665 = _659 + (-1.0);
        float _667 = _665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = fma(_663, _649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _671 = fma(_615, _659, _667);
        float _673 = _651 * _669;
        float _675 = fma(_593, _673, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _677 = fma(_589, _673, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _641 = _671;
        _631 = _675;
        _635 = _677;
    }
    float _679 = _641;
    float _681 = _631;
    float _683 = _635;
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _679 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _691 = _681 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _695 = _683 + _693;
    float _697 = _687 * _687;
    float _699 = fma(_691, _691, _697);
    float _701 = fma(_695, _695, _699);
    float _703 = rsqrt(_701);
    float _705 = _703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _707 = _691 * _705;
    float _709 = _695 * _705;
    float _711 = _707 * _707;
    float _713 = _709 * _709;
    float _715 = _711 + _713;
    float _717 = sqrt(_715);
    bool _719 = _717 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _721 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _723 = _717 + _721;
    float _725 = _703;
    float _727 = _723;
    float _729 = _687;
    float _731 = _707;
    if (_719)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _725 = _733;
    }
    float _735 = _725;
    if (_719)
    {
        float _737 = rsqrt(_715);
        _623 = _737;
    }
    float _739 = _623;
    float _741 = _739;
    if (_719)
    {
        float _743 = _723 * _735;
        _727 = _743;
    }
    float _745 = _727;
    if (_719)
    {
        float _747 = _745 * 0.15915493667125701904296875;
        _625 = _747;
    }
    float _749 = _625;
    float _751 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _753 = _735;
    if (_719)
    {
        float _755 = _749 * 6.283185482025146484375;
        float _757 = sin(_755);
        _753 = _757;
    }
    float _759 = _753;
    float _761 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _763 = precise::max(0.0, _761);
    float _765 = _695;
    float _767 = _763;
    if (_719)
    {
        float _769 = _749 * 6.283185482025146484375;
        float _771 = cos(_769);
        _765 = _771;
    }
    float _773 = _765;
    float _775 = -_705;
    float _777 = -_763;
    float _779 = fma(_687, _775, _777);
    if (!_719)
    {
        _729 = _709;
    }
    float _781 = _729;
    float _783 = _781;
    if (_719)
    {
        float _785 = _779 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _767 = _785;
    }
    float _787 = _767;
    float _789 = _759;
    float _791 = _787;
    if (_719)
    {
        float _793 = fma(_759, _787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _627 = _793;
    }
    float _795 = _627;
    if (!_719)
    {
        _789 = _779;
    }
    float _797 = _789;
    float _799 = _797;
    float _801 = _773;
    if (_719)
    {
        float _803 = _773 + (-1.0);
        _791 = _803;
    }
    float _805 = _791;
    float _807 = _805;
    if (_719)
    {
        float _809 = _739 * _795;
        _435 = _809;
    }
    float _811 = _435;
    float _813 = sqrt(_701);
    if (_719)
    {
        float _815 = _805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _741 = _815;
    }
    float _817 = _741;
    if (_719)
    {
        float _819 = _707 * _811;
        _731 = _819;
    }
    float _821 = _731;
    if (!_719)
    {
        _807 = _711;
    }
    float _823 = _807;
    float _825 = _823;
    if (_719)
    {
        float _827 = _709 * _811;
        _783 = _827;
    }
    float _829 = _783;
    if (_719)
    {
        float _831 = fma(_779, _773, _817);
        _799 = _831;
    }
    float _833 = _799;
    if (_719)
    {
        float _835 = _821 * _821;
        _825 = _835;
    }
    float _837 = _825;
    if (!_719)
    {
        _801 = _713;
    }
    float _839 = _801;
    float _841 = _839;
    if (_719)
    {
        float _843 = _829 * _829;
        _841 = _843;
    }
    float _845 = _841;
    float _847 = _679 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _849 = fma(_833, _833, _837);
    float _851 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[3].x, _847);
    float _853 = _849 + _845;
    float _855 = _679 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _859 = fma(_813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _857);
    float _861 = precise::clamp(_859, 0.0, 1.0);
    float _863 = _679 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _865 = rsqrt(_853);
    float _867 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[2].x, _855);
    float _869 = -_861;
    float _871 = _869 + 1.0;
    float _873 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[1].x, _863);
    float _875 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _877 = _679 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _879 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[1].z, _873);
    float _881 = abs(_871);
    float _883 = log2(_881);
    float _885 = _875 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[0].x, _877);
    float _889 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _891 = _885 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _893 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[0].z, _887);
    float _895 = _865 * _821;
    float _897 = _865 * _833;
    float _899 = _893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _901 = _889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _903 = _895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _905 = -_891;
    float _907 = fma(_905, _751, 1.0);
    float _909 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[3].z, _851);
    float _911 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[7].x, _901);
    float _913 = _865 * _829;
    float _915 = _883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _919 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[7].z, _911);
    float _921 = -_903;
    float _923 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[21].y, _921);
    float _925 = log2(_907);
    float _927 = _889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _929 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _919);
    float _931 = -_913;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _923);
    float _935 = _889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _937 = _897 + 1.0;
    float _939 = fma(_933, -0.5, 0.5);
    float _941 = 1.0 / _929;
    float _943 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[4].x, _935);
    float _945 = fma(_933, 0.5, 0.5);
    float _947 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[5].x, _927);
    float _949 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[4].z, _943);
    float _951 = fma(_945, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _953 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[5].z, _947);
    float _955 = exp2(_915);
    float _957 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _949);
    float _959 = fma(_945, _951, -0.212114393711090087890625);
    float _961 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _953);
    float _963 = _925 * 0.693147182464599609375;
    float _965 = fma(_945, _959, 1.570728778839111328125);
    float _967 = sqrt(_939);
    float _969 = _957 * _941;
    float _971 = _961 * _941;
    float _973 = _963 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _975 = fma(_969, 0.5, 0.5);
    float _977 = fma(_971, -0.5, 0.5);
    float _979 = -_897;
    float _981 = fma(_955, _937, _979);
    float _983 = fma(_981, 0.5, 0.5);
    float _985 = _967 * 0.636619746685028076171875;
    float3 _2917 = float3(_975, _977, _973);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2917, float3(0.0), isnan(_2917)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2917, float3(0.0), isnan(_2917)), level(0.0)).x;
    float3 _2928 = float3(_975, _977, _973);
    float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).xyzw;
    float _992 = _990.x;
    float _994 = _990.y;
    float _996 = _990.z;
    float _998 = _990.w;
    float _1000 = -_965;
    float _1002 = fma(_985, _1000, 1.0);
    float2 _2950 = float2(_1002, _983);
    float3 _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2950, float2(0.0), isnan(_2950)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2950, float2(0.0), isnan(_2950)), level(0.0)).xyz;
    float _1008 = _1006.x;
    float _1010 = _1006.y;
    float _1012 = _1006.z;
    float _1014 = in.m_54.x;
    float _1016 = in.m_54.y;
    float _1018 = _883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_56.x = _681;
    out.m_56.y = _679;
    out.m_56.z = _683;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1036 = 1.0 / _1022;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1040 = _463 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1044 = _463 + _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1048 = _1046 != 0;
    float _1050 = 1.0 / _1026;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1054 = _463 + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1058 = _1056 != 0;
    bool _1060 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1062 = isnan(_463);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    bool _1072 = _1014 > 0.5;
    float _1074 = 1.0 / _1030;
    bool _1076 = _1016 > 0.5;
    float _1078 = _1054 * _1036;
    float _1080 = -_191;
    int _1082 = _1072 ? as_type<int>(_1080) : as_type<int>(_191);
    float _1084 = 1.0 / _1034;
    float _1086 = _1040 * _1050;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1088;
    bool _1092 = !_1048;
    float _1094 = _1092 ? _191 : as_type<float>(_1082);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1098 = _463 + _1096;
    bool _1100 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1102 = isnan(_463);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = fma(_1090, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1114 = _1044 * _1074;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1120;
    float _1124 = -_1110;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1128;
    float _1132 = fma(_1118, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1134 = fma(_1122, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1136 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1138 = isnan(_463);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = _1098 * _1084;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1158 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1160 = isnan(_463);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = -_1146;
    float _1172 = _1170 + 1.0;
    float _1174 = _1146 * _1126;
    bool _1176 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1178 = isnan(_463);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1192 = _1070 * _1172;
    float _1194 = -_1070;
    float _1196 = _1194 + 1.0;
    float _1198 = -_1168;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_1156, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1204 = fma(_1152, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1206 = _1168 * _1196;
    float _1208 = _1186 * _1200;
    float _1210 = fma(_1190, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1212 = -_1186;
    float _1214 = _1212 + 1.0;
    float _1216 = _1112 * _1208;
    float _1218 = _1132 * _1208;
    float _1220 = _1134 * _1208;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1222;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1216);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1218);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1230;
    float _1234 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1220);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1244 = fma(_1224, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1246 = fma(_1232, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1248 = fma(_1130, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1254 = fma(_1202, _1206, _1226);
    float _1256 = fma(_1204, _1206, _1228);
    float _1258 = fma(_1210, _1206, _1234);
    float _1260 = fma(_1238, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1262 = fma(_1242, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1264 = fma(_1252, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1266 = fma(_1244, _1192, _1254);
    float _1268 = fma(_1246, _1192, _1256);
    float _1270 = fma(_1248, _1192, _1258);
    float _1272 = -_195;
    int _1274 = _1076 ? as_type<int>(_1272) : as_type<int>(_195);
    float _1276 = fma(_1260, _1174, _1266);
    float _1278 = fma(_1262, _1174, _1268);
    float _1280 = fma(_1264, _1174, _1270);
    bool _1282 = !_1058;
    float _1284 = _1282 ? _195 : as_type<float>(_1274);
    float _1286 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1276);
    float _1288 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1278);
    float _1290 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1280);
    float _1292 = _889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1294 = exp2(_1018);
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1300 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1292);
    float _1302 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = -_1284;
    float _1308 = _1306 + 0.5;
    float _1310 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1300);
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    float _1320 = _1094 + 0.5;
    float _1322 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_58.x = _1304;
    out.m_58.y = _1314;
    out.m_58.z = _1316;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1326 = -_1294;
    float _1328 = _1326 + 1.0;
    float _1330 = _1318 + _929;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1336 = _1330 * 0.5;
    float _1338 = _1322 * _1312;
    out.gl_Position.x = _957;
    out.gl_Position.y = _961;
    out.gl_Position.z = _1318;
    out.gl_Position.w = _929;
    float _1340 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1342 = _1332 * _1324;
    out.m_45.x = _1340;
    out.m_60.x = _1342;
    out.m_60.y = _1338;
    out.m_62.z = _1336;
    out.m_62.w = _929;
    float _1344 = _1334 * _987;
    float _1346 = -_1334;
    float _1348 = _1346 + 1.0;
    float _1350 = _998 * _1344;
    float _1352 = _998 * _1348;
    float _1354 = _1012 * _1344;
    float _1356 = fma(_1008, _1350, _992);
    float _1358 = fma(_1010, _1350, _994);
    float _1360 = fma(_998, _1354, _996);
    out.m_64.x = _1356;
    out.m_64.y = _1358;
    out.m_64.z = _1360;
    out.m_64.w = _1352;
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
    bool _455 = false;
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
        float _1417 = as_type<float>(_99);
        out.gl_Position.z = _1417;
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
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1485 = as_type<float>(_135);
        out.gl_Position.z = _1485;
    }
    if (_129)
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
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
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
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453;
    if (!_433)
    {
        float _437 = in.m_54.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_83);
        float _459 = 1.0 / _457;
        float _461 = _117 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _469 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _471 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _473 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _469);
    float _475 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _471);
    float _477 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _473);
    float _479 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _481 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].z, _465);
    float _483 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _479);
    float _485 = sqrt(_477);
    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _475);
    float _489 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _483);
    float _493 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _495 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _497 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].x, _489);
    float _499 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _501 = sqrt(_487);
    float _503 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].y, _493);
    float _505 = _495 * _467;
    float _507 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _511 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
    float _513 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].z, _481);
    float _515 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].x, _497);
    float _517 = sqrt(_491);
    float _519 = _511 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _521 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].w, _499);
    float _523 = _507 * _509;
    float _525 = _513 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _527 = _515 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _529 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
    float _531 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _533 = _501 * _519;
    float _535 = _485 * _527;
    float _537 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _539 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].x, _531);
    float _541 = _533 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _545 = _529 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _547 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _549 = _517 * _525;
    float _551 = _533 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _553 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _555 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].x, _543);
    float _557 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].x, _547);
    float _559 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[26].x, _551);
    float _561 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].z, _555);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].z, _557);
    float _565 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[26].z, _559);
    float _567 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    float _571 = _561 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _573 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[26].w, _565);
    float _575 = _567 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _577 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[24].w, _569);
    float _579 = _573 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _581 = _577 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _583 = _579 + _575;
    float _585 = _581 + _571;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _583 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _593 = _585 + _591;
    float _595 = _589 * _589;
    float _597 = fma(_593, _593, _595);
    float _599 = _533 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _601 = sqrt(_597);
    float _603 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[25].x, _599);
    float _605 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[25].z, _603);
    float _607 = _563 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _609 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[25].w, _605);
    float _611 = _609 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _613 = _601 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _615 = _611 + _607;
    float _617 = _535;
    float _619 = _585;
    float _621 = _607;
    float _623 = _615;
    float _625 = _589;
    float _627 = _563;
    if (!_613)
    {
        _617 = _585;
    }
    float _629 = _617;
    float _631 = _629;
    if (!_613)
    {
        _619 = _583;
    }
    float _633 = _619;
    float _635 = _633;
    if (!_613)
    {
        _621 = _615;
    }
    float _637 = _621;
    bool _639 = !_613;
    float _641 = _637;
    if (!_639)
    {
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _647 = _601 + _645;
        float _649 = _615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _651 = rsqrt(_597);
        float _653 = _647 * _643;
        float _655 = _653 * 0.15915493667125701904296875;
        float _657 = _655 * 6.283185482025146484375;
        float _659 = cos(_657);
        float _661 = _655 * 6.283185482025146484375;
        float _663 = sin(_661);
        float _665 = _659 + (-1.0);
        float _667 = _665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = fma(_663, _649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _671 = fma(_615, _659, _667);
        float _673 = _651 * _669;
        float _675 = fma(_593, _673, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _677 = fma(_589, _673, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _641 = _671;
        _631 = _675;
        _635 = _677;
    }
    float _679 = _641;
    float _681 = _631;
    float _683 = _635;
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _679 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _691 = _681 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _695 = _683 + _693;
    float _697 = _687 * _687;
    float _699 = fma(_691, _691, _697);
    float _701 = fma(_695, _695, _699);
    float _703 = rsqrt(_701);
    float _705 = _703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _707 = _691 * _705;
    float _709 = _695 * _705;
    float _711 = _707 * _707;
    float _713 = _709 * _709;
    float _715 = _711 + _713;
    float _717 = sqrt(_715);
    bool _719 = _717 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _721 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _723 = _717 + _721;
    float _725 = _703;
    float _727 = _723;
    float _729 = _687;
    float _731 = _707;
    if (_719)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _725 = _733;
    }
    float _735 = _725;
    if (_719)
    {
        float _737 = rsqrt(_715);
        _623 = _737;
    }
    float _739 = _623;
    float _741 = _739;
    if (_719)
    {
        float _743 = _723 * _735;
        _727 = _743;
    }
    float _745 = _727;
    if (_719)
    {
        float _747 = _745 * 0.15915493667125701904296875;
        _625 = _747;
    }
    float _749 = _625;
    float _751 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _753 = _735;
    if (_719)
    {
        float _755 = _749 * 6.283185482025146484375;
        float _757 = sin(_755);
        _753 = _757;
    }
    float _759 = _753;
    float _761 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _763 = precise::max(0.0, _761);
    float _765 = _695;
    float _767 = _763;
    if (_719)
    {
        float _769 = _749 * 6.283185482025146484375;
        float _771 = cos(_769);
        _765 = _771;
    }
    float _773 = _765;
    float _775 = -_705;
    float _777 = -_763;
    float _779 = fma(_687, _775, _777);
    if (!_719)
    {
        _729 = _709;
    }
    float _781 = _729;
    float _783 = _781;
    if (_719)
    {
        float _785 = _779 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _767 = _785;
    }
    float _787 = _767;
    float _789 = _759;
    float _791 = _787;
    if (_719)
    {
        float _793 = fma(_759, _787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _627 = _793;
    }
    float _795 = _627;
    if (!_719)
    {
        _789 = _779;
    }
    float _797 = _789;
    float _799 = _797;
    float _801 = _773;
    if (_719)
    {
        float _803 = _773 + (-1.0);
        _791 = _803;
    }
    float _805 = _791;
    float _807 = _805;
    if (_719)
    {
        float _809 = _739 * _795;
        _435 = _809;
    }
    float _811 = _435;
    float _813 = sqrt(_701);
    if (_719)
    {
        float _815 = _805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _741 = _815;
    }
    float _817 = _741;
    if (_719)
    {
        float _819 = _707 * _811;
        _731 = _819;
    }
    float _821 = _731;
    if (!_719)
    {
        _807 = _711;
    }
    float _823 = _807;
    float _825 = _823;
    if (_719)
    {
        float _827 = _709 * _811;
        _783 = _827;
    }
    float _829 = _783;
    if (_719)
    {
        float _831 = fma(_779, _773, _817);
        _799 = _831;
    }
    float _833 = _799;
    if (_719)
    {
        float _835 = _821 * _821;
        _825 = _835;
    }
    float _837 = _825;
    if (!_719)
    {
        _801 = _713;
    }
    float _839 = _801;
    float _841 = _839;
    if (_719)
    {
        float _843 = _829 * _829;
        _841 = _843;
    }
    float _845 = _841;
    float _847 = _679 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _849 = fma(_833, _833, _837);
    float _851 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[3].x, _847);
    float _853 = _849 + _845;
    float _855 = _679 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _859 = fma(_813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _857);
    float _861 = precise::clamp(_859, 0.0, 1.0);
    float _863 = _679 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _865 = rsqrt(_853);
    float _867 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[2].x, _855);
    float _869 = -_861;
    float _871 = _869 + 1.0;
    float _873 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[1].x, _863);
    float _875 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _877 = _679 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _879 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[1].z, _873);
    float _881 = abs(_871);
    float _883 = log2(_881);
    float _885 = _875 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[0].x, _877);
    float _889 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _891 = _885 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _893 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[0].z, _887);
    float _895 = _865 * _821;
    float _897 = _865 * _833;
    float _899 = _893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _901 = _889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _903 = _895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _905 = -_891;
    float _907 = fma(_905, _751, 1.0);
    float _909 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[3].z, _851);
    float _911 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[7].x, _901);
    float _913 = _865 * _829;
    float _915 = _883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _919 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[7].z, _911);
    float _921 = -_903;
    float _923 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[21].y, _921);
    float _925 = log2(_907);
    float _927 = _889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _929 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _919);
    float _931 = -_913;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _923);
    float _935 = _889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _937 = _897 + 1.0;
    float _939 = fma(_933, -0.5, 0.5);
    float _941 = 1.0 / _929;
    float _943 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[4].x, _935);
    float _945 = fma(_933, 0.5, 0.5);
    float _947 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[5].x, _927);
    float _949 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[4].z, _943);
    float _951 = fma(_945, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _953 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[5].z, _947);
    float _955 = exp2(_915);
    float _957 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _949);
    float _959 = fma(_945, _951, -0.212114393711090087890625);
    float _961 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _953);
    float _963 = _925 * 0.693147182464599609375;
    float _965 = fma(_945, _959, 1.570728778839111328125);
    float _967 = sqrt(_939);
    float _969 = _957 * _941;
    float _971 = _961 * _941;
    float _973 = _963 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _975 = fma(_969, 0.5, 0.5);
    float _977 = fma(_971, -0.5, 0.5);
    float _979 = -_897;
    float _981 = fma(_955, _937, _979);
    float _983 = fma(_981, 0.5, 0.5);
    float _985 = _967 * 0.636619746685028076171875;
    float3 _2917 = float3(_975, _977, _973);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2917, float3(0.0), isnan(_2917)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2917, float3(0.0), isnan(_2917)), level(0.0)).x;
    float3 _2928 = float3(_975, _977, _973);
    float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).xyzw;
    float _992 = _990.x;
    float _994 = _990.y;
    float _996 = _990.z;
    float _998 = _990.w;
    float _1000 = -_965;
    float _1002 = fma(_985, _1000, 1.0);
    float2 _2950 = float2(_1002, _983);
    float3 _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2950, float2(0.0), isnan(_2950)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2950, float2(0.0), isnan(_2950)), level(0.0)).xyz;
    float _1008 = _1006.x;
    float _1010 = _1006.y;
    float _1012 = _1006.z;
    float _1014 = in.m_54.x;
    float _1016 = in.m_54.y;
    float _1018 = _883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_56.x = _681;
    out.m_56.y = _679;
    out.m_56.z = _683;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1036 = 1.0 / _1022;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1040 = _463 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1044 = _463 + _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1048 = _1046 != 0;
    float _1050 = 1.0 / _1026;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1054 = _463 + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1058 = _1056 != 0;
    bool _1060 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1062 = isnan(_463);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    bool _1072 = _1014 > 0.5;
    float _1074 = 1.0 / _1030;
    bool _1076 = _1016 > 0.5;
    float _1078 = _1054 * _1036;
    float _1080 = -_191;
    int _1082 = _1072 ? as_type<int>(_1080) : as_type<int>(_191);
    float _1084 = 1.0 / _1034;
    float _1086 = _1040 * _1050;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1088;
    bool _1092 = !_1048;
    float _1094 = _1092 ? _191 : as_type<float>(_1082);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1098 = _463 + _1096;
    bool _1100 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1102 = isnan(_463);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = fma(_1090, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1114 = _1044 * _1074;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1120;
    float _1124 = -_1110;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1128;
    float _1132 = fma(_1118, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1134 = fma(_1122, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1136 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1138 = isnan(_463);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = _1098 * _1084;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1158 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1160 = isnan(_463);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = -_1146;
    float _1172 = _1170 + 1.0;
    float _1174 = _1146 * _1126;
    bool _1176 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1178 = isnan(_463);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1192 = _1070 * _1172;
    float _1194 = -_1070;
    float _1196 = _1194 + 1.0;
    float _1198 = -_1168;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_1156, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1204 = fma(_1152, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1206 = _1168 * _1196;
    float _1208 = _1186 * _1200;
    float _1210 = fma(_1190, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1212 = -_1186;
    float _1214 = _1212 + 1.0;
    float _1216 = _1112 * _1208;
    float _1218 = _1132 * _1208;
    float _1220 = _1134 * _1208;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1222;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1216);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1218);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1230;
    float _1234 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1220);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1244 = fma(_1224, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1246 = fma(_1232, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1248 = fma(_1130, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1254 = fma(_1202, _1206, _1226);
    float _1256 = fma(_1204, _1206, _1228);
    float _1258 = fma(_1210, _1206, _1234);
    float _1260 = fma(_1238, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1262 = fma(_1242, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1264 = fma(_1252, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1266 = fma(_1244, _1192, _1254);
    float _1268 = fma(_1246, _1192, _1256);
    float _1270 = fma(_1248, _1192, _1258);
    float _1272 = -_195;
    int _1274 = _1076 ? as_type<int>(_1272) : as_type<int>(_195);
    float _1276 = fma(_1260, _1174, _1266);
    float _1278 = fma(_1262, _1174, _1268);
    float _1280 = fma(_1264, _1174, _1270);
    bool _1282 = !_1058;
    float _1284 = _1282 ? _195 : as_type<float>(_1274);
    float _1286 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1276);
    float _1288 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1278);
    float _1290 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1280);
    float _1292 = _889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1294 = exp2(_1018);
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1300 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1292);
    float _1302 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = -_1284;
    float _1308 = _1306 + 0.5;
    float _1310 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1300);
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    float _1320 = _1094 + 0.5;
    float _1322 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_58.x = _1304;
    out.m_58.y = _1314;
    out.m_58.z = _1316;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1326 = -_1294;
    float _1328 = _1326 + 1.0;
    float _1330 = _1318 + _929;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1336 = _1330 * 0.5;
    float _1338 = _1322 * _1312;
    out.gl_Position.x = _957;
    out.gl_Position.y = _961;
    out.gl_Position.z = _1318;
    out.gl_Position.w = _929;
    float _1340 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1342 = _1332 * _1324;
    out.m_45.x = _1340;
    out.m_60.x = _1342;
    out.m_60.y = _1338;
    out.m_62.z = _1336;
    out.m_62.w = _929;
    float _1344 = _1334 * _987;
    float _1346 = -_1334;
    float _1348 = _1346 + 1.0;
    float _1350 = _998 * _1344;
    float _1352 = _998 * _1348;
    float _1354 = _1012 * _1344;
    float _1356 = fma(_1008, _1350, _992);
    float _1358 = fma(_1010, _1350, _994);
    float _1360 = fma(_998, _1354, _996);
    out.m_64.x = _1356;
    out.m_64.y = _1358;
    out.m_64.z = _1360;
    out.m_64.w = _1352;
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
    bool _455 = false;
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
        float _1417 = as_type<float>(_99);
        out.gl_Position.z = _1417;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1485 = as_type<float>(_135);
        out.gl_Position.z = _1485;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
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
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453;
    if (!_433)
    {
        float _437 = in.m_54.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_83);
        float _459 = 1.0 / _457;
        float _461 = _117 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _469 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _471 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _473 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _469);
    float _475 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _471);
    float _477 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _473);
    float _479 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _481 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].z, _465);
    float _483 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _479);
    float _485 = sqrt(_477);
    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _475);
    float _489 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _483);
    float _493 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _495 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _497 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].x, _489);
    float _499 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _501 = sqrt(_487);
    float _503 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].y, _493);
    float _505 = _495 * _467;
    float _507 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _511 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
    float _513 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].z, _481);
    float _515 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].x, _497);
    float _517 = sqrt(_491);
    float _519 = _511 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _521 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].w, _499);
    float _523 = _507 * _509;
    float _525 = _513 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _527 = _515 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _529 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
    float _531 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _533 = _501 * _519;
    float _535 = _485 * _527;
    float _537 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _539 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[26].x, _531);
    float _541 = _533 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _543 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _545 = _529 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _547 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _549 = _517 * _525;
    float _551 = _533 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _553 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[24].x, _541);
    float _555 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[24].x, _543);
    float _557 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[25].x, _547);
    float _559 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[26].x, _551);
    float _561 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].z, _555);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].z, _557);
    float _565 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[26].z, _559);
    float _567 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[24].z, _553);
    float _571 = _561 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _573 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[26].w, _565);
    float _575 = _567 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _577 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[24].w, _569);
    float _579 = _573 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _581 = _577 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _583 = _579 + _575;
    float _585 = _581 + _571;
    float _587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _589 = _583 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _593 = _585 + _591;
    float _595 = _589 * _589;
    float _597 = fma(_593, _593, _595);
    float _599 = _533 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _601 = sqrt(_597);
    float _603 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[25].x, _599);
    float _605 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[25].z, _603);
    float _607 = _563 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _609 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[25].w, _605);
    float _611 = _609 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _613 = _601 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _615 = _611 + _607;
    float _617 = _535;
    float _619 = _585;
    float _621 = _607;
    float _623 = _615;
    float _625 = _589;
    float _627 = _563;
    if (!_613)
    {
        _617 = _585;
    }
    float _629 = _617;
    float _631 = _629;
    if (!_613)
    {
        _619 = _583;
    }
    float _633 = _619;
    float _635 = _633;
    if (!_613)
    {
        _621 = _615;
    }
    float _637 = _621;
    bool _639 = !_613;
    float _641 = _637;
    if (!_639)
    {
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _647 = _601 + _645;
        float _649 = _615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _651 = rsqrt(_597);
        float _653 = _647 * _643;
        float _655 = _653 * 0.15915493667125701904296875;
        float _657 = _655 * 6.283185482025146484375;
        float _659 = cos(_657);
        float _661 = _655 * 6.283185482025146484375;
        float _663 = sin(_661);
        float _665 = _659 + (-1.0);
        float _667 = _665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _669 = fma(_663, _649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _671 = fma(_615, _659, _667);
        float _673 = _651 * _669;
        float _675 = fma(_593, _673, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _677 = fma(_589, _673, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _641 = _671;
        _631 = _675;
        _635 = _677;
    }
    float _679 = _641;
    float _681 = _631;
    float _683 = _635;
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _679 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _691 = _681 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _695 = _683 + _693;
    float _697 = _687 * _687;
    float _699 = fma(_691, _691, _697);
    float _701 = fma(_695, _695, _699);
    float _703 = rsqrt(_701);
    float _705 = _703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _707 = _691 * _705;
    float _709 = _695 * _705;
    float _711 = _707 * _707;
    float _713 = _709 * _709;
    float _715 = _711 + _713;
    float _717 = sqrt(_715);
    bool _719 = _717 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _721 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _723 = _717 + _721;
    float _725 = _703;
    float _727 = _723;
    float _729 = _687;
    float _731 = _707;
    if (_719)
    {
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _725 = _733;
    }
    float _735 = _725;
    if (_719)
    {
        float _737 = rsqrt(_715);
        _623 = _737;
    }
    float _739 = _623;
    float _741 = _739;
    if (_719)
    {
        float _743 = _723 * _735;
        _727 = _743;
    }
    float _745 = _727;
    if (_719)
    {
        float _747 = _745 * 0.15915493667125701904296875;
        _625 = _747;
    }
    float _749 = _625;
    float _751 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _753 = _735;
    if (_719)
    {
        float _755 = _749 * 6.283185482025146484375;
        float _757 = sin(_755);
        _753 = _757;
    }
    float _759 = _753;
    float _761 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _763 = precise::max(0.0, _761);
    float _765 = _695;
    float _767 = _763;
    if (_719)
    {
        float _769 = _749 * 6.283185482025146484375;
        float _771 = cos(_769);
        _765 = _771;
    }
    float _773 = _765;
    float _775 = -_705;
    float _777 = -_763;
    float _779 = fma(_687, _775, _777);
    if (!_719)
    {
        _729 = _709;
    }
    float _781 = _729;
    float _783 = _781;
    if (_719)
    {
        float _785 = _779 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _767 = _785;
    }
    float _787 = _767;
    float _789 = _759;
    float _791 = _787;
    if (_719)
    {
        float _793 = fma(_759, _787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _627 = _793;
    }
    float _795 = _627;
    if (!_719)
    {
        _789 = _779;
    }
    float _797 = _789;
    float _799 = _797;
    float _801 = _773;
    if (_719)
    {
        float _803 = _773 + (-1.0);
        _791 = _803;
    }
    float _805 = _791;
    float _807 = _805;
    if (_719)
    {
        float _809 = _739 * _795;
        _435 = _809;
    }
    float _811 = _435;
    float _813 = sqrt(_701);
    if (_719)
    {
        float _815 = _805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _741 = _815;
    }
    float _817 = _741;
    if (_719)
    {
        float _819 = _707 * _811;
        _731 = _819;
    }
    float _821 = _731;
    if (!_719)
    {
        _807 = _711;
    }
    float _823 = _807;
    float _825 = _823;
    if (_719)
    {
        float _827 = _709 * _811;
        _783 = _827;
    }
    float _829 = _783;
    if (_719)
    {
        float _831 = fma(_779, _773, _817);
        _799 = _831;
    }
    float _833 = _799;
    if (_719)
    {
        float _835 = _821 * _821;
        _825 = _835;
    }
    float _837 = _825;
    if (!_719)
    {
        _801 = _713;
    }
    float _839 = _801;
    float _841 = _839;
    if (_719)
    {
        float _843 = _829 * _829;
        _841 = _843;
    }
    float _845 = _841;
    float _847 = _679 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _849 = fma(_833, _833, _837);
    float _851 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[3].x, _847);
    float _853 = _849 + _845;
    float _855 = _679 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _857 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _859 = fma(_813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _857);
    float _861 = precise::clamp(_859, 0.0, 1.0);
    float _863 = _679 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _865 = rsqrt(_853);
    float _867 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[2].x, _855);
    float _869 = -_861;
    float _871 = _869 + 1.0;
    float _873 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[1].x, _863);
    float _875 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _877 = _679 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _879 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[1].z, _873);
    float _881 = abs(_871);
    float _883 = log2(_881);
    float _885 = _875 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[0].x, _877);
    float _889 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _891 = _885 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _893 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[0].z, _887);
    float _895 = _865 * _821;
    float _897 = _865 * _833;
    float _899 = _893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _901 = _889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _903 = _895 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _905 = -_891;
    float _907 = fma(_905, _751, 1.0);
    float _909 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[3].z, _851);
    float _911 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[7].x, _901);
    float _913 = _865 * _829;
    float _915 = _883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _919 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[7].z, _911);
    float _921 = -_903;
    float _923 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[21].y, _921);
    float _925 = log2(_907);
    float _927 = _889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _929 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _919);
    float _931 = -_913;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _923);
    float _935 = _889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _937 = _897 + 1.0;
    float _939 = fma(_933, -0.5, 0.5);
    float _941 = 1.0 / _929;
    float _943 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[4].x, _935);
    float _945 = fma(_933, 0.5, 0.5);
    float _947 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[5].x, _927);
    float _949 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[4].z, _943);
    float _951 = fma(_945, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _953 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[5].z, _947);
    float _955 = exp2(_915);
    float _957 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _949);
    float _959 = fma(_945, _951, -0.212114393711090087890625);
    float _961 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _953);
    float _963 = _925 * 0.693147182464599609375;
    float _965 = fma(_945, _959, 1.570728778839111328125);
    float _967 = sqrt(_939);
    float _969 = _957 * _941;
    float _971 = _961 * _941;
    float _973 = _963 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _975 = fma(_969, 0.5, 0.5);
    float _977 = fma(_971, -0.5, 0.5);
    float _979 = -_897;
    float _981 = fma(_955, _937, _979);
    float _983 = fma(_981, 0.5, 0.5);
    float _985 = _967 * 0.636619746685028076171875;
    float3 _2917 = float3(_975, _977, _973);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2917, float3(0.0), isnan(_2917)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2917, float3(0.0), isnan(_2917)), level(0.0)).x;
    float3 _2928 = float3(_975, _977, _973);
    float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).xyzw;
    float _992 = _990.x;
    float _994 = _990.y;
    float _996 = _990.z;
    float _998 = _990.w;
    float _1000 = -_965;
    float _1002 = fma(_985, _1000, 1.0);
    float2 _2950 = float2(_1002, _983);
    float3 _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2950, float2(0.0), isnan(_2950)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2950, float2(0.0), isnan(_2950)), level(0.0)).xyz;
    float _1008 = _1006.x;
    float _1010 = _1006.y;
    float _1012 = _1006.z;
    float _1014 = in.m_54.x;
    float _1016 = in.m_54.y;
    float _1018 = _883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_56.x = _681;
    out.m_56.y = _679;
    out.m_56.z = _683;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1036 = 1.0 / _1022;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1040 = _463 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1044 = _463 + _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1048 = _1046 != 0;
    float _1050 = 1.0 / _1026;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1054 = _463 + _1052;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1058 = _1056 != 0;
    bool _1060 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1062 = isnan(_463);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    bool _1072 = _1014 > 0.5;
    float _1074 = 1.0 / _1030;
    bool _1076 = _1016 > 0.5;
    float _1078 = _1054 * _1036;
    float _1080 = -_191;
    int _1082 = _1072 ? as_type<int>(_1080) : as_type<int>(_191);
    float _1084 = 1.0 / _1034;
    float _1086 = _1040 * _1050;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1088;
    bool _1092 = !_1048;
    float _1094 = _1092 ? _191 : as_type<float>(_1082);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1098 = _463 + _1096;
    bool _1100 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1102 = isnan(_463);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = fma(_1090, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1114 = _1044 * _1074;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1120;
    float _1124 = -_1110;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1128;
    float _1132 = fma(_1118, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1134 = fma(_1122, _1078, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1136 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1138 = isnan(_463);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = _1098 * _1084;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1158 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1160 = isnan(_463);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = -_1146;
    float _1172 = _1170 + 1.0;
    float _1174 = _1146 * _1126;
    bool _1176 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1178 = isnan(_463);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1192 = _1070 * _1172;
    float _1194 = -_1070;
    float _1196 = _1194 + 1.0;
    float _1198 = -_1168;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_1156, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1204 = fma(_1152, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1206 = _1168 * _1196;
    float _1208 = _1186 * _1200;
    float _1210 = fma(_1190, _1086, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1212 = -_1186;
    float _1214 = _1212 + 1.0;
    float _1216 = _1112 * _1208;
    float _1218 = _1132 * _1208;
    float _1220 = _1134 * _1208;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1222;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1216);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1218);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1230;
    float _1234 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1220);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1244 = fma(_1224, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1246 = fma(_1232, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1248 = fma(_1130, _1114, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1254 = fma(_1202, _1206, _1226);
    float _1256 = fma(_1204, _1206, _1228);
    float _1258 = fma(_1210, _1206, _1234);
    float _1260 = fma(_1238, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1262 = fma(_1242, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1264 = fma(_1252, _1148, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1266 = fma(_1244, _1192, _1254);
    float _1268 = fma(_1246, _1192, _1256);
    float _1270 = fma(_1248, _1192, _1258);
    float _1272 = -_195;
    int _1274 = _1076 ? as_type<int>(_1272) : as_type<int>(_195);
    float _1276 = fma(_1260, _1174, _1266);
    float _1278 = fma(_1262, _1174, _1268);
    float _1280 = fma(_1264, _1174, _1270);
    bool _1282 = !_1058;
    float _1284 = _1282 ? _195 : as_type<float>(_1274);
    float _1286 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1276);
    float _1288 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1278);
    float _1290 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1280);
    float _1292 = _889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1294 = exp2(_1018);
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1300 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1292);
    float _1302 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = -_1284;
    float _1308 = _1306 + 0.5;
    float _1310 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1300);
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    float _1320 = _1094 + 0.5;
    float _1322 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_58.x = _1304;
    out.m_58.y = _1314;
    out.m_58.z = _1316;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1326 = -_1294;
    float _1328 = _1326 + 1.0;
    float _1330 = _1318 + _929;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1336 = _1330 * 0.5;
    float _1338 = _1322 * _1312;
    out.gl_Position.x = _957;
    out.gl_Position.y = _961;
    out.gl_Position.z = _1318;
    out.gl_Position.w = _929;
    float _1340 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1342 = _1332 * _1324;
    out.m_45.x = _1340;
    out.m_60.x = _1342;
    out.m_60.y = _1338;
    out.m_62.z = _1336;
    out.m_62.w = _929;
    float _1344 = _1334 * _987;
    float _1346 = -_1334;
    float _1348 = _1346 + 1.0;
    float _1350 = _998 * _1344;
    float _1352 = _998 * _1348;
    float _1354 = _1012 * _1344;
    float _1356 = fma(_1008, _1350, _992);
    float _1358 = fma(_1010, _1350, _994);
    float _1360 = fma(_998, _1354, _996);
    out.m_64.x = _1356;
    out.m_64.y = _1358;
    out.m_64.z = _1360;
    out.m_64.w = _1352;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

