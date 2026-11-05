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
    float4 m_60 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_70 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1489 = false;
    bool _695 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_105);
        out.gl_Position.z = _2305;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_143);
        out.gl_Position.z = _2374;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    int _163 = as_type<int>(_145) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_145) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    int _173 = _171 ? (-1090519040) : 1056964608;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _183 = _179 || _181;
    bool _185 = isnan(1.0);
    bool _187 = _183 || _185;
    out.m_56.x = as_type<float>(_173);
    out.m_56.y = _177;
    float _189 = 0.0;
    float _191 = _147;
    float _193 = _177;
    if (!_187)
    {
        float _195 = _147 * _147;
        float _197 = _195 * 0.5;
        _189 = _197;
    }
    float _199 = _189;
    float _201 = _199;
    if (!_187)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_187;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _147 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _147);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_187;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _147 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _191 = _263;
    }
    float _265 = _191;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _151, _269);
    float _277 = fma(_265, _153, _271);
    float _279 = fma(_265, _155, _273);
    float _281 = fma(_275, _149, _157);
    float _283 = fma(_277, _149, _159);
    float _285 = fma(_279, _149, _161);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_58.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_89);
        float _311 = 1.0 / _309;
        float _313 = _123 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _333 = 1.0 / _319;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _343 = 1.0 / _323;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _351 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_315);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    out.m_60.w = _349;
    float _363 = 1.0 / _327;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _315 + _365;
    float _369 = _347 * _333;
    bool _371 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _373 = isnan(_315);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = _315 + _383;
    bool _387 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _389 = isnan(_315);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = 1.0 / _331;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _401;
    float _405 = _367 * _343;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _315 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _315 + _411;
    float _415 = -_397;
    float _417 = _415 + 1.0;
    float _419 = 1.0 / _337;
    float _421 = _409 * _363;
    float _423 = -_381;
    float _425 = _423 + 1.0;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _433 = _397 * _425;
    bool _435 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _437 = isnan(_315);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = 1.0 / _403;
    float _449 = _413 * _399;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _453 = _315 + _451;
    float _455 = fma(_429, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -_445;
    float _459 = _457 + 1.0;
    float _461 = 1.0 / _341;
    float _463 = _385 * _419;
    bool _465 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _467 = isnan(_315);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _453 * _447;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _481 = _315 + _479;
    float _483 = _475 * _417;
    float _485 = -_475;
    float _487 = _485 + 1.0;
    float _489 = _445 * _487;
    float _491 = _481 * _461;
    bool _493 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_315);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _505;
    float _509 = _503 * _459;
    float _511 = -_503;
    float _513 = _511 + 1.0;
    bool _515 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_315);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = fma(_507, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _529 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _531 = isnan(_315);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _361 * _513;
    float _543 = -_361;
    float _545 = _543 + 1.0;
    float _547 = -_525;
    float _549 = _547 + 1.0;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _555;
    float _559 = _525 * _545;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = _539 * _549;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = fma(_553, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _573 = fma(_563, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _575 = _455 * _565;
    float _577 = -_539;
    float _579 = _577 + 1.0;
    float _581 = fma(_569, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _583 = fma(_557, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = _527 * _565;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _595 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _597 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _599 = fma(_589, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_593, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _603;
    float _607 = fma(_571, _559, _595);
    float _609 = fma(_573, _559, _597);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _611;
    float _615 = fma(_605, _463, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _617 = fma(_581, _541, _607);
    float _619 = fma(_583, _541, _609);
    float _621 = in.m_54.x;
    float _623 = in.m_54.y;
    float _625 = fma(_613, _463, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _631 = fma(_599, _509, _617);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _637 = fma(_601, _509, _619);
    float _639 = fma(_629, _491, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _641;
    float _645 = fma(_615, _489, _631);
    float _647 = fma(_635, _491, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _649;
    float _653 = fma(_625, _489, _637);
    float _655 = fma(_643, _477, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _657 = fma(_639, _483, _645);
    float _659 = fma(_651, _477, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _661 = fma(_647, _483, _653);
    float _663 = fma(_655, _433, _657);
    float _665 = fma(_659, _433, _661);
    float _667 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[150].x, _663);
    float _669 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[150].y, _665);
    float _671 = _667 * _621;
    float _673 = _669 * _623;
    bool _675 = !_431;
    float _693;
    if (!_675)
    {
        float _677 = in.m_58.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = in.m_58.x;
    float _707 = in.m_58.y;
    float _709 = in.m_58.z;
    float _711 = in.m_58.w;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = _673 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _719 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    bool _733 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _735 = isnan(1.0);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _741 = _737 || _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _745 = 1.0 + _743;
    float _747 = _715 * _123;
    float _749 = 1.0 / _745;
    float _751 = _709 * 2.0;
    float _753 = _705 * 2.0;
    float _755 = _707 + _709;
    float _757 = _707 * 2.0;
    float _759 = exp2(_747);
    float _761 = _755 + (-1.0);
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _765 = _707 + _705;
    float _767 = floor(_751);
    float _769 = _765 + (-1.0);
    float _771 = floor(_753);
    float _773 = -_759;
    float _775 = _773 + 1.0;
    bool _777 = _767 > 0.0;
    float _779 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _781 = _767 >= 0.0;
    bool _783 = isnan(_767);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = floor(_757);
    float _793 = in.m_62.x;
    float _795 = in.m_62.y;
    float _797 = in.m_62.z;
    bool _799 = !_723;
    int _801 = _799 ? 0 : 1;
    int _803 = _789 ? 0 : 1;
    bool _805 = _771 > 0.0;
    bool _807 = _771 >= 0.0;
    bool _809 = isnan(_771);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    int _817 = abs(_801);
    int _819 = ~_803;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    bool _825 = !_727;
    int _827 = _825 ? 0 : 1;
    int _829 = _823;
    if (!_777)
    {
        int _831 = ~_803;
        int _833 = _831 + 1;
        _829 = _833;
    }
    int _835 = _829;
    int _837 = _815 ? 0 : 1;
    int _839 = abs(_827);
    float _841 = float(_817);
    float _843 = float(_835);
    int _845 = ~_837;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    if (!_805)
    {
        int _853 = ~_837;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = _841 * _843;
    bool _861 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    bool _871 = _791 > 0.0;
    float _873 = _859 * (-2.0);
    float _875 = float(_839);
    float _877 = float(_857);
    float _879 = fma(_873, _793, _793);
    float _881 = _869 ? _775 : 0.0;
    float _883 = fma(_779, _873, _779);
    bool _885 = _791 >= 0.0;
    bool _887 = isnan(_791);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = _875 * _877;
    bool _897 = !_731;
    int _899 = _897 ? 0 : 1;
    if (_741)
    {
        float _901 = _881 * _749;
        _127 = _901;
    }
    float _903 = _127;
    float _905 = _705 + (-0.5);
    int _907 = _893 ? 0 : 1;
    float _909 = _895 * (-2.0);
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].x, _879);
    int _913 = ~_907;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_763, _909, _763);
    int _921 = abs(_899);
    float _923 = fma(_909, _795, _795);
    int _925 = _917;
    if (!_871)
    {
        int _927 = ~_907;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = _707 + (-0.5);
    float _935 = float(_921);
    float _937 = fma(_883, _903, _911);
    float _939 = float(_931);
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].y, _923);
    float _943 = _709 + _705;
    float _945 = _937 * 0.15915493667125701904296875;
    bool _947 = _711 > 0.5;
    float _949 = _935 * _939;
    float _951 = fma(_919, _903, _941);
    float _953 = _943 + (-1.0);
    float _955 = _945 * 6.283185482025146484375;
    float _957 = sin(_955);
    float _959 = _949 * (-2.0);
    float _961 = _951 * 0.15915493667125701904296875;
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _965 = _709 + (-0.5);
    float _967 = fma(_959, _797, _797);
    bool _969 = _705 > 0.5;
    float _971 = fma(_963, _959, _963);
    float _973 = _945 * 6.283185482025146484375;
    float _975 = cos(_973);
    float _977 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].z, _967);
    float _979 = -_177;
    float _981 = _947 ? _979 : _177;
    float _983 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _985 = _707 > 0.5;
    float _987 = fma(_971, _903, _977);
    float _989 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _991 = _961 * 6.283185482025146484375;
    float _993 = sin(_991);
    float _995 = _987 * 0.15915493667125701904296875;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1005 = _1003 != 0;
    float _1007 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1011 = _1009 != 0;
    float _1013 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _989);
    float _1015 = _961 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1021 = _1019 != 0;
    float _1023 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _983);
    bool _1025 = _709 > 0.5;
    float _1027 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1029 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1001);
    float _1031 = _719 * _1007;
    float _1033 = _995 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = _717 * _1027;
    float _1039 = _975 * _993;
    float _1041 = _957 * _993;
    float _1043 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1023);
    bool _1045 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1047 = isnan(_703);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1059 = _703 + _1057;
    float _1061 = _995 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _957 * _1017;
    float _1067 = _975 * _1017;
    float _1069 = _1035 * _1037;
    float _1071 = _993 * _1035;
    float _1073 = _1017 * _1035;
    float _1075 = _975 * _1069;
    float _1077 = -_1037;
    float _1079 = _1063 * _1077;
    float _1081 = -_1039;
    float _1083 = fma(_1063, _1065, _1081);
    float _1085 = -_1065;
    float _1087 = fma(_1063, _1039, _1085);
    float _1089 = fma(_1063, _1067, _1041);
    float _1091 = fma(_1073, _1031, _1079);
    float _1093 = _957 * _1069;
    float _1095 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1097 = fma(_1089, _1031, _1075);
    float _1099 = fma(_1063, _1041, _1067);
    float _1101 = fma(_1083, _1031, _1093);
    float _1103 = fma(_1071, _1095, _1091);
    float _1105 = fma(_1087, _1095, _1097);
    float _1107 = fma(_1099, _1095, _1101);
    float _1109 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1013);
    float _1111 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1115 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1029);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1121 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1111);
    float _1123 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1113);
    float _1125 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1129 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1121);
    float _1131 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1123);
    float _1133 = 1.0 / _1119;
    float _1135 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1137 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1147 = _1125 + _1135;
    float _1149 = _1127 + _1137;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1157 = isnan(_703);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1147 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1149 + _1171;
    float _1175 = 1.0 / _1153;
    bool _1177 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1179 = isnan(_703);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _1169 * _1169;
    float _1191 = _1173 * _1173;
    float _1193 = _1141 * _1133;
    float _1195 = -_1165;
    float _1197 = _1195 + 1.0;
    float _1199 = -_1187;
    float _1201 = _1199 + 1.0;
    float _1203 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1205 = 1.0 / _1145;
    float _1207 = _1189 + _1191;
    float _1209 = _1055 * _1197;
    float _1211 = fma(_1193, _1059, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1213 = sqrt(_1207);
    float _1215 = -_1055;
    float _1217 = _1215 + 1.0;
    bool _1219 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1221 = isnan(_703);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = _1187 * _1217;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1237 = _1229 * _1201;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1241;
    float _1245 = _1235 * _1175;
    float _1247 = _1211 * _1237;
    float _1249 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1203);
    float _1251 = -_177;
    int _1253 = _985 ? as_type<int>(_1251) : as_type<int>(_177);
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1257 = _703 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1261 = _703 + _1259;
    bool _1263 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1269 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1271 = -_1229;
    float _1273 = _1271 + 1.0;
    float _1275 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1277 = _1243 * _1205;
    float _1279 = fma(_1245, _1257, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1247);
    float _1283 = _1269 + _1275;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1287 = !_1005;
    float _1289 = _1287 ? _177 : as_type<float>(_1253);
    float _1291 = fma(_1277, _1261, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1293 = !_1021;
    float _1295 = _1293 ? _177 : _981;
    float _1297 = fma(_1279, _1231, _1281);
    float _1299 = _981;
    float _1301 = _1261;
    float _1303 = _1189;
    float _1305 = _1191;
    if (!_1263)
    {
        _1299 = _1147;
    }
    float _1307 = _1299;
    float _1309 = _1307;
    if (!_1263)
    {
        _193 = _1149;
    }
    float _1311 = _193;
    float _1313 = _1311;
    if (!_1263)
    {
        _1301 = _1283;
    }
    float _1315 = _1301;
    bool _1317 = !_1263;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1213 + _1323;
        float _1327 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1207);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = fma(_1337, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1345 = _1329 * _1343;
        float _1347 = fma(_1169, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1349 = _1341 + (-1.0);
        float _1351 = fma(_1173, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1355 = _1347 + _1353;
        float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1361 = _1351 + _1359;
        float _1363 = _1355 * _1355;
        float _1365 = fma(_1283, _1341, _1357);
        float _1367 = _1361 * _1361;
        _1319 = _1365;
        _1303 = _1363;
        _1305 = _1367;
        _1313 = _1351;
        _1309 = _1347;
    }
    float _1369 = _1319;
    float _1371 = _1303;
    float _1373 = _1305;
    float _1375 = _1313;
    float _1377 = _1309;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1381 = _1369 + _1379;
    float _1383 = fma(_1291, _1209, _1297);
    float _1385 = -as_type<float>(_173);
    int _1387 = _969 ? as_type<int>(_1385) : _173;
    float _1389 = -_1289;
    float _1391 = _1389 + 0.5;
    float _1393 = -as_type<float>(_173);
    int _1395 = _1025 ? as_type<int>(_1393) : _173;
    float _1397 = fma(_1381, _1381, _1371);
    bool _1399 = !_999;
    float _1401 = _1399 ? as_type<float>(_173) : as_type<float>(_1387);
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1405 = !_1011;
    float _1407 = _1405 ? as_type<float>(_173) : as_type<float>(_1395);
    float _1409 = _1397 + _1373;
    float _1411 = -_1295;
    float _1413 = _1411 + 0.5;
    float _1415 = _1401 + 0.5;
    float _1417 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1383);
    float _1419 = _1407 + 0.5;
    float _1421 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1423 = sqrt(_1409);
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1431 = _1421 * _1267;
    float _1433 = _1425 * _1239;
    float _1435 = _1427 * _1285;
    float _1437 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1439 = _1429 * _1403;
    out.m_64.w = _1437;
    out.m_66.x = _1433;
    out.m_66.y = _1431;
    out.m_66.z = _1435;
    out.m_66.w = _1439;
    bool _1441 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1443 = isnan(_1423);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1449 = _1445 || _1447;
    float _1451 = _1421;
    float _1453 = _1377;
    if (!_1449)
    {
        _1451 = 1.0;
    }
    float _1455 = _1451;
    bool _1457 = !_1449;
    float _1459 = _1455;
    if (!_1457)
    {
        bool _1461 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1463 = isnan(_1423);
        bool _1465 = _1461 || _1463;
        bool _1467 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1469 = _1465 || _1467;
        if (!_1469)
        {
            float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1473 = _1423 + _1471;
            float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1477 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1475;
            float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1483 = 1.0 / _1477;
            float _1485 = _1473 * _1483;
            float _1487 = fma(_1485, _1481, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1459 = _1487;
            _1489 = true;
        }
        else
        {
            bool _1491 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1493 = isnan(_1423);
            bool _1495 = _1491 || _1493;
            bool _1497 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1499 = _1495 || _1497;
            if (!_1499)
            {
                float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1503 = _1423 + _1501;
                float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1507 = _1505 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1511 = _1509 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1513 = 1.0 / _1507;
                float _1515 = _1503 * _1513;
                float _1517 = fma(_1515, _1511, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1459 = _1517;
                _1489 = true;
            }
            else
            {
                _1459 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1489 = false;
    float _1519 = _1459;
    float _1521 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1525 = _1375 + _1523;
    float _1527 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1521);
    float _1529 = fma(_1525, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1527);
    float _1543 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1545 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan(0.5);
    bool _1553 = _1549 || _1551;
    float _1555 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1557 = _1369 + _1555;
    float _1559 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1561 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1543);
    float _1563 = fma(_1557, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1565 = 1.0 / _1559;
    float _1567 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1561);
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1571 = _1569 + _1559;
    float _1573 = _1571 * _1565;
    float _1575 = _1573 * 0.5;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
    float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1583 = _1377 + _1581;
    float _1585 = 1.0 / _1579;
    float _1587 = fma(_1583, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1589 = _1519;
    float _1591 = _1583;
    float _1593 = _1579;
    float _1595 = _1563;
    float _1597 = _1525;
    if (_1553)
    {
        _1589 = 1.0;
    }
    float _1599 = _1589;
    float _1601 = _1599;
    if (_1539)
    {
        _1591 = _1529;
    }
    float _1603 = _1591;
    float _1605 = _1603;
    if (_1539)
    {
        _1453 = _1587;
    }
    float _1607 = _1453;
    float _1609 = _1607;
    if (!_1539)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1613 = _1269 + _1611;
        float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1617 = _1125 + _1615;
        float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1621 = -_1125;
        float _1623 = _1621 + _1587;
        float _1625 = _1613 * _1613;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1629 = _1127 + _1627;
        float _1631 = -_1269;
        float _1633 = _1631 + _1563;
        float _1635 = -_1127;
        float _1637 = _1635 + _1529;
        float _1639 = fma(_1617, _1617, _1625);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1643 = fma(_1629, _1629, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1649 = _1645 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1651 = isnan(_1645);
        bool _1653 = _1649 || _1651;
        bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1657 = _1653 || _1655;
        float _1659 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1619;
        float _1663 = _1647 * _1661;
        float _1665 = _1579;
        float _1667 = _1659;
        float _1669 = _1645;
        _1597 = _1647;
        if (_1657)
        {
            float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1665 = _1671;
        }
        float _1673 = _1665;
        if (_1657)
        {
            float _1675 = precise::max(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1667 = _1675;
        }
        float _1677 = _1667;
        float _1679 = fma(_1623, _1663, _1125);
        float _1681 = fma(_1633, _1663, _1269);
        float _1683 = _1679;
        float _1685 = _1681;
        _1593 = _1673;
        if (_1657)
        {
            float _1687 = _1677 * _1673;
            _1669 = _1687;
        }
        float _1689 = _1669;
        float _1691 = fma(_1637, _1663, _1127);
        float _1693 = _1689;
        _1605 = _1691;
        if (_1657)
        {
            float _1695 = _1647 * _1689;
            _1693 = _1695;
        }
        float _1697 = _1693;
        if (_1657)
        {
            float _1699 = fma(_1623, _1697, _1125);
            _1683 = _1699;
        }
        float _1701 = _1683;
        _1609 = _1701;
        if (_1657)
        {
            float _1703 = fma(_1633, _1697, _1269);
            _1685 = _1703;
        }
        float _1705 = _1685;
        _1595 = _1705;
        if (_1657)
        {
            float _1707 = fma(_1637, _1697, _1127);
            _1605 = _1707;
        }
    }
    float _1709 = _1593;
    float _1711 = _1595;
    float _1713 = _1609;
    float _1715 = _1605;
    float _1717 = _1597;
    float _1719 = _1717;
    float _1721 = _1709;
    if (_1553)
    {
        _1719 = 1.0;
    }
    float _1723 = _1719;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1727 = _1585 * _1725;
    float _1729 = _1723;
    float _1731 = _1727;
    if (!_1553)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1763 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1761;
        float _1765 = _1753 * _1755;
        float _1767 = 1.0 / _1763;
        float _1769 = 1.0 / _1765;
        float _1771 = _1759 * _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1727, _1771, _1773);
        float _1777 = _1775 * _1767;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1721 = _1743;
        _1601 = _1779;
    }
    float _1781 = _1721;
    float _1783 = _1601;
    float _1785 = _1781;
    if (!_1553)
    {
        float _1787 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1789 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1797 = _1795 * 0.15915493667125701904296875;
        float _1799 = _1789 * 6.283185482025146484375;
        float _1801 = sin(_1799);
        float _1803 = 1.0 / _1793;
        float _1805 = _1797 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = _1797 * 6.283185482025146484375;
        float _1813 = sin(_1811);
        float _1815 = _1807 * _1809;
        float _1817 = 1.0 / _1815;
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1821 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1819;
        float _1823 = 1.0 / _1821;
        float _1825 = _1813 * _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1829 = fma(_1727, _1825, _1827);
        float _1831 = _1829 * _1823;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = -_1833;
        float _1837 = _1835 + 1.0;
        _1785 = _1803;
        _1729 = _1837;
    }
    float _1839 = _1785;
    float _1841 = _1729;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1845 = _1711 + _1843;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1849 = _1713 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1715 + _1851;
    float _1855 = _1845 * _1845;
    float _1857 = fma(_1849, _1849, _1855);
    float _1859 = fma(_1853, _1853, _1857);
    float _1861 = rsqrt(_1859);
    float _1863 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1865 = _1849 * _1863;
    float _1867 = _1853 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    bool _1877 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = _1875 + _1879;
    float _1883 = _1861;
    float _1885 = _1873;
    float _1887 = _1881;
    float _1889 = _1845;
    float _1891 = _1863;
    float _1893 = _1865;
    if (_1877)
    {
        float _1895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1877)
    {
        float _1899 = rsqrt(_1873);
        _1885 = _1899;
    }
    float _1901 = _1885;
    if (_1877)
    {
        float _1903 = _1881 * _1897;
        _1887 = _1903;
    }
    float _1905 = _1887;
    if (_1877)
    {
        float _1907 = _1905 * 0.15915493667125701904296875;
        _1731 = _1907;
    }
    float _1909 = _1731;
    float _1911 = _1839;
    float _1913 = _1909;
    if (_1877)
    {
        float _1915 = _1909 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        _1911 = _1917;
    }
    float _1919 = _1911;
    float _1921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1923 = precise::max(0.0, _1921);
    float _1925 = _1853;
    float _1927 = _1923;
    float _1929 = _1921;
    if (_1877)
    {
        float _1931 = _1909 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        _1925 = _1933;
    }
    float _1935 = _1925;
    float _1937 = -_1863;
    float _1939 = -_1923;
    float _1941 = fma(_1845, _1937, _1939);
    if (!_1877)
    {
        _1889 = _1867;
    }
    float _1943 = _1889;
    float _1945 = _1943;
    if (_1877)
    {
        float _1947 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1949;
    if (_1877)
    {
        float _1953 = fma(_1919, _1949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1951 = _1953;
    }
    float _1955 = _1951;
    float _1957 = sqrt(_1859);
    float _1959 = _1955;
    float _1961 = _1935;
    if (_1877)
    {
        float _1963 = _1935 + (-1.0);
        _1929 = _1963;
    }
    float _1965 = _1929;
    float _1967 = _1965;
    if (_1877)
    {
        float _1969 = _1901 * _1955;
        _1891 = _1969;
    }
    float _1971 = _1891;
    if (!_1877)
    {
        _1959 = _1941;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1877)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1913 = _1977;
    }
    float _1979 = _1913;
    if (_1877)
    {
        float _1981 = _1865 * _1971;
        _1893 = _1981;
    }
    float _1983 = _1893;
    if (!_1877)
    {
        _1967 = _1869;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1877)
    {
        float _1989 = _1867 * _1971;
        _1945 = _1989;
    }
    float _1991 = _1945;
    if (_1877)
    {
        float _1993 = fma(_1941, _1935, _1979);
        _1975 = _1993;
    }
    float _1995 = _1975;
    if (_1877)
    {
        float _1997 = _1983 * _1983;
        _1987 = _1997;
    }
    float _1999 = _1987;
    if (!_1877)
    {
        _1961 = _1871;
    }
    float _2001 = _1961;
    float _2003 = _2001;
    if (_1877)
    {
        float _2005 = _1991 * _1991;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = fma(_1995, _1995, _1999);
    float _2011 = _2009 + _2007;
    float _2013 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2017 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2023 = rsqrt(_2011);
    float _2025 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2013);
    float _2027 = -_2019;
    float _2029 = _2027 + 1.0;
    float _2031 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2033 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2021);
    float _2035 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2037 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2025);
    float _2039 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2031);
    float _2041 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2043 = abs(_2029);
    float _2045 = log2(_2043);
    float _2047 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2035);
    float _2049 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2039);
    float _2051 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2053 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2057 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2059 = _2023 * _1983;
    float _2061 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = _2023 * _1995;
    float _2065 = _2023 * _1991;
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2073 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2075 = -_2067;
    float _2077 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2075);
    float _2079 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2069);
    float _2083 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2065;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2077);
    float _2089 = -_2073;
    float _2091 = fma(_2089, _2071, 1.0);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2081);
    float _2095 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2097 = fma(_2087, -0.5, 0.5);
    float _2099 = exp2(_2083);
    float _2101 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2103 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2095);
    float _2105 = fma(_2087, 0.5, 0.5);
    float _2107 = _2063 + 1.0;
    float _2109 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2101);
    float _2111 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2103);
    float _2113 = fma(_2105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2115 = log2(_2091);
    float _2117 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2109);
    float _2119 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2111);
    float _2121 = fma(_2105, _2113, -0.212114393711090087890625);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2117);
    float _2125 = fma(_2105, _2121, 1.570728778839111328125);
    float _2127 = 1.0 / _2093;
    float _2129 = -_2063;
    float _2131 = fma(_2099, _2107, _2129);
    float _2133 = fma(_2131, 0.5, 0.5);
    float _2135 = sqrt(_2097);
    float _2137 = _2115 * 0.693147182464599609375;
    float _2139 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2141 = _2119 * _2127;
    float _2143 = _2123 * _2127;
    float _2145 = fma(_2141, 0.5, 0.5);
    float _2147 = fma(_2143, -0.5, 0.5);
    float _2149 = _2135 * 0.636619746685028076171875;
    float3 _5501 = float3(_2145, _2147, _2139);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5501, float3(0.0), isnan(_5501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5501, float3(0.0), isnan(_5501)), level(0.0)).x;
    float3 _5512 = float3(_2145, _2147, _2139);
    float4 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5512, float3(0.0), isnan(_5512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5512, float3(0.0), isnan(_5512)), level(0.0)).xyzw;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = _2154.w;
    float _2164 = -_2125;
    float _2166 = fma(_2149, _2164, 1.0);
    float2 _5534 = float2(_2166, _2133);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5534, float2(0.0), isnan(_5534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5534, float2(0.0), isnan(_5534)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2180 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2182 = _1783 > 0.0;
    bool _2184 = isnan(_1783);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(0.0);
    bool _2190 = _2186 || _2188;
    float _2192 = _2119 + _2093;
    float _2194 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2180);
    float _2196 = exp2(_2178);
    bool _2198 = _1841 <= 0.0;
    bool _2200 = !_2190;
    bool _2202 = _2198 || _2200;
    float _2204 = _2192 * 0.5;
    float _2206 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2208 = _1783 * _1841;
    float _2210 = _2093 * 0.5;
    float _2212 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2206);
    float _2214 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2216 = fma(_2123, -0.5, _2210);
    float _2218 = _2212 + _2093;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2119;
    out.gl_Position.y = _2123;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _2093;
    float _2222 = _2218 * 0.5;
    float _2224 = -_2196;
    float _2226 = _2224 + 1.0;
    out.m_47.x = _2220;
    float _2228 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2204;
    out.m_68.y = _2216;
    out.m_68.z = _2222;
    out.m_68.w = _2093;
    float _2230 = -_2228;
    float _2232 = _2230 + 1.0;
    float _2234 = _2228 * _2151;
    float _2236 = _2162 * _2234;
    float _2238 = _2176 * _2234;
    float _2240 = fma(_2172, _2236, _2156);
    float _2242 = fma(_2174, _2236, _2158);
    float _2244 = _2162 * _2232;
    float _2246 = fma(_2162, _2238, _2160);
    out.m_70.x = _2240;
    out.m_70.y = _2242;
    out.m_70.z = _2246;
    out.m_70.w = _2244;
    if (!_2202)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2248 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2248;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1489 = false;
    bool _695 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_105);
        out.gl_Position.z = _2305;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_143);
        out.gl_Position.z = _2374;
    }
    if (_137)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    int _163 = as_type<int>(_145) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_145) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    int _173 = _171 ? (-1090519040) : 1056964608;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _183 = _179 || _181;
    bool _185 = isnan(1.0);
    bool _187 = _183 || _185;
    out.m_56.x = as_type<float>(_173);
    out.m_56.y = _177;
    float _189 = 0.0;
    float _191 = _147;
    float _193 = _177;
    if (!_187)
    {
        float _195 = _147 * _147;
        float _197 = _195 * 0.5;
        _189 = _197;
    }
    float _199 = _189;
    float _201 = _199;
    if (!_187)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_187;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _147 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _147);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_187;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _147 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _191 = _263;
    }
    float _265 = _191;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _151, _269);
    float _277 = fma(_265, _153, _271);
    float _279 = fma(_265, _155, _273);
    float _281 = fma(_275, _149, _157);
    float _283 = fma(_277, _149, _159);
    float _285 = fma(_279, _149, _161);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_58.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_89);
        float _311 = 1.0 / _309;
        float _313 = _123 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _333 = 1.0 / _319;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _343 = 1.0 / _323;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _351 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_315);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    out.m_60.w = _349;
    float _363 = 1.0 / _327;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _315 + _365;
    float _369 = _347 * _333;
    bool _371 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _373 = isnan(_315);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = _315 + _383;
    bool _387 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _389 = isnan(_315);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = 1.0 / _331;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _401;
    float _405 = _367 * _343;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _315 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _315 + _411;
    float _415 = -_397;
    float _417 = _415 + 1.0;
    float _419 = 1.0 / _337;
    float _421 = _409 * _363;
    float _423 = -_381;
    float _425 = _423 + 1.0;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _433 = _397 * _425;
    bool _435 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _437 = isnan(_315);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = 1.0 / _403;
    float _449 = _413 * _399;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _453 = _315 + _451;
    float _455 = fma(_429, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -_445;
    float _459 = _457 + 1.0;
    float _461 = 1.0 / _341;
    float _463 = _385 * _419;
    bool _465 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _467 = isnan(_315);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _453 * _447;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _481 = _315 + _479;
    float _483 = _475 * _417;
    float _485 = -_475;
    float _487 = _485 + 1.0;
    float _489 = _445 * _487;
    float _491 = _481 * _461;
    bool _493 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_315);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _505;
    float _509 = _503 * _459;
    float _511 = -_503;
    float _513 = _511 + 1.0;
    bool _515 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_315);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = fma(_507, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _529 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _531 = isnan(_315);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _361 * _513;
    float _543 = -_361;
    float _545 = _543 + 1.0;
    float _547 = -_525;
    float _549 = _547 + 1.0;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _555;
    float _559 = _525 * _545;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = _539 * _549;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = fma(_553, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _573 = fma(_563, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _575 = _455 * _565;
    float _577 = -_539;
    float _579 = _577 + 1.0;
    float _581 = fma(_569, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _583 = fma(_557, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = _527 * _565;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _595 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _597 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _599 = fma(_589, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_593, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _603;
    float _607 = fma(_571, _559, _595);
    float _609 = fma(_573, _559, _597);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _611;
    float _615 = fma(_605, _463, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _617 = fma(_581, _541, _607);
    float _619 = fma(_583, _541, _609);
    float _621 = in.m_54.x;
    float _623 = in.m_54.y;
    float _625 = fma(_613, _463, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _631 = fma(_599, _509, _617);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _637 = fma(_601, _509, _619);
    float _639 = fma(_629, _491, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _641;
    float _645 = fma(_615, _489, _631);
    float _647 = fma(_635, _491, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _649;
    float _653 = fma(_625, _489, _637);
    float _655 = fma(_643, _477, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _657 = fma(_639, _483, _645);
    float _659 = fma(_651, _477, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _661 = fma(_647, _483, _653);
    float _663 = fma(_655, _433, _657);
    float _665 = fma(_659, _433, _661);
    float _667 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[150].x, _663);
    float _669 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[150].y, _665);
    float _671 = _667 * _621;
    float _673 = _669 * _623;
    bool _675 = !_431;
    float _693;
    if (!_675)
    {
        float _677 = in.m_58.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = in.m_58.x;
    float _707 = in.m_58.y;
    float _709 = in.m_58.z;
    float _711 = in.m_58.w;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = _673 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _719 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    bool _733 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _735 = isnan(1.0);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _741 = _737 || _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _745 = 1.0 + _743;
    float _747 = _715 * _123;
    float _749 = 1.0 / _745;
    float _751 = _709 * 2.0;
    float _753 = _705 * 2.0;
    float _755 = _707 + _709;
    float _757 = _707 * 2.0;
    float _759 = exp2(_747);
    float _761 = _755 + (-1.0);
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _765 = _707 + _705;
    float _767 = floor(_751);
    float _769 = _765 + (-1.0);
    float _771 = floor(_753);
    float _773 = -_759;
    float _775 = _773 + 1.0;
    bool _777 = _767 > 0.0;
    float _779 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _781 = _767 >= 0.0;
    bool _783 = isnan(_767);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = floor(_757);
    float _793 = in.m_62.x;
    float _795 = in.m_62.y;
    float _797 = in.m_62.z;
    bool _799 = !_723;
    int _801 = _799 ? 0 : 1;
    int _803 = _789 ? 0 : 1;
    bool _805 = _771 > 0.0;
    bool _807 = _771 >= 0.0;
    bool _809 = isnan(_771);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    int _817 = abs(_801);
    int _819 = ~_803;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    bool _825 = !_727;
    int _827 = _825 ? 0 : 1;
    int _829 = _823;
    if (!_777)
    {
        int _831 = ~_803;
        int _833 = _831 + 1;
        _829 = _833;
    }
    int _835 = _829;
    int _837 = _815 ? 0 : 1;
    int _839 = abs(_827);
    float _841 = float(_817);
    float _843 = float(_835);
    int _845 = ~_837;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    if (!_805)
    {
        int _853 = ~_837;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = _841 * _843;
    bool _861 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    bool _871 = _791 > 0.0;
    float _873 = _859 * (-2.0);
    float _875 = float(_839);
    float _877 = float(_857);
    float _879 = fma(_873, _793, _793);
    float _881 = _869 ? _775 : 0.0;
    float _883 = fma(_779, _873, _779);
    bool _885 = _791 >= 0.0;
    bool _887 = isnan(_791);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = _875 * _877;
    bool _897 = !_731;
    int _899 = _897 ? 0 : 1;
    if (_741)
    {
        float _901 = _881 * _749;
        _127 = _901;
    }
    float _903 = _127;
    float _905 = _705 + (-0.5);
    int _907 = _893 ? 0 : 1;
    float _909 = _895 * (-2.0);
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].x, _879);
    int _913 = ~_907;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_763, _909, _763);
    int _921 = abs(_899);
    float _923 = fma(_909, _795, _795);
    int _925 = _917;
    if (!_871)
    {
        int _927 = ~_907;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = _707 + (-0.5);
    float _935 = float(_921);
    float _937 = fma(_883, _903, _911);
    float _939 = float(_931);
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].y, _923);
    float _943 = _709 + _705;
    float _945 = _937 * 0.15915493667125701904296875;
    bool _947 = _711 > 0.5;
    float _949 = _935 * _939;
    float _951 = fma(_919, _903, _941);
    float _953 = _943 + (-1.0);
    float _955 = _945 * 6.283185482025146484375;
    float _957 = sin(_955);
    float _959 = _949 * (-2.0);
    float _961 = _951 * 0.15915493667125701904296875;
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _965 = _709 + (-0.5);
    float _967 = fma(_959, _797, _797);
    bool _969 = _705 > 0.5;
    float _971 = fma(_963, _959, _963);
    float _973 = _945 * 6.283185482025146484375;
    float _975 = cos(_973);
    float _977 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].z, _967);
    float _979 = -_177;
    float _981 = _947 ? _979 : _177;
    float _983 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _985 = _707 > 0.5;
    float _987 = fma(_971, _903, _977);
    float _989 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _991 = _961 * 6.283185482025146484375;
    float _993 = sin(_991);
    float _995 = _987 * 0.15915493667125701904296875;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1005 = _1003 != 0;
    float _1007 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1011 = _1009 != 0;
    float _1013 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _989);
    float _1015 = _961 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1021 = _1019 != 0;
    float _1023 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _983);
    bool _1025 = _709 > 0.5;
    float _1027 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1029 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1001);
    float _1031 = _719 * _1007;
    float _1033 = _995 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = _717 * _1027;
    float _1039 = _975 * _993;
    float _1041 = _957 * _993;
    float _1043 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1023);
    bool _1045 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1047 = isnan(_703);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1059 = _703 + _1057;
    float _1061 = _995 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _957 * _1017;
    float _1067 = _975 * _1017;
    float _1069 = _1035 * _1037;
    float _1071 = _993 * _1035;
    float _1073 = _1017 * _1035;
    float _1075 = _975 * _1069;
    float _1077 = -_1037;
    float _1079 = _1063 * _1077;
    float _1081 = -_1039;
    float _1083 = fma(_1063, _1065, _1081);
    float _1085 = -_1065;
    float _1087 = fma(_1063, _1039, _1085);
    float _1089 = fma(_1063, _1067, _1041);
    float _1091 = fma(_1073, _1031, _1079);
    float _1093 = _957 * _1069;
    float _1095 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1097 = fma(_1089, _1031, _1075);
    float _1099 = fma(_1063, _1041, _1067);
    float _1101 = fma(_1083, _1031, _1093);
    float _1103 = fma(_1071, _1095, _1091);
    float _1105 = fma(_1087, _1095, _1097);
    float _1107 = fma(_1099, _1095, _1101);
    float _1109 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1013);
    float _1111 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1115 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1029);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1121 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1111);
    float _1123 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1113);
    float _1125 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1129 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1121);
    float _1131 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1123);
    float _1133 = 1.0 / _1119;
    float _1135 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1137 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1147 = _1125 + _1135;
    float _1149 = _1127 + _1137;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1157 = isnan(_703);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1147 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1149 + _1171;
    float _1175 = 1.0 / _1153;
    bool _1177 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1179 = isnan(_703);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _1169 * _1169;
    float _1191 = _1173 * _1173;
    float _1193 = _1141 * _1133;
    float _1195 = -_1165;
    float _1197 = _1195 + 1.0;
    float _1199 = -_1187;
    float _1201 = _1199 + 1.0;
    float _1203 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1205 = 1.0 / _1145;
    float _1207 = _1189 + _1191;
    float _1209 = _1055 * _1197;
    float _1211 = fma(_1193, _1059, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1213 = sqrt(_1207);
    float _1215 = -_1055;
    float _1217 = _1215 + 1.0;
    bool _1219 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1221 = isnan(_703);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = _1187 * _1217;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1237 = _1229 * _1201;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1241;
    float _1245 = _1235 * _1175;
    float _1247 = _1211 * _1237;
    float _1249 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1203);
    float _1251 = -_177;
    int _1253 = _985 ? as_type<int>(_1251) : as_type<int>(_177);
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1257 = _703 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1261 = _703 + _1259;
    bool _1263 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1269 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1271 = -_1229;
    float _1273 = _1271 + 1.0;
    float _1275 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1277 = _1243 * _1205;
    float _1279 = fma(_1245, _1257, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1247);
    float _1283 = _1269 + _1275;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1287 = !_1005;
    float _1289 = _1287 ? _177 : as_type<float>(_1253);
    float _1291 = fma(_1277, _1261, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1293 = !_1021;
    float _1295 = _1293 ? _177 : _981;
    float _1297 = fma(_1279, _1231, _1281);
    float _1299 = _981;
    float _1301 = _1261;
    float _1303 = _1189;
    float _1305 = _1191;
    if (!_1263)
    {
        _1299 = _1147;
    }
    float _1307 = _1299;
    float _1309 = _1307;
    if (!_1263)
    {
        _193 = _1149;
    }
    float _1311 = _193;
    float _1313 = _1311;
    if (!_1263)
    {
        _1301 = _1283;
    }
    float _1315 = _1301;
    bool _1317 = !_1263;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1213 + _1323;
        float _1327 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1207);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = fma(_1337, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1345 = _1329 * _1343;
        float _1347 = fma(_1169, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1349 = _1341 + (-1.0);
        float _1351 = fma(_1173, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1355 = _1347 + _1353;
        float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1361 = _1351 + _1359;
        float _1363 = _1355 * _1355;
        float _1365 = fma(_1283, _1341, _1357);
        float _1367 = _1361 * _1361;
        _1319 = _1365;
        _1303 = _1363;
        _1305 = _1367;
        _1313 = _1351;
        _1309 = _1347;
    }
    float _1369 = _1319;
    float _1371 = _1303;
    float _1373 = _1305;
    float _1375 = _1313;
    float _1377 = _1309;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1381 = _1369 + _1379;
    float _1383 = fma(_1291, _1209, _1297);
    float _1385 = -as_type<float>(_173);
    int _1387 = _969 ? as_type<int>(_1385) : _173;
    float _1389 = -_1289;
    float _1391 = _1389 + 0.5;
    float _1393 = -as_type<float>(_173);
    int _1395 = _1025 ? as_type<int>(_1393) : _173;
    float _1397 = fma(_1381, _1381, _1371);
    bool _1399 = !_999;
    float _1401 = _1399 ? as_type<float>(_173) : as_type<float>(_1387);
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1405 = !_1011;
    float _1407 = _1405 ? as_type<float>(_173) : as_type<float>(_1395);
    float _1409 = _1397 + _1373;
    float _1411 = -_1295;
    float _1413 = _1411 + 0.5;
    float _1415 = _1401 + 0.5;
    float _1417 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1383);
    float _1419 = _1407 + 0.5;
    float _1421 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1423 = sqrt(_1409);
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1431 = _1421 * _1267;
    float _1433 = _1425 * _1239;
    float _1435 = _1427 * _1285;
    float _1437 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1439 = _1429 * _1403;
    out.m_64.w = _1437;
    out.m_66.x = _1433;
    out.m_66.y = _1431;
    out.m_66.z = _1435;
    out.m_66.w = _1439;
    bool _1441 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1443 = isnan(_1423);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1449 = _1445 || _1447;
    float _1451 = _1421;
    float _1453 = _1377;
    if (!_1449)
    {
        _1451 = 1.0;
    }
    float _1455 = _1451;
    bool _1457 = !_1449;
    float _1459 = _1455;
    if (!_1457)
    {
        bool _1461 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1463 = isnan(_1423);
        bool _1465 = _1461 || _1463;
        bool _1467 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1469 = _1465 || _1467;
        if (!_1469)
        {
            float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1473 = _1423 + _1471;
            float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1477 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1475;
            float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1483 = 1.0 / _1477;
            float _1485 = _1473 * _1483;
            float _1487 = fma(_1485, _1481, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1459 = _1487;
            _1489 = true;
        }
        else
        {
            bool _1491 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1493 = isnan(_1423);
            bool _1495 = _1491 || _1493;
            bool _1497 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1499 = _1495 || _1497;
            if (!_1499)
            {
                float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1503 = _1423 + _1501;
                float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1507 = _1505 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1511 = _1509 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1513 = 1.0 / _1507;
                float _1515 = _1503 * _1513;
                float _1517 = fma(_1515, _1511, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1459 = _1517;
                _1489 = true;
            }
            else
            {
                _1459 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1489 = false;
    float _1519 = _1459;
    float _1521 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1525 = _1375 + _1523;
    float _1527 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1521);
    float _1529 = fma(_1525, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1527);
    float _1543 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1545 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan(0.5);
    bool _1553 = _1549 || _1551;
    float _1555 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1557 = _1369 + _1555;
    float _1559 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1561 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1543);
    float _1563 = fma(_1557, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1565 = 1.0 / _1559;
    float _1567 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1561);
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1571 = _1569 + _1559;
    float _1573 = _1571 * _1565;
    float _1575 = _1573 * 0.5;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
    float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1583 = _1377 + _1581;
    float _1585 = 1.0 / _1579;
    float _1587 = fma(_1583, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1589 = _1519;
    float _1591 = _1583;
    float _1593 = _1579;
    float _1595 = _1563;
    float _1597 = _1525;
    if (_1553)
    {
        _1589 = 1.0;
    }
    float _1599 = _1589;
    float _1601 = _1599;
    if (_1539)
    {
        _1591 = _1529;
    }
    float _1603 = _1591;
    float _1605 = _1603;
    if (_1539)
    {
        _1453 = _1587;
    }
    float _1607 = _1453;
    float _1609 = _1607;
    if (!_1539)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1613 = _1269 + _1611;
        float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1617 = _1125 + _1615;
        float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1621 = -_1125;
        float _1623 = _1621 + _1587;
        float _1625 = _1613 * _1613;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1629 = _1127 + _1627;
        float _1631 = -_1269;
        float _1633 = _1631 + _1563;
        float _1635 = -_1127;
        float _1637 = _1635 + _1529;
        float _1639 = fma(_1617, _1617, _1625);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1643 = fma(_1629, _1629, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1649 = _1645 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1651 = isnan(_1645);
        bool _1653 = _1649 || _1651;
        bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1657 = _1653 || _1655;
        float _1659 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1619;
        float _1663 = _1647 * _1661;
        float _1665 = _1579;
        float _1667 = _1659;
        float _1669 = _1645;
        _1597 = _1647;
        if (_1657)
        {
            float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1665 = _1671;
        }
        float _1673 = _1665;
        if (_1657)
        {
            float _1675 = precise::max(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1667 = _1675;
        }
        float _1677 = _1667;
        float _1679 = fma(_1623, _1663, _1125);
        float _1681 = fma(_1633, _1663, _1269);
        float _1683 = _1679;
        float _1685 = _1681;
        _1593 = _1673;
        if (_1657)
        {
            float _1687 = _1677 * _1673;
            _1669 = _1687;
        }
        float _1689 = _1669;
        float _1691 = fma(_1637, _1663, _1127);
        float _1693 = _1689;
        _1605 = _1691;
        if (_1657)
        {
            float _1695 = _1647 * _1689;
            _1693 = _1695;
        }
        float _1697 = _1693;
        if (_1657)
        {
            float _1699 = fma(_1623, _1697, _1125);
            _1683 = _1699;
        }
        float _1701 = _1683;
        _1609 = _1701;
        if (_1657)
        {
            float _1703 = fma(_1633, _1697, _1269);
            _1685 = _1703;
        }
        float _1705 = _1685;
        _1595 = _1705;
        if (_1657)
        {
            float _1707 = fma(_1637, _1697, _1127);
            _1605 = _1707;
        }
    }
    float _1709 = _1593;
    float _1711 = _1595;
    float _1713 = _1609;
    float _1715 = _1605;
    float _1717 = _1597;
    float _1719 = _1717;
    float _1721 = _1709;
    if (_1553)
    {
        _1719 = 1.0;
    }
    float _1723 = _1719;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1727 = _1585 * _1725;
    float _1729 = _1723;
    float _1731 = _1727;
    if (!_1553)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1763 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1761;
        float _1765 = _1753 * _1755;
        float _1767 = 1.0 / _1763;
        float _1769 = 1.0 / _1765;
        float _1771 = _1759 * _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1727, _1771, _1773);
        float _1777 = _1775 * _1767;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1721 = _1743;
        _1601 = _1779;
    }
    float _1781 = _1721;
    float _1783 = _1601;
    float _1785 = _1781;
    if (!_1553)
    {
        float _1787 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1789 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1797 = _1795 * 0.15915493667125701904296875;
        float _1799 = _1789 * 6.283185482025146484375;
        float _1801 = sin(_1799);
        float _1803 = 1.0 / _1793;
        float _1805 = _1797 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = _1797 * 6.283185482025146484375;
        float _1813 = sin(_1811);
        float _1815 = _1807 * _1809;
        float _1817 = 1.0 / _1815;
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1821 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1819;
        float _1823 = 1.0 / _1821;
        float _1825 = _1813 * _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1829 = fma(_1727, _1825, _1827);
        float _1831 = _1829 * _1823;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = -_1833;
        float _1837 = _1835 + 1.0;
        _1785 = _1803;
        _1729 = _1837;
    }
    float _1839 = _1785;
    float _1841 = _1729;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1845 = _1711 + _1843;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1849 = _1713 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1715 + _1851;
    float _1855 = _1845 * _1845;
    float _1857 = fma(_1849, _1849, _1855);
    float _1859 = fma(_1853, _1853, _1857);
    float _1861 = rsqrt(_1859);
    float _1863 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1865 = _1849 * _1863;
    float _1867 = _1853 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    bool _1877 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = _1875 + _1879;
    float _1883 = _1861;
    float _1885 = _1873;
    float _1887 = _1881;
    float _1889 = _1845;
    float _1891 = _1863;
    float _1893 = _1865;
    if (_1877)
    {
        float _1895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1877)
    {
        float _1899 = rsqrt(_1873);
        _1885 = _1899;
    }
    float _1901 = _1885;
    if (_1877)
    {
        float _1903 = _1881 * _1897;
        _1887 = _1903;
    }
    float _1905 = _1887;
    if (_1877)
    {
        float _1907 = _1905 * 0.15915493667125701904296875;
        _1731 = _1907;
    }
    float _1909 = _1731;
    float _1911 = _1839;
    float _1913 = _1909;
    if (_1877)
    {
        float _1915 = _1909 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        _1911 = _1917;
    }
    float _1919 = _1911;
    float _1921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1923 = precise::max(0.0, _1921);
    float _1925 = _1853;
    float _1927 = _1923;
    float _1929 = _1921;
    if (_1877)
    {
        float _1931 = _1909 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        _1925 = _1933;
    }
    float _1935 = _1925;
    float _1937 = -_1863;
    float _1939 = -_1923;
    float _1941 = fma(_1845, _1937, _1939);
    if (!_1877)
    {
        _1889 = _1867;
    }
    float _1943 = _1889;
    float _1945 = _1943;
    if (_1877)
    {
        float _1947 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1949;
    if (_1877)
    {
        float _1953 = fma(_1919, _1949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1951 = _1953;
    }
    float _1955 = _1951;
    float _1957 = sqrt(_1859);
    float _1959 = _1955;
    float _1961 = _1935;
    if (_1877)
    {
        float _1963 = _1935 + (-1.0);
        _1929 = _1963;
    }
    float _1965 = _1929;
    float _1967 = _1965;
    if (_1877)
    {
        float _1969 = _1901 * _1955;
        _1891 = _1969;
    }
    float _1971 = _1891;
    if (!_1877)
    {
        _1959 = _1941;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1877)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1913 = _1977;
    }
    float _1979 = _1913;
    if (_1877)
    {
        float _1981 = _1865 * _1971;
        _1893 = _1981;
    }
    float _1983 = _1893;
    if (!_1877)
    {
        _1967 = _1869;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1877)
    {
        float _1989 = _1867 * _1971;
        _1945 = _1989;
    }
    float _1991 = _1945;
    if (_1877)
    {
        float _1993 = fma(_1941, _1935, _1979);
        _1975 = _1993;
    }
    float _1995 = _1975;
    if (_1877)
    {
        float _1997 = _1983 * _1983;
        _1987 = _1997;
    }
    float _1999 = _1987;
    if (!_1877)
    {
        _1961 = _1871;
    }
    float _2001 = _1961;
    float _2003 = _2001;
    if (_1877)
    {
        float _2005 = _1991 * _1991;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = fma(_1995, _1995, _1999);
    float _2011 = _2009 + _2007;
    float _2013 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2017 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2023 = rsqrt(_2011);
    float _2025 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2013);
    float _2027 = -_2019;
    float _2029 = _2027 + 1.0;
    float _2031 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2033 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2021);
    float _2035 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2037 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2025);
    float _2039 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2031);
    float _2041 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2043 = abs(_2029);
    float _2045 = log2(_2043);
    float _2047 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2035);
    float _2049 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2039);
    float _2051 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2053 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2057 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2059 = _2023 * _1983;
    float _2061 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = _2023 * _1995;
    float _2065 = _2023 * _1991;
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2073 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2075 = -_2067;
    float _2077 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2075);
    float _2079 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2069);
    float _2083 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2065;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2077);
    float _2089 = -_2073;
    float _2091 = fma(_2089, _2071, 1.0);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2081);
    float _2095 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2097 = fma(_2087, -0.5, 0.5);
    float _2099 = exp2(_2083);
    float _2101 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2103 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2095);
    float _2105 = fma(_2087, 0.5, 0.5);
    float _2107 = _2063 + 1.0;
    float _2109 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2101);
    float _2111 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2103);
    float _2113 = fma(_2105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2115 = log2(_2091);
    float _2117 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2109);
    float _2119 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2111);
    float _2121 = fma(_2105, _2113, -0.212114393711090087890625);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2117);
    float _2125 = fma(_2105, _2121, 1.570728778839111328125);
    float _2127 = 1.0 / _2093;
    float _2129 = -_2063;
    float _2131 = fma(_2099, _2107, _2129);
    float _2133 = fma(_2131, 0.5, 0.5);
    float _2135 = sqrt(_2097);
    float _2137 = _2115 * 0.693147182464599609375;
    float _2139 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2141 = _2119 * _2127;
    float _2143 = _2123 * _2127;
    float _2145 = fma(_2141, 0.5, 0.5);
    float _2147 = fma(_2143, -0.5, 0.5);
    float _2149 = _2135 * 0.636619746685028076171875;
    float3 _5501 = float3(_2145, _2147, _2139);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5501, float3(0.0), isnan(_5501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5501, float3(0.0), isnan(_5501)), level(0.0)).x;
    float3 _5512 = float3(_2145, _2147, _2139);
    float4 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5512, float3(0.0), isnan(_5512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5512, float3(0.0), isnan(_5512)), level(0.0)).xyzw;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = _2154.w;
    float _2164 = -_2125;
    float _2166 = fma(_2149, _2164, 1.0);
    float2 _5534 = float2(_2166, _2133);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5534, float2(0.0), isnan(_5534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5534, float2(0.0), isnan(_5534)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2180 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2182 = _1783 > 0.0;
    bool _2184 = isnan(_1783);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(0.0);
    bool _2190 = _2186 || _2188;
    float _2192 = _2119 + _2093;
    float _2194 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2180);
    float _2196 = exp2(_2178);
    bool _2198 = _1841 <= 0.0;
    bool _2200 = !_2190;
    bool _2202 = _2198 || _2200;
    float _2204 = _2192 * 0.5;
    float _2206 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2208 = _1783 * _1841;
    float _2210 = _2093 * 0.5;
    float _2212 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2206);
    float _2214 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2216 = fma(_2123, -0.5, _2210);
    float _2218 = _2212 + _2093;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2119;
    out.gl_Position.y = _2123;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _2093;
    float _2222 = _2218 * 0.5;
    float _2224 = -_2196;
    float _2226 = _2224 + 1.0;
    out.m_47.x = _2220;
    float _2228 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2204;
    out.m_68.y = _2216;
    out.m_68.z = _2222;
    out.m_68.w = _2093;
    float _2230 = -_2228;
    float _2232 = _2230 + 1.0;
    float _2234 = _2228 * _2151;
    float _2236 = _2162 * _2234;
    float _2238 = _2176 * _2234;
    float _2240 = fma(_2172, _2236, _2156);
    float _2242 = fma(_2174, _2236, _2158);
    float _2244 = _2162 * _2232;
    float _2246 = fma(_2162, _2238, _2160);
    out.m_70.x = _2240;
    out.m_70.y = _2242;
    out.m_70.z = _2246;
    out.m_70.w = _2244;
    if (!_2202)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2248 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2248;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1489 = false;
    bool _695 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_105);
        out.gl_Position.z = _2305;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_143);
        out.gl_Position.z = _2374;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    int _163 = as_type<int>(_145) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_145) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    int _173 = _171 ? (-1090519040) : 1056964608;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _183 = _179 || _181;
    bool _185 = isnan(1.0);
    bool _187 = _183 || _185;
    out.m_56.x = as_type<float>(_173);
    out.m_56.y = _177;
    float _189 = 0.0;
    float _191 = _147;
    float _193 = _177;
    if (!_187)
    {
        float _195 = _147 * _147;
        float _197 = _195 * 0.5;
        _189 = _197;
    }
    float _199 = _189;
    float _201 = _199;
    if (!_187)
    {
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_187;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _147 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _147);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_187;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _147 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _191 = _263;
    }
    float _265 = _191;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _151, _269);
    float _277 = fma(_265, _153, _271);
    float _279 = fma(_265, _155, _273);
    float _281 = fma(_275, _149, _157);
    float _283 = fma(_277, _149, _159);
    float _285 = fma(_279, _149, _161);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_58.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_89);
        float _311 = 1.0 / _309;
        float _313 = _123 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _333 = 1.0 / _319;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _343 = 1.0 / _323;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _351 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_315);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    out.m_60.w = _349;
    float _363 = 1.0 / _327;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _315 + _365;
    float _369 = _347 * _333;
    bool _371 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _373 = isnan(_315);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = _315 + _383;
    bool _387 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _389 = isnan(_315);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = 1.0 / _331;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _401;
    float _405 = _367 * _343;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _315 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _315 + _411;
    float _415 = -_397;
    float _417 = _415 + 1.0;
    float _419 = 1.0 / _337;
    float _421 = _409 * _363;
    float _423 = -_381;
    float _425 = _423 + 1.0;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _433 = _397 * _425;
    bool _435 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _437 = isnan(_315);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = 1.0 / _403;
    float _449 = _413 * _399;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _453 = _315 + _451;
    float _455 = fma(_429, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = -_445;
    float _459 = _457 + 1.0;
    float _461 = 1.0 / _341;
    float _463 = _385 * _419;
    bool _465 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _467 = isnan(_315);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _453 * _447;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _481 = _315 + _479;
    float _483 = _475 * _417;
    float _485 = -_475;
    float _487 = _485 + 1.0;
    float _489 = _445 * _487;
    float _491 = _481 * _461;
    bool _493 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _495 = isnan(_315);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _505;
    float _509 = _503 * _459;
    float _511 = -_503;
    float _513 = _511 + 1.0;
    bool _515 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_315);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = fma(_507, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _529 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _531 = isnan(_315);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _361 * _513;
    float _543 = -_361;
    float _545 = _543 + 1.0;
    float _547 = -_525;
    float _549 = _547 + 1.0;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _555;
    float _559 = _525 * _545;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = _539 * _549;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = fma(_553, _405, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _573 = fma(_563, _405, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _575 = _455 * _565;
    float _577 = -_539;
    float _579 = _577 + 1.0;
    float _581 = fma(_569, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _583 = fma(_557, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = _527 * _565;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _595 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _597 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _599 = fma(_589, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _601 = fma(_593, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _603;
    float _607 = fma(_571, _559, _595);
    float _609 = fma(_573, _559, _597);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _611;
    float _615 = fma(_605, _463, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _617 = fma(_581, _541, _607);
    float _619 = fma(_583, _541, _609);
    float _621 = in.m_54.x;
    float _623 = in.m_54.y;
    float _625 = fma(_613, _463, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _631 = fma(_599, _509, _617);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _637 = fma(_601, _509, _619);
    float _639 = fma(_629, _491, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _641;
    float _645 = fma(_615, _489, _631);
    float _647 = fma(_635, _491, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _649;
    float _653 = fma(_625, _489, _637);
    float _655 = fma(_643, _477, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _657 = fma(_639, _483, _645);
    float _659 = fma(_651, _477, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _661 = fma(_647, _483, _653);
    float _663 = fma(_655, _433, _657);
    float _665 = fma(_659, _433, _661);
    float _667 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[150].x, _663);
    float _669 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[150].y, _665);
    float _671 = _667 * _621;
    float _673 = _669 * _623;
    bool _675 = !_431;
    float _693;
    if (!_675)
    {
        float _677 = in.m_58.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = in.m_58.x;
    float _707 = in.m_58.y;
    float _709 = in.m_58.z;
    float _711 = in.m_58.w;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = _673 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _719 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    bool _733 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _735 = isnan(1.0);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _741 = _737 || _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _745 = 1.0 + _743;
    float _747 = _715 * _123;
    float _749 = 1.0 / _745;
    float _751 = _709 * 2.0;
    float _753 = _705 * 2.0;
    float _755 = _707 + _709;
    float _757 = _707 * 2.0;
    float _759 = exp2(_747);
    float _761 = _755 + (-1.0);
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _765 = _707 + _705;
    float _767 = floor(_751);
    float _769 = _765 + (-1.0);
    float _771 = floor(_753);
    float _773 = -_759;
    float _775 = _773 + 1.0;
    bool _777 = _767 > 0.0;
    float _779 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _781 = _767 >= 0.0;
    bool _783 = isnan(_767);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = floor(_757);
    float _793 = in.m_62.x;
    float _795 = in.m_62.y;
    float _797 = in.m_62.z;
    bool _799 = !_723;
    int _801 = _799 ? 0 : 1;
    int _803 = _789 ? 0 : 1;
    bool _805 = _771 > 0.0;
    bool _807 = _771 >= 0.0;
    bool _809 = isnan(_771);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    int _817 = abs(_801);
    int _819 = ~_803;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    bool _825 = !_727;
    int _827 = _825 ? 0 : 1;
    int _829 = _823;
    if (!_777)
    {
        int _831 = ~_803;
        int _833 = _831 + 1;
        _829 = _833;
    }
    int _835 = _829;
    int _837 = _815 ? 0 : 1;
    int _839 = abs(_827);
    float _841 = float(_817);
    float _843 = float(_835);
    int _845 = ~_837;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    int _851 = _849;
    if (!_805)
    {
        int _853 = ~_837;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = _841 * _843;
    bool _861 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    bool _871 = _791 > 0.0;
    float _873 = _859 * (-2.0);
    float _875 = float(_839);
    float _877 = float(_857);
    float _879 = fma(_873, _793, _793);
    float _881 = _869 ? _775 : 0.0;
    float _883 = fma(_779, _873, _779);
    bool _885 = _791 >= 0.0;
    bool _887 = isnan(_791);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = _875 * _877;
    bool _897 = !_731;
    int _899 = _897 ? 0 : 1;
    if (_741)
    {
        float _901 = _881 * _749;
        _127 = _901;
    }
    float _903 = _127;
    float _905 = _705 + (-0.5);
    int _907 = _893 ? 0 : 1;
    float _909 = _895 * (-2.0);
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].x, _879);
    int _913 = ~_907;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_763, _909, _763);
    int _921 = abs(_899);
    float _923 = fma(_909, _795, _795);
    int _925 = _917;
    if (!_871)
    {
        int _927 = ~_907;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = _707 + (-0.5);
    float _935 = float(_921);
    float _937 = fma(_883, _903, _911);
    float _939 = float(_931);
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].y, _923);
    float _943 = _709 + _705;
    float _945 = _937 * 0.15915493667125701904296875;
    bool _947 = _711 > 0.5;
    float _949 = _935 * _939;
    float _951 = fma(_919, _903, _941);
    float _953 = _943 + (-1.0);
    float _955 = _945 * 6.283185482025146484375;
    float _957 = sin(_955);
    float _959 = _949 * (-2.0);
    float _961 = _951 * 0.15915493667125701904296875;
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _965 = _709 + (-0.5);
    float _967 = fma(_959, _797, _797);
    bool _969 = _705 > 0.5;
    float _971 = fma(_963, _959, _963);
    float _973 = _945 * 6.283185482025146484375;
    float _975 = cos(_973);
    float _977 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].z, _967);
    float _979 = -_177;
    float _981 = _947 ? _979 : _177;
    float _983 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _985 = _707 > 0.5;
    float _987 = fma(_971, _903, _977);
    float _989 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _991 = _961 * 6.283185482025146484375;
    float _993 = sin(_991);
    float _995 = _987 * 0.15915493667125701904296875;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1005 = _1003 != 0;
    float _1007 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1011 = _1009 != 0;
    float _1013 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _989);
    float _1015 = _961 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1021 = _1019 != 0;
    float _1023 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _983);
    bool _1025 = _709 > 0.5;
    float _1027 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1029 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1001);
    float _1031 = _719 * _1007;
    float _1033 = _995 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = _717 * _1027;
    float _1039 = _975 * _993;
    float _1041 = _957 * _993;
    float _1043 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1023);
    bool _1045 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1047 = isnan(_703);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1059 = _703 + _1057;
    float _1061 = _995 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _957 * _1017;
    float _1067 = _975 * _1017;
    float _1069 = _1035 * _1037;
    float _1071 = _993 * _1035;
    float _1073 = _1017 * _1035;
    float _1075 = _975 * _1069;
    float _1077 = -_1037;
    float _1079 = _1063 * _1077;
    float _1081 = -_1039;
    float _1083 = fma(_1063, _1065, _1081);
    float _1085 = -_1065;
    float _1087 = fma(_1063, _1039, _1085);
    float _1089 = fma(_1063, _1067, _1041);
    float _1091 = fma(_1073, _1031, _1079);
    float _1093 = _957 * _1069;
    float _1095 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1097 = fma(_1089, _1031, _1075);
    float _1099 = fma(_1063, _1041, _1067);
    float _1101 = fma(_1083, _1031, _1093);
    float _1103 = fma(_1071, _1095, _1091);
    float _1105 = fma(_1087, _1095, _1097);
    float _1107 = fma(_1099, _1095, _1101);
    float _1109 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1013);
    float _1111 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1115 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1029);
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1121 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1111);
    float _1123 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1113);
    float _1125 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1127 = _1115 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1129 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1121);
    float _1131 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1123);
    float _1133 = 1.0 / _1119;
    float _1135 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1137 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1147 = _1125 + _1135;
    float _1149 = _1127 + _1137;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1157 = isnan(_703);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1147 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1149 + _1171;
    float _1175 = 1.0 / _1153;
    bool _1177 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1179 = isnan(_703);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _1169 * _1169;
    float _1191 = _1173 * _1173;
    float _1193 = _1141 * _1133;
    float _1195 = -_1165;
    float _1197 = _1195 + 1.0;
    float _1199 = -_1187;
    float _1201 = _1199 + 1.0;
    float _1203 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1205 = 1.0 / _1145;
    float _1207 = _1189 + _1191;
    float _1209 = _1055 * _1197;
    float _1211 = fma(_1193, _1059, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1213 = sqrt(_1207);
    float _1215 = -_1055;
    float _1217 = _1215 + 1.0;
    bool _1219 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1221 = isnan(_703);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = _1187 * _1217;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1237 = _1229 * _1201;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1241;
    float _1245 = _1235 * _1175;
    float _1247 = _1211 * _1237;
    float _1249 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1203);
    float _1251 = -_177;
    int _1253 = _985 ? as_type<int>(_1251) : as_type<int>(_177);
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1257 = _703 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1261 = _703 + _1259;
    bool _1263 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1249);
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1269 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1271 = -_1229;
    float _1273 = _1271 + 1.0;
    float _1275 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1277 = _1243 * _1205;
    float _1279 = fma(_1245, _1257, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1247);
    float _1283 = _1269 + _1275;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1287 = !_1005;
    float _1289 = _1287 ? _177 : as_type<float>(_1253);
    float _1291 = fma(_1277, _1261, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1293 = !_1021;
    float _1295 = _1293 ? _177 : _981;
    float _1297 = fma(_1279, _1231, _1281);
    float _1299 = _981;
    float _1301 = _1261;
    float _1303 = _1189;
    float _1305 = _1191;
    if (!_1263)
    {
        _1299 = _1147;
    }
    float _1307 = _1299;
    float _1309 = _1307;
    if (!_1263)
    {
        _193 = _1149;
    }
    float _1311 = _193;
    float _1313 = _1311;
    if (!_1263)
    {
        _1301 = _1283;
    }
    float _1315 = _1301;
    bool _1317 = !_1263;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1213 + _1323;
        float _1327 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1207);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = fma(_1337, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1345 = _1329 * _1343;
        float _1347 = fma(_1169, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1349 = _1341 + (-1.0);
        float _1351 = fma(_1173, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1355 = _1347 + _1353;
        float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1361 = _1351 + _1359;
        float _1363 = _1355 * _1355;
        float _1365 = fma(_1283, _1341, _1357);
        float _1367 = _1361 * _1361;
        _1319 = _1365;
        _1303 = _1363;
        _1305 = _1367;
        _1313 = _1351;
        _1309 = _1347;
    }
    float _1369 = _1319;
    float _1371 = _1303;
    float _1373 = _1305;
    float _1375 = _1313;
    float _1377 = _1309;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1381 = _1369 + _1379;
    float _1383 = fma(_1291, _1209, _1297);
    float _1385 = -as_type<float>(_173);
    int _1387 = _969 ? as_type<int>(_1385) : _173;
    float _1389 = -_1289;
    float _1391 = _1389 + 0.5;
    float _1393 = -as_type<float>(_173);
    int _1395 = _1025 ? as_type<int>(_1393) : _173;
    float _1397 = fma(_1381, _1381, _1371);
    bool _1399 = !_999;
    float _1401 = _1399 ? as_type<float>(_173) : as_type<float>(_1387);
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1405 = !_1011;
    float _1407 = _1405 ? as_type<float>(_173) : as_type<float>(_1395);
    float _1409 = _1397 + _1373;
    float _1411 = -_1295;
    float _1413 = _1411 + 0.5;
    float _1415 = _1401 + 0.5;
    float _1417 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1383);
    float _1419 = _1407 + 0.5;
    float _1421 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1423 = sqrt(_1409);
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1431 = _1421 * _1267;
    float _1433 = _1425 * _1239;
    float _1435 = _1427 * _1285;
    float _1437 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1439 = _1429 * _1403;
    out.m_64.w = _1437;
    out.m_66.x = _1433;
    out.m_66.y = _1431;
    out.m_66.z = _1435;
    out.m_66.w = _1439;
    bool _1441 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1443 = isnan(_1423);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1449 = _1445 || _1447;
    float _1451 = _1421;
    float _1453 = _1377;
    if (!_1449)
    {
        _1451 = 1.0;
    }
    float _1455 = _1451;
    bool _1457 = !_1449;
    float _1459 = _1455;
    if (!_1457)
    {
        bool _1461 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1463 = isnan(_1423);
        bool _1465 = _1461 || _1463;
        bool _1467 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1469 = _1465 || _1467;
        if (!_1469)
        {
            float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1473 = _1423 + _1471;
            float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1477 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1475;
            float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1483 = 1.0 / _1477;
            float _1485 = _1473 * _1483;
            float _1487 = fma(_1485, _1481, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1459 = _1487;
            _1489 = true;
        }
        else
        {
            bool _1491 = _1423 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1493 = isnan(_1423);
            bool _1495 = _1491 || _1493;
            bool _1497 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1499 = _1495 || _1497;
            if (!_1499)
            {
                float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1503 = _1423 + _1501;
                float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1507 = _1505 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1511 = _1509 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1513 = 1.0 / _1507;
                float _1515 = _1503 * _1513;
                float _1517 = fma(_1515, _1511, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1459 = _1517;
                _1489 = true;
            }
            else
            {
                _1459 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1489 = false;
    float _1519 = _1459;
    float _1521 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1525 = _1375 + _1523;
    float _1527 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1521);
    float _1529 = fma(_1525, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1527);
    float _1543 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1545 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan(0.5);
    bool _1553 = _1549 || _1551;
    float _1555 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1557 = _1369 + _1555;
    float _1559 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1561 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1543);
    float _1563 = fma(_1557, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1565 = 1.0 / _1559;
    float _1567 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1561);
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1571 = _1569 + _1559;
    float _1573 = _1571 * _1565;
    float _1575 = _1573 * 0.5;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
    float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1583 = _1377 + _1581;
    float _1585 = 1.0 / _1579;
    float _1587 = fma(_1583, _1519, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1589 = _1519;
    float _1591 = _1583;
    float _1593 = _1579;
    float _1595 = _1563;
    float _1597 = _1525;
    if (_1553)
    {
        _1589 = 1.0;
    }
    float _1599 = _1589;
    float _1601 = _1599;
    if (_1539)
    {
        _1591 = _1529;
    }
    float _1603 = _1591;
    float _1605 = _1603;
    if (_1539)
    {
        _1453 = _1587;
    }
    float _1607 = _1453;
    float _1609 = _1607;
    if (!_1539)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1613 = _1269 + _1611;
        float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1617 = _1125 + _1615;
        float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1621 = -_1125;
        float _1623 = _1621 + _1587;
        float _1625 = _1613 * _1613;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1629 = _1127 + _1627;
        float _1631 = -_1269;
        float _1633 = _1631 + _1563;
        float _1635 = -_1127;
        float _1637 = _1635 + _1529;
        float _1639 = fma(_1617, _1617, _1625);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1643 = fma(_1629, _1629, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1649 = _1645 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1651 = isnan(_1645);
        bool _1653 = _1649 || _1651;
        bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1657 = _1653 || _1655;
        float _1659 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1619;
        float _1663 = _1647 * _1661;
        float _1665 = _1579;
        float _1667 = _1659;
        float _1669 = _1645;
        _1597 = _1647;
        if (_1657)
        {
            float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1665 = _1671;
        }
        float _1673 = _1665;
        if (_1657)
        {
            float _1675 = precise::max(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1667 = _1675;
        }
        float _1677 = _1667;
        float _1679 = fma(_1623, _1663, _1125);
        float _1681 = fma(_1633, _1663, _1269);
        float _1683 = _1679;
        float _1685 = _1681;
        _1593 = _1673;
        if (_1657)
        {
            float _1687 = _1677 * _1673;
            _1669 = _1687;
        }
        float _1689 = _1669;
        float _1691 = fma(_1637, _1663, _1127);
        float _1693 = _1689;
        _1605 = _1691;
        if (_1657)
        {
            float _1695 = _1647 * _1689;
            _1693 = _1695;
        }
        float _1697 = _1693;
        if (_1657)
        {
            float _1699 = fma(_1623, _1697, _1125);
            _1683 = _1699;
        }
        float _1701 = _1683;
        _1609 = _1701;
        if (_1657)
        {
            float _1703 = fma(_1633, _1697, _1269);
            _1685 = _1703;
        }
        float _1705 = _1685;
        _1595 = _1705;
        if (_1657)
        {
            float _1707 = fma(_1637, _1697, _1127);
            _1605 = _1707;
        }
    }
    float _1709 = _1593;
    float _1711 = _1595;
    float _1713 = _1609;
    float _1715 = _1605;
    float _1717 = _1597;
    float _1719 = _1717;
    float _1721 = _1709;
    if (_1553)
    {
        _1719 = 1.0;
    }
    float _1723 = _1719;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1727 = _1585 * _1725;
    float _1729 = _1723;
    float _1731 = _1727;
    if (!_1553)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1763 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1761;
        float _1765 = _1753 * _1755;
        float _1767 = 1.0 / _1763;
        float _1769 = 1.0 / _1765;
        float _1771 = _1759 * _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1727, _1771, _1773);
        float _1777 = _1775 * _1767;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1721 = _1743;
        _1601 = _1779;
    }
    float _1781 = _1721;
    float _1783 = _1601;
    float _1785 = _1781;
    if (!_1553)
    {
        float _1787 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1789 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1797 = _1795 * 0.15915493667125701904296875;
        float _1799 = _1789 * 6.283185482025146484375;
        float _1801 = sin(_1799);
        float _1803 = 1.0 / _1793;
        float _1805 = _1797 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = _1797 * 6.283185482025146484375;
        float _1813 = sin(_1811);
        float _1815 = _1807 * _1809;
        float _1817 = 1.0 / _1815;
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1821 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1819;
        float _1823 = 1.0 / _1821;
        float _1825 = _1813 * _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1829 = fma(_1727, _1825, _1827);
        float _1831 = _1829 * _1823;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = -_1833;
        float _1837 = _1835 + 1.0;
        _1785 = _1803;
        _1729 = _1837;
    }
    float _1839 = _1785;
    float _1841 = _1729;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1845 = _1711 + _1843;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1849 = _1713 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1715 + _1851;
    float _1855 = _1845 * _1845;
    float _1857 = fma(_1849, _1849, _1855);
    float _1859 = fma(_1853, _1853, _1857);
    float _1861 = rsqrt(_1859);
    float _1863 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1865 = _1849 * _1863;
    float _1867 = _1853 * _1863;
    float _1869 = _1865 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    bool _1877 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = _1875 + _1879;
    float _1883 = _1861;
    float _1885 = _1873;
    float _1887 = _1881;
    float _1889 = _1845;
    float _1891 = _1863;
    float _1893 = _1865;
    if (_1877)
    {
        float _1895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _1895;
    }
    float _1897 = _1883;
    if (_1877)
    {
        float _1899 = rsqrt(_1873);
        _1885 = _1899;
    }
    float _1901 = _1885;
    if (_1877)
    {
        float _1903 = _1881 * _1897;
        _1887 = _1903;
    }
    float _1905 = _1887;
    if (_1877)
    {
        float _1907 = _1905 * 0.15915493667125701904296875;
        _1731 = _1907;
    }
    float _1909 = _1731;
    float _1911 = _1839;
    float _1913 = _1909;
    if (_1877)
    {
        float _1915 = _1909 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        _1911 = _1917;
    }
    float _1919 = _1911;
    float _1921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1923 = precise::max(0.0, _1921);
    float _1925 = _1853;
    float _1927 = _1923;
    float _1929 = _1921;
    if (_1877)
    {
        float _1931 = _1909 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        _1925 = _1933;
    }
    float _1935 = _1925;
    float _1937 = -_1863;
    float _1939 = -_1923;
    float _1941 = fma(_1845, _1937, _1939);
    if (!_1877)
    {
        _1889 = _1867;
    }
    float _1943 = _1889;
    float _1945 = _1943;
    if (_1877)
    {
        float _1947 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1947;
    }
    float _1949 = _1927;
    float _1951 = _1949;
    if (_1877)
    {
        float _1953 = fma(_1919, _1949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1951 = _1953;
    }
    float _1955 = _1951;
    float _1957 = sqrt(_1859);
    float _1959 = _1955;
    float _1961 = _1935;
    if (_1877)
    {
        float _1963 = _1935 + (-1.0);
        _1929 = _1963;
    }
    float _1965 = _1929;
    float _1967 = _1965;
    if (_1877)
    {
        float _1969 = _1901 * _1955;
        _1891 = _1969;
    }
    float _1971 = _1891;
    if (!_1877)
    {
        _1959 = _1941;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1877)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1913 = _1977;
    }
    float _1979 = _1913;
    if (_1877)
    {
        float _1981 = _1865 * _1971;
        _1893 = _1981;
    }
    float _1983 = _1893;
    if (!_1877)
    {
        _1967 = _1869;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1877)
    {
        float _1989 = _1867 * _1971;
        _1945 = _1989;
    }
    float _1991 = _1945;
    if (_1877)
    {
        float _1993 = fma(_1941, _1935, _1979);
        _1975 = _1993;
    }
    float _1995 = _1975;
    if (_1877)
    {
        float _1997 = _1983 * _1983;
        _1987 = _1997;
    }
    float _1999 = _1987;
    if (!_1877)
    {
        _1961 = _1871;
    }
    float _2001 = _1961;
    float _2003 = _2001;
    if (_1877)
    {
        float _2005 = _1991 * _1991;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = fma(_1995, _1995, _1999);
    float _2011 = _2009 + _2007;
    float _2013 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2017 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2023 = rsqrt(_2011);
    float _2025 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2013);
    float _2027 = -_2019;
    float _2029 = _2027 + 1.0;
    float _2031 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2033 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2021);
    float _2035 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2037 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2025);
    float _2039 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2031);
    float _2041 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2043 = abs(_2029);
    float _2045 = log2(_2043);
    float _2047 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2035);
    float _2049 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2039);
    float _2051 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2053 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2057 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2059 = _2023 * _1983;
    float _2061 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = _2023 * _1995;
    float _2065 = _2023 * _1991;
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2073 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2075 = -_2067;
    float _2077 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2075);
    float _2079 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2069);
    float _2083 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2065;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2077);
    float _2089 = -_2073;
    float _2091 = fma(_2089, _2071, 1.0);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2081);
    float _2095 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2097 = fma(_2087, -0.5, 0.5);
    float _2099 = exp2(_2083);
    float _2101 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2103 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2095);
    float _2105 = fma(_2087, 0.5, 0.5);
    float _2107 = _2063 + 1.0;
    float _2109 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2101);
    float _2111 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2103);
    float _2113 = fma(_2105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2115 = log2(_2091);
    float _2117 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2109);
    float _2119 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2111);
    float _2121 = fma(_2105, _2113, -0.212114393711090087890625);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2117);
    float _2125 = fma(_2105, _2121, 1.570728778839111328125);
    float _2127 = 1.0 / _2093;
    float _2129 = -_2063;
    float _2131 = fma(_2099, _2107, _2129);
    float _2133 = fma(_2131, 0.5, 0.5);
    float _2135 = sqrt(_2097);
    float _2137 = _2115 * 0.693147182464599609375;
    float _2139 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2141 = _2119 * _2127;
    float _2143 = _2123 * _2127;
    float _2145 = fma(_2141, 0.5, 0.5);
    float _2147 = fma(_2143, -0.5, 0.5);
    float _2149 = _2135 * 0.636619746685028076171875;
    float3 _5501 = float3(_2145, _2147, _2139);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5501, float3(0.0), isnan(_5501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5501, float3(0.0), isnan(_5501)), level(0.0)).x;
    float3 _5512 = float3(_2145, _2147, _2139);
    float4 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5512, float3(0.0), isnan(_5512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5512, float3(0.0), isnan(_5512)), level(0.0)).xyzw;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = _2154.w;
    float _2164 = -_2125;
    float _2166 = fma(_2149, _2164, 1.0);
    float2 _5534 = float2(_2166, _2133);
    float3 _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5534, float2(0.0), isnan(_5534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5534, float2(0.0), isnan(_5534)), level(0.0)).xyz;
    float _2172 = _2170.x;
    float _2174 = _2170.y;
    float _2176 = _2170.z;
    float _2178 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2180 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2182 = _1783 > 0.0;
    bool _2184 = isnan(_1783);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(0.0);
    bool _2190 = _2186 || _2188;
    float _2192 = _2119 + _2093;
    float _2194 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2180);
    float _2196 = exp2(_2178);
    bool _2198 = _1841 <= 0.0;
    bool _2200 = !_2190;
    bool _2202 = _2198 || _2200;
    float _2204 = _2192 * 0.5;
    float _2206 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2208 = _1783 * _1841;
    float _2210 = _2093 * 0.5;
    float _2212 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2206);
    float _2214 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2216 = fma(_2123, -0.5, _2210);
    float _2218 = _2212 + _2093;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2119;
    out.gl_Position.y = _2123;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _2093;
    float _2222 = _2218 * 0.5;
    float _2224 = -_2196;
    float _2226 = _2224 + 1.0;
    out.m_47.x = _2220;
    float _2228 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2204;
    out.m_68.y = _2216;
    out.m_68.z = _2222;
    out.m_68.w = _2093;
    float _2230 = -_2228;
    float _2232 = _2230 + 1.0;
    float _2234 = _2228 * _2151;
    float _2236 = _2162 * _2234;
    float _2238 = _2176 * _2234;
    float _2240 = fma(_2172, _2236, _2156);
    float _2242 = fma(_2174, _2236, _2158);
    float _2244 = _2162 * _2232;
    float _2246 = fma(_2162, _2238, _2160);
    out.m_70.x = _2240;
    out.m_70.y = _2242;
    out.m_70.z = _2246;
    out.m_70.w = _2244;
    if (!_2202)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2248 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2248;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

