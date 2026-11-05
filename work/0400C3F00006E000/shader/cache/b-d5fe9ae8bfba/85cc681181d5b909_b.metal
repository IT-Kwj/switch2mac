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
    float4 m_74 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1143 = false;
    bool _1001 = false;
    bool _833 = false;
    bool _653 = false;
    bool _477 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2959 = as_type<float>(_111);
        out.gl_Position.z = _2959;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3029 = as_type<float>(_149);
        out.gl_Position.z = _3029;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _155 = as_type<int>(_151) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_151) & 2;
    bool _161 = _159 != 0;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_153;
    float _189;
    if (!_171)
    {
        float _173 = in.m_52.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_95);
        float _195 = 1.0 / _193;
        float _197 = _129 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _211 = _209 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _221 = 1.0 / _207;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _223;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _229 = 1.0 / _211;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _199 + _231;
    float _235 = 1.0 / _219;
    float _237 = _233 * _221;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _199 + _239;
    bool _243 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _245 = isnan(_199);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _215;
    float _257 = _203 * _229;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _199 + _259;
    bool _263 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_199);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _225;
    float _277 = _261 * _235;
    bool _279 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _281 = isnan(_199);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = _199 + _291;
    float _295 = -_289;
    float _297 = _295 + 1.0;
    float _299 = _241 * _255;
    bool _301 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _303 = isnan(_199);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -_311;
    float _315 = _313 + 1.0;
    float _317 = _311 * _297;
    float _319 = _293 * _275;
    float _321 = -_253;
    float _323 = _321 + 1.0;
    bool _325 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_199);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _273 * _315;
    float _339 = -_273;
    float _341 = _339 + 1.0;
    float _343 = _289 * _323;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _353 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_199);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _335 * _341;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -_335;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = fma(_347, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _381 = fma(_369, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = _363 * _373;
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = fma(_377, _257, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = fma(_351, _257, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = _381 * _383;
    float _395 = _379 * _383;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = fma(_399, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _415 = fma(_403, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _421 = fma(_389, _365, _405);
    float _423 = fma(_391, _365, _407);
    float _425 = fma(_411, _277, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _427 = fma(_419, _277, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _433;
    float _437 = fma(_413, _337, _421);
    float _439 = fma(_415, _337, _423);
    float _441 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _443 = fma(_435, _319, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _445 = fma(_425, _317, _437);
    float _447 = fma(_427, _317, _439);
    float _449 = fma(_441, _343, _445);
    float _451 = fma(_443, _343, _447);
    float _453 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[148].x, _449);
    float _455 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[148].y, _451);
    bool _457 = !_227;
    float _475;
    if (!_457)
    {
        float _459 = in.m_52.x;
        float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _467 = _465 * _461;
        float _469 = floor(_467);
        float _471 = -_469;
        float _473 = _467 + _471;
        _475 = _473;
        _477 = true;
    }
    else
    {
        float _479 = float(_95);
        float _481 = 1.0 / _479;
        float _483 = _129 * _481;
        _475 = _483;
    }
    _477 = false;
    float _485 = _475;
    float _487 = in.m_54.x;
    float _489 = in.m_54.y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = _485 + _491;
    bool _495 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _497 = isnan(_485);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _515 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _517 = isnan(_485);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_505;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _509;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = 1.0 / _513;
    float _537 = _455 * _489;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = _493 * _531;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _547 = _485 + _545;
    bool _549 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _551 = isnan(_485);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _561;
    float _565 = fma(_541, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = _559 * _529;
    float _569 = -_559;
    float _571 = _569 + 1.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _573;
    float _577 = fma(_563, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _579 = _547 * _535;
    float _581 = _525 * _571;
    float _583 = fma(_575, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _585 = -_525;
    float _587 = _585 + 1.0;
    float _589 = _565 * _581;
    float _591 = _583 * _581;
    float _593 = _577 * _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _607 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].x, _591);
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].y, _589);
    float _611 = fma(_597, _579, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _613 = fma(_601, _579, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _615 = fma(_605, _579, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _617 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].z, _593);
    float _619 = fma(_611, _567, _607);
    float _621 = fma(_613, _567, _609);
    float _623 = fma(_615, _567, _617);
    float _625 = _453 * _487;
    float _627 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].x, _619);
    float _629 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].y, _621);
    float _631 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].z, _623);
    bool _633 = !_533;
    float _651;
    if (!_633)
    {
        float _635 = in.m_52.x;
        float _637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _639 = _635 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _643 = _641 * _637;
        float _645 = floor(_643);
        float _647 = -_645;
        float _649 = _643 + _647;
        _651 = _649;
        _653 = true;
    }
    else
    {
        float _655 = float(_95);
        float _657 = 1.0 / _655;
        float _659 = _129 * _657;
        _651 = _659;
    }
    _653 = false;
    float _661 = _651;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _665 = _661 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _675 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_661);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _691 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_661);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = 1.0 / _669;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    float _709 = -_685;
    float _711 = _709 + 1.0;
    bool _713 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _715 = isnan(_661);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _727 = 1.0 / _673;
    float _729 = 1.0 / _689;
    float _731 = _707 * _703;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _737 = _701 * _711;
    float _739 = -_701;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, _665, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _745;
    float _749 = _723 * _741;
    float _751 = _735 * _727;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _755 = _661 + _753;
    bool _757 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _759 = isnan(_661);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _743 * _749;
    float _771 = -_723;
    float _773 = _771 + 1.0;
    float _775 = fma(_751, _755, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _661 + _777;
    float _781 = _747 * _729;
    float _783 = -_767;
    float _785 = _783 + 1.0;
    float _787 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[115].x, _769);
    float _789 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _791 = fma(_781, _779, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _793 = _685 * _785;
    float _795 = fma(_775, _737, _787);
    float _797 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = fma(_791, _793, _795);
    float _801 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _803 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _805 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _799);
    float _807 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _797;
    out.m_56.y = _807;
    out.m_56.z = _809;
    out.m_56.w = _811;
    bool _813 = !_725;
    float _831;
    if (!_813)
    {
        float _815 = in.m_52.x;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _819 = _815 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_95);
        float _837 = 1.0 / _835;
        float _839 = _129 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = _841 + _843;
    bool _847 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _849 = isnan(_841);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _861 = _841 + _859;
    bool _863 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _865 = isnan(_841);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _883 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _885 = isnan(_841);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = -_857;
    float _897 = _895 + 1.0;
    float _899 = 1.0 / _881;
    float _901 = _893 * _897;
    float _903 = -_893;
    float _905 = _903 + 1.0;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _907;
    bool _911 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _913 = 1.0 / _877;
    float _915 = _873 * _905;
    float _917 = -_873;
    float _919 = _917 + 1.0;
    float _921 = _861 * _899;
    float _923 = _845 * _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _929;
    float _933 = fma(_909, _923, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _935 = fma(_927, _923, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _937 = fma(_931, _923, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _939 = _933 * _915;
    float _941 = _935 * _915;
    float _943 = _937 * _915;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _957 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].x, _939);
    float _959 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].y, _941);
    float _961 = fma(_947, _921, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _963 = fma(_951, _921, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _965 = fma(_955, _921, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _967 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].z, _943);
    float _969 = fma(_961, _901, _957);
    float _971 = fma(_963, _901, _959);
    float _973 = fma(_965, _901, _967);
    float _975 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].x, _969);
    float _977 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].y, _971);
    float _979 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].z, _973);
    bool _981 = !_911;
    float _999;
    if (!_981)
    {
        float _983 = in.m_52.x;
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _987 = _983 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _991 = _989 * _985;
        float _993 = floor(_991);
        float _995 = -_993;
        float _997 = _991 + _995;
        _999 = _997;
        _1001 = true;
    }
    else
    {
        float _1003 = float(_95);
        float _1005 = 1.0 / _1003;
        float _1007 = _129 * _1005;
        _999 = _1007;
    }
    _1001 = false;
    float _1009 = _999;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1013 = _1009 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1019 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1021 = isnan(_1009);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1035 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1037 = isnan(_1009);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1047;
    bool _1051 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1053 = isnan(_1009);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = 1.0 / _1017;
    float _1065 = -_1029;
    float _1067 = _1065 + 1.0;
    bool _1069 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1071 = _1045 * _1067;
    float _1073 = -_1045;
    float _1075 = _1073 + 1.0;
    float _1077 = 1.0 / _1033;
    float _1079 = _1049 * _1063;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1085 = fma(_1079, _1013, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1087 = _1083 * _1077;
    float _1089 = _1085 * _1071;
    float _1091 = -_1061;
    float _1093 = _1091 + 1.0;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1097 = _1009 + _1095;
    float _1099 = _975 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1089);
    float _1103 = _1029 * _1093;
    float _1105 = fma(_1087, _1097, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1107 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = fma(_1105, _1103, _1101);
    float _1111 = _977 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1113 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1117 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1109);
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _1113;
    out.m_58.y = _1119;
    out.m_58.z = _1115;
    out.m_58.w = _1121;
    bool _1123 = !_1069;
    float _1141;
    if (!_1123)
    {
        float _1125 = in.m_52.x;
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1129 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _1133 = _1131 * _1127;
        float _1135 = floor(_1133);
        float _1137 = -_1135;
        float _1139 = _1133 + _1137;
        _1141 = _1139;
        _1143 = true;
    }
    else
    {
        float _1145 = float(_95);
        float _1147 = 1.0 / _1145;
        float _1149 = _129 * _1147;
        _1141 = _1149;
    }
    _1143 = false;
    float _1151 = _1141;
    float _1153 = in.m_52.x;
    float _1155 = in.m_52.y;
    float _1157 = in.m_52.z;
    float _1159 = in.m_52.w;
    float _1161 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1163 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1171 = _1169 != 0;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1179 = _1157 * 2.0;
    float _1181 = _1153 * 2.0;
    float _1183 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1185 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1187 = _1155 > 0.5;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = floor(_1179);
    float _1193 = fma(_1183, -2.0, _1165);
    float _1195 = -_1167;
    float _1197 = fma(_1185, 2.0, _1195);
    float _1199 = _1155 + _1153;
    float _1201 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1203 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1193);
    float _1205 = _1153 + (-0.5);
    float _1207 = _1199 + (-1.0);
    float _1209 = floor(_1181);
    bool _1211 = _1191 > 0.0;
    bool _1213 = _1191 >= 0.0;
    bool _1215 = isnan(_1191);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.0);
    bool _1221 = _1217 || _1219;
    float _1223 = _1221 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1231 = _1229 != 0;
    float _1233 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1235 = _1209 > 0.0;
    bool _1237 = _1209 >= 0.0;
    bool _1239 = isnan(_1209);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan(0.0);
    bool _1245 = _1241 || _1243;
    float _1247 = _1155 * 2.0;
    int _1249 = ~as_type<int>(_1223);
    int _1251 = _1249 + 1;
    int _1253 = _1251 + 1;
    int _1255 = _1253;
    float _1257 = _1223;
    float _1259 = _1207;
    if (!_1211)
    {
        int _1261 = ~as_type<int>(_1223);
        int _1263 = _1261 + 1;
        _1255 = _1263;
    }
    int _1265 = _1255;
    bool _1267 = _1157 > 0.5;
    float _1269 = floor(_1247);
    float _1271 = -_165;
    float _1273 = _1187 ? _1271 : _165;
    float _1275 = -_169;
    int _1277 = _1267 ? as_type<int>(_1275) : as_type<int>(_169);
    bool _1279 = !_1227;
    float _1281 = _1279 ? _165 : _1273;
    float _1283 = _1273;
    if (_1171)
    {
        _1257 = _1153;
    }
    float _1285 = _1257;
    float _1287 = _1285;
    if (_1171)
    {
        _1283 = _1155;
    }
    float _1289 = _1283;
    float _1291 = _1289;
    if (_1171)
    {
        _1259 = _1157;
    }
    float _1293 = _1259;
    bool _1295 = !_1231;
    float _1297 = _1295 ? _169 : as_type<float>(_1277);
    float _1299 = _1293;
    if (!_1171)
    {
        _1287 = _1157;
    }
    float _1301 = _1287;
    if (!_1171)
    {
        _1291 = _1153;
    }
    float _1303 = _1291;
    if (!_1171)
    {
        _1299 = _1155;
    }
    float _1305 = _1299;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1313 = _1311 != 0;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1317 = _1315 != 0;
    int _1319 = _1245 ? 0 : 1;
    float _1321 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1173);
    bool _1323 = _1269 > 0.0;
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1327 = !_1309;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1333 = _1269 >= 0.0;
    bool _1335 = isnan(_1269);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = -_1175;
    float _1345 = fma(_1325, 2.0, _1343);
    float _1347 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1349 = log2(_1347);
    int _1351 = abs(_1329);
    float _1353 = fma(_1331, -2.0, _1177);
    float _1355 = float(_1265);
    float _1357 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1321);
    float _1359 = -_129;
    float _1361 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1345);
    int _1363 = _1341 ? 0 : 1;
    float _1365 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1353);
    float _1367 = float(_1351);
    int _1369 = ~_1363;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    int _1375 = _1373;
    if (!_1323)
    {
        int _1377 = ~_1363;
        int _1379 = _1377 + 1;
        _1375 = _1379;
    }
    int _1381 = _1375;
    float _1383 = _1367 * _1355;
    float _1385 = in.m_60.x;
    float _1387 = in.m_60.y;
    float _1389 = in.m_60.z;
    float _1391 = _1349 * _129;
    int _1393 = ~_1319;
    int _1395 = _1393 + 1;
    int _1397 = _1395 + 1;
    float _1399 = exp2(_1391);
    int _1401 = _1397;
    if (!_1235)
    {
        int _1403 = ~_1319;
        int _1405 = _1403 + 1;
        _1401 = _1405;
    }
    int _1407 = _1401;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1413 = 1.0 + _1411;
    float _1415 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1409);
    bool _1417 = !_1313;
    int _1419 = _1417 ? 0 : 1;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1423 = 1.0 / _1413;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1427 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1429 = isnan(1.0);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1415);
    float _1439 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1421);
    float _1441 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1201);
    float _1443 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1425);
    float _1445 = _1383 * (-2.0);
    float _1447 = -_1399;
    float _1449 = _1447 + 1.0;
    int _1451 = abs(_1419);
    float _1453 = -_129;
    float _1455 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1197);
    bool _1457 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1459 = isnan(0.0);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1465 = _1461 || _1463;
    float _1467 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1439);
    float _1469 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1443);
    float _1471 = fma(_1445, _1385, _1385);
    float _1473 = float(_1407);
    float _1475 = fma(_1233, _1445, _1233);
    float _1477 = float(_1451);
    float _1479 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1471);
    float _1481 = _1465 ? _1449 : 0.0;
    bool _1483 = !_1317;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1477 * _1473;
    float _1489 = _1155 + _1157;
    if (_1435)
    {
        float _1491 = _1481 * _1423;
        _131 = _1491;
    }
    float _1493 = _131;
    int _1495 = abs(_1485);
    float _1497 = fma(_1475, _1493, _1479);
    float _1499 = _1489 + (-1.0);
    float _1501 = float(_1381);
    float _1503 = _1487 * (-2.0);
    float _1505 = float(_1495);
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1509 = _1155 + (-0.5);
    float _1511 = fma(_1503, _1387, _1387);
    float _1513 = _1157 + _1153;
    float _1515 = _1505 * _1501;
    float _1517 = fma(_1507, _1503, _1507);
    float _1519 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1511);
    float _1521 = _1513 + (-1.0);
    float _1523 = _1515 * (-2.0);
    float _1525 = fma(_1517, _1493, _1519);
    float _1527 = _1157 + (-0.5);
    float _1529 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1531 = fma(_1523, _1389, _1389);
    float _1533 = _1497 * 0.15915493667125701904296875;
    float _1535 = _1525 * 0.15915493667125701904296875;
    float _1537 = fma(_1529, _1523, _1529);
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1531);
    float _1541 = _1533 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    bool _1547 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1555 = _1551 || _1553;
    float _1557 = fma(_1537, _1493, _1539);
    float _1559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _165);
    float _1561 = _1161 * _1545;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    float _1573 = _1557 * 0.15915493667125701904296875;
    float _1575 = _1535 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = in.m_42.x;
    float _1581 = in.m_42.y;
    float _1583 = in.m_42.z;
    float _1585 = _1163 * _1559;
    float _1587 = _1535 * 6.283185482025146484375;
    float _1589 = cos(_1587);
    float _1591 = _1533 * 6.283185482025146484375;
    float _1593 = sin(_1591);
    float _1595 = _1543 * _1577;
    float _1597 = _1573 * 6.283185482025146484375;
    float _1599 = cos(_1597);
    float _1601 = _1543 * _1589;
    float _1603 = _1573 * 6.283185482025146484375;
    float _1605 = sin(_1603);
    float _1607 = _1593 * _1577;
    float _1609 = _1593 * _1589;
    float _1611 = _1543 * _1599;
    float _1613 = _1593 * _1599;
    float _1615 = _1589 * _1599;
    float _1617 = _1577 * _1599;
    float _1619 = _1611 * _1561;
    float _1621 = _1613 * _1561;
    float _1623 = fma(_1605, _1601, _1607);
    float _1625 = -_1595;
    float _1627 = fma(_1605, _1609, _1625);
    float _1629 = -_1609;
    float _1631 = fma(_1605, _1595, _1629);
    float _1633 = -_1561;
    float _1635 = _1605 * _1633;
    float _1637 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1639 = fma(_1623, _1585, _1619);
    float _1641 = fma(_1627, _1585, _1621);
    float _1643 = fma(_1615, _1585, _1635);
    float _1645 = fma(_1605, _1607, _1601);
    float _1647 = fma(_1631, _1637, _1639);
    float _1649 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1651 = fma(_1617, _1637, _1643);
    float _1653 = fma(_1645, _1637, _1641);
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1657 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1649);
    float _1659 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1663 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1655);
    float _1665 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1657);
    float _1667 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1659);
    float _1669 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1661);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1663);
    float _1673 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1675 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1667);
    float _1677 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1679 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1669);
    float _1681 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1683 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1673);
    float _1685 = _1675 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1687 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1689 = _1677 + _1681;
    float _1691 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1683);
    float _1693 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1695 = _1685 + _1687;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1699 = _1689 + _1697;
    float _1701 = _1691 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1693);
    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1707 = _1695 + _1705;
    float _1709 = _1699 * _1699;
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1713 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1703);
    float _1715 = fma(_1707, _1707, _1709);
    float _1717 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1711);
    float _1719 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1721 = sqrt(_1715);
    float _1723 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1725 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1727 = _1701 + _1719;
    float _1729 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1731 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1725);
    float _1733 = 1.0 / _1729;
    float _1735 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1737 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1739 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = _1737 + _1729;
    float _1743 = _1741 * _1733;
    float _1745 = _1743 * 0.5;
    float _1747 = _1741;
    float _1749 = _1719;
    float _1751 = _1693;
    float _1753 = _1695;
    float _1755 = _1699;
    float _1757 = _1707;
    if (!_1739)
    {
        _1747 = _1695;
    }
    float _1759 = _1747;
    float _1761 = _1759;
    if (!_1739)
    {
        _1749 = _1689;
    }
    float _1763 = _1749;
    float _1765 = _1763;
    if (!_1739)
    {
        _1751 = _1727;
    }
    float _1767 = _1751;
    bool _1769 = !_1739;
    float _1771 = _1767;
    if (!_1769)
    {
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1777 = _1721 + _1775;
        float _1779 = rsqrt(_1715);
        float _1781 = _1777 * _1773;
        float _1783 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1785 = _1781 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = _1785 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = _1789 + (-1.0);
        float _1797 = fma(_1793, _1783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1799 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1801 = _1779 * _1797;
        float _1803 = fma(_1727, _1789, _1799);
        float _1805 = fma(_1707, _1801, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1807 = fma(_1699, _1801, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1761 = _1805;
        _1771 = _1803;
        _1765 = _1807;
        _1753 = _1785;
    }
    float _1809 = _1761;
    float _1811 = _1771;
    float _1813 = _1765;
    float _1815 = _1753;
    float _1817 = _1815;
    float _1819 = _1811;
    float _1821 = _1813;
    if (_1571)
    {
        _1817 = 1.0;
    }
    float _1823 = _1817;
    float _1825 = _1823;
    if (_1555)
    {
        _1755 = _1809;
    }
    float _1827 = _1755;
    float _1829 = _1827;
    if (!_1555)
    {
        float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1833 = _1701 + _1831;
        float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1837 = _1685 + _1835;
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1841 = -_1685;
        float _1843 = _1841 + _1809;
        float _1845 = _1833 * _1833;
        float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1849 = _1677 + _1847;
        float _1851 = -_1701;
        float _1853 = _1851 + _1811;
        float _1855 = fma(_1837, _1837, _1845);
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1859 = fma(_1849, _1849, _1855);
        float _1861 = sqrt(_1859);
        float _1863 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = precise::min(_1861, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1867 = _1865 * _1857;
        float _1869 = _1863 * _1867;
        float _1871 = -_1677;
        float _1873 = _1871 + _1813;
        float _1875 = fma(_1843, _1869, _1685);
        float _1877 = fma(_1853, _1869, _1701);
        float _1879 = fma(_1873, _1869, _1677);
        _1757 = _1861;
        _1819 = _1877;
        _1829 = _1875;
        _1821 = _1879;
    }
    float _1881 = _1757;
    float _1883 = _1819;
    float _1885 = _1829;
    float _1887 = _1821;
    float _1889 = _1881;
    if (!_1571)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1899 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1897);
        float _1901 = _1893 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        float _1905 = _1895 * 0.15915493667125701904296875;
        float _1907 = _1893 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        float _1911 = 1.0 / _1903;
        float _1913 = _1905 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = _1905 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        float _1923 = _1915 * _1917;
        float _1925 = 1.0 / _1899;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1927;
        float _1931 = 1.0 / _1923;
        float _1933 = 1.0 / _1929;
        float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1937 = _1925 * _1935;
        float _1939 = _1921 * _1931;
        float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1943 = fma(_1939, _1937, _1941);
        float _1945 = _1943 * _1933;
        float _1947 = precise::clamp(_1945, 0.0, 1.0);
        _1889 = _1933;
        _1825 = _1947;
    }
    float _1949 = _1889;
    float _1951 = _1825;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1955 = _1883 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1959 = _1885 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1963 = _1887 + _1961;
    float _1965 = _1955 * _1955;
    float _1967 = fma(_1959, _1959, _1965);
    float _1969 = fma(_1963, _1963, _1967);
    float _1971 = rsqrt(_1969);
    float _1973 = sqrt(_1969);
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1977 = _1959 * _1975;
    float _1979 = _1963 * _1975;
    float _1981 = _1977 * _1977;
    float _1983 = _1979 * _1979;
    float _1985 = _1981 + _1983;
    float _1987 = sqrt(_1985);
    bool _1989 = _1987 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1993 = _1987 + _1991;
    float _1995 = _1963;
    float _1997 = _1985;
    float _1999 = _1993;
    float _2001 = _1965;
    float _2003 = _1975;
    if (_1989)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (_1989)
    {
        float _2009 = rsqrt(_1985);
        _1997 = _2009;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1989)
    {
        float _2015 = _1993 * _2007;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1989)
    {
        float _2019 = _2017 * 0.15915493667125701904296875;
        _2001 = _2019;
    }
    float _2021 = _2001;
    float _2023 = _2007;
    float _2025 = _2021;
    if (_1989)
    {
        float _2027 = _2021 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        _2023 = _2029;
    }
    float _2031 = _2023;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2035 = precise::max(0.0, _2033);
    float _2037 = _1949;
    float _2039 = _2035;
    if (_1989)
    {
        float _2041 = _2021 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        _2037 = _2043;
    }
    float _2045 = _2037;
    float _2047 = -_1975;
    float _2049 = -_2035;
    float _2051 = fma(_1955, _2047, _2049);
    float _2053 = _2051;
    if (_1989)
    {
        float _2055 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2039 = _2055;
    }
    float _2057 = _2039;
    float _2059 = _2031;
    float _2061 = _2057;
    if (_1989)
    {
        float _2063 = fma(_2031, _2057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = _2065;
    float _2069 = _2045;
    if (_1989)
    {
        float _2071 = _2045 + (-1.0);
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _2073;
    if (_1989)
    {
        float _2077 = _2011 * _2065;
        _2003 = _2077;
    }
    float _2079 = _2003;
    if (!_1989)
    {
        _2067 = _1977;
    }
    float _2081 = _2067;
    float _2083 = _2081;
    if (_1989)
    {
        float _2085 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2085;
    }
    float _2087 = _2025;
    if (_1989)
    {
        float _2089 = _1977 * _2079;
        _2083 = _2089;
    }
    float _2091 = _2083;
    if (!_1989)
    {
        _2075 = _1979;
    }
    float _2093 = _2075;
    float _2095 = _2093;
    if (_1989)
    {
        float _2097 = _1979 * _2079;
        _2095 = _2097;
    }
    float _2099 = _2095;
    if (!_1989)
    {
        _2013 = _1981;
    }
    float _2101 = _2013;
    float _2103 = _2101;
    if (_1989)
    {
        float _2105 = fma(_2051, _2045, _2087);
        _2053 = _2105;
    }
    float _2107 = _2053;
    if (_1989)
    {
        float _2109 = _2091 * _2091;
        _2103 = _2109;
    }
    float _2111 = _2103;
    if (!_1989)
    {
        _2069 = _1983;
    }
    float _2113 = _2069;
    float _2115 = _2113;
    if (_1989)
    {
        float _2117 = _2099 * _2099;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = fma(_2107, _2107, _2111);
    float _2123 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2125 = _2121 + _2119;
    float _2127 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2123);
    float _2129 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2133 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2131);
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = rsqrt(_2125);
    float _2139 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2141 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2127);
    float _2143 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2147 = -_2135;
    float _2149 = _2147 + 1.0;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2155 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2157 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2145);
    float _2159 = abs(_2149);
    float _2161 = log2(_2159);
    float _2163 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2153);
    float _2165 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2155);
    float _2167 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2169 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2171 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2163);
    float _2173 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2177 = _2137 * _2091;
    float _2179 = _2137 * _2107;
    float _2181 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2183 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2175);
    float _2185 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2187 = _2137 * _2099;
    float _2189 = -_2169;
    float _2191 = fma(_2189, _2139, 1.0);
    float _2193 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2183);
    float _2195 = -_2185;
    float _2197 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2195);
    float _2199 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2201 = log2(_2191);
    float _2203 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2193);
    float _2205 = -_2187;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2197);
    float _2209 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2211 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2213 = fma(_2207, -0.5, 0.5);
    float _2215 = fma(_2207, 0.5, 0.5);
    float _2217 = 1.0 / _2203;
    float _2219 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2209);
    float _2221 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2211);
    float _2223 = fma(_2215, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2225 = _2179 + 1.0;
    float _2227 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2219);
    float _2229 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2221);
    float _2231 = fma(_2215, _2223, -0.212114393711090087890625);
    float _2233 = exp2(_2199);
    float _2235 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2227);
    float _2237 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2229);
    float _2239 = _2201 * 0.693147182464599609375;
    float _2241 = fma(_2215, _2231, 1.570728778839111328125);
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = sqrt(_2213);
    float _2247 = _2237 * _2217;
    float _2249 = -_2179;
    float _2251 = fma(_2233, _2225, _2249);
    float _2253 = _2235 * _2217;
    float _2255 = fma(_2251, 0.5, 0.5);
    float _2257 = fma(_2253, 0.5, 0.5);
    float _2259 = _2245 * 0.636619746685028076171875;
    float _2261 = fma(_2247, -0.5, 0.5);
    float _2263 = -_2241;
    float _2265 = fma(_2259, _2263, 1.0);
    float3 _6413 = float3(_2257, _2261, _2243);
    float _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6413, float3(0.0), isnan(_6413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6413, float3(0.0), isnan(_6413)), level(0.0)).x;
    float3 _6424 = float3(_2257, _2261, _2243);
    float4 _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6424, float3(0.0), isnan(_6424)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6424, float3(0.0), isnan(_6424)), level(0.0)).xyzw;
    float _2272 = _2270.x;
    float _2274 = _2270.y;
    float _2276 = _2270.z;
    float _2278 = _2270.w;
    float2 _6441 = float2(_2265, _2255);
    float3 _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6441, float2(0.0), isnan(_6441)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6441, float2(0.0), isnan(_6441)), level(0.0)).xyz;
    float _2284 = _2282.x;
    float _2286 = _2282.y;
    float _2288 = _2282.z;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2292 = _1151 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2296 = _1151 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2300 = _2298 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2308 = _2306 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2310 = 1.0 / _2300;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2320 = _1153 > 0.5;
    float _2322 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2324 = _2322 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2326 = _1357 * (-0.15915493667125701904296875);
    float _2328 = 1.0 / _2304;
    bool _2330 = _1159 > 0.5;
    float _2332 = -_1441;
    float _2334 = _2332 + 1.0;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2346 = _2344 != 0;
    float _2348 = -_1437;
    float _2350 = _2348 + 1.0;
    float _2352 = 1.0 / _2308;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2356 = _2354 != 0;
    float _2358 = -_1469;
    float _2360 = _2358 + 1.0;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2364 = _2362 != 0;
    float _2366 = -_1467;
    float _2368 = _2366 + 1.0;
    bool _2370 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2372 = isnan(_1151);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2384 = 1.0 / _2324;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2394 = 1.0 / _2314;
    float _2396 = _2388 * _2310;
    float _2398 = _2392 * _2328;
    float _2400 = _2338 * _2352;
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2402;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2410 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2412 = isnan(_1151);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = 1.0 / _2318;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2428 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2430 = isnan(_1151);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = _2342 * _2384;
    float _2442 = -_2420;
    float _2444 = _2442 + 1.0;
    float _2446 = -_165;
    int _2448 = _2320 ? as_type<int>(_2446) : as_type<int>(_165);
    float _2450 = fma(_2400, _2292, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2454 = _2452 != 0;
    float _2456 = _2404 * _2394;
    bool _2458 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2460 = isnan(_1151);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    float _2470 = _2438 * _2444;
    float _2472 = 1.0 / _2408;
    bool _2474 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2476 = isnan(_1151);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2482 = _2478 || _2480;
    float _2484 = float(_2482);
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2486;
    float _2490 = -_2468;
    float _2492 = _2490 + 1.0;
    bool _2494 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2496 = isnan(_1151);
    bool _2498 = _2494 || _2496;
    bool _2500 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2502 = _2498 || _2500;
    float _2504 = float(_2502);
    float _2506 = _2426 * _2422;
    float _2508 = -_2438;
    float _2510 = _2508 + 1.0;
    float _2512 = -_2484;
    float _2514 = _2512 + 1.0;
    bool _2516 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2518 = isnan(_1151);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = fma(_2396, _2296, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2530 = _2468 * _2510;
    bool _2532 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2534 = isnan(_1151);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2540 = _2536 || _2538;
    float _2542 = float(_2540);
    float _2544 = _2420 * _2514;
    float _2546 = _2326 * 6.283185482025146484375;
    float _2548 = sin(_2546);
    float _2550 = _2526 * _2492;
    float _2552 = -_2526;
    float _2554 = _2552 + 1.0;
    float _2556 = -_2542;
    float _2558 = _2556 + 1.0;
    float _2560 = _2488 * _2472;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2564 = _1151 + _2562;
    float _2566 = _2542 * _2554;
    float _2568 = _2380 * _2558;
    float _2570 = -_2380;
    float _2572 = _2570 + 1.0;
    float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2576 = fma(_2440, _2564, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2580 = _1151 + _2578;
    float _2582 = _2504 * _2572;
    float _2584 = -_2504;
    float _2586 = _2584 + 1.0;
    bool _2588 = !_2346;
    float _2590 = _2588 ? _165 : as_type<float>(_2448);
    float _2592 = fma(_2398, _2580, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2594 = _2450 * _2582;
    float _2596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2600 = _1151 + _2598;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2604 = _1151 + _2602;
    float _2606 = fma(_2586, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2594);
    float _2608 = fma(_2506, _2600, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2612 = _1151 + _2610;
    float _2614 = fma(_2576, _2568, _2606);
    float _2616 = _2326 * 6.283185482025146484375;
    float _2618 = cos(_2616);
    float _2620 = -_169;
    int _2622 = _1187 ? as_type<int>(_2620) : as_type<int>(_169);
    float _2624 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2626 = fma(_2456, _2604, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2628 = _2590 + 0.5;
    bool _2630 = !_2356;
    float _2632 = _2630 ? _169 : as_type<float>(_2622);
    float _2634 = fma(_2560, _2612, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2636 = fma(_2528, _2566, _2614);
    float _2638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2640 = _1297 * _2548;
    float _2642 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2644 = fma(_2624, _2628, _1455);
    float _2646 = _2632 + (-0.5);
    float _2648 = fma(_2592, _2550, _2636);
    float _2650 = -_2640;
    float _2652 = fma(_1281, _2618, _2650);
    float _2654 = -_2642;
    float _2656 = -_1203;
    float _2658 = fma(_2654, _2646, _2656);
    float _2660 = _1297 * _2618;
    float _2662 = -_165;
    int _2664 = _1267 ? as_type<int>(_2662) : as_type<int>(_165);
    float _2666 = _2652 + 0.5;
    float _2668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2670 = fma(_2626, _2530, _2648);
    bool _2672 = !_2454;
    float _2674 = _2672 ? _165 : as_type<float>(_2664);
    float _2676 = _2638 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2678 = fma(_2632, _2360, _2658);
    float _2680 = fma(_1281, _2548, _2660);
    float _2682 = fma(_2608, _2470, _2670);
    float _2684 = fma(_2676, _2666, _1361);
    float _2686 = -_169;
    int _2688 = _2330 ? as_type<int>(_2686) : as_type<int>(_169);
    float _2690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2692 = _2674 + 0.5;
    float _2694 = -_2334;
    float _2696 = fma(_2652, _2694, _2684);
    bool _2698 = !_2364;
    float _2700 = _2698 ? _169 : as_type<float>(_2688);
    float _2702 = _2680 + (-0.5);
    float _2704 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2706 = fma(_2634, _2544, _2682);
    bool _2708 = _1951 > 0.0;
    bool _2710 = isnan(_1951);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(0.0);
    bool _2716 = _2712 || _2714;
    float _2718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2720 = -_2700;
    float _2722 = _2720 + 0.5;
    float _2724 = -_2350;
    float _2726 = fma(_2590, _2724, _2644);
    float _2728 = _2692 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2730 = -_1605;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2704);
    float _2734 = _2722 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2736 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2706);
    float _2738 = _2728 * _2668;
    float _2740 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2742 = _2734 * _2690;
    float _2744 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2746 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2748 = -_1605;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2740);
    out.m_62.x = _2736;
    float _2752 = -_1605;
    float _2754 = fma(_2752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2744);
    float _2756 = exp2(_2382);
    float _2758 = _2718 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_64.x = _2726;
    out.m_64.y = _2678;
    out.m_64.z = _2738;
    out.m_64.w = _2742;
    float _2760 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2746);
    float _2762 = -_2758;
    float _2764 = -_1365;
    float _2766 = fma(_2762, _2702, _2764);
    float _2768 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2750);
    float _2770 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2754);
    float _2772 = fma(_2680, _2368, _2766);
    float _2774 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2776 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _2696;
    out.m_66.y = _2772;
    float _2778 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2774);
    float _2780 = _169 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2782 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2732);
    float _2784 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2786 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2788 = fma(_2780, _2780, 1.0);
    float _2790 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2776);
    float _2792 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2778);
    float _2794 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2786);
    float _2796 = rsqrt(_2788);
    float _2798 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2784);
    float _2800 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2802 = _165 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2804 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2790);
    float _2806 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2798);
    float _2808 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2800);
    float _2810 = _2780 * _2768;
    float _2812 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2760);
    float _2814 = _2780 * _2782;
    float _2816 = _2780 * _2770;
    float _2818 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2794);
    float _2820 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2808);
    float _2822 = fma(_2802, _2792, _2810);
    float _2824 = fma(_2802, _2804, _2814);
    float _2826 = fma(_2802, _2812, _2816);
    float _2828 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2830 = _2780 * _2796;
    float _2832 = _2806 + _2822;
    float _2834 = _2818 + _2824;
    float _2836 = _2820 + _2826;
    float _2838 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2828);
    float _2840 = -_2756;
    float _2842 = _2840 + 1.0;
    float _2844 = -_2806;
    float _2846 = _2830 * _2844;
    float _2848 = -_2818;
    float _2850 = _2830 * _2848;
    out.m_68.x = _2832;
    out.m_68.y = _2834;
    out.m_68.z = _2836;
    float _2852 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2838);
    float _2854 = fma(_2796, _2768, _2846);
    float _2856 = -_2820;
    float _2858 = _2830 * _2856;
    float _2860 = fma(_2796, _2782, _2850);
    float _2862 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2864 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2852);
    float _2866 = fma(_2796, _2770, _2858);
    float _2868 = _2203 * 0.5;
    float _2870 = _2235 + _2203;
    float _2872 = _2864 + _2203;
    float _2874 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2876 = _2862 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2878 = fma(_2237, -0.5, _2868);
    float _2880 = _2872 * 0.5;
    float _2882 = -_2874;
    float _2884 = _2882 + 1.0;
    float _2886 = _2870 * 0.5;
    out.m_70.x = _2792;
    out.m_70.y = _2804;
    out.m_70.z = _2812;
    out.m_72.x = _2854;
    out.m_72.y = _2860;
    out.m_72.z = _2866;
    out.gl_Position.x = _2235;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2864;
    out.gl_Position.w = _2203;
    out.m_74.x = _2886;
    out.m_74.y = _2878;
    out.m_74.z = _2880;
    out.m_74.w = _2203;
    out.m_45.x = _2876;
    float _2888 = _2874 * _2267;
    float _2890 = _2278 * _2884;
    float _2892 = _2278 * _2888;
    float _2894 = _2288 * _2888;
    float _2896 = fma(_2284, _2892, _2272);
    float _2898 = fma(_2286, _2892, _2274);
    float _2900 = fma(_2278, _2894, _2276);
    out.m_76.x = _2896;
    out.m_76.y = _2898;
    out.m_76.z = _2900;
    out.m_76.w = _2890;
    if (_2716)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2902 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2902;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1143 = false;
    bool _1001 = false;
    bool _833 = false;
    bool _653 = false;
    bool _477 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2959 = as_type<float>(_111);
        out.gl_Position.z = _2959;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3029 = as_type<float>(_149);
        out.gl_Position.z = _3029;
    }
    if (_141)
    {
        return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _155 = as_type<int>(_151) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_151) & 2;
    bool _161 = _159 != 0;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_153;
    float _189;
    if (!_171)
    {
        float _173 = in.m_52.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_95);
        float _195 = 1.0 / _193;
        float _197 = _129 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _211 = _209 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _221 = 1.0 / _207;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _223;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _229 = 1.0 / _211;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _199 + _231;
    float _235 = 1.0 / _219;
    float _237 = _233 * _221;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _199 + _239;
    bool _243 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _245 = isnan(_199);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _215;
    float _257 = _203 * _229;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _199 + _259;
    bool _263 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_199);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _225;
    float _277 = _261 * _235;
    bool _279 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _281 = isnan(_199);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = _199 + _291;
    float _295 = -_289;
    float _297 = _295 + 1.0;
    float _299 = _241 * _255;
    bool _301 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _303 = isnan(_199);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -_311;
    float _315 = _313 + 1.0;
    float _317 = _311 * _297;
    float _319 = _293 * _275;
    float _321 = -_253;
    float _323 = _321 + 1.0;
    bool _325 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_199);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _273 * _315;
    float _339 = -_273;
    float _341 = _339 + 1.0;
    float _343 = _289 * _323;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _353 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_199);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _335 * _341;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -_335;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = fma(_347, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _381 = fma(_369, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = _363 * _373;
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = fma(_377, _257, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = fma(_351, _257, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = _381 * _383;
    float _395 = _379 * _383;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = fma(_399, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _415 = fma(_403, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _421 = fma(_389, _365, _405);
    float _423 = fma(_391, _365, _407);
    float _425 = fma(_411, _277, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _427 = fma(_419, _277, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _433;
    float _437 = fma(_413, _337, _421);
    float _439 = fma(_415, _337, _423);
    float _441 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _443 = fma(_435, _319, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _445 = fma(_425, _317, _437);
    float _447 = fma(_427, _317, _439);
    float _449 = fma(_441, _343, _445);
    float _451 = fma(_443, _343, _447);
    float _453 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[148].x, _449);
    float _455 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[148].y, _451);
    bool _457 = !_227;
    float _475;
    if (!_457)
    {
        float _459 = in.m_52.x;
        float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _467 = _465 * _461;
        float _469 = floor(_467);
        float _471 = -_469;
        float _473 = _467 + _471;
        _475 = _473;
        _477 = true;
    }
    else
    {
        float _479 = float(_95);
        float _481 = 1.0 / _479;
        float _483 = _129 * _481;
        _475 = _483;
    }
    _477 = false;
    float _485 = _475;
    float _487 = in.m_54.x;
    float _489 = in.m_54.y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = _485 + _491;
    bool _495 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _497 = isnan(_485);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _515 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _517 = isnan(_485);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_505;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _509;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = 1.0 / _513;
    float _537 = _455 * _489;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = _493 * _531;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _547 = _485 + _545;
    bool _549 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _551 = isnan(_485);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _561;
    float _565 = fma(_541, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = _559 * _529;
    float _569 = -_559;
    float _571 = _569 + 1.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _573;
    float _577 = fma(_563, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _579 = _547 * _535;
    float _581 = _525 * _571;
    float _583 = fma(_575, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _585 = -_525;
    float _587 = _585 + 1.0;
    float _589 = _565 * _581;
    float _591 = _583 * _581;
    float _593 = _577 * _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _607 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].x, _591);
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].y, _589);
    float _611 = fma(_597, _579, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _613 = fma(_601, _579, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _615 = fma(_605, _579, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _617 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].z, _593);
    float _619 = fma(_611, _567, _607);
    float _621 = fma(_613, _567, _609);
    float _623 = fma(_615, _567, _617);
    float _625 = _453 * _487;
    float _627 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].x, _619);
    float _629 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].y, _621);
    float _631 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].z, _623);
    bool _633 = !_533;
    float _651;
    if (!_633)
    {
        float _635 = in.m_52.x;
        float _637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _639 = _635 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _643 = _641 * _637;
        float _645 = floor(_643);
        float _647 = -_645;
        float _649 = _643 + _647;
        _651 = _649;
        _653 = true;
    }
    else
    {
        float _655 = float(_95);
        float _657 = 1.0 / _655;
        float _659 = _129 * _657;
        _651 = _659;
    }
    _653 = false;
    float _661 = _651;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _665 = _661 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _675 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_661);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _691 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_661);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = 1.0 / _669;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    float _709 = -_685;
    float _711 = _709 + 1.0;
    bool _713 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _715 = isnan(_661);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _727 = 1.0 / _673;
    float _729 = 1.0 / _689;
    float _731 = _707 * _703;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _737 = _701 * _711;
    float _739 = -_701;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, _665, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _745;
    float _749 = _723 * _741;
    float _751 = _735 * _727;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _755 = _661 + _753;
    bool _757 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _759 = isnan(_661);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _743 * _749;
    float _771 = -_723;
    float _773 = _771 + 1.0;
    float _775 = fma(_751, _755, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _661 + _777;
    float _781 = _747 * _729;
    float _783 = -_767;
    float _785 = _783 + 1.0;
    float _787 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[115].x, _769);
    float _789 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _791 = fma(_781, _779, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _793 = _685 * _785;
    float _795 = fma(_775, _737, _787);
    float _797 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = fma(_791, _793, _795);
    float _801 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _803 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _805 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _799);
    float _807 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _797;
    out.m_56.y = _807;
    out.m_56.z = _809;
    out.m_56.w = _811;
    bool _813 = !_725;
    float _831;
    if (!_813)
    {
        float _815 = in.m_52.x;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _819 = _815 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_95);
        float _837 = 1.0 / _835;
        float _839 = _129 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = _841 + _843;
    bool _847 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _849 = isnan(_841);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _861 = _841 + _859;
    bool _863 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _865 = isnan(_841);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _883 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _885 = isnan(_841);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = -_857;
    float _897 = _895 + 1.0;
    float _899 = 1.0 / _881;
    float _901 = _893 * _897;
    float _903 = -_893;
    float _905 = _903 + 1.0;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _907;
    bool _911 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _913 = 1.0 / _877;
    float _915 = _873 * _905;
    float _917 = -_873;
    float _919 = _917 + 1.0;
    float _921 = _861 * _899;
    float _923 = _845 * _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _929;
    float _933 = fma(_909, _923, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _935 = fma(_927, _923, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _937 = fma(_931, _923, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _939 = _933 * _915;
    float _941 = _935 * _915;
    float _943 = _937 * _915;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _957 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].x, _939);
    float _959 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].y, _941);
    float _961 = fma(_947, _921, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _963 = fma(_951, _921, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _965 = fma(_955, _921, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _967 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].z, _943);
    float _969 = fma(_961, _901, _957);
    float _971 = fma(_963, _901, _959);
    float _973 = fma(_965, _901, _967);
    float _975 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].x, _969);
    float _977 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].y, _971);
    float _979 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].z, _973);
    bool _981 = !_911;
    float _999;
    if (!_981)
    {
        float _983 = in.m_52.x;
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _987 = _983 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _991 = _989 * _985;
        float _993 = floor(_991);
        float _995 = -_993;
        float _997 = _991 + _995;
        _999 = _997;
        _1001 = true;
    }
    else
    {
        float _1003 = float(_95);
        float _1005 = 1.0 / _1003;
        float _1007 = _129 * _1005;
        _999 = _1007;
    }
    _1001 = false;
    float _1009 = _999;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1013 = _1009 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1019 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1021 = isnan(_1009);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1035 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1037 = isnan(_1009);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1047;
    bool _1051 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1053 = isnan(_1009);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = 1.0 / _1017;
    float _1065 = -_1029;
    float _1067 = _1065 + 1.0;
    bool _1069 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1071 = _1045 * _1067;
    float _1073 = -_1045;
    float _1075 = _1073 + 1.0;
    float _1077 = 1.0 / _1033;
    float _1079 = _1049 * _1063;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1085 = fma(_1079, _1013, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1087 = _1083 * _1077;
    float _1089 = _1085 * _1071;
    float _1091 = -_1061;
    float _1093 = _1091 + 1.0;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1097 = _1009 + _1095;
    float _1099 = _975 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1089);
    float _1103 = _1029 * _1093;
    float _1105 = fma(_1087, _1097, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1107 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = fma(_1105, _1103, _1101);
    float _1111 = _977 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1113 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1117 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1109);
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _1113;
    out.m_58.y = _1119;
    out.m_58.z = _1115;
    out.m_58.w = _1121;
    bool _1123 = !_1069;
    float _1141;
    if (!_1123)
    {
        float _1125 = in.m_52.x;
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1129 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _1133 = _1131 * _1127;
        float _1135 = floor(_1133);
        float _1137 = -_1135;
        float _1139 = _1133 + _1137;
        _1141 = _1139;
        _1143 = true;
    }
    else
    {
        float _1145 = float(_95);
        float _1147 = 1.0 / _1145;
        float _1149 = _129 * _1147;
        _1141 = _1149;
    }
    _1143 = false;
    float _1151 = _1141;
    float _1153 = in.m_52.x;
    float _1155 = in.m_52.y;
    float _1157 = in.m_52.z;
    float _1159 = in.m_52.w;
    float _1161 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1163 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1171 = _1169 != 0;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1179 = _1157 * 2.0;
    float _1181 = _1153 * 2.0;
    float _1183 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1185 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1187 = _1155 > 0.5;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = floor(_1179);
    float _1193 = fma(_1183, -2.0, _1165);
    float _1195 = -_1167;
    float _1197 = fma(_1185, 2.0, _1195);
    float _1199 = _1155 + _1153;
    float _1201 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1203 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1193);
    float _1205 = _1153 + (-0.5);
    float _1207 = _1199 + (-1.0);
    float _1209 = floor(_1181);
    bool _1211 = _1191 > 0.0;
    bool _1213 = _1191 >= 0.0;
    bool _1215 = isnan(_1191);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.0);
    bool _1221 = _1217 || _1219;
    float _1223 = _1221 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1231 = _1229 != 0;
    float _1233 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1235 = _1209 > 0.0;
    bool _1237 = _1209 >= 0.0;
    bool _1239 = isnan(_1209);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan(0.0);
    bool _1245 = _1241 || _1243;
    float _1247 = _1155 * 2.0;
    int _1249 = ~as_type<int>(_1223);
    int _1251 = _1249 + 1;
    int _1253 = _1251 + 1;
    int _1255 = _1253;
    float _1257 = _1223;
    float _1259 = _1207;
    if (!_1211)
    {
        int _1261 = ~as_type<int>(_1223);
        int _1263 = _1261 + 1;
        _1255 = _1263;
    }
    int _1265 = _1255;
    bool _1267 = _1157 > 0.5;
    float _1269 = floor(_1247);
    float _1271 = -_165;
    float _1273 = _1187 ? _1271 : _165;
    float _1275 = -_169;
    int _1277 = _1267 ? as_type<int>(_1275) : as_type<int>(_169);
    bool _1279 = !_1227;
    float _1281 = _1279 ? _165 : _1273;
    float _1283 = _1273;
    if (_1171)
    {
        _1257 = _1153;
    }
    float _1285 = _1257;
    float _1287 = _1285;
    if (_1171)
    {
        _1283 = _1155;
    }
    float _1289 = _1283;
    float _1291 = _1289;
    if (_1171)
    {
        _1259 = _1157;
    }
    float _1293 = _1259;
    bool _1295 = !_1231;
    float _1297 = _1295 ? _169 : as_type<float>(_1277);
    float _1299 = _1293;
    if (!_1171)
    {
        _1287 = _1157;
    }
    float _1301 = _1287;
    if (!_1171)
    {
        _1291 = _1153;
    }
    float _1303 = _1291;
    if (!_1171)
    {
        _1299 = _1155;
    }
    float _1305 = _1299;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1313 = _1311 != 0;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1317 = _1315 != 0;
    int _1319 = _1245 ? 0 : 1;
    float _1321 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1173);
    bool _1323 = _1269 > 0.0;
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1327 = !_1309;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1333 = _1269 >= 0.0;
    bool _1335 = isnan(_1269);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = -_1175;
    float _1345 = fma(_1325, 2.0, _1343);
    float _1347 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1349 = log2(_1347);
    int _1351 = abs(_1329);
    float _1353 = fma(_1331, -2.0, _1177);
    float _1355 = float(_1265);
    float _1357 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1321);
    float _1359 = -_129;
    float _1361 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1345);
    int _1363 = _1341 ? 0 : 1;
    float _1365 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1353);
    float _1367 = float(_1351);
    int _1369 = ~_1363;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    int _1375 = _1373;
    if (!_1323)
    {
        int _1377 = ~_1363;
        int _1379 = _1377 + 1;
        _1375 = _1379;
    }
    int _1381 = _1375;
    float _1383 = _1367 * _1355;
    float _1385 = in.m_60.x;
    float _1387 = in.m_60.y;
    float _1389 = in.m_60.z;
    float _1391 = _1349 * _129;
    int _1393 = ~_1319;
    int _1395 = _1393 + 1;
    int _1397 = _1395 + 1;
    float _1399 = exp2(_1391);
    int _1401 = _1397;
    if (!_1235)
    {
        int _1403 = ~_1319;
        int _1405 = _1403 + 1;
        _1401 = _1405;
    }
    int _1407 = _1401;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1413 = 1.0 + _1411;
    float _1415 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1409);
    bool _1417 = !_1313;
    int _1419 = _1417 ? 0 : 1;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1423 = 1.0 / _1413;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1427 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1429 = isnan(1.0);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1415);
    float _1439 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1421);
    float _1441 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1201);
    float _1443 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1425);
    float _1445 = _1383 * (-2.0);
    float _1447 = -_1399;
    float _1449 = _1447 + 1.0;
    int _1451 = abs(_1419);
    float _1453 = -_129;
    float _1455 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1197);
    bool _1457 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1459 = isnan(0.0);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1465 = _1461 || _1463;
    float _1467 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1439);
    float _1469 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1443);
    float _1471 = fma(_1445, _1385, _1385);
    float _1473 = float(_1407);
    float _1475 = fma(_1233, _1445, _1233);
    float _1477 = float(_1451);
    float _1479 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1471);
    float _1481 = _1465 ? _1449 : 0.0;
    bool _1483 = !_1317;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1477 * _1473;
    float _1489 = _1155 + _1157;
    if (_1435)
    {
        float _1491 = _1481 * _1423;
        _131 = _1491;
    }
    float _1493 = _131;
    int _1495 = abs(_1485);
    float _1497 = fma(_1475, _1493, _1479);
    float _1499 = _1489 + (-1.0);
    float _1501 = float(_1381);
    float _1503 = _1487 * (-2.0);
    float _1505 = float(_1495);
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1509 = _1155 + (-0.5);
    float _1511 = fma(_1503, _1387, _1387);
    float _1513 = _1157 + _1153;
    float _1515 = _1505 * _1501;
    float _1517 = fma(_1507, _1503, _1507);
    float _1519 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1511);
    float _1521 = _1513 + (-1.0);
    float _1523 = _1515 * (-2.0);
    float _1525 = fma(_1517, _1493, _1519);
    float _1527 = _1157 + (-0.5);
    float _1529 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1531 = fma(_1523, _1389, _1389);
    float _1533 = _1497 * 0.15915493667125701904296875;
    float _1535 = _1525 * 0.15915493667125701904296875;
    float _1537 = fma(_1529, _1523, _1529);
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1531);
    float _1541 = _1533 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    bool _1547 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1555 = _1551 || _1553;
    float _1557 = fma(_1537, _1493, _1539);
    float _1559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _165);
    float _1561 = _1161 * _1545;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    float _1573 = _1557 * 0.15915493667125701904296875;
    float _1575 = _1535 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = in.m_42.x;
    float _1581 = in.m_42.y;
    float _1583 = in.m_42.z;
    float _1585 = _1163 * _1559;
    float _1587 = _1535 * 6.283185482025146484375;
    float _1589 = cos(_1587);
    float _1591 = _1533 * 6.283185482025146484375;
    float _1593 = sin(_1591);
    float _1595 = _1543 * _1577;
    float _1597 = _1573 * 6.283185482025146484375;
    float _1599 = cos(_1597);
    float _1601 = _1543 * _1589;
    float _1603 = _1573 * 6.283185482025146484375;
    float _1605 = sin(_1603);
    float _1607 = _1593 * _1577;
    float _1609 = _1593 * _1589;
    float _1611 = _1543 * _1599;
    float _1613 = _1593 * _1599;
    float _1615 = _1589 * _1599;
    float _1617 = _1577 * _1599;
    float _1619 = _1611 * _1561;
    float _1621 = _1613 * _1561;
    float _1623 = fma(_1605, _1601, _1607);
    float _1625 = -_1595;
    float _1627 = fma(_1605, _1609, _1625);
    float _1629 = -_1609;
    float _1631 = fma(_1605, _1595, _1629);
    float _1633 = -_1561;
    float _1635 = _1605 * _1633;
    float _1637 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1639 = fma(_1623, _1585, _1619);
    float _1641 = fma(_1627, _1585, _1621);
    float _1643 = fma(_1615, _1585, _1635);
    float _1645 = fma(_1605, _1607, _1601);
    float _1647 = fma(_1631, _1637, _1639);
    float _1649 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1651 = fma(_1617, _1637, _1643);
    float _1653 = fma(_1645, _1637, _1641);
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1657 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1649);
    float _1659 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1663 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1655);
    float _1665 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1657);
    float _1667 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1659);
    float _1669 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1661);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1663);
    float _1673 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1675 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1667);
    float _1677 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1679 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1669);
    float _1681 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1683 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1673);
    float _1685 = _1675 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1687 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1689 = _1677 + _1681;
    float _1691 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1683);
    float _1693 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1695 = _1685 + _1687;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1699 = _1689 + _1697;
    float _1701 = _1691 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1693);
    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1707 = _1695 + _1705;
    float _1709 = _1699 * _1699;
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1713 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1703);
    float _1715 = fma(_1707, _1707, _1709);
    float _1717 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1711);
    float _1719 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1721 = sqrt(_1715);
    float _1723 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1725 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1727 = _1701 + _1719;
    float _1729 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1731 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1725);
    float _1733 = 1.0 / _1729;
    float _1735 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1737 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1739 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = _1737 + _1729;
    float _1743 = _1741 * _1733;
    float _1745 = _1743 * 0.5;
    float _1747 = _1741;
    float _1749 = _1719;
    float _1751 = _1693;
    float _1753 = _1695;
    float _1755 = _1699;
    float _1757 = _1707;
    if (!_1739)
    {
        _1747 = _1695;
    }
    float _1759 = _1747;
    float _1761 = _1759;
    if (!_1739)
    {
        _1749 = _1689;
    }
    float _1763 = _1749;
    float _1765 = _1763;
    if (!_1739)
    {
        _1751 = _1727;
    }
    float _1767 = _1751;
    bool _1769 = !_1739;
    float _1771 = _1767;
    if (!_1769)
    {
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1777 = _1721 + _1775;
        float _1779 = rsqrt(_1715);
        float _1781 = _1777 * _1773;
        float _1783 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1785 = _1781 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = _1785 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = _1789 + (-1.0);
        float _1797 = fma(_1793, _1783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1799 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1801 = _1779 * _1797;
        float _1803 = fma(_1727, _1789, _1799);
        float _1805 = fma(_1707, _1801, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1807 = fma(_1699, _1801, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1761 = _1805;
        _1771 = _1803;
        _1765 = _1807;
        _1753 = _1785;
    }
    float _1809 = _1761;
    float _1811 = _1771;
    float _1813 = _1765;
    float _1815 = _1753;
    float _1817 = _1815;
    float _1819 = _1811;
    float _1821 = _1813;
    if (_1571)
    {
        _1817 = 1.0;
    }
    float _1823 = _1817;
    float _1825 = _1823;
    if (_1555)
    {
        _1755 = _1809;
    }
    float _1827 = _1755;
    float _1829 = _1827;
    if (!_1555)
    {
        float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1833 = _1701 + _1831;
        float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1837 = _1685 + _1835;
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1841 = -_1685;
        float _1843 = _1841 + _1809;
        float _1845 = _1833 * _1833;
        float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1849 = _1677 + _1847;
        float _1851 = -_1701;
        float _1853 = _1851 + _1811;
        float _1855 = fma(_1837, _1837, _1845);
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1859 = fma(_1849, _1849, _1855);
        float _1861 = sqrt(_1859);
        float _1863 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = precise::min(_1861, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1867 = _1865 * _1857;
        float _1869 = _1863 * _1867;
        float _1871 = -_1677;
        float _1873 = _1871 + _1813;
        float _1875 = fma(_1843, _1869, _1685);
        float _1877 = fma(_1853, _1869, _1701);
        float _1879 = fma(_1873, _1869, _1677);
        _1757 = _1861;
        _1819 = _1877;
        _1829 = _1875;
        _1821 = _1879;
    }
    float _1881 = _1757;
    float _1883 = _1819;
    float _1885 = _1829;
    float _1887 = _1821;
    float _1889 = _1881;
    if (!_1571)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1899 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1897);
        float _1901 = _1893 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        float _1905 = _1895 * 0.15915493667125701904296875;
        float _1907 = _1893 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        float _1911 = 1.0 / _1903;
        float _1913 = _1905 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = _1905 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        float _1923 = _1915 * _1917;
        float _1925 = 1.0 / _1899;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1927;
        float _1931 = 1.0 / _1923;
        float _1933 = 1.0 / _1929;
        float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1937 = _1925 * _1935;
        float _1939 = _1921 * _1931;
        float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1943 = fma(_1939, _1937, _1941);
        float _1945 = _1943 * _1933;
        float _1947 = precise::clamp(_1945, 0.0, 1.0);
        _1889 = _1933;
        _1825 = _1947;
    }
    float _1949 = _1889;
    float _1951 = _1825;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1955 = _1883 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1959 = _1885 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1963 = _1887 + _1961;
    float _1965 = _1955 * _1955;
    float _1967 = fma(_1959, _1959, _1965);
    float _1969 = fma(_1963, _1963, _1967);
    float _1971 = rsqrt(_1969);
    float _1973 = sqrt(_1969);
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1977 = _1959 * _1975;
    float _1979 = _1963 * _1975;
    float _1981 = _1977 * _1977;
    float _1983 = _1979 * _1979;
    float _1985 = _1981 + _1983;
    float _1987 = sqrt(_1985);
    bool _1989 = _1987 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1993 = _1987 + _1991;
    float _1995 = _1963;
    float _1997 = _1985;
    float _1999 = _1993;
    float _2001 = _1965;
    float _2003 = _1975;
    if (_1989)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (_1989)
    {
        float _2009 = rsqrt(_1985);
        _1997 = _2009;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1989)
    {
        float _2015 = _1993 * _2007;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1989)
    {
        float _2019 = _2017 * 0.15915493667125701904296875;
        _2001 = _2019;
    }
    float _2021 = _2001;
    float _2023 = _2007;
    float _2025 = _2021;
    if (_1989)
    {
        float _2027 = _2021 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        _2023 = _2029;
    }
    float _2031 = _2023;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2035 = precise::max(0.0, _2033);
    float _2037 = _1949;
    float _2039 = _2035;
    if (_1989)
    {
        float _2041 = _2021 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        _2037 = _2043;
    }
    float _2045 = _2037;
    float _2047 = -_1975;
    float _2049 = -_2035;
    float _2051 = fma(_1955, _2047, _2049);
    float _2053 = _2051;
    if (_1989)
    {
        float _2055 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2039 = _2055;
    }
    float _2057 = _2039;
    float _2059 = _2031;
    float _2061 = _2057;
    if (_1989)
    {
        float _2063 = fma(_2031, _2057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = _2065;
    float _2069 = _2045;
    if (_1989)
    {
        float _2071 = _2045 + (-1.0);
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _2073;
    if (_1989)
    {
        float _2077 = _2011 * _2065;
        _2003 = _2077;
    }
    float _2079 = _2003;
    if (!_1989)
    {
        _2067 = _1977;
    }
    float _2081 = _2067;
    float _2083 = _2081;
    if (_1989)
    {
        float _2085 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2085;
    }
    float _2087 = _2025;
    if (_1989)
    {
        float _2089 = _1977 * _2079;
        _2083 = _2089;
    }
    float _2091 = _2083;
    if (!_1989)
    {
        _2075 = _1979;
    }
    float _2093 = _2075;
    float _2095 = _2093;
    if (_1989)
    {
        float _2097 = _1979 * _2079;
        _2095 = _2097;
    }
    float _2099 = _2095;
    if (!_1989)
    {
        _2013 = _1981;
    }
    float _2101 = _2013;
    float _2103 = _2101;
    if (_1989)
    {
        float _2105 = fma(_2051, _2045, _2087);
        _2053 = _2105;
    }
    float _2107 = _2053;
    if (_1989)
    {
        float _2109 = _2091 * _2091;
        _2103 = _2109;
    }
    float _2111 = _2103;
    if (!_1989)
    {
        _2069 = _1983;
    }
    float _2113 = _2069;
    float _2115 = _2113;
    if (_1989)
    {
        float _2117 = _2099 * _2099;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = fma(_2107, _2107, _2111);
    float _2123 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2125 = _2121 + _2119;
    float _2127 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2123);
    float _2129 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2133 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2131);
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = rsqrt(_2125);
    float _2139 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2141 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2127);
    float _2143 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2147 = -_2135;
    float _2149 = _2147 + 1.0;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2155 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2157 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2145);
    float _2159 = abs(_2149);
    float _2161 = log2(_2159);
    float _2163 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2153);
    float _2165 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2155);
    float _2167 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2169 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2171 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2163);
    float _2173 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2177 = _2137 * _2091;
    float _2179 = _2137 * _2107;
    float _2181 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2183 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2175);
    float _2185 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2187 = _2137 * _2099;
    float _2189 = -_2169;
    float _2191 = fma(_2189, _2139, 1.0);
    float _2193 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2183);
    float _2195 = -_2185;
    float _2197 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2195);
    float _2199 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2201 = log2(_2191);
    float _2203 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2193);
    float _2205 = -_2187;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2197);
    float _2209 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2211 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2213 = fma(_2207, -0.5, 0.5);
    float _2215 = fma(_2207, 0.5, 0.5);
    float _2217 = 1.0 / _2203;
    float _2219 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2209);
    float _2221 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2211);
    float _2223 = fma(_2215, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2225 = _2179 + 1.0;
    float _2227 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2219);
    float _2229 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2221);
    float _2231 = fma(_2215, _2223, -0.212114393711090087890625);
    float _2233 = exp2(_2199);
    float _2235 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2227);
    float _2237 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2229);
    float _2239 = _2201 * 0.693147182464599609375;
    float _2241 = fma(_2215, _2231, 1.570728778839111328125);
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = sqrt(_2213);
    float _2247 = _2237 * _2217;
    float _2249 = -_2179;
    float _2251 = fma(_2233, _2225, _2249);
    float _2253 = _2235 * _2217;
    float _2255 = fma(_2251, 0.5, 0.5);
    float _2257 = fma(_2253, 0.5, 0.5);
    float _2259 = _2245 * 0.636619746685028076171875;
    float _2261 = fma(_2247, -0.5, 0.5);
    float _2263 = -_2241;
    float _2265 = fma(_2259, _2263, 1.0);
    float3 _6413 = float3(_2257, _2261, _2243);
    float _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6413, float3(0.0), isnan(_6413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6413, float3(0.0), isnan(_6413)), level(0.0)).x;
    float3 _6424 = float3(_2257, _2261, _2243);
    float4 _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6424, float3(0.0), isnan(_6424)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6424, float3(0.0), isnan(_6424)), level(0.0)).xyzw;
    float _2272 = _2270.x;
    float _2274 = _2270.y;
    float _2276 = _2270.z;
    float _2278 = _2270.w;
    float2 _6441 = float2(_2265, _2255);
    float3 _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6441, float2(0.0), isnan(_6441)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6441, float2(0.0), isnan(_6441)), level(0.0)).xyz;
    float _2284 = _2282.x;
    float _2286 = _2282.y;
    float _2288 = _2282.z;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2292 = _1151 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2296 = _1151 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2300 = _2298 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2308 = _2306 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2310 = 1.0 / _2300;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2320 = _1153 > 0.5;
    float _2322 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2324 = _2322 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2326 = _1357 * (-0.15915493667125701904296875);
    float _2328 = 1.0 / _2304;
    bool _2330 = _1159 > 0.5;
    float _2332 = -_1441;
    float _2334 = _2332 + 1.0;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2346 = _2344 != 0;
    float _2348 = -_1437;
    float _2350 = _2348 + 1.0;
    float _2352 = 1.0 / _2308;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2356 = _2354 != 0;
    float _2358 = -_1469;
    float _2360 = _2358 + 1.0;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2364 = _2362 != 0;
    float _2366 = -_1467;
    float _2368 = _2366 + 1.0;
    bool _2370 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2372 = isnan(_1151);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2384 = 1.0 / _2324;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2394 = 1.0 / _2314;
    float _2396 = _2388 * _2310;
    float _2398 = _2392 * _2328;
    float _2400 = _2338 * _2352;
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2402;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2410 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2412 = isnan(_1151);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = 1.0 / _2318;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2428 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2430 = isnan(_1151);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = _2342 * _2384;
    float _2442 = -_2420;
    float _2444 = _2442 + 1.0;
    float _2446 = -_165;
    int _2448 = _2320 ? as_type<int>(_2446) : as_type<int>(_165);
    float _2450 = fma(_2400, _2292, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2454 = _2452 != 0;
    float _2456 = _2404 * _2394;
    bool _2458 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2460 = isnan(_1151);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    float _2470 = _2438 * _2444;
    float _2472 = 1.0 / _2408;
    bool _2474 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2476 = isnan(_1151);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2482 = _2478 || _2480;
    float _2484 = float(_2482);
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2486;
    float _2490 = -_2468;
    float _2492 = _2490 + 1.0;
    bool _2494 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2496 = isnan(_1151);
    bool _2498 = _2494 || _2496;
    bool _2500 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2502 = _2498 || _2500;
    float _2504 = float(_2502);
    float _2506 = _2426 * _2422;
    float _2508 = -_2438;
    float _2510 = _2508 + 1.0;
    float _2512 = -_2484;
    float _2514 = _2512 + 1.0;
    bool _2516 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2518 = isnan(_1151);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = fma(_2396, _2296, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2530 = _2468 * _2510;
    bool _2532 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2534 = isnan(_1151);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2540 = _2536 || _2538;
    float _2542 = float(_2540);
    float _2544 = _2420 * _2514;
    float _2546 = _2326 * 6.283185482025146484375;
    float _2548 = sin(_2546);
    float _2550 = _2526 * _2492;
    float _2552 = -_2526;
    float _2554 = _2552 + 1.0;
    float _2556 = -_2542;
    float _2558 = _2556 + 1.0;
    float _2560 = _2488 * _2472;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2564 = _1151 + _2562;
    float _2566 = _2542 * _2554;
    float _2568 = _2380 * _2558;
    float _2570 = -_2380;
    float _2572 = _2570 + 1.0;
    float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2576 = fma(_2440, _2564, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2580 = _1151 + _2578;
    float _2582 = _2504 * _2572;
    float _2584 = -_2504;
    float _2586 = _2584 + 1.0;
    bool _2588 = !_2346;
    float _2590 = _2588 ? _165 : as_type<float>(_2448);
    float _2592 = fma(_2398, _2580, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2594 = _2450 * _2582;
    float _2596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2600 = _1151 + _2598;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2604 = _1151 + _2602;
    float _2606 = fma(_2586, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2594);
    float _2608 = fma(_2506, _2600, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2612 = _1151 + _2610;
    float _2614 = fma(_2576, _2568, _2606);
    float _2616 = _2326 * 6.283185482025146484375;
    float _2618 = cos(_2616);
    float _2620 = -_169;
    int _2622 = _1187 ? as_type<int>(_2620) : as_type<int>(_169);
    float _2624 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2626 = fma(_2456, _2604, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2628 = _2590 + 0.5;
    bool _2630 = !_2356;
    float _2632 = _2630 ? _169 : as_type<float>(_2622);
    float _2634 = fma(_2560, _2612, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2636 = fma(_2528, _2566, _2614);
    float _2638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2640 = _1297 * _2548;
    float _2642 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2644 = fma(_2624, _2628, _1455);
    float _2646 = _2632 + (-0.5);
    float _2648 = fma(_2592, _2550, _2636);
    float _2650 = -_2640;
    float _2652 = fma(_1281, _2618, _2650);
    float _2654 = -_2642;
    float _2656 = -_1203;
    float _2658 = fma(_2654, _2646, _2656);
    float _2660 = _1297 * _2618;
    float _2662 = -_165;
    int _2664 = _1267 ? as_type<int>(_2662) : as_type<int>(_165);
    float _2666 = _2652 + 0.5;
    float _2668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2670 = fma(_2626, _2530, _2648);
    bool _2672 = !_2454;
    float _2674 = _2672 ? _165 : as_type<float>(_2664);
    float _2676 = _2638 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2678 = fma(_2632, _2360, _2658);
    float _2680 = fma(_1281, _2548, _2660);
    float _2682 = fma(_2608, _2470, _2670);
    float _2684 = fma(_2676, _2666, _1361);
    float _2686 = -_169;
    int _2688 = _2330 ? as_type<int>(_2686) : as_type<int>(_169);
    float _2690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2692 = _2674 + 0.5;
    float _2694 = -_2334;
    float _2696 = fma(_2652, _2694, _2684);
    bool _2698 = !_2364;
    float _2700 = _2698 ? _169 : as_type<float>(_2688);
    float _2702 = _2680 + (-0.5);
    float _2704 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2706 = fma(_2634, _2544, _2682);
    bool _2708 = _1951 > 0.0;
    bool _2710 = isnan(_1951);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(0.0);
    bool _2716 = _2712 || _2714;
    float _2718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2720 = -_2700;
    float _2722 = _2720 + 0.5;
    float _2724 = -_2350;
    float _2726 = fma(_2590, _2724, _2644);
    float _2728 = _2692 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2730 = -_1605;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2704);
    float _2734 = _2722 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2736 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2706);
    float _2738 = _2728 * _2668;
    float _2740 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2742 = _2734 * _2690;
    float _2744 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2746 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2748 = -_1605;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2740);
    out.m_62.x = _2736;
    float _2752 = -_1605;
    float _2754 = fma(_2752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2744);
    float _2756 = exp2(_2382);
    float _2758 = _2718 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_64.x = _2726;
    out.m_64.y = _2678;
    out.m_64.z = _2738;
    out.m_64.w = _2742;
    float _2760 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2746);
    float _2762 = -_2758;
    float _2764 = -_1365;
    float _2766 = fma(_2762, _2702, _2764);
    float _2768 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2750);
    float _2770 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2754);
    float _2772 = fma(_2680, _2368, _2766);
    float _2774 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2776 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _2696;
    out.m_66.y = _2772;
    float _2778 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2774);
    float _2780 = _169 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2782 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2732);
    float _2784 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2786 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2788 = fma(_2780, _2780, 1.0);
    float _2790 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2776);
    float _2792 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2778);
    float _2794 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2786);
    float _2796 = rsqrt(_2788);
    float _2798 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2784);
    float _2800 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2802 = _165 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2804 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2790);
    float _2806 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2798);
    float _2808 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2800);
    float _2810 = _2780 * _2768;
    float _2812 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2760);
    float _2814 = _2780 * _2782;
    float _2816 = _2780 * _2770;
    float _2818 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2794);
    float _2820 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2808);
    float _2822 = fma(_2802, _2792, _2810);
    float _2824 = fma(_2802, _2804, _2814);
    float _2826 = fma(_2802, _2812, _2816);
    float _2828 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2830 = _2780 * _2796;
    float _2832 = _2806 + _2822;
    float _2834 = _2818 + _2824;
    float _2836 = _2820 + _2826;
    float _2838 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2828);
    float _2840 = -_2756;
    float _2842 = _2840 + 1.0;
    float _2844 = -_2806;
    float _2846 = _2830 * _2844;
    float _2848 = -_2818;
    float _2850 = _2830 * _2848;
    out.m_68.x = _2832;
    out.m_68.y = _2834;
    out.m_68.z = _2836;
    float _2852 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2838);
    float _2854 = fma(_2796, _2768, _2846);
    float _2856 = -_2820;
    float _2858 = _2830 * _2856;
    float _2860 = fma(_2796, _2782, _2850);
    float _2862 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2864 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2852);
    float _2866 = fma(_2796, _2770, _2858);
    float _2868 = _2203 * 0.5;
    float _2870 = _2235 + _2203;
    float _2872 = _2864 + _2203;
    float _2874 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2876 = _2862 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2878 = fma(_2237, -0.5, _2868);
    float _2880 = _2872 * 0.5;
    float _2882 = -_2874;
    float _2884 = _2882 + 1.0;
    float _2886 = _2870 * 0.5;
    out.m_70.x = _2792;
    out.m_70.y = _2804;
    out.m_70.z = _2812;
    out.m_72.x = _2854;
    out.m_72.y = _2860;
    out.m_72.z = _2866;
    out.gl_Position.x = _2235;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2864;
    out.gl_Position.w = _2203;
    out.m_74.x = _2886;
    out.m_74.y = _2878;
    out.m_74.z = _2880;
    out.m_74.w = _2203;
    out.m_45.x = _2876;
    float _2888 = _2874 * _2267;
    float _2890 = _2278 * _2884;
    float _2892 = _2278 * _2888;
    float _2894 = _2288 * _2888;
    float _2896 = fma(_2284, _2892, _2272);
    float _2898 = fma(_2286, _2892, _2274);
    float _2900 = fma(_2278, _2894, _2276);
    out.m_76.x = _2896;
    out.m_76.y = _2898;
    out.m_76.z = _2900;
    out.m_76.w = _2890;
    if (_2716)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2902 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2902;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1143 = false;
    bool _1001 = false;
    bool _833 = false;
    bool _653 = false;
    bool _477 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2959 = as_type<float>(_111);
        out.gl_Position.z = _2959;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3029 = as_type<float>(_149);
        out.gl_Position.z = _3029;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _155 = as_type<int>(_151) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_151) & 2;
    bool _161 = _159 != 0;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_153;
    float _189;
    if (!_171)
    {
        float _173 = in.m_52.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_95);
        float _195 = 1.0 / _193;
        float _197 = _129 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _211 = _209 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _221 = 1.0 / _207;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _223;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _229 = 1.0 / _211;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _199 + _231;
    float _235 = 1.0 / _219;
    float _237 = _233 * _221;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _199 + _239;
    bool _243 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _245 = isnan(_199);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _215;
    float _257 = _203 * _229;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _199 + _259;
    bool _263 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_199);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _225;
    float _277 = _261 * _235;
    bool _279 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _281 = isnan(_199);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = _199 + _291;
    float _295 = -_289;
    float _297 = _295 + 1.0;
    float _299 = _241 * _255;
    bool _301 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _303 = isnan(_199);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -_311;
    float _315 = _313 + 1.0;
    float _317 = _311 * _297;
    float _319 = _293 * _275;
    float _321 = -_253;
    float _323 = _321 + 1.0;
    bool _325 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_199);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _273 * _315;
    float _339 = -_273;
    float _341 = _339 + 1.0;
    float _343 = _289 * _323;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _353 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _355 = isnan(_199);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _335 * _341;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -_335;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = fma(_347, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _381 = fma(_369, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _383 = _363 * _373;
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = fma(_377, _257, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = fma(_351, _257, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = _381 * _383;
    float _395 = _379 * _383;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = fma(_399, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _415 = fma(_403, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _421 = fma(_389, _365, _405);
    float _423 = fma(_391, _365, _407);
    float _425 = fma(_411, _277, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _427 = fma(_419, _277, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _433;
    float _437 = fma(_413, _337, _421);
    float _439 = fma(_415, _337, _423);
    float _441 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _443 = fma(_435, _319, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _445 = fma(_425, _317, _437);
    float _447 = fma(_427, _317, _439);
    float _449 = fma(_441, _343, _445);
    float _451 = fma(_443, _343, _447);
    float _453 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[148].x, _449);
    float _455 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[148].y, _451);
    bool _457 = !_227;
    float _475;
    if (!_457)
    {
        float _459 = in.m_52.x;
        float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _465 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _467 = _465 * _461;
        float _469 = floor(_467);
        float _471 = -_469;
        float _473 = _467 + _471;
        _475 = _473;
        _477 = true;
    }
    else
    {
        float _479 = float(_95);
        float _481 = 1.0 / _479;
        float _483 = _129 * _481;
        _475 = _483;
    }
    _477 = false;
    float _485 = _475;
    float _487 = in.m_54.x;
    float _489 = in.m_54.y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = _485 + _491;
    bool _495 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _497 = isnan(_485);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _515 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _517 = isnan(_485);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_505;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _509;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = 1.0 / _513;
    float _537 = _455 * _489;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _539;
    float _543 = _493 * _531;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _547 = _485 + _545;
    bool _549 = _485 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _551 = isnan(_485);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _561;
    float _565 = fma(_541, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = _559 * _529;
    float _569 = -_559;
    float _571 = _569 + 1.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _573;
    float _577 = fma(_563, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _579 = _547 * _535;
    float _581 = _525 * _571;
    float _583 = fma(_575, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _585 = -_525;
    float _587 = _585 + 1.0;
    float _589 = _565 * _581;
    float _591 = _583 * _581;
    float _593 = _577 * _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _607 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].x, _591);
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].y, _589);
    float _611 = fma(_597, _579, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _613 = fma(_601, _579, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _615 = fma(_605, _579, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _617 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[107].z, _593);
    float _619 = fma(_611, _567, _607);
    float _621 = fma(_613, _567, _609);
    float _623 = fma(_615, _567, _617);
    float _625 = _453 * _487;
    float _627 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].x, _619);
    float _629 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].y, _621);
    float _631 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[109].z, _623);
    bool _633 = !_533;
    float _651;
    if (!_633)
    {
        float _635 = in.m_52.x;
        float _637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _639 = _635 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _643 = _641 * _637;
        float _645 = floor(_643);
        float _647 = -_645;
        float _649 = _643 + _647;
        _651 = _649;
        _653 = true;
    }
    else
    {
        float _655 = float(_95);
        float _657 = 1.0 / _655;
        float _659 = _129 * _657;
        _651 = _659;
    }
    _653 = false;
    float _661 = _651;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _665 = _661 + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _675 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_661);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _691 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _693 = isnan(_661);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = 1.0 / _669;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    float _709 = -_685;
    float _711 = _709 + 1.0;
    bool _713 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _715 = isnan(_661);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _727 = 1.0 / _673;
    float _729 = 1.0 / _689;
    float _731 = _707 * _703;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _737 = _701 * _711;
    float _739 = -_701;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, _665, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _745;
    float _749 = _723 * _741;
    float _751 = _735 * _727;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _755 = _661 + _753;
    bool _757 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _759 = isnan(_661);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _743 * _749;
    float _771 = -_723;
    float _773 = _771 + 1.0;
    float _775 = fma(_751, _755, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _661 + _777;
    float _781 = _747 * _729;
    float _783 = -_767;
    float _785 = _783 + 1.0;
    float _787 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[115].x, _769);
    float _789 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _791 = fma(_781, _779, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _793 = _685 * _785;
    float _795 = fma(_775, _737, _787);
    float _797 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = fma(_791, _793, _795);
    float _801 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _803 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _805 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _799);
    float _807 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _797;
    out.m_56.y = _807;
    out.m_56.z = _809;
    out.m_56.w = _811;
    bool _813 = !_725;
    float _831;
    if (!_813)
    {
        float _815 = in.m_52.x;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _819 = _815 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_95);
        float _837 = 1.0 / _835;
        float _839 = _129 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = _841 + _843;
    bool _847 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _849 = isnan(_841);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _861 = _841 + _859;
    bool _863 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _865 = isnan(_841);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _883 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _885 = isnan(_841);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = -_857;
    float _897 = _895 + 1.0;
    float _899 = 1.0 / _881;
    float _901 = _893 * _897;
    float _903 = -_893;
    float _905 = _903 + 1.0;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _907;
    bool _911 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _913 = 1.0 / _877;
    float _915 = _873 * _905;
    float _917 = -_873;
    float _919 = _917 + 1.0;
    float _921 = _861 * _899;
    float _923 = _845 * _913;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _929;
    float _933 = fma(_909, _923, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _935 = fma(_927, _923, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _937 = fma(_931, _923, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _939 = _933 * _915;
    float _941 = _935 * _915;
    float _943 = _937 * _915;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _957 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].x, _939);
    float _959 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].y, _941);
    float _961 = fma(_947, _921, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _963 = fma(_951, _921, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _965 = fma(_955, _921, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _967 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].z, _943);
    float _969 = fma(_961, _901, _957);
    float _971 = fma(_963, _901, _959);
    float _973 = fma(_965, _901, _967);
    float _975 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].x, _969);
    float _977 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].y, _971);
    float _979 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[125].z, _973);
    bool _981 = !_911;
    float _999;
    if (!_981)
    {
        float _983 = in.m_52.x;
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _987 = _983 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _991 = _989 * _985;
        float _993 = floor(_991);
        float _995 = -_993;
        float _997 = _991 + _995;
        _999 = _997;
        _1001 = true;
    }
    else
    {
        float _1003 = float(_95);
        float _1005 = 1.0 / _1003;
        float _1007 = _129 * _1005;
        _999 = _1007;
    }
    _1001 = false;
    float _1009 = _999;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1013 = _1009 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1019 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1021 = isnan(_1009);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1035 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1037 = isnan(_1009);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1047;
    bool _1051 = _1009 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1053 = isnan(_1009);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = 1.0 / _1017;
    float _1065 = -_1029;
    float _1067 = _1065 + 1.0;
    bool _1069 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1071 = _1045 * _1067;
    float _1073 = -_1045;
    float _1075 = _1073 + 1.0;
    float _1077 = 1.0 / _1033;
    float _1079 = _1049 * _1063;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1085 = fma(_1079, _1013, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1087 = _1083 * _1077;
    float _1089 = _1085 * _1071;
    float _1091 = -_1061;
    float _1093 = _1091 + 1.0;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1097 = _1009 + _1095;
    float _1099 = _975 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1089);
    float _1103 = _1029 * _1093;
    float _1105 = fma(_1087, _1097, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1107 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = fma(_1105, _1103, _1101);
    float _1111 = _977 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1113 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1117 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1109);
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _1113;
    out.m_58.y = _1119;
    out.m_58.z = _1115;
    out.m_58.w = _1121;
    bool _1123 = !_1069;
    float _1141;
    if (!_1123)
    {
        float _1125 = in.m_52.x;
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1129 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _1133 = _1131 * _1127;
        float _1135 = floor(_1133);
        float _1137 = -_1135;
        float _1139 = _1133 + _1137;
        _1141 = _1139;
        _1143 = true;
    }
    else
    {
        float _1145 = float(_95);
        float _1147 = 1.0 / _1145;
        float _1149 = _129 * _1147;
        _1141 = _1149;
    }
    _1143 = false;
    float _1151 = _1141;
    float _1153 = in.m_52.x;
    float _1155 = in.m_52.y;
    float _1157 = in.m_52.z;
    float _1159 = in.m_52.w;
    float _1161 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1163 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1171 = _1169 != 0;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1179 = _1157 * 2.0;
    float _1181 = _1153 * 2.0;
    float _1183 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1185 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1187 = _1155 > 0.5;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = floor(_1179);
    float _1193 = fma(_1183, -2.0, _1165);
    float _1195 = -_1167;
    float _1197 = fma(_1185, 2.0, _1195);
    float _1199 = _1155 + _1153;
    float _1201 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1203 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1193);
    float _1205 = _1153 + (-0.5);
    float _1207 = _1199 + (-1.0);
    float _1209 = floor(_1181);
    bool _1211 = _1191 > 0.0;
    bool _1213 = _1191 >= 0.0;
    bool _1215 = isnan(_1191);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.0);
    bool _1221 = _1217 || _1219;
    float _1223 = _1221 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1231 = _1229 != 0;
    float _1233 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1235 = _1209 > 0.0;
    bool _1237 = _1209 >= 0.0;
    bool _1239 = isnan(_1209);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan(0.0);
    bool _1245 = _1241 || _1243;
    float _1247 = _1155 * 2.0;
    int _1249 = ~as_type<int>(_1223);
    int _1251 = _1249 + 1;
    int _1253 = _1251 + 1;
    int _1255 = _1253;
    float _1257 = _1223;
    float _1259 = _1207;
    if (!_1211)
    {
        int _1261 = ~as_type<int>(_1223);
        int _1263 = _1261 + 1;
        _1255 = _1263;
    }
    int _1265 = _1255;
    bool _1267 = _1157 > 0.5;
    float _1269 = floor(_1247);
    float _1271 = -_165;
    float _1273 = _1187 ? _1271 : _165;
    float _1275 = -_169;
    int _1277 = _1267 ? as_type<int>(_1275) : as_type<int>(_169);
    bool _1279 = !_1227;
    float _1281 = _1279 ? _165 : _1273;
    float _1283 = _1273;
    if (_1171)
    {
        _1257 = _1153;
    }
    float _1285 = _1257;
    float _1287 = _1285;
    if (_1171)
    {
        _1283 = _1155;
    }
    float _1289 = _1283;
    float _1291 = _1289;
    if (_1171)
    {
        _1259 = _1157;
    }
    float _1293 = _1259;
    bool _1295 = !_1231;
    float _1297 = _1295 ? _169 : as_type<float>(_1277);
    float _1299 = _1293;
    if (!_1171)
    {
        _1287 = _1157;
    }
    float _1301 = _1287;
    if (!_1171)
    {
        _1291 = _1153;
    }
    float _1303 = _1291;
    if (!_1171)
    {
        _1299 = _1155;
    }
    float _1305 = _1299;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1313 = _1311 != 0;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1317 = _1315 != 0;
    int _1319 = _1245 ? 0 : 1;
    float _1321 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1173);
    bool _1323 = _1269 > 0.0;
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1327 = !_1309;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1333 = _1269 >= 0.0;
    bool _1335 = isnan(_1269);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = -_1175;
    float _1345 = fma(_1325, 2.0, _1343);
    float _1347 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1349 = log2(_1347);
    int _1351 = abs(_1329);
    float _1353 = fma(_1331, -2.0, _1177);
    float _1355 = float(_1265);
    float _1357 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1321);
    float _1359 = -_129;
    float _1361 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1345);
    int _1363 = _1341 ? 0 : 1;
    float _1365 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1353);
    float _1367 = float(_1351);
    int _1369 = ~_1363;
    int _1371 = _1369 + 1;
    int _1373 = _1371 + 1;
    int _1375 = _1373;
    if (!_1323)
    {
        int _1377 = ~_1363;
        int _1379 = _1377 + 1;
        _1375 = _1379;
    }
    int _1381 = _1375;
    float _1383 = _1367 * _1355;
    float _1385 = in.m_60.x;
    float _1387 = in.m_60.y;
    float _1389 = in.m_60.z;
    float _1391 = _1349 * _129;
    int _1393 = ~_1319;
    int _1395 = _1393 + 1;
    int _1397 = _1395 + 1;
    float _1399 = exp2(_1391);
    int _1401 = _1397;
    if (!_1235)
    {
        int _1403 = ~_1319;
        int _1405 = _1403 + 1;
        _1401 = _1405;
    }
    int _1407 = _1401;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1413 = 1.0 + _1411;
    float _1415 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1409);
    bool _1417 = !_1313;
    int _1419 = _1417 ? 0 : 1;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1423 = 1.0 / _1413;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1427 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1429 = isnan(1.0);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1415);
    float _1439 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1421);
    float _1441 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1201);
    float _1443 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1425);
    float _1445 = _1383 * (-2.0);
    float _1447 = -_1399;
    float _1449 = _1447 + 1.0;
    int _1451 = abs(_1419);
    float _1453 = -_129;
    float _1455 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1197);
    bool _1457 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1459 = isnan(0.0);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1465 = _1461 || _1463;
    float _1467 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1439);
    float _1469 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1443);
    float _1471 = fma(_1445, _1385, _1385);
    float _1473 = float(_1407);
    float _1475 = fma(_1233, _1445, _1233);
    float _1477 = float(_1451);
    float _1479 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1471);
    float _1481 = _1465 ? _1449 : 0.0;
    bool _1483 = !_1317;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1477 * _1473;
    float _1489 = _1155 + _1157;
    if (_1435)
    {
        float _1491 = _1481 * _1423;
        _131 = _1491;
    }
    float _1493 = _131;
    int _1495 = abs(_1485);
    float _1497 = fma(_1475, _1493, _1479);
    float _1499 = _1489 + (-1.0);
    float _1501 = float(_1381);
    float _1503 = _1487 * (-2.0);
    float _1505 = float(_1495);
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1509 = _1155 + (-0.5);
    float _1511 = fma(_1503, _1387, _1387);
    float _1513 = _1157 + _1153;
    float _1515 = _1505 * _1501;
    float _1517 = fma(_1507, _1503, _1507);
    float _1519 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1511);
    float _1521 = _1513 + (-1.0);
    float _1523 = _1515 * (-2.0);
    float _1525 = fma(_1517, _1493, _1519);
    float _1527 = _1157 + (-0.5);
    float _1529 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1531 = fma(_1523, _1389, _1389);
    float _1533 = _1497 * 0.15915493667125701904296875;
    float _1535 = _1525 * 0.15915493667125701904296875;
    float _1537 = fma(_1529, _1523, _1529);
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1531);
    float _1541 = _1533 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    bool _1547 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1549 = isnan(0.5);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1555 = _1551 || _1553;
    float _1557 = fma(_1537, _1493, _1539);
    float _1559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _165);
    float _1561 = _1161 * _1545;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    float _1573 = _1557 * 0.15915493667125701904296875;
    float _1575 = _1535 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = in.m_42.x;
    float _1581 = in.m_42.y;
    float _1583 = in.m_42.z;
    float _1585 = _1163 * _1559;
    float _1587 = _1535 * 6.283185482025146484375;
    float _1589 = cos(_1587);
    float _1591 = _1533 * 6.283185482025146484375;
    float _1593 = sin(_1591);
    float _1595 = _1543 * _1577;
    float _1597 = _1573 * 6.283185482025146484375;
    float _1599 = cos(_1597);
    float _1601 = _1543 * _1589;
    float _1603 = _1573 * 6.283185482025146484375;
    float _1605 = sin(_1603);
    float _1607 = _1593 * _1577;
    float _1609 = _1593 * _1589;
    float _1611 = _1543 * _1599;
    float _1613 = _1593 * _1599;
    float _1615 = _1589 * _1599;
    float _1617 = _1577 * _1599;
    float _1619 = _1611 * _1561;
    float _1621 = _1613 * _1561;
    float _1623 = fma(_1605, _1601, _1607);
    float _1625 = -_1595;
    float _1627 = fma(_1605, _1609, _1625);
    float _1629 = -_1609;
    float _1631 = fma(_1605, _1595, _1629);
    float _1633 = -_1561;
    float _1635 = _1605 * _1633;
    float _1637 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1639 = fma(_1623, _1585, _1619);
    float _1641 = fma(_1627, _1585, _1621);
    float _1643 = fma(_1615, _1585, _1635);
    float _1645 = fma(_1605, _1607, _1601);
    float _1647 = fma(_1631, _1637, _1639);
    float _1649 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1651 = fma(_1617, _1637, _1643);
    float _1653 = fma(_1645, _1637, _1641);
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1657 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1649);
    float _1659 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1663 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1655);
    float _1665 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1657);
    float _1667 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1659);
    float _1669 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1661);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1663);
    float _1673 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1675 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1667);
    float _1677 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1679 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1669);
    float _1681 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1683 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1673);
    float _1685 = _1675 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1687 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1689 = _1677 + _1681;
    float _1691 = fma(_1583, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1683);
    float _1693 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1695 = _1685 + _1687;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1699 = _1689 + _1697;
    float _1701 = _1691 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1693);
    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1707 = _1695 + _1705;
    float _1709 = _1699 * _1699;
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1713 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1703);
    float _1715 = fma(_1707, _1707, _1709);
    float _1717 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1711);
    float _1719 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1721 = sqrt(_1715);
    float _1723 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1725 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1727 = _1701 + _1719;
    float _1729 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1731 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1725);
    float _1733 = 1.0 / _1729;
    float _1735 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1737 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1739 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = _1737 + _1729;
    float _1743 = _1741 * _1733;
    float _1745 = _1743 * 0.5;
    float _1747 = _1741;
    float _1749 = _1719;
    float _1751 = _1693;
    float _1753 = _1695;
    float _1755 = _1699;
    float _1757 = _1707;
    if (!_1739)
    {
        _1747 = _1695;
    }
    float _1759 = _1747;
    float _1761 = _1759;
    if (!_1739)
    {
        _1749 = _1689;
    }
    float _1763 = _1749;
    float _1765 = _1763;
    if (!_1739)
    {
        _1751 = _1727;
    }
    float _1767 = _1751;
    bool _1769 = !_1739;
    float _1771 = _1767;
    if (!_1769)
    {
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1777 = _1721 + _1775;
        float _1779 = rsqrt(_1715);
        float _1781 = _1777 * _1773;
        float _1783 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1785 = _1781 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = _1785 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        float _1795 = _1789 + (-1.0);
        float _1797 = fma(_1793, _1783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1799 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1801 = _1779 * _1797;
        float _1803 = fma(_1727, _1789, _1799);
        float _1805 = fma(_1707, _1801, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1807 = fma(_1699, _1801, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1761 = _1805;
        _1771 = _1803;
        _1765 = _1807;
        _1753 = _1785;
    }
    float _1809 = _1761;
    float _1811 = _1771;
    float _1813 = _1765;
    float _1815 = _1753;
    float _1817 = _1815;
    float _1819 = _1811;
    float _1821 = _1813;
    if (_1571)
    {
        _1817 = 1.0;
    }
    float _1823 = _1817;
    float _1825 = _1823;
    if (_1555)
    {
        _1755 = _1809;
    }
    float _1827 = _1755;
    float _1829 = _1827;
    if (!_1555)
    {
        float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1833 = _1701 + _1831;
        float _1835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1837 = _1685 + _1835;
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1841 = -_1685;
        float _1843 = _1841 + _1809;
        float _1845 = _1833 * _1833;
        float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1849 = _1677 + _1847;
        float _1851 = -_1701;
        float _1853 = _1851 + _1811;
        float _1855 = fma(_1837, _1837, _1845);
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1859 = fma(_1849, _1849, _1855);
        float _1861 = sqrt(_1859);
        float _1863 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = precise::min(_1861, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1867 = _1865 * _1857;
        float _1869 = _1863 * _1867;
        float _1871 = -_1677;
        float _1873 = _1871 + _1813;
        float _1875 = fma(_1843, _1869, _1685);
        float _1877 = fma(_1853, _1869, _1701);
        float _1879 = fma(_1873, _1869, _1677);
        _1757 = _1861;
        _1819 = _1877;
        _1829 = _1875;
        _1821 = _1879;
    }
    float _1881 = _1757;
    float _1883 = _1819;
    float _1885 = _1829;
    float _1887 = _1821;
    float _1889 = _1881;
    if (!_1571)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1899 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1897);
        float _1901 = _1893 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        float _1905 = _1895 * 0.15915493667125701904296875;
        float _1907 = _1893 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        float _1911 = 1.0 / _1903;
        float _1913 = _1905 * 6.283185482025146484375;
        float _1915 = cos(_1913);
        float _1917 = _1909 * _1911;
        float _1919 = _1905 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        float _1923 = _1915 * _1917;
        float _1925 = 1.0 / _1899;
        float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1927;
        float _1931 = 1.0 / _1923;
        float _1933 = 1.0 / _1929;
        float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1937 = _1925 * _1935;
        float _1939 = _1921 * _1931;
        float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1943 = fma(_1939, _1937, _1941);
        float _1945 = _1943 * _1933;
        float _1947 = precise::clamp(_1945, 0.0, 1.0);
        _1889 = _1933;
        _1825 = _1947;
    }
    float _1949 = _1889;
    float _1951 = _1825;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1955 = _1883 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1959 = _1885 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1963 = _1887 + _1961;
    float _1965 = _1955 * _1955;
    float _1967 = fma(_1959, _1959, _1965);
    float _1969 = fma(_1963, _1963, _1967);
    float _1971 = rsqrt(_1969);
    float _1973 = sqrt(_1969);
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1977 = _1959 * _1975;
    float _1979 = _1963 * _1975;
    float _1981 = _1977 * _1977;
    float _1983 = _1979 * _1979;
    float _1985 = _1981 + _1983;
    float _1987 = sqrt(_1985);
    bool _1989 = _1987 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1993 = _1987 + _1991;
    float _1995 = _1963;
    float _1997 = _1985;
    float _1999 = _1993;
    float _2001 = _1965;
    float _2003 = _1975;
    if (_1989)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (_1989)
    {
        float _2009 = rsqrt(_1985);
        _1997 = _2009;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1989)
    {
        float _2015 = _1993 * _2007;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1989)
    {
        float _2019 = _2017 * 0.15915493667125701904296875;
        _2001 = _2019;
    }
    float _2021 = _2001;
    float _2023 = _2007;
    float _2025 = _2021;
    if (_1989)
    {
        float _2027 = _2021 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        _2023 = _2029;
    }
    float _2031 = _2023;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2035 = precise::max(0.0, _2033);
    float _2037 = _1949;
    float _2039 = _2035;
    if (_1989)
    {
        float _2041 = _2021 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        _2037 = _2043;
    }
    float _2045 = _2037;
    float _2047 = -_1975;
    float _2049 = -_2035;
    float _2051 = fma(_1955, _2047, _2049);
    float _2053 = _2051;
    if (_1989)
    {
        float _2055 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2039 = _2055;
    }
    float _2057 = _2039;
    float _2059 = _2031;
    float _2061 = _2057;
    if (_1989)
    {
        float _2063 = fma(_2031, _2057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = _2065;
    float _2069 = _2045;
    if (_1989)
    {
        float _2071 = _2045 + (-1.0);
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _2073;
    if (_1989)
    {
        float _2077 = _2011 * _2065;
        _2003 = _2077;
    }
    float _2079 = _2003;
    if (!_1989)
    {
        _2067 = _1977;
    }
    float _2081 = _2067;
    float _2083 = _2081;
    if (_1989)
    {
        float _2085 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2085;
    }
    float _2087 = _2025;
    if (_1989)
    {
        float _2089 = _1977 * _2079;
        _2083 = _2089;
    }
    float _2091 = _2083;
    if (!_1989)
    {
        _2075 = _1979;
    }
    float _2093 = _2075;
    float _2095 = _2093;
    if (_1989)
    {
        float _2097 = _1979 * _2079;
        _2095 = _2097;
    }
    float _2099 = _2095;
    if (!_1989)
    {
        _2013 = _1981;
    }
    float _2101 = _2013;
    float _2103 = _2101;
    if (_1989)
    {
        float _2105 = fma(_2051, _2045, _2087);
        _2053 = _2105;
    }
    float _2107 = _2053;
    if (_1989)
    {
        float _2109 = _2091 * _2091;
        _2103 = _2109;
    }
    float _2111 = _2103;
    if (!_1989)
    {
        _2069 = _1983;
    }
    float _2113 = _2069;
    float _2115 = _2113;
    if (_1989)
    {
        float _2117 = _2099 * _2099;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = fma(_2107, _2107, _2111);
    float _2123 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2125 = _2121 + _2119;
    float _2127 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2123);
    float _2129 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2133 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2131);
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = rsqrt(_2125);
    float _2139 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2141 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2127);
    float _2143 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2147 = -_2135;
    float _2149 = _2147 + 1.0;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2155 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2157 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2145);
    float _2159 = abs(_2149);
    float _2161 = log2(_2159);
    float _2163 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2153);
    float _2165 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2155);
    float _2167 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2169 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2171 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2163);
    float _2173 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2177 = _2137 * _2091;
    float _2179 = _2137 * _2107;
    float _2181 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2183 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2175);
    float _2185 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2187 = _2137 * _2099;
    float _2189 = -_2169;
    float _2191 = fma(_2189, _2139, 1.0);
    float _2193 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2183);
    float _2195 = -_2185;
    float _2197 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2195);
    float _2199 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2201 = log2(_2191);
    float _2203 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2193);
    float _2205 = -_2187;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2197);
    float _2209 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2211 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2213 = fma(_2207, -0.5, 0.5);
    float _2215 = fma(_2207, 0.5, 0.5);
    float _2217 = 1.0 / _2203;
    float _2219 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2209);
    float _2221 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2211);
    float _2223 = fma(_2215, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2225 = _2179 + 1.0;
    float _2227 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2219);
    float _2229 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2221);
    float _2231 = fma(_2215, _2223, -0.212114393711090087890625);
    float _2233 = exp2(_2199);
    float _2235 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2227);
    float _2237 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2229);
    float _2239 = _2201 * 0.693147182464599609375;
    float _2241 = fma(_2215, _2231, 1.570728778839111328125);
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = sqrt(_2213);
    float _2247 = _2237 * _2217;
    float _2249 = -_2179;
    float _2251 = fma(_2233, _2225, _2249);
    float _2253 = _2235 * _2217;
    float _2255 = fma(_2251, 0.5, 0.5);
    float _2257 = fma(_2253, 0.5, 0.5);
    float _2259 = _2245 * 0.636619746685028076171875;
    float _2261 = fma(_2247, -0.5, 0.5);
    float _2263 = -_2241;
    float _2265 = fma(_2259, _2263, 1.0);
    float3 _6413 = float3(_2257, _2261, _2243);
    float _2267 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6413, float3(0.0), isnan(_6413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6413, float3(0.0), isnan(_6413)), level(0.0)).x;
    float3 _6424 = float3(_2257, _2261, _2243);
    float4 _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6424, float3(0.0), isnan(_6424)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6424, float3(0.0), isnan(_6424)), level(0.0)).xyzw;
    float _2272 = _2270.x;
    float _2274 = _2270.y;
    float _2276 = _2270.z;
    float _2278 = _2270.w;
    float2 _6441 = float2(_2265, _2255);
    float3 _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6441, float2(0.0), isnan(_6441)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6441, float2(0.0), isnan(_6441)), level(0.0)).xyz;
    float _2284 = _2282.x;
    float _2286 = _2282.y;
    float _2288 = _2282.z;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2292 = _1151 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2296 = _1151 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2300 = _2298 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2308 = _2306 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2310 = 1.0 / _2300;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2320 = _1153 > 0.5;
    float _2322 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2324 = _2322 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2326 = _1357 * (-0.15915493667125701904296875);
    float _2328 = 1.0 / _2304;
    bool _2330 = _1159 > 0.5;
    float _2332 = -_1441;
    float _2334 = _2332 + 1.0;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2346 = _2344 != 0;
    float _2348 = -_1437;
    float _2350 = _2348 + 1.0;
    float _2352 = 1.0 / _2308;
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2356 = _2354 != 0;
    float _2358 = -_1469;
    float _2360 = _2358 + 1.0;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2364 = _2362 != 0;
    float _2366 = -_1467;
    float _2368 = _2366 + 1.0;
    bool _2370 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2372 = isnan(_1151);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2384 = 1.0 / _2324;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2394 = 1.0 / _2314;
    float _2396 = _2388 * _2310;
    float _2398 = _2392 * _2328;
    float _2400 = _2338 * _2352;
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2402;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2410 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2412 = isnan(_1151);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = 1.0 / _2318;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2428 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2430 = isnan(_1151);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = _2342 * _2384;
    float _2442 = -_2420;
    float _2444 = _2442 + 1.0;
    float _2446 = -_165;
    int _2448 = _2320 ? as_type<int>(_2446) : as_type<int>(_165);
    float _2450 = fma(_2400, _2292, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2454 = _2452 != 0;
    float _2456 = _2404 * _2394;
    bool _2458 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2460 = isnan(_1151);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    float _2470 = _2438 * _2444;
    float _2472 = 1.0 / _2408;
    bool _2474 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2476 = isnan(_1151);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2482 = _2478 || _2480;
    float _2484 = float(_2482);
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2486;
    float _2490 = -_2468;
    float _2492 = _2490 + 1.0;
    bool _2494 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2496 = isnan(_1151);
    bool _2498 = _2494 || _2496;
    bool _2500 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2502 = _2498 || _2500;
    float _2504 = float(_2502);
    float _2506 = _2426 * _2422;
    float _2508 = -_2438;
    float _2510 = _2508 + 1.0;
    float _2512 = -_2484;
    float _2514 = _2512 + 1.0;
    bool _2516 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2518 = isnan(_1151);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = fma(_2396, _2296, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2530 = _2468 * _2510;
    bool _2532 = _1151 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2534 = isnan(_1151);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2540 = _2536 || _2538;
    float _2542 = float(_2540);
    float _2544 = _2420 * _2514;
    float _2546 = _2326 * 6.283185482025146484375;
    float _2548 = sin(_2546);
    float _2550 = _2526 * _2492;
    float _2552 = -_2526;
    float _2554 = _2552 + 1.0;
    float _2556 = -_2542;
    float _2558 = _2556 + 1.0;
    float _2560 = _2488 * _2472;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2564 = _1151 + _2562;
    float _2566 = _2542 * _2554;
    float _2568 = _2380 * _2558;
    float _2570 = -_2380;
    float _2572 = _2570 + 1.0;
    float _2574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2576 = fma(_2440, _2564, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2580 = _1151 + _2578;
    float _2582 = _2504 * _2572;
    float _2584 = -_2504;
    float _2586 = _2584 + 1.0;
    bool _2588 = !_2346;
    float _2590 = _2588 ? _165 : as_type<float>(_2448);
    float _2592 = fma(_2398, _2580, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2594 = _2450 * _2582;
    float _2596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2600 = _1151 + _2598;
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2604 = _1151 + _2602;
    float _2606 = fma(_2586, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2594);
    float _2608 = fma(_2506, _2600, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2610 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2612 = _1151 + _2610;
    float _2614 = fma(_2576, _2568, _2606);
    float _2616 = _2326 * 6.283185482025146484375;
    float _2618 = cos(_2616);
    float _2620 = -_169;
    int _2622 = _1187 ? as_type<int>(_2620) : as_type<int>(_169);
    float _2624 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2626 = fma(_2456, _2604, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2628 = _2590 + 0.5;
    bool _2630 = !_2356;
    float _2632 = _2630 ? _169 : as_type<float>(_2622);
    float _2634 = fma(_2560, _2612, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2636 = fma(_2528, _2566, _2614);
    float _2638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2640 = _1297 * _2548;
    float _2642 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2644 = fma(_2624, _2628, _1455);
    float _2646 = _2632 + (-0.5);
    float _2648 = fma(_2592, _2550, _2636);
    float _2650 = -_2640;
    float _2652 = fma(_1281, _2618, _2650);
    float _2654 = -_2642;
    float _2656 = -_1203;
    float _2658 = fma(_2654, _2646, _2656);
    float _2660 = _1297 * _2618;
    float _2662 = -_165;
    int _2664 = _1267 ? as_type<int>(_2662) : as_type<int>(_165);
    float _2666 = _2652 + 0.5;
    float _2668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2670 = fma(_2626, _2530, _2648);
    bool _2672 = !_2454;
    float _2674 = _2672 ? _165 : as_type<float>(_2664);
    float _2676 = _2638 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2678 = fma(_2632, _2360, _2658);
    float _2680 = fma(_1281, _2548, _2660);
    float _2682 = fma(_2608, _2470, _2670);
    float _2684 = fma(_2676, _2666, _1361);
    float _2686 = -_169;
    int _2688 = _2330 ? as_type<int>(_2686) : as_type<int>(_169);
    float _2690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2692 = _2674 + 0.5;
    float _2694 = -_2334;
    float _2696 = fma(_2652, _2694, _2684);
    bool _2698 = !_2364;
    float _2700 = _2698 ? _169 : as_type<float>(_2688);
    float _2702 = _2680 + (-0.5);
    float _2704 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2706 = fma(_2634, _2544, _2682);
    bool _2708 = _1951 > 0.0;
    bool _2710 = isnan(_1951);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(0.0);
    bool _2716 = _2712 || _2714;
    float _2718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2720 = -_2700;
    float _2722 = _2720 + 0.5;
    float _2724 = -_2350;
    float _2726 = fma(_2590, _2724, _2644);
    float _2728 = _2692 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2730 = -_1605;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2704);
    float _2734 = _2722 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2736 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2706);
    float _2738 = _2728 * _2668;
    float _2740 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2742 = _2734 * _2690;
    float _2744 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2746 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2748 = -_1605;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2740);
    out.m_62.x = _2736;
    float _2752 = -_1605;
    float _2754 = fma(_2752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2744);
    float _2756 = exp2(_2382);
    float _2758 = _2718 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_64.x = _2726;
    out.m_64.y = _2678;
    out.m_64.z = _2738;
    out.m_64.w = _2742;
    float _2760 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2746);
    float _2762 = -_2758;
    float _2764 = -_1365;
    float _2766 = fma(_2762, _2702, _2764);
    float _2768 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2750);
    float _2770 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2754);
    float _2772 = fma(_2680, _2368, _2766);
    float _2774 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2776 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _2696;
    out.m_66.y = _2772;
    float _2778 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2774);
    float _2780 = _169 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2782 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2732);
    float _2784 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2786 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2788 = fma(_2780, _2780, 1.0);
    float _2790 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2776);
    float _2792 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2778);
    float _2794 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2786);
    float _2796 = rsqrt(_2788);
    float _2798 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2784);
    float _2800 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2802 = _165 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2804 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2790);
    float _2806 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2798);
    float _2808 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2800);
    float _2810 = _2780 * _2768;
    float _2812 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2760);
    float _2814 = _2780 * _2782;
    float _2816 = _2780 * _2770;
    float _2818 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2794);
    float _2820 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2808);
    float _2822 = fma(_2802, _2792, _2810);
    float _2824 = fma(_2802, _2804, _2814);
    float _2826 = fma(_2802, _2812, _2816);
    float _2828 = _2167 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2830 = _2780 * _2796;
    float _2832 = _2806 + _2822;
    float _2834 = _2818 + _2824;
    float _2836 = _2820 + _2826;
    float _2838 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2828);
    float _2840 = -_2756;
    float _2842 = _2840 + 1.0;
    float _2844 = -_2806;
    float _2846 = _2830 * _2844;
    float _2848 = -_2818;
    float _2850 = _2830 * _2848;
    out.m_68.x = _2832;
    out.m_68.y = _2834;
    out.m_68.z = _2836;
    float _2852 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2838);
    float _2854 = fma(_2796, _2768, _2846);
    float _2856 = -_2820;
    float _2858 = _2830 * _2856;
    float _2860 = fma(_2796, _2782, _2850);
    float _2862 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2864 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2852);
    float _2866 = fma(_2796, _2770, _2858);
    float _2868 = _2203 * 0.5;
    float _2870 = _2235 + _2203;
    float _2872 = _2864 + _2203;
    float _2874 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2876 = _2862 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2878 = fma(_2237, -0.5, _2868);
    float _2880 = _2872 * 0.5;
    float _2882 = -_2874;
    float _2884 = _2882 + 1.0;
    float _2886 = _2870 * 0.5;
    out.m_70.x = _2792;
    out.m_70.y = _2804;
    out.m_70.z = _2812;
    out.m_72.x = _2854;
    out.m_72.y = _2860;
    out.m_72.z = _2866;
    out.gl_Position.x = _2235;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2864;
    out.gl_Position.w = _2203;
    out.m_74.x = _2886;
    out.m_74.y = _2878;
    out.m_74.z = _2880;
    out.m_74.w = _2203;
    out.m_45.x = _2876;
    float _2888 = _2874 * _2267;
    float _2890 = _2278 * _2884;
    float _2892 = _2278 * _2888;
    float _2894 = _2288 * _2888;
    float _2896 = fma(_2284, _2892, _2272);
    float _2898 = fma(_2286, _2892, _2274);
    float _2900 = fma(_2278, _2894, _2276);
    out.m_76.x = _2896;
    out.m_76.y = _2898;
    out.m_76.z = _2900;
    out.m_76.w = _2890;
    if (_2716)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2902 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2902;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

