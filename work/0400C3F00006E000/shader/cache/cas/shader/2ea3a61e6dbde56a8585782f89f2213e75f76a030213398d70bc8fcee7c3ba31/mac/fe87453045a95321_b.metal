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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2316 = false;
    bool _667 = false;
    bool _525 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2614 = as_type<float>(_121);
        out.gl_Position.z = _2614;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_161);
        out.gl_Position.z = _2683;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _207;
    if (!_189)
    {
        float _191 = in.m_55.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_107);
        float _213 = 1.0 / _211;
        float _215 = _139 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    bool _227 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _229 = isnan(_217);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _217 + _251;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _249;
    float _261 = 1.0 / _245;
    float _263 = _221 * _255;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_237;
    float _279 = _277 + 1.0;
    float _281 = _275 * _279;
    float _283 = _225 * _259;
    bool _285 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_217);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = _253 * _261;
    bool _307 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_217);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = _295 * _299;
    float _325 = -_295;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _317 * _327;
    float _341 = fma(_331, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = fma(_303, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_335, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_317;
    float _349 = _347 + 1.0;
    float _351 = _337 * _339;
    float _353 = _341 * _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _359;
    float _363 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_361, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _371 = fma(_343, _323, _363);
    float _373 = fma(_345, _323, _365);
    float _375 = fma(_367, _281, _371);
    float _377 = fma(_369, _281, _373);
    float _379 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_257;
    float _401;
    if (!_383)
    {
        float _385 = in.m_55.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_107);
        float _407 = 1.0 / _405;
        float _409 = _139 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_57.x;
    float _415 = in.m_57.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = _411 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _421;
    bool _425 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_411);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _439 = 1.0 / _423;
    float _441 = _381 * _415;
    bool _443 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_411);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = _419 * _439;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = -_453;
    float _463 = _461 + 1.0;
    float _465 = _379 * _413;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _467;
    float _471 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = _435 * _463;
    float _479 = fma(_469, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _481 = -_435;
    float _483 = _481 + 1.0;
    float _485 = fma(_475, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _487 = _471 * _477;
    float _489 = _479 * _477;
    float _491 = _485 * _477;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _489);
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _499 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].y, _493);
    float _501 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].x, _495);
    float _503 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].z, _497);
    bool _505 = !_437;
    float _523;
    if (!_505)
    {
        float _507 = in.m_55.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _511 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _515 = _513 * _509;
        float _517 = floor(_515);
        float _519 = -_517;
        float _521 = _515 + _519;
        _523 = _521;
        _525 = true;
    }
    else
    {
        float _527 = float(_107);
        float _529 = 1.0 / _527;
        float _531 = _139 * _529;
        _523 = _531;
    }
    _525 = false;
    float _533 = _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_533);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _561 = isnan(_533);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    bool _575 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_533);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = -_553;
    float _591 = _589 + 1.0;
    bool _593 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _595 = _569 * _591;
    float _597 = -_569;
    float _599 = _597 + 1.0;
    float _601 = 1.0 / _557;
    float _603 = _573 * _587;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _609 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = _609 * _595;
    float _617 = _607 * _601;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _533 + _619;
    float _623 = _553 * _613;
    float _625 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _615);
    float _627 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _629 = fma(_617, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = fma(_629, _623, _625);
    float _637 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[117].x, _635);
    float _645 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _637;
    out.m_59.y = _639;
    out.m_59.z = _641;
    out.m_59.w = _645;
    bool _647 = !_593;
    float _665;
    if (!_647)
    {
        float _649 = in.m_55.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_107);
        float _671 = 1.0 / _669;
        float _673 = _139 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    float _681 = in.m_55.x;
    float _683 = in.m_55.y;
    float _685 = in.m_55.z;
    float _687 = in.m_55.w;
    float _689 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _691 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _699 = _695 || _697;
    float _701 = as_type<float>(int(gl_VertexIndex));
    bool _703 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(1.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _715 = 1.0 + _713;
    float _717 = in.m_64.x;
    float _719 = in.m_64.y;
    float _721 = in.m_64.z;
    float _723 = 1.0 / _715;
    float _725 = _679 * _139;
    float _727 = exp2(_725);
    float _729 = _685 * 2.0;
    float _731 = _683 * 2.0;
    float _733 = floor(_729);
    float _735 = -_727;
    float _737 = _735 + 1.0;
    float _739 = _681 * 2.0;
    float _741 = _683 + _681;
    float _743 = floor(_731);
    float _745 = _699 ? _737 : 0.0;
    float _747 = _741 + (-1.0);
    int _749 = as_type<int>(_701) & 1;
    bool _751 = _749 != 0;
    int _753 = as_type<int>(_701) & 2;
    bool _755 = _753 != 0;
    bool _757 = _683 > 0.5;
    if (_711)
    {
        float _759 = _745 * _723;
        _143 = _759;
    }
    float _761 = _143;
    bool _763 = _685 > 0.5;
    float _765 = floor(_739);
    bool _767 = !_751;
    float _769 = _767 ? (-0.5) : 0.5;
    bool _771 = !_755;
    float _773 = _771 ? (-0.5) : 0.5;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _777 = _775 != 0;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _781 = _779 != 0;
    float _783 = -_769;
    int _785 = _757 ? as_type<int>(_783) : as_type<int>(_769);
    float _787 = -_773;
    int _789 = _763 ? as_type<int>(_787) : as_type<int>(_773);
    bool _791 = !_777;
    float _793 = _791 ? _769 : as_type<float>(_785);
    bool _795 = !_781;
    float _797 = _795 ? _773 : as_type<float>(_789);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _809 = _807 != 0;
    bool _811 = _733 >= 0.0;
    bool _813 = isnan(_733);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    bool _821 = !_801;
    int _823 = _821 ? 0 : 1;
    bool _825 = _733 > 0.0;
    int _827 = _819 ? 0 : 1;
    int _829 = abs(_823);
    float _831 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _833 = _765 > 0.0;
    bool _835 = _765 >= 0.0;
    bool _837 = isnan(_765);
    bool _839 = _835 || _837;
    bool _841 = isnan(0.0);
    bool _843 = _839 || _841;
    int _845 = ~_827;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    if (!_825)
    {
        int _853 = ~_827;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = float(_829);
    float _861 = float(_857);
    int _863 = _843 ? 0 : 1;
    bool _865 = !_805;
    int _867 = _865 ? 0 : 1;
    float _869 = _859 * _861;
    bool _871 = _743 > 0.0;
    float _873 = _681 + (-0.5);
    int _875 = ~_863;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = _869 * (-2.0);
    int _883 = _879;
    float _885 = _881;
    if (!_833)
    {
        int _887 = ~_863;
        int _889 = _887 + 1;
        _883 = _889;
    }
    int _891 = _883;
    int _893 = abs(_867);
    float _895 = fma(_881, _717, _717);
    bool _897 = _743 >= 0.0;
    bool _899 = isnan(_743);
    bool _901 = _897 || _899;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    float _907 = fma(_831, _881, _831);
    bool _909 = !_809;
    int _911 = _909 ? 0 : 1;
    float _913 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _895);
    float _915 = float(_891);
    float _917 = _683 + _685;
    float _919 = float(_893);
    float _921 = fma(_907, _761, _913);
    int _923 = _905 ? 0 : 1;
    float _925 = _917 + (-1.0);
    int _927 = abs(_911);
    float _929 = _919 * _915;
    float _931 = _683 + (-0.5);
    int _933 = ~_923;
    int _935 = _933 + 1;
    int _937 = _935 + 1;
    float _939 = _921 * 0.15915493667125701904296875;
    int _941 = _937;
    if (!_871)
    {
        int _943 = ~_923;
        int _945 = _943 + 1;
        _941 = _945;
    }
    int _947 = _941;
    float _949 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _951 = _929 * (-2.0);
    float _953 = float(_947);
    float _955 = _685 + _681;
    float _957 = float(_927);
    float _959 = fma(_951, _719, _719);
    float _961 = fma(_949, _951, _949);
    float _963 = _955 + (-1.0);
    float _965 = _957 * _953;
    float _967 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].y, _959);
    float _969 = _685 + (-0.5);
    float _971 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _973 = _965 * (-2.0);
    float _975 = fma(_961, _761, _967);
    float _977 = _939 * 6.283185482025146484375;
    float _979 = cos(_977);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _773);
    float _983 = fma(_973, _721, _721);
    float _985 = fma(_971, _973, _971);
    float _987 = _975 * 0.15915493667125701904296875;
    float _989 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _991 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[196].z, _983);
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _769);
    float _995 = _987 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _989 * _981;
    float _1001 = fma(_985, _761, _991);
    float _1003 = _689 * _993;
    float _1005 = _1001 * 0.15915493667125701904296875;
    float _1007 = _987 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = in.m_46.x;
    float _1013 = in.m_46.y;
    float _1015 = in.m_46.z;
    float _1017 = _939 * 6.283185482025146484375;
    float _1019 = sin(_1017);
    float _1021 = _979 * _997;
    float _1023 = _1005 * 6.283185482025146484375;
    float _1025 = cos(_1023);
    float _1027 = _979 * _1009;
    float _1029 = _1005 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _1019 * _997;
    float _1035 = _1019 * _1009;
    float _1037 = _979 * _1025;
    float _1039 = _1019 * _1025;
    float _1041 = _1009 * _1025;
    float _1043 = _997 * _1025;
    float _1045 = _1037 * _999;
    float _1047 = _1039 * _999;
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_1031, _1027, _1033);
    float _1053 = -_1021;
    float _1055 = fma(_1031, _1035, _1053);
    float _1057 = -_1035;
    float _1059 = fma(_1031, _1021, _1057);
    float _1061 = -_999;
    float _1063 = _1031 * _1061;
    float _1065 = fma(_1051, _1003, _1045);
    float _1067 = fma(_1031, _1033, _1027);
    float _1069 = fma(_1055, _1003, _1047);
    float _1071 = fma(_1041, _1003, _1063);
    float _1073 = fma(_1059, _1049, _1065);
    float _1075 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1077 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1079 = fma(_1043, _1049, _1071);
    float _1081 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = fma(_1067, _1049, _1069);
    float _1087 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1075);
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1081);
    float _1091 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1077);
    float _1093 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1095 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1087);
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1089);
    float _1099 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1091);
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1107 = _1099 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1113 = _1103 + _1105;
    float _1115 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1117 = _1107 + _1109;
    float _1119 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1111);
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1113 + _1121;
    float _1125 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1115);
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1129 = _1117 + _1127;
    float _1131 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1119);
    float _1133 = _1123 * _1123;
    float _1135 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    float _1137 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1139 = fma(_1129, _1129, _1133);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = sqrt(_1139);
    float _1145 = _1137 + _1141;
    bool _1147 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = _1117;
    float _1151 = _1113;
    float _1153 = _1079;
    if (!_1147)
    {
        _885 = _1145;
    }
    float _1155 = _885;
    bool _1157 = !_1147;
    float _1159 = _1155;
    if (!_1157)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1165 = _1143 + _1163;
        float _1167 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1169 = rsqrt(_1139);
        float _1171 = _1165 * _1161;
        float _1173 = _1171 * 0.15915493667125701904296875;
        float _1175 = _1173 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1173 * 6.283185482025146484375;
        float _1181 = sin(_1179);
        float _1183 = _1177 + (-1.0);
        float _1185 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = fma(_1181, _1167, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1189 = fma(_1145, _1177, _1185);
        float _1191 = _1169 * _1187;
        float _1193 = fma(_1129, _1191, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1195 = fma(_1123, _1191, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1159 = _1189;
        _1149 = _1193;
        _1151 = _1195;
        _1153 = _1169;
    }
    float _1197 = _1159;
    float _1199 = _1149;
    float _1201 = _1151;
    float _1203 = _1153;
    float _1205 = -_1137;
    float _1207 = _1205 + _1197;
    float _1209 = -_1107;
    float _1211 = _1209 + _1199;
    float _1213 = -_1103;
    float _1215 = _1213 + _1201;
    float _1217 = _1207 * _1207;
    float _1219 = fma(_1211, _1211, _1217);
    float _1221 = fma(_1215, _1215, _1219);
    float _1223 = sqrt(_1221);
    bool _1225 = _1223 > 0.0;
    bool _1227 = !_1225;
    float _1229 = _1197;
    float _1231 = _1199;
    float _1233 = _1201;
    float _1235 = _1203;
    float _1237 = _1215;
    if (!_1227)
    {
        float _1239 = _185 * _185;
        float _1241 = fma(_183, _183, _1239);
        float _1243 = fma(_187, _187, _1241);
        float _1245 = rsqrt(_1221);
        float _1247 = sqrt(_1243);
        float _1249 = _1211 * _1245;
        float _1251 = _1207 * _1245;
        float _1253 = _1215 * _1245;
        bool _1255 = _1247 > 0.0;
        bool _1257 = !_1255;
        _1235 = _1247;
        if (!_1257)
        {
            float _1259 = rsqrt(_1243);
            float _1261 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1263 = _185 * _1259;
            float _1265 = _183 * _1259;
            float _1267 = _187 * _1259;
            float _1269 = _1251 * _1263;
            float _1271 = fma(_1249, _1265, _1269);
            float _1273 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1275 = fma(_1253, _1267, _1271);
            float _1277 = _1275 * _1273;
            float _1279 = fma(_183, _1277, _1199);
            float _1281 = fma(_185, _1277, _1197);
            float _1283 = fma(_187, _1277, _1201);
            _1229 = _1281;
            _1231 = _1279;
            _1233 = _1283;
            _1235 = _1263;
        }
    }
    float _1285 = _1229;
    float _1287 = _1231;
    float _1289 = _1233;
    float _1291 = _1235;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1295 = _1285 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1299 = _1287 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1289 + _1301;
    float _1305 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1307 = _1295 * _1295;
    float _1309 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1305);
    float _1311 = fma(_1299, _1299, _1307);
    float _1313 = fma(_1303, _1303, _1311);
    float _1315 = rsqrt(_1313);
    float _1317 = sqrt(_1313);
    float _1319 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1321 = _1299 * _1319;
    float _1323 = _1303 * _1319;
    float _1325 = _1321 * _1321;
    float _1327 = _1323 * _1323;
    float _1329 = _1325 + _1327;
    float _1331 = sqrt(_1329);
    bool _1333 = _1331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1337 = _1331 + _1335;
    float _1339 = _1315;
    float _1341 = _1329;
    float _1343 = _1337;
    float _1345 = _1291;
    float _1347 = _1295;
    if (_1333)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1349;
    }
    float _1351 = _1339;
    if (_1333)
    {
        float _1353 = rsqrt(_1329);
        _1341 = _1353;
    }
    float _1355 = _1341;
    float _1357 = _1355;
    if (_1333)
    {
        float _1359 = _1337 * _1351;
        _1343 = _1359;
    }
    float _1361 = _1343;
    if (_1333)
    {
        float _1363 = _1361 * 0.15915493667125701904296875;
        _1345 = _1363;
    }
    float _1365 = _1345;
    float _1367 = _1303;
    float _1369 = _1365;
    if (_1333)
    {
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        _1367 = _1373;
    }
    float _1375 = _1367;
    float _1377 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1379 = precise::max(0.0, _1377);
    float _1381 = _1351;
    float _1383 = _1379;
    if (_1333)
    {
        float _1385 = _1365 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        _1381 = _1387;
    }
    float _1389 = _1381;
    float _1391 = -_1319;
    float _1393 = -_1379;
    float _1395 = fma(_1295, _1391, _1393);
    float _1397 = _1395;
    if (_1333)
    {
        float _1399 = _1395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1347 = _1399;
    }
    float _1401 = _1347;
    float _1403 = _1401;
    if (!_1333)
    {
        _1369 = _1327;
    }
    float _1405 = _1369;
    float _1407 = _1375;
    float _1409 = _1405;
    if (_1333)
    {
        float _1411 = fma(_1375, _1401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1403 = _1411;
    }
    float _1413 = _1403;
    if (!_1333)
    {
        _1407 = _1321;
    }
    float _1415 = _1407;
    float _1417 = _1415;
    float _1419 = _1389;
    if (_1333)
    {
        float _1421 = _1389 + (-1.0);
        _1383 = _1421;
    }
    float _1423 = _1383;
    float _1425 = _1423;
    if (_1333)
    {
        float _1427 = _1355 * _1413;
        _1237 = _1427;
    }
    float _1429 = _1237;
    if (!_1333)
    {
        _1357 = _1325;
    }
    float _1431 = _1357;
    float _1433 = _1431;
    if (_1333)
    {
        float _1435 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1425 = _1435;
    }
    float _1437 = _1425;
    if (_1333)
    {
        float _1439 = _1321 * _1429;
        _1417 = _1439;
    }
    float _1441 = _1417;
    float _1443 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1333)
    {
        float _1445 = fma(_1395, _1389, _1437);
        _1397 = _1445;
    }
    float _1447 = _1397;
    if (!_1333)
    {
        _1419 = _1323;
    }
    float _1449 = _1419;
    float _1451 = _1449;
    if (_1333)
    {
        float _1453 = _1323 * _1429;
        _1451 = _1453;
    }
    float _1455 = _1451;
    if (_1333)
    {
        float _1457 = _1441 * _1441;
        _1433 = _1457;
    }
    float _1459 = _1433;
    float _1461 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    if (_1333)
    {
        float _1465 = _1455 * _1455;
        _1409 = _1465;
    }
    float _1467 = _1409;
    float _1469 = fma(_1447, _1447, _1459);
    float _1471 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1473 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1475 = _1469 + _1467;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1479 = fma(_1317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1477);
    float _1481 = precise::clamp(_1479, 0.0, 1.0);
    float _1483 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1485 = rsqrt(_1475);
    float _1487 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1489 = -_1481;
    float _1491 = _1489 + 1.0;
    float _1493 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1501 = abs(_1491);
    float _1503 = log2(_1501);
    float _1505 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1507 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1509 = -_1499;
    float _1511 = fma(_1509, _1497, 1.0);
    float _1513 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1505);
    float _1515 = _1485 * _1441;
    float _1517 = _1485 * _1447;
    float _1519 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1513);
    float _1521 = floor(_1487);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = _1485 * _1455;
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1529 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = -_1523;
    float _1533 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1309);
    float _1537 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1539 = floor(_1507);
    float _1541 = -_1525;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1545 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1547 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1549 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1551 = fma(_1543, -0.5, 0.5);
    float _1553 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1555 = fma(_1543, 0.5, 0.5);
    float _1557 = exp2(_1537);
    float _1559 = -_1521;
    float _1561 = _1487 + _1559;
    float _1563 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1553);
    float _1565 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1567 = _1517 + 1.0;
    float _1569 = fma(_1555, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1571 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1565);
    float _1573 = 1.0 / _1563;
    float _1575 = -_1539;
    float _1577 = _1507 + _1575;
    float _1579 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1549);
    float _1581 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1571);
    float _1583 = fma(_1555, _1569, -0.212114393711090087890625);
    float _1585 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1587 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1581);
    float _1589 = log2(_1511);
    float _1591 = -_1517;
    float _1593 = fma(_1557, _1567, _1591);
    float _1595 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1585);
    float _1597 = sqrt(_1551);
    float _1599 = _1587 * _1573;
    float _1601 = _1595 * _1573;
    float2 _4951 = float2(_1561, _1577);
    float _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4951, float2(0.0), isnan(_4951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4951, float2(0.0), isnan(_4951)), level(0.0)).x;
    float _1605 = fma(_1555, _1583, 1.570728778839111328125);
    float _1607 = fma(_1599, 0.5, 0.5);
    float _1609 = fma(_1601, -0.5, 0.5);
    float _1611 = fma(_1593, 0.5, 0.5);
    float _1613 = _1589 * 0.693147182464599609375;
    float _1615 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = _1597 * 0.636619746685028076171875;
    float _1619 = -_1605;
    float _1621 = fma(_1617, _1619, 1.0);
    float3 _4987 = float3(_1607, _1609, _1615);
    float _1623 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4987, float3(0.0), isnan(_4987)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4987, float3(0.0), isnan(_4987)), level(0.0)).x;
    float3 _4998 = float3(_1607, _1609, _1615);
    float4 _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4998, float3(0.0), isnan(_4998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4998, float3(0.0), isnan(_4998)), level(0.0)).xyzw;
    float _1628 = _1626.x;
    float _1630 = _1626.y;
    float _1632 = _1626.z;
    float _1634 = _1626.w;
    float2 _5014 = float2(_1621, _1611);
    float3 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5014, float2(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5014, float2(0.0), isnan(_5014)), level(0.0)).xyz;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1648 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1652 = _1650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1654 = _687 > 0.5;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1652;
    float _1666 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1646);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1672 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1666);
    float _1674 = _793 + 0.5;
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1678 = _1676 != 0;
    float _1680 = 1.0 / _1658;
    float _1682 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1648);
    float _1684 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1694 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1698 = _675 + _1696;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / _1684;
    float _1706 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1708 = _1688 * _1664;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1710;
    bool _1714 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1716 = isnan(_675);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = _1706 + _1684;
    float _1728 = fma(_1708, _1698, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1732 = _675 + _1730;
    float _1734 = _1692 * _1680;
    bool _1736 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1738 = isnan(_675);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = 1.0 / _1670;
    bool _1750 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1752 = isnan(_675);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1734, _1732, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1764 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1766 = isnan(_675);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = -_1746;
    float _1778 = _1776 + 1.0;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1782 = _675 + _1780;
    float _1784 = -_1760;
    float _1786 = _1784 + 1.0;
    float _1788 = _1726 * _1704;
    float _1790 = _1788 * 0.5;
    float _1792 = _1760 * _1778;
    float _1794 = -_1774;
    float _1796 = _1794 + 1.0;
    float _1798 = _1724 * _1786;
    float _1800 = -_1724;
    float _1802 = _1800 + 1.0;
    float _1804 = _1746 * _1796;
    float _1806 = _1728 * _1798;
    float _1808 = -_769;
    int _1810 = _763 ? as_type<int>(_1808) : as_type<int>(_769);
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1814 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1812);
    float _1816 = _1712 * _1748;
    float _1818 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1806);
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1822 = _681 > 0.5;
    float _1824 = fma(_1816, _1782, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1826 = fma(_1762, _1792, _1818);
    float _1828 = -_797;
    float _1830 = _1828 + 0.5;
    float _1832 = -_769;
    int _1834 = _1822 ? as_type<int>(_1832) : as_type<int>(_769);
    float _1836 = fma(_1824, _1804, _1826);
    float _1838 = 1.0 / _1814;
    float _1840 = -_773;
    int _1842 = _757 ? as_type<int>(_1840) : as_type<int>(_773);
    float _1844 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1836);
    bool _1846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1848 = isnan(0.5);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1854 = _1850 || _1852;
    float _1856 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1858 = !_1662;
    float _1860 = _1858 ? _769 : as_type<float>(_1834);
    float _1862 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1866 = _1856 * _1820;
    bool _1868 = !_1678;
    float _1870 = _1868 ? _769 : as_type<float>(_1810);
    float _1872 = _1860 + 0.5;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1876 = _1874 != 0;
    float _1878 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1880 = -_773;
    int _1882 = _1654 ? as_type<int>(_1880) : as_type<int>(_773);
    float _1884 = _1870 + 0.5;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1888 = _1838 * _1886;
    float _1890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1892 = !_1702;
    float _1894 = _1892 ? _773 : as_type<float>(_1842);
    float _1896 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1898 = -_1894;
    float _1900 = _1898 + 0.5;
    float _1902 = _1862 * _1864;
    float _1904 = abs(_1888);
    float _1906 = log2(_1904);
    float _1908 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1910 = !_1876;
    float _1912 = _1910 ? _773 : as_type<float>(_1882);
    float _1914 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1916 = _1864;
    float _1918 = _1563;
    float _1920 = _1595;
    if (!_1854)
    {
        _1916 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1922 = _1916;
    float _1924 = _773 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _1866;
    out.m_66.y = _1902;
    float _1926 = -_1912;
    float _1928 = _1926 + 0.5;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = _1922;
    if (!_1854)
    {
        float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1936 = _1922 + _1934;
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = _1896 * _1890;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1944 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1946 = isnan(_1317);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1952 = _1948 || _1950;
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1956 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1960 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1964 = _1908 * _1930;
    float _1966 = _1930;
    float _1968 = _1956;
    float _1970 = _1938;
    if (!_1854)
    {
        float _1972 = 1.0 / _1938;
        _1966 = _1972;
    }
    float _1974 = _1966;
    float _1976 = _1914 * _1954;
    float _1978 = exp2(_1956);
    float _1980 = _1942 * _1962;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_68.x = _1964;
    out.m_68.y = _1976;
    out.m_68.z = _1940;
    out.m_68.w = _1980;
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1854)
    {
        float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1992 = _1888 + _1990;
        _1968 = _1992;
    }
    float _1994 = _1968;
    if (_1854)
    {
        _1970 = 1.0;
    }
    float _1996 = _1970;
    bool _1998 = _1888 <= 8000.0;
    bool _2000 = isnan(_1888);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan(8000.0);
    bool _2006 = _2002 || _2004;
    float _2008 = float(_2006);
    float _2010 = _1996;
    if (!_1854)
    {
        float _2012 = _1994 * _1974;
        float _2014 = precise::clamp(_2012, 0.0, 1.0);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_70.x = _1986;
    out.m_70.y = _1960;
    out.m_70.z = _1988;
    out.m_70.w = _1878;
    float _2020 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2026 = -_1031;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2018);
    float _2030 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = fma(_1924, _1924, 1.0);
    float _2034 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2036 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2038 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2040 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2042 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2034);
    float _2044 = rsqrt(_2032);
    float _2046 = -_1031;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2024);
    float _2050 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2036);
    float _2052 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2054 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2056 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    float _2058 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2028);
    float _2060 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2052);
    float _2062 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2064 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2040);
    float _2066 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2042);
    float _2068 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2048);
    float _2070 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    float _2072 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2056);
    float _2074 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2060);
    float _2076 = -_1031;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2080 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2062);
    float _2082 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2084 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2064);
    float _2086 = _769 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2088 = _1924 * _2058;
    float _2090 = _1924 * _2044;
    float _2092 = _1924 * _2068;
    float _2094 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2082);
    float _2096 = fma(_2086, _2070, _2088);
    float _2098 = -_2072;
    float _2100 = _2090 * _2098;
    float _2102 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2078);
    out.m_72.x = _2070;
    out.m_72.y = _2074;
    out.m_72.z = _2080;
    float _2104 = fma(_2086, _2074, _2092);
    float _2106 = -_2066;
    float _2108 = _2090 * _2106;
    float _2110 = -_2084;
    float _2112 = _2090 * _2110;
    float _2114 = fma(_2022, -2.0, 3.0);
    float _2116 = _2022 * _2022;
    float _2118 = fma(_2044, _2068, _2100);
    float _2120 = fma(_2044, _2058, _2108);
    float _2122 = fma(_2044, _2102, _2112);
    float _2124 = _2116 * _2114;
    float _2126 = in.m_74.x;
    float _2128 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2094);
    float _2130 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2132 = -_2124;
    float _2134 = _2132 + 1.0;
    float _2136 = _1563 * 0.5;
    float _2138 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2128);
    float _2140 = exp2(_2130);
    float _2142 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2124);
    float _2144 = fma(_1595, -0.5, _2136);
    float _2146 = _2066 + _2096;
    float _2148 = _2138 + _1563;
    float _2150 = _2008 * _2142;
    float _2152 = _1587 + _1563;
    float _2154 = _1924 * _2102;
    float _2156 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2158 = _2072 + _2104;
    float _2160 = _2148 * 0.5;
    float _2162 = _2152 * 0.5;
    out.gl_Position.x = _1587;
    out.gl_Position.y = _1595;
    out.gl_Position.z = _2138;
    out.gl_Position.w = _1563;
    float _2164 = fma(_2086, _2080, _2154);
    float _2166 = -_2140;
    float _2168 = _2166 + 1.0;
    out.m_76.x = _2162;
    out.m_76.y = _2144;
    out.m_76.z = _2160;
    out.m_76.w = _1563;
    float _2170 = _2084 + _2164;
    float _2172 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _2120;
    out.m_78.y = _2118;
    out.m_78.z = _2122;
    out.m_80.x = _2146;
    out.m_80.y = _2158;
    out.m_80.z = _2170;
    float _2174 = -_2172;
    float _2176 = _2174 + 1.0;
    float _2178 = _2138;
    float _2180 = _2120;
    float _2182 = _2172;
    float _2184 = _2176;
    if (!_1952)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2186 = _1918;
    float _2188 = _2186;
    float _2190 = _2186;
    if (!_1952)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2192 = _2178;
    float _2194 = _2192;
    float _2196 = _2192;
    if (!_1952)
    {
        _1920 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2198 = _1920;
    float _2200 = _2016 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2202 = _2198;
    float _2204 = _2198;
    if (!_1952)
    {
        _2180 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2206 = _2180;
    float _2208 = -_1603;
    float _2210 = _2208 + 1.0;
    float _2212 = _2210 * _2156;
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = -_2214;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2220 = _2218 * _2126;
    float _2222 = _2220 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2224 = _2172 * _1623;
    float _2226 = _1634 * _2176;
    out.m_82.x = _2222;
    float _2228 = _2206;
    float _2230 = _2206;
    if (!_1952)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2232 = _2182;
    float _2234 = _1634 * _2224;
    float _2236 = _1644 * _2224;
    float _2238 = _2232;
    float _2240 = _2232;
    if (!_1952)
    {
        _2184 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2242 = _2184;
    float _2244 = fma(_1640, _2234, _1628);
    float _2246 = fma(_1642, _2234, _1630);
    float _2248 = fma(_1634, _2236, _1632);
    out.m_84.x = _2244;
    out.m_84.y = _2246;
    out.m_84.z = _2248;
    out.m_84.w = _2226;
    bool _2250 = !_1952;
    float _2252 = _2242;
    float _2254 = _2242;
    if (!_2250)
    {
        bool _2256 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2258 = isnan(_1317);
        bool _2260 = _2256 || _2258;
        bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2264 = _2260 || _2262;
        if (!_2264)
        {
            float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2268 = _1317 + _2266;
            float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2272 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2270;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2278 = 1.0 / _2272;
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2296 = _2268 * _2278;
            float _2298 = precise::clamp(_2296, 0.0, 1.0);
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2304 = fma(_2298, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2306 = fma(_2298, _2302, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2308 = fma(_2298, _2282, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2310 = fma(_2298, _2286, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2312 = fma(_2298, _2290, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2314 = fma(_2298, _2294, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2230 = _2308;
            _2204 = _2312;
            _2240 = _2304;
            _2196 = _2310;
            _2190 = _2306;
            _2254 = _2314;
            _2316 = true;
        }
        else
        {
            bool _2318 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2320 = isnan(_1317);
            bool _2322 = _2318 || _2320;
            bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2326 = _2322 || _2324;
            if (!_2326)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2328 = _2238;
            _2240 = _2328;
            if (!_2326)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2330 = _2228;
            _2230 = _2330;
            if (!_2326)
            {
                _2188 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2332 = _2188;
            _2190 = _2332;
            if (!_2326)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2334 = _2194;
            _2196 = _2334;
            if (!_2326)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2336 = _2202;
            _2204 = _2336;
            if (!_2326)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2338 = _2252;
            bool _2340 = !_2326;
            _2254 = _2338;
            if (!_2340)
            {
                bool _2342 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2344 = isnan(_1317);
                bool _2346 = _2342 || _2344;
                bool _2348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2350 = _2346 || _2348;
                if (!_2350)
                {
                    float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2354 = _1317 + _2352;
                    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2358 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2356;
                    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2364 = 1.0 / _2358;
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2382 = _2354 * _2364;
                    float _2384 = precise::clamp(_2382, 0.0, 1.0);
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2390 = fma(_2384, _2362, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2392 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2396 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2398 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2400 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2230 = _2394;
                    _2204 = _2398;
                    _2240 = _2390;
                    _2196 = _2396;
                    _2190 = _2392;
                    _2254 = _2400;
                    _2316 = true;
                }
                else
                {
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2190 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2316 = false;
    float _2402 = _2230;
    float _2404 = _2204;
    float _2406 = _2240;
    float _2408 = _2196;
    float _2410 = _2190;
    float _2412 = _2254;
    float _2414 = fma(_2158, -0.5, 0.5);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = -_2402;
    float _2420 = _2418 + _2404;
    float _2422 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2424 = -_2406;
    float _2426 = _2424 + _2408;
    float _2428 = fma(_2416, _2420, _2402);
    out.m_86.x = 0.0;
    float _2430 = -_2410;
    float _2432 = _2430 + _2412;
    float _2434 = fma(_2416, _2426, _2406);
    float _2436 = _2428 * 0.586610972881317138671875;
    out.m_49.x = _2422;
    bool _2438 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2440 = fma(_2416, _2432, _2410);
    float _2442 = fma(_2434, 0.298911988735198974609375, _2436);
    bool _2444 = _2016 > 0.0;
    bool _2446 = isnan(_2016);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan(0.0);
    bool _2452 = _2448 || _2450;
    float _2454 = fma(_2440, 0.114477999508380889892578125, _2442);
    float _2456 = -_2454;
    float _2458 = _2434 + _2456;
    float _2460 = -_2454;
    float _2462 = _2428 + _2460;
    float _2464 = -_2454;
    float _2466 = _2440 + _2464;
    float _2468 = fma(_2458, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    float _2470 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    float _2472 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    bool _2474 = !_2438;
    if (!_2474)
    {
        float _2476 = -_1285;
        float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2480 = -_1287;
        float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2484 = -_1289;
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2488 = _2478 * _2478;
        float _2490 = fma(_2482, _2482, _2488);
        float _2492 = fma(_2486, _2486, _2490);
        float _2494 = sqrt(_2492);
        float _2496 = rsqrt(_2492);
        float _2498 = -_2494;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        float _2506 = _2482 * _2496;
        float _2508 = _2478 * _2496;
        float _2510 = abs(_2504);
        float _2512 = log2(_2510);
        float _2514 = _2486 * _2496;
        float _2516 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2518 = _2158 * _2508;
        float _2520 = -_2508;
        float _2522 = -_2516;
        float _2524 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2522);
        float _2526 = fma(_2146, _2506, _2518);
        float _2528 = -_2514;
        float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2524);
        float _2532 = fma(_2170, _2514, _2526);
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2538 = _2530 + _2536;
        float _2540 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = exp2(_2540);
        float _2548 = _2546 * _2544;
        float _2550 = _2534 * _2548;
        float _2552 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2556 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2552;
        out.m_86.y = _2554;
        out.m_86.z = _2556;
    }
    out.m_88.x = _2468;
    out.m_88.y = _2470;
    out.m_88.z = _2472;
    if (_2452)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2558;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2316 = false;
    bool _667 = false;
    bool _525 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2614 = as_type<float>(_121);
        out.gl_Position.z = _2614;
    }
    if (!_111)
    {
        return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_161);
        out.gl_Position.z = _2683;
    }
    if (_153)
    {
        return out;
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _207;
    if (!_189)
    {
        float _191 = in.m_55.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_107);
        float _213 = 1.0 / _211;
        float _215 = _139 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    bool _227 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _229 = isnan(_217);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _217 + _251;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _249;
    float _261 = 1.0 / _245;
    float _263 = _221 * _255;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_237;
    float _279 = _277 + 1.0;
    float _281 = _275 * _279;
    float _283 = _225 * _259;
    bool _285 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_217);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = _253 * _261;
    bool _307 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_217);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = _295 * _299;
    float _325 = -_295;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _317 * _327;
    float _341 = fma(_331, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = fma(_303, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_335, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_317;
    float _349 = _347 + 1.0;
    float _351 = _337 * _339;
    float _353 = _341 * _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _359;
    float _363 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_361, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _371 = fma(_343, _323, _363);
    float _373 = fma(_345, _323, _365);
    float _375 = fma(_367, _281, _371);
    float _377 = fma(_369, _281, _373);
    float _379 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_257;
    float _401;
    if (!_383)
    {
        float _385 = in.m_55.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_107);
        float _407 = 1.0 / _405;
        float _409 = _139 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_57.x;
    float _415 = in.m_57.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = _411 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _421;
    bool _425 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_411);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _439 = 1.0 / _423;
    float _441 = _381 * _415;
    bool _443 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_411);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = _419 * _439;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = -_453;
    float _463 = _461 + 1.0;
    float _465 = _379 * _413;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _467;
    float _471 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = _435 * _463;
    float _479 = fma(_469, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _481 = -_435;
    float _483 = _481 + 1.0;
    float _485 = fma(_475, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _487 = _471 * _477;
    float _489 = _479 * _477;
    float _491 = _485 * _477;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _489);
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _499 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].y, _493);
    float _501 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].x, _495);
    float _503 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].z, _497);
    bool _505 = !_437;
    float _523;
    if (!_505)
    {
        float _507 = in.m_55.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _511 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _515 = _513 * _509;
        float _517 = floor(_515);
        float _519 = -_517;
        float _521 = _515 + _519;
        _523 = _521;
        _525 = true;
    }
    else
    {
        float _527 = float(_107);
        float _529 = 1.0 / _527;
        float _531 = _139 * _529;
        _523 = _531;
    }
    _525 = false;
    float _533 = _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_533);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _561 = isnan(_533);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    bool _575 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_533);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = -_553;
    float _591 = _589 + 1.0;
    bool _593 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _595 = _569 * _591;
    float _597 = -_569;
    float _599 = _597 + 1.0;
    float _601 = 1.0 / _557;
    float _603 = _573 * _587;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _609 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = _609 * _595;
    float _617 = _607 * _601;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _533 + _619;
    float _623 = _553 * _613;
    float _625 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _615);
    float _627 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _629 = fma(_617, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = fma(_629, _623, _625);
    float _637 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[117].x, _635);
    float _645 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _637;
    out.m_59.y = _639;
    out.m_59.z = _641;
    out.m_59.w = _645;
    bool _647 = !_593;
    float _665;
    if (!_647)
    {
        float _649 = in.m_55.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_107);
        float _671 = 1.0 / _669;
        float _673 = _139 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    float _681 = in.m_55.x;
    float _683 = in.m_55.y;
    float _685 = in.m_55.z;
    float _687 = in.m_55.w;
    float _689 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _691 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _699 = _695 || _697;
    float _701 = as_type<float>(int(gl_VertexIndex));
    bool _703 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(1.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _715 = 1.0 + _713;
    float _717 = in.m_64.x;
    float _719 = in.m_64.y;
    float _721 = in.m_64.z;
    float _723 = 1.0 / _715;
    float _725 = _679 * _139;
    float _727 = exp2(_725);
    float _729 = _685 * 2.0;
    float _731 = _683 * 2.0;
    float _733 = floor(_729);
    float _735 = -_727;
    float _737 = _735 + 1.0;
    float _739 = _681 * 2.0;
    float _741 = _683 + _681;
    float _743 = floor(_731);
    float _745 = _699 ? _737 : 0.0;
    float _747 = _741 + (-1.0);
    int _749 = as_type<int>(_701) & 1;
    bool _751 = _749 != 0;
    int _753 = as_type<int>(_701) & 2;
    bool _755 = _753 != 0;
    bool _757 = _683 > 0.5;
    if (_711)
    {
        float _759 = _745 * _723;
        _143 = _759;
    }
    float _761 = _143;
    bool _763 = _685 > 0.5;
    float _765 = floor(_739);
    bool _767 = !_751;
    float _769 = _767 ? (-0.5) : 0.5;
    bool _771 = !_755;
    float _773 = _771 ? (-0.5) : 0.5;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _777 = _775 != 0;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _781 = _779 != 0;
    float _783 = -_769;
    int _785 = _757 ? as_type<int>(_783) : as_type<int>(_769);
    float _787 = -_773;
    int _789 = _763 ? as_type<int>(_787) : as_type<int>(_773);
    bool _791 = !_777;
    float _793 = _791 ? _769 : as_type<float>(_785);
    bool _795 = !_781;
    float _797 = _795 ? _773 : as_type<float>(_789);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _809 = _807 != 0;
    bool _811 = _733 >= 0.0;
    bool _813 = isnan(_733);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    bool _821 = !_801;
    int _823 = _821 ? 0 : 1;
    bool _825 = _733 > 0.0;
    int _827 = _819 ? 0 : 1;
    int _829 = abs(_823);
    float _831 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _833 = _765 > 0.0;
    bool _835 = _765 >= 0.0;
    bool _837 = isnan(_765);
    bool _839 = _835 || _837;
    bool _841 = isnan(0.0);
    bool _843 = _839 || _841;
    int _845 = ~_827;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    if (!_825)
    {
        int _853 = ~_827;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = float(_829);
    float _861 = float(_857);
    int _863 = _843 ? 0 : 1;
    bool _865 = !_805;
    int _867 = _865 ? 0 : 1;
    float _869 = _859 * _861;
    bool _871 = _743 > 0.0;
    float _873 = _681 + (-0.5);
    int _875 = ~_863;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = _869 * (-2.0);
    int _883 = _879;
    float _885 = _881;
    if (!_833)
    {
        int _887 = ~_863;
        int _889 = _887 + 1;
        _883 = _889;
    }
    int _891 = _883;
    int _893 = abs(_867);
    float _895 = fma(_881, _717, _717);
    bool _897 = _743 >= 0.0;
    bool _899 = isnan(_743);
    bool _901 = _897 || _899;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    float _907 = fma(_831, _881, _831);
    bool _909 = !_809;
    int _911 = _909 ? 0 : 1;
    float _913 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _895);
    float _915 = float(_891);
    float _917 = _683 + _685;
    float _919 = float(_893);
    float _921 = fma(_907, _761, _913);
    int _923 = _905 ? 0 : 1;
    float _925 = _917 + (-1.0);
    int _927 = abs(_911);
    float _929 = _919 * _915;
    float _931 = _683 + (-0.5);
    int _933 = ~_923;
    int _935 = _933 + 1;
    int _937 = _935 + 1;
    float _939 = _921 * 0.15915493667125701904296875;
    int _941 = _937;
    if (!_871)
    {
        int _943 = ~_923;
        int _945 = _943 + 1;
        _941 = _945;
    }
    int _947 = _941;
    float _949 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _951 = _929 * (-2.0);
    float _953 = float(_947);
    float _955 = _685 + _681;
    float _957 = float(_927);
    float _959 = fma(_951, _719, _719);
    float _961 = fma(_949, _951, _949);
    float _963 = _955 + (-1.0);
    float _965 = _957 * _953;
    float _967 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].y, _959);
    float _969 = _685 + (-0.5);
    float _971 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _973 = _965 * (-2.0);
    float _975 = fma(_961, _761, _967);
    float _977 = _939 * 6.283185482025146484375;
    float _979 = cos(_977);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _773);
    float _983 = fma(_973, _721, _721);
    float _985 = fma(_971, _973, _971);
    float _987 = _975 * 0.15915493667125701904296875;
    float _989 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _991 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[196].z, _983);
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _769);
    float _995 = _987 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _989 * _981;
    float _1001 = fma(_985, _761, _991);
    float _1003 = _689 * _993;
    float _1005 = _1001 * 0.15915493667125701904296875;
    float _1007 = _987 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = in.m_46.x;
    float _1013 = in.m_46.y;
    float _1015 = in.m_46.z;
    float _1017 = _939 * 6.283185482025146484375;
    float _1019 = sin(_1017);
    float _1021 = _979 * _997;
    float _1023 = _1005 * 6.283185482025146484375;
    float _1025 = cos(_1023);
    float _1027 = _979 * _1009;
    float _1029 = _1005 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _1019 * _997;
    float _1035 = _1019 * _1009;
    float _1037 = _979 * _1025;
    float _1039 = _1019 * _1025;
    float _1041 = _1009 * _1025;
    float _1043 = _997 * _1025;
    float _1045 = _1037 * _999;
    float _1047 = _1039 * _999;
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_1031, _1027, _1033);
    float _1053 = -_1021;
    float _1055 = fma(_1031, _1035, _1053);
    float _1057 = -_1035;
    float _1059 = fma(_1031, _1021, _1057);
    float _1061 = -_999;
    float _1063 = _1031 * _1061;
    float _1065 = fma(_1051, _1003, _1045);
    float _1067 = fma(_1031, _1033, _1027);
    float _1069 = fma(_1055, _1003, _1047);
    float _1071 = fma(_1041, _1003, _1063);
    float _1073 = fma(_1059, _1049, _1065);
    float _1075 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1077 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1079 = fma(_1043, _1049, _1071);
    float _1081 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = fma(_1067, _1049, _1069);
    float _1087 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1075);
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1081);
    float _1091 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1077);
    float _1093 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1095 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1087);
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1089);
    float _1099 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1091);
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1107 = _1099 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1113 = _1103 + _1105;
    float _1115 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1117 = _1107 + _1109;
    float _1119 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1111);
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1113 + _1121;
    float _1125 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1115);
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1129 = _1117 + _1127;
    float _1131 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1119);
    float _1133 = _1123 * _1123;
    float _1135 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    float _1137 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1139 = fma(_1129, _1129, _1133);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = sqrt(_1139);
    float _1145 = _1137 + _1141;
    bool _1147 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = _1117;
    float _1151 = _1113;
    float _1153 = _1079;
    if (!_1147)
    {
        _885 = _1145;
    }
    float _1155 = _885;
    bool _1157 = !_1147;
    float _1159 = _1155;
    if (!_1157)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1165 = _1143 + _1163;
        float _1167 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1169 = rsqrt(_1139);
        float _1171 = _1165 * _1161;
        float _1173 = _1171 * 0.15915493667125701904296875;
        float _1175 = _1173 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1173 * 6.283185482025146484375;
        float _1181 = sin(_1179);
        float _1183 = _1177 + (-1.0);
        float _1185 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = fma(_1181, _1167, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1189 = fma(_1145, _1177, _1185);
        float _1191 = _1169 * _1187;
        float _1193 = fma(_1129, _1191, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1195 = fma(_1123, _1191, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1159 = _1189;
        _1149 = _1193;
        _1151 = _1195;
        _1153 = _1169;
    }
    float _1197 = _1159;
    float _1199 = _1149;
    float _1201 = _1151;
    float _1203 = _1153;
    float _1205 = -_1137;
    float _1207 = _1205 + _1197;
    float _1209 = -_1107;
    float _1211 = _1209 + _1199;
    float _1213 = -_1103;
    float _1215 = _1213 + _1201;
    float _1217 = _1207 * _1207;
    float _1219 = fma(_1211, _1211, _1217);
    float _1221 = fma(_1215, _1215, _1219);
    float _1223 = sqrt(_1221);
    bool _1225 = _1223 > 0.0;
    bool _1227 = !_1225;
    float _1229 = _1197;
    float _1231 = _1199;
    float _1233 = _1201;
    float _1235 = _1203;
    float _1237 = _1215;
    if (!_1227)
    {
        float _1239 = _185 * _185;
        float _1241 = fma(_183, _183, _1239);
        float _1243 = fma(_187, _187, _1241);
        float _1245 = rsqrt(_1221);
        float _1247 = sqrt(_1243);
        float _1249 = _1211 * _1245;
        float _1251 = _1207 * _1245;
        float _1253 = _1215 * _1245;
        bool _1255 = _1247 > 0.0;
        bool _1257 = !_1255;
        _1235 = _1247;
        if (!_1257)
        {
            float _1259 = rsqrt(_1243);
            float _1261 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1263 = _185 * _1259;
            float _1265 = _183 * _1259;
            float _1267 = _187 * _1259;
            float _1269 = _1251 * _1263;
            float _1271 = fma(_1249, _1265, _1269);
            float _1273 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1275 = fma(_1253, _1267, _1271);
            float _1277 = _1275 * _1273;
            float _1279 = fma(_183, _1277, _1199);
            float _1281 = fma(_185, _1277, _1197);
            float _1283 = fma(_187, _1277, _1201);
            _1229 = _1281;
            _1231 = _1279;
            _1233 = _1283;
            _1235 = _1263;
        }
    }
    float _1285 = _1229;
    float _1287 = _1231;
    float _1289 = _1233;
    float _1291 = _1235;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1295 = _1285 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1299 = _1287 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1289 + _1301;
    float _1305 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1307 = _1295 * _1295;
    float _1309 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1305);
    float _1311 = fma(_1299, _1299, _1307);
    float _1313 = fma(_1303, _1303, _1311);
    float _1315 = rsqrt(_1313);
    float _1317 = sqrt(_1313);
    float _1319 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1321 = _1299 * _1319;
    float _1323 = _1303 * _1319;
    float _1325 = _1321 * _1321;
    float _1327 = _1323 * _1323;
    float _1329 = _1325 + _1327;
    float _1331 = sqrt(_1329);
    bool _1333 = _1331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1337 = _1331 + _1335;
    float _1339 = _1315;
    float _1341 = _1329;
    float _1343 = _1337;
    float _1345 = _1291;
    float _1347 = _1295;
    if (_1333)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1349;
    }
    float _1351 = _1339;
    if (_1333)
    {
        float _1353 = rsqrt(_1329);
        _1341 = _1353;
    }
    float _1355 = _1341;
    float _1357 = _1355;
    if (_1333)
    {
        float _1359 = _1337 * _1351;
        _1343 = _1359;
    }
    float _1361 = _1343;
    if (_1333)
    {
        float _1363 = _1361 * 0.15915493667125701904296875;
        _1345 = _1363;
    }
    float _1365 = _1345;
    float _1367 = _1303;
    float _1369 = _1365;
    if (_1333)
    {
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        _1367 = _1373;
    }
    float _1375 = _1367;
    float _1377 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1379 = precise::max(0.0, _1377);
    float _1381 = _1351;
    float _1383 = _1379;
    if (_1333)
    {
        float _1385 = _1365 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        _1381 = _1387;
    }
    float _1389 = _1381;
    float _1391 = -_1319;
    float _1393 = -_1379;
    float _1395 = fma(_1295, _1391, _1393);
    float _1397 = _1395;
    if (_1333)
    {
        float _1399 = _1395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1347 = _1399;
    }
    float _1401 = _1347;
    float _1403 = _1401;
    if (!_1333)
    {
        _1369 = _1327;
    }
    float _1405 = _1369;
    float _1407 = _1375;
    float _1409 = _1405;
    if (_1333)
    {
        float _1411 = fma(_1375, _1401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1403 = _1411;
    }
    float _1413 = _1403;
    if (!_1333)
    {
        _1407 = _1321;
    }
    float _1415 = _1407;
    float _1417 = _1415;
    float _1419 = _1389;
    if (_1333)
    {
        float _1421 = _1389 + (-1.0);
        _1383 = _1421;
    }
    float _1423 = _1383;
    float _1425 = _1423;
    if (_1333)
    {
        float _1427 = _1355 * _1413;
        _1237 = _1427;
    }
    float _1429 = _1237;
    if (!_1333)
    {
        _1357 = _1325;
    }
    float _1431 = _1357;
    float _1433 = _1431;
    if (_1333)
    {
        float _1435 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1425 = _1435;
    }
    float _1437 = _1425;
    if (_1333)
    {
        float _1439 = _1321 * _1429;
        _1417 = _1439;
    }
    float _1441 = _1417;
    float _1443 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1333)
    {
        float _1445 = fma(_1395, _1389, _1437);
        _1397 = _1445;
    }
    float _1447 = _1397;
    if (!_1333)
    {
        _1419 = _1323;
    }
    float _1449 = _1419;
    float _1451 = _1449;
    if (_1333)
    {
        float _1453 = _1323 * _1429;
        _1451 = _1453;
    }
    float _1455 = _1451;
    if (_1333)
    {
        float _1457 = _1441 * _1441;
        _1433 = _1457;
    }
    float _1459 = _1433;
    float _1461 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    if (_1333)
    {
        float _1465 = _1455 * _1455;
        _1409 = _1465;
    }
    float _1467 = _1409;
    float _1469 = fma(_1447, _1447, _1459);
    float _1471 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1473 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1475 = _1469 + _1467;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1479 = fma(_1317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1477);
    float _1481 = precise::clamp(_1479, 0.0, 1.0);
    float _1483 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1485 = rsqrt(_1475);
    float _1487 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1489 = -_1481;
    float _1491 = _1489 + 1.0;
    float _1493 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1501 = abs(_1491);
    float _1503 = log2(_1501);
    float _1505 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1507 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1509 = -_1499;
    float _1511 = fma(_1509, _1497, 1.0);
    float _1513 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1505);
    float _1515 = _1485 * _1441;
    float _1517 = _1485 * _1447;
    float _1519 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1513);
    float _1521 = floor(_1487);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = _1485 * _1455;
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1529 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = -_1523;
    float _1533 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1309);
    float _1537 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1539 = floor(_1507);
    float _1541 = -_1525;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1545 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1547 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1549 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1551 = fma(_1543, -0.5, 0.5);
    float _1553 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1555 = fma(_1543, 0.5, 0.5);
    float _1557 = exp2(_1537);
    float _1559 = -_1521;
    float _1561 = _1487 + _1559;
    float _1563 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1553);
    float _1565 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1567 = _1517 + 1.0;
    float _1569 = fma(_1555, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1571 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1565);
    float _1573 = 1.0 / _1563;
    float _1575 = -_1539;
    float _1577 = _1507 + _1575;
    float _1579 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1549);
    float _1581 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1571);
    float _1583 = fma(_1555, _1569, -0.212114393711090087890625);
    float _1585 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1587 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1581);
    float _1589 = log2(_1511);
    float _1591 = -_1517;
    float _1593 = fma(_1557, _1567, _1591);
    float _1595 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1585);
    float _1597 = sqrt(_1551);
    float _1599 = _1587 * _1573;
    float _1601 = _1595 * _1573;
    float2 _4951 = float2(_1561, _1577);
    float _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4951, float2(0.0), isnan(_4951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4951, float2(0.0), isnan(_4951)), level(0.0)).x;
    float _1605 = fma(_1555, _1583, 1.570728778839111328125);
    float _1607 = fma(_1599, 0.5, 0.5);
    float _1609 = fma(_1601, -0.5, 0.5);
    float _1611 = fma(_1593, 0.5, 0.5);
    float _1613 = _1589 * 0.693147182464599609375;
    float _1615 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = _1597 * 0.636619746685028076171875;
    float _1619 = -_1605;
    float _1621 = fma(_1617, _1619, 1.0);
    float3 _4987 = float3(_1607, _1609, _1615);
    float _1623 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4987, float3(0.0), isnan(_4987)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4987, float3(0.0), isnan(_4987)), level(0.0)).x;
    float3 _4998 = float3(_1607, _1609, _1615);
    float4 _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4998, float3(0.0), isnan(_4998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4998, float3(0.0), isnan(_4998)), level(0.0)).xyzw;
    float _1628 = _1626.x;
    float _1630 = _1626.y;
    float _1632 = _1626.z;
    float _1634 = _1626.w;
    float2 _5014 = float2(_1621, _1611);
    float3 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5014, float2(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5014, float2(0.0), isnan(_5014)), level(0.0)).xyz;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1648 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1652 = _1650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1654 = _687 > 0.5;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1652;
    float _1666 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1646);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1672 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1666);
    float _1674 = _793 + 0.5;
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1678 = _1676 != 0;
    float _1680 = 1.0 / _1658;
    float _1682 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1648);
    float _1684 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1694 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1698 = _675 + _1696;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / _1684;
    float _1706 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1708 = _1688 * _1664;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1710;
    bool _1714 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1716 = isnan(_675);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = _1706 + _1684;
    float _1728 = fma(_1708, _1698, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1732 = _675 + _1730;
    float _1734 = _1692 * _1680;
    bool _1736 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1738 = isnan(_675);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = 1.0 / _1670;
    bool _1750 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1752 = isnan(_675);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1734, _1732, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1764 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1766 = isnan(_675);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = -_1746;
    float _1778 = _1776 + 1.0;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1782 = _675 + _1780;
    float _1784 = -_1760;
    float _1786 = _1784 + 1.0;
    float _1788 = _1726 * _1704;
    float _1790 = _1788 * 0.5;
    float _1792 = _1760 * _1778;
    float _1794 = -_1774;
    float _1796 = _1794 + 1.0;
    float _1798 = _1724 * _1786;
    float _1800 = -_1724;
    float _1802 = _1800 + 1.0;
    float _1804 = _1746 * _1796;
    float _1806 = _1728 * _1798;
    float _1808 = -_769;
    int _1810 = _763 ? as_type<int>(_1808) : as_type<int>(_769);
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1814 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1812);
    float _1816 = _1712 * _1748;
    float _1818 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1806);
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1822 = _681 > 0.5;
    float _1824 = fma(_1816, _1782, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1826 = fma(_1762, _1792, _1818);
    float _1828 = -_797;
    float _1830 = _1828 + 0.5;
    float _1832 = -_769;
    int _1834 = _1822 ? as_type<int>(_1832) : as_type<int>(_769);
    float _1836 = fma(_1824, _1804, _1826);
    float _1838 = 1.0 / _1814;
    float _1840 = -_773;
    int _1842 = _757 ? as_type<int>(_1840) : as_type<int>(_773);
    float _1844 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1836);
    bool _1846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1848 = isnan(0.5);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1854 = _1850 || _1852;
    float _1856 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1858 = !_1662;
    float _1860 = _1858 ? _769 : as_type<float>(_1834);
    float _1862 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1866 = _1856 * _1820;
    bool _1868 = !_1678;
    float _1870 = _1868 ? _769 : as_type<float>(_1810);
    float _1872 = _1860 + 0.5;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1876 = _1874 != 0;
    float _1878 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1880 = -_773;
    int _1882 = _1654 ? as_type<int>(_1880) : as_type<int>(_773);
    float _1884 = _1870 + 0.5;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1888 = _1838 * _1886;
    float _1890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1892 = !_1702;
    float _1894 = _1892 ? _773 : as_type<float>(_1842);
    float _1896 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1898 = -_1894;
    float _1900 = _1898 + 0.5;
    float _1902 = _1862 * _1864;
    float _1904 = abs(_1888);
    float _1906 = log2(_1904);
    float _1908 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1910 = !_1876;
    float _1912 = _1910 ? _773 : as_type<float>(_1882);
    float _1914 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1916 = _1864;
    float _1918 = _1563;
    float _1920 = _1595;
    if (!_1854)
    {
        _1916 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1922 = _1916;
    float _1924 = _773 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _1866;
    out.m_66.y = _1902;
    float _1926 = -_1912;
    float _1928 = _1926 + 0.5;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = _1922;
    if (!_1854)
    {
        float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1936 = _1922 + _1934;
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = _1896 * _1890;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1944 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1946 = isnan(_1317);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1952 = _1948 || _1950;
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1956 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1960 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1964 = _1908 * _1930;
    float _1966 = _1930;
    float _1968 = _1956;
    float _1970 = _1938;
    if (!_1854)
    {
        float _1972 = 1.0 / _1938;
        _1966 = _1972;
    }
    float _1974 = _1966;
    float _1976 = _1914 * _1954;
    float _1978 = exp2(_1956);
    float _1980 = _1942 * _1962;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_68.x = _1964;
    out.m_68.y = _1976;
    out.m_68.z = _1940;
    out.m_68.w = _1980;
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1854)
    {
        float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1992 = _1888 + _1990;
        _1968 = _1992;
    }
    float _1994 = _1968;
    if (_1854)
    {
        _1970 = 1.0;
    }
    float _1996 = _1970;
    bool _1998 = _1888 <= 8000.0;
    bool _2000 = isnan(_1888);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan(8000.0);
    bool _2006 = _2002 || _2004;
    float _2008 = float(_2006);
    float _2010 = _1996;
    if (!_1854)
    {
        float _2012 = _1994 * _1974;
        float _2014 = precise::clamp(_2012, 0.0, 1.0);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_70.x = _1986;
    out.m_70.y = _1960;
    out.m_70.z = _1988;
    out.m_70.w = _1878;
    float _2020 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2026 = -_1031;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2018);
    float _2030 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = fma(_1924, _1924, 1.0);
    float _2034 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2036 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2038 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2040 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2042 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2034);
    float _2044 = rsqrt(_2032);
    float _2046 = -_1031;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2024);
    float _2050 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2036);
    float _2052 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2054 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2056 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    float _2058 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2028);
    float _2060 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2052);
    float _2062 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2064 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2040);
    float _2066 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2042);
    float _2068 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2048);
    float _2070 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    float _2072 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2056);
    float _2074 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2060);
    float _2076 = -_1031;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2080 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2062);
    float _2082 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2084 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2064);
    float _2086 = _769 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2088 = _1924 * _2058;
    float _2090 = _1924 * _2044;
    float _2092 = _1924 * _2068;
    float _2094 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2082);
    float _2096 = fma(_2086, _2070, _2088);
    float _2098 = -_2072;
    float _2100 = _2090 * _2098;
    float _2102 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2078);
    out.m_72.x = _2070;
    out.m_72.y = _2074;
    out.m_72.z = _2080;
    float _2104 = fma(_2086, _2074, _2092);
    float _2106 = -_2066;
    float _2108 = _2090 * _2106;
    float _2110 = -_2084;
    float _2112 = _2090 * _2110;
    float _2114 = fma(_2022, -2.0, 3.0);
    float _2116 = _2022 * _2022;
    float _2118 = fma(_2044, _2068, _2100);
    float _2120 = fma(_2044, _2058, _2108);
    float _2122 = fma(_2044, _2102, _2112);
    float _2124 = _2116 * _2114;
    float _2126 = in.m_74.x;
    float _2128 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2094);
    float _2130 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2132 = -_2124;
    float _2134 = _2132 + 1.0;
    float _2136 = _1563 * 0.5;
    float _2138 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2128);
    float _2140 = exp2(_2130);
    float _2142 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2124);
    float _2144 = fma(_1595, -0.5, _2136);
    float _2146 = _2066 + _2096;
    float _2148 = _2138 + _1563;
    float _2150 = _2008 * _2142;
    float _2152 = _1587 + _1563;
    float _2154 = _1924 * _2102;
    float _2156 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2158 = _2072 + _2104;
    float _2160 = _2148 * 0.5;
    float _2162 = _2152 * 0.5;
    out.gl_Position.x = _1587;
    out.gl_Position.y = _1595;
    out.gl_Position.z = _2138;
    out.gl_Position.w = _1563;
    float _2164 = fma(_2086, _2080, _2154);
    float _2166 = -_2140;
    float _2168 = _2166 + 1.0;
    out.m_76.x = _2162;
    out.m_76.y = _2144;
    out.m_76.z = _2160;
    out.m_76.w = _1563;
    float _2170 = _2084 + _2164;
    float _2172 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _2120;
    out.m_78.y = _2118;
    out.m_78.z = _2122;
    out.m_80.x = _2146;
    out.m_80.y = _2158;
    out.m_80.z = _2170;
    float _2174 = -_2172;
    float _2176 = _2174 + 1.0;
    float _2178 = _2138;
    float _2180 = _2120;
    float _2182 = _2172;
    float _2184 = _2176;
    if (!_1952)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2186 = _1918;
    float _2188 = _2186;
    float _2190 = _2186;
    if (!_1952)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2192 = _2178;
    float _2194 = _2192;
    float _2196 = _2192;
    if (!_1952)
    {
        _1920 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2198 = _1920;
    float _2200 = _2016 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2202 = _2198;
    float _2204 = _2198;
    if (!_1952)
    {
        _2180 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2206 = _2180;
    float _2208 = -_1603;
    float _2210 = _2208 + 1.0;
    float _2212 = _2210 * _2156;
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = -_2214;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2220 = _2218 * _2126;
    float _2222 = _2220 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2224 = _2172 * _1623;
    float _2226 = _1634 * _2176;
    out.m_82.x = _2222;
    float _2228 = _2206;
    float _2230 = _2206;
    if (!_1952)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2232 = _2182;
    float _2234 = _1634 * _2224;
    float _2236 = _1644 * _2224;
    float _2238 = _2232;
    float _2240 = _2232;
    if (!_1952)
    {
        _2184 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2242 = _2184;
    float _2244 = fma(_1640, _2234, _1628);
    float _2246 = fma(_1642, _2234, _1630);
    float _2248 = fma(_1634, _2236, _1632);
    out.m_84.x = _2244;
    out.m_84.y = _2246;
    out.m_84.z = _2248;
    out.m_84.w = _2226;
    bool _2250 = !_1952;
    float _2252 = _2242;
    float _2254 = _2242;
    if (!_2250)
    {
        bool _2256 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2258 = isnan(_1317);
        bool _2260 = _2256 || _2258;
        bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2264 = _2260 || _2262;
        if (!_2264)
        {
            float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2268 = _1317 + _2266;
            float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2272 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2270;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2278 = 1.0 / _2272;
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2296 = _2268 * _2278;
            float _2298 = precise::clamp(_2296, 0.0, 1.0);
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2304 = fma(_2298, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2306 = fma(_2298, _2302, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2308 = fma(_2298, _2282, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2310 = fma(_2298, _2286, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2312 = fma(_2298, _2290, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2314 = fma(_2298, _2294, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2230 = _2308;
            _2204 = _2312;
            _2240 = _2304;
            _2196 = _2310;
            _2190 = _2306;
            _2254 = _2314;
            _2316 = true;
        }
        else
        {
            bool _2318 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2320 = isnan(_1317);
            bool _2322 = _2318 || _2320;
            bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2326 = _2322 || _2324;
            if (!_2326)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2328 = _2238;
            _2240 = _2328;
            if (!_2326)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2330 = _2228;
            _2230 = _2330;
            if (!_2326)
            {
                _2188 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2332 = _2188;
            _2190 = _2332;
            if (!_2326)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2334 = _2194;
            _2196 = _2334;
            if (!_2326)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2336 = _2202;
            _2204 = _2336;
            if (!_2326)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2338 = _2252;
            bool _2340 = !_2326;
            _2254 = _2338;
            if (!_2340)
            {
                bool _2342 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2344 = isnan(_1317);
                bool _2346 = _2342 || _2344;
                bool _2348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2350 = _2346 || _2348;
                if (!_2350)
                {
                    float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2354 = _1317 + _2352;
                    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2358 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2356;
                    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2364 = 1.0 / _2358;
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2382 = _2354 * _2364;
                    float _2384 = precise::clamp(_2382, 0.0, 1.0);
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2390 = fma(_2384, _2362, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2392 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2396 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2398 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2400 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2230 = _2394;
                    _2204 = _2398;
                    _2240 = _2390;
                    _2196 = _2396;
                    _2190 = _2392;
                    _2254 = _2400;
                    _2316 = true;
                }
                else
                {
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2190 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2316 = false;
    float _2402 = _2230;
    float _2404 = _2204;
    float _2406 = _2240;
    float _2408 = _2196;
    float _2410 = _2190;
    float _2412 = _2254;
    float _2414 = fma(_2158, -0.5, 0.5);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = -_2402;
    float _2420 = _2418 + _2404;
    float _2422 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2424 = -_2406;
    float _2426 = _2424 + _2408;
    float _2428 = fma(_2416, _2420, _2402);
    out.m_86.x = 0.0;
    float _2430 = -_2410;
    float _2432 = _2430 + _2412;
    float _2434 = fma(_2416, _2426, _2406);
    float _2436 = _2428 * 0.586610972881317138671875;
    out.m_49.x = _2422;
    bool _2438 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2440 = fma(_2416, _2432, _2410);
    float _2442 = fma(_2434, 0.298911988735198974609375, _2436);
    bool _2444 = _2016 > 0.0;
    bool _2446 = isnan(_2016);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan(0.0);
    bool _2452 = _2448 || _2450;
    float _2454 = fma(_2440, 0.114477999508380889892578125, _2442);
    float _2456 = -_2454;
    float _2458 = _2434 + _2456;
    float _2460 = -_2454;
    float _2462 = _2428 + _2460;
    float _2464 = -_2454;
    float _2466 = _2440 + _2464;
    float _2468 = fma(_2458, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    float _2470 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    float _2472 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    bool _2474 = !_2438;
    if (!_2474)
    {
        float _2476 = -_1285;
        float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2480 = -_1287;
        float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2484 = -_1289;
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2488 = _2478 * _2478;
        float _2490 = fma(_2482, _2482, _2488);
        float _2492 = fma(_2486, _2486, _2490);
        float _2494 = sqrt(_2492);
        float _2496 = rsqrt(_2492);
        float _2498 = -_2494;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        float _2506 = _2482 * _2496;
        float _2508 = _2478 * _2496;
        float _2510 = abs(_2504);
        float _2512 = log2(_2510);
        float _2514 = _2486 * _2496;
        float _2516 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2518 = _2158 * _2508;
        float _2520 = -_2508;
        float _2522 = -_2516;
        float _2524 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2522);
        float _2526 = fma(_2146, _2506, _2518);
        float _2528 = -_2514;
        float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2524);
        float _2532 = fma(_2170, _2514, _2526);
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2538 = _2530 + _2536;
        float _2540 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = exp2(_2540);
        float _2548 = _2546 * _2544;
        float _2550 = _2534 * _2548;
        float _2552 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2556 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2552;
        out.m_86.y = _2554;
        out.m_86.z = _2556;
    }
    out.m_88.x = _2468;
    out.m_88.y = _2470;
    out.m_88.z = _2472;
    if (_2452)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2558;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2316 = false;
    bool _667 = false;
    bool _525 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2614 = as_type<float>(_121);
        out.gl_Position.z = _2614;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_161);
        out.gl_Position.z = _2683;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _207;
    if (!_189)
    {
        float _191 = in.m_55.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_107);
        float _213 = 1.0 / _211;
        float _215 = _139 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    bool _227 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _229 = isnan(_217);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _217 + _251;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _249;
    float _261 = 1.0 / _245;
    float _263 = _221 * _255;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_237;
    float _279 = _277 + 1.0;
    float _281 = _275 * _279;
    float _283 = _225 * _259;
    bool _285 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_217);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = _253 * _261;
    bool _307 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_217);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = _295 * _299;
    float _325 = -_295;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _317 * _327;
    float _341 = fma(_331, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = fma(_303, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_335, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_317;
    float _349 = _347 + 1.0;
    float _351 = _337 * _339;
    float _353 = _341 * _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _359;
    float _363 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_361, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _371 = fma(_343, _323, _363);
    float _373 = fma(_345, _323, _365);
    float _375 = fma(_367, _281, _371);
    float _377 = fma(_369, _281, _373);
    float _379 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_257;
    float _401;
    if (!_383)
    {
        float _385 = in.m_55.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_107);
        float _407 = 1.0 / _405;
        float _409 = _139 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_57.x;
    float _415 = in.m_57.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = _411 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _421;
    bool _425 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_411);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _439 = 1.0 / _423;
    float _441 = _381 * _415;
    bool _443 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _445 = isnan(_411);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = _419 * _439;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = -_453;
    float _463 = _461 + 1.0;
    float _465 = _379 * _413;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _467;
    float _471 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = _435 * _463;
    float _479 = fma(_469, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _481 = -_435;
    float _483 = _481 + 1.0;
    float _485 = fma(_475, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _487 = _471 * _477;
    float _489 = _479 * _477;
    float _491 = _485 * _477;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].x, _489);
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[107].z, _491);
    float _499 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].y, _493);
    float _501 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].x, _495);
    float _503 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[108].z, _497);
    bool _505 = !_437;
    float _523;
    if (!_505)
    {
        float _507 = in.m_55.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _511 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _515 = _513 * _509;
        float _517 = floor(_515);
        float _519 = -_517;
        float _521 = _515 + _519;
        _523 = _521;
        _525 = true;
    }
    else
    {
        float _527 = float(_107);
        float _529 = 1.0 / _527;
        float _531 = _139 * _529;
        _523 = _531;
    }
    _525 = false;
    float _533 = _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_533);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _561 = isnan(_533);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    bool _575 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_533);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = -_553;
    float _591 = _589 + 1.0;
    bool _593 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _595 = _569 * _591;
    float _597 = -_569;
    float _599 = _597 + 1.0;
    float _601 = 1.0 / _557;
    float _603 = _573 * _587;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _609 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = _609 * _595;
    float _617 = _607 * _601;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _533 + _619;
    float _623 = _553 * _613;
    float _625 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _615);
    float _627 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _629 = fma(_617, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = fma(_629, _623, _625);
    float _637 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[117].x, _635);
    float _645 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _637;
    out.m_59.y = _639;
    out.m_59.z = _641;
    out.m_59.w = _645;
    bool _647 = !_593;
    float _665;
    if (!_647)
    {
        float _649 = in.m_55.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_107);
        float _671 = 1.0 / _669;
        float _673 = _139 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    float _681 = in.m_55.x;
    float _683 = in.m_55.y;
    float _685 = in.m_55.z;
    float _687 = in.m_55.w;
    float _689 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _691 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _699 = _695 || _697;
    float _701 = as_type<float>(int(gl_VertexIndex));
    bool _703 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(1.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _715 = 1.0 + _713;
    float _717 = in.m_64.x;
    float _719 = in.m_64.y;
    float _721 = in.m_64.z;
    float _723 = 1.0 / _715;
    float _725 = _679 * _139;
    float _727 = exp2(_725);
    float _729 = _685 * 2.0;
    float _731 = _683 * 2.0;
    float _733 = floor(_729);
    float _735 = -_727;
    float _737 = _735 + 1.0;
    float _739 = _681 * 2.0;
    float _741 = _683 + _681;
    float _743 = floor(_731);
    float _745 = _699 ? _737 : 0.0;
    float _747 = _741 + (-1.0);
    int _749 = as_type<int>(_701) & 1;
    bool _751 = _749 != 0;
    int _753 = as_type<int>(_701) & 2;
    bool _755 = _753 != 0;
    bool _757 = _683 > 0.5;
    if (_711)
    {
        float _759 = _745 * _723;
        _143 = _759;
    }
    float _761 = _143;
    bool _763 = _685 > 0.5;
    float _765 = floor(_739);
    bool _767 = !_751;
    float _769 = _767 ? (-0.5) : 0.5;
    bool _771 = !_755;
    float _773 = _771 ? (-0.5) : 0.5;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _777 = _775 != 0;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _781 = _779 != 0;
    float _783 = -_769;
    int _785 = _757 ? as_type<int>(_783) : as_type<int>(_769);
    float _787 = -_773;
    int _789 = _763 ? as_type<int>(_787) : as_type<int>(_773);
    bool _791 = !_777;
    float _793 = _791 ? _769 : as_type<float>(_785);
    bool _795 = !_781;
    float _797 = _795 ? _773 : as_type<float>(_789);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _809 = _807 != 0;
    bool _811 = _733 >= 0.0;
    bool _813 = isnan(_733);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    bool _821 = !_801;
    int _823 = _821 ? 0 : 1;
    bool _825 = _733 > 0.0;
    int _827 = _819 ? 0 : 1;
    int _829 = abs(_823);
    float _831 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _833 = _765 > 0.0;
    bool _835 = _765 >= 0.0;
    bool _837 = isnan(_765);
    bool _839 = _835 || _837;
    bool _841 = isnan(0.0);
    bool _843 = _839 || _841;
    int _845 = ~_827;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    if (!_825)
    {
        int _853 = ~_827;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = float(_829);
    float _861 = float(_857);
    int _863 = _843 ? 0 : 1;
    bool _865 = !_805;
    int _867 = _865 ? 0 : 1;
    float _869 = _859 * _861;
    bool _871 = _743 > 0.0;
    float _873 = _681 + (-0.5);
    int _875 = ~_863;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = _869 * (-2.0);
    int _883 = _879;
    float _885 = _881;
    if (!_833)
    {
        int _887 = ~_863;
        int _889 = _887 + 1;
        _883 = _889;
    }
    int _891 = _883;
    int _893 = abs(_867);
    float _895 = fma(_881, _717, _717);
    bool _897 = _743 >= 0.0;
    bool _899 = isnan(_743);
    bool _901 = _897 || _899;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    float _907 = fma(_831, _881, _831);
    bool _909 = !_809;
    int _911 = _909 ? 0 : 1;
    float _913 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _895);
    float _915 = float(_891);
    float _917 = _683 + _685;
    float _919 = float(_893);
    float _921 = fma(_907, _761, _913);
    int _923 = _905 ? 0 : 1;
    float _925 = _917 + (-1.0);
    int _927 = abs(_911);
    float _929 = _919 * _915;
    float _931 = _683 + (-0.5);
    int _933 = ~_923;
    int _935 = _933 + 1;
    int _937 = _935 + 1;
    float _939 = _921 * 0.15915493667125701904296875;
    int _941 = _937;
    if (!_871)
    {
        int _943 = ~_923;
        int _945 = _943 + 1;
        _941 = _945;
    }
    int _947 = _941;
    float _949 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _951 = _929 * (-2.0);
    float _953 = float(_947);
    float _955 = _685 + _681;
    float _957 = float(_927);
    float _959 = fma(_951, _719, _719);
    float _961 = fma(_949, _951, _949);
    float _963 = _955 + (-1.0);
    float _965 = _957 * _953;
    float _967 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].y, _959);
    float _969 = _685 + (-0.5);
    float _971 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _973 = _965 * (-2.0);
    float _975 = fma(_961, _761, _967);
    float _977 = _939 * 6.283185482025146484375;
    float _979 = cos(_977);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _773);
    float _983 = fma(_973, _721, _721);
    float _985 = fma(_971, _973, _971);
    float _987 = _975 * 0.15915493667125701904296875;
    float _989 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _991 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[196].z, _983);
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _769);
    float _995 = _987 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _989 * _981;
    float _1001 = fma(_985, _761, _991);
    float _1003 = _689 * _993;
    float _1005 = _1001 * 0.15915493667125701904296875;
    float _1007 = _987 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = in.m_46.x;
    float _1013 = in.m_46.y;
    float _1015 = in.m_46.z;
    float _1017 = _939 * 6.283185482025146484375;
    float _1019 = sin(_1017);
    float _1021 = _979 * _997;
    float _1023 = _1005 * 6.283185482025146484375;
    float _1025 = cos(_1023);
    float _1027 = _979 * _1009;
    float _1029 = _1005 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _1019 * _997;
    float _1035 = _1019 * _1009;
    float _1037 = _979 * _1025;
    float _1039 = _1019 * _1025;
    float _1041 = _1009 * _1025;
    float _1043 = _997 * _1025;
    float _1045 = _1037 * _999;
    float _1047 = _1039 * _999;
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_1031, _1027, _1033);
    float _1053 = -_1021;
    float _1055 = fma(_1031, _1035, _1053);
    float _1057 = -_1035;
    float _1059 = fma(_1031, _1021, _1057);
    float _1061 = -_999;
    float _1063 = _1031 * _1061;
    float _1065 = fma(_1051, _1003, _1045);
    float _1067 = fma(_1031, _1033, _1027);
    float _1069 = fma(_1055, _1003, _1047);
    float _1071 = fma(_1041, _1003, _1063);
    float _1073 = fma(_1059, _1049, _1065);
    float _1075 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1077 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1079 = fma(_1043, _1049, _1071);
    float _1081 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1083 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1085 = fma(_1067, _1049, _1069);
    float _1087 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1075);
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1081);
    float _1091 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1077);
    float _1093 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1083);
    float _1095 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1087);
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1089);
    float _1099 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1091);
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1107 = _1099 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = _1013 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1113 = _1103 + _1105;
    float _1115 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1117 = _1107 + _1109;
    float _1119 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1111);
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1113 + _1121;
    float _1125 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1115);
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1129 = _1117 + _1127;
    float _1131 = fma(_1015, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1119);
    float _1133 = _1123 * _1123;
    float _1135 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    float _1137 = _1131 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1139 = fma(_1129, _1129, _1133);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = sqrt(_1139);
    float _1145 = _1137 + _1141;
    bool _1147 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = _1117;
    float _1151 = _1113;
    float _1153 = _1079;
    if (!_1147)
    {
        _885 = _1145;
    }
    float _1155 = _885;
    bool _1157 = !_1147;
    float _1159 = _1155;
    if (!_1157)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1165 = _1143 + _1163;
        float _1167 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1169 = rsqrt(_1139);
        float _1171 = _1165 * _1161;
        float _1173 = _1171 * 0.15915493667125701904296875;
        float _1175 = _1173 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1173 * 6.283185482025146484375;
        float _1181 = sin(_1179);
        float _1183 = _1177 + (-1.0);
        float _1185 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1187 = fma(_1181, _1167, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1189 = fma(_1145, _1177, _1185);
        float _1191 = _1169 * _1187;
        float _1193 = fma(_1129, _1191, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1195 = fma(_1123, _1191, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1159 = _1189;
        _1149 = _1193;
        _1151 = _1195;
        _1153 = _1169;
    }
    float _1197 = _1159;
    float _1199 = _1149;
    float _1201 = _1151;
    float _1203 = _1153;
    float _1205 = -_1137;
    float _1207 = _1205 + _1197;
    float _1209 = -_1107;
    float _1211 = _1209 + _1199;
    float _1213 = -_1103;
    float _1215 = _1213 + _1201;
    float _1217 = _1207 * _1207;
    float _1219 = fma(_1211, _1211, _1217);
    float _1221 = fma(_1215, _1215, _1219);
    float _1223 = sqrt(_1221);
    bool _1225 = _1223 > 0.0;
    bool _1227 = !_1225;
    float _1229 = _1197;
    float _1231 = _1199;
    float _1233 = _1201;
    float _1235 = _1203;
    float _1237 = _1215;
    if (!_1227)
    {
        float _1239 = _185 * _185;
        float _1241 = fma(_183, _183, _1239);
        float _1243 = fma(_187, _187, _1241);
        float _1245 = rsqrt(_1221);
        float _1247 = sqrt(_1243);
        float _1249 = _1211 * _1245;
        float _1251 = _1207 * _1245;
        float _1253 = _1215 * _1245;
        bool _1255 = _1247 > 0.0;
        bool _1257 = !_1255;
        _1235 = _1247;
        if (!_1257)
        {
            float _1259 = rsqrt(_1243);
            float _1261 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1263 = _185 * _1259;
            float _1265 = _183 * _1259;
            float _1267 = _187 * _1259;
            float _1269 = _1251 * _1263;
            float _1271 = fma(_1249, _1265, _1269);
            float _1273 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1275 = fma(_1253, _1267, _1271);
            float _1277 = _1275 * _1273;
            float _1279 = fma(_183, _1277, _1199);
            float _1281 = fma(_185, _1277, _1197);
            float _1283 = fma(_187, _1277, _1201);
            _1229 = _1281;
            _1231 = _1279;
            _1233 = _1283;
            _1235 = _1263;
        }
    }
    float _1285 = _1229;
    float _1287 = _1231;
    float _1289 = _1233;
    float _1291 = _1235;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1295 = _1285 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1299 = _1287 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1289 + _1301;
    float _1305 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1307 = _1295 * _1295;
    float _1309 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1305);
    float _1311 = fma(_1299, _1299, _1307);
    float _1313 = fma(_1303, _1303, _1311);
    float _1315 = rsqrt(_1313);
    float _1317 = sqrt(_1313);
    float _1319 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1321 = _1299 * _1319;
    float _1323 = _1303 * _1319;
    float _1325 = _1321 * _1321;
    float _1327 = _1323 * _1323;
    float _1329 = _1325 + _1327;
    float _1331 = sqrt(_1329);
    bool _1333 = _1331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1337 = _1331 + _1335;
    float _1339 = _1315;
    float _1341 = _1329;
    float _1343 = _1337;
    float _1345 = _1291;
    float _1347 = _1295;
    if (_1333)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1349;
    }
    float _1351 = _1339;
    if (_1333)
    {
        float _1353 = rsqrt(_1329);
        _1341 = _1353;
    }
    float _1355 = _1341;
    float _1357 = _1355;
    if (_1333)
    {
        float _1359 = _1337 * _1351;
        _1343 = _1359;
    }
    float _1361 = _1343;
    if (_1333)
    {
        float _1363 = _1361 * 0.15915493667125701904296875;
        _1345 = _1363;
    }
    float _1365 = _1345;
    float _1367 = _1303;
    float _1369 = _1365;
    if (_1333)
    {
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        _1367 = _1373;
    }
    float _1375 = _1367;
    float _1377 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1379 = precise::max(0.0, _1377);
    float _1381 = _1351;
    float _1383 = _1379;
    if (_1333)
    {
        float _1385 = _1365 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        _1381 = _1387;
    }
    float _1389 = _1381;
    float _1391 = -_1319;
    float _1393 = -_1379;
    float _1395 = fma(_1295, _1391, _1393);
    float _1397 = _1395;
    if (_1333)
    {
        float _1399 = _1395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1347 = _1399;
    }
    float _1401 = _1347;
    float _1403 = _1401;
    if (!_1333)
    {
        _1369 = _1327;
    }
    float _1405 = _1369;
    float _1407 = _1375;
    float _1409 = _1405;
    if (_1333)
    {
        float _1411 = fma(_1375, _1401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1403 = _1411;
    }
    float _1413 = _1403;
    if (!_1333)
    {
        _1407 = _1321;
    }
    float _1415 = _1407;
    float _1417 = _1415;
    float _1419 = _1389;
    if (_1333)
    {
        float _1421 = _1389 + (-1.0);
        _1383 = _1421;
    }
    float _1423 = _1383;
    float _1425 = _1423;
    if (_1333)
    {
        float _1427 = _1355 * _1413;
        _1237 = _1427;
    }
    float _1429 = _1237;
    if (!_1333)
    {
        _1357 = _1325;
    }
    float _1431 = _1357;
    float _1433 = _1431;
    if (_1333)
    {
        float _1435 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1425 = _1435;
    }
    float _1437 = _1425;
    if (_1333)
    {
        float _1439 = _1321 * _1429;
        _1417 = _1439;
    }
    float _1441 = _1417;
    float _1443 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1333)
    {
        float _1445 = fma(_1395, _1389, _1437);
        _1397 = _1445;
    }
    float _1447 = _1397;
    if (!_1333)
    {
        _1419 = _1323;
    }
    float _1449 = _1419;
    float _1451 = _1449;
    if (_1333)
    {
        float _1453 = _1323 * _1429;
        _1451 = _1453;
    }
    float _1455 = _1451;
    if (_1333)
    {
        float _1457 = _1441 * _1441;
        _1433 = _1457;
    }
    float _1459 = _1433;
    float _1461 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    if (_1333)
    {
        float _1465 = _1455 * _1455;
        _1409 = _1465;
    }
    float _1467 = _1409;
    float _1469 = fma(_1447, _1447, _1459);
    float _1471 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1473 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1475 = _1469 + _1467;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1479 = fma(_1317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1477);
    float _1481 = precise::clamp(_1479, 0.0, 1.0);
    float _1483 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1485 = rsqrt(_1475);
    float _1487 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1489 = -_1481;
    float _1491 = _1489 + 1.0;
    float _1493 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1501 = abs(_1491);
    float _1503 = log2(_1501);
    float _1505 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1507 = fma(_1103, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1509 = -_1499;
    float _1511 = fma(_1509, _1497, 1.0);
    float _1513 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1505);
    float _1515 = _1485 * _1441;
    float _1517 = _1485 * _1447;
    float _1519 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1513);
    float _1521 = floor(_1487);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1525 = _1485 * _1455;
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1529 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = -_1523;
    float _1533 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1309);
    float _1537 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1539 = floor(_1507);
    float _1541 = -_1525;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1545 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1547 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1549 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1551 = fma(_1543, -0.5, 0.5);
    float _1553 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1555 = fma(_1543, 0.5, 0.5);
    float _1557 = exp2(_1537);
    float _1559 = -_1521;
    float _1561 = _1487 + _1559;
    float _1563 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1553);
    float _1565 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1567 = _1517 + 1.0;
    float _1569 = fma(_1555, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1571 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1565);
    float _1573 = 1.0 / _1563;
    float _1575 = -_1539;
    float _1577 = _1507 + _1575;
    float _1579 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1549);
    float _1581 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1571);
    float _1583 = fma(_1555, _1569, -0.212114393711090087890625);
    float _1585 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1587 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1581);
    float _1589 = log2(_1511);
    float _1591 = -_1517;
    float _1593 = fma(_1557, _1567, _1591);
    float _1595 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1585);
    float _1597 = sqrt(_1551);
    float _1599 = _1587 * _1573;
    float _1601 = _1595 * _1573;
    float2 _4951 = float2(_1561, _1577);
    float _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4951, float2(0.0), isnan(_4951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4951, float2(0.0), isnan(_4951)), level(0.0)).x;
    float _1605 = fma(_1555, _1583, 1.570728778839111328125);
    float _1607 = fma(_1599, 0.5, 0.5);
    float _1609 = fma(_1601, -0.5, 0.5);
    float _1611 = fma(_1593, 0.5, 0.5);
    float _1613 = _1589 * 0.693147182464599609375;
    float _1615 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = _1597 * 0.636619746685028076171875;
    float _1619 = -_1605;
    float _1621 = fma(_1617, _1619, 1.0);
    float3 _4987 = float3(_1607, _1609, _1615);
    float _1623 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4987, float3(0.0), isnan(_4987)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4987, float3(0.0), isnan(_4987)), level(0.0)).x;
    float3 _4998 = float3(_1607, _1609, _1615);
    float4 _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4998, float3(0.0), isnan(_4998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4998, float3(0.0), isnan(_4998)), level(0.0)).xyzw;
    float _1628 = _1626.x;
    float _1630 = _1626.y;
    float _1632 = _1626.z;
    float _1634 = _1626.w;
    float2 _5014 = float2(_1621, _1611);
    float3 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5014, float2(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5014, float2(0.0), isnan(_5014)), level(0.0)).xyz;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1648 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1652 = _1650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1654 = _687 > 0.5;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1652;
    float _1666 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1646);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1672 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1666);
    float _1674 = _793 + 0.5;
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1678 = _1676 != 0;
    float _1680 = 1.0 / _1658;
    float _1682 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1648);
    float _1684 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1694 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1698 = _675 + _1696;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / _1684;
    float _1706 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1708 = _1688 * _1664;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1710;
    bool _1714 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1716 = isnan(_675);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = _1706 + _1684;
    float _1728 = fma(_1708, _1698, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1732 = _675 + _1730;
    float _1734 = _1692 * _1680;
    bool _1736 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1738 = isnan(_675);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = 1.0 / _1670;
    bool _1750 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1752 = isnan(_675);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1734, _1732, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1764 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1766 = isnan(_675);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = -_1746;
    float _1778 = _1776 + 1.0;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1782 = _675 + _1780;
    float _1784 = -_1760;
    float _1786 = _1784 + 1.0;
    float _1788 = _1726 * _1704;
    float _1790 = _1788 * 0.5;
    float _1792 = _1760 * _1778;
    float _1794 = -_1774;
    float _1796 = _1794 + 1.0;
    float _1798 = _1724 * _1786;
    float _1800 = -_1724;
    float _1802 = _1800 + 1.0;
    float _1804 = _1746 * _1796;
    float _1806 = _1728 * _1798;
    float _1808 = -_769;
    int _1810 = _763 ? as_type<int>(_1808) : as_type<int>(_769);
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1814 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1812);
    float _1816 = _1712 * _1748;
    float _1818 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1806);
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1822 = _681 > 0.5;
    float _1824 = fma(_1816, _1782, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1826 = fma(_1762, _1792, _1818);
    float _1828 = -_797;
    float _1830 = _1828 + 0.5;
    float _1832 = -_769;
    int _1834 = _1822 ? as_type<int>(_1832) : as_type<int>(_769);
    float _1836 = fma(_1824, _1804, _1826);
    float _1838 = 1.0 / _1814;
    float _1840 = -_773;
    int _1842 = _757 ? as_type<int>(_1840) : as_type<int>(_773);
    float _1844 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1836);
    bool _1846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1848 = isnan(0.5);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1854 = _1850 || _1852;
    float _1856 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1858 = !_1662;
    float _1860 = _1858 ? _769 : as_type<float>(_1834);
    float _1862 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1866 = _1856 * _1820;
    bool _1868 = !_1678;
    float _1870 = _1868 ? _769 : as_type<float>(_1810);
    float _1872 = _1860 + 0.5;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1876 = _1874 != 0;
    float _1878 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1880 = -_773;
    int _1882 = _1654 ? as_type<int>(_1880) : as_type<int>(_773);
    float _1884 = _1870 + 0.5;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1888 = _1838 * _1886;
    float _1890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1892 = !_1702;
    float _1894 = _1892 ? _773 : as_type<float>(_1842);
    float _1896 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1898 = -_1894;
    float _1900 = _1898 + 0.5;
    float _1902 = _1862 * _1864;
    float _1904 = abs(_1888);
    float _1906 = log2(_1904);
    float _1908 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1910 = !_1876;
    float _1912 = _1910 ? _773 : as_type<float>(_1882);
    float _1914 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1916 = _1864;
    float _1918 = _1563;
    float _1920 = _1595;
    if (!_1854)
    {
        _1916 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1922 = _1916;
    float _1924 = _773 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _1866;
    out.m_66.y = _1902;
    float _1926 = -_1912;
    float _1928 = _1926 + 0.5;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = _1922;
    if (!_1854)
    {
        float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1936 = _1922 + _1934;
        _1932 = _1936;
    }
    float _1938 = _1932;
    float _1940 = _1896 * _1890;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1944 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1946 = isnan(_1317);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1952 = _1948 || _1950;
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1956 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1960 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1964 = _1908 * _1930;
    float _1966 = _1930;
    float _1968 = _1956;
    float _1970 = _1938;
    if (!_1854)
    {
        float _1972 = 1.0 / _1938;
        _1966 = _1972;
    }
    float _1974 = _1966;
    float _1976 = _1914 * _1954;
    float _1978 = exp2(_1956);
    float _1980 = _1942 * _1962;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_68.x = _1964;
    out.m_68.y = _1976;
    out.m_68.z = _1940;
    out.m_68.w = _1980;
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1854)
    {
        float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1992 = _1888 + _1990;
        _1968 = _1992;
    }
    float _1994 = _1968;
    if (_1854)
    {
        _1970 = 1.0;
    }
    float _1996 = _1970;
    bool _1998 = _1888 <= 8000.0;
    bool _2000 = isnan(_1888);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan(8000.0);
    bool _2006 = _2002 || _2004;
    float _2008 = float(_2006);
    float _2010 = _1996;
    if (!_1854)
    {
        float _2012 = _1994 * _1974;
        float _2014 = precise::clamp(_2012, 0.0, 1.0);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_70.x = _1986;
    out.m_70.y = _1960;
    out.m_70.z = _1988;
    out.m_70.w = _1878;
    float _2020 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2026 = -_1031;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2018);
    float _2030 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = fma(_1924, _1924, 1.0);
    float _2034 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2036 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2038 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2040 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2042 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2034);
    float _2044 = rsqrt(_2032);
    float _2046 = -_1031;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2024);
    float _2050 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2036);
    float _2052 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2054 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2056 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    float _2058 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2028);
    float _2060 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2052);
    float _2062 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2064 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2040);
    float _2066 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2042);
    float _2068 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2048);
    float _2070 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    float _2072 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2056);
    float _2074 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2060);
    float _2076 = -_1031;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2080 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2062);
    float _2082 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2084 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2064);
    float _2086 = _769 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2088 = _1924 * _2058;
    float _2090 = _1924 * _2044;
    float _2092 = _1924 * _2068;
    float _2094 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2082);
    float _2096 = fma(_2086, _2070, _2088);
    float _2098 = -_2072;
    float _2100 = _2090 * _2098;
    float _2102 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2078);
    out.m_72.x = _2070;
    out.m_72.y = _2074;
    out.m_72.z = _2080;
    float _2104 = fma(_2086, _2074, _2092);
    float _2106 = -_2066;
    float _2108 = _2090 * _2106;
    float _2110 = -_2084;
    float _2112 = _2090 * _2110;
    float _2114 = fma(_2022, -2.0, 3.0);
    float _2116 = _2022 * _2022;
    float _2118 = fma(_2044, _2068, _2100);
    float _2120 = fma(_2044, _2058, _2108);
    float _2122 = fma(_2044, _2102, _2112);
    float _2124 = _2116 * _2114;
    float _2126 = in.m_74.x;
    float _2128 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2094);
    float _2130 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2132 = -_2124;
    float _2134 = _2132 + 1.0;
    float _2136 = _1563 * 0.5;
    float _2138 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2128);
    float _2140 = exp2(_2130);
    float _2142 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2124);
    float _2144 = fma(_1595, -0.5, _2136);
    float _2146 = _2066 + _2096;
    float _2148 = _2138 + _1563;
    float _2150 = _2008 * _2142;
    float _2152 = _1587 + _1563;
    float _2154 = _1924 * _2102;
    float _2156 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2158 = _2072 + _2104;
    float _2160 = _2148 * 0.5;
    float _2162 = _2152 * 0.5;
    out.gl_Position.x = _1587;
    out.gl_Position.y = _1595;
    out.gl_Position.z = _2138;
    out.gl_Position.w = _1563;
    float _2164 = fma(_2086, _2080, _2154);
    float _2166 = -_2140;
    float _2168 = _2166 + 1.0;
    out.m_76.x = _2162;
    out.m_76.y = _2144;
    out.m_76.z = _2160;
    out.m_76.w = _1563;
    float _2170 = _2084 + _2164;
    float _2172 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _2120;
    out.m_78.y = _2118;
    out.m_78.z = _2122;
    out.m_80.x = _2146;
    out.m_80.y = _2158;
    out.m_80.z = _2170;
    float _2174 = -_2172;
    float _2176 = _2174 + 1.0;
    float _2178 = _2138;
    float _2180 = _2120;
    float _2182 = _2172;
    float _2184 = _2176;
    if (!_1952)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2186 = _1918;
    float _2188 = _2186;
    float _2190 = _2186;
    if (!_1952)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2192 = _2178;
    float _2194 = _2192;
    float _2196 = _2192;
    if (!_1952)
    {
        _1920 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2198 = _1920;
    float _2200 = _2016 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2202 = _2198;
    float _2204 = _2198;
    if (!_1952)
    {
        _2180 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2206 = _2180;
    float _2208 = -_1603;
    float _2210 = _2208 + 1.0;
    float _2212 = _2210 * _2156;
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = -_2214;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2220 = _2218 * _2126;
    float _2222 = _2220 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2224 = _2172 * _1623;
    float _2226 = _1634 * _2176;
    out.m_82.x = _2222;
    float _2228 = _2206;
    float _2230 = _2206;
    if (!_1952)
    {
        _2182 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2232 = _2182;
    float _2234 = _1634 * _2224;
    float _2236 = _1644 * _2224;
    float _2238 = _2232;
    float _2240 = _2232;
    if (!_1952)
    {
        _2184 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2242 = _2184;
    float _2244 = fma(_1640, _2234, _1628);
    float _2246 = fma(_1642, _2234, _1630);
    float _2248 = fma(_1634, _2236, _1632);
    out.m_84.x = _2244;
    out.m_84.y = _2246;
    out.m_84.z = _2248;
    out.m_84.w = _2226;
    bool _2250 = !_1952;
    float _2252 = _2242;
    float _2254 = _2242;
    if (!_2250)
    {
        bool _2256 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2258 = isnan(_1317);
        bool _2260 = _2256 || _2258;
        bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2264 = _2260 || _2262;
        if (!_2264)
        {
            float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2268 = _1317 + _2266;
            float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2272 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2270;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2278 = 1.0 / _2272;
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2296 = _2268 * _2278;
            float _2298 = precise::clamp(_2296, 0.0, 1.0);
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2304 = fma(_2298, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2306 = fma(_2298, _2302, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2308 = fma(_2298, _2282, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2310 = fma(_2298, _2286, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2312 = fma(_2298, _2290, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2314 = fma(_2298, _2294, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2230 = _2308;
            _2204 = _2312;
            _2240 = _2304;
            _2196 = _2310;
            _2190 = _2306;
            _2254 = _2314;
            _2316 = true;
        }
        else
        {
            bool _2318 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2320 = isnan(_1317);
            bool _2322 = _2318 || _2320;
            bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2326 = _2322 || _2324;
            if (!_2326)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2328 = _2238;
            _2240 = _2328;
            if (!_2326)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2330 = _2228;
            _2230 = _2330;
            if (!_2326)
            {
                _2188 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2332 = _2188;
            _2190 = _2332;
            if (!_2326)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2334 = _2194;
            _2196 = _2334;
            if (!_2326)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2336 = _2202;
            _2204 = _2336;
            if (!_2326)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2338 = _2252;
            bool _2340 = !_2326;
            _2254 = _2338;
            if (!_2340)
            {
                bool _2342 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2344 = isnan(_1317);
                bool _2346 = _2342 || _2344;
                bool _2348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2350 = _2346 || _2348;
                if (!_2350)
                {
                    float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2354 = _1317 + _2352;
                    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2358 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2356;
                    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2364 = 1.0 / _2358;
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2382 = _2354 * _2364;
                    float _2384 = precise::clamp(_2382, 0.0, 1.0);
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2390 = fma(_2384, _2362, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2392 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2396 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2398 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2400 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2230 = _2394;
                    _2204 = _2398;
                    _2240 = _2390;
                    _2196 = _2396;
                    _2190 = _2392;
                    _2254 = _2400;
                    _2316 = true;
                }
                else
                {
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2190 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2316 = false;
    float _2402 = _2230;
    float _2404 = _2204;
    float _2406 = _2240;
    float _2408 = _2196;
    float _2410 = _2190;
    float _2412 = _2254;
    float _2414 = fma(_2158, -0.5, 0.5);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = -_2402;
    float _2420 = _2418 + _2404;
    float _2422 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2424 = -_2406;
    float _2426 = _2424 + _2408;
    float _2428 = fma(_2416, _2420, _2402);
    out.m_86.x = 0.0;
    float _2430 = -_2410;
    float _2432 = _2430 + _2412;
    float _2434 = fma(_2416, _2426, _2406);
    float _2436 = _2428 * 0.586610972881317138671875;
    out.m_49.x = _2422;
    bool _2438 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2440 = fma(_2416, _2432, _2410);
    float _2442 = fma(_2434, 0.298911988735198974609375, _2436);
    bool _2444 = _2016 > 0.0;
    bool _2446 = isnan(_2016);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan(0.0);
    bool _2452 = _2448 || _2450;
    float _2454 = fma(_2440, 0.114477999508380889892578125, _2442);
    float _2456 = -_2454;
    float _2458 = _2434 + _2456;
    float _2460 = -_2454;
    float _2462 = _2428 + _2460;
    float _2464 = -_2454;
    float _2466 = _2440 + _2464;
    float _2468 = fma(_2458, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    float _2470 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    float _2472 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2454);
    bool _2474 = !_2438;
    if (!_2474)
    {
        float _2476 = -_1285;
        float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2480 = -_1287;
        float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2484 = -_1289;
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2488 = _2478 * _2478;
        float _2490 = fma(_2482, _2482, _2488);
        float _2492 = fma(_2486, _2486, _2490);
        float _2494 = sqrt(_2492);
        float _2496 = rsqrt(_2492);
        float _2498 = -_2494;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2502 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        float _2506 = _2482 * _2496;
        float _2508 = _2478 * _2496;
        float _2510 = abs(_2504);
        float _2512 = log2(_2510);
        float _2514 = _2486 * _2496;
        float _2516 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2518 = _2158 * _2508;
        float _2520 = -_2508;
        float _2522 = -_2516;
        float _2524 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2522);
        float _2526 = fma(_2146, _2506, _2518);
        float _2528 = -_2514;
        float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2524);
        float _2532 = fma(_2170, _2514, _2526);
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2538 = _2530 + _2536;
        float _2540 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2544 = precise::clamp(_2542, 0.0, 1.0);
        float _2546 = exp2(_2540);
        float _2548 = _2546 * _2544;
        float _2550 = _2534 * _2548;
        float _2552 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2554 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2556 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2552;
        out.m_86.y = _2554;
        out.m_86.z = _2556;
    }
    out.m_88.x = _2468;
    out.m_88.y = _2470;
    out.m_88.z = _2472;
    if (_2452)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2558;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

