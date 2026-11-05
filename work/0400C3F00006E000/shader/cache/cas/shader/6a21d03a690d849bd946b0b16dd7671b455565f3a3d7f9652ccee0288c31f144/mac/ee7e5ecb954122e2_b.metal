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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_80 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_72 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_50 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3425 = false;
    bool _2794 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_50.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_131);
        out.gl_Position.z = _3710;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_55.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3779 = as_type<float>(_169);
        out.gl_Position.z = _3779;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_60.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    float _225 = in.m_60.z;
    float _227 = in.m_60.w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    float _245 = 1.0 / _235;
    int _247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _249 = _247 != 0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _257 = 1.0 / _239;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = _219 + _259;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _273 = _221 * 2.0;
    float _275 = _223 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _277 = 1.0 / _243;
    float _279 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _281 = _261 * _245;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _219 + _283;
    float _287 = fma(_275, -2.0, _263);
    float _289 = fma(_267, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = floor(_273);
    float _293 = -_255;
    float _295 = fma(_279, 2.0, _293);
    float _297 = _223 * 2.0;
    float _299 = _285 * _257;
    float _301 = _221 + _223;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = _219 + _303;
    float _307 = fma(_271, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = floor(_297);
    float _311 = _301 + (-1.0);
    float _313 = _225 + _223;
    float _315 = _305 * _277;
    float _317 = _225 + _221;
    float _319 = _313 + (-1.0);
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _323 = 1.0 / _253;
    bool _325 = _291 >= 0.0;
    bool _327 = isnan(_291);
    bool _329 = _325 || _327;
    bool _331 = isnan(0.0);
    bool _333 = _329 || _331;
    float _335 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _337 = as_type<int>(_319);
    if (_249)
    {
        _337 = 0;
    }
    int _339 = _337;
    float _341 = _317 + (-1.0);
    int _343 = _339;
    float _345 = _341;
    if (!_249)
    {
        _343 = 1;
    }
    int _347 = _343;
    float _349 = -_149;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[76].x, _295);
    int _353 = _333 ? 0 : 1;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _357 = _225 * 2.0;
    bool _359 = _309 > 0.0;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    bool _365 = _309 >= 0.0;
    bool _367 = isnan(_309);
    bool _369 = _365 || _367;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = _347 != 1;
    bool _377 = _291 > 0.0;
    float _379 = _231 * _323;
    int _381 = _373 ? 0 : 1;
    float _383 = floor(_357);
    int _385 = ~_381;
    int _387 = _385 + 1;
    int _389 = _387 + 1;
    int _391 = _389;
    float _393 = as_type<float>(_363);
    if (!_359)
    {
        int _395 = ~_381;
        int _397 = _395 + 1;
        _391 = _397;
    }
    int _399 = _391;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _411 = log2(_409);
    float _413 = fma(_403, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _415 = fma(_407, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _417 = ~_353;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    int _423 = _421;
    if (!_377)
    {
        int _425 = ~_353;
        int _427 = _425 + 1;
        _423 = _427;
    }
    int _429 = _423;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    bool _435 = _383 > 0.0;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _439 = int(_437);
    bool _441 = _383 >= 0.0;
    bool _443 = isnan(_383);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    float _451 = fma(_433, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _453 = _449 ? 0 : 1;
    if (!_375)
    {
        _345 = _223;
    }
    float _455 = _345;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    int _461 = ~_453;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    float _467 = _455;
    int _469 = _465;
    if (_375)
    {
        _467 = _221;
    }
    float _471 = _467;
    float _473 = fma(_459, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = _471;
    if (!_435)
    {
        int _477 = ~_453;
        int _479 = _477 + 1;
        _469 = _479;
    }
    int _481 = _469;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _493 = _491 != 0;
    float _495 = float(_481);
    float _497 = _411 * _149;
    float _499 = float(_115);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _503 = !_489;
    int _505 = _503 ? 0 : 1;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    float _511 = exp2(_497);
    bool _513 = !_493;
    int _515 = _513 ? 0 : 1;
    float _517 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[83].z, _501);
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    float _531 = float(_363);
    float _533 = float(_439);
    float _535 = 1.0 / _499;
    if (!_375)
    {
        _393 = _223;
    }
    float _537 = _393;
    float _539 = _537;
    if (_375)
    {
        _539 = _221;
    }
    float _541 = _539;
    bool _543 = !_521;
    float _545 = _543 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _547 = 1.0 / _533;
    float _549 = _545;
    if (!_375)
    {
        _475 = _225;
    }
    float _551 = _475;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _555 = _551;
    if (_375)
    {
        _555 = _223;
    }
    float _557 = _555;
    float _559 = _541 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _561 = -_511;
    float _563 = _561 + 1.0;
    float _565 = 1.0 / _531;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _569 = 1.0 + _567;
    int _571 = abs(as_type<int>(_545));
    float _573 = _557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_375)
    {
        _549 = _225;
    }
    float _575 = _549;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _579 = _575;
    if (_375)
    {
        _579 = _223;
    }
    float _581 = _579;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _585 = 1.0 / _569;
    float _587 = -_553;
    float _589 = fma(_559, 2.0, _587);
    float _591 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[83].w, _583);
    float _593 = fma(_573, -2.0, _577);
    bool _595 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _597 = isnan(1.0);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _603 = _599 || _601;
    float _605 = in.m_62.x;
    float _607 = in.m_62.y;
    float _609 = in.m_62.z;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _613 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _615 = isnan(0.0);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _621 = _617 || _619;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _625 = float(_571);
    float _627 = _535 * _149;
    float _629 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].z, _611);
    float _631 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[78].w, _623);
    float _633 = _621 ? _563 : 0.0;
    float _635 = _625 * _495;
    bool _637 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _639 = isnan(_219);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _517);
    float _651 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _287);
    float _653 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _591);
    float _655 = _565 * _149;
    float _657 = _547 * _149;
    float _659 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _661 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _631);
    float _663 = -_149;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[81].x, _589);
    float _667 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _593);
    bool _669 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _671 = isnan(_219);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _655;
    if (_603)
    {
        float _683 = _633 * _585;
        _153 = _683;
    }
    float _685 = _153;
    float _687 = _635 * (-2.0);
    bool _689 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_219);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_647;
    float _703 = _701 + 1.0;
    float _705 = -_679;
    float _707 = _705 + 1.0;
    float _709 = fma(_321, _687, _321);
    bool _711 = !_525;
    int _713 = _711 ? 0 : 1;
    float _715 = _699 * _703;
    float _717 = -_699;
    float _719 = _717 + 1.0;
    bool _721 = !_529;
    int _723 = _721 ? 0 : 1;
    float _725 = _647 * _707;
    int _727 = abs(_713);
    float _729 = fma(_687, _605, _605);
    bool _731 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _733 = isnan(_219);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    int _743 = abs(_723);
    bool _745 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _747 = isnan(_219);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = _741 * _719;
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = _221 + (-0.5);
    float _765 = float(_429);
    float _767 = float(_727);
    float _769 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[196].x, _729);
    float _771 = _755 * _761;
    float _773 = float(_399);
    float _775 = -_755;
    float _777 = _775 + 1.0;
    float _779 = _767 * _765;
    float _781 = float(_743);
    float _783 = fma(_709, _685, _769);
    float _785 = _413 * _771;
    float _787 = _779 * (-2.0);
    float _789 = _289 * _771;
    float _791 = _781 * _773;
    float _793 = _783 * 0.15915493667125701904296875;
    float _795 = fma(_787, _607, _607);
    float _797 = _223 + (-0.5);
    float _799 = fma(_335, _787, _335);
    float _801 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[143].y, _785);
    float _803 = _791 * (-2.0);
    float _805 = in.m_64.x;
    float _807 = in.m_64.y;
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _795);
    float _811 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[143].x, _789);
    float _813 = fma(_355, _803, _355);
    float _815 = fma(_803, _609, _609);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _825 = fma(_415, _757, _801);
    float _827 = _225 + (-0.5);
    float _829 = fma(_307, _757, _811);
    float _831 = fma(_819, _379, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _833 = fma(_823, _379, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _835 = fma(_451, _715, _825);
    float _837 = fma(_799, _685, _809);
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _815);
    float _841 = fma(_473, _715, _829);
    float _843 = in.m_50.x;
    float _845 = in.m_50.y;
    float _847 = in.m_50.z;
    float _849 = fma(_833, _725, _835);
    float _851 = fma(_813, _685, _839);
    float _853 = fma(_831, _725, _841);
    float _855 = in.m_66.x;
    float _857 = in.m_66.y;
    float _859 = in.m_66.z;
    float _861 = in.m_66.w;
    float _863 = _837 * 0.15915493667125701904296875;
    float _865 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[147].y, _849);
    float _867 = _851 * 0.15915493667125701904296875;
    float _869 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[147].x, _853);
    float _871 = _793 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _865 * _807;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _879 = _869 * _805;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _883 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _885 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _887 = _863 * 6.283185482025146484375;
    float _889 = sin(_887);
    float _891 = in.m_68.x;
    float _893 = in.m_68.y;
    float _895 = in.m_68.z;
    float _897 = in.m_68.w;
    float _899 = _883 * _877;
    float _901 = _885 * _881;
    float _903 = _863 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _845 * _857;
    float _909 = fma(_843, _855, _907);
    float _911 = _793 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = _873 * _889;
    float _917 = fma(_847, _859, _909);
    float _919 = _867 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _873 * _905;
    float _925 = _867 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _913 * _889;
    float _931 = _913 * _905;
    float _933 = _873 * _921;
    float _935 = _913 * _921;
    float _937 = _905 * _921;
    float _939 = _889 * _921;
    float _941 = _933 * _899;
    float _943 = fma(_927, _923, _929);
    float _945 = -_915;
    float _947 = fma(_927, _931, _945);
    float _949 = -_931;
    float _951 = fma(_927, _915, _949);
    float _953 = -_899;
    float _955 = _927 * _953;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = fma(_943, _901, _941);
    float _961 = _935 * _899;
    float _963 = fma(_937, _901, _955);
    float _965 = fma(_927, _929, _923);
    float _967 = fma(_951, _957, _959);
    float _969 = _845 * _893;
    float _971 = fma(_947, _901, _961);
    float _973 = fma(_939, _957, _963);
    float _975 = _967 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _977 = _967 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _979 = fma(_843, _891, _969);
    float _981 = fma(_965, _957, _971);
    float _983 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _975);
    float _985 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _977);
    float _987 = fma(_847, _895, _979);
    float _989 = _917 + _861;
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].z, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].z, _985);
    float _995 = _987 + _897;
    float _997 = _967 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1001 = _993 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1003 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _997);
    float _1005 = _989 + _999;
    float _1007 = _995 + _1001;
    float _1009 = in.m_70.x;
    float _1011 = in.m_70.y;
    float _1013 = in.m_70.z;
    float _1015 = in.m_70.w;
    float _1017 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1003);
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _1005 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1025 = _1007 + _1023;
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1029 = _1021 * _1021;
    float _1031 = _1025 * _1025;
    float _1033 = _1029 + _1031;
    float _1035 = sqrt(_1033);
    float _1037 = _845 * _1011;
    float _1039 = fma(_843, _1009, _1037);
    bool _1041 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = _1035 + _1043;
    float _1047 = fma(_847, _1013, _1039);
    float _1049 = _1047 + _1015;
    float _1051 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1053 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1055 = 0.0;
    float _1057 = _1033;
    float _1059 = _1045;
    float _1061 = _845;
    float _1063 = _1005;
    float _1065 = _1007;
    float _1067 = _1027;
    float _1069 = _1029;
    float _1071 = _1031;
    if (_1041)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1055 = _1073;
    }
    float _1075 = _1055;
    if (_1041)
    {
        float _1077 = rsqrt(_1033);
        _1057 = _1077;
    }
    float _1079 = _1057;
    if (_1041)
    {
        float _1081 = _1045 * _1075;
        _1059 = _1081;
    }
    float _1083 = _1059;
    float _1085 = _1049 + _1027;
    float _1087 = floor(_1051);
    float _1089 = _1083;
    float _1091 = _1085;
    if (_1041)
    {
        float _1093 = _1083 * 0.15915493667125701904296875;
        _1089 = _1093;
    }
    float _1095 = _1089;
    float _1097 = _1095;
    if (_1041)
    {
        float _1099 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1061 = _1099;
    }
    float _1101 = _1061;
    float _1103 = _843;
    float _1105 = _1101;
    if (_1041)
    {
        float _1107 = _1095 * 6.283185482025146484375;
        float _1109 = sin(_1107);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = floor(_1053);
    if (_1041)
    {
        float _1115 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1115;
    }
    float _1117 = _1105;
    float _1119 = _1117;
    if (_1041)
    {
        float _1121 = _1079 * _1117;
        _1119 = _1121;
    }
    float _1123 = _1119;
    float _1125 = -_1087;
    float _1127 = _1051 + _1125;
    if (_1041)
    {
        float _1129 = fma(_1021, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1063 = _1129;
    }
    float _1131 = _1063;
    if (_1041)
    {
        float _1133 = fma(_1025, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1065 = _1133;
    }
    float _1135 = _1065;
    float _1137 = -_1113;
    float _1139 = _1053 + _1137;
    float _1141 = fma(_1131, 6.2500002968590706586837768554688e-05, 0.5);
    float _1143 = fma(_1135, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5274 = float2(_1141, _1143);
    float3 _1147 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5274, float2(0.0), isnan(_5274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5274, float2(0.0), isnan(_5274)), level(0.0)).xyz;
    float _1149 = _1147.x;
    float _1151 = _1147.y;
    float _1153 = _1147.z;
    float2 _5290 = float2(_1127, _1139);
    float _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5290, float2(0.0), isnan(_5290)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5290, float2(0.0), isnan(_5290)), level(0.0)).x;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1159 = int(_1157);
    if (_249)
    {
        float _1161 = in.m_60.x;
        _1067 = _1161;
    }
    float _1163 = _1067;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1167 = _1165 != 0;
    float _1169 = -_659;
    float _1171 = _1169 + 1.0;
    int _1173 = abs(_505);
    float _1175 = _1163;
    if (!_249)
    {
        float _1177 = in.m_60.y;
        _1175 = _1177;
    }
    float _1179 = _1175;
    int _1181 = abs(_515);
    float _1183 = -_661;
    float _1185 = _1183 + 1.0;
    float _1187 = trunc(_655);
    int _1189 = int(_1187);
    float _1191 = float(uint(_1159));
    float _1193 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1195 = int(_1193);
    float _1197 = _1185;
    if (_249)
    {
        _681 = 1.0;
    }
    float _1199 = _681;
    float _1201 = _1199;
    if (!_249)
    {
        _1201 = 1.2345600128173828125;
    }
    float _1203 = _1201;
    float _1205 = float(uint(_1189));
    float _1207 = 1.0 / _1191;
    float _1209 = _1203 * _1179;
    int _1211 = ~_1159;
    int _1213 = _1211 + 1;
    float _1215 = float(uint(_1195));
    float _1217 = trunc(_657);
    int _1219 = int(_1217);
    int _1221 = ~_1159;
    int _1223 = _1221 + 1;
    int _1225 = as_type<int>(_1207) + (-2);
    float _1227 = 1.0 / _1215;
    float _1229 = as_type<float>(_1225) * _1205;
    float _1231 = float(uint(_1219));
    float _1233 = floor(_1209);
    float _1235 = float(_1219);
    float _1237 = trunc(_1229);
    float _1239 = precise::max(_1237, 0.0);
    uint _1242 = uint(_1239);
    float _1244 = -_1233;
    float _1246 = _1209 + _1244;
    float _1248 = _1227;
    if (_1041)
    {
        float _1250 = _1095 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        _1097 = _1252;
    }
    float _1254 = _1097;
    int _1256 = _1223 * int(_1242);
    int _1258 = _1256 + _1189;
    float _1260 = float(uint(_1258));
    float _1262 = as_type<float>(_1225) * _1260;
    int _1264 = as_type<int>(_1227) + (-2);
    if (_249)
    {
        _1248 = 1.0;
    }
    float _1266 = _1248;
    float _1268 = _1266;
    if (!_249)
    {
        _1268 = 7.345489978790283203125;
    }
    float _1270 = _1268;
    float _1272 = trunc(_1262);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    float _1278 = as_type<float>(_1264) * _1231;
    int _1280 = ~_1195;
    int _1282 = _1280 + 1;
    float _1284 = _1270 * _221;
    float _1286 = trunc(_1278);
    float _1288 = precise::max(_1286, 0.0);
    uint _1290 = uint(_1288);
    int _1292 = int(_1242) + int(_1276);
    float _1294 = floor(_1284);
    float _1296 = float(_1159);
    int _1298 = _1213 * _1292;
    int _1300 = _1298 + _1189;
    float _1302 = float(_1189);
    int _1304 = _1282 * int(_1290);
    int _1306 = _1304 + _1219;
    bool _1308 = _1302 >= _1296;
    bool _1310 = isnan(_1302);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1296);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    bool _1320 = uint(_1300) >= uint(_1159);
    float _1322 = float(uint(_1306));
    float _1324 = trunc(_1318);
    int _1326 = int(_1324);
    bool _1328 = !_1320;
    int _1330 = _1328 ? 0 : (-1);
    float _1332 = -_1294;
    float _1334 = _1284 + _1332;
    float _1336 = as_type<float>(_1264) * _1322;
    int _1338 = ~_1292;
    int _1340 = _1338 + _1330;
    int _1342 = _1340 + 1;
    float _1344 = _1334 * _1296;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1348 = _1346 != 0;
    float _1350 = trunc(_1336);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    int _1356 = _1159 * _1342;
    int _1358 = _1356 + _1189;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1374 = _1372 != 0;
    float _1376 = _1296 * _627;
    bool _1378 = !_1348;
    int _1380 = _1378 ? 0 : 1;
    bool _1382 = _1159 == 0;
    float _1384 = trunc(_1344);
    int _1386 = int(_1384);
    int _1388 = ~_1326;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    bool _1394 = !_1382;
    int _1396 = _1394 ? _1358 : (-1);
    int _1398 = _1159 + (-1);
    int _1400 = abs(_1380);
    int _1402 = _1396 * _1392;
    int _1404 = int(_1290) + int(_1354);
    float _1406 = trunc(_1376);
    int _1408 = int(_1406);
    int _1410 = ~_1195;
    int _1412 = _1410 + 1;
    int _1414 = _1326 * _1398;
    int _1416 = _1414 + _1402;
    float _1418 = float(_1195);
    int _1420 = _1412 * _1404;
    int _1422 = _1420 + _1219;
    bool _1424 = _1235 >= _1418;
    bool _1426 = isnan(_1235);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(_1418);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = _1246 * _1418;
    bool _1438 = !_1167;
    int _1440 = _1438 ? 0 : 1;
    int _1442 = _1416 * _1173;
    bool _1444 = uint(_1422) >= uint(_1195);
    float _1446 = trunc(_1434);
    int _1448 = int(_1446);
    int _1450 = abs(_509);
    float _1452 = _1418 * _627;
    bool _1454 = !_1444;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = _1408 * _1450;
    int _1460 = _1458 + _1442;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1464 = _1462 != 0;
    float _1466 = trunc(_1436);
    int _1468 = int(_1466);
    int _1470 = ~_1404;
    int _1472 = _1470 + _1456;
    int _1474 = _1472 + 1;
    int _1476 = _1386 * _1400;
    int _1478 = _1476 + _1189;
    bool _1480 = !_1464;
    int _1482 = _1480 ? 0 : 1;
    bool _1484 = _1195 == 0;
    int _1486 = _1195 * _1474;
    int _1488 = _1486 + _1219;
    int _1490 = abs(_1482);
    float _1492 = trunc(_1452);
    int _1494 = int(_1492);
    int _1496 = abs(_1440);
    int _1498 = ~_1448;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1478 * _1181;
    int _1506 = _1504 + _1460;
    bool _1508 = !_1484;
    int _1510 = _1508 ? _1488 : (-1);
    int _1512 = _1468 * _1490;
    int _1514 = _1512 + _1219;
    int _1516 = _1195 + (-1);
    int _1518 = _1386 * _1496;
    int _1520 = _1518 + _1506;
    int _1522 = ~_1159;
    int _1524 = _1522 + 1;
    int _1526 = _1510 * _1502;
    bool _1528 = !_1366;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = float(uint(_1520));
    int _1534 = _1448 * _1516;
    int _1536 = _1534 + _1526;
    bool _1538 = !_1362;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = abs(_1530);
    float _1544 = as_type<float>(_1225) * _1532;
    bool _1546 = !_1370;
    int _1548 = _1546 ? 0 : 1;
    int _1550 = abs(_1540);
    bool _1552 = !_1374;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = trunc(_1544);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    int _1562 = abs(_1548);
    int _1564 = _1536 * _1542;
    int _1566 = abs(_1554);
    int _1568 = _1494 * _1550;
    int _1570 = _1568 + _1564;
    float _1572 = float(uint(_1514));
    int _1574 = ~_1159;
    int _1576 = _1574 + 1;
    int _1578 = _1514 * _1562;
    int _1580 = _1578 + _1570;
    int _1582 = ~_1159;
    int _1584 = _1582 + 1;
    int _1586 = ~_1195;
    int _1588 = _1586 + 1;
    int _1590 = _1468 * _1566;
    int _1592 = _1590 + _1580;
    float _1594 = float(uint(_1478));
    int _1596 = _1584 * int(_1560);
    int _1598 = _1596 + _1520;
    int _1600 = ~_1195;
    int _1602 = _1600 + 1;
    float _1604 = float(uint(_1592));
    float _1606 = as_type<float>(_1225) * _1594;
    float _1608 = float(uint(_1598));
    float _1610 = as_type<float>(_1264) * _1604;
    float _1612 = as_type<float>(_1225) * _1608;
    float _1614 = trunc(_1606);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    float _1620 = as_type<float>(_1264) * _1572;
    float _1622 = trunc(_1610);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    float _1628 = trunc(_1612);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    int _1634 = _1602 * int(_1626);
    int _1636 = _1634 + _1592;
    float _1638 = trunc(_1620);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    float _1644 = float(uint(_1636));
    int _1646 = _1524 * int(_1618);
    int _1648 = _1646 + _1478;
    int _1650 = int(_1560) + int(_1632);
    float _1652 = as_type<float>(_1264) * _1644;
    float _1654 = float(uint(_1648));
    int _1656 = _1576 * _1650;
    int _1658 = _1656 + _1520;
    float _1660 = trunc(_1652);
    float _1662 = precise::max(_1660, 0.0);
    uint _1664 = uint(_1662);
    float _1666 = as_type<float>(_1225) * _1654;
    bool _1668 = uint(_1658) >= uint(_1159);
    int _1670 = _1588 * int(_1642);
    int _1672 = _1670 + _1514;
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    float _1678 = float(uint(_1672));
    int _1680 = ~_1650;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    float _1686 = trunc(_1666);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = ~_1195;
    int _1694 = _1692 + 1;
    float _1696 = as_type<float>(_1264) * _1678;
    int _1698 = _1159 * _1684;
    int _1700 = _1698 + _1520;
    int _1702 = int(_1626) + int(_1664);
    float _1704 = trunc(_1696);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = ~_1159;
    int _1712 = _1710 + 1;
    int _1714 = _1694 * _1702;
    int _1716 = _1714 + _1592;
    bool _1718 = !_1382;
    int _1720 = _1718 ? _1700 : (-1);
    out.m_72.x = _1149;
    out.m_72.y = _1151;
    out.m_72.z = _1153;
    int _1722 = int(_1618) + int(_1690);
    int _1724 = _1720 & 3;
    bool _1726 = _1724 != 0;
    int _1728 = _1720 & 3;
    bool _1730 = _1728 != 0;
    bool _1732 = uint(_1716) >= uint(_1195);
    int _1734 = _1726 ? 0 : 1;
    bool _1736 = uint(_1728) > 1u;
    bool _1738 = uint(_1728) >= 2u;
    bool _1740 = !_1732;
    int _1742 = _1740 ? 0 : (-1);
    int _1744 = _1738 ? 0 : 1;
    bool _1746 = _1728 != 3;
    bool _1748 = _227 > 0.5;
    int _1750 = _1712 * _1722;
    int _1752 = _1750 + _1478;
    int _1754 = ~_1195;
    int _1756 = _1754 + 1;
    int _1758 = int(_1642) + int(_1708);
    int _1760 = ~_1734;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    int _1766 = ~_1702;
    int _1768 = _1766 + _1742;
    int _1770 = _1768 + 1;
    int _1772 = _1756 * _1758;
    int _1774 = _1772 + _1514;
    int _1776 = _1764;
    if (!_1736)
    {
        int _1778 = ~_1734;
        int _1780 = _1778 + 1;
        _1776 = _1780;
    }
    int _1782 = _1776;
    bool _1784 = uint(_1752) >= uint(_1159);
    int _1786 = _1195 * _1770;
    int _1788 = _1786 + _1592;
    int _1790 = ~_1744;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    bool _1796 = !_1784;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = _1794;
    if (_1746)
    {
        int _1802 = ~_1744;
        int _1804 = _1802 + 1;
        _1800 = _1804;
    }
    int _1806 = _1800;
    bool _1808 = uint(_1774) >= uint(_1195);
    int _1810 = ~_1722;
    int _1812 = _1810 + _1798;
    int _1814 = _1812 + 1;
    float _1816 = -_189;
    int _1818 = _1748 ? as_type<int>(_1816) : as_type<int>(_189);
    bool _1820 = !_1484;
    int _1822 = _1820 ? _1788 : (-1);
    int _1824 = _1159 * _1814;
    int _1826 = _1824 + _1478;
    int _1828 = _1720 >> 31;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1808;
    int _1836 = _1834 ? 0 : (-1);
    int _1838 = _1822 >> 31;
    int _1840 = _1828 & 3;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1844 = _1842 != 0;
    bool _1846 = !_1832;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1822 & 3;
    bool _1852 = _1850 != 0;
    int _1854 = ~_1758;
    int _1856 = _1854 + _1836;
    int _1858 = _1856 + 1;
    int _1860 = _1838 & 3;
    int _1862 = _1720 + _1840;
    int _1864 = _1195 * _1858;
    int _1866 = _1864 + _1514;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : 1;
    float _1872 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1874 = int(_1872);
    bool _1876 = uint(_1850) > 1u;
    int _1878 = _1822 + _1860;
    int _1880 = _1862 >> 2;
    int _1882 = _1822 & 3;
    bool _1884 = _1882 != 0;
    int _1886 = _1878 >> 2;
    int _1888 = _1880 << 4;
    int _1890 = _1888 + 368;
    int _1892 = _1884 ? 0 : 1;
    bool _1894 = _1728 != 3;
    int _1896 = _1886 << 4;
    int _1898 = _1896 + 512;
    uint _1900 = uint(int(uint(_1890) >> uint(2)));
    uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
    int _1904 = int(_1900) & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    int _1908 = int(_1900) + 1;
    uint _1910 = uint(int(uint(_1908) >> uint(2)));
    int _1912 = _1908 & 3;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[int(_1910)][_1912];
    int _1916 = ~_1892;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (!_1876)
    {
        int _1924 = ~_1892;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    bool _1930 = !_1730;
    int _1932 = _1930 ? 0 : 1;
    bool _1934 = _1850 != 3;
    uint _1936 = uint(int(uint(_1898) >> uint(2)));
    uint _1938 = uint(int(uint(int(_1936)) >> uint(2)));
    int _1940 = int(_1936) & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    int _1944 = int(_1936) + 1;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    int _1948 = _1944 & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    bool _1952 = uint(_1850) >= 2u;
    bool _1954 = !_1382;
    int _1956 = _1954 ? _1826 : (-1);
    int _1958 = _1952 ? 0 : 1;
    bool _1960 = _1850 != 3;
    bool _1962 = !_1852;
    int _1964 = _1962 ? 0 : 1;
    bool _1966 = !_1894;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = ~_1958;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1982 = _1980 != 0;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    int _1988 = _1974;
    if (_1934)
    {
        int _1990 = ~_1958;
        int _1992 = _1990 + 1;
        _1988 = _1992;
    }
    int _1994 = _1988;
    int _1996 = _1890 + 8;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
    int _2002 = int(_1998) & 3;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[int(_2000)][_2002];
    int _2006 = int(_1998) + 1;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    int _2010 = _2006 & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    int _2014 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2016 = _2014 != 0;
    int _2018 = abs(_1782);
    int _2020 = abs(_1928);
    bool _2022 = !_1960;
    int _2024 = _2022 ? 0 : (-1);
    int _2026 = _1898 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    bool _2044 = _221 > 0.5;
    int _2046 = abs(_1932);
    int _2048 = ~_2018;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    bool _2054 = !_1484;
    int _2056 = _2054 ? _1866 : (-1);
    float _2058 = -_185;
    int _2060 = _2044 ? as_type<int>(_2058) : as_type<int>(_185);
    int _2062 = _2052 * as_type<int>(_1914);
    bool _2064 = _223 > 0.5;
    bool _2066 = _225 > 0.5;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2070 = abs(_1964);
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2074 = ~_2020;
    int _2076 = _2074 + 1;
    int _2078 = _2076 + 1;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2082 = ~_2046;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2090 = _2078 * as_type<int>(_1950);
    int _2092 = ~_2070;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    int _2098 = _2086 * as_type<int>(_1906);
    int _2100 = _2098 + _2062;
    int _2102 = abs(_1806);
    float _2104 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2106 = int(_2104);
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2110 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2114 = _2096 * as_type<int>(_1942);
    int _2116 = _2114 + _2090;
    float _2118 = as_type<float>(_2070);
    if (_1041)
    {
        float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2122 = _1131 + _2120;
        _2118 = _2122;
    }
    float _2124 = _2118;
    int _2126 = abs(_1968);
    out.m_74.x = _2088;
    out.m_74.y = _2110;
    out.m_74.z = _2112;
    out.m_74.w = _2108;
    int _2128 = abs(_1994);
    float _2130 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2132 = abs(_2024);
    if (_1041)
    {
        float _2134 = _2124 * _2124;
        _1069 = _2134;
    }
    float _2136 = _1069;
    int _2138 = ~_2102;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    float _2144 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    bool _2146 = !_1978;
    float _2148 = _2146 ? _189 : as_type<float>(_1818);
    bool _2150 = !_2016;
    float _2152 = _2150 ? _185 : as_type<float>(_2060);
    int _2154 = _2142 * as_type<int>(_2004);
    int _2156 = _2154 + _2100;
    int _2158 = ~_2128;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2166 = float(uint(_1874));
    int _2168 = _2162 * as_type<int>(_2034);
    int _2170 = _2168 + _2116;
    int _2172 = ~_2126;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    float _2178 = -_927;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2164);
    int _2182 = ~_2132;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    float _2188 = 1.0 / _2166;
    int _2190 = abs(_1848);
    int _2192 = _2176 * as_type<int>(_2012);
    int _2194 = _2192 + _2156;
    float _2196 = float(uint(_2106));
    float _2198 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2200 = ~_2190;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    float _2206 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2208 = _2186 * as_type<int>(_2042);
    int _2210 = _2208 + _2170;
    int _2212 = abs(_1874);
    float _2214 = 1.0 / _2196;
    int _2216 = abs(_1870);
    float _2218 = -_927;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    float _2222 = -_927;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    int _2226 = _2194 * _2204;
    int _2228 = abs(_2106);
    float _2230 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    float _2232 = float(uint(_2212));
    int _2234 = _1956 * _2190;
    int _2236 = _2234 + _2226;
    int _2238 = ~_2216;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2246 = float(uint(_2228));
    float _2248 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2250 = 1.0 / _2232;
    int _2252 = _2210 * _2242;
    float _2254 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2180);
    int _2256 = as_type<int>(_2188) + (-2);
    float _2258 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2244);
    float _2260 = float(uint(_2236));
    int _2262 = _2056 * _2216;
    int _2264 = _2262 + _2252;
    int _2266 = as_type<int>(_2214) + (-2);
    float _2268 = 1.0 / _2246;
    float _2270 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = as_type<float>(_2256) * _2260;
    int _2274 = abs(_2236);
    float _2276 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2278 = ~_1874;
    int _2280 = _2278 + 1;
    float _2282 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2284 = float(uint(_2264));
    float _2286 = trunc(_2272);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    float _2292 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2294 = as_type<float>(_2266) * _2284;
    int _2296 = as_type<int>(_2250) + (-2);
    float _2298 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2292);
    int _2300 = abs(_2264);
    float _2302 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2304 = float(uint(_2274));
    float _2306 = trunc(_2294);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    int _2312 = as_type<int>(_2268) + (-2);
    float _2314 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = float(uint(_2300));
    float _2318 = as_type<float>(_2296) * _2304;
    float _2320 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2322 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2324 = trunc(_2318);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    float _2330 = as_type<float>(_2312) * _2316;
    int _2332 = _2280 * int(_2290);
    int _2334 = _2332 + _2236;
    float _2336 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2338 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2298);
    float _2340 = float(uint(_2334));
    float _2342 = trunc(_2330);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2322);
    int _2350 = ~_2106;
    int _2352 = _2350 + 1;
    int _2354 = ~_2212;
    int _2356 = _2354 + 1;
    float _2358 = as_type<float>(_2256) * _2340;
    int _2360 = ~_2228;
    int _2362 = _2360 + 1;
    int _2364 = _2352 * int(_2310);
    int _2366 = _2364 + _2264;
    int _2368 = _2356 * int(_2328);
    int _2370 = _2368 + _2274;
    float _2372 = as_type<float>(_2362);
    float _2374 = _2338;
    if (_1041)
    {
        float _2376 = _1254 + (-1.0);
        _2372 = _2376;
    }
    float _2378 = _2372;
    float _2380 = float(uint(_2366));
    float _2382 = trunc(_2358);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = _2378;
    if (_1041)
    {
        float _2390 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2388 = _2390;
    }
    float _2392 = _2388;
    int _2394 = _2362 * int(_2346);
    int _2396 = _2394 + _2300;
    float _2398 = float(uint(_2370));
    float _2400 = _2398;
    if (_1041)
    {
        float _2402 = fma(_1085, _1254, _2392);
        _1091 = _2402;
    }
    float _2404 = _1091;
    float _2406 = as_type<float>(_2266) * _2380;
    float _2408 = float(uint(_2396));
    float _2410 = as_type<float>(_2296) * _2398;
    float _2412 = -_189;
    int _2414 = _2064 ? as_type<int>(_2412) : as_type<int>(_189);
    float _2416 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2418 = -_185;
    int _2420 = _2066 ? as_type<int>(_2418) : as_type<int>(_185);
    float _2422 = trunc(_2406);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    bool _2428 = !_1982;
    float _2430 = _2428 ? _189 : as_type<float>(_2414);
    float _2432 = as_type<float>(_2312) * _2408;
    bool _2434 = !_1986;
    float _2436 = _2434 ? _185 : as_type<float>(_2420);
    float _2438 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    float _2440 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2258);
    float _2442 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2416 * _2254;
    float _2446 = trunc(_2410);
    float _2448 = precise::max(_2446, 0.0);
    uint _2450 = uint(_2448);
    float _2452 = _2416 * _2230;
    float _2454 = _2416 * _2248;
    if (_1041)
    {
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _1135 + _2456;
        _2400 = _2458;
    }
    float _2460 = _2400;
    float _2462 = fma(_2442, _2438, _2444);
    float _2464 = fma(_2442, _2302, _2452);
    float _2466 = fma(_2442, _2440, _2454);
    if (_1041)
    {
        float _2468 = _2460 * _2460;
        _1071 = _2468;
    }
    float _2470 = _1071;
    float _2472 = trunc(_2432);
    float _2474 = precise::max(_2472, 0.0);
    uint _2476 = uint(_2474);
    int _2478 = int(_2290) + int(_2386);
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2482 = _2404 + _2480;
    int _2484 = ~_1874;
    int _2486 = _2484 + 1;
    out.m_76.x = _2438;
    out.m_76.y = _2302;
    out.m_76.z = _2440;
    int _2488 = ~_2106;
    int _2490 = _2488 + 1;
    float _2492 = fma(_2482, _2482, _2136);
    int _2494 = int(_2310) + int(_2426);
    int _2496 = _2486 * _2478;
    int _2498 = _2496 + _2236;
    int _2500 = ~_2212;
    int _2502 = _2500 + 1;
    int _2504 = int(_2328) + int(_2450);
    float _2506 = _2492 + _2470;
    bool _2508 = uint(_2498) >= uint(_1874);
    int _2510 = _2490 * _2494;
    int _2512 = _2510 + _2264;
    int _2514 = int(_2346) + int(_2476);
    int _2516 = _2502 * _2504;
    int _2518 = _2516 + _2274;
    int _2520 = ~_2228;
    int _2522 = _2520 + 1;
    float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2526 = uint(_2512) >= uint(_2106);
    bool _2528 = !_2508;
    int _2530 = _2528 ? 0 : (-1);
    int _2532 = _2522 * _2514;
    int _2534 = _2532 + _2300;
    bool _2536 = uint(_2518) >= uint(_2212);
    bool _2538 = !_2526;
    int _2540 = _2538 ? 0 : (-1);
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2544 = ~_2478;
    int _2546 = _2544 + _2530;
    int _2548 = _2546 + 1;
    int _2550 = _2236 ^ _1874;
    int _2552 = ~_2494;
    int _2554 = _2552 + _2540;
    int _2556 = _2554 + 1;
    int _2558 = _1874 * _2548;
    int _2560 = _2558 + _2236;
    bool _2562 = _1874 == 0;
    float _2564 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2566 = !_2536;
    int _2568 = _2566 ? 0 : (-1);
    float _2570 = fma(_2416, _2416, 1.0);
    uint _2572 = uint(int(uint(_2550) >> uint(31)));
    float _2574 = sqrt(_2506);
    bool _2576 = uint(_2534) >= uint(_2228);
    int _2578 = _2264 ^ _2106;
    int _2580 = _2106 * _2556;
    int _2582 = _2580 + _2264;
    bool _2584 = _1874 == 0;
    float _2586 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2588 = ~_2568;
    int _2590 = _2504 + _2588;
    int _2592 = _2590 + 1;
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2596 = ~int(_2572);
    int _2598 = _2596 + 1;
    bool _2600 = !_2562;
    int _2602 = _2600 ? _2560 : (-1);
    bool _2604 = !_2576;
    int _2606 = _2604 ? 0 : (-1);
    uint _2608 = uint(int(uint(_2578) >> uint(31)));
    int _2610 = _2592 ^ _2598;
    float _2612 = float(_2602);
    bool _2614 = _2106 == 0;
    int _2616 = ~_2606;
    int _2618 = _2514 + _2616;
    int _2620 = _2618 + 1;
    int _2622 = ~int(_2608);
    int _2624 = _2622 + 1;
    bool _2626 = _2106 == 0;
    float _2628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2630 = ~_2598;
    int _2632 = _2630 + _2610;
    int _2634 = _2632 + 1;
    float _2636 = fma(_2564, _2612, _351);
    int _2638 = _2620 ^ _2624;
    bool _2640 = !_2614;
    int _2642 = _2640 ? _2582 : (-1);
    bool _2644 = !_2584;
    int _2646 = _2644 ? _2634 : (-1);
    float _2648 = rsqrt(_2570);
    int _2650 = ~_2624;
    int _2652 = _2650 + _2638;
    int _2654 = _2652 + 1;
    float _2656 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2658 = float(_2642);
    float _2660 = _2152 + 0.5;
    float _2662 = float(_2646);
    bool _2664 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2666 = isnan(_2574);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2672 = _2668 || _2670;
    float _2674 = fma(_2656, _2658, _665);
    bool _2676 = !_2626;
    int _2678 = _2676 ? _2654 : (-1);
    float _2680 = -_651;
    float _2682 = fma(_2586, _2662, _2680);
    float _2684 = fma(_2564, _2660, _2636);
    float _2686 = _2436 + 0.5;
    float _2688 = float(_2678);
    float _2690 = _2628 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2692 = _2430 + (-0.5);
    float _2694 = _2416 * _2648;
    float _2696 = fma(_2656, _2686, _2674);
    float _2698 = -_667;
    float _2700 = fma(_2690, _2688, _2698);
    float _2702 = -_2586;
    float _2704 = fma(_2702, _2692, _2682);
    float _2706 = -_2336;
    float _2708 = _2694 * _2706;
    float _2710 = -_2338;
    float _2712 = _2694 * _2710;
    float _2714 = _2148 + (-0.5);
    float _2716 = -_2348;
    float _2718 = _2694 * _2716;
    float _2720 = fma(_2648, _2254, _2708);
    float _2722 = fma(_2648, _2230, _2712);
    float _2724 = -_2690;
    float _2726 = fma(_2724, _2714, _2700);
    float _2728 = fma(_2648, _2248, _2718);
    float _2730 = -_649;
    float _2732 = _2730 + 1.0;
    float _2734 = -_653;
    float _2736 = _2734 + 1.0;
    float _2738 = _2336 + _2462;
    float _2740 = -_1171;
    float _2742 = fma(_2152, _2740, _2684);
    float _2744 = -_2732;
    float _2746 = fma(_2436, _2744, _2696);
    float _2748 = fma(_2430, _1185, _2704);
    float _2750 = fma(_2148, _2736, _2726);
    float _2752 = _2338 + _2464;
    float _2754 = _2348 + _2466;
    out.m_78.x = _2720;
    out.m_78.y = _2722;
    out.m_78.z = _2728;
    float _2756 = _2736;
    float _2758 = _2684;
    if (!_2672)
    {
        _2756 = 1.0;
    }
    float _2760 = _2756;
    out.m_80.x = _2742;
    out.m_80.y = _2748;
    out.m_80.z = _2746;
    out.m_80.w = _2750;
    out.m_82.x = _2738;
    out.m_82.y = _2752;
    out.m_82.z = _2754;
    bool _2762 = !_2672;
    float _2764 = _2760;
    if (!_2762)
    {
        bool _2766 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2768 = isnan(_2574);
        bool _2770 = _2766 || _2768;
        bool _2772 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2774 = _2770 || _2772;
        if (!_2774)
        {
            float _2776 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2778 = _2574 + _2776;
            float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2782 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2780;
            float _2784 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2788 = 1.0 / _2782;
            float _2790 = _2778 * _2788;
            float _2792 = fma(_2790, _2786, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2764 = _2792;
            _2794 = true;
        }
        else
        {
            bool _2796 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2798 = isnan(_2574);
            bool _2800 = _2796 || _2798;
            bool _2802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2804 = _2800 || _2802;
            if (!_2804)
            {
                float _2806 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2808 = _2574 + _2806;
                float _2810 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2812 = _2810 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2814 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2816 = _2814 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2818 = 1.0 / _2812;
                float _2820 = _2808 * _2818;
                float _2822 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2764 = _2822;
                _2794 = true;
            }
            else
            {
                _2764 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2794 = false;
    float _2824 = _2764;
    float _2826 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2828 = _2404 + _2826;
    float _2830 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2832 = _1131 + _2830;
    float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2836 = _1135 + _2834;
    float _2838 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2840 = fma(_2832, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2842 = fma(_2836, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2846 = _2838 + _2844;
    float _2848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2850 = _2840 + _2848;
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2854 = _2842 + _2852;
    float _2856 = _2846 * _2846;
    float _2858 = fma(_2850, _2850, _2856);
    float _2860 = fma(_2854, _2854, _2858);
    float _2862 = rsqrt(_2860);
    float _2864 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2866 = _2850 * _2864;
    float _2868 = _2854 * _2864;
    float _2870 = _2866 * _2866;
    float _2872 = _2868 * _2868;
    float _2874 = _2870 + _2872;
    float _2876 = sqrt(_2874);
    bool _2878 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2876 + _2880;
    float _2884 = _2862;
    float _2886 = _2882;
    float _2888 = _2846;
    float _2890 = _2866;
    if (_2878)
    {
        float _2892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2892;
    }
    float _2894 = _2884;
    if (_2878)
    {
        float _2896 = rsqrt(_2874);
        _2758 = _2896;
    }
    float _2898 = _2758;
    float _2900 = _2898;
    if (_2878)
    {
        float _2902 = _2882 * _2894;
        _2886 = _2902;
    }
    float _2904 = _2886;
    if (_2878)
    {
        float _2906 = _2904 * 0.15915493667125701904296875;
        _2374 = _2906;
    }
    float _2908 = _2374;
    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2912 = _2854;
    float _2914 = _2908;
    if (_2878)
    {
        float _2916 = _2908 * 6.283185482025146484375;
        float _2918 = sin(_2916);
        _2912 = _2918;
    }
    float _2920 = _2912;
    float _2922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2924 = precise::max(0.0, _2922);
    float _2926 = _2894;
    float _2928 = _2924;
    if (_2878)
    {
        float _2930 = _2908 * 6.283185482025146484375;
        float _2932 = cos(_2930);
        _2926 = _2932;
    }
    float _2934 = _2926;
    float _2936 = -_2864;
    float _2938 = -_2924;
    float _2940 = fma(_2846, _2936, _2938);
    if (_2878)
    {
        float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2888 = _2942;
    }
    float _2944 = _2888;
    float _2946 = _2944;
    float _2948 = _2920;
    if (_2878)
    {
        float _2950 = fma(_2920, _2944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2946 = _2950;
    }
    float _2952 = _2946;
    float _2954 = _2952;
    if (!_2878)
    {
        _2948 = _2868;
    }
    float _2956 = _2948;
    float _2958 = _2956;
    float _2960 = _2934;
    if (_2878)
    {
        float _2962 = _2934 + (-1.0);
        _2928 = _2962;
    }
    float _2964 = _2928;
    if (_2878)
    {
        float _2966 = _2898 * _2952;
        _1197 = _2966;
    }
    float _2968 = _1197;
    if (!_2878)
    {
        _2900 = _2940;
    }
    float _2970 = _2900;
    float _2972 = _2970;
    if (_2878)
    {
        float _2974 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2914 = _2974;
    }
    float _2976 = _2914;
    if (_2878)
    {
        float _2978 = _2866 * _2968;
        _2890 = _2978;
    }
    float _2980 = _2890;
    if (!_2878)
    {
        _2954 = _2870;
    }
    float _2982 = _2954;
    float _2984 = sqrt(_2860);
    float _2986 = _2982;
    if (_2878)
    {
        float _2988 = fma(_2940, _2934, _2976);
        _2972 = _2988;
    }
    float _2990 = _2972;
    if (_2878)
    {
        float _2992 = _2868 * _2968;
        _2958 = _2992;
    }
    float _2994 = _2958;
    if (_2878)
    {
        float _2996 = _2980 * _2980;
        _2986 = _2996;
    }
    float _2998 = _2986;
    if (!_2878)
    {
        _2960 = _2872;
    }
    float _3000 = _2960;
    float _3002 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3004 = _3000;
    if (_2878)
    {
        float _3006 = _2994 * _2994;
        _3004 = _3006;
    }
    float _3008 = _3004;
    float _3010 = fma(_2990, _2990, _2998);
    float _3012 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3002);
    float _3014 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = _3010 + _3008;
    float _3018 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3020 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = rsqrt(_3016);
    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3026 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3024);
    float _3028 = precise::clamp(_3026, 0.0, 1.0);
    float _3030 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3012);
    float _3032 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3034 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3036 = -_3028;
    float _3038 = _3036 + 1.0;
    float _3040 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3042 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3032);
    float _3044 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3018);
    float _3046 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3048 = abs(_3038);
    float _3050 = log2(_3048);
    float _3052 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3042);
    float _3054 = _3034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3056 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3044);
    float _3058 = -_3046;
    float _3060 = fma(_3058, _2910, 1.0);
    float _3062 = _3022 * _2980;
    float _3064 = _3052 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3066 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3068 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3070 = _3022 * _2990;
    float _3072 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3074 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3066);
    float _3076 = _3022 * _2994;
    float _3078 = log2(_3060);
    float _3080 = -_3072;
    float _3082 = fma(_3070, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3080);
    float _3084 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3074);
    float _3086 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3088 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3090 = -_3076;
    float _3092 = fma(_3090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3082);
    float _3094 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3084);
    float _3096 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3098 = exp2(_3086);
    float _3100 = fma(_3092, -0.5, 0.5);
    float _3102 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3088);
    float _3104 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3096);
    float _3106 = fma(_3092, 0.5, 0.5);
    float _3108 = _3070 + 1.0;
    float _3110 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3102);
    float _3112 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3104);
    float _3114 = 1.0 / _3094;
    float _3116 = fma(_3106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3118 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3110);
    float _3120 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3112);
    float _3122 = _3078 * 0.693147182464599609375;
    float _3124 = fma(_3106, _3116, -0.212114393711090087890625);
    float _3126 = sqrt(_3100);
    float _3128 = -_3070;
    float _3130 = fma(_3098, _3108, _3128);
    float _3132 = fma(_3106, _3124, 1.570728778839111328125);
    float _3134 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3136 = fma(_3130, 0.5, 0.5);
    float _3138 = _3120 * _3114;
    float _3140 = _3118 * _3114;
    float _3142 = fma(_3138, 0.5, 0.5);
    float _3144 = fma(_3140, -0.5, 0.5);
    float _3146 = _3126 * 0.636619746685028076171875;
    float3 _8245 = float3(_3142, _3144, _3134);
    float _3148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8245, float3(0.0), isnan(_8245)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8245, float3(0.0), isnan(_8245)), level(0.0)).x;
    float3 _8256 = float3(_3142, _3144, _3134);
    float4 _3151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8256, float3(0.0), isnan(_8256)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8256, float3(0.0), isnan(_8256)), level(0.0)).xyzw;
    float _3153 = _3151.x;
    float _3155 = _3151.y;
    float _3157 = _3151.z;
    float _3159 = _3151.w;
    float _3161 = -_3132;
    float _3163 = fma(_3146, _3161, 1.0);
    float2 _8277 = float2(_3163, _3136);
    float3 _3165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8277, float2(0.0), isnan(_8277)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8277, float2(0.0), isnan(_8277)), level(0.0)).xyz;
    float _3167 = _3165.x;
    float _3169 = _3165.y;
    float _3171 = _3165.z;
    float _3173 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3175 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3177 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3179 = -_1155;
    float _3181 = _3179 + 1.0;
    float _3183 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3173);
    float _3185 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3175);
    float _3187 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3177);
    float _3189 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3183);
    float _3191 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3185);
    out.m_84.x = _2840;
    out.m_84.y = _2838;
    out.m_84.z = _2842;
    float _3193 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3195 = _3191 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3197 = 1.0 / _3193;
    float _3199 = _3195 + _3193;
    bool _3201 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3203 = isnan(_2984);
    bool _3205 = _3201 || _3203;
    bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3209 = _3205 || _3207;
    float _3211 = _3199 * _3197;
    float _3213 = _3211 * 0.5;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3217 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3215);
    float _3219 = in.m_86.x;
    float _3221 = 1.0 / _3217;
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3225 = _3221 * _3223;
    float _3227 = abs(_3225);
    float _3229 = log2(_3227);
    bool _3231 = _3225 <= 8000.0;
    bool _3233 = isnan(_3225);
    bool _3235 = _3231 || _3233;
    bool _3237 = isnan(8000.0);
    bool _3239 = _3235 || _3237;
    float _3241 = float(_3239);
    float _3243 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3245 = exp2(_3243);
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3249 = precise::clamp(_3247, 0.0, 1.0);
    float _3251 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3253 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3187);
    float _3255 = fma(_3249, -2.0, 3.0);
    float _3257 = _3249 * _3249;
    float _3259 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3253);
    float _3261 = exp2(_3251);
    float _3263 = _3257 * _3255;
    float _3265 = _3259 + _3094;
    out.gl_Position.x = _3120;
    out.gl_Position.y = _3118;
    out.gl_Position.z = _3259;
    out.gl_Position.w = _3094;
    float _3267 = -_3263;
    float _3269 = _3267 + 1.0;
    float _3271 = fma(_3269, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3263);
    float _3273 = _3241 * _3271;
    float _3275 = -_3261;
    float _3277 = _3275 + 1.0;
    float _3279 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3281 = _3265 * 0.5;
    float _3283 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3285 = _3259;
    float _3287 = _3118;
    float _3289 = _3120;
    float _3291 = _3094;
    float _3293 = _3283;
    float _3295 = _3157;
    if (!_3209)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3297 = _3285;
    float _3299 = _3181 * _3279;
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = _3297;
    float _3305 = _3297;
    if (!_3209)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3307 = _3287;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3209)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3313 = _3289;
    float _3315 = -_3301;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3319 = -_3283;
    float _3321 = _3319 + 1.0;
    float _3323 = _3317 * _3219;
    float _3325 = _3313;
    float _3327 = _3313;
    if (!_3209)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3329 = _3291;
    float _3331 = _3323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.z = _3281;
    out.m_88.w = _3094;
    out.m_90.x = _3331;
    float _3333 = _3283 * _3148;
    float _3335 = _3159 * _3321;
    float _3337 = _3329;
    float _3339 = _3329;
    if (!_3209)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3341 = _3293;
    float _3343 = _3159 * _3333;
    float _3345 = _3171 * _3333;
    float _3347 = fma(_3167, _3343, _3153);
    float _3349 = fma(_3169, _3343, _3155);
    float _3351 = fma(_3159, _3345, _3157);
    float _3353 = _3341;
    float _3355 = _3341;
    if (!_3209)
    {
        _3295 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3357 = _3295;
    out.m_92.x = _3347;
    out.m_92.y = _3349;
    out.m_92.z = _3351;
    out.m_92.w = _3335;
    bool _3359 = !_3209;
    float _3361 = _3357;
    float _3363 = _3357;
    if (!_3359)
    {
        bool _3365 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3367 = isnan(_2984);
        bool _3369 = _3365 || _3367;
        bool _3371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3373 = _3369 || _3371;
        if (!_3373)
        {
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3377 = _2984 + _3375;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3379;
            float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3387 = 1.0 / _3381;
            float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3391 = _3389 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3399 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3405 = _3377 * _3387;
            float _3407 = precise::clamp(_3405, 0.0, 1.0);
            float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3413 = fma(_3407, _3385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3415 = fma(_3407, _3411, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3417 = fma(_3407, _3391, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3419 = fma(_3407, _3395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3421 = fma(_3407, _3399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3423 = fma(_3407, _3403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3363 = _3417;
            _3311 = _3421;
            _3355 = _3413;
            _3305 = _3419;
            _3339 = _3415;
            _3327 = _3423;
            _3425 = true;
        }
        else
        {
            bool _3427 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3429 = isnan(_2984);
            bool _3431 = _3427 || _3429;
            bool _3433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3435 = _3431 || _3433;
            if (!_3435)
            {
                _3353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3437 = _3353;
            _3355 = _3437;
            if (!_3435)
            {
                _3361 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3439 = _3361;
            _3363 = _3439;
            if (!_3435)
            {
                _3337 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3441 = _3337;
            _3339 = _3441;
            if (!_3435)
            {
                _3303 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3443 = _3303;
            _3305 = _3443;
            if (!_3435)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3445 = _3309;
            _3311 = _3445;
            if (!_3435)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3447 = _3325;
            bool _3449 = !_3435;
            _3327 = _3447;
            if (!_3449)
            {
                bool _3451 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3453 = isnan(_2984);
                bool _3455 = _3451 || _3453;
                bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3459 = _3455 || _3457;
                if (!_3459)
                {
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3463 = _2984 + _3461;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3465;
                    float _3469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3473 = 1.0 / _3467;
                    float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3491 = _3463 * _3473;
                    float _3493 = precise::clamp(_3491, 0.0, 1.0);
                    float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3499 = fma(_3493, _3471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3501 = fma(_3493, _3497, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3503 = fma(_3493, _3477, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3505 = fma(_3493, _3481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3507 = fma(_3493, _3485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3509 = fma(_3493, _3489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3363 = _3503;
                    _3311 = _3507;
                    _3355 = _3499;
                    _3305 = _3505;
                    _3339 = _3501;
                    _3327 = _3509;
                    _3425 = true;
                }
                else
                {
                    _3363 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3305 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3339 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3425 = false;
    float _3511 = _3363;
    float _3513 = _3311;
    float _3515 = _3355;
    float _3517 = _3305;
    float _3519 = _3339;
    float _3521 = _3327;
    float _3523 = fma(_2752, -0.5, 0.5);
    float _3525 = precise::clamp(_3523, 0.0, 1.0);
    float _3527 = -_3511;
    float _3529 = _3527 + _3513;
    float _3531 = -_3515;
    float _3533 = _3531 + _3517;
    float _3535 = -_3519;
    float _3537 = _3535 + _3521;
    bool _3539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3541 = fma(_3525, _3529, _3511);
    float _3543 = fma(_3525, _3533, _3515);
    float _3545 = fma(_3525, _3537, _3519);
    float _3547 = _3541 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _3549 = fma(_3543, 0.298911988735198974609375, _3547);
    float _3551 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3553 = fma(_3545, 0.114477999508380889892578125, _3549);
    out.m_53.x = _3551;
    float _3555 = -_3553;
    float _3557 = _3543 + _3555;
    float _3559 = -_3553;
    float _3561 = _3541 + _3559;
    float _3563 = -_3553;
    float _3565 = _3545 + _3563;
    float _3567 = fma(_3557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    float _3569 = fma(_3561, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    float _3571 = fma(_3565, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    out.m_96.x = _3567;
    out.m_96.y = _3569;
    out.m_96.z = _3571;
    if (!_3539)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3573 = -_2838;
    float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3577 = -_2840;
    float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3581 = -_2842;
    float _3583 = _3581 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3585 = _3575 * _3575;
    float _3587 = fma(_3579, _3579, _3585);
    float _3589 = fma(_3583, _3583, _3587);
    float _3591 = sqrt(_3589);
    float _3593 = rsqrt(_3589);
    float _3595 = -_3591;
    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3599 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = _3579 * _3593;
    float _3605 = _3575 * _3593;
    float _3607 = abs(_3601);
    float _3609 = log2(_3607);
    float _3611 = _3583 * _3593;
    float _3613 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3615 = _2752 * _3605;
    float _3617 = -_3605;
    float _3619 = -_3613;
    float _3621 = fma(_3617, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3619);
    float _3623 = fma(_2738, _3603, _3615);
    float _3625 = -_3611;
    float _3627 = fma(_3625, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3621);
    float _3629 = fma(_2754, _3611, _3623);
    float _3631 = precise::clamp(_3629, 0.0, 1.0);
    float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3635 = _3627 + _3633;
    float _3637 = _3609 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3639 = _3635 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3641 = precise::clamp(_3639, 0.0, 1.0);
    float _3643 = exp2(_3637);
    float _3645 = _3643 * _3641;
    float _3647 = _3631 * _3645;
    float _3649 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3651 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3653 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3649;
    out.m_94.y = _3651;
    out.m_94.z = _3653;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3425 = false;
    bool _2794 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_50.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_131);
        out.gl_Position.z = _3710;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_55.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3779 = as_type<float>(_169);
        out.gl_Position.z = _3779;
    }
    if (_163)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_60.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    float _225 = in.m_60.z;
    float _227 = in.m_60.w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    float _245 = 1.0 / _235;
    int _247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _249 = _247 != 0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _257 = 1.0 / _239;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = _219 + _259;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _273 = _221 * 2.0;
    float _275 = _223 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _277 = 1.0 / _243;
    float _279 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _281 = _261 * _245;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _219 + _283;
    float _287 = fma(_275, -2.0, _263);
    float _289 = fma(_267, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = floor(_273);
    float _293 = -_255;
    float _295 = fma(_279, 2.0, _293);
    float _297 = _223 * 2.0;
    float _299 = _285 * _257;
    float _301 = _221 + _223;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = _219 + _303;
    float _307 = fma(_271, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = floor(_297);
    float _311 = _301 + (-1.0);
    float _313 = _225 + _223;
    float _315 = _305 * _277;
    float _317 = _225 + _221;
    float _319 = _313 + (-1.0);
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _323 = 1.0 / _253;
    bool _325 = _291 >= 0.0;
    bool _327 = isnan(_291);
    bool _329 = _325 || _327;
    bool _331 = isnan(0.0);
    bool _333 = _329 || _331;
    float _335 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _337 = as_type<int>(_319);
    if (_249)
    {
        _337 = 0;
    }
    int _339 = _337;
    float _341 = _317 + (-1.0);
    int _343 = _339;
    float _345 = _341;
    if (!_249)
    {
        _343 = 1;
    }
    int _347 = _343;
    float _349 = -_149;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[76].x, _295);
    int _353 = _333 ? 0 : 1;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _357 = _225 * 2.0;
    bool _359 = _309 > 0.0;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    bool _365 = _309 >= 0.0;
    bool _367 = isnan(_309);
    bool _369 = _365 || _367;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = _347 != 1;
    bool _377 = _291 > 0.0;
    float _379 = _231 * _323;
    int _381 = _373 ? 0 : 1;
    float _383 = floor(_357);
    int _385 = ~_381;
    int _387 = _385 + 1;
    int _389 = _387 + 1;
    int _391 = _389;
    float _393 = as_type<float>(_363);
    if (!_359)
    {
        int _395 = ~_381;
        int _397 = _395 + 1;
        _391 = _397;
    }
    int _399 = _391;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _411 = log2(_409);
    float _413 = fma(_403, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _415 = fma(_407, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _417 = ~_353;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    int _423 = _421;
    if (!_377)
    {
        int _425 = ~_353;
        int _427 = _425 + 1;
        _423 = _427;
    }
    int _429 = _423;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    bool _435 = _383 > 0.0;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _439 = int(_437);
    bool _441 = _383 >= 0.0;
    bool _443 = isnan(_383);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    float _451 = fma(_433, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _453 = _449 ? 0 : 1;
    if (!_375)
    {
        _345 = _223;
    }
    float _455 = _345;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    int _461 = ~_453;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    float _467 = _455;
    int _469 = _465;
    if (_375)
    {
        _467 = _221;
    }
    float _471 = _467;
    float _473 = fma(_459, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = _471;
    if (!_435)
    {
        int _477 = ~_453;
        int _479 = _477 + 1;
        _469 = _479;
    }
    int _481 = _469;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _493 = _491 != 0;
    float _495 = float(_481);
    float _497 = _411 * _149;
    float _499 = float(_115);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _503 = !_489;
    int _505 = _503 ? 0 : 1;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    float _511 = exp2(_497);
    bool _513 = !_493;
    int _515 = _513 ? 0 : 1;
    float _517 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[83].z, _501);
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    float _531 = float(_363);
    float _533 = float(_439);
    float _535 = 1.0 / _499;
    if (!_375)
    {
        _393 = _223;
    }
    float _537 = _393;
    float _539 = _537;
    if (_375)
    {
        _539 = _221;
    }
    float _541 = _539;
    bool _543 = !_521;
    float _545 = _543 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _547 = 1.0 / _533;
    float _549 = _545;
    if (!_375)
    {
        _475 = _225;
    }
    float _551 = _475;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _555 = _551;
    if (_375)
    {
        _555 = _223;
    }
    float _557 = _555;
    float _559 = _541 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _561 = -_511;
    float _563 = _561 + 1.0;
    float _565 = 1.0 / _531;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _569 = 1.0 + _567;
    int _571 = abs(as_type<int>(_545));
    float _573 = _557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_375)
    {
        _549 = _225;
    }
    float _575 = _549;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _579 = _575;
    if (_375)
    {
        _579 = _223;
    }
    float _581 = _579;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _585 = 1.0 / _569;
    float _587 = -_553;
    float _589 = fma(_559, 2.0, _587);
    float _591 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[83].w, _583);
    float _593 = fma(_573, -2.0, _577);
    bool _595 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _597 = isnan(1.0);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _603 = _599 || _601;
    float _605 = in.m_62.x;
    float _607 = in.m_62.y;
    float _609 = in.m_62.z;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _613 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _615 = isnan(0.0);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _621 = _617 || _619;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _625 = float(_571);
    float _627 = _535 * _149;
    float _629 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].z, _611);
    float _631 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[78].w, _623);
    float _633 = _621 ? _563 : 0.0;
    float _635 = _625 * _495;
    bool _637 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _639 = isnan(_219);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _517);
    float _651 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _287);
    float _653 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _591);
    float _655 = _565 * _149;
    float _657 = _547 * _149;
    float _659 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _661 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _631);
    float _663 = -_149;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[81].x, _589);
    float _667 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _593);
    bool _669 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _671 = isnan(_219);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _655;
    if (_603)
    {
        float _683 = _633 * _585;
        _153 = _683;
    }
    float _685 = _153;
    float _687 = _635 * (-2.0);
    bool _689 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_219);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_647;
    float _703 = _701 + 1.0;
    float _705 = -_679;
    float _707 = _705 + 1.0;
    float _709 = fma(_321, _687, _321);
    bool _711 = !_525;
    int _713 = _711 ? 0 : 1;
    float _715 = _699 * _703;
    float _717 = -_699;
    float _719 = _717 + 1.0;
    bool _721 = !_529;
    int _723 = _721 ? 0 : 1;
    float _725 = _647 * _707;
    int _727 = abs(_713);
    float _729 = fma(_687, _605, _605);
    bool _731 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _733 = isnan(_219);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    int _743 = abs(_723);
    bool _745 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _747 = isnan(_219);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = _741 * _719;
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = _221 + (-0.5);
    float _765 = float(_429);
    float _767 = float(_727);
    float _769 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[196].x, _729);
    float _771 = _755 * _761;
    float _773 = float(_399);
    float _775 = -_755;
    float _777 = _775 + 1.0;
    float _779 = _767 * _765;
    float _781 = float(_743);
    float _783 = fma(_709, _685, _769);
    float _785 = _413 * _771;
    float _787 = _779 * (-2.0);
    float _789 = _289 * _771;
    float _791 = _781 * _773;
    float _793 = _783 * 0.15915493667125701904296875;
    float _795 = fma(_787, _607, _607);
    float _797 = _223 + (-0.5);
    float _799 = fma(_335, _787, _335);
    float _801 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[143].y, _785);
    float _803 = _791 * (-2.0);
    float _805 = in.m_64.x;
    float _807 = in.m_64.y;
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _795);
    float _811 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[143].x, _789);
    float _813 = fma(_355, _803, _355);
    float _815 = fma(_803, _609, _609);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _825 = fma(_415, _757, _801);
    float _827 = _225 + (-0.5);
    float _829 = fma(_307, _757, _811);
    float _831 = fma(_819, _379, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _833 = fma(_823, _379, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _835 = fma(_451, _715, _825);
    float _837 = fma(_799, _685, _809);
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _815);
    float _841 = fma(_473, _715, _829);
    float _843 = in.m_50.x;
    float _845 = in.m_50.y;
    float _847 = in.m_50.z;
    float _849 = fma(_833, _725, _835);
    float _851 = fma(_813, _685, _839);
    float _853 = fma(_831, _725, _841);
    float _855 = in.m_66.x;
    float _857 = in.m_66.y;
    float _859 = in.m_66.z;
    float _861 = in.m_66.w;
    float _863 = _837 * 0.15915493667125701904296875;
    float _865 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[147].y, _849);
    float _867 = _851 * 0.15915493667125701904296875;
    float _869 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[147].x, _853);
    float _871 = _793 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _865 * _807;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _879 = _869 * _805;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _883 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _885 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _887 = _863 * 6.283185482025146484375;
    float _889 = sin(_887);
    float _891 = in.m_68.x;
    float _893 = in.m_68.y;
    float _895 = in.m_68.z;
    float _897 = in.m_68.w;
    float _899 = _883 * _877;
    float _901 = _885 * _881;
    float _903 = _863 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _845 * _857;
    float _909 = fma(_843, _855, _907);
    float _911 = _793 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = _873 * _889;
    float _917 = fma(_847, _859, _909);
    float _919 = _867 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _873 * _905;
    float _925 = _867 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _913 * _889;
    float _931 = _913 * _905;
    float _933 = _873 * _921;
    float _935 = _913 * _921;
    float _937 = _905 * _921;
    float _939 = _889 * _921;
    float _941 = _933 * _899;
    float _943 = fma(_927, _923, _929);
    float _945 = -_915;
    float _947 = fma(_927, _931, _945);
    float _949 = -_931;
    float _951 = fma(_927, _915, _949);
    float _953 = -_899;
    float _955 = _927 * _953;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = fma(_943, _901, _941);
    float _961 = _935 * _899;
    float _963 = fma(_937, _901, _955);
    float _965 = fma(_927, _929, _923);
    float _967 = fma(_951, _957, _959);
    float _969 = _845 * _893;
    float _971 = fma(_947, _901, _961);
    float _973 = fma(_939, _957, _963);
    float _975 = _967 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _977 = _967 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _979 = fma(_843, _891, _969);
    float _981 = fma(_965, _957, _971);
    float _983 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _975);
    float _985 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _977);
    float _987 = fma(_847, _895, _979);
    float _989 = _917 + _861;
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].z, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].z, _985);
    float _995 = _987 + _897;
    float _997 = _967 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1001 = _993 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1003 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _997);
    float _1005 = _989 + _999;
    float _1007 = _995 + _1001;
    float _1009 = in.m_70.x;
    float _1011 = in.m_70.y;
    float _1013 = in.m_70.z;
    float _1015 = in.m_70.w;
    float _1017 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1003);
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _1005 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1025 = _1007 + _1023;
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1029 = _1021 * _1021;
    float _1031 = _1025 * _1025;
    float _1033 = _1029 + _1031;
    float _1035 = sqrt(_1033);
    float _1037 = _845 * _1011;
    float _1039 = fma(_843, _1009, _1037);
    bool _1041 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = _1035 + _1043;
    float _1047 = fma(_847, _1013, _1039);
    float _1049 = _1047 + _1015;
    float _1051 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1053 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1055 = 0.0;
    float _1057 = _1033;
    float _1059 = _1045;
    float _1061 = _845;
    float _1063 = _1005;
    float _1065 = _1007;
    float _1067 = _1027;
    float _1069 = _1029;
    float _1071 = _1031;
    if (_1041)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1055 = _1073;
    }
    float _1075 = _1055;
    if (_1041)
    {
        float _1077 = rsqrt(_1033);
        _1057 = _1077;
    }
    float _1079 = _1057;
    if (_1041)
    {
        float _1081 = _1045 * _1075;
        _1059 = _1081;
    }
    float _1083 = _1059;
    float _1085 = _1049 + _1027;
    float _1087 = floor(_1051);
    float _1089 = _1083;
    float _1091 = _1085;
    if (_1041)
    {
        float _1093 = _1083 * 0.15915493667125701904296875;
        _1089 = _1093;
    }
    float _1095 = _1089;
    float _1097 = _1095;
    if (_1041)
    {
        float _1099 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1061 = _1099;
    }
    float _1101 = _1061;
    float _1103 = _843;
    float _1105 = _1101;
    if (_1041)
    {
        float _1107 = _1095 * 6.283185482025146484375;
        float _1109 = sin(_1107);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = floor(_1053);
    if (_1041)
    {
        float _1115 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1115;
    }
    float _1117 = _1105;
    float _1119 = _1117;
    if (_1041)
    {
        float _1121 = _1079 * _1117;
        _1119 = _1121;
    }
    float _1123 = _1119;
    float _1125 = -_1087;
    float _1127 = _1051 + _1125;
    if (_1041)
    {
        float _1129 = fma(_1021, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1063 = _1129;
    }
    float _1131 = _1063;
    if (_1041)
    {
        float _1133 = fma(_1025, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1065 = _1133;
    }
    float _1135 = _1065;
    float _1137 = -_1113;
    float _1139 = _1053 + _1137;
    float _1141 = fma(_1131, 6.2500002968590706586837768554688e-05, 0.5);
    float _1143 = fma(_1135, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5274 = float2(_1141, _1143);
    float3 _1147 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5274, float2(0.0), isnan(_5274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5274, float2(0.0), isnan(_5274)), level(0.0)).xyz;
    float _1149 = _1147.x;
    float _1151 = _1147.y;
    float _1153 = _1147.z;
    float2 _5290 = float2(_1127, _1139);
    float _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5290, float2(0.0), isnan(_5290)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5290, float2(0.0), isnan(_5290)), level(0.0)).x;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1159 = int(_1157);
    if (_249)
    {
        float _1161 = in.m_60.x;
        _1067 = _1161;
    }
    float _1163 = _1067;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1167 = _1165 != 0;
    float _1169 = -_659;
    float _1171 = _1169 + 1.0;
    int _1173 = abs(_505);
    float _1175 = _1163;
    if (!_249)
    {
        float _1177 = in.m_60.y;
        _1175 = _1177;
    }
    float _1179 = _1175;
    int _1181 = abs(_515);
    float _1183 = -_661;
    float _1185 = _1183 + 1.0;
    float _1187 = trunc(_655);
    int _1189 = int(_1187);
    float _1191 = float(uint(_1159));
    float _1193 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1195 = int(_1193);
    float _1197 = _1185;
    if (_249)
    {
        _681 = 1.0;
    }
    float _1199 = _681;
    float _1201 = _1199;
    if (!_249)
    {
        _1201 = 1.2345600128173828125;
    }
    float _1203 = _1201;
    float _1205 = float(uint(_1189));
    float _1207 = 1.0 / _1191;
    float _1209 = _1203 * _1179;
    int _1211 = ~_1159;
    int _1213 = _1211 + 1;
    float _1215 = float(uint(_1195));
    float _1217 = trunc(_657);
    int _1219 = int(_1217);
    int _1221 = ~_1159;
    int _1223 = _1221 + 1;
    int _1225 = as_type<int>(_1207) + (-2);
    float _1227 = 1.0 / _1215;
    float _1229 = as_type<float>(_1225) * _1205;
    float _1231 = float(uint(_1219));
    float _1233 = floor(_1209);
    float _1235 = float(_1219);
    float _1237 = trunc(_1229);
    float _1239 = precise::max(_1237, 0.0);
    uint _1242 = uint(_1239);
    float _1244 = -_1233;
    float _1246 = _1209 + _1244;
    float _1248 = _1227;
    if (_1041)
    {
        float _1250 = _1095 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        _1097 = _1252;
    }
    float _1254 = _1097;
    int _1256 = _1223 * int(_1242);
    int _1258 = _1256 + _1189;
    float _1260 = float(uint(_1258));
    float _1262 = as_type<float>(_1225) * _1260;
    int _1264 = as_type<int>(_1227) + (-2);
    if (_249)
    {
        _1248 = 1.0;
    }
    float _1266 = _1248;
    float _1268 = _1266;
    if (!_249)
    {
        _1268 = 7.345489978790283203125;
    }
    float _1270 = _1268;
    float _1272 = trunc(_1262);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    float _1278 = as_type<float>(_1264) * _1231;
    int _1280 = ~_1195;
    int _1282 = _1280 + 1;
    float _1284 = _1270 * _221;
    float _1286 = trunc(_1278);
    float _1288 = precise::max(_1286, 0.0);
    uint _1290 = uint(_1288);
    int _1292 = int(_1242) + int(_1276);
    float _1294 = floor(_1284);
    float _1296 = float(_1159);
    int _1298 = _1213 * _1292;
    int _1300 = _1298 + _1189;
    float _1302 = float(_1189);
    int _1304 = _1282 * int(_1290);
    int _1306 = _1304 + _1219;
    bool _1308 = _1302 >= _1296;
    bool _1310 = isnan(_1302);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1296);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    bool _1320 = uint(_1300) >= uint(_1159);
    float _1322 = float(uint(_1306));
    float _1324 = trunc(_1318);
    int _1326 = int(_1324);
    bool _1328 = !_1320;
    int _1330 = _1328 ? 0 : (-1);
    float _1332 = -_1294;
    float _1334 = _1284 + _1332;
    float _1336 = as_type<float>(_1264) * _1322;
    int _1338 = ~_1292;
    int _1340 = _1338 + _1330;
    int _1342 = _1340 + 1;
    float _1344 = _1334 * _1296;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1348 = _1346 != 0;
    float _1350 = trunc(_1336);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    int _1356 = _1159 * _1342;
    int _1358 = _1356 + _1189;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1374 = _1372 != 0;
    float _1376 = _1296 * _627;
    bool _1378 = !_1348;
    int _1380 = _1378 ? 0 : 1;
    bool _1382 = _1159 == 0;
    float _1384 = trunc(_1344);
    int _1386 = int(_1384);
    int _1388 = ~_1326;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    bool _1394 = !_1382;
    int _1396 = _1394 ? _1358 : (-1);
    int _1398 = _1159 + (-1);
    int _1400 = abs(_1380);
    int _1402 = _1396 * _1392;
    int _1404 = int(_1290) + int(_1354);
    float _1406 = trunc(_1376);
    int _1408 = int(_1406);
    int _1410 = ~_1195;
    int _1412 = _1410 + 1;
    int _1414 = _1326 * _1398;
    int _1416 = _1414 + _1402;
    float _1418 = float(_1195);
    int _1420 = _1412 * _1404;
    int _1422 = _1420 + _1219;
    bool _1424 = _1235 >= _1418;
    bool _1426 = isnan(_1235);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(_1418);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = _1246 * _1418;
    bool _1438 = !_1167;
    int _1440 = _1438 ? 0 : 1;
    int _1442 = _1416 * _1173;
    bool _1444 = uint(_1422) >= uint(_1195);
    float _1446 = trunc(_1434);
    int _1448 = int(_1446);
    int _1450 = abs(_509);
    float _1452 = _1418 * _627;
    bool _1454 = !_1444;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = _1408 * _1450;
    int _1460 = _1458 + _1442;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1464 = _1462 != 0;
    float _1466 = trunc(_1436);
    int _1468 = int(_1466);
    int _1470 = ~_1404;
    int _1472 = _1470 + _1456;
    int _1474 = _1472 + 1;
    int _1476 = _1386 * _1400;
    int _1478 = _1476 + _1189;
    bool _1480 = !_1464;
    int _1482 = _1480 ? 0 : 1;
    bool _1484 = _1195 == 0;
    int _1486 = _1195 * _1474;
    int _1488 = _1486 + _1219;
    int _1490 = abs(_1482);
    float _1492 = trunc(_1452);
    int _1494 = int(_1492);
    int _1496 = abs(_1440);
    int _1498 = ~_1448;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1478 * _1181;
    int _1506 = _1504 + _1460;
    bool _1508 = !_1484;
    int _1510 = _1508 ? _1488 : (-1);
    int _1512 = _1468 * _1490;
    int _1514 = _1512 + _1219;
    int _1516 = _1195 + (-1);
    int _1518 = _1386 * _1496;
    int _1520 = _1518 + _1506;
    int _1522 = ~_1159;
    int _1524 = _1522 + 1;
    int _1526 = _1510 * _1502;
    bool _1528 = !_1366;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = float(uint(_1520));
    int _1534 = _1448 * _1516;
    int _1536 = _1534 + _1526;
    bool _1538 = !_1362;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = abs(_1530);
    float _1544 = as_type<float>(_1225) * _1532;
    bool _1546 = !_1370;
    int _1548 = _1546 ? 0 : 1;
    int _1550 = abs(_1540);
    bool _1552 = !_1374;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = trunc(_1544);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    int _1562 = abs(_1548);
    int _1564 = _1536 * _1542;
    int _1566 = abs(_1554);
    int _1568 = _1494 * _1550;
    int _1570 = _1568 + _1564;
    float _1572 = float(uint(_1514));
    int _1574 = ~_1159;
    int _1576 = _1574 + 1;
    int _1578 = _1514 * _1562;
    int _1580 = _1578 + _1570;
    int _1582 = ~_1159;
    int _1584 = _1582 + 1;
    int _1586 = ~_1195;
    int _1588 = _1586 + 1;
    int _1590 = _1468 * _1566;
    int _1592 = _1590 + _1580;
    float _1594 = float(uint(_1478));
    int _1596 = _1584 * int(_1560);
    int _1598 = _1596 + _1520;
    int _1600 = ~_1195;
    int _1602 = _1600 + 1;
    float _1604 = float(uint(_1592));
    float _1606 = as_type<float>(_1225) * _1594;
    float _1608 = float(uint(_1598));
    float _1610 = as_type<float>(_1264) * _1604;
    float _1612 = as_type<float>(_1225) * _1608;
    float _1614 = trunc(_1606);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    float _1620 = as_type<float>(_1264) * _1572;
    float _1622 = trunc(_1610);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    float _1628 = trunc(_1612);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    int _1634 = _1602 * int(_1626);
    int _1636 = _1634 + _1592;
    float _1638 = trunc(_1620);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    float _1644 = float(uint(_1636));
    int _1646 = _1524 * int(_1618);
    int _1648 = _1646 + _1478;
    int _1650 = int(_1560) + int(_1632);
    float _1652 = as_type<float>(_1264) * _1644;
    float _1654 = float(uint(_1648));
    int _1656 = _1576 * _1650;
    int _1658 = _1656 + _1520;
    float _1660 = trunc(_1652);
    float _1662 = precise::max(_1660, 0.0);
    uint _1664 = uint(_1662);
    float _1666 = as_type<float>(_1225) * _1654;
    bool _1668 = uint(_1658) >= uint(_1159);
    int _1670 = _1588 * int(_1642);
    int _1672 = _1670 + _1514;
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    float _1678 = float(uint(_1672));
    int _1680 = ~_1650;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    float _1686 = trunc(_1666);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = ~_1195;
    int _1694 = _1692 + 1;
    float _1696 = as_type<float>(_1264) * _1678;
    int _1698 = _1159 * _1684;
    int _1700 = _1698 + _1520;
    int _1702 = int(_1626) + int(_1664);
    float _1704 = trunc(_1696);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = ~_1159;
    int _1712 = _1710 + 1;
    int _1714 = _1694 * _1702;
    int _1716 = _1714 + _1592;
    bool _1718 = !_1382;
    int _1720 = _1718 ? _1700 : (-1);
    out.m_72.x = _1149;
    out.m_72.y = _1151;
    out.m_72.z = _1153;
    int _1722 = int(_1618) + int(_1690);
    int _1724 = _1720 & 3;
    bool _1726 = _1724 != 0;
    int _1728 = _1720 & 3;
    bool _1730 = _1728 != 0;
    bool _1732 = uint(_1716) >= uint(_1195);
    int _1734 = _1726 ? 0 : 1;
    bool _1736 = uint(_1728) > 1u;
    bool _1738 = uint(_1728) >= 2u;
    bool _1740 = !_1732;
    int _1742 = _1740 ? 0 : (-1);
    int _1744 = _1738 ? 0 : 1;
    bool _1746 = _1728 != 3;
    bool _1748 = _227 > 0.5;
    int _1750 = _1712 * _1722;
    int _1752 = _1750 + _1478;
    int _1754 = ~_1195;
    int _1756 = _1754 + 1;
    int _1758 = int(_1642) + int(_1708);
    int _1760 = ~_1734;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    int _1766 = ~_1702;
    int _1768 = _1766 + _1742;
    int _1770 = _1768 + 1;
    int _1772 = _1756 * _1758;
    int _1774 = _1772 + _1514;
    int _1776 = _1764;
    if (!_1736)
    {
        int _1778 = ~_1734;
        int _1780 = _1778 + 1;
        _1776 = _1780;
    }
    int _1782 = _1776;
    bool _1784 = uint(_1752) >= uint(_1159);
    int _1786 = _1195 * _1770;
    int _1788 = _1786 + _1592;
    int _1790 = ~_1744;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    bool _1796 = !_1784;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = _1794;
    if (_1746)
    {
        int _1802 = ~_1744;
        int _1804 = _1802 + 1;
        _1800 = _1804;
    }
    int _1806 = _1800;
    bool _1808 = uint(_1774) >= uint(_1195);
    int _1810 = ~_1722;
    int _1812 = _1810 + _1798;
    int _1814 = _1812 + 1;
    float _1816 = -_189;
    int _1818 = _1748 ? as_type<int>(_1816) : as_type<int>(_189);
    bool _1820 = !_1484;
    int _1822 = _1820 ? _1788 : (-1);
    int _1824 = _1159 * _1814;
    int _1826 = _1824 + _1478;
    int _1828 = _1720 >> 31;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1808;
    int _1836 = _1834 ? 0 : (-1);
    int _1838 = _1822 >> 31;
    int _1840 = _1828 & 3;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1844 = _1842 != 0;
    bool _1846 = !_1832;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1822 & 3;
    bool _1852 = _1850 != 0;
    int _1854 = ~_1758;
    int _1856 = _1854 + _1836;
    int _1858 = _1856 + 1;
    int _1860 = _1838 & 3;
    int _1862 = _1720 + _1840;
    int _1864 = _1195 * _1858;
    int _1866 = _1864 + _1514;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : 1;
    float _1872 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1874 = int(_1872);
    bool _1876 = uint(_1850) > 1u;
    int _1878 = _1822 + _1860;
    int _1880 = _1862 >> 2;
    int _1882 = _1822 & 3;
    bool _1884 = _1882 != 0;
    int _1886 = _1878 >> 2;
    int _1888 = _1880 << 4;
    int _1890 = _1888 + 368;
    int _1892 = _1884 ? 0 : 1;
    bool _1894 = _1728 != 3;
    int _1896 = _1886 << 4;
    int _1898 = _1896 + 512;
    uint _1900 = uint(int(uint(_1890) >> uint(2)));
    uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
    int _1904 = int(_1900) & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    int _1908 = int(_1900) + 1;
    uint _1910 = uint(int(uint(_1908) >> uint(2)));
    int _1912 = _1908 & 3;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[int(_1910)][_1912];
    int _1916 = ~_1892;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (!_1876)
    {
        int _1924 = ~_1892;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    bool _1930 = !_1730;
    int _1932 = _1930 ? 0 : 1;
    bool _1934 = _1850 != 3;
    uint _1936 = uint(int(uint(_1898) >> uint(2)));
    uint _1938 = uint(int(uint(int(_1936)) >> uint(2)));
    int _1940 = int(_1936) & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    int _1944 = int(_1936) + 1;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    int _1948 = _1944 & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    bool _1952 = uint(_1850) >= 2u;
    bool _1954 = !_1382;
    int _1956 = _1954 ? _1826 : (-1);
    int _1958 = _1952 ? 0 : 1;
    bool _1960 = _1850 != 3;
    bool _1962 = !_1852;
    int _1964 = _1962 ? 0 : 1;
    bool _1966 = !_1894;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = ~_1958;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1982 = _1980 != 0;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    int _1988 = _1974;
    if (_1934)
    {
        int _1990 = ~_1958;
        int _1992 = _1990 + 1;
        _1988 = _1992;
    }
    int _1994 = _1988;
    int _1996 = _1890 + 8;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
    int _2002 = int(_1998) & 3;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[int(_2000)][_2002];
    int _2006 = int(_1998) + 1;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    int _2010 = _2006 & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    int _2014 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2016 = _2014 != 0;
    int _2018 = abs(_1782);
    int _2020 = abs(_1928);
    bool _2022 = !_1960;
    int _2024 = _2022 ? 0 : (-1);
    int _2026 = _1898 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    bool _2044 = _221 > 0.5;
    int _2046 = abs(_1932);
    int _2048 = ~_2018;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    bool _2054 = !_1484;
    int _2056 = _2054 ? _1866 : (-1);
    float _2058 = -_185;
    int _2060 = _2044 ? as_type<int>(_2058) : as_type<int>(_185);
    int _2062 = _2052 * as_type<int>(_1914);
    bool _2064 = _223 > 0.5;
    bool _2066 = _225 > 0.5;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2070 = abs(_1964);
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2074 = ~_2020;
    int _2076 = _2074 + 1;
    int _2078 = _2076 + 1;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2082 = ~_2046;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2090 = _2078 * as_type<int>(_1950);
    int _2092 = ~_2070;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    int _2098 = _2086 * as_type<int>(_1906);
    int _2100 = _2098 + _2062;
    int _2102 = abs(_1806);
    float _2104 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2106 = int(_2104);
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2110 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2114 = _2096 * as_type<int>(_1942);
    int _2116 = _2114 + _2090;
    float _2118 = as_type<float>(_2070);
    if (_1041)
    {
        float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2122 = _1131 + _2120;
        _2118 = _2122;
    }
    float _2124 = _2118;
    int _2126 = abs(_1968);
    out.m_74.x = _2088;
    out.m_74.y = _2110;
    out.m_74.z = _2112;
    out.m_74.w = _2108;
    int _2128 = abs(_1994);
    float _2130 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2132 = abs(_2024);
    if (_1041)
    {
        float _2134 = _2124 * _2124;
        _1069 = _2134;
    }
    float _2136 = _1069;
    int _2138 = ~_2102;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    float _2144 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    bool _2146 = !_1978;
    float _2148 = _2146 ? _189 : as_type<float>(_1818);
    bool _2150 = !_2016;
    float _2152 = _2150 ? _185 : as_type<float>(_2060);
    int _2154 = _2142 * as_type<int>(_2004);
    int _2156 = _2154 + _2100;
    int _2158 = ~_2128;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2166 = float(uint(_1874));
    int _2168 = _2162 * as_type<int>(_2034);
    int _2170 = _2168 + _2116;
    int _2172 = ~_2126;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    float _2178 = -_927;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2164);
    int _2182 = ~_2132;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    float _2188 = 1.0 / _2166;
    int _2190 = abs(_1848);
    int _2192 = _2176 * as_type<int>(_2012);
    int _2194 = _2192 + _2156;
    float _2196 = float(uint(_2106));
    float _2198 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2200 = ~_2190;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    float _2206 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2208 = _2186 * as_type<int>(_2042);
    int _2210 = _2208 + _2170;
    int _2212 = abs(_1874);
    float _2214 = 1.0 / _2196;
    int _2216 = abs(_1870);
    float _2218 = -_927;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    float _2222 = -_927;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    int _2226 = _2194 * _2204;
    int _2228 = abs(_2106);
    float _2230 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    float _2232 = float(uint(_2212));
    int _2234 = _1956 * _2190;
    int _2236 = _2234 + _2226;
    int _2238 = ~_2216;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2246 = float(uint(_2228));
    float _2248 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2250 = 1.0 / _2232;
    int _2252 = _2210 * _2242;
    float _2254 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2180);
    int _2256 = as_type<int>(_2188) + (-2);
    float _2258 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2244);
    float _2260 = float(uint(_2236));
    int _2262 = _2056 * _2216;
    int _2264 = _2262 + _2252;
    int _2266 = as_type<int>(_2214) + (-2);
    float _2268 = 1.0 / _2246;
    float _2270 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = as_type<float>(_2256) * _2260;
    int _2274 = abs(_2236);
    float _2276 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2278 = ~_1874;
    int _2280 = _2278 + 1;
    float _2282 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2284 = float(uint(_2264));
    float _2286 = trunc(_2272);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    float _2292 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2294 = as_type<float>(_2266) * _2284;
    int _2296 = as_type<int>(_2250) + (-2);
    float _2298 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2292);
    int _2300 = abs(_2264);
    float _2302 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2304 = float(uint(_2274));
    float _2306 = trunc(_2294);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    int _2312 = as_type<int>(_2268) + (-2);
    float _2314 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = float(uint(_2300));
    float _2318 = as_type<float>(_2296) * _2304;
    float _2320 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2322 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2324 = trunc(_2318);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    float _2330 = as_type<float>(_2312) * _2316;
    int _2332 = _2280 * int(_2290);
    int _2334 = _2332 + _2236;
    float _2336 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2338 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2298);
    float _2340 = float(uint(_2334));
    float _2342 = trunc(_2330);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2322);
    int _2350 = ~_2106;
    int _2352 = _2350 + 1;
    int _2354 = ~_2212;
    int _2356 = _2354 + 1;
    float _2358 = as_type<float>(_2256) * _2340;
    int _2360 = ~_2228;
    int _2362 = _2360 + 1;
    int _2364 = _2352 * int(_2310);
    int _2366 = _2364 + _2264;
    int _2368 = _2356 * int(_2328);
    int _2370 = _2368 + _2274;
    float _2372 = as_type<float>(_2362);
    float _2374 = _2338;
    if (_1041)
    {
        float _2376 = _1254 + (-1.0);
        _2372 = _2376;
    }
    float _2378 = _2372;
    float _2380 = float(uint(_2366));
    float _2382 = trunc(_2358);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = _2378;
    if (_1041)
    {
        float _2390 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2388 = _2390;
    }
    float _2392 = _2388;
    int _2394 = _2362 * int(_2346);
    int _2396 = _2394 + _2300;
    float _2398 = float(uint(_2370));
    float _2400 = _2398;
    if (_1041)
    {
        float _2402 = fma(_1085, _1254, _2392);
        _1091 = _2402;
    }
    float _2404 = _1091;
    float _2406 = as_type<float>(_2266) * _2380;
    float _2408 = float(uint(_2396));
    float _2410 = as_type<float>(_2296) * _2398;
    float _2412 = -_189;
    int _2414 = _2064 ? as_type<int>(_2412) : as_type<int>(_189);
    float _2416 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2418 = -_185;
    int _2420 = _2066 ? as_type<int>(_2418) : as_type<int>(_185);
    float _2422 = trunc(_2406);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    bool _2428 = !_1982;
    float _2430 = _2428 ? _189 : as_type<float>(_2414);
    float _2432 = as_type<float>(_2312) * _2408;
    bool _2434 = !_1986;
    float _2436 = _2434 ? _185 : as_type<float>(_2420);
    float _2438 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    float _2440 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2258);
    float _2442 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2416 * _2254;
    float _2446 = trunc(_2410);
    float _2448 = precise::max(_2446, 0.0);
    uint _2450 = uint(_2448);
    float _2452 = _2416 * _2230;
    float _2454 = _2416 * _2248;
    if (_1041)
    {
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _1135 + _2456;
        _2400 = _2458;
    }
    float _2460 = _2400;
    float _2462 = fma(_2442, _2438, _2444);
    float _2464 = fma(_2442, _2302, _2452);
    float _2466 = fma(_2442, _2440, _2454);
    if (_1041)
    {
        float _2468 = _2460 * _2460;
        _1071 = _2468;
    }
    float _2470 = _1071;
    float _2472 = trunc(_2432);
    float _2474 = precise::max(_2472, 0.0);
    uint _2476 = uint(_2474);
    int _2478 = int(_2290) + int(_2386);
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2482 = _2404 + _2480;
    int _2484 = ~_1874;
    int _2486 = _2484 + 1;
    out.m_76.x = _2438;
    out.m_76.y = _2302;
    out.m_76.z = _2440;
    int _2488 = ~_2106;
    int _2490 = _2488 + 1;
    float _2492 = fma(_2482, _2482, _2136);
    int _2494 = int(_2310) + int(_2426);
    int _2496 = _2486 * _2478;
    int _2498 = _2496 + _2236;
    int _2500 = ~_2212;
    int _2502 = _2500 + 1;
    int _2504 = int(_2328) + int(_2450);
    float _2506 = _2492 + _2470;
    bool _2508 = uint(_2498) >= uint(_1874);
    int _2510 = _2490 * _2494;
    int _2512 = _2510 + _2264;
    int _2514 = int(_2346) + int(_2476);
    int _2516 = _2502 * _2504;
    int _2518 = _2516 + _2274;
    int _2520 = ~_2228;
    int _2522 = _2520 + 1;
    float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2526 = uint(_2512) >= uint(_2106);
    bool _2528 = !_2508;
    int _2530 = _2528 ? 0 : (-1);
    int _2532 = _2522 * _2514;
    int _2534 = _2532 + _2300;
    bool _2536 = uint(_2518) >= uint(_2212);
    bool _2538 = !_2526;
    int _2540 = _2538 ? 0 : (-1);
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2544 = ~_2478;
    int _2546 = _2544 + _2530;
    int _2548 = _2546 + 1;
    int _2550 = _2236 ^ _1874;
    int _2552 = ~_2494;
    int _2554 = _2552 + _2540;
    int _2556 = _2554 + 1;
    int _2558 = _1874 * _2548;
    int _2560 = _2558 + _2236;
    bool _2562 = _1874 == 0;
    float _2564 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2566 = !_2536;
    int _2568 = _2566 ? 0 : (-1);
    float _2570 = fma(_2416, _2416, 1.0);
    uint _2572 = uint(int(uint(_2550) >> uint(31)));
    float _2574 = sqrt(_2506);
    bool _2576 = uint(_2534) >= uint(_2228);
    int _2578 = _2264 ^ _2106;
    int _2580 = _2106 * _2556;
    int _2582 = _2580 + _2264;
    bool _2584 = _1874 == 0;
    float _2586 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2588 = ~_2568;
    int _2590 = _2504 + _2588;
    int _2592 = _2590 + 1;
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2596 = ~int(_2572);
    int _2598 = _2596 + 1;
    bool _2600 = !_2562;
    int _2602 = _2600 ? _2560 : (-1);
    bool _2604 = !_2576;
    int _2606 = _2604 ? 0 : (-1);
    uint _2608 = uint(int(uint(_2578) >> uint(31)));
    int _2610 = _2592 ^ _2598;
    float _2612 = float(_2602);
    bool _2614 = _2106 == 0;
    int _2616 = ~_2606;
    int _2618 = _2514 + _2616;
    int _2620 = _2618 + 1;
    int _2622 = ~int(_2608);
    int _2624 = _2622 + 1;
    bool _2626 = _2106 == 0;
    float _2628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2630 = ~_2598;
    int _2632 = _2630 + _2610;
    int _2634 = _2632 + 1;
    float _2636 = fma(_2564, _2612, _351);
    int _2638 = _2620 ^ _2624;
    bool _2640 = !_2614;
    int _2642 = _2640 ? _2582 : (-1);
    bool _2644 = !_2584;
    int _2646 = _2644 ? _2634 : (-1);
    float _2648 = rsqrt(_2570);
    int _2650 = ~_2624;
    int _2652 = _2650 + _2638;
    int _2654 = _2652 + 1;
    float _2656 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2658 = float(_2642);
    float _2660 = _2152 + 0.5;
    float _2662 = float(_2646);
    bool _2664 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2666 = isnan(_2574);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2672 = _2668 || _2670;
    float _2674 = fma(_2656, _2658, _665);
    bool _2676 = !_2626;
    int _2678 = _2676 ? _2654 : (-1);
    float _2680 = -_651;
    float _2682 = fma(_2586, _2662, _2680);
    float _2684 = fma(_2564, _2660, _2636);
    float _2686 = _2436 + 0.5;
    float _2688 = float(_2678);
    float _2690 = _2628 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2692 = _2430 + (-0.5);
    float _2694 = _2416 * _2648;
    float _2696 = fma(_2656, _2686, _2674);
    float _2698 = -_667;
    float _2700 = fma(_2690, _2688, _2698);
    float _2702 = -_2586;
    float _2704 = fma(_2702, _2692, _2682);
    float _2706 = -_2336;
    float _2708 = _2694 * _2706;
    float _2710 = -_2338;
    float _2712 = _2694 * _2710;
    float _2714 = _2148 + (-0.5);
    float _2716 = -_2348;
    float _2718 = _2694 * _2716;
    float _2720 = fma(_2648, _2254, _2708);
    float _2722 = fma(_2648, _2230, _2712);
    float _2724 = -_2690;
    float _2726 = fma(_2724, _2714, _2700);
    float _2728 = fma(_2648, _2248, _2718);
    float _2730 = -_649;
    float _2732 = _2730 + 1.0;
    float _2734 = -_653;
    float _2736 = _2734 + 1.0;
    float _2738 = _2336 + _2462;
    float _2740 = -_1171;
    float _2742 = fma(_2152, _2740, _2684);
    float _2744 = -_2732;
    float _2746 = fma(_2436, _2744, _2696);
    float _2748 = fma(_2430, _1185, _2704);
    float _2750 = fma(_2148, _2736, _2726);
    float _2752 = _2338 + _2464;
    float _2754 = _2348 + _2466;
    out.m_78.x = _2720;
    out.m_78.y = _2722;
    out.m_78.z = _2728;
    float _2756 = _2736;
    float _2758 = _2684;
    if (!_2672)
    {
        _2756 = 1.0;
    }
    float _2760 = _2756;
    out.m_80.x = _2742;
    out.m_80.y = _2748;
    out.m_80.z = _2746;
    out.m_80.w = _2750;
    out.m_82.x = _2738;
    out.m_82.y = _2752;
    out.m_82.z = _2754;
    bool _2762 = !_2672;
    float _2764 = _2760;
    if (!_2762)
    {
        bool _2766 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2768 = isnan(_2574);
        bool _2770 = _2766 || _2768;
        bool _2772 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2774 = _2770 || _2772;
        if (!_2774)
        {
            float _2776 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2778 = _2574 + _2776;
            float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2782 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2780;
            float _2784 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2788 = 1.0 / _2782;
            float _2790 = _2778 * _2788;
            float _2792 = fma(_2790, _2786, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2764 = _2792;
            _2794 = true;
        }
        else
        {
            bool _2796 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2798 = isnan(_2574);
            bool _2800 = _2796 || _2798;
            bool _2802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2804 = _2800 || _2802;
            if (!_2804)
            {
                float _2806 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2808 = _2574 + _2806;
                float _2810 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2812 = _2810 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2814 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2816 = _2814 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2818 = 1.0 / _2812;
                float _2820 = _2808 * _2818;
                float _2822 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2764 = _2822;
                _2794 = true;
            }
            else
            {
                _2764 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2794 = false;
    float _2824 = _2764;
    float _2826 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2828 = _2404 + _2826;
    float _2830 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2832 = _1131 + _2830;
    float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2836 = _1135 + _2834;
    float _2838 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2840 = fma(_2832, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2842 = fma(_2836, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2846 = _2838 + _2844;
    float _2848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2850 = _2840 + _2848;
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2854 = _2842 + _2852;
    float _2856 = _2846 * _2846;
    float _2858 = fma(_2850, _2850, _2856);
    float _2860 = fma(_2854, _2854, _2858);
    float _2862 = rsqrt(_2860);
    float _2864 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2866 = _2850 * _2864;
    float _2868 = _2854 * _2864;
    float _2870 = _2866 * _2866;
    float _2872 = _2868 * _2868;
    float _2874 = _2870 + _2872;
    float _2876 = sqrt(_2874);
    bool _2878 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2876 + _2880;
    float _2884 = _2862;
    float _2886 = _2882;
    float _2888 = _2846;
    float _2890 = _2866;
    if (_2878)
    {
        float _2892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2892;
    }
    float _2894 = _2884;
    if (_2878)
    {
        float _2896 = rsqrt(_2874);
        _2758 = _2896;
    }
    float _2898 = _2758;
    float _2900 = _2898;
    if (_2878)
    {
        float _2902 = _2882 * _2894;
        _2886 = _2902;
    }
    float _2904 = _2886;
    if (_2878)
    {
        float _2906 = _2904 * 0.15915493667125701904296875;
        _2374 = _2906;
    }
    float _2908 = _2374;
    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2912 = _2854;
    float _2914 = _2908;
    if (_2878)
    {
        float _2916 = _2908 * 6.283185482025146484375;
        float _2918 = sin(_2916);
        _2912 = _2918;
    }
    float _2920 = _2912;
    float _2922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2924 = precise::max(0.0, _2922);
    float _2926 = _2894;
    float _2928 = _2924;
    if (_2878)
    {
        float _2930 = _2908 * 6.283185482025146484375;
        float _2932 = cos(_2930);
        _2926 = _2932;
    }
    float _2934 = _2926;
    float _2936 = -_2864;
    float _2938 = -_2924;
    float _2940 = fma(_2846, _2936, _2938);
    if (_2878)
    {
        float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2888 = _2942;
    }
    float _2944 = _2888;
    float _2946 = _2944;
    float _2948 = _2920;
    if (_2878)
    {
        float _2950 = fma(_2920, _2944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2946 = _2950;
    }
    float _2952 = _2946;
    float _2954 = _2952;
    if (!_2878)
    {
        _2948 = _2868;
    }
    float _2956 = _2948;
    float _2958 = _2956;
    float _2960 = _2934;
    if (_2878)
    {
        float _2962 = _2934 + (-1.0);
        _2928 = _2962;
    }
    float _2964 = _2928;
    if (_2878)
    {
        float _2966 = _2898 * _2952;
        _1197 = _2966;
    }
    float _2968 = _1197;
    if (!_2878)
    {
        _2900 = _2940;
    }
    float _2970 = _2900;
    float _2972 = _2970;
    if (_2878)
    {
        float _2974 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2914 = _2974;
    }
    float _2976 = _2914;
    if (_2878)
    {
        float _2978 = _2866 * _2968;
        _2890 = _2978;
    }
    float _2980 = _2890;
    if (!_2878)
    {
        _2954 = _2870;
    }
    float _2982 = _2954;
    float _2984 = sqrt(_2860);
    float _2986 = _2982;
    if (_2878)
    {
        float _2988 = fma(_2940, _2934, _2976);
        _2972 = _2988;
    }
    float _2990 = _2972;
    if (_2878)
    {
        float _2992 = _2868 * _2968;
        _2958 = _2992;
    }
    float _2994 = _2958;
    if (_2878)
    {
        float _2996 = _2980 * _2980;
        _2986 = _2996;
    }
    float _2998 = _2986;
    if (!_2878)
    {
        _2960 = _2872;
    }
    float _3000 = _2960;
    float _3002 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3004 = _3000;
    if (_2878)
    {
        float _3006 = _2994 * _2994;
        _3004 = _3006;
    }
    float _3008 = _3004;
    float _3010 = fma(_2990, _2990, _2998);
    float _3012 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3002);
    float _3014 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = _3010 + _3008;
    float _3018 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3020 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = rsqrt(_3016);
    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3026 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3024);
    float _3028 = precise::clamp(_3026, 0.0, 1.0);
    float _3030 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3012);
    float _3032 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3034 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3036 = -_3028;
    float _3038 = _3036 + 1.0;
    float _3040 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3042 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3032);
    float _3044 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3018);
    float _3046 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3048 = abs(_3038);
    float _3050 = log2(_3048);
    float _3052 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3042);
    float _3054 = _3034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3056 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3044);
    float _3058 = -_3046;
    float _3060 = fma(_3058, _2910, 1.0);
    float _3062 = _3022 * _2980;
    float _3064 = _3052 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3066 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3068 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3070 = _3022 * _2990;
    float _3072 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3074 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3066);
    float _3076 = _3022 * _2994;
    float _3078 = log2(_3060);
    float _3080 = -_3072;
    float _3082 = fma(_3070, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3080);
    float _3084 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3074);
    float _3086 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3088 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3090 = -_3076;
    float _3092 = fma(_3090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3082);
    float _3094 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3084);
    float _3096 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3098 = exp2(_3086);
    float _3100 = fma(_3092, -0.5, 0.5);
    float _3102 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3088);
    float _3104 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3096);
    float _3106 = fma(_3092, 0.5, 0.5);
    float _3108 = _3070 + 1.0;
    float _3110 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3102);
    float _3112 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3104);
    float _3114 = 1.0 / _3094;
    float _3116 = fma(_3106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3118 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3110);
    float _3120 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3112);
    float _3122 = _3078 * 0.693147182464599609375;
    float _3124 = fma(_3106, _3116, -0.212114393711090087890625);
    float _3126 = sqrt(_3100);
    float _3128 = -_3070;
    float _3130 = fma(_3098, _3108, _3128);
    float _3132 = fma(_3106, _3124, 1.570728778839111328125);
    float _3134 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3136 = fma(_3130, 0.5, 0.5);
    float _3138 = _3120 * _3114;
    float _3140 = _3118 * _3114;
    float _3142 = fma(_3138, 0.5, 0.5);
    float _3144 = fma(_3140, -0.5, 0.5);
    float _3146 = _3126 * 0.636619746685028076171875;
    float3 _8245 = float3(_3142, _3144, _3134);
    float _3148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8245, float3(0.0), isnan(_8245)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8245, float3(0.0), isnan(_8245)), level(0.0)).x;
    float3 _8256 = float3(_3142, _3144, _3134);
    float4 _3151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8256, float3(0.0), isnan(_8256)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8256, float3(0.0), isnan(_8256)), level(0.0)).xyzw;
    float _3153 = _3151.x;
    float _3155 = _3151.y;
    float _3157 = _3151.z;
    float _3159 = _3151.w;
    float _3161 = -_3132;
    float _3163 = fma(_3146, _3161, 1.0);
    float2 _8277 = float2(_3163, _3136);
    float3 _3165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8277, float2(0.0), isnan(_8277)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8277, float2(0.0), isnan(_8277)), level(0.0)).xyz;
    float _3167 = _3165.x;
    float _3169 = _3165.y;
    float _3171 = _3165.z;
    float _3173 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3175 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3177 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3179 = -_1155;
    float _3181 = _3179 + 1.0;
    float _3183 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3173);
    float _3185 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3175);
    float _3187 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3177);
    float _3189 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3183);
    float _3191 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3185);
    out.m_84.x = _2840;
    out.m_84.y = _2838;
    out.m_84.z = _2842;
    float _3193 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3195 = _3191 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3197 = 1.0 / _3193;
    float _3199 = _3195 + _3193;
    bool _3201 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3203 = isnan(_2984);
    bool _3205 = _3201 || _3203;
    bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3209 = _3205 || _3207;
    float _3211 = _3199 * _3197;
    float _3213 = _3211 * 0.5;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3217 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3215);
    float _3219 = in.m_86.x;
    float _3221 = 1.0 / _3217;
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3225 = _3221 * _3223;
    float _3227 = abs(_3225);
    float _3229 = log2(_3227);
    bool _3231 = _3225 <= 8000.0;
    bool _3233 = isnan(_3225);
    bool _3235 = _3231 || _3233;
    bool _3237 = isnan(8000.0);
    bool _3239 = _3235 || _3237;
    float _3241 = float(_3239);
    float _3243 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3245 = exp2(_3243);
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3249 = precise::clamp(_3247, 0.0, 1.0);
    float _3251 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3253 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3187);
    float _3255 = fma(_3249, -2.0, 3.0);
    float _3257 = _3249 * _3249;
    float _3259 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3253);
    float _3261 = exp2(_3251);
    float _3263 = _3257 * _3255;
    float _3265 = _3259 + _3094;
    out.gl_Position.x = _3120;
    out.gl_Position.y = _3118;
    out.gl_Position.z = _3259;
    out.gl_Position.w = _3094;
    float _3267 = -_3263;
    float _3269 = _3267 + 1.0;
    float _3271 = fma(_3269, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3263);
    float _3273 = _3241 * _3271;
    float _3275 = -_3261;
    float _3277 = _3275 + 1.0;
    float _3279 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3281 = _3265 * 0.5;
    float _3283 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3285 = _3259;
    float _3287 = _3118;
    float _3289 = _3120;
    float _3291 = _3094;
    float _3293 = _3283;
    float _3295 = _3157;
    if (!_3209)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3297 = _3285;
    float _3299 = _3181 * _3279;
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = _3297;
    float _3305 = _3297;
    if (!_3209)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3307 = _3287;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3209)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3313 = _3289;
    float _3315 = -_3301;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3319 = -_3283;
    float _3321 = _3319 + 1.0;
    float _3323 = _3317 * _3219;
    float _3325 = _3313;
    float _3327 = _3313;
    if (!_3209)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3329 = _3291;
    float _3331 = _3323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.z = _3281;
    out.m_88.w = _3094;
    out.m_90.x = _3331;
    float _3333 = _3283 * _3148;
    float _3335 = _3159 * _3321;
    float _3337 = _3329;
    float _3339 = _3329;
    if (!_3209)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3341 = _3293;
    float _3343 = _3159 * _3333;
    float _3345 = _3171 * _3333;
    float _3347 = fma(_3167, _3343, _3153);
    float _3349 = fma(_3169, _3343, _3155);
    float _3351 = fma(_3159, _3345, _3157);
    float _3353 = _3341;
    float _3355 = _3341;
    if (!_3209)
    {
        _3295 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3357 = _3295;
    out.m_92.x = _3347;
    out.m_92.y = _3349;
    out.m_92.z = _3351;
    out.m_92.w = _3335;
    bool _3359 = !_3209;
    float _3361 = _3357;
    float _3363 = _3357;
    if (!_3359)
    {
        bool _3365 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3367 = isnan(_2984);
        bool _3369 = _3365 || _3367;
        bool _3371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3373 = _3369 || _3371;
        if (!_3373)
        {
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3377 = _2984 + _3375;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3379;
            float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3387 = 1.0 / _3381;
            float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3391 = _3389 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3399 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3405 = _3377 * _3387;
            float _3407 = precise::clamp(_3405, 0.0, 1.0);
            float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3413 = fma(_3407, _3385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3415 = fma(_3407, _3411, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3417 = fma(_3407, _3391, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3419 = fma(_3407, _3395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3421 = fma(_3407, _3399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3423 = fma(_3407, _3403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3363 = _3417;
            _3311 = _3421;
            _3355 = _3413;
            _3305 = _3419;
            _3339 = _3415;
            _3327 = _3423;
            _3425 = true;
        }
        else
        {
            bool _3427 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3429 = isnan(_2984);
            bool _3431 = _3427 || _3429;
            bool _3433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3435 = _3431 || _3433;
            if (!_3435)
            {
                _3353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3437 = _3353;
            _3355 = _3437;
            if (!_3435)
            {
                _3361 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3439 = _3361;
            _3363 = _3439;
            if (!_3435)
            {
                _3337 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3441 = _3337;
            _3339 = _3441;
            if (!_3435)
            {
                _3303 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3443 = _3303;
            _3305 = _3443;
            if (!_3435)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3445 = _3309;
            _3311 = _3445;
            if (!_3435)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3447 = _3325;
            bool _3449 = !_3435;
            _3327 = _3447;
            if (!_3449)
            {
                bool _3451 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3453 = isnan(_2984);
                bool _3455 = _3451 || _3453;
                bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3459 = _3455 || _3457;
                if (!_3459)
                {
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3463 = _2984 + _3461;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3465;
                    float _3469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3473 = 1.0 / _3467;
                    float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3491 = _3463 * _3473;
                    float _3493 = precise::clamp(_3491, 0.0, 1.0);
                    float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3499 = fma(_3493, _3471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3501 = fma(_3493, _3497, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3503 = fma(_3493, _3477, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3505 = fma(_3493, _3481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3507 = fma(_3493, _3485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3509 = fma(_3493, _3489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3363 = _3503;
                    _3311 = _3507;
                    _3355 = _3499;
                    _3305 = _3505;
                    _3339 = _3501;
                    _3327 = _3509;
                    _3425 = true;
                }
                else
                {
                    _3363 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3305 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3339 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3425 = false;
    float _3511 = _3363;
    float _3513 = _3311;
    float _3515 = _3355;
    float _3517 = _3305;
    float _3519 = _3339;
    float _3521 = _3327;
    float _3523 = fma(_2752, -0.5, 0.5);
    float _3525 = precise::clamp(_3523, 0.0, 1.0);
    float _3527 = -_3511;
    float _3529 = _3527 + _3513;
    float _3531 = -_3515;
    float _3533 = _3531 + _3517;
    float _3535 = -_3519;
    float _3537 = _3535 + _3521;
    bool _3539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3541 = fma(_3525, _3529, _3511);
    float _3543 = fma(_3525, _3533, _3515);
    float _3545 = fma(_3525, _3537, _3519);
    float _3547 = _3541 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _3549 = fma(_3543, 0.298911988735198974609375, _3547);
    float _3551 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3553 = fma(_3545, 0.114477999508380889892578125, _3549);
    out.m_53.x = _3551;
    float _3555 = -_3553;
    float _3557 = _3543 + _3555;
    float _3559 = -_3553;
    float _3561 = _3541 + _3559;
    float _3563 = -_3553;
    float _3565 = _3545 + _3563;
    float _3567 = fma(_3557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    float _3569 = fma(_3561, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    float _3571 = fma(_3565, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    out.m_96.x = _3567;
    out.m_96.y = _3569;
    out.m_96.z = _3571;
    if (!_3539)
    {
        return out;
    }
    float _3573 = -_2838;
    float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3577 = -_2840;
    float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3581 = -_2842;
    float _3583 = _3581 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3585 = _3575 * _3575;
    float _3587 = fma(_3579, _3579, _3585);
    float _3589 = fma(_3583, _3583, _3587);
    float _3591 = sqrt(_3589);
    float _3593 = rsqrt(_3589);
    float _3595 = -_3591;
    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3599 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = _3579 * _3593;
    float _3605 = _3575 * _3593;
    float _3607 = abs(_3601);
    float _3609 = log2(_3607);
    float _3611 = _3583 * _3593;
    float _3613 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3615 = _2752 * _3605;
    float _3617 = -_3605;
    float _3619 = -_3613;
    float _3621 = fma(_3617, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3619);
    float _3623 = fma(_2738, _3603, _3615);
    float _3625 = -_3611;
    float _3627 = fma(_3625, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3621);
    float _3629 = fma(_2754, _3611, _3623);
    float _3631 = precise::clamp(_3629, 0.0, 1.0);
    float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3635 = _3627 + _3633;
    float _3637 = _3609 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3639 = _3635 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3641 = precise::clamp(_3639, 0.0, 1.0);
    float _3643 = exp2(_3637);
    float _3645 = _3643 * _3641;
    float _3647 = _3631 * _3645;
    float _3649 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3651 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3653 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3649;
    out.m_94.y = _3651;
    out.m_94.z = _3653;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3425 = false;
    bool _2794 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_50.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_131);
        out.gl_Position.z = _3710;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_55.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3779 = as_type<float>(_169);
        out.gl_Position.z = _3779;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_60.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    float _225 = in.m_60.z;
    float _227 = in.m_60.w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    float _245 = 1.0 / _235;
    int _247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _249 = _247 != 0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _257 = 1.0 / _239;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = _219 + _259;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _273 = _221 * 2.0;
    float _275 = _223 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _277 = 1.0 / _243;
    float _279 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _281 = _261 * _245;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _219 + _283;
    float _287 = fma(_275, -2.0, _263);
    float _289 = fma(_267, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = floor(_273);
    float _293 = -_255;
    float _295 = fma(_279, 2.0, _293);
    float _297 = _223 * 2.0;
    float _299 = _285 * _257;
    float _301 = _221 + _223;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = _219 + _303;
    float _307 = fma(_271, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = floor(_297);
    float _311 = _301 + (-1.0);
    float _313 = _225 + _223;
    float _315 = _305 * _277;
    float _317 = _225 + _221;
    float _319 = _313 + (-1.0);
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _323 = 1.0 / _253;
    bool _325 = _291 >= 0.0;
    bool _327 = isnan(_291);
    bool _329 = _325 || _327;
    bool _331 = isnan(0.0);
    bool _333 = _329 || _331;
    float _335 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _337 = as_type<int>(_319);
    if (_249)
    {
        _337 = 0;
    }
    int _339 = _337;
    float _341 = _317 + (-1.0);
    int _343 = _339;
    float _345 = _341;
    if (!_249)
    {
        _343 = 1;
    }
    int _347 = _343;
    float _349 = -_149;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[76].x, _295);
    int _353 = _333 ? 0 : 1;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _357 = _225 * 2.0;
    bool _359 = _309 > 0.0;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    bool _365 = _309 >= 0.0;
    bool _367 = isnan(_309);
    bool _369 = _365 || _367;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = _347 != 1;
    bool _377 = _291 > 0.0;
    float _379 = _231 * _323;
    int _381 = _373 ? 0 : 1;
    float _383 = floor(_357);
    int _385 = ~_381;
    int _387 = _385 + 1;
    int _389 = _387 + 1;
    int _391 = _389;
    float _393 = as_type<float>(_363);
    if (!_359)
    {
        int _395 = ~_381;
        int _397 = _395 + 1;
        _391 = _397;
    }
    int _399 = _391;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _411 = log2(_409);
    float _413 = fma(_403, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _415 = fma(_407, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _417 = ~_353;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    int _423 = _421;
    if (!_377)
    {
        int _425 = ~_353;
        int _427 = _425 + 1;
        _423 = _427;
    }
    int _429 = _423;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    bool _435 = _383 > 0.0;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _439 = int(_437);
    bool _441 = _383 >= 0.0;
    bool _443 = isnan(_383);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    float _451 = fma(_433, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _453 = _449 ? 0 : 1;
    if (!_375)
    {
        _345 = _223;
    }
    float _455 = _345;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    int _461 = ~_453;
    int _463 = _461 + 1;
    int _465 = _463 + 1;
    float _467 = _455;
    int _469 = _465;
    if (_375)
    {
        _467 = _221;
    }
    float _471 = _467;
    float _473 = fma(_459, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = _471;
    if (!_435)
    {
        int _477 = ~_453;
        int _479 = _477 + 1;
        _469 = _479;
    }
    int _481 = _469;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _493 = _491 != 0;
    float _495 = float(_481);
    float _497 = _411 * _149;
    float _499 = float(_115);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _503 = !_489;
    int _505 = _503 ? 0 : 1;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    float _511 = exp2(_497);
    bool _513 = !_493;
    int _515 = _513 ? 0 : 1;
    float _517 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[83].z, _501);
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    float _531 = float(_363);
    float _533 = float(_439);
    float _535 = 1.0 / _499;
    if (!_375)
    {
        _393 = _223;
    }
    float _537 = _393;
    float _539 = _537;
    if (_375)
    {
        _539 = _221;
    }
    float _541 = _539;
    bool _543 = !_521;
    float _545 = _543 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _547 = 1.0 / _533;
    float _549 = _545;
    if (!_375)
    {
        _475 = _225;
    }
    float _551 = _475;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _555 = _551;
    if (_375)
    {
        _555 = _223;
    }
    float _557 = _555;
    float _559 = _541 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _561 = -_511;
    float _563 = _561 + 1.0;
    float _565 = 1.0 / _531;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _569 = 1.0 + _567;
    int _571 = abs(as_type<int>(_545));
    float _573 = _557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_375)
    {
        _549 = _225;
    }
    float _575 = _549;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _579 = _575;
    if (_375)
    {
        _579 = _223;
    }
    float _581 = _579;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _585 = 1.0 / _569;
    float _587 = -_553;
    float _589 = fma(_559, 2.0, _587);
    float _591 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[83].w, _583);
    float _593 = fma(_573, -2.0, _577);
    bool _595 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _597 = isnan(1.0);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _603 = _599 || _601;
    float _605 = in.m_62.x;
    float _607 = in.m_62.y;
    float _609 = in.m_62.z;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _613 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _615 = isnan(0.0);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _621 = _617 || _619;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _625 = float(_571);
    float _627 = _535 * _149;
    float _629 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].z, _611);
    float _631 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[78].w, _623);
    float _633 = _621 ? _563 : 0.0;
    float _635 = _625 * _495;
    bool _637 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _639 = isnan(_219);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _517);
    float _651 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _287);
    float _653 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _591);
    float _655 = _565 * _149;
    float _657 = _547 * _149;
    float _659 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _661 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _631);
    float _663 = -_149;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[81].x, _589);
    float _667 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _593);
    bool _669 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _671 = isnan(_219);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _655;
    if (_603)
    {
        float _683 = _633 * _585;
        _153 = _683;
    }
    float _685 = _153;
    float _687 = _635 * (-2.0);
    bool _689 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_219);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_647;
    float _703 = _701 + 1.0;
    float _705 = -_679;
    float _707 = _705 + 1.0;
    float _709 = fma(_321, _687, _321);
    bool _711 = !_525;
    int _713 = _711 ? 0 : 1;
    float _715 = _699 * _703;
    float _717 = -_699;
    float _719 = _717 + 1.0;
    bool _721 = !_529;
    int _723 = _721 ? 0 : 1;
    float _725 = _647 * _707;
    int _727 = abs(_713);
    float _729 = fma(_687, _605, _605);
    bool _731 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _733 = isnan(_219);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    int _743 = abs(_723);
    bool _745 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _747 = isnan(_219);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = _741 * _719;
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = _221 + (-0.5);
    float _765 = float(_429);
    float _767 = float(_727);
    float _769 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[196].x, _729);
    float _771 = _755 * _761;
    float _773 = float(_399);
    float _775 = -_755;
    float _777 = _775 + 1.0;
    float _779 = _767 * _765;
    float _781 = float(_743);
    float _783 = fma(_709, _685, _769);
    float _785 = _413 * _771;
    float _787 = _779 * (-2.0);
    float _789 = _289 * _771;
    float _791 = _781 * _773;
    float _793 = _783 * 0.15915493667125701904296875;
    float _795 = fma(_787, _607, _607);
    float _797 = _223 + (-0.5);
    float _799 = fma(_335, _787, _335);
    float _801 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[143].y, _785);
    float _803 = _791 * (-2.0);
    float _805 = in.m_64.x;
    float _807 = in.m_64.y;
    float _809 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _795);
    float _811 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[143].x, _789);
    float _813 = fma(_355, _803, _355);
    float _815 = fma(_803, _609, _609);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _825 = fma(_415, _757, _801);
    float _827 = _225 + (-0.5);
    float _829 = fma(_307, _757, _811);
    float _831 = fma(_819, _379, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _833 = fma(_823, _379, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _835 = fma(_451, _715, _825);
    float _837 = fma(_799, _685, _809);
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _815);
    float _841 = fma(_473, _715, _829);
    float _843 = in.m_50.x;
    float _845 = in.m_50.y;
    float _847 = in.m_50.z;
    float _849 = fma(_833, _725, _835);
    float _851 = fma(_813, _685, _839);
    float _853 = fma(_831, _725, _841);
    float _855 = in.m_66.x;
    float _857 = in.m_66.y;
    float _859 = in.m_66.z;
    float _861 = in.m_66.w;
    float _863 = _837 * 0.15915493667125701904296875;
    float _865 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[147].y, _849);
    float _867 = _851 * 0.15915493667125701904296875;
    float _869 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[147].x, _853);
    float _871 = _793 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _865 * _807;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _879 = _869 * _805;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _883 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _885 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _887 = _863 * 6.283185482025146484375;
    float _889 = sin(_887);
    float _891 = in.m_68.x;
    float _893 = in.m_68.y;
    float _895 = in.m_68.z;
    float _897 = in.m_68.w;
    float _899 = _883 * _877;
    float _901 = _885 * _881;
    float _903 = _863 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _845 * _857;
    float _909 = fma(_843, _855, _907);
    float _911 = _793 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = _873 * _889;
    float _917 = fma(_847, _859, _909);
    float _919 = _867 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _873 * _905;
    float _925 = _867 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _913 * _889;
    float _931 = _913 * _905;
    float _933 = _873 * _921;
    float _935 = _913 * _921;
    float _937 = _905 * _921;
    float _939 = _889 * _921;
    float _941 = _933 * _899;
    float _943 = fma(_927, _923, _929);
    float _945 = -_915;
    float _947 = fma(_927, _931, _945);
    float _949 = -_931;
    float _951 = fma(_927, _915, _949);
    float _953 = -_899;
    float _955 = _927 * _953;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = fma(_943, _901, _941);
    float _961 = _935 * _899;
    float _963 = fma(_937, _901, _955);
    float _965 = fma(_927, _929, _923);
    float _967 = fma(_951, _957, _959);
    float _969 = _845 * _893;
    float _971 = fma(_947, _901, _961);
    float _973 = fma(_939, _957, _963);
    float _975 = _967 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _977 = _967 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _979 = fma(_843, _891, _969);
    float _981 = fma(_965, _957, _971);
    float _983 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[24].x, _975);
    float _985 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _977);
    float _987 = fma(_847, _895, _979);
    float _989 = _917 + _861;
    float _991 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].z, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].z, _985);
    float _995 = _987 + _897;
    float _997 = _967 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1001 = _993 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1003 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[25].x, _997);
    float _1005 = _989 + _999;
    float _1007 = _995 + _1001;
    float _1009 = in.m_70.x;
    float _1011 = in.m_70.y;
    float _1013 = in.m_70.z;
    float _1015 = in.m_70.w;
    float _1017 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1003);
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _1005 + _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1025 = _1007 + _1023;
    float _1027 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1029 = _1021 * _1021;
    float _1031 = _1025 * _1025;
    float _1033 = _1029 + _1031;
    float _1035 = sqrt(_1033);
    float _1037 = _845 * _1011;
    float _1039 = fma(_843, _1009, _1037);
    bool _1041 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = _1035 + _1043;
    float _1047 = fma(_847, _1013, _1039);
    float _1049 = _1047 + _1015;
    float _1051 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1053 = fma(_995, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1055 = 0.0;
    float _1057 = _1033;
    float _1059 = _1045;
    float _1061 = _845;
    float _1063 = _1005;
    float _1065 = _1007;
    float _1067 = _1027;
    float _1069 = _1029;
    float _1071 = _1031;
    if (_1041)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1055 = _1073;
    }
    float _1075 = _1055;
    if (_1041)
    {
        float _1077 = rsqrt(_1033);
        _1057 = _1077;
    }
    float _1079 = _1057;
    if (_1041)
    {
        float _1081 = _1045 * _1075;
        _1059 = _1081;
    }
    float _1083 = _1059;
    float _1085 = _1049 + _1027;
    float _1087 = floor(_1051);
    float _1089 = _1083;
    float _1091 = _1085;
    if (_1041)
    {
        float _1093 = _1083 * 0.15915493667125701904296875;
        _1089 = _1093;
    }
    float _1095 = _1089;
    float _1097 = _1095;
    if (_1041)
    {
        float _1099 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1061 = _1099;
    }
    float _1101 = _1061;
    float _1103 = _843;
    float _1105 = _1101;
    if (_1041)
    {
        float _1107 = _1095 * 6.283185482025146484375;
        float _1109 = sin(_1107);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = floor(_1053);
    if (_1041)
    {
        float _1115 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1105 = _1115;
    }
    float _1117 = _1105;
    float _1119 = _1117;
    if (_1041)
    {
        float _1121 = _1079 * _1117;
        _1119 = _1121;
    }
    float _1123 = _1119;
    float _1125 = -_1087;
    float _1127 = _1051 + _1125;
    if (_1041)
    {
        float _1129 = fma(_1021, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1063 = _1129;
    }
    float _1131 = _1063;
    if (_1041)
    {
        float _1133 = fma(_1025, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1065 = _1133;
    }
    float _1135 = _1065;
    float _1137 = -_1113;
    float _1139 = _1053 + _1137;
    float _1141 = fma(_1131, 6.2500002968590706586837768554688e-05, 0.5);
    float _1143 = fma(_1135, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5274 = float2(_1141, _1143);
    float3 _1147 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5274, float2(0.0), isnan(_5274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5274, float2(0.0), isnan(_5274)), level(0.0)).xyz;
    float _1149 = _1147.x;
    float _1151 = _1147.y;
    float _1153 = _1147.z;
    float2 _5290 = float2(_1127, _1139);
    float _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5290, float2(0.0), isnan(_5290)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5290, float2(0.0), isnan(_5290)), level(0.0)).x;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1159 = int(_1157);
    if (_249)
    {
        float _1161 = in.m_60.x;
        _1067 = _1161;
    }
    float _1163 = _1067;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1167 = _1165 != 0;
    float _1169 = -_659;
    float _1171 = _1169 + 1.0;
    int _1173 = abs(_505);
    float _1175 = _1163;
    if (!_249)
    {
        float _1177 = in.m_60.y;
        _1175 = _1177;
    }
    float _1179 = _1175;
    int _1181 = abs(_515);
    float _1183 = -_661;
    float _1185 = _1183 + 1.0;
    float _1187 = trunc(_655);
    int _1189 = int(_1187);
    float _1191 = float(uint(_1159));
    float _1193 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1195 = int(_1193);
    float _1197 = _1185;
    if (_249)
    {
        _681 = 1.0;
    }
    float _1199 = _681;
    float _1201 = _1199;
    if (!_249)
    {
        _1201 = 1.2345600128173828125;
    }
    float _1203 = _1201;
    float _1205 = float(uint(_1189));
    float _1207 = 1.0 / _1191;
    float _1209 = _1203 * _1179;
    int _1211 = ~_1159;
    int _1213 = _1211 + 1;
    float _1215 = float(uint(_1195));
    float _1217 = trunc(_657);
    int _1219 = int(_1217);
    int _1221 = ~_1159;
    int _1223 = _1221 + 1;
    int _1225 = as_type<int>(_1207) + (-2);
    float _1227 = 1.0 / _1215;
    float _1229 = as_type<float>(_1225) * _1205;
    float _1231 = float(uint(_1219));
    float _1233 = floor(_1209);
    float _1235 = float(_1219);
    float _1237 = trunc(_1229);
    float _1239 = precise::max(_1237, 0.0);
    uint _1242 = uint(_1239);
    float _1244 = -_1233;
    float _1246 = _1209 + _1244;
    float _1248 = _1227;
    if (_1041)
    {
        float _1250 = _1095 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        _1097 = _1252;
    }
    float _1254 = _1097;
    int _1256 = _1223 * int(_1242);
    int _1258 = _1256 + _1189;
    float _1260 = float(uint(_1258));
    float _1262 = as_type<float>(_1225) * _1260;
    int _1264 = as_type<int>(_1227) + (-2);
    if (_249)
    {
        _1248 = 1.0;
    }
    float _1266 = _1248;
    float _1268 = _1266;
    if (!_249)
    {
        _1268 = 7.345489978790283203125;
    }
    float _1270 = _1268;
    float _1272 = trunc(_1262);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    float _1278 = as_type<float>(_1264) * _1231;
    int _1280 = ~_1195;
    int _1282 = _1280 + 1;
    float _1284 = _1270 * _221;
    float _1286 = trunc(_1278);
    float _1288 = precise::max(_1286, 0.0);
    uint _1290 = uint(_1288);
    int _1292 = int(_1242) + int(_1276);
    float _1294 = floor(_1284);
    float _1296 = float(_1159);
    int _1298 = _1213 * _1292;
    int _1300 = _1298 + _1189;
    float _1302 = float(_1189);
    int _1304 = _1282 * int(_1290);
    int _1306 = _1304 + _1219;
    bool _1308 = _1302 >= _1296;
    bool _1310 = isnan(_1302);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1296);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    bool _1320 = uint(_1300) >= uint(_1159);
    float _1322 = float(uint(_1306));
    float _1324 = trunc(_1318);
    int _1326 = int(_1324);
    bool _1328 = !_1320;
    int _1330 = _1328 ? 0 : (-1);
    float _1332 = -_1294;
    float _1334 = _1284 + _1332;
    float _1336 = as_type<float>(_1264) * _1322;
    int _1338 = ~_1292;
    int _1340 = _1338 + _1330;
    int _1342 = _1340 + 1;
    float _1344 = _1334 * _1296;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1348 = _1346 != 0;
    float _1350 = trunc(_1336);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    int _1356 = _1159 * _1342;
    int _1358 = _1356 + _1189;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1374 = _1372 != 0;
    float _1376 = _1296 * _627;
    bool _1378 = !_1348;
    int _1380 = _1378 ? 0 : 1;
    bool _1382 = _1159 == 0;
    float _1384 = trunc(_1344);
    int _1386 = int(_1384);
    int _1388 = ~_1326;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    bool _1394 = !_1382;
    int _1396 = _1394 ? _1358 : (-1);
    int _1398 = _1159 + (-1);
    int _1400 = abs(_1380);
    int _1402 = _1396 * _1392;
    int _1404 = int(_1290) + int(_1354);
    float _1406 = trunc(_1376);
    int _1408 = int(_1406);
    int _1410 = ~_1195;
    int _1412 = _1410 + 1;
    int _1414 = _1326 * _1398;
    int _1416 = _1414 + _1402;
    float _1418 = float(_1195);
    int _1420 = _1412 * _1404;
    int _1422 = _1420 + _1219;
    bool _1424 = _1235 >= _1418;
    bool _1426 = isnan(_1235);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(_1418);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = _1246 * _1418;
    bool _1438 = !_1167;
    int _1440 = _1438 ? 0 : 1;
    int _1442 = _1416 * _1173;
    bool _1444 = uint(_1422) >= uint(_1195);
    float _1446 = trunc(_1434);
    int _1448 = int(_1446);
    int _1450 = abs(_509);
    float _1452 = _1418 * _627;
    bool _1454 = !_1444;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = _1408 * _1450;
    int _1460 = _1458 + _1442;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1464 = _1462 != 0;
    float _1466 = trunc(_1436);
    int _1468 = int(_1466);
    int _1470 = ~_1404;
    int _1472 = _1470 + _1456;
    int _1474 = _1472 + 1;
    int _1476 = _1386 * _1400;
    int _1478 = _1476 + _1189;
    bool _1480 = !_1464;
    int _1482 = _1480 ? 0 : 1;
    bool _1484 = _1195 == 0;
    int _1486 = _1195 * _1474;
    int _1488 = _1486 + _1219;
    int _1490 = abs(_1482);
    float _1492 = trunc(_1452);
    int _1494 = int(_1492);
    int _1496 = abs(_1440);
    int _1498 = ~_1448;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1478 * _1181;
    int _1506 = _1504 + _1460;
    bool _1508 = !_1484;
    int _1510 = _1508 ? _1488 : (-1);
    int _1512 = _1468 * _1490;
    int _1514 = _1512 + _1219;
    int _1516 = _1195 + (-1);
    int _1518 = _1386 * _1496;
    int _1520 = _1518 + _1506;
    int _1522 = ~_1159;
    int _1524 = _1522 + 1;
    int _1526 = _1510 * _1502;
    bool _1528 = !_1366;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = float(uint(_1520));
    int _1534 = _1448 * _1516;
    int _1536 = _1534 + _1526;
    bool _1538 = !_1362;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = abs(_1530);
    float _1544 = as_type<float>(_1225) * _1532;
    bool _1546 = !_1370;
    int _1548 = _1546 ? 0 : 1;
    int _1550 = abs(_1540);
    bool _1552 = !_1374;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = trunc(_1544);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    int _1562 = abs(_1548);
    int _1564 = _1536 * _1542;
    int _1566 = abs(_1554);
    int _1568 = _1494 * _1550;
    int _1570 = _1568 + _1564;
    float _1572 = float(uint(_1514));
    int _1574 = ~_1159;
    int _1576 = _1574 + 1;
    int _1578 = _1514 * _1562;
    int _1580 = _1578 + _1570;
    int _1582 = ~_1159;
    int _1584 = _1582 + 1;
    int _1586 = ~_1195;
    int _1588 = _1586 + 1;
    int _1590 = _1468 * _1566;
    int _1592 = _1590 + _1580;
    float _1594 = float(uint(_1478));
    int _1596 = _1584 * int(_1560);
    int _1598 = _1596 + _1520;
    int _1600 = ~_1195;
    int _1602 = _1600 + 1;
    float _1604 = float(uint(_1592));
    float _1606 = as_type<float>(_1225) * _1594;
    float _1608 = float(uint(_1598));
    float _1610 = as_type<float>(_1264) * _1604;
    float _1612 = as_type<float>(_1225) * _1608;
    float _1614 = trunc(_1606);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    float _1620 = as_type<float>(_1264) * _1572;
    float _1622 = trunc(_1610);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    float _1628 = trunc(_1612);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    int _1634 = _1602 * int(_1626);
    int _1636 = _1634 + _1592;
    float _1638 = trunc(_1620);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    float _1644 = float(uint(_1636));
    int _1646 = _1524 * int(_1618);
    int _1648 = _1646 + _1478;
    int _1650 = int(_1560) + int(_1632);
    float _1652 = as_type<float>(_1264) * _1644;
    float _1654 = float(uint(_1648));
    int _1656 = _1576 * _1650;
    int _1658 = _1656 + _1520;
    float _1660 = trunc(_1652);
    float _1662 = precise::max(_1660, 0.0);
    uint _1664 = uint(_1662);
    float _1666 = as_type<float>(_1225) * _1654;
    bool _1668 = uint(_1658) >= uint(_1159);
    int _1670 = _1588 * int(_1642);
    int _1672 = _1670 + _1514;
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    float _1678 = float(uint(_1672));
    int _1680 = ~_1650;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    float _1686 = trunc(_1666);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = ~_1195;
    int _1694 = _1692 + 1;
    float _1696 = as_type<float>(_1264) * _1678;
    int _1698 = _1159 * _1684;
    int _1700 = _1698 + _1520;
    int _1702 = int(_1626) + int(_1664);
    float _1704 = trunc(_1696);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = ~_1159;
    int _1712 = _1710 + 1;
    int _1714 = _1694 * _1702;
    int _1716 = _1714 + _1592;
    bool _1718 = !_1382;
    int _1720 = _1718 ? _1700 : (-1);
    out.m_72.x = _1149;
    out.m_72.y = _1151;
    out.m_72.z = _1153;
    int _1722 = int(_1618) + int(_1690);
    int _1724 = _1720 & 3;
    bool _1726 = _1724 != 0;
    int _1728 = _1720 & 3;
    bool _1730 = _1728 != 0;
    bool _1732 = uint(_1716) >= uint(_1195);
    int _1734 = _1726 ? 0 : 1;
    bool _1736 = uint(_1728) > 1u;
    bool _1738 = uint(_1728) >= 2u;
    bool _1740 = !_1732;
    int _1742 = _1740 ? 0 : (-1);
    int _1744 = _1738 ? 0 : 1;
    bool _1746 = _1728 != 3;
    bool _1748 = _227 > 0.5;
    int _1750 = _1712 * _1722;
    int _1752 = _1750 + _1478;
    int _1754 = ~_1195;
    int _1756 = _1754 + 1;
    int _1758 = int(_1642) + int(_1708);
    int _1760 = ~_1734;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    int _1766 = ~_1702;
    int _1768 = _1766 + _1742;
    int _1770 = _1768 + 1;
    int _1772 = _1756 * _1758;
    int _1774 = _1772 + _1514;
    int _1776 = _1764;
    if (!_1736)
    {
        int _1778 = ~_1734;
        int _1780 = _1778 + 1;
        _1776 = _1780;
    }
    int _1782 = _1776;
    bool _1784 = uint(_1752) >= uint(_1159);
    int _1786 = _1195 * _1770;
    int _1788 = _1786 + _1592;
    int _1790 = ~_1744;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    bool _1796 = !_1784;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = _1794;
    if (_1746)
    {
        int _1802 = ~_1744;
        int _1804 = _1802 + 1;
        _1800 = _1804;
    }
    int _1806 = _1800;
    bool _1808 = uint(_1774) >= uint(_1195);
    int _1810 = ~_1722;
    int _1812 = _1810 + _1798;
    int _1814 = _1812 + 1;
    float _1816 = -_189;
    int _1818 = _1748 ? as_type<int>(_1816) : as_type<int>(_189);
    bool _1820 = !_1484;
    int _1822 = _1820 ? _1788 : (-1);
    int _1824 = _1159 * _1814;
    int _1826 = _1824 + _1478;
    int _1828 = _1720 >> 31;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1808;
    int _1836 = _1834 ? 0 : (-1);
    int _1838 = _1822 >> 31;
    int _1840 = _1828 & 3;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1844 = _1842 != 0;
    bool _1846 = !_1832;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1822 & 3;
    bool _1852 = _1850 != 0;
    int _1854 = ~_1758;
    int _1856 = _1854 + _1836;
    int _1858 = _1856 + 1;
    int _1860 = _1838 & 3;
    int _1862 = _1720 + _1840;
    int _1864 = _1195 * _1858;
    int _1866 = _1864 + _1514;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : 1;
    float _1872 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1874 = int(_1872);
    bool _1876 = uint(_1850) > 1u;
    int _1878 = _1822 + _1860;
    int _1880 = _1862 >> 2;
    int _1882 = _1822 & 3;
    bool _1884 = _1882 != 0;
    int _1886 = _1878 >> 2;
    int _1888 = _1880 << 4;
    int _1890 = _1888 + 368;
    int _1892 = _1884 ? 0 : 1;
    bool _1894 = _1728 != 3;
    int _1896 = _1886 << 4;
    int _1898 = _1896 + 512;
    uint _1900 = uint(int(uint(_1890) >> uint(2)));
    uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
    int _1904 = int(_1900) & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    int _1908 = int(_1900) + 1;
    uint _1910 = uint(int(uint(_1908) >> uint(2)));
    int _1912 = _1908 & 3;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[int(_1910)][_1912];
    int _1916 = ~_1892;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (!_1876)
    {
        int _1924 = ~_1892;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    bool _1930 = !_1730;
    int _1932 = _1930 ? 0 : 1;
    bool _1934 = _1850 != 3;
    uint _1936 = uint(int(uint(_1898) >> uint(2)));
    uint _1938 = uint(int(uint(int(_1936)) >> uint(2)));
    int _1940 = int(_1936) & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    int _1944 = int(_1936) + 1;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    int _1948 = _1944 & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    bool _1952 = uint(_1850) >= 2u;
    bool _1954 = !_1382;
    int _1956 = _1954 ? _1826 : (-1);
    int _1958 = _1952 ? 0 : 1;
    bool _1960 = _1850 != 3;
    bool _1962 = !_1852;
    int _1964 = _1962 ? 0 : 1;
    bool _1966 = !_1894;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = ~_1958;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1982 = _1980 != 0;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    int _1988 = _1974;
    if (_1934)
    {
        int _1990 = ~_1958;
        int _1992 = _1990 + 1;
        _1988 = _1992;
    }
    int _1994 = _1988;
    int _1996 = _1890 + 8;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
    int _2002 = int(_1998) & 3;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[int(_2000)][_2002];
    int _2006 = int(_1998) + 1;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    int _2010 = _2006 & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    int _2014 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2016 = _2014 != 0;
    int _2018 = abs(_1782);
    int _2020 = abs(_1928);
    bool _2022 = !_1960;
    int _2024 = _2022 ? 0 : (-1);
    int _2026 = _1898 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    bool _2044 = _221 > 0.5;
    int _2046 = abs(_1932);
    int _2048 = ~_2018;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    bool _2054 = !_1484;
    int _2056 = _2054 ? _1866 : (-1);
    float _2058 = -_185;
    int _2060 = _2044 ? as_type<int>(_2058) : as_type<int>(_185);
    int _2062 = _2052 * as_type<int>(_1914);
    bool _2064 = _223 > 0.5;
    bool _2066 = _225 > 0.5;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2070 = abs(_1964);
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2074 = ~_2020;
    int _2076 = _2074 + 1;
    int _2078 = _2076 + 1;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2082 = ~_2046;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    float _2088 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2090 = _2078 * as_type<int>(_1950);
    int _2092 = ~_2070;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    int _2098 = _2086 * as_type<int>(_1906);
    int _2100 = _2098 + _2062;
    int _2102 = abs(_1806);
    float _2104 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2106 = int(_2104);
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2110 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2114 = _2096 * as_type<int>(_1942);
    int _2116 = _2114 + _2090;
    float _2118 = as_type<float>(_2070);
    if (_1041)
    {
        float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2122 = _1131 + _2120;
        _2118 = _2122;
    }
    float _2124 = _2118;
    int _2126 = abs(_1968);
    out.m_74.x = _2088;
    out.m_74.y = _2110;
    out.m_74.z = _2112;
    out.m_74.w = _2108;
    int _2128 = abs(_1994);
    float _2130 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2132 = abs(_2024);
    if (_1041)
    {
        float _2134 = _2124 * _2124;
        _1069 = _2134;
    }
    float _2136 = _1069;
    int _2138 = ~_2102;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    float _2144 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    bool _2146 = !_1978;
    float _2148 = _2146 ? _189 : as_type<float>(_1818);
    bool _2150 = !_2016;
    float _2152 = _2150 ? _185 : as_type<float>(_2060);
    int _2154 = _2142 * as_type<int>(_2004);
    int _2156 = _2154 + _2100;
    int _2158 = ~_2128;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2166 = float(uint(_1874));
    int _2168 = _2162 * as_type<int>(_2034);
    int _2170 = _2168 + _2116;
    int _2172 = ~_2126;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    float _2178 = -_927;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2164);
    int _2182 = ~_2132;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    float _2188 = 1.0 / _2166;
    int _2190 = abs(_1848);
    int _2192 = _2176 * as_type<int>(_2012);
    int _2194 = _2192 + _2156;
    float _2196 = float(uint(_2106));
    float _2198 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2200 = ~_2190;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    float _2206 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2208 = _2186 * as_type<int>(_2042);
    int _2210 = _2208 + _2170;
    int _2212 = abs(_1874);
    float _2214 = 1.0 / _2196;
    int _2216 = abs(_1870);
    float _2218 = -_927;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    float _2222 = -_927;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    int _2226 = _2194 * _2204;
    int _2228 = abs(_2106);
    float _2230 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    float _2232 = float(uint(_2212));
    int _2234 = _1956 * _2190;
    int _2236 = _2234 + _2226;
    int _2238 = ~_2216;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    float _2244 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2246 = float(uint(_2228));
    float _2248 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2250 = 1.0 / _2232;
    int _2252 = _2210 * _2242;
    float _2254 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2180);
    int _2256 = as_type<int>(_2188) + (-2);
    float _2258 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2244);
    float _2260 = float(uint(_2236));
    int _2262 = _2056 * _2216;
    int _2264 = _2262 + _2252;
    int _2266 = as_type<int>(_2214) + (-2);
    float _2268 = 1.0 / _2246;
    float _2270 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = as_type<float>(_2256) * _2260;
    int _2274 = abs(_2236);
    float _2276 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2278 = ~_1874;
    int _2280 = _2278 + 1;
    float _2282 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2284 = float(uint(_2264));
    float _2286 = trunc(_2272);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    float _2292 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2294 = as_type<float>(_2266) * _2284;
    int _2296 = as_type<int>(_2250) + (-2);
    float _2298 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2292);
    int _2300 = abs(_2264);
    float _2302 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2304 = float(uint(_2274));
    float _2306 = trunc(_2294);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    int _2312 = as_type<int>(_2268) + (-2);
    float _2314 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = float(uint(_2300));
    float _2318 = as_type<float>(_2296) * _2304;
    float _2320 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2322 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2324 = trunc(_2318);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    float _2330 = as_type<float>(_2312) * _2316;
    int _2332 = _2280 * int(_2290);
    int _2334 = _2332 + _2236;
    float _2336 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2338 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2298);
    float _2340 = float(uint(_2334));
    float _2342 = trunc(_2330);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    float _2348 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2322);
    int _2350 = ~_2106;
    int _2352 = _2350 + 1;
    int _2354 = ~_2212;
    int _2356 = _2354 + 1;
    float _2358 = as_type<float>(_2256) * _2340;
    int _2360 = ~_2228;
    int _2362 = _2360 + 1;
    int _2364 = _2352 * int(_2310);
    int _2366 = _2364 + _2264;
    int _2368 = _2356 * int(_2328);
    int _2370 = _2368 + _2274;
    float _2372 = as_type<float>(_2362);
    float _2374 = _2338;
    if (_1041)
    {
        float _2376 = _1254 + (-1.0);
        _2372 = _2376;
    }
    float _2378 = _2372;
    float _2380 = float(uint(_2366));
    float _2382 = trunc(_2358);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = _2378;
    if (_1041)
    {
        float _2390 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2388 = _2390;
    }
    float _2392 = _2388;
    int _2394 = _2362 * int(_2346);
    int _2396 = _2394 + _2300;
    float _2398 = float(uint(_2370));
    float _2400 = _2398;
    if (_1041)
    {
        float _2402 = fma(_1085, _1254, _2392);
        _1091 = _2402;
    }
    float _2404 = _1091;
    float _2406 = as_type<float>(_2266) * _2380;
    float _2408 = float(uint(_2396));
    float _2410 = as_type<float>(_2296) * _2398;
    float _2412 = -_189;
    int _2414 = _2064 ? as_type<int>(_2412) : as_type<int>(_189);
    float _2416 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2418 = -_185;
    int _2420 = _2066 ? as_type<int>(_2418) : as_type<int>(_185);
    float _2422 = trunc(_2406);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    bool _2428 = !_1982;
    float _2430 = _2428 ? _189 : as_type<float>(_2414);
    float _2432 = as_type<float>(_2312) * _2408;
    bool _2434 = !_1986;
    float _2436 = _2434 ? _185 : as_type<float>(_2420);
    float _2438 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    float _2440 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2258);
    float _2442 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2444 = _2416 * _2254;
    float _2446 = trunc(_2410);
    float _2448 = precise::max(_2446, 0.0);
    uint _2450 = uint(_2448);
    float _2452 = _2416 * _2230;
    float _2454 = _2416 * _2248;
    if (_1041)
    {
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _1135 + _2456;
        _2400 = _2458;
    }
    float _2460 = _2400;
    float _2462 = fma(_2442, _2438, _2444);
    float _2464 = fma(_2442, _2302, _2452);
    float _2466 = fma(_2442, _2440, _2454);
    if (_1041)
    {
        float _2468 = _2460 * _2460;
        _1071 = _2468;
    }
    float _2470 = _1071;
    float _2472 = trunc(_2432);
    float _2474 = precise::max(_2472, 0.0);
    uint _2476 = uint(_2474);
    int _2478 = int(_2290) + int(_2386);
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2482 = _2404 + _2480;
    int _2484 = ~_1874;
    int _2486 = _2484 + 1;
    out.m_76.x = _2438;
    out.m_76.y = _2302;
    out.m_76.z = _2440;
    int _2488 = ~_2106;
    int _2490 = _2488 + 1;
    float _2492 = fma(_2482, _2482, _2136);
    int _2494 = int(_2310) + int(_2426);
    int _2496 = _2486 * _2478;
    int _2498 = _2496 + _2236;
    int _2500 = ~_2212;
    int _2502 = _2500 + 1;
    int _2504 = int(_2328) + int(_2450);
    float _2506 = _2492 + _2470;
    bool _2508 = uint(_2498) >= uint(_1874);
    int _2510 = _2490 * _2494;
    int _2512 = _2510 + _2264;
    int _2514 = int(_2346) + int(_2476);
    int _2516 = _2502 * _2504;
    int _2518 = _2516 + _2274;
    int _2520 = ~_2228;
    int _2522 = _2520 + 1;
    float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2526 = uint(_2512) >= uint(_2106);
    bool _2528 = !_2508;
    int _2530 = _2528 ? 0 : (-1);
    int _2532 = _2522 * _2514;
    int _2534 = _2532 + _2300;
    bool _2536 = uint(_2518) >= uint(_2212);
    bool _2538 = !_2526;
    int _2540 = _2538 ? 0 : (-1);
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2544 = ~_2478;
    int _2546 = _2544 + _2530;
    int _2548 = _2546 + 1;
    int _2550 = _2236 ^ _1874;
    int _2552 = ~_2494;
    int _2554 = _2552 + _2540;
    int _2556 = _2554 + 1;
    int _2558 = _1874 * _2548;
    int _2560 = _2558 + _2236;
    bool _2562 = _1874 == 0;
    float _2564 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2566 = !_2536;
    int _2568 = _2566 ? 0 : (-1);
    float _2570 = fma(_2416, _2416, 1.0);
    uint _2572 = uint(int(uint(_2550) >> uint(31)));
    float _2574 = sqrt(_2506);
    bool _2576 = uint(_2534) >= uint(_2228);
    int _2578 = _2264 ^ _2106;
    int _2580 = _2106 * _2556;
    int _2582 = _2580 + _2264;
    bool _2584 = _1874 == 0;
    float _2586 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2588 = ~_2568;
    int _2590 = _2504 + _2588;
    int _2592 = _2590 + 1;
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2596 = ~int(_2572);
    int _2598 = _2596 + 1;
    bool _2600 = !_2562;
    int _2602 = _2600 ? _2560 : (-1);
    bool _2604 = !_2576;
    int _2606 = _2604 ? 0 : (-1);
    uint _2608 = uint(int(uint(_2578) >> uint(31)));
    int _2610 = _2592 ^ _2598;
    float _2612 = float(_2602);
    bool _2614 = _2106 == 0;
    int _2616 = ~_2606;
    int _2618 = _2514 + _2616;
    int _2620 = _2618 + 1;
    int _2622 = ~int(_2608);
    int _2624 = _2622 + 1;
    bool _2626 = _2106 == 0;
    float _2628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2630 = ~_2598;
    int _2632 = _2630 + _2610;
    int _2634 = _2632 + 1;
    float _2636 = fma(_2564, _2612, _351);
    int _2638 = _2620 ^ _2624;
    bool _2640 = !_2614;
    int _2642 = _2640 ? _2582 : (-1);
    bool _2644 = !_2584;
    int _2646 = _2644 ? _2634 : (-1);
    float _2648 = rsqrt(_2570);
    int _2650 = ~_2624;
    int _2652 = _2650 + _2638;
    int _2654 = _2652 + 1;
    float _2656 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2658 = float(_2642);
    float _2660 = _2152 + 0.5;
    float _2662 = float(_2646);
    bool _2664 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2666 = isnan(_2574);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2672 = _2668 || _2670;
    float _2674 = fma(_2656, _2658, _665);
    bool _2676 = !_2626;
    int _2678 = _2676 ? _2654 : (-1);
    float _2680 = -_651;
    float _2682 = fma(_2586, _2662, _2680);
    float _2684 = fma(_2564, _2660, _2636);
    float _2686 = _2436 + 0.5;
    float _2688 = float(_2678);
    float _2690 = _2628 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2692 = _2430 + (-0.5);
    float _2694 = _2416 * _2648;
    float _2696 = fma(_2656, _2686, _2674);
    float _2698 = -_667;
    float _2700 = fma(_2690, _2688, _2698);
    float _2702 = -_2586;
    float _2704 = fma(_2702, _2692, _2682);
    float _2706 = -_2336;
    float _2708 = _2694 * _2706;
    float _2710 = -_2338;
    float _2712 = _2694 * _2710;
    float _2714 = _2148 + (-0.5);
    float _2716 = -_2348;
    float _2718 = _2694 * _2716;
    float _2720 = fma(_2648, _2254, _2708);
    float _2722 = fma(_2648, _2230, _2712);
    float _2724 = -_2690;
    float _2726 = fma(_2724, _2714, _2700);
    float _2728 = fma(_2648, _2248, _2718);
    float _2730 = -_649;
    float _2732 = _2730 + 1.0;
    float _2734 = -_653;
    float _2736 = _2734 + 1.0;
    float _2738 = _2336 + _2462;
    float _2740 = -_1171;
    float _2742 = fma(_2152, _2740, _2684);
    float _2744 = -_2732;
    float _2746 = fma(_2436, _2744, _2696);
    float _2748 = fma(_2430, _1185, _2704);
    float _2750 = fma(_2148, _2736, _2726);
    float _2752 = _2338 + _2464;
    float _2754 = _2348 + _2466;
    out.m_78.x = _2720;
    out.m_78.y = _2722;
    out.m_78.z = _2728;
    float _2756 = _2736;
    float _2758 = _2684;
    if (!_2672)
    {
        _2756 = 1.0;
    }
    float _2760 = _2756;
    out.m_80.x = _2742;
    out.m_80.y = _2748;
    out.m_80.z = _2746;
    out.m_80.w = _2750;
    out.m_82.x = _2738;
    out.m_82.y = _2752;
    out.m_82.z = _2754;
    bool _2762 = !_2672;
    float _2764 = _2760;
    if (!_2762)
    {
        bool _2766 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2768 = isnan(_2574);
        bool _2770 = _2766 || _2768;
        bool _2772 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2774 = _2770 || _2772;
        if (!_2774)
        {
            float _2776 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2778 = _2574 + _2776;
            float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2782 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2780;
            float _2784 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2788 = 1.0 / _2782;
            float _2790 = _2778 * _2788;
            float _2792 = fma(_2790, _2786, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2764 = _2792;
            _2794 = true;
        }
        else
        {
            bool _2796 = _2574 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2798 = isnan(_2574);
            bool _2800 = _2796 || _2798;
            bool _2802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2804 = _2800 || _2802;
            if (!_2804)
            {
                float _2806 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2808 = _2574 + _2806;
                float _2810 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2812 = _2810 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2814 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2816 = _2814 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2818 = 1.0 / _2812;
                float _2820 = _2808 * _2818;
                float _2822 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2764 = _2822;
                _2794 = true;
            }
            else
            {
                _2764 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2794 = false;
    float _2824 = _2764;
    float _2826 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2828 = _2404 + _2826;
    float _2830 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2832 = _1131 + _2830;
    float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2836 = _1135 + _2834;
    float _2838 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2840 = fma(_2832, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2842 = fma(_2836, _2824, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2846 = _2838 + _2844;
    float _2848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2850 = _2840 + _2848;
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2854 = _2842 + _2852;
    float _2856 = _2846 * _2846;
    float _2858 = fma(_2850, _2850, _2856);
    float _2860 = fma(_2854, _2854, _2858);
    float _2862 = rsqrt(_2860);
    float _2864 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2866 = _2850 * _2864;
    float _2868 = _2854 * _2864;
    float _2870 = _2866 * _2866;
    float _2872 = _2868 * _2868;
    float _2874 = _2870 + _2872;
    float _2876 = sqrt(_2874);
    bool _2878 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2876 + _2880;
    float _2884 = _2862;
    float _2886 = _2882;
    float _2888 = _2846;
    float _2890 = _2866;
    if (_2878)
    {
        float _2892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2892;
    }
    float _2894 = _2884;
    if (_2878)
    {
        float _2896 = rsqrt(_2874);
        _2758 = _2896;
    }
    float _2898 = _2758;
    float _2900 = _2898;
    if (_2878)
    {
        float _2902 = _2882 * _2894;
        _2886 = _2902;
    }
    float _2904 = _2886;
    if (_2878)
    {
        float _2906 = _2904 * 0.15915493667125701904296875;
        _2374 = _2906;
    }
    float _2908 = _2374;
    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2912 = _2854;
    float _2914 = _2908;
    if (_2878)
    {
        float _2916 = _2908 * 6.283185482025146484375;
        float _2918 = sin(_2916);
        _2912 = _2918;
    }
    float _2920 = _2912;
    float _2922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2924 = precise::max(0.0, _2922);
    float _2926 = _2894;
    float _2928 = _2924;
    if (_2878)
    {
        float _2930 = _2908 * 6.283185482025146484375;
        float _2932 = cos(_2930);
        _2926 = _2932;
    }
    float _2934 = _2926;
    float _2936 = -_2864;
    float _2938 = -_2924;
    float _2940 = fma(_2846, _2936, _2938);
    if (_2878)
    {
        float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2888 = _2942;
    }
    float _2944 = _2888;
    float _2946 = _2944;
    float _2948 = _2920;
    if (_2878)
    {
        float _2950 = fma(_2920, _2944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2946 = _2950;
    }
    float _2952 = _2946;
    float _2954 = _2952;
    if (!_2878)
    {
        _2948 = _2868;
    }
    float _2956 = _2948;
    float _2958 = _2956;
    float _2960 = _2934;
    if (_2878)
    {
        float _2962 = _2934 + (-1.0);
        _2928 = _2962;
    }
    float _2964 = _2928;
    if (_2878)
    {
        float _2966 = _2898 * _2952;
        _1197 = _2966;
    }
    float _2968 = _1197;
    if (!_2878)
    {
        _2900 = _2940;
    }
    float _2970 = _2900;
    float _2972 = _2970;
    if (_2878)
    {
        float _2974 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2914 = _2974;
    }
    float _2976 = _2914;
    if (_2878)
    {
        float _2978 = _2866 * _2968;
        _2890 = _2978;
    }
    float _2980 = _2890;
    if (!_2878)
    {
        _2954 = _2870;
    }
    float _2982 = _2954;
    float _2984 = sqrt(_2860);
    float _2986 = _2982;
    if (_2878)
    {
        float _2988 = fma(_2940, _2934, _2976);
        _2972 = _2988;
    }
    float _2990 = _2972;
    if (_2878)
    {
        float _2992 = _2868 * _2968;
        _2958 = _2992;
    }
    float _2994 = _2958;
    if (_2878)
    {
        float _2996 = _2980 * _2980;
        _2986 = _2996;
    }
    float _2998 = _2986;
    if (!_2878)
    {
        _2960 = _2872;
    }
    float _3000 = _2960;
    float _3002 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3004 = _3000;
    if (_2878)
    {
        float _3006 = _2994 * _2994;
        _3004 = _3006;
    }
    float _3008 = _3004;
    float _3010 = fma(_2990, _2990, _2998);
    float _3012 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3002);
    float _3014 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = _3010 + _3008;
    float _3018 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3020 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = rsqrt(_3016);
    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3026 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3024);
    float _3028 = precise::clamp(_3026, 0.0, 1.0);
    float _3030 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3012);
    float _3032 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3034 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3036 = -_3028;
    float _3038 = _3036 + 1.0;
    float _3040 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3042 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3032);
    float _3044 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3018);
    float _3046 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3048 = abs(_3038);
    float _3050 = log2(_3048);
    float _3052 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3042);
    float _3054 = _3034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3056 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3044);
    float _3058 = -_3046;
    float _3060 = fma(_3058, _2910, 1.0);
    float _3062 = _3022 * _2980;
    float _3064 = _3052 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3066 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3068 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3070 = _3022 * _2990;
    float _3072 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3074 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3066);
    float _3076 = _3022 * _2994;
    float _3078 = log2(_3060);
    float _3080 = -_3072;
    float _3082 = fma(_3070, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3080);
    float _3084 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3074);
    float _3086 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3088 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3090 = -_3076;
    float _3092 = fma(_3090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3082);
    float _3094 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3084);
    float _3096 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3098 = exp2(_3086);
    float _3100 = fma(_3092, -0.5, 0.5);
    float _3102 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3088);
    float _3104 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3096);
    float _3106 = fma(_3092, 0.5, 0.5);
    float _3108 = _3070 + 1.0;
    float _3110 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3102);
    float _3112 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3104);
    float _3114 = 1.0 / _3094;
    float _3116 = fma(_3106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3118 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3110);
    float _3120 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3112);
    float _3122 = _3078 * 0.693147182464599609375;
    float _3124 = fma(_3106, _3116, -0.212114393711090087890625);
    float _3126 = sqrt(_3100);
    float _3128 = -_3070;
    float _3130 = fma(_3098, _3108, _3128);
    float _3132 = fma(_3106, _3124, 1.570728778839111328125);
    float _3134 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3136 = fma(_3130, 0.5, 0.5);
    float _3138 = _3120 * _3114;
    float _3140 = _3118 * _3114;
    float _3142 = fma(_3138, 0.5, 0.5);
    float _3144 = fma(_3140, -0.5, 0.5);
    float _3146 = _3126 * 0.636619746685028076171875;
    float3 _8245 = float3(_3142, _3144, _3134);
    float _3148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8245, float3(0.0), isnan(_8245)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8245, float3(0.0), isnan(_8245)), level(0.0)).x;
    float3 _8256 = float3(_3142, _3144, _3134);
    float4 _3151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8256, float3(0.0), isnan(_8256)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8256, float3(0.0), isnan(_8256)), level(0.0)).xyzw;
    float _3153 = _3151.x;
    float _3155 = _3151.y;
    float _3157 = _3151.z;
    float _3159 = _3151.w;
    float _3161 = -_3132;
    float _3163 = fma(_3146, _3161, 1.0);
    float2 _8277 = float2(_3163, _3136);
    float3 _3165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8277, float2(0.0), isnan(_8277)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8277, float2(0.0), isnan(_8277)), level(0.0)).xyz;
    float _3167 = _3165.x;
    float _3169 = _3165.y;
    float _3171 = _3165.z;
    float _3173 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3175 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3177 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3179 = -_1155;
    float _3181 = _3179 + 1.0;
    float _3183 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3173);
    float _3185 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3175);
    float _3187 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3177);
    float _3189 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3183);
    float _3191 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3185);
    out.m_84.x = _2840;
    out.m_84.y = _2838;
    out.m_84.z = _2842;
    float _3193 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3195 = _3191 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3197 = 1.0 / _3193;
    float _3199 = _3195 + _3193;
    bool _3201 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3203 = isnan(_2984);
    bool _3205 = _3201 || _3203;
    bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3209 = _3205 || _3207;
    float _3211 = _3199 * _3197;
    float _3213 = _3211 * 0.5;
    float _3215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3217 = fma(_3213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3215);
    float _3219 = in.m_86.x;
    float _3221 = 1.0 / _3217;
    float _3223 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3225 = _3221 * _3223;
    float _3227 = abs(_3225);
    float _3229 = log2(_3227);
    bool _3231 = _3225 <= 8000.0;
    bool _3233 = isnan(_3225);
    bool _3235 = _3231 || _3233;
    bool _3237 = isnan(8000.0);
    bool _3239 = _3235 || _3237;
    float _3241 = float(_3239);
    float _3243 = _3229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3245 = exp2(_3243);
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3249 = precise::clamp(_3247, 0.0, 1.0);
    float _3251 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3253 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3187);
    float _3255 = fma(_3249, -2.0, 3.0);
    float _3257 = _3249 * _3249;
    float _3259 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3253);
    float _3261 = exp2(_3251);
    float _3263 = _3257 * _3255;
    float _3265 = _3259 + _3094;
    out.gl_Position.x = _3120;
    out.gl_Position.y = _3118;
    out.gl_Position.z = _3259;
    out.gl_Position.w = _3094;
    float _3267 = -_3263;
    float _3269 = _3267 + 1.0;
    float _3271 = fma(_3269, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3263);
    float _3273 = _3241 * _3271;
    float _3275 = -_3261;
    float _3277 = _3275 + 1.0;
    float _3279 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3281 = _3265 * 0.5;
    float _3283 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3285 = _3259;
    float _3287 = _3118;
    float _3289 = _3120;
    float _3291 = _3094;
    float _3293 = _3283;
    float _3295 = _3157;
    if (!_3209)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3297 = _3285;
    float _3299 = _3181 * _3279;
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = _3297;
    float _3305 = _3297;
    if (!_3209)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3307 = _3287;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3209)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3313 = _3289;
    float _3315 = -_3301;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3319 = -_3283;
    float _3321 = _3319 + 1.0;
    float _3323 = _3317 * _3219;
    float _3325 = _3313;
    float _3327 = _3313;
    if (!_3209)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3329 = _3291;
    float _3331 = _3323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.z = _3281;
    out.m_88.w = _3094;
    out.m_90.x = _3331;
    float _3333 = _3283 * _3148;
    float _3335 = _3159 * _3321;
    float _3337 = _3329;
    float _3339 = _3329;
    if (!_3209)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3341 = _3293;
    float _3343 = _3159 * _3333;
    float _3345 = _3171 * _3333;
    float _3347 = fma(_3167, _3343, _3153);
    float _3349 = fma(_3169, _3343, _3155);
    float _3351 = fma(_3159, _3345, _3157);
    float _3353 = _3341;
    float _3355 = _3341;
    if (!_3209)
    {
        _3295 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3357 = _3295;
    out.m_92.x = _3347;
    out.m_92.y = _3349;
    out.m_92.z = _3351;
    out.m_92.w = _3335;
    bool _3359 = !_3209;
    float _3361 = _3357;
    float _3363 = _3357;
    if (!_3359)
    {
        bool _3365 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3367 = isnan(_2984);
        bool _3369 = _3365 || _3367;
        bool _3371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3373 = _3369 || _3371;
        if (!_3373)
        {
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3377 = _2984 + _3375;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3379;
            float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3387 = 1.0 / _3381;
            float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3391 = _3389 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3399 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3405 = _3377 * _3387;
            float _3407 = precise::clamp(_3405, 0.0, 1.0);
            float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3413 = fma(_3407, _3385, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3415 = fma(_3407, _3411, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3417 = fma(_3407, _3391, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3419 = fma(_3407, _3395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3421 = fma(_3407, _3399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3423 = fma(_3407, _3403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3363 = _3417;
            _3311 = _3421;
            _3355 = _3413;
            _3305 = _3419;
            _3339 = _3415;
            _3327 = _3423;
            _3425 = true;
        }
        else
        {
            bool _3427 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3429 = isnan(_2984);
            bool _3431 = _3427 || _3429;
            bool _3433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3435 = _3431 || _3433;
            if (!_3435)
            {
                _3353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3437 = _3353;
            _3355 = _3437;
            if (!_3435)
            {
                _3361 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3439 = _3361;
            _3363 = _3439;
            if (!_3435)
            {
                _3337 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3441 = _3337;
            _3339 = _3441;
            if (!_3435)
            {
                _3303 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3443 = _3303;
            _3305 = _3443;
            if (!_3435)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3445 = _3309;
            _3311 = _3445;
            if (!_3435)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3447 = _3325;
            bool _3449 = !_3435;
            _3327 = _3447;
            if (!_3449)
            {
                bool _3451 = _2984 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3453 = isnan(_2984);
                bool _3455 = _3451 || _3453;
                bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3459 = _3455 || _3457;
                if (!_3459)
                {
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3463 = _2984 + _3461;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3465;
                    float _3469 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3473 = 1.0 / _3467;
                    float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3481 = _3479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3491 = _3463 * _3473;
                    float _3493 = precise::clamp(_3491, 0.0, 1.0);
                    float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3499 = fma(_3493, _3471, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3501 = fma(_3493, _3497, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3503 = fma(_3493, _3477, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3505 = fma(_3493, _3481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3507 = fma(_3493, _3485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3509 = fma(_3493, _3489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3363 = _3503;
                    _3311 = _3507;
                    _3355 = _3499;
                    _3305 = _3505;
                    _3339 = _3501;
                    _3327 = _3509;
                    _3425 = true;
                }
                else
                {
                    _3363 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3305 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3339 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3425 = false;
    float _3511 = _3363;
    float _3513 = _3311;
    float _3515 = _3355;
    float _3517 = _3305;
    float _3519 = _3339;
    float _3521 = _3327;
    float _3523 = fma(_2752, -0.5, 0.5);
    float _3525 = precise::clamp(_3523, 0.0, 1.0);
    float _3527 = -_3511;
    float _3529 = _3527 + _3513;
    float _3531 = -_3515;
    float _3533 = _3531 + _3517;
    float _3535 = -_3519;
    float _3537 = _3535 + _3521;
    bool _3539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3541 = fma(_3525, _3529, _3511);
    float _3543 = fma(_3525, _3533, _3515);
    float _3545 = fma(_3525, _3537, _3519);
    float _3547 = _3541 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _3549 = fma(_3543, 0.298911988735198974609375, _3547);
    float _3551 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3553 = fma(_3545, 0.114477999508380889892578125, _3549);
    out.m_53.x = _3551;
    float _3555 = -_3553;
    float _3557 = _3543 + _3555;
    float _3559 = -_3553;
    float _3561 = _3541 + _3559;
    float _3563 = -_3553;
    float _3565 = _3545 + _3563;
    float _3567 = fma(_3557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    float _3569 = fma(_3561, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    float _3571 = fma(_3565, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3553);
    out.m_96.x = _3567;
    out.m_96.y = _3569;
    out.m_96.z = _3571;
    if (!_3539)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3573 = -_2838;
    float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3577 = -_2840;
    float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3581 = -_2842;
    float _3583 = _3581 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3585 = _3575 * _3575;
    float _3587 = fma(_3579, _3579, _3585);
    float _3589 = fma(_3583, _3583, _3587);
    float _3591 = sqrt(_3589);
    float _3593 = rsqrt(_3589);
    float _3595 = -_3591;
    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3599 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = _3579 * _3593;
    float _3605 = _3575 * _3593;
    float _3607 = abs(_3601);
    float _3609 = log2(_3607);
    float _3611 = _3583 * _3593;
    float _3613 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3615 = _2752 * _3605;
    float _3617 = -_3605;
    float _3619 = -_3613;
    float _3621 = fma(_3617, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3619);
    float _3623 = fma(_2738, _3603, _3615);
    float _3625 = -_3611;
    float _3627 = fma(_3625, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3621);
    float _3629 = fma(_2754, _3611, _3623);
    float _3631 = precise::clamp(_3629, 0.0, 1.0);
    float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3635 = _3627 + _3633;
    float _3637 = _3609 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3639 = _3635 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3641 = precise::clamp(_3639, 0.0, 1.0);
    float _3643 = exp2(_3637);
    float _3645 = _3643 * _3641;
    float _3647 = _3631 * _3645;
    float _3649 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3651 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3653 = _3647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3649;
    out.m_94.y = _3651;
    out.m_94.z = _3653;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

