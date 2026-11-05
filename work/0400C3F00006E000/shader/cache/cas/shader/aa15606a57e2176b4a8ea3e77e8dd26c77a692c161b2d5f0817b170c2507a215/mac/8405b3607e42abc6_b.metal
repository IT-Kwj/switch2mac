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
    float4 m_57 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2330 = false;
    bool _729 = false;
    bool _559 = false;
    bool _455 = false;
    bool _279 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2629 = as_type<float>(_115);
        out.gl_Position.z = _2629;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_99);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    if (_147)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _109;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_153);
        out.gl_Position.z = _2698;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _157 = !_155;
    float _175;
    if (!_157)
    {
        float _159 = in.m_53.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_99);
        float _181 = 1.0 / _179;
        float _183 = _133 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = _185 + _187;
    bool _191 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_185);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -_201;
    float _209 = _207 + 1.0;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _213 = 1.0 / _205;
    float _215 = _189 * _213;
    bool _217 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _219 = isnan(_185);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _233;
    float _237 = _227 * _209;
    float _239 = fma(_231, _215, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _241 = fma(_235, _215, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _243 = -_227;
    float _245 = _243 + 1.0;
    float _247 = _239 * _237;
    float _249 = _241 * _237;
    float _251 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].x, _247);
    float _253 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].y, _249);
    float _255 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].x, _251);
    float _257 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].y, _253);
    bool _259 = !_211;
    float _277;
    if (!_259)
    {
        float _261 = in.m_53.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[11].x, _133);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_99);
        float _283 = 1.0 / _281;
        float _285 = _133 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = in.m_55.x;
    float _291 = in.m_55.y;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _295 = _287 + _293;
    bool _297 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _299 = isnan(_287);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _311;
    float _321 = _257 * _291;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _327 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _329 = isnan(_287);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _295 * _319;
    float _341 = 1.0 / _325;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _345 = _287 + _343;
    bool _347 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _349 = isnan(_287);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _359;
    float _363 = _357 * _315;
    float _365 = -_357;
    float _367 = _365 + 1.0;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _373;
    float _377 = fma(_361, _339, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _379 = _337 * _367;
    float _381 = fma(_371, _339, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _383 = fma(_375, _339, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _385 = -_337;
    float _387 = _385 + 1.0;
    float _389 = _345 * _341;
    float _391 = _381 * _379;
    float _393 = _377 * _379;
    float _395 = _383 * _379;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].x, _391);
    float _411 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].y, _393);
    float _413 = fma(_399, _389, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _415 = fma(_403, _389, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _417 = fma(_407, _389, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].z, _395);
    float _421 = fma(_413, _363, _409);
    float _423 = fma(_415, _363, _411);
    float _425 = _255 * _289;
    float _427 = fma(_417, _363, _419);
    float _429 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].x, _421);
    float _431 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].y, _423);
    float _433 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].z, _427);
    bool _435 = !_317;
    float _453;
    if (!_435)
    {
        float _437 = in.m_53.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_99);
        float _459 = 1.0 / _457;
        float _461 = _133 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    bool _465 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_463);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_463);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _463 + _497;
    float _501 = 1.0 / _479;
    float _503 = -_475;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _509 = _491 * _505;
    float _511 = -_491;
    float _513 = _511 + 1.0;
    float _515 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _495 * _501;
    float _519 = fma(_517, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _519 * _509;
    float _525 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[116].x, _529);
    float _535 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _535;
    out.m_57.y = _527;
    out.m_57.z = _531;
    out.m_57.w = _537;
    bool _539 = !_507;
    float _557;
    if (!_539)
    {
        float _541 = in.m_53.x;
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].z, _133);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_99);
        float _563 = 1.0 / _561;
        float _565 = _133 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _571 = _567 + _569;
    bool _573 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _575 = isnan(_567);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _587 = _567 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _597 = 1.0 / _591;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _601 = 1.0 / _595;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _603;
    float _607 = _571 * _597;
    bool _609 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _611 = isnan(_567);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -_583;
    float _623 = _621 + 1.0;
    bool _625 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _627 = isnan(_567);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_605, _607, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _639 = _635 * _623;
    float _641 = -_635;
    float _643 = _641 + 1.0;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _649;
    float _653 = _587 * _601;
    float _655 = _619 * _643;
    float _657 = fma(_647, _607, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _659 = fma(_651, _607, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _661 = -_619;
    float _663 = _661 + 1.0;
    float _665 = _637 * _655;
    float _667 = _657 * _655;
    float _669 = _659 * _655;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].x, _667);
    float _685 = fma(_673, _653, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _687 = fma(_677, _653, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _689 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].y, _665);
    float _691 = fma(_681, _653, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _693 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].z, _669);
    float _695 = fma(_685, _639, _683);
    float _697 = fma(_687, _639, _689);
    float _699 = fma(_691, _639, _693);
    float _701 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].x, _695);
    float _703 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].y, _697);
    float _705 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].z, _699);
    bool _707 = !_599;
    float _709 = _691;
    float _727;
    if (!_707)
    {
        float _711 = in.m_53.x;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _715 = _711 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _719 = _717 * _713;
        float _721 = floor(_719);
        float _723 = -_721;
        float _725 = _719 + _723;
        _727 = _725;
        _729 = true;
    }
    else
    {
        float _731 = float(_99);
        float _733 = 1.0 / _731;
        float _735 = _133 * _733;
        _727 = _735;
    }
    _729 = false;
    float _737 = _727;
    float _739 = in.m_53.z;
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _747 = _745 != 0;
    float _749 = in.m_53.x;
    float _751 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _763 = _761 != 0;
    float _765 = in.m_46.x;
    float _767 = in.m_46.y;
    float _769 = in.m_46.z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _773 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _775 = _697;
    if (!_747)
    {
        float _777 = in.m_53.y;
        _775 = _777;
    }
    float _779 = _775;
    float _781 = _743 * _133;
    float _783 = _739 * 2.0;
    float _785 = exp2(_781);
    float _787 = _749 * 2.0;
    float _789 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _791 = floor(_783);
    float _793 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _795 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _797 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _789);
    float _799 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _793);
    float _801 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _795);
    float _803 = _765;
    if (!_747)
    {
        _709 = _779;
    }
    float _805 = _709;
    float _807 = floor(_787);
    float _809 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].z, _797);
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    if (!_747)
    {
        _803 = _739;
    }
    float _813 = _803;
    float _815 = _805;
    float _817 = _779;
    float _819 = _813;
    if (_747)
    {
        float _821 = in.m_53.x;
        float _823 = in.m_53.y;
        _815 = _821;
        _817 = _823;
    }
    float _825 = _815;
    float _827 = _817;
    float _829 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].z, _801);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _833 = _791 >= 0.0;
    bool _835 = isnan(_791);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _809 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _845 = _791 > 0.0;
    float _847 = _811 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _849 = _841 ? 0 : 1;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _843 + _851;
    float _855 = _829 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _857 = _807 > 0.0;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _861 = _847 + _859;
    bool _863 = _807 >= 0.0;
    bool _865 = isnan(_807);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _875 = -_785;
    float _877 = _875 + 1.0;
    int _879 = _871 ? 0 : 1;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_747)
    {
        _819 = _827;
    }
    float _883 = _819;
    float _885 = _825 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _887 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].z, _881);
    int _889 = ~_849;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[83].w, _831);
    float _897 = _883;
    int _899 = _893;
    if (!_747)
    {
        _897 = _739;
    }
    float _901 = _897;
    float _903 = -_873;
    float _905 = fma(_885, 2.0, _903);
    float _907 = _901;
    if (_747)
    {
        _907 = _827;
    }
    float _909 = _907;
    float _911 = _739 + _827;
    int _913 = ~_879;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _887);
    int _921 = _917;
    if (!_857)
    {
        int _923 = ~_879;
        int _925 = _923 + 1;
        _921 = _925;
    }
    int _927 = _921;
    float _929 = _909 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _931 = _911 + (-1.0);
    float _933 = _749 + _827;
    if (!_845)
    {
        int _935 = ~_849;
        int _937 = _935 + 1;
        _899 = _937;
    }
    int _939 = _899;
    float _941 = fma(_929, -2.0, _771);
    bool _943 = !_755;
    int _945 = _943 ? 0 : 1;
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _949 = _933 + (-1.0);
    bool _951 = !_759;
    int _953 = _951 ? 0 : 1;
    float _955 = _827 * 2.0;
    int _957 = abs(_945);
    float _959 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _961 = abs(_953);
    float _963 = -_133;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[81].x, _905);
    float _967 = floor(_955);
    float _969 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _941);
    float _971 = float(_957);
    float _973 = float(_939);
    float _975 = float(_961);
    float _977 = float(_927);
    float _979 = _971 * _973;
    bool _981 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _983 = isnan(1.0);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _989 = _985 || _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _993 = 1.0 + _991;
    float _995 = _853 * _853;
    float _997 = _975 * _977;
    bool _999 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1007 = _1003 || _1005;
    float _1009 = in.m_59.x;
    float _1011 = in.m_59.y;
    float _1013 = in.m_59.z;
    float _1015 = 1.0 / _993;
    bool _1017 = _967 > 0.0;
    float _1019 = fma(_861, _861, _995);
    bool _1021 = _967 >= 0.0;
    bool _1023 = isnan(_967);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _855 + _1031;
    float _1035 = _1007 ? _877 : 0.0;
    float _1037 = _979 * (-2.0);
    float _1039 = _997 * (-2.0);
    float _1041 = fma(_1033, _1033, _1019);
    float _1043 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _895);
    int _1045 = _1029 ? 0 : 1;
    bool _1047 = !_763;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = rsqrt(_1041);
    float _1053 = _1019;
    if (_989)
    {
        float _1055 = _1035 * _1015;
        _137 = _1055;
    }
    float _1057 = _137;
    int _1059 = ~_1045;
    int _1061 = _1059 + 1;
    int _1063 = _1061 + 1;
    int _1065 = _1063;
    if (!_1017)
    {
        int _1067 = ~_1045;
        int _1069 = _1067 + 1;
        _1065 = _1069;
    }
    int _1071 = _1065;
    float _1073 = _749 + (-0.5);
    int _1075 = abs(_1049);
    float _1077 = fma(_1037, _1009, _1009);
    float _1079 = fma(_959, _1037, _959);
    float _1081 = fma(_1039, _1011, _1011);
    float _1083 = float(_1071);
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1077);
    float _1087 = fma(_947, _1039, _947);
    float _1089 = float(_1075);
    float _1091 = _853 * _1051;
    float _1093 = fma(_1079, _1057, _1085);
    float _1095 = _827 + (-0.5);
    float _1097 = _861 * _1051;
    float _1099 = -_1091;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1103 = _1089 * _1083;
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1081);
    float _1107 = _749 + _739;
    float _1109 = as_type<float>(int(gl_VertexIndex));
    float _1111 = _1093 * 0.15915493667125701904296875;
    float _1113 = fma(_1087, _1057, _1105);
    float _1115 = _1033 * _1051;
    float _1117 = -_1097;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _1121 = _1101 * _1101;
    float _1123 = _1113 * 0.15915493667125701904296875;
    float _1125 = _1107 + (-1.0);
    float _1127 = _1103 * (-2.0);
    float _1129 = -_1115;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1133 = fma(_1119, _1119, _1121);
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1137 = fma(_1127, _1013, _1013);
    float _1139 = _739 + (-0.5);
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = fma(_1135, _1127, _1135);
    float _1145 = _1111 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1137);
    float _1151 = fma(_1143, _1057, _1149);
    int _1153 = as_type<int>(_1109) & 1;
    bool _1155 = _1153 != 0;
    int _1157 = as_type<int>(_1109) & 2;
    bool _1159 = _1157 != 0;
    float _1161 = sqrt(_1141);
    float _1163 = _1151 * 0.15915493667125701904296875;
    bool _1165 = !_1155;
    float _1167 = _1165 ? (-0.5) : 0.5;
    bool _1169 = !_1159;
    float _1171 = _1169 ? (-0.5) : 0.5;
    float _1173 = _1111 * 6.283185482025146484375;
    float _1175 = cos(_1173);
    float _1177 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1167);
    float _1179 = _1123 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1051 * _1161;
    float _1185 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1171);
    float _1187 = _751 * _1183;
    float _1189 = _773 * _1183;
    float _1191 = _1123 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1187 * _1177;
    float _1197 = _1189 * _1185;
    float _1199 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1163 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1147 * _1181;
    float _1209 = _1175 * _1181;
    float _1211 = _1163 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1175 * _1193;
    float _1217 = _1147 * _1193;
    float _1219 = _1175 * _1205;
    float _1221 = _1147 * _1205;
    float _1223 = _1193 * _1205;
    float _1225 = _1181 * _1205;
    float _1227 = _1219 * _1201;
    float _1229 = fma(_1213, _1215, _1207);
    float _1231 = -_1217;
    float _1233 = fma(_1213, _1209, _1231);
    float _1235 = _1213 * _1201;
    float _1237 = -_1209;
    float _1239 = fma(_1213, _1217, _1237);
    float _1241 = fma(_1229, _1195, _1227);
    float _1243 = _1221 * _1201;
    float _1245 = -_1235;
    float _1247 = fma(_1223, _1195, _1245);
    float _1249 = fma(_1213, _1207, _1215);
    float _1251 = -_1197;
    float _1253 = fma(_1233, _1251, _1241);
    float _1255 = fma(_1239, _1195, _1243);
    float _1257 = -_1197;
    float _1259 = fma(_1225, _1257, _1247);
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1263 = -_1197;
    float _1265 = fma(_1249, _1263, _1255);
    float _1267 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1269 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1261);
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1267);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1269);
    float _1277 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1271);
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1273);
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1275);
    float _1283 = _855 + _1277;
    float _1285 = _847 + _1279;
    float _1287 = _843 + _1281;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1291 = _1283 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1295 = _1285 + _1293;
    float _1297 = _1291 * _1291;
    float _1299 = fma(_1295, _1295, _1297);
    float _1301 = sqrt(_1299);
    bool _1303 = _1301 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1265;
    float _1307 = _1285;
    float _1309 = _1283;
    float _1311 = _1123;
    if (!_1303)
    {
        _1305 = _1287;
    }
    float _1313 = _1305;
    bool _1315 = !_1303;
    float _1317 = _1313;
    if (!_1315)
    {
        float _1319 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1323 = _1301 + _1321;
        float _1325 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = rsqrt(_1299);
        float _1329 = _1323 * _1319;
        float _1331 = _1329 * 0.15915493667125701904296875;
        float _1333 = _1331 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = _1331 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1335 + (-1.0);
        float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = fma(_1339, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1347 = fma(_1287, _1335, _1343);
        float _1349 = _1327 * _1345;
        float _1351 = fma(_1295, _1349, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1353 = fma(_1291, _1349, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1317 = _1347;
        _1307 = _1351;
        _1309 = _1353;
    }
    float _1355 = _1317;
    float _1357 = _1307;
    float _1359 = _1309;
    float _1361 = -_1091;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1355);
    float _1365 = -_1097;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1369 = -_1115;
    float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1359);
    float _1373 = -_1115;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1379 = _1363 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1383 = _1367 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1387 = _1371 + _1385;
    float _1389 = -_1097;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1393 = _1379 * _1379;
    float _1395 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = fma(_1383, _1383, _1393);
    float _1399 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1401 = fma(_1387, _1387, _1397);
    float _1403 = rsqrt(_1401);
    float _1405 = sqrt(_1401);
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1383 * _1407;
    float _1411 = _1387 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1291;
    float _1429 = _1417;
    float _1431 = _1425;
    float _1433 = _1409;
    float _1435 = _1411;
    float _1437 = _1413;
    if (_1421)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1439;
    }
    float _1441 = _1427;
    if (_1421)
    {
        float _1443 = rsqrt(_1417);
        _1429 = _1443;
    }
    float _1445 = _1429;
    if (_1421)
    {
        float _1447 = _1425 * _1441;
        _1431 = _1447;
    }
    float _1449 = _1431;
    if (_1421)
    {
        float _1451 = _1449 * 0.15915493667125701904296875;
        _1053 = _1451;
    }
    float _1453 = _1053;
    float _1455 = _1441;
    float _1457 = _1453;
    if (_1421)
    {
        float _1459 = _1453 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        _1455 = _1461;
    }
    float _1463 = _1455;
    float _1465 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1467 = precise::max(0.0, _1465);
    float _1469 = _1287;
    float _1471 = _1467;
    if (_1421)
    {
        float _1473 = _1453 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        _1469 = _1475;
    }
    float _1477 = _1469;
    float _1479 = -_1407;
    float _1481 = -_1467;
    float _1483 = fma(_1379, _1479, _1481);
    float _1485 = _1483;
    if (_1421)
    {
        float _1487 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1487;
    }
    float _1489 = _1471;
    float _1491 = _1463;
    float _1493 = _1489;
    if (_1421)
    {
        float _1495 = fma(_1463, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    if (!_1421)
    {
        _1493 = _1415;
    }
    float _1499 = _1493;
    float _1501 = floor(_1399);
    float _1503 = _1499;
    if (_1421)
    {
        float _1505 = _1477 + (-1.0);
        _1311 = _1505;
    }
    float _1507 = _1311;
    float _1509 = _1507;
    if (_1421)
    {
        float _1511 = _1445 * _1497;
        _1457 = _1511;
    }
    float _1513 = _1457;
    float _1515 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    if (_1421)
    {
        float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1509 = _1517;
    }
    float _1519 = _1509;
    if (_1421)
    {
        float _1521 = _1409 * _1513;
        _1433 = _1521;
    }
    float _1523 = _1433;
    if (_1421)
    {
        float _1525 = _1411 * _1513;
        _1435 = _1525;
    }
    float _1527 = _1435;
    float _1529 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1515);
    if (_1421)
    {
        float _1531 = fma(_1483, _1477, _1519);
        _1485 = _1531;
    }
    float _1533 = _1485;
    if (_1421)
    {
        float _1535 = _1523 * _1523;
        _1437 = _1535;
    }
    float _1537 = _1437;
    if (_1421)
    {
        float _1539 = _1527 * _1527;
        _1503 = _1539;
    }
    float _1541 = _1503;
    float _1543 = fma(_1533, _1533, _1537);
    float _1545 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1547 = _1543 + _1541;
    float _1549 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1545);
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1553 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1551);
    float _1555 = precise::clamp(_1553, 0.0, 1.0);
    float _1557 = rsqrt(_1547);
    float _1559 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1549);
    float _1561 = -_1555;
    float _1563 = _1561 + 1.0;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1567 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1569 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1571 = abs(_1563);
    float _1573 = log2(_1571);
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1577 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1579 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1581 = -_1575;
    float _1583 = fma(_1581, _1565, 1.0);
    float _1585 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1569);
    float _1587 = -_1501;
    float _1589 = _1399 + _1587;
    float _1591 = _1557 * _1523;
    float _1593 = _1557 * _1533;
    float _1595 = _1557 * _1527;
    float _1597 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1577);
    float _1599 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1585);
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1603 = floor(_1579);
    float _1605 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = -_1601;
    float _1611 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1609);
    float _1613 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1615 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1619 = -_1595;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1611);
    float _1623 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = exp2(_1613);
    float _1627 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1617);
    float _1629 = fma(_1621, -0.5, 0.5);
    float _1631 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1633 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1627);
    float _1635 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = log2(_1583);
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1633);
    float _1641 = -_1603;
    float _1643 = _1579 + _1641;
    float _1645 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1647 = _1593 + 1.0;
    float _1649 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1645);
    float _1651 = 1.0 / _1639;
    float _1653 = fma(_1621, 0.5, 0.5);
    float _1655 = fma(_1653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1657 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1631);
    float _1659 = sqrt(_1629);
    float _1661 = fma(_1653, _1655, -0.212114393711090087890625);
    float _1663 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1657);
    float _1665 = -_1593;
    float _1667 = fma(_1625, _1647, _1665);
    float _1669 = _1637 * 0.693147182464599609375;
    float _1671 = fma(_1653, _1661, 1.570728778839111328125);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1663);
    float _1675 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float2 _5122 = float2(_1589, _1643);
    float _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5122, float2(0.0), isnan(_5122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5122, float2(0.0), isnan(_5122)), level(0.0)).x;
    float _1679 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1681 = _1673 * _1651;
    float _1683 = _1675 * _1651;
    float _1685 = fma(_1667, 0.5, 0.5);
    float _1687 = fma(_1681, 0.5, 0.5);
    float _1689 = fma(_1683, -0.5, 0.5);
    float _1691 = _1659 * 0.636619746685028076171875;
    float _1693 = -_1671;
    float _1695 = fma(_1691, _1693, 1.0);
    float3 _5157 = float3(_1687, _1689, _1679);
    float _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5157, float3(0.0), isnan(_5157)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5157, float3(0.0), isnan(_5157)), level(0.0)).x;
    float3 _5168 = float3(_1687, _1689, _1679);
    float4 _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5168, float3(0.0), isnan(_5168)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5168, float3(0.0), isnan(_5168)), level(0.0)).xyzw;
    float _1702 = _1700.x;
    float _1704 = _1700.y;
    float _1706 = _1700.z;
    float _1708 = _1700.w;
    float2 _5184 = float2(_1695, _1685);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5184, float2(0.0), isnan(_5184)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5184, float2(0.0), isnan(_5184)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = -_1091;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _843);
    float _1724 = in.m_53.w;
    bool _1726 = _739 > 0.5;
    float _1728 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1736 = _749 > 0.5;
    float _1738 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1728);
    float _1740 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1730);
    float _1742 = 1.0 / _1734;
    float _1744 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1738);
    float _1746 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1740);
    float _1748 = -_1043;
    float _1750 = _1748 + 1.0;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1754 = _1746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1760 = 1.0 / _1752;
    float _1762 = _1754 + _1752;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _737 + _1772;
    float _1776 = _701 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = _1770 * _1742;
    float _1780 = 1.0 / _1766;
    float _1782 = _705 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1784 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1788 = _1786 != 0;
    float _1790 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1794 = _1792 != 0;
    float _1796 = 1.0 / _1758;
    float _1798 = _1762 * _1760;
    float _1800 = _1798 * 0.5;
    bool _1802 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1804 = isnan(_737);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1816 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1818 = isnan(_737);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1830 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1828);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1834 = _1832 != 0;
    float _1836 = -_1812;
    float _1838 = _1836 + 1.0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1842 = _1840 != 0;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1844;
    bool _1848 = _1724 > 0.5;
    float _1850 = _1826 * _1838;
    bool _1852 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1854 = isnan(_737);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = -_1826;
    float _1866 = _1864 + 1.0;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1874 = _1846 * _1796;
    float _1876 = _1862 * _1866;
    float _1878 = _1870 * _1780;
    bool _1880 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1882 = isnan(_737);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1894 = _737 + _1892;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1898 = _737 + _1896;
    float _1900 = _1814 * _1876;
    float _1902 = 1.0 / _1830;
    float _1904 = -_1862;
    float _1906 = _1904 + 1.0;
    float _1908 = fma(_1878, _1894, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1910 = -_1890;
    float _1912 = _1910 + 1.0;
    float _1914 = fma(_1874, _1898, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1900);
    float _1918 = -_1167;
    int _1920 = _1726 ? as_type<int>(_1918) : as_type<int>(_1167);
    float _1922 = _1812 * _1912;
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1926 = fma(_1908, _1850, _1916);
    float _1928 = -_1171;
    int _1930 = _1848 ? as_type<int>(_1928) : as_type<int>(_1171);
    float _1932 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1934 = _827 > 0.5;
    float _1936 = fma(_1914, _1922, _1926);
    bool _1938 = !_1788;
    float _1940 = _1938 ? _1167 : as_type<float>(_1920);
    float _1942 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1946 = _1902 * _1944;
    bool _1948 = !_1794;
    float _1950 = _1948 ? _1171 : as_type<float>(_1930);
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1954 = -_1171;
    int _1956 = _1934 ? as_type<int>(_1954) : as_type<int>(_1171);
    float _1958 = _1940 + 0.5;
    float _1960 = -_1167;
    int _1962 = _1736 ? as_type<int>(_1960) : as_type<int>(_1167);
    float _1964 = _1950 + (-0.5);
    bool _1966 = !_1842;
    float _1968 = _1966 ? _1171 : as_type<float>(_1956);
    float _1970 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1974 = isnan(0.5);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1980 = _1976 || _1978;
    float _1982 = abs(_1946);
    float _1984 = log2(_1982);
    float _1986 = fma(_1932, _1958, _965);
    float _1988 = -_1970;
    float _1990 = -_969;
    float _1992 = fma(_1988, _1964, _1990);
    float _1994 = -_919;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1936);
    bool _2000 = !_1834;
    float _2002 = _2000 ? _1167 : as_type<float>(_1962);
    float _2004 = fma(_1950, _1750, _1992);
    float _2006 = -_1996;
    float _2008 = fma(_1940, _2006, _1986);
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2014 = _2002 + 0.5;
    float _2016 = _1998;
    float _2018 = _2010;
    float _2020 = _1639;
    if (!_1980)
    {
        _2016 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2022 = _2016;
    float _2024 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2026 = -_1968;
    float _2028 = _2026 + 0.5;
    float _2030 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2032 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2034 = fma(_1229, _2024, _1219);
    float _2036 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2038 = _2030 * _1952;
    float _2040 = exp2(_2032);
    float _2042 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2044 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1784);
    float _2048 = fma(_1239, _2024, _1221);
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2036 * _2012;
    float _2054 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2056 = exp2(_1790);
    float _2058 = _2032;
    if (!_1980)
    {
        float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2062 = _2022 + _2060;
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = -_1213;
    float _2068 = fma(_1223, _2024, _2066);
    out.m_64.x = _2044;
    out.m_64.y = _2050;
    out.m_64.z = _1942;
    out.m_64.w = _2010;
    float _2070 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _2038;
    out.m_66.y = _2052;
    out.m_66.z = _2008;
    out.m_66.w = _2004;
    float _2072 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2074 = precise::clamp(_2072, 0.0, 1.0);
    float _2076 = _2064;
    if (!_1980)
    {
        float _2078 = 1.0 / _2064;
        _2076 = _2078;
    }
    float _2080 = _2076;
    float _2082 = in.m_68.x;
    float _2084 = -_2070;
    float _2086 = fma(_1233, _2084, _2034);
    float _2088 = -_2070;
    float _2090 = fma(_1225, _2088, _2068);
    float _2092 = -_2070;
    float _2094 = fma(_1249, _2092, _2048);
    float _2096 = fma(_2074, -2.0, 3.0);
    float _2098 = _2074 * _2074;
    float _2100 = _2096;
    if (_1980)
    {
        _2018 = 1.0;
    }
    float _2102 = _2018;
    float _2104 = -_2056;
    float _2106 = _2104 + 1.0;
    float _2108 = _2098 * _2096;
    float _2110 = _2102;
    if (!_1980)
    {
        float _2112 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2114 = _1946 + _2112;
        _2100 = _2114;
    }
    float _2116 = _2100;
    bool _2118 = _1946 <= 8000.0;
    bool _2120 = isnan(_1946);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(8000.0);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2132 = -_2108;
    float _2134 = _2132 + 1.0;
    if (!_1980)
    {
        float _2136 = _2116 * _2080;
        float _2138 = precise::clamp(_2136, 0.0, 1.0);
        _2110 = _2138;
    }
    float _2140 = _2110;
    float _2142 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2054);
    float _2144 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2146 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2108);
    float _2148 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2130);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2152 = _2142 + _2150;
    float _2154 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2144);
    float _2156 = _2128 * _2146;
    float _2158 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2160 = _1639 + _2152;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _2152;
    out.gl_Position.w = _1639;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2164 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2158);
    float _2166 = _2160 * 0.5;
    float _2168 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2148);
    float _2170 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2154);
    float _2172 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2174 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2164);
    bool _2176 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2178 = isnan(_1405);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2184 = _2180 || _2182;
    out.m_70.x = _2168;
    out.m_70.y = _2170;
    out.m_70.z = _2174;
    float _2186 = -_2172;
    float _2188 = _2186 + 1.0;
    out.m_72.z = _2166;
    out.m_72.w = _1639;
    float _2190 = _2152;
    float _2192 = _2166;
    float _2194 = _2172;
    float _2196 = _2188;
    if (!_2184)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2198 = _2020;
    float _2200 = _2198;
    float _2202 = _2198;
    if (!_2184)
    {
        _2190 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2204 = _2190;
    float _2206 = _2204;
    float _2208 = _2204;
    if (!_2184)
    {
        _2192 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2210 = _2192;
    float _2212 = -_1677;
    float _2214 = _2212 + 1.0;
    float _2216 = _2214 * _2162;
    float _2218 = precise::clamp(_2216, 0.0, 1.0);
    float _2220 = -_2218;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2224 = _2222 * _2082;
    float _2226 = _2172 * _1697;
    float _2228 = _1708 * _2188;
    float _2230 = _2210;
    float _2232 = _2210;
    if (!_2184)
    {
        _2194 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2234 = _2194;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2238 = _1708 * _2226;
    float _2240 = _1718 * _2226;
    float _2242 = _2238;
    float _2244 = _2234;
    float _2246 = _2234;
    if (!_2184)
    {
        _2196 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2248 = _2196;
    float _2250 = fma(_1714, _2238, _1702);
    float _2252 = fma(_1716, _2238, _1704);
    float _2254 = fma(_1708, _2240, _1706);
    out.m_74.x = _2236;
    float _2256 = _2140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2258 = _2248;
    float _2260 = _2248;
    if (!_2184)
    {
        _2242 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2262 = _2242;
    out.m_76.x = _2250;
    out.m_76.y = _2252;
    out.m_76.z = _2254;
    out.m_76.w = _2228;
    bool _2264 = !_2184;
    float _2266 = _2262;
    float _2268 = _2262;
    if (!_2264)
    {
        bool _2270 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2272 = isnan(_1405);
        bool _2274 = _2270 || _2272;
        bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2278 = _2274 || _2276;
        if (!_2278)
        {
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2282 = _1405 + _2280;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2284;
            float _2288 = 1.0 / _2286;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2310 = _2282 * _2288;
            float _2312 = precise::clamp(_2310, 0.0, 1.0);
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2318 = fma(_2312, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2232 = _2320;
            _2268 = _2326;
            _2246 = _2318;
            _2208 = _2324;
            _2202 = _2322;
            _2260 = _2328;
            _2330 = true;
        }
        else
        {
            bool _2332 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2334 = isnan(_1405);
            bool _2336 = _2332 || _2334;
            bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2340 = _2336 || _2338;
            if (!_2340)
            {
                _2244 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2342 = _2244;
            _2246 = _2342;
            if (!_2340)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2344 = _2230;
            _2232 = _2344;
            if (!_2340)
            {
                _2200 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2346 = _2200;
            _2202 = _2346;
            if (!_2340)
            {
                _2206 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2348 = _2206;
            _2208 = _2348;
            if (!_2340)
            {
                _2266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2350 = _2266;
            _2268 = _2350;
            if (!_2340)
            {
                _2258 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2352 = _2258;
            bool _2354 = !_2340;
            _2260 = _2352;
            if (!_2354)
            {
                bool _2356 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2358 = isnan(_1405);
                bool _2360 = _2356 || _2358;
                bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2364 = _2360 || _2362;
                if (!_2364)
                {
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2368 = _1405 + _2366;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2370;
                    float _2374 = 1.0 / _2372;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2396 = _2368 * _2374;
                    float _2398 = precise::clamp(_2396, 0.0, 1.0);
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2232 = _2406;
                    _2268 = _2412;
                    _2246 = _2404;
                    _2208 = _2410;
                    _2202 = _2408;
                    _2260 = _2414;
                    _2330 = true;
                }
                else
                {
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2246 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2208 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2202 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2260 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2330 = false;
    float _2416 = _2232;
    float _2418 = _2268;
    float _2420 = _2246;
    float _2422 = _2208;
    float _2424 = _2202;
    float _2426 = _2260;
    float _2428 = _2256 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2430 = fma(_2170, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2416;
    float _2436 = _2434 + _2418;
    float _2438 = -_2420;
    float _2440 = _2438 + _2422;
    out.m_49.x = _2428;
    float _2442 = fma(_2432, _2436, _2416);
    float _2444 = -_2424;
    float _2446 = _2444 + _2426;
    float _2448 = fma(_2432, _2440, _2420);
    float _2450 = _2442 * 0.586610972881317138671875;
    bool _2452 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2454 = fma(_2432, _2446, _2424);
    out.m_78.x = 0.0;
    float _2456 = fma(_2448, 0.298911988735198974609375, _2450);
    bool _2458 = _2140 > 0.0;
    bool _2460 = isnan(_2140);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.0);
    bool _2466 = _2462 || _2464;
    float _2468 = fma(_2454, 0.114477999508380889892578125, _2456);
    float _2470 = -_2468;
    float _2472 = _2448 + _2470;
    float _2474 = -_2468;
    float _2476 = _2442 + _2474;
    float _2478 = -_2468;
    float _2480 = _2454 + _2478;
    float _2482 = fma(_2472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    float _2484 = fma(_2476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    float _2486 = fma(_2480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    bool _2488 = !_2452;
    if (!_2488)
    {
        float _2490 = -_1363;
        float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2494 = -_1367;
        float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2498 = -_1371;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2502 = _2492 * _2492;
        float _2504 = fma(_2496, _2496, _2502);
        float _2506 = fma(_2500, _2500, _2504);
        float _2508 = sqrt(_2506);
        float _2510 = rsqrt(_2506);
        float _2512 = -_2508;
        float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2516 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2518 = precise::clamp(_2516, 0.0, 1.0);
        float _2520 = _2496 * _2510;
        float _2522 = _2492 * _2510;
        float _2524 = abs(_2518);
        float _2526 = log2(_2524);
        float _2528 = _2500 * _2510;
        float _2530 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2532 = _2170 * _2522;
        float _2534 = -_2522;
        float _2536 = -_2530;
        float _2538 = fma(_2534, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2536);
        float _2540 = fma(_2168, _2520, _2532);
        float _2542 = -_2528;
        float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2538);
        float _2546 = fma(_2174, _2528, _2540);
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2552 = _2544 + _2550;
        float _2554 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2558 = precise::clamp(_2556, 0.0, 1.0);
        float _2560 = exp2(_2554);
        float _2562 = _2560 * _2558;
        float _2564 = _2548 * _2562;
        float _2566 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2570 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2566;
        out.m_78.y = _2568;
        out.m_78.z = _2570;
    }
    out.m_80.x = _2482;
    out.m_80.y = _2484;
    out.m_80.z = _2486;
    if (_2466)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2572;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2330 = false;
    bool _729 = false;
    bool _559 = false;
    bool _455 = false;
    bool _279 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2629 = as_type<float>(_115);
        out.gl_Position.z = _2629;
    }
    if (!_103)
    {
        return out;
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_99);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    if (_147)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _109;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_153);
        out.gl_Position.z = _2698;
    }
    if (_147)
    {
        return out;
    }
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _157 = !_155;
    float _175;
    if (!_157)
    {
        float _159 = in.m_53.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_99);
        float _181 = 1.0 / _179;
        float _183 = _133 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = _185 + _187;
    bool _191 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_185);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -_201;
    float _209 = _207 + 1.0;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _213 = 1.0 / _205;
    float _215 = _189 * _213;
    bool _217 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _219 = isnan(_185);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _233;
    float _237 = _227 * _209;
    float _239 = fma(_231, _215, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _241 = fma(_235, _215, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _243 = -_227;
    float _245 = _243 + 1.0;
    float _247 = _239 * _237;
    float _249 = _241 * _237;
    float _251 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].x, _247);
    float _253 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].y, _249);
    float _255 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].x, _251);
    float _257 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].y, _253);
    bool _259 = !_211;
    float _277;
    if (!_259)
    {
        float _261 = in.m_53.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[11].x, _133);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_99);
        float _283 = 1.0 / _281;
        float _285 = _133 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = in.m_55.x;
    float _291 = in.m_55.y;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _295 = _287 + _293;
    bool _297 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _299 = isnan(_287);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _311;
    float _321 = _257 * _291;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _327 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _329 = isnan(_287);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _295 * _319;
    float _341 = 1.0 / _325;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _345 = _287 + _343;
    bool _347 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _349 = isnan(_287);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _359;
    float _363 = _357 * _315;
    float _365 = -_357;
    float _367 = _365 + 1.0;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _373;
    float _377 = fma(_361, _339, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _379 = _337 * _367;
    float _381 = fma(_371, _339, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _383 = fma(_375, _339, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _385 = -_337;
    float _387 = _385 + 1.0;
    float _389 = _345 * _341;
    float _391 = _381 * _379;
    float _393 = _377 * _379;
    float _395 = _383 * _379;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].x, _391);
    float _411 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].y, _393);
    float _413 = fma(_399, _389, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _415 = fma(_403, _389, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _417 = fma(_407, _389, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].z, _395);
    float _421 = fma(_413, _363, _409);
    float _423 = fma(_415, _363, _411);
    float _425 = _255 * _289;
    float _427 = fma(_417, _363, _419);
    float _429 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].x, _421);
    float _431 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].y, _423);
    float _433 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].z, _427);
    bool _435 = !_317;
    float _453;
    if (!_435)
    {
        float _437 = in.m_53.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_99);
        float _459 = 1.0 / _457;
        float _461 = _133 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    bool _465 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_463);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_463);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _463 + _497;
    float _501 = 1.0 / _479;
    float _503 = -_475;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _509 = _491 * _505;
    float _511 = -_491;
    float _513 = _511 + 1.0;
    float _515 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _495 * _501;
    float _519 = fma(_517, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _519 * _509;
    float _525 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[116].x, _529);
    float _535 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _535;
    out.m_57.y = _527;
    out.m_57.z = _531;
    out.m_57.w = _537;
    bool _539 = !_507;
    float _557;
    if (!_539)
    {
        float _541 = in.m_53.x;
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].z, _133);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_99);
        float _563 = 1.0 / _561;
        float _565 = _133 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _571 = _567 + _569;
    bool _573 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _575 = isnan(_567);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _587 = _567 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _597 = 1.0 / _591;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _601 = 1.0 / _595;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _603;
    float _607 = _571 * _597;
    bool _609 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _611 = isnan(_567);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -_583;
    float _623 = _621 + 1.0;
    bool _625 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _627 = isnan(_567);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_605, _607, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _639 = _635 * _623;
    float _641 = -_635;
    float _643 = _641 + 1.0;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _649;
    float _653 = _587 * _601;
    float _655 = _619 * _643;
    float _657 = fma(_647, _607, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _659 = fma(_651, _607, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _661 = -_619;
    float _663 = _661 + 1.0;
    float _665 = _637 * _655;
    float _667 = _657 * _655;
    float _669 = _659 * _655;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].x, _667);
    float _685 = fma(_673, _653, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _687 = fma(_677, _653, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _689 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].y, _665);
    float _691 = fma(_681, _653, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _693 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].z, _669);
    float _695 = fma(_685, _639, _683);
    float _697 = fma(_687, _639, _689);
    float _699 = fma(_691, _639, _693);
    float _701 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].x, _695);
    float _703 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].y, _697);
    float _705 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].z, _699);
    bool _707 = !_599;
    float _709 = _691;
    float _727;
    if (!_707)
    {
        float _711 = in.m_53.x;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _715 = _711 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _719 = _717 * _713;
        float _721 = floor(_719);
        float _723 = -_721;
        float _725 = _719 + _723;
        _727 = _725;
        _729 = true;
    }
    else
    {
        float _731 = float(_99);
        float _733 = 1.0 / _731;
        float _735 = _133 * _733;
        _727 = _735;
    }
    _729 = false;
    float _737 = _727;
    float _739 = in.m_53.z;
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _747 = _745 != 0;
    float _749 = in.m_53.x;
    float _751 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _763 = _761 != 0;
    float _765 = in.m_46.x;
    float _767 = in.m_46.y;
    float _769 = in.m_46.z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _773 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _775 = _697;
    if (!_747)
    {
        float _777 = in.m_53.y;
        _775 = _777;
    }
    float _779 = _775;
    float _781 = _743 * _133;
    float _783 = _739 * 2.0;
    float _785 = exp2(_781);
    float _787 = _749 * 2.0;
    float _789 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _791 = floor(_783);
    float _793 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _795 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _797 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _789);
    float _799 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _793);
    float _801 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _795);
    float _803 = _765;
    if (!_747)
    {
        _709 = _779;
    }
    float _805 = _709;
    float _807 = floor(_787);
    float _809 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].z, _797);
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    if (!_747)
    {
        _803 = _739;
    }
    float _813 = _803;
    float _815 = _805;
    float _817 = _779;
    float _819 = _813;
    if (_747)
    {
        float _821 = in.m_53.x;
        float _823 = in.m_53.y;
        _815 = _821;
        _817 = _823;
    }
    float _825 = _815;
    float _827 = _817;
    float _829 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].z, _801);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _833 = _791 >= 0.0;
    bool _835 = isnan(_791);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _809 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _845 = _791 > 0.0;
    float _847 = _811 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _849 = _841 ? 0 : 1;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _843 + _851;
    float _855 = _829 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _857 = _807 > 0.0;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _861 = _847 + _859;
    bool _863 = _807 >= 0.0;
    bool _865 = isnan(_807);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _875 = -_785;
    float _877 = _875 + 1.0;
    int _879 = _871 ? 0 : 1;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_747)
    {
        _819 = _827;
    }
    float _883 = _819;
    float _885 = _825 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _887 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].z, _881);
    int _889 = ~_849;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[83].w, _831);
    float _897 = _883;
    int _899 = _893;
    if (!_747)
    {
        _897 = _739;
    }
    float _901 = _897;
    float _903 = -_873;
    float _905 = fma(_885, 2.0, _903);
    float _907 = _901;
    if (_747)
    {
        _907 = _827;
    }
    float _909 = _907;
    float _911 = _739 + _827;
    int _913 = ~_879;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _887);
    int _921 = _917;
    if (!_857)
    {
        int _923 = ~_879;
        int _925 = _923 + 1;
        _921 = _925;
    }
    int _927 = _921;
    float _929 = _909 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _931 = _911 + (-1.0);
    float _933 = _749 + _827;
    if (!_845)
    {
        int _935 = ~_849;
        int _937 = _935 + 1;
        _899 = _937;
    }
    int _939 = _899;
    float _941 = fma(_929, -2.0, _771);
    bool _943 = !_755;
    int _945 = _943 ? 0 : 1;
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _949 = _933 + (-1.0);
    bool _951 = !_759;
    int _953 = _951 ? 0 : 1;
    float _955 = _827 * 2.0;
    int _957 = abs(_945);
    float _959 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _961 = abs(_953);
    float _963 = -_133;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[81].x, _905);
    float _967 = floor(_955);
    float _969 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _941);
    float _971 = float(_957);
    float _973 = float(_939);
    float _975 = float(_961);
    float _977 = float(_927);
    float _979 = _971 * _973;
    bool _981 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _983 = isnan(1.0);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _989 = _985 || _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _993 = 1.0 + _991;
    float _995 = _853 * _853;
    float _997 = _975 * _977;
    bool _999 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1007 = _1003 || _1005;
    float _1009 = in.m_59.x;
    float _1011 = in.m_59.y;
    float _1013 = in.m_59.z;
    float _1015 = 1.0 / _993;
    bool _1017 = _967 > 0.0;
    float _1019 = fma(_861, _861, _995);
    bool _1021 = _967 >= 0.0;
    bool _1023 = isnan(_967);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _855 + _1031;
    float _1035 = _1007 ? _877 : 0.0;
    float _1037 = _979 * (-2.0);
    float _1039 = _997 * (-2.0);
    float _1041 = fma(_1033, _1033, _1019);
    float _1043 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _895);
    int _1045 = _1029 ? 0 : 1;
    bool _1047 = !_763;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = rsqrt(_1041);
    float _1053 = _1019;
    if (_989)
    {
        float _1055 = _1035 * _1015;
        _137 = _1055;
    }
    float _1057 = _137;
    int _1059 = ~_1045;
    int _1061 = _1059 + 1;
    int _1063 = _1061 + 1;
    int _1065 = _1063;
    if (!_1017)
    {
        int _1067 = ~_1045;
        int _1069 = _1067 + 1;
        _1065 = _1069;
    }
    int _1071 = _1065;
    float _1073 = _749 + (-0.5);
    int _1075 = abs(_1049);
    float _1077 = fma(_1037, _1009, _1009);
    float _1079 = fma(_959, _1037, _959);
    float _1081 = fma(_1039, _1011, _1011);
    float _1083 = float(_1071);
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1077);
    float _1087 = fma(_947, _1039, _947);
    float _1089 = float(_1075);
    float _1091 = _853 * _1051;
    float _1093 = fma(_1079, _1057, _1085);
    float _1095 = _827 + (-0.5);
    float _1097 = _861 * _1051;
    float _1099 = -_1091;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1103 = _1089 * _1083;
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1081);
    float _1107 = _749 + _739;
    float _1109 = as_type<float>(int(gl_VertexIndex));
    float _1111 = _1093 * 0.15915493667125701904296875;
    float _1113 = fma(_1087, _1057, _1105);
    float _1115 = _1033 * _1051;
    float _1117 = -_1097;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _1121 = _1101 * _1101;
    float _1123 = _1113 * 0.15915493667125701904296875;
    float _1125 = _1107 + (-1.0);
    float _1127 = _1103 * (-2.0);
    float _1129 = -_1115;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1133 = fma(_1119, _1119, _1121);
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1137 = fma(_1127, _1013, _1013);
    float _1139 = _739 + (-0.5);
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = fma(_1135, _1127, _1135);
    float _1145 = _1111 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1137);
    float _1151 = fma(_1143, _1057, _1149);
    int _1153 = as_type<int>(_1109) & 1;
    bool _1155 = _1153 != 0;
    int _1157 = as_type<int>(_1109) & 2;
    bool _1159 = _1157 != 0;
    float _1161 = sqrt(_1141);
    float _1163 = _1151 * 0.15915493667125701904296875;
    bool _1165 = !_1155;
    float _1167 = _1165 ? (-0.5) : 0.5;
    bool _1169 = !_1159;
    float _1171 = _1169 ? (-0.5) : 0.5;
    float _1173 = _1111 * 6.283185482025146484375;
    float _1175 = cos(_1173);
    float _1177 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1167);
    float _1179 = _1123 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1051 * _1161;
    float _1185 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1171);
    float _1187 = _751 * _1183;
    float _1189 = _773 * _1183;
    float _1191 = _1123 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1187 * _1177;
    float _1197 = _1189 * _1185;
    float _1199 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1163 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1147 * _1181;
    float _1209 = _1175 * _1181;
    float _1211 = _1163 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1175 * _1193;
    float _1217 = _1147 * _1193;
    float _1219 = _1175 * _1205;
    float _1221 = _1147 * _1205;
    float _1223 = _1193 * _1205;
    float _1225 = _1181 * _1205;
    float _1227 = _1219 * _1201;
    float _1229 = fma(_1213, _1215, _1207);
    float _1231 = -_1217;
    float _1233 = fma(_1213, _1209, _1231);
    float _1235 = _1213 * _1201;
    float _1237 = -_1209;
    float _1239 = fma(_1213, _1217, _1237);
    float _1241 = fma(_1229, _1195, _1227);
    float _1243 = _1221 * _1201;
    float _1245 = -_1235;
    float _1247 = fma(_1223, _1195, _1245);
    float _1249 = fma(_1213, _1207, _1215);
    float _1251 = -_1197;
    float _1253 = fma(_1233, _1251, _1241);
    float _1255 = fma(_1239, _1195, _1243);
    float _1257 = -_1197;
    float _1259 = fma(_1225, _1257, _1247);
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1263 = -_1197;
    float _1265 = fma(_1249, _1263, _1255);
    float _1267 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1269 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1261);
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1267);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1269);
    float _1277 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1271);
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1273);
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1275);
    float _1283 = _855 + _1277;
    float _1285 = _847 + _1279;
    float _1287 = _843 + _1281;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1291 = _1283 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1295 = _1285 + _1293;
    float _1297 = _1291 * _1291;
    float _1299 = fma(_1295, _1295, _1297);
    float _1301 = sqrt(_1299);
    bool _1303 = _1301 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1265;
    float _1307 = _1285;
    float _1309 = _1283;
    float _1311 = _1123;
    if (!_1303)
    {
        _1305 = _1287;
    }
    float _1313 = _1305;
    bool _1315 = !_1303;
    float _1317 = _1313;
    if (!_1315)
    {
        float _1319 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1323 = _1301 + _1321;
        float _1325 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = rsqrt(_1299);
        float _1329 = _1323 * _1319;
        float _1331 = _1329 * 0.15915493667125701904296875;
        float _1333 = _1331 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = _1331 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1335 + (-1.0);
        float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = fma(_1339, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1347 = fma(_1287, _1335, _1343);
        float _1349 = _1327 * _1345;
        float _1351 = fma(_1295, _1349, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1353 = fma(_1291, _1349, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1317 = _1347;
        _1307 = _1351;
        _1309 = _1353;
    }
    float _1355 = _1317;
    float _1357 = _1307;
    float _1359 = _1309;
    float _1361 = -_1091;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1355);
    float _1365 = -_1097;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1369 = -_1115;
    float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1359);
    float _1373 = -_1115;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1379 = _1363 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1383 = _1367 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1387 = _1371 + _1385;
    float _1389 = -_1097;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1393 = _1379 * _1379;
    float _1395 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = fma(_1383, _1383, _1393);
    float _1399 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1401 = fma(_1387, _1387, _1397);
    float _1403 = rsqrt(_1401);
    float _1405 = sqrt(_1401);
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1383 * _1407;
    float _1411 = _1387 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1291;
    float _1429 = _1417;
    float _1431 = _1425;
    float _1433 = _1409;
    float _1435 = _1411;
    float _1437 = _1413;
    if (_1421)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1439;
    }
    float _1441 = _1427;
    if (_1421)
    {
        float _1443 = rsqrt(_1417);
        _1429 = _1443;
    }
    float _1445 = _1429;
    if (_1421)
    {
        float _1447 = _1425 * _1441;
        _1431 = _1447;
    }
    float _1449 = _1431;
    if (_1421)
    {
        float _1451 = _1449 * 0.15915493667125701904296875;
        _1053 = _1451;
    }
    float _1453 = _1053;
    float _1455 = _1441;
    float _1457 = _1453;
    if (_1421)
    {
        float _1459 = _1453 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        _1455 = _1461;
    }
    float _1463 = _1455;
    float _1465 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1467 = precise::max(0.0, _1465);
    float _1469 = _1287;
    float _1471 = _1467;
    if (_1421)
    {
        float _1473 = _1453 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        _1469 = _1475;
    }
    float _1477 = _1469;
    float _1479 = -_1407;
    float _1481 = -_1467;
    float _1483 = fma(_1379, _1479, _1481);
    float _1485 = _1483;
    if (_1421)
    {
        float _1487 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1487;
    }
    float _1489 = _1471;
    float _1491 = _1463;
    float _1493 = _1489;
    if (_1421)
    {
        float _1495 = fma(_1463, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    if (!_1421)
    {
        _1493 = _1415;
    }
    float _1499 = _1493;
    float _1501 = floor(_1399);
    float _1503 = _1499;
    if (_1421)
    {
        float _1505 = _1477 + (-1.0);
        _1311 = _1505;
    }
    float _1507 = _1311;
    float _1509 = _1507;
    if (_1421)
    {
        float _1511 = _1445 * _1497;
        _1457 = _1511;
    }
    float _1513 = _1457;
    float _1515 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    if (_1421)
    {
        float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1509 = _1517;
    }
    float _1519 = _1509;
    if (_1421)
    {
        float _1521 = _1409 * _1513;
        _1433 = _1521;
    }
    float _1523 = _1433;
    if (_1421)
    {
        float _1525 = _1411 * _1513;
        _1435 = _1525;
    }
    float _1527 = _1435;
    float _1529 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1515);
    if (_1421)
    {
        float _1531 = fma(_1483, _1477, _1519);
        _1485 = _1531;
    }
    float _1533 = _1485;
    if (_1421)
    {
        float _1535 = _1523 * _1523;
        _1437 = _1535;
    }
    float _1537 = _1437;
    if (_1421)
    {
        float _1539 = _1527 * _1527;
        _1503 = _1539;
    }
    float _1541 = _1503;
    float _1543 = fma(_1533, _1533, _1537);
    float _1545 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1547 = _1543 + _1541;
    float _1549 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1545);
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1553 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1551);
    float _1555 = precise::clamp(_1553, 0.0, 1.0);
    float _1557 = rsqrt(_1547);
    float _1559 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1549);
    float _1561 = -_1555;
    float _1563 = _1561 + 1.0;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1567 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1569 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1571 = abs(_1563);
    float _1573 = log2(_1571);
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1577 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1579 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1581 = -_1575;
    float _1583 = fma(_1581, _1565, 1.0);
    float _1585 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1569);
    float _1587 = -_1501;
    float _1589 = _1399 + _1587;
    float _1591 = _1557 * _1523;
    float _1593 = _1557 * _1533;
    float _1595 = _1557 * _1527;
    float _1597 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1577);
    float _1599 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1585);
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1603 = floor(_1579);
    float _1605 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = -_1601;
    float _1611 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1609);
    float _1613 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1615 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1619 = -_1595;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1611);
    float _1623 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = exp2(_1613);
    float _1627 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1617);
    float _1629 = fma(_1621, -0.5, 0.5);
    float _1631 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1633 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1627);
    float _1635 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = log2(_1583);
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1633);
    float _1641 = -_1603;
    float _1643 = _1579 + _1641;
    float _1645 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1647 = _1593 + 1.0;
    float _1649 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1645);
    float _1651 = 1.0 / _1639;
    float _1653 = fma(_1621, 0.5, 0.5);
    float _1655 = fma(_1653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1657 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1631);
    float _1659 = sqrt(_1629);
    float _1661 = fma(_1653, _1655, -0.212114393711090087890625);
    float _1663 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1657);
    float _1665 = -_1593;
    float _1667 = fma(_1625, _1647, _1665);
    float _1669 = _1637 * 0.693147182464599609375;
    float _1671 = fma(_1653, _1661, 1.570728778839111328125);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1663);
    float _1675 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float2 _5122 = float2(_1589, _1643);
    float _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5122, float2(0.0), isnan(_5122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5122, float2(0.0), isnan(_5122)), level(0.0)).x;
    float _1679 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1681 = _1673 * _1651;
    float _1683 = _1675 * _1651;
    float _1685 = fma(_1667, 0.5, 0.5);
    float _1687 = fma(_1681, 0.5, 0.5);
    float _1689 = fma(_1683, -0.5, 0.5);
    float _1691 = _1659 * 0.636619746685028076171875;
    float _1693 = -_1671;
    float _1695 = fma(_1691, _1693, 1.0);
    float3 _5157 = float3(_1687, _1689, _1679);
    float _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5157, float3(0.0), isnan(_5157)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5157, float3(0.0), isnan(_5157)), level(0.0)).x;
    float3 _5168 = float3(_1687, _1689, _1679);
    float4 _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5168, float3(0.0), isnan(_5168)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5168, float3(0.0), isnan(_5168)), level(0.0)).xyzw;
    float _1702 = _1700.x;
    float _1704 = _1700.y;
    float _1706 = _1700.z;
    float _1708 = _1700.w;
    float2 _5184 = float2(_1695, _1685);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5184, float2(0.0), isnan(_5184)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5184, float2(0.0), isnan(_5184)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = -_1091;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _843);
    float _1724 = in.m_53.w;
    bool _1726 = _739 > 0.5;
    float _1728 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1736 = _749 > 0.5;
    float _1738 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1728);
    float _1740 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1730);
    float _1742 = 1.0 / _1734;
    float _1744 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1738);
    float _1746 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1740);
    float _1748 = -_1043;
    float _1750 = _1748 + 1.0;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1754 = _1746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1760 = 1.0 / _1752;
    float _1762 = _1754 + _1752;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _737 + _1772;
    float _1776 = _701 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = _1770 * _1742;
    float _1780 = 1.0 / _1766;
    float _1782 = _705 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1784 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1788 = _1786 != 0;
    float _1790 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1794 = _1792 != 0;
    float _1796 = 1.0 / _1758;
    float _1798 = _1762 * _1760;
    float _1800 = _1798 * 0.5;
    bool _1802 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1804 = isnan(_737);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1816 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1818 = isnan(_737);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1830 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1828);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1834 = _1832 != 0;
    float _1836 = -_1812;
    float _1838 = _1836 + 1.0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1842 = _1840 != 0;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1844;
    bool _1848 = _1724 > 0.5;
    float _1850 = _1826 * _1838;
    bool _1852 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1854 = isnan(_737);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = -_1826;
    float _1866 = _1864 + 1.0;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1874 = _1846 * _1796;
    float _1876 = _1862 * _1866;
    float _1878 = _1870 * _1780;
    bool _1880 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1882 = isnan(_737);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1894 = _737 + _1892;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1898 = _737 + _1896;
    float _1900 = _1814 * _1876;
    float _1902 = 1.0 / _1830;
    float _1904 = -_1862;
    float _1906 = _1904 + 1.0;
    float _1908 = fma(_1878, _1894, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1910 = -_1890;
    float _1912 = _1910 + 1.0;
    float _1914 = fma(_1874, _1898, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1900);
    float _1918 = -_1167;
    int _1920 = _1726 ? as_type<int>(_1918) : as_type<int>(_1167);
    float _1922 = _1812 * _1912;
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1926 = fma(_1908, _1850, _1916);
    float _1928 = -_1171;
    int _1930 = _1848 ? as_type<int>(_1928) : as_type<int>(_1171);
    float _1932 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1934 = _827 > 0.5;
    float _1936 = fma(_1914, _1922, _1926);
    bool _1938 = !_1788;
    float _1940 = _1938 ? _1167 : as_type<float>(_1920);
    float _1942 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1946 = _1902 * _1944;
    bool _1948 = !_1794;
    float _1950 = _1948 ? _1171 : as_type<float>(_1930);
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1954 = -_1171;
    int _1956 = _1934 ? as_type<int>(_1954) : as_type<int>(_1171);
    float _1958 = _1940 + 0.5;
    float _1960 = -_1167;
    int _1962 = _1736 ? as_type<int>(_1960) : as_type<int>(_1167);
    float _1964 = _1950 + (-0.5);
    bool _1966 = !_1842;
    float _1968 = _1966 ? _1171 : as_type<float>(_1956);
    float _1970 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1974 = isnan(0.5);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1980 = _1976 || _1978;
    float _1982 = abs(_1946);
    float _1984 = log2(_1982);
    float _1986 = fma(_1932, _1958, _965);
    float _1988 = -_1970;
    float _1990 = -_969;
    float _1992 = fma(_1988, _1964, _1990);
    float _1994 = -_919;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1936);
    bool _2000 = !_1834;
    float _2002 = _2000 ? _1167 : as_type<float>(_1962);
    float _2004 = fma(_1950, _1750, _1992);
    float _2006 = -_1996;
    float _2008 = fma(_1940, _2006, _1986);
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2014 = _2002 + 0.5;
    float _2016 = _1998;
    float _2018 = _2010;
    float _2020 = _1639;
    if (!_1980)
    {
        _2016 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2022 = _2016;
    float _2024 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2026 = -_1968;
    float _2028 = _2026 + 0.5;
    float _2030 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2032 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2034 = fma(_1229, _2024, _1219);
    float _2036 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2038 = _2030 * _1952;
    float _2040 = exp2(_2032);
    float _2042 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2044 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1784);
    float _2048 = fma(_1239, _2024, _1221);
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2036 * _2012;
    float _2054 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2056 = exp2(_1790);
    float _2058 = _2032;
    if (!_1980)
    {
        float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2062 = _2022 + _2060;
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = -_1213;
    float _2068 = fma(_1223, _2024, _2066);
    out.m_64.x = _2044;
    out.m_64.y = _2050;
    out.m_64.z = _1942;
    out.m_64.w = _2010;
    float _2070 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _2038;
    out.m_66.y = _2052;
    out.m_66.z = _2008;
    out.m_66.w = _2004;
    float _2072 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2074 = precise::clamp(_2072, 0.0, 1.0);
    float _2076 = _2064;
    if (!_1980)
    {
        float _2078 = 1.0 / _2064;
        _2076 = _2078;
    }
    float _2080 = _2076;
    float _2082 = in.m_68.x;
    float _2084 = -_2070;
    float _2086 = fma(_1233, _2084, _2034);
    float _2088 = -_2070;
    float _2090 = fma(_1225, _2088, _2068);
    float _2092 = -_2070;
    float _2094 = fma(_1249, _2092, _2048);
    float _2096 = fma(_2074, -2.0, 3.0);
    float _2098 = _2074 * _2074;
    float _2100 = _2096;
    if (_1980)
    {
        _2018 = 1.0;
    }
    float _2102 = _2018;
    float _2104 = -_2056;
    float _2106 = _2104 + 1.0;
    float _2108 = _2098 * _2096;
    float _2110 = _2102;
    if (!_1980)
    {
        float _2112 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2114 = _1946 + _2112;
        _2100 = _2114;
    }
    float _2116 = _2100;
    bool _2118 = _1946 <= 8000.0;
    bool _2120 = isnan(_1946);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(8000.0);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2132 = -_2108;
    float _2134 = _2132 + 1.0;
    if (!_1980)
    {
        float _2136 = _2116 * _2080;
        float _2138 = precise::clamp(_2136, 0.0, 1.0);
        _2110 = _2138;
    }
    float _2140 = _2110;
    float _2142 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2054);
    float _2144 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2146 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2108);
    float _2148 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2130);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2152 = _2142 + _2150;
    float _2154 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2144);
    float _2156 = _2128 * _2146;
    float _2158 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2160 = _1639 + _2152;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _2152;
    out.gl_Position.w = _1639;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2164 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2158);
    float _2166 = _2160 * 0.5;
    float _2168 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2148);
    float _2170 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2154);
    float _2172 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2174 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2164);
    bool _2176 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2178 = isnan(_1405);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2184 = _2180 || _2182;
    out.m_70.x = _2168;
    out.m_70.y = _2170;
    out.m_70.z = _2174;
    float _2186 = -_2172;
    float _2188 = _2186 + 1.0;
    out.m_72.z = _2166;
    out.m_72.w = _1639;
    float _2190 = _2152;
    float _2192 = _2166;
    float _2194 = _2172;
    float _2196 = _2188;
    if (!_2184)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2198 = _2020;
    float _2200 = _2198;
    float _2202 = _2198;
    if (!_2184)
    {
        _2190 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2204 = _2190;
    float _2206 = _2204;
    float _2208 = _2204;
    if (!_2184)
    {
        _2192 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2210 = _2192;
    float _2212 = -_1677;
    float _2214 = _2212 + 1.0;
    float _2216 = _2214 * _2162;
    float _2218 = precise::clamp(_2216, 0.0, 1.0);
    float _2220 = -_2218;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2224 = _2222 * _2082;
    float _2226 = _2172 * _1697;
    float _2228 = _1708 * _2188;
    float _2230 = _2210;
    float _2232 = _2210;
    if (!_2184)
    {
        _2194 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2234 = _2194;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2238 = _1708 * _2226;
    float _2240 = _1718 * _2226;
    float _2242 = _2238;
    float _2244 = _2234;
    float _2246 = _2234;
    if (!_2184)
    {
        _2196 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2248 = _2196;
    float _2250 = fma(_1714, _2238, _1702);
    float _2252 = fma(_1716, _2238, _1704);
    float _2254 = fma(_1708, _2240, _1706);
    out.m_74.x = _2236;
    float _2256 = _2140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2258 = _2248;
    float _2260 = _2248;
    if (!_2184)
    {
        _2242 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2262 = _2242;
    out.m_76.x = _2250;
    out.m_76.y = _2252;
    out.m_76.z = _2254;
    out.m_76.w = _2228;
    bool _2264 = !_2184;
    float _2266 = _2262;
    float _2268 = _2262;
    if (!_2264)
    {
        bool _2270 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2272 = isnan(_1405);
        bool _2274 = _2270 || _2272;
        bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2278 = _2274 || _2276;
        if (!_2278)
        {
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2282 = _1405 + _2280;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2284;
            float _2288 = 1.0 / _2286;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2310 = _2282 * _2288;
            float _2312 = precise::clamp(_2310, 0.0, 1.0);
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2318 = fma(_2312, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2232 = _2320;
            _2268 = _2326;
            _2246 = _2318;
            _2208 = _2324;
            _2202 = _2322;
            _2260 = _2328;
            _2330 = true;
        }
        else
        {
            bool _2332 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2334 = isnan(_1405);
            bool _2336 = _2332 || _2334;
            bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2340 = _2336 || _2338;
            if (!_2340)
            {
                _2244 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2342 = _2244;
            _2246 = _2342;
            if (!_2340)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2344 = _2230;
            _2232 = _2344;
            if (!_2340)
            {
                _2200 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2346 = _2200;
            _2202 = _2346;
            if (!_2340)
            {
                _2206 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2348 = _2206;
            _2208 = _2348;
            if (!_2340)
            {
                _2266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2350 = _2266;
            _2268 = _2350;
            if (!_2340)
            {
                _2258 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2352 = _2258;
            bool _2354 = !_2340;
            _2260 = _2352;
            if (!_2354)
            {
                bool _2356 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2358 = isnan(_1405);
                bool _2360 = _2356 || _2358;
                bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2364 = _2360 || _2362;
                if (!_2364)
                {
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2368 = _1405 + _2366;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2370;
                    float _2374 = 1.0 / _2372;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2396 = _2368 * _2374;
                    float _2398 = precise::clamp(_2396, 0.0, 1.0);
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2232 = _2406;
                    _2268 = _2412;
                    _2246 = _2404;
                    _2208 = _2410;
                    _2202 = _2408;
                    _2260 = _2414;
                    _2330 = true;
                }
                else
                {
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2246 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2208 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2202 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2260 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2330 = false;
    float _2416 = _2232;
    float _2418 = _2268;
    float _2420 = _2246;
    float _2422 = _2208;
    float _2424 = _2202;
    float _2426 = _2260;
    float _2428 = _2256 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2430 = fma(_2170, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2416;
    float _2436 = _2434 + _2418;
    float _2438 = -_2420;
    float _2440 = _2438 + _2422;
    out.m_49.x = _2428;
    float _2442 = fma(_2432, _2436, _2416);
    float _2444 = -_2424;
    float _2446 = _2444 + _2426;
    float _2448 = fma(_2432, _2440, _2420);
    float _2450 = _2442 * 0.586610972881317138671875;
    bool _2452 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2454 = fma(_2432, _2446, _2424);
    out.m_78.x = 0.0;
    float _2456 = fma(_2448, 0.298911988735198974609375, _2450);
    bool _2458 = _2140 > 0.0;
    bool _2460 = isnan(_2140);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.0);
    bool _2466 = _2462 || _2464;
    float _2468 = fma(_2454, 0.114477999508380889892578125, _2456);
    float _2470 = -_2468;
    float _2472 = _2448 + _2470;
    float _2474 = -_2468;
    float _2476 = _2442 + _2474;
    float _2478 = -_2468;
    float _2480 = _2454 + _2478;
    float _2482 = fma(_2472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    float _2484 = fma(_2476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    float _2486 = fma(_2480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    bool _2488 = !_2452;
    if (!_2488)
    {
        float _2490 = -_1363;
        float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2494 = -_1367;
        float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2498 = -_1371;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2502 = _2492 * _2492;
        float _2504 = fma(_2496, _2496, _2502);
        float _2506 = fma(_2500, _2500, _2504);
        float _2508 = sqrt(_2506);
        float _2510 = rsqrt(_2506);
        float _2512 = -_2508;
        float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2516 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2518 = precise::clamp(_2516, 0.0, 1.0);
        float _2520 = _2496 * _2510;
        float _2522 = _2492 * _2510;
        float _2524 = abs(_2518);
        float _2526 = log2(_2524);
        float _2528 = _2500 * _2510;
        float _2530 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2532 = _2170 * _2522;
        float _2534 = -_2522;
        float _2536 = -_2530;
        float _2538 = fma(_2534, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2536);
        float _2540 = fma(_2168, _2520, _2532);
        float _2542 = -_2528;
        float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2538);
        float _2546 = fma(_2174, _2528, _2540);
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2552 = _2544 + _2550;
        float _2554 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2558 = precise::clamp(_2556, 0.0, 1.0);
        float _2560 = exp2(_2554);
        float _2562 = _2560 * _2558;
        float _2564 = _2548 * _2562;
        float _2566 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2570 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2566;
        out.m_78.y = _2568;
        out.m_78.z = _2570;
    }
    out.m_80.x = _2482;
    out.m_80.y = _2484;
    out.m_80.z = _2486;
    if (_2466)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2572;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2330 = false;
    bool _729 = false;
    bool _559 = false;
    bool _455 = false;
    bool _279 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2629 = as_type<float>(_115);
        out.gl_Position.z = _2629;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = 0.0;
    float _137 = _133;
    if (_129)
    {
        float _139 = float(_99);
        _135 = _139;
    }
    float _141 = _135;
    bool _143 = _133 >= _141;
    bool _145 = !_129;
    bool _147 = _143 || _145;
    if (_147)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _109;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2698 = as_type<float>(_153);
        out.gl_Position.z = _2698;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _157 = !_155;
    float _175;
    if (!_157)
    {
        float _159 = in.m_53.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_99);
        float _181 = 1.0 / _179;
        float _183 = _133 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = _185 + _187;
    bool _191 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_185);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -_201;
    float _209 = _207 + 1.0;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _213 = 1.0 / _205;
    float _215 = _189 * _213;
    bool _217 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _219 = isnan(_185);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _233;
    float _237 = _227 * _209;
    float _239 = fma(_231, _215, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _241 = fma(_235, _215, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _243 = -_227;
    float _245 = _243 + 1.0;
    float _247 = _239 * _237;
    float _249 = _241 * _237;
    float _251 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].x, _247);
    float _253 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[143].y, _249);
    float _255 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].x, _251);
    float _257 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].y, _253);
    bool _259 = !_211;
    float _277;
    if (!_259)
    {
        float _261 = in.m_53.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[11].x, _133);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_99);
        float _283 = 1.0 / _281;
        float _285 = _133 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = in.m_55.x;
    float _291 = in.m_55.y;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _295 = _287 + _293;
    bool _297 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _299 = isnan(_287);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _311;
    float _321 = _257 * _291;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _327 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _329 = isnan(_287);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _295 * _319;
    float _341 = 1.0 / _325;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _345 = _287 + _343;
    bool _347 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _349 = isnan(_287);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _359;
    float _363 = _357 * _315;
    float _365 = -_357;
    float _367 = _365 + 1.0;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _373;
    float _377 = fma(_361, _339, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _379 = _337 * _367;
    float _381 = fma(_371, _339, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _383 = fma(_375, _339, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _385 = -_337;
    float _387 = _385 + 1.0;
    float _389 = _345 * _341;
    float _391 = _381 * _379;
    float _393 = _377 * _379;
    float _395 = _383 * _379;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].x, _391);
    float _411 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].y, _393);
    float _413 = fma(_399, _389, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _415 = fma(_403, _389, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _417 = fma(_407, _389, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[107].z, _395);
    float _421 = fma(_413, _363, _409);
    float _423 = fma(_415, _363, _411);
    float _425 = _255 * _289;
    float _427 = fma(_417, _363, _419);
    float _429 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].x, _421);
    float _431 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].y, _423);
    float _433 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[109].z, _427);
    bool _435 = !_317;
    float _453;
    if (!_435)
    {
        float _437 = in.m_53.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_99);
        float _459 = 1.0 / _457;
        float _461 = _133 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    bool _465 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_463);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_463);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _463 + _497;
    float _501 = 1.0 / _479;
    float _503 = -_475;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _509 = _491 * _505;
    float _511 = -_491;
    float _513 = _511 + 1.0;
    float _515 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _495 * _501;
    float _519 = fma(_517, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _519 * _509;
    float _525 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[116].x, _529);
    float _535 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _535;
    out.m_57.y = _527;
    out.m_57.z = _531;
    out.m_57.w = _537;
    bool _539 = !_507;
    float _557;
    if (!_539)
    {
        float _541 = in.m_53.x;
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _545 = _541 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].z, _133);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_99);
        float _563 = 1.0 / _561;
        float _565 = _133 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _571 = _567 + _569;
    bool _573 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _575 = isnan(_567);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _587 = _567 + _585;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _597 = 1.0 / _591;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _601 = 1.0 / _595;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _603;
    float _607 = _571 * _597;
    bool _609 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _611 = isnan(_567);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -_583;
    float _623 = _621 + 1.0;
    bool _625 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _627 = isnan(_567);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_605, _607, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _639 = _635 * _623;
    float _641 = -_635;
    float _643 = _641 + 1.0;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _649;
    float _653 = _587 * _601;
    float _655 = _619 * _643;
    float _657 = fma(_647, _607, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _659 = fma(_651, _607, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _661 = -_619;
    float _663 = _661 + 1.0;
    float _665 = _637 * _655;
    float _667 = _657 * _655;
    float _669 = _659 * _655;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].x, _667);
    float _685 = fma(_673, _653, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _687 = fma(_677, _653, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _689 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].y, _665);
    float _691 = fma(_681, _653, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _693 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[123].z, _669);
    float _695 = fma(_685, _639, _683);
    float _697 = fma(_687, _639, _689);
    float _699 = fma(_691, _639, _693);
    float _701 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].x, _695);
    float _703 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].y, _697);
    float _705 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[125].z, _699);
    bool _707 = !_599;
    float _709 = _691;
    float _727;
    if (!_707)
    {
        float _711 = in.m_53.x;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _715 = _711 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _719 = _717 * _713;
        float _721 = floor(_719);
        float _723 = -_721;
        float _725 = _719 + _723;
        _727 = _725;
        _729 = true;
    }
    else
    {
        float _731 = float(_99);
        float _733 = 1.0 / _731;
        float _735 = _133 * _733;
        _727 = _735;
    }
    _729 = false;
    float _737 = _727;
    float _739 = in.m_53.z;
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _747 = _745 != 0;
    float _749 = in.m_53.x;
    float _751 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _763 = _761 != 0;
    float _765 = in.m_46.x;
    float _767 = in.m_46.y;
    float _769 = in.m_46.z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _773 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _775 = _697;
    if (!_747)
    {
        float _777 = in.m_53.y;
        _775 = _777;
    }
    float _779 = _775;
    float _781 = _743 * _133;
    float _783 = _739 * 2.0;
    float _785 = exp2(_781);
    float _787 = _749 * 2.0;
    float _789 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _791 = floor(_783);
    float _793 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _795 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _797 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _789);
    float _799 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _793);
    float _801 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _795);
    float _803 = _765;
    if (!_747)
    {
        _709 = _779;
    }
    float _805 = _709;
    float _807 = floor(_787);
    float _809 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[5].z, _797);
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    if (!_747)
    {
        _803 = _739;
    }
    float _813 = _803;
    float _815 = _805;
    float _817 = _779;
    float _819 = _813;
    if (_747)
    {
        float _821 = in.m_53.x;
        float _823 = in.m_53.y;
        _815 = _821;
        _817 = _823;
    }
    float _825 = _815;
    float _827 = _817;
    float _829 = fma(_769, (*spvDescriptorSet0.vp_c10)._m0[6].z, _801);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _833 = _791 >= 0.0;
    bool _835 = isnan(_791);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _809 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _845 = _791 > 0.0;
    float _847 = _811 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _849 = _841 ? 0 : 1;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _843 + _851;
    float _855 = _829 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _857 = _807 > 0.0;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _861 = _847 + _859;
    bool _863 = _807 >= 0.0;
    bool _865 = isnan(_807);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _875 = -_785;
    float _877 = _875 + 1.0;
    int _879 = _871 ? 0 : 1;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_747)
    {
        _819 = _827;
    }
    float _883 = _819;
    float _885 = _825 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _887 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].z, _881);
    int _889 = ~_849;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[83].w, _831);
    float _897 = _883;
    int _899 = _893;
    if (!_747)
    {
        _897 = _739;
    }
    float _901 = _897;
    float _903 = -_873;
    float _905 = fma(_885, 2.0, _903);
    float _907 = _901;
    if (_747)
    {
        _907 = _827;
    }
    float _909 = _907;
    float _911 = _739 + _827;
    int _913 = ~_879;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _887);
    int _921 = _917;
    if (!_857)
    {
        int _923 = ~_879;
        int _925 = _923 + 1;
        _921 = _925;
    }
    int _927 = _921;
    float _929 = _909 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _931 = _911 + (-1.0);
    float _933 = _749 + _827;
    if (!_845)
    {
        int _935 = ~_849;
        int _937 = _935 + 1;
        _899 = _937;
    }
    int _939 = _899;
    float _941 = fma(_929, -2.0, _771);
    bool _943 = !_755;
    int _945 = _943 ? 0 : 1;
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _949 = _933 + (-1.0);
    bool _951 = !_759;
    int _953 = _951 ? 0 : 1;
    float _955 = _827 * 2.0;
    int _957 = abs(_945);
    float _959 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _961 = abs(_953);
    float _963 = -_133;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[81].x, _905);
    float _967 = floor(_955);
    float _969 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _941);
    float _971 = float(_957);
    float _973 = float(_939);
    float _975 = float(_961);
    float _977 = float(_927);
    float _979 = _971 * _973;
    bool _981 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _983 = isnan(1.0);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _989 = _985 || _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _993 = 1.0 + _991;
    float _995 = _853 * _853;
    float _997 = _975 * _977;
    bool _999 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1007 = _1003 || _1005;
    float _1009 = in.m_59.x;
    float _1011 = in.m_59.y;
    float _1013 = in.m_59.z;
    float _1015 = 1.0 / _993;
    bool _1017 = _967 > 0.0;
    float _1019 = fma(_861, _861, _995);
    bool _1021 = _967 >= 0.0;
    bool _1023 = isnan(_967);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _855 + _1031;
    float _1035 = _1007 ? _877 : 0.0;
    float _1037 = _979 * (-2.0);
    float _1039 = _997 * (-2.0);
    float _1041 = fma(_1033, _1033, _1019);
    float _1043 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _895);
    int _1045 = _1029 ? 0 : 1;
    bool _1047 = !_763;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = rsqrt(_1041);
    float _1053 = _1019;
    if (_989)
    {
        float _1055 = _1035 * _1015;
        _137 = _1055;
    }
    float _1057 = _137;
    int _1059 = ~_1045;
    int _1061 = _1059 + 1;
    int _1063 = _1061 + 1;
    int _1065 = _1063;
    if (!_1017)
    {
        int _1067 = ~_1045;
        int _1069 = _1067 + 1;
        _1065 = _1069;
    }
    int _1071 = _1065;
    float _1073 = _749 + (-0.5);
    int _1075 = abs(_1049);
    float _1077 = fma(_1037, _1009, _1009);
    float _1079 = fma(_959, _1037, _959);
    float _1081 = fma(_1039, _1011, _1011);
    float _1083 = float(_1071);
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1077);
    float _1087 = fma(_947, _1039, _947);
    float _1089 = float(_1075);
    float _1091 = _853 * _1051;
    float _1093 = fma(_1079, _1057, _1085);
    float _1095 = _827 + (-0.5);
    float _1097 = _861 * _1051;
    float _1099 = -_1091;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1103 = _1089 * _1083;
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1081);
    float _1107 = _749 + _739;
    float _1109 = as_type<float>(int(gl_VertexIndex));
    float _1111 = _1093 * 0.15915493667125701904296875;
    float _1113 = fma(_1087, _1057, _1105);
    float _1115 = _1033 * _1051;
    float _1117 = -_1097;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _1121 = _1101 * _1101;
    float _1123 = _1113 * 0.15915493667125701904296875;
    float _1125 = _1107 + (-1.0);
    float _1127 = _1103 * (-2.0);
    float _1129 = -_1115;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1133 = fma(_1119, _1119, _1121);
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1137 = fma(_1127, _1013, _1013);
    float _1139 = _739 + (-0.5);
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = fma(_1135, _1127, _1135);
    float _1145 = _1111 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1137);
    float _1151 = fma(_1143, _1057, _1149);
    int _1153 = as_type<int>(_1109) & 1;
    bool _1155 = _1153 != 0;
    int _1157 = as_type<int>(_1109) & 2;
    bool _1159 = _1157 != 0;
    float _1161 = sqrt(_1141);
    float _1163 = _1151 * 0.15915493667125701904296875;
    bool _1165 = !_1155;
    float _1167 = _1165 ? (-0.5) : 0.5;
    bool _1169 = !_1159;
    float _1171 = _1169 ? (-0.5) : 0.5;
    float _1173 = _1111 * 6.283185482025146484375;
    float _1175 = cos(_1173);
    float _1177 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1167);
    float _1179 = _1123 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1051 * _1161;
    float _1185 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1171);
    float _1187 = _751 * _1183;
    float _1189 = _773 * _1183;
    float _1191 = _1123 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1187 * _1177;
    float _1197 = _1189 * _1185;
    float _1199 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1163 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1147 * _1181;
    float _1209 = _1175 * _1181;
    float _1211 = _1163 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1175 * _1193;
    float _1217 = _1147 * _1193;
    float _1219 = _1175 * _1205;
    float _1221 = _1147 * _1205;
    float _1223 = _1193 * _1205;
    float _1225 = _1181 * _1205;
    float _1227 = _1219 * _1201;
    float _1229 = fma(_1213, _1215, _1207);
    float _1231 = -_1217;
    float _1233 = fma(_1213, _1209, _1231);
    float _1235 = _1213 * _1201;
    float _1237 = -_1209;
    float _1239 = fma(_1213, _1217, _1237);
    float _1241 = fma(_1229, _1195, _1227);
    float _1243 = _1221 * _1201;
    float _1245 = -_1235;
    float _1247 = fma(_1223, _1195, _1245);
    float _1249 = fma(_1213, _1207, _1215);
    float _1251 = -_1197;
    float _1253 = fma(_1233, _1251, _1241);
    float _1255 = fma(_1239, _1195, _1243);
    float _1257 = -_1197;
    float _1259 = fma(_1225, _1257, _1247);
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1263 = -_1197;
    float _1265 = fma(_1249, _1263, _1255);
    float _1267 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1269 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1271 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1261);
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1267);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1269);
    float _1277 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1271);
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1273);
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1275);
    float _1283 = _855 + _1277;
    float _1285 = _847 + _1279;
    float _1287 = _843 + _1281;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1291 = _1283 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1295 = _1285 + _1293;
    float _1297 = _1291 * _1291;
    float _1299 = fma(_1295, _1295, _1297);
    float _1301 = sqrt(_1299);
    bool _1303 = _1301 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1265;
    float _1307 = _1285;
    float _1309 = _1283;
    float _1311 = _1123;
    if (!_1303)
    {
        _1305 = _1287;
    }
    float _1313 = _1305;
    bool _1315 = !_1303;
    float _1317 = _1313;
    if (!_1315)
    {
        float _1319 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1323 = _1301 + _1321;
        float _1325 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = rsqrt(_1299);
        float _1329 = _1323 * _1319;
        float _1331 = _1329 * 0.15915493667125701904296875;
        float _1333 = _1331 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = _1331 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1335 + (-1.0);
        float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = fma(_1339, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1347 = fma(_1287, _1335, _1343);
        float _1349 = _1327 * _1345;
        float _1351 = fma(_1295, _1349, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1353 = fma(_1291, _1349, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1317 = _1347;
        _1307 = _1351;
        _1309 = _1353;
    }
    float _1355 = _1317;
    float _1357 = _1307;
    float _1359 = _1309;
    float _1361 = -_1091;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1355);
    float _1365 = -_1097;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1369 = -_1115;
    float _1371 = fma(_1369, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1359);
    float _1373 = -_1115;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1379 = _1363 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1383 = _1367 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1387 = _1371 + _1385;
    float _1389 = -_1097;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1393 = _1379 * _1379;
    float _1395 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = fma(_1383, _1383, _1393);
    float _1399 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1401 = fma(_1387, _1387, _1397);
    float _1403 = rsqrt(_1401);
    float _1405 = sqrt(_1401);
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1383 * _1407;
    float _1411 = _1387 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1291;
    float _1429 = _1417;
    float _1431 = _1425;
    float _1433 = _1409;
    float _1435 = _1411;
    float _1437 = _1413;
    if (_1421)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1439;
    }
    float _1441 = _1427;
    if (_1421)
    {
        float _1443 = rsqrt(_1417);
        _1429 = _1443;
    }
    float _1445 = _1429;
    if (_1421)
    {
        float _1447 = _1425 * _1441;
        _1431 = _1447;
    }
    float _1449 = _1431;
    if (_1421)
    {
        float _1451 = _1449 * 0.15915493667125701904296875;
        _1053 = _1451;
    }
    float _1453 = _1053;
    float _1455 = _1441;
    float _1457 = _1453;
    if (_1421)
    {
        float _1459 = _1453 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        _1455 = _1461;
    }
    float _1463 = _1455;
    float _1465 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1467 = precise::max(0.0, _1465);
    float _1469 = _1287;
    float _1471 = _1467;
    if (_1421)
    {
        float _1473 = _1453 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        _1469 = _1475;
    }
    float _1477 = _1469;
    float _1479 = -_1407;
    float _1481 = -_1467;
    float _1483 = fma(_1379, _1479, _1481);
    float _1485 = _1483;
    if (_1421)
    {
        float _1487 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1487;
    }
    float _1489 = _1471;
    float _1491 = _1463;
    float _1493 = _1489;
    if (_1421)
    {
        float _1495 = fma(_1463, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    if (!_1421)
    {
        _1493 = _1415;
    }
    float _1499 = _1493;
    float _1501 = floor(_1399);
    float _1503 = _1499;
    if (_1421)
    {
        float _1505 = _1477 + (-1.0);
        _1311 = _1505;
    }
    float _1507 = _1311;
    float _1509 = _1507;
    if (_1421)
    {
        float _1511 = _1445 * _1497;
        _1457 = _1511;
    }
    float _1513 = _1457;
    float _1515 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    if (_1421)
    {
        float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1509 = _1517;
    }
    float _1519 = _1509;
    if (_1421)
    {
        float _1521 = _1409 * _1513;
        _1433 = _1521;
    }
    float _1523 = _1433;
    if (_1421)
    {
        float _1525 = _1411 * _1513;
        _1435 = _1525;
    }
    float _1527 = _1435;
    float _1529 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1515);
    if (_1421)
    {
        float _1531 = fma(_1483, _1477, _1519);
        _1485 = _1531;
    }
    float _1533 = _1485;
    if (_1421)
    {
        float _1535 = _1523 * _1523;
        _1437 = _1535;
    }
    float _1537 = _1437;
    if (_1421)
    {
        float _1539 = _1527 * _1527;
        _1503 = _1539;
    }
    float _1541 = _1503;
    float _1543 = fma(_1533, _1533, _1537);
    float _1545 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1547 = _1543 + _1541;
    float _1549 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1545);
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1553 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1551);
    float _1555 = precise::clamp(_1553, 0.0, 1.0);
    float _1557 = rsqrt(_1547);
    float _1559 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1549);
    float _1561 = -_1555;
    float _1563 = _1561 + 1.0;
    float _1565 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1567 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1569 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1571 = abs(_1563);
    float _1573 = log2(_1571);
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1577 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1579 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1581 = -_1575;
    float _1583 = fma(_1581, _1565, 1.0);
    float _1585 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1569);
    float _1587 = -_1501;
    float _1589 = _1399 + _1587;
    float _1591 = _1557 * _1523;
    float _1593 = _1557 * _1533;
    float _1595 = _1557 * _1527;
    float _1597 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1577);
    float _1599 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1585);
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1603 = floor(_1579);
    float _1605 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = -_1601;
    float _1611 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1609);
    float _1613 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1615 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1619 = -_1595;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1611);
    float _1623 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = exp2(_1613);
    float _1627 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1617);
    float _1629 = fma(_1621, -0.5, 0.5);
    float _1631 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1633 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1627);
    float _1635 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = log2(_1583);
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1633);
    float _1641 = -_1603;
    float _1643 = _1579 + _1641;
    float _1645 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1647 = _1593 + 1.0;
    float _1649 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1645);
    float _1651 = 1.0 / _1639;
    float _1653 = fma(_1621, 0.5, 0.5);
    float _1655 = fma(_1653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1657 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1631);
    float _1659 = sqrt(_1629);
    float _1661 = fma(_1653, _1655, -0.212114393711090087890625);
    float _1663 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1657);
    float _1665 = -_1593;
    float _1667 = fma(_1625, _1647, _1665);
    float _1669 = _1637 * 0.693147182464599609375;
    float _1671 = fma(_1653, _1661, 1.570728778839111328125);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1663);
    float _1675 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float2 _5122 = float2(_1589, _1643);
    float _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5122, float2(0.0), isnan(_5122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5122, float2(0.0), isnan(_5122)), level(0.0)).x;
    float _1679 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1681 = _1673 * _1651;
    float _1683 = _1675 * _1651;
    float _1685 = fma(_1667, 0.5, 0.5);
    float _1687 = fma(_1681, 0.5, 0.5);
    float _1689 = fma(_1683, -0.5, 0.5);
    float _1691 = _1659 * 0.636619746685028076171875;
    float _1693 = -_1671;
    float _1695 = fma(_1691, _1693, 1.0);
    float3 _5157 = float3(_1687, _1689, _1679);
    float _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5157, float3(0.0), isnan(_5157)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5157, float3(0.0), isnan(_5157)), level(0.0)).x;
    float3 _5168 = float3(_1687, _1689, _1679);
    float4 _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5168, float3(0.0), isnan(_5168)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5168, float3(0.0), isnan(_5168)), level(0.0)).xyzw;
    float _1702 = _1700.x;
    float _1704 = _1700.y;
    float _1706 = _1700.z;
    float _1708 = _1700.w;
    float2 _5184 = float2(_1695, _1685);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5184, float2(0.0), isnan(_5184)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5184, float2(0.0), isnan(_5184)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = -_1091;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _843);
    float _1724 = in.m_53.w;
    bool _1726 = _739 > 0.5;
    float _1728 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1736 = _749 > 0.5;
    float _1738 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1728);
    float _1740 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1730);
    float _1742 = 1.0 / _1734;
    float _1744 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1738);
    float _1746 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1740);
    float _1748 = -_1043;
    float _1750 = _1748 + 1.0;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1754 = _1746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1760 = 1.0 / _1752;
    float _1762 = _1754 + _1752;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1766 = _1764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _737 + _1772;
    float _1776 = _701 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = _1770 * _1742;
    float _1780 = 1.0 / _1766;
    float _1782 = _705 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1784 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1788 = _1786 != 0;
    float _1790 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1794 = _1792 != 0;
    float _1796 = 1.0 / _1758;
    float _1798 = _1762 * _1760;
    float _1800 = _1798 * 0.5;
    bool _1802 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1804 = isnan(_737);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1816 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1818 = isnan(_737);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1830 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1828);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1834 = _1832 != 0;
    float _1836 = -_1812;
    float _1838 = _1836 + 1.0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1842 = _1840 != 0;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1844;
    bool _1848 = _1724 > 0.5;
    float _1850 = _1826 * _1838;
    bool _1852 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1854 = isnan(_737);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = -_1826;
    float _1866 = _1864 + 1.0;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1874 = _1846 * _1796;
    float _1876 = _1862 * _1866;
    float _1878 = _1870 * _1780;
    bool _1880 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1882 = isnan(_737);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1894 = _737 + _1892;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1898 = _737 + _1896;
    float _1900 = _1814 * _1876;
    float _1902 = 1.0 / _1830;
    float _1904 = -_1862;
    float _1906 = _1904 + 1.0;
    float _1908 = fma(_1878, _1894, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1910 = -_1890;
    float _1912 = _1910 + 1.0;
    float _1914 = fma(_1874, _1898, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1900);
    float _1918 = -_1167;
    int _1920 = _1726 ? as_type<int>(_1918) : as_type<int>(_1167);
    float _1922 = _1812 * _1912;
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1926 = fma(_1908, _1850, _1916);
    float _1928 = -_1171;
    int _1930 = _1848 ? as_type<int>(_1928) : as_type<int>(_1171);
    float _1932 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1934 = _827 > 0.5;
    float _1936 = fma(_1914, _1922, _1926);
    bool _1938 = !_1788;
    float _1940 = _1938 ? _1167 : as_type<float>(_1920);
    float _1942 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1946 = _1902 * _1944;
    bool _1948 = !_1794;
    float _1950 = _1948 ? _1171 : as_type<float>(_1930);
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1954 = -_1171;
    int _1956 = _1934 ? as_type<int>(_1954) : as_type<int>(_1171);
    float _1958 = _1940 + 0.5;
    float _1960 = -_1167;
    int _1962 = _1736 ? as_type<int>(_1960) : as_type<int>(_1167);
    float _1964 = _1950 + (-0.5);
    bool _1966 = !_1842;
    float _1968 = _1966 ? _1171 : as_type<float>(_1956);
    float _1970 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1974 = isnan(0.5);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1980 = _1976 || _1978;
    float _1982 = abs(_1946);
    float _1984 = log2(_1982);
    float _1986 = fma(_1932, _1958, _965);
    float _1988 = -_1970;
    float _1990 = -_969;
    float _1992 = fma(_1988, _1964, _1990);
    float _1994 = -_919;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1936);
    bool _2000 = !_1834;
    float _2002 = _2000 ? _1167 : as_type<float>(_1962);
    float _2004 = fma(_1950, _1750, _1992);
    float _2006 = -_1996;
    float _2008 = fma(_1940, _2006, _1986);
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2014 = _2002 + 0.5;
    float _2016 = _1998;
    float _2018 = _2010;
    float _2020 = _1639;
    if (!_1980)
    {
        _2016 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2022 = _2016;
    float _2024 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2026 = -_1968;
    float _2028 = _2026 + 0.5;
    float _2030 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2032 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2034 = fma(_1229, _2024, _1219);
    float _2036 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2038 = _2030 * _1952;
    float _2040 = exp2(_2032);
    float _2042 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2044 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1784);
    float _2048 = fma(_1239, _2024, _1221);
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2036 * _2012;
    float _2054 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2056 = exp2(_1790);
    float _2058 = _2032;
    if (!_1980)
    {
        float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2062 = _2022 + _2060;
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = -_1213;
    float _2068 = fma(_1223, _2024, _2066);
    out.m_64.x = _2044;
    out.m_64.y = _2050;
    out.m_64.z = _1942;
    out.m_64.w = _2010;
    float _2070 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _2038;
    out.m_66.y = _2052;
    out.m_66.z = _2008;
    out.m_66.w = _2004;
    float _2072 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2074 = precise::clamp(_2072, 0.0, 1.0);
    float _2076 = _2064;
    if (!_1980)
    {
        float _2078 = 1.0 / _2064;
        _2076 = _2078;
    }
    float _2080 = _2076;
    float _2082 = in.m_68.x;
    float _2084 = -_2070;
    float _2086 = fma(_1233, _2084, _2034);
    float _2088 = -_2070;
    float _2090 = fma(_1225, _2088, _2068);
    float _2092 = -_2070;
    float _2094 = fma(_1249, _2092, _2048);
    float _2096 = fma(_2074, -2.0, 3.0);
    float _2098 = _2074 * _2074;
    float _2100 = _2096;
    if (_1980)
    {
        _2018 = 1.0;
    }
    float _2102 = _2018;
    float _2104 = -_2056;
    float _2106 = _2104 + 1.0;
    float _2108 = _2098 * _2096;
    float _2110 = _2102;
    if (!_1980)
    {
        float _2112 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2114 = _1946 + _2112;
        _2100 = _2114;
    }
    float _2116 = _2100;
    bool _2118 = _1946 <= 8000.0;
    bool _2120 = isnan(_1946);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(8000.0);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2132 = -_2108;
    float _2134 = _2132 + 1.0;
    if (!_1980)
    {
        float _2136 = _2116 * _2080;
        float _2138 = precise::clamp(_2136, 0.0, 1.0);
        _2110 = _2138;
    }
    float _2140 = _2110;
    float _2142 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2054);
    float _2144 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2146 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2108);
    float _2148 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2130);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2152 = _2142 + _2150;
    float _2154 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2144);
    float _2156 = _2128 * _2146;
    float _2158 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2160 = _1639 + _2152;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _2152;
    out.gl_Position.w = _1639;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2164 = fma(_2090, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2158);
    float _2166 = _2160 * 0.5;
    float _2168 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2148);
    float _2170 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2154);
    float _2172 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2174 = fma(_2094, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2164);
    bool _2176 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2178 = isnan(_1405);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2184 = _2180 || _2182;
    out.m_70.x = _2168;
    out.m_70.y = _2170;
    out.m_70.z = _2174;
    float _2186 = -_2172;
    float _2188 = _2186 + 1.0;
    out.m_72.z = _2166;
    out.m_72.w = _1639;
    float _2190 = _2152;
    float _2192 = _2166;
    float _2194 = _2172;
    float _2196 = _2188;
    if (!_2184)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2198 = _2020;
    float _2200 = _2198;
    float _2202 = _2198;
    if (!_2184)
    {
        _2190 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2204 = _2190;
    float _2206 = _2204;
    float _2208 = _2204;
    if (!_2184)
    {
        _2192 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2210 = _2192;
    float _2212 = -_1677;
    float _2214 = _2212 + 1.0;
    float _2216 = _2214 * _2162;
    float _2218 = precise::clamp(_2216, 0.0, 1.0);
    float _2220 = -_2218;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2224 = _2222 * _2082;
    float _2226 = _2172 * _1697;
    float _2228 = _1708 * _2188;
    float _2230 = _2210;
    float _2232 = _2210;
    if (!_2184)
    {
        _2194 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2234 = _2194;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2238 = _1708 * _2226;
    float _2240 = _1718 * _2226;
    float _2242 = _2238;
    float _2244 = _2234;
    float _2246 = _2234;
    if (!_2184)
    {
        _2196 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2248 = _2196;
    float _2250 = fma(_1714, _2238, _1702);
    float _2252 = fma(_1716, _2238, _1704);
    float _2254 = fma(_1708, _2240, _1706);
    out.m_74.x = _2236;
    float _2256 = _2140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2258 = _2248;
    float _2260 = _2248;
    if (!_2184)
    {
        _2242 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2262 = _2242;
    out.m_76.x = _2250;
    out.m_76.y = _2252;
    out.m_76.z = _2254;
    out.m_76.w = _2228;
    bool _2264 = !_2184;
    float _2266 = _2262;
    float _2268 = _2262;
    if (!_2264)
    {
        bool _2270 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2272 = isnan(_1405);
        bool _2274 = _2270 || _2272;
        bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2278 = _2274 || _2276;
        if (!_2278)
        {
            float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2282 = _1405 + _2280;
            float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2284;
            float _2288 = 1.0 / _2286;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2310 = _2282 * _2288;
            float _2312 = precise::clamp(_2310, 0.0, 1.0);
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2318 = fma(_2312, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2232 = _2320;
            _2268 = _2326;
            _2246 = _2318;
            _2208 = _2324;
            _2202 = _2322;
            _2260 = _2328;
            _2330 = true;
        }
        else
        {
            bool _2332 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2334 = isnan(_1405);
            bool _2336 = _2332 || _2334;
            bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2340 = _2336 || _2338;
            if (!_2340)
            {
                _2244 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2342 = _2244;
            _2246 = _2342;
            if (!_2340)
            {
                _2230 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2344 = _2230;
            _2232 = _2344;
            if (!_2340)
            {
                _2200 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2346 = _2200;
            _2202 = _2346;
            if (!_2340)
            {
                _2206 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2348 = _2206;
            _2208 = _2348;
            if (!_2340)
            {
                _2266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2350 = _2266;
            _2268 = _2350;
            if (!_2340)
            {
                _2258 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2352 = _2258;
            bool _2354 = !_2340;
            _2260 = _2352;
            if (!_2354)
            {
                bool _2356 = _1405 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2358 = isnan(_1405);
                bool _2360 = _2356 || _2358;
                bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2364 = _2360 || _2362;
                if (!_2364)
                {
                    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2368 = _1405 + _2366;
                    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2370;
                    float _2374 = 1.0 / _2372;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2396 = _2368 * _2374;
                    float _2398 = precise::clamp(_2396, 0.0, 1.0);
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2232 = _2406;
                    _2268 = _2412;
                    _2246 = _2404;
                    _2208 = _2410;
                    _2202 = _2408;
                    _2260 = _2414;
                    _2330 = true;
                }
                else
                {
                    _2232 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2246 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2208 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2202 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2260 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2330 = false;
    float _2416 = _2232;
    float _2418 = _2268;
    float _2420 = _2246;
    float _2422 = _2208;
    float _2424 = _2202;
    float _2426 = _2260;
    float _2428 = _2256 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2430 = fma(_2170, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2416;
    float _2436 = _2434 + _2418;
    float _2438 = -_2420;
    float _2440 = _2438 + _2422;
    out.m_49.x = _2428;
    float _2442 = fma(_2432, _2436, _2416);
    float _2444 = -_2424;
    float _2446 = _2444 + _2426;
    float _2448 = fma(_2432, _2440, _2420);
    float _2450 = _2442 * 0.586610972881317138671875;
    bool _2452 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2454 = fma(_2432, _2446, _2424);
    out.m_78.x = 0.0;
    float _2456 = fma(_2448, 0.298911988735198974609375, _2450);
    bool _2458 = _2140 > 0.0;
    bool _2460 = isnan(_2140);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.0);
    bool _2466 = _2462 || _2464;
    float _2468 = fma(_2454, 0.114477999508380889892578125, _2456);
    float _2470 = -_2468;
    float _2472 = _2448 + _2470;
    float _2474 = -_2468;
    float _2476 = _2442 + _2474;
    float _2478 = -_2468;
    float _2480 = _2454 + _2478;
    float _2482 = fma(_2472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    float _2484 = fma(_2476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    float _2486 = fma(_2480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2468);
    bool _2488 = !_2452;
    if (!_2488)
    {
        float _2490 = -_1363;
        float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2494 = -_1367;
        float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2498 = -_1371;
        float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2502 = _2492 * _2492;
        float _2504 = fma(_2496, _2496, _2502);
        float _2506 = fma(_2500, _2500, _2504);
        float _2508 = sqrt(_2506);
        float _2510 = rsqrt(_2506);
        float _2512 = -_2508;
        float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2516 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2518 = precise::clamp(_2516, 0.0, 1.0);
        float _2520 = _2496 * _2510;
        float _2522 = _2492 * _2510;
        float _2524 = abs(_2518);
        float _2526 = log2(_2524);
        float _2528 = _2500 * _2510;
        float _2530 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2532 = _2170 * _2522;
        float _2534 = -_2522;
        float _2536 = -_2530;
        float _2538 = fma(_2534, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2536);
        float _2540 = fma(_2168, _2520, _2532);
        float _2542 = -_2528;
        float _2544 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2538);
        float _2546 = fma(_2174, _2528, _2540);
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2552 = _2544 + _2550;
        float _2554 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2558 = precise::clamp(_2556, 0.0, 1.0);
        float _2560 = exp2(_2554);
        float _2562 = _2560 * _2558;
        float _2564 = _2548 * _2562;
        float _2566 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2570 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2566;
        out.m_78.y = _2568;
        out.m_78.z = _2570;
    }
    out.m_80.x = _2482;
    out.m_80.y = _2484;
    out.m_80.z = _2486;
    if (_2466)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2572;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

