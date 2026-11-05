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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_10 [[id(6)]];
    sampler vp_t_tcb_10Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_10Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_74 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1491 = false;
    bool _459 = false;
    bool _311 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_46.w;
    float _90 = in.m_48.w;
    float _92 = trunc(_88);
    int _95 = int(_92);
    float _97 = -_90;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _99;
    bool _103 = _95 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_95);
    float _109 = _99;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _105;
    if (!_103)
    {
        out.m_53.x = 0.0;
    }
    int _113 = 0;
    if (!_103)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3291 = as_type<float>(_117);
        out.gl_Position.z = _3291;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _121 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_90);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = in.m_55.x;
    float _133 = float(_95);
    bool _135 = _99 >= _133;
    bool _137 = !_129;
    bool _139 = _135 || _137;
    if (_139)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _107;
    if (_139)
    {
        out.m_53.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _119 = as_type<int>(_143);
    }
    int _145 = _119;
    out.m_57.x = _131;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3350 = as_type<float>(_145);
        out.gl_Position.z = _3350;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / _133;
    float _151 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _153 = in.m_62.w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _151;
    if (!_163)
    {
        float _181 = _151 * _151;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    int _193 = as_type<int>(_147) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_147) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_163;
    float _211 = _191;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _151 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _151);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_163;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _151 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _179 = _265;
    }
    float _267 = _179;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_267, _165, _271);
    float _279 = fma(_267, _167, _273);
    float _281 = fma(_267, _169, _275);
    float _283 = _99 * _149;
    float _285 = fma(_277, _153, _171);
    float _287 = fma(_279, _153, _173);
    float _289 = fma(_281, _153, _175);
    bool _291 = !_269;
    float _293 = _283;
    float _309;
    if (!_291)
    {
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _297 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        _309 = _283;
    }
    _311 = false;
    float _313 = _309;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    bool _319 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_313);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _313 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = 1.0 / _337;
    bool _349 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_313);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _363 = 1.0 / _341;
    float _365 = _317 * _347;
    bool _367 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_313);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = in.m_62.x;
    float _385 = in.m_62.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = _377 * _345;
    float _393 = -_377;
    float _395 = _393 + 1.0;
    float _397 = fma(_381, _365, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = fma(_389, _365, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _401 = _333 * _363;
    float _403 = _359 * _395;
    float _405 = -_359;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = _397 * _403;
    float _419 = _399 * _403;
    float _421 = fma(_411, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_415, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _429 = fma(_421, _391, _425);
    float _431 = fma(_423, _391, _427);
    float _433 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[145].x, _429);
    float _435 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[145].y, _431);
    float _437 = _433 * _383;
    float _439 = _435 * _385;
    bool _441 = !_361;
    float _457;
    if (!_441)
    {
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _445 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _283;
    }
    _459 = false;
    float _461 = _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _479;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _485 = 1.0 / _481;
    float _487 = -_477;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _491;
    float _495 = _465 * _485;
    bool _497 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_461);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = fma(_493, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = _507 * _489;
    float _521 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = fma(_517, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = _513 * _519;
    float _531 = _521 * _519;
    float _533 = _523 * _519;
    float _535 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _531);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _539 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _541 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].x, _535);
    float _543 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].y, _537);
    float _545 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].z, _539);
    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _553;
    out.m_64.y = _555;
    out.m_64.z = _557;
    bool _559 = !_483;
    if (!_559)
    {
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _563 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].z, _99);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _293 = _573;
    }
    float _575 = _293;
    float _577 = in.m_55.w;
    float _579 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _581 = log2(_579);
    float _583 = _131 * 2.0;
    float _585 = in.m_55.y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _587;
    float _591 = in.m_55.z;
    bool _593 = _131 > 0.5;
    float _595 = floor(_583);
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    float _609 = _581 * _99;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _613 = _611 != 0;
    float _615 = 1.0 / _589;
    float _617 = _287 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _619 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].x, _617);
    bool _621 = _577 > 0.5;
    float _623 = _287 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = exp2(_609);
    float _627 = -_203;
    int _629 = _593 ? as_type<int>(_627) : as_type<int>(_203);
    float _631 = _287 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _633 = _585 > 0.5;
    float _635 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    bool _637 = _591 > 0.5;
    float _639 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    bool _641 = !_599;
    float _643 = _641 ? _203 : as_type<float>(_629);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _649 = -_207;
    int _651 = _633 ? as_type<int>(_649) : as_type<int>(_207);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _655 = 1.0 + _653;
    bool _657 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(1.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _635);
    float _669 = -_203;
    int _671 = _637 ? as_type<int>(_669) : as_type<int>(_203);
    float _673 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _619);
    bool _675 = !_603;
    float _677 = _675 ? _207 : as_type<float>(_651);
    float _679 = -_625;
    float _681 = _679 + 1.0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _693 = _691 != 0;
    float _695 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _639);
    bool _697 = !_607;
    float _699 = _697 ? _203 : as_type<float>(_671);
    float _701 = _591 * 2.0;
    bool _703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = 1.0 / _655;
    float _715 = -_207;
    int _717 = _621 ? as_type<int>(_715) : as_type<int>(_207);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _721 = _575 + _719;
    bool _723 = _595 > 0.0;
    float _725 = _585 + _591;
    bool _727 = !_613;
    float _729 = _727 ? _207 : as_type<float>(_717);
    float _731 = -_677;
    float _733 = _731 + 0.5;
    float _735 = floor(_701);
    float _737 = _711 ? _681 : 0.0;
    float _739 = _725 + (-1.0);
    bool _741 = _595 >= 0.0;
    bool _743 = isnan(_595);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = _585 * 2.0;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _755 = _749 ? 0 : 1;
    float _757 = 1.0 / _647;
    if (_665)
    {
        float _759 = _737 * _713;
        _109 = _759;
    }
    float _761 = _109;
    bool _763 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _765 = isnan(_575);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _783 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _785 = isnan(_575);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = _699 + 0.5;
    float _797 = floor(_751);
    bool _799 = _735 >= 0.0;
    bool _801 = isnan(_735);
    bool _803 = _799 || _801;
    bool _805 = isnan(0.0);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _811 = _575 + _809;
    bool _813 = _735 > 0.0;
    float _815 = _643 + 0.5;
    int _817 = _807 ? 0 : 1;
    float _819 = _811 * _615;
    bool _821 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _823 = isnan(_575);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _131 + _585;
    float _835 = _721 * _757;
    float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _839 = _833 + (-1.0);
    float _841 = fma(_777, _819, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _843 = fma(_781, _835, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _845 = _797 > 0.0;
    float _847 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _849 = _797 >= 0.0;
    bool _851 = isnan(_797);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = -_773;
    float _861 = _859 + 1.0;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _873 = _831 * _861;
    float _875 = -_831;
    float _877 = _875 + 1.0;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _883;
    float _887 = fma(_867, _819, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _891 = fma(_881, _835, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _893 = fma(_885, _819, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _895 = _793 * _877;
    float _897 = fma(_871, _835, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _899 = _733 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _901 = -_729;
    float _903 = _901 + 0.5;
    float _905 = _887 * _895;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _909 = _795 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _911 = -_793;
    float _913 = _911 + 1.0;
    float _915 = _893 * _895;
    float _917 = _841 * _895;
    float _919 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _921 = _899 * _837;
    float _923 = _903 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _925 = _909 * _863;
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].x, _905);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].y, _915);
    float _931 = _673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _933 = _919 * _889;
    float _935 = fma(_897, _873, _927);
    float _937 = fma(_891, _873, _929);
    bool _939 = !_685;
    int _941 = _939 ? 0 : 1;
    float _943 = _923 * _907;
    float _945 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _949 = _931 + _947;
    int _951 = ~_755;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].z, _917);
    int _959 = _955;
    if (!_723)
    {
        int _961 = ~_755;
        int _963 = _961 + 1;
        _959 = _963;
    }
    int _965 = _959;
    out.m_66.x = _933;
    out.m_66.y = _921;
    out.m_66.z = _925;
    out.m_66.w = _943;
    float _967 = _695 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _969 = fma(_843, _873, _957);
    int _971 = _857 ? 0 : 1;
    float _973 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].x, _935);
    bool _975 = !_689;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].y, _937);
    int _981 = ~_971;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    float _987 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].z, _969);
    int _989 = _985;
    if (!_845)
    {
        int _991 = ~_971;
        int _993 = _991 + 1;
        _989 = _993;
    }
    int _995 = _989;
    float _997 = in.m_68.x;
    float _999 = in.m_68.y;
    float _1001 = in.m_68.z;
    int _1003 = ~_817;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    int _1009 = abs(_941);
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1013 = _945 + _1011;
    float _1015 = _949 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = float(_965);
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1021 = _967 + _1019;
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    int _1025 = abs(_977);
    int _1027 = _1007;
    if (!_813)
    {
        int _1029 = ~_817;
        int _1031 = _1029 + 1;
        _1027 = _1031;
    }
    int _1033 = _1027;
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1023);
    float _1037 = float(_1025);
    bool _1039 = _1035 >= 0.0;
    float _1041 = _949 * _949;
    float _1043 = _1037 * _1017;
    float _1045 = float(_1009);
    float _1047 = fma(_1013, _1013, _1041);
    float _1049 = float(_1033);
    float _1051 = _1043 * (-2.0);
    float _1053 = fma(_1021, _1021, _1047);
    float _1055 = _1045 * _1049;
    float _1057 = fma(_753, _1051, _753);
    float _1059 = fma(_1051, _999, _999);
    float _1061 = _1051;
    float _1063 = _1001;
    if (_1039)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1065 = _1061;
    float _1067 = rsqrt(_1053);
    float _1069 = _1055 * (-2.0);
    float _1071 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1073 = !_693;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = as_type<int>(_1065);
    if (_1039)
    {
        float _1079 = _1065 * 5.0;
        _1077 = as_type<int>(_1079);
    }
    int _1081 = _1077;
    float _1083 = fma(_1069, _997, _997);
    float _1085 = fma(_847, _1069, _847);
    float _1087 = _585 + (-0.5);
    float _1089 = _973 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1091 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1059);
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1097 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1101 = abs(_1075);
    float _1103 = _131 + (-0.5);
    float _1105 = fma(_1057, _761, _1093);
    float _1107 = _949 * _1067;
    out.m_70.x = _1095;
    out.m_70.y = _1097;
    out.m_70.z = _1099;
    float _1109 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1083);
    float _1111 = float(_1101);
    float _1113 = _1013 * _1067;
    if (_1039)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4886 = as_type<float>(_1081);
        out.gl_Position.z = _4886;
    }
    float _1115 = _1021 * _1067;
    float _1117 = -_1107;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    if (_1039)
    {
        out.m_53.x = 0.0;
    }
    if (_1039)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1121 = -_1107;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _1125 = -_1113;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _1129 = _1105 * 0.15915493667125701904296875;
    float _1131 = float(_995);
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1135 = _1123 + _1133;
    float _1137 = -_1115;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1127 + _1141;
    float _1145 = -_1113;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1149 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1151 = _1119 * _1119;
    float _1153 = _1111 * _1131;
    float _1155 = _131 + _591;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1159 = _1139 + _1157;
    float _1161 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1149);
    float _1163 = fma(_1085, _761, _1109);
    float _1165 = fma(_1147, _1147, _1151);
    float _1167 = -_1115;
    float _1169 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1171 = _1155 + (-1.0);
    float _1173 = _1153 * (-2.0);
    float _1175 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1161);
    float _1177 = fma(_1169, _1169, _1165);
    float _1179 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1181 = fma(_1173, _1001, _1001);
    float _1183 = _591 + (-0.5);
    bool _1185 = _1175 >= 0.0;
    float _1187 = fma(_1179, _1173, _1179);
    float _1189 = sqrt(_1177);
    float _1191 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1181);
    float _1193 = _1163 * 0.15915493667125701904296875;
    float _1195 = fma(_1187, _761, _1191);
    float _1197 = _1129 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1195 * 0.15915493667125701904296875;
    if (_1185)
    {
        _1063 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1203 = _1063;
    int _1205 = as_type<int>(_1203);
    if (_1185)
    {
        out.m_53.x = 0.0;
    }
    float _1207 = _1129 * 6.283185482025146484375;
    float _1209 = cos(_1207);
    if (_1185)
    {
        float _1211 = _1203 * 5.0;
        _1205 = as_type<int>(_1211);
    }
    int _1213 = _1205;
    float _1215 = _1067 * _1189;
    if (_1185)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5074 = as_type<float>(_1213);
        out.gl_Position.z = _5074;
    }
    float _1217 = _1193 * 6.283185482025146484375;
    float _1219 = sin(_1217);
    float _1221 = _1193 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1201 * 6.283185482025146484375;
    float _1227 = sin(_1225);
    if (_1185)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1229 = _1201 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1235 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1237 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1239 = _1223 * _1209;
    float _1241 = _1215 * _1233;
    float _1243 = _1235 * _1241;
    float _1245 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = _1219 * _1199;
    float _1249 = _1215 * _1245;
    float _1251 = _1223 * _1199;
    float _1253 = _1231 * _1243;
    float _1255 = fma(_1227, _1239, _1247);
    float _1257 = _1237 * _1249;
    float _1259 = _1199 * _1231;
    float _1261 = _1223 * _1253;
    float _1263 = _1209 * _1231;
    float _1265 = _1219 * _1209;
    float _1267 = -_1243;
    float _1269 = _1227 * _1267;
    float _1271 = fma(_1255, _1257, _1261);
    float _1273 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1275 = _1273 * 0.5;
    float _1277 = -_1265;
    float _1279 = fma(_1227, _1251, _1277);
    float _1281 = -_1251;
    float _1283 = fma(_1227, _1265, _1281);
    float _1285 = _1219 * _1253;
    float _1287 = fma(_1263, _1257, _1269);
    float _1289 = fma(_1279, _1275, _1271);
    float _1291 = fma(_1227, _1247, _1239);
    float _1293 = fma(_1283, _1257, _1285);
    float _1295 = fma(_1259, _1275, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1301 = fma(_1291, _1275, _1293);
    float _1303 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1299);
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1303);
    float _1311 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1305);
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1307);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1309);
    float _1317 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1319 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1321 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1323 = _945 + _1317;
    float _1325 = _967 + _1319;
    float _1327 = _931 + _1321;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1331 = _1323 + _1329;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1335 = _1325 + _1333;
    float _1337 = _1331 * _1331;
    float _1339 = _1335 * _1335;
    float _1341 = _1337 + _1339;
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1301;
    float _1349 = _1303;
    float _1351 = _1323;
    float _1353 = _1337;
    float _1355 = _1325;
    float _1357 = _1321;
    if (!_1345)
    {
        _1347 = _1323;
    }
    float _1359 = _1347;
    float _1361 = _1359;
    if (!_1345)
    {
        _1349 = _1339;
    }
    float _1363 = _1349;
    float _1365 = _1363;
    if (!_1345)
    {
        _1351 = _1327;
    }
    float _1367 = _1351;
    bool _1369 = !_1345;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1343 + _1375;
        float _1379 = rsqrt(_1341);
        float _1381 = _1377 * _1373;
        float _1383 = _1327 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = _1381 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = cos(_1391);
        float _1395 = fma(_1389, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1397 = _1379 * _1395;
        float _1399 = _1393 + (-1.0);
        float _1401 = fma(_1331, _1397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1403 = fma(_1335, _1397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1405 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1409 = _1401 + _1407;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1413 = _1403 + _1411;
        float _1415 = fma(_1327, _1393, _1405);
        float _1417 = _1409 * _1409;
        float _1419 = _1413 * _1413;
        _1371 = _1415;
        _1353 = _1417;
        _1365 = _1419;
        _1361 = _1401;
        _1355 = _1403;
        _1357 = _1385;
    }
    float _1421 = _1371;
    float _1423 = _1353;
    float _1425 = _1365;
    float _1427 = _1361;
    float _1429 = _1355;
    float _1431 = _1357;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1435 = _1421 + _1433;
    float _1437 = fma(_1435, _1435, _1423);
    float _1439 = _1437 + _1425;
    float _1441 = sqrt(_1439);
    bool _1443 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1445 = isnan(_1441);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1451 = _1447 || _1449;
    float _1453 = _1437;
    float _1455 = _1431;
    if (!_1451)
    {
        _1453 = 1.0;
    }
    float _1457 = _1453;
    bool _1459 = !_1451;
    float _1461 = _1457;
    if (!_1459)
    {
        bool _1463 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1465 = isnan(_1441);
        bool _1467 = _1463 || _1465;
        bool _1469 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1471 = _1467 || _1469;
        if (!_1471)
        {
            float _1473 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1475 = _1441 + _1473;
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1483 = _1481 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1485 = 1.0 / _1479;
            float _1487 = _1475 * _1485;
            float _1489 = fma(_1487, _1483, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1461 = _1489;
            _1491 = true;
        }
        else
        {
            bool _1493 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1495 = isnan(_1441);
            bool _1497 = _1493 || _1495;
            bool _1499 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1501 = _1497 || _1499;
            if (!_1501)
            {
                float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1505 = _1441 + _1503;
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1507 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1515 = 1.0 / _1509;
                float _1517 = _1505 * _1515;
                float _1519 = fma(_1517, _1513, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1461 = _1519;
                _1491 = true;
            }
            else
            {
                _1461 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1491 = false;
    float _1521 = _1461;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1525 = _1427 + _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1529 = _1429 + _1527;
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1543 = _1421 + _1541;
    float _1545 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1547 = fma(_1529, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1549 = fma(_1543, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1551 = -_1113;
    float _1553 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1545);
    float _1555 = -_1115;
    float _1557 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1547);
    float _1559 = -_1107;
    float _1561 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1549);
    float _1563 = _1561;
    float _1565 = _1553;
    float _1567 = _1557;
    float _1569 = _1545;
    float _1571 = _1549;
    if (!_1539)
    {
        float _1573 = _1135 * _1135;
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1577 = -_967;
        float _1579 = _1577 + _1547;
        float _1581 = -_931;
        float _1583 = _1581 + _1549;
        float _1585 = fma(_1143, _1143, _1573);
        float _1587 = fma(_1159, _1159, _1585);
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1591 = sqrt(_1587);
        float _1593 = 1.0 / _1215;
        float _1595 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1597 = precise::min(_1591, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1599 = _1597 * _1575;
        float _1601 = _1599 * _1593;
        float _1603 = -_945;
        float _1605 = _1603 + _1545;
        float _1607 = _1595 * _1601;
        float _1609 = _1579 * _1601;
        float _1611 = fma(_1605, _1607, _1127);
        float _1613 = fma(_1583, _1607, _1123);
        float _1615 = fma(_1595, _1609, _1139);
        _1563 = _1613;
        _1565 = _1611;
        _1567 = _1615;
    }
    float _1617 = _1563;
    float _1619 = _1565;
    float _1621 = _1567;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1625 = _1617 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1629 = _1619 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1633 = _1621 + _1631;
    float _1635 = _1625 * _1625;
    float _1637 = fma(_1629, _1629, _1635);
    float _1639 = fma(_1633, _1633, _1637);
    float _1641 = rsqrt(_1639);
    float _1643 = sqrt(_1639);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1647 = _1629 * _1645;
    float _1649 = _1633 * _1645;
    float _1651 = _1647 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 + _1653;
    float _1657 = sqrt(_1655);
    bool _1659 = _1657 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = _1657 + _1661;
    float _1665 = _1641;
    float _1667 = _1655;
    float _1669 = _1663;
    float _1671 = _1625;
    if (_1659)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1673;
    }
    float _1675 = _1665;
    if (_1659)
    {
        float _1677 = rsqrt(_1655);
        _1667 = _1677;
    }
    float _1679 = _1667;
    if (_1659)
    {
        float _1681 = _1663 * _1675;
        _1669 = _1681;
    }
    float _1683 = _1669;
    if (_1659)
    {
        float _1685 = _1683 * 0.15915493667125701904296875;
        _1455 = _1685;
    }
    float _1687 = _1455;
    float _1689 = _1633;
    if (_1659)
    {
        float _1691 = _1687 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        _1689 = _1693;
    }
    float _1695 = _1689;
    float _1697 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1699 = precise::max(0.0, _1697);
    float _1701 = _1675;
    float _1703 = _1699;
    if (_1659)
    {
        float _1705 = _1687 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        _1701 = _1707;
    }
    float _1709 = _1701;
    float _1711 = -_1645;
    float _1713 = -_1699;
    float _1715 = fma(_1625, _1711, _1713);
    if (_1659)
    {
        float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1717;
    }
    float _1719 = _1671;
    float _1721 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1723 = _1695;
    float _1725 = _1719;
    if (_1659)
    {
        float _1727 = fma(_1695, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1569 = _1727;
    }
    float _1729 = _1569;
    float _1731 = _1729;
    if (!_1659)
    {
        _1723 = _1647;
    }
    float _1733 = _1723;
    float _1735 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1721);
    float _1737 = _1733;
    if (!_1659)
    {
        _1725 = _1715;
    }
    float _1739 = _1725;
    float _1741 = _1739;
    float _1743 = _1709;
    if (_1659)
    {
        float _1745 = _1709 + (-1.0);
        _1703 = _1745;
    }
    float _1747 = _1703;
    float _1749 = _1747;
    if (_1659)
    {
        float _1751 = _1679 * _1729;
        _1731 = _1751;
    }
    float _1753 = _1731;
    float _1755 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1757 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    if (_1659)
    {
        float _1759 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1759;
    }
    float _1761 = _1571;
    float _1763 = _1761;
    if (_1659)
    {
        float _1765 = _1647 * _1753;
        _1737 = _1765;
    }
    float _1767 = _1737;
    if (!_1659)
    {
        _1749 = _1649;
    }
    float _1769 = _1749;
    float _1771 = _1769;
    if (_1659)
    {
        float _1773 = _1649 * _1753;
        _1771 = _1773;
    }
    float _1775 = _1771;
    if (_1659)
    {
        float _1777 = fma(_1715, _1709, _1761);
        _1741 = _1777;
    }
    float _1779 = _1741;
    if (!_1659)
    {
        _1763 = _1651;
    }
    float _1781 = _1763;
    float _1783 = _1781;
    if (_1659)
    {
        float _1785 = _1767 * _1767;
        _1783 = _1785;
    }
    float _1787 = _1783;
    if (!_1659)
    {
        _1743 = _1653;
    }
    float _1789 = _1743;
    float _1791 = _1789;
    if (_1659)
    {
        float _1793 = _1775 * _1775;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1755);
    float _1799 = fma(_1779, _1779, _1787);
    float _1801 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1803 = _1799 + _1795;
    float _1805 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1797);
    float _1807 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1811 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1809);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = rsqrt(_1803);
    float _1817 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1819 = _1807 * 0.5;
    float _1821 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1823 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1825 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1827 = fma(_1817, -0.5, _1819);
    float _1829 = -_1813;
    float _1831 = _1829 + 1.0;
    float _1833 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1823);
    float _1835 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1821);
    float _1837 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1801);
    float _1839 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1825);
    float _1841 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1843 = abs(_1831);
    float _1845 = log2(_1843);
    float _1847 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1835);
    float _1849 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    float _1851 = _1815 * _1767;
    float _1853 = _1815 * _1779;
    float _1855 = _1815 * _1775;
    float _1857 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1861 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1863 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1865 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1867 = -_1859;
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1867);
    float _1871 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1873 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1875 = -_1855;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1869);
    float _1879 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1881 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1865);
    float _1883 = fma(_1877, -0.5, 0.5);
    float _1885 = fma(_1877, 0.5, 0.5);
    float _1887 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1881);
    float _1889 = exp2(_1879);
    float _1891 = _1853 + 1.0;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1887);
    float _1897 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1899 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1901 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1827);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1905 = _1827 + _1903;
    float _1907 = sqrt(_1883);
    float _1909 = -_1897;
    float _1911 = fma(_1909, _1893, 1.0);
    float _1913 = fma(_1885, _1899, -0.212114393711090087890625);
    float _1915 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1917 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1921 = fma(_1885, _1913, 1.570728778839111328125);
    float _1923 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1827);
    float _1925 = -_1853;
    float _1927 = fma(_1889, _1891, _1925);
    float _1929 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1931 = 1.0 / _1895;
    float _1933 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1915);
    float _1935 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1937 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1929);
    float _1939 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1827);
    float _1941 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1933);
    float _1943 = _1907 * 0.636619746685028076171875;
    float _1945 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1937);
    float _1947 = 1.0 / _1807;
    float _1949 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1951 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1941);
    float _1953 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1955 = -_1921;
    float _1957 = fma(_1943, _1955, 1.0);
    float _1959 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1961 = fma(_1927, 0.5, 0.5);
    float _1963 = _1953 + _1807;
    float _1965 = _1951 * _1931;
    float _1967 = _1959 * _1931;
    float _1969 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1827);
    float _1971 = _1963 * 0.5;
    float _1973 = fma(_1965, 0.5, 0.5);
    float _1975 = fma(_1967, -0.5, 0.5);
    float _1977 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1827);
    float _1979 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1971);
    float _1981 = _1827 * _1947;
    float _1983 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1827);
    float _1985 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1827);
    float _1987 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1827);
    float _1989 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1827);
    float _1991 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1827);
    float _1993 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1827);
    float _1995 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1827);
    float _1997 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1827);
    float _1999 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1827);
    float _2001 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1827);
    float _2003 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1827);
    float _2005 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1827);
    float _2007 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1827);
    float _2009 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1827);
    float _2011 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1827);
    float _2013 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1827);
    float _2015 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1827);
    float _2017 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1971);
    float _2019 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1971);
    float _2021 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1971);
    float _2023 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1971);
    float _2025 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1971);
    float _2027 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1971);
    float _2029 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1971);
    float _2031 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1971);
    float _2033 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1971);
    float _2035 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1971);
    float _2037 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1971);
    float _2039 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1971);
    float _2041 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1971);
    float _2043 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1971);
    float _2045 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1971);
    float _2047 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1971);
    float _2049 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1971);
    float _2051 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1971);
    float _2053 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1971);
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2057 = _1971 + _2055;
    float _2059 = _1971 * _1947;
    float _2061 = _1971 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2063 = _1979 * _1947;
    float _2065 = _1977 * _1947;
    float _2067 = _1901 * _1947;
    float _2069 = _2017 * _1947;
    float _2071 = _2057 * _1947;
    float _2073 = _1905 * _1947;
    float2 _6536 = float2(_2063, _2065);
    float _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6536, float2(0.0), isnan(_6536)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6536, float2(0.0), isnan(_6536)), level(0.0)).x;
    float _2077 = _1919 * _1947;
    float2 _6549 = float2(_2069, _2067);
    float _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6549, float2(0.0), isnan(_6549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6549, float2(0.0), isnan(_6549)), level(0.0)).x;
    float _2081 = _1923 * _1947;
    float2 _6560 = float2(_2071, _1981);
    float _2083 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6560, float2(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6560, float2(0.0), isnan(_6560)), level(0.0)).x;
    float2 _6568 = float2(_2059, _2073);
    float _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6568, float2(0.0), isnan(_6568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6568, float2(0.0), isnan(_6568)), level(0.0)).x;
    float _2087 = _2061 * _1947;
    float2 _6579 = float2(_2059, _2077);
    float _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6579, float2(0.0), isnan(_6579)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6579, float2(0.0), isnan(_6579)), level(0.0)).x;
    float _2091 = _2019 * _1947;
    float2 _6590 = float2(_2069, _2081);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6590, float2(0.0), isnan(_6590)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6590, float2(0.0), isnan(_6590)), level(0.0)).x;
    float _2095 = _1939 * _1947;
    float _2097 = _2021 * _1947;
    float2 _6604 = float2(_2087, _1981);
    float _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6604, float2(0.0), isnan(_6604)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6604, float2(0.0), isnan(_6604)), level(0.0)).x;
    float _2101 = _1969 * _1947;
    float2 _6615 = float2(_2091, _2095);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6615, float2(0.0), isnan(_6615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6615, float2(0.0), isnan(_6615)), level(0.0)).x;
    float _2105 = _2023 * _1947;
    float _2107 = _1983 * _1947;
    float2 _6629 = float2(_2097, _2101);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6629, float2(0.0), isnan(_6629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6629, float2(0.0), isnan(_6629)), level(0.0)).x;
    float _2111 = log2(_1911);
    float _2113 = _2025 * _1947;
    float _2115 = _2011 * _1947;
    float2 _6645 = float2(_2105, _1981);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6645, float2(0.0), isnan(_6645)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6645, float2(0.0), isnan(_6645)), level(0.0)).x;
    float _2119 = _1985 * _1947;
    float2 _6656 = float2(_2113, _2107);
    float _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6656, float2(0.0), isnan(_6656)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6656, float2(0.0), isnan(_6656)), level(0.0)).x;
    float2 _6664 = float2(_2059, _2065);
    float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6664, float2(0.0), isnan(_6664)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6664, float2(0.0), isnan(_6664)), level(0.0)).x;
    float _2125 = _2027 * _1947;
    float _2127 = _1987 * _1947;
    float _2129 = _2015 * _1947;
    float _2131 = _2029 * _1947;
    float _2133 = _1989 * _1947;
    float _2135 = _1991 * _1947;
    float _2137 = _2031 * _1947;
    float _2139 = _2033 * _1947;
    float _2141 = _1995 * _1947;
    float _2143 = _2111 * 0.693147182464599609375;
    float _2145 = _2013 * _1947;
    float _2147 = _1993 * _1947;
    float2 _6707 = float2(_2059, _2095);
    float _2149 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6707, float2(0.0), isnan(_6707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6707, float2(0.0), isnan(_6707)), level(0.0)).x;
    float2 _6715 = float2(_2113, _2119);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).x;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _1997 * _1947;
    float2 _6730 = float2(_2069, _1981);
    float _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6730, float2(0.0), isnan(_6730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6730, float2(0.0), isnan(_6730)), level(0.0)).x;
    float2 _6738 = float2(_2125, _2127);
    float _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6738, float2(0.0), isnan(_6738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6738, float2(0.0), isnan(_6738)), level(0.0)).x;
    float _2161 = _2009 * _1947;
    float _2163 = _2035 * _1947;
    float2 _6752 = float2(_2131, _2133);
    float _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6752, float2(0.0), isnan(_6752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6752, float2(0.0), isnan(_6752)), level(0.0)).x;
    float2 _6760 = float2(_2137, _1981);
    float _2167 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6760, float2(0.0), isnan(_6760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6760, float2(0.0), isnan(_6760)), level(0.0)).x;
    float2 _6768 = float2(_2139, _2135);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6768, float2(0.0), isnan(_6768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6768, float2(0.0), isnan(_6768)), level(0.0)).x;
    float2 _6776 = float2(_2059, _2147);
    float _2171 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6776, float2(0.0), isnan(_6776)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6776, float2(0.0), isnan(_6776)), level(0.0)).x;
    float2 _6784 = float2(_2059, _2141);
    float _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6784, float2(0.0), isnan(_6784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6784, float2(0.0), isnan(_6784)), level(0.0)).x;
    float2 _6792 = float2(_2139, _2155);
    float _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6792, float2(0.0), isnan(_6792)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6792, float2(0.0), isnan(_6792)), level(0.0)).x;
    float2 _6800 = float2(_2163, _1981);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).x;
    float _2179 = _2037 * _1947;
    float _2181 = _2039 * _1947;
    float _2183 = _1999 * _1947;
    float _2185 = _2041 * _1947;
    float _2187 = _2001 * _1947;
    float _2189 = _2043 * _1947;
    float _2191 = _2003 * _1947;
    float _2193 = _2045 * _1947;
    float _2195 = _2005 * _1947;
    float _2197 = _2047 * _1947;
    float _2199 = _2007 * _1947;
    float _2201 = _2049 * _1947;
    float2 _6844 = float2(_2179, _2183);
    float _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6844, float2(0.0), isnan(_6844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6844, float2(0.0), isnan(_6844)), level(0.0)).x;
    float2 _6852 = float2(_2181, _2187);
    float _2205 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6852, float2(0.0), isnan(_6852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6852, float2(0.0), isnan(_6852)), level(0.0)).x;
    float2 _6860 = float2(_2185, _2191);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6860, float2(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6860, float2(0.0), isnan(_6860)), level(0.0)).x;
    float2 _6868 = float2(_2189, _2195);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6868, float2(0.0), isnan(_6868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6868, float2(0.0), isnan(_6868)), level(0.0)).x;
    float2 _6876 = float2(_2193, _2199);
    float _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6876, float2(0.0), isnan(_6876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6876, float2(0.0), isnan(_6876)), level(0.0)).x;
    float2 _6884 = float2(_2197, _2161);
    float _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6884, float2(0.0), isnan(_6884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6884, float2(0.0), isnan(_6884)), level(0.0)).x;
    float2 _6892 = float2(_2201, _2115);
    float _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6892, float2(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6892, float2(0.0), isnan(_6892)), level(0.0)).x;
    float _2217 = _2051 * _1947;
    float _2219 = _2053 * _1947;
    float2 _6906 = float2(_2217, _2145);
    float _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6906, float2(0.0), isnan(_6906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6906, float2(0.0), isnan(_6906)), level(0.0)).x;
    float2 _6914 = float2(_2219, _2129);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6914, float2(0.0), isnan(_6914)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6914, float2(0.0), isnan(_6914)), level(0.0)).x;
    float2 _6922 = float2(_2059, _1981);
    float _2225 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6922, float2(0.0), isnan(_6922)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6922, float2(0.0), isnan(_6922)), level(0.0)).x;
    float3 _6931 = float3(_1973, _1975, _2153);
    float _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6931, float3(0.0), isnan(_6931)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6931, float3(0.0), isnan(_6931)), level(0.0)).x;
    float3 _6942 = float3(_1973, _1975, _2153);
    float4 _2230 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6942, float3(0.0), isnan(_6942)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6942, float3(0.0), isnan(_6942)), level(0.0)).xyzw;
    float _2232 = _2230.x;
    float _2234 = _2230.y;
    float _2236 = _2230.z;
    float _2238 = _2230.w;
    float2 _6958 = float2(_1957, _1961);
    float3 _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6958, float2(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6958, float2(0.0), isnan(_6958)), level(0.0)).xyz;
    float _2244 = _2242.x;
    float _2246 = _2242.y;
    float _2248 = _2242.z;
    float _2250 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2252 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2254 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2250);
    float _2256 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2252);
    float _2258 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2254);
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2262 = _2260 + _1807;
    float _2264 = _2262 * _1947;
    float _2266 = _2264 * 0.5;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2270 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2268);
    float _2272 = 1.0 / _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = _2272 * _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2280 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2278);
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2284 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2282);
    float _2286 = 1.0 / _2280;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2290 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2288);
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2294 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2292);
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2298 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2296);
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2302 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2300);
    float _2304 = 1.0 / _2290;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2308 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2306);
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2312 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2310);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2316 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2314);
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2320 = -_2276;
    float _2322 = fma(_2286, _2318, _2320);
    float _2324 = 1.0 / _2294;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2328 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2326);
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2332 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2330);
    float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2336 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2334);
    bool _2338 = _2322 >= 0.0;
    bool _2340 = isnan(_2322);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan(0.0);
    bool _2346 = _2342 || _2344;
    float _2348 = 1.0 / _2284;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = -_2276;
    float _2354 = fma(_2324, _2350, _2352);
    float _2356 = 1.0 / _2308;
    float _2358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2360 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2358);
    float _2362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2364 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2362);
    float _2366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2368 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2366);
    float _2370 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2372 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2370);
    float _2374 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2376 = -_2276;
    float _2378 = fma(_2348, _2374, _2376);
    float _2380 = 1.0 / _2328;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2388 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2386);
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2392 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2390);
    bool _2394 = _2378 >= 0.0;
    bool _2396 = isnan(_2378);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2406 = -_2276;
    float _2408 = fma(_2304, _2404, _2406);
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2412 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2410);
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2416 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2414);
    bool _2418 = !_2402;
    float _2420 = _2418 ? 0.0 : 2.0;
    float _2422 = 1.0 / _2336;
    bool _2424 = _2408 >= 0.0;
    bool _2426 = isnan(_2408);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan(0.0);
    bool _2432 = _2428 || _2430;
    float _2434 = float(_2432);
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2438 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2436);
    bool _2440 = !_2346;
    float _2442 = _2440 ? 0.0 : 2.0;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2446 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2444);
    float _2448 = _2442 + _2434;
    bool _2450 = _2354 >= 0.0;
    bool _2452 = isnan(_2354);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = float(_2458);
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2464 = -_2276;
    float _2466 = fma(_2356, _2462, _2464);
    float _2468 = 1.0 / _2388;
    float _2470 = _2448 + _2420;
    float _2472 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2474 = fma(_2203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2472);
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2478 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2476);
    bool _2480 = _2466 >= 0.0;
    bool _2482 = isnan(_2466);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan(0.0);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = _2470 + _2460;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2496 = -_2276;
    float _2498 = fma(_2380, _2494, _2496);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2502 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2500);
    float _2504 = 1.0 / _2298;
    float _2506 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2508 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2506);
    float _2510 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2512 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2510);
    float _2514 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2516 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2514);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2520 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2518);
    float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2524 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2522);
    float _2526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2528 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2526);
    float _2530 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2532 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2530);
    float _2534 = 1.0 / _2446;
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2538 = -_2276;
    float _2540 = fma(_2504, _2536, _2538);
    float _2542 = 1.0 / _2532;
    bool _2544 = _2540 >= 0.0;
    bool _2546 = isnan(_2540);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = _2492 + _2554;
    float _2558 = 1.0 / _2302;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2562 = -_2276;
    float _2564 = fma(_2558, _2560, _2562);
    bool _2566 = _2564 >= 0.0;
    bool _2568 = isnan(_2564);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan(0.0);
    bool _2574 = _2570 || _2572;
    bool _2576 = !_2574;
    float _2578 = _2576 ? 0.0 : 2.0;
    float _2580 = _2556 + _2578;
    float _2582 = 1.0 / _2312;
    float _2584 = _2580 + _2490;
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2588 = -_2276;
    float _2590 = fma(_2582, _2586, _2588);
    bool _2592 = _2590 >= 0.0;
    bool _2594 = isnan(_2590);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan(0.0);
    bool _2600 = _2596 || _2598;
    float _2602 = 1.0 / _2316;
    float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2606 = -_2276;
    float _2608 = fma(_2602, _2604, _2606);
    bool _2610 = _2608 >= 0.0;
    bool _2612 = isnan(_2608);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan(0.0);
    bool _2618 = _2614 || _2616;
    bool _2620 = !_2600;
    float _2622 = _2620 ? 0.0 : 2.0;
    bool _2624 = !_2618;
    float _2626 = _2624 ? 0.0 : 2.0;
    float _2628 = _2584 + _2622;
    bool _2630 = _2498 >= 0.0;
    bool _2632 = isnan(_2498);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2644 = -_2276;
    float _2646 = fma(_2422, _2642, _2644);
    float _2648 = _2628 + _2626;
    float _2650 = 1.0 / _2360;
    float _2652 = _2648 + _2640;
    float _2654 = 1.0 / _2332;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2658 = -_2276;
    float _2660 = fma(_2650, _2656, _2658);
    bool _2662 = _2646 >= 0.0;
    bool _2664 = isnan(_2646);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = -_2276;
    float _2678 = fma(_2654, _2674, _2676);
    bool _2680 = _2678 >= 0.0;
    bool _2682 = isnan(_2678);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan(0.0);
    bool _2688 = _2684 || _2686;
    bool _2690 = !_2688;
    float _2692 = _2690 ? 0.0 : 2.0;
    float _2694 = _2652 + _2692;
    bool _2696 = _2660 >= 0.0;
    bool _2698 = isnan(_2660);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan(0.0);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = _2694 + _2672;
    float _2710 = 1.0 / _2368;
    float _2712 = _2708 + _2706;
    float _2714 = 1.0 / _2364;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2718 = -_2276;
    float _2720 = fma(_2710, _2716, _2718);
    bool _2722 = _2720 >= 0.0;
    bool _2724 = isnan(_2720);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan(0.0);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2736 = -_2276;
    float _2738 = fma(_2468, _2734, _2736);
    float _2740 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2742 = -_2276;
    float _2744 = fma(_2714, _2740, _2742);
    bool _2746 = _2744 >= 0.0;
    bool _2748 = isnan(_2744);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan(0.0);
    bool _2754 = _2750 || _2752;
    bool _2756 = !_2754;
    float _2758 = _2756 ? 0.0 : 2.0;
    float _2760 = _2712 + _2758;
    float _2762 = 1.0 / _2372;
    float _2764 = _2760 + _2732;
    float _2766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2768 = -_2276;
    float _2770 = fma(_2762, _2766, _2768);
    bool _2772 = _2770 >= 0.0;
    bool _2774 = isnan(_2770);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = 1.0 / _2384;
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2786 = -_2276;
    float _2788 = fma(_2782, _2784, _2786);
    bool _2790 = _2788 >= 0.0;
    bool _2792 = isnan(_2788);
    bool _2794 = _2790 || _2792;
    bool _2796 = isnan(0.0);
    bool _2798 = _2794 || _2796;
    bool _2800 = !_2780;
    float _2802 = _2800 ? 0.0 : 2.0;
    bool _2804 = !_2798;
    float _2806 = _2804 ? 0.0 : 2.0;
    float _2808 = _2764 + _2802;
    bool _2810 = _2738 >= 0.0;
    bool _2812 = isnan(_2738);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan(0.0);
    bool _2818 = _2814 || _2816;
    float _2820 = float(_2818);
    float _2822 = _2808 + _2806;
    float _2824 = _2822 + _2820;
    float _2826 = 1.0 / _2392;
    float _2828 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2830 = -_2276;
    float _2832 = fma(_2826, _2828, _2830);
    bool _2834 = _2832 >= 0.0;
    bool _2836 = isnan(_2832);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = 1.0 / _2412;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2848 = -_2276;
    float _2850 = fma(_2844, _2846, _2848);
    bool _2852 = !_2842;
    float _2854 = _2852 ? 0.0 : 2.0;
    bool _2856 = _2850 >= 0.0;
    bool _2858 = isnan(_2850);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan(0.0);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = _2824 + _2854;
    float _2870 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2872 = -_2276;
    float _2874 = fma(_2534, _2870, _2872);
    float _2876 = 1.0 / _2416;
    float _2878 = _2868 + _2866;
    bool _2880 = _2874 >= 0.0;
    bool _2882 = isnan(_2874);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = float(_2888);
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2894 = -_2276;
    float _2896 = fma(_2876, _2892, _2894);
    bool _2898 = _2896 >= 0.0;
    bool _2900 = isnan(_2896);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    float _2910 = _2878 + _2908;
    float _2912 = 1.0 / _2438;
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2916 = -_2276;
    float _2918 = fma(_2912, _2914, _2916);
    bool _2920 = _2918 >= 0.0;
    bool _2922 = isnan(_2918);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.0);
    bool _2928 = _2924 || _2926;
    bool _2930 = !_2928;
    float _2932 = _2930 ? 0.0 : 2.0;
    float _2934 = _2910 + _2932;
    float _2936 = 1.0 / _2474;
    float _2938 = _2934 + _2890;
    float _2940 = 1.0 / _2520;
    float _2942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2944 = -_2276;
    float _2946 = fma(_2936, _2942, _2944);
    bool _2948 = _2946 >= 0.0;
    bool _2950 = isnan(_2946);
    bool _2952 = _2948 || _2950;
    bool _2954 = isnan(0.0);
    bool _2956 = _2952 || _2954;
    float _2958 = 1.0 / _2478;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2962 = -_2276;
    float _2964 = fma(_2940, _2960, _2962);
    float _2966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2968 = -_2276;
    float _2970 = fma(_2958, _2966, _2968);
    bool _2972 = _2970 >= 0.0;
    bool _2974 = isnan(_2970);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    float _2982 = 1.0 / _2502;
    float _2984 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2986 = -_2276;
    float _2988 = fma(_2982, _2984, _2986);
    bool _2990 = _2988 >= 0.0;
    bool _2992 = isnan(_2988);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan(0.0);
    bool _2998 = _2994 || _2996;
    float _3000 = 1.0 / _2508;
    bool _3002 = !_2998;
    float _3004 = _3002 ? 0.0 : 3.0;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3008 = -_2276;
    float _3010 = fma(_3000, _3006, _3008);
    bool _3012 = _3010 >= 0.0;
    bool _3014 = isnan(_3010);
    bool _3016 = _3012 || _3014;
    bool _3018 = isnan(0.0);
    bool _3020 = _3016 || _3018;
    float _3022 = 1.0 / _2512;
    bool _3024 = !_3020;
    float _3026 = _3024 ? 0.0 : 3.0;
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3030 = -_2276;
    float _3032 = fma(_3022, _3028, _3030);
    bool _3034 = _3032 >= 0.0;
    bool _3036 = isnan(_3032);
    bool _3038 = _3034 || _3036;
    bool _3040 = isnan(0.0);
    bool _3042 = _3038 || _3040;
    float _3044 = 1.0 / _2516;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3048 = -_2276;
    float _3050 = fma(_3044, _3046, _3048);
    bool _3052 = _3050 >= 0.0;
    bool _3054 = isnan(_3050);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan(0.0);
    bool _3060 = _3056 || _3058;
    bool _3062 = !_2980;
    float _3064 = _3062 ? 0.0 : 3.0;
    bool _3066 = _2964 >= 0.0;
    bool _3068 = isnan(_2964);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    bool _3076 = !_3060;
    float _3078 = _3076 ? 0.0 : 3.0;
    float _3080 = _3064 + _3004;
    bool _3082 = !_3042;
    float _3084 = _3082 ? 0.0 : 3.0;
    bool _3086 = !_3074;
    float _3088 = _3086 ? 0.0 : 3.0;
    float _3090 = _3080 + _3026;
    float _3092 = _3090 + _3084;
    bool _3094 = !_2956;
    float _3096 = _3094 ? 0.0 : 2.0;
    float _3098 = _3092 + _3078;
    float _3100 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3102 = _2938 + _3096;
    float _3104 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2256);
    float _3106 = _3098 + _3088;
    float _3108 = 1.0 / _2524;
    float _3110 = _3102 * 0.02857142873108386993408203125;
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    float _3114 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3104);
    float _3116 = _3114 + _1895;
    out.gl_Position.x = _1951;
    out.gl_Position.y = _1959;
    out.gl_Position.z = _3114;
    out.gl_Position.w = _1895;
    float _3118 = 1.0 / _2528;
    float _3120 = _3116 * 0.5;
    out.m_72.z = _3120;
    out.m_72.w = _1895;
    float _3122 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3124 = -_2276;
    float _3126 = fma(_3108, _3122, _3124);
    float _3128 = exp2(_3100);
    bool _3130 = _3126 >= 0.0;
    bool _3132 = isnan(_3126);
    bool _3134 = _3130 || _3132;
    bool _3136 = isnan(0.0);
    bool _3138 = _3134 || _3136;
    float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3142 = -_2276;
    float _3144 = fma(_3118, _3140, _3142);
    float _3146 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3148 = -_2276;
    float _3150 = fma(_2542, _3146, _3148);
    bool _3152 = !_3138;
    float _3154 = _3152 ? 0.0 : 3.0;
    bool _3156 = _3144 >= 0.0;
    bool _3158 = isnan(_3144);
    bool _3160 = _3156 || _3158;
    bool _3162 = isnan(0.0);
    bool _3164 = _3160 || _3162;
    bool _3166 = _3150 >= 0.0;
    bool _3168 = isnan(_3150);
    bool _3170 = _3166 || _3168;
    bool _3172 = isnan(0.0);
    bool _3174 = _3170 || _3172;
    float _3176 = _3106 + _3154;
    bool _3178 = !_3164;
    float _3180 = _3178 ? 0.0 : 3.0;
    float _3182 = -_3128;
    float _3184 = _3182 + 1.0;
    bool _3186 = !_3174;
    float _3188 = _3186 ? 0.0 : 5.0;
    float _3190 = _3176 + _3180;
    float _3192 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3194 = _3190 + _3188;
    float _3196 = _3192 * _2227;
    float _3198 = -_3192;
    float _3200 = _3198 + 1.0;
    float _3202 = _3194 * 0.14285714924335479736328125;
    float _3204 = precise::clamp(_3202, 0.0, 1.0);
    float _3206 = _2238 * _3196;
    float _3208 = _2248 * _3196;
    float _3210 = _3112 * _3204;
    float _3212 = fma(_2244, _3206, _2232);
    float _3214 = _3210 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3216 = fma(_2246, _3206, _2234);
    float _3218 = _2238 * _3200;
    float _3220 = fma(_2238, _3208, _2236);
    float _3222 = _3214 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.x = _3212;
    out.m_74.y = _3216;
    out.m_74.z = _3220;
    out.m_74.w = _3218;
    out.m_53.x = _3222;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1491 = false;
    bool _459 = false;
    bool _311 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_46.w;
    float _90 = in.m_48.w;
    float _92 = trunc(_88);
    int _95 = int(_92);
    float _97 = -_90;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _99;
    bool _103 = _95 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_95);
    float _109 = _99;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _105;
    if (!_103)
    {
        out.m_53.x = 0.0;
    }
    int _113 = 0;
    if (!_103)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3291 = as_type<float>(_117);
        out.gl_Position.z = _3291;
    }
    if (!_103)
    {
        return out;
    }
    bool _121 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_90);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = in.m_55.x;
    float _133 = float(_95);
    bool _135 = _99 >= _133;
    bool _137 = !_129;
    bool _139 = _135 || _137;
    if (_139)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _107;
    if (_139)
    {
        out.m_53.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _119 = as_type<int>(_143);
    }
    int _145 = _119;
    out.m_57.x = _131;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3350 = as_type<float>(_145);
        out.gl_Position.z = _3350;
    }
    if (_139)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / _133;
    float _151 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _153 = in.m_62.w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _151;
    if (!_163)
    {
        float _181 = _151 * _151;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    int _193 = as_type<int>(_147) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_147) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_163;
    float _211 = _191;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _151 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _151);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_163;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _151 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _179 = _265;
    }
    float _267 = _179;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_267, _165, _271);
    float _279 = fma(_267, _167, _273);
    float _281 = fma(_267, _169, _275);
    float _283 = _99 * _149;
    float _285 = fma(_277, _153, _171);
    float _287 = fma(_279, _153, _173);
    float _289 = fma(_281, _153, _175);
    bool _291 = !_269;
    float _293 = _283;
    float _309;
    if (!_291)
    {
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _297 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        _309 = _283;
    }
    _311 = false;
    float _313 = _309;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    bool _319 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_313);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _313 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = 1.0 / _337;
    bool _349 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_313);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _363 = 1.0 / _341;
    float _365 = _317 * _347;
    bool _367 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_313);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = in.m_62.x;
    float _385 = in.m_62.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = _377 * _345;
    float _393 = -_377;
    float _395 = _393 + 1.0;
    float _397 = fma(_381, _365, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = fma(_389, _365, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _401 = _333 * _363;
    float _403 = _359 * _395;
    float _405 = -_359;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = _397 * _403;
    float _419 = _399 * _403;
    float _421 = fma(_411, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_415, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _429 = fma(_421, _391, _425);
    float _431 = fma(_423, _391, _427);
    float _433 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[145].x, _429);
    float _435 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[145].y, _431);
    float _437 = _433 * _383;
    float _439 = _435 * _385;
    bool _441 = !_361;
    float _457;
    if (!_441)
    {
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _445 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _283;
    }
    _459 = false;
    float _461 = _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _479;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _485 = 1.0 / _481;
    float _487 = -_477;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _491;
    float _495 = _465 * _485;
    bool _497 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_461);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = fma(_493, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = _507 * _489;
    float _521 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = fma(_517, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = _513 * _519;
    float _531 = _521 * _519;
    float _533 = _523 * _519;
    float _535 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _531);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _539 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _541 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].x, _535);
    float _543 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].y, _537);
    float _545 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].z, _539);
    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _553;
    out.m_64.y = _555;
    out.m_64.z = _557;
    bool _559 = !_483;
    if (!_559)
    {
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _563 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].z, _99);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _293 = _573;
    }
    float _575 = _293;
    float _577 = in.m_55.w;
    float _579 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _581 = log2(_579);
    float _583 = _131 * 2.0;
    float _585 = in.m_55.y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _587;
    float _591 = in.m_55.z;
    bool _593 = _131 > 0.5;
    float _595 = floor(_583);
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    float _609 = _581 * _99;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _613 = _611 != 0;
    float _615 = 1.0 / _589;
    float _617 = _287 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _619 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].x, _617);
    bool _621 = _577 > 0.5;
    float _623 = _287 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = exp2(_609);
    float _627 = -_203;
    int _629 = _593 ? as_type<int>(_627) : as_type<int>(_203);
    float _631 = _287 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _633 = _585 > 0.5;
    float _635 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    bool _637 = _591 > 0.5;
    float _639 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    bool _641 = !_599;
    float _643 = _641 ? _203 : as_type<float>(_629);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _649 = -_207;
    int _651 = _633 ? as_type<int>(_649) : as_type<int>(_207);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _655 = 1.0 + _653;
    bool _657 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(1.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _635);
    float _669 = -_203;
    int _671 = _637 ? as_type<int>(_669) : as_type<int>(_203);
    float _673 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _619);
    bool _675 = !_603;
    float _677 = _675 ? _207 : as_type<float>(_651);
    float _679 = -_625;
    float _681 = _679 + 1.0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _693 = _691 != 0;
    float _695 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _639);
    bool _697 = !_607;
    float _699 = _697 ? _203 : as_type<float>(_671);
    float _701 = _591 * 2.0;
    bool _703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = 1.0 / _655;
    float _715 = -_207;
    int _717 = _621 ? as_type<int>(_715) : as_type<int>(_207);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _721 = _575 + _719;
    bool _723 = _595 > 0.0;
    float _725 = _585 + _591;
    bool _727 = !_613;
    float _729 = _727 ? _207 : as_type<float>(_717);
    float _731 = -_677;
    float _733 = _731 + 0.5;
    float _735 = floor(_701);
    float _737 = _711 ? _681 : 0.0;
    float _739 = _725 + (-1.0);
    bool _741 = _595 >= 0.0;
    bool _743 = isnan(_595);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = _585 * 2.0;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _755 = _749 ? 0 : 1;
    float _757 = 1.0 / _647;
    if (_665)
    {
        float _759 = _737 * _713;
        _109 = _759;
    }
    float _761 = _109;
    bool _763 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _765 = isnan(_575);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _783 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _785 = isnan(_575);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = _699 + 0.5;
    float _797 = floor(_751);
    bool _799 = _735 >= 0.0;
    bool _801 = isnan(_735);
    bool _803 = _799 || _801;
    bool _805 = isnan(0.0);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _811 = _575 + _809;
    bool _813 = _735 > 0.0;
    float _815 = _643 + 0.5;
    int _817 = _807 ? 0 : 1;
    float _819 = _811 * _615;
    bool _821 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _823 = isnan(_575);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _131 + _585;
    float _835 = _721 * _757;
    float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _839 = _833 + (-1.0);
    float _841 = fma(_777, _819, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _843 = fma(_781, _835, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _845 = _797 > 0.0;
    float _847 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _849 = _797 >= 0.0;
    bool _851 = isnan(_797);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = -_773;
    float _861 = _859 + 1.0;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _873 = _831 * _861;
    float _875 = -_831;
    float _877 = _875 + 1.0;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _883;
    float _887 = fma(_867, _819, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _891 = fma(_881, _835, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _893 = fma(_885, _819, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _895 = _793 * _877;
    float _897 = fma(_871, _835, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _899 = _733 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _901 = -_729;
    float _903 = _901 + 0.5;
    float _905 = _887 * _895;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _909 = _795 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _911 = -_793;
    float _913 = _911 + 1.0;
    float _915 = _893 * _895;
    float _917 = _841 * _895;
    float _919 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _921 = _899 * _837;
    float _923 = _903 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _925 = _909 * _863;
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].x, _905);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].y, _915);
    float _931 = _673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _933 = _919 * _889;
    float _935 = fma(_897, _873, _927);
    float _937 = fma(_891, _873, _929);
    bool _939 = !_685;
    int _941 = _939 ? 0 : 1;
    float _943 = _923 * _907;
    float _945 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _949 = _931 + _947;
    int _951 = ~_755;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].z, _917);
    int _959 = _955;
    if (!_723)
    {
        int _961 = ~_755;
        int _963 = _961 + 1;
        _959 = _963;
    }
    int _965 = _959;
    out.m_66.x = _933;
    out.m_66.y = _921;
    out.m_66.z = _925;
    out.m_66.w = _943;
    float _967 = _695 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _969 = fma(_843, _873, _957);
    int _971 = _857 ? 0 : 1;
    float _973 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].x, _935);
    bool _975 = !_689;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].y, _937);
    int _981 = ~_971;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    float _987 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].z, _969);
    int _989 = _985;
    if (!_845)
    {
        int _991 = ~_971;
        int _993 = _991 + 1;
        _989 = _993;
    }
    int _995 = _989;
    float _997 = in.m_68.x;
    float _999 = in.m_68.y;
    float _1001 = in.m_68.z;
    int _1003 = ~_817;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    int _1009 = abs(_941);
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1013 = _945 + _1011;
    float _1015 = _949 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = float(_965);
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1021 = _967 + _1019;
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    int _1025 = abs(_977);
    int _1027 = _1007;
    if (!_813)
    {
        int _1029 = ~_817;
        int _1031 = _1029 + 1;
        _1027 = _1031;
    }
    int _1033 = _1027;
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1023);
    float _1037 = float(_1025);
    bool _1039 = _1035 >= 0.0;
    float _1041 = _949 * _949;
    float _1043 = _1037 * _1017;
    float _1045 = float(_1009);
    float _1047 = fma(_1013, _1013, _1041);
    float _1049 = float(_1033);
    float _1051 = _1043 * (-2.0);
    float _1053 = fma(_1021, _1021, _1047);
    float _1055 = _1045 * _1049;
    float _1057 = fma(_753, _1051, _753);
    float _1059 = fma(_1051, _999, _999);
    float _1061 = _1051;
    float _1063 = _1001;
    if (_1039)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1065 = _1061;
    float _1067 = rsqrt(_1053);
    float _1069 = _1055 * (-2.0);
    float _1071 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1073 = !_693;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = as_type<int>(_1065);
    if (_1039)
    {
        float _1079 = _1065 * 5.0;
        _1077 = as_type<int>(_1079);
    }
    int _1081 = _1077;
    float _1083 = fma(_1069, _997, _997);
    float _1085 = fma(_847, _1069, _847);
    float _1087 = _585 + (-0.5);
    float _1089 = _973 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1091 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1059);
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1097 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1101 = abs(_1075);
    float _1103 = _131 + (-0.5);
    float _1105 = fma(_1057, _761, _1093);
    float _1107 = _949 * _1067;
    out.m_70.x = _1095;
    out.m_70.y = _1097;
    out.m_70.z = _1099;
    float _1109 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1083);
    float _1111 = float(_1101);
    float _1113 = _1013 * _1067;
    if (_1039)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4886 = as_type<float>(_1081);
        out.gl_Position.z = _4886;
    }
    float _1115 = _1021 * _1067;
    float _1117 = -_1107;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    if (_1039)
    {
        out.m_53.x = 0.0;
    }
    if (_1039)
    {
        return out;
    }
    float _1121 = -_1107;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _1125 = -_1113;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _1129 = _1105 * 0.15915493667125701904296875;
    float _1131 = float(_995);
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1135 = _1123 + _1133;
    float _1137 = -_1115;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1127 + _1141;
    float _1145 = -_1113;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1149 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1151 = _1119 * _1119;
    float _1153 = _1111 * _1131;
    float _1155 = _131 + _591;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1159 = _1139 + _1157;
    float _1161 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1149);
    float _1163 = fma(_1085, _761, _1109);
    float _1165 = fma(_1147, _1147, _1151);
    float _1167 = -_1115;
    float _1169 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1171 = _1155 + (-1.0);
    float _1173 = _1153 * (-2.0);
    float _1175 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1161);
    float _1177 = fma(_1169, _1169, _1165);
    float _1179 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1181 = fma(_1173, _1001, _1001);
    float _1183 = _591 + (-0.5);
    bool _1185 = _1175 >= 0.0;
    float _1187 = fma(_1179, _1173, _1179);
    float _1189 = sqrt(_1177);
    float _1191 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1181);
    float _1193 = _1163 * 0.15915493667125701904296875;
    float _1195 = fma(_1187, _761, _1191);
    float _1197 = _1129 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1195 * 0.15915493667125701904296875;
    if (_1185)
    {
        _1063 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1203 = _1063;
    int _1205 = as_type<int>(_1203);
    if (_1185)
    {
        out.m_53.x = 0.0;
    }
    float _1207 = _1129 * 6.283185482025146484375;
    float _1209 = cos(_1207);
    if (_1185)
    {
        float _1211 = _1203 * 5.0;
        _1205 = as_type<int>(_1211);
    }
    int _1213 = _1205;
    float _1215 = _1067 * _1189;
    if (_1185)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5074 = as_type<float>(_1213);
        out.gl_Position.z = _5074;
    }
    float _1217 = _1193 * 6.283185482025146484375;
    float _1219 = sin(_1217);
    float _1221 = _1193 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1201 * 6.283185482025146484375;
    float _1227 = sin(_1225);
    if (_1185)
    {
        return out;
    }
    float _1229 = _1201 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1235 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1237 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1239 = _1223 * _1209;
    float _1241 = _1215 * _1233;
    float _1243 = _1235 * _1241;
    float _1245 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = _1219 * _1199;
    float _1249 = _1215 * _1245;
    float _1251 = _1223 * _1199;
    float _1253 = _1231 * _1243;
    float _1255 = fma(_1227, _1239, _1247);
    float _1257 = _1237 * _1249;
    float _1259 = _1199 * _1231;
    float _1261 = _1223 * _1253;
    float _1263 = _1209 * _1231;
    float _1265 = _1219 * _1209;
    float _1267 = -_1243;
    float _1269 = _1227 * _1267;
    float _1271 = fma(_1255, _1257, _1261);
    float _1273 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1275 = _1273 * 0.5;
    float _1277 = -_1265;
    float _1279 = fma(_1227, _1251, _1277);
    float _1281 = -_1251;
    float _1283 = fma(_1227, _1265, _1281);
    float _1285 = _1219 * _1253;
    float _1287 = fma(_1263, _1257, _1269);
    float _1289 = fma(_1279, _1275, _1271);
    float _1291 = fma(_1227, _1247, _1239);
    float _1293 = fma(_1283, _1257, _1285);
    float _1295 = fma(_1259, _1275, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1301 = fma(_1291, _1275, _1293);
    float _1303 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1299);
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1303);
    float _1311 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1305);
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1307);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1309);
    float _1317 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1319 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1321 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1323 = _945 + _1317;
    float _1325 = _967 + _1319;
    float _1327 = _931 + _1321;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1331 = _1323 + _1329;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1335 = _1325 + _1333;
    float _1337 = _1331 * _1331;
    float _1339 = _1335 * _1335;
    float _1341 = _1337 + _1339;
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1301;
    float _1349 = _1303;
    float _1351 = _1323;
    float _1353 = _1337;
    float _1355 = _1325;
    float _1357 = _1321;
    if (!_1345)
    {
        _1347 = _1323;
    }
    float _1359 = _1347;
    float _1361 = _1359;
    if (!_1345)
    {
        _1349 = _1339;
    }
    float _1363 = _1349;
    float _1365 = _1363;
    if (!_1345)
    {
        _1351 = _1327;
    }
    float _1367 = _1351;
    bool _1369 = !_1345;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1343 + _1375;
        float _1379 = rsqrt(_1341);
        float _1381 = _1377 * _1373;
        float _1383 = _1327 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = _1381 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = cos(_1391);
        float _1395 = fma(_1389, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1397 = _1379 * _1395;
        float _1399 = _1393 + (-1.0);
        float _1401 = fma(_1331, _1397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1403 = fma(_1335, _1397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1405 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1409 = _1401 + _1407;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1413 = _1403 + _1411;
        float _1415 = fma(_1327, _1393, _1405);
        float _1417 = _1409 * _1409;
        float _1419 = _1413 * _1413;
        _1371 = _1415;
        _1353 = _1417;
        _1365 = _1419;
        _1361 = _1401;
        _1355 = _1403;
        _1357 = _1385;
    }
    float _1421 = _1371;
    float _1423 = _1353;
    float _1425 = _1365;
    float _1427 = _1361;
    float _1429 = _1355;
    float _1431 = _1357;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1435 = _1421 + _1433;
    float _1437 = fma(_1435, _1435, _1423);
    float _1439 = _1437 + _1425;
    float _1441 = sqrt(_1439);
    bool _1443 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1445 = isnan(_1441);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1451 = _1447 || _1449;
    float _1453 = _1437;
    float _1455 = _1431;
    if (!_1451)
    {
        _1453 = 1.0;
    }
    float _1457 = _1453;
    bool _1459 = !_1451;
    float _1461 = _1457;
    if (!_1459)
    {
        bool _1463 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1465 = isnan(_1441);
        bool _1467 = _1463 || _1465;
        bool _1469 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1471 = _1467 || _1469;
        if (!_1471)
        {
            float _1473 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1475 = _1441 + _1473;
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1483 = _1481 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1485 = 1.0 / _1479;
            float _1487 = _1475 * _1485;
            float _1489 = fma(_1487, _1483, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1461 = _1489;
            _1491 = true;
        }
        else
        {
            bool _1493 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1495 = isnan(_1441);
            bool _1497 = _1493 || _1495;
            bool _1499 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1501 = _1497 || _1499;
            if (!_1501)
            {
                float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1505 = _1441 + _1503;
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1507 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1515 = 1.0 / _1509;
                float _1517 = _1505 * _1515;
                float _1519 = fma(_1517, _1513, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1461 = _1519;
                _1491 = true;
            }
            else
            {
                _1461 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1491 = false;
    float _1521 = _1461;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1525 = _1427 + _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1529 = _1429 + _1527;
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1543 = _1421 + _1541;
    float _1545 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1547 = fma(_1529, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1549 = fma(_1543, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1551 = -_1113;
    float _1553 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1545);
    float _1555 = -_1115;
    float _1557 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1547);
    float _1559 = -_1107;
    float _1561 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1549);
    float _1563 = _1561;
    float _1565 = _1553;
    float _1567 = _1557;
    float _1569 = _1545;
    float _1571 = _1549;
    if (!_1539)
    {
        float _1573 = _1135 * _1135;
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1577 = -_967;
        float _1579 = _1577 + _1547;
        float _1581 = -_931;
        float _1583 = _1581 + _1549;
        float _1585 = fma(_1143, _1143, _1573);
        float _1587 = fma(_1159, _1159, _1585);
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1591 = sqrt(_1587);
        float _1593 = 1.0 / _1215;
        float _1595 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1597 = precise::min(_1591, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1599 = _1597 * _1575;
        float _1601 = _1599 * _1593;
        float _1603 = -_945;
        float _1605 = _1603 + _1545;
        float _1607 = _1595 * _1601;
        float _1609 = _1579 * _1601;
        float _1611 = fma(_1605, _1607, _1127);
        float _1613 = fma(_1583, _1607, _1123);
        float _1615 = fma(_1595, _1609, _1139);
        _1563 = _1613;
        _1565 = _1611;
        _1567 = _1615;
    }
    float _1617 = _1563;
    float _1619 = _1565;
    float _1621 = _1567;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1625 = _1617 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1629 = _1619 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1633 = _1621 + _1631;
    float _1635 = _1625 * _1625;
    float _1637 = fma(_1629, _1629, _1635);
    float _1639 = fma(_1633, _1633, _1637);
    float _1641 = rsqrt(_1639);
    float _1643 = sqrt(_1639);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1647 = _1629 * _1645;
    float _1649 = _1633 * _1645;
    float _1651 = _1647 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 + _1653;
    float _1657 = sqrt(_1655);
    bool _1659 = _1657 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = _1657 + _1661;
    float _1665 = _1641;
    float _1667 = _1655;
    float _1669 = _1663;
    float _1671 = _1625;
    if (_1659)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1673;
    }
    float _1675 = _1665;
    if (_1659)
    {
        float _1677 = rsqrt(_1655);
        _1667 = _1677;
    }
    float _1679 = _1667;
    if (_1659)
    {
        float _1681 = _1663 * _1675;
        _1669 = _1681;
    }
    float _1683 = _1669;
    if (_1659)
    {
        float _1685 = _1683 * 0.15915493667125701904296875;
        _1455 = _1685;
    }
    float _1687 = _1455;
    float _1689 = _1633;
    if (_1659)
    {
        float _1691 = _1687 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        _1689 = _1693;
    }
    float _1695 = _1689;
    float _1697 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1699 = precise::max(0.0, _1697);
    float _1701 = _1675;
    float _1703 = _1699;
    if (_1659)
    {
        float _1705 = _1687 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        _1701 = _1707;
    }
    float _1709 = _1701;
    float _1711 = -_1645;
    float _1713 = -_1699;
    float _1715 = fma(_1625, _1711, _1713);
    if (_1659)
    {
        float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1717;
    }
    float _1719 = _1671;
    float _1721 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1723 = _1695;
    float _1725 = _1719;
    if (_1659)
    {
        float _1727 = fma(_1695, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1569 = _1727;
    }
    float _1729 = _1569;
    float _1731 = _1729;
    if (!_1659)
    {
        _1723 = _1647;
    }
    float _1733 = _1723;
    float _1735 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1721);
    float _1737 = _1733;
    if (!_1659)
    {
        _1725 = _1715;
    }
    float _1739 = _1725;
    float _1741 = _1739;
    float _1743 = _1709;
    if (_1659)
    {
        float _1745 = _1709 + (-1.0);
        _1703 = _1745;
    }
    float _1747 = _1703;
    float _1749 = _1747;
    if (_1659)
    {
        float _1751 = _1679 * _1729;
        _1731 = _1751;
    }
    float _1753 = _1731;
    float _1755 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1757 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    if (_1659)
    {
        float _1759 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1759;
    }
    float _1761 = _1571;
    float _1763 = _1761;
    if (_1659)
    {
        float _1765 = _1647 * _1753;
        _1737 = _1765;
    }
    float _1767 = _1737;
    if (!_1659)
    {
        _1749 = _1649;
    }
    float _1769 = _1749;
    float _1771 = _1769;
    if (_1659)
    {
        float _1773 = _1649 * _1753;
        _1771 = _1773;
    }
    float _1775 = _1771;
    if (_1659)
    {
        float _1777 = fma(_1715, _1709, _1761);
        _1741 = _1777;
    }
    float _1779 = _1741;
    if (!_1659)
    {
        _1763 = _1651;
    }
    float _1781 = _1763;
    float _1783 = _1781;
    if (_1659)
    {
        float _1785 = _1767 * _1767;
        _1783 = _1785;
    }
    float _1787 = _1783;
    if (!_1659)
    {
        _1743 = _1653;
    }
    float _1789 = _1743;
    float _1791 = _1789;
    if (_1659)
    {
        float _1793 = _1775 * _1775;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1755);
    float _1799 = fma(_1779, _1779, _1787);
    float _1801 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1803 = _1799 + _1795;
    float _1805 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1797);
    float _1807 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1811 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1809);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = rsqrt(_1803);
    float _1817 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1819 = _1807 * 0.5;
    float _1821 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1823 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1825 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1827 = fma(_1817, -0.5, _1819);
    float _1829 = -_1813;
    float _1831 = _1829 + 1.0;
    float _1833 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1823);
    float _1835 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1821);
    float _1837 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1801);
    float _1839 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1825);
    float _1841 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1843 = abs(_1831);
    float _1845 = log2(_1843);
    float _1847 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1835);
    float _1849 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    float _1851 = _1815 * _1767;
    float _1853 = _1815 * _1779;
    float _1855 = _1815 * _1775;
    float _1857 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1861 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1863 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1865 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1867 = -_1859;
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1867);
    float _1871 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1873 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1875 = -_1855;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1869);
    float _1879 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1881 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1865);
    float _1883 = fma(_1877, -0.5, 0.5);
    float _1885 = fma(_1877, 0.5, 0.5);
    float _1887 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1881);
    float _1889 = exp2(_1879);
    float _1891 = _1853 + 1.0;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1887);
    float _1897 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1899 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1901 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1827);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1905 = _1827 + _1903;
    float _1907 = sqrt(_1883);
    float _1909 = -_1897;
    float _1911 = fma(_1909, _1893, 1.0);
    float _1913 = fma(_1885, _1899, -0.212114393711090087890625);
    float _1915 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1917 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1921 = fma(_1885, _1913, 1.570728778839111328125);
    float _1923 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1827);
    float _1925 = -_1853;
    float _1927 = fma(_1889, _1891, _1925);
    float _1929 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1931 = 1.0 / _1895;
    float _1933 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1915);
    float _1935 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1937 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1929);
    float _1939 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1827);
    float _1941 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1933);
    float _1943 = _1907 * 0.636619746685028076171875;
    float _1945 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1937);
    float _1947 = 1.0 / _1807;
    float _1949 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1951 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1941);
    float _1953 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1955 = -_1921;
    float _1957 = fma(_1943, _1955, 1.0);
    float _1959 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1961 = fma(_1927, 0.5, 0.5);
    float _1963 = _1953 + _1807;
    float _1965 = _1951 * _1931;
    float _1967 = _1959 * _1931;
    float _1969 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1827);
    float _1971 = _1963 * 0.5;
    float _1973 = fma(_1965, 0.5, 0.5);
    float _1975 = fma(_1967, -0.5, 0.5);
    float _1977 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1827);
    float _1979 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1971);
    float _1981 = _1827 * _1947;
    float _1983 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1827);
    float _1985 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1827);
    float _1987 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1827);
    float _1989 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1827);
    float _1991 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1827);
    float _1993 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1827);
    float _1995 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1827);
    float _1997 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1827);
    float _1999 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1827);
    float _2001 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1827);
    float _2003 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1827);
    float _2005 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1827);
    float _2007 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1827);
    float _2009 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1827);
    float _2011 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1827);
    float _2013 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1827);
    float _2015 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1827);
    float _2017 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1971);
    float _2019 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1971);
    float _2021 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1971);
    float _2023 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1971);
    float _2025 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1971);
    float _2027 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1971);
    float _2029 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1971);
    float _2031 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1971);
    float _2033 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1971);
    float _2035 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1971);
    float _2037 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1971);
    float _2039 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1971);
    float _2041 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1971);
    float _2043 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1971);
    float _2045 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1971);
    float _2047 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1971);
    float _2049 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1971);
    float _2051 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1971);
    float _2053 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1971);
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2057 = _1971 + _2055;
    float _2059 = _1971 * _1947;
    float _2061 = _1971 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2063 = _1979 * _1947;
    float _2065 = _1977 * _1947;
    float _2067 = _1901 * _1947;
    float _2069 = _2017 * _1947;
    float _2071 = _2057 * _1947;
    float _2073 = _1905 * _1947;
    float2 _6536 = float2(_2063, _2065);
    float _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6536, float2(0.0), isnan(_6536)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6536, float2(0.0), isnan(_6536)), level(0.0)).x;
    float _2077 = _1919 * _1947;
    float2 _6549 = float2(_2069, _2067);
    float _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6549, float2(0.0), isnan(_6549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6549, float2(0.0), isnan(_6549)), level(0.0)).x;
    float _2081 = _1923 * _1947;
    float2 _6560 = float2(_2071, _1981);
    float _2083 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6560, float2(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6560, float2(0.0), isnan(_6560)), level(0.0)).x;
    float2 _6568 = float2(_2059, _2073);
    float _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6568, float2(0.0), isnan(_6568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6568, float2(0.0), isnan(_6568)), level(0.0)).x;
    float _2087 = _2061 * _1947;
    float2 _6579 = float2(_2059, _2077);
    float _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6579, float2(0.0), isnan(_6579)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6579, float2(0.0), isnan(_6579)), level(0.0)).x;
    float _2091 = _2019 * _1947;
    float2 _6590 = float2(_2069, _2081);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6590, float2(0.0), isnan(_6590)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6590, float2(0.0), isnan(_6590)), level(0.0)).x;
    float _2095 = _1939 * _1947;
    float _2097 = _2021 * _1947;
    float2 _6604 = float2(_2087, _1981);
    float _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6604, float2(0.0), isnan(_6604)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6604, float2(0.0), isnan(_6604)), level(0.0)).x;
    float _2101 = _1969 * _1947;
    float2 _6615 = float2(_2091, _2095);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6615, float2(0.0), isnan(_6615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6615, float2(0.0), isnan(_6615)), level(0.0)).x;
    float _2105 = _2023 * _1947;
    float _2107 = _1983 * _1947;
    float2 _6629 = float2(_2097, _2101);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6629, float2(0.0), isnan(_6629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6629, float2(0.0), isnan(_6629)), level(0.0)).x;
    float _2111 = log2(_1911);
    float _2113 = _2025 * _1947;
    float _2115 = _2011 * _1947;
    float2 _6645 = float2(_2105, _1981);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6645, float2(0.0), isnan(_6645)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6645, float2(0.0), isnan(_6645)), level(0.0)).x;
    float _2119 = _1985 * _1947;
    float2 _6656 = float2(_2113, _2107);
    float _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6656, float2(0.0), isnan(_6656)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6656, float2(0.0), isnan(_6656)), level(0.0)).x;
    float2 _6664 = float2(_2059, _2065);
    float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6664, float2(0.0), isnan(_6664)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6664, float2(0.0), isnan(_6664)), level(0.0)).x;
    float _2125 = _2027 * _1947;
    float _2127 = _1987 * _1947;
    float _2129 = _2015 * _1947;
    float _2131 = _2029 * _1947;
    float _2133 = _1989 * _1947;
    float _2135 = _1991 * _1947;
    float _2137 = _2031 * _1947;
    float _2139 = _2033 * _1947;
    float _2141 = _1995 * _1947;
    float _2143 = _2111 * 0.693147182464599609375;
    float _2145 = _2013 * _1947;
    float _2147 = _1993 * _1947;
    float2 _6707 = float2(_2059, _2095);
    float _2149 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6707, float2(0.0), isnan(_6707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6707, float2(0.0), isnan(_6707)), level(0.0)).x;
    float2 _6715 = float2(_2113, _2119);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).x;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _1997 * _1947;
    float2 _6730 = float2(_2069, _1981);
    float _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6730, float2(0.0), isnan(_6730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6730, float2(0.0), isnan(_6730)), level(0.0)).x;
    float2 _6738 = float2(_2125, _2127);
    float _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6738, float2(0.0), isnan(_6738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6738, float2(0.0), isnan(_6738)), level(0.0)).x;
    float _2161 = _2009 * _1947;
    float _2163 = _2035 * _1947;
    float2 _6752 = float2(_2131, _2133);
    float _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6752, float2(0.0), isnan(_6752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6752, float2(0.0), isnan(_6752)), level(0.0)).x;
    float2 _6760 = float2(_2137, _1981);
    float _2167 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6760, float2(0.0), isnan(_6760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6760, float2(0.0), isnan(_6760)), level(0.0)).x;
    float2 _6768 = float2(_2139, _2135);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6768, float2(0.0), isnan(_6768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6768, float2(0.0), isnan(_6768)), level(0.0)).x;
    float2 _6776 = float2(_2059, _2147);
    float _2171 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6776, float2(0.0), isnan(_6776)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6776, float2(0.0), isnan(_6776)), level(0.0)).x;
    float2 _6784 = float2(_2059, _2141);
    float _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6784, float2(0.0), isnan(_6784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6784, float2(0.0), isnan(_6784)), level(0.0)).x;
    float2 _6792 = float2(_2139, _2155);
    float _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6792, float2(0.0), isnan(_6792)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6792, float2(0.0), isnan(_6792)), level(0.0)).x;
    float2 _6800 = float2(_2163, _1981);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).x;
    float _2179 = _2037 * _1947;
    float _2181 = _2039 * _1947;
    float _2183 = _1999 * _1947;
    float _2185 = _2041 * _1947;
    float _2187 = _2001 * _1947;
    float _2189 = _2043 * _1947;
    float _2191 = _2003 * _1947;
    float _2193 = _2045 * _1947;
    float _2195 = _2005 * _1947;
    float _2197 = _2047 * _1947;
    float _2199 = _2007 * _1947;
    float _2201 = _2049 * _1947;
    float2 _6844 = float2(_2179, _2183);
    float _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6844, float2(0.0), isnan(_6844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6844, float2(0.0), isnan(_6844)), level(0.0)).x;
    float2 _6852 = float2(_2181, _2187);
    float _2205 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6852, float2(0.0), isnan(_6852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6852, float2(0.0), isnan(_6852)), level(0.0)).x;
    float2 _6860 = float2(_2185, _2191);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6860, float2(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6860, float2(0.0), isnan(_6860)), level(0.0)).x;
    float2 _6868 = float2(_2189, _2195);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6868, float2(0.0), isnan(_6868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6868, float2(0.0), isnan(_6868)), level(0.0)).x;
    float2 _6876 = float2(_2193, _2199);
    float _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6876, float2(0.0), isnan(_6876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6876, float2(0.0), isnan(_6876)), level(0.0)).x;
    float2 _6884 = float2(_2197, _2161);
    float _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6884, float2(0.0), isnan(_6884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6884, float2(0.0), isnan(_6884)), level(0.0)).x;
    float2 _6892 = float2(_2201, _2115);
    float _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6892, float2(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6892, float2(0.0), isnan(_6892)), level(0.0)).x;
    float _2217 = _2051 * _1947;
    float _2219 = _2053 * _1947;
    float2 _6906 = float2(_2217, _2145);
    float _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6906, float2(0.0), isnan(_6906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6906, float2(0.0), isnan(_6906)), level(0.0)).x;
    float2 _6914 = float2(_2219, _2129);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6914, float2(0.0), isnan(_6914)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6914, float2(0.0), isnan(_6914)), level(0.0)).x;
    float2 _6922 = float2(_2059, _1981);
    float _2225 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6922, float2(0.0), isnan(_6922)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6922, float2(0.0), isnan(_6922)), level(0.0)).x;
    float3 _6931 = float3(_1973, _1975, _2153);
    float _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6931, float3(0.0), isnan(_6931)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6931, float3(0.0), isnan(_6931)), level(0.0)).x;
    float3 _6942 = float3(_1973, _1975, _2153);
    float4 _2230 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6942, float3(0.0), isnan(_6942)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6942, float3(0.0), isnan(_6942)), level(0.0)).xyzw;
    float _2232 = _2230.x;
    float _2234 = _2230.y;
    float _2236 = _2230.z;
    float _2238 = _2230.w;
    float2 _6958 = float2(_1957, _1961);
    float3 _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6958, float2(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6958, float2(0.0), isnan(_6958)), level(0.0)).xyz;
    float _2244 = _2242.x;
    float _2246 = _2242.y;
    float _2248 = _2242.z;
    float _2250 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2252 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2254 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2250);
    float _2256 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2252);
    float _2258 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2254);
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2262 = _2260 + _1807;
    float _2264 = _2262 * _1947;
    float _2266 = _2264 * 0.5;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2270 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2268);
    float _2272 = 1.0 / _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = _2272 * _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2280 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2278);
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2284 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2282);
    float _2286 = 1.0 / _2280;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2290 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2288);
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2294 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2292);
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2298 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2296);
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2302 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2300);
    float _2304 = 1.0 / _2290;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2308 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2306);
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2312 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2310);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2316 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2314);
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2320 = -_2276;
    float _2322 = fma(_2286, _2318, _2320);
    float _2324 = 1.0 / _2294;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2328 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2326);
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2332 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2330);
    float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2336 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2334);
    bool _2338 = _2322 >= 0.0;
    bool _2340 = isnan(_2322);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan(0.0);
    bool _2346 = _2342 || _2344;
    float _2348 = 1.0 / _2284;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = -_2276;
    float _2354 = fma(_2324, _2350, _2352);
    float _2356 = 1.0 / _2308;
    float _2358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2360 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2358);
    float _2362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2364 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2362);
    float _2366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2368 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2366);
    float _2370 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2372 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2370);
    float _2374 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2376 = -_2276;
    float _2378 = fma(_2348, _2374, _2376);
    float _2380 = 1.0 / _2328;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2388 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2386);
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2392 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2390);
    bool _2394 = _2378 >= 0.0;
    bool _2396 = isnan(_2378);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2406 = -_2276;
    float _2408 = fma(_2304, _2404, _2406);
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2412 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2410);
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2416 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2414);
    bool _2418 = !_2402;
    float _2420 = _2418 ? 0.0 : 2.0;
    float _2422 = 1.0 / _2336;
    bool _2424 = _2408 >= 0.0;
    bool _2426 = isnan(_2408);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan(0.0);
    bool _2432 = _2428 || _2430;
    float _2434 = float(_2432);
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2438 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2436);
    bool _2440 = !_2346;
    float _2442 = _2440 ? 0.0 : 2.0;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2446 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2444);
    float _2448 = _2442 + _2434;
    bool _2450 = _2354 >= 0.0;
    bool _2452 = isnan(_2354);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = float(_2458);
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2464 = -_2276;
    float _2466 = fma(_2356, _2462, _2464);
    float _2468 = 1.0 / _2388;
    float _2470 = _2448 + _2420;
    float _2472 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2474 = fma(_2203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2472);
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2478 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2476);
    bool _2480 = _2466 >= 0.0;
    bool _2482 = isnan(_2466);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan(0.0);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = _2470 + _2460;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2496 = -_2276;
    float _2498 = fma(_2380, _2494, _2496);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2502 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2500);
    float _2504 = 1.0 / _2298;
    float _2506 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2508 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2506);
    float _2510 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2512 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2510);
    float _2514 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2516 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2514);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2520 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2518);
    float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2524 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2522);
    float _2526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2528 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2526);
    float _2530 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2532 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2530);
    float _2534 = 1.0 / _2446;
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2538 = -_2276;
    float _2540 = fma(_2504, _2536, _2538);
    float _2542 = 1.0 / _2532;
    bool _2544 = _2540 >= 0.0;
    bool _2546 = isnan(_2540);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = _2492 + _2554;
    float _2558 = 1.0 / _2302;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2562 = -_2276;
    float _2564 = fma(_2558, _2560, _2562);
    bool _2566 = _2564 >= 0.0;
    bool _2568 = isnan(_2564);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan(0.0);
    bool _2574 = _2570 || _2572;
    bool _2576 = !_2574;
    float _2578 = _2576 ? 0.0 : 2.0;
    float _2580 = _2556 + _2578;
    float _2582 = 1.0 / _2312;
    float _2584 = _2580 + _2490;
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2588 = -_2276;
    float _2590 = fma(_2582, _2586, _2588);
    bool _2592 = _2590 >= 0.0;
    bool _2594 = isnan(_2590);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan(0.0);
    bool _2600 = _2596 || _2598;
    float _2602 = 1.0 / _2316;
    float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2606 = -_2276;
    float _2608 = fma(_2602, _2604, _2606);
    bool _2610 = _2608 >= 0.0;
    bool _2612 = isnan(_2608);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan(0.0);
    bool _2618 = _2614 || _2616;
    bool _2620 = !_2600;
    float _2622 = _2620 ? 0.0 : 2.0;
    bool _2624 = !_2618;
    float _2626 = _2624 ? 0.0 : 2.0;
    float _2628 = _2584 + _2622;
    bool _2630 = _2498 >= 0.0;
    bool _2632 = isnan(_2498);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2644 = -_2276;
    float _2646 = fma(_2422, _2642, _2644);
    float _2648 = _2628 + _2626;
    float _2650 = 1.0 / _2360;
    float _2652 = _2648 + _2640;
    float _2654 = 1.0 / _2332;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2658 = -_2276;
    float _2660 = fma(_2650, _2656, _2658);
    bool _2662 = _2646 >= 0.0;
    bool _2664 = isnan(_2646);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = -_2276;
    float _2678 = fma(_2654, _2674, _2676);
    bool _2680 = _2678 >= 0.0;
    bool _2682 = isnan(_2678);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan(0.0);
    bool _2688 = _2684 || _2686;
    bool _2690 = !_2688;
    float _2692 = _2690 ? 0.0 : 2.0;
    float _2694 = _2652 + _2692;
    bool _2696 = _2660 >= 0.0;
    bool _2698 = isnan(_2660);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan(0.0);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = _2694 + _2672;
    float _2710 = 1.0 / _2368;
    float _2712 = _2708 + _2706;
    float _2714 = 1.0 / _2364;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2718 = -_2276;
    float _2720 = fma(_2710, _2716, _2718);
    bool _2722 = _2720 >= 0.0;
    bool _2724 = isnan(_2720);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan(0.0);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2736 = -_2276;
    float _2738 = fma(_2468, _2734, _2736);
    float _2740 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2742 = -_2276;
    float _2744 = fma(_2714, _2740, _2742);
    bool _2746 = _2744 >= 0.0;
    bool _2748 = isnan(_2744);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan(0.0);
    bool _2754 = _2750 || _2752;
    bool _2756 = !_2754;
    float _2758 = _2756 ? 0.0 : 2.0;
    float _2760 = _2712 + _2758;
    float _2762 = 1.0 / _2372;
    float _2764 = _2760 + _2732;
    float _2766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2768 = -_2276;
    float _2770 = fma(_2762, _2766, _2768);
    bool _2772 = _2770 >= 0.0;
    bool _2774 = isnan(_2770);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = 1.0 / _2384;
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2786 = -_2276;
    float _2788 = fma(_2782, _2784, _2786);
    bool _2790 = _2788 >= 0.0;
    bool _2792 = isnan(_2788);
    bool _2794 = _2790 || _2792;
    bool _2796 = isnan(0.0);
    bool _2798 = _2794 || _2796;
    bool _2800 = !_2780;
    float _2802 = _2800 ? 0.0 : 2.0;
    bool _2804 = !_2798;
    float _2806 = _2804 ? 0.0 : 2.0;
    float _2808 = _2764 + _2802;
    bool _2810 = _2738 >= 0.0;
    bool _2812 = isnan(_2738);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan(0.0);
    bool _2818 = _2814 || _2816;
    float _2820 = float(_2818);
    float _2822 = _2808 + _2806;
    float _2824 = _2822 + _2820;
    float _2826 = 1.0 / _2392;
    float _2828 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2830 = -_2276;
    float _2832 = fma(_2826, _2828, _2830);
    bool _2834 = _2832 >= 0.0;
    bool _2836 = isnan(_2832);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = 1.0 / _2412;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2848 = -_2276;
    float _2850 = fma(_2844, _2846, _2848);
    bool _2852 = !_2842;
    float _2854 = _2852 ? 0.0 : 2.0;
    bool _2856 = _2850 >= 0.0;
    bool _2858 = isnan(_2850);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan(0.0);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = _2824 + _2854;
    float _2870 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2872 = -_2276;
    float _2874 = fma(_2534, _2870, _2872);
    float _2876 = 1.0 / _2416;
    float _2878 = _2868 + _2866;
    bool _2880 = _2874 >= 0.0;
    bool _2882 = isnan(_2874);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = float(_2888);
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2894 = -_2276;
    float _2896 = fma(_2876, _2892, _2894);
    bool _2898 = _2896 >= 0.0;
    bool _2900 = isnan(_2896);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    float _2910 = _2878 + _2908;
    float _2912 = 1.0 / _2438;
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2916 = -_2276;
    float _2918 = fma(_2912, _2914, _2916);
    bool _2920 = _2918 >= 0.0;
    bool _2922 = isnan(_2918);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.0);
    bool _2928 = _2924 || _2926;
    bool _2930 = !_2928;
    float _2932 = _2930 ? 0.0 : 2.0;
    float _2934 = _2910 + _2932;
    float _2936 = 1.0 / _2474;
    float _2938 = _2934 + _2890;
    float _2940 = 1.0 / _2520;
    float _2942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2944 = -_2276;
    float _2946 = fma(_2936, _2942, _2944);
    bool _2948 = _2946 >= 0.0;
    bool _2950 = isnan(_2946);
    bool _2952 = _2948 || _2950;
    bool _2954 = isnan(0.0);
    bool _2956 = _2952 || _2954;
    float _2958 = 1.0 / _2478;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2962 = -_2276;
    float _2964 = fma(_2940, _2960, _2962);
    float _2966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2968 = -_2276;
    float _2970 = fma(_2958, _2966, _2968);
    bool _2972 = _2970 >= 0.0;
    bool _2974 = isnan(_2970);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    float _2982 = 1.0 / _2502;
    float _2984 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2986 = -_2276;
    float _2988 = fma(_2982, _2984, _2986);
    bool _2990 = _2988 >= 0.0;
    bool _2992 = isnan(_2988);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan(0.0);
    bool _2998 = _2994 || _2996;
    float _3000 = 1.0 / _2508;
    bool _3002 = !_2998;
    float _3004 = _3002 ? 0.0 : 3.0;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3008 = -_2276;
    float _3010 = fma(_3000, _3006, _3008);
    bool _3012 = _3010 >= 0.0;
    bool _3014 = isnan(_3010);
    bool _3016 = _3012 || _3014;
    bool _3018 = isnan(0.0);
    bool _3020 = _3016 || _3018;
    float _3022 = 1.0 / _2512;
    bool _3024 = !_3020;
    float _3026 = _3024 ? 0.0 : 3.0;
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3030 = -_2276;
    float _3032 = fma(_3022, _3028, _3030);
    bool _3034 = _3032 >= 0.0;
    bool _3036 = isnan(_3032);
    bool _3038 = _3034 || _3036;
    bool _3040 = isnan(0.0);
    bool _3042 = _3038 || _3040;
    float _3044 = 1.0 / _2516;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3048 = -_2276;
    float _3050 = fma(_3044, _3046, _3048);
    bool _3052 = _3050 >= 0.0;
    bool _3054 = isnan(_3050);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan(0.0);
    bool _3060 = _3056 || _3058;
    bool _3062 = !_2980;
    float _3064 = _3062 ? 0.0 : 3.0;
    bool _3066 = _2964 >= 0.0;
    bool _3068 = isnan(_2964);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    bool _3076 = !_3060;
    float _3078 = _3076 ? 0.0 : 3.0;
    float _3080 = _3064 + _3004;
    bool _3082 = !_3042;
    float _3084 = _3082 ? 0.0 : 3.0;
    bool _3086 = !_3074;
    float _3088 = _3086 ? 0.0 : 3.0;
    float _3090 = _3080 + _3026;
    float _3092 = _3090 + _3084;
    bool _3094 = !_2956;
    float _3096 = _3094 ? 0.0 : 2.0;
    float _3098 = _3092 + _3078;
    float _3100 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3102 = _2938 + _3096;
    float _3104 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2256);
    float _3106 = _3098 + _3088;
    float _3108 = 1.0 / _2524;
    float _3110 = _3102 * 0.02857142873108386993408203125;
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    float _3114 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3104);
    float _3116 = _3114 + _1895;
    out.gl_Position.x = _1951;
    out.gl_Position.y = _1959;
    out.gl_Position.z = _3114;
    out.gl_Position.w = _1895;
    float _3118 = 1.0 / _2528;
    float _3120 = _3116 * 0.5;
    out.m_72.z = _3120;
    out.m_72.w = _1895;
    float _3122 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3124 = -_2276;
    float _3126 = fma(_3108, _3122, _3124);
    float _3128 = exp2(_3100);
    bool _3130 = _3126 >= 0.0;
    bool _3132 = isnan(_3126);
    bool _3134 = _3130 || _3132;
    bool _3136 = isnan(0.0);
    bool _3138 = _3134 || _3136;
    float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3142 = -_2276;
    float _3144 = fma(_3118, _3140, _3142);
    float _3146 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3148 = -_2276;
    float _3150 = fma(_2542, _3146, _3148);
    bool _3152 = !_3138;
    float _3154 = _3152 ? 0.0 : 3.0;
    bool _3156 = _3144 >= 0.0;
    bool _3158 = isnan(_3144);
    bool _3160 = _3156 || _3158;
    bool _3162 = isnan(0.0);
    bool _3164 = _3160 || _3162;
    bool _3166 = _3150 >= 0.0;
    bool _3168 = isnan(_3150);
    bool _3170 = _3166 || _3168;
    bool _3172 = isnan(0.0);
    bool _3174 = _3170 || _3172;
    float _3176 = _3106 + _3154;
    bool _3178 = !_3164;
    float _3180 = _3178 ? 0.0 : 3.0;
    float _3182 = -_3128;
    float _3184 = _3182 + 1.0;
    bool _3186 = !_3174;
    float _3188 = _3186 ? 0.0 : 5.0;
    float _3190 = _3176 + _3180;
    float _3192 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3194 = _3190 + _3188;
    float _3196 = _3192 * _2227;
    float _3198 = -_3192;
    float _3200 = _3198 + 1.0;
    float _3202 = _3194 * 0.14285714924335479736328125;
    float _3204 = precise::clamp(_3202, 0.0, 1.0);
    float _3206 = _2238 * _3196;
    float _3208 = _2248 * _3196;
    float _3210 = _3112 * _3204;
    float _3212 = fma(_2244, _3206, _2232);
    float _3214 = _3210 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3216 = fma(_2246, _3206, _2234);
    float _3218 = _2238 * _3200;
    float _3220 = fma(_2238, _3208, _2236);
    float _3222 = _3214 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.x = _3212;
    out.m_74.y = _3216;
    out.m_74.z = _3220;
    out.m_74.w = _3218;
    out.m_53.x = _3222;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1491 = false;
    bool _459 = false;
    bool _311 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_46.w;
    float _90 = in.m_48.w;
    float _92 = trunc(_88);
    int _95 = int(_92);
    float _97 = -_90;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _99;
    bool _103 = _95 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_95);
    float _109 = _99;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _105;
    if (!_103)
    {
        out.m_53.x = 0.0;
    }
    int _113 = 0;
    if (!_103)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3291 = as_type<float>(_117);
        out.gl_Position.z = _3291;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _121 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_90);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = in.m_55.x;
    float _133 = float(_95);
    bool _135 = _99 >= _133;
    bool _137 = !_129;
    bool _139 = _135 || _137;
    if (_139)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _107;
    if (_139)
    {
        out.m_53.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _119 = as_type<int>(_143);
    }
    int _145 = _119;
    out.m_57.x = _131;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3350 = as_type<float>(_145);
        out.gl_Position.z = _3350;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / _133;
    float _151 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _153 = in.m_62.w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _151;
    if (!_163)
    {
        float _181 = _151 * _151;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    int _193 = as_type<int>(_147) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_147) & 2;
    bool _199 = _197 != 0;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_199;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_163;
    float _211 = _191;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _151 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _151);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_163;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _151 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _179 = _265;
    }
    float _267 = _179;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = fma(_267, _165, _271);
    float _279 = fma(_267, _167, _273);
    float _281 = fma(_267, _169, _275);
    float _283 = _99 * _149;
    float _285 = fma(_277, _153, _171);
    float _287 = fma(_279, _153, _173);
    float _289 = fma(_281, _153, _175);
    bool _291 = !_269;
    float _293 = _283;
    float _309;
    if (!_291)
    {
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _297 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        _309 = _283;
    }
    _311 = false;
    float _313 = _309;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    bool _319 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_313);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _313 + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = 1.0 / _337;
    bool _349 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_313);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _363 = 1.0 / _341;
    float _365 = _317 * _347;
    bool _367 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _369 = isnan(_313);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = in.m_62.x;
    float _385 = in.m_62.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = _377 * _345;
    float _393 = -_377;
    float _395 = _393 + 1.0;
    float _397 = fma(_381, _365, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = fma(_389, _365, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _401 = _333 * _363;
    float _403 = _359 * _395;
    float _405 = -_359;
    float _407 = _405 + 1.0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = _397 * _403;
    float _419 = _399 * _403;
    float _421 = fma(_411, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_415, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _429 = fma(_421, _391, _425);
    float _431 = fma(_423, _391, _427);
    float _433 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[145].x, _429);
    float _435 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[145].y, _431);
    float _437 = _433 * _383;
    float _439 = _435 * _385;
    bool _441 = !_361;
    float _457;
    if (!_441)
    {
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _445 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _283;
    }
    _459 = false;
    float _461 = _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _479;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _485 = 1.0 / _481;
    float _487 = -_477;
    float _489 = _487 + 1.0;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _491;
    float _495 = _465 * _485;
    bool _497 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_461);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = fma(_493, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = _507 * _489;
    float _521 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = fma(_517, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = _513 * _519;
    float _531 = _521 * _519;
    float _533 = _523 * _519;
    float _535 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _531);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _539 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _541 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].x, _535);
    float _543 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].y, _537);
    float _545 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[108].z, _539);
    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _551 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _553;
    out.m_64.y = _555;
    out.m_64.z = _557;
    bool _559 = !_483;
    if (!_559)
    {
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _563 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].z, _99);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _293 = _573;
    }
    float _575 = _293;
    float _577 = in.m_55.w;
    float _579 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _581 = log2(_579);
    float _583 = _131 * 2.0;
    float _585 = in.m_55.y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _587;
    float _591 = in.m_55.z;
    bool _593 = _131 > 0.5;
    float _595 = floor(_583);
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    float _609 = _581 * _99;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _613 = _611 != 0;
    float _615 = 1.0 / _589;
    float _617 = _287 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _619 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].x, _617);
    bool _621 = _577 > 0.5;
    float _623 = _287 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = exp2(_609);
    float _627 = -_203;
    int _629 = _593 ? as_type<int>(_627) : as_type<int>(_203);
    float _631 = _287 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _633 = _585 > 0.5;
    float _635 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    bool _637 = _591 > 0.5;
    float _639 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    bool _641 = !_599;
    float _643 = _641 ? _203 : as_type<float>(_629);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _649 = -_207;
    int _651 = _633 ? as_type<int>(_649) : as_type<int>(_207);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _655 = 1.0 + _653;
    bool _657 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(1.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _635);
    float _669 = -_203;
    int _671 = _637 ? as_type<int>(_669) : as_type<int>(_203);
    float _673 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _619);
    bool _675 = !_603;
    float _677 = _675 ? _207 : as_type<float>(_651);
    float _679 = -_625;
    float _681 = _679 + 1.0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _693 = _691 != 0;
    float _695 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _639);
    bool _697 = !_607;
    float _699 = _697 ? _203 : as_type<float>(_671);
    float _701 = _591 * 2.0;
    bool _703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = 1.0 / _655;
    float _715 = -_207;
    int _717 = _621 ? as_type<int>(_715) : as_type<int>(_207);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _721 = _575 + _719;
    bool _723 = _595 > 0.0;
    float _725 = _585 + _591;
    bool _727 = !_613;
    float _729 = _727 ? _207 : as_type<float>(_717);
    float _731 = -_677;
    float _733 = _731 + 0.5;
    float _735 = floor(_701);
    float _737 = _711 ? _681 : 0.0;
    float _739 = _725 + (-1.0);
    bool _741 = _595 >= 0.0;
    bool _743 = isnan(_595);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = _585 * 2.0;
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _755 = _749 ? 0 : 1;
    float _757 = 1.0 / _647;
    if (_665)
    {
        float _759 = _737 * _713;
        _109 = _759;
    }
    float _761 = _109;
    bool _763 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _765 = isnan(_575);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _783 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _785 = isnan(_575);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = _699 + 0.5;
    float _797 = floor(_751);
    bool _799 = _735 >= 0.0;
    bool _801 = isnan(_735);
    bool _803 = _799 || _801;
    bool _805 = isnan(0.0);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _811 = _575 + _809;
    bool _813 = _735 > 0.0;
    float _815 = _643 + 0.5;
    int _817 = _807 ? 0 : 1;
    float _819 = _811 * _615;
    bool _821 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _823 = isnan(_575);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _131 + _585;
    float _835 = _721 * _757;
    float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _839 = _833 + (-1.0);
    float _841 = fma(_777, _819, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _843 = fma(_781, _835, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _845 = _797 > 0.0;
    float _847 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _849 = _797 >= 0.0;
    bool _851 = isnan(_797);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = -_773;
    float _861 = _859 + 1.0;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _873 = _831 * _861;
    float _875 = -_831;
    float _877 = _875 + 1.0;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _883;
    float _887 = fma(_867, _819, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _891 = fma(_881, _835, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _893 = fma(_885, _819, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _895 = _793 * _877;
    float _897 = fma(_871, _835, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _899 = _733 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _901 = -_729;
    float _903 = _901 + 0.5;
    float _905 = _887 * _895;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _909 = _795 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _911 = -_793;
    float _913 = _911 + 1.0;
    float _915 = _893 * _895;
    float _917 = _841 * _895;
    float _919 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _921 = _899 * _837;
    float _923 = _903 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _925 = _909 * _863;
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].x, _905);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].y, _915);
    float _931 = _673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _933 = _919 * _889;
    float _935 = fma(_897, _873, _927);
    float _937 = fma(_891, _873, _929);
    bool _939 = !_685;
    int _941 = _939 ? 0 : 1;
    float _943 = _923 * _907;
    float _945 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _949 = _931 + _947;
    int _951 = ~_755;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[123].z, _917);
    int _959 = _955;
    if (!_723)
    {
        int _961 = ~_755;
        int _963 = _961 + 1;
        _959 = _963;
    }
    int _965 = _959;
    out.m_66.x = _933;
    out.m_66.y = _921;
    out.m_66.z = _925;
    out.m_66.w = _943;
    float _967 = _695 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _969 = fma(_843, _873, _957);
    int _971 = _857 ? 0 : 1;
    float _973 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].x, _935);
    bool _975 = !_689;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].y, _937);
    int _981 = ~_971;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    float _987 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[125].z, _969);
    int _989 = _985;
    if (!_845)
    {
        int _991 = ~_971;
        int _993 = _991 + 1;
        _989 = _993;
    }
    int _995 = _989;
    float _997 = in.m_68.x;
    float _999 = in.m_68.y;
    float _1001 = in.m_68.z;
    int _1003 = ~_817;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    int _1009 = abs(_941);
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1013 = _945 + _1011;
    float _1015 = _949 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = float(_965);
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1021 = _967 + _1019;
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    int _1025 = abs(_977);
    int _1027 = _1007;
    if (!_813)
    {
        int _1029 = ~_817;
        int _1031 = _1029 + 1;
        _1027 = _1031;
    }
    int _1033 = _1027;
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1023);
    float _1037 = float(_1025);
    bool _1039 = _1035 >= 0.0;
    float _1041 = _949 * _949;
    float _1043 = _1037 * _1017;
    float _1045 = float(_1009);
    float _1047 = fma(_1013, _1013, _1041);
    float _1049 = float(_1033);
    float _1051 = _1043 * (-2.0);
    float _1053 = fma(_1021, _1021, _1047);
    float _1055 = _1045 * _1049;
    float _1057 = fma(_753, _1051, _753);
    float _1059 = fma(_1051, _999, _999);
    float _1061 = _1051;
    float _1063 = _1001;
    if (_1039)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1065 = _1061;
    float _1067 = rsqrt(_1053);
    float _1069 = _1055 * (-2.0);
    float _1071 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1073 = !_693;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = as_type<int>(_1065);
    if (_1039)
    {
        float _1079 = _1065 * 5.0;
        _1077 = as_type<int>(_1079);
    }
    int _1081 = _1077;
    float _1083 = fma(_1069, _997, _997);
    float _1085 = fma(_847, _1069, _847);
    float _1087 = _585 + (-0.5);
    float _1089 = _973 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1091 = _987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1059);
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1097 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1101 = abs(_1075);
    float _1103 = _131 + (-0.5);
    float _1105 = fma(_1057, _761, _1093);
    float _1107 = _949 * _1067;
    out.m_70.x = _1095;
    out.m_70.y = _1097;
    out.m_70.z = _1099;
    float _1109 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1083);
    float _1111 = float(_1101);
    float _1113 = _1013 * _1067;
    if (_1039)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4886 = as_type<float>(_1081);
        out.gl_Position.z = _4886;
    }
    float _1115 = _1021 * _1067;
    float _1117 = -_1107;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    if (_1039)
    {
        out.m_53.x = 0.0;
    }
    if (_1039)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1121 = -_1107;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _1125 = -_1113;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _1129 = _1105 * 0.15915493667125701904296875;
    float _1131 = float(_995);
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1135 = _1123 + _1133;
    float _1137 = -_1115;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1127 + _1141;
    float _1145 = -_1113;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1149 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1151 = _1119 * _1119;
    float _1153 = _1111 * _1131;
    float _1155 = _131 + _591;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1159 = _1139 + _1157;
    float _1161 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1149);
    float _1163 = fma(_1085, _761, _1109);
    float _1165 = fma(_1147, _1147, _1151);
    float _1167 = -_1115;
    float _1169 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1171 = _1155 + (-1.0);
    float _1173 = _1153 * (-2.0);
    float _1175 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1161);
    float _1177 = fma(_1169, _1169, _1165);
    float _1179 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1181 = fma(_1173, _1001, _1001);
    float _1183 = _591 + (-0.5);
    bool _1185 = _1175 >= 0.0;
    float _1187 = fma(_1179, _1173, _1179);
    float _1189 = sqrt(_1177);
    float _1191 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1181);
    float _1193 = _1163 * 0.15915493667125701904296875;
    float _1195 = fma(_1187, _761, _1191);
    float _1197 = _1129 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1195 * 0.15915493667125701904296875;
    if (_1185)
    {
        _1063 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1203 = _1063;
    int _1205 = as_type<int>(_1203);
    if (_1185)
    {
        out.m_53.x = 0.0;
    }
    float _1207 = _1129 * 6.283185482025146484375;
    float _1209 = cos(_1207);
    if (_1185)
    {
        float _1211 = _1203 * 5.0;
        _1205 = as_type<int>(_1211);
    }
    int _1213 = _1205;
    float _1215 = _1067 * _1189;
    if (_1185)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5074 = as_type<float>(_1213);
        out.gl_Position.z = _5074;
    }
    float _1217 = _1193 * 6.283185482025146484375;
    float _1219 = sin(_1217);
    float _1221 = _1193 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1201 * 6.283185482025146484375;
    float _1227 = sin(_1225);
    if (_1185)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1229 = _1201 * 6.283185482025146484375;
    float _1231 = cos(_1229);
    float _1233 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1235 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1237 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1239 = _1223 * _1209;
    float _1241 = _1215 * _1233;
    float _1243 = _1235 * _1241;
    float _1245 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = _1219 * _1199;
    float _1249 = _1215 * _1245;
    float _1251 = _1223 * _1199;
    float _1253 = _1231 * _1243;
    float _1255 = fma(_1227, _1239, _1247);
    float _1257 = _1237 * _1249;
    float _1259 = _1199 * _1231;
    float _1261 = _1223 * _1253;
    float _1263 = _1209 * _1231;
    float _1265 = _1219 * _1209;
    float _1267 = -_1243;
    float _1269 = _1227 * _1267;
    float _1271 = fma(_1255, _1257, _1261);
    float _1273 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1275 = _1273 * 0.5;
    float _1277 = -_1265;
    float _1279 = fma(_1227, _1251, _1277);
    float _1281 = -_1251;
    float _1283 = fma(_1227, _1265, _1281);
    float _1285 = _1219 * _1253;
    float _1287 = fma(_1263, _1257, _1269);
    float _1289 = fma(_1279, _1275, _1271);
    float _1291 = fma(_1227, _1247, _1239);
    float _1293 = fma(_1283, _1257, _1285);
    float _1295 = fma(_1259, _1275, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1301 = fma(_1291, _1275, _1293);
    float _1303 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1299);
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1303);
    float _1311 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1305);
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1307);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1309);
    float _1317 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1319 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1321 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1323 = _945 + _1317;
    float _1325 = _967 + _1319;
    float _1327 = _931 + _1321;
    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1331 = _1323 + _1329;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1335 = _1325 + _1333;
    float _1337 = _1331 * _1331;
    float _1339 = _1335 * _1335;
    float _1341 = _1337 + _1339;
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1301;
    float _1349 = _1303;
    float _1351 = _1323;
    float _1353 = _1337;
    float _1355 = _1325;
    float _1357 = _1321;
    if (!_1345)
    {
        _1347 = _1323;
    }
    float _1359 = _1347;
    float _1361 = _1359;
    if (!_1345)
    {
        _1349 = _1339;
    }
    float _1363 = _1349;
    float _1365 = _1363;
    if (!_1345)
    {
        _1351 = _1327;
    }
    float _1367 = _1351;
    bool _1369 = !_1345;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1343 + _1375;
        float _1379 = rsqrt(_1341);
        float _1381 = _1377 * _1373;
        float _1383 = _1327 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = _1381 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = cos(_1391);
        float _1395 = fma(_1389, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1397 = _1379 * _1395;
        float _1399 = _1393 + (-1.0);
        float _1401 = fma(_1331, _1397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1403 = fma(_1335, _1397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1405 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1409 = _1401 + _1407;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1413 = _1403 + _1411;
        float _1415 = fma(_1327, _1393, _1405);
        float _1417 = _1409 * _1409;
        float _1419 = _1413 * _1413;
        _1371 = _1415;
        _1353 = _1417;
        _1365 = _1419;
        _1361 = _1401;
        _1355 = _1403;
        _1357 = _1385;
    }
    float _1421 = _1371;
    float _1423 = _1353;
    float _1425 = _1365;
    float _1427 = _1361;
    float _1429 = _1355;
    float _1431 = _1357;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1435 = _1421 + _1433;
    float _1437 = fma(_1435, _1435, _1423);
    float _1439 = _1437 + _1425;
    float _1441 = sqrt(_1439);
    bool _1443 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1445 = isnan(_1441);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1451 = _1447 || _1449;
    float _1453 = _1437;
    float _1455 = _1431;
    if (!_1451)
    {
        _1453 = 1.0;
    }
    float _1457 = _1453;
    bool _1459 = !_1451;
    float _1461 = _1457;
    if (!_1459)
    {
        bool _1463 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1465 = isnan(_1441);
        bool _1467 = _1463 || _1465;
        bool _1469 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1471 = _1467 || _1469;
        if (!_1471)
        {
            float _1473 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1475 = _1441 + _1473;
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1483 = _1481 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1485 = 1.0 / _1479;
            float _1487 = _1475 * _1485;
            float _1489 = fma(_1487, _1483, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1461 = _1489;
            _1491 = true;
        }
        else
        {
            bool _1493 = _1441 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1495 = isnan(_1441);
            bool _1497 = _1493 || _1495;
            bool _1499 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1501 = _1497 || _1499;
            if (!_1501)
            {
                float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1505 = _1441 + _1503;
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1507 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1515 = 1.0 / _1509;
                float _1517 = _1505 * _1515;
                float _1519 = fma(_1517, _1513, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1461 = _1519;
                _1491 = true;
            }
            else
            {
                _1461 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1491 = false;
    float _1521 = _1461;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1525 = _1427 + _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1529 = _1429 + _1527;
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1543 = _1421 + _1541;
    float _1545 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1547 = fma(_1529, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1549 = fma(_1543, _1521, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1551 = -_1113;
    float _1553 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1545);
    float _1555 = -_1115;
    float _1557 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1547);
    float _1559 = -_1107;
    float _1561 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1549);
    float _1563 = _1561;
    float _1565 = _1553;
    float _1567 = _1557;
    float _1569 = _1545;
    float _1571 = _1549;
    if (!_1539)
    {
        float _1573 = _1135 * _1135;
        float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1577 = -_967;
        float _1579 = _1577 + _1547;
        float _1581 = -_931;
        float _1583 = _1581 + _1549;
        float _1585 = fma(_1143, _1143, _1573);
        float _1587 = fma(_1159, _1159, _1585);
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1591 = sqrt(_1587);
        float _1593 = 1.0 / _1215;
        float _1595 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1597 = precise::min(_1591, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1599 = _1597 * _1575;
        float _1601 = _1599 * _1593;
        float _1603 = -_945;
        float _1605 = _1603 + _1545;
        float _1607 = _1595 * _1601;
        float _1609 = _1579 * _1601;
        float _1611 = fma(_1605, _1607, _1127);
        float _1613 = fma(_1583, _1607, _1123);
        float _1615 = fma(_1595, _1609, _1139);
        _1563 = _1613;
        _1565 = _1611;
        _1567 = _1615;
    }
    float _1617 = _1563;
    float _1619 = _1565;
    float _1621 = _1567;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1625 = _1617 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1629 = _1619 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1633 = _1621 + _1631;
    float _1635 = _1625 * _1625;
    float _1637 = fma(_1629, _1629, _1635);
    float _1639 = fma(_1633, _1633, _1637);
    float _1641 = rsqrt(_1639);
    float _1643 = sqrt(_1639);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1647 = _1629 * _1645;
    float _1649 = _1633 * _1645;
    float _1651 = _1647 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 + _1653;
    float _1657 = sqrt(_1655);
    bool _1659 = _1657 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = _1657 + _1661;
    float _1665 = _1641;
    float _1667 = _1655;
    float _1669 = _1663;
    float _1671 = _1625;
    if (_1659)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1673;
    }
    float _1675 = _1665;
    if (_1659)
    {
        float _1677 = rsqrt(_1655);
        _1667 = _1677;
    }
    float _1679 = _1667;
    if (_1659)
    {
        float _1681 = _1663 * _1675;
        _1669 = _1681;
    }
    float _1683 = _1669;
    if (_1659)
    {
        float _1685 = _1683 * 0.15915493667125701904296875;
        _1455 = _1685;
    }
    float _1687 = _1455;
    float _1689 = _1633;
    if (_1659)
    {
        float _1691 = _1687 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        _1689 = _1693;
    }
    float _1695 = _1689;
    float _1697 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1699 = precise::max(0.0, _1697);
    float _1701 = _1675;
    float _1703 = _1699;
    if (_1659)
    {
        float _1705 = _1687 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        _1701 = _1707;
    }
    float _1709 = _1701;
    float _1711 = -_1645;
    float _1713 = -_1699;
    float _1715 = fma(_1625, _1711, _1713);
    if (_1659)
    {
        float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1717;
    }
    float _1719 = _1671;
    float _1721 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1723 = _1695;
    float _1725 = _1719;
    if (_1659)
    {
        float _1727 = fma(_1695, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1569 = _1727;
    }
    float _1729 = _1569;
    float _1731 = _1729;
    if (!_1659)
    {
        _1723 = _1647;
    }
    float _1733 = _1723;
    float _1735 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1721);
    float _1737 = _1733;
    if (!_1659)
    {
        _1725 = _1715;
    }
    float _1739 = _1725;
    float _1741 = _1739;
    float _1743 = _1709;
    if (_1659)
    {
        float _1745 = _1709 + (-1.0);
        _1703 = _1745;
    }
    float _1747 = _1703;
    float _1749 = _1747;
    if (_1659)
    {
        float _1751 = _1679 * _1729;
        _1731 = _1751;
    }
    float _1753 = _1731;
    float _1755 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1757 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    if (_1659)
    {
        float _1759 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1571 = _1759;
    }
    float _1761 = _1571;
    float _1763 = _1761;
    if (_1659)
    {
        float _1765 = _1647 * _1753;
        _1737 = _1765;
    }
    float _1767 = _1737;
    if (!_1659)
    {
        _1749 = _1649;
    }
    float _1769 = _1749;
    float _1771 = _1769;
    if (_1659)
    {
        float _1773 = _1649 * _1753;
        _1771 = _1773;
    }
    float _1775 = _1771;
    if (_1659)
    {
        float _1777 = fma(_1715, _1709, _1761);
        _1741 = _1777;
    }
    float _1779 = _1741;
    if (!_1659)
    {
        _1763 = _1651;
    }
    float _1781 = _1763;
    float _1783 = _1781;
    if (_1659)
    {
        float _1785 = _1767 * _1767;
        _1783 = _1785;
    }
    float _1787 = _1783;
    if (!_1659)
    {
        _1743 = _1653;
    }
    float _1789 = _1743;
    float _1791 = _1789;
    if (_1659)
    {
        float _1793 = _1775 * _1775;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1755);
    float _1799 = fma(_1779, _1779, _1787);
    float _1801 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1803 = _1799 + _1795;
    float _1805 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1797);
    float _1807 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1811 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1809);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = rsqrt(_1803);
    float _1817 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1819 = _1807 * 0.5;
    float _1821 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1823 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1825 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1827 = fma(_1817, -0.5, _1819);
    float _1829 = -_1813;
    float _1831 = _1829 + 1.0;
    float _1833 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1823);
    float _1835 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1821);
    float _1837 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1801);
    float _1839 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1825);
    float _1841 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1843 = abs(_1831);
    float _1845 = log2(_1843);
    float _1847 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1835);
    float _1849 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    float _1851 = _1815 * _1767;
    float _1853 = _1815 * _1779;
    float _1855 = _1815 * _1775;
    float _1857 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1861 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1839);
    float _1863 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1865 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1867 = -_1859;
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1867);
    float _1871 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1873 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1875 = -_1855;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1869);
    float _1879 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1881 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1865);
    float _1883 = fma(_1877, -0.5, 0.5);
    float _1885 = fma(_1877, 0.5, 0.5);
    float _1887 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1881);
    float _1889 = exp2(_1879);
    float _1891 = _1853 + 1.0;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1887);
    float _1897 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1899 = fma(_1885, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1901 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1827);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1905 = _1827 + _1903;
    float _1907 = sqrt(_1883);
    float _1909 = -_1897;
    float _1911 = fma(_1909, _1893, 1.0);
    float _1913 = fma(_1885, _1899, -0.212114393711090087890625);
    float _1915 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1917 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1921 = fma(_1885, _1913, 1.570728778839111328125);
    float _1923 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1827);
    float _1925 = -_1853;
    float _1927 = fma(_1889, _1891, _1925);
    float _1929 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1931 = 1.0 / _1895;
    float _1933 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1915);
    float _1935 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1937 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1929);
    float _1939 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1827);
    float _1941 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1933);
    float _1943 = _1907 * 0.636619746685028076171875;
    float _1945 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1937);
    float _1947 = 1.0 / _1807;
    float _1949 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1951 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1941);
    float _1953 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1955 = -_1921;
    float _1957 = fma(_1943, _1955, 1.0);
    float _1959 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1961 = fma(_1927, 0.5, 0.5);
    float _1963 = _1953 + _1807;
    float _1965 = _1951 * _1931;
    float _1967 = _1959 * _1931;
    float _1969 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1827);
    float _1971 = _1963 * 0.5;
    float _1973 = fma(_1965, 0.5, 0.5);
    float _1975 = fma(_1967, -0.5, 0.5);
    float _1977 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1827);
    float _1979 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1971);
    float _1981 = _1827 * _1947;
    float _1983 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1827);
    float _1985 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1827);
    float _1987 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1827);
    float _1989 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1827);
    float _1991 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1827);
    float _1993 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1827);
    float _1995 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1827);
    float _1997 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1827);
    float _1999 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1827);
    float _2001 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1827);
    float _2003 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1827);
    float _2005 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1827);
    float _2007 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1827);
    float _2009 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1827);
    float _2011 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1827);
    float _2013 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1827);
    float _2015 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1827);
    float _2017 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1971);
    float _2019 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1971);
    float _2021 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1971);
    float _2023 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1971);
    float _2025 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1971);
    float _2027 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1971);
    float _2029 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1971);
    float _2031 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1971);
    float _2033 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1971);
    float _2035 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1971);
    float _2037 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1971);
    float _2039 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1971);
    float _2041 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1971);
    float _2043 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1971);
    float _2045 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1971);
    float _2047 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1971);
    float _2049 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1971);
    float _2051 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1971);
    float _2053 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1971);
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2057 = _1971 + _2055;
    float _2059 = _1971 * _1947;
    float _2061 = _1971 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2063 = _1979 * _1947;
    float _2065 = _1977 * _1947;
    float _2067 = _1901 * _1947;
    float _2069 = _2017 * _1947;
    float _2071 = _2057 * _1947;
    float _2073 = _1905 * _1947;
    float2 _6536 = float2(_2063, _2065);
    float _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6536, float2(0.0), isnan(_6536)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6536, float2(0.0), isnan(_6536)), level(0.0)).x;
    float _2077 = _1919 * _1947;
    float2 _6549 = float2(_2069, _2067);
    float _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6549, float2(0.0), isnan(_6549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6549, float2(0.0), isnan(_6549)), level(0.0)).x;
    float _2081 = _1923 * _1947;
    float2 _6560 = float2(_2071, _1981);
    float _2083 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6560, float2(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6560, float2(0.0), isnan(_6560)), level(0.0)).x;
    float2 _6568 = float2(_2059, _2073);
    float _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6568, float2(0.0), isnan(_6568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6568, float2(0.0), isnan(_6568)), level(0.0)).x;
    float _2087 = _2061 * _1947;
    float2 _6579 = float2(_2059, _2077);
    float _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6579, float2(0.0), isnan(_6579)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6579, float2(0.0), isnan(_6579)), level(0.0)).x;
    float _2091 = _2019 * _1947;
    float2 _6590 = float2(_2069, _2081);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6590, float2(0.0), isnan(_6590)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6590, float2(0.0), isnan(_6590)), level(0.0)).x;
    float _2095 = _1939 * _1947;
    float _2097 = _2021 * _1947;
    float2 _6604 = float2(_2087, _1981);
    float _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6604, float2(0.0), isnan(_6604)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6604, float2(0.0), isnan(_6604)), level(0.0)).x;
    float _2101 = _1969 * _1947;
    float2 _6615 = float2(_2091, _2095);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6615, float2(0.0), isnan(_6615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6615, float2(0.0), isnan(_6615)), level(0.0)).x;
    float _2105 = _2023 * _1947;
    float _2107 = _1983 * _1947;
    float2 _6629 = float2(_2097, _2101);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6629, float2(0.0), isnan(_6629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6629, float2(0.0), isnan(_6629)), level(0.0)).x;
    float _2111 = log2(_1911);
    float _2113 = _2025 * _1947;
    float _2115 = _2011 * _1947;
    float2 _6645 = float2(_2105, _1981);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6645, float2(0.0), isnan(_6645)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6645, float2(0.0), isnan(_6645)), level(0.0)).x;
    float _2119 = _1985 * _1947;
    float2 _6656 = float2(_2113, _2107);
    float _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6656, float2(0.0), isnan(_6656)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6656, float2(0.0), isnan(_6656)), level(0.0)).x;
    float2 _6664 = float2(_2059, _2065);
    float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6664, float2(0.0), isnan(_6664)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6664, float2(0.0), isnan(_6664)), level(0.0)).x;
    float _2125 = _2027 * _1947;
    float _2127 = _1987 * _1947;
    float _2129 = _2015 * _1947;
    float _2131 = _2029 * _1947;
    float _2133 = _1989 * _1947;
    float _2135 = _1991 * _1947;
    float _2137 = _2031 * _1947;
    float _2139 = _2033 * _1947;
    float _2141 = _1995 * _1947;
    float _2143 = _2111 * 0.693147182464599609375;
    float _2145 = _2013 * _1947;
    float _2147 = _1993 * _1947;
    float2 _6707 = float2(_2059, _2095);
    float _2149 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6707, float2(0.0), isnan(_6707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6707, float2(0.0), isnan(_6707)), level(0.0)).x;
    float2 _6715 = float2(_2113, _2119);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).x;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _1997 * _1947;
    float2 _6730 = float2(_2069, _1981);
    float _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6730, float2(0.0), isnan(_6730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6730, float2(0.0), isnan(_6730)), level(0.0)).x;
    float2 _6738 = float2(_2125, _2127);
    float _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6738, float2(0.0), isnan(_6738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6738, float2(0.0), isnan(_6738)), level(0.0)).x;
    float _2161 = _2009 * _1947;
    float _2163 = _2035 * _1947;
    float2 _6752 = float2(_2131, _2133);
    float _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6752, float2(0.0), isnan(_6752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6752, float2(0.0), isnan(_6752)), level(0.0)).x;
    float2 _6760 = float2(_2137, _1981);
    float _2167 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6760, float2(0.0), isnan(_6760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6760, float2(0.0), isnan(_6760)), level(0.0)).x;
    float2 _6768 = float2(_2139, _2135);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6768, float2(0.0), isnan(_6768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6768, float2(0.0), isnan(_6768)), level(0.0)).x;
    float2 _6776 = float2(_2059, _2147);
    float _2171 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6776, float2(0.0), isnan(_6776)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6776, float2(0.0), isnan(_6776)), level(0.0)).x;
    float2 _6784 = float2(_2059, _2141);
    float _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6784, float2(0.0), isnan(_6784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6784, float2(0.0), isnan(_6784)), level(0.0)).x;
    float2 _6792 = float2(_2139, _2155);
    float _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6792, float2(0.0), isnan(_6792)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6792, float2(0.0), isnan(_6792)), level(0.0)).x;
    float2 _6800 = float2(_2163, _1981);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).x;
    float _2179 = _2037 * _1947;
    float _2181 = _2039 * _1947;
    float _2183 = _1999 * _1947;
    float _2185 = _2041 * _1947;
    float _2187 = _2001 * _1947;
    float _2189 = _2043 * _1947;
    float _2191 = _2003 * _1947;
    float _2193 = _2045 * _1947;
    float _2195 = _2005 * _1947;
    float _2197 = _2047 * _1947;
    float _2199 = _2007 * _1947;
    float _2201 = _2049 * _1947;
    float2 _6844 = float2(_2179, _2183);
    float _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6844, float2(0.0), isnan(_6844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6844, float2(0.0), isnan(_6844)), level(0.0)).x;
    float2 _6852 = float2(_2181, _2187);
    float _2205 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6852, float2(0.0), isnan(_6852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6852, float2(0.0), isnan(_6852)), level(0.0)).x;
    float2 _6860 = float2(_2185, _2191);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6860, float2(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6860, float2(0.0), isnan(_6860)), level(0.0)).x;
    float2 _6868 = float2(_2189, _2195);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6868, float2(0.0), isnan(_6868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6868, float2(0.0), isnan(_6868)), level(0.0)).x;
    float2 _6876 = float2(_2193, _2199);
    float _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6876, float2(0.0), isnan(_6876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6876, float2(0.0), isnan(_6876)), level(0.0)).x;
    float2 _6884 = float2(_2197, _2161);
    float _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6884, float2(0.0), isnan(_6884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6884, float2(0.0), isnan(_6884)), level(0.0)).x;
    float2 _6892 = float2(_2201, _2115);
    float _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6892, float2(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6892, float2(0.0), isnan(_6892)), level(0.0)).x;
    float _2217 = _2051 * _1947;
    float _2219 = _2053 * _1947;
    float2 _6906 = float2(_2217, _2145);
    float _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6906, float2(0.0), isnan(_6906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6906, float2(0.0), isnan(_6906)), level(0.0)).x;
    float2 _6914 = float2(_2219, _2129);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6914, float2(0.0), isnan(_6914)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6914, float2(0.0), isnan(_6914)), level(0.0)).x;
    float2 _6922 = float2(_2059, _1981);
    float _2225 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6922, float2(0.0), isnan(_6922)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6922, float2(0.0), isnan(_6922)), level(0.0)).x;
    float3 _6931 = float3(_1973, _1975, _2153);
    float _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6931, float3(0.0), isnan(_6931)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6931, float3(0.0), isnan(_6931)), level(0.0)).x;
    float3 _6942 = float3(_1973, _1975, _2153);
    float4 _2230 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6942, float3(0.0), isnan(_6942)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6942, float3(0.0), isnan(_6942)), level(0.0)).xyzw;
    float _2232 = _2230.x;
    float _2234 = _2230.y;
    float _2236 = _2230.z;
    float _2238 = _2230.w;
    float2 _6958 = float2(_1957, _1961);
    float3 _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6958, float2(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6958, float2(0.0), isnan(_6958)), level(0.0)).xyz;
    float _2244 = _2242.x;
    float _2246 = _2242.y;
    float _2248 = _2242.z;
    float _2250 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2252 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2254 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2250);
    float _2256 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2252);
    float _2258 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2254);
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2262 = _2260 + _1807;
    float _2264 = _2262 * _1947;
    float _2266 = _2264 * 0.5;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2270 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2268);
    float _2272 = 1.0 / _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = _2272 * _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2280 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2278);
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2284 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2282);
    float _2286 = 1.0 / _2280;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2290 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2288);
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2294 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2292);
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2298 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2296);
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2302 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2300);
    float _2304 = 1.0 / _2290;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2308 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2306);
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2312 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2310);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2316 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2314);
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2320 = -_2276;
    float _2322 = fma(_2286, _2318, _2320);
    float _2324 = 1.0 / _2294;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2328 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2326);
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2332 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2330);
    float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2336 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2334);
    bool _2338 = _2322 >= 0.0;
    bool _2340 = isnan(_2322);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan(0.0);
    bool _2346 = _2342 || _2344;
    float _2348 = 1.0 / _2284;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = -_2276;
    float _2354 = fma(_2324, _2350, _2352);
    float _2356 = 1.0 / _2308;
    float _2358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2360 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2358);
    float _2362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2364 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2362);
    float _2366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2368 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2366);
    float _2370 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2372 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2370);
    float _2374 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2376 = -_2276;
    float _2378 = fma(_2348, _2374, _2376);
    float _2380 = 1.0 / _2328;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2388 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2386);
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2392 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2390);
    bool _2394 = _2378 >= 0.0;
    bool _2396 = isnan(_2378);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2406 = -_2276;
    float _2408 = fma(_2304, _2404, _2406);
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2412 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2410);
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2416 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2414);
    bool _2418 = !_2402;
    float _2420 = _2418 ? 0.0 : 2.0;
    float _2422 = 1.0 / _2336;
    bool _2424 = _2408 >= 0.0;
    bool _2426 = isnan(_2408);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan(0.0);
    bool _2432 = _2428 || _2430;
    float _2434 = float(_2432);
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2438 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2436);
    bool _2440 = !_2346;
    float _2442 = _2440 ? 0.0 : 2.0;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2446 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2444);
    float _2448 = _2442 + _2434;
    bool _2450 = _2354 >= 0.0;
    bool _2452 = isnan(_2354);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = float(_2458);
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2464 = -_2276;
    float _2466 = fma(_2356, _2462, _2464);
    float _2468 = 1.0 / _2388;
    float _2470 = _2448 + _2420;
    float _2472 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2474 = fma(_2203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2472);
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2478 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2476);
    bool _2480 = _2466 >= 0.0;
    bool _2482 = isnan(_2466);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan(0.0);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = _2470 + _2460;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2496 = -_2276;
    float _2498 = fma(_2380, _2494, _2496);
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2502 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2500);
    float _2504 = 1.0 / _2298;
    float _2506 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2508 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2506);
    float _2510 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2512 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2510);
    float _2514 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2516 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2514);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2520 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2518);
    float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2524 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2522);
    float _2526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2528 = fma(_2223, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2526);
    float _2530 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2532 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2530);
    float _2534 = 1.0 / _2446;
    float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2538 = -_2276;
    float _2540 = fma(_2504, _2536, _2538);
    float _2542 = 1.0 / _2532;
    bool _2544 = _2540 >= 0.0;
    bool _2546 = isnan(_2540);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = _2492 + _2554;
    float _2558 = 1.0 / _2302;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2562 = -_2276;
    float _2564 = fma(_2558, _2560, _2562);
    bool _2566 = _2564 >= 0.0;
    bool _2568 = isnan(_2564);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan(0.0);
    bool _2574 = _2570 || _2572;
    bool _2576 = !_2574;
    float _2578 = _2576 ? 0.0 : 2.0;
    float _2580 = _2556 + _2578;
    float _2582 = 1.0 / _2312;
    float _2584 = _2580 + _2490;
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2588 = -_2276;
    float _2590 = fma(_2582, _2586, _2588);
    bool _2592 = _2590 >= 0.0;
    bool _2594 = isnan(_2590);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan(0.0);
    bool _2600 = _2596 || _2598;
    float _2602 = 1.0 / _2316;
    float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2606 = -_2276;
    float _2608 = fma(_2602, _2604, _2606);
    bool _2610 = _2608 >= 0.0;
    bool _2612 = isnan(_2608);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan(0.0);
    bool _2618 = _2614 || _2616;
    bool _2620 = !_2600;
    float _2622 = _2620 ? 0.0 : 2.0;
    bool _2624 = !_2618;
    float _2626 = _2624 ? 0.0 : 2.0;
    float _2628 = _2584 + _2622;
    bool _2630 = _2498 >= 0.0;
    bool _2632 = isnan(_2498);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2644 = -_2276;
    float _2646 = fma(_2422, _2642, _2644);
    float _2648 = _2628 + _2626;
    float _2650 = 1.0 / _2360;
    float _2652 = _2648 + _2640;
    float _2654 = 1.0 / _2332;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2658 = -_2276;
    float _2660 = fma(_2650, _2656, _2658);
    bool _2662 = _2646 >= 0.0;
    bool _2664 = isnan(_2646);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = -_2276;
    float _2678 = fma(_2654, _2674, _2676);
    bool _2680 = _2678 >= 0.0;
    bool _2682 = isnan(_2678);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan(0.0);
    bool _2688 = _2684 || _2686;
    bool _2690 = !_2688;
    float _2692 = _2690 ? 0.0 : 2.0;
    float _2694 = _2652 + _2692;
    bool _2696 = _2660 >= 0.0;
    bool _2698 = isnan(_2660);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan(0.0);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = _2694 + _2672;
    float _2710 = 1.0 / _2368;
    float _2712 = _2708 + _2706;
    float _2714 = 1.0 / _2364;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2718 = -_2276;
    float _2720 = fma(_2710, _2716, _2718);
    bool _2722 = _2720 >= 0.0;
    bool _2724 = isnan(_2720);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan(0.0);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2736 = -_2276;
    float _2738 = fma(_2468, _2734, _2736);
    float _2740 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2742 = -_2276;
    float _2744 = fma(_2714, _2740, _2742);
    bool _2746 = _2744 >= 0.0;
    bool _2748 = isnan(_2744);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan(0.0);
    bool _2754 = _2750 || _2752;
    bool _2756 = !_2754;
    float _2758 = _2756 ? 0.0 : 2.0;
    float _2760 = _2712 + _2758;
    float _2762 = 1.0 / _2372;
    float _2764 = _2760 + _2732;
    float _2766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2768 = -_2276;
    float _2770 = fma(_2762, _2766, _2768);
    bool _2772 = _2770 >= 0.0;
    bool _2774 = isnan(_2770);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = 1.0 / _2384;
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2786 = -_2276;
    float _2788 = fma(_2782, _2784, _2786);
    bool _2790 = _2788 >= 0.0;
    bool _2792 = isnan(_2788);
    bool _2794 = _2790 || _2792;
    bool _2796 = isnan(0.0);
    bool _2798 = _2794 || _2796;
    bool _2800 = !_2780;
    float _2802 = _2800 ? 0.0 : 2.0;
    bool _2804 = !_2798;
    float _2806 = _2804 ? 0.0 : 2.0;
    float _2808 = _2764 + _2802;
    bool _2810 = _2738 >= 0.0;
    bool _2812 = isnan(_2738);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan(0.0);
    bool _2818 = _2814 || _2816;
    float _2820 = float(_2818);
    float _2822 = _2808 + _2806;
    float _2824 = _2822 + _2820;
    float _2826 = 1.0 / _2392;
    float _2828 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2830 = -_2276;
    float _2832 = fma(_2826, _2828, _2830);
    bool _2834 = _2832 >= 0.0;
    bool _2836 = isnan(_2832);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = 1.0 / _2412;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2848 = -_2276;
    float _2850 = fma(_2844, _2846, _2848);
    bool _2852 = !_2842;
    float _2854 = _2852 ? 0.0 : 2.0;
    bool _2856 = _2850 >= 0.0;
    bool _2858 = isnan(_2850);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan(0.0);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = _2824 + _2854;
    float _2870 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2872 = -_2276;
    float _2874 = fma(_2534, _2870, _2872);
    float _2876 = 1.0 / _2416;
    float _2878 = _2868 + _2866;
    bool _2880 = _2874 >= 0.0;
    bool _2882 = isnan(_2874);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = float(_2888);
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2894 = -_2276;
    float _2896 = fma(_2876, _2892, _2894);
    bool _2898 = _2896 >= 0.0;
    bool _2900 = isnan(_2896);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    float _2910 = _2878 + _2908;
    float _2912 = 1.0 / _2438;
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2916 = -_2276;
    float _2918 = fma(_2912, _2914, _2916);
    bool _2920 = _2918 >= 0.0;
    bool _2922 = isnan(_2918);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.0);
    bool _2928 = _2924 || _2926;
    bool _2930 = !_2928;
    float _2932 = _2930 ? 0.0 : 2.0;
    float _2934 = _2910 + _2932;
    float _2936 = 1.0 / _2474;
    float _2938 = _2934 + _2890;
    float _2940 = 1.0 / _2520;
    float _2942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2944 = -_2276;
    float _2946 = fma(_2936, _2942, _2944);
    bool _2948 = _2946 >= 0.0;
    bool _2950 = isnan(_2946);
    bool _2952 = _2948 || _2950;
    bool _2954 = isnan(0.0);
    bool _2956 = _2952 || _2954;
    float _2958 = 1.0 / _2478;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2962 = -_2276;
    float _2964 = fma(_2940, _2960, _2962);
    float _2966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2968 = -_2276;
    float _2970 = fma(_2958, _2966, _2968);
    bool _2972 = _2970 >= 0.0;
    bool _2974 = isnan(_2970);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    float _2982 = 1.0 / _2502;
    float _2984 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2986 = -_2276;
    float _2988 = fma(_2982, _2984, _2986);
    bool _2990 = _2988 >= 0.0;
    bool _2992 = isnan(_2988);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan(0.0);
    bool _2998 = _2994 || _2996;
    float _3000 = 1.0 / _2508;
    bool _3002 = !_2998;
    float _3004 = _3002 ? 0.0 : 3.0;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3008 = -_2276;
    float _3010 = fma(_3000, _3006, _3008);
    bool _3012 = _3010 >= 0.0;
    bool _3014 = isnan(_3010);
    bool _3016 = _3012 || _3014;
    bool _3018 = isnan(0.0);
    bool _3020 = _3016 || _3018;
    float _3022 = 1.0 / _2512;
    bool _3024 = !_3020;
    float _3026 = _3024 ? 0.0 : 3.0;
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3030 = -_2276;
    float _3032 = fma(_3022, _3028, _3030);
    bool _3034 = _3032 >= 0.0;
    bool _3036 = isnan(_3032);
    bool _3038 = _3034 || _3036;
    bool _3040 = isnan(0.0);
    bool _3042 = _3038 || _3040;
    float _3044 = 1.0 / _2516;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3048 = -_2276;
    float _3050 = fma(_3044, _3046, _3048);
    bool _3052 = _3050 >= 0.0;
    bool _3054 = isnan(_3050);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan(0.0);
    bool _3060 = _3056 || _3058;
    bool _3062 = !_2980;
    float _3064 = _3062 ? 0.0 : 3.0;
    bool _3066 = _2964 >= 0.0;
    bool _3068 = isnan(_2964);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    bool _3076 = !_3060;
    float _3078 = _3076 ? 0.0 : 3.0;
    float _3080 = _3064 + _3004;
    bool _3082 = !_3042;
    float _3084 = _3082 ? 0.0 : 3.0;
    bool _3086 = !_3074;
    float _3088 = _3086 ? 0.0 : 3.0;
    float _3090 = _3080 + _3026;
    float _3092 = _3090 + _3084;
    bool _3094 = !_2956;
    float _3096 = _3094 ? 0.0 : 2.0;
    float _3098 = _3092 + _3078;
    float _3100 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3102 = _2938 + _3096;
    float _3104 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2256);
    float _3106 = _3098 + _3088;
    float _3108 = 1.0 / _2524;
    float _3110 = _3102 * 0.02857142873108386993408203125;
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    float _3114 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3104);
    float _3116 = _3114 + _1895;
    out.gl_Position.x = _1951;
    out.gl_Position.y = _1959;
    out.gl_Position.z = _3114;
    out.gl_Position.w = _1895;
    float _3118 = 1.0 / _2528;
    float _3120 = _3116 * 0.5;
    out.m_72.z = _3120;
    out.m_72.w = _1895;
    float _3122 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3124 = -_2276;
    float _3126 = fma(_3108, _3122, _3124);
    float _3128 = exp2(_3100);
    bool _3130 = _3126 >= 0.0;
    bool _3132 = isnan(_3126);
    bool _3134 = _3130 || _3132;
    bool _3136 = isnan(0.0);
    bool _3138 = _3134 || _3136;
    float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3142 = -_2276;
    float _3144 = fma(_3118, _3140, _3142);
    float _3146 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3148 = -_2276;
    float _3150 = fma(_2542, _3146, _3148);
    bool _3152 = !_3138;
    float _3154 = _3152 ? 0.0 : 3.0;
    bool _3156 = _3144 >= 0.0;
    bool _3158 = isnan(_3144);
    bool _3160 = _3156 || _3158;
    bool _3162 = isnan(0.0);
    bool _3164 = _3160 || _3162;
    bool _3166 = _3150 >= 0.0;
    bool _3168 = isnan(_3150);
    bool _3170 = _3166 || _3168;
    bool _3172 = isnan(0.0);
    bool _3174 = _3170 || _3172;
    float _3176 = _3106 + _3154;
    bool _3178 = !_3164;
    float _3180 = _3178 ? 0.0 : 3.0;
    float _3182 = -_3128;
    float _3184 = _3182 + 1.0;
    bool _3186 = !_3174;
    float _3188 = _3186 ? 0.0 : 5.0;
    float _3190 = _3176 + _3180;
    float _3192 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3194 = _3190 + _3188;
    float _3196 = _3192 * _2227;
    float _3198 = -_3192;
    float _3200 = _3198 + 1.0;
    float _3202 = _3194 * 0.14285714924335479736328125;
    float _3204 = precise::clamp(_3202, 0.0, 1.0);
    float _3206 = _2238 * _3196;
    float _3208 = _2248 * _3196;
    float _3210 = _3112 * _3204;
    float _3212 = fma(_2244, _3206, _2232);
    float _3214 = _3210 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3216 = fma(_2246, _3206, _2234);
    float _3218 = _2238 * _3200;
    float _3220 = fma(_2238, _3208, _2236);
    float _3222 = _3214 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.x = _3212;
    out.m_74.y = _3216;
    out.m_74.z = _3220;
    out.m_74.w = _3218;
    out.m_53.x = _3222;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

