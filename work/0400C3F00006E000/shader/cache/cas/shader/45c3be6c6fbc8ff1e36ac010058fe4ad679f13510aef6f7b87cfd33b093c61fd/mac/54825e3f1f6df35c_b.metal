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
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
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
    bool _1085 = false;
    bool _701 = false;
    bool _597 = false;
    bool _475 = false;
    bool _281 = false;
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
        float _1575 = as_type<float>(_101);
        out.gl_Position.z = _1575;
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
        float _1644 = as_type<float>(_137);
        out.gl_Position.z = _1644;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.w;
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _141;
    if (!_151)
    {
        float _169 = _141 * _141;
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
    bool _181 = !_151;
    float _183 = _179;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _141 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _141);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_151;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _141 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _167 = _237;
    }
    float _239 = _167;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _153, _243);
    float _251 = fma(_239, _155, _245);
    float _253 = fma(_239, _157, _247);
    float _255 = fma(_249, _139, _159);
    float _257 = fma(_251, _139, _161);
    float _259 = fma(_253, _139, _163);
    bool _261 = !_241;
    float _279;
    if (!_261)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_85);
        float _285 = 1.0 / _283;
        float _287 = _119 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _289 + _295;
    bool _299 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_289);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _289 + _323;
    float _327 = 1.0 / _313;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _331 = 1.0 / _321;
    float _333 = 1.0 / _317;
    float _335 = _293 * _327;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_309;
    float _351 = _349 + 1.0;
    float _353 = _347 * _351;
    float _355 = _297 * _331;
    bool _357 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _325 * _333;
    bool _379 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_289);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = _367 * _371;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_393, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _399;
    float _409 = fma(_403, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = -_389;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = _405 * _407;
    float _421 = _409 * _407;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _431 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_427, _395, _429);
    float _443 = fma(_435, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _445 = fma(_431, _395, _437);
    float _447 = fma(_439, _353, _441);
    float _449 = fma(_443, _353, _445);
    float _451 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    bool _455 = !_329;
    float _473;
    if (!_455)
    {
        float _457 = in.m_53.x;
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _461 = _457 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _465 = _463 * _459;
        float _467 = floor(_465);
        float _469 = -_467;
        float _471 = _465 + _469;
        _473 = _471;
        _475 = true;
    }
    else
    {
        float _477 = float(_85);
        float _479 = 1.0 / _477;
        float _481 = _119 * _479;
        _473 = _481;
    }
    _475 = false;
    float _483 = _473;
    float _485 = in.m_51.x;
    float _487 = in.m_51.y;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _491 = _483 + _489;
    bool _493 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _495 = isnan(_483);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_483);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_503;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _527 = 1.0 / _507;
    float _529 = _519 * _523;
    float _531 = -_519;
    float _533 = _531 + 1.0;
    float _535 = _453 * _487;
    float _537 = _491 * _527;
    float _539 = _451 * _485;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_543, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_547, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _557 = fma(_551, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _529;
    float _561 = _555 * _529;
    float _563 = _557 * _529;
    float _565 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _567 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].x, _561);
    float _569 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].y, _565);
    float _573 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].x, _567);
    float _575 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].z, _569);
    bool _577 = !_525;
    float _595;
    if (!_577)
    {
        float _579 = in.m_53.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_85);
        float _601 = 1.0 / _599;
        float _603 = _119 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    bool _607 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = isnan(_605);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_605);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _635;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _641 = 1.0 / _621;
    float _643 = -_617;
    float _645 = _643 + 1.0;
    float _647 = _633 * _645;
    float _649 = -_633;
    float _651 = _649 + 1.0;
    float _653 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = _637 * _641;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _659 = _605 + _657;
    float _661 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _663 = fma(_655, _659, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _665 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _663 * _647;
    float _669 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _675 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[116].x, _673);
    float _679 = _677 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _665;
    out.m_55.y = _675;
    out.m_55.z = _671;
    out.m_55.w = _679;
    bool _681 = !_639;
    float _699;
    if (!_681)
    {
        float _683 = in.m_53.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _691 = _689 * _685;
        float _693 = floor(_691);
        float _695 = -_693;
        float _697 = _691 + _695;
        _699 = _697;
        _701 = true;
    }
    else
    {
        float _703 = float(_85);
        float _705 = 1.0 / _703;
        float _707 = _119 * _705;
        _699 = _707;
    }
    _701 = false;
    float _709 = _699;
    float _711 = as_type<float>(int(gl_VertexIndex));
    float _713 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _715 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _717 = in.m_53.x;
    float _719 = in.m_53.y;
    int _721 = as_type<int>(_711) & 1;
    bool _723 = _721 != 0;
    int _725 = as_type<int>(_711) & 2;
    bool _727 = _725 != 0;
    bool _729 = _717 > 0.5;
    bool _731 = !_727;
    float _733 = _731 ? (-0.5) : 0.5;
    bool _735 = !_723;
    float _737 = _735 ? (-0.5) : 0.5;
    bool _739 = _719 > 0.5;
    float _741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _733);
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _745 = _713 * _741;
    float _747 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _749 = _715 * _743;
    float _751 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _757 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _747);
    float _759 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _761 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
    float _763 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _751);
    float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
    float _767 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _757);
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _761);
    float _771 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _763);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
    float _775 = _767 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _777 = _769 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _779 = _771 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _781 = _773 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _783 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _785 = _775 + _777;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _791 = _779 + _781;
    float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _795 = _785 + _793;
    float _797 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _799 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _801 = _791 + _799;
    float _803 = 1.0 / _789;
    float _805 = _795 * _795;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _807;
    float _811 = _801 * _801;
    bool _813 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _815 = isnan(_709);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _797);
    float _827 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _783);
    float _829 = _805 + _811;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _833 = _709 + _831;
    bool _835 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _837 = isnan(_709);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _849 = sqrt(_829);
    float _851 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _827);
    float _853 = _847 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _855 = _809 * _803;
    float _857 = -_823;
    float _859 = _857 + 1.0;
    float _861 = _851 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _865 = fma(_855, _833, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _867 = _845 * _859;
    float _869 = -_845;
    float _871 = _869 + 1.0;
    float _873 = _853 + _861;
    float _875 = _865 * _867;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _879 = _877 != 0;
    bool _881 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = -_737;
    float _885 = _729 ? _883 : _737;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _889 = _887 != 0;
    float _891 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[131].x, _875);
    bool _893 = !_879;
    float _895 = _893 ? _737 : _885;
    float _897 = _871;
    float _899 = _737;
    float _901 = _875;
    float _903 = _853;
    float _905 = _885;
    if (!_881)
    {
        _897 = _811;
    }
    float _907 = _897;
    float _909 = _907;
    if (!_881)
    {
        _899 = _805;
    }
    float _911 = _899;
    float _913 = _911;
    if (!_881)
    {
        _901 = _785;
    }
    float _915 = _901;
    float _917 = _915;
    if (!_881)
    {
        _903 = _791;
    }
    float _919 = _903;
    float _921 = _919;
    if (!_881)
    {
        _905 = _873;
    }
    float _923 = _905;
    bool _925 = !_881;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _849 + _931;
        float _935 = _873 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = rsqrt(_829);
        float _939 = _933 * _929;
        float _941 = _939 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = cos(_947);
        float _951 = fma(_945, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _937 * _951;
        float _955 = _949 + (-1.0);
        float _957 = fma(_795, _953, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_801, _953, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _961 = _955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _965 = _957 + _963;
        float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _969 = _959 + _967;
        float _971 = fma(_873, _949, _961);
        float _973 = _965 * _965;
        float _975 = _969 * _969;
        _927 = _971;
        _913 = _973;
        _909 = _975;
        _917 = _957;
        _921 = _959;
    }
    float _977 = _927;
    float _979 = _913;
    float _981 = _909;
    float _983 = _917;
    float _985 = _921;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _989 = _977 + _987;
    float _991 = -_733;
    int _993 = _739 ? as_type<int>(_991) : as_type<int>(_733);
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _997 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[132].x, _891);
    float _999 = fma(_989, _989, _979);
    bool _1001 = !_889;
    float _1003 = _1001 ? _733 : as_type<float>(_993);
    float _1005 = _895 + 0.5;
    float _1007 = _999 + _981;
    float _1009 = -_1003;
    float _1011 = _1009 + 0.5;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1017 = sqrt(_1007);
    float _1019 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1025 = _1013 * _863;
    float _1027 = _1019 * _995;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.x = _1025;
    out.m_60.y = _1027;
    out.m_62.x = _1029;
    out.m_62.y = _1031;
    out.m_62.z = _1033;
    out.m_62.w = _1035;
    bool _1037 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1039 = isnan(_1017);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1045 = _1041 || _1043;
    float _1047 = _1015;
    float _1049 = _1027;
    if (!_1045)
    {
        _1047 = 1.0;
    }
    float _1051 = _1047;
    bool _1053 = !_1045;
    float _1055 = _1051;
    if (!_1053)
    {
        bool _1057 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1059 = isnan(_1017);
        bool _1061 = _1057 || _1059;
        bool _1063 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1065 = _1061 || _1063;
        if (!_1065)
        {
            float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1069 = _1017 + _1067;
            float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1073 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1071;
            float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1079 = 1.0 / _1073;
            float _1081 = _1069 * _1079;
            float _1083 = fma(_1081, _1077, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1055 = _1083;
            _1085 = true;
        }
        else
        {
            bool _1087 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1089 = isnan(_1017);
            bool _1091 = _1087 || _1089;
            bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1095 = _1091 || _1093;
            if (!_1095)
            {
                float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1099 = _1017 + _1097;
                float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1103 = _1101 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1109 = 1.0 / _1103;
                float _1111 = _1099 * _1109;
                float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1055 = _1113;
                _1085 = true;
            }
            else
            {
                _1055 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1085 = false;
    float _1115 = _1055;
    float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1119 = _977 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1123 = _983 + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1127 = _985 + _1125;
    float _1129 = fma(_1119, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1131 = fma(_1123, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1133 = fma(_1127, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1137 = _1129 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1141 = _1131 + _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1145 = _1133 + _1143;
    float _1147 = _1137 * _1137;
    float _1149 = fma(_1141, _1141, _1147);
    float _1151 = fma(_1145, _1145, _1149);
    float _1153 = rsqrt(_1151);
    float _1155 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1157 = _1141 * _1155;
    float _1159 = _1145 * _1155;
    float _1161 = _1157 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 + _1163;
    float _1167 = sqrt(_1165);
    bool _1169 = _1167 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1167 + _1171;
    float _1175 = _1145;
    float _1177 = _1149;
    float _1179 = _1173;
    float _1181 = _1137;
    float _1183 = _1155;
    float _1185 = _1157;
    if (_1169)
    {
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1187;
    }
    float _1189 = _1175;
    if (_1169)
    {
        float _1191 = rsqrt(_1165);
        _1177 = _1191;
    }
    float _1193 = _1177;
    float _1195 = _1193;
    if (_1169)
    {
        float _1197 = _1173 * _1189;
        _1179 = _1197;
    }
    float _1199 = _1179;
    if (_1169)
    {
        float _1201 = _1199 * 0.15915493667125701904296875;
        _1049 = _1201;
    }
    float _1203 = _1049;
    float _1205 = _1153;
    if (_1169)
    {
        float _1207 = _1203 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        _1205 = _1209;
    }
    float _1211 = _1205;
    float _1213 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1215 = precise::max(0.0, _1213);
    float _1217 = _1013;
    float _1219 = _1213;
    if (_1169)
    {
        float _1221 = _1203 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        _1217 = _1223;
    }
    float _1225 = _1217;
    float _1227 = -_1155;
    float _1229 = -_1215;
    float _1231 = fma(_1137, _1227, _1229);
    float _1233 = _1231;
    if (!_1169)
    {
        _1181 = _1159;
    }
    float _1235 = _1181;
    float _1237 = _1235;
    if (_1169)
    {
        float _1239 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1219 = _1239;
    }
    float _1241 = _1219;
    float _1243 = sqrt(_1151);
    float _1245 = _1211;
    float _1247 = _1241;
    if (_1169)
    {
        float _1249 = fma(_1211, _1241, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1245 = _1249;
    }
    float _1251 = _1245;
    float _1253 = _1251;
    if (_1169)
    {
        float _1255 = _1225 + (-1.0);
        _1247 = _1255;
    }
    float _1257 = _1247;
    float _1259 = _1257;
    if (_1169)
    {
        float _1261 = _1193 * _1251;
        _1183 = _1261;
    }
    float _1263 = _1183;
    if (!_1169)
    {
        _1253 = _1231;
    }
    float _1265 = _1253;
    float _1267 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1269 = _1265;
    if (_1169)
    {
        float _1271 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1271;
    }
    float _1273 = _1195;
    if (_1169)
    {
        float _1275 = _1157 * _1263;
        _1185 = _1275;
    }
    float _1277 = _1185;
    if (!_1169)
    {
        _1259 = _1161;
    }
    float _1279 = _1259;
    float _1281 = _1279;
    if (_1169)
    {
        float _1283 = _1159 * _1263;
        _1237 = _1283;
    }
    float _1285 = _1237;
    if (_1169)
    {
        float _1287 = fma(_1231, _1225, _1273);
        _1269 = _1287;
    }
    float _1289 = _1269;
    if (_1169)
    {
        float _1291 = _1277 * _1277;
        _1281 = _1291;
    }
    float _1293 = _1281;
    if (!_1169)
    {
        _1233 = _1163;
    }
    float _1295 = _1233;
    float _1297 = _1295;
    if (_1169)
    {
        float _1299 = _1285 * _1285;
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_1289, _1289, _1293);
    float _1305 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1267);
    float _1307 = _1303 + _1301;
    float _1309 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1319 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1325 = -_1315;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1331 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1333 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1323);
    float _1335 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1337 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1331);
    float _1339 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1333);
    float _1341 = abs(_1327);
    float _1343 = log2(_1341);
    float _1345 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1347 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1337);
    float _1349 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1351 = -_1345;
    float _1353 = fma(_1351, _1317, 1.0);
    float _1355 = _1321 * _1277;
    float _1357 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1305);
    float _1359 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1361 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1363 = _1321 * _1289;
    float _1365 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1321 * _1285;
    float _1369 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1361);
    float _1371 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = -_1365;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1373);
    float _1377 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1369);
    float _1381 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1383 = -_1367;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1375);
    float _1387 = log2(_1353);
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    float _1391 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1385, -0.5, 0.5);
    float _1395 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1381);
    float _1397 = fma(_1385, 0.5, 0.5);
    float _1399 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = _1363 + 1.0;
    float _1403 = exp2(_1377);
    float _1405 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1411 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1405);
    float _1413 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1415 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1417 = 1.0 / _1389;
    float _1419 = _1387 * 0.693147182464599609375;
    float _1421 = fma(_1397, _1413, 1.570728778839111328125);
    float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1425 = sqrt(_1393);
    float _1427 = -_1363;
    float _1429 = fma(_1403, _1401, _1427);
    float _1431 = fma(_1429, 0.5, 0.5);
    float _1433 = _1411 * _1417;
    float _1435 = _1415 * _1417;
    float _1437 = fma(_1433, 0.5, 0.5);
    float _1439 = fma(_1435, -0.5, 0.5);
    float _1441 = _1425 * 0.636619746685028076171875;
    float3 _3780 = float3(_1437, _1439, _1423);
    float _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3780, float3(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3780, float3(0.0), isnan(_3780)), level(0.0)).x;
    float3 _3791 = float3(_1437, _1439, _1423);
    float4 _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3791, float3(0.0), isnan(_3791)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3791, float3(0.0), isnan(_3791)), level(0.0)).xyzw;
    float _1448 = _1446.x;
    float _1450 = _1446.y;
    float _1452 = _1446.z;
    float _1454 = _1446.w;
    float _1456 = -_1421;
    float _1458 = fma(_1441, _1456, 1.0);
    float2 _3813 = float2(_1458, _1431);
    float3 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3813, float2(0.0), isnan(_3813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3813, float2(0.0), isnan(_3813)), level(0.0)).xyz;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1472 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1474 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1472);
    float _1476 = exp2(_1470);
    float _1478 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1480 = _1411 + _1389;
    float _1482 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1478);
    float _1484 = _1480 * 0.5;
    float _1486 = _1389 * 0.5;
    float _1488 = _1482 + _1389;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1415;
    out.gl_Position.z = _1482;
    out.gl_Position.w = _1389;
    float _1490 = fma(_1415, -0.5, _1486);
    float _1492 = _1488 * 0.5;
    float _1494 = -_1476;
    float _1496 = _1494 + 1.0;
    float _1498 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1484;
    out.m_64.y = _1490;
    out.m_64.z = _1492;
    out.m_64.w = _1389;
    float _1500 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1500;
    float _1502 = _1498 * _1443;
    float _1504 = -_1498;
    float _1506 = _1504 + 1.0;
    float _1508 = _1454 * _1502;
    float _1510 = _1468 * _1502;
    float _1512 = fma(_1464, _1508, _1448);
    float _1514 = fma(_1466, _1508, _1450);
    float _1516 = _1454 * _1506;
    float _1518 = fma(_1454, _1510, _1452);
    out.m_66.x = _1512;
    out.m_66.y = _1514;
    out.m_66.z = _1518;
    out.m_66.w = _1516;
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
    bool _1085 = false;
    bool _701 = false;
    bool _597 = false;
    bool _475 = false;
    bool _281 = false;
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
        float _1575 = as_type<float>(_101);
        out.gl_Position.z = _1575;
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
        float _1644 = as_type<float>(_137);
        out.gl_Position.z = _1644;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.w;
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _141;
    if (!_151)
    {
        float _169 = _141 * _141;
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
    bool _181 = !_151;
    float _183 = _179;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _141 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _141);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_151;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _141 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _167 = _237;
    }
    float _239 = _167;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _153, _243);
    float _251 = fma(_239, _155, _245);
    float _253 = fma(_239, _157, _247);
    float _255 = fma(_249, _139, _159);
    float _257 = fma(_251, _139, _161);
    float _259 = fma(_253, _139, _163);
    bool _261 = !_241;
    float _279;
    if (!_261)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_85);
        float _285 = 1.0 / _283;
        float _287 = _119 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _289 + _295;
    bool _299 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_289);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _289 + _323;
    float _327 = 1.0 / _313;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _331 = 1.0 / _321;
    float _333 = 1.0 / _317;
    float _335 = _293 * _327;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_309;
    float _351 = _349 + 1.0;
    float _353 = _347 * _351;
    float _355 = _297 * _331;
    bool _357 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _325 * _333;
    bool _379 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_289);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = _367 * _371;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_393, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _399;
    float _409 = fma(_403, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = -_389;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = _405 * _407;
    float _421 = _409 * _407;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _431 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_427, _395, _429);
    float _443 = fma(_435, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _445 = fma(_431, _395, _437);
    float _447 = fma(_439, _353, _441);
    float _449 = fma(_443, _353, _445);
    float _451 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    bool _455 = !_329;
    float _473;
    if (!_455)
    {
        float _457 = in.m_53.x;
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _461 = _457 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _465 = _463 * _459;
        float _467 = floor(_465);
        float _469 = -_467;
        float _471 = _465 + _469;
        _473 = _471;
        _475 = true;
    }
    else
    {
        float _477 = float(_85);
        float _479 = 1.0 / _477;
        float _481 = _119 * _479;
        _473 = _481;
    }
    _475 = false;
    float _483 = _473;
    float _485 = in.m_51.x;
    float _487 = in.m_51.y;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _491 = _483 + _489;
    bool _493 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _495 = isnan(_483);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_483);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_503;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _527 = 1.0 / _507;
    float _529 = _519 * _523;
    float _531 = -_519;
    float _533 = _531 + 1.0;
    float _535 = _453 * _487;
    float _537 = _491 * _527;
    float _539 = _451 * _485;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_543, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_547, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _557 = fma(_551, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _529;
    float _561 = _555 * _529;
    float _563 = _557 * _529;
    float _565 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _567 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].x, _561);
    float _569 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].y, _565);
    float _573 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].x, _567);
    float _575 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].z, _569);
    bool _577 = !_525;
    float _595;
    if (!_577)
    {
        float _579 = in.m_53.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_85);
        float _601 = 1.0 / _599;
        float _603 = _119 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    bool _607 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = isnan(_605);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_605);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _635;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _641 = 1.0 / _621;
    float _643 = -_617;
    float _645 = _643 + 1.0;
    float _647 = _633 * _645;
    float _649 = -_633;
    float _651 = _649 + 1.0;
    float _653 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = _637 * _641;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _659 = _605 + _657;
    float _661 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _663 = fma(_655, _659, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _665 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _663 * _647;
    float _669 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _675 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[116].x, _673);
    float _679 = _677 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _665;
    out.m_55.y = _675;
    out.m_55.z = _671;
    out.m_55.w = _679;
    bool _681 = !_639;
    float _699;
    if (!_681)
    {
        float _683 = in.m_53.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _691 = _689 * _685;
        float _693 = floor(_691);
        float _695 = -_693;
        float _697 = _691 + _695;
        _699 = _697;
        _701 = true;
    }
    else
    {
        float _703 = float(_85);
        float _705 = 1.0 / _703;
        float _707 = _119 * _705;
        _699 = _707;
    }
    _701 = false;
    float _709 = _699;
    float _711 = as_type<float>(int(gl_VertexIndex));
    float _713 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _715 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _717 = in.m_53.x;
    float _719 = in.m_53.y;
    int _721 = as_type<int>(_711) & 1;
    bool _723 = _721 != 0;
    int _725 = as_type<int>(_711) & 2;
    bool _727 = _725 != 0;
    bool _729 = _717 > 0.5;
    bool _731 = !_727;
    float _733 = _731 ? (-0.5) : 0.5;
    bool _735 = !_723;
    float _737 = _735 ? (-0.5) : 0.5;
    bool _739 = _719 > 0.5;
    float _741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _733);
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _745 = _713 * _741;
    float _747 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _749 = _715 * _743;
    float _751 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _757 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _747);
    float _759 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _761 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
    float _763 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _751);
    float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
    float _767 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _757);
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _761);
    float _771 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _763);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
    float _775 = _767 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _777 = _769 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _779 = _771 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _781 = _773 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _783 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _785 = _775 + _777;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _791 = _779 + _781;
    float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _795 = _785 + _793;
    float _797 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _799 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _801 = _791 + _799;
    float _803 = 1.0 / _789;
    float _805 = _795 * _795;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _807;
    float _811 = _801 * _801;
    bool _813 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _815 = isnan(_709);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _797);
    float _827 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _783);
    float _829 = _805 + _811;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _833 = _709 + _831;
    bool _835 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _837 = isnan(_709);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _849 = sqrt(_829);
    float _851 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _827);
    float _853 = _847 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _855 = _809 * _803;
    float _857 = -_823;
    float _859 = _857 + 1.0;
    float _861 = _851 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _865 = fma(_855, _833, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _867 = _845 * _859;
    float _869 = -_845;
    float _871 = _869 + 1.0;
    float _873 = _853 + _861;
    float _875 = _865 * _867;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _879 = _877 != 0;
    bool _881 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = -_737;
    float _885 = _729 ? _883 : _737;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _889 = _887 != 0;
    float _891 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[131].x, _875);
    bool _893 = !_879;
    float _895 = _893 ? _737 : _885;
    float _897 = _871;
    float _899 = _737;
    float _901 = _875;
    float _903 = _853;
    float _905 = _885;
    if (!_881)
    {
        _897 = _811;
    }
    float _907 = _897;
    float _909 = _907;
    if (!_881)
    {
        _899 = _805;
    }
    float _911 = _899;
    float _913 = _911;
    if (!_881)
    {
        _901 = _785;
    }
    float _915 = _901;
    float _917 = _915;
    if (!_881)
    {
        _903 = _791;
    }
    float _919 = _903;
    float _921 = _919;
    if (!_881)
    {
        _905 = _873;
    }
    float _923 = _905;
    bool _925 = !_881;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _849 + _931;
        float _935 = _873 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = rsqrt(_829);
        float _939 = _933 * _929;
        float _941 = _939 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = cos(_947);
        float _951 = fma(_945, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _937 * _951;
        float _955 = _949 + (-1.0);
        float _957 = fma(_795, _953, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_801, _953, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _961 = _955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _965 = _957 + _963;
        float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _969 = _959 + _967;
        float _971 = fma(_873, _949, _961);
        float _973 = _965 * _965;
        float _975 = _969 * _969;
        _927 = _971;
        _913 = _973;
        _909 = _975;
        _917 = _957;
        _921 = _959;
    }
    float _977 = _927;
    float _979 = _913;
    float _981 = _909;
    float _983 = _917;
    float _985 = _921;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _989 = _977 + _987;
    float _991 = -_733;
    int _993 = _739 ? as_type<int>(_991) : as_type<int>(_733);
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _997 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[132].x, _891);
    float _999 = fma(_989, _989, _979);
    bool _1001 = !_889;
    float _1003 = _1001 ? _733 : as_type<float>(_993);
    float _1005 = _895 + 0.5;
    float _1007 = _999 + _981;
    float _1009 = -_1003;
    float _1011 = _1009 + 0.5;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1017 = sqrt(_1007);
    float _1019 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1025 = _1013 * _863;
    float _1027 = _1019 * _995;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.x = _1025;
    out.m_60.y = _1027;
    out.m_62.x = _1029;
    out.m_62.y = _1031;
    out.m_62.z = _1033;
    out.m_62.w = _1035;
    bool _1037 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1039 = isnan(_1017);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1045 = _1041 || _1043;
    float _1047 = _1015;
    float _1049 = _1027;
    if (!_1045)
    {
        _1047 = 1.0;
    }
    float _1051 = _1047;
    bool _1053 = !_1045;
    float _1055 = _1051;
    if (!_1053)
    {
        bool _1057 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1059 = isnan(_1017);
        bool _1061 = _1057 || _1059;
        bool _1063 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1065 = _1061 || _1063;
        if (!_1065)
        {
            float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1069 = _1017 + _1067;
            float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1073 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1071;
            float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1079 = 1.0 / _1073;
            float _1081 = _1069 * _1079;
            float _1083 = fma(_1081, _1077, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1055 = _1083;
            _1085 = true;
        }
        else
        {
            bool _1087 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1089 = isnan(_1017);
            bool _1091 = _1087 || _1089;
            bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1095 = _1091 || _1093;
            if (!_1095)
            {
                float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1099 = _1017 + _1097;
                float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1103 = _1101 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1109 = 1.0 / _1103;
                float _1111 = _1099 * _1109;
                float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1055 = _1113;
                _1085 = true;
            }
            else
            {
                _1055 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1085 = false;
    float _1115 = _1055;
    float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1119 = _977 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1123 = _983 + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1127 = _985 + _1125;
    float _1129 = fma(_1119, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1131 = fma(_1123, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1133 = fma(_1127, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1137 = _1129 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1141 = _1131 + _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1145 = _1133 + _1143;
    float _1147 = _1137 * _1137;
    float _1149 = fma(_1141, _1141, _1147);
    float _1151 = fma(_1145, _1145, _1149);
    float _1153 = rsqrt(_1151);
    float _1155 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1157 = _1141 * _1155;
    float _1159 = _1145 * _1155;
    float _1161 = _1157 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 + _1163;
    float _1167 = sqrt(_1165);
    bool _1169 = _1167 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1167 + _1171;
    float _1175 = _1145;
    float _1177 = _1149;
    float _1179 = _1173;
    float _1181 = _1137;
    float _1183 = _1155;
    float _1185 = _1157;
    if (_1169)
    {
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1187;
    }
    float _1189 = _1175;
    if (_1169)
    {
        float _1191 = rsqrt(_1165);
        _1177 = _1191;
    }
    float _1193 = _1177;
    float _1195 = _1193;
    if (_1169)
    {
        float _1197 = _1173 * _1189;
        _1179 = _1197;
    }
    float _1199 = _1179;
    if (_1169)
    {
        float _1201 = _1199 * 0.15915493667125701904296875;
        _1049 = _1201;
    }
    float _1203 = _1049;
    float _1205 = _1153;
    if (_1169)
    {
        float _1207 = _1203 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        _1205 = _1209;
    }
    float _1211 = _1205;
    float _1213 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1215 = precise::max(0.0, _1213);
    float _1217 = _1013;
    float _1219 = _1213;
    if (_1169)
    {
        float _1221 = _1203 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        _1217 = _1223;
    }
    float _1225 = _1217;
    float _1227 = -_1155;
    float _1229 = -_1215;
    float _1231 = fma(_1137, _1227, _1229);
    float _1233 = _1231;
    if (!_1169)
    {
        _1181 = _1159;
    }
    float _1235 = _1181;
    float _1237 = _1235;
    if (_1169)
    {
        float _1239 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1219 = _1239;
    }
    float _1241 = _1219;
    float _1243 = sqrt(_1151);
    float _1245 = _1211;
    float _1247 = _1241;
    if (_1169)
    {
        float _1249 = fma(_1211, _1241, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1245 = _1249;
    }
    float _1251 = _1245;
    float _1253 = _1251;
    if (_1169)
    {
        float _1255 = _1225 + (-1.0);
        _1247 = _1255;
    }
    float _1257 = _1247;
    float _1259 = _1257;
    if (_1169)
    {
        float _1261 = _1193 * _1251;
        _1183 = _1261;
    }
    float _1263 = _1183;
    if (!_1169)
    {
        _1253 = _1231;
    }
    float _1265 = _1253;
    float _1267 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1269 = _1265;
    if (_1169)
    {
        float _1271 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1271;
    }
    float _1273 = _1195;
    if (_1169)
    {
        float _1275 = _1157 * _1263;
        _1185 = _1275;
    }
    float _1277 = _1185;
    if (!_1169)
    {
        _1259 = _1161;
    }
    float _1279 = _1259;
    float _1281 = _1279;
    if (_1169)
    {
        float _1283 = _1159 * _1263;
        _1237 = _1283;
    }
    float _1285 = _1237;
    if (_1169)
    {
        float _1287 = fma(_1231, _1225, _1273);
        _1269 = _1287;
    }
    float _1289 = _1269;
    if (_1169)
    {
        float _1291 = _1277 * _1277;
        _1281 = _1291;
    }
    float _1293 = _1281;
    if (!_1169)
    {
        _1233 = _1163;
    }
    float _1295 = _1233;
    float _1297 = _1295;
    if (_1169)
    {
        float _1299 = _1285 * _1285;
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_1289, _1289, _1293);
    float _1305 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1267);
    float _1307 = _1303 + _1301;
    float _1309 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1319 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1325 = -_1315;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1331 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1333 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1323);
    float _1335 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1337 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1331);
    float _1339 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1333);
    float _1341 = abs(_1327);
    float _1343 = log2(_1341);
    float _1345 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1347 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1337);
    float _1349 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1351 = -_1345;
    float _1353 = fma(_1351, _1317, 1.0);
    float _1355 = _1321 * _1277;
    float _1357 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1305);
    float _1359 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1361 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1363 = _1321 * _1289;
    float _1365 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1321 * _1285;
    float _1369 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1361);
    float _1371 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = -_1365;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1373);
    float _1377 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1369);
    float _1381 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1383 = -_1367;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1375);
    float _1387 = log2(_1353);
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    float _1391 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1385, -0.5, 0.5);
    float _1395 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1381);
    float _1397 = fma(_1385, 0.5, 0.5);
    float _1399 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = _1363 + 1.0;
    float _1403 = exp2(_1377);
    float _1405 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1411 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1405);
    float _1413 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1415 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1417 = 1.0 / _1389;
    float _1419 = _1387 * 0.693147182464599609375;
    float _1421 = fma(_1397, _1413, 1.570728778839111328125);
    float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1425 = sqrt(_1393);
    float _1427 = -_1363;
    float _1429 = fma(_1403, _1401, _1427);
    float _1431 = fma(_1429, 0.5, 0.5);
    float _1433 = _1411 * _1417;
    float _1435 = _1415 * _1417;
    float _1437 = fma(_1433, 0.5, 0.5);
    float _1439 = fma(_1435, -0.5, 0.5);
    float _1441 = _1425 * 0.636619746685028076171875;
    float3 _3780 = float3(_1437, _1439, _1423);
    float _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3780, float3(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3780, float3(0.0), isnan(_3780)), level(0.0)).x;
    float3 _3791 = float3(_1437, _1439, _1423);
    float4 _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3791, float3(0.0), isnan(_3791)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3791, float3(0.0), isnan(_3791)), level(0.0)).xyzw;
    float _1448 = _1446.x;
    float _1450 = _1446.y;
    float _1452 = _1446.z;
    float _1454 = _1446.w;
    float _1456 = -_1421;
    float _1458 = fma(_1441, _1456, 1.0);
    float2 _3813 = float2(_1458, _1431);
    float3 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3813, float2(0.0), isnan(_3813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3813, float2(0.0), isnan(_3813)), level(0.0)).xyz;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1472 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1474 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1472);
    float _1476 = exp2(_1470);
    float _1478 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1480 = _1411 + _1389;
    float _1482 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1478);
    float _1484 = _1480 * 0.5;
    float _1486 = _1389 * 0.5;
    float _1488 = _1482 + _1389;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1415;
    out.gl_Position.z = _1482;
    out.gl_Position.w = _1389;
    float _1490 = fma(_1415, -0.5, _1486);
    float _1492 = _1488 * 0.5;
    float _1494 = -_1476;
    float _1496 = _1494 + 1.0;
    float _1498 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1484;
    out.m_64.y = _1490;
    out.m_64.z = _1492;
    out.m_64.w = _1389;
    float _1500 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1500;
    float _1502 = _1498 * _1443;
    float _1504 = -_1498;
    float _1506 = _1504 + 1.0;
    float _1508 = _1454 * _1502;
    float _1510 = _1468 * _1502;
    float _1512 = fma(_1464, _1508, _1448);
    float _1514 = fma(_1466, _1508, _1450);
    float _1516 = _1454 * _1506;
    float _1518 = fma(_1454, _1510, _1452);
    out.m_66.x = _1512;
    out.m_66.y = _1514;
    out.m_66.z = _1518;
    out.m_66.w = _1516;
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
    bool _1085 = false;
    bool _701 = false;
    bool _597 = false;
    bool _475 = false;
    bool _281 = false;
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
        float _1575 = as_type<float>(_101);
        out.gl_Position.z = _1575;
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
        float _1644 = as_type<float>(_137);
        out.gl_Position.z = _1644;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.w;
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _141;
    if (!_151)
    {
        float _169 = _141 * _141;
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
    bool _181 = !_151;
    float _183 = _179;
    if (!_181)
    {
        float _185 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = log2(_185);
        float _189 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _191 = _189 + 1.0;
        float _193 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = _141 * _187;
        float _197 = 1.0 / _191;
        float _199 = _193 * 0.693147182464599609375;
        float _201 = exp2(_195);
        float _203 = 1.0 / _199;
        float _205 = _201 + (-1.0);
        float _207 = -_205;
        float _209 = fma(_207, _203, _141);
        float _211 = _209 * _197;
        float _213 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _213;
    }
    float _215 = _183;
    bool _217 = !_151;
    if (!_217)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _141 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _167 = _237;
    }
    float _239 = _167;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _249 = fma(_239, _153, _243);
    float _251 = fma(_239, _155, _245);
    float _253 = fma(_239, _157, _247);
    float _255 = fma(_249, _139, _159);
    float _257 = fma(_251, _139, _161);
    float _259 = fma(_253, _139, _163);
    bool _261 = !_241;
    float _279;
    if (!_261)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_85);
        float _285 = 1.0 / _283;
        float _287 = _119 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _289 + _295;
    bool _299 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_289);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _289 + _323;
    float _327 = 1.0 / _313;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _331 = 1.0 / _321;
    float _333 = 1.0 / _317;
    float _335 = _293 * _327;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_309;
    float _351 = _349 + 1.0;
    float _353 = _347 * _351;
    float _355 = _297 * _331;
    bool _357 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _325 * _333;
    bool _379 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _381 = isnan(_289);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _391;
    float _395 = _367 * _371;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_393, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _389 * _399;
    float _409 = fma(_403, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = -_389;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = _405 * _407;
    float _421 = _409 * _407;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _431 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _433;
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_427, _395, _429);
    float _443 = fma(_435, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _445 = fma(_431, _395, _437);
    float _447 = fma(_439, _353, _441);
    float _449 = fma(_443, _353, _445);
    float _451 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    bool _455 = !_329;
    float _473;
    if (!_455)
    {
        float _457 = in.m_53.x;
        float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _461 = _457 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _465 = _463 * _459;
        float _467 = floor(_465);
        float _469 = -_467;
        float _471 = _465 + _469;
        _473 = _471;
        _475 = true;
    }
    else
    {
        float _477 = float(_85);
        float _479 = 1.0 / _477;
        float _481 = _119 * _479;
        _473 = _481;
    }
    _475 = false;
    float _483 = _473;
    float _485 = in.m_51.x;
    float _487 = in.m_51.y;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _491 = _483 + _489;
    bool _493 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _495 = isnan(_483);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _483 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_483);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_503;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _527 = 1.0 / _507;
    float _529 = _519 * _523;
    float _531 = -_519;
    float _533 = _531 + 1.0;
    float _535 = _453 * _487;
    float _537 = _491 * _527;
    float _539 = _451 * _485;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_543, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_547, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _557 = fma(_551, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _529;
    float _561 = _555 * _529;
    float _563 = _557 * _529;
    float _565 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _567 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].x, _561);
    float _569 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].y, _565);
    float _573 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].x, _567);
    float _575 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].z, _569);
    bool _577 = !_525;
    float _595;
    if (!_577)
    {
        float _579 = in.m_53.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_85);
        float _601 = 1.0 / _599;
        float _603 = _119 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    bool _607 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = isnan(_605);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_605);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _635;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _641 = 1.0 / _621;
    float _643 = -_617;
    float _645 = _643 + 1.0;
    float _647 = _633 * _645;
    float _649 = -_633;
    float _651 = _649 + 1.0;
    float _653 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = _637 * _641;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _659 = _605 + _657;
    float _661 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _663 = fma(_655, _659, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _665 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _663 * _647;
    float _669 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _675 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[116].x, _673);
    float _679 = _677 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _665;
    out.m_55.y = _675;
    out.m_55.z = _671;
    out.m_55.w = _679;
    bool _681 = !_639;
    float _699;
    if (!_681)
    {
        float _683 = in.m_53.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _691 = _689 * _685;
        float _693 = floor(_691);
        float _695 = -_693;
        float _697 = _691 + _695;
        _699 = _697;
        _701 = true;
    }
    else
    {
        float _703 = float(_85);
        float _705 = 1.0 / _703;
        float _707 = _119 * _705;
        _699 = _707;
    }
    _701 = false;
    float _709 = _699;
    float _711 = as_type<float>(int(gl_VertexIndex));
    float _713 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _715 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _717 = in.m_53.x;
    float _719 = in.m_53.y;
    int _721 = as_type<int>(_711) & 1;
    bool _723 = _721 != 0;
    int _725 = as_type<int>(_711) & 2;
    bool _727 = _725 != 0;
    bool _729 = _717 > 0.5;
    bool _731 = !_727;
    float _733 = _731 ? (-0.5) : 0.5;
    bool _735 = !_723;
    float _737 = _735 ? (-0.5) : 0.5;
    bool _739 = _719 > 0.5;
    float _741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _733);
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _745 = _713 * _741;
    float _747 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _749 = _715 * _743;
    float _751 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _757 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].x, _747);
    float _759 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _761 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
    float _763 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].x, _751);
    float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
    float _767 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].z, _757);
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _761);
    float _771 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].z, _763);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
    float _775 = _767 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _777 = _769 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _779 = _771 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _781 = _773 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _783 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _785 = _775 + _777;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _791 = _779 + _781;
    float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _795 = _785 + _793;
    float _797 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _799 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _801 = _791 + _799;
    float _803 = 1.0 / _789;
    float _805 = _795 * _795;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _807;
    float _811 = _801 * _801;
    bool _813 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _815 = isnan(_709);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].x, _797);
    float _827 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _783);
    float _829 = _805 + _811;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _833 = _709 + _831;
    bool _835 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _837 = isnan(_709);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _849 = sqrt(_829);
    float _851 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _827);
    float _853 = _847 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _855 = _809 * _803;
    float _857 = -_823;
    float _859 = _857 + 1.0;
    float _861 = _851 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _865 = fma(_855, _833, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _867 = _845 * _859;
    float _869 = -_845;
    float _871 = _869 + 1.0;
    float _873 = _853 + _861;
    float _875 = _865 * _867;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _879 = _877 != 0;
    bool _881 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = -_737;
    float _885 = _729 ? _883 : _737;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _889 = _887 != 0;
    float _891 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[131].x, _875);
    bool _893 = !_879;
    float _895 = _893 ? _737 : _885;
    float _897 = _871;
    float _899 = _737;
    float _901 = _875;
    float _903 = _853;
    float _905 = _885;
    if (!_881)
    {
        _897 = _811;
    }
    float _907 = _897;
    float _909 = _907;
    if (!_881)
    {
        _899 = _805;
    }
    float _911 = _899;
    float _913 = _911;
    if (!_881)
    {
        _901 = _785;
    }
    float _915 = _901;
    float _917 = _915;
    if (!_881)
    {
        _903 = _791;
    }
    float _919 = _903;
    float _921 = _919;
    if (!_881)
    {
        _905 = _873;
    }
    float _923 = _905;
    bool _925 = !_881;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _849 + _931;
        float _935 = _873 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = rsqrt(_829);
        float _939 = _933 * _929;
        float _941 = _939 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = cos(_947);
        float _951 = fma(_945, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _937 * _951;
        float _955 = _949 + (-1.0);
        float _957 = fma(_795, _953, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_801, _953, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _961 = _955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _965 = _957 + _963;
        float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _969 = _959 + _967;
        float _971 = fma(_873, _949, _961);
        float _973 = _965 * _965;
        float _975 = _969 * _969;
        _927 = _971;
        _913 = _973;
        _909 = _975;
        _917 = _957;
        _921 = _959;
    }
    float _977 = _927;
    float _979 = _913;
    float _981 = _909;
    float _983 = _917;
    float _985 = _921;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _989 = _977 + _987;
    float _991 = -_733;
    int _993 = _739 ? as_type<int>(_991) : as_type<int>(_733);
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _997 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[132].x, _891);
    float _999 = fma(_989, _989, _979);
    bool _1001 = !_889;
    float _1003 = _1001 ? _733 : as_type<float>(_993);
    float _1005 = _895 + 0.5;
    float _1007 = _999 + _981;
    float _1009 = -_1003;
    float _1011 = _1009 + 0.5;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1017 = sqrt(_1007);
    float _1019 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1025 = _1013 * _863;
    float _1027 = _1019 * _995;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.x = _1025;
    out.m_60.y = _1027;
    out.m_62.x = _1029;
    out.m_62.y = _1031;
    out.m_62.z = _1033;
    out.m_62.w = _1035;
    bool _1037 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1039 = isnan(_1017);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1045 = _1041 || _1043;
    float _1047 = _1015;
    float _1049 = _1027;
    if (!_1045)
    {
        _1047 = 1.0;
    }
    float _1051 = _1047;
    bool _1053 = !_1045;
    float _1055 = _1051;
    if (!_1053)
    {
        bool _1057 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1059 = isnan(_1017);
        bool _1061 = _1057 || _1059;
        bool _1063 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1065 = _1061 || _1063;
        if (!_1065)
        {
            float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1069 = _1017 + _1067;
            float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1073 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1071;
            float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1079 = 1.0 / _1073;
            float _1081 = _1069 * _1079;
            float _1083 = fma(_1081, _1077, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1055 = _1083;
            _1085 = true;
        }
        else
        {
            bool _1087 = _1017 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1089 = isnan(_1017);
            bool _1091 = _1087 || _1089;
            bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1095 = _1091 || _1093;
            if (!_1095)
            {
                float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1099 = _1017 + _1097;
                float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1103 = _1101 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1109 = 1.0 / _1103;
                float _1111 = _1099 * _1109;
                float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1055 = _1113;
                _1085 = true;
            }
            else
            {
                _1055 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1085 = false;
    float _1115 = _1055;
    float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1119 = _977 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1123 = _983 + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1127 = _985 + _1125;
    float _1129 = fma(_1119, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1131 = fma(_1123, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1133 = fma(_1127, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1137 = _1129 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1141 = _1131 + _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1145 = _1133 + _1143;
    float _1147 = _1137 * _1137;
    float _1149 = fma(_1141, _1141, _1147);
    float _1151 = fma(_1145, _1145, _1149);
    float _1153 = rsqrt(_1151);
    float _1155 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1157 = _1141 * _1155;
    float _1159 = _1145 * _1155;
    float _1161 = _1157 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 + _1163;
    float _1167 = sqrt(_1165);
    bool _1169 = _1167 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1167 + _1171;
    float _1175 = _1145;
    float _1177 = _1149;
    float _1179 = _1173;
    float _1181 = _1137;
    float _1183 = _1155;
    float _1185 = _1157;
    if (_1169)
    {
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1187;
    }
    float _1189 = _1175;
    if (_1169)
    {
        float _1191 = rsqrt(_1165);
        _1177 = _1191;
    }
    float _1193 = _1177;
    float _1195 = _1193;
    if (_1169)
    {
        float _1197 = _1173 * _1189;
        _1179 = _1197;
    }
    float _1199 = _1179;
    if (_1169)
    {
        float _1201 = _1199 * 0.15915493667125701904296875;
        _1049 = _1201;
    }
    float _1203 = _1049;
    float _1205 = _1153;
    if (_1169)
    {
        float _1207 = _1203 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        _1205 = _1209;
    }
    float _1211 = _1205;
    float _1213 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1215 = precise::max(0.0, _1213);
    float _1217 = _1013;
    float _1219 = _1213;
    if (_1169)
    {
        float _1221 = _1203 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        _1217 = _1223;
    }
    float _1225 = _1217;
    float _1227 = -_1155;
    float _1229 = -_1215;
    float _1231 = fma(_1137, _1227, _1229);
    float _1233 = _1231;
    if (!_1169)
    {
        _1181 = _1159;
    }
    float _1235 = _1181;
    float _1237 = _1235;
    if (_1169)
    {
        float _1239 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1219 = _1239;
    }
    float _1241 = _1219;
    float _1243 = sqrt(_1151);
    float _1245 = _1211;
    float _1247 = _1241;
    if (_1169)
    {
        float _1249 = fma(_1211, _1241, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1245 = _1249;
    }
    float _1251 = _1245;
    float _1253 = _1251;
    if (_1169)
    {
        float _1255 = _1225 + (-1.0);
        _1247 = _1255;
    }
    float _1257 = _1247;
    float _1259 = _1257;
    if (_1169)
    {
        float _1261 = _1193 * _1251;
        _1183 = _1261;
    }
    float _1263 = _1183;
    if (!_1169)
    {
        _1253 = _1231;
    }
    float _1265 = _1253;
    float _1267 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1269 = _1265;
    if (_1169)
    {
        float _1271 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1271;
    }
    float _1273 = _1195;
    if (_1169)
    {
        float _1275 = _1157 * _1263;
        _1185 = _1275;
    }
    float _1277 = _1185;
    if (!_1169)
    {
        _1259 = _1161;
    }
    float _1279 = _1259;
    float _1281 = _1279;
    if (_1169)
    {
        float _1283 = _1159 * _1263;
        _1237 = _1283;
    }
    float _1285 = _1237;
    if (_1169)
    {
        float _1287 = fma(_1231, _1225, _1273);
        _1269 = _1287;
    }
    float _1289 = _1269;
    if (_1169)
    {
        float _1291 = _1277 * _1277;
        _1281 = _1291;
    }
    float _1293 = _1281;
    if (!_1169)
    {
        _1233 = _1163;
    }
    float _1295 = _1233;
    float _1297 = _1295;
    if (_1169)
    {
        float _1299 = _1285 * _1285;
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_1289, _1289, _1293);
    float _1305 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1267);
    float _1307 = _1303 + _1301;
    float _1309 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1319 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1325 = -_1315;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1331 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1333 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1323);
    float _1335 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1337 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1331);
    float _1339 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1333);
    float _1341 = abs(_1327);
    float _1343 = log2(_1341);
    float _1345 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1347 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1337);
    float _1349 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1351 = -_1345;
    float _1353 = fma(_1351, _1317, 1.0);
    float _1355 = _1321 * _1277;
    float _1357 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1305);
    float _1359 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1361 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1363 = _1321 * _1289;
    float _1365 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1321 * _1285;
    float _1369 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1361);
    float _1371 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = -_1365;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1373);
    float _1377 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1369);
    float _1381 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1383 = -_1367;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1375);
    float _1387 = log2(_1353);
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1379);
    float _1391 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1385, -0.5, 0.5);
    float _1395 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1381);
    float _1397 = fma(_1385, 0.5, 0.5);
    float _1399 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = _1363 + 1.0;
    float _1403 = exp2(_1377);
    float _1405 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1411 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1405);
    float _1413 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1415 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1417 = 1.0 / _1389;
    float _1419 = _1387 * 0.693147182464599609375;
    float _1421 = fma(_1397, _1413, 1.570728778839111328125);
    float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1425 = sqrt(_1393);
    float _1427 = -_1363;
    float _1429 = fma(_1403, _1401, _1427);
    float _1431 = fma(_1429, 0.5, 0.5);
    float _1433 = _1411 * _1417;
    float _1435 = _1415 * _1417;
    float _1437 = fma(_1433, 0.5, 0.5);
    float _1439 = fma(_1435, -0.5, 0.5);
    float _1441 = _1425 * 0.636619746685028076171875;
    float3 _3780 = float3(_1437, _1439, _1423);
    float _1443 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3780, float3(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3780, float3(0.0), isnan(_3780)), level(0.0)).x;
    float3 _3791 = float3(_1437, _1439, _1423);
    float4 _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3791, float3(0.0), isnan(_3791)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3791, float3(0.0), isnan(_3791)), level(0.0)).xyzw;
    float _1448 = _1446.x;
    float _1450 = _1446.y;
    float _1452 = _1446.z;
    float _1454 = _1446.w;
    float _1456 = -_1421;
    float _1458 = fma(_1441, _1456, 1.0);
    float2 _3813 = float2(_1458, _1431);
    float3 _1462 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3813, float2(0.0), isnan(_3813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3813, float2(0.0), isnan(_3813)), level(0.0)).xyz;
    float _1464 = _1462.x;
    float _1466 = _1462.y;
    float _1468 = _1462.z;
    float _1470 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1472 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1474 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1472);
    float _1476 = exp2(_1470);
    float _1478 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1474);
    float _1480 = _1411 + _1389;
    float _1482 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1478);
    float _1484 = _1480 * 0.5;
    float _1486 = _1389 * 0.5;
    float _1488 = _1482 + _1389;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1415;
    out.gl_Position.z = _1482;
    out.gl_Position.w = _1389;
    float _1490 = fma(_1415, -0.5, _1486);
    float _1492 = _1488 * 0.5;
    float _1494 = -_1476;
    float _1496 = _1494 + 1.0;
    float _1498 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1484;
    out.m_64.y = _1490;
    out.m_64.z = _1492;
    out.m_64.w = _1389;
    float _1500 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1500;
    float _1502 = _1498 * _1443;
    float _1504 = -_1498;
    float _1506 = _1504 + 1.0;
    float _1508 = _1454 * _1502;
    float _1510 = _1468 * _1502;
    float _1512 = fma(_1464, _1508, _1448);
    float _1514 = fma(_1466, _1508, _1450);
    float _1516 = _1454 * _1506;
    float _1518 = fma(_1454, _1510, _1452);
    out.m_66.x = _1512;
    out.m_66.y = _1514;
    out.m_66.z = _1518;
    out.m_66.w = _1516;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

